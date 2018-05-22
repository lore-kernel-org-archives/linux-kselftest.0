From: guro@fb.com (Roman Gushchin)
Date: Tue, 22 May 2018 11:10:31 +0100
Subject: [PATCH] kselftest/cgroup: fix variable dereferenced before check
 warning
Message-ID: <20180522101031.8451-1-guro@fb.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180522101031.wGdxPlQknEi5enxbJtfCpmqCtxYvihh6DK0mfleyvgM@z>

cg_name(const char *root, const char *name) is always called with
non-empty root and name arguments, so there is no sense in checking
it in the function body (after using in strlen()).

Signed-off-by: Roman Gushchin <guro at fb.com>
Reported-by: Dan Carpenter <dan.carpenter at oracle.com>
Cc: linux-kselftest at vger.kernel.org
---
 tools/testing/selftests/cgroup/cgroup_util.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index 41cc3b5e5be1..b69bdeb4b9fe 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -59,8 +59,7 @@ char *cg_name(const char *root, const char *name)
 	size_t len = strlen(root) + strlen(name) + 2;
 	char *ret = malloc(len);
 
-	if (name)
-		snprintf(ret, len, "%s/%s", root, name);
+	snprintf(ret, len, "%s/%s", root, name);
 
 	return ret;
 }
@@ -70,8 +69,7 @@ char *cg_name_indexed(const char *root, const char *name, int index)
 	size_t len = strlen(root) + strlen(name) + 10;
 	char *ret = malloc(len);
 
-	if (name)
-		snprintf(ret, len, "%s/%s_%d", root, name, index);
+	snprintf(ret, len, "%s/%s_%d", root, name, index);
 
 	return ret;
 }
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
