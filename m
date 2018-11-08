From: sdf@google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 21:39:55 -0800
Subject: [PATCH v3 bpf-next 2/4] libbpf: cleanup after partial failure in
 bpf_object__pin
In-Reply-To: <20181108053957.205681-1-sdf@google.com>
References: <20181108053957.205681-1-sdf@google.com>
Message-ID: <20181108053957.205681-3-sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108053955.ghJazSB0-dhRRt-3EczFFpKaHoa-pTxrI2wlUSaTNqM@z>

bpftool will use bpf_object__pin in the next commit to pin all programs
and maps from the file; in case of a partial failure, we need to get
back to the clean state (undo previous program/map pins).

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 tools/lib/bpf/libbpf.c | 248 ++++++++++++++++++++++++++++++++++++-----
 tools/lib/bpf/libbpf.h |  11 ++
 2 files changed, 230 insertions(+), 29 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index d6e62e90e8d4..db84c85554e7 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1699,6 +1699,34 @@ int bpf_program__pin_instance(struct bpf_program *prog, const char *path,
 	return 0;
 }
 
+int bpf_program__unpin_instance(struct bpf_program *prog, const char *path,
+				int instance)
+{
+	int err;
+
+	err = check_path(path);
+	if (err)
+		return err;
+
+	if (prog == NULL) {
+		pr_warning("invalid program pointer\n");
+		return -EINVAL;
+	}
+
+	if (instance < 0 || instance >= prog->instances.nr) {
+		pr_warning("invalid prog instance %d of prog %s (max %d)\n",
+			   instance, prog->section_name, prog->instances.nr);
+		return -EINVAL;
+	}
+
+	err = unlink(path);
+	if (err != 0)
+		return -errno;
+	pr_debug("unpinned program '%s'\n", path);
+
+	return 0;
+}
+
 static int make_dir(const char *path)
 {
 	char *cp, errmsg[STRERR_BUFSIZE];
@@ -1737,6 +1765,64 @@ int bpf_program__pin(struct bpf_program *prog, const char *path)
 	if (err)
 		return err;
 
+	for (i = 0; i < prog->instances.nr; i++) {
+		char buf[PATH_MAX];
+		int len;
+
+		len = snprintf(buf, PATH_MAX, "%s/%d", path, i);
+		if (len < 0) {
+			err = -EINVAL;
+			goto err_unpin;
+		} else if (len >= PATH_MAX) {
+			err = -ENAMETOOLONG;
+			goto err_unpin;
+		}
+
+		err = bpf_program__pin_instance(prog, buf, i);
+		if (err)
+			goto err_unpin;
+	}
+
+	return 0;
+
+err_unpin:
+	for (i = i - 1; i >= 0; i--) {
+		char buf[PATH_MAX];
+		int len;
+
+		len = snprintf(buf, PATH_MAX, "%s/%d", path, i);
+		if (len < 0)
+			continue;
+		else if (len >= PATH_MAX)
+			continue;
+
+		bpf_program__unpin_instance(prog, buf, i);
+	}
+
+	rmdir(path);
+
+	return err;
+}
+
+int bpf_program__unpin(struct bpf_program *prog, const char *path)
+{
+	int i, err;
+
+	err = check_path(path);
+	if (err)
+		return err;
+
+	if (prog == NULL) {
+		pr_warning("invalid program pointer\n");
+		return -EINVAL;
+	}
+
+	if (prog->instances.nr <= 0) {
+		pr_warning("no instances of prog %s to pin\n",
+			   prog->section_name);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < prog->instances.nr; i++) {
 		char buf[PATH_MAX];
 		int len;
@@ -1747,11 +1833,15 @@ int bpf_program__pin(struct bpf_program *prog, const char *path)
 		else if (len >= PATH_MAX)
 			return -ENAMETOOLONG;
 
-		err = bpf_program__pin_instance(prog, buf, i);
+		err = bpf_program__unpin_instance(prog, buf, i);
 		if (err)
 			return err;
 	}
 
+	err = rmdir(path);
+	if (err)
+		return -errno;
+
 	return 0;
 }
 
@@ -1776,6 +1866,28 @@ int bpf_map__pin(struct bpf_map *map, const char *path)
 	}
 
 	pr_debug("pinned map '%s'\n", path);
+
+	return 0;
+}
+
+int bpf_map__unpin(struct bpf_map *map, const char *path)
+{
+	int err;
+
+	err = check_path(path);
+	if (err)
+		return err;
+
+	if (map == NULL) {
+		pr_warning("invalid map pointer\n");
+		return -EINVAL;
+	}
+
+	err = unlink(path);
+	if (err != 0)
+		return -errno;
+	pr_debug("unpinned map '%s'\n", path);
+
 	return 0;
 }
 
@@ -1803,14 +1915,17 @@ int bpf_object__pin(struct bpf_object *obj, const char *path)
 
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
@@ -1819,17 +1934,56 @@ int bpf_object__pin(struct bpf_object *obj, const char *path)
 
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
+	for (prog = bpf_program__prev(prog, obj);
+	     prog != NULL;
+	     prog = bpf_program__prev(prog, obj)) {
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
+		bpf_program__unpin(prog, buf);
+	}
+
+err_unpin_maps:
+	for (map = bpf_map__prev(map, obj);
+	     map != NULL;
+	     map = bpf_map__prev(map, obj)) {
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
+		bpf_map__unpin(map, buf);
+	}
+
+	return err;
 }
 
 void bpf_object__close(struct bpf_object *obj)
@@ -1918,23 +2072,20 @@ void *bpf_object__priv(struct bpf_object *obj)
 }
 
 static struct bpf_program *
-__bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
+__bpf_program__iter(struct bpf_program *p, struct bpf_object *obj, int i)
 {
-	size_t idx;
+	ssize_t idx;
 
 	if (!obj->programs)
 		return NULL;
-	/* First handler */
-	if (prev == NULL)
-		return &obj->programs[0];
 
-	if (prev->obj != obj) {
+	if (p->obj != obj) {
 		pr_warning("error: program handler doesn't match object\n");
 		return NULL;
 	}
 
-	idx = (prev - obj->programs) + 1;
-	if (idx >= obj->nr_programs)
+	idx = (p - obj->programs) + i;
+	if (idx >= obj->nr_programs || idx < 0)
 		return NULL;
 	return &obj->programs[idx];
 }
@@ -1944,8 +2095,29 @@ bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
 {
 	struct bpf_program *prog = prev;
 
+	if (prev == NULL)
+		return obj->programs;
+
+	do {
+		prog = __bpf_program__iter(prog, obj, 1);
+	} while (prog && bpf_program__is_function_storage(prog, obj));
+
+	return prog;
+}
+
+struct bpf_program *
+bpf_program__prev(struct bpf_program *next, struct bpf_object *obj)
+{
+	struct bpf_program *prog = next;
+
+	if (next == NULL) {
+		if (!obj->nr_programs)
+			return NULL;
+		return obj->programs + obj->nr_programs - 1;
+	}
+
 	do {
-		prog = __bpf_program__next(prog, obj);
+		prog = __bpf_program__iter(prog, obj, -1);
 	} while (prog && bpf_program__is_function_storage(prog, obj));
 
 	return prog;
@@ -2272,10 +2444,10 @@ void bpf_map__set_ifindex(struct bpf_map *map, __u32 ifindex)
 	map->map_ifindex = ifindex;
 }
 
-struct bpf_map *
-bpf_map__next(struct bpf_map *prev, struct bpf_object *obj)
+static struct bpf_map *
+__bpf_map__iter(struct bpf_map *m, struct bpf_object *obj, int i)
 {
-	size_t idx;
+	ssize_t idx;
 	struct bpf_map *s, *e;
 
 	if (!obj || !obj->maps)
@@ -2284,21 +2456,39 @@ bpf_map__next(struct bpf_map *prev, struct bpf_object *obj)
 	s = obj->maps;
 	e = obj->maps + obj->nr_maps;
 
-	if (prev == NULL)
-		return s;
-
-	if ((prev < s) || (prev >= e)) {
+	if ((m < s) || (m >= e)) {
 		pr_warning("error in %s: map handler doesn't belong to object\n",
 			   __func__);
 		return NULL;
 	}
 
-	idx = (prev - obj->maps) + 1;
-	if (idx >= obj->nr_maps)
+	idx = (m - obj->maps) + i;
+	if (idx >= obj->nr_maps || idx < 0)
 		return NULL;
 	return &obj->maps[idx];
 }
 
+struct bpf_map *
+bpf_map__next(struct bpf_map *prev, struct bpf_object *obj)
+{
+	if (prev == NULL)
+		return obj->maps;
+
+	return __bpf_map__iter(prev, obj, 1);
+}
+
+struct bpf_map *
+bpf_map__prev(struct bpf_map *next, struct bpf_object *obj)
+{
+	if (next == NULL) {
+		if (!obj->nr_maps)
+			return NULL;
+		return obj->maps + obj->nr_maps - 1;
+	}
+
+	return __bpf_map__iter(next, obj, -1);
+}
+
 struct bpf_map *
 bpf_object__find_map_by_name(struct bpf_object *obj, const char *name)
 {
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 1f3468dad8b2..785b27f761de 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -112,6 +112,9 @@ LIBBPF_API struct bpf_program *bpf_program__next(struct bpf_program *prog,
 	     (pos) != NULL;				\
 	     (pos) = bpf_program__next((pos), (obj)))
 
+LIBBPF_API struct bpf_program *bpf_program__prev(struct bpf_program *prog,
+						 struct bpf_object *obj);
+
 typedef void (*bpf_program_clear_priv_t)(struct bpf_program *,
 					 void *);
 
@@ -131,7 +134,11 @@ LIBBPF_API int bpf_program__fd(struct bpf_program *prog);
 LIBBPF_API int bpf_program__pin_instance(struct bpf_program *prog,
 					 const char *path,
 					 int instance);
+LIBBPF_API int bpf_program__unpin_instance(struct bpf_program *prog,
+					   const char *path,
+					   int instance);
 LIBBPF_API int bpf_program__pin(struct bpf_program *prog, const char *path);
+LIBBPF_API int bpf_program__unpin(struct bpf_program *prog, const char *path);
 LIBBPF_API void bpf_program__unload(struct bpf_program *prog);
 
 struct bpf_insn;
@@ -260,6 +267,9 @@ bpf_map__next(struct bpf_map *map, struct bpf_object *obj);
 	     (pos) != NULL;				\
 	     (pos) = bpf_map__next((pos), (obj)))
 
+LIBBPF_API struct bpf_map *
+bpf_map__prev(struct bpf_map *map, struct bpf_object *obj);
+
 LIBBPF_API int bpf_map__fd(struct bpf_map *map);
 LIBBPF_API const struct bpf_map_def *bpf_map__def(struct bpf_map *map);
 LIBBPF_API const char *bpf_map__name(struct bpf_map *map);
@@ -274,6 +284,7 @@ LIBBPF_API int bpf_map__reuse_fd(struct bpf_map *map, int fd);
 LIBBPF_API bool bpf_map__is_offload_neutral(struct bpf_map *map);
 LIBBPF_API void bpf_map__set_ifindex(struct bpf_map *map, __u32 ifindex);
 LIBBPF_API int bpf_map__pin(struct bpf_map *map, const char *path);
+LIBBPF_API int bpf_map__unpin(struct bpf_map *map, const char *path);
 
 LIBBPF_API long libbpf_get_error(const void *ptr);
 
-- 
2.19.1.930.g4563a0d9d0-goog
