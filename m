Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C656283CA3
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769566010; cv=none; b=g53gBYyK0JocSNP5QzLaZKcNbpGwiaazdIcW3LBppui+aV1vTadywfrKA35s1HLpx3Otm+Nr0D+aY2F864IKgfqAfeIYGy+uQPC6IsMaIcjUQHw0I851ikq5iG2+yInphhwuqG0zEwg0Nw1VYikSpx6Wv/aM5t0QH5syP7mpiSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769566010; c=relaxed/simple;
	bh=RtGyyzBX6AK6SvFZ2see+SvCdlvBO3lMepVVAss77AQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=U2rPxgWT4v/r3WPpRiHOXpR7sa0/OzAdfK9RAW/Tb1YHSBb1KgASxVzs6fEufBTU1g8JFdxGrqbXeKlXzYY65TqhFrVcsB2mKH2UYVnxUxF4EsZHr8mVCRE8kJA3V1TTHbdlkBip1REKxPAeXhKVWCiBXiRVEOUNqhZAn4tvAHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=vPNv0OJb; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="vPNv0OJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769566002;
	bh=f/aOx3mCbZanFDD3JoLvsjPI40+JzFT1mnCxz+wj4S0=;
	h=From:To:Cc:Subject:Date;
	b=vPNv0OJb3/l0a2mrBS4o5zsYwVg1knhGBqIwtRPiIBnLK+mBybBAEDjP2xfaf4lbm
	 VQJtHP4tXVLV63sDTvXUBO+nedafclTEfbETUqZa0ts8aldPZ2Dxsphz7yvLPMhFAo
	 3gpETST+9qv6pTwPCy2FrsoHfl7YGSCpzNBYh66w=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id CD0FC10; Wed, 28 Jan 2026 10:03:13 +0800
X-QQ-mid: xmsmtpt1769565793tfzvu82v6
Message-ID: <tencent_51851B741CC4B5EC9C22AFF70BA82BB60805@qq.com>
X-QQ-XMAILINFO: Mg/13mbJq/RufJvCkyTk3w2Lam/RIDsAkbHqfT8wk+Dhck9Msqk9hFtykWGXfy
	 1luv5e7/A0d1vpbrvhRP/JbOqIZsHBHEJ1IDzOVhwXs58n6+5l/+Q6304I0qiiVETd4cj0mJdNp7
	 /xUohj2KWOdLgMtqp6OrsSBR6uMs9qXHzGB2TPQL73ncfYXLlMLCcC2fKhwdhvw8sjl1t66jw+OG
	 pz0YveKr18u4MPKNpZYmlatAP55HYjbJ0j88Eve7cGObkSB5zcpYbLlN9FC/gcAIDDojul2oW6V0
	 iuJkgrHTKreDWEllxq8AuKdyLvuJFqjM9X1YpfKXr4imx5NYkzBKOvkURV+u39NaLGxUEBDIjq/X
	 XuIJOx20oe5aWyzBxiB/SR/01ZCOkb771X00H8/6Gom+bSy2lmiSA5L9Knkmj/AygoL8LD8tZAS7
	 r+UhvLzwp9OCNGv851pUEMnfZBMG4IvneAUtN8LkKOx/wy5kD4yLGBhDE0zvDc2oIw2wqd71tZrG
	 AmZK/If6pecWh5Qdl6kCIGGTl6fbhOuSBMyiw6LNGLy6Y2ydVt8M/hR4vfsW/yZtKnd4yVr8VDqw
	 eiAi+sbIzSibd3OJLzhnoIRCJQ5d2F8BZXNblykzKTOv1Z/6eNk3BL50gRxShs6PYrTCIXfVzHsG
	 MGwkFJXfFKw5Jyfn2vyIYXZc8GYr8VZnP7oGv1fXAgt5JGpTVzERS5spUv853a+z2sgZjWr1I9lf
	 WKNmS84DpWXHuTSkQELBTatomQhhHrYdwCBkxZVVEngkZbDhWGKwTc4F3yG316uYeGkZz6UpaHVF
	 frDi1utKoy5v3ZufkOk0ajAyvyDxwipEkUGq5LJSzVzTBB3AWtSidwgpribK9vtf3sqNG0SE0xTI
	 LjDZyr4qMzbdSbyCBYLEQxdFTDQnGpGIXaKVnQyCyxlwK/1u/I0gCYQPQWNskTqyo2cEtSx4dt0E
	 QibheotKr1h7jzDi5ySWbgmbdgoZkjWKu6/B7Qjf/zqppsWIs3rjv8288eaAhqi+Zd8284YVc2yB
	 5+J0z/AFzOFOExFmC1NGWYlTFRGGg6oFv06moIJTN2nbsnQ4S1gpm66aNwtNHieDddHWXBQF+Zww
	 9RKZFZsvp5OSajBjq92oXtDSiZ8w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	edliaw@google.com,
	justinstitt@google.com,
	kernel-team@android.com,
	licayy@foxmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luto@mit.edu,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: [PATCH v2] selftests/futex: fix incorrect result reporting of futex_requeue test item
Date: Wed, 28 Jan 2026 10:03:10 +0800
X-OQ-MSGID: <20260128020310.406630-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the TEST_HARNESS_MAIN macro definition to declare the main
function, you need to use the EXPECT_ and ASSERT_ series of functions in
conjunction. Otherwise, even if a test item fails, the test will still
return a success result.

When adding a delay in waiterfn to artificially create an incorrect test
result, the test item has actually failed. However, the output still
indicates that the test has passed:

TAP version 13
1..2
 Starting 2 tests from 1 test cases.
  RUN           global.requeue_single ...
not ok 1 futex_requeue simple returned: 0
not ok 2 futex_requeue simple returned: 0
            OK  global.requeue_single
ok 1 global.requeue_single
  RUN           global.requeue_multiple ...
not ok 2 futex_requeue many returned: 0 Success
not ok 3 futex_requeue many returned: 0 Success
            OK  global.requeue_multiple
ok 2 global.requeue_multiple
 PASSED: 2 / 2 tests passed.
 Totals: pass:2 fail:0 xfail:0 xpass:0 skip:0 error:0

Fixes: f341a20f6d7e ("selftests/futex: Refactor futex_requeue with kselftest_harness.h")
Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
---
v1 -> v2: https://lore.kernel.org/all/tencent_56D79AF3D23CEFAF882E83A2196EC1F12107@qq.com/
  - rebase the patch

 .../futex/functional/futex_requeue.c          | 49 +++----------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index 35d4be23db5da..dcf0d5f2f3122 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -34,34 +34,18 @@ TEST(requeue_single)
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
-	int res;
 
 	f1 = &_f1;
 
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	if (pthread_create(&waiter[0], NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Requeuing 1 futex from f1 to f2\n");
-	res = futex_cmp_requeue(f1, 0, &f2, 0, 1, 0);
-	if (res != 1)
-		ksft_test_result_fail("futex_requeue simple returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-
-	ksft_print_dbg_msg("Waking 1 futex at f2\n");
-	res = futex_wake(&f2, 1, 0);
-	if (res != 1) {
-		ksft_test_result_fail("futex_requeue simple returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_requeue simple succeeds\n");
-	}
+	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
+	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
 }
 
 TEST(requeue_multiple)
@@ -69,7 +53,7 @@ TEST(requeue_multiple)
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
-	int res, i;
+	int i;
 
 	f1 = &_f1;
 
@@ -77,30 +61,13 @@ TEST(requeue_multiple)
 	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
-	for (i = 0; i < 10; i++) {
-		if (pthread_create(&waiter[i], NULL, waiterfn, NULL))
-			ksft_exit_fail_msg("pthread_create failed\n");
-	}
+	for (i = 0; i < 10; i++)
+		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Waking 3 futexes at f1 and requeuing 7 futexes from f1 to f2\n");
-	res = futex_cmp_requeue(f1, 0, &f2, 3, 7, 0);
-	if (res != 10) {
-		ksft_test_result_fail("futex_requeue many returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	}
-
-	ksft_print_dbg_msg("Waking INT_MAX futexes at f2\n");
-	res = futex_wake(&f2, INT_MAX, 0);
-	if (res != 7) {
-		ksft_test_result_fail("futex_requeue many returned: %d %s\n",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	} else {
-		ksft_test_result_pass("futex_requeue many succeeds\n");
-	}
+	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
+	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
 }
 
 TEST_HARNESS_MAIN
-- 
2.34.1

