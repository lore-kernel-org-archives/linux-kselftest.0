From: Babu.Moger@amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:11 +0000
Subject: [PATCH v5 08/13] selftests/resctrl Add Cache QoS Monitoring (CQM)
 selftest
In-Reply-To: <20190118182646.16594-1-babu.moger@amd.com>
References: <20190118182646.16594-1-babu.moger@amd.com>
Message-ID: <20190118182646.16594-9-babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190118182711.YETl1C6URlUbUeLPjdLWr7S5zuBGJ1hbTsTd0oMF7J0@z>

From: Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan@intel.com>

Cache QoS Monitoring (CQM) selftest starts stressful cache benchmark
with specified size of memory to access the cache. Last Level cache
occupancy reported by CQM should be close to the size of the memory.

Signed-off-by: Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan at intel.com>
Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya at intel.com>
Signed-off-by: Fenghua Yu <fenghua.yu at intel.com>
Signed-off-by: Babu Moger <babu.moger at amd.com>
---
 tools/testing/selftests/resctrl/Makefile        |   2 +-
 tools/testing/selftests/resctrl/cache.c         | 102 +++++++++++
 tools/testing/selftests/resctrl/cqm_test.c      | 169 ++++++++++++++++++
 tools/testing/selftests/resctrl/fill_buf.c      | 107 +++++++-----
 tools/testing/selftests/resctrl/mba_test.c      |   3 +-
 tools/testing/selftests/resctrl/mbm_test.c      |   3 +-
 tools/testing/selftests/resctrl/resctrl.h       |  28 ++-
 tools/testing/selftests/resctrl/resctrl_tests.c |  82 ++++++---
 tools/testing/selftests/resctrl/resctrl_val.c   | 101 ++++++-----
 tools/testing/selftests/resctrl/resctrlfs.c     | 217 ++++++++++++++++++++++--
 10 files changed, 679 insertions(+), 135 deletions(-)
 create mode 100644 tools/testing/selftests/resctrl/cache.c
 create mode 100644 tools/testing/selftests/resctrl/cqm_test.c

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 141cbdb..664561c 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -8,7 +8,7 @@ all: resctrl_tests
 
 resctrl_tests: *.o
 	$(CC) $(CFLAGS) -o resctrl_tests resctrl_tests.o resctrlfs.o \
-		 resctrl_val.o fill_buf.o mbm_test.o mba_test.o
+		 resctrl_val.o fill_buf.o mbm_test.o mba_test.o cache.o cqm_test.o
 
 .PHONY: clean
 
diff --git a/tools/testing/selftests/resctrl/cache.c b/tools/testing/selftests/resctrl/cache.c
new file mode 100644
index 0000000..1256590
--- /dev/null
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdint.h>
+#include "resctrl.h"
+
+struct read_format {
+	__u64 nr;			/* The number of events */
+	struct {
+		__u64 value;		/* The value of the event */
+	} values[2];
+};
+
+char cbm_mask[256];
+unsigned long long_mask;
+char llc_occup_path[1024];
+
+/*
+ * Get LLC Occupancy as reported by RESCTRL FS
+ * For CQM,
+ * 1. If con_mon grp and mon grp given, then read from mon grp in
+ * con_mon grp
+ * 2. If only con_mon grp given, then read from con_mon grp
+ * 3. If both not given, then read from root con_mon grp
+ * For CAT,
+ * 1. If con_mon grp given, then read from it
+ * 2. If con_mon grp not given, then read from root con_mon grp
+ *
+ * Return: =0 on success.  <0 on failure.
+ */
+static int get_llc_occu_resctrl(unsigned long *llc_occupancy)
+{
+	FILE *fp;
+
+	fp = fopen(llc_occup_path, "r");
+	if (!fp) {
+		perror("Failed to open results file");
+
+		return errno;
+	}
+	if (fscanf(fp, "%lu", llc_occupancy) <= 0) {
+		perror("Could not get llc occupancy");
+		fclose(fp);
+
+		return -1;
+	}
+	fclose(fp);
+
+	return 0;
+}
+
+/*
+ * print_results_cache:	the cache results are stored in a file
+ * @filename:		file that stores the results
+ * @bm_pid:		child pid that runs benchmark
+ * @llc_value:		perf miss value /
+ *			llc occupancy value reported by resctrl FS
+ *
+ * Return:		0 on success. non-zero on failure.
+ */
+static int print_results_cache(char *filename, int bm_pid,
+			       unsigned long llc_value)
+{
+	FILE *fp;
+
+	if (strcmp(filename, "stdio") == 0 || strcmp(filename, "stderr") == 0) {
+		printf("Pid: %d \t LLC_value: %lu\n", bm_pid,
+		       llc_value);
+	} else {
+		fp = fopen(filename, "a");
+		if (!fp) {
+			perror("Cannot open results file");
+
+			return errno;
+		}
+		fprintf(fp, "Pid: %d \t llc_value: %lu\n", bm_pid,
+			llc_value);
+		fclose(fp);
+	}
+
+	return 0;
+}
+
+int measure_cache_vals(struct resctrl_val_param *param, int bm_pid)
+{
+	unsigned long llc_occu_resc = 0, llc_value = 0;
+	int ret;
+
+	/*
+	 * Measure llc occupancy from resctrl.
+	 */
+	if (!strcmp(param->resctrl_val, "cqm")) {
+		ret = get_llc_occu_resctrl(&llc_occu_resc);
+		if (ret < 0)
+			return ret;
+		llc_value = llc_occu_resc;
+	}
+	ret = print_results_cache(param->filename, bm_pid, llc_value);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/tools/testing/selftests/resctrl/cqm_test.c b/tools/testing/selftests/resctrl/cqm_test.c
new file mode 100644
index 0000000..cddee36
--- /dev/null
+++ b/tools/testing/selftests/resctrl/cqm_test.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cache Monitoring Technology (CQM) test
+ *
+ * Copyright (C) 2018 Intel Corporation
+ *
+ * Authors:
+ *    Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan at intel.com>
+ *    Sai Praneeth Prakhya <sai.praneeth.prakhya at intel.com>,
+ *    Fenghua Yu <fenghua.yu at intel.com>
+ */
+#include "resctrl.h"
+#include <unistd.h>
+
+#define RESULT_FILE_NAME	"result_cqm"
+#define NUM_OF_RUNS		5
+#define MAX_DIFF		2000000
+#define MAX_DIFF_PERCENT	15
+
+int count_of_bits;
+char cbm_mask[256];
+unsigned long long_mask;
+unsigned long cache_size;
+
+static int cqm_setup(int num, ...)
+{
+	struct resctrl_val_param *p;
+	va_list param;
+
+	va_start(param, num);
+	p = va_arg(param, struct resctrl_val_param *);
+	va_end(param);
+
+	/* Run NUM_OF_RUNS times */
+	if (p->num_of_runs >= NUM_OF_RUNS)
+		return -1;
+
+	p->num_of_runs++;
+
+	return 0;
+}
+
+static void show_cache_info(unsigned long sum_llc_occu_resc, int no_of_bits,
+			    unsigned long span)
+{
+	unsigned long avg_llc_occu_resc = 0;
+	long avg_diff = 0;
+	float diff_percent;
+
+	avg_llc_occu_resc = sum_llc_occu_resc / (NUM_OF_RUNS - 1);
+	avg_diff = (long long)abs(span - avg_llc_occu_resc);
+
+	printf("\nResults are displayed in (Bytes)\n");
+	printf("\nNumber of bits: %d \t", no_of_bits);
+	printf("Avg_llc_occu_resc: %lu \t", avg_llc_occu_resc);
+	printf("llc_occu_exp (span): %lu \t", span);
+
+	diff_percent = (((float)span - avg_llc_occu_resc) / span) * 100;
+
+	printf("Diff: %ld \t", avg_diff);
+	printf("Percent diff=%d\t", abs((int)diff_percent));
+
+	if ((abs((int)diff_percent) <= MAX_DIFF_PERCENT) ||
+	    (abs(avg_diff) <= MAX_DIFF))
+		printf("Passed\n");
+	else
+		printf("Failed\n");
+}
+
+static int check_results(struct resctrl_val_param *param, int no_of_bits)
+{
+	char *token_array[8], temp[512];
+	unsigned long sum_llc_occu_resc = 0;
+	int runs = 0;
+	FILE *fp;
+
+	printf("\nchecking for pass/fail\n");
+	fp = fopen(param->filename, "r");
+	if (!fp) {
+		perror("Error in opening file\n");
+
+		return errno;
+	}
+
+	while (fgets(temp, 1024, fp)) {
+		char *token = strtok(temp, ":\t");
+		int fields = 0;
+
+		while (token) {
+			token_array[fields++] = token;
+			token = strtok(NULL, ":\t");
+		}
+
+		/* Field 3 is llc occ resc value */
+		if (runs > 0)
+			sum_llc_occu_resc += atol(token_array[3]);
+		runs++;
+	}
+	fclose(fp);
+	show_cache_info(sum_llc_occu_resc, no_of_bits, param->span);
+
+	return 0;
+}
+
+void cqm_test_cleanup(void)
+{
+	remove(RESULT_FILE_NAME);
+}
+
+int cqm_resctrl_val(int core_id, int n, char **benchmark_cmd)
+{
+	int ret, mum_resctrlfs;
+
+	cache_size = 0;
+	mum_resctrlfs = 1;
+
+	ret = remount_resctrlfs(mum_resctrlfs);
+	if (ret)
+		return ret;
+
+	ret = get_cbm_mask("L3");
+	if (ret)
+		return ret;
+
+	long_mask = strtoul(cbm_mask, NULL, 16);
+
+	ret = get_cache_size(core_id, 3, &cache_size);
+	if (ret)
+		return ret;
+	printf("cache size :%lu\n", cache_size);
+
+	count_of_bits = count_bits(long_mask);
+
+	if (n < 1 || n > count_of_bits) {
+		printf("Invalid input value for numbr_of_bits n!\n");
+		printf("Please Enter value in range 1 to %d\n", count_of_bits);
+		return -1;
+	}
+
+	struct resctrl_val_param param = {
+		.resctrl_val	= "cqm",
+		.ctrlgrp	= "c1",
+		.mongrp		= "m1",
+		.cpu_no		= core_id,
+		.mum_resctrlfs	= 0,
+		.filename	= RESULT_FILE_NAME,
+		.mask		= ~(long_mask << n) & long_mask,
+		.span		= cache_size * n / count_of_bits,
+		.num_of_runs	= 0,
+		.setup		= cqm_setup,
+	};
+
+	if (strcmp(benchmark_cmd[0], "fill_buf") == 0)
+		sprintf(benchmark_cmd[1], "%llu", param.span);
+
+	remove(RESULT_FILE_NAME);
+
+	ret = resctrl_val(benchmark_cmd, &param);
+	if (ret)
+		return ret;
+
+	ret = check_results(&param, n);
+	if (ret)
+		return ret;
+
+	cqm_test_cleanup();
+
+	return 0;
+}
diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index d9950b5..7c3579a 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -78,54 +78,63 @@ static void *malloc_and_init_memory(size_t s)
 	return p;
 }
 
-static void fill_cache_read(unsigned char *start_ptr, unsigned char *end_ptr)
+static void fill_one_span_read(unsigned char *start_ptr, unsigned char *end_ptr)
 {
-	while (1) {
-		unsigned char sum, *p;
-
-		p = start_ptr;
-		/* Read two chars in each cache line to stress cache */
-		while (p < (end_ptr - 1024)) {
-			sum += p[0] + p[32] + p[64] + p[96] + p[128] +
-			       p[160] + p[192] + p[224] + p[256] + p[288] +
-			       p[320] + p[352] + p[384] + p[416] + p[448] +
-			       p[480] + p[512] + p[544] + p[576] + p[608] +
-			       p[640] + p[672] + p[704] + p[736] + p[768] +
-			       p[800] + p[832] + p[864] + p[896] + p[928] +
-			       p[960] + p[992];
-			p += 1024;
-		}
+	unsigned char sum, *p;
+
+	sum = 0;
+	p = start_ptr;
+	while (p < end_ptr) {
+		sum += *p;
+		p += (CL_SIZE / 2);
 	}
 }
 
-static void fill_cache_write(unsigned char *start_ptr, unsigned char *end_ptr)
+static
+void fill_one_span_write(unsigned char *start_ptr, unsigned char *end_ptr)
 {
-	while (1) {
-		while (start_ptr < end_ptr) {
-			*start_ptr = '1';
-			start_ptr += (CL_SIZE / 2);
-		}
-		start_ptr = startptr;
+	unsigned char *p;
+
+	p = start_ptr;
+	while (p < end_ptr) {
+		*p = '1';
+		p += (CL_SIZE / 2);
 	}
 }
 
-static void
-fill_cache(unsigned long long buf_size, int malloc_and_init,
-	   int memflush, int op)
+static int fill_cache_read(unsigned char *start_ptr, unsigned char *end_ptr,
+			   char *resctrl_val)
+{
+	while (1)
+		fill_one_span_read(start_ptr, end_ptr);
+
+	return 0;
+}
+
+static int fill_cache_write(unsigned char *start_ptr, unsigned char *end_ptr,
+			    char *resctrl_val)
+{
+	while (1)
+		fill_one_span_write(start_ptr, end_ptr);
+
+	return 0;
+}
+
+static int
+fill_cache(unsigned long long buf_size, int malloc_and_init, int memflush,
+	   int op, char *resctrl_val)
 {
 	unsigned char *start_ptr, *end_ptr;
 	unsigned long long i;
+	int ret;
 
-	if (malloc_and_init) {
+	if (malloc_and_init)
 		start_ptr = malloc_and_init_memory(buf_size);
-		printf("Started benchmark with memalign\n");
-	} else {
+	else
 		start_ptr = malloc(buf_size);
-		printf("Started benchmark with malloc\n");
-	}
 
 	if (!start_ptr)
-		return;
+		return -1;
 
 	startptr = start_ptr;
 	end_ptr = start_ptr + buf_size;
@@ -142,24 +151,29 @@ static void fill_cache_write(unsigned char *start_ptr, unsigned char *end_ptr)
 	start_ptr = startptr;
 
 	/* Flush the memory before using to avoid "cache hot pages" effect */
-	if (memflush) {
+	if (memflush)
 		mem_flush(start_ptr, buf_size);
-		printf("Started benchmark with memflush\n");
-	} else {
-		printf("Started benchmark *without* memflush\n");
-	}
 
 	if (op == 0)
-		fill_cache_read(start_ptr, end_ptr);
+		ret = fill_cache_read(start_ptr, end_ptr, resctrl_val);
 	else
-		fill_cache_write(start_ptr, end_ptr);
+		ret = fill_cache_write(start_ptr, end_ptr, resctrl_val);
+
+	if (ret) {
+		printf("\n Errror in fill cache read/write...\n");
+		return -1;
+	}
 
 	free(startptr);
+
+	return 0;
 }
 
-int run_fill_buf(int span, int malloc_and_init_memory, int memflush, int op)
+int run_fill_buf(unsigned long long span, int malloc_and_init_memory,
+		 int memflush, int op, char *resctrl_val)
 {
-	unsigned long long cache_size = span * MB;
+	unsigned long long cache_size = span;
+	int ret;
 
 	/* set up ctrl-c handler */
 	if (signal(SIGINT, ctrl_handler) == SIG_ERR)
@@ -167,9 +181,12 @@ int run_fill_buf(int span, int malloc_and_init_memory, int memflush, int op)
 	if (signal(SIGHUP, ctrl_handler) == SIG_ERR)
 		printf("Failed to catch SIGHUP!\n");
 
-	printf("Cache size in Bytes = %llu\n", cache_size);
-
-	fill_cache(cache_size, malloc_and_init_memory, memflush, op);
+	ret = fill_cache(cache_size, malloc_and_init_memory, memflush, op,
+			 resctrl_val);
+	if (ret) {
+		printf("\n Errror in fill cache\n");
+		return -1;
+	}
 
-	return -1;
+	return 0;
 }
diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 7a5d869..66be852 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -57,6 +57,7 @@ static void show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 {
 	int allocation, failed = 0, runs;
 
+	printf("\nResults are displayed in (MB)\n");
 	/* Memory bandwidth from 100% down to 10% */
 	for (allocation = 0; allocation < ALLOCATION_MAX / ALLOCATION_STEP;
 	     allocation++) {
@@ -159,7 +160,7 @@ int mba_schemata_change(int core_id, char *bw_report, char **benchmark_cmd)
 
 	remove(RESULT_FILE_NAME);
 
-	ret = membw_val(benchmark_cmd, &param);
+	ret = resctrl_val(benchmark_cmd, &param);
 	if (ret)
 		return ret;
 
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index fc1b8ba..ce3eab1 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -36,6 +36,7 @@
 	avg_bw_resc = sum_bw_resc / 4;
 	avg_diff = avg_bw_resc - avg_bw_imc;
 
+	printf("\nResults are displayed in (MB)\n");
 	printf("\nSpan (MB): %d \t", span);
 	printf("avg_bw_imc: %lu\t", avg_bw_imc);
 	printf("avg_bw_resc: %lu\t", avg_bw_resc);
@@ -131,7 +132,7 @@ int mbm_bw_change(int span, int core_id, char *bw_report, char **benchmark_cmd)
 
 	remove(RESULT_FILE_NAME);
 
-	ret = membw_val(benchmark_cmd, &param);
+	ret = resctrl_val(benchmark_cmd, &param);
 	if (ret)
 		return ret;
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index f54a034..a4f8040 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -16,11 +16,18 @@
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <sys/types.h>
+#include <sys/select.h>
 #include <asm/unistd.h>
 #include <linux/perf_event.h>
+#include <sys/time.h>
+#include <math.h>
+#include <sys/wait.h>
+#include <sys/eventfd.h>
 
+#define MB			(1024 * 1024)
 #define RESCTRL_PATH		"/sys/fs/resctrl"
 #define PHYS_ID_PATH		"/sys/devices/system/cpu/cpu"
+#define CBM_MASK_PATH		"/sys/fs/resctrl/info"
 
 #define PARENT_EXIT(err_msg)			\
 	do {					\
@@ -46,14 +53,20 @@ struct resctrl_val_param {
 	char	ctrlgrp[64];
 	char	mongrp[64];
 	int	cpu_no;
-	int	span;
+	unsigned long long span;
 	int	mum_resctrlfs;
 	char	filename[64];
 	char	*bw_report;
+	unsigned long mask;
+	int	num_of_runs;
 	int	(*setup)(int num, ...);
+
 };
 
 pid_t bm_pid, ppid;
+extern char cbm_mask[256];
+extern unsigned long long_mask;
+extern char llc_occup_path[1024];
 
 int remount_resctrlfs(bool mum_resctrlfs);
 int get_resource_id(int cpu_no, int *resource_id);
@@ -68,12 +81,21 @@ int write_bm_pid_to_resctrl(pid_t bm_pid, char *ctrlgrp, char *mongrp,
 			    char *resctrl_val);
 int perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu,
 		    int group_fd, unsigned long flags);
-int run_fill_buf(int span, int malloc_and_init_memory, int memflush, int op);
-int membw_val(char **benchmark_cmd, struct resctrl_val_param *param);
+int run_fill_buf(unsigned long long span, int malloc_and_init_memory,
+		 int memflush, int op, char *resctrl_val);
+int resctrl_val(char **benchmark_cmd, struct resctrl_val_param *param);
 int mbm_bw_change(int span, int core_id, char *bw_report, char **benchmark_cmd);
 void tests_cleanup(void);
 void mbm_test_cleanup(void);
 int mba_schemata_change(int core_id, char *bw_report, char **benchmark_cmd);
 void mba_test_cleanup(void);
+int get_cbm_mask(char *cache_type);
+int get_cache_size(int cpu_no, int cache_num, unsigned long *cache_size);
+void ctrlc_handler(int signum, siginfo_t *info, void *ptr);
+int cqm_resctrl_val(int core_id, int n, char **benchmark_cmd);
+unsigned int count_bits(unsigned long n);
+void cqm_test_cleanup(void);
+int get_core_sibling(int cpu_no);
+int measure_cache_vals(struct resctrl_val_param *param, int bm_pid);
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index e4d00fb..6d4a1cf 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -14,15 +14,14 @@
 #define BENCHMARK_ARGS		64
 #define BENCHMARK_ARG_SIZE	64
 
-int ben_count;
-
 static void cmd_help(void)
 {
-	printf("usage: resctrl_tests [-h] [-b \"benchmark_cmd [options]\"] [-t test list]\n");
-	printf("\t-b benchmark_cmd [options]: run specified benchmark\n");
+	printf("usage: resctrl_tests [-h] [-b \"benchmark_cmd [options]\"] [-t test list] [-n no_of_bits]\n");
+	printf("\t-b benchmark_cmd [options]: run specified benchmark for MBM, MBA and CQM");
 	printf("\t default benchmark is builtin fill_buf\n");
 	printf("\t-t test list: run tests specified in the test list, ");
-	printf("e.g. -t mbm,mba\n");
+	printf("e.g. -t mbm, mba, cqm\n");
+	printf("\t-n no_of_bits: run cache tests using specified no of bits in cache bit mask\n");
 	printf("\t-h: help\n");
 }
 
@@ -30,17 +29,30 @@ void tests_cleanup(void)
 {
 	mbm_test_cleanup();
 	mba_test_cleanup();
+	cqm_test_cleanup();
 }
 
 int main(int argc, char **argv)
 {
 	char benchmark_cmd_area[BENCHMARK_ARGS][BENCHMARK_ARG_SIZE];
-	int res, c, core_id = 0, span = 250, argc_new = argc, i;
+	int res, c, core_id = 1, span = 250, argc_new = argc, i, no_of_bits = 5;
+	int ben_count, ben_ind;
 	bool has_ben = false, mbm_test = true, mba_test = true;
+	bool cqm_test = true;
 	char *benchmark_cmd[BENCHMARK_ARGS];
 	char bw_report[64], bm_type[64];
 
-	while ((c = getopt(argc_new, argv, "ht:b:")) != -1) {
+	for (i = 0; i < argc; i++) {
+		if (strcmp(argv[i], "-b") == 0) {
+			ben_ind = i + 1;
+			ben_count = argc - ben_ind;
+			argc_new = ben_ind - 1;
+			has_ben = 1;
+			break;
+		}
+	}
+
+	while ((c = getopt(argc_new, argv, "ht:n:p:")) != -1) {
 		char *token;
 
 		switch (c) {
@@ -49,11 +61,14 @@ int main(int argc, char **argv)
 
 			mbm_test = false;
 			mba_test = false;
+			cqm_test = false;
 			while (token) {
 				if (!strcmp(token, "mbm")) {
 					mbm_test = true;
 				} else if (!strcmp(token, "mba")) {
 					mba_test = true;
+				} else if (!strcmp(token, "cqm")) {
+					cqm_test = true;
 				} else {
 					printf("invalid argument\n");
 
@@ -62,22 +77,11 @@ int main(int argc, char **argv)
 				token = strtok(NULL, ":\t");
 			}
 			break;
-		case 'b':
-			/* Extract benchmark command from command line. */
-			token = strtok(optarg, " ");
-			i = 0;
-			while (token) {
-				benchmark_cmd[i] = benchmark_cmd_area[i];
-				strcpy(benchmark_cmd[i++], token);
-				if (i >= BENCHMARK_ARGS) {
-					printf("Too many benchmark args\n");
-
-					return -1;
-				}
-				token = strtok(NULL, " ");
-			}
-			benchmark_cmd[i] = NULL;
-			has_ben = true;
+		case 'n':
+			no_of_bits = atoi(optarg);
+			break;
+		case 'p':
+			core_id = atoi(optarg);
 			break;
 		case 'h':
 			cmd_help();
@@ -101,16 +105,26 @@ int main(int argc, char **argv)
 		return errno;
 	}
 
-	if (!has_ben) {
+	if (has_ben) {
+		/* Extract benchmark command from command line. */
+		for (i = ben_ind; i < argc; i++) {
+			benchmark_cmd[i - ben_ind] = benchmark_cmd_area[i];
+			sprintf(benchmark_cmd[i - ben_ind], "%s", argv[i]);
+		}
+		benchmark_cmd[ben_count] = benchmark_cmd_area[ben_count];
+		sprintf(benchmark_cmd[ben_count], "%s", "NULL");
+	} else {
 		/* If no benchmark is given by "-b" argument, use fill_buf. */
-		for (i = 0; i < 5; i++)
+		for (i = 0; i < 6; i++)
 			benchmark_cmd[i] = benchmark_cmd_area[i];
+
 		strcpy(benchmark_cmd[0], "fill_buf");
 		sprintf(benchmark_cmd[1], "%d", span);
 		strcpy(benchmark_cmd[2], "1");
 		strcpy(benchmark_cmd[3], "1");
 		strcpy(benchmark_cmd[4], "0");
-		benchmark_cmd[5] = NULL;
+		strcpy(benchmark_cmd[5], "");
+		benchmark_cmd[6] = NULL;
 	}
 
 	sprintf(bw_report, "reads");
@@ -118,18 +132,32 @@ int main(int argc, char **argv)
 
 	if (mbm_test) {
 		printf("\nMBM BW Change Starting..\n");
+		if (!has_ben)
+			sprintf(benchmark_cmd[5], "%s", "mbm");
 		res = mbm_bw_change(span, core_id, bw_report, benchmark_cmd);
 		if (res)
 			printf("Error in running tests for mbm bw change!\n");
+		mbm_test_cleanup();
 	}
 
 	if (mba_test) {
 		printf("\nMBA Schemata Change Starting..\n");
 		if (!has_ben)
-			sprintf(benchmark_cmd[1], "%d", span);
+			sprintf(benchmark_cmd[5], "%s", "mba");
 		res = mba_schemata_change(core_id, bw_report, benchmark_cmd);
 		if (res)
 			printf("Error in tests for mba-change-schemata!\n");
+		mba_test_cleanup();
+	}
+
+	if (cqm_test) {
+		printf("\nCQM Test Starting..\n");
+		if (!has_ben)
+			sprintf(benchmark_cmd[5], "%s", "cqm");
+		res = cqm_resctrl_val(core_id, no_of_bits, benchmark_cmd);
+		if (res)
+			printf("Error in CQM test!\n");
+		cqm_test_cleanup();
 	}
 
 	return 0;
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 86a513e..e33f2ec 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -11,7 +11,6 @@
  */
 #include "resctrl.h"
 
-#define MB			(1024 * 1024)
 #define UNCORE_IMC		"uncore_imc"
 #define READ_FILE_NAME		"events/cas_count_read"
 #define WRITE_FILE_NAME		"events/cas_count_write"
@@ -33,6 +32,18 @@
 #define MBM_LOCAL_BYTES_PATH			\
 	"%s/mon_data/mon_L3_%02d/mbm_local_bytes"
 
+#define CON_MON_LCC_OCCUP_PATH		\
+	"%s/%s/mon_groups/%s/mon_data/mon_L3_%02d/llc_occupancy"
+
+#define CON_LCC_OCCUP_PATH		\
+	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
+
+#define MON_LCC_OCCUP_PATH		\
+	"%s/mon_groups/%s/mon_data/mon_L3_%02d/llc_occupancy"
+
+#define LCC_OCCUP_PATH			\
+	"%s/mon_data/mon_L3_%02d/llc_occupancy"
+
 struct membw_read_format {
 	__u64 value;         /* The value of the event */
 	__u64 time_enabled;  /* if PERF_FORMAT_TOTAL_TIME_ENABLED */
@@ -207,12 +218,12 @@ static int read_from_imc_dir(char *imc_dir, int count)
  * A config again has two parts, event and umask.
  * Enumerate all these details into an array of structures.
  *
- * Return: >= 0 on success. < 0 on failure.
+ * Return: > 0 on success. <= 0 on failure.
  */
 static int num_of_imcs(void)
 {
 	unsigned int count = 0;
-	char imc_dir[1024];
+	char imc_dir[512];
 	struct dirent *ep;
 	int ret;
 	DIR *dp;
@@ -434,16 +445,6 @@ static unsigned long get_mem_bw_resctrl(void)
 
 pid_t bm_pid, ppid;
 
-static void ctrlc_handler(int signum, siginfo_t *info, void *ptr)
-{
-	kill(bm_pid, SIGKILL);
-	umount_resctrlfs();
-	tests_cleanup();
-	printf("Ending\n\n");
-
-	exit(EXIT_SUCCESS);
-}
-
 /*
  * print_results_bw:	the memory bandwidth results are stored in a file
  * @filename:		file that stores the results
@@ -482,6 +483,42 @@ static int print_results_bw(char *filename,  int bm_pid, float bw_imc,
 	return 0;
 }
 
+static void set_cqm_path(const char *ctrlgrp, const char *mongrp, char sock_num)
+{
+	if (strlen(ctrlgrp) && strlen(mongrp))
+		sprintf(llc_occup_path,	CON_MON_LCC_OCCUP_PATH,	RESCTRL_PATH,
+			ctrlgrp, mongrp, sock_num);
+	else if (!strlen(ctrlgrp) && strlen(mongrp))
+		sprintf(llc_occup_path,	MON_LCC_OCCUP_PATH, RESCTRL_PATH,
+			mongrp, sock_num);
+	else if (strlen(ctrlgrp) && !strlen(mongrp))
+		sprintf(llc_occup_path,	CON_LCC_OCCUP_PATH, RESCTRL_PATH,
+			ctrlgrp, sock_num);
+	else if (!strlen(ctrlgrp) && !strlen(mongrp))
+		sprintf(llc_occup_path, LCC_OCCUP_PATH,	RESCTRL_PATH, sock_num);
+}
+
+/*
+ * initialize_llc_occu_resctrl:	Appropriately populate "llc_occup_path"
+ * @ctrlgrp:			Name of the control monitor group (con_mon grp)
+ * @mongrp:			Name of the monitor group (mon grp)
+ * @cpu_no:			CPU number that the benchmark PID is binded to
+ * @resctrl_val:		Resctrl feature (Eg: cat, cqm.. etc)
+ */
+static void initialize_llc_occu_resctrl(const char *ctrlgrp, const char *mongrp,
+					int cpu_no, char *resctrl_val)
+{
+	int resource_id;
+
+	if (get_resource_id(cpu_no, &resource_id) < 0) {
+		perror("Unable to resource_id");
+		return;
+	}
+
+	if (strcmp(resctrl_val, "cqm") == 0)
+		set_cqm_path(ctrlgrp, mongrp, resource_id);
+}
+
 static int
 measure_vals(struct resctrl_val_param *param, unsigned long *bw_resc_start)
 {
@@ -514,28 +551,24 @@ static int print_results_bw(char *filename,  int bm_pid, float bw_imc,
 }
 
 /*
- * membw_val:		execute benchmark and measure memory bandwidth on
+ * resctrl_val:		execute benchmark and measure memory bandwidth on
  *			the benchmark
  * @benchmark_cmd:	benchmark command and its arguments
- * @param:		parameters passed to membw_val()
+ * @param:		parameters passed to resctrl_val()
  *
  * Return:		0 on success. non-zero on failure.
  */
-int membw_val(char **benchmark_cmd, struct resctrl_val_param *param)
+int resctrl_val(char **benchmark_cmd, struct resctrl_val_param *param)
 {
 	int ret = 0, pipefd[2], pipe_message = 0;
 	char *resctrl_val = param->resctrl_val;
 	unsigned long bw_resc_start = 0;
 	struct sigaction sigact;
 	union sigval value;
-	FILE *fp;
 
 	if (strcmp(param->filename, "") == 0)
 		sprintf(param->filename, "stdio");
 
-	if (strcmp(param->bw_report, "") == 0)
-		param->bw_report = "total";
-
 	ret = validate_resctrl_feature_request(resctrl_val);
 	if (ret)
 		return ret;
@@ -557,21 +590,6 @@ int membw_val(char **benchmark_cmd, struct resctrl_val_param *param)
 	 */
 	ppid = getpid();
 
-	/* File based synchronization between parent and child */
-	fp = fopen("sig", "w");
-	if (!fp) {
-		perror("Failed to open sig file");
-
-		return -1;
-	}
-	if (fprintf(fp, "%d\n", 0) <= 0) {
-		perror("Unable to establish sync bw parent & child");
-		fclose(fp);
-
-		return -1;
-	}
-	fclose(fp);
-
 	if (pipe(pipefd)) {
 		perror("Unable to create pipe");
 
@@ -653,7 +671,9 @@ int membw_val(char **benchmark_cmd, struct resctrl_val_param *param)
 
 		initialize_mem_bw_resctrl(param->ctrlgrp, param->mongrp,
 					  param->cpu_no, resctrl_val);
-	}
+	} else if (strcmp(resctrl_val, "cqm") == 0)
+		initialize_llc_occu_resctrl(param->ctrlgrp, param->mongrp,
+					    param->cpu_no, resctrl_val);
 
 	/* Parent waits for child to be ready. */
 	close(pipefd[1]);
@@ -673,7 +693,8 @@ int membw_val(char **benchmark_cmd, struct resctrl_val_param *param)
 
 	/* Test runs until the callback setup() tells the test to stop. */
 	while (1) {
-		if (strcmp(resctrl_val, "mbm") == 0) {
+		if ((strcmp(resctrl_val, "mbm") == 0) ||
+		    (strcmp(resctrl_val, "mba") == 0)) {
 			ret = param->setup(1, param);
 			if (ret) {
 				ret = 0;
@@ -683,14 +704,14 @@ int membw_val(char **benchmark_cmd, struct resctrl_val_param *param)
 			ret = measure_vals(param, &bw_resc_start);
 			if (ret)
 				break;
-		} else if ((strcmp(resctrl_val, "mba") == 0)) {
+		} else if (strcmp(resctrl_val, "cqm") == 0) {
 			ret = param->setup(1, param);
 			if (ret) {
 				ret = 0;
 				break;
 			}
-
-			ret = measure_vals(param, &bw_resc_start);
+			sleep(1);
+			ret = measure_cache_vals(param, bm_pid);
 			if (ret)
 				break;
 		} else {
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 3e5e88a..3c88afa 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -13,7 +13,11 @@
 
 #define RESCTRL_MBM		"L3 monitoring detected"
 #define RESCTRL_MBA		"MB allocation detected"
-#define MAX_RESCTRL_FEATURES	2
+#define RESCTRL_CQM		"L3 monitoring detected"
+#define MAX_RESCTRL_FEATURES	4
+#define CORE_SIBLINGS_PATH	"/sys/bus/cpu/devices/cpu"
+
+char cbm_mask[256];
 
 /*
  * remount_resctrlfs - Remount resctrl FS at /sys/fs/resctrl
@@ -58,7 +62,7 @@ int remount_resctrlfs(bool mum_resctrlfs)
 
 				return errno;
 			}
-			printf("Remount: done!\n");
+			printf("umount: done!\n");
 		} else {
 			printf("Mounted already. Not remounting!\n");
 
@@ -118,6 +122,134 @@ int get_resource_id(int cpu_no, int *resource_id)
 }
 
 /*
+ * get_cache_size - Get cache size for a specified CPU
+ * @cpu_no:	CPU number
+ * @cache_num:	Cache level 2 for L2, 3 for L3
+ * @cache_size:	pointer to cache_size
+ *
+ * Return: = 0 on success, < 0 on failure.
+ */
+int get_cache_size(int cpu_no, int cache_num, unsigned long *cache_size)
+{
+	char cache_path[1024], cache_str[64];
+	FILE *fp;
+	int length, i;
+
+	sprintf(cache_path, "/sys/bus/cpu/devices/cpu%d/cache/index%d/size",
+		cpu_no, cache_num);
+	fp = fopen(cache_path, "r");
+	if (!fp) {
+		perror("Failed to open cache size");
+
+		return -1;
+	}
+	if (fscanf(fp, "%s", cache_str) <= 0) {
+		perror("Could not get cache_size");
+		fclose(fp);
+
+		return -1;
+	}
+	fclose(fp);
+
+	length = (int)strlen(cache_str);
+
+	*cache_size = 0;
+
+	for (i = 0; i < length; i++) {
+		if ((cache_str[i] >= '0') && (cache_str[i] <= '9'))
+
+			*cache_size = *cache_size * 10 + (cache_str[i] - '0');
+
+		else if (cache_str[i] == 'K')
+
+			*cache_size = *cache_size * 1024;
+
+		else if (cache_str[i] == 'M')
+
+			*cache_size = *cache_size * 1024 * 1024;
+
+		else
+			break;
+	}
+
+	return 0;
+}
+
+/*
+ * get_cbm_mask - Get cbm mask for given cache
+ * @cache_type:	Cache level L2/L3
+ *
+ * Mask is stored in cbm_mask which is global variable.
+ *
+ * Return: = 0 on success, < 0 on failure.
+ */
+int get_cbm_mask(char *cache_type)
+{
+	char cbm_mask_path[1024];
+	FILE *fp;
+
+	sprintf(cbm_mask_path, "%s/%s/cbm_mask", CBM_MASK_PATH, cache_type);
+
+	fp = fopen(cbm_mask_path, "r");
+	if (!fp) {
+		perror("Failed to open cache level");
+
+		return -1;
+	}
+	if (fscanf(fp, "%s", cbm_mask) <= 0) {
+		perror("Could not get max cbm_mask");
+		fclose(fp);
+
+		return -1;
+	}
+	fclose(fp);
+
+	return 0;
+}
+
+/*
+ * get_core_sibling - Get sibling core id from the same socket for given CPU
+ * @cpu_no:	CPU number
+ *
+ * Return:	> 0 on success, < 0 on failure.
+ */
+int get_core_sibling(int cpu_no)
+{
+	char core_siblings_path[1024], cpu_list_str[64];
+	int sibling_core_id = -1;
+	FILE *fp;
+
+	sprintf(core_siblings_path, "%s%d/topology/core_siblings_list",
+		CORE_SIBLINGS_PATH, cpu_no);
+
+	fp = fopen(core_siblings_path, "r");
+	if (!fp) {
+		perror("Failed to open core siblings path");
+
+		return -1;
+	}
+	if (fscanf(fp, "%s", cpu_list_str) <= 0) {
+		perror("Could not get core_siblings list");
+		fclose(fp);
+
+		return -1;
+	}
+	fclose(fp);
+
+	char *token = strtok(cpu_list_str, "-,");
+
+	while (token) {
+		sibling_core_id = atoi(token);
+		/* Skipping core 0 as we don't want to run test on core 0 */
+		if (sibling_core_id != 0)
+			break;
+		token = strtok(NULL, "-,");
+	}
+
+	return sibling_core_id;
+}
+
+/*
  * taskset_benchmark - Taskset PID (i.e. benchmark) to a specified cpu
  * @bm_pid:	PID that should be binded
  * @cpu_no:	CPU number at which the PID would be binded
@@ -153,8 +285,10 @@ int taskset_benchmark(pid_t bm_pid, int cpu_no)
  */
 void run_benchmark(int signum, siginfo_t *info, void *ucontext)
 {
-	int span, operation, ret;
+	unsigned long long buffer_span;
+	int span, operation, ret, malloc_and_init_memory, memflush;
 	char **benchmark_cmd;
+	char resctrl_val[64];
 	FILE *fp;
 
 	benchmark_cmd = info->si_ptr;
@@ -170,8 +304,18 @@ void run_benchmark(int signum, siginfo_t *info, void *ucontext)
 	if (strcmp(benchmark_cmd[0], "fill_buf") == 0) {
 		/* Execute default fill_buf benchmark */
 		span = atoi(benchmark_cmd[1]);
+		malloc_and_init_memory = atoi(benchmark_cmd[2]);
+		memflush =  atoi(benchmark_cmd[3]);
 		operation = atoi(benchmark_cmd[4]);
-		if (run_fill_buf(span, 1, 1, operation))
+		sprintf(resctrl_val, "%s", benchmark_cmd[5]);
+
+		if (strcmp(resctrl_val, "cqm") != 0)
+			buffer_span = span * MB;
+		else
+			buffer_span = span;
+
+		if (run_fill_buf(buffer_span, malloc_and_init_memory, memflush,
+				 operation, resctrl_val))
 			fprintf(stderr, "Error in running fill buffer\n");
 	} else {
 		/* Execute specified benchmark */
@@ -198,6 +342,14 @@ static int create_grp(const char *grp_name, char *grp, const char *parent_grp)
 	struct dirent *ep;
 	DIR *dp;
 
+	/*
+	 * At this point, we are guaranteed to have resctrl FS mounted and if
+	 * length of grp_name == 0, it means, user wants to use root con_mon
+	 * grp, so do nothing
+	 */
+	if (strlen(grp_name) == 0)
+		return 0;
+
 	/* Check if requested grp exists or not */
 	dp = opendir(parent_grp);
 	if (dp) {
@@ -239,7 +391,6 @@ static int write_pid_to_tasks(char *tasks, pid_t pid)
 		fclose(fp);
 
 		return -1;
-
 	}
 	fclose(fp);
 
@@ -264,11 +415,11 @@ static int write_pid_to_tasks(char *tasks, pid_t pid)
 int write_bm_pid_to_resctrl(pid_t bm_pid, char *ctrlgrp, char *mongrp,
 			    char *resctrl_val)
 {
-	char controlgroup[256], monitorgroup[256], monitorgroup_p[256];
-	char tasks[256];
+	char controlgroup[128], monitorgroup[512], monitorgroup_p[256];
+	char tasks[1024];
 	int ret;
 
-	if (ctrlgrp)
+	if (strlen(ctrlgrp))
 		sprintf(controlgroup, "%s/%s", RESCTRL_PATH, ctrlgrp);
 	else
 		sprintf(controlgroup, "%s", RESCTRL_PATH);
@@ -282,9 +433,10 @@ int write_bm_pid_to_resctrl(pid_t bm_pid, char *ctrlgrp, char *mongrp,
 	if (ret)
 		return ret;
 
-	/* Create mon grp and write pid into it for "mbm" test */
-	if ((strcmp(resctrl_val, "mbm") == 0)) {
-		if (mongrp) {
+	/* Create mon grp and write pid into it for "mbm" and "cqm" test */
+	if ((strcmp(resctrl_val, "cqm") == 0) ||
+	    (strcmp(resctrl_val, "mbm") == 0)) {
+		if (strlen(mongrp)) {
 			sprintf(monitorgroup_p, "%s/mon_groups", controlgroup);
 			sprintf(monitorgroup, "%s/%s", monitorgroup_p, mongrp);
 			ret = create_grp(mongrp, monitorgroup, monitorgroup_p);
@@ -322,7 +474,8 @@ int write_schemata(char *ctrlgrp, char *schemata, int cpu_no, char *resctrl_val)
 	int resource_id;
 	FILE *fp;
 
-	if (strcmp(resctrl_val, "mba") == 0) {
+	if ((strcmp(resctrl_val, "mba") == 0) ||
+	    (strcmp(resctrl_val, "cqm") == 0)) {
 		if (!schemata) {
 			printf("Schemata empty, so not updating\n");
 
@@ -333,12 +486,18 @@ int write_schemata(char *ctrlgrp, char *schemata, int cpu_no, char *resctrl_val)
 			return -1;
 		}
 
-		if (ctrlgrp)
+		if (strlen(ctrlgrp) != 0)
 			sprintf(controlgroup, "%s/%s/schemata", RESCTRL_PATH,
 				ctrlgrp);
 		else
 			sprintf(controlgroup, "%s/schemata", RESCTRL_PATH);
-		sprintf(schema, "%s%d%c%s", "MB:", resource_id, '=', schemata);
+
+		if (!strcmp(resctrl_val, "cqm"))
+			sprintf(schema, "%s%d%c%s", "L3:", resource_id, '=',
+				schemata);
+		if (strcmp(resctrl_val, "mba") == 0)
+			sprintf(schema, "%s%d%c%s", "MB:", resource_id, '=',
+				schemata);
 
 		fp = fopen(controlgroup, "w");
 		if (!fp) {
@@ -355,7 +514,7 @@ int write_schemata(char *ctrlgrp, char *schemata, int cpu_no, char *resctrl_val)
 		}
 		fclose(fp);
 
-		printf("Write schemata to resctrl FS: done!\n");
+		printf("Write schemata with %s to resctrl FS: done!\n", schema);
 	}
 
 	return 0;
@@ -369,9 +528,9 @@ int write_schemata(char *ctrlgrp, char *schemata, int cpu_no, char *resctrl_val)
  */
 int validate_resctrl_feature_request(char *resctrl_val)
 {
-	int resctrl_features_supported[MAX_RESCTRL_FEATURES] = {0, 0};
+	int resctrl_features_supported[MAX_RESCTRL_FEATURES] = {0, 0, 0, 0};
 	const char *resctrl_features_list[MAX_RESCTRL_FEATURES] = {
-			"mbm", "mba"};
+			"mbm", "mba", "cqm"};
 	int i, valid_resctrl_feature = -1;
 	char line[1024];
 	FILE *fp;
@@ -412,6 +571,8 @@ int validate_resctrl_feature_request(char *resctrl_val)
 			resctrl_features_supported[0] = 1;
 		if ((strstr(line, RESCTRL_MBA)) != NULL)
 			resctrl_features_supported[1] = 1;
+		if ((strstr(line, RESCTRL_CQM)) != NULL)
+			resctrl_features_supported[3] = 1;
 	}
 	fclose(fp);
 
@@ -455,3 +616,25 @@ int perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu,
 		      group_fd, flags);
 	return ret;
 }
+
+void ctrlc_handler(int signum, siginfo_t *info, void *ptr)
+{
+	kill(bm_pid, SIGKILL);
+	umount_resctrlfs();
+	tests_cleanup();
+	printf("Ending\n\n");
+
+	exit(EXIT_SUCCESS);
+}
+
+unsigned int count_bits(unsigned long n)
+{
+	unsigned int count = 0;
+
+	while (n) {
+		count += n & 1;
+		n >>= 1;
+	}
+
+	return count;
+}
-- 
1.8.3.1
