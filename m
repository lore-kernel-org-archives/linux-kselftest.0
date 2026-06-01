Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E453E382F0F
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296707; cv=none; b=Lew4i9Z2htI+teeevEssfro0Ynfcb7moS/bKFl43ZgUDIvS/uSCHXxY3Is8q4Xg7s960RK0NtVQIF1zRx/gDBgUI5f0nb1fNZSiXRpFCpDtjhZmWiLgTFEHIxmQ2lXZM9S0IJ2DiochXaTSAIfppFtyb5wvFaLb8DZZxVHtEfuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296707; c=relaxed/simple;
	bh=pDvCT3nXHlU7+Qmyj6Da0J3AxTPetMwuXX+Hgvkvx00=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J9fmJhJ8rIovvICaqux5vXv4v4tfgpfs6vK9iQno07mtFB363Jl6pppiBlZ2RdfQaQPy7+2hJeIMPTKC1mnECeSfi5+ZCCda0l0o2EmzthgbFnt7FCPUK8uLLPPJDKvS3XDhwJnMr1Xq8O07RyXKjj/jh27O329Ysq2f3A6bY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQX0gAyh; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQX0gAyh"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-842308adb3bso2090498b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296702; x=1780901502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LsfNw+BauM7fB3mJaL1tUgJDsLO/ObAtcy7sWXgWNLE=;
        b=fQX0gAyhwl3aqVks2IX+htjaUOWpxS/Hn/DTp0jLyh8ne+hLtvEfPwOZCwAgaBHwxX
         kZgjk7XEkoe8eV4/rqNfDjsXyHJ4qW9iDoXdRpPRd3E/bQV5L6KBCB4/nuh0EKjYznsG
         wP3k636Qxfrij4ErfUjCKcmgGRaJUwKU8462meKmiVDSTJ+rDZLZvJJIiNbdfUQgzpqk
         QUAGs7Wyl8RatZkyoc19OAC0+7/Xi4HX0jFeH6h+7XvibbgOjWufKra4C6LRI7E1AoGG
         KzMn5oF0uEzTlMXdTq44P0CGWXcfKrqKmui8kh7+UMOl3Czrl1OcwrH4cLolgD7h/RNR
         AVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296702; x=1780901502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsfNw+BauM7fB3mJaL1tUgJDsLO/ObAtcy7sWXgWNLE=;
        b=snAoH08HsHtcD1HjgD2HTaIBRwIJkvWwcP+fSXAhXJm1BWtnGmDKXbxDJzegZHLyYj
         Fw56uNia5JF0S5MhUjRE3g9DrMX3G/BL/OjYWHrjE+1lvjoRjVqSevbaacmgEUKQg9In
         VKSCQ17mM7KpDDmCjl96bS6jU1R8uBMjTJgXwa5uoZdBHx0s1ZxN8i9jtCToTL/Agcjt
         2YRTAOC0BB/t26g8BPGF5SUOzOH16Xqmad3AZMiyYSAXtTgUoR4r1bHTISuU4U1STnUg
         i9OzNO9qN56kCdzAAIaeX2yAc1Dx2d9pmPFGhmaRY4Jx1yaHf3nfcSCFae3VeKPnqsy+
         7D+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HEbQO9hmg0FNA1uaBrZrDieGuElQZG5urlAszD8ClIUvWsMCv0kysuCYPyUK793a2QCSM2rH/sFobM1RF8wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDYvOMxmibScUXdNCwpCUsHu5gbdz/N9LtDFGOOLeqwvYSUXA
	VyFvLyWgywZDm05tzgAN6WHy5Ih+croa/NYTauYA+OljiiuUvWZrVqrmF3rQRil2Mtca/OxWXqF
	boQ==
X-Received: from pfsy9.prod.google.com ([2002:a05:6a00:389:b0:842:1c68:3772])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a17:b0:82f:355a:857e
 with SMTP id d2e1a72fcca58-842257098f3mr9099839b3a.47.1780296701652; Sun, 31
 May 2026 23:51:41 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:25 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-7-wakel@google.com>
Subject: [PATCH 6/7] selftests/futex: Migrate futex_priv_hash to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_priv_hash test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and passing test metadata
to all helper functions.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex/functional/futex_priv_hash.c        | 160 +++++++++---------
 1 file changed, 78 insertions(+), 82 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index e8079d7c65e8..60d500598f2b 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -10,6 +10,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
+#include <string.h>
 
 #include <linux/prctl.h>
 #include <sys/prctl.h>
@@ -39,31 +40,27 @@ static int futex_hash_slots_get(void)
 	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS);
 }
 
-static void futex_hash_slots_set_verify(int slots)
+static void futex_hash_slots_set_verify(struct __test_metadata *_metadata, int slots)
 {
 	int ret;
 
 	ret = futex_hash_slots_set(slots);
-	if (ret != 0) {
-		ksft_test_result_fail("Failed to set slots to %d: %m\n", slots);
-		ksft_finished();
-	}
+	ASSERT_EQ(ret, 0)
+		TH_LOG("Failed to set slots to %d: %s", slots, strerror(errno));
+
 	ret = futex_hash_slots_get();
-	if (ret != slots) {
-		ksft_test_result_fail("Set %d slots but PR_FUTEX_HASH_GET_SLOTS returns: %d, %m\n",
-		       slots, ret);
-		ksft_finished();
-	}
-	ksft_test_result_pass("SET and GET slots %d passed\n", slots);
+	ASSERT_EQ(ret, slots)
+		TH_LOG("Set %d slots but PR_FUTEX_HASH_GET_SLOTS returns: %d, %s",
+		       slots, ret, strerror(errno));
 }
 
-static void futex_hash_slots_set_must_fail(int slots)
+static void futex_hash_slots_set_must_fail(struct __test_metadata *_metadata, int slots)
 {
 	int ret;
 
 	ret = futex_hash_slots_set(slots);
-	ksft_test_result(ret < 0, "futex_hash_slots_set(%d)\n",
-			 slots);
+	EXPECT_LT(ret, 0)
+		TH_LOG("futex_hash_slots_set(%d) should fail but succeeded", slots);
 }
 
 static void *thread_return_fn(void *arg)
@@ -82,32 +79,32 @@ static void *thread_lock_fn(void *arg)
 	return NULL;
 }
 
-static void create_max_threads(void *(*thread_fn)(void *))
+static void create_max_threads(struct __test_metadata *_metadata, void *(*thread_fn)(void *))
 {
 	int i, ret;
 
 	for (i = 0; i < MAX_THREADS; i++) {
 		ret = pthread_create(&threads[i], NULL, thread_fn, NULL);
-		if (ret)
-			ksft_exit_fail_msg("pthread_create failed: %m\n");
+		ASSERT_EQ(ret, 0)
+			TH_LOG("pthread_create failed: %s", strerror(errno));
 	}
 }
 
-static void join_max_threads(void)
+static void join_max_threads(struct __test_metadata *_metadata)
 {
 	int i, ret;
 
 	for (i = 0; i < MAX_THREADS; i++) {
 		ret = pthread_join(threads[i], NULL);
-		if (ret)
-			ksft_exit_fail_msg("pthread_join failed for thread %d\n", i);
+		ASSERT_EQ(ret, 0)
+			TH_LOG("pthread_join failed for thread %d: %s", i, strerror(errno));
 	}
 }
 
 #define SEC_IN_NSEC	1000000000
 #define MSEC_IN_NSEC	1000000
 
-static void futex_dummy_op(void)
+static void futex_dummy_op(struct __test_metadata *_metadata)
 {
 	pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
 	struct timespec timeout;
@@ -121,11 +118,11 @@ static void futex_dummy_op(void)
 		timeout.tv_sec++;
 	}
 	ret = pthread_mutex_timedlock(&lock, &timeout);
-	if (ret == 0)
-		ksft_exit_fail_msg("Successfully locked an already locked mutex.\n");
+	ASSERT_NE(ret, 0)
+		TH_LOG("Successfully locked an already locked mutex");
 
-	if (ret != ETIMEDOUT)
-		ksft_exit_fail_msg("pthread_mutex_timedlock() did not timeout: %d.\n", ret);
+	ASSERT_EQ(ret, ETIMEDOUT)
+		TH_LOG("pthread_mutex_timedlock() did not timeout: %d", ret);
 }
 
 static const char *test_msg_auto_create = "Automatic hash bucket init on thread creation.\n";
@@ -140,50 +137,45 @@ TEST(priv_hash)
 	ret = pthread_mutexattr_init(&mutex_attr_pi);
 	ret |= pthread_mutexattr_setprotocol(&mutex_attr_pi, PTHREAD_PRIO_INHERIT);
 	ret |= pthread_mutex_init(&global_lock, &mutex_attr_pi);
-	if (ret != 0) {
-		ksft_exit_fail_msg("Failed to initialize pthread mutex.\n");
-	}
+	ASSERT_EQ(ret, 0)
+		TH_LOG("Failed to initialize pthread mutex");
+
 	/* First thread, expect to be 0, not yet initialized */
 	ret = futex_hash_slots_get();
-	if (ret != 0)
-		ksft_exit_fail_msg("futex_hash_slots_get() failed: %d, %m\n", ret);
+	ASSERT_EQ(ret, 0)
+		TH_LOG("futex_hash_slots_get() failed: %d, %s", ret, strerror(errno));
 
-	ksft_test_result_pass("Basic get slots and immutable status.\n");
 	ret = pthread_create(&threads[0], NULL, thread_return_fn, NULL);
-	if (ret != 0)
-		ksft_exit_fail_msg("pthread_create() failed: %d, %m\n", ret);
+	ASSERT_EQ(ret, 0)
+		TH_LOG("pthread_create() failed: %d, %s", ret, strerror(errno));
 
 	ret = pthread_join(threads[0], NULL);
-	if (ret != 0)
-		ksft_exit_fail_msg("pthread_join() failed: %d, %m\n", ret);
+	ASSERT_EQ(ret, 0)
+		TH_LOG("pthread_join() failed: %d, %s", ret, strerror(errno));
 
 	/* First thread, has to initialize private hash */
 	futex_slots1 = futex_hash_slots_get();
-	if (futex_slots1 <= 0) {
-		ksft_print_msg("Current hash buckets: %d\n", futex_slots1);
-		ksft_exit_fail_msg("%s", test_msg_auto_create);
-	}
-
-	ksft_test_result_pass("%s", test_msg_auto_create);
+	EXPECT_GT(futex_slots1, 0)
+		TH_LOG("Current hash buckets: %d. %s", futex_slots1, test_msg_auto_create);
 
 	online_cpus = sysconf(_SC_NPROCESSORS_ONLN);
 	ret = pthread_barrier_init(&barrier_main, NULL, MAX_THREADS + 1);
-	if (ret != 0)
-		ksft_exit_fail_msg("pthread_barrier_init failed: %m.\n");
+	ASSERT_EQ(ret, 0)
+		TH_LOG("pthread_barrier_init failed: %s", strerror(errno));
 
 	ret = pthread_mutex_lock(&global_lock);
-	if (ret != 0)
-		ksft_exit_fail_msg("pthread_mutex_lock failed: %m.\n");
+	ASSERT_EQ(ret, 0)
+		TH_LOG("pthread_mutex_lock failed: %s", strerror(errno));
 
 	counter = 0;
-	create_max_threads(thread_lock_fn);
+	create_max_threads(_metadata, thread_lock_fn);
 	pthread_barrier_wait(&barrier_main);
 
 	/*
 	 * The current default size of hash buckets is 16. The auto increase
 	 * works only if more than 16 CPUs are available.
 	 */
-	ksft_print_msg("Online CPUs: %d\n", online_cpus);
+	TH_LOG("Online CPUs: %d", online_cpus);
 	if (online_cpus > 16) {
 retry_getslots:
 		futex_slotsn = futex_hash_slots_get();
@@ -200,71 +192,75 @@ TEST(priv_hash)
 			 * sleep for 100ms and issue a futex operation.
 			 */
 			if (retry > 0) {
-				futex_dummy_op();
+				futex_dummy_op(_metadata);
 				goto retry_getslots;
 			}
-			ksft_print_msg("Expected increase of hash buckets but got: %d -> %d\n",
-				       futex_slots1, futex_slotsn);
-			ksft_exit_fail_msg("%s", test_msg_auto_inc);
+			EXPECT_NE(futex_slots1, futex_slotsn)
+				TH_LOG("Expected increase of hash buckets but got: %d -> %d. %s",
+				       futex_slots1, futex_slotsn, test_msg_auto_inc);
 		}
-		ksft_test_result_pass("%s", test_msg_auto_inc);
 	} else {
-		ksft_test_result_skip("%s", test_msg_auto_inc);
+		SKIP(return, "Automatic increase with more than 16 CPUs (only %d online)", online_cpus);
 	}
 	ret = pthread_mutex_unlock(&global_lock);
 
 	/* Once the user changes it, it has to be what is set */
-	futex_hash_slots_set_verify(2);
-	futex_hash_slots_set_verify(4);
-	futex_hash_slots_set_verify(8);
-	futex_hash_slots_set_verify(32);
-	futex_hash_slots_set_verify(16);
+	futex_hash_slots_set_verify(_metadata, 2);
+	futex_hash_slots_set_verify(_metadata, 4);
+	futex_hash_slots_set_verify(_metadata, 8);
+	futex_hash_slots_set_verify(_metadata, 32);
+	futex_hash_slots_set_verify(_metadata, 16);
 
 	ret = futex_hash_slots_set(15);
-	ksft_test_result(ret < 0, "Use 15 slots\n");
+	EXPECT_LT(ret, 0)
+		TH_LOG("Use 15 slots should fail but succeeded");
+
+	futex_hash_slots_set_verify(_metadata, 2);
+	join_max_threads(_metadata);
+
+	EXPECT_EQ(counter, MAX_THREADS)
+		TH_LOG("Created and waited for %d of %d threads", counter, MAX_THREADS);
 
-	futex_hash_slots_set_verify(2);
-	join_max_threads();
-	ksft_test_result(counter == MAX_THREADS, "Created and waited for %d of %d threads\n",
-			 counter, MAX_THREADS);
 	counter = 0;
 	/* Once the user set something, auto resize must be disabled */
 	ret = pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
+	ASSERT_EQ(ret, 0)
+		TH_LOG("pthread_barrier_init failed: %s", strerror(errno));
 
-	create_max_threads(thread_lock_fn);
-	join_max_threads();
+	create_max_threads(_metadata, thread_lock_fn);
+	join_max_threads(_metadata);
 
 	ret = futex_hash_slots_get();
-	ksft_test_result(ret == 2, "No more auto-resize after manual setting, got %d\n",
-			 ret);
+	EXPECT_EQ(ret, 2)
+		TH_LOG("No more auto-resize after manual setting, got %d", ret);
 
-	futex_hash_slots_set_must_fail(1 << 29);
-	futex_hash_slots_set_verify(4);
+	futex_hash_slots_set_must_fail(_metadata, 1 << 29);
+	futex_hash_slots_set_verify(_metadata, 4);
 
 	/*
 	 * Once the global hash has been requested, then this requested can not
 	 * be undone.
 	 */
 	ret = futex_hash_slots_set(0);
-	ksft_test_result(ret == 0, "Global hash request\n");
-	if (ret != 0)
-		return;
+	ASSERT_EQ(ret, 0)
+		TH_LOG("Global hash request failed: %s", strerror(errno));
 
-	futex_hash_slots_set_must_fail(4);
-	futex_hash_slots_set_must_fail(8);
-	futex_hash_slots_set_must_fail(8);
-	futex_hash_slots_set_must_fail(0);
-	futex_hash_slots_set_must_fail(6);
+	futex_hash_slots_set_must_fail(_metadata, 4);
+	futex_hash_slots_set_must_fail(_metadata, 8);
+	futex_hash_slots_set_must_fail(_metadata, 8);
+	futex_hash_slots_set_must_fail(_metadata, 0);
+	futex_hash_slots_set_must_fail(_metadata, 6);
 
 	ret = pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
-	if (ret != 0)
-		ksft_exit_fail_msg("pthread_barrier_init failed: %m\n");
+	ASSERT_EQ(ret, 0)
+		TH_LOG("pthread_barrier_init failed: %s", strerror(errno));
 
-	create_max_threads(thread_lock_fn);
-	join_max_threads();
+	create_max_threads(_metadata, thread_lock_fn);
+	join_max_threads(_metadata);
 
 	ret = futex_hash_slots_get();
-	ksft_test_result(ret == 0, "Continue to use global hash\n");
+	EXPECT_EQ(ret, 0)
+		TH_LOG("Continue to use global hash failed");
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.823.g6e5bcc1fc9-goog

