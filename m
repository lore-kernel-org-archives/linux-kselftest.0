From: Babu.Moger@amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:16 +0000
Subject: [PATCH v5 12/13] selftests/resctrl: Use cache index3 id for AMD
 schemata masks
In-Reply-To: <20190118182646.16594-1-babu.moger@amd.com>
References: <20190118182646.16594-1-babu.moger@amd.com>
Message-ID: <20190118182646.16594-13-babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190118182716.i9XFvXyKeJHOOQenkK4MsfHtOog0TAGsifD92KNHTWE@z>

AMD uses the cache l3 boundary for schemata masks. Update it accordigly.

Signed-off-by: Babu Moger <babu.moger at amd.com>
---
 tools/testing/selftests/resctrl/resctrlfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 146a10e..15cda1b 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -103,8 +103,13 @@ int get_resource_id(int cpu_no, int *resource_id)
 	char phys_pkg_path[1024];
 	FILE *fp;
 
-	sprintf(phys_pkg_path, "%s%d/topology/physical_package_id",
-		PHYS_ID_PATH, cpu_no);
+	if (authentic_amd)
+		sprintf(phys_pkg_path, "%s%d/cache/index3/id",
+                        PHYS_ID_PATH, cpu_no);
+	else
+		sprintf(phys_pkg_path, "%s%d/topology/physical_package_id",
+			PHYS_ID_PATH, cpu_no);
+
 	fp = fopen(phys_pkg_path, "r");
 	if (!fp) {
 		perror("Failed to open physical_package_id");
-- 
1.8.3.1
