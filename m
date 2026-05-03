Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8253A783D
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843396; cv=none; b=TKWjhELekU9g7zSy4jOnTRSA2AzOnH2wSTrN7PRcxgRwSHyBNbbqbA9pCQd50kEkVbO9SdVBCVhBC07EbGthwxTZNKkuQoUECXWakgxFd99vRQD1UHvld1jzDSlr5tgO19HD+IeXnCgyNDaQdWhUinhHlz5JPthidBkuiqQ4M9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843396; c=relaxed/simple;
	bh=BZ/8mZko9CNUx/yqcW80TqwmIibwWcV/0XZwjCIrunE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eGP8VZQLEOzNs2mqNRXRV4Dt+V6z8CNUIlPWscMLwTsu3BZNoS34/Ou9gZuZkUvNl2KosMuTO1DKeGzrxAd+G2Z+3bru6okS8n8jCmnMDz+j1ExCE4qhj055aEnmL9ItDMMNYFbUkBCWk53WqUeu5O7vHx/9Waab2G2EOjF8ytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ix67EaFx; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ix67EaFx"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so5032769eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 14:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777843393; x=1778448193; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLINxPTDln0Gk6/qTLIHSXNAZ3ruBQNffiyItDEl0jE=;
        b=ix67EaFx/sTRTD1+yUqDRKUOT+yQPBDMAdixIzAff9X3iuMEFrnCFvURdurARRVT4s
         fF1lURc1ahQXvFjUtMidlRgKq3jwcsJsk+8m7ysJudEGAmyIe5feWElY0yMUJKbn/122
         DhCSljYlAWfo64GEwRJgtQehwyubt98ONyVzLMhjt0srHv9uwyJAOH9s0s2tARxkHfMU
         68CXblysT+9kOU4xj+oCVOgEkzdGss/dGltwbKe3UqNVy2HEG7PvaTm6F/hOf7ClTG+q
         lwpQEN1UT8Ok1l8zxhIJ4ZIBgz/9oshcFaFx7ik9t2K5ZRT8ERWfx6pig4FMYiTbOevC
         z5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843393; x=1778448193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLINxPTDln0Gk6/qTLIHSXNAZ3ruBQNffiyItDEl0jE=;
        b=MSslaeuCLXM9X7BmZ7r8Amt3xcSLeUt1ajq4hlkHc46ikUApFyi5N3BQ3f4/I5bsVa
         2rcuEW+D448Vq5pAUvOZlsisO6jyvf4BJqaJZYH7uZm9KajdhQC1dQB2QjiK/KrWd+oq
         pO/atk7VRasyO/AA83ie1aQF8zHuMo19GwX49AykN7TksQNX3ngNHd4bZ1nvWm15pcJS
         u//VdHW843q8O2RVSKQufrtCifF/yHQsA46BnSbcbh88S/AB0e7fS+vqrSHdv2jcN8Qk
         6Ai4GPMxwVmPRiKZU6qo8bJAJpM/WlkcEAXU9nZMYqh8Kuj+49TbPy13HvRSqRa3XSKz
         IwXA==
X-Forwarded-Encrypted: i=1; AFNElJ8W4AzO/i+NccC32xw3KghSWjTy/REWRcdv2aG2iMXu1hytiRFlr3NeA4jhjH/jhm0hmK0IH1uaPEUrT/Z20RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxePL6UXMKf6mb5+YvN4RrO2UyBF9V8llrMLgLzRxv6zvAwppRe
	Ou7cj6a2E1/MktdfVH2CZHcZhw8BIou7ZLtvlftAiSb268sV+/YmRiBt+hIDNQUZdQn5EhWtARj
	6KQaSZcAKc4PBye1gWPIqRcBRfYmxLXaSTA==
X-Received: from dyng39.prod.google.com ([2002:a05:7300:7f27:b0:2d9:3459:1de6])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr3411185eec.22.1777843392314;
 Sun, 03 May 2026 14:23:12 -0700 (PDT)
Date: Sun,  3 May 2026 21:22:05 +0000
In-Reply-To: <20260503212205.3714217-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260503212205.3714217-1-aniketgattani@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260503212205.3714217-4-aniketgattani@google.com>
Subject: [PATCH v3 3/3] selftests/membarrier: Add rseq stress test for CFS
 throttle interactions
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aniket Gattani <aniketgattani@google.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add a new stress test to exercise the interaction between targeted
expedited membarrier commands and CFS bandwidth throttling.

The test creates a deep cgroup hierarchy and aggressively hammers the
membarrier syscall to expose lock contention and latency issues. This
serves as a reliable reproducer for the `membarrier_ipi_mutex` cascade
lockup, ensuring future changes to membarrier locking do not regress
targeted command latency.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202604151516.Vc7Ro4LP-lkp@intel.com/
Signed-off-by: Aniket Gattani <aniketgattani@google.com>
---
Changes in v3:
  - None
---
 tools/testing/selftests/membarrier/Makefile   |   5 +-
 .../membarrier/membarrier_rseq_stress.c       | 951 ++++++++++++++++++
 2 files changed, 954 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/membarrier/membarrier_rseq_stress.c

diff --git a/tools/testing/selftests/membarrier/Makefile b/tools/testing/selftests/membarrier/Makefile
index fc840e06ff56..829f95c83515 100644
--- a/tools/testing/selftests/membarrier/Makefile
+++ b/tools/testing/selftests/membarrier/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
-CFLAGS += -g $(KHDR_INCLUDES)
+CFLAGS += -g $(KHDR_INCLUDES) -pthread -I../../../../tools/include
 LDLIBS += -lpthread
 
 TEST_GEN_PROGS := membarrier_test_single_thread \
-		membarrier_test_multi_thread
+		membarrier_test_multi_thread \
+		membarrier_rseq_stress
 
 include ../lib.mk
diff --git a/tools/testing/selftests/membarrier/membarrier_rseq_stress.c b/tools/testing/selftests/membarrier/membarrier_rseq_stress.c
new file mode 100644
index 000000000000..c188d7498610
--- /dev/null
+++ b/tools/testing/selftests/membarrier/membarrier_rseq_stress.c
@@ -0,0 +1,951 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Membarrier stress test for CFS throttle interactions.
+ *
+ * Reproducer for the interaction between CFS throttle and expedited membarrier.
+ */
+
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <pthread.h>
+#include <syscall.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <errno.h>
+#include <sched.h>
+#include <time.h>
+#include <signal.h>
+#include <stdatomic.h>
+#include <dirent.h>
+#include <sys/prctl.h>
+#include <sys/mman.h>
+
+#include "../kselftest.h"
+
+/* -- Architecture-specific rseq signature -- */
+#if defined(__x86_64__) || defined(__i386__)
+# define RSEQ_SIG  0x53053053U
+#elif defined(__aarch64__)
+# define RSEQ_SIG  0xd428bc00U
+#elif defined(__powerpc__) || defined(__powerpc64__)
+# define RSEQ_SIG  0x0f000000U
+#elif defined(__s390__) || defined(__s390x__)
+# define RSEQ_SIG  0x0c000000U
+#else
+# define RSEQ_SIG  0
+# define UNSUPPORTED_ARCH 1
+#endif
+
+/* -- rseq ABI (kernel uapi; define locally for portability) -- */
+#define RSEQ_CPU_ID_UNINITIALIZED       ((__u32)-1)
+
+#include <linux/compiler.h>
+
+struct rseq_abi {
+	__u32 cpu_id_start;
+	__u32 cpu_id;
+	__u64 rseq_cs;
+	__u32 flags;
+	__u32 node_id;
+	__u32 mm_cid;
+	char  end[0];
+} __aligned(32);
+
+/* -- membarrier constants (not in all distro headers) -- */
+#ifndef MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ
+# define MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ          (1 << 7)
+#endif
+#ifndef MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ
+# define MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ (1 << 8)
+#endif
+#ifndef MEMBARRIER_CMD_FLAG_CPU
+# define MEMBARRIER_CMD_FLAG_CPU  (1 << 0)
+#endif
+
+/* -- Test parameters -- */
+#define N_SIBLINGS          2000
+#define NEST_DEPTH		5
+static char g_cgroup_path[4096];
+static int use_cgroup_v2;
+
+#define CFS_QUOTA_US        1000
+#define CFS_PERIOD_US       5000
+#define N_HAMMER_PER_CPU    25
+#define N_BURNER_PER_CPU    50
+#define MAX_STRESS_CPUS     1024
+#define TEST_DURATION_SEC   20
+
+/* Latency thresholds for the sentinel */
+#define LATENCY_WARN_MS     50
+#define LATENCY_CRITICAL_MS 200
+
+/* Sentinel sampling interval */
+#define SENTINEL_INTERVAL_US  500
+
+/* -- Shared globals -- */
+static atomic_int  g_stop;
+static atomic_int  g_stop_sentinel;
+static atomic_long g_max_latency_us;
+static atomic_long g_interval_max_latency_us;
+static atomic_long g_mb_ok;
+static atomic_long g_mb_err;
+static int         g_ncpus_stress;
+static int *g_stress_cpus;
+
+static atomic_int  g_test_ready;
+
+/* Per-thread rseq ABI block registered with the kernel */
+static __thread struct rseq_abi tls_rseq
+	__attribute__((tls_model("initial-exec"))) __aligned(32) = {
+	.cpu_id = RSEQ_CPU_ID_UNINITIALIZED,
+};
+
+/* -- Utility -- */
+static int write_file(const char *path, const char *val)
+{
+	int fd = open(path, O_WRONLY | O_CLOEXEC);
+
+	if (fd < 0)
+		return -errno;
+
+	size_t len = strlen(val);
+	ssize_t r = write(fd, val, len);
+
+	close(fd);
+	if (r < 0)
+		return -errno;
+	if ((size_t)r != len)
+		return -EIO;
+	return 0;
+}
+
+static uint64_t monotonic_us(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	return (uint64_t)ts.tv_sec * 1000000ULL + ts.tv_nsec / 1000ULL;
+}
+
+static void update_max_latency(long lat)
+{
+	long old = atomic_load_explicit(&g_max_latency_us, memory_order_relaxed);
+
+	while (lat > old) {
+		if (atomic_compare_exchange_weak_explicit(&g_max_latency_us, &old, lat,
+				memory_order_relaxed, memory_order_relaxed))
+			break;
+	}
+
+	old = atomic_load_explicit(&g_interval_max_latency_us, memory_order_relaxed);
+	while (lat > old) {
+		if (atomic_compare_exchange_weak_explicit(&g_interval_max_latency_us, &old, lat,
+				memory_order_relaxed, memory_order_relaxed))
+			break;
+	}
+}
+
+static void init_stress_cpus(void)
+{
+	cpu_set_t set;
+	int capacity = MAX_STRESS_CPUS;
+
+	g_stress_cpus = malloc(capacity * sizeof(int));
+	if (!g_stress_cpus)
+		ksft_exit_fail_msg("malloc failed for g_stress_cpus\n");
+
+	if (sched_getaffinity(0, sizeof(set), &set) < 0)
+		ksft_exit_fail_msg("sched_getaffinity failed\n");
+
+	for (int i = 0; i < CPU_SETSIZE && g_ncpus_stress < capacity; i++) {
+		if (CPU_ISSET(i, &set))
+			g_stress_cpus[g_ncpus_stress++] = i;
+	}
+
+	if (g_ncpus_stress == 0)
+		ksft_exit_skip("No CPUs available for stress test\n");
+
+	ksft_print_msg("Stressing %d CPUs discovered via affinity\n", g_ncpus_stress);
+}
+
+/* -- rseq / membarrier helpers -- */
+static int rseq_register_thread(void)
+{
+	int r = syscall(SYS_rseq, &tls_rseq, sizeof(tls_rseq), 0, RSEQ_SIG);
+
+	return (r == 0 || errno == EBUSY || errno == EINVAL) ? 0 : -1;
+}
+
+static int rseq_register_thread_at(struct rseq_abi *rseq)
+{
+	int r = syscall(SYS_rseq, rseq, sizeof(*rseq), 0, RSEQ_SIG);
+
+	return (r == 0 || errno == EBUSY || errno == EINVAL) ? 0 : -1;
+}
+
+static int membarrier_register_rseq_mm(void)
+{
+	return syscall(SYS_membarrier,
+		       MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ, 0, 0);
+}
+
+/* -- cgroup helpers -- */
+static void rm_cgroup_recursive(const char *path)
+{
+	DIR *dir = opendir(path);
+
+	if (!dir)
+		return;
+	struct dirent *entry;
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
+			continue;
+		if (entry->d_type == DT_DIR) {
+			char sub_path[4096];
+
+			snprintf(sub_path, sizeof(sub_path), "%s/%s", path, entry->d_name);
+			rm_cgroup_recursive(sub_path);
+		}
+	}
+	closedir(dir);
+	rmdir(path);
+}
+
+static void cgroup_teardown(void);
+
+static int cgroup_setup(void)
+{
+	struct stat st;
+
+	if (stat("/sys/fs/cgroup/cpu", &st) == 0) {
+		use_cgroup_v2 = 0;
+		snprintf(g_cgroup_path, sizeof(g_cgroup_path),
+			 "/sys/fs/cgroup/cpu/membarrier_stress_test");
+	} else if (stat("/dev/cgroup/cpu", &st) == 0) {
+		use_cgroup_v2 = 0;
+		snprintf(g_cgroup_path, sizeof(g_cgroup_path),
+			 "/dev/cgroup/cpu/membarrier_stress_test");
+	} else if (stat("/cgroup/cpu", &st) == 0) {
+		use_cgroup_v2 = 0;
+		snprintf(g_cgroup_path, sizeof(g_cgroup_path),
+			 "/cgroup/cpu/membarrier_stress_test");
+	} else if (stat("/sys/fs/cgroup/cgroup.controllers", &st) == 0) {
+		use_cgroup_v2 = 1;
+		snprintf(g_cgroup_path, sizeof(g_cgroup_path),
+			 "/sys/fs/cgroup/membarrier_stress_test");
+	} else {
+		ksft_print_msg("WARN: cgroup mount not found. Using v2 at /sys/fs/cgroup\n");
+		use_cgroup_v2 = 1;
+		snprintf(g_cgroup_path, sizeof(g_cgroup_path),
+			 "/sys/fs/cgroup/membarrier_stress_test");
+	}
+
+	/* Robust cleanup before setup */
+	cgroup_teardown();
+
+	if (use_cgroup_v2) {
+		/* Enable cpu controller in root cgroup */
+		if (write_file("/sys/fs/cgroup/cgroup.subtree_control", "+cpu") < 0)
+			ksft_print_msg("WARN: failed to enable cpu controller in /sys/fs/cgroup\n");
+	}
+
+	if (mkdir(g_cgroup_path, 0755) < 0 && errno != EEXIST) {
+		ksft_print_msg("mkdir base %s failed: %s\n", g_cgroup_path, strerror(errno));
+		return -1;
+	}
+
+	if (use_cgroup_v2) {
+		char ctrl_path[4096];
+
+		snprintf(ctrl_path, sizeof(ctrl_path), "%s/cgroup.subtree_control", g_cgroup_path);
+		if (write_file(ctrl_path, "+cpu") < 0)
+			ksft_print_msg("WARN: failed to enable cpu controller in %s\n",
+				       g_cgroup_path);
+	}
+
+	for (int i = 0; i < N_SIBLINGS; i++) {
+		char sibling_path[4096];
+
+		snprintf(sibling_path, sizeof(sibling_path), "%s/n%d", g_cgroup_path, i);
+		if (mkdir(sibling_path, 0755) < 0 && errno != EEXIST) {
+			ksft_print_msg("mkdir wide %s failed: %s\n", sibling_path, strerror(errno));
+			return -1;
+		}
+
+		if (use_cgroup_v2) {
+			char ctrl_path[4096];
+
+			snprintf(ctrl_path, sizeof(ctrl_path),
+				 "%s/cgroup.subtree_control", sibling_path);
+			if (write_file(ctrl_path, "+cpu") < 0)
+				ksft_print_msg("WARN: failed to enable cpu controller in %s\n",
+					       sibling_path);
+		}
+
+		char current_path[4096];
+
+		snprintf(current_path, sizeof(current_path), "%s", sibling_path);
+		for (int j = 0; j < NEST_DEPTH; j++) {
+			snprintf(current_path + strlen(current_path),
+				 sizeof(current_path) - strlen(current_path), "/d%d", j);
+			if (mkdir(current_path, 0755) < 0 && errno != EEXIST) {
+				ksft_print_msg("mkdir deep %s failed: %s\n",
+					       current_path, strerror(errno));
+				return -1;
+			}
+
+			/* Enable for all but the leaf */
+			if (use_cgroup_v2 && j < NEST_DEPTH - 1) {
+				char ctrl_path[4096];
+
+				snprintf(ctrl_path, sizeof(ctrl_path), "%s/cgroup.subtree_control",
+					 current_path);
+				if (write_file(ctrl_path, "+cpu") < 0)
+					ksft_print_msg("WARN: cannot enable cpu controller in %s\n",
+						       current_path);
+			}
+		}
+	}
+
+	char quota[64], period[64], max_str[128];
+
+	snprintf(quota, sizeof(quota), "%d", CFS_QUOTA_US);
+	snprintf(period, sizeof(period), "%d", CFS_PERIOD_US);
+	snprintf(max_str, sizeof(max_str), "%d %d", CFS_QUOTA_US, CFS_PERIOD_US);
+
+	if (use_cgroup_v2) {
+		char max_path[4096];
+
+		snprintf(max_path, sizeof(max_path), "%s/cpu.max", g_cgroup_path);
+		if (write_file(max_path, max_str) < 0) {
+			ksft_print_msg("ERROR: cannot write cpu.max at %s\n", max_path);
+			return -1;
+		}
+		ksft_print_msg("cgroup (v2) %s: cpu.max=%s\n", g_cgroup_path, max_str);
+	} else {
+		char quota_path[4096], period_path[4096];
+
+		snprintf(quota_path, sizeof(quota_path), "%s/cpu.cfs_quota_us", g_cgroup_path);
+		snprintf(period_path, sizeof(period_path), "%s/cpu.cfs_period_us", g_cgroup_path);
+
+		if (write_file(period_path, period) < 0) {
+			ksft_print_msg("ERROR: cannot write cpu.cfs_period_us at %s\n",
+				       period_path);
+			return -1;
+		}
+		if (write_file(quota_path, quota) < 0) {
+			ksft_print_msg("ERROR: cannot write cpu.cfs_quota_us at %s\n", quota_path);
+			return -1;
+		}
+		ksft_print_msg("cgroup (v1) %s: cpu.cfs_quota_us=%d cpu.cfs_period_us=%d\n",
+			       g_cgroup_path, CFS_QUOTA_US, CFS_PERIOD_US);
+	}
+
+	return 0;
+}
+
+static int cgroup_add_pid_to_path(pid_t pid, const char *path)
+{
+	char buf[32], file_path[4096];
+
+	snprintf(buf, sizeof(buf), "%d", (int)pid);
+	if (use_cgroup_v2) {
+		snprintf(file_path, sizeof(file_path), "%s/cgroup.procs", path);
+		return write_file(file_path, buf);
+	}
+	/* In v1, try tasks first, fallback to cgroup.procs */
+	snprintf(file_path, sizeof(file_path), "%s/tasks", path);
+	int r = write_file(file_path, buf);
+
+	if (r < 0) {
+		snprintf(file_path, sizeof(file_path), "%s/cgroup.procs", path);
+		r = write_file(file_path, buf);
+	}
+	return r;
+}
+
+static void cgroup_teardown(void)
+{
+	rm_cgroup_recursive(g_cgroup_path);
+}
+
+static void cgroup_unthrottle(void)
+{
+	if (use_cgroup_v2) {
+		char max_path[4096];
+
+		snprintf(max_path, sizeof(max_path), "%s/cpu.max", g_cgroup_path);
+		write_file(max_path, "max");
+	} else {
+		char quota_path[4096];
+
+		snprintf(quota_path, sizeof(quota_path), "%s/cpu.cfs_quota_us", g_cgroup_path);
+		write_file(quota_path, "-1");
+	}
+}
+
+/* -- CPU burner (inside throttled child process) -- */
+static void *burner_thread_fn(void *arg)
+{
+	struct rseq_abi my_rseq;
+	int cpu = (int)(uintptr_t)arg;
+
+	memset(&my_rseq, 0, sizeof(my_rseq));
+	my_rseq.cpu_id = RSEQ_CPU_ID_UNINITIALIZED;
+
+	if (rseq_register_thread_at(&my_rseq) < 0) {
+		perror("rseq_register (burner)");
+		return NULL;
+	}
+
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	if (sched_setaffinity(0, sizeof(set), &set) < 0)
+		perror("sched_setaffinity (burner)");
+
+	unsigned long sink = 0;
+
+	while (!atomic_load_explicit(&g_stop, memory_order_relaxed)) {
+		sink++;
+		/* Prevent compiler from optimizing the loop away */
+		asm volatile("" : "+g"(sink));
+	}
+
+	return NULL;
+}
+
+static int burner_thread_fn_wrapper(void *arg)
+{
+	burner_thread_fn(arg);
+	return 0;
+}
+
+static int leaf_child_fn(void *arg)
+{
+	int i = (int)(uintptr_t)arg;
+	int total_burners = g_ncpus_stress * N_BURNER_PER_CPU;
+	int n_threads_per_leaf = total_burners / N_SIBLINGS;
+
+	if (i < (total_burners % N_SIBLINGS))
+		n_threads_per_leaf++;
+
+	prctl(PR_SET_PDEATHSIG, SIGTERM);
+	if (getppid() == 1)
+		_exit(1);
+
+	char leaf_path[4096];
+
+	snprintf(leaf_path, sizeof(leaf_path), "%s/n%d", g_cgroup_path, i);
+	for (int j = 0; j < NEST_DEPTH; j++)
+		snprintf(leaf_path + strlen(leaf_path),
+			 sizeof(leaf_path) - strlen(leaf_path), "/d%d", j);
+
+		int r = cgroup_add_pid_to_path(getpid(), leaf_path);
+
+		if (r < 0) {
+			char buf[512];
+			int len = snprintf(buf, sizeof(buf),
+					   "[leaf child %d] failed to join cgroup %s: err %d\n",
+					   i, leaf_path, -r);
+			(void)!write(2, buf, len);
+			_exit(1);
+		}
+
+	for (int j = 0; j < n_threads_per_leaf; j++) {
+		int cpu = g_stress_cpus[(i * n_threads_per_leaf + j) % g_ncpus_stress];
+
+		/* Allocate stack via mmap (bypasses heap) */
+		size_t stack_size = 64 * 1024;
+		void *stack = mmap(NULL, stack_size, PROT_READ | PROT_WRITE,
+				   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		if (stack == MAP_FAILED) {
+			const char *msg = "mmap stack failed\n";
+			(void)!write(2, msg, strlen(msg));
+			_exit(1);
+		}
+
+		/* Use raw clone to create a thread sharing the VM and thread group */
+		pid_t pid = clone(burner_thread_fn_wrapper, stack + stack_size,
+				  CLONE_VM | CLONE_THREAD | CLONE_SIGHAND,
+				  (void *)(uintptr_t)cpu);
+		if (pid < 0) {
+			const char *msg = "clone burner failed\n";
+			(void)!write(2, msg, strlen(msg));
+			_exit(1);
+		}
+	}
+
+	// Wait for SIGTERM
+	sigset_t mask;
+
+	sigemptyset(&mask);
+	sigaddset(&mask, SIGTERM);
+	int sig;
+
+	sigwait(&mask, &sig);
+
+	_exit(0);
+}
+
+struct leaf_info {
+	pid_t pid;
+	void *stack;
+};
+
+static int run_throttle_child(void *arg)
+{
+	(void)arg;
+	prctl(PR_SET_PDEATHSIG, SIGTERM);
+	if (getppid() == 1)
+		_exit(1);
+
+	int n_leafs = N_SIBLINGS;
+
+	/* Block signals before spawning to avoid missing early failures */
+	sigset_t mask;
+
+	sigemptyset(&mask);
+	sigaddset(&mask, SIGTERM);
+	sigaddset(&mask, SIGCHLD);
+	sigprocmask(SIG_BLOCK, &mask, NULL);
+
+	/* Use mmap for tracking structures to avoid glibc heap usage */
+	struct leaf_info *leaves = mmap(NULL, n_leafs * sizeof(struct leaf_info),
+					PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (leaves == MAP_FAILED) {
+		const char *msg = "mmap leaves array failed\n";
+		(void)!write(2, msg, strlen(msg));
+		_exit(1);
+	}
+
+	for (int i = 0; i < n_leafs; i++) {
+		size_t stack_size = 64 * 1024;
+		void *stack = mmap(NULL, stack_size, PROT_READ | PROT_WRITE,
+				   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		if (stack == MAP_FAILED) {
+			const char *msg = "mmap leaf stack failed\n";
+			(void)!write(2, msg, strlen(msg));
+			_exit(1);
+		}
+
+		leaves[i].stack = stack;
+
+		pid_t pid = clone(leaf_child_fn, stack + stack_size,
+				  CLONE_VM | SIGCHLD, (void *)(uintptr_t)i);
+
+		if (pid < 0) {
+			const char *msg = "clone (leaf child) failed\n";
+			(void)!write(2, msg, strlen(msg));
+
+			/* Clean up successfully spawned children */
+			for (int j = 0; j < i; j++) {
+				kill(leaves[j].pid, SIGTERM);
+				waitpid(leaves[j].pid, NULL, 0);
+				munmap(leaves[j].stack, stack_size);
+			}
+			munmap(leaves, n_leafs * sizeof(struct leaf_info));
+
+			if (errno == EAGAIN)
+				_exit(4);
+			else
+				_exit(1);
+		}
+		leaves[i].pid = pid;
+	}
+
+	int failed = 0;
+
+	while (1) {
+		int sig;
+
+		sigwait(&mask, &sig);
+
+		if (sig == SIGTERM) {
+			break;
+		} else if (sig == SIGCHLD) {
+			int status;
+			pid_t pid;
+
+			// Reap all dead children
+			while ((pid = waitpid(-1, &status, WNOHANG)) > 0) {
+				for (int i = 0; i < n_leafs; i++) {
+					if (leaves[i].pid == pid) {
+						leaves[i].pid = 0;
+						break;
+					}
+				}
+				if ((WIFEXITED(status) && WEXITSTATUS(status) != 0) ||
+				    WIFSIGNALED(status)) {
+					char buf[128];
+					int len = snprintf(buf, sizeof(buf),
+							   "[manager] child %d died unexpectedly (status %d)\n",
+							   pid, WEXITSTATUS(status));
+					(void)!write(2, buf, len);
+					failed = 1;
+				}
+			}
+			if (failed)
+				break;
+		}
+	}
+
+	// Terminate all leaf kids
+	for (int i = 0; i < n_leafs; i++) {
+		if (leaves[i].pid > 0)
+			kill(leaves[i].pid, SIGTERM);
+	}
+
+	for (int i = 0; i < n_leafs; i++) {
+		if (leaves[i].pid > 0)
+			waitpid(leaves[i].pid, NULL, 0);
+		munmap(leaves[i].stack, 64 * 1024);
+	}
+
+	munmap(leaves, n_leafs * sizeof(struct leaf_info));
+
+	_exit(failed ? 1 : 0);
+}
+
+/* -- Membarrier hammer thread -- */
+static void *hammer_thread_fn(void *arg)
+{
+	int target_cpu = *(int *)arg;
+	long local_ok = 0;
+	long local_err = 0;
+	int count = 0;
+	const int batch_size = 1024;
+
+	if (rseq_register_thread() < 0) {
+		ksft_print_msg("[hammer] rseq_register failed: %s\n", strerror(errno));
+		return NULL;
+	}
+
+	membarrier_register_rseq_mm();
+
+	while (!atomic_load_explicit(&g_stop, memory_order_relaxed)) {
+		int r = syscall(SYS_membarrier,
+				MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ,
+				MEMBARRIER_CMD_FLAG_CPU,
+				target_cpu);
+		if (__builtin_expect(r == 0, 1))
+			local_ok++;
+		else
+			local_err++;
+
+		count++;
+		if (__builtin_expect(count >= batch_size, 0)) {
+			atomic_fetch_add_explicit(&g_mb_ok, local_ok, memory_order_relaxed);
+			atomic_fetch_add_explicit(&g_mb_err, local_err, memory_order_relaxed);
+			local_ok = 0;
+			local_err = 0;
+			count = 0;
+		}
+	}
+
+	/* Flush any remaining counts on exit */
+	if (local_ok > 0)
+		atomic_fetch_add_explicit(&g_mb_ok, local_ok, memory_order_relaxed);
+	if (local_err > 0)
+		atomic_fetch_add_explicit(&g_mb_err, local_err, memory_order_relaxed);
+
+	return NULL;
+}
+
+/* -- Latency sentinel -- */
+static void *sentinel_thread_fn(void *arg)
+{
+	(void)arg;
+	struct sched_param sp = { .sched_priority = 20 };
+
+	if (sched_setscheduler(0, SCHED_FIFO, &sp) < 0)
+		ksft_print_msg("WARN: no SCHED_FIFO for sentinel (less precise)\n");
+
+	while (!atomic_load_explicit(&g_test_ready, memory_order_relaxed) &&
+	       !atomic_load_explicit(&g_stop_sentinel, memory_order_relaxed)) {
+		struct timespec ts = {0, 1000 * 1000}; /* 1ms */
+
+		clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
+	}
+
+	uint64_t prev = monotonic_us();
+
+	while (!atomic_load_explicit(&g_stop_sentinel, memory_order_relaxed)) {
+		struct timespec ts = {
+			.tv_sec  = 0,
+			.tv_nsec = SENTINEL_INTERVAL_US * 1000L,
+		};
+		clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
+
+		uint64_t now = monotonic_us();
+		long latency_us = (long)(now - prev) - SENTINEL_INTERVAL_US;
+
+		prev = now;
+
+		if (latency_us <= 0)
+			continue;
+
+		update_max_latency(latency_us);
+
+		if (latency_us > LATENCY_CRITICAL_MS * 1000L) {
+			ksft_print_msg("\n[SENTINEL] CRITICAL: %ld ms delay (lockup precursor!)\n",
+				latency_us / 1000);
+		} else if (latency_us > LATENCY_WARN_MS * 1000L) {
+			ksft_print_msg("\n[SENTINEL] WARN: %ld ms latency spike\n",
+				latency_us / 1000);
+		}
+	}
+	return NULL;
+}
+
+/* -- Progress reporter -- */
+static void *reporter_thread_fn(void *arg)
+{
+	(void)arg;
+	int elapsed = 0;
+
+	while (!atomic_load_explicit(&g_stop_sentinel, memory_order_relaxed)) {
+		for (int i = 0; i < 5; i++) {
+			sleep(1);
+			if (atomic_load_explicit(&g_stop_sentinel, memory_order_relaxed))
+				break;
+		}
+		if (atomic_load_explicit(&g_stop_sentinel, memory_order_relaxed))
+			break;
+		elapsed += 5;
+		long interval_max = atomic_exchange_explicit(&g_interval_max_latency_us,
+							     0, memory_order_relaxed);
+
+		ksft_print_msg("[%3ds] mb: ok=%-10ld err=%-8ld | max_lat=%ld us\n",
+		       elapsed,
+		       atomic_load(&g_mb_ok),
+		       atomic_load(&g_mb_err),
+		       interval_max);
+	}
+	return NULL;
+}
+
+/* -- Main -- */
+int main(void)
+{
+	ksft_print_header();
+#ifdef UNSUPPORTED_ARCH
+	ksft_exit_skip("Unsupported architecture\n");
+#endif
+	ksft_set_plan(1);
+
+	if (geteuid() != 0)
+		ksft_exit_skip("Must run as root (cgroup + SCHED_FIFO)\n");
+
+	init_stress_cpus();
+
+	ksft_print_msg("=== membarrier rseq + CFS unthrottle stress ===\n");
+	ksft_print_msg("Stressing CPUs: %d\n", g_ncpus_stress);
+	ksft_print_msg("Quota: %d/%d us  (~%d unthrottles/sec/CPU)\n",
+	       CFS_QUOTA_US, CFS_PERIOD_US,
+	       1000000 / CFS_PERIOD_US);
+	ksft_print_msg("Hammer threads: %d per CPU (%d total)\n",
+	       N_HAMMER_PER_CPU, g_ncpus_stress * N_HAMMER_PER_CPU);
+	ksft_print_msg("Duration: %d seconds\n\n", TEST_DURATION_SEC);
+
+	if (cgroup_setup() < 0) {
+		cgroup_teardown();
+		ksft_exit_skip("cgroup_setup failed (missing permissions or v2 ctrls?)\n");
+	}
+
+	if (rseq_register_thread() < 0) {
+		ksft_print_msg("rseq_register (%s) failed: %s\n", __func__, strerror(errno));
+		cgroup_teardown();
+		ksft_exit_skip("rseq syscall failed or not available\n");
+	}
+	if (membarrier_register_rseq_mm() < 0) {
+		ksft_print_msg("MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ: %s\n"
+			"Kernel >= 5.10 with CONFIG_RSEQ required.\n",
+			strerror(errno));
+		cgroup_teardown();
+		ksft_exit_skip("membarrier register failed\n");
+	}
+	ksft_print_msg("rseq membarrier registered OK\n");
+
+	sigset_t sigmask;
+
+	sigemptyset(&sigmask);
+	sigaddset(&sigmask, SIGTERM);
+	sigprocmask(SIG_BLOCK, &sigmask, NULL);
+
+	void *stack = malloc(1024 * 1024);
+
+	if (!stack) {
+		perror("malloc stack");
+		cgroup_teardown();
+		ksft_exit_fail_msg("Malloc stack failed\n");
+	}
+	pid_t child = clone(run_throttle_child, stack + 1024 * 1024, CLONE_VM | SIGCHLD, NULL);
+
+	if (child < 0) {
+		perror("clone");
+		cgroup_teardown();
+		ksft_exit_fail_msg("Clone failed\n");
+	}
+
+	sigprocmask(SIG_UNBLOCK, &sigmask, NULL);
+	ksft_print_msg("Throttle child PID %d started\n", child);
+
+	int n_threads = g_ncpus_stress * N_HAMMER_PER_CPU + 2;
+	pthread_t *threads = (pthread_t *)calloc(n_threads, sizeof(pthread_t));
+	int       *cpuargs = (int *)calloc(g_ncpus_stress * N_HAMMER_PER_CPU, sizeof(int));
+
+	if (!threads || !cpuargs) {
+		perror("calloc");
+		kill(child, SIGTERM);
+		waitpid(child, NULL, 0);
+		cgroup_teardown();
+		ksft_exit_fail_msg("Thread allocation failed\n");
+	}
+
+	int ti = 0, ai = 0;
+	int r;
+
+	ksft_print_msg("Creating sentinel thread...\n");
+	r = pthread_create(&threads[ti], NULL, sentinel_thread_fn, NULL);
+	if (r != 0) {
+		kill(child, SIGTERM);
+		waitpid(child, NULL, 0);
+		cgroup_teardown();
+		free(threads);
+		free(cpuargs);
+		free(g_stress_cpus);
+		ksft_exit_fail_msg("pthread_create (sentinel) failed: %s\n", strerror(r));
+	}
+	ti++;
+
+	ksft_print_msg("Creating reporter thread...\n");
+	r = pthread_create(&threads[ti], NULL, reporter_thread_fn, NULL);
+	if (r != 0) {
+		atomic_store(&g_stop_sentinel, 1);
+		pthread_join(threads[0], NULL);
+		kill(child, SIGTERM);
+		waitpid(child, NULL, 0);
+		cgroup_teardown();
+		free(threads);
+		free(cpuargs);
+		free(g_stress_cpus);
+		ksft_exit_fail_msg("pthread_create (reporter) failed: %s\n", strerror(r));
+	}
+	ti++;
+
+	ksft_print_msg("Creating %d hammer threads...\n", g_ncpus_stress * N_HAMMER_PER_CPU);
+	for (int i = 0; i < g_ncpus_stress; i++) {
+		int cpu = g_stress_cpus[i];
+
+		for (int j = 0; j < N_HAMMER_PER_CPU; j++) {
+			cpuargs[ai] = cpu;
+			r = pthread_create(&threads[ti], NULL, hammer_thread_fn, &cpuargs[ai]);
+			if (r != 0) {
+				ksft_print_msg("pthread_create failed at thread %d: %s\n",
+					       ti, strerror(r));
+
+				atomic_store(&g_stop_sentinel, 1);
+				pthread_join(threads[0], NULL);
+				pthread_join(threads[1], NULL);
+
+				atomic_store(&g_stop, 1);
+				for (int k = 2; k < ti; k++)
+					pthread_join(threads[k], NULL);
+
+				kill(child, SIGTERM);
+				waitpid(child, NULL, 0);
+				cgroup_teardown();
+
+				free(threads);
+				free(cpuargs);
+				free(g_stress_cpus);
+
+				if (r == EAGAIN)
+					ksft_exit_skip("Resource limits prevent threads\n");
+				else
+					ksft_exit_fail_msg("Failed to create hammer thread\n");
+			}
+			ti++;
+			ai++;
+		}
+	}
+
+	ksft_print_msg("All threads running. Tip: monitor dmesg for lockups\n\n");
+
+	atomic_store_explicit(&g_test_ready, 1, memory_order_relaxed);
+	int child_failed = 0;
+	int child_status = 0;
+
+	for (int i = 0; i < TEST_DURATION_SEC; i++) {
+		sleep(1);
+		int r = waitpid(child, &child_status, WNOHANG);
+
+		if (r == child) {
+			child_failed = 1;
+			break;
+		}
+	}
+
+	atomic_store(&g_stop_sentinel, 1);
+	pthread_join(threads[0], NULL);
+	pthread_join(threads[1], NULL);
+
+	atomic_store(&g_stop, 1);
+
+	/* Unthrottle to allow children to exit quickly */
+	cgroup_unthrottle();
+
+	if (!child_failed) {
+		kill(child, SIGTERM);
+		waitpid(child, NULL, 0);
+	}
+	for (int i = 2; i < ti; i++)
+		pthread_join(threads[i], NULL);
+
+	long max_lat   = atomic_load(&g_max_latency_us);
+	long total_ok  = atomic_load(&g_mb_ok);
+	long total_err = atomic_load(&g_mb_err);
+
+	ksft_print_msg("\n=== RESULTS ===\n");
+	ksft_print_msg("membarrier syscalls : %ld ok  %ld errors\n", total_ok, total_err);
+	ksft_print_msg("Max scheduler latency: %ld us  (%ld ms)\n", max_lat, max_lat / 1000);
+	cgroup_teardown();
+	free(threads);
+	free(cpuargs);
+	free(g_stress_cpus);
+
+	if (child_failed) {
+		if (WIFEXITED(child_status) && WEXITSTATUS(child_status) == 4)
+			ksft_exit_skip("Manager child skipped (resource limits?)\n");
+		ksft_test_result_fail("membarrier_rseq_stress: Manager child died early\n");
+		ksft_exit_fail();
+	} else if (total_ok == 0) {
+		ksft_test_result_fail("membarrier_rseq_stress: No successful membarrier calls\n");
+		ksft_exit_fail();
+	} else if (total_err > 0) {
+		ksft_test_result_fail("membarrier_rseq_stress: syscall errors\n");
+		ksft_exit_fail();
+	} else if (max_lat > LATENCY_CRITICAL_MS * 1000L) {
+		ksft_test_result_fail("membarrier_rseq_stress: LOCKUP PRECURSOR\n");
+		ksft_exit_fail();
+	} else if (max_lat > LATENCY_WARN_MS * 1000L) {
+		ksft_test_result_fail("membarrier_rseq_stress: significant latency spike\n");
+		ksft_exit_fail();
+	} else {
+		ksft_test_result_pass("membarrier_rseq_stress\n");
+		ksft_exit_pass();
+	}
+
+	return 0;
+}
-- 
2.54.0.545.g6539524ca2-goog

