Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454D3AEF37
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813616; cv=none; b=GzwQtVvbNWgo7vtMEpsKQnmLf3zhkYnn/JGqNdzqW2SDJ+K9t+LFBUvqiDZnxv00I1yiozo2HLRlj5iiIOBGndZAbXLZlkkBb3nnR83xs0z8siC5XXgNK7WOhh6fIdjzHC23RGUohkmgZO7i2jm/8lpceTdZxUP0MsQ9WjSXMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813616; c=relaxed/simple;
	bh=/bidsxXu9CvWMPjW/tUtwL0K6J6dII3HoXBK9F7Km5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwJI3rJ1aoXkfbXjx2orU8JSl3ajeq42FWbNhD3Q1ucH+cV+HW7C+GvU03IxLeb2MT9OLL5aNW/OXNp8CY/vl1RV45Q+OSB/hL5XqPuEROiWCdNxLNVmi1rBs7uXk/hagy8ECm05Wf//KyWxOJH6QvFTwEEeBsU+jjQfggSBBEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=euzjiDwg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="euzjiDwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ylt4OCIDgmiM5S9qcgc4QXEM8ZZkVzorMJ3ZH7qWgQ=;
	b=euzjiDwgIkgdvhvRcGzI9h2tWDeuikaQ6TWnNenCakiW4eKIbQsbUfbWGBJ4K3DolTBmsB
	GG162bzkBbq9ptFONuY66sYizCY3vHHbr1JYlAppqUQX8b3Qr83IqZS2VthRyOdN+iM4zD
	5pFWzCWEEY1Z0SCUxkFJXpAMUVtjayk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-EfuozfBdN0amGDcXGDL7Jw-1; Fri,
 06 Mar 2026 11:13:30 -0500
X-MC-Unique: EfuozfBdN0amGDcXGDL7Jw-1
X-Mimecast-MFC-AGG-ID: EfuozfBdN0amGDcXGDL7Jw_1772813609
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94320180035D;
	Fri,  6 Mar 2026 16:13:28 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F3DB3003EA4;
	Fri,  6 Mar 2026 16:13:24 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 06 Mar 2026 17:10:07 +0100
Subject: [PATCH RFC 2/7] selftests/sched: Add SCHED_DEADLINE utility
 library
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-upstream-deadline-kselftests-v1-2-2b23ef74c46a@redhat.com>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
To: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Valentin Schneider <vschneid@redhat.com>, 
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=20039;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=/bidsxXu9CvWMPjW/tUtwL0K6J6dII3HoXBK9F7Km5U=;
 b=rS2otwo+UDqDqk2Nf71HjWKywF81dS0wcrYaNuR8O1fv6kTMWjBi2Utz+CoDEO74JTyQW6Htv
 bBsOiMjFpwgD+JPJSq9p1B9l/a3doFRByY28KnELM5DaGd8GThi7Sww
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add a comprehensive utility library for SCHED_DEADLINE scheduler tests.
This library provides reusable helper functions that simplify test
implementation and reduce code duplication across the test suite.

The utility library provides scheduling operations that wrap the
sched_setattr and sched_getattr syscalls for setting and querying
SCHED_DEADLINE parameters. These include dl_set_sched_attr() for
configuring deadline parameters, dl_get_sched_attr() for querying
scheduling attributes, dl_get_policy() for reading the policy from
/proc, and dl_is_deadline_task() for checking if a task is using
SCHED_DEADLINE. The library uses system headers for struct sched_attr
to avoid redefinition conflicts and provides full control over
SCHED_DEADLINE parameters.

Bandwidth management helpers allow tests to work within system
constraints. The dl_get_rt_bandwidth() function reads RT bandwidth
settings from /proc, while dl_calc_max_bandwidth_percent() calculates
the available bandwidth for deadline tasks based on current system
configuration.

Process management functions simplify creating and managing test
workloads. The dl_create_cpuhog() function forks and schedules a cpuhog
process by creating a child process, executing the cpuhog binary, and
setting SCHED_DEADLINE policy on the child PID after fork. It waits for
the child to start before configuring the scheduling policy. Supporting
functions include dl_cleanup_cpuhog() for terminating processes,
dl_find_cpuhogs() for locating running instances, and dl_wait_for_pid()
for synchronizing with process startup.

CPU topology helpers enable tests that manipulate CPU hotplug state.
These include dl_get_online_cpus() for counting available CPUs,
dl_get_hotpluggable_cpus() for identifying which CPUs can be
hotplugged, dl_cpu_online() and dl_cpu_offline() for controlling
hotplug state, and dl_is_cpu_online() for checking current status.

Time conversion utilities provide convenient transformations between
different time units. These include dl_ms_to_ns() and dl_us_to_ns()
for converting to nanoseconds, and dl_ns_to_ms() and dl_ns_to_us() for
converting from nanoseconds.

The library also includes the cpuhog helper program, which performs
busy looping to consume CPU cycles. This provides a controllable
workload for testing scheduler behavior under various deadline
configurations.

Assisted-by: Claude Code: claude-sonnet-4-5@20250929
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/deadline/Makefile  |  14 +-
 tools/testing/selftests/sched/deadline/cpuhog.c  | 107 ++++++++
 tools/testing/selftests/sched/deadline/dl_util.c | 335 +++++++++++++++++++++++
 tools/testing/selftests/sched/deadline/dl_util.h | 227 +++++++++++++++
 4 files changed, 680 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
index fd57794f1a543..ea3fdfbef459e 100644
--- a/tools/testing/selftests/sched/deadline/Makefile
+++ b/tools/testing/selftests/sched/deadline/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-TEST_GEN_PROGS := runner
+TEST_GEN_PROGS := runner cpuhog
 
 # override lib.mk's default rules
 OVERRIDE_TARGETS := 1
@@ -11,7 +11,7 @@ CFLAGS += -Wall -O2 -g -pthread
 OUTPUT_DIR := $(OUTPUT)
 
 # Utility object files
-UTIL_OBJS :=
+UTIL_OBJS := $(OUTPUT)/dl_util.o
 
 # Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
 # Will be populated as we add tests
@@ -21,6 +21,14 @@ TEST_OBJS :=
 $(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h | $(OUTPUT_DIR)
 	$(CC) $(CFLAGS) -o $@ runner.c $(UTIL_OBJS) $(TEST_OBJS) $(LDFLAGS)
 
+# cpuhog helper program
+$(OUTPUT)/cpuhog: cpuhog.c | $(OUTPUT_DIR)
+	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
+
+# Utility library
+$(OUTPUT)/dl_util.o: dl_util.c dl_util.h | $(OUTPUT_DIR)
+	$(CC) $(CFLAGS) -c $< -o $@
+
 $(OUTPUT_DIR):
 	mkdir -p $@
 
@@ -29,6 +37,6 @@ $(OUTPUT_DIR):
 all: $(TEST_GEN_PROGS)
 
 clean:
-	rm -f $(OUTPUT)/runner
+	rm -f $(OUTPUT)/runner $(OUTPUT)/cpuhog
 	rm -f $(OUTPUT)/*.o
 	rm -f *.o
diff --git a/tools/testing/selftests/sched/deadline/cpuhog.c b/tools/testing/selftests/sched/deadline/cpuhog.c
new file mode 100644
index 0000000000000..55274aa19e879
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/cpuhog.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * cpuhog: A simple CPU intensive program for testing scheduler behavior
+ *
+ * This program performs busy looping to consume CPU cycles, useful for
+ * testing scheduler policies like SCHED_DEADLINE.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <signal.h>
+#include <string.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <time.h>
+
+static int stop_flag;
+
+static void signal_handler(int sig)
+{
+	stop_flag = 1;
+}
+
+static void usage(const char *progname)
+{
+	printf("Usage: %s [options]\n", progname);
+	printf("Options:\n");
+	printf("  -t <seconds>  Run for specified seconds (default: infinite)\n");
+	printf("  -v            Verbose output\n");
+	printf("  -h            Show this help\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int opt;
+	int duration = 0; /* 0 means infinite */
+	int verbose = 0;
+	time_t start_time, current_time;
+	unsigned long long iterations = 0;
+	unsigned long long last_report = 0;
+
+	while ((opt = getopt(argc, argv, "t:vh")) != -1) {
+		switch (opt) {
+		case 't':
+			duration = atoi(optarg);
+			if (duration <= 0) {
+				fprintf(stderr, "Invalid duration: %s\n", optarg);
+				return 1;
+			}
+			break;
+		case 'v':
+			verbose = 1;
+			break;
+		case 'h':
+			usage(argv[0]);
+			return 0;
+		default:
+			usage(argv[0]);
+			return 1;
+		}
+	}
+
+	/* Set up signal handlers for graceful shutdown */
+	signal(SIGINT, signal_handler);
+	signal(SIGTERM, signal_handler);
+
+	if (verbose) {
+		printf("cpuhog starting (PID: %d)\n", getpid());
+		if (duration > 0)
+			printf("Will run for %d seconds\n", duration);
+		else
+			printf("Will run until interrupted\n");
+	}
+
+	start_time = time(NULL);
+
+	/* Main busy loop */
+	while (!stop_flag) {
+		/* Simple busy work - incrementing a counter */
+		iterations++;
+
+		/* Check if we've reached the duration limit */
+		if (duration > 0) {
+			current_time = time(NULL);
+			if (current_time - start_time >= duration)
+				break;
+		}
+
+		/* Print progress every 100M iterations if verbose */
+		if (verbose && (iterations % 100000000ULL == 0)) {
+			if (iterations != last_report) {
+				printf("Completed %llu iterations\n", iterations);
+				last_report = iterations;
+			}
+		}
+	}
+
+	if (verbose) {
+		current_time = time(NULL);
+		printf("cpuhog finished after %ld seconds and %llu iterations\n",
+		       current_time - start_time, iterations);
+	}
+
+	return 0;
+}
diff --git a/tools/testing/selftests/sched/deadline/dl_util.c b/tools/testing/selftests/sched/deadline/dl_util.c
new file mode 100644
index 0000000000000..0d7c46ba877f3
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/dl_util.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SCHED_DEADLINE Utility Library Implementation
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <signal.h>
+#include <time.h>
+#include "dl_util.h"
+
+/* Syscall numbers for sched_setattr/sched_getattr */
+#ifndef __NR_sched_setattr
+#define __NR_sched_setattr 314
+#endif
+
+#ifndef __NR_sched_getattr
+#define __NR_sched_getattr 315
+#endif
+
+/*
+ * Scheduling operations
+ */
+
+static int sched_setattr(pid_t pid, const struct sched_attr *attr,
+			 unsigned int flags)
+{
+	return syscall(__NR_sched_setattr, pid, attr, flags);
+}
+
+static int sched_getattr(pid_t pid, struct sched_attr *attr,
+			 unsigned int size, unsigned int flags)
+{
+	return syscall(__NR_sched_getattr, pid, attr, size, flags);
+}
+
+int dl_set_sched_attr(pid_t pid, uint64_t runtime, uint64_t deadline,
+		      uint64_t period)
+{
+	struct sched_attr attr = {
+		.size = sizeof(attr),
+		.sched_policy = SCHED_DEADLINE,
+		.sched_flags = 0,
+		.sched_runtime = runtime,
+		.sched_deadline = deadline,
+		.sched_period = period,
+	};
+
+	return sched_setattr(pid, &attr, 0);
+}
+
+int dl_get_sched_attr(pid_t pid, struct sched_attr *attr)
+{
+	memset(attr, 0, sizeof(*attr));
+	attr->size = sizeof(*attr);
+	return sched_getattr(pid, attr, sizeof(*attr), 0);
+}
+
+int dl_get_policy(pid_t pid)
+{
+	char path[256];
+	char line[256];
+	FILE *f;
+	int policy = -1;
+
+	snprintf(path, sizeof(path), "/proc/%d/sched", pid);
+	f = fopen(path, "r");
+	if (!f)
+		return -1;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, " policy : %d", &policy) == 1)
+			break;
+	}
+
+	fclose(f);
+	return policy;
+}
+
+bool dl_is_deadline_task(pid_t pid)
+{
+	return dl_get_policy(pid) == SCHED_DEADLINE;
+}
+
+/*
+ * Bandwidth management
+ */
+
+static int read_proc_uint64(const char *path, uint64_t *value)
+{
+	FILE *f;
+	int ret;
+
+	f = fopen(path, "r");
+	if (!f)
+		return -1;
+
+	ret = fscanf(f, "%lu", value);
+	fclose(f);
+
+	return ret == 1 ? 0 : -1;
+}
+
+int dl_get_rt_bandwidth(uint64_t *runtime_us, uint64_t *period_us)
+{
+	int ret;
+
+	ret = read_proc_uint64("/proc/sys/kernel/sched_rt_runtime_us",
+			       runtime_us);
+	if (ret < 0)
+		return ret;
+
+	return read_proc_uint64("/proc/sys/kernel/sched_rt_period_us",
+				period_us);
+}
+
+int dl_calc_max_bandwidth_percent(void)
+{
+	uint64_t runtime_us, period_us;
+	int percent;
+
+	if (dl_get_rt_bandwidth(&runtime_us, &period_us) < 0)
+		return -1;
+
+	if (period_us == 0)
+		return -1;
+
+	percent = (runtime_us * 100) / period_us;
+	return percent > 0 ? percent : 1;
+}
+
+/*
+ * Process management
+ */
+
+pid_t dl_create_cpuhog(uint64_t runtime, uint64_t deadline, uint64_t period,
+		       int duration_secs)
+{
+	pid_t pid;
+	char duration_str[32];
+
+	pid = fork();
+	if (pid < 0)
+		return -1;
+
+	if (pid == 0) {
+		/* Child process */
+		char *args[4];
+
+		args[0] = "./cpuhog";
+		if (duration_secs > 0) {
+			args[1] = "-t";
+			snprintf(duration_str, sizeof(duration_str), "%d",
+				 duration_secs);
+			args[2] = duration_str;
+			args[3] = NULL;
+		} else {
+			args[1] = NULL;
+		}
+
+		/* Just exec - parent will set SCHED_DEADLINE */
+		execvp(args[0], args);
+		/* If exec fails, try without ./ */
+		args[0] = "cpuhog";
+		execvp(args[0], args);
+
+		fprintf(stderr, "Failed to exec cpuhog: %s\n", strerror(errno));
+		exit(1);
+	}
+
+	/* Parent process - wait for child to start then set SCHED_DEADLINE */
+	if (dl_wait_for_pid(pid, 1000) < 0) {
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+		return -1;
+	}
+
+	/* Set SCHED_DEADLINE on the child process */
+	if (dl_set_sched_attr(pid, runtime, deadline, period) < 0) {
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+		return -1;
+	}
+
+	return pid;
+}
+
+void dl_cleanup_cpuhog(pid_t pid)
+{
+	int i;
+
+	if (pid <= 0)
+		return;
+
+	/* Try SIGTERM first */
+	kill(pid, SIGTERM);
+
+	/* Wait up to 1 second for graceful exit */
+	for (i = 0; i < 10; i++) {
+		if (waitpid(pid, NULL, WNOHANG) == pid)
+			return;
+		usleep(100000); /* 100ms */
+	}
+
+	/* Force kill */
+	kill(pid, SIGKILL);
+	waitpid(pid, NULL, 0);
+}
+
+int dl_find_cpuhogs(pid_t *pids, int max_pids)
+{
+	FILE *f;
+	char line[256];
+	int count = 0;
+
+	f = popen("pgrep -x cpuhog", "r");
+	if (!f)
+		return -1;
+
+	while (fgets(line, sizeof(line), f) && count < max_pids) {
+		pid_t pid = atoi(line);
+
+		if (pid > 0)
+			pids[count++] = pid;
+	}
+
+	pclose(f);
+	return count;
+}
+
+int dl_wait_for_pid(pid_t pid, int timeout_ms)
+{
+	char path[256];
+	int elapsed = 0;
+	int interval = 10; /* 10ms polling interval */
+
+	snprintf(path, sizeof(path), "/proc/%d", pid);
+
+	while (elapsed < timeout_ms) {
+		if (access(path, F_OK) == 0)
+			return 0;
+
+		usleep(interval * 1000);
+		elapsed += interval;
+	}
+
+	return -1;
+}
+
+/*
+ * CPU topology operations
+ */
+
+int dl_get_online_cpus(void)
+{
+	return (int)sysconf(_SC_NPROCESSORS_ONLN);
+}
+
+int dl_get_hotpluggable_cpus(int *cpus, int max_cpus)
+{
+	int cpu, count = 0;
+	int max_cpu = (int)sysconf(_SC_NPROCESSORS_CONF);
+	char path[256];
+
+	for (cpu = 1; cpu < max_cpu && count < max_cpus; cpu++) {
+		snprintf(path, sizeof(path),
+			 "/sys/devices/system/cpu/cpu%d/online", cpu);
+
+		/* If the online file exists, the CPU is hotpluggable */
+		if (access(path, F_OK) == 0)
+			cpus[count++] = cpu;
+	}
+
+	return count;
+}
+
+static int write_cpu_online(int cpu, int online)
+{
+	char path[256];
+	FILE *f;
+	int ret;
+
+	snprintf(path, sizeof(path),
+		 "/sys/devices/system/cpu/cpu%d/online", cpu);
+
+	f = fopen(path, "w");
+	if (!f)
+		return -1;
+
+	ret = fprintf(f, "%d\n", online);
+	fclose(f);
+
+	return ret > 0 ? 0 : -1;
+}
+
+int dl_cpu_online(int cpu)
+{
+	return write_cpu_online(cpu, 1);
+}
+
+int dl_cpu_offline(int cpu)
+{
+	return write_cpu_online(cpu, 0);
+}
+
+int dl_is_cpu_online(int cpu)
+{
+	char path[256];
+	FILE *f;
+	int online = -1;
+
+	snprintf(path, sizeof(path),
+		 "/sys/devices/system/cpu/cpu%d/online", cpu);
+
+	f = fopen(path, "r");
+	if (!f) {
+		/* CPU0 often doesn't have an online file (always online) */
+		if (cpu == 0)
+			return 1;
+		return -1;
+	}
+
+	if (fscanf(f, "%d", &online) != 1)
+		online = -1;
+
+	fclose(f);
+	return online;
+}
diff --git a/tools/testing/selftests/sched/deadline/dl_util.h b/tools/testing/selftests/sched/deadline/dl_util.h
new file mode 100644
index 0000000000000..9ab9d055a95a0
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/dl_util.h
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SCHED_DEADLINE Utility Library
+ *
+ * Common helper functions for SCHED_DEADLINE scheduler tests.
+ */
+
+#ifndef __DL_UTIL_H__
+#define __DL_UTIL_H__
+
+#include <stdint.h>
+#include <sys/types.h>
+#include <stdbool.h>
+#include <linux/sched/types.h>
+
+/* SCHED_DEADLINE policy number */
+#ifndef SCHED_DEADLINE
+#define SCHED_DEADLINE 6
+#endif
+
+/*
+ * Scheduling operations
+ */
+
+/**
+ * dl_set_sched_attr() - Set SCHED_DEADLINE parameters for a task
+ * @pid: Process ID (0 for current task)
+ * @runtime: Runtime in nanoseconds
+ * @deadline: Deadline in nanoseconds
+ * @period: Period in nanoseconds
+ *
+ * Sets the scheduling policy to SCHED_DEADLINE with the given parameters.
+ *
+ * Return: 0 on success, -1 on error (errno set)
+ */
+int dl_set_sched_attr(pid_t pid, uint64_t runtime, uint64_t deadline,
+		      uint64_t period);
+
+/**
+ * dl_get_sched_attr() - Get scheduling attributes for a task
+ * @pid: Process ID (0 for current task)
+ * @attr: Pointer to sched_attr structure to fill
+ *
+ * Return: 0 on success, -1 on error (errno set)
+ */
+int dl_get_sched_attr(pid_t pid, struct sched_attr *attr);
+
+/**
+ * dl_get_policy() - Get scheduling policy for a task
+ * @pid: Process ID
+ *
+ * Reads the policy from /proc/<pid>/sched.
+ *
+ * Return: Policy number (e.g., 6 for SCHED_DEADLINE), -1 on error
+ */
+int dl_get_policy(pid_t pid);
+
+/**
+ * dl_is_deadline_task() - Check if task is using SCHED_DEADLINE
+ * @pid: Process ID
+ *
+ * Return: true if task uses SCHED_DEADLINE, false otherwise
+ */
+bool dl_is_deadline_task(pid_t pid);
+
+/*
+ * Bandwidth management
+ */
+
+/**
+ * dl_get_rt_bandwidth() - Read RT bandwidth settings
+ * @runtime_us: Pointer to store runtime in microseconds
+ * @period_us: Pointer to store period in microseconds
+ *
+ * Reads from /proc/sys/kernel/sched_rt_runtime_us and
+ * /proc/sys/kernel/sched_rt_period_us.
+ *
+ * Return: 0 on success, -1 on error
+ */
+int dl_get_rt_bandwidth(uint64_t *runtime_us, uint64_t *period_us);
+
+/**
+ * dl_calc_max_bandwidth_percent() - Calculate available bandwidth percentage
+ *
+ * Calculates the maximum bandwidth available per CPU as a percentage,
+ * based on RT bandwidth settings.
+ *
+ * Return: Bandwidth percentage (0-100), or -1 on error
+ */
+int dl_calc_max_bandwidth_percent(void);
+
+/*
+ * Process management
+ */
+
+/**
+ * dl_create_cpuhog() - Fork and create a SCHED_DEADLINE cpuhog process
+ * @runtime: Runtime in nanoseconds
+ * @deadline: Deadline in nanoseconds
+ * @period: Period in nanoseconds
+ * @duration_secs: How long cpuhog should run (0 for infinite)
+ *
+ * Forks a cpuhog process and sets it to SCHED_DEADLINE with the given
+ * parameters. The cpuhog will run for duration_secs seconds.
+ *
+ * Return: PID of cpuhog process, -1 on error
+ */
+pid_t dl_create_cpuhog(uint64_t runtime, uint64_t deadline, uint64_t period,
+		       int duration_secs);
+
+/**
+ * dl_cleanup_cpuhog() - Kill and cleanup a cpuhog process
+ * @pid: PID of cpuhog to kill
+ *
+ * Sends SIGTERM, waits briefly, then SIGKILL if needed.
+ */
+void dl_cleanup_cpuhog(pid_t pid);
+
+/**
+ * dl_find_cpuhogs() - Find all running cpuhog processes
+ * @pids: Array to store PIDs
+ * @max_pids: Size of pids array
+ *
+ * Uses pgrep to find all processes named "cpuhog".
+ *
+ * Return: Number of cpuhog PIDs found, -1 on error
+ */
+int dl_find_cpuhogs(pid_t *pids, int max_pids);
+
+/**
+ * dl_wait_for_pid() - Wait for a process to appear
+ * @pid: Process ID to wait for
+ * @timeout_ms: Timeout in milliseconds
+ *
+ * Polls /proc/<pid> until it exists or timeout expires.
+ *
+ * Return: 0 if process appeared, -1 on timeout
+ */
+int dl_wait_for_pid(pid_t pid, int timeout_ms);
+
+/*
+ * CPU topology operations
+ */
+
+/**
+ * dl_get_online_cpus() - Get number of online CPUs
+ *
+ * Return: Number of online CPUs, -1 on error
+ */
+int dl_get_online_cpus(void);
+
+/**
+ * dl_get_hotpluggable_cpus() - Get list of hotpluggable CPUs
+ * @cpus: Array to store CPU numbers
+ * @max_cpus: Size of cpus array
+ *
+ * Returns CPUs that can be offlined (typically all except CPU0).
+ *
+ * Return: Number of hotpluggable CPUs, -1 on error
+ */
+int dl_get_hotpluggable_cpus(int *cpus, int max_cpus);
+
+/**
+ * dl_cpu_online() - Bring a CPU online
+ * @cpu: CPU number to online
+ *
+ * Writes 1 to /sys/devices/system/cpu/cpu<N>/online.
+ *
+ * Return: 0 on success, -1 on error
+ */
+int dl_cpu_online(int cpu);
+
+/**
+ * dl_cpu_offline() - Take a CPU offline
+ * @cpu: CPU number to offline
+ *
+ * Writes 0 to /sys/devices/system/cpu/cpu<N>/online.
+ *
+ * Return: 0 on success, -1 on error
+ */
+int dl_cpu_offline(int cpu);
+
+/**
+ * dl_is_cpu_online() - Check if CPU is online
+ * @cpu: CPU number
+ *
+ * Return: 1 if online, 0 if offline, -1 on error
+ */
+int dl_is_cpu_online(int cpu);
+
+/*
+ * Time conversion helpers
+ */
+
+/**
+ * dl_ms_to_ns() - Convert milliseconds to nanoseconds
+ */
+static inline uint64_t dl_ms_to_ns(uint64_t ms)
+{
+	return ms * 1000000ULL;
+}
+
+/**
+ * dl_us_to_ns() - Convert microseconds to nanoseconds
+ */
+static inline uint64_t dl_us_to_ns(uint64_t us)
+{
+	return us * 1000ULL;
+}
+
+/**
+ * dl_ns_to_us() - Convert nanoseconds to microseconds
+ */
+static inline uint64_t dl_ns_to_us(uint64_t ns)
+{
+	return ns / 1000ULL;
+}
+
+/**
+ * dl_ns_to_ms() - Convert nanoseconds to milliseconds
+ */
+static inline uint64_t dl_ns_to_ms(uint64_t ns)
+{
+	return ns / 1000000ULL;
+}
+
+#endif /* __DL_UTIL_H__ */

-- 
2.53.0

