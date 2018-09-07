From: jgkamat@fb.com (jgkamat@fb.com)
Date: Fri, 7 Sep 2018 14:34:04 -0700
Subject: [PATCH v3 1/2] Fix cg_read_strcmp()
In-Reply-To: <20180907213405.31574-1-jgkamat@fb.com>
References: <20180907164924.13789-1-jgkamat@fb.com>
 <20180907213405.31574-1-jgkamat@fb.com>
Message-ID: <20180907213405.31574-2-jgkamat@fb.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180907213404.Uk9h6uoWA72UXIm2l3X7V_E-gLeW5XZ7hRE9L_OMtaY@z>

From: Jay Kamat <jgkamat@fb.com>

Fix a couple issues with cg_read_strcmp(), to improve correctness of
cgroup tests
- Fix cg_read_strcmp() always returning 0 for empty "needle" strings.
Previously, this function read to a size = 1 buffer when comparing
against empty strings, which would lead to cg_read_strcmp() comparing
two empty strings.
- Fix a memory leak in cg_read_strcmp()

Fixes: 84092dbcf901 ("selftests: cgroup: add memory controller self-tests")

Signed-off-by: Jay Kamat <jgkamat at fb.com>
Acked-by: Roman Gushchin <guro at fb.com>
---
 tools/testing/selftests/cgroup/cgroup_util.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index 1e9e3c470561..8b644ea39725 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -89,17 +89,28 @@ int cg_read(const char *cgroup, const char *control, char *buf, size_t len)
 int cg_read_strcmp(const char *cgroup, const char *control,
 		   const char *expected)
 {
-	size_t size = strlen(expected) + 1;
+	size_t size;
 	char *buf;
+	int ret;
+
+	/* Handle the case of comparing against empty string */
+	if (!expected)
+		size = 32;
+	else
+		size = strlen(expected) + 1;
 
 	buf = malloc(size);
 	if (!buf)
 		return -1;
 
-	if (cg_read(cgroup, control, buf, size))
+	if (cg_read(cgroup, control, buf, size)) {
+		free(buf);
 		return -1;
+	}
 
-	return strcmp(expected, buf);
+	ret = strcmp(expected, buf);
+	free(buf);
+	return ret;
 }
 
 int cg_read_strstr(const char *cgroup, const char *control, const char *needle)
-- 
2.17.1
