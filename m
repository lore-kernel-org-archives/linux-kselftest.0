Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903A381AEB
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296704; cv=none; b=T57G9OeXxRuAai/mxt17/QUbfjE4DH8FKTGunXhXu4FEsDmUg2gcp0H6eZhKKo4SCZzsIWTiCEB9LRtKs3pgfsxpf576LZFR9G5nEzcYCFpDTICGEZJ2WlPC5FS92ECvEbiBeksnIzW5O+yhH72FpuARWXF7NQY5iwe+Gcfhy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296704; c=relaxed/simple;
	bh=ABYUNeq5jggGjdHC1N3KhsSD1Eg+ZJUhKBpwrvEvOUg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kZGJWR1b+8CCSLWHlWEj3k69zWjUc6XdRP3kYGf5uN9AZe+acz/1cFnUc3awUrnnV5V78kcGMiAYcOKQAB0zVqviX1m1Fs1E8S1IUEvxnDooVVcuIIAeKueqjw0D+eZDokeYY0fz2fXIDteQ+467LfvgV4wVvRVZvkV+STOQhJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s0cnTx90; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s0cnTx90"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85a1e9c616so515694a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296698; x=1780901498; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8X/ZMOC3R4zjF20OsNMGuI7f1VgwjsLyl+ryXVYUmA=;
        b=s0cnTx90wrkqbuZnDDxRKzFeE3NxVCVIQX4STfYgTQkLGGC4ylet1nkp/G557KbSIg
         /rpghqFAYsdjFF4/8hfSrW+T31glYnZ489cX4j4HuS4iyokZc1qfFG525G+cogdGy+O7
         qNsLHNKZe6nIC2SC1xgIWI3ktScnX48Nf7vU82ojMX2BDthNr8rdxhUDu8v0jU9nM4YL
         kGBIsBNjg6drgofNeeNhVd1CKQ8ZdcFeP7k2p7mqafKBinGYGXHYH99qRG+VEPppvPvw
         iw8lj7V5SJj0dnJnBdMuKPLAPdjGvpKmXIJLjhAtQWvup9Ov/9r2DWswycmgtqfmTGei
         JC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296698; x=1780901498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8X/ZMOC3R4zjF20OsNMGuI7f1VgwjsLyl+ryXVYUmA=;
        b=ZJtQI7R6GxWruVUn+8vxbFTMbLz3+S3nbjrDoAXMjzO0dkmX4arwSwL7eCzYGKKHIL
         KptmfvRM1r5YYrnr+Fz5xMPtIRmlLynBJB00sHcj8wVGoHyEvvtmeYCt/5Gnc1r5Rx+R
         5kyzT9Eb47+HmvhjFSOr+gDqcz8DdraOUb0q/cfR3F/VHBwfpURLPJlMZa71ZNgj39jf
         KCyZVGZeQU6SBlS9XR6zR9QywTrMnUgjHdnBowmjsWlK0hPTUMKnK0yAyazKkVjS+C1W
         4y0GVLepi9OLt4x88Q94afWJz0rdYXNCiiDheA/acMH+zmFEuOk2DMIbTncUKgt7fhp8
         FHbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xd+BmCM6jEfC01J7yerrvapV7QAUsBtzeKAFJOxshy3vIU55HD1zGOa1IOx3FjWpRrIP99Llvy9/feagvQmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZa5GkleeQM7j+6Eu6FEV81+338ay/9VdLYTkayIWiIiZHZzd
	iQuNGrGvNwoESJsKmFM+Vd5h6FqKPjob4O8xYGOtSB90pfpufGFV3D6Tq8UT9expO4dWAfwnD2t
	1Ng==
X-Received: from pgbdw17.prod.google.com ([2002:a05:6a02:4491:b0:c0e:3543:bdb0])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6497:b0:3a2:dabf:fef6
 with SMTP id adf61e73a8af0-3b427f5b066mr9976790637.35.1780296697723; Sun, 31
 May 2026 23:51:37 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:23 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-5-wakel@google.com>
Subject: [PATCH 4/7] selftests/futex: Migrate futex_requeue_pi_signal_restart
 to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_requeue_pi_signal_restart test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and ensuring proper thread joining.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex_requeue_pi_signal_restart.c         | 67 +++++++++----------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c b/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
index a18ccae73eb1..e301beb4b202 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
@@ -35,9 +35,9 @@ futex_t f1 = FUTEX_INITIALIZER;
 futex_t f2 = FUTEX_INITIALIZER;
 atomic_t requeued = ATOMIC_INITIALIZER;
 
-int waiter_ret = 0;
+int waiter_ret;
 
-int create_rt_thread(pthread_t *pth, void*(*func)(void *), void *arg,
+int create_rt_thread(struct __test_metadata *_metadata, pthread_t *pth, void*(*func)(void *), void *arg,
 		     int policy, int prio)
 {
 	struct sched_param schedp;
@@ -48,45 +48,43 @@ int create_rt_thread(pthread_t *pth, void*(*func)(void *), void *arg,
 	memset(&schedp, 0, sizeof(schedp));
 
 	ret = pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
-	if (ret)
-		ksft_exit_fail_msg("pthread_attr_setinheritsched\n");
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_attr_setinheritsched failed");
 
 	ret = pthread_attr_setschedpolicy(&attr, policy);
-	if (ret)
-		ksft_exit_fail_msg("pthread_attr_setschedpolicy\n");
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_attr_setschedpolicy failed");
 
 	schedp.sched_priority = prio;
 	ret = pthread_attr_setschedparam(&attr, &schedp);
-	if (ret)
-		ksft_exit_fail_msg("pthread_attr_setschedparam\n");
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_attr_setschedparam failed");
 
 	ret = pthread_create(pth, &attr, func, arg);
-	if (ret)
-		ksft_exit_fail_msg("pthread_create\n");
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_create failed");
 
 	return 0;
 }
 
 void handle_signal(int signo)
 {
-	ksft_print_dbg_msg("signal received %s requeue\n",
-	     requeued.val ? "after" : "prior to");
+	printf("INFO: signal received %s requeue\n",
+	       requeued.val ? "after" : "prior to");
 }
 
 void *waiterfn(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
 	unsigned int old_val;
 	int res;
 
-	ksft_print_dbg_msg("Waiter running\n");
-	ksft_print_dbg_msg("Calling FUTEX_LOCK_PI on f2=%x @ %p\n", f2, &f2);
+	TH_LOG("Waiter running");
+	TH_LOG("Calling FUTEX_LOCK_PI on f2=%x @ %p", f2, &f2);
 	old_val = f1;
 	res = futex_wait_requeue_pi(&f1, old_val, &(f2), NULL,
 				    FUTEX_PRIVATE_FLAG);
 	if (!requeued.val || errno != EWOULDBLOCK) {
-		ksft_test_result_fail("unexpected return from futex_wait_requeue_pi: %d (%s)\n",
-		     res, strerror(errno));
-		ksft_print_dbg_msg("w2:futex: %x\n", f2);
+		EXPECT_TRUE(0)
+			TH_LOG("unexpected return from futex_wait_requeue_pi: %d (%s)",
+			       res, strerror(errno));
+		TH_LOG("w2:futex: %x", f2);
 		if (!res)
 			futex_unlock_pi(&f2, FUTEX_PRIVATE_FLAG);
 	}
@@ -94,7 +92,6 @@ void *waiterfn(void *arg)
 	pthread_exit(NULL);
 }
 
-
 TEST(futex_requeue_pi_signal_restart)
 {
 	unsigned int old_val;
@@ -105,19 +102,16 @@ TEST(futex_requeue_pi_signal_restart)
 	sa.sa_handler = handle_signal;
 	sigemptyset(&sa.sa_mask);
 	sa.sa_flags = 0;
-	if (sigaction(SIGUSR1, &sa, NULL))
-		ksft_exit_fail_msg("sigaction\n");
+	ASSERT_EQ(sigaction(SIGUSR1, &sa, NULL), 0) TH_LOG("sigaction failed");
 
-	ksft_print_dbg_msg("m1:f2: %x\n", f2);
-	ksft_print_dbg_msg("Creating waiter\n");
-	res = create_rt_thread(&waiter, waiterfn, NULL, SCHED_FIFO, 1);
-	if (res)
-		ksft_exit_fail_msg("Creating waiting thread failed");
+	TH_LOG("m1:f2: %x", f2);
+	TH_LOG("Creating waiter");
+	create_rt_thread(_metadata, &waiter, waiterfn, _metadata, SCHED_FIFO, 1);
 
-	ksft_print_dbg_msg("Calling FUTEX_LOCK_PI on f2=%x @ %p\n", f2, &f2);
-	ksft_print_dbg_msg("m2:f2: %x\n", f2);
+	TH_LOG("Calling FUTEX_LOCK_PI on f2=%x @ %p", f2, &f2);
+	TH_LOG("m2:f2: %x", f2);
 	futex_lock_pi(&f2, 0, 0, FUTEX_PRIVATE_FLAG);
-	ksft_print_dbg_msg("m3:f2: %x\n", f2);
+	TH_LOG("m3:f2: %x", f2);
 
 	while (1) {
 		/*
@@ -125,11 +119,11 @@ TEST(futex_requeue_pi_signal_restart)
 		 * restart futex_wait_requeue_pi() in the kernel. Wait for the
 		 * waiter to block on f1 again.
 		 */
-		ksft_print_dbg_msg("Issuing SIGUSR1 to waiter\n");
+		TH_LOG("Issuing SIGUSR1 to waiter");
 		pthread_kill(waiter, SIGUSR1);
 		usleep(DELAY_US);
 
-		ksft_print_dbg_msg("Requeueing waiter via FUTEX_CMP_REQUEUE_PI\n");
+		TH_LOG("Requeueing waiter via FUTEX_CMP_REQUEUE_PI");
 		old_val = f1;
 		res = futex_cmp_requeue_pi(&f1, old_val, &(f2), 1, 0,
 					   FUTEX_PRIVATE_FLAG);
@@ -143,10 +137,11 @@ TEST(futex_requeue_pi_signal_restart)
 			atomic_set(&requeued, 1);
 			break;
 		} else if (res < 0) {
-			ksft_exit_fail_msg("FUTEX_CMP_REQUEUE_PI failed\n");
+			ASSERT_GE(res, 0)
+				TH_LOG("FUTEX_CMP_REQUEUE_PI failed: %s", strerror(errno));
 		}
 	}
-	ksft_print_dbg_msg("m4:f2: %x\n", f2);
+	TH_LOG("m4:f2: %x", f2);
 
 	/*
 	 * Signal the waiter after requeue, waiter should return from
@@ -154,14 +149,14 @@ TEST(futex_requeue_pi_signal_restart)
 	 * futex_unlock_pi() can't happen before the signal wakeup is detected
 	 * in the kernel.
 	 */
-	ksft_print_dbg_msg("Issuing SIGUSR1 to waiter\n");
+	TH_LOG("Issuing SIGUSR1 to waiter");
 	pthread_kill(waiter, SIGUSR1);
-	ksft_print_dbg_msg("Waiting for waiter to return\n");
+	TH_LOG("Waiting for waiter to return");
 	pthread_join(waiter, NULL);
 
-	ksft_print_dbg_msg("Calling FUTEX_UNLOCK_PI on mutex=%x @ %p\n", f2, &f2);
+	TH_LOG("Calling FUTEX_UNLOCK_PI on mutex=%x @ %p", f2, &f2);
 	futex_unlock_pi(&f2, FUTEX_PRIVATE_FLAG);
-	ksft_print_dbg_msg("m5:f2: %x\n", f2);
+	TH_LOG("m5:f2: %x", f2);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.823.g6e5bcc1fc9-goog

