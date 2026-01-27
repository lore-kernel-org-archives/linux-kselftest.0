Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863823ABBD
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499490; cv=none; b=rkl5At6tJlXXvlzCSMLO9nfY5Ntnk/Fw+9X0TgEsaP88b+ADiDtczn0I+8F//pKClJYyTUTuhqy/OMBZSijtAYX0Lrnm8QzLhF2Q4Qg42LAMWd9P0Ys7VsWYQSFg3Tn/TV7o0wKKKfHMLGvX0mJg6KekcrJgPFzzkAIWfPpNgj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499490; c=relaxed/simple;
	bh=keFKYyWCEFIgQjufblOS2w2m3wOCNmUaNElbwv6heD8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gS6jTR1mh6SjhWkTWODVtFFETQ6hP9g2CY7HbpTtBQX0iO2jqIkYdEDS8iMxQN0Yt7VKKZHKAqwIr1Iulbn8p7c3CEX3VMaxG+6osl81umv6M4R4xLZ0eeX65J0Z6mKG+O8qrtasHnHV0MZueNmVmVslw86li+pxbaMayXEZXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=WljzfK6p; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="WljzfK6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769499481;
	bh=47ZUi8KluVv0zl0up3d0Dg3sBIVV3GC32qTHYFG9uhI=;
	h=From:To:Cc:Subject:Date;
	b=WljzfK6p+o4HM6H3YES/PowItsz/g6+9vVdAsrxR6Xz17S7LSWqSm31mzBsCv8G0E
	 I83S47XG634YfVQoDd1rPhbSSKOwoo8hxSkuYCV32yb8KT4oY+LD9zFIBmMhw43gdl
	 Lz0f3q8VNZz+Xlkd17wRNnKCoqqeno+fy8uuNoWQ=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.72])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 97A32AB4; Tue, 27 Jan 2026 15:37:58 +0800
X-QQ-mid: xmsmtpt1769499478td1iyii17
Message-ID: <tencent_56D79AF3D23CEFAF882E83A2196EC1F12107@qq.com>
X-QQ-XMAILINFO: NuGpsYW8pZ+AkHxAgYknEPKdqEYh0pbuhE62wnpWodEU/upGVJCtyyijz9oj4T
	 /cJm96EmUJxCpQ3tLzS4nOhaQdLRt55BIeK9v1Yg+1FoEHNYL7WZu46vdvutMg5eXinIgLimv9xR
	 UhtXpcJze8M5RmWRvhY9GT2IxdzG8v0wRY9cTKWY/pmFE/C1kDpeRL4tCel42aFn4ZtOaExS4ETq
	 OmnP6csiPFDgnsW6OKYAIelApYckGpxnqcyMEyLhiNdTA1yIDhaWC2z7xUtPJoBs3gUqI+c05j7x
	 5UX6DjCA/fGiCyGIk2JXEG98noQbr0+WkEBBg2+EH2sj++KUBeXfi8bYM6ySZsePyv3dZOZOCGdg
	 zxQdlFBUe41vMyA3WlBnGp0w2cUehSsVFmj3pP3jUW3RUUNCZ2Tnsch9wJ7DCPNeqaMJqUJwgOWh
	 nUPunojLn8gACknUPe9m+ksnXqvWn1EawywxhTxCRE6XWcmWGJ+SxkZBv7ZJQiq6pPygE7tVpgAP
	 TZjVv6lM9Ap2H8OQZk/T8O7z8KoQVUgNRF3gXBhBndMGGpEQh4vZrhgiH8L+58AUNv8chbRRQrjT
	 FuXpQUi8sYXEW7FS6LVNUmuXoYV1j6rghKh5xo1TgWrslQFHviOk1juoHDII/Mw4X/3wMfdjzytB
	 aU23aAOi7rREZTzfB/pJmvrAc/vdJtOB7NqFlOPBousinkyo88NGr+OPEHycB1Vx8r9hbgt/d2vd
	 g33hh26FFPB2khkoJYyJ7eg2W6HLzCk8cmj8ddsJsYw1socf5lu5kZH2UmxFxS3o8yENNqN9gNKT
	 7sxV7cjKYbEShOze4BjUGNHc8Hk5/MwvLtswPS0zecEvR6V8iaElglJUfp9eSJAOlmnqoUo10nT+
	 QPHDkzAliUTycKjKjCVUO5u28oz5EU7GQvsIxtC1fz9gMSKQkRrbqOo239DQ/kpGdIkRf0DlBT36
	 gMrmAhlMcZ2sKksMIWX8TTqbugCTvo0YlekHc5g0TBnA9DT+bIL1o3J8o85jawWwllxO2jSF+qMV
	 pKoTxBl4wSP76+QJtmLJ4twxNjW7jEMQU0zpRLMBssAUAwasLeQBKYLcJhsfDx9PjulUE86w==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: bigeasy@linutronix.de,
	wakel@google.com
Cc: andrealmeid@igalia.com,
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
	tglx@linutronix.de,
	usama.anjum@collabora.com,
	Yuwen Chen <ywen.chen@foxmail.com>
Subject: [PATCH] selftests/futex: fix incorrect result reporting of futex_requeue test item
Date: Tue, 27 Jan 2026 15:37:56 +0800
X-OQ-MSGID: <20260127073756.382346-1-ywen.chen@foxmail.com>
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
 .../futex/functional/futex_requeue.c          | 47 ++++---------------
 1 file changed, 8 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index a9d96105134d0..b468411386dd5 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -62,7 +62,7 @@ TEST(requeue_single)
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
 	atomic_int tid = 0;
-	int res, state, retry = 100;
+	int state, retry = 100;
 
 	f1 = &_f1;
 	pthread_barrier_init(&barrier, NULL, 2);
@@ -70,8 +70,7 @@ TEST(requeue_single)
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	if (pthread_create(&waiter[0], NULL, waiterfn, &tid))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, &tid));
 
 	pthread_barrier_wait(&barrier);
 	pthread_barrier_destroy(&barrier);
@@ -82,22 +81,8 @@ TEST(requeue_single)
 			break;
 	}
 
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
@@ -106,7 +91,7 @@ TEST(requeue_multiple)
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
 	atomic_int tids[10] = {0};
-	int res, i, state, retry = 0;
+	int i, state, retry = 0;
 
 	f1 = &_f1;
 
@@ -117,8 +102,7 @@ TEST(requeue_multiple)
 	for (i = 0; i < 10; i++) {
 		pthread_barrier_init(&barrier, NULL, 2);
 
-		if (pthread_create(&waiter[i], NULL, waiterfn, &tids[i]))
-			ksft_exit_fail_msg("pthread_create failed\n");
+		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, &tids[i]));
 
 		pthread_barrier_wait(&barrier);
 		pthread_barrier_destroy(&barrier);
@@ -132,23 +116,8 @@ TEST(requeue_multiple)
 		}
 	}
 
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

