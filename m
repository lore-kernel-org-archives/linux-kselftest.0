From: sdf at google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 14:43:56 -0800
Subject: [PATCH bpf-next 3/3] bpftool: support loading flow dissector
In-Reply-To: <20181107224356.73080-1-sdf@google.com>
References: <20181107224356.73080-1-sdf@google.com>
Message-ID: <20181107224356.73080-4-sdf@google.com>

This commit adds support for loading/attaching/detaching flow
dissector program. The structure of the flow dissector program is
assumed to be the same as in the selftests:

* flow_dissector section with the main entry point
* a bunch of tail call progs
* a jmp_table map that is populated with the tail call progs

When `bpftool load` is called with a flow_dissector prog (i.e. when the
first section is flow_dissector of 'type flow_dissector' argument is
passed), we load and pin all the programs/maps. User is responsible to
construct the jump table for the tail calls.

The last argument of `bpftool attach` is made optional for this use
case.

Example:
bpftool prog load tools/testing/selftests/bpf/bpf_flow.o \
	/sys/fs/bpf/flow type flow_dissector

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 0 0 0 0 \
        value pinned /sys/fs/bpf/flow/IP/0

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 1 0 0 0 \
        value pinned /sys/fs/bpf/flow/IPV6/0

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 2 0 0 0 \
        value pinned /sys/fs/bpf/flow/IPV6OP/0

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 3 0 0 0 \
        value pinned /sys/fs/bpf/flow/IPV6FR/0

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 4 0 0 0 \
        value pinned /sys/fs/bpf/flow/MPLS/0

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 5 0 0 0 \
        value pinned /sys/fs/bpf/flow/VLAN/0

bpftool prog attach pinned /sys/fs/bpf/flow/flow_dissector/0 flow_dissector

Tested by using the above lines to load the prog in
the test_flow_dissector.sh selftest.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 .../bpftool/Documentation/bpftool-prog.rst    | 26 +++--
 tools/bpf/bpftool/bash-completion/bpftool     |  2 +-
 tools/bpf/bpftool/common.c                    | 30 +++---
 tools/bpf/bpftool/main.h                      |  1 +
 tools/bpf/bpftool/prog.c                      | 94 ++++++++++++++-----
 5 files changed, 101 insertions(+), 52 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index ac4e904b10fb..a7b6934a8ac9 100644
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
+|		**msg_verdict** | **skb_verdict** | **skb_parse** | **flow_dissector**
+|	}
 
 
 DESCRIPTION
@@ -97,13 +99,17 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-        **bpftool prog attach** *PROG* *ATTACH_TYPE* *MAP*
-                  Attach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
-                  to the map *MAP*.
-
-        **bpftool prog detach** *PROG* *ATTACH_TYPE* *MAP*
-                  Detach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
-                  from the map *MAP*.
+        **bpftool prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
+                  Attach bpf program *PROG* (with type specified by
+                  *ATTACH_TYPE*). Most *ATTACH_TYPEs* require a *MAP*
+                  parameter, with the exception of *flow_dissector* which is
+                  attached to current networking name space.
+
+        **bpftool prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
+                  Detach bpf program *PROG* (with type specified by
+                  *ATTACH_TYPE*). Most *ATTACH_TYPEs* require a *MAP*
+                  parameter, with the exception of *flow_dissector* which is
+                  detached from the current networking name space.
 
 	**bpftool prog help**
 		  Print short help message.
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index 3f78e6404589..4ab892adfa9f 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -299,7 +299,7 @@ _bpftool()
                     fi
 
                     if [[ ${#words[@]} == 6 ]]; then
-                        COMPREPLY=( $( compgen -W "msg_verdict skb_verdict skb_parse" -- "$cur" ) )
+                        COMPREPLY=( $( compgen -W "msg_verdict skb_verdict skb_parse flow_dissector" -- "$cur" ) )
                         return 0
                     fi
 
diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
index 25af85304ebe..f671a921dec5 100644
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
@@ -204,10 +194,20 @@ int do_pin_fd(int fd, const char *name)
 
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
index 5302ee282409..feee1d184433 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -81,6 +81,7 @@ static const char * const attach_type_strings[] = {
 	[BPF_SK_SKB_STREAM_PARSER] = "stream_parser",
 	[BPF_SK_SKB_STREAM_VERDICT] = "stream_verdict",
 	[BPF_SK_MSG_VERDICT] = "msg_verdict",
+	[BPF_FLOW_DISSECTOR] = "flow_dissector",
 	[__MAX_BPF_ATTACH_TYPE] = NULL,
 };
 
@@ -724,10 +725,11 @@ int map_replace_compar(const void *p1, const void *p2)
 static int do_attach(int argc, char **argv)
 {
 	enum bpf_attach_type attach_type;
-	int err, mapfd, progfd;
+	int err, progfd;
+	int mapfd = 0;
 
-	if (!REQ_ARGS(5)) {
-		p_err("too few parameters for map attach");
+	if (!REQ_ARGS(3)) {
+		p_err("too few parameters for attach");
 		return -EINVAL;
 	}
 
@@ -740,11 +742,17 @@ static int do_attach(int argc, char **argv)
 		p_err("invalid attach type");
 		return -EINVAL;
 	}
-	NEXT_ARG();
+	if (attach_type != BPF_FLOW_DISSECTOR) {
+		NEXT_ARG();
+		if (!REQ_ARGS(2)) {
+			p_err("too few parameters for map attach");
+			return -EINVAL;
+		}
 
-	mapfd = map_parse_fd(&argc, &argv);
-	if (mapfd < 0)
-		return mapfd;
+		mapfd = map_parse_fd(&argc, &argv);
+		if (mapfd < 0)
+			return mapfd;
+	}
 
 	err = bpf_prog_attach(progfd, mapfd, attach_type, 0);
 	if (err) {
@@ -760,10 +768,11 @@ static int do_attach(int argc, char **argv)
 static int do_detach(int argc, char **argv)
 {
 	enum bpf_attach_type attach_type;
-	int err, mapfd, progfd;
+	int err, progfd;
+	int mapfd = 0;
 
-	if (!REQ_ARGS(5)) {
-		p_err("too few parameters for map detach");
+	if (!REQ_ARGS(3)) {
+		p_err("too few parameters for detach");
 		return -EINVAL;
 	}
 
@@ -776,11 +785,17 @@ static int do_detach(int argc, char **argv)
 		p_err("invalid attach type");
 		return -EINVAL;
 	}
-	NEXT_ARG();
+	if (attach_type != BPF_FLOW_DISSECTOR) {
+		NEXT_ARG();
+		if (!REQ_ARGS(2)) {
+			p_err("too few parameters for map detach");
+			return -EINVAL;
+		}
 
-	mapfd = map_parse_fd(&argc, &argv);
-	if (mapfd < 0)
-		return mapfd;
+		mapfd = map_parse_fd(&argc, &argv);
+		if (mapfd < 0)
+			return mapfd;
+	}
 
 	err = bpf_prog_detach2(progfd, mapfd, attach_type);
 	if (err) {
@@ -792,6 +807,7 @@ static int do_detach(int argc, char **argv)
 		jsonw_null(json_wtr);
 	return 0;
 }
+
 static int do_load(int argc, char **argv)
 {
 	enum bpf_attach_type expected_attach_type;
@@ -799,8 +815,8 @@ static int do_load(int argc, char **argv)
 		.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	};
 	struct map_replace *map_replace = NULL;
+	struct bpf_program *prog = NULL, *pos;
 	unsigned int old_map_fds = 0;
-	struct bpf_program *prog;
 	struct bpf_object *obj;
 	struct bpf_map *map;
 	const char *pinfile;
@@ -918,13 +934,14 @@ static int do_load(int argc, char **argv)
 		goto err_free_reuse_maps;
 	}
 
-	prog = bpf_program__next(NULL, obj);
-	if (!prog) {
-		p_err("object file doesn't contain any bpf program");
-		goto err_close_obj;
+	if (attr.prog_type != BPF_PROG_TYPE_FLOW_DISSECTOR) {
+		prog = bpf_program__next(NULL, obj);
+		if (!prog) {
+			p_err("object file doesn't contain any bpf program");
+			goto err_close_obj;
+		}
 	}
 
-	bpf_program__set_ifindex(prog, ifindex);
 	if (attr.prog_type == BPF_PROG_TYPE_UNSPEC) {
 		const char *sec_name = bpf_program__title(prog, false);
 
@@ -936,8 +953,13 @@ static int do_load(int argc, char **argv)
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
@@ -1001,9 +1023,28 @@ static int do_load(int argc, char **argv)
 		goto err_close_obj;
 	}
 
-	if (do_pin_fd(bpf_program__fd(prog), pinfile))
+	err = mount_bpffs_for_pin(pinfile);
+	if (err)
 		goto err_close_obj;
 
+	if (attr.prog_type == BPF_PROG_TYPE_FLOW_DISSECTOR) {
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
+
 	if (json_output)
 		jsonw_null(json_wtr);
 
@@ -1037,8 +1078,8 @@ static int do_help(int argc, char **argv)
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
@@ -1050,7 +1091,8 @@ static int do_help(int argc, char **argv)
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
