From: sdf at google.com (Stanislav Fomichev)
Date: Fri,  9 Nov 2018 08:21:46 -0800
Subject: [PATCH v5 bpf-next 7/7] bpftool: support loading flow dissector
In-Reply-To: <20181109162146.78019-1-sdf@google.com>
References: <20181109162146.78019-1-sdf@google.com>
Message-ID: <20181109162146.78019-8-sdf@google.com>

This commit adds support for loading/attaching/detaching flow
dissector program.

When `bpftool loadall` is called with a flow_dissector prog (i.e. when the
'type flow_dissector' argument is passed), we load and pin all programs.
User is responsible to construct the jump table for the tail calls.

The last argument of `bpftool attach` is made optional for this use
case.

Example:
bpftool prog load tools/testing/selftests/bpf/bpf_flow.o \
        /sys/fs/bpf/flow type flow_dissector \
	pinmaps /sys/fs/bpf/flow

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 0 0 0 0 \
        value pinned /sys/fs/bpf/flow/IP

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 1 0 0 0 \
        value pinned /sys/fs/bpf/flow/IPV6

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 2 0 0 0 \
        value pinned /sys/fs/bpf/flow/IPV6OP

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 3 0 0 0 \
        value pinned /sys/fs/bpf/flow/IPV6FR

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 4 0 0 0 \
        value pinned /sys/fs/bpf/flow/MPLS

bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
        key 5 0 0 0 \
        value pinned /sys/fs/bpf/flow/VLAN

bpftool prog attach pinned /sys/fs/bpf/flow/flow_dissector flow_dissector

Tested by using the above lines to load the prog in
the test_flow_dissector.sh selftest.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
Acked-by: Jakub Kicinski <jakub.kicinski at netronome.com>
---
 .../bpftool/Documentation/bpftool-prog.rst    | 26 +++---
 tools/bpf/bpftool/bash-completion/bpftool     | 14 ++-
 tools/bpf/bpftool/prog.c                      | 85 ++++++++++---------
 3 files changed, 74 insertions(+), 51 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index 15e9172f7e55..8db78ed82a71 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -26,8 +26,8 @@ MAP COMMANDS
 |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes**}]
 |	**bpftool** **prog pin** *PROG* *FILE*
 |	**bpftool** **prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
-|       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* *MAP*
-|       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* *MAP*
+|       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
+|       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
 |	**bpftool** **prog help**
 |
 |	*MAP* := { **id** *MAP_ID* | **pinned** *FILE* }
@@ -40,7 +40,9 @@ MAP COMMANDS
 |		**cgroup/bind4** | **cgroup/bind6** | **cgroup/post_bind4** | **cgroup/post_bind6** |
 |		**cgroup/connect4** | **cgroup/connect6** | **cgroup/sendmsg4** | **cgroup/sendmsg6**
 |	}
-|       *ATTACH_TYPE* := { **msg_verdict** | **skb_verdict** | **skb_parse** }
+|       *ATTACH_TYPE* := {
+|		**msg_verdict** | **skb_verdict** | **skb_parse** | **flow_dissector**
+|	}
 
 
 DESCRIPTION
@@ -103,13 +105,17 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-        **bpftool prog attach** *PROG* *ATTACH_TYPE* *MAP*
-                  Attach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
-                  to the map *MAP*.
-
-        **bpftool prog detach** *PROG* *ATTACH_TYPE* *MAP*
-                  Detach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
-                  from the map *MAP*.
+	**bpftool prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
+		  Attach bpf program *PROG* (with type specified by
+		  *ATTACH_TYPE*). Most *ATTACH_TYPEs* require a *MAP*
+		  parameter, with the exception of *flow_dissector* which is
+		  attached to current networking name space.
+
+	**bpftool prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
+		  Detach bpf program *PROG* (with type specified by
+		  *ATTACH_TYPE*). Most *ATTACH_TYPEs* require a *MAP*
+		  parameter, with the exception of *flow_dissector* which is
+		  detached from the current networking name space.
 
 	**bpftool prog help**
 		  Print short help message.
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index a05d0071f39f..45c2db257d2b 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -299,7 +299,8 @@ _bpftool()
                     fi
 
                     if [[ ${#words[@]} == 6 ]]; then
-                        COMPREPLY=( $( compgen -W "msg_verdict skb_verdict skb_parse" -- "$cur" ) )
+                        COMPREPLY=( $( compgen -W "msg_verdict skb_verdict \
+                            skb_parse flow_dissector" -- "$cur" ) )
                         return 0
                     fi
 
@@ -338,7 +339,16 @@ _bpftool()
 
                     case $prev in
                         type)
-                            COMPREPLY=( $( compgen -W "socket kprobe kretprobe classifier action tracepoint raw_tracepoint xdp perf_event cgroup/skb cgroup/sock cgroup/dev lwt_in lwt_out lwt_xmit lwt_seg6local sockops sk_skb sk_msg lirc_mode2 cgroup/bind4 cgroup/bind6 cgroup/connect4 cgroup/connect6 cgroup/sendmsg4 cgroup/sendmsg6 cgroup/post_bind4 cgroup/post_bind6" -- \
+                            COMPREPLY=( $( compgen -W "socket kprobe \
+                                kretprobe classifier flow_dissector \
+                                action tracepoint raw_tracepoint \
+                                xdp perf_event cgroup/skb cgroup/sock \
+                                cgroup/dev lwt_in lwt_out lwt_xmit \
+                                lwt_seg6local sockops sk_skb sk_msg \
+                                lirc_mode2 cgroup/bind4 cgroup/bind6 \
+                                cgroup/connect4 cgroup/connect6 \
+                                cgroup/sendmsg4 cgroup/sendmsg6 \
+                                cgroup/post_bind4 cgroup/post_bind6" -- \
                                                    "$cur" ) )
                             return 0
                             ;;
diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
index 4bd6ad19fc05..9adc56e0885c 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -81,6 +81,7 @@ static const char * const attach_type_strings[] = {
 	[BPF_SK_SKB_STREAM_PARSER] = "stream_parser",
 	[BPF_SK_SKB_STREAM_VERDICT] = "stream_verdict",
 	[BPF_SK_MSG_VERDICT] = "msg_verdict",
+	[BPF_FLOW_DISSECTOR] = "flow_dissector",
 	[__MAX_BPF_ATTACH_TYPE] = NULL,
 };
 
@@ -721,30 +722,49 @@ int map_replace_compar(const void *p1, const void *p2)
 	return a->idx - b->idx;
 }
 
-static int do_attach(int argc, char **argv)
+static int parse_attach_detach_args(int argc, char **argv, int *progfd,
+				    enum bpf_attach_type *attach_type,
+				    int *mapfd)
 {
-	enum bpf_attach_type attach_type;
-	int err, mapfd, progfd;
-
-	if (!REQ_ARGS(5)) {
-		p_err("too few parameters for map attach");
+	if (!REQ_ARGS(3))
 		return -EINVAL;
-	}
 
-	progfd = prog_parse_fd(&argc, &argv);
-	if (progfd < 0)
-		return progfd;
+	*progfd = prog_parse_fd(&argc, &argv);
+	if (*progfd < 0)
+		return *progfd;
 
-	attach_type = parse_attach_type(*argv);
-	if (attach_type == __MAX_BPF_ATTACH_TYPE) {
-		p_err("invalid attach type");
+	*attach_type = parse_attach_type(*argv);
+	if (*attach_type == __MAX_BPF_ATTACH_TYPE) {
+		p_err("invalid attach/detach type");
 		return -EINVAL;
 	}
+
+	if (*attach_type == BPF_FLOW_DISSECTOR) {
+		*mapfd = -1;
+		return 0;
+	}
+
 	NEXT_ARG();
+	if (!REQ_ARGS(2))
+		return -EINVAL;
+
+	*mapfd = map_parse_fd(&argc, &argv);
+	if (*mapfd < 0)
+		return *mapfd;
+
+	return 0;
+}
 
-	mapfd = map_parse_fd(&argc, &argv);
-	if (mapfd < 0)
-		return mapfd;
+static int do_attach(int argc, char **argv)
+{
+	enum bpf_attach_type attach_type;
+	int err, progfd;
+	int mapfd;
+
+	err = parse_attach_detach_args(argc, argv,
+				       &progfd, &attach_type, &mapfd);
+	if (err)
+		return err;
 
 	err = bpf_prog_attach(progfd, mapfd, attach_type, 0);
 	if (err) {
@@ -760,27 +780,13 @@ static int do_attach(int argc, char **argv)
 static int do_detach(int argc, char **argv)
 {
 	enum bpf_attach_type attach_type;
-	int err, mapfd, progfd;
-
-	if (!REQ_ARGS(5)) {
-		p_err("too few parameters for map detach");
-		return -EINVAL;
-	}
-
-	progfd = prog_parse_fd(&argc, &argv);
-	if (progfd < 0)
-		return progfd;
+	int err, progfd;
+	int mapfd;
 
-	attach_type = parse_attach_type(*argv);
-	if (attach_type == __MAX_BPF_ATTACH_TYPE) {
-		p_err("invalid attach type");
-		return -EINVAL;
-	}
-	NEXT_ARG();
-
-	mapfd = map_parse_fd(&argc, &argv);
-	if (mapfd < 0)
-		return mapfd;
+	err = parse_attach_detach_args(argc, argv,
+				       &progfd, &attach_type, &mapfd);
+	if (err)
+		return err;
 
 	err = bpf_prog_detach2(progfd, mapfd, attach_type);
 	if (err) {
@@ -1092,8 +1098,8 @@ static int do_help(int argc, char **argv)
 		"                         [type TYPE] [dev NAME] \\\n"
 		"                         [map { idx IDX | name NAME } MAP]\\\n"
 		"                         [pinmaps MAP_DIR]\n"
-		"       %s %s attach PROG ATTACH_TYPE MAP\n"
-		"       %s %s detach PROG ATTACH_TYPE MAP\n"
+		"       %s %s attach PROG ATTACH_TYPE [MAP]\n"
+		"       %s %s detach PROG ATTACH_TYPE [MAP]\n"
 		"       %s %s help\n"
 		"\n"
 		"       " HELP_SPEC_MAP "\n"
@@ -1105,7 +1111,8 @@ static int do_help(int argc, char **argv)
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
