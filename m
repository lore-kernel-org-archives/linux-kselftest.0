Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846DF2E285C
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 02:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070623; cv=none; b=TU+dQ4k/tdhBWiSbyYA6mFSgkAbE8nvqwwXXmebq+9mXCySUAAmbL7YZPONorj7QVrzTu8GCV1/ZK9e/qwlzdyWU5gS664GY8EXuvc5ZDo0gRFFgV1Xf0RoQks/begjU1iGzgGS/CVod++3XsUx2sD7+o8GPeBPra4z5KacAJBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070623; c=relaxed/simple;
	bh=kiimDOy8K1RcrH9fCFwQSpDdZgdjEdQlY9HTMWH0EE0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=LPQcp9Vt+LC+2ast/AGu12EgRyz0f0GVygOcwPjK5JhPRDYueJYcv1UJnCiM3fJFuat1wMTcokZh+mOXhvjWqjxpXMF5WgfWqcyGkVwJFKFx7+Ps8akAqisSVIr02SzM26aKdnVShWu+H5EZ6tEiL7G5trInyaY3QqR+D+03V3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=fHTzMcGX; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="fHTzMcGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779070619;
	bh=tqOhEFF8B+3EbZ5NKyKKRj1/WAHZTcK7PwtfwJZfUmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fHTzMcGXwTvzvTOsa5C4ZT709/CklbCInBeUQ7zh2QJauCmjOJXGx71gmexD+iWoO
	 sEXobsMwmSORaIpXrrMbzB9R/tRKmZ3yuFjJB0lYcW6VaBkjeNZJQ4X0Xq2Pygg+tC
	 yL2jqUuDvs0E4Lp/0iaB3fD9UNzebHPnxhiR9QDE=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.153])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 43793282; Mon, 18 May 2026 10:16:55 +0800
X-QQ-mid: xmsmtpt1779070615tezs8qgj0
Message-ID: <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
X-QQ-XMAILINFO: NiqzJuKCE4mBboAVIOjc0NuyQBpJURSEaxMyRgKdQlDgCkQjlabBkEdDf22Cut
	 tWoxO9G4tBjU8I/PAFRsQ1DawSMIKiBaA1FC9FBkXbFrgQ5hkP8dP1i7GoU1og9cW/nNeJ0NasGi
	 gytuMNkMEwx7GVIowVOA3MHzIWcUVC0g+QRtqtsLKp0KmT1NmghnR/CEdBOEElWOvdaj9NvAaPMd
	 dujnIxbfjfbieUhF5BHkt82H0VGcuyQlt0xpUpojLoaX5Q3G+LjL3JtKG/o/JVAWObMhaUtrGdMq
	 uBdoNh2E+0ksyLIQLSzska1jKS3I+WbdMIlB3CK9Ec/DyBVGpVSpo4km8ZCm3at1fmolX2jgBIfL
	 AZODqhZJIFYsyXrvpoSCh1hENSDT21ITXevsvxjBNLG4llALmNKj8gTbDBqelEPrbzL0crHL+IxE
	 v+cHdMWE0Lh3qY0i1aDyRXEYuQPosIabZqaWEC72R0QoxbzKe7wLqQFUL3xCrfzCtr11xz9L2Zfy
	 jiddlzjQKpF2tYteCpBIKeKoF3rFfKoygZSi93QKiubpx45HVlvrOzlcchCdMHscZjRj9zfvTFZ3
	 xB3TQOYtmTIUr2V1/7+pEDmCNa3uWhcelBW0/Rgze7Ics6cF3wVXFrvr0fOD+x84XhWTLkmOqYKw
	 Wz4YisN8upTsV8SxCGuI8V+ompP+CNSRjCrsdr8DCQpfxCzAT4zYaJW8vAji4raw82Yngm61Iv63
	 8ps86t+mOLA+jdkS9TeAm62zDuc7qqMruAZo0e28k4RZCuVvTCPQS0gWQUACOzuqQ7N+SmR5Tpc5
	 H+kN+OTRJWEIlT3VNTFvHxzb2wtM+j/sdq7WzzgRdstWcEXaVJWOvTSjYrKaf0IHhOX6gnOgCpnx
	 xYKEs7CCFHSCFEFTWJ2fHlFsC8/mQSfbakBWw+jV+Rh2CS7754HQ+vqAOpK5AgK9WM4MpCTd4Q3A
	 GFwo1LXpzarfafmnvk6WoVkUy4B03zdiWQntc7R+tp/xTWDmW0treHtGbY2TN0H7d40Ug3GIUe9e
	 OAHkjR1gm11AesuU2mpEeDdGT1HZazMfRRWeGPKny99dgLTcm0Sx39dSWXe4NxUxuKhnJFY+R8B/
	 sCJhp9DYI6V8Rn4QXPEohzAP4LHP55KPe+WDeJlNtWJOvv1IcZwlQM2JgD0VBPKpdibUCl72uzfC
	 7Gqs8=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Subject: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Mon, 18 May 2026 10:16:54 +0800
X-OQ-MSGID: <20260518021654.283747-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
References: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test item has extremely high requirements for timing and can only
pass the test under specific conditions. The following situations will
lead to test failure:

    MainThread                  Thread1
        |
  pthread_create--------------------
        |                          |
 futex_cmp_requeue                 |
        |                     futex_wait
        |                          |

If the child thread is not waiting in the futex_wait function when the
main thread reaches the futex_cmp_requeue function, the test will fail.

An attempt is made to avoid this problem by checking whether the child
thread is in a sleeping state in the main thread.

Fixes: 7cb5dd8e2c8c ("selftests: futex: Add futex compare requeue test")
Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
Co-developed-by: Edward Liaw <edliaw@google.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
v7->v8:
    1. Increase FUTEX_WAIT_TIMEOUT_SECS to 2 seconds to avoid timeouts.

 .../futex/functional/futex_requeue.c          | 46 +++++++++++++------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f3122..5c849ccf16e26 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -9,51 +9,59 @@
 #include <limits.h>
 
 #include "futextest.h"
+#include "futex_thread.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define FUTEX_WAIT_TIMEOUT_SECS 2
+#define WAIT_THREAD_CREATE_TIMEOUT_USECS (USEC_PER_SEC / 2) /* 500ms */
 
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
+	int ret;
 
 	f1 = &_f1;
 
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
+	ASSERT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
 
-	usleep(WAKE_WAIT_US);
+	ret = futex_wait_for_thread(&waiter, WAIT_THREAD_CREATE_TIMEOUT_USECS);
+	if (ret < 0)
+		usleep(WAIT_THREAD_CREATE_TIMEOUT_USECS);
 
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
+	int i, ret;
 
 	f1 = &_f1;
 
@@ -62,12 +70,22 @@ TEST(requeue_multiple)
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
 	for (i = 0; i < 10; i++)
-		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
+		ASSERT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
 
-	usleep(WAKE_WAIT_US);
+	for (i = 0; i < 10; i++) {
+		ret = futex_wait_for_thread(&waiter[i], WAIT_THREAD_CREATE_TIMEOUT_USECS / 10);
+		if (ret < 0) {
+			/* /proc not available, give all threads time to enter futex wait */
+			usleep(WAIT_THREAD_CREATE_TIMEOUT_USECS);
+			break;
+		}
+	}
 
 	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
 	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
+
+	for (i = 0; i < 10; i++)
+		EXPECT_EQ(0, futex_thread_destroy(&waiter[i]));
 }
 
 TEST_HARNESS_MAIN
-- 
2.34.1

