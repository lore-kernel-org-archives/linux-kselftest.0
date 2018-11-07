From: sdf@google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 11:35:52 -0800
Subject: [PATCH bpf-next 2/2] bpftool: support loading flow dissector
In-Reply-To: <20181107193552.77894-1-sdf@google.com>
References: <20181107193552.77894-1-sdf@google.com>
Message-ID: <20181107193552.77894-3-sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107193552.V-KFMu3QAyZe0Gi9NAenj8JKv_iME7oPYXaaY3xIsQU@z>

This commit adds support for loading/attaching/detaching flow
dissector program. The structure of the flow dissector program is
assumed to be the same as in the selftests:

* flow_dissector section with the main entry point
* a bunch of tail call progs
* a jmp_table map that is populated with the tail call progs

When `bpftool load` is called with a flow_dissector prog (i.e. when the
first section is flow_dissector of 'type flow_dissector' argument is
passed), we load and pin all the programs and build the jump table.

The last argument of `bpftool attach` is made optional for this use
case.

Example:
bpftool prog load tools/testing/selftests/bpf/bpf_flow.o \
	/sys/fs/bpf/flow type flow_dissector
bpftool prog attach pinned /sys/fs/bpf/flow/flow_dissector/0 flow_dissector

Tested by using the above two lines to load the prog in
the test_flow_dissector.sh selftest.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 .../bpftool/Documentation/bpftool-prog.rst    |  16 ++-
 tools/bpf/bpftool/common.c                    |  32 +++--
 tools/bpf/bpftool/main.h                      |   1 +
 tools/bpf/bpftool/prog.c                      | 135 +++++++++++++++---
 4 files changed, 141 insertions(+), 43 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index ac4e904b10fb..3caa9153435b 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -25,8 +25,8 @@ MAP COMMANDS
 |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes**}]
 |	**bpftool** **prog pin** *PROG* *FILE*
 |	**bpftool** **prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
-|       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* *MAP*
-|       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* *MAP*
+|       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
+|       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
 |	**bpftool** **prog help**
 |
 |	*MAP* := { **id** *MAP_ID* | **pinned** *FILE* }
@@ -39,7 +39,9 @@ MAP COMMANDS
 |		**cgroup/bind4** | **cgroup/bind6** | **cgroup/post_bind4** | **cgroup/post_bind6** |
 |		**cgroup/connect4** | **cgroup/connect6** | **cgroup/sendmsg4** | **cgroup/sendmsg6**
 |	}
-|       *ATTACH_TYPE* := { **msg_verdict** | **skb_verdict** | **skb_parse** }
+|       *ATTACH_TYPE* := {
+|	|	**msg_verdict** | **skb_verdict** | **skb_parse** | **flow_dissector**
+|	}
 
 
 DESCRIPTION
@@ -97,13 +99,13 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-        **bpftool prog attach** *PROG* *ATTACH_TYPE* *MAP*
+        **bpftool prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
                   Attach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
-                  to the map *MAP*.
+                  to the optional map *MAP*.
 
-        **bpftool prog detach** *PROG* *ATTACH_TYPE* *MAP*
+        **bpftool prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
                   Detach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
-                  from the map *MAP*.
+                  from the optional map *MAP*.
 
 	**bpftool prog help**
 		  Print short help message.
diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
index 25af85304ebe..963881142dfb 100644
--- a/tools/bpf/bpftool/common.c
+++ b/tools/bpf/bpftool/common.c
@@ -169,34 +169,24 @@ int open_obj_pinned_any(char *path, enum bpf_obj_type exp_type)
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
+	if (is_bpffs(dir)) {
+		/* nothing to do if already mounted */
 		goto out_free;
 	}
 
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
@@ -204,10 +194,22 @@ int do_pin_fd(int fd, const char *name)
 
 out_free:
 	free(file);
-out:
 	return err;
 }
 
+int do_pin_fd(int fd, const char *name)
+{
+	int err = mount_bpffs_for_pin(name);
+
+	if (err) {
+		p_err("can't mount bpffs for pin %s: %s",
+		      name, strerror(errno));
+		return err;
+	}
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
index 5302ee282409..f3a07ec3a444 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -81,6 +81,7 @@ static const char * const attach_type_strings[] = {
 	[BPF_SK_SKB_STREAM_PARSER] = "stream_parser",
 	[BPF_SK_SKB_STREAM_VERDICT] = "stream_verdict",
 	[BPF_SK_MSG_VERDICT] = "msg_verdict",
+	[BPF_FLOW_DISSECTOR] = "flow_dissector",
 	[__MAX_BPF_ATTACH_TYPE] = NULL,
 };
 
@@ -724,9 +725,10 @@ int map_replace_compar(const void *p1, const void *p2)
 static int do_attach(int argc, char **argv)
 {
 	enum bpf_attach_type attach_type;
-	int err, mapfd, progfd;
+	int err, progfd;
+	int mapfd = 0;
 
-	if (!REQ_ARGS(5)) {
+	if (!REQ_ARGS(3)) {
 		p_err("too few parameters for map attach");
 		return -EINVAL;
 	}
@@ -741,10 +743,11 @@ static int do_attach(int argc, char **argv)
 		return -EINVAL;
 	}
 	NEXT_ARG();
-
-	mapfd = map_parse_fd(&argc, &argv);
-	if (mapfd < 0)
-		return mapfd;
+	if (argc > 0) {
+		mapfd = map_parse_fd(&argc, &argv);
+		if (mapfd < 0)
+			return mapfd;
+	}
 
 	err = bpf_prog_attach(progfd, mapfd, attach_type, 0);
 	if (err) {
@@ -760,9 +763,10 @@ static int do_attach(int argc, char **argv)
 static int do_detach(int argc, char **argv)
 {
 	enum bpf_attach_type attach_type;
-	int err, mapfd, progfd;
+	int err, progfd;
+	int mapfd = 0;
 
-	if (!REQ_ARGS(5)) {
+	if (!REQ_ARGS(3)) {
 		p_err("too few parameters for map detach");
 		return -EINVAL;
 	}
@@ -777,10 +781,11 @@ static int do_detach(int argc, char **argv)
 		return -EINVAL;
 	}
 	NEXT_ARG();
-
-	mapfd = map_parse_fd(&argc, &argv);
-	if (mapfd < 0)
-		return mapfd;
+	if (argc > 0) {
+		mapfd = map_parse_fd(&argc, &argv);
+		if (mapfd < 0)
+			return mapfd;
+	}
 
 	err = bpf_prog_detach2(progfd, mapfd, attach_type);
 	if (err) {
@@ -792,6 +797,56 @@ static int do_detach(int argc, char **argv)
 		jsonw_null(json_wtr);
 	return 0;
 }
+
+/* Flow dissector consists of a main program and a jump table for each
+ * supported protocol. The assumption here is that the first prog is the main
+ * one and the other progs are used in the tail calls. In this routine we
+ * build the jump table for the non-main progs.
+ */
+static int build_flow_dissector_jmp_table(struct bpf_object *obj,
+					  struct bpf_program *prog,
+					  const char *jmp_table_map)
+{
+	struct bpf_map *jmp_table;
+	struct bpf_program *pos;
+	int i = 0;
+	int prog_fd, jmp_table_fd, fd;
+
+	prog_fd = bpf_program__fd(prog);
+	if (prog_fd < 0) {
+		p_err("failed to get fd of main prog");
+		return prog_fd;
+	}
+
+	jmp_table = bpf_object__find_map_by_name(obj, jmp_table_map);
+	if (jmp_table == NULL) {
+		p_err("failed to find '%s' map", jmp_table_map);
+		return -1;
+	}
+
+	jmp_table_fd = bpf_map__fd(jmp_table);
+	if (jmp_table_fd < 0) {
+		p_err("failed to get fd of jmp_table");
+		return jmp_table_fd;
+	}
+
+	bpf_object__for_each_program(pos, obj) {
+		fd = bpf_program__fd(pos);
+		if (fd < 0) {
+			p_err("failed to get fd of '%s'",
+			      bpf_program__title(pos, false));
+			return fd;
+		}
+
+		if (fd != prog_fd) {
+			bpf_map_update_elem(jmp_table_fd, &i, &fd, BPF_ANY);
+			++i;
+		}
+	}
+
+	return 0;
+}
+
 static int do_load(int argc, char **argv)
 {
 	enum bpf_attach_type expected_attach_type;
@@ -800,7 +855,7 @@ static int do_load(int argc, char **argv)
 	};
 	struct map_replace *map_replace = NULL;
 	unsigned int old_map_fds = 0;
-	struct bpf_program *prog;
+	struct bpf_program *prog, *pos;
 	struct bpf_object *obj;
 	struct bpf_map *map;
 	const char *pinfile;
@@ -918,13 +973,19 @@ static int do_load(int argc, char **argv)
 		goto err_free_reuse_maps;
 	}
 
-	prog = bpf_program__next(NULL, obj);
+	if (attr.prog_type == BPF_PROG_TYPE_FLOW_DISSECTOR) {
+		/* for the flow dissector type, the entry point is in the
+		 * section flow_dissector; other progs are tail calls
+		 */
+		prog = bpf_object__find_program_by_title(obj, "flow_dissector");
+	} else {
+		prog = bpf_program__next(NULL, obj);
+	}
 	if (!prog) {
 		p_err("object file doesn't contain any bpf program");
 		goto err_close_obj;
 	}
 
-	bpf_program__set_ifindex(prog, ifindex);
 	if (attr.prog_type == BPF_PROG_TYPE_UNSPEC) {
 		const char *sec_name = bpf_program__title(prog, false);
 
@@ -936,8 +997,13 @@ static int do_load(int argc, char **argv)
 			goto err_close_obj;
 		}
 	}
-	bpf_program__set_type(prog, attr.prog_type);
-	bpf_program__set_expected_attach_type(prog, expected_attach_type);
+
+	bpf_object__for_each_program(pos, obj) {
+		bpf_program__set_ifindex(pos, ifindex);
+		bpf_program__set_type(pos, attr.prog_type);
+		bpf_program__set_expected_attach_type(pos,
+						      expected_attach_type);
+	}
 
 	qsort(map_replace, old_map_fds, sizeof(*map_replace),
 	      map_replace_compar);
@@ -1001,8 +1067,34 @@ static int do_load(int argc, char **argv)
 		goto err_close_obj;
 	}
 
-	if (do_pin_fd(bpf_program__fd(prog), pinfile))
+	err = mount_bpffs_for_pin(pinfile);
+	if (err) {
+		p_err("failed to mount bpffs for pin '%s'", pinfile);
 		goto err_close_obj;
+	}
+
+	if (attr.prog_type == BPF_PROG_TYPE_FLOW_DISSECTOR) {
+		err = build_flow_dissector_jmp_table(obj, prog, "jmp_table");
+		if (err) {
+			p_err("failed to build flow dissector jump table");
+			goto err_close_obj;
+		}
+		/* flow dissector consist of multiple programs,
+		 * we want to pin them all
+		 */
+		err = bpf_object__pin(obj, pinfile);
+		if (err) {
+			p_err("failed to pin flow dissector object");
+			goto err_close_obj;
+		}
+	} else {
+		err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
+		if (err) {
+			p_err("failed to pin program %s",
+			      bpf_program__title(prog, false));
+			goto err_close_obj;
+		}
+	}
 
 	if (json_output)
 		jsonw_null(json_wtr);
@@ -1037,8 +1129,8 @@ static int do_help(int argc, char **argv)
 		"       %s %s pin   PROG FILE\n"
 		"       %s %s load  OBJ  FILE [type TYPE] [dev NAME] \\\n"
 		"                         [map { idx IDX | name NAME } MAP]\n"
-		"       %s %s attach PROG ATTACH_TYPE MAP\n"
-		"       %s %s detach PROG ATTACH_TYPE MAP\n"
+		"       %s %s attach PROG ATTACH_TYPE [MAP]\n"
+		"       %s %s detach PROG ATTACH_TYPE [MAP]\n"
 		"       %s %s help\n"
 		"\n"
 		"       " HELP_SPEC_MAP "\n"
@@ -1050,7 +1142,8 @@ static int do_help(int argc, char **argv)
 		"                 cgroup/bind4 | cgroup/bind6 | cgroup/post_bind4 |\n"
 		"                 cgroup/post_bind6 | cgroup/connect4 | cgroup/connect6 |\n"
 		"                 cgroup/sendmsg4 | cgroup/sendmsg6 }\n"
-		"       ATTACH_TYPE := { msg_verdict | skb_verdict | skb_parse }\n"
+		"       ATTACH_TYPE := { msg_verdict | skb_verdict | skb_parse |\n"
+		"                        flow_dissector }\n"
 		"       " HELP_SPEC_OPTIONS "\n"
 		"",
 		bin_name, argv[-2], bin_name, argv[-2], bin_name, argv[-2],
-- 
2.19.1.930.g4563a0d9d0-goog
