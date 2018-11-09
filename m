From: sdf at fomichev.me (Stanislav Fomichev)
Date: Thu,  8 Nov 2018 16:22:12 -0800
Subject: [PATCH v4 bpf-next 6/7] bpftool: add pinmaps argument to the
 load/loadall
In-Reply-To: <20181109002213.5914-1-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
Message-ID: <20181109002213.5914-7-s@fomichev.me>

From: Stanislav Fomichev <sdf at google.com>

This new additional argument lets users pin all maps from the object at
specified path.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 .../bpftool/Documentation/bpftool-prog.rst    |  4 +++-
 tools/bpf/bpftool/bash-completion/bpftool     |  3 ++-
 tools/bpf/bpftool/prog.c                      | 24 ++++++++++++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index d943d9b67a1d..b04c4a365739 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -80,7 +80,7 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
+	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
 		  Load bpf program(s) from binary *OBJ* and pin as *FILE*.
 		  Both **bpftool prog load** and **bpftool prog loadall** load
 		  all maps and programs from the *OBJ* and differ only in
@@ -98,6 +98,8 @@ DESCRIPTION
 		  use, referring to it by **id** or through a **pinned** file.
 		  If **dev** *NAME* is specified program will be loaded onto
 		  given networking device (offload).
+		  Optional **pinmaps** argument can be provided to pin all
+		  maps under *MAP_DIR* directory.
 
 		  Note: *FILE* must be located in *bpffs* mount. It must not
 		  contain a dot character ('.'), which is reserved for future
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index 780ebafb756a..a05d0071f39f 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -346,7 +346,7 @@ _bpftool()
                             _bpftool_get_map_ids
                             return 0
                             ;;
-                        pinned)
+                        pinned|pinmaps)
                             _filedir
                             return 0
                             ;;
@@ -358,6 +358,7 @@ _bpftool()
                             COMPREPLY=( $( compgen -W "map" -- "$cur" ) )
                             _bpftool_once_attr 'type'
                             _bpftool_once_attr 'dev'
+                            _bpftool_once_attr 'pinmaps'
                             return 0
                             ;;
                     esac
diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
index 751a90ccfdab..4654d9450cd9 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -802,6 +802,7 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
 	struct map_replace *map_replace = NULL;
 	struct bpf_program *prog = NULL, *pos;
 	unsigned int old_map_fds = 0;
+	const char *pinmaps = NULL;
 	struct bpf_object *obj;
 	struct bpf_map *map;
 	const char *pinfile;
@@ -906,6 +907,13 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
 				goto err_free_reuse_maps;
 			}
 			NEXT_ARG();
+		} else if (is_prefix(*argv, "pinmaps")) {
+			NEXT_ARG();
+
+			if (!REQ_ARGS(1))
+				goto err_free_reuse_maps;
+
+			pinmaps = GET_ARG();
 		} else {
 			p_err("expected no more arguments, 'type', 'map' or 'dev', got: '%s'?",
 			      *argv);
@@ -1026,6 +1034,14 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
 		}
 	}
 
+	if (pinmaps) {
+		err = bpf_object__pin_maps(obj, pinmaps);
+		if (err) {
+			p_err("failed to pin all maps");
+			goto err_unpin;
+		}
+	}
+
 	if (json_output)
 		jsonw_null(json_wtr);
 
@@ -1036,6 +1052,11 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
 
 	return 0;
 
+err_unpin:
+	if (first_prog_only)
+		unlink(pinfile);
+	else
+		bpf_object__unpin_programs(obj, pinfile);
 err_close_obj:
 	bpf_object__close(obj);
 err_free_reuse_maps:
@@ -1069,7 +1090,8 @@ static int do_help(int argc, char **argv)
 		"       %s %s pin   PROG FILE\n"
 		"       %s %s { load | loadall } OBJ  FILE \\\n"
 		"                         [type TYPE] [dev NAME] \\\n"
-		"                         [map { idx IDX | name NAME } MAP]\n"
+		"                         [map { idx IDX | name NAME } MAP]\\\n"
+		"                         [pinmaps MAP_DIR]\n"
 		"       %s %s attach PROG ATTACH_TYPE MAP\n"
 		"       %s %s detach PROG ATTACH_TYPE MAP\n"
 		"       %s %s help\n"
-- 
2.19.1.930.g4563a0d9d0-goog
