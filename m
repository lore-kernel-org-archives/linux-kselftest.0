Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253754;
	b=Tpua+IyhSZOAhv0GNY+J/hAQH/qj29hwTLUTOHoKOXLT94ewCHfFLCTPOUQKgvAd2tWG
	 ekZsjB1SwzB92H1GsLH/0wft1f2m/4s4DLU5353rCIGngcXShjI09bX7LT6UoXHKei3Si
	 +XsW+8uWLnb0WjZeyUpL+vfm2uLn/Z4Ba6/oajql2nF9EkTAFdfR2X9eh/FqWrKdC1hTf
	 dGAV423dP5z4QOFaxax3IZssMpOcqBM9nWi2cPK+s0P5ZlfMAOWmMsSxoDZ3mLhvO+Fyv
	 9c+xi7bgxrhVMxOHv+oy/F0Ovsi0sar4uwkjf5fiQ+JmntZTro+4tjWuaULo885Cbng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253754;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=LmNG9yqWY46aVdLCUl0K0WjeEVPwIsr6NqQ/UlT5QLI=;
	b=gyvpI5bvC+qasRI8uk8oa3ZlYY+6psLC1AZegJjnKuRzZdUei0We19wL9AomzgXW3ZN7
	 3z9V2/ja6wYGmIXp/prZZJDrpkJ+MLZnMUrUo2MfkK6TiwczGnt/gFrucljBPt9sKum9K
	 UfJLhQRsETnX592HuU2XVOCGPHbjxDCTal8tcaBfgf71uXEot/EibQaFXNOWKpRBQNQAN
	 bv2y/FbPB3z5Z1iJNdQAYsPc+CvWDD7cqm1iLnv1OlbzkjRlYvzrlpPa+UvGPl+kj4dEM
	 tEZ44IwpemSuuxy8cKzK+dLz5tkXj5yJMF0X9lwyPQUZdGPOqYfI6O/uJCg+MrKQXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=CG8Ef2Mq;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8960A2600;
	Mon,  9 Nov 2026 19:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D8960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=CG8Ef2Mq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794253753; x=1825789753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LmNG9yqWY46aVdLCUl0K0WjeEVPwIsr6NqQ/UlT5QLI=;
  b=CG8Ef2MqYcovZ3Z+DzC6MzW79TkxcIo4I8+V9I9YdlcD29E0CveuzxjN
   kv1H/KYNGJj2EQckCd2iwh9Jnce4OqfqgLyw0V6MxWuUwoNpWcBv383vh
   kngfQ+UBH0lqUHs9vpIKd3jTaQgcSKXb9iIbu4i+z/Ls4fxYwUxpRufVm
   DUjS7U4r+HiSQERqdtg1pwLTsmOD4oQ4VDazHUQWH4xjXJz20MaVtLrQL
   6HrEGhQ1il98K/csp2QjyeAUAnvt0KBrUYh6CO2Uq3YBZKIZ0qtHllBT/
   ScnAMki0Jf33whnBjSHS6p8tUsBPi/ts4yxTVSKzPEZkXT5He9kVlN2FR
   Q==;
X-CSE-ConnectionGUID: lhoviu8CRm6FiTAluz1Jsg==
X-CSE-MsgGUID: wBTDYIDgRhy08DtyqVU5/A==
X-IronPort-AV: E=Sophos;i="6.27,204,1787011200"; 
   d="scan'208";a="33580596"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:49:10 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:23013]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id 7d69a971-86ad-4f50-89c9-4544467fff3f; Mon, 9 Nov 2026 19:49:10 +0000 (UTC)
X-Farcaster-Flow-ID: 7d69a971-86ad-4f50-89c9-4544467fff3f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 19:49:09 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Mon, 9 Nov 2026
 19:49:07 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <shuah@kernel.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<nh-open-source@amazon.com>, <hborghor@amazon.de>, <fmubeen@amazon.de>,
	<dwmw@amazon.co.uk>
Subject: [PATCH 2/2] selftests/sched: Add a core scheduling rescheduling IPI test
Date: Mon, 9 Nov 2026 21:48:27 +0200
Message-ID: <20261109194827.87349-3-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109194827.87349-1-sieberf@amazon.com>
References: <20261109194827.87349-1-sieberf@amazon.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A core wide pick runs pick_task() on every sibling of the core, so
update_curr() runs on a remote runqueue and can reschedule it, which costs
a rescheduling IPI. Two siblings whose current entity has lost its slice
protection and never gets it back then trade those IPIs for as long as
both stay busy.

Add a test that counts them. It takes one SMT pair, gives its process
group a cookie, runs two spinners on each sibling - update_curr() returns
early while cfs_rq->h_nr_queued == 1 - and reads the rescheduling row of
/proc/interrupts around a five second window. A kernel that renews the
protection on a repick stays near 240 IPIs/CPU/s, one that does not
reaches thousands; the test fails above 1000.

The symptom needs an eager remote reschedule, so the test first checks
that preempting a task on a remote CPU costs an IPI at all and skips if it
does not, as it will under CONFIG_PREEMPT_LAZY=y. It also skips without an
SMT pair or without CONFIG_SCHED_CORE.

Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 tools/testing/selftests/sched/.gitignore      |   1 +
 tools/testing/selftests/sched/Makefile        |   4 +-
 tools/testing/selftests/sched/config          |   2 +-
 .../selftests/sched/cs_resched_ipi_test.c     | 377 ++++++++++++++++++
 4 files changed, 381 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched/cs_resched_ipi_test.c

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftests/sched/.gitignore
index 6996d4654d924..c4e31a7e0893b 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1 +1,2 @@
 cs_prctl_test
+cs_resched_ipi_test
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee9213557a..9d11ed38b3473 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -8,7 +8,7 @@ CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
 	  $(CLANG_FLAGS)
 LDLIBS += -lpthread
 
-TEST_GEN_FILES := cs_prctl_test
-TEST_PROGS := cs_prctl_test
+TEST_GEN_FILES := cs_prctl_test cs_resched_ipi_test
+TEST_PROGS := cs_prctl_test cs_resched_ipi_test
 
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/config b/tools/testing/selftests/sched/config
index 1bb8bf6d7fd4c..cc3f25e8f01b5 100644
--- a/tools/testing/selftests/sched/config
+++ b/tools/testing/selftests/sched/config
@@ -1 +1 @@
-# empty
+CONFIG_SCHED_CORE=y
diff --git a/tools/testing/selftests/sched/cs_resched_ipi_test.c b/tools/testing/selftests/sched/cs_resched_ipi_test.c
new file mode 100644
index 0000000000000..d38fd6b200fcd
--- /dev/null
+++ b/tools/testing/selftests/sched/cs_resched_ipi_test.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Core scheduling must not make two SMT siblings trade rescheduling IPIs while
+ * both of them keep running the same CPU-bound task.
+ *
+ * When a core has a cookie, pick_next_task() does a core wide pick, which runs
+ * pick_task() - and with it update_curr() - on every sibling's runqueue. If
+ * update_curr() finds the sibling's current entity past its protected period it
+ * reschedules that sibling remotely, which is a real IPI. A sibling that picks
+ * the same task again has to renew the protected period; if it does not, the
+ * next core wide pick reschedules it again and the two siblings ping-pong
+ * rescheduling IPIs for as long as the load lasts.
+ *
+ * The test puts two spinners on each sibling of one SMT pair, because
+ * update_curr() returns early while cfs_rq->h_nr_queued == 1, gives the process
+ * group a cookie, and counts the rescheduling IPIs both siblings take.
+ *
+ * It only means something on a kernel whose remote reschedule really sends an
+ * IPI. Under CONFIG_PREEMPT_LAZY=y resched_curr_lazy() asks for
+ * TIF_NEED_RESCHED_LAZY and __resched_curr() sends no IPI, so the bug has no
+ * IPI symptom there. Rather than guess the preemption model from uname or from
+ * a config file, the test probes for it: it has one task preempt a running task
+ * on a remote CPU and skips unless that is seen to cost an IPI.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <limits.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef PR_SCHED_CORE
+#define PR_SCHED_CORE			62
+#define PR_SCHED_CORE_GET		0
+#define PR_SCHED_CORE_CREATE		1
+#endif
+
+/* enum pid_type, not exported to userspace */
+#define PIDTYPE_PID			0
+#define PIDTYPE_PGID			2
+
+#define SPINNERS_PER_CPU		2
+#define MEASURE_SECS			5
+#define SETTLE_USECS			500000
+#define PROBE_WAKEUPS			200
+#define PROBE_GAP_USECS			2000
+
+/*
+ * A kernel that renews the protected period on a repick still reschedules a
+ * sibling once per real task switch, so the limit has to sit above that:
+ * measured 233-247 IPIs/CPU/s with the renewal and 554-3819 without it, on
+ * HZ=250 and HZ=1000 kernels under the same load, and ~3200 against ~3 on a
+ * two socket Xeon.
+ */
+#define IPI_RATE_LIMIT			1000
+
+#define CPU_PATH			"/sys/devices/system/cpu"
+#define RESCHED_ROW			"Rescheduling interrupts"
+
+struct irq_counts {
+	unsigned long resched[CPU_SETSIZE];
+	int ncols;
+};
+
+static pid_t spinners[2 * SPINNERS_PER_CPU];
+static int nr_spinners;
+
+static void add_row(char *line, const int *cpu_of_col, int ncols, unsigned long *out)
+{
+	char *tok, *save;
+	int col = 0;
+
+	tok = strchr(line, ':');
+	if (!tok)
+		return;
+
+	for (tok = strtok_r(tok + 1, " \t\n", &save); tok && col < ncols;
+	     tok = strtok_r(NULL, " \t\n", &save)) {
+		if (*tok < '0' || *tok > '9')
+			break;
+		out[cpu_of_col[col++]] += strtoul(tok, NULL, 10);
+	}
+}
+
+/*
+ * Sample the rescheduling IPI counters, indexed by CPU number.
+ * The header row of /proc/interrupts names the columns, which are the online
+ * CPUs in order, so an offline CPU does not shift the mapping. Both x86 ("RES")
+ * and arm64 ("IPI0") spell the rescheduling IPI out in the trailing
+ * description, which is what we match on.
+ */
+static int sample_irqs(struct irq_counts *c)
+{
+	int cpu_of_col[CPU_SETSIZE];
+	char *line = NULL;
+	size_t len = 0;
+	int ncols = 0;
+	FILE *f;
+
+	memset(c, 0, sizeof(*c));
+
+	f = fopen("/proc/interrupts", "re");
+	if (!f)
+		return -1;
+
+	while (getline(&line, &len, f) > 0) {
+		if (!ncols) {
+			char *tok, *save;
+			int cpu;
+
+			for (tok = strtok_r(line, " \t\n", &save); tok;
+			     tok = strtok_r(NULL, " \t\n", &save)) {
+				if (strncmp(tok, "CPU", 3))
+					break;
+				cpu = atoi(tok + 3);
+				if (cpu < 0 || cpu >= CPU_SETSIZE || ncols == CPU_SETSIZE)
+					break;
+				cpu_of_col[ncols++] = cpu;
+			}
+			continue;
+		}
+
+		if (strstr(line, RESCHED_ROW))
+			add_row(line, cpu_of_col, ncols, c->resched);
+	}
+
+	free(line);
+	fclose(f);
+
+	c->ncols = ncols;
+	return ncols ? 0 : -1;
+}
+
+static double elapsed_since(const struct timespec *t0)
+{
+	struct timespec t1;
+
+	clock_gettime(CLOCK_MONOTONIC, &t1);
+	return (t1.tv_sec - t0->tv_sec) + (t1.tv_nsec - t0->tv_nsec) / 1e9;
+}
+
+static void pin_to(int cpu)
+{
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	if (sched_setaffinity(0, sizeof(set), &set))
+		ksft_exit_fail_perror("sched_setaffinity");
+}
+
+static int read_first_line(const char *path, char *buf, size_t len)
+{
+	FILE *f = fopen(path, "re");
+
+	if (!f)
+		return -1;
+	if (!fgets(buf, len, f)) {
+		fclose(f);
+		return -1;
+	}
+	fclose(f);
+	return 0;
+}
+
+/*
+ * Return a pair of online SMT siblings, or false if the machine has none.
+ * thread_siblings_list only exists for online CPUs, and names only online
+ * siblings, so a readable file with two entries is a usable pair.
+ */
+static bool find_smt_pair(int *cpu_a, int *cpu_b)
+{
+	char path[PATH_MAX], buf[256];
+	int cpu, a, b;
+
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
+		snprintf(path, sizeof(path), "%s/cpu%d/topology/thread_siblings_list",
+			 CPU_PATH, cpu);
+		if (read_first_line(path, buf, sizeof(buf)))
+			continue;
+		if (sscanf(buf, "%d%*[,-]%d", &a, &b) != 2 || a == b)
+			continue;
+		if (a >= CPU_SETSIZE || b >= CPU_SETSIZE)
+			continue;
+		*cpu_a = a;
+		*cpu_b = b;
+		return true;
+	}
+
+	return false;
+}
+
+static void spinner(int cpu)
+{
+	unsigned long x = 0;
+
+	pin_to(cpu);
+	for (;;) {
+		x++;
+		asm volatile("" ::: "memory");
+	}
+}
+
+static void spinners_start(int cpu, int nr)
+{
+	pid_t pid;
+	int i;
+
+	for (i = 0; i < nr; i++) {
+		pid = fork();
+		if (pid < 0)
+			ksft_exit_fail_perror("fork");
+		if (!pid) {
+			spinner(cpu);
+			_exit(EXIT_FAILURE);
+		}
+		spinners[nr_spinners++] = pid;
+	}
+}
+
+static void spinners_stop(void)
+{
+	while (nr_spinners--) {
+		kill(spinners[nr_spinners], SIGKILL);
+		waitpid(spinners[nr_spinners], NULL, 0);
+	}
+	nr_spinners = 0;
+}
+
+/* Rescheduling IPIs per CPU per second taken by the pair over the window */
+static double measure(int cpu_a, int cpu_b, int secs)
+{
+	struct irq_counts before, after;
+	struct timespec t0;
+	double secs_run;
+
+	usleep(SETTLE_USECS);
+
+	if (sample_irqs(&before))
+		ksft_exit_fail_msg("cannot read %s from /proc/interrupts\n", RESCHED_ROW);
+	clock_gettime(CLOCK_MONOTONIC, &t0);
+	sleep(secs);
+	secs_run = elapsed_since(&t0);
+	if (sample_irqs(&after) || after.ncols != before.ncols)
+		ksft_exit_fail_msg("/proc/interrupts changed shape mid-test\n");
+
+	return (after.resched[cpu_a] - before.resched[cpu_a] +
+		after.resched[cpu_b] - before.resched[cpu_b]) / 2.0 / secs_run;
+}
+
+/*
+ * Does preempting a running task on a remote CPU cost a rescheduling IPI on
+ * this kernel? Wake a task pinned to a busy cpu_a from cpu_b, repeatedly, and
+ * count what cpu_a takes. A sibling of cpu_a shares its cache, so the wakeup is
+ * an enqueue on cpu_a's runqueue and not a queued remote call. On an eager
+ * kernel every wakeup preempts the spinner and costs an IPI; under
+ * CONFIG_PREEMPT_LAZY=y it sets a flag on cpu_a and costs none.
+ */
+static bool remote_preempt_sends_ipi(int cpu_a, int cpu_b)
+{
+	struct irq_counts before, after;
+	unsigned long ipis;
+	int fd[2], i;
+	pid_t pid;
+	char c = 0;
+
+	if (pipe(fd))
+		ksft_exit_fail_perror("pipe");
+
+	pid = fork();
+	if (pid < 0)
+		ksft_exit_fail_perror("fork");
+	if (!pid) {
+		close(fd[1]);
+		pin_to(cpu_a);
+		while (read(fd[0], &c, 1) == 1)
+			;
+		_exit(EXIT_SUCCESS);
+	}
+	close(fd[0]);
+
+	pin_to(cpu_b);
+	spinners_start(cpu_a, 1);
+	usleep(SETTLE_USECS);
+
+	if (sample_irqs(&before))
+		ksft_exit_fail_msg("cannot read %s from /proc/interrupts\n", RESCHED_ROW);
+	for (i = 0; i < PROBE_WAKEUPS; i++) {
+		if (write(fd[1], &c, 1) != 1)
+			ksft_exit_fail_perror("write");
+		usleep(PROBE_GAP_USECS);
+	}
+	if (sample_irqs(&after))
+		ksft_exit_fail_msg("cannot read %s from /proc/interrupts\n", RESCHED_ROW);
+
+	spinners_stop();
+	close(fd[1]);
+	kill(pid, SIGKILL);
+	waitpid(pid, NULL, 0);
+
+	ipis = after.resched[cpu_a] - before.resched[cpu_a];
+	ksft_print_msg("%lu rescheduling IPIs on cpu%d for %d remote preemptions\n",
+		       ipis, cpu_a, PROBE_WAKEUPS);
+
+	return ipis >= PROBE_WAKEUPS / 4;
+}
+
+int main(void)
+{
+	double baseline, rate;
+	unsigned long long cookie = 0;
+	cpu_set_t all;
+	int cpu_a, cpu_b;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (atexit(spinners_stop))
+		ksft_exit_fail_perror("atexit");
+
+	if (sched_getaffinity(0, sizeof(all), &all))
+		ksft_exit_fail_perror("sched_getaffinity");
+
+	if (!find_smt_pair(&cpu_a, &cpu_b))
+		ksft_exit_skip("no online SMT sibling pair\n");
+	ksft_print_msg("SMT pair cpu%d/cpu%d\n", cpu_a, cpu_b);
+
+	if (!CPU_ISSET(cpu_a, &all) || !CPU_ISSET(cpu_b, &all))
+		ksft_exit_skip("cpu%d/cpu%d not in our affinity mask\n", cpu_a, cpu_b);
+
+	if (!remote_preempt_sends_ipi(cpu_a, cpu_b))
+		ksft_exit_skip("remote preemption sends no IPI, needs CONFIG_PREEMPT_LAZY=n\n");
+
+	if (sched_setaffinity(0, sizeof(all), &all))
+		ksft_exit_fail_perror("sched_setaffinity");
+
+	/* same load without a cookie: nothing here should reschedule a sibling */
+	spinners_start(cpu_a, SPINNERS_PER_CPU);
+	spinners_start(cpu_b, SPINNERS_PER_CPU);
+	baseline = measure(cpu_a, cpu_b, MEASURE_SECS);
+	spinners_stop();
+
+	ksft_print_msg("%.1f IPIs/CPU/s without a cookie\n", baseline);
+	if (baseline > IPI_RATE_LIMIT)
+		ksft_exit_skip("%.1f IPIs/CPU/s before core scheduling is even on\n", baseline);
+
+	/* our own group, so that the cookie does not reach the test harness */
+	if (setpgid(0, 0))
+		ksft_exit_fail_perror("setpgid");
+	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PGID, 0))
+		ksft_exit_skip("PR_SCHED_CORE_CREATE: %s, needs CONFIG_SCHED_CORE=y\n",
+			       strerror(errno));
+	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, 0, PIDTYPE_PID,
+		  (unsigned long)&cookie) || !cookie)
+		ksft_exit_fail_msg("no cookie after PR_SCHED_CORE_CREATE\n");
+
+	spinners_start(cpu_a, SPINNERS_PER_CPU);
+	spinners_start(cpu_b, SPINNERS_PER_CPU);
+	rate = measure(cpu_a, cpu_b, MEASURE_SECS);
+	spinners_stop();
+
+	ksft_print_msg("%d cookied spinners per sibling: %.1f IPIs/CPU/s\n",
+		       SPINNERS_PER_CPU, rate);
+	ksft_test_result(rate <= IPI_RATE_LIMIT,
+			 "cookied SMT siblings keep below %d IPIs/CPU/s\n", IPI_RATE_LIMIT);
+
+	ksft_finished();
+}
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

