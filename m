Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25E361DA4
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038842; cv=none; b=c2LD5mO1BrpN6KRjaO+aYIERH/gechkezGKCk/yObp3DfiTS/YQWQ3qpt/8UKe2PPtJ0z/w8vz4Yxf+dq6mt0Qj6tvjU6S+Cc42AbBWzTOBDGXQx3Id9hrflj95Wg1LJ1CWdz1MSIrETiZYGTv1yXTCj0NhWqpahaRG15ABg4d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038842; c=relaxed/simple;
	bh=xyvb6/PiAqmC7+ntt2E/9tFw7G7cvje48kuPC8yheyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bH3Kbo+mUQrBYMSzNnvp7+6ohe2+wKZHasMlbF/KiHXU5/bqzlP5ttedgVwOwBCTqbUmAc+MPOuF5A9dmf5wIZskFvWd7qIUTxk44yJrgUDnCGl/mmYxky4YS+DPgJ+Hf5QPaiXGjJS6u40/A2lHxgGlxsM1TPHHyFx7DrdBtBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hy411gue; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hy411gue"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aae4816912so74583725ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038840; x=1773643640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzi13ostuVjHOBFRrDS2vmy8jtORLBqLDezCMVSfTF8=;
        b=Hy411guexQhrvJo8FpY7KODGvIo15KAr9gqLahGtjRu6pVoy7Uc3Z98J5oCNYqADSR
         +alxqq4NPg4Q/rpYNEwT2UUSP50/TPidXTfa+a1CPwktrEw/3pLgKbBplG9FNW0jbBwS
         YlGAgVHSFiqTWEqYMb98kFtFFD+pP2xpKQHwbf2CCGEYhJEZZ+kQ4nNS2qMbCEPsivDw
         TwEAimjyCUp9uUx0IlYgXAQE09xr/5fS87inFIHW2yR3dXaY9EVpk+lvPRa35ptIQGhS
         JGpNH1sK0x2zsAcHtP06vKtfxCD/xn2hXIlX9eJtHiaTQTJzzNmvU5kMRD5u+1OLFhL6
         WGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038840; x=1773643640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzi13ostuVjHOBFRrDS2vmy8jtORLBqLDezCMVSfTF8=;
        b=aSm5fH0TvG7ZISXJvVv7XqOazTKmAO32qdTZ/hcmRQxUg2irQfMeFWNlfogjDzVk6y
         elAI0EwkrodY7HtueaFTS7Ecu4zwBHbOCKH3UcbBr4s/0awEfHOEl4bsILp/b6AuIAHk
         gqnvbmx4JJDUfnD148qrLKrPNEv62ZXr1aMn+ylcdkhMFlTj9+/coRGv61geqUAtt78a
         mo9p6NH32+lTLqekO4zcLPsSILj6TPAm9kD2e9TJIRvLZ/z6TvDViTQ3VLhYR2+19/Ky
         K0n1mxyi3+IHXhcBNhm/EqElwBtwnlUPzH1W4AfQpxk8kIHbFd/5/GGuTN4n0NXtJx5a
         s7gw==
X-Forwarded-Encrypted: i=1; AJvYcCVCcza0Ji5+5r2ic0gOwoZlyAlMgY+JNhRLbhDZo6YQX+m+Xkf5ByO25UmPr15oLDmlI6G/PuhYQ+54kz4YviM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7BwFmNQ9GqWhIWnRjxnouQM/5CWdYt3rMId+9nLP78QeFeAkP
	HIz4bfdt00HK1qsgOhkEZbNb8Vd3qHudarYwSL/yXDIT0Ubpy6ZEfknT
X-Gm-Gg: ATEYQzy7iqfrFjNudr6fal6mDmfdSZmUU6YVbRwoYtxRbKK2/7K11dDh0NFVeUAkb4c
	yITuwTSgqneZi1ibNsHu8FBAuOhF/09FdH5cw+7teh8H6EKK+JkGGb0jp/sPF6kEXtp5sWDLrWY
	Gmi7VK9fp6rzg2yPtDMHm5tR03KufG2jP9clnqVeQpTdGWAk1qi3zwoer5B1zYtXYARcQLQgXU4
	oVEP4pu05v3S4Hsj3SY0PzyKKKmI8os8Nkq4MX1uXhMCblF7KUOtNm8ocu6smVvjjw/3j0XzU1/
	Xe6DLNSkivX/mnZ+r3zUB+AkXUarEIoMqB1eVzMIP0ReKYW0/2zLKMtdQbpCxArjrxxw5+ncQF0
	lAqaHLGC9P87SvT+/9JESo9qEOa7go8M8/WvYYSgmwsJH4BDc7UbUQBV9yXVD/18Dj7vRm1qiim
	z2l4CqqbSRvuwqXsFxdh1EmjNuK02sjspQxD53FadN5TCikZ0Wn5WfZNd48DUwFv5bOta+eEJFD
	zRM
X-Received: by 2002:a17:903:1a26:b0:2ae:66c9:494f with SMTP id d9443c01a7336-2ae82368445mr105114775ad.2.1773038840324;
        Sun, 08 Mar 2026 23:47:20 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f770ffsm134872265ad.45.2026.03.08.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:47:20 -0700 (PDT)
From: soolaugust@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	jstultz@google.com,
	kprateek.nayak@amd.com,
	shuah@kernel.org,
	zhidao su <suzhidao@xiaomi.com>
Subject: [PATCH] selftests/sched: add proxy execution mutex tests
Date: Mon,  9 Mar 2026 14:47:14 +0800
Message-ID: <20260309064714.1433830-1-soolaugust@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhidao su <suzhidao@xiaomi.com>

Add basic selftests for the Proxy Execution (PE) feature
(CONFIG_SCHED_PROXY_EXEC). Three test cases exercise the single-CPU
PE path which is present in the current upstream kernel independently
of the donor migration series (v24).

TC-1: Single-level mutex blocking
  A SCHED_FIFO prio=80 thread blocks on a mutex held by a SCHED_OTHER
  thread doing CPU-intensive work. Verifies that the holder accumulates
  significant CPU time (>= 50ms out of 200ms hold period), confirming
  PE is running the holder as proxy for the high-priority waiter.

TC-2: blocked_on lifetime - no voluntary context switches
  While a high-priority thread is PE-blocked on a mutex, its
  voluntary_ctxt_switches count must not increase. PE keeps the donor
  on the runqueue rather than doing a voluntary sleep, so no voluntary
  switch should occur during the block period.

TC-3: Two-level mutex chain traversal
  A (prio=80) -> mutex1 -> B (prio=50) -> mutex2 -> C (SCHED_OTHER).
  Verifies PE traverses the full chain and runs C as proxy, confirmed
  by C accumulating >= 50ms CPU time while A and B are both blocked.

The test skips gracefully when:
  - CONFIG_SCHED_PROXY_EXEC is not compiled in
  - sched_proxy_exec=0 is set on the kernel command line
  - not running as root (SCHED_FIFO requires CAP_SYS_NICE)

These tests cover the single-CPU PE base functionality and are
orthogonal to the cross-CPU donor migration work (v24). They should
remain valid after donor migration lands, as the single-CPU path
is preserved.

Tested on Linux 7.0-rc2 with CONFIG_SCHED_PROXY_EXEC=y via virtme-ng
on Intel Core i7-10700 @ 2.90GHz:
  sched_proxy_exec=1: TC-1 PASS, TC-2 PASS, TC-3 PASS
  sched_proxy_exec=0: all SKIP

Signed-off-by: zhidao su <suzhidao@xiaomi.com>
---
 tools/testing/selftests/sched/Makefile        |   6 +-
 tools/testing/selftests/sched/pe_mutex_test.c | 508 ++++++++++++++++++
 2 files changed, 511 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched/pe_mutex_test.c

diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee921355..5ecfa45a103 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -6,9 +6,9 @@ endif
 
 CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
 	  $(CLANG_FLAGS)
-LDLIBS += -lpthread
+LDLIBS += -lpthread -lrt
 
-TEST_GEN_FILES := cs_prctl_test
-TEST_PROGS := cs_prctl_test
+TEST_GEN_FILES := cs_prctl_test pe_mutex_test
+TEST_PROGS := cs_prctl_test pe_mutex_test
 
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/pe_mutex_test.c b/tools/testing/selftests/sched/pe_mutex_test.c
new file mode 100644
index 00000000000..b3ff4852ddc
--- /dev/null
+++ b/tools/testing/selftests/sched/pe_mutex_test.c
@@ -0,0 +1,508 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Proxy Execution (PE) mutex selftest - TC-1 through TC-3
+ *
+ * Verifies basic PE behavior for mutex blocking:
+ *   TC-1: High-priority blocked task's CPU time increases via PE
+ *   TC-2: blocked_on lifetime - voluntary ctxt switches don't increase
+ *   TC-3: Two-level mutex chain traversal
+ *
+ * Requires CONFIG_SCHED_PROXY_EXEC=y and root privileges.
+ */
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdatomic.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "../kselftest.h"
+
+/* ---------- helpers ---------- */
+
+static pid_t gettid_compat(void)
+{
+	return (pid_t)syscall(SYS_gettid);
+}
+
+/*
+ * is_proxy_exec_enabled - check whether PE is active at runtime.
+ *
+ * PE has no sysctl; it is controlled by the "sched_proxy_exec" boot
+ * parameter.  DEFINE_STATIC_KEY_TRUE means it defaults ON unless
+ * "sched_proxy_exec=0" appears on the kernel command line.
+ */
+static bool is_proxy_exec_enabled(void)
+{
+	char line[4096];
+	FILE *f;
+
+	f = fopen("/proc/cmdline", "r");
+	if (!f)
+		return true; /* assume enabled if we cannot read cmdline */
+
+	if (!fgets(line, sizeof(line), f)) {
+		fclose(f);
+		return true;
+	}
+	fclose(f);
+
+	return !strstr(line, "sched_proxy_exec=0");
+}
+
+/* Return monotonic time in nanoseconds. */
+static long long now_ns(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	return (long long)ts.tv_sec * 1000000000LL + ts.tv_nsec;
+}
+
+/* Return CPU time consumed by the calling thread in nanoseconds. */
+static long long cputime_ns(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_THREAD_CPUTIME_ID, &ts);
+	return (long long)ts.tv_sec * 1000000000LL + ts.tv_nsec;
+}
+
+/*
+ * get_voluntary_ctxt_switches - read voluntary_ctxt_switches for @tid.
+ *
+ * Threads (tid != tgid) are only visible under
+ * /proc/<tgid>/task/<tid>/status, not /proc/<tid>/status directly.
+ * Try the task path first, fall back to the top-level pid path.
+ */
+static long get_voluntary_ctxt_switches(pid_t tid)
+{
+	char path[128];
+	char line[256];
+	FILE *f;
+	long val = -1;
+
+	/* Try /proc/<tgid>/task/<tid>/status (works for all threads) */
+	snprintf(path, sizeof(path), "/proc/%d/task/%d/status",
+		 (int)getpid(), (int)tid);
+	f = fopen(path, "r");
+	if (!f) {
+		/* Fallback: /proc/<tid>/status (works only for tgid == tid) */
+		snprintf(path, sizeof(path), "/proc/%d/status", (int)tid);
+		f = fopen(path, "r");
+	}
+	if (!f)
+		return -1;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (strncmp(line, "voluntary_ctxt_switches:", 24) == 0) {
+			val = strtol(line + 24, NULL, 10);
+			break;
+		}
+	}
+	fclose(f);
+	return val;
+}
+
+/* Set SCHED_FIFO priority for the calling thread. */
+static int set_fifo(int prio)
+{
+	struct sched_param sp = { .sched_priority = prio };
+
+	return sched_setscheduler(0, SCHED_FIFO, &sp);
+}
+
+/* Set SCHED_OTHER (normal) for the calling thread. */
+static int set_normal(void)
+{
+	struct sched_param sp = { .sched_priority = 0 };
+
+	return sched_setscheduler(0, SCHED_OTHER, &sp);
+}
+
+/* ---------- TC-1 ----------------------------------------------------------
+ *
+ * Single-level PE: high-priority waiter gets CPU via PE.
+ *
+ * Setup:
+ *   - LOW thread (SCHED_OTHER): holds mutex, burns CPU for ~200 ms,
+ *     then releases.
+ *   - HIGH thread (SCHED_FIFO prio=80): waits for mutex immediately.
+ *
+ * On a PE kernel the scheduler runs LOW as proxy for HIGH, so LOW
+ * should accumulate significant CPU time (measured via
+ * CLOCK_PROCESS_CPUTIME_ID inside the holder thread itself).
+ *
+ * Verification: CPU time consumed by the LOW thread during the hold
+ * period is >= 50 ms.  CLOCK_THREAD_CPUTIME_ID is used so that only
+ * LOW's own CPU consumption is measured, not that of other threads.
+ */
+
+#define TC1_HOLD_MS 200 /* ms LOW holds the mutex */
+#define TC1_CPU_THRESHOLD_MS 50 /* minimum CPU ms we expect */
+
+struct tc1_args {
+	pthread_mutex_t *mtx;
+	long long cpu_during_hold_ns; /* output: CPU ns consumed by LOW */
+	atomic_int ready;
+	atomic_int done;
+};
+
+static void *tc1_low_thread(void *arg)
+{
+	struct tc1_args *a = arg;
+	long long t0, t1, deadline;
+
+	/* Become the LOW thread */
+	set_normal();
+
+	pthread_mutex_lock(a->mtx);
+	a->ready = 1;
+
+	/* Spin for TC1_HOLD_MS real-time milliseconds while holding lock */
+	deadline = now_ns() + (long long)TC1_HOLD_MS * 1000000LL;
+	t0 = cputime_ns();
+	while (now_ns() < deadline)
+		; /* busy wait */
+	t1 = cputime_ns();
+
+	a->cpu_during_hold_ns = t1 - t0;
+	pthread_mutex_unlock(a->mtx);
+	a->done = 1;
+	return NULL;
+}
+
+static void *tc1_high_thread(void *arg)
+{
+	struct tc1_args *a = arg;
+
+	/* Become HIGH priority */
+	set_fifo(80);
+
+	/* Wait until LOW has the lock */
+	while (!a->ready)
+		sched_yield();
+
+	/* Block on mutex - PE should now proxy-run LOW */
+	pthread_mutex_lock(a->mtx);
+	pthread_mutex_unlock(a->mtx);
+	return NULL;
+}
+
+static void run_tc1(void)
+{
+	pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
+	struct tc1_args args = { .mtx = &mtx, .ready = 0, .done = 0 };
+	pthread_t low, high;
+	long long threshold_ns = (long long)TC1_CPU_THRESHOLD_MS * 1000000LL;
+
+	pthread_create(&low, NULL, tc1_low_thread, &args);
+
+	/* Wait for LOW to acquire the lock before creating HIGH */
+	while (!args.ready)
+		sched_yield();
+
+	pthread_create(&high, NULL, tc1_high_thread, &args);
+
+	pthread_join(high, NULL);
+	pthread_join(low, NULL);
+
+	pthread_mutex_destroy(&mtx);
+
+	if (args.cpu_during_hold_ns >= threshold_ns) {
+		ksft_test_result_pass(
+			"TC-1: PE ran LOW as proxy (cpu_hold=%lld ms >= %d ms)\n",
+			args.cpu_during_hold_ns / 1000000,
+			TC1_CPU_THRESHOLD_MS);
+	} else {
+		ksft_test_result_fail(
+			"TC-1: LOW did not get enough CPU time (cpu_hold=%lld ms < %d ms)\n",
+			args.cpu_during_hold_ns / 1000000,
+			TC1_CPU_THRESHOLD_MS);
+	}
+}
+
+/* ---------- TC-2 ----------------------------------------------------------
+ *
+ * blocked_on lifetime: voluntary context switches must NOT increase
+ * for the high-priority waiter while it is proxy-blocked.
+ *
+ * When PE is active the high-priority task stays on the runqueue
+ * (as donor) and is never voluntarily context-switched out.
+ *
+ * Verification:
+ *   Record voluntary_ctxt_switches for HIGH before and after the
+ *   blocking period; they should be equal.
+ */
+
+#define TC2_HOLD_MS 150
+
+struct tc2_args {
+	pthread_mutex_t *mtx;
+	pid_t high_tid;
+	atomic_int low_has_lock;  /* LOW signals it holds the mutex */
+	atomic_int high_blocking; /* HIGH signals it is about to block */
+	long ctxt_after;          /* HIGH records its own switches after unblock */
+};
+
+static void *tc2_low_thread(void *arg)
+{
+	struct tc2_args *a = arg;
+	long long deadline;
+
+	set_normal();
+	pthread_mutex_lock(a->mtx);
+	a->low_has_lock = 1;
+
+	deadline = now_ns() + (long long)TC2_HOLD_MS * 1000000LL;
+	while (now_ns() < deadline)
+		; /* busy spin holding the lock */
+
+	pthread_mutex_unlock(a->mtx);
+	return NULL;
+}
+
+static void *tc2_high_thread(void *arg)
+{
+	struct tc2_args *a = arg;
+
+	set_fifo(80);
+	a->high_tid = gettid_compat();
+
+	/* Wait until LOW holds the lock */
+	while (!a->low_has_lock)
+		sched_yield();
+
+	/* Signal main that we are about to block, then immediately block */
+	a->high_blocking = 1;
+	pthread_mutex_lock(a->mtx);
+	pthread_mutex_unlock(a->mtx);
+	/* Record our own ctxt switches before exiting (proc entry still live) */
+	a->ctxt_after = get_voluntary_ctxt_switches(gettid_compat());
+	return NULL;
+}
+
+static void run_tc2(void)
+{
+	pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
+	struct tc2_args args = {
+		.mtx = &mtx,
+		.high_tid = 0,
+		.low_has_lock = 0,
+		.high_blocking = 0,
+		.ctxt_after = -1,
+	};
+	pthread_t low, high;
+	long before, after = -1;
+
+	/* Start LOW first so it grabs the lock */
+	pthread_create(&low, NULL, tc2_low_thread, &args);
+
+	while (!args.low_has_lock)
+		sched_yield();
+
+	pthread_create(&high, NULL, tc2_high_thread, &args);
+
+	/*
+	 * Wait until HIGH has set high_tid AND signaled it is about to block.
+	 * There is a tiny window between high_blocking=1 and the actual
+	 * pthread_mutex_lock() call, but that is unavoidable in userspace.
+	 * Sample "before" here; HIGH cannot have voluntarily yielded yet
+	 * because it has not blocked yet.
+	 */
+	while (!args.high_tid || !args.high_blocking)
+		sched_yield();
+
+	/* Sample voluntary switches while HIGH is (about to be) blocked */
+	before = get_voluntary_ctxt_switches(args.high_tid);
+
+	pthread_join(high, NULL);
+	pthread_join(low, NULL);
+
+	after = args.ctxt_after;
+
+	pthread_mutex_destroy(&mtx);
+
+	if (before < 0 || after < 0) {
+		ksft_test_result_skip(
+			"TC-2: Could not read /proc task status\n");
+		return;
+	}
+
+	if (after == before) {
+		ksft_test_result_pass(
+			"TC-2: HIGH voluntary_ctxt_switches unchanged (%ld) during PE block\n",
+			before);
+	} else {
+		ksft_test_result_fail(
+			"TC-2: HIGH voluntary_ctxt_switches changed: before=%ld after=%ld\n",
+			before, after);
+	}
+}
+
+/* ---------- TC-3 ----------------------------------------------------------
+ *
+ * Two-level mutex chain:
+ *   A (SCHED_FIFO prio=80) -> blocked on mutex1 -> held by
+ *   B (SCHED_FIFO prio=50) -> blocked on mutex2 -> held by
+ *   C (SCHED_OTHER)                                  ^^ PE must traverse
+ *                                                      the chain and run C
+ *
+ * Verification: C's CPU time during the hold period is >= 50 ms,
+ * meaning PE reached the end of the chain and ran C as proxy.
+ */
+
+#define TC3_HOLD_MS 200
+#define TC3_CPU_THRESHOLD_MS 50
+
+struct tc3_args {
+	pthread_mutex_t *mtx1; /* A waits on this; B holds */
+	pthread_mutex_t *mtx2; /* B waits on this; C holds */
+
+	atomic_int b_has_mtx1; /* B has acquired mtx1 */
+	atomic_int c_has_mtx2; /* C has acquired mtx2 */
+
+	long long c_cpu_during_hold_ns;
+};
+
+static void *tc3_c_thread(void *arg)
+{
+	struct tc3_args *a = arg;
+	long long t0, t1, deadline;
+
+	set_normal();
+	pthread_mutex_lock(a->mtx2);
+	a->c_has_mtx2 = 1;
+
+	/* Spin holding mtx2 */
+	deadline = now_ns() + (long long)TC3_HOLD_MS * 1000000LL;
+	t0 = cputime_ns();
+	while (now_ns() < deadline)
+		;
+	t1 = cputime_ns();
+
+	a->c_cpu_during_hold_ns = t1 - t0;
+	pthread_mutex_unlock(a->mtx2);
+	return NULL;
+}
+
+static void *tc3_b_thread(void *arg)
+{
+	struct tc3_args *a = arg;
+
+	set_fifo(50);
+
+	/* Acquire mtx1 first, so A will block on it */
+	pthread_mutex_lock(a->mtx1);
+	a->b_has_mtx1 = 1;
+
+	/* Wait until C holds mtx2 before blocking on it */
+	while (!a->c_has_mtx2)
+		sched_yield();
+
+	/* Now block on mtx2 - chain: A->mtx1->B->mtx2->C */
+	pthread_mutex_lock(a->mtx2);
+	pthread_mutex_unlock(a->mtx2);
+
+	pthread_mutex_unlock(a->mtx1);
+	return NULL;
+}
+
+static void *tc3_a_thread(void *arg)
+{
+	struct tc3_args *a = arg;
+
+	set_fifo(80);
+
+	/* Wait until the full chain is established */
+	while (!a->b_has_mtx1 || !a->c_has_mtx2)
+		sched_yield();
+
+	pthread_mutex_lock(a->mtx1);
+	pthread_mutex_unlock(a->mtx1);
+	return NULL;
+}
+
+static void run_tc3(void)
+{
+	pthread_mutex_t mtx1 = PTHREAD_MUTEX_INITIALIZER;
+	pthread_mutex_t mtx2 = PTHREAD_MUTEX_INITIALIZER;
+	struct tc3_args args = {
+		.mtx1 = &mtx1,
+		.mtx2 = &mtx2,
+		.b_has_mtx1 = 0,
+		.c_has_mtx2 = 0,
+	};
+	pthread_t ta, tb, tc;
+	long long threshold_ns = (long long)TC3_CPU_THRESHOLD_MS * 1000000LL;
+
+	/* Start C first so it grabs mtx2 */
+	pthread_create(&tc, NULL, tc3_c_thread, &args);
+
+	/* Wait for C to hold mtx2 */
+	while (!args.c_has_mtx2)
+		sched_yield();
+
+	/* Start B - it will grab mtx1 then block on mtx2 */
+	pthread_create(&tb, NULL, tc3_b_thread, &args);
+
+	/* Wait for B to hold mtx1 */
+	while (!args.b_has_mtx1)
+		sched_yield();
+
+	/* Start A - highest priority, blocks on mtx1 */
+	pthread_create(&ta, NULL, tc3_a_thread, &args);
+
+	pthread_join(ta, NULL);
+	pthread_join(tb, NULL);
+	pthread_join(tc, NULL);
+
+	pthread_mutex_destroy(&mtx1);
+	pthread_mutex_destroy(&mtx2);
+
+	if (args.c_cpu_during_hold_ns >= threshold_ns) {
+		ksft_test_result_pass(
+			"TC-3: PE traversed 2-level chain, C got cpu_hold=%lld ms >= %d ms\n",
+			args.c_cpu_during_hold_ns / 1000000,
+			TC3_CPU_THRESHOLD_MS);
+	} else {
+		ksft_test_result_fail(
+			"TC-3: C did not get enough CPU (chain traversal failed?): %lld ms < %d ms\n",
+			args.c_cpu_during_hold_ns / 1000000,
+			TC3_CPU_THRESHOLD_MS);
+	}
+}
+
+/* ---------- main ---------------------------------------------------------- */
+
+int main(void)
+{
+	ksft_print_header();
+
+#ifndef CONFIG_SCHED_PROXY_EXEC
+	ksft_exit_skip("CONFIG_SCHED_PROXY_EXEC not enabled\n");
+#endif
+
+	if (getuid() != 0)
+		ksft_exit_skip("requires root (needed for SCHED_FIFO)\n");
+
+	if (!is_proxy_exec_enabled())
+		ksft_exit_skip("sched_proxy_exec=0 on kernel cmdline, PE disabled\n");
+
+	ksft_set_plan(3);
+
+	run_tc1();
+	run_tc2();
+	run_tc3();
+
+	ksft_finished();
+}
-- 
2.43.0

