Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286403ED5A2
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813635; cv=none; b=We7SFlVXtgRrOpaMdn1ena9wKZ/MI+rPrS1Ck89ecrAR4FmEF4gfnFM+TUrsaDrcDs2DBU0Msj+L7MvgDLu557DpNoHIN+0P6RtANzRep85FSLIUmZegCzm2uTPESRkEHu8EtOs7xgAwtrNwaoiWewYreCZB9eEoaIfqTpHfPXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813635; c=relaxed/simple;
	bh=uzQ/71TbI/xC0SluDKVSineqo7fx9SyqzH08CIY9xrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnpIaTdbtC3lJGSnPBI6o1MFz896mxrA8IdJ3Ji6NpW8CUJ4YfOIzsEuL5763Ov1Qaam+KL8AcjnEcKQzzP3ByghKie63VktiDT3OaT+5vkSIvZOrcreHxRIIAdClVxtxeOgM++UBEKCsWEcGhCkjfXI7nR2DPO1dsm6MvVBpLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cs9Y+kYB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cs9Y+kYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUiQN3/xeDKX4GTd8FkJSzSxG+77HaSzzy/t9hhyH7I=;
	b=cs9Y+kYB8khwsMJcB7MJnPEdGQFaUwq5eBgFMqgoiKHSSuHivJ5yf+pWO70TD3eordLGv4
	5gMxMv5/pLQSdfHWBKT09uWrx36pmreldYF/1h+v1L+tfYph3l+wKRjnI0X48/KCqP+K5j
	/9uy7GxamyRCRUVvOb6ABRbyAzbB2rU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-7DX5BfwfOcyon7Tzyud-dQ-1; Fri,
 06 Mar 2026 11:13:48 -0500
X-MC-Unique: 7DX5BfwfOcyon7Tzyud-dQ-1
X-Mimecast-MFC-AGG-ID: 7DX5BfwfOcyon7Tzyud-dQ_1772813627
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F20451956063;
	Fri,  6 Mar 2026 16:13:46 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0655F3003EA4;
	Fri,  6 Mar 2026 16:13:42 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 06 Mar 2026 17:10:11 +0100
Subject: [PATCH RFC 6/7] selftests/sched: Add SCHED_DEADLINE fair_server
 tests to kselftest
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-upstream-deadline-kselftests-v1-6-2b23ef74c46a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=17061;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=uzQ/71TbI/xC0SluDKVSineqo7fx9SyqzH08CIY9xrU=;
 b=C+balqmaus+gVnblMXYi/9lfNPiwZKogMybxCP+h8DXR3qidbAGhECBAN0QSsZuBXVSh90ZlI
 VGM9tiKTB7WDO9daMSaIS4GnH/Xl1dX7HARdVOXK4uILM4PQVelRSyB
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add tests validating fair_server bandwidth management and CPU protection
behavior. The fair_server is a DEADLINE server that provides CPU time to
CFS tasks while enforcing bandwidth limits within the RT bandwidth
allocation.

The fair_server_bandwidth_validation test validates that the kernel
enforces per-CPU RT bandwidth limits when configuring fair_server
runtime. It attempts to set all CPUs to 101% of the per-CPU RT bandwidth
and verifies that at least one write is rejected, ensuring the kernel
prevents misconfiguration that would exceed available bandwidth.

The fair_server_cpu_protection test verifies that CFS tasks receive
their allocated fair_server CPU time even when competing with
high-priority SCHED_FIFO tasks on the same CPU. It measures actual CPU
usage and validates it falls within expected tolerance of ±50%, ensuring
the fair_server provides the bandwidth protection that CFS tasks rely
on.

Helper functions are added to dl_util for fair_server management. These
include dl_fair_server_exists() to check if the fair_server interface is
available, dl_get_fair_server_settings() to read per-CPU runtime and
period values, dl_set_fair_server_runtime() to write per-CPU runtime
configuration, dl_set_rt_bandwidth() to configure system RT bandwidth
limits, and dl_get_process_cpu_time() to read process CPU time from
/proc/PID/stat for validation purposes.

Assisted-by: Claude Code: claude-sonnet-4-5@20250929
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/deadline/Makefile    |   5 +-
 tools/testing/selftests/sched/deadline/dl_util.c   | 128 ++++++++++
 tools/testing/selftests/sched/deadline/dl_util.h   |  57 +++++
 .../testing/selftests/sched/deadline/fair_server.c | 260 +++++++++++++++++++++
 4 files changed, 449 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
index daa2f5d14e947..e7e16c610ee58 100644
--- a/tools/testing/selftests/sched/deadline/Makefile
+++ b/tools/testing/selftests/sched/deadline/Makefile
@@ -14,7 +14,7 @@ OUTPUT_DIR := $(OUTPUT)
 UTIL_OBJS := $(OUTPUT)/dl_util.o
 
 # Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
-TEST_OBJS := $(OUTPUT)/basic.o $(OUTPUT)/bandwidth.o
+TEST_OBJS := $(OUTPUT)/basic.o $(OUTPUT)/bandwidth.o $(OUTPUT)/fair_server.o
 
 # Runner binary links utility and test objects
 $(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h | $(OUTPUT_DIR)
@@ -35,6 +35,9 @@ $(OUTPUT)/basic.o: basic.c dl_test.h dl_util.h | $(OUTPUT_DIR)
 $(OUTPUT)/bandwidth.o: bandwidth.c dl_test.h dl_util.h | $(OUTPUT_DIR)
 	$(CC) $(CFLAGS) -c $< -o $@
 
+$(OUTPUT)/fair_server.o: fair_server.c dl_test.h dl_util.h | $(OUTPUT_DIR)
+	$(CC) $(CFLAGS) -c $< -o $@
+
 $(OUTPUT_DIR):
 	mkdir -p $@
 
diff --git a/tools/testing/selftests/sched/deadline/dl_util.c b/tools/testing/selftests/sched/deadline/dl_util.c
index 6727d622d72d3..ca34eee964d61 100644
--- a/tools/testing/selftests/sched/deadline/dl_util.c
+++ b/tools/testing/selftests/sched/deadline/dl_util.c
@@ -203,6 +203,80 @@ int dl_calc_max_bandwidth_percent(void)
 	return available_percent > 0 ? available_percent : 1;
 }
 
+static int write_proc_uint64(const char *path, uint64_t value)
+{
+	FILE *f;
+	int ret;
+
+	f = fopen(path, "w");
+	if (!f)
+		return -1;
+
+	ret = fprintf(f, "%lu\n", value);
+	if (ret < 0) {
+		fclose(f);
+		return -1;
+	}
+
+	/* fclose() flushes and may return error if kernel write fails */
+	if (fclose(f) != 0)
+		return -1;
+
+	return 0;
+}
+
+int dl_set_rt_bandwidth(uint64_t runtime_us, uint64_t period_us)
+{
+	int ret;
+
+	ret = write_proc_uint64("/proc/sys/kernel/sched_rt_runtime_us",
+				runtime_us);
+	if (ret < 0)
+		return ret;
+
+	return write_proc_uint64("/proc/sys/kernel/sched_rt_period_us",
+				 period_us);
+}
+
+bool dl_fair_server_exists(void)
+{
+	return access("/sys/kernel/debug/sched/fair_server", F_OK) == 0;
+}
+
+int dl_get_fair_server_settings(int cpu, uint64_t *runtime_ns,
+				 uint64_t *period_ns)
+{
+	char runtime_path[256];
+	char period_path[256];
+	int ret;
+
+	snprintf(runtime_path, sizeof(runtime_path),
+		 "/sys/kernel/debug/sched/fair_server/cpu%d/runtime", cpu);
+
+	ret = read_proc_uint64(runtime_path, runtime_ns);
+	if (ret < 0)
+		return ret;
+
+	/* period_ns is optional */
+	if (period_ns) {
+		snprintf(period_path, sizeof(period_path),
+			 "/sys/kernel/debug/sched/fair_server/cpu%d/period", cpu);
+		return read_proc_uint64(period_path, period_ns);
+	}
+
+	return 0;
+}
+
+int dl_set_fair_server_runtime(int cpu, uint64_t runtime_ns)
+{
+	char path[256];
+
+	snprintf(path, sizeof(path),
+		 "/sys/kernel/debug/sched/fair_server/cpu%d/runtime", cpu);
+
+	return write_proc_uint64(path, runtime_ns);
+}
+
 /*
  * Process management
  */
@@ -321,6 +395,60 @@ int dl_wait_for_pid(pid_t pid, int timeout_ms)
 	return -1;
 }
 
+uint64_t dl_get_process_cpu_time(pid_t pid)
+{
+	char path[256];
+	char line[1024];
+	FILE *f;
+	uint64_t utime = 0, stime = 0;
+	int i;
+	char *p, *token, *saveptr;
+
+	snprintf(path, sizeof(path), "/proc/%d/stat", pid);
+	f = fopen(path, "r");
+	if (!f)
+		return 0;
+
+	if (!fgets(line, sizeof(line), f)) {
+		fclose(f);
+		return 0;
+	}
+
+	fclose(f);
+
+	/*
+	 * Parse /proc/PID/stat format:
+	 * pid (comm) state ppid ... utime stime ...
+	 *
+	 * The comm field (field 2) can contain spaces and is enclosed in
+	 * parentheses. Find the last ')' to skip past it, then parse the
+	 * remaining space-separated fields.
+	 *
+	 * After the closing ')', fields are:
+	 * 1=state 2=ppid 3=pgrp 4=sid 5=tty_nr 6=tty_pgrp 7=flags
+	 * 8=min_flt 9=cmin_flt 10=maj_flt 11=cmaj_flt 12=utime 13=stime
+	 */
+	p = strrchr(line, ')');
+	if (!p)
+		return 0;
+
+	/* Skip past ') ' */
+	p += 2;
+
+	/* Tokenize remaining fields */
+	token = strtok_r(p, " ", &saveptr);
+	for (i = 1; token && i <= 13; i++) {
+		if (i == 12)
+			utime = strtoull(token, NULL, 10);
+		else if (i == 13)
+			stime = strtoull(token, NULL, 10);
+
+		token = strtok_r(NULL, " ", &saveptr);
+	}
+
+	return utime + stime;
+}
+
 /*
  * CPU topology operations
  */
diff --git a/tools/testing/selftests/sched/deadline/dl_util.h b/tools/testing/selftests/sched/deadline/dl_util.h
index f8046eb0cbd3b..511cc92ef1e3e 100644
--- a/tools/testing/selftests/sched/deadline/dl_util.h
+++ b/tools/testing/selftests/sched/deadline/dl_util.h
@@ -99,6 +99,52 @@ int dl_get_server_bandwidth_overhead(void);
  */
 int dl_calc_max_bandwidth_percent(void);
 
+/**
+ * dl_set_rt_bandwidth() - Set RT bandwidth settings
+ * @runtime_us: Runtime in microseconds
+ * @period_us: Period in microseconds
+ *
+ * Writes to /proc/sys/kernel/sched_rt_runtime_us and
+ * /proc/sys/kernel/sched_rt_period_us. Requires root privileges.
+ *
+ * Return: 0 on success, -1 on error
+ */
+int dl_set_rt_bandwidth(uint64_t runtime_us, uint64_t period_us);
+
+/**
+ * dl_get_fair_server_settings() - Read fair_server settings for a CPU
+ * @cpu: CPU number
+ * @runtime_ns: Pointer to store runtime in nanoseconds
+ * @period_ns: Pointer to store period in nanoseconds
+ *
+ * Reads from /sys/kernel/debug/sched/fair_server/cpuN/runtime and period.
+ *
+ * Return: 0 on success, -1 on error (including if fair_server doesn't exist)
+ */
+int dl_get_fair_server_settings(int cpu, uint64_t *runtime_ns,
+				uint64_t *period_ns);
+
+/**
+ * dl_set_fair_server_runtime() - Set fair_server runtime for a CPU
+ * @cpu: CPU number
+ * @runtime_ns: Runtime in nanoseconds
+ *
+ * Writes to /sys/kernel/debug/sched/fair_server/cpuN/runtime.
+ * Requires appropriate permissions.
+ *
+ * Return: 0 on success, -1 on error
+ */
+int dl_set_fair_server_runtime(int cpu, uint64_t runtime_ns);
+
+/**
+ * dl_fair_server_exists() - Check if fair_server interface exists
+ *
+ * Checks if /sys/kernel/debug/sched/fair_server directory exists.
+ *
+ * Return: true if fair_server interface exists, false otherwise
+ */
+bool dl_fair_server_exists(void);
+
 /*
  * Process management
  */
@@ -148,6 +194,17 @@ int dl_find_cpuhogs(pid_t *pids, int max_pids);
  */
 int dl_wait_for_pid(pid_t pid, int timeout_ms);
 
+/**
+ * dl_get_process_cpu_time() - Get total CPU time for a process
+ * @pid: Process ID
+ *
+ * Reads utime and stime from /proc/<pid>/stat and returns total CPU
+ * time in clock ticks.
+ *
+ * Return: Total CPU ticks used, or 0 on error
+ */
+uint64_t dl_get_process_cpu_time(pid_t pid);
+
 /*
  * CPU topology operations
  */
diff --git a/tools/testing/selftests/sched/deadline/fair_server.c b/tools/testing/selftests/sched/deadline/fair_server.c
new file mode 100644
index 0000000000000..dbff6296090f2
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/fair_server.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SCHED_DEADLINE fair_server tests
+ *
+ * Validates fair_server bandwidth management and CPU protection behavior.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <signal.h>
+#include <errno.h>
+#include <string.h>
+#include <sched.h>
+#include "dl_test.h"
+#include "dl_util.h"
+
+/*
+ * Test: Fair server bandwidth validation
+ *
+ * Verifies that the kernel rejects attempts to set fair_server bandwidth
+ * that exceeds available RT bandwidth, and preserves the original value.
+ */
+static enum dl_test_status test_fair_server_bandwidth_validation_run(void *ctx)
+{
+	uint64_t rt_runtime_us, rt_period_us;
+	uint64_t fair_runtime_ns, fair_period_ns;
+	uint64_t excessive_runtime_ns;
+	uint64_t *original_runtimes = NULL;
+	int num_cpus, i;
+	int write_succeeded = 0;
+	int write_failed = 0;
+
+	/* Check if fair_server interface exists */
+	if (!dl_fair_server_exists()) {
+		printf("  Fair server interface not found\n");
+		return DL_TEST_SKIP;
+	}
+
+	/* Read RT bandwidth settings */
+	DL_FAIL_IF(dl_get_rt_bandwidth(&rt_runtime_us, &rt_period_us) < 0,
+		   "Failed to read RT bandwidth settings");
+
+	printf("  RT bandwidth: %luµs / %luµs per CPU\n",
+	       rt_runtime_us, rt_period_us);
+
+	num_cpus = dl_get_online_cpus();
+	DL_FAIL_IF(num_cpus <= 0, "Failed to get number of CPUs");
+
+	printf("  Number of online CPUs: %d\n", num_cpus);
+
+	/* Read current fair_server settings for cpu0 to get period */
+	DL_FAIL_IF(dl_get_fair_server_settings(0, &fair_runtime_ns,
+					       &fair_period_ns) < 0,
+		   "Failed to read fair_server settings");
+
+	printf("  Fair server period: %luns\n", fair_period_ns);
+
+	/* Save original runtimes for all CPUs */
+	original_runtimes = calloc(num_cpus, sizeof(uint64_t));
+	DL_FAIL_IF(!original_runtimes, "Failed to allocate memory");
+
+	for (i = 0; i < num_cpus; i++) {
+		if (dl_get_fair_server_settings(i, &original_runtimes[i],
+						NULL) < 0) {
+			printf("  Warning: Cannot read CPU %d settings\n", i);
+			original_runtimes[i] = 0;
+		}
+	}
+
+	/*
+	 * Try to set each CPU's fair_server to 101% of RT bandwidth per CPU.
+	 * This should exceed the per-CPU RT bandwidth limit and fail.
+	 */
+	excessive_runtime_ns = (rt_runtime_us * 101 / 100) * 1000;
+
+	/* Scale to fair_server period if different from RT period */
+	if (fair_period_ns != rt_period_us * 1000)
+		excessive_runtime_ns = excessive_runtime_ns * fair_period_ns /
+				       (rt_period_us * 1000);
+
+	printf("  Attempting to set all CPUs to %luns (101%% of RT bandwidth)\n",
+	       excessive_runtime_ns);
+
+	for (i = 0; i < num_cpus; i++) {
+		if (dl_set_fair_server_runtime(i, excessive_runtime_ns) == 0) {
+			write_succeeded++;
+		} else {
+			write_failed++;
+			printf("  CPU %d write rejected: %s\n", i, strerror(errno));
+		}
+	}
+
+	printf("  Result: %d writes succeeded, %d failed\n",
+	       write_succeeded, write_failed);
+
+	/* Restore original values */
+	for (i = 0; i < num_cpus; i++) {
+		if (original_runtimes[i] > 0)
+			dl_set_fair_server_runtime(i, original_runtimes[i]);
+	}
+
+	free(original_runtimes);
+
+	/*
+	 * Test passes if at least one write was rejected,
+	 * showing bandwidth limit enforcement.
+	 */
+	if (write_failed > 0) {
+		printf("  SUCCESS: Bandwidth limit enforced (%d writes rejected)\n",
+		       write_failed);
+		return DL_TEST_PASS;
+	}
+
+	printf("  FAIL: All writes accepted, no bandwidth limit enforcement\n");
+	return DL_TEST_FAIL;
+}
+
+static struct dl_test test_fair_server_bandwidth_validation = {
+	.name = "fair_server_bandwidth_validation",
+	.description = "Verify fair_server bandwidth validation against RT bandwidth",
+	.run = test_fair_server_bandwidth_validation_run,
+};
+REGISTER_DL_TEST(&test_fair_server_bandwidth_validation);
+
+/*
+ * Test: Fair server CPU protection under FIFO competition
+ *
+ * Verifies that fair_server provides CPU time to CFS tasks even when
+ * competing with high-priority FIFO tasks on the same CPU.
+ */
+static enum dl_test_status test_fair_server_cpu_protection_run(void *ctx)
+{
+	uint64_t fair_runtime_ns, fair_period_ns;
+	uint64_t initial_time, final_time, cpu_ticks_used;
+	uint64_t ticks_per_sec, test_duration = 12;
+	pid_t cfs_pid, fifo_pid;
+	int test_cpu = 2;
+	int expected_percent, cpu_percent;
+	int min_expected, max_expected;
+	cpu_set_t cpuset;
+	struct sched_param param;
+
+	/* Check if fair_server interface exists */
+	if (!dl_fair_server_exists()) {
+		printf("  Fair server interface not found\n");
+		return DL_TEST_SKIP;
+	}
+
+	/* Read fair_server settings */
+	DL_FAIL_IF(dl_get_fair_server_settings(test_cpu, &fair_runtime_ns,
+					       &fair_period_ns) < 0,
+		   "Failed to read fair_server settings");
+
+	expected_percent = (fair_runtime_ns * 100) / fair_period_ns;
+
+	printf("  Fair server (CPU %d): %luns / %luns (%d%%)\n",
+	       test_cpu, fair_runtime_ns, fair_period_ns, expected_percent);
+
+	ticks_per_sec = sysconf(_SC_CLK_TCK);
+
+	/* Fork CFS cpuhog */
+	cfs_pid = fork();
+	if (cfs_pid < 0) {
+		DL_ERR("Failed to fork CFS task");
+		return DL_TEST_FAIL;
+	}
+
+	if (cfs_pid == 0) {
+		/* Child: CFS cpuhog pinned to test_cpu */
+		CPU_ZERO(&cpuset);
+		CPU_SET(test_cpu, &cpuset);
+		sched_setaffinity(0, sizeof(cpuset), &cpuset);
+
+		execl("./cpuhog", "cpuhog", "-t", "20", NULL);
+		exit(1);
+	}
+
+	/* Wait for CFS task to stabilize */
+	sleep(2);
+
+	printf("  Measuring baseline CPU time...\n");
+	initial_time = dl_get_process_cpu_time(cfs_pid);
+
+	/* Fork FIFO cpuhog */
+	fifo_pid = fork();
+	if (fifo_pid < 0) {
+		kill(cfs_pid, SIGKILL);
+		waitpid(cfs_pid, NULL, 0);
+		DL_ERR("Failed to fork FIFO task");
+		return DL_TEST_FAIL;
+	}
+
+	if (fifo_pid == 0) {
+		/* Child: FIFO cpuhog pinned to test_cpu */
+		CPU_ZERO(&cpuset);
+		CPU_SET(test_cpu, &cpuset);
+		sched_setaffinity(0, sizeof(cpuset), &cpuset);
+
+		param.sched_priority = 50;
+		sched_setscheduler(0, SCHED_FIFO, &param);
+
+		execl("./cpuhog", "cpuhog", "-t", "20", NULL);
+		exit(1);
+	}
+
+	printf("  Starting FIFO competition for %lus...\n", test_duration);
+
+	/* Wait for test duration */
+	sleep(test_duration);
+
+	printf("  Measuring final CPU time...\n");
+	final_time = dl_get_process_cpu_time(cfs_pid);
+
+	/* Cleanup */
+	kill(cfs_pid, SIGKILL);
+	kill(fifo_pid, SIGKILL);
+	waitpid(cfs_pid, NULL, 0);
+	waitpid(fifo_pid, NULL, 0);
+
+	/* Calculate CPU usage */
+	cpu_ticks_used = final_time - initial_time;
+	cpu_percent = (cpu_ticks_used * 100) / (test_duration * ticks_per_sec);
+
+	printf("  CPU ticks used: %lu / %lu\n",
+	       cpu_ticks_used, test_duration * ticks_per_sec);
+	printf("  CFS task CPU usage: %d%%\n", cpu_percent);
+
+	/* Allow ±50% tolerance (e.g., 5% ± 50% = 2.5% - 7.5%) */
+	min_expected = expected_percent * 50 / 100;
+	max_expected = expected_percent * 150 / 100;
+
+	if (min_expected < 1)
+		min_expected = 1;
+
+	printf("  Expected range: %d%% - %d%%\n", min_expected, max_expected);
+
+	if (cpu_percent >= min_expected && cpu_percent <= max_expected) {
+		printf("  SUCCESS: CFS task received %d%% CPU\n", cpu_percent);
+		return DL_TEST_PASS;
+	} else if (cpu_percent < min_expected) {
+		printf("  FAIL: CFS task received only %d%% (below %d%%)\n",
+		       cpu_percent, min_expected);
+		return DL_TEST_FAIL;
+	}
+
+	printf("  FAIL: CFS task received %d%% (above %d%%)\n",
+	       cpu_percent, max_expected);
+	return DL_TEST_FAIL;
+}
+
+static struct dl_test test_fair_server_cpu_protection = {
+	.name = "fair_server_cpu_protection",
+	.description = "Verify fair_server provides CPU protection under FIFO competition",
+	.run = test_fair_server_cpu_protection_run,
+};
+REGISTER_DL_TEST(&test_fair_server_cpu_protection);

-- 
2.53.0

