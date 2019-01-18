From: Babu.Moger at amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:17 +0000
Subject: [PATCH v5 13/13] selftests/resctrl: Disable MBA and MBM tests for AMD
In-Reply-To: <20190118182646.16594-1-babu.moger@amd.com>
References: <20190118182646.16594-1-babu.moger@amd.com>
Message-ID: <20190118182646.16594-14-babu.moger@amd.com>

For now, disable MBA and MBM tests for AMD. Deciding test pass/fail
is not clear right now. We can enable when we have some clarity.

Signed-off-by: Babu Moger <babu.moger at amd.com>
---
 tools/testing/selftests/resctrl/cat_test.c      | 2 +-
 tools/testing/selftests/resctrl/resctrl_tests.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 57d501d..badf2d1 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -69,7 +69,7 @@ static void show_cache_info(unsigned long sum_llc_perf_miss, int no_of_bits,
 	printf("Allocated cache lines: %lu \t", allocated_cache_lines);
 	printf("Percent diff=%d \t", abs((int)diff_percent));
 
-	if (abs((int)diff_percent) > MAX_DIFF_PERCENT)
+	if (genuine_intel && (abs((int)diff_percent) > MAX_DIFF_PERCENT))
 		printf("Failed\n");
 	else
 		printf("Passed\n");
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index e8cbcd5..b12f2c5 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -202,7 +202,7 @@ int main(int argc, char **argv)
 	sprintf(bw_report, "reads");
 	sprintf(bm_type, "fill_buf");
 
-	if (mbm_test) {
+	if (genuine_intel && mbm_test) {
 		printf("\nMBM BW Change Starting..\n");
 		if (!has_ben)
 			sprintf(benchmark_cmd[5], "%s", "mbm");
@@ -212,7 +212,7 @@ int main(int argc, char **argv)
 		mbm_test_cleanup();
 	}
 
-	if (mba_test) {
+	if (genuine_intel && mba_test) {
 		printf("\nMBA Schemata Change Starting..\n");
 		if (!has_ben)
 			sprintf(benchmark_cmd[5], "%s", "mba");
-- 
1.8.3.1
