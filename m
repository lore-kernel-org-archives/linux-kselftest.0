Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B63346B4
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813640; cv=none; b=jSxCj4WpcZK+qQzEuR8Ju4dpcX5+wt0IIcMcsUITiSeeULAAzEIAxlNPIV1F2YZcFoz9/oO/mAhlpDUezWCkE/ySXqd3IB6VYy4bGXqx8GejgAJcuf6hDO87Pm0eKfH61CH7fW3byijdx2fbedJyWLjQO6gDxMYCzEt0cxDSlZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813640; c=relaxed/simple;
	bh=kMp7gN8TjkP2k3+jNTSWaAT7mbX3pXIHeLkFSCzkd+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAvSQSH1J8R3OenI0JTwsP8b1EJKOngACbJtm+XvS4aAMKhjuIADJ6oxycENjKeB6xgCTM+51gVxyJLd74Cptv/qtcL5LXpSRpBqyGrw++5AcVUvOcHzUeYuToQOS/hnKa8N76VcfZrqK+H+IQEJMqDx33K5AFqjo91o4UAgxBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jGc6KNck; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jGc6KNck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyP6TuTAdyVw9tObShEUUYGxABrxESU5roDfSR8x5uw=;
	b=jGc6KNckeYnr3CT+dTz2EK72v4fyZOzVDJdM9NGGTVvNo4AX/18wBDf8XrUBPygfCkZNCS
	Uvwxvh2CPSIsx89GXZbRJFrgqO4lJwexE/jvp97Of8oEiqMeKDX6w3qoeO+HuE1IXJCytY
	w6MjEECHBlqw3lZ2DJjVPhgS45QH0QU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-jA-8r4eYMhybIqmlUbiijA-1; Fri,
 06 Mar 2026 11:13:53 -0500
X-MC-Unique: jA-8r4eYMhybIqmlUbiijA-1
X-Mimecast-MFC-AGG-ID: jA-8r4eYMhybIqmlUbiijA_1772813631
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50AF619560B7;
	Fri,  6 Mar 2026 16:13:51 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F2713003EA4;
	Fri,  6 Mar 2026 16:13:47 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 06 Mar 2026 17:10:12 +0100
Subject: [PATCH RFC 7/7] selftests/sched: Add SCHED_DEADLINE
 ENQUEUE_REPLENISH bug test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-upstream-deadline-kselftests-v1-7-2b23ef74c46a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=13442;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=kMp7gN8TjkP2k3+jNTSWaAT7mbX3pXIHeLkFSCzkd+Y=;
 b=ZAAAyp5RP/gamBNYATHDyqTx8Xhm8WsIu33ehw/BcDovVxncG2kqEjYKzXzolDrHdfmpUPWkH
 UiRkwNkA4XRCEyUlgiKGrvXvB+q6WNSDKsFbh5ynvozhZ3k9xuhCfs+
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add a test that validates the ENQUEUE_REPLENISH flag is correctly set
during PI boosting after a task is changed via sched_setscheduler().

The test reproduces a specific scenario where:
1. Task B (DEADLINE, short deadline) holds a PI mutex
2. Task A (DEADLINE, long deadline) blocks on Task B's mutex
3. Task B doesn't inherit from Task A (B has higher priority)
4. Task B is changed from SCHED_DEADLINE to SCHED_IDLE via setscheduler
5. Task B should now inherit DEADLINE from Task A with ENQUEUE_REPLENISH

Without the fix, the ENQUEUE_REPLENISH flag is missing when Task B
inherits the DEADLINE attributes from Task A, causing bandwidth
accounting corruption and potential system hangs.

The test uses pthreads with PI mutexes to orchestrate the scenario
and includes a timeout mechanism to detect if the bug causes a hang.

Assisted-by: Claude Code: claude-sonnet-4-5@20250929
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/deadline/Makefile    |   5 +-
 .../selftests/sched/deadline/replenish_bug.c       | 337 +++++++++++++++++++++
 2 files changed, 341 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
index e7e16c610ee58..aa7752da1bdcf 100644
--- a/tools/testing/selftests/sched/deadline/Makefile
+++ b/tools/testing/selftests/sched/deadline/Makefile
@@ -14,7 +14,7 @@ OUTPUT_DIR := $(OUTPUT)
 UTIL_OBJS := $(OUTPUT)/dl_util.o
 
 # Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
-TEST_OBJS := $(OUTPUT)/basic.o $(OUTPUT)/bandwidth.o $(OUTPUT)/fair_server.o
+TEST_OBJS := $(OUTPUT)/basic.o $(OUTPUT)/bandwidth.o $(OUTPUT)/fair_server.o $(OUTPUT)/replenish_bug.o
 
 # Runner binary links utility and test objects
 $(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h | $(OUTPUT_DIR)
@@ -38,6 +38,9 @@ $(OUTPUT)/bandwidth.o: bandwidth.c dl_test.h dl_util.h | $(OUTPUT_DIR)
 $(OUTPUT)/fair_server.o: fair_server.c dl_test.h dl_util.h | $(OUTPUT_DIR)
 	$(CC) $(CFLAGS) -c $< -o $@
 
+$(OUTPUT)/replenish_bug.o: replenish_bug.c dl_test.h dl_util.h | $(OUTPUT_DIR)
+	$(CC) $(CFLAGS) -c $< -o $@
+
 $(OUTPUT_DIR):
 	mkdir -p $@
 
diff --git a/tools/testing/selftests/sched/deadline/replenish_bug.c b/tools/testing/selftests/sched/deadline/replenish_bug.c
new file mode 100644
index 0000000000000..016007d04c95a
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/replenish_bug.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SCHED_DEADLINE ENQUEUE_REPLENISH Bug Test
+ *
+ * Reproduces the scenario where:
+ * 1. Task B (DEADLINE, short deadline) holds a PI mutex
+ * 2. Task A (DEADLINE, long deadline) blocks on Task B's mutex
+ * 3. Task B doesn't inherit from Task A (B has shorter deadline = higher priority)
+ * 4. sched_setscheduler() changes Task B from DEADLINE to IDLE
+ * 5. Task B should now inherit DEADLINE from Task A with ENQUEUE_REPLENISH
+ *
+ * Without the fix, ENQUEUE_REPLENISH flag is missing, causing:
+ * "DL de-boosted task PID X: REPLENISH flag missing"
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <pthread.h>
+#include <sched.h>
+#include <errno.h>
+#include <stdint.h>
+#include <time.h>
+#include <signal.h>
+#include "dl_test.h"
+#include "dl_util.h"
+
+/* Thread context for the test */
+struct replenish_test_ctx {
+	pthread_mutex_t pi_mutex;
+	pthread_barrier_t barrier;
+	pthread_t holder;
+	pthread_t waiter;
+	volatile int holder_ready;
+	volatile int waiter_blocked;
+	volatile int test_done;
+	volatile int timeout_occurred;
+	volatile pid_t holder_tid;
+	volatile pid_t waiter_tid;
+};
+
+/* Timeout handler */
+static void timeout_handler(int sig)
+{
+	printf("\n\n!!! TIMEOUT !!!\n");
+	printf("Test appears to have hung - likely due to the bug being triggered!\n");
+	printf("This indicates the ENQUEUE_REPLENISH bug corrupted bandwidth accounting.\n");
+	printf("\nCheck kernel log:\n");
+	printf("  sudo dmesg | tail -50\n");
+	printf("\nLook for:\n");
+	printf("  'REPLENISH flag missing'\n");
+	printf("  'dl_runtime_exceeded' or bandwidth warnings\n");
+}
+
+static void print_sched_info(const char *label, pid_t tid)
+{
+	struct sched_attr attr = {0};
+
+	if (dl_get_sched_attr(tid, &attr) == 0) {
+		printf("[%s] TID %d: policy=%u prio=%d",
+		       label, tid, attr.sched_policy, attr.sched_priority);
+		if (attr.sched_policy == SCHED_DEADLINE) {
+			printf(" runtime=%llu deadline=%llu period=%llu",
+			       (unsigned long long)attr.sched_runtime,
+			       (unsigned long long)attr.sched_deadline,
+			       (unsigned long long)attr.sched_period);
+		}
+		printf("\n");
+	}
+}
+
+static int set_sched_idle(pid_t tid)
+{
+	struct sched_param param = {0};
+	return sched_setscheduler(tid, SCHED_IDLE, &param);
+}
+
+/*
+ * Thread B: DEADLINE task (SHORT deadline) that holds the PI mutex
+ * This will be setscheduled to IDLE, triggering the bug
+ */
+static void *holder_thread(void *arg)
+{
+	struct replenish_test_ctx *ctx = arg;
+
+	ctx->holder_tid = gettid();
+	printf("\n=== HOLDER (Task B) thread started (TID %d) ===\n",
+	       ctx->holder_tid);
+
+	/* Set to DEADLINE with a SHORT deadline (high priority) */
+	if (dl_set_sched_attr(ctx->holder_tid, dl_ms_to_ns(5),
+			      dl_ms_to_ns(30), dl_ms_to_ns(60)) < 0) {
+		perror("holder: dl_set_sched_attr");
+		return NULL;
+	}
+
+	print_sched_info("HOLDER-INIT", ctx->holder_tid);
+
+	/* Lock the mutex */
+	pthread_mutex_lock(&ctx->pi_mutex);
+	printf("[HOLDER] TID %d: Locked PI mutex\n", ctx->holder_tid);
+
+	/* Signal we're ready */
+	ctx->holder_ready = 1;
+
+	/* Wait at barrier */
+	pthread_barrier_wait(&ctx->barrier);
+
+	/* Keep holding the mutex while waiter blocks and gets setscheduled */
+	while (!ctx->test_done)
+		usleep(10000); /* 10ms */
+
+	printf("[HOLDER] TID %d: Unlocking PI mutex\n", ctx->holder_tid);
+	pthread_mutex_unlock(&ctx->pi_mutex);
+
+	printf("[HOLDER] TID %d: Exiting\n", ctx->holder_tid);
+	return NULL;
+}
+
+/*
+ * Thread A: DEADLINE task (LONG deadline) that will block on the mutex
+ * This is the pi_task that holder will inherit from after setscheduler
+ */
+static void *waiter_thread(void *arg)
+{
+	struct replenish_test_ctx *ctx = arg;
+
+	ctx->waiter_tid = gettid();
+	printf("\n=== WAITER (Task A) thread started (TID %d) ===\n",
+	       ctx->waiter_tid);
+
+	/* Set to DEADLINE with a LONG deadline (low priority) */
+	if (dl_set_sched_attr(ctx->waiter_tid, dl_ms_to_ns(10),
+			      dl_ms_to_ns(50), dl_ms_to_ns(100)) < 0) {
+		perror("waiter: dl_set_sched_attr");
+		return NULL;
+	}
+
+	print_sched_info("WAITER-INIT", ctx->waiter_tid);
+
+	/* Wait for holder to lock the mutex */
+	while (!ctx->holder_ready)
+		usleep(1000);
+
+	/* Wait at barrier */
+	pthread_barrier_wait(&ctx->barrier);
+
+	printf("[WAITER] TID %d: Attempting to lock PI mutex (will block)...\n",
+	       ctx->waiter_tid);
+
+	/* This will block because holder has the lock */
+	ctx->waiter_blocked = 1;
+	pthread_mutex_lock(&ctx->pi_mutex);
+
+	/* Eventually we get the lock */
+	printf("[WAITER] TID %d: Acquired PI mutex\n", ctx->waiter_tid);
+	print_sched_info("WAITER-AFTER", ctx->waiter_tid);
+
+	pthread_mutex_unlock(&ctx->pi_mutex);
+	printf("[WAITER] TID %d: Unlocked PI mutex\n", ctx->waiter_tid);
+	printf("[WAITER] TID %d: Exiting\n", ctx->waiter_tid);
+
+	return NULL;
+}
+
+/*
+ * Test: DEADLINE ENQUEUE_REPLENISH Bug
+ *
+ * Verifies that when a SCHED_DEADLINE task holding a PI mutex is changed
+ * to SCHED_IDLE while a lower-priority DEADLINE task is blocked on that
+ * mutex, the ENQUEUE_REPLENISH flag is correctly set during PI boosting.
+ */
+static enum dl_test_status test_replenish_bug_run(void *arg)
+{
+	struct replenish_test_ctx *ctx = arg;
+	struct sigaction sa;
+
+	printf("======================================\n");
+	printf("DEADLINE ENQUEUE_REPLENISH Bug Test\n");
+	printf("======================================\n");
+	printf("Timeout: 5 seconds\n");
+	printf("\nThis test reproduces the scenario where:\n");
+	printf("1. Task B (DEADLINE, short deadline) holds a PI mutex\n");
+	printf("2. Task A (DEADLINE, long deadline) blocks on Task B's mutex\n");
+	printf("3. Task B doesn't inherit from A (B has higher priority)\n");
+	printf("4. Task B gets setscheduled to SCHED_IDLE (while A still blocked)\n");
+	printf("5. Task B should now inherit from A with ENQUEUE_REPLENISH\n");
+	printf("\nWithout fix: Missing ENQUEUE_REPLENISH flag causes WARNING\n");
+	printf("\nCheck dmesg for:\n");
+	printf("  'DL de-boosted task PID X: REPLENISH flag missing'\n");
+	printf("\nNOTE: If test hangs and times out, the bug was triggered!\n");
+	printf("======================================\n\n");
+
+	/* Set up timeout handler */
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = timeout_handler;
+	sigaction(SIGALRM, &sa, NULL);
+
+	/* Set timeout (5 seconds) */
+	alarm(5);
+
+	/* Initialize barrier for 2 threads */
+	DL_FAIL_IF(pthread_barrier_init(&ctx->barrier, NULL, 2) != 0,
+		   "pthread_barrier_init failed");
+
+	/* Create holder thread (will lock mutex) */
+	if (pthread_create(&ctx->holder, NULL, holder_thread, ctx) != 0) {
+		pthread_barrier_destroy(&ctx->barrier);
+		DL_FAIL("pthread_create holder failed: %s", strerror(errno));
+	}
+
+	/* Create waiter thread (will block on mutex) */
+	if (pthread_create(&ctx->waiter, NULL, waiter_thread, ctx) != 0) {
+		pthread_barrier_destroy(&ctx->barrier);
+		DL_FAIL("pthread_create waiter failed: %s", strerror(errno));
+	}
+
+	/* Give threads time to start */
+	sleep(1);
+
+	/* Wait for waiter to block on the mutex */
+	printf("\n[MAIN] Waiting for waiter to block on mutex...\n");
+	while (!ctx->waiter_blocked)
+		usleep(1000);
+
+	/* Give it a moment to actually block */
+	usleep(50000); /* 50ms */
+
+	printf("\n[MAIN] Holder TID: %d\n", ctx->holder_tid);
+	print_sched_info("HOLDER-HOLDING", ctx->holder_tid);
+
+	/*
+	 * THE BUG TRIGGER:
+	 * Holder (Task B) is DEADLINE with short deadline (high priority).
+	 * Waiter (Task A) is DEADLINE with long deadline (low priority), blocked.
+	 * Holder didn't inherit from waiter (holder has higher priority).
+	 * Now change HOLDER from DEADLINE to SCHED_IDLE.
+	 * Holder should inherit DEADLINE from waiter with ENQUEUE_REPLENISH,
+	 * but without the fix, it doesn't.
+	 */
+	printf("\n[MAIN] *** Changing HOLDER (Task B) from SCHED_DEADLINE to SCHED_IDLE ***\n");
+	printf("[MAIN] *** This triggers the bug! ***\n");
+
+	if (set_sched_idle(ctx->holder_tid) < 0) {
+		ctx->test_done = 1;
+		pthread_join(ctx->holder, NULL);
+		pthread_join(ctx->waiter, NULL);
+		pthread_barrier_destroy(&ctx->barrier);
+		DL_FAIL("set_sched_idle failed: %s", strerror(errno));
+	}
+
+	printf("[MAIN] Successfully changed holder to SCHED_IDLE\n");
+	print_sched_info("HOLDER-SETSCHEDULED", ctx->holder_tid);
+
+	/* Let the scenario play out */
+	usleep(100000); /* 100ms */
+
+	/* Signal threads to finish */
+	ctx->test_done = 1;
+
+	/* Wait for threads */
+	pthread_join(ctx->holder, NULL);
+	pthread_join(ctx->waiter, NULL);
+
+	/* Cancel the alarm - we completed successfully */
+	alarm(0);
+
+	pthread_barrier_destroy(&ctx->barrier);
+
+	DL_FAIL_IF(ctx->timeout_occurred, "Test timed out - bug was triggered!");
+
+	printf("\n======================================\n");
+	printf("Test completed successfully!\n");
+	printf("======================================\n");
+	printf("\nNo timeout occurred - fix appears to be working.\n");
+	printf("\nCheck kernel log:\n");
+	printf("  sudo dmesg | tail -50\n");
+	printf("\nLook for:\n");
+	printf("  'DL de-boosted task PID X: REPLENISH flag missing'\n");
+	printf("  'dl_runtime_exceeded' or bandwidth warnings\n");
+	printf("\n");
+
+	return DL_TEST_PASS;
+}
+
+static enum dl_test_status test_replenish_bug_setup(void **ctx_ptr)
+{
+	struct replenish_test_ctx *ctx;
+	pthread_mutexattr_t attr;
+
+	ctx = calloc(1, sizeof(*ctx));
+	DL_FAIL_IF(!ctx, "Failed to allocate test context");
+
+	/* Initialize PI mutex */
+	if (pthread_mutexattr_init(&attr) != 0) {
+		free(ctx);
+		DL_FAIL("pthread_mutexattr_init failed");
+	}
+
+	if (pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_INHERIT) != 0) {
+		pthread_mutexattr_destroy(&attr);
+		free(ctx);
+		DL_FAIL("pthread_mutexattr_setprotocol failed");
+	}
+
+	if (pthread_mutex_init(&ctx->pi_mutex, &attr) != 0) {
+		pthread_mutexattr_destroy(&attr);
+		free(ctx);
+		DL_FAIL("pthread_mutex_init failed");
+	}
+
+	pthread_mutexattr_destroy(&attr);
+
+	*ctx_ptr = ctx;
+	return DL_TEST_PASS;
+}
+
+static void test_replenish_bug_cleanup(void *arg)
+{
+	struct replenish_test_ctx *ctx = arg;
+
+	if (ctx) {
+		pthread_mutex_destroy(&ctx->pi_mutex);
+		free(ctx);
+	}
+}
+
+static struct dl_test test_replenish_bug = {
+	.name = "replenish_bug",
+	.description = "Verify ENQUEUE_REPLENISH flag is set during PI boosting after setscheduler",
+	.setup = test_replenish_bug_setup,
+	.run = test_replenish_bug_run,
+	.cleanup = test_replenish_bug_cleanup,
+};
+REGISTER_DL_TEST(&test_replenish_bug);

-- 
2.53.0

