From: sdf at google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 14:43:55 -0800
Subject: [PATCH bpf-next 2/3] libbpf: cleanup after partial failure in
 bpf_object__pin
In-Reply-To: <20181107224356.73080-1-sdf@google.com>
References: <20181107224356.73080-1-sdf@google.com>
Message-ID: <20181107224356.73080-3-sdf@google.com>

bpftool will use bpf_object__pin in the next commit to pin all programs
and maps from the file; in case of a partial failure, we need to get
back to the clean state (undo previous program/map pins).

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 tools/lib/bpf/libbpf.c | 58 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index d6e62e90e8d4..309abe7196f3 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1803,14 +1803,17 @@ int bpf_object__pin(struct bpf_object *obj, const char *path)
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
 			       bpf_map__name(map));
-		if (len < 0)
-			return -EINVAL;
-		else if (len >= PATH_MAX)
-			return -ENAMETOOLONG;
+		if (len < 0) {
+			err = -EINVAL;
+			goto err_unpin_maps;
+		} else if (len >= PATH_MAX) {
+			err = -ENAMETOOLONG;
+			goto err_unpin_maps;
+		}
 
 		err = bpf_map__pin(map, buf);
 		if (err)
-			return err;
+			goto err_unpin_maps;
 	}
 
 	bpf_object__for_each_program(prog, obj) {
@@ -1819,17 +1822,52 @@ int bpf_object__pin(struct bpf_object *obj, const char *path)
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
 			       prog->section_name);
-		if (len < 0)
-			return -EINVAL;
-		else if (len >= PATH_MAX)
-			return -ENAMETOOLONG;
+		if (len < 0) {
+			err = -EINVAL;
+			goto err_unpin_programs;
+		} else if (len >= PATH_MAX) {
+			err = -ENAMETOOLONG;
+			goto err_unpin_programs;
+		}
 
 		err = bpf_program__pin(prog, buf);
 		if (err)
-			return err;
+			goto err_unpin_programs;
 	}
 
 	return 0;
+
+err_unpin_programs:
+	bpf_object__for_each_program(prog, obj) {
+		char buf[PATH_MAX];
+		int len;
+
+		len = snprintf(buf, PATH_MAX, "%s/%s", path,
+			       prog->section_name);
+		if (len < 0)
+			continue;
+		else if (len >= PATH_MAX)
+			continue;
+
+		unlink(buf);
+	}
+
+err_unpin_maps:
+	bpf_map__for_each(map, obj) {
+		char buf[PATH_MAX];
+		int len;
+
+		len = snprintf(buf, PATH_MAX, "%s/%s", path,
+			       bpf_map__name(map));
+		if (len < 0)
+			continue;
+		else if (len >= PATH_MAX)
+			continue;
+
+		unlink(buf);
+	}
+
+	return err;
 }
 
 void bpf_object__close(struct bpf_object *obj)
-- 
2.19.1.930.g4563a0d9d0-goog
