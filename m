Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB2380FF9
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296696; cv=none; b=W2fcGx/5BRZe3bfMLWdKVWpq+hQggxqig0rQ5tTvo2ZVJ5dgdCQDEem9BZH0I/8ZFrT+GFy41dzK+z83QPd1hZvkw1jvR/WEOl4ZskUOBYjGjHXd8MGdnqcYrLXRFbwNxlU3VRhpaBsYcxj243zrgU53ofHihJkivizeaaJvcbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296696; c=relaxed/simple;
	bh=x4rgUp/mVj2pfDU22FtK1/2AR5Xxc0PQDdzblyHnxfQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iNM9CS+KJCKUOwe75vFad+l+g4Ym8c8hkVdiugSfZIdYivcunTqIduTebmLe+gztvxhMm2y9ifJwUpM3xXiIgxfoUcmKQg3tf7YHeW00n8o5uCMMZsIe+J9lTbbhfgUwS6sclXldIGEpVSOjMdGL78rUFdXwIKgduwSGVYwxQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KF6xLgFI; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KF6xLgFI"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84240683a82so832389b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296692; x=1780901492; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6zWjUuiyTvzBfVRhWN5pZV2dCQqAFVFeSqiFeph+2d4=;
        b=KF6xLgFIT5NOzLeG+ishKxhQXtqU+A3y7f12BS+U20SAgA7Zw7lSrFYcBEksvOUodD
         M2vgAOvJIC8dRAd2Hwetq3iQ5gKh21u+jS+MKDGhZm9R/ipIPmKNwciKwkRzTX+L8L5N
         bH84nE+R0t/LTsd7kdcPWFkWWoS8l/AZX8v2ZNRy92VeRmLTd7MZd0vxxazPoG/j2zFQ
         6FMCPboNabFdvT1C/KRYHydnM8z2FtAOJv3FkdiicdPPF5y7Nh1+leZlglxEuBluy53P
         eCbXRHBb9bd4JD+f9ilG7awNAVgMhDbFA1RZTEyRngGkIElFPjlNy6xncaUFnkHBWhhN
         Y1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296692; x=1780901492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zWjUuiyTvzBfVRhWN5pZV2dCQqAFVFeSqiFeph+2d4=;
        b=aM4HKHsIcl9lvfp7ij707D7A8fjI1V4b2F/HolJOfPdxSBJ4kXhYFBBzRKiibuDM6c
         LEit/26/ZhrlmFJTNWpZlhYtswgHbLGO4AuKnbMy9gM8+0kR9o0mo6RQavOd0CLB83lc
         A5L3RLGAEwV/DfTFyFooC63UW/NAXHWV6Z9YfxYVlaHAJ/1yqFA5JualcbkxRKykiYFY
         228pW8ruRrmnW3aD5anC73tJZN+h96E3QH+uk+GJOK90h0OBw6yjMzoHFC7mRiK+hnbg
         1JpsPzgIKULPb+1h7yC6afFjZgaXqreQp/9PCcRFxRIQEQ1i3+LGOES7vt4llumsgyRm
         cBZw==
X-Forwarded-Encrypted: i=1; AFNElJ+DviTVmNBzpiYl2tLIAO6i8BhttlmcOXB1NVD2p1DoD8THwJ5VUB/KP5drrAIuXeTzRX/Ca5XMbC5XOfQ6bpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YylUEFRn0Yf5FRYKq6F/pnvxOKXj8kY+kRz62T0zQ+nn2is5jHM
	th6P4h4n1MdaeLf/ViY9rPUagcY3LDS2axi1NKaWxJGZcJ3ap9SqmwiOIL/RcAFD/OzWAtiO81V
	OpA==
X-Received: from pfco2.prod.google.com ([2002:a05:6a00:b902:b0:842:492e:19cb])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca8:b0:842:4f2d:c4e6
 with SMTP id d2e1a72fcca58-8424f2dddeemr2371364b3a.9.1780296691790; Sun, 31
 May 2026 23:51:31 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:20 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-2-wakel@google.com>
Subject: [PATCH 1/7] selftests/futex: Migrate futex_requeue to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_requeue test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and ensuring proper thread joining.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex/functional/futex_requeue.c          | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f312..76f0eb6756f8 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -7,6 +7,7 @@
 
 #include <pthread.h>
 #include <limits.h>
+#include <string.h>
 
 #include "futextest.h"
 #include "kselftest_harness.h"
@@ -18,13 +19,18 @@ volatile futex_t *f1;
 
 void *waiterfn(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
 	struct timespec to;
+	int res;
 
 	to.tv_sec = 0;
 	to.tv_nsec = timeout_ns;
 
-	if (futex_wait(f1, *f1, &to, 0))
-		printf("waiter failed errno %d\n", errno);
+	res = futex_wait(f1, *f1, &to, 0);
+	if (res) {
+		EXPECT_EQ(res, 0)
+			TH_LOG("waiter failed errno %d: %s", errno, strerror(errno));
+	}
 
 	return NULL;
 }
@@ -40,12 +46,15 @@ TEST(requeue_single)
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
+	ASSERT_EQ(pthread_create(&waiter[0], NULL, waiterfn, _metadata), 0)
+		TH_LOG("pthread_create failed");
 
 	usleep(WAKE_WAIT_US);
 
-	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
-	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
+	EXPECT_EQ(futex_cmp_requeue(f1, 0, &f2, 0, 1, 0), 1);
+	EXPECT_EQ(futex_wake(&f2, 1, 0), 1);
+
+	pthread_join(waiter[0], NULL);
 }
 
 TEST(requeue_multiple)
@@ -61,13 +70,18 @@ TEST(requeue_multiple)
 	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
-	for (i = 0; i < 10; i++)
-		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
+	for (i = 0; i < 10; i++) {
+		ASSERT_EQ(pthread_create(&waiter[i], NULL, waiterfn, _metadata), 0)
+			TH_LOG("pthread_create failed for waiter %d", i);
+	}
 
 	usleep(WAKE_WAIT_US);
 
-	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
-	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
+	EXPECT_EQ(futex_cmp_requeue(f1, 0, &f2, 3, 7, 0), 10);
+	EXPECT_EQ(futex_wake(&f2, INT_MAX, 0), 7);
+
+	for (i = 0; i < 10; i++)
+		pthread_join(waiter[i], NULL);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.823.g6e5bcc1fc9-goog

