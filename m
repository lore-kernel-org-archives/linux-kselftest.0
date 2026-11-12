Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500266;
	b=mKwvf02rUYMvHJk3VQvQBcyZSHWgblx8RduAeFgYv4Finc63K/fu7EpaX1xiliIFXWlU
	 gGsxt8iKRhLn64tAEY92RK1VOwDZ1wR2luT8CjLaBVKCjgs+N1J4RzhBXdzqmC5m4fdPY
	 m9vNdy+brnqYETW78mptyqoYNRNuB61cXmAUZBI/Hfwir11ByihTIEaNiJXLjbnrnH7h9
	 fHrD5dmOwQMhwtBWqVBMt5VLPCPR6xbEke/tAaCbwlVAoJXXosQRuzfvIsJV0CBSWTcv9
	 pz0CWWz7EoTDKHE981lYAn0H3z5owiZ7YMQY/ZN9ZzAP5CkHE8x1Ly2J506+Awm+plw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500266;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bkl3u1yrzp59s3UDL3os5DWL5JBWn7UxQEGVNkP9/p8=;
	b=kIxSwxzhpD0wsL2V6eFLbIVLCKUN4ytTlsFxmJ1O3dV1Mbwee53ZnzqREezT7dDMp/nu
	 3rF1cEIR4DackM1gX0p1A99Fe3OVzzwVVY4V5eieX8pD3tF7eC5C/1w7HPpLPyLCxQ+oo
	 1hJf/DyoG3z84sMjtMT25rtOlTppJNR9415KgSnhhD4Xgb6U3RCFz2yy0I9IFUnhcy8o1
	 pRtCtLmtLEIidc4d7YNuPki8uk4QPakyBANcwBcf9ZyBYTY8pQLCmGe0SaLVOQ5G48KAG
	 ebYlcXssV+ElfHTPcgcHT3DP8SVnhqZjSYbIvJAFhYcFre9TgIXlA/uZ9x29cqQ0i0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=avq57mL6;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A67606A32A;
	Thu, 12 Nov 2026 16:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A67606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=avq57mL6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794500265; x=1826036265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bkl3u1yrzp59s3UDL3os5DWL5JBWn7UxQEGVNkP9/p8=;
  b=avq57mL6hhPTKzTdJas3uQm2vUo2uF3uOTw9h8y+Of/DLDowhbaSQN2d
   C+T1EVifxItSy9TmIuRmapGrU4lRoSWJ05ELQSjMyH6EIsjXRTFO6j/Q4
   ClWmKYbYBE43ZFkUeZSKQZszaRENFa2Y2SZEVTdSMSig6uvAIkwlAaYrD
   J61ngQ/SNmGVs1X3BMegID0+LLuFPYTYqe1P39styOXVV9rvMyX9AbRAe
   YAMT4eTFEqiz0W9sejZfyKPRAz5TcKx9qv5F/bG7jJdltsDniU0SDE5zy
   Gb9WgJRAJebSIeFRWOz0YMP2vpnxu88CDMIw28oMEfxirCBCbeZFyiyM7
   w==;
X-CSE-ConnectionGUID: H+9DJuEiQDWRHfZ0CjMOww==
X-CSE-MsgGUID: GlF8ICTHS6iCuQiOo4YmfQ==
X-IronPort-AV: E=Sophos;i="6.27,210,1787011200"; 
   d="scan'208";a="33601581"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:17:45 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:28206]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id 86f286c4-0a54-4df7-adb1-46019e57f813; Thu, 12 Nov 2026 16:17:44 +0000 (UTC)
X-Farcaster-Flow-ID: 86f286c4-0a54-4df7-adb1-46019e57f813
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 16:17:44 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 16:17:40 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Daniel Bristot de Oliveira <bristot@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Don <joshdon@google.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<nh-open-source@amazon.com>, Fahad Mubeen <fmubeen@amazon.de>, "David
 Woodhouse" <dwmw@amazon.co.uk>, Misha Karataiev <karataev@amazon.com>,
	Hendrik Borghorst <hborghor@amazon.de>, Ibrahim Elshahed <lshahed@amazon.de>,
	Fernand Sieber <sieberf@amazon.com>
Subject: [PATCH 5/5] selftests/sched: Add a core-sched forced-idle DL server test
Date: Thu, 12 Nov 2026 18:15:48 +0200
Message-ID: <20261112161548.78189-6-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112161548.78189-1-sieberf@amazon.com>
References: <20261112161548.78189-1-sieberf@amazon.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Nothing in selftests notices a deferred DL server that is charged for
core-sched forced idle and so never activates: the fair server keeps its
reservation in debugfs while the CFS tasks it reserves for get a few
hundredths of a percent of a CPU.

Add cs_dl_server_test. It pins a SCHED_FIFO 50 spinner with its own core
cookie to one SMT sibling and an uncookied CFS spinner to the other, so
the second sibling is forced idle whenever the FIFO task runs, then
checks the CFS task's share of that CPU over five seconds against the
fair server's reservation under /sys/kernel/debug/sched/. The floor is
half the reservation, 2.5% by default, since every slice the server gets
costs a forced-idle hand-over. It skips without SMT, without core
scheduling, or without the debugfs reservation.

At 2 cores x 2 threads the share measures 4.0-5.2% once both this idle
charge and the core-wide DL server pick are fixed, and 0.0% with either
missing, so it passes only with both.

Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 tools/testing/selftests/sched/.gitignore      |   1 +
 tools/testing/selftests/sched/Makefile        |   4 +-
 tools/testing/selftests/sched/config          |   4 +-
 .../selftests/sched/cs_dl_server_test.c       | 402 ++++++++++++++++++
 4 files changed, 408 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched/cs_dl_server_test.c

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftests/sched/.gitignore
index 6996d4654d924..4e3a0254e0abc 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1 +1,2 @@
 cs_prctl_test
+cs_dl_server_test
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee9213557a..fa50d1385bd68 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -8,7 +8,7 @@ CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
 	  $(CLANG_FLAGS)
 LDLIBS += -lpthread
 
-TEST_GEN_FILES := cs_prctl_test
-TEST_PROGS := cs_prctl_test
+TEST_GEN_FILES := cs_prctl_test cs_dl_server_test
+TEST_PROGS := cs_prctl_test cs_dl_server_test
 
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/config b/tools/testing/selftests/sched/config
index 1bb8bf6d7fd4c..57b2439f75eed 100644
--- a/tools/testing/selftests/sched/config
+++ b/tools/testing/selftests/sched/config
@@ -1 +1,3 @@
-# empty
+CONFIG_SCHED_CORE=y
+CONFIG_SCHED_SMT=y
+CONFIG_DEBUG_FS=y
diff --git a/tools/testing/selftests/sched/cs_dl_server_test.c b/tools/testing/selftests/sched/cs_dl_server_test.c
new file mode 100644
index 0000000000000..38aa005080f1f
--- /dev/null
+++ b/tools/testing/selftests/sched/cs_dl_server_test.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that core-scheduling forced idle does not starve the fair deadline
+ * server.
+ *
+ * A CPU is forced idle when it has runnable tasks of its own but its SMT
+ * sibling runs a task with an incompatible core-sched cookie. If that time is
+ * charged to the rq's deferred DL servers, the fair server's runtime drains
+ * while it is throttled, its activation is pushed out every period, and the
+ * CFS tasks it reserves bandwidth for get next to nothing.
+ *
+ * The test pins a cookied SCHED_FIFO spinner to one SMT sibling and an
+ * uncookied CFS spinner to the other, so the second sibling is forced idle
+ * whenever the FIFO task runs, and checks that the CFS task still gets a
+ * sensible fraction of the fair server's reservation.
+ *
+ * Copyright (c) 2026 Amazon.com, Inc. or its affiliates.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <limits.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef PR_SCHED_CORE
+#define PR_SCHED_CORE			62
+#define PR_SCHED_CORE_GET		0
+#define PR_SCHED_CORE_CREATE		1 /* create unique core_sched cookie */
+#define PR_SCHED_CORE_SHARE_TO		2 /* push core_sched cookie to pid */
+#define PR_SCHED_CORE_SHARE_FROM	3 /* pull core_sched cookie to pid */
+#define PR_SCHED_CORE_MAX		4
+#endif
+
+enum pid_type {PIDTYPE_PID = 0, PIDTYPE_TGID, PIDTYPE_PGID};
+
+#define SIBLINGS_LIST	"/sys/devices/system/cpu/cpu0/topology/thread_siblings_list"
+#define FAIR_SERVER	"/sys/kernel/debug/sched/fair_server"
+
+#define RUN_TIME	5	/* measurement window, in seconds */
+#define FIFO_PRIO	50
+
+/*
+ * The reservation is only approached, not reached: every slice the fair server
+ * gets costs the sibling a forced-idle hand-over, and the core-wide pick runs
+ * at tick granularity. Ask for half of it, which is far above the few hundredths
+ * of a percent a starved server leaves.
+ */
+#define MIN_SHARE_OF_RESERVATION	0.5
+
+/* Status a spinner child reports to the parent over its readiness pipe. */
+#define CHILD_READY	'R'
+#define CHILD_EPERM	'P'
+#define CHILD_ERROR	'E'
+
+/* Tell the parent how setup went; it decides whether to run or to skip. */
+static void signal_status(int fd, char status)
+{
+	if (write(fd, &status, 1) != 1) {
+		ksft_perror("write to readiness pipe");
+		exit(1);
+	}
+	if (status != CHILD_READY)
+		exit(1);
+}
+
+/*
+ * Burn CPU until killed. A constant controlling expression keeps the compiler
+ * from removing the loop, so no volatile is needed to hold it in place.
+ */
+static void spin_forever(void)
+{
+	while (1)
+		;
+}
+
+static int set_affinity(int cpu)
+{
+	cpu_set_t mask;
+
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+
+	return sched_setaffinity(0, sizeof(mask), &mask);
+}
+
+/*
+ * Read the first two distinct CPU ids out of a cpu list such as "0-1", "0,4"
+ * or "0,4-5". Returns 0 on success, -1 if the list holds fewer than two ids.
+ */
+static int parse_sibling_pair(const char *list, int *sib0, int *sib1)
+{
+	int found = 0, sib[2] = { -1, -1 };
+	const char *p = list;
+
+	while (*p && found < 2) {
+		int first, last, n = 0;
+
+		if (sscanf(p, "%d-%d%n", &first, &last, &n) != 2) {
+			if (sscanf(p, "%d%n", &first, &n) != 1)
+				return -1;
+			last = first;
+		}
+		for (; first <= last && found < 2; first++)
+			sib[found++] = first;
+		p += n;
+		if (*p != ',')
+			break;
+		p++;
+	}
+
+	if (found < 2)
+		return -1;
+
+	*sib0 = sib[0];
+	*sib1 = sib[1];
+
+	return 0;
+}
+
+static int read_sibling_pair(int *sib0, int *sib1)
+{
+	char list[256];
+	FILE *f;
+	char *s;
+
+	f = fopen(SIBLINGS_LIST, "r");
+	if (!f)
+		return -1;
+	s = fgets(list, sizeof(list), f);
+	fclose(f);
+	if (!s)
+		return -1;
+
+	return parse_sibling_pair(list, sib0, sib1);
+}
+
+static int read_u64_file(const char *path, unsigned long long *val)
+{
+	FILE *f;
+	int ret;
+
+	f = fopen(path, "r");
+	if (!f)
+		return -1;
+	ret = fscanf(f, "%llu", val);
+	fclose(f);
+
+	return ret == 1 ? 0 : -1;
+}
+
+/* Read the fair server reservation of @cpu, in nanoseconds. */
+static int read_fair_server(int cpu, unsigned long long *runtime,
+			    unsigned long long *period)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), FAIR_SERVER "/cpu%d/runtime", cpu);
+	if (read_u64_file(path, runtime))
+		return -1;
+
+	snprintf(path, sizeof(path), FAIR_SERVER "/cpu%d/period", cpu);
+	if (read_u64_file(path, period))
+		return -1;
+
+	return 0;
+}
+
+/* CPU time consumed by @pid so far, in seconds, from /proc/<pid>/stat. */
+static double process_runtime(pid_t pid)
+{
+	char path[PATH_MAX];
+	unsigned long utime, stime;
+	FILE *f;
+	int fields;
+
+	snprintf(path, sizeof(path), "/proc/%d/stat", pid);
+	f = fopen(path, "r");
+	if (!f)
+		return -1;
+
+	/* Skip the first 13 fields and read the 14th and 15th. */
+	fields = fscanf(f, "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u %lu %lu",
+			&utime, &stime);
+	fclose(f);
+	if (fields != 2)
+		return -1;
+
+	return (double)(utime + stime) / sysconf(_SC_CLK_TCK);
+}
+
+static double monotonic_now(void)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_MONOTONIC, &ts))
+		return -1;
+
+	return ts.tv_sec + ts.tv_nsec / 1000000000.0;
+}
+
+/*
+ * Diagnostic only: how long the FIFO task's CPU was forced idle. Needs
+ * CONFIG_SCHEDSTATS and schedstats enabled, so it must not gate the result.
+ */
+static void print_forced_idle(pid_t pid)
+{
+	char path[PATH_MAX], line[256];
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/%d/sched", pid);
+	f = fopen(path, "r");
+	if (!f)
+		return;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (strstr(line, "core_forceidle_sum")) {
+			line[strcspn(line, "\n")] = '\0';
+			ksft_print_msg("FIFO task %s\n", line);
+			break;
+		}
+	}
+	fclose(f);
+}
+
+/* Cookied SCHED_FIFO spinner. Only this task gets a cookie. */
+static void fifo_child(int cpu, int ready_fd)
+{
+	struct sched_param param = { .sched_priority = FIFO_PRIO };
+
+	if (set_affinity(cpu)) {
+		ksft_perror("FIFO child sched_setaffinity");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PID, 0)) {
+		ksft_perror("FIFO child PR_SCHED_CORE_CREATE");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	if (sched_setscheduler(0, SCHED_FIFO, &param)) {
+		if (errno == EPERM)
+			signal_status(ready_fd, CHILD_EPERM);
+		ksft_perror("FIFO child sched_setscheduler");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	signal_status(ready_fd, CHILD_READY);
+	spin_forever();
+}
+
+/* Uncookied CFS spinner on the FIFO task's SMT sibling. */
+static void cfs_child(int cpu, int ready_fd)
+{
+	if (set_affinity(cpu)) {
+		ksft_perror("CFS child sched_setaffinity");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	signal_status(ready_fd, CHILD_READY);
+	spin_forever();
+}
+
+static char wait_ready(int fd)
+{
+	char status;
+
+	if (read(fd, &status, 1) != 1) {
+		ksft_perror("read from readiness pipe");
+		return CHILD_ERROR;
+	}
+
+	return status;
+}
+
+static void kill_child(pid_t *pid)
+{
+	if (*pid <= 0)
+		return;
+	kill(*pid, SIGKILL);
+	waitpid(*pid, NULL, 0);
+	*pid = -1;
+}
+
+int main(void)
+{
+	double fifo_runtime, cfs_start, cfs_end, t_start, t_end, share, want;
+	unsigned long long runtime, period;
+	pid_t fifo_pid = -1, cfs_pid = -1;
+	int fifo_ready[2], cfs_ready[2];
+	unsigned long long cookie;
+	int sib0, sib1;
+	char status;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (read_sibling_pair(&sib0, &sib1)) {
+		ksft_test_result_skip("CPU0 has no SMT sibling\n");
+		ksft_finished();
+	}
+	ksft_print_msg("SMT siblings: CPU%d (FIFO) and CPU%d (CFS)\n", sib0, sib1);
+
+	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, 0, PIDTYPE_PID,
+		  (unsigned long)&cookie)) {
+		ksft_test_result_skip("core scheduling unavailable: %s\n",
+				      strerror(errno));
+		ksft_finished();
+	}
+
+	if (read_fair_server(sib1, &runtime, &period)) {
+		ksft_test_result_skip("cannot read " FAIR_SERVER "/cpu%d, debugfs not mounted?\n",
+				      sib1);
+		ksft_finished();
+	}
+	if (!runtime || !period) {
+		ksft_test_result_skip("fair server on CPU%d is disabled (%llu/%llu)\n",
+				      sib1, runtime, period);
+		ksft_finished();
+	}
+	ksft_print_msg("CPU%d fair server reservation: %llu/%llu ns = %.3f%%\n",
+		       sib1, runtime, period, 100.0 * runtime / period);
+
+	if (pipe(fifo_ready) || pipe(cfs_ready))
+		ksft_exit_fail_perror("pipe");
+
+	fifo_pid = fork();
+	if (!fifo_pid) {
+		close(fifo_ready[0]);
+		close(cfs_ready[0]);
+		close(cfs_ready[1]);
+		fifo_child(sib0, fifo_ready[1]);
+	} else if (fifo_pid < 0) {
+		ksft_exit_fail_perror("fork FIFO child");
+	}
+	close(fifo_ready[1]);
+
+	status = wait_ready(fifo_ready[0]);
+	close(fifo_ready[0]);
+	if (status != CHILD_READY) {
+		kill_child(&fifo_pid);
+		close(cfs_ready[0]);
+		close(cfs_ready[1]);
+		if (status == CHILD_EPERM) {
+			ksft_test_result_skip("need privileges for SCHED_FIFO\n");
+			ksft_finished();
+		}
+		ksft_exit_fail_msg("FIFO child setup failed\n");
+	}
+
+	cfs_pid = fork();
+	if (!cfs_pid) {
+		close(cfs_ready[0]);
+		cfs_child(sib1, cfs_ready[1]);
+	} else if (cfs_pid < 0) {
+		kill_child(&fifo_pid);
+		ksft_exit_fail_perror("fork CFS child");
+	}
+	close(cfs_ready[1]);
+
+	status = wait_ready(cfs_ready[0]);
+	close(cfs_ready[0]);
+	if (status != CHILD_READY) {
+		kill_child(&cfs_pid);
+		kill_child(&fifo_pid);
+		ksft_exit_fail_msg("CFS child setup failed\n");
+	}
+
+	cfs_start = process_runtime(cfs_pid);
+	t_start = monotonic_now();
+	sleep(RUN_TIME);
+	t_end = monotonic_now();
+	cfs_end = process_runtime(cfs_pid);
+	fifo_runtime = process_runtime(fifo_pid);
+
+	print_forced_idle(fifo_pid);
+	kill_child(&cfs_pid);
+	kill_child(&fifo_pid);
+
+	if (cfs_start < 0 || cfs_end < 0 || fifo_runtime < 0)
+		ksft_exit_fail_msg("cannot read /proc/<pid>/stat\n");
+	if (t_start < 0 || t_end <= t_start)
+		ksft_exit_fail_msg("cannot read CLOCK_MONOTONIC\n");
+
+	share = (cfs_end - cfs_start) / (t_end - t_start);
+	want = MIN_SHARE_OF_RESERVATION * runtime / period;
+
+	ksft_print_msg("FIFO task ran %.3fs, CFS task ran %.3fs over %.3fs\n",
+		       fifo_runtime, cfs_end - cfs_start, t_end - t_start);
+	ksft_print_msg("CFS share of CPU%d: %.3f%%, need %.3f%%\n",
+		       sib1, share * 100, want * 100);
+
+	ksft_test_result(share >= want,
+			 "CFS task gets the fair server reservation while forced idle\n");
+
+	ksft_finished();
+}
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

