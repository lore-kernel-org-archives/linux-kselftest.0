Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12583D6481
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 07:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695878; cv=none; b=MwOiFos4k/aZXYyS6hqwHGAYeLhOglT1TpNWTI+wfxBVttp89I1o6x5Ks4FjRuEHNg65fOQaPs38FDIoantTjRG4vC0cfxVkLmzx/e7Qvc3gzj4YFbmAccE/W/9clMzIT6vVU04V1XaOZoZOB0TnifvhPJGD7q4TJa4EIUdLN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695878; c=relaxed/simple;
	bh=Fm0Q5rNLUWf70hf1lVlbcS4AwYsaTNnXQCuOTXjviFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jjy3DUU5afhQFt1MLPMRhc9qGtZ23SKETdPhjej3vp8TBV5kwBazk602KaEW84Y5dd7KlyKFVg3pnT0IdFmfjMQ14kJKdwZT26yWlJxHa7HxuarKFNMMVyuo68HXFYb0XMVoVVnUlnrHJnUvFPu4iQccJb9AgXfIi+5cY0Ttek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4/Gx04b; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4/Gx04b"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8281d4cef8so4185628a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 00:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779695876; x=1780300676; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=88My9DadzWJkWbkzxXj+e+x5l1Xi5DIoGj+mqLUxaRc=;
        b=E4/Gx04b1M1zoYtQvmlGpT1P67R0nHnbD40TNiQJndZplCPhuQ7vPABs+i8HwYw2Iz
         v09NygLHD4QGf7JecAxB4gjiaOVYkyxJziVFBSq4VcokklBXPE9tSXe+9VSansQvSwlm
         NMAHgjIskZZalntFwAoHH4gGRe6uTVd35oWAjQLly+zmqWqPXYuUFa20M5IgIPZqHXY8
         dU6TCTHXbuCIZJdKZqNl/u91esXDDgxGftbOxKwmwraNZy0br4nbZU5v7EzW3Yb/qzaQ
         C555nKDJxrwhIJCAU3+rrMdcyfRoVukr9AuT2b0jKTV260HgY/asm2LadtxfWQ2TZ4ef
         rROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695876; x=1780300676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88My9DadzWJkWbkzxXj+e+x5l1Xi5DIoGj+mqLUxaRc=;
        b=AEtglbj/c+6j7NvcvHcDXPszMG+OaKibNPqVyK6SbWuW7ibZ0DpjMfu6AP1oCw2ycQ
         kjlfOw6/pmUfOuLmcxgCtc5lwUzGpO3O5gdn28O7q5B3uDnXuwJAwZgyLuHVVubzyhjC
         m9hcjP3hRMz71BiKmidQD3CjK5jfklN9a7wJjB3VkMTogqkHaK0vxhQNEJRSzpWYkBH3
         LNlI/+VjtgCX9zjQNKwSAyZOSqjnJD89lACeanXbux8OemDe/MYqb3lOTtirWc6UyDg4
         6nM+lnW8PB0mur5qzFeLFpChy5ySnYZEJjWMtj4D5yYrtOQ78FcYIhTU4jsFI3wtVp4h
         cGpg==
X-Forwarded-Encrypted: i=1; AFNElJ8SPLFCPYBhFI3viCqSczoS395H6Z5hY5EUUc3QuZl2tRqLTjYVGN/ZJ8is/Cy7/YbvdU/8ysXWfwhbhsdKOIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtlAbAvRoxLXJOmth50Ut8REzpiBRnyM/HhWpNNsaO2xPI4wDX
	AtTX8kjMmHe4nh6DqPkAd6Uez6G8rZh9tHfkV+tIcLKVsvBV2VxxQSMeK9LLmxOqON6c3tN6Sj3
	LlQ==
X-Received: from pfnc20.prod.google.com ([2002:aa7:81d4:0:b0:829:7f86:623])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:240b:b0:835:3f51:72f8
 with SMTP id d2e1a72fcca58-8415f5db6c5mr12314294b3a.18.1779695875849; Mon, 25
 May 2026 00:57:55 -0700 (PDT)
Date: Mon, 25 May 2026 07:57:47 +0000
In-Reply-To: <20260525075748.3720995-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525075748.3720995-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525075748.3720995-2-wakel@google.com>
Subject: [PATCH 1/2] selftests/futex: Migrate functional tests to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	Edward Liaw <edliaw@google.com>, linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Currently, multiple futex functional tests (wait_timeout, waitv,
wait_wouldblock) mix low-level ksft_* logging and result APIs with
the kselftest_harness.h framework. On older kernels where system calls
like futex_waitv are missing (returning -ENOSYS), this mixed usage
triggers framework inconsistencies, causing the test to fail with:
"Illegal usage of low-level ksft APIs in harness test".

Address this by completely refactoring these tests to exclusively use
the high-level kselftest_harness.h framework (gtest-like API), mapping
all low-level calls to native harness macros:
- Non-fatal assertions: Replace ksft_test_result_fail() with EXPECT_EQ()
  and EXPECT_NE().
- Fatal assertions: Replace ksft_exit_fail_msg() with ASSERT_EQ() and
  ASSERT_TRUE() to immediately terminate execution upon setup failure.
- Test skipping: Replace ksft_exit_skip() with the graceful SKIP() macro
  combined with early runtime availability checks for sys_futex_waitv.
- Debug logging: Replace ksft_print_dbg_msg() with TH_LOG() to inherit
  automatic file/line context.
- Success reporting: Remove explicit ksft_test_result_pass() calls,
  deferring to automated harness completion reporting.

Additionally:
- Fix a critical SIGSEGV crash in early syscall probing logic caused by
  passing a NULL pointer to inline user-space timespec conversions.
- Introduce TEST_TIMEOUT() and GET_ABS_TIMEOUT() macros in wait_timeout
  to encapsulate assertions while preserving source line attribution.
- Pass test metadata (_metadata) into secondary threads to allow native
  harness assertions during concurrent execution.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex/functional/futex_wait_timeout.c     | 101 +++++++----------
 .../futex/functional/futex_wait_wouldblock.c  |  40 ++++---
 .../selftests/futex/functional/futex_waitv.c  | 107 +++++++++---------
 3 files changed, 118 insertions(+), 130 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait_timeout.c b/tools/testing/selftests/futex/functional/futex_wait_timeout.c
index 674dd13af421..89d6a7daeda4 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_timeout.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_timeout.c
@@ -31,53 +31,43 @@ static pthread_barrier_t barrier;
  */
 void *get_pi_lock(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
 	int ret;
 	volatile futex_t lock = 0;
 
 	ret = futex_lock_pi(&futex_pi, NULL, 0, 0);
-	if (ret != 0)
-		ksft_exit_fail_msg("futex_lock_pi failed\n");
+	ASSERT_EQ(ret, 0) TH_LOG("futex_lock_pi failed");
 
 	pthread_barrier_wait(&barrier);
 
 	/* Blocks forever */
 	ret = futex_wait(&lock, 0, NULL, 0);
-	ksft_exit_fail_msg("futex_wait failed\n");
+	ASSERT_TRUE(0) TH_LOG("futex_wait returned unexpectedly: %d", ret);
 
 	return NULL;
 }
 
-/*
- * Check if the function returned the expected error
- */
-static void test_timeout(int res, char *test_name, int err)
-{
-	if (!res || errno != err) {
-		ksft_test_result_fail("%s returned %d\n", test_name,
-				      res < 0 ? errno : res);
-	} else {
-		ksft_test_result_pass("%s succeeds\n", test_name);
-	}
-}
-
-/*
- * Calculate absolute timeout and correct overflow
- */
-static int futex_get_abs_timeout(clockid_t clockid, struct timespec *to,
-				 long timeout_ns)
-{
-	if (clock_gettime(clockid, to))
-		ksft_exit_fail_msg("clock_gettime failed\n");
-
-	to->tv_nsec += timeout_ns;
-
-	if (to->tv_nsec >= 1000000000) {
-		to->tv_sec++;
-		to->tv_nsec -= 1000000000;
-	}
-
-	return 0;
-}
+#define TEST_TIMEOUT(_res, _test_name, _err) do { \
+	if ((_res) < 0 && errno == ENOSYS && (_err) != ENOSYS) { \
+		SKIP(return, "%s is not supported (ENOSYS)", _test_name); \
+	} \
+	EXPECT_EQ((_res), -1) \
+		TH_LOG("%s returned unexpected result: %d", _test_name, (_res)); \
+	if ((_res) == -1) { \
+		EXPECT_EQ(errno, (_err)) \
+			TH_LOG("%s returned unexpected errno: %d (expected %d)", \
+			       _test_name, errno, (_err)); \
+	} \
+} while (0)
+
+#define GET_ABS_TIMEOUT(_clockid, _to, _timeout_ns) do { \
+	ASSERT_EQ(clock_gettime((_clockid), (_to)), 0) TH_LOG("clock_gettime failed"); \
+	(_to)->tv_nsec += (_timeout_ns); \
+	if ((_to)->tv_nsec >= 1000000000) { \
+		(_to)->tv_sec++; \
+		(_to)->tv_nsec -= 1000000000; \
+	} \
+} while (0)
 
 TEST(wait_bitset)
 {
@@ -90,19 +80,17 @@ TEST(wait_bitset)
 	to.tv_nsec = timeout_ns;
 
 	res = futex_wait(&f1, f1, &to, 0);
-	test_timeout(res, "futex_wait relative", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_wait relative", ETIMEDOUT);
 
 	/* FUTEX_WAIT_BITSET with CLOCK_REALTIME */
-	if (futex_get_abs_timeout(CLOCK_REALTIME, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_REALTIME, &to, timeout_ns);
 	res = futex_wait_bitset(&f1, f1, &to, 1, FUTEX_CLOCK_REALTIME);
-	test_timeout(res, "futex_wait_bitset realtime", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_wait_bitset realtime", ETIMEDOUT);
 
 	/* FUTEX_WAIT_BITSET with CLOCK_MONOTONIC */
-	if (futex_get_abs_timeout(CLOCK_MONOTONIC, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_MONOTONIC, &to, timeout_ns);
 	res = futex_wait_bitset(&f1, f1, &to, 1, 0);
-	test_timeout(res, "futex_wait_bitset monotonic", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_wait_bitset monotonic", ETIMEDOUT);
 }
 
 TEST(requeue_pi)
@@ -112,17 +100,14 @@ TEST(requeue_pi)
 	int res;
 
 	/* FUTEX_WAIT_REQUEUE_PI with CLOCK_REALTIME */
-	if (futex_get_abs_timeout(CLOCK_REALTIME, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_REALTIME, &to, timeout_ns);
 	res = futex_wait_requeue_pi(&f1, f1, &futex_pi, &to, FUTEX_CLOCK_REALTIME);
-	test_timeout(res, "futex_wait_requeue_pi realtime", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_wait_requeue_pi realtime", ETIMEDOUT);
 
 	/* FUTEX_WAIT_REQUEUE_PI with CLOCK_MONOTONIC */
-	if (futex_get_abs_timeout(CLOCK_MONOTONIC, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_MONOTONIC, &to, timeout_ns);
 	res = futex_wait_requeue_pi(&f1, f1, &futex_pi, &to, 0);
-	test_timeout(res, "futex_wait_requeue_pi monotonic", ETIMEDOUT);
-
+	TEST_TIMEOUT(res, "futex_wait_requeue_pi monotonic", ETIMEDOUT);
 }
 
 TEST(lock_pi)
@@ -133,7 +118,8 @@ TEST(lock_pi)
 
 	/* Create a thread that will lock forever so any waiter will timeout */
 	pthread_barrier_init(&barrier, NULL, 2);
-	pthread_create(&thread, NULL, get_pi_lock, NULL);
+	ASSERT_EQ(pthread_create(&thread, NULL, get_pi_lock, _metadata), 0)
+		TH_LOG("pthread_create failed");
 
 	/* Wait until the other thread calls futex_lock_pi() */
 	pthread_barrier_wait(&barrier);
@@ -149,14 +135,13 @@ TEST(lock_pi)
 	 * time or your time machine) the monotonic clock value is always
 	 * smaller than realtime and the syscall will timeout immediately.
 	 */
-	if (futex_get_abs_timeout(CLOCK_REALTIME, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_REALTIME, &to, timeout_ns);
 	res = futex_lock_pi(&futex_pi, &to, 0, 0);
-	test_timeout(res, "futex_lock_pi realtime", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_lock_pi realtime", ETIMEDOUT);
 
 	/* Test operations that don't support FUTEX_CLOCK_REALTIME */
 	res = futex_lock_pi(&futex_pi, NULL, 0, FUTEX_CLOCK_REALTIME);
-	test_timeout(res, "futex_lock_pi invalid timeout flag", ENOSYS);
+	TEST_TIMEOUT(res, "futex_lock_pi invalid timeout flag", ENOSYS);
 }
 
 TEST(waitv)
@@ -172,16 +157,14 @@ TEST(waitv)
 	int res;
 
 	/* futex_waitv with CLOCK_MONOTONIC */
-	if (futex_get_abs_timeout(CLOCK_MONOTONIC, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_MONOTONIC, &to, timeout_ns);
 	res = futex_waitv(&waitv, 1, 0, &to, CLOCK_MONOTONIC);
-	test_timeout(res, "futex_waitv monotonic", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_waitv monotonic", ETIMEDOUT);
 
 	/* futex_waitv with CLOCK_REALTIME */
-	if (futex_get_abs_timeout(CLOCK_REALTIME, &to, timeout_ns))
-		ksft_test_result_error("get_time error");
+	GET_ABS_TIMEOUT(CLOCK_REALTIME, &to, timeout_ns);
 	res = futex_waitv(&waitv, 1, 0, &to, CLOCK_REALTIME);
-	test_timeout(res, "futex_waitv realtime", ETIMEDOUT);
+	TEST_TIMEOUT(res, "futex_waitv realtime", ETIMEDOUT);
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
index 9ff936ecf164..4fd517404f1f 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
@@ -28,21 +28,26 @@
 
 #define timeout_ns 100000
 
+static bool is_futex_waitv_supported(void)
+{
+	struct timespec ts = {0, 0};
+	int res = futex_waitv(NULL, 0, 0, &ts, CLOCK_MONOTONIC);
+
+	return !(res < 0 && errno == ENOSYS);
+}
+
 TEST(futex_wait_wouldblock)
 {
 	struct timespec to = {.tv_sec = 0, .tv_nsec = timeout_ns};
 	futex_t f1 = FUTEX_INITIALIZER;
 	int res;
 
-	ksft_print_dbg_msg("Calling futex_wait on f1: %u @ %p with val=%u\n", f1, &f1, f1+1);
+	TH_LOG("Calling futex_wait on f1: %u @ %p with val=%u", f1, &f1, f1+1);
 	res = futex_wait(&f1, f1+1, &to, FUTEX_PRIVATE_FLAG);
-	if (!res || errno != EWOULDBLOCK) {
-		ksft_test_result_fail("futex_wait returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_wait\n");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_wait returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EWOULDBLOCK)
+			TH_LOG("futex_wait returned unexpected errno: %d", errno);
 }
 
 TEST(futex_waitv_wouldblock)
@@ -57,8 +62,10 @@ TEST(futex_waitv_wouldblock)
 	};
 	int res;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("clock_gettime failed %d\n", errno);
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("clock_gettime failed");
 
 	to.tv_nsec += timeout_ns;
 
@@ -67,15 +74,12 @@ TEST(futex_waitv_wouldblock)
 		to.tv_nsec -= 1000000000;
 	}
 
-	ksft_print_dbg_msg("Calling futex_waitv on f1: %u @ %p with val=%u\n", f1, &f1, f1+1);
+	TH_LOG("Calling futex_waitv on f1: %u @ %p with val=%u", f1, &f1, f1+1);
 	res = futex_waitv(&waitv, 1, 0, &to, CLOCK_MONOTONIC);
-	if (!res || errno != EWOULDBLOCK) {
-		ksft_test_result_fail("futex_waitv returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv\n");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_waitv returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EWOULDBLOCK)
+			TH_LOG("futex_waitv returned unexpected errno: %d", errno);
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/futex/functional/futex_waitv.c b/tools/testing/selftests/futex/functional/futex_waitv.c
index b5ada9fdb26f..7bed76a1caed 100644
--- a/tools/testing/selftests/futex/functional/futex_waitv.c
+++ b/tools/testing/selftests/futex/functional/futex_waitv.c
@@ -25,24 +25,31 @@
 static struct futex_waitv waitv[NR_FUTEXES];
 u_int32_t futexes[NR_FUTEXES] = {0};
 
+static bool is_futex_waitv_supported(void)
+{
+	struct timespec ts = {0, 0};
+	int res = futex_waitv(NULL, 0, 0, &ts, CLOCK_MONOTONIC);
+
+	return !(res < 0 && errno == ENOSYS);
+}
+
 void *waiterfn(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
 	struct timespec to;
 	int res;
 
 	/* setting absolute timeout for futex2 */
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("gettime64 failed\n");
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
 
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
 	if (res < 0) {
-		ksft_test_result_fail("futex_waitv returned: %d %s\n",
-				      errno, strerror(errno));
-	} else if (res != NR_FUTEXES - 1) {
-		ksft_test_result_fail("futex_waitv returned: %d, expecting %d\n",
-				      res, NR_FUTEXES - 1);
+		EXPECT_EQ(res, NR_FUTEXES - 1) TH_LOG("futex_waitv failed: %s", strerror(errno));
+	} else {
+		EXPECT_EQ(res, NR_FUTEXES - 1)
+			TH_LOG("futex_waitv returned %d, expected %d", res, NR_FUTEXES - 1);
 	}
 
 	return NULL;
@@ -53,6 +60,9 @@ TEST(private_waitv)
 	pthread_t waiter;
 	int res, i;
 
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
 	for (i = 0; i < NR_FUTEXES; i++) {
 		waitv[i].uaddr = (uintptr_t)&futexes[i];
 		waitv[i].flags = FUTEX_32 | FUTEX_PRIVATE_FLAG;
@@ -61,19 +71,15 @@ TEST(private_waitv)
 	}
 
 	/* Private waitv */
-	if (pthread_create(&waiter, NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, _metadata), 0)
+		TH_LOG("pthread_create failed");
 
 	usleep(WAKE_WAIT_US);
 
 	res = futex_wake(u64_to_ptr(waitv[NR_FUTEXES - 1].uaddr), 1, FUTEX_PRIVATE_FLAG);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake private returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv private\n");
-	}
+	EXPECT_EQ(res, 1)
+		TH_LOG("futex_wake private returned: %d %s",
+		       res, res < 0 ? strerror(errno) : "");
 }
 
 TEST(shared_waitv)
@@ -81,15 +87,17 @@ TEST(shared_waitv)
 	pthread_t waiter;
 	int res, i;
 
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
 	/* Shared waitv */
 	for (i = 0; i < NR_FUTEXES; i++) {
 		int shm_id = shmget(IPC_PRIVATE, 4096, IPC_CREAT | 0666);
 
 		if (shm_id < 0) {
 			if (errno == ENOSYS)
-				ksft_exit_skip("shmget syscall not supported\n");
-			perror("shmget");
-			exit(1);
+				SKIP(return, "shmget syscall not supported");
+			ASSERT_GE(shm_id, 0) TH_LOG("shmget failed");
 		}
 
 		unsigned int *shared_data = shmat(shm_id, NULL, 0);
@@ -101,19 +109,15 @@ TEST(shared_waitv)
 		waitv[i].__reserved = 0;
 	}
 
-	if (pthread_create(&waiter, NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, _metadata), 0)
+		TH_LOG("pthread_create failed");
 
 	usleep(WAKE_WAIT_US);
 
 	res = futex_wake(u64_to_ptr(waitv[NR_FUTEXES - 1].uaddr), 1, 0);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake shared returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv shared\n");
-	}
+	EXPECT_EQ(res, 1)
+		TH_LOG("futex_wake shared returned: %d %s",
+		       res, res < 0 ? strerror(errno) : "");
 
 	for (i = 0; i < NR_FUTEXES; i++)
 		shmdt(u64_to_ptr(waitv[i].uaddr));
@@ -124,21 +128,21 @@ TEST(invalid_flag)
 	struct timespec to;
 	int res;
 
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
 	/* Testing a waiter without FUTEX_32 flag */
 	waitv[0].flags = FUTEX_PRIVATE_FLAG;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("gettime64 failed\n");
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
 
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
 	if (res == EINVAL) {
-		ksft_test_result_fail("futex_waitv private returned: %d %s\n",
+		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
 				      res ? errno : res,
 				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv without FUTEX_32\n");
 	}
 }
 
@@ -147,22 +151,22 @@ TEST(unaligned_address)
 	struct timespec to;
 	int res;
 
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
 	/* Testing a waiter with an unaligned address */
 	waitv[0].flags = FUTEX_PRIVATE_FLAG | FUTEX_32;
 	waitv[0].uaddr = 1;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("gettime64 failed\n");
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
 
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
 	if (res == EINVAL) {
-		ksft_test_result_fail("futex_wake private returned: %d %s\n",
+		EXPECT_TRUE(0) TH_LOG("futex_wake private returned: %d %s",
 				      res ? errno : res,
 				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv with an unaligned address\n");
 	}
 }
 
@@ -171,36 +175,33 @@ TEST(null_address)
 	struct timespec to;
 	int res;
 
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
 	/* Testing a NULL address for waiters.uaddr */
 	waitv[0].uaddr = 0x00000000;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("gettime64 failed\n");
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
 
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
 	if (res == EINVAL) {
-		ksft_test_result_fail("futex_waitv private returned: %d %s\n",
+		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
 				      res ? errno : res,
 				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv NULL address in waitv.uaddr\n");
 	}
 
 	/* Testing a NULL address for *waiters */
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("gettime64 failed\n");
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
 
 	to.tv_sec++;
 
 	res = futex_waitv(NULL, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
 	if (res == EINVAL) {
-		ksft_test_result_fail("futex_waitv private returned: %d %s\n",
+		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
 				      res ? errno : res,
 				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv NULL address in *waiters\n");
 	}
 }
 
@@ -209,19 +210,19 @@ TEST(invalid_clockid)
 	struct timespec to;
 	int res;
 
+	if (!is_futex_waitv_supported())
+		SKIP(return, "futex_waitv syscall not supported");
+
 	/* Testing an invalid clockid */
-	if (clock_gettime(CLOCK_MONOTONIC, &to))
-		ksft_exit_fail_msg("gettime64 failed\n");
+	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
 
 	to.tv_sec++;
 
 	res = futex_waitv(NULL, NR_FUTEXES, 0, &to, CLOCK_TAI);
 	if (res == EINVAL) {
-		ksft_test_result_fail("futex_waitv private returned: %d %s\n",
+		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
 				      res ? errno : res,
 				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_waitv invalid clockid\n");
 	}
 }
 
-- 
2.54.0.746.g67dd491aae-goog

