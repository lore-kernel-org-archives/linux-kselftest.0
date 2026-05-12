Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A0477E58
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570029; cv=none; b=BrRVqU4zTWAiaFl5Ii2T5gIdHKJ9X9uTm3uCW4oQCv3ecLsINPrZ/ayXbhCDe5FmBcZg816WFRap5r7VW5qVhGqqNuh+QLfY1grM68zmQbXtw+xKaytwIy5DJmAa8R7syXGdUS6pJX+M6lh/B8NvEEWLgh97MLPp3TyOSSGM0jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570029; c=relaxed/simple;
	bh=yG/evL3KBASYyxGp0i0hfqBAGi35HSoPB+hrGAJ0s70=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=mf5BfJAFQ3nDr8x9BpTgO0zPc196gY31E5B1cKU0WpsykXrOcGQJHuVPYvU84BUTU40J86jv/zCs14/p2Z8fPigCoFYnvGJvcmBlZDWI7DWXaXXateVbcVbJCrRF4eD9/+yawyMXWWCAnC9gWfxAaopfbA3Vi/R/kfaS4qH13ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=v6MXIQp3; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="v6MXIQp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778570016;
	bh=RkxmsoOndnS552AiB2EhazGuZqNKHe7IJF8baLR4uzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=v6MXIQp3/z5mQ2g3PlRlFlgnXckU1Z2BsBa+1nsmAtElIJOfKuWwKf57A679lWbg6
	 huUQ6ShvGxSgSITxFxn6py+hVKQJ/WspPCHIDUGYCBL4nyEdtyUdh7XuDgRTNaSUlc
	 x9KOsfnzO7BPXOHJYhXug7jO8btjFvJ4mTgM4RvI=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 360A6464; Tue, 12 May 2026 15:13:32 +0800
X-QQ-mid: xmsmtpt1778570012tcbxgdpn1
Message-ID: <tencent_95DCB5ECFC2D2FF34BA52BA9688ABB645C05@qq.com>
X-QQ-XMAILINFO: OHRxy+6QobHQHDTMR6y4sCsl8CO6APMk5qlwBdTtmmRu52MUoUZ7MNcuMmt0Lp
	 jyL7Qxs+r2DIIRR7TowFOy3lDfZ6iosehMGvvotY+2L8GgrTrL2tLgl0SYP+4XFqPKy6MaJGpYBr
	 Pm2eJMXHERpiepbrO13RZTERmYkKxTOUGeGG9PMc+opt7oduP/eDAiVAP3PQsEsn6PNj6ak4lRzT
	 DG315OGAQriCFaXdGCEntvyJ2qzz9818dy5C41G5Bn1+nqHbiTWT+BPGGpwNUf6s0RZol84U/XJO
	 KECLEYhKurJNGMSZ2yfeN0IiCMx2R9fjU5uYBqtjTRVnBPtcW6S5lUJzyQoROEts6i/Xp7exrqzy
	 KBgzGonj1Yv96vFbjCSFxIAx+/g2wN04A6Hp7wA0nT2RNbTiLCUQ+RjNj140G2WOeb7Dy7vhSDTD
	 543gsHE2KnOFv2ODfgWvDUAfWKuYJUBTSrKiCVOY2GkswMbVNIK9Snk/Z/8jNtN56TgSBVcOKz4y
	 z431AQX8IjXSvPoFZWmlQ4NjdFfsLspVKFKMNUXWWqCgPkh1kqQLHBe4aglAkVSVmpNr5/wkbBIk
	 +Apaw6kr7waBhDmFDKQf2UjRj1g6E/aUrlYim96wYtopRQdi49XfetM1pdeGX2tRTaBnjFgA5uqo
	 oq0NAyAezIEh1wt43uR7ZOUElH8szQZimlJY3YsGE5ZeC6VDN+UvQwf21PvqWivGDBQL6LEyX+oq
	 UteiLwgyRTF7A5KvKwnmU53yjMQNA3taogRLRQxZr0FjD/cCQY4MSJPsoz5oK8bBpWGl+RRL5Gan
	 l6n74h7jP7T7XRl+BBrJvxLM6e4ardNXery747St6s0kQXyiaGxH+ixkAEMA1Nt+J6uwk1+9SaFz
	 gzmIR9dsguloXsYbXiGg78RJUuIkdXxANf1MaELNynPVyLR5FHXPSq3DUWriwCD2r+3/oqdHMI9L
	 u1um5XEY2/wjEy7YHKrAic1S9IRF1R+Agx1PADKj//n5bIrVZodGGH26h/zI5Kekgi8ellfwIA+z
	 TMJYN25L6QHSsTyTPGb+4OdT3itdfUpxW76xqwX2wmH2Zx1nFvZ9GWyCAGwBKNgxqXZFyHoUgKmm
	 ccegI0AG8bUJiG4u/QK0Z7oRNEElM3WfG1xf0lSxkl/T44VzALDvTmrUauNK+74yHEPhcpS+BHCw
	 aIi+oYQZQ3rpK5qs+fGlLaAu75qQ9URASfIfU=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
Subject: [PATCH v7 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Tue, 12 May 2026 15:13:31 +0800
X-OQ-MSGID: <20260512071331.3106030-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_0C775F885D7D4560DC59E359AE7DE74C7908@qq.com>
References: <tencent_0C775F885D7D4560DC59E359AE7DE74C7908@qq.com>
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
v6->v7:
    1. Unified error checking to `if (ret < 0)` in both requeue_single
       and requeue_multiple test cases.
    2. Added comment explaining the break logic in requeue_multiple when
       /proc is not available.

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
+#define FUTEX_WAIT_TIMEOUT_SECS 1
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

