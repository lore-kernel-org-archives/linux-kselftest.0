Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE879380FE5
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296699; cv=none; b=SR3AjFvKeP0VQMrRcNwQvZB0n7vnnu1Wv9yjSKFph6tVxjgWV5WRZqCRk5lSH/nizzxeYUXj93b360VFH6dWwct3Kd1Xfu3vaRMP5YCauhk20dZMFrGj9VxIpISEnDdw280fX5uNqqSYhvnEPdt1wzNfxoiuc02d2MrckMmmX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296699; c=relaxed/simple;
	bh=t6U4xgATzs7uG9zfCZMhku4pbFtOXhIM/qDe3guHGbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c7x/oeQAlurOAAJ5peex9ouZUscNqvG1sOfS1CleM5u9o+y2vPPnCkxygOaFSFxTfcVZzSUn1RaWTiQzhZwbygwib14bITpUnSgv1+X3ZMVASX5WUwovoaqA+yBKcAniPV41vSq3/PG7wrk58sGdYzoJeVRrVFR5RS6IZDyS3wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZdpVB94m; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZdpVB94m"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8422b1354edso2088290b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296694; x=1780901494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uQUuFjhPCX3aGbTJjTXncSLtc0Byk+F869C/pvF6EDk=;
        b=ZdpVB94mapSDpTb3c/9bgDi9fzKnRBkmaLC3btsk1eYLOE2mriMrKpweY9LNINYCSh
         zp74N1k+1mTW+UtzTEPmm8b68/ay+mxcaQiSrF0tdXWbcH05mftHWurBp/10V/JlZOK1
         BClEhURg4RzvOduJ5VI/Qf3UT/EGJN2LKkquCswiJMfcM4FMDgJhilQeGrNZq8LTbUrS
         ksN67R6LLC/XIsr7nNCV7M5Z/0l9tGaLUQ8/aM3d+66pVeHec+/YtX1ZhHEhaiDJL8uA
         /XFi9bRhaVt26uHHkB2tOh2YCKcKnncjzQKquyEViO6i4Y4xbDkn/YNOQ+B7E4HS43Sp
         lkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296694; x=1780901494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQUuFjhPCX3aGbTJjTXncSLtc0Byk+F869C/pvF6EDk=;
        b=OLE+onTuhZQvV4j5mJzlfzfMn+TErqFRVLFjP9/yKEnouCDxmOC9p3Npc1OKTPxldM
         eGv12cqYIUAvR5YDmjQzyv2m4PG/B4f/ZF90IpLFSAlwxFHeDvBOCpRIvTZNN0NhUvQC
         yJm93NN9HyX7dZe0Gy5+G9dyDAFL7EZKPgd0RMmlr/FOoNuCjEF4iTLNGj8ymoLJeAfe
         W5ldjLkBruDGcmaOzuGR+uohzHhkgvy57Luf2lY6WqrpXscDt6arKCjjK+dZVPOPfl7w
         ncdG/Wk3pe25mhbT+A3rsJO6fhoJXUsnfckRBicKIek3doTcQzBQCyxGAFEzWLVDgsCT
         Wm3g==
X-Forwarded-Encrypted: i=1; AFNElJ8y5laOvgj5SuFpF1H1LcoDy/qv9LYi2zIlC5WwRxy3xZJnIBDxhh5F9TMxnrhpiiDqt9OXFmQl9j7LdD4DeL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNHnuSWB/yn9u1F6WIK36aIF6oB9RYak3MLcjj3tm6CKY3H5i
	pS6p6gxf0ucpAc8DlVR8WkbPHjwHyuQYU3BN7XEtF0Y2KYUQwXKPzCzSJvKf8qJFDtaqt1aKstK
	Q9g==
X-Received: from pfbk22.prod.google.com ([2002:a05:6a00:b016:b0:842:1f96:2713])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:440c:b0:82c:77cd:50e8
 with SMTP id d2e1a72fcca58-8422543d835mr9142416b3a.27.1780296693680; Sun, 31
 May 2026 23:51:33 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:21 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-3-wakel@google.com>
Subject: [PATCH 2/7] selftests/futex: Migrate futex_requeue_pi to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_requeue_pi test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and passing test metadata
to all helper threads via thread arguments.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex/functional/futex_requeue_pi.c       | 130 +++++++++---------
 1 file changed, 63 insertions(+), 67 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 46d2858e15a8..11aada818068 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -43,12 +43,13 @@ futex_t f2 = FUTEX_INITIALIZER;
 futex_t wake_complete = FUTEX_INITIALIZER;
 
 struct thread_arg {
+	struct __test_metadata *_metadata;
 	long id;
 	struct timespec *timeout;
 	int lock;
 	int ret;
 };
-#define THREAD_ARG_INITIALIZER { 0, NULL, 0, 0 }
+#define THREAD_ARG_INITIALIZER { NULL, 0, NULL, 0, 0 }
 
 FIXTURE(args)
 {
@@ -118,7 +119,7 @@ FIXTURE_VARIANT_ADD_TIMEOUT(5000);
 FIXTURE_VARIANT_ADD_TIMEOUT(500000);
 FIXTURE_VARIANT_ADD_TIMEOUT(2000000000);
 
-int create_rt_thread(pthread_t *pth, void*(*func)(void *), void *arg,
+int create_rt_thread(struct __test_metadata *_metadata, pthread_t *pth, void*(*func)(void *), void *arg,
 		     int policy, int prio)
 {
 	int ret;
@@ -129,29 +130,18 @@ int create_rt_thread(pthread_t *pth, void*(*func)(void *), void *arg,
 	memset(&schedp, 0, sizeof(schedp));
 
 	ret = pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
-	if (ret) {
-		ksft_exit_fail_msg("pthread_attr_setinheritsched\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_attr_setinheritsched failed");
 
 	ret = pthread_attr_setschedpolicy(&attr, policy);
-	if (ret) {
-		ksft_exit_fail_msg("pthread_attr_setschedpolicy\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_attr_setschedpolicy failed");
 
 	schedp.sched_priority = prio;
 	ret = pthread_attr_setschedparam(&attr, &schedp);
-	if (ret) {
-		ksft_exit_fail_msg("pthread_attr_setschedparam\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_attr_setschedparam failed");
 
 	ret = pthread_create(pth, &attr, func, arg);
-	if (ret) {
-		ksft_exit_fail_msg("pthread_create\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_create failed");
+
 	return 0;
 }
 
@@ -159,55 +149,59 @@ int create_rt_thread(pthread_t *pth, void*(*func)(void *), void *arg,
 void *waiterfn(void *arg)
 {
 	struct thread_arg *args = (struct thread_arg *)arg;
+	struct __test_metadata *_metadata = args->_metadata;
 	futex_t old_val;
 
-	ksft_print_dbg_msg("Waiter %ld: running\n", args->id);
+	TH_LOG("Waiter %ld: running", args->id);
 	/* Each thread sleeps for a different amount of time
 	 * This is to avoid races, because we don't lock the
-	 * external mutex here */
+	 * external mutex here
+	 */
 	usleep(1000 * (long)args->id);
 
 	old_val = f1;
 	atomic_inc(&waiters_blocked);
-	ksft_print_dbg_msg("Calling futex_wait_requeue_pi: %p (%u) -> %p\n",
+	TH_LOG("Calling futex_wait_requeue_pi: %p (%u) -> %p",
 	     &f1, f1, &f2);
 	args->ret = futex_wait_requeue_pi(&f1, old_val, &f2, args->timeout,
 					  FUTEX_PRIVATE_FLAG);
 
-	ksft_print_dbg_msg("waiter %ld woke with %d %s\n", args->id, args->ret,
+	TH_LOG("waiter %ld woke with %d %s", args->id, args->ret,
 	     args->ret < 0 ? strerror(errno) : "");
 	atomic_inc(&waiters_woken);
 	if (args->ret < 0) {
-		if (args->timeout && errno == ETIMEDOUT)
+		if (args->timeout && errno == ETIMEDOUT) {
 			args->ret = 0;
-		else {
-			ksft_exit_fail_msg("futex_wait_requeue_pi\n");
+		} else {
+			ASSERT_EQ(args->ret, 0)
+				TH_LOG("futex_wait_requeue_pi failed: %s", strerror(errno));
 		}
 		futex_lock_pi(&f2, NULL, 0, FUTEX_PRIVATE_FLAG);
 	}
 	futex_unlock_pi(&f2, FUTEX_PRIVATE_FLAG);
 
-	ksft_print_dbg_msg("Waiter %ld: exiting with %d\n", args->id, args->ret);
+	TH_LOG("Waiter %ld: exiting with %d", args->id, args->ret);
 	pthread_exit((void *)&args->ret);
 }
 
 void *broadcast_wakerfn(void *arg)
 {
 	struct thread_arg *args = (struct thread_arg *)arg;
+	struct __test_metadata *_metadata = args->_metadata;
 	int nr_requeue = INT_MAX;
 	int task_count = 0;
 	futex_t old_val;
 	int nr_wake = 1;
 	int i = 0;
 
-	ksft_print_dbg_msg("Waker: waiting for waiters to block\n");
+	TH_LOG("Waker: waiting for waiters to block");
 	while (waiters_blocked.val < THREAD_MAX)
 		usleep(1000);
 	usleep(1000);
 
-	ksft_print_dbg_msg("Waker: Calling broadcast\n");
+	TH_LOG("Waker: Calling broadcast");
 	if (args->lock) {
-		ksft_print_dbg_msg("Calling FUTEX_LOCK_PI on mutex=%x @ %p\n", f2, &f2);
+		TH_LOG("Calling FUTEX_LOCK_PI on mutex=%x @ %p", f2, &f2);
 		futex_lock_pi(&f2, NULL, 0, FUTEX_PRIVATE_FLAG);
 	}
  continue_requeue:
@@ -215,14 +209,16 @@ void *broadcast_wakerfn(void *arg)
 	args->ret = futex_cmp_requeue_pi(&f1, old_val, &f2, nr_wake, nr_requeue,
 				   FUTEX_PRIVATE_FLAG);
 	if (args->ret < 0) {
-		ksft_exit_fail_msg("FUTEX_CMP_REQUEUE_PI failed\n");
+		ASSERT_GE(args->ret, 0)
+			TH_LOG("FUTEX_CMP_REQUEUE_PI failed: %s", strerror(errno));
 	} else if (++i < MAX_WAKE_ITERS) {
 		task_count += args->ret;
 		if (task_count < THREAD_MAX - waiters_woken.val)
 			goto continue_requeue;
 	} else {
-		ksft_exit_fail_msg("max broadcast iterations (%d) reached with %d/%d tasks woken or requeued\n",
-		       MAX_WAKE_ITERS, task_count, THREAD_MAX);
+		ASSERT_TRUE(0)
+			TH_LOG("max broadcast iterations (%d) reached with %d/%d tasks woken or requeued",
+			       MAX_WAKE_ITERS, task_count, THREAD_MAX);
 	}
 
 	futex_wake(&wake_complete, 1, FUTEX_PRIVATE_FLAG);
@@ -233,33 +229,34 @@ void *broadcast_wakerfn(void *arg)
 	if (args->ret > 0)
 		args->ret = task_count;
 
-	ksft_print_dbg_msg("Waker: exiting with %d\n", args->ret);
+	TH_LOG("Waker: exiting with %d", args->ret);
 	pthread_exit((void *)&args->ret);
 }
 
 void *signal_wakerfn(void *arg)
 {
 	struct thread_arg *args = (struct thread_arg *)arg;
+	struct __test_metadata *_metadata = args->_metadata;
 	unsigned int old_val;
 	int nr_requeue = 0;
 	int task_count = 0;
 	int nr_wake = 1;
 	int i = 0;
 
-	ksft_print_dbg_msg("Waker: waiting for waiters to block\n");
+	TH_LOG("Waker: waiting for waiters to block");
 	while (waiters_blocked.val < THREAD_MAX)
 		usleep(1000);
 	usleep(1000);
 
 	while (task_count < THREAD_MAX && waiters_woken.val < THREAD_MAX) {
-		ksft_print_dbg_msg("task_count: %d, waiters_woken: %d\n",
+		TH_LOG("task_count: %d, waiters_woken: %d",
 		     task_count, waiters_woken.val);
 		if (args->lock) {
-			ksft_print_dbg_msg("Calling FUTEX_LOCK_PI on mutex=%x @ %p\n",
+			TH_LOG("Calling FUTEX_LOCK_PI on mutex=%x @ %p",
 			    f2, &f2);
 			futex_lock_pi(&f2, NULL, 0, FUTEX_PRIVATE_FLAG);
 		}
-		ksft_print_dbg_msg("Waker: Calling signal\n");
+		TH_LOG("Waker: Calling signal");
 		/* cond_signal */
 		old_val = f1;
 		args->ret = futex_cmp_requeue_pi(&f1, old_val, &f2,
@@ -267,23 +264,26 @@ void *signal_wakerfn(void *arg)
 						 FUTEX_PRIVATE_FLAG);
 		if (args->ret < 0)
 			args->ret = -errno;
-		ksft_print_dbg_msg("futex: %x\n", f2);
+		TH_LOG("futex: %x", f2);
 		if (args->lock) {
-			ksft_print_dbg_msg("Calling FUTEX_UNLOCK_PI on mutex=%x @ %p\n",
+			TH_LOG("Calling FUTEX_UNLOCK_PI on mutex=%x @ %p",
 			    f2, &f2);
 			futex_unlock_pi(&f2, FUTEX_PRIVATE_FLAG);
 		}
-		ksft_print_dbg_msg("futex: %x\n", f2);
-		if (args->ret < 0)
-			ksft_exit_fail_msg("FUTEX_CMP_REQUEUE_PI failed\n");
+		TH_LOG("futex: %x", f2);
+		if (args->ret < 0) {
+			ASSERT_GE(args->ret, 0)
+				TH_LOG("FUTEX_CMP_REQUEUE_PI failed: %s", strerror(-args->ret));
+		}
 
 		task_count += args->ret;
 		usleep(SIGNAL_PERIOD_US);
 		i++;
 		/* we have to loop at least THREAD_MAX times */
 		if (i > MAX_WAKE_ITERS + THREAD_MAX) {
-			ksft_exit_fail_msg("max signaling iterations (%d) reached, giving up on pending waiters.\n",
-			      MAX_WAKE_ITERS + THREAD_MAX);
+			ASSERT_TRUE(0)
+				TH_LOG("max signaling iterations (%d) reached, giving up on pending waiters.",
+				       MAX_WAKE_ITERS + THREAD_MAX);
 		}
 	}
 
@@ -292,14 +292,15 @@ void *signal_wakerfn(void *arg)
 	if (args->ret >= 0)
 		args->ret = task_count;
 
-	ksft_print_dbg_msg("Waker: exiting with %d\n", args->ret);
-	ksft_print_dbg_msg("Waker: waiters_woken: %d\n", waiters_woken.val);
+	TH_LOG("Waker: exiting with %d", args->ret);
+	TH_LOG("Waker: waiters_woken: %d", waiters_woken.val);
 	pthread_exit((void *)&args->ret);
 }
 
 void *third_party_blocker(void *arg)
 {
 	struct thread_arg *args = (struct thread_arg *)arg;
+	struct __test_metadata *_metadata = args->_metadata;
 	int ret2 = 0;
 
 	args->ret = futex_lock_pi(&f2, NULL, 0, FUTEX_PRIVATE_FLAG);
@@ -311,7 +312,7 @@ void *third_party_blocker(void *arg)
 
  out:
 	if (args->ret || ret2)
-		ksft_exit_fail_msg("third_party_blocker() futex error");
+		ASSERT_TRUE(0) TH_LOG("%s() futex error", __func__);
 
 	pthread_exit((void *)&args->ret);
 }
@@ -330,20 +331,19 @@ TEST_F(args, futex_requeue_pi)
 	bool lock = variant->locked;
 	int *waiter_ret, i, ret = 0;
 
-	ksft_print_msg(
-		"\tArguments: broadcast=%d locked=%d owner=%d timeout=%ldns\n",
+	TH_LOG("Arguments: broadcast=%d locked=%d owner=%d timeout=%ldns",
 		broadcast, lock, third_party_owner, timeout_ns);
 
 	if (timeout_ns) {
 		time_t secs;
 
-		ksft_print_dbg_msg("timeout_ns = %ld\n", timeout_ns);
+		TH_LOG("timeout_ns = %ld", timeout_ns);
 		ret = clock_gettime(CLOCK_MONOTONIC, &ts);
 		secs = (ts.tv_nsec + timeout_ns) / 1000000000;
 		ts.tv_nsec = ((int64_t)ts.tv_nsec + timeout_ns) % 1000000000;
 		ts.tv_sec += secs;
-		ksft_print_dbg_msg("ts.tv_sec  = %ld\n", ts.tv_sec);
-		ksft_print_dbg_msg("ts.tv_nsec = %ld\n", ts.tv_nsec);
+		TH_LOG("ts.tv_sec  = %ld", ts.tv_sec);
+		TH_LOG("ts.tv_nsec = %ld", ts.tv_nsec);
 		tsp = &ts;
 	}
 
@@ -351,27 +351,24 @@ TEST_F(args, futex_requeue_pi)
 		wakerfn = broadcast_wakerfn;
 
 	if (third_party_owner) {
-		if (create_rt_thread(&blocker, third_party_blocker,
-				     (void *)&blocker_arg, SCHED_FIFO, 1)) {
-			ksft_exit_fail_msg("Creating third party blocker thread failed\n");
-		}
+		blocker_arg._metadata = _metadata;
+		create_rt_thread(_metadata, &blocker, third_party_blocker,
+				 (void *)&blocker_arg, SCHED_FIFO, 1);
 	}
 
 	atomic_set(&waiters_woken, 0);
 	for (i = 0; i < THREAD_MAX; i++) {
+		args[i]._metadata = _metadata;
 		args[i].id = i;
 		args[i].timeout = tsp;
-		ksft_print_dbg_msg("Starting thread %d\n", i);
-		if (create_rt_thread(&waiter[i], waiterfn, (void *)&args[i],
-				     SCHED_FIFO, 1)) {
-			ksft_exit_fail_msg("Creating waiting thread failed\n");
-		}
+		TH_LOG("Starting thread %d", i);
+		create_rt_thread(_metadata, &waiter[i], waiterfn, (void *)&args[i],
+				 SCHED_FIFO, 1);
 	}
+	waker_arg._metadata = _metadata;
 	waker_arg.lock = lock;
-	if (create_rt_thread(&waker, wakerfn, (void *)&waker_arg,
-			     SCHED_FIFO, 1)) {
-		ksft_exit_fail_msg("Creating waker thread failed\n");
-	}
+	create_rt_thread(_metadata, &waker, wakerfn, (void *)&waker_arg,
+			 SCHED_FIFO, 1);
 
 	/* Wait for threads to finish */
 	/* Store the first error or failure encountered in waiter_ret */
@@ -393,8 +390,7 @@ TEST_F(args, futex_requeue_pi)
 			ret = blocker_arg.ret;
 	}
 
-	if (ret)
-		ksft_test_result_fail("fail");
+	EXPECT_EQ(ret, 0) TH_LOG("Test failed with error code: %d", ret);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.823.g6e5bcc1fc9-goog

