From: Babu.Moger at amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:09 +0000
Subject: [PATCH v5 06/13] selftests/resctrl: Add MBM test
In-Reply-To: <20190118182646.16594-1-babu.moger@amd.com>
References: <20190118182646.16594-1-babu.moger@amd.com>
Message-ID: <20190118182646.16594-7-babu.moger@amd.com>

From: Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan at intel.com>

MBM (Memory Bandwidth Monitoring) test is the first implemented selftest.
It starts a stressful memory bandwidth benchmark and assigns the
bandwidth pid in a resctrl monitoring group. Read and compare perf IMC
counter and MBM total bytes for the benchmark. The numbers should be
close enough to pass the test.

Default benchmark is built-in fill_buf. But users can specify their
own benchmark by option "-b".

We can add memory bandwidth monitoring for multiple processes in the
future.

Signed-off-by: Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan at intel.com>
Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya at intel.com>,
Signed-off-by: Fenghua Yu <fenghua.yu at intel.com>
Signed-off-by: Babu Moger <babu.moger at amd.com>
---
 tools/testing/selftests/resctrl/Makefile        |   8 +-
 tools/testing/selftests/resctrl/mbm_test.c      | 145 ++++++++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h       |   3 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 123 ++++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl_val.c   |   2 +
 5 files changed, 280 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/resctrl/mbm_test.c
 create mode 100644 tools/testing/selftests/resctrl/resctrl_tests.c

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index bd5c541..eaa8b45 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,10 +1,16 @@
 CC = gcc
 CFLAGS = -g -Wall
 
+all: resctrl_tests
+
 *.o: *.c
 	$(CC) $(CFLAGS) -c *.c
 
+resctrl_tests: *.o
+	$(CC) $(CFLAGS) -o resctrl_tests resctrl_tests.o resctrlfs.o \
+		 resctrl_val.o fill_buf.o mbm_test.o
+
 .PHONY: clean
 
 clean:
-	$(RM) *.o *~
+	$(RM) *.o *~ resctrl_tests
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
new file mode 100644
index 0000000..fc1b8ba
--- /dev/null
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Memory Bandwidth Monitoring (MBM) test
+ *
+ * Copyright (C) 2018 Intel Corporation
+ *
+ * Authors:
+ *    Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan at intel.com>
+ *    Sai Praneeth Prakhya <sai.praneeth.prakhya at intel.com>,
+ *    Fenghua Yu <fenghua.yu at intel.com>
+ */
+#include "resctrl.h"
+
+#define RESULT_FILE_NAME	"result_mbm"
+#define MAX_DIFF		300
+#define NUM_OF_RUNS		5
+
+static void
+show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, int span)
+{
+	unsigned long avg_bw_imc = 0, avg_bw_resc = 0;
+	unsigned long sum_bw_imc = 0, sum_bw_resc = 0;
+	long avg_diff = 0;
+	int runs;
+
+	/*
+	 * Discard the first value which is inaccurate due to monitoring setup
+	 * transition phase.
+	 */
+	for (runs = 1; runs < NUM_OF_RUNS ; runs++) {
+		sum_bw_imc += bw_imc[runs];
+		sum_bw_resc += bw_resc[runs];
+	}
+
+	avg_bw_imc = sum_bw_imc / 4;
+	avg_bw_resc = sum_bw_resc / 4;
+	avg_diff = avg_bw_resc - avg_bw_imc;
+
+	printf("\nSpan (MB): %d \t", span);
+	printf("avg_bw_imc: %lu\t", avg_bw_imc);
+	printf("avg_bw_resc: %lu\t", avg_bw_resc);
+	printf("avg_diff: %lu\t", labs(avg_diff));
+
+	if (labs(avg_diff) > MAX_DIFF)
+		printf(" failed\n");
+	else
+		printf(" passed\n");
+}
+
+static int check_results(int span)
+{
+	unsigned long bw_imc[NUM_OF_RUNS], bw_resc[NUM_OF_RUNS];
+	char temp[1024], *token_array[8];
+	char output[] = RESULT_FILE_NAME;
+	int runs;
+	FILE *fp;
+
+	printf("\nChecking for pass/fail\n");
+
+	fp = fopen(output, "r");
+	if (!fp) {
+		perror("Error in opening file\n");
+
+		return errno;
+	}
+
+	runs = 0;
+	while (fgets(temp, 1024, fp)) {
+		char *token = strtok(temp, ":\t");
+		int i = 0;
+
+		while (token) {
+			token_array[i++] = token;
+			token = strtok(NULL, ":\t");
+		}
+
+		bw_resc[runs] = atol(token_array[5]);
+		bw_imc[runs] = atol(token_array[3]);
+		runs++;
+	}
+
+	show_bw_info(bw_imc, bw_resc, span);
+
+	fclose(fp);
+
+	return 0;
+}
+
+static int mbm_setup(int num, ...)
+{
+	struct resctrl_val_param *p;
+	static int num_of_runs;
+	va_list param;
+	int ret = 0;
+
+	/* Run NUM_OF_RUNS times */
+	if (num_of_runs++ >= NUM_OF_RUNS)
+		return -1;
+
+	va_start(param, num);
+	p = va_arg(param, struct resctrl_val_param *);
+	va_end(param);
+
+	/* Set up shemata with 100% allocation on the first run. */
+	if (num_of_runs == 0)
+		ret = write_schemata(p->ctrlgrp, "100", p->cpu_no,
+				     p->resctrl_val);
+
+	return ret;
+}
+
+void mbm_test_cleanup(void)
+{
+	remove(RESULT_FILE_NAME);
+}
+
+int mbm_bw_change(int span, int core_id, char *bw_report, char **benchmark_cmd)
+{
+	struct resctrl_val_param param = {
+		.resctrl_val	= "mbm",
+		.ctrlgrp	= "c1",
+		.mongrp		= "m1",
+		.span		= span,
+		.cpu_no		= core_id,
+		.mum_resctrlfs	= 1,
+		.filename	= RESULT_FILE_NAME,
+		.bw_report	=  bw_report,
+		.setup		= mbm_setup
+	};
+	int ret;
+
+	remove(RESULT_FILE_NAME);
+
+	ret = membw_val(benchmark_cmd, &param);
+	if (ret)
+		return ret;
+
+	ret = check_results(span);
+	if (ret)
+		return ret;
+
+	mbm_test_cleanup();
+
+	return 0;
+}
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index f30a2dc..90d1fd1 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -70,5 +70,8 @@ int perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu,
 		    int group_fd, unsigned long flags);
 int run_fill_buf(int span, int malloc_and_init_memory, int memflush, int op);
 int membw_val(char **benchmark_cmd, struct resctrl_val_param *param);
+int mbm_bw_change(int span, int core_id, char *bw_report, char **benchmark_cmd);
+void tests_cleanup(void);
+void mbm_test_cleanup(void);
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
new file mode 100644
index 0000000..8a33809
--- /dev/null
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Resctrl tests
+ *
+ * Copyright (C) 2018 Intel Corporation
+ *
+ * Authors:
+ *    Arshiya Hayatkhan Pathan <arshiya.hayatkhan.pathan at intel.com>
+ *    Sai Praneeth Prakhya <sai.praneeth.prakhya at intel.com>,
+ *    Fenghua Yu <fenghua.yu at intel.com>
+ */
+#include "resctrl.h"
+
+#define BENCHMARK_ARGS		64
+#define BENCHMARK_ARG_SIZE	64
+
+int ben_count;
+
+static void cmd_help(void)
+{
+	printf("usage: resctrl_tests [-h] [-b \"benchmark_cmd [options]\"] [-t test list]\n");
+	printf("\t-b benchmark_cmd [options]: run specified benchmark\n");
+	printf("\t default benchmark is builtin fill_buf\n");
+	printf("\t-t test list: run tests specified in the test list, ");
+	printf("e.g. -t mbm,mba\n");
+	printf("\t-h: help\n");
+}
+
+void tests_cleanup(void)
+{
+	mbm_test_cleanup();
+}
+
+int main(int argc, char **argv)
+{
+	char benchmark_cmd_area[BENCHMARK_ARGS][BENCHMARK_ARG_SIZE];
+	int res, c, core_id = 0, span = 250, argc_new = argc, i;
+	bool has_ben = false, mbm_test = true;
+	char *benchmark_cmd[BENCHMARK_ARGS];
+	char bw_report[64], bm_type[64];
+
+	while ((c = getopt(argc_new, argv, "ht:b:")) != -1) {
+		char *token;
+
+		switch (c) {
+		case 't':
+			token = strtok(optarg, ",");
+
+			mbm_test = false;
+			while (token) {
+				if (!strcmp(token, "mbm")) {
+					mbm_test = true;
+				} else {
+					printf("invalid argument\n");
+
+					return -1;
+				}
+				token = strtok(NULL, ":\t");
+			}
+			break;
+		case 'b':
+			/* Extract benchmark command from command line. */
+			token = strtok(optarg, " ");
+			i = 0;
+			while (token) {
+				benchmark_cmd[i] = benchmark_cmd_area[i];
+				strcpy(benchmark_cmd[i++], token);
+				if (i >= BENCHMARK_ARGS) {
+					printf("Too many benchmark args\n");
+
+					return -1;
+				}
+				token = strtok(NULL, " ");
+			}
+			benchmark_cmd[i] = NULL;
+			has_ben = true;
+			break;
+		case 'h':
+			cmd_help();
+
+			return 0;
+		default:
+			printf("invalid argument\n");
+
+			return -1;
+		}
+	}
+
+	/*
+	 * We need root privileges to run because
+	 * 1. We write to resctrl FS
+	 * 2. We execute perf commands
+	 */
+	if (geteuid() != 0) {
+		perror("Please run this program as root\n");
+
+		return errno;
+	}
+
+	if (!has_ben) {
+		/* If no benchmark is given by "-b" argument, use fill_buf. */
+		for (i = 0; i < 5; i++)
+			benchmark_cmd[i] = benchmark_cmd_area[i];
+		strcpy(benchmark_cmd[0], "fill_buf");
+		sprintf(benchmark_cmd[1], "%d", span);
+		strcpy(benchmark_cmd[2], "1");
+		strcpy(benchmark_cmd[3], "1");
+		strcpy(benchmark_cmd[4], "0");
+		benchmark_cmd[5] = NULL;
+	}
+
+	sprintf(bw_report, "reads");
+	sprintf(bm_type, "fill_buf");
+
+	if (mbm_test) {
+		printf("\nMBM BW Change Starting..\n");
+		res = mbm_bw_change(span, core_id, bw_report, benchmark_cmd);
+		if (res)
+			printf("Error in running tests for mbm bw change!\n");
+	}
+
+	return 0;
+}
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 8b32595..86a513e 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -437,6 +437,8 @@ static unsigned long get_mem_bw_resctrl(void)
 static void ctrlc_handler(int signum, siginfo_t *info, void *ptr)
 {
 	kill(bm_pid, SIGKILL);
+	umount_resctrlfs();
+	tests_cleanup();
 	printf("Ending\n\n");
 
 	exit(EXIT_SUCCESS);
-- 
1.8.3.1
