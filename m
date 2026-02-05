Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBAF1C862D;
	Thu,  5 Feb 2026 02:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257604; cv=none; b=DSMQiShOOQn3M0zHBr75IABW6giokCOHixXxfU0ZviwnaF4m8rloY8U+Mt/NF6+4ZKeWnJWmQBkXyhbQjCXJYCHc2CpCwnAEAL1T+d1pso1msiJctzEyhxT1+DErC3k1r+HhFguKH9wFotZOnznXKuP1x8wcqLRvYhe4qdwMXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257604; c=relaxed/simple;
	bh=fb1Mbx3SLPWmpDgD6i6KbhFAiwzWQNILbfhBnUNff90=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=Pj3h/qL+5ALpb1zWLgGxa2KwcrfQNnnjIh/v0tihZUSR1n1m7BD7Mj/uSF7GC5vFuMuA3WWR6MJ2wFdtA56NFl0nnBr4pT1+TnTo0ru553uOjAkAwAWi0V0jZvYJlB1oPdDrg/JlzMeh4x8laKtdGewX3hJE6bKeBDsOHzz3k5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=bUXdd/6Y; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="bUXdd/6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1770257599;
	bh=26sGN0d1XMLgaCDx05Ku0bo80dezRV707jZTOVforbA=;
	h=From:To:Cc:Subject:Date;
	b=bUXdd/6Y1rWh2gdECNxcgEklhKD9iQ4RRYN4mRacoS5yU/UvkkdIvxeDTx/qMboz1
	 SSAO86lGV2FBv88DSwj94mdoRxXowXZfXAV7e4jH8QPm79eaLSJkifx0C3Wm+jOuof
	 a+6rotZNFDilqof5ntVutGZ5rnWSFvkY4QdylyQQ=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 16B336D3; Thu, 05 Feb 2026 10:05:43 +0800
X-QQ-mid: xmsmtpt1770257143ty42dc4hr
Message-ID: <tencent_C274DC06E392AEDCE7D1790D5FEC5D164508@qq.com>
X-QQ-XMAILINFO: NHTNowOA4hJdtPjOzjM70EiQz4J/gr3Z1frgd8ZAtkhMDmyTOWMhV7THAQdVVy
	 dR08k44s0A1CIGihz1yXInyhfcrnKq4tSLX9YIoFsqFjwNqWZZNXC7JZvSJW048cFp5xoArblpiT
	 dmY78XHxaDrVaRx1rOziaiFeOCZH3h2xH00NB3jrJGie8v9rhQ4uU+mfkd+IidpOl+5jKCPg872s
	 ZXMlIa4uJS9tlUdZfLhh9Tj6CmpJh0xVWjNoxXmvz76mwgSRXCFwNOi1Dp+FL/CJpQibfeBWdTaF
	 Z4r2Ygv8n7VXxe2t9RLqE3L5880Avzze9ta5fVHcJWMPDcMWYHttV84G1+7D/yrR4M+FEizPfWtL
	 0MuiZo2Rokl4tlRo2cArDm4MIY3v3MiBSQNUVaMVzdpqAJIQOD2dYRp8C1R1ZQlglZ5LBz5o7nI/
	 hXy/JaecKPuisjz5hfKB2iRIRJmD8EgrW1Fn6XHYaTdwyN6Gg2zvXP2h6F2Vg1FyRqBX0eECNoSI
	 aVdTG/FiE9ZlxYsMO7ZW8tRIloMtd0k+cLuQYqzoCSMoRZviX+i/5Moll0j+uDoBXjhdl22/CqWJ
	 RNSr5I0QPKqGe7tiyYKsaB3pREpexyhznNO9DuLmy0PZMGwYpih0wlUegMeIzbQ/OtPe9lp3/VY0
	 xgoE9gKAFxk5RqQViS7/yrpANb1k5vWS2UuFmLFCWHiaJ19PFK818ZDzSHqs6XomIZ6g0dARnGRZ
	 PN/ttrpCD5aDr0YYesgNo3rtUvGkpKPUQsvqtnikfq4B7VQocQzxL/UgMPuBs69zHnBoBpXXugvW
	 7wbmmY4ZTsxcs4VhXd9G1Q7GAyhRAdMc77EngNASMpJNN8uA0iAUibvfp5jyRRkPzT1E9mdP23c0
	 xBCYUdJ68rxTWRvAN/swC5REann97+k8OcEVBZj5UDcz324cGkv97ROCFSeUEHXUWcr+p/45vvt3
	 qTTaHQdfwPkkIrEDfq9+zL0Hr8smkUBfS1eInfJ1Br0kQKUtgXVRHY0DdfQ5bn0y2Gb8BxlLPH5P
	 HteOVsFMT0qwnAdhCejAB1pAggNaqZ4WIlP2sMYH2n5tr/hw6a7qIyEqDylGbW2Tk9gqkudm/bbw
	 GK9748PxZ/6L4PG+Kw2nAAjoonL8akEfTBoxOsn1H/ROWY1GY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: ywen.chen@foxmail.com,
	akpm@linux-foundation.org,
	andrealmeid@igalia.com,
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
	wakel@google.com
Subject: [PATCH v5 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Thu,  5 Feb 2026 10:05:41 +0800
X-OQ-MSGID: <20260205020541.72861-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This test item has extremely high requirements for timing and can only
pass the test under specific conditions. The following situations will
lead to test failure:

    MainThread                  Thread1
        │
  pthread_create-------------------┐
        │                          │
 futex_cmp_requeue                 │
        │                     futex_wait
        │                          │

If the child thread is not waiting in the futex_wait function when the
main thread reaches the futex_cmp_requeue function, the test will fail.

This patch avoids this problem by checking whether the child thread is
in a sleeping state in the main thread.

Fixes: 7cb5dd8e2c8c ("selftests: futex: Add futex compare requeue test")
Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
Co-developed-by: Edward Liaw <edliaw@google.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../futex/functional/futex_requeue.c          | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f3122..ab87bfc4edae0 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -9,51 +9,53 @@
 #include <limits.h>
 
 #include "futextest.h"
+#include "futex_thread.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define FUTEX_WAIT_TIMEOUT_SECS 3
 
 volatile futex_t *f1;
 
-void *waiterfn(void *arg)
+static int waiterfn(void *arg)
 {
 	struct timespec to;
 
-	to.tv_sec = 0;
-	to.tv_nsec = timeout_ns;
+	to.tv_sec = FUTEX_WAIT_TIMEOUT_SECS;
+	to.tv_nsec = 0;
 
-	if (futex_wait(f1, *f1, &to, 0))
+	if (futex_wait(f1, *f1, &to, 0)) {
 		printf("waiter failed errno %d\n", errno);
+		return -errno;
+	}
 
-	return NULL;
+	return 0;
 }
 
 TEST(requeue_single)
 {
+	struct futex_thread waiter;
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
-	pthread_t waiter[10];
 
 	f1 = &_f1;
 
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
-
-	usleep(WAKE_WAIT_US);
+	ASSERT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
+	futex_wait_for_thread(&waiter);
 
 	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
 	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
+
+	EXPECT_EQ(0, futex_thread_destroy(&waiter));
 }
 
 TEST(requeue_multiple)
 {
+	struct futex_thread waiter[10];
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
-	pthread_t waiter[10];
-	int i;
 
 	f1 = &_f1;
 
@@ -61,13 +63,17 @@ TEST(requeue_multiple)
 	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
-	for (i = 0; i < 10; i++)
-		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
+	for (int i = 0; i < 10; i++)
+		ASSERT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
 
-	usleep(WAKE_WAIT_US);
+	for (int i = 0; i < 10; i++)
+		futex_wait_for_thread(&waiter[i]);
 
 	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
 	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
+
+	for (int i = 0; i < 10; i++)
+		EXPECT_EQ(0, futex_thread_destroy(&waiter[i]));
 }
 
 TEST_HARNESS_MAIN
-- 
2.34.1

