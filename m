Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.26.1.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172325;
	b=mn/OFk9Lg4Hp2zvtnvSIH/zvkD7W4iVm1oxEM1sVIB7RGdS+kZnpIvYc1QhgPS9xqzj2
	 u5IJpgRy6+PffswOvbB9gsvxeJlZpjCU+Jq+1PHSh+wd0IIvLIkndfby1dCYkXgeo7uhH
	 VCIbl4b3kiC8v/AKDm0Ep2hzeDR1GbeR9SUHh+3qhLgWXs60LKQ3SS+khs0UvD51kxE+T
	 yTAQt4SpMWNoqyGtqydK/y4WXHA1YGGG1immMrq3+lTRdNOnoNSNMNX+zzr6Wo9q9cIbC
	 zzmUdcr7x2iCy0je1k9Bwayhx86IjBfhu7KFnWC+VePWdfqFRXdJU9x52+qkPkvzJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172325;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=/GdB+hPmJdVyly3Aq4N8nB9EkYS610bbhVNQbIYf4jg=;
	b=MM2K/KDzKGTwg36bfXfLU/iCQNJ5ZDuqaus/yMTTGJa4rIV5JtgGam1Ejgyb+f1YM8/k
	 cOzyRNQSj550gQV64gDzp505a8y2F4+KAkrrTpBuglXUDpCATzjVt+C2AMwQKuLnOOUdU
	 pZMv8zmz7tnrcg1Ex0iW9oNGRBDpRabMpn+mnSXY54wjtNZ/iotkZip6/qnLRtxEMsQ1h
	 R3mxl7wiXwlgEGk6o6j+LrSV4akYp/pijT2GJNHSNXfyDZr7pIdDl/Z1l374LWhZv4iIY
	 5vhrPaOhGGHgol5Jn7UBcplED+GiX4idQuZmS0NZP6AY5D64BGS+ONfzdPFkHqAOP8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=G4IeKBQG;
	arc=none smtp.remote-ip=52.26.1.71
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AE606A325;
	Fri, 20 Nov 2026 10:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=G4IeKBQG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795172324; x=1826708324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/GdB+hPmJdVyly3Aq4N8nB9EkYS610bbhVNQbIYf4jg=;
  b=G4IeKBQGyf7U/t1fu1RX7ZrSLrjSMOr69Guk+RWa35HVHj6Hm/BLMWUQ
   WZ21A3PYcUBq+zhuE1/M+wDUmzimQcp9znpIMNBwIad4lnBbc1UKvVWSO
   JSTfbSfakyXHNfgwrRoplGHCiaU8OwcHLnPxfRM4JCWBuGxS20os9vRqX
   d0mXsoCpY+9Vo+ygMks4VTLu1DN5akQqY4CPR58PFcc9frcu+CNthcef4
   OMJsxuUKlkHWgjPNCEC8kej5EZxmwXBexw3KYnR+oWACDE+Tz3tmqMTiM
   Ttfal32PcxPHz/TniFQRb2KiBQBV5dFatLpkT5uyFoUfcVV652692zSdM
   A==;
X-CSE-ConnectionGUID: M3Uavg61TBKHp4RZ8Iv35g==
X-CSE-MsgGUID: GQSHGAqSSlqQ7LUpuYMscw==
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="34737134"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:58:40 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:6368]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.58.48:2525] with esmtp (Farcaster)
 id b15f11a9-390e-422f-babc-b6712df9e1b8; Fri, 20 Nov 2026 10:58:40 +0000 (UTC)
X-Farcaster-Flow-ID: b15f11a9-390e-422f-babc-b6712df9e1b8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 20 Nov 2026 10:58:39 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Fri, 20 Nov 2026
 10:58:37 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>, Shuah Khan
	<shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Fernand Sieber
	<sieberf@amazon.com>, Roman Kagan <rkagan@amazon.de>
Subject: [PATCH v2 3/3] selftests/sched: Add a test for stuck forced idle under core scheduling
Date: Fri, 20 Nov 2026 10:58:22 +0000
Message-ID: <20261120105822.7770-4-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120105822.7770-1-lshahed@amazon.de>
References: <20261120105822.7770-1-lshahed@amazon.de>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add cs_forceidle_test, which checks that a core does not stay forced
idle after the task that a core-wide selection picked for an idle SMT
sibling is migrated away before the sibling schedules, and that the
pick left behind is not used once that task is freed.

On one SMT core, a task with its own cookie yields in a loop on one
sibling. Each attempt wakes a SCHED_FIFO task with another cookie on
the other sibling, so the core-wide selection picks it there and forces
the first sibling idle, and migrates it to a CPU of another core 0-50 us
later. The yielding task must make progress again within 20 ms; an
attempt where it does not counts as a stall, and the first test fails if
there is any.

The woken task also runs in its own cgroup. After a stall the test kills
it, removes its cgroup, waits 100 ms for RCU to free both, and runs a
short-lived task on the sibling. A kernel that kept the freed task in
the sibling's rq->core_pick then charges forced idle time to it and its
cgroup, and crashes in __cgroup_account_cputime_field() or reports a
use-after-free with KASAN. Forced idle time is only accounted with
schedstats, so the test turns them on for its duration if they are off.
This second test is on by default and is skipped with -n, without cgroup
v2, or without schedstats.

The test runs for 30 s by default, -t sets the duration. It is skipped
when not run as root, without an SMT core and two other online CPUs, or
when core scheduling is unavailable. Also list CONFIG_SCHED_CORE in the
config fragment, which cs_prctl_test needs as well.

Signed-off-by: Ibrahim Elshahed <lshahed@amazon.de>
---
 tools/testing/selftests/sched/.gitignore      |   1 +
 tools/testing/selftests/sched/Makefile        |   1 +
 tools/testing/selftests/sched/config          |   2 +-
 .../selftests/sched/cs_forceidle_test.c       | 471 ++++++++++++++++++
 4 files changed, 474 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/sched/cs_forceidle_test.c

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftests/sched/.gitignore
index 6996d4654d92..8a698db51719 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1 +1,2 @@
 cs_prctl_test
+cs_forceidle_test
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee9213557..43e999fa1778 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -10,5 +10,6 @@ LDLIBS += -lpthread
 
 TEST_GEN_FILES := cs_prctl_test
 TEST_PROGS := cs_prctl_test
+TEST_GEN_PROGS := cs_forceidle_test
 
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/config b/tools/testing/selftests/sched/config
index 1bb8bf6d7fd4..cc3f25e8f01b 100644
--- a/tools/testing/selftests/sched/config
+++ b/tools/testing/selftests/sched/config
@@ -1 +1 @@
-# empty
+CONFIG_SCHED_CORE=y
diff --git a/tools/testing/selftests/sched/cs_forceidle_test.c b/tools/testing/selftests/sched/cs_forceidle_test.c
new file mode 100644
index 000000000000..ca89a4633a13
--- /dev/null
+++ b/tools/testing/selftests/sched/cs_forceidle_test.c
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Check that core scheduling does not leave a core forced idle after the
+ * task a core-wide selection picked for an idle SMT sibling is migrated
+ * away before the sibling schedules, and that the pick it leaves behind is
+ * not used once that task is freed.
+ *
+ * On one SMT core with siblings A and B, a task U with its own cookie
+ * yields in a loop on A. Each attempt wakes a SCHED_FIFO task V with
+ * another cookie on B, so that the core-wide selection picks V for B and
+ * forces A idle, then migrates V to a CPU of another core 0-50 us later.
+ * U must make progress again within STALL_MS; an attempt where it does not
+ * is a stall.
+ *
+ * Unless -n is given, each V also runs in its own cgroup. After a stall,
+ * V is killed and its cgroup removed, and once RCU had time to free both,
+ * a short-lived task is run on B. A kernel that kept the migrated V in
+ * B's rq->core_pick then charges forced idle time to the freed task and
+ * cgroup, which crashes it in __cgroup_account_cputime_field() or makes
+ * KASAN report a use-after-free. Forced idle time is only accounted with
+ * schedstats, so the test turns them on for its duration if they are off.
+ * This part is skipped when cgroup v2 is not mounted or schedstats are
+ * unavailable.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef PR_SCHED_CORE
+#define PR_SCHED_CORE			62
+#endif
+#ifndef PR_SCHED_CORE_CREATE
+#define PR_SCHED_CORE_CREATE		1
+#endif
+#define PIDTYPE_PID			0
+
+#define STALL_MS			20
+#define FREE_WAIT_MS			100
+#define DEFAULT_SECS			30
+#define SCHEDSTATS			"/proc/sys/kernel/sched_schedstats"
+#define CG_PATH_MAX			(2 * PATH_MAX + 64)
+
+static uint64_t *progress;
+
+/* cgroup part: parent cgroup of the per-attempt cgroups, if in use */
+static char cg_parent[CG_PATH_MAX];
+static int cg_active;
+static int schedstats_restore = -1;
+
+static uint64_t now_ns(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	return ts.tv_sec * 1000000000ULL + ts.tv_nsec;
+}
+
+static int pin(pid_t pid, int cpu)
+{
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	return sched_setaffinity(pid, sizeof(set), &set);
+}
+
+static int create_cookie(void)
+{
+	return prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PID, 0);
+}
+
+static int write_str(const char *path, const char *val)
+{
+	ssize_t len = strlen(val);
+	int fd, ret;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -1;
+	ret = write(fd, val, len) == len ? 0 : -1;
+	close(fd);
+	return ret;
+}
+
+/* Find an SMT core with two online siblings and two CPUs outside it. */
+static int find_cpus(int *a, int *b, int *helper, int *ctl)
+{
+	long ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+	char path[128];
+	int cpu, s0, s1;
+	FILE *f;
+
+	*a = *b = *helper = *ctl = -1;
+	for (cpu = 0; cpu < ncpus && *a < 0; cpu++) {
+		snprintf(path, sizeof(path),
+			 "/sys/devices/system/cpu/cpu%d/topology/thread_siblings_list",
+			 cpu);
+		f = fopen(path, "r");
+		if (!f)
+			continue;
+		if (fscanf(f, "%d%*[,-]%d", &s0, &s1) == 2 && s0 != s1) {
+			*a = s0;
+			*b = s1;
+		}
+		fclose(f);
+	}
+	if (*a < 0)
+		return -1;
+
+	for (cpu = 0; cpu < ncpus; cpu++) {
+		if (cpu == *a || cpu == *b)
+			continue;
+		if (*helper < 0)
+			*helper = cpu;
+		else if (*ctl < 0)
+			*ctl = cpu;
+	}
+	return *ctl < 0 ? -1 : 0;
+}
+
+/* Probe in a child so this process keeps no cookie. */
+static int core_sched_available(void)
+{
+	int status;
+	pid_t pid;
+
+	pid = fork();
+	if (pid < 0)
+		return 0;
+	if (!pid)
+		_exit(create_cookie() ? 1 : 0);
+	if (waitpid(pid, &status, 0) != pid)
+		return 0;
+	return WIFEXITED(status) && !WEXITSTATUS(status);
+}
+
+static void cg_cleanup(void)
+{
+	if (cg_active)
+		rmdir(cg_parent);
+	if (schedstats_restore >= 0)
+		write_str(SCHEDSTATS, schedstats_restore ? "1" : "0");
+}
+
+/*
+ * Set up the cgroup part: find the cgroup v2 mount and this process's
+ * cgroup in it, create a parent for the per-attempt cgroups below it, and
+ * turn on schedstats. Returns NULL on success or why it is unavailable.
+ */
+static const char *cg_setup(void)
+{
+	char line[PATH_MAX], mnt[PATH_MAX] = "", own[PATH_MAX] = "";
+	char *sep;
+	FILE *f;
+	int val;
+
+	f = fopen("/proc/self/mountinfo", "r");
+	if (!f)
+		return "cannot read /proc/self/mountinfo";
+	while (fgets(line, sizeof(line), f)) {
+		sep = strstr(line, " - ");
+		if (sep && !strncmp(sep + 3, "cgroup2 ", 8) &&
+		    sscanf(line, "%*s %*s %*s %*s %s", mnt) == 1)
+			break;
+		mnt[0] = '\0';
+	}
+	fclose(f);
+	if (!mnt[0])
+		return "cgroup v2 not mounted";
+
+	f = fopen("/proc/self/cgroup", "r");
+	if (!f)
+		return "cannot read /proc/self/cgroup";
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "0::", 3)) {
+			line[strcspn(line, "\n")] = '\0';
+			snprintf(own, sizeof(own), "%s", line + 3);
+			break;
+		}
+	}
+	fclose(f);
+	if (!own[0])
+		return "not in a cgroup v2 cgroup";
+
+	f = fopen(SCHEDSTATS, "r");
+	if (!f)
+		return "schedstats unavailable (CONFIG_SCHEDSTATS=n)";
+	if (fscanf(f, "%d", &val) != 1)
+		val = -1;
+	fclose(f);
+	if (val < 0)
+		return "cannot read " SCHEDSTATS;
+
+	snprintf(cg_parent, sizeof(cg_parent), "%s%s/cs_forceidle_test.%d",
+		 mnt, strcmp(own, "/") ? own : "", getpid());
+	if (mkdir(cg_parent, 0755))
+		return "cannot create a cgroup";
+	cg_active = 1;
+	atexit(cg_cleanup);
+
+	if (!val) {
+		if (write_str(SCHEDSTATS, "1")) {
+			rmdir(cg_parent);
+			cg_active = 0;
+			return "schedstats off and cannot be turned on";
+		}
+		schedstats_restore = 0;
+	}
+	return NULL;
+}
+
+static void run_u(int cpu)
+{
+	if (pin(0, cpu) || create_cookie())
+		_exit(1);
+	for (;;) {
+		sched_yield();
+		__atomic_fetch_add(progress, 1, __ATOMIC_RELAXED);
+	}
+}
+
+static void run_v(int cpu, int ready, int go)
+{
+	struct sched_param sp = { .sched_priority = 50 };
+	uint64_t t0;
+	char c;
+
+	if (create_cookie() || sched_setscheduler(0, SCHED_FIFO, &sp) ||
+	    pin(0, cpu))
+		_exit(1);
+	if (write(ready, "r", 1) != 1 || read(go, &c, 1) != 1)
+		_exit(1);
+	/*
+	 * Run briefly so the migration can catch V runnable, then block: a
+	 * spinning FIFO task would force idle the CPUs it shares a core with.
+	 */
+	t0 = now_ns();
+	while (now_ns() - t0 < 200000)
+		;
+	for (;;)
+		pause();
+}
+
+/* Run a task on @cpu that exits right away, so that @cpu schedules. */
+static void poke(int cpu)
+{
+	pid_t pid;
+
+	pid = fork();
+	if (!pid)
+		_exit(pin(0, cpu) ? 1 : 0);
+	if (pid > 0)
+		waitpid(pid, NULL, 0);
+}
+
+static void cg_remove(const char *cg)
+{
+	int i;
+
+	/* The cgroup can stay busy until the killed task is fully released. */
+	for (i = 0; i < 1000 && rmdir(cg) && errno == EBUSY; i++)
+		usleep(1000);
+}
+
+/*
+ * One attempt; returns 1 on a stall, 0 if U made progress, -1 on error.
+ * Increments @freed when it frees a stalled V and its cgroup.
+ */
+static int attempt(int b, int helper, unsigned int *seed, unsigned long *freed)
+{
+	static unsigned long nr;
+	int ready[2], go[2], stall = 1;
+	uint64_t t0, spin, start;
+	char cg[CG_PATH_MAX + 32], path[CG_PATH_MAX + 64];
+	char pid[16];
+	pid_t v;
+	char c;
+
+	if (pipe(ready))
+		return -1;
+	if (pipe(go)) {
+		close(ready[0]);
+		close(ready[1]);
+		return -1;
+	}
+	if (cg_active) {
+		snprintf(cg, sizeof(cg), "%s/v%lu", cg_parent, nr++);
+		if (mkdir(cg, 0755)) {
+			close(ready[0]);
+			close(ready[1]);
+			close(go[0]);
+			close(go[1]);
+			return -1;
+		}
+	}
+
+	v = fork();
+	if (v < 0) {
+		stall = -1;
+		goto out_pipes;
+	}
+	if (!v) {
+		close(ready[0]);
+		close(go[1]);
+		run_v(b, ready[1], go[0]);
+	}
+	close(ready[1]);
+	close(go[0]);
+
+	if (cg_active) {
+		snprintf(path, sizeof(path), "%s/cgroup.procs", cg);
+		snprintf(pid, sizeof(pid), "%d", v);
+		if (write_str(path, pid)) {
+			stall = -1;
+			goto out;
+		}
+	}
+
+	if (read(ready[0], &c, 1) != 1) {
+		stall = -1;
+		goto out;
+	}
+	usleep(1000);			/* let V block on the pipe */
+
+	spin = (rand_r(seed) % 51) * 1000ULL;
+	if (write(go[1], "w", 1) != 1) {
+		stall = -1;
+		goto out;
+	}
+	t0 = now_ns();
+	while (now_ns() - t0 < spin)
+		;
+	pin(v, helper);
+
+	start = __atomic_load_n(progress, __ATOMIC_RELAXED);
+	t0 = now_ns();
+	while (now_ns() - t0 < STALL_MS * 1000000ULL) {
+		if (__atomic_load_n(progress, __ATOMIC_RELAXED) != start) {
+			stall = 0;
+			break;
+		}
+	}
+out:
+	kill(v, SIGKILL);
+	waitpid(v, NULL, 0);
+	close(ready[0]);
+	close(go[1]);
+	if (cg_active)
+		cg_remove(cg);
+	if (cg_active && stall == 1) {
+		/* Let RCU free V and its cgroup, then make B schedule. */
+		usleep(FREE_WAIT_MS * 1000);
+		poke(b);
+		(*freed)++;
+	}
+	return stall;
+
+out_pipes:
+	close(ready[0]);
+	close(ready[1]);
+	close(go[0]);
+	close(go[1]);
+	if (cg_active)
+		cg_remove(cg);
+	return stall;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned long attempts = 0, stalls = 0, freed = 0;
+	int a, b, helper, ctl, opt, ret = 0;
+	const char *cg_skip = NULL;
+	int secs = DEFAULT_SECS;
+	unsigned int seed;
+	uint64_t end;
+	pid_t u;
+
+	while ((opt = getopt(argc, argv, "nt:")) != -1) {
+		switch (opt) {
+		case 'n':
+			cg_skip = "disabled with -n";
+			break;
+		case 't':
+			secs = atoi(optarg);
+			break;
+		default:
+			fprintf(stderr, "usage: %s [-n] [-t seconds]\n",
+				argv[0]);
+			return KSFT_FAIL;
+		}
+	}
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	if (geteuid())
+		ksft_exit_skip("must be run as root\n");
+	if (find_cpus(&a, &b, &helper, &ctl))
+		ksft_exit_skip("needs an SMT core and two other online CPUs\n");
+	if (!core_sched_available())
+		ksft_exit_skip("core scheduling unavailable\n");
+
+	progress = mmap(NULL, sizeof(*progress), PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (progress == MAP_FAILED)
+		ksft_exit_fail_msg("mmap: %s\n", strerror(errno));
+
+	if (!cg_skip)
+		cg_skip = cg_setup();
+	if (cg_skip)
+		ksft_print_msg("freeing stalled tasks with their cgroups skipped: %s\n",
+			       cg_skip);
+
+	if (pin(0, ctl))
+		ksft_exit_fail_msg("sched_setaffinity: %s\n", strerror(errno));
+
+	u = fork();
+	if (u < 0)
+		ksft_exit_fail_msg("fork: %s\n", strerror(errno));
+	if (!u)
+		run_u(a);
+	usleep(100000);
+
+	ksft_print_msg("core %d,%d, migrate to %d, %d s%s\n", a, b, helper,
+		       secs, cg_active ? ", one cgroup per woken task" : "");
+	seed = getpid();
+	end = now_ns() + (uint64_t)secs * 1000000000ULL;
+	while (now_ns() < end) {
+		ret = attempt(b, helper, &seed, &freed);
+		if (ret < 0)
+			break;
+		attempts++;
+		stalls += ret;
+	}
+
+	kill(u, SIGKILL);
+	waitpid(u, NULL, 0);
+
+	ksft_print_msg("attempts=%lu stalls=%lu (no progress for %d ms)\n",
+		       attempts, stalls, STALL_MS);
+	if (ret < 0)
+		ksft_test_result_fail("attempt failed: %s\n", strerror(errno));
+	else
+		ksft_test_result(!stalls, "no stuck forced idle\n");
+
+	if (cg_skip)
+		ksft_test_result_skip("free a stalled task and its cgroup: %s\n",
+				      cg_skip);
+	else if (ret < 0)
+		ksft_test_result_fail("free a stalled task and its cgroup: attempt failed\n");
+	else
+		ksft_test_result_pass("free a stalled task and its cgroup (%lu freed)\n",
+				      freed);
+	ksft_finished();
+}
-- 
2.47.3

