From: sdf@fomichev.me (Stanislav Fomichev)
Date: Thu,  8 Nov 2018 16:22:11 -0800
Subject: [PATCH v4 bpf-next 5/7] bpftool: add loadall command
In-Reply-To: <20181109002213.5914-1-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
Message-ID: <20181109002213.5914-6-s@fomichev.me>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109002211.4k8Op2jcTI_AHmh3meY2rY3Y9MV5E8LDLNfEewMaWkY@z>

From: Stanislav Fomichev <sdf@google.com>

This patch adds new *loadall* command which slightly differs from the
existing *load*. *load* command loads all programs from the obj file,
but pins only the first programs. *loadall* pins all programs from the
obj file under specified directory.

The intended usecase is flow_dissector, where we want to load a bunch
of progs, pin them all and after that construct a jump table.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 .../bpftool/Documentation/bpftool-prog.rst    | 14 +++-
 tools/bpf/bpftool/bash-completion/bpftool     |  4 +-
 tools/bpf/bpftool/common.c                    | 31 ++++----
 tools/bpf/bpftool/main.h                      |  1 +
 tools/bpf/bpftool/prog.c                      | 74 ++++++++++++++-----
 5 files changed, 82 insertions(+), 42 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index ac4e904b10fb..d943d9b67a1d 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -15,7 +15,8 @@ SYNOPSIS
 	*OPTIONS* := { { **-j** | **--json** } [{ **-p** | **--pretty** }] | { **-f** | **--bpffs** } }
 
 	*COMMANDS* :=
-	{ **show** | **list** | **dump xlated** | **dump jited** | **pin** | **load** | **help** }
+	{ **show** | **list** | **dump xlated** | **dump jited** | **pin** | **load**
+	| **loadall** | **help** }
 
 MAP COMMANDS
 =============
@@ -24,7 +25,7 @@ MAP COMMANDS
 |	**bpftool** **prog dump xlated** *PROG* [{**file** *FILE* | **opcodes** | **visual**}]
 |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes**}]
 |	**bpftool** **prog pin** *PROG* *FILE*
-|	**bpftool** **prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
+|	**bpftool** **prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
 |       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* *MAP*
 |       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* *MAP*
 |	**bpftool** **prog help**
@@ -79,8 +80,13 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-	**bpftool prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
-		  Load bpf program from binary *OBJ* and pin as *FILE*.
+	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
+		  Load bpf program(s) from binary *OBJ* and pin as *FILE*.
+		  Both **bpftool prog load** and **bpftool prog loadall** load
+		  all maps and programs from the *OBJ* and differ only in
+		  pinning. **load** pins only the first program from the *OBJ*
+		  as *FILE*. **loadall** pins all programs from the *OBJ*
+		  under *FILE* directory.
 		  **type** is optional, if not specified program type will be
 		  inferred from section names.
 		  By default bpftool will create new maps as declared in the ELF
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index 3f78e6404589..780ebafb756a 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -243,7 +243,7 @@ _bpftool()
     # Completion depends on object and command in use
     case $object in
         prog)
-            if [[ $command != "load" ]]; then
+            if [[ $command != "load" && $command != "loadall" ]]; then
                 case $prev in
                     id)
                         _bpftool_get_prog_ids
@@ -309,7 +309,7 @@ _bpftool()
                     fi
                     return 0
                     ;;
-                load)
+                load|loadall)
                     local obj
 
                     if [[ ${#words[@]} -lt 6 ]]; then
diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
index 25af85304ebe..21ce556c15e1 100644
--- a/tools/bpf/bpftool/common.c
+++ b/tools/bpf/bpftool/common.c
@@ -169,34 +169,23 @@ int open_obj_pinned_any(char *path, enum bpf_obj_type exp_type)
 	return fd;
 }
 
-int do_pin_fd(int fd, const char *name)
+int mount_bpffs_for_pin(const char *name)
 {
 	char err_str[ERR_MAX_LEN];
 	char *file;
 	char *dir;
 	int err = 0;
 
-	err = bpf_obj_pin(fd, name);
-	if (!err)
-		goto out;
-
 	file = malloc(strlen(name) + 1);
 	strcpy(file, name);
 	dir = dirname(file);
 
-	if (errno != EPERM || is_bpffs(dir)) {
-		p_err("can't pin the object (%s): %s", name, strerror(errno));
+	if (is_bpffs(dir))
+		/* nothing to do if already mounted */
 		goto out_free;
-	}
 
-	/* Attempt to mount bpffs, then retry pinning. */
 	err = mnt_bpffs(dir, err_str, ERR_MAX_LEN);
-	if (!err) {
-		err = bpf_obj_pin(fd, name);
-		if (err)
-			p_err("can't pin the object (%s): %s", name,
-			      strerror(errno));
-	} else {
+	if (err) {
 		err_str[ERR_MAX_LEN - 1] = '\0';
 		p_err("can't mount BPF file system to pin the object (%s): %s",
 		      name, err_str);
@@ -204,10 +193,20 @@ int do_pin_fd(int fd, const char *name)
 
 out_free:
 	free(file);
-out:
 	return err;
 }
 
+int do_pin_fd(int fd, const char *name)
+{
+	int err;
+
+	err = mount_bpffs_for_pin(name);
+	if (err)
+		return err;
+
+	return bpf_obj_pin(fd, name);
+}
+
 int do_pin_any(int argc, char **argv, int (*get_fd_by_id)(__u32))
 {
 	unsigned int id;
diff --git a/tools/bpf/bpftool/main.h b/tools/bpf/bpftool/main.h
index 28322ace2856..1383824c9baf 100644
--- a/tools/bpf/bpftool/main.h
+++ b/tools/bpf/bpftool/main.h
@@ -129,6 +129,7 @@ const char *get_fd_type_name(enum bpf_obj_type type);
 char *get_fdinfo(int fd, const char *key);
 int open_obj_pinned(char *path);
 int open_obj_pinned_any(char *path, enum bpf_obj_type exp_type);
+int mount_bpffs_for_pin(const char *name);
 int do_pin_any(int argc, char **argv, int (*get_fd_by_id)(__u32));
 int do_pin_fd(int fd, const char *name);
 
diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
index 5302ee282409..751a90ccfdab 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -792,15 +792,16 @@ static int do_detach(int argc, char **argv)
 		jsonw_null(json_wtr);
 	return 0;
 }
-static int do_load(int argc, char **argv)
+
+static int load_with_options(int argc, char **argv, bool first_prog_only)
 {
 	enum bpf_attach_type expected_attach_type;
 	struct bpf_object_open_attr attr = {
 		.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	};
 	struct map_replace *map_replace = NULL;
+	struct bpf_program *prog = NULL, *pos;
 	unsigned int old_map_fds = 0;
-	struct bpf_program *prog;
 	struct bpf_object *obj;
 	struct bpf_map *map;
 	const char *pinfile;
@@ -918,26 +919,25 @@ static int do_load(int argc, char **argv)
 		goto err_free_reuse_maps;
 	}
 
-	prog = bpf_program__next(NULL, obj);
-	if (!prog) {
-		p_err("object file doesn't contain any bpf program");
-		goto err_close_obj;
-	}
+	bpf_object__for_each_program(pos, obj) {
+		enum bpf_prog_type prog_type = attr.prog_type;
 
-	bpf_program__set_ifindex(prog, ifindex);
-	if (attr.prog_type == BPF_PROG_TYPE_UNSPEC) {
-		const char *sec_name = bpf_program__title(prog, false);
+		if (attr.prog_type == BPF_PROG_TYPE_UNSPEC) {
+			const char *sec_name = bpf_program__title(pos, false);
 
-		err = libbpf_prog_type_by_name(sec_name, &attr.prog_type,
-					       &expected_attach_type);
-		if (err < 0) {
-			p_err("failed to guess program type based on section name %s\n",
-			      sec_name);
-			goto err_close_obj;
+			err = libbpf_prog_type_by_name(sec_name, &prog_type,
+						       &expected_attach_type);
+			if (err < 0) {
+				p_err("failed to guess program type based on section name %s\n",
+				      sec_name);
+				goto err_close_obj;
+			}
 		}
+
+		bpf_program__set_ifindex(pos, ifindex);
+		bpf_program__set_type(pos, prog_type);
+		bpf_program__set_expected_attach_type(pos, expected_attach_type);
 	}
-	bpf_program__set_type(prog, attr.prog_type);
-	bpf_program__set_expected_attach_type(prog, expected_attach_type);
 
 	qsort(map_replace, old_map_fds, sizeof(*map_replace),
 	      map_replace_compar);
@@ -1001,9 +1001,31 @@ static int do_load(int argc, char **argv)
 		goto err_close_obj;
 	}
 
-	if (do_pin_fd(bpf_program__fd(prog), pinfile))
+	err = mount_bpffs_for_pin(pinfile);
+	if (err)
 		goto err_close_obj;
 
+	if (first_prog_only) {
+		prog = bpf_program__next(NULL, obj);
+		if (!prog) {
+			p_err("object file doesn't contain any bpf program");
+			goto err_close_obj;
+		}
+
+		err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
+		if (err) {
+			p_err("failed to pin program %s",
+			      bpf_program__title(prog, false));
+			goto err_close_obj;
+		}
+	} else {
+		err = bpf_object__pin_programs(obj, pinfile);
+		if (err) {
+			p_err("failed to pin all programs");
+			goto err_close_obj;
+		}
+	}
+
 	if (json_output)
 		jsonw_null(json_wtr);
 
@@ -1023,6 +1045,16 @@ static int do_load(int argc, char **argv)
 	return -1;
 }
 
+static int do_load(int argc, char **argv)
+{
+	return load_with_options(argc, argv, true);
+}
+
+static int do_loadall(int argc, char **argv)
+{
+	return load_with_options(argc, argv, false);
+}
+
 static int do_help(int argc, char **argv)
 {
 	if (json_output) {
@@ -1035,7 +1067,8 @@ static int do_help(int argc, char **argv)
 		"       %s %s dump xlated PROG [{ file FILE | opcodes | visual }]\n"
 		"       %s %s dump jited  PROG [{ file FILE | opcodes }]\n"
 		"       %s %s pin   PROG FILE\n"
-		"       %s %s load  OBJ  FILE [type TYPE] [dev NAME] \\\n"
+		"       %s %s { load | loadall } OBJ  FILE \\\n"
+		"                         [type TYPE] [dev NAME] \\\n"
 		"                         [map { idx IDX | name NAME } MAP]\n"
 		"       %s %s attach PROG ATTACH_TYPE MAP\n"
 		"       %s %s detach PROG ATTACH_TYPE MAP\n"
@@ -1067,6 +1100,7 @@ static const struct cmd cmds[] = {
 	{ "dump",	do_dump },
 	{ "pin",	do_pin },
 	{ "load",	do_load },
+	{ "loadall",	do_loadall },
 	{ "attach",	do_attach },
 	{ "detach",	do_detach },
 	{ 0 }
-- 
2.19.1.930.g4563a0d9d0-goog
