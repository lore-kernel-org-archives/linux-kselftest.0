Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB573F4DEF;
	Wed,  8 Jul 2026 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498103; cv=none; b=GwURmjxm37zhXNHWJLBJvAvCqVHOFN5lV+n5fe7NNhuUsGX9JeEo69Ldxd+lLBVHwKxBCFt3cqCsHDLiQIuZpWOIOS9GU0V3RLA/LuvKEz618Jg7r1O+Ds+OH9pgvx1YJ8PEIsTA5Wj/JyYCFCtAABzt5zF2947Dxe3PCITli1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498103; c=relaxed/simple;
	bh=kVJ+n25NCF48jwWLHGOXf+HOLaVba97+bUM7oARLDPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KWqPM+cU1TXou4PEa67wrd9wjkuYEiVD4BoPyvlgrj3S4weeEjUopRzJlwZdGDYxhJp20+g7SOktRz04FROtT5eBRhsS9lQjgkjnxekhtmC/ShmpKdtHUfyj78U2RFBtTrkNp8ma1oPP3vRyoK1z2UGTAeuChp06PbsEG5fHj20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg6S4CyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg6S4CyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333051F000E9;
	Wed,  8 Jul 2026 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498100;
	bh=0pb9KLB2OAk2PZbvib9drysuZTQE7wK4Q4yrxrPVL9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Pg6S4CyVfynRqytxPdCtLwxFBJbwYK78aABttlDawzwmd8M2SKmBOT+dmic9gIvqV
	 WiSyegcsNWmN/cSx24NsqvFOOQ/p2vqN4UY5j+T2Z+7pFU+mjhIOezSuqCu4FIm/+d
	 ZyVqZ4zWE7v+fsyaY2KP2Me3IBcBbgQeEGgu7DarP4BJ69KxZsjGcsag/BI+e5MXzE
	 ugdNxOLJ9TzQJ+e0LwyWb1dv+2WTiL+rFNjKaRydYUYdav8ZOybKIuIW6gV8J3DVp5
	 5sAjd5EsIeoB0Zg/2pDh1664L2Oonfn4O3A/LvlkbBYhCE4yAO/H0pjgjjTpZjFT0E
	 nL2sXL4pQeVgQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
 bigeasy@linutronix.de, broonie@kernel.org, colin.i.king@gmail.com,
 dave@stgolabs.net, dvhart@infradead.org, edliaw@google.com,
 justinstitt@google.com, kernel-team@android.com, licayy@foxmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 luto@mit.edu, mark.rutland@arm.com, mingo@redhat.com, morbo@google.com,
 nathan@kernel.org, ndesaulniers@google.com, peterz@infradead.org,
 shuah@kernel.org, usama.anjum@collabora.com, wakel@google.com,
 ywen.chen@foxmail.com
Subject: Re: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue
 test issue
In-Reply-To: <tencent_9C5F035DDB450CDC0CE3ACAE39E75E796908@qq.com>
References: <87cxwys7fi.ffs@fw13>
 <tencent_9C5F035DDB450CDC0CE3ACAE39E75E796908@qq.com>
Date: Wed, 08 Jul 2026 10:08:17 +0200
Message-ID: <87a4s1sy32.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 08 2026 at 09:54, Yuwen Chen wrote:
> On Wed, 08 Jul 2026 01:31:45 +0200, Thomas Gleixner wrote:
>
>> Do you have /proc/ disabled by chance or is it not accessible for the
>> test case?
> ...
>> Seems to correlate with the test case failure: Connection timed out :)
>
> I used the following patch to simulate the situation where the proc file
> system is not mounted on the system. The log is very similar to that of
> the current problem.
>
> --- a/tools/testing/selftests/futex/include/futex_thread.h
> +++ b/tools/testing/selftests/futex/include/futex_thread.h
> @@ -62,7 +62,8 @@ static inline int futex_wait_for_thread(struct futex_thread *t, struct __test_me
>         int res;
>  
>         snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
> -       fp = fopen(fname, "r");
> +       errno = ENOENT;
> +       fp = NULL;
>         if (!fp) {
>                 /* If /proc/... is not available, sleep */
>                 if (errno != ENOENT)

Sure. But that's _NOT_ the problem. /proc/ is accessible and my tired
brain asked the wrong question yesterday. Why?

Do you see any of those messages in the log Mark provided?

>   # ../include/futex_thread.h:71:requeue_single:/proc/$PID/wchan not accessible, continue with sleep()

Obviously not.

So /proc/.../wchan _IS_ accessible, but futex does not show up there,
which makes the loop wait for the full timeout. That in turn causes the
waiter to time out because that timeout is the same and in the multi
waiter case it's even worse.

So the real question is what is read from wchan on that machine.

> I suggested adding a parameter for the waiting time to the
> futex_wait_for_thread function.  In this way, when the proc file
> system is not mounted on the system, the old solution can still be
> used.

That does not solve anything and that can be made to work in the helper
code without magic parameters. Both issues have the same root cause and
no, we are not papering over it with some magic parameters.

Mark, can you give the below a spin?

That survives when I make the strncmp fail by changing the compare
string to "futil" :) It's slow and noisy, but works.

Can you please provide the output of that run?

Thanks,

        tglx
---
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -13,16 +13,23 @@
 #include "futex_thread.h"
 #include "kselftest_harness.h"
 
-#define FUTEX_WAIT_TIMEOUT_SECS			2
+struct waiter_args {
+	struct __test_metadata	*_metadata;
+	unsigned int		n_threads;
+};
 
 volatile futex_t *f1;
 
 static int waiterfn(void *arg)
 {
-	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
-	struct timespec to = { .tv_sec = FUTEX_WAIT_TIMEOUT_SECS };
+	struct __test_metadata *_metadata;
+	struct waiter_args *wargs = arg;
+	struct timespec to = { };
 	int res;
 
+	_metadata = wargs->_metadata;
+	to.tv_sec = (wargs->n_threads + 1) * WAIT_FOR_THREAD_SECS;
+
 	res = futex_wait(f1, *f1, &to, 0);
 	if (res) {
 		EXPECT_EQ(res, 0)
@@ -34,6 +41,7 @@ static int waiterfn(void *arg)
 
 TEST(requeue_single)
 {
+	struct waiter_args wargs = { ._metadata = _metadata, .n_threads = 1 };
 	struct futex_thread waiter;
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
@@ -43,7 +51,7 @@ TEST(requeue_single)
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	ASSERT_EQ(futex_thread_create(&waiter, waiterfn, _metadata), 0)
+	ASSERT_EQ(futex_thread_create(&waiter, waiterfn, &wargs), 0)
 		TH_LOG("pthread_create failed");
 
 	ASSERT_EQ(futex_wait_for_thread(&waiter, _metadata), 0)
@@ -57,6 +65,7 @@ TEST(requeue_single)
 
 TEST(requeue_multiple)
 {
+	struct waiter_args wargs = { ._metadata = _metadata, .n_threads = 10 };
 	struct futex_thread waiter[10];
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
@@ -68,7 +77,7 @@ TEST(requeue_multiple)
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
 	for (int i = 0; i < 10; i++) {
-		ASSERT_EQ(futex_thread_create(&waiter[i], waiterfn, _metadata), 0)
+		ASSERT_EQ(futex_thread_create(&waiter[i], waiterfn, &wargs), 0)
 			TH_LOG("pthread_create failed for waiter %d", i);
 	}
 
--- a/tools/testing/selftests/futex/include/futex_thread.h
+++ b/tools/testing/selftests/futex/include/futex_thread.h
@@ -11,7 +11,7 @@
 #include "kselftest_harness.h"
 
 #define USEC_PER_SEC		1000000L
-#define WAIT_FOR_THREAD_SECS	2
+#define WAIT_FOR_THREAD_SECS	1
 #define WAIT_FOR_THREAD_USECS	(WAIT_FOR_THREAD_SECS * USEC_PER_SEC)
 #define WAIT_THREAD_RETRIES	100
 
@@ -24,7 +24,7 @@ struct futex_thread {
 	int			retval;
 };
 
-static inline int __wait_for_thread(FILE *fp)
+static inline int __wait_for_thread(FILE *fp, struct __test_metadata *_metadata)
 {
 	unsigned int sleep_time_us = WAIT_FOR_THREAD_USECS / WAIT_THREAD_RETRIES;
 	char buf[80] = "";
@@ -37,7 +37,9 @@ static inline int __wait_for_thread(FILE
 		usleep(sleep_time_us);
 		rewind(fp);
 	}
-	return ETIMEDOUT;
+
+	TH_LOG("/proc/$PID/wchan contains \"%s\". Trying to continue.", buf);
+	return 0;
 }
 
 static void *__futex_thread_fn(void *arg)
@@ -72,7 +74,7 @@ static inline int futex_wait_for_thread(
 		return 0;
 	}
 
-	res = __wait_for_thread(fp);
+	res = __wait_for_thread(fp, _metadata);
 	fclose(fp);
 	return res;
 }
