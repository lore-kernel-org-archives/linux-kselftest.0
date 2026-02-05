Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06F3EBF08
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 02:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257359; cv=none; b=oPS2Tlau9v1qj4a+Zz2AtGIUPmxGdIytqx+Y99gQ5KG3djvpz38WLGHF25bxZZGRVgEvi2f6S3zOApnjd3EAWNCx7c008q1DDl2izfI/bwcyOd3lpOk+SijvGp1kK2inlJVlQGo6Bhqv+A2F5OTSLoYYWKYCcUn68QYS9RgcC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257359; c=relaxed/simple;
	bh=fb1Mbx3SLPWmpDgD6i6KbhFAiwzWQNILbfhBnUNff90=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h78NgTfcObNnnTHPSO0AeyvizNVnOvUfs2Wevp7khZvt0/5lHnpDngSaGCIASkdMkNzoNWL06cfz3JghO5knBIW7VhPrz3NEtg8Dv+ptSUX5WNLkfBlHc7ywcbZHnTGZgSyHqw+zC6TNkaf2DYvHy8XSufZ3ohKqDsBQm2RiJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=T7m7TzKO; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="T7m7TzKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1770257350;
	bh=26sGN0d1XMLgaCDx05Ku0bo80dezRV707jZTOVforbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T7m7TzKOGJCvQZrpFhhgpBvrQD/dzmTxd/szRdG/+z00pvxpYfWjiAtcKPbnAil4b
	 Vk19ion161wT+pg44xDT517LIeadVI6+OrE05ha/mYayJARZzHgC4CMVwbKyHdxkkt
	 oiBRDjZnKX0t4HpkMDn5KYUgWPax7do4NTvaQ+8o=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.72])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 24632678; Thu, 05 Feb 2026 10:09:06 +0800
X-QQ-mid: xmsmtpt1770257346t1bpuweii
Message-ID: <tencent_7F45D13FB7CF789CEBCCF945DEF897481706@qq.com>
X-QQ-XMAILINFO: Mpk1SqVBRfAQML2wpvmLvUraBsoY4MnzIVVpiwLTpMDVVbkL6t6bDNWckq5KDO
	 7aX7itmdhfzLpO8RPqOTZgcEhcO7BfFX3TgHIqrcD3Dy2DWqNOM1W15VhymgbsC7ETTVOVGqRFZU
	 yrmeUbBbGqxIjw9iuY2OR1mAQvJ8bRBhVIgKkGFxs5P8ncBtG6mtTQQsH8vZLo50ckcqiKN1rAmq
	 Mi+RgALQgHhO9k85pSuVT3M/WjFS0lF3feMTZPQxtgHuK7AfH7uUPx8J7kfHPcCCqxfDfHkzIIXM
	 Z6qIQnnwqu+qjh9bbabmEpAWEvDinyt8FwFs4eM9MNU+83ej0ECxihV5RjIofjei+DP4sRKgEPlS
	 Ybs8yh1wNODmHuRko58KKwrXkskgM/8BdScomnZnzokXgTNz0QMvvkdPukrMF7TZj3lgZ77EZEvH
	 dWpHi1pwzkVMx3eHp+N56SKFvhLh8gDNgcJ9OdNR6DZylVzNqXbgLe361OTgIcOCUCgCh8KIl8/W
	 yv+gyh3glxkwSDMEaY31NEGRVfAB5i+OetgpIlWBRBq3t7T8tsyL62oyah3iIr/PSI49YnJDqZ03
	 VFOuSrAo2dckE3Hmujl/rb+7h6kSiw4JfaZ/j59WY3T1uK3yE6ueXf94/JEj6u95+Zuv1jORU2LZ
	 PyjHfKUOk/WIRzuLEIgp9Fk0i1b4watxRLI+sIWxV68HnhOkD+SLJsc33oDTsEaYrHqrn2Bo+677
	 at9p6F2s8OblpwMW68p8qemm5+P6LF1zcDlRfV7ky9h9oHhPa7fkF1XsM7Ic5qdDno4znwLOiEAV
	 cGavGwaqQzyZ0PHgUQWZJH1f8Tsi4045DjNKBZzxGWBAvarKKYwmA+V2EiKBckOmZa9ZvSbUH7cS
	 yO0ppRKoXONCUodteHvjwYlrAySkQx8Vbh3YJCVuPQpSEpRCgjbdtMmMTwJ1Heri3wYbDuoBJ2H3
	 /IbxE3RgOUv+RDQl/mqSHnM5BLmmi1l6xcUu6NZ0cfXxp+rS3crypecWvIOTCCstPbvr7zhmD7qA
	 efMqf3wWNSKlXFPJTl9ux0PLTOaS9apOSQFpYjIgYsdpBr0v9OAcFowexVsxXJILJsmrtwfH1Ggv
	 Ezz+ebQLQ0WWyJBRCPgiAJAYFqJs483myvdtfiugXGvptkqnW9Xw4t9T6+SgDKuR1hl0xDFAoNd/
	 jCmm21t+MnkQTfeOL3lgLgCZpg5Jr3W7UlAA/dDOHsPt6X7eBPIFxXib9OpDxhnGK08qgrg4voB6
	 3i4g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: ywen.chen@foxmail.com
Cc: akpm@linux-foundation.org,
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
	tglx@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com
Subject: [PATCH v5 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Thu,  5 Feb 2026 10:09:05 +0800
X-OQ-MSGID: <20260205020905.72951-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
References: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
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

