Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95BC308F15
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285130; cv=none; b=pyLg27qO8a09pQGG8F4YnJOabf2vppToekXYjQMQQo9XDbrSUHX/bwkLbKSUFC1n6PEDhoaDOZsMJvIXQkm9o0Sr9i12etkS6PVaOEE2zhMYA9y5CWAGLXLaFW/qiSO4ibpETaw8NNdpPTAq7mqsB5Rco4rtTIfgwqUWaqCBYcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285130; c=relaxed/simple;
	bh=cc/4MvYQW3AVaMospqyppf/6T8Bhygb2pcx1Oiu99M8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqOFA7dMaP5DRx3yWii7xClmWr2ipfjdNoaZ1ZH8PirEtEtAjo6TtpMgbmMnewjdxW+mH/94CxDsXxneY1WlbxccDQDgLSwpOn+u1n3PIYHhsVkSfLYaT/oipG6W5+fse8mEhmCZjOR8yY5xAVam0LZ7p0YCFCPNHbvzkEnBn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=pZcvo3T6; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="pZcvo3T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1777285124;
	bh=UsOMW+fH/0u09b+I9Maxdl9lX3AzM+KsG85N0ClPTyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pZcvo3T6Fbzvp+UlGB0+eL6wpU0c9bmhNedpufY/Fi9biN3D2VzjG5VOCnT0/PrEu
	 M1EOUrcAnh0xBnqkU8o7oSxJE79ocZ0RQJ4h1da7bzeVkPI1a9gpqAkBZRZpCSUcmB
	 snBm2uLpY+PjoswI+IXezvw+QwO8+Q+3uFxYnLDM=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 4A81303A; Mon, 27 Apr 2026 18:18:40 +0800
X-QQ-mid: xmsmtpt1777285120tq8qj7slw
Message-ID: <tencent_1BF14BBF2BBF088E3B609CC155EC7C206F05@qq.com>
X-QQ-XMAILINFO: N0ehcrCy+mvqaQj/ppl+i0tUwHHKEm8/S6RHjwYjisPPPOfWNOT0DDCP7uZwbr
	 ROVsAGuKLhdkXLEH0goU0TrwNbNCFX9qs4FWucBov0xXMUUA2aJ0UvrBsnROoM5t1NiZBFw/ZQmz
	 teD+lpcP8lrmOY9jplBuJwmdhw8Be0q2Btz1+Y/0HUHBH6EHh54s8oEZsZMMypNof1mXw3dG7lVQ
	 KXlbh4bw90KZLn7VrGUW7RSYssxwllG/vwdJAapcPOP1zEgLLuvSQTKhIeORrOWvp2AXUki5XMDp
	 RgIqBjIMBjRBOayr8kxZGN8hQkl2/q1VFXFTHAnNWVC/zWQ54UgeFt2dbxVI2vZDMKQghXz8s+v0
	 B8vy5gtZh9ji8VIC5nsPZ/7Ajv4JFswPn7hA2N65Y7zpmjMby3CugHsWB9kB3lUIUm7ZDhOV9Xls
	 eDCkelo6Xwo8h3eUGWSl6HN50WpaxmiYRzZ5o4w4xAlw8Z5w82zXGkPo3GSyo6ThEslV5q8/mhj/
	 3ZuJDHsHmLJTM7j6ZGa+xfNXkeHHnXnztvo+Oyb3fmxJgQiDrZDZnKBJUKZXhWaBgZ9Shle7Dh0y
	 mOW5aO068F64PfG43YoBNA8vIUVKWFKRe0jlAHK5sfBnUi+Um2oCrfirUSbriU5vtSCMx7061B+5
	 wmAYKL9SyGHZV3/zY64nR7TMBKaF7ljL00Axsq3x0W+L3UE41VODPRxC/Yzzd1pRcw5mjB+nuauf
	 j4JN7JMginP3Ds6NDwJ61RQcXlwavid9e6Wnc+upXBydR8cnKH5mo4ONDIcg8Kv3Qu4rsiVo0QlD
	 Vz7Aa7UEOcJ6SzD3ovznKQzKx4wv1FjQhl3Rdnqrf4kQSsSBxnuxocGTIbpbadGIxvN4Of6OeWcL
	 9NrS29HP0IJw6rWWn0KxMwWkDzCnguh1t74/PcGCHLqep2k0JN/rBs7w1x3/4vt7IXASjKA/+AKa
	 SoZy4FoV3jdb6nPEB47psrh9kCETHtwwgalRJ+p17AN7+uXEoXmzadTKlzdxciAq9IjHmaLASTo9
	 LyGmXN3d72iym+0bevdH8NuyRx5Td/P3/dAPyQkMlW5EMWEiKGYcVVwy5pj/Yv7D8dF2u0Sh96eE
	 K/8zfSmFx/CxJLLVcVjZicQWhSlZt570LWGvKU1oA+FOoQ4ht6I4uXA4CQdeG0Uwe20b8Y9zeM9W
	 p07SVrTdwebN5z2Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Subject: [RESEND PATCH v3] selftests/futex: fix the failed futex_requeue test issue
Date: Mon, 27 Apr 2026 18:18:38 +0800
X-OQ-MSGID: <20260427101838.3276525-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com>
References: <tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com>
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
v1->v2:
    1. Fix the issue of abnormal use of fscanf in the get_thread_state function
    2. Add timeout logic

v2->v3: https://lore.kernel.org/all/tencent_B9DBF2ECBE56BAB68BDAB949C6935D01CE09@qq.com/
    1. Use /proc/[pid]/wchan instead of /proc/[pid]/stat to check if a process has entered the sleep state
    2. Refactor part of the logic to facilitate code reuse.

 .../futex/functional/futex_requeue.c          | 91 ++++++++++++++++---
 1 file changed, 77 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f3122..7163e827691e4 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -11,8 +11,9 @@
 #include "futextest.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define FUTEX_WAIT_TIMEOUT_S	3 /* 3s */
+#define WAIT_THREAD_RETRIES	100
+#define WAIT_THREAD_DELAY_US	(10000 * 100) /* 1s */
 
 volatile futex_t *f1;
 
@@ -20,8 +21,8 @@ void *waiterfn(void *arg)
 {
 	struct timespec to;
 
-	to.tv_sec = 0;
-	to.tv_nsec = timeout_ns;
+	to.tv_sec = FUTEX_WAIT_TIMEOUT_S;
+	to.tv_nsec = 0;
 
 	if (futex_wait(f1, *f1, &to, 0))
 		printf("waiter failed errno %d\n", errno);
@@ -29,20 +30,83 @@ void *waiterfn(void *arg)
 	return NULL;
 }
 
+struct futex_thread {
+	pthread_t thread;
+	pthread_barrier_t barrier;
+	pid_t tid;
+	void *(*threadfn)(void *);
+	void *arg;
+};
+
+static int wait_for_thread(FILE *fp, int timeout_us)
+{
+	char buf[80] = "";
+
+	for (int i = 0; i < WAIT_THREAD_RETRIES; i++) {
+		if (!fgets(buf, sizeof(buf), fp))
+			return -EIO;
+		if (!strncmp(buf, "futex", 5))
+			return 0;
+		usleep(timeout_us / WAIT_THREAD_RETRIES);
+		rewind(fp);
+	}
+	return -ETIMEDOUT;
+}
+
+int futex_wait_for_thread(struct futex_thread *t, int timeout_us)
+{
+	char fname[80];
+	FILE *fp;
+	int res;
+
+	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
+	fp = fopen(fname, "r");
+	if (!fp)
+		return -EIO;
+	res = wait_for_thread(fp, timeout_us);
+	fclose(fp);
+	return res;
+}
+
+static void *futex_thread_fn(void *arg)
+{
+	struct futex_thread *t = arg;
+
+	t->tid = gettid();
+	pthread_barrier_wait(&t->barrier);
+	return t->threadfn(t->arg);
+}
+
+int futex_thread_create(struct futex_thread *t, void *(*threadfn)(void *), void *arg)
+{
+	int ret;
+
+	pthread_barrier_init(&t->barrier, NULL, 2);
+	t->tid = 0;
+	t->threadfn = threadfn;
+	t->arg = arg;
+
+	ret = pthread_create(&t->thread, NULL, futex_thread_fn, t);
+	if (ret)
+		return ret;
+
+	pthread_barrier_wait(&t->barrier);
+	return 0;
+}
+
 TEST(requeue_single)
 {
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
-	pthread_t waiter[10];
+	struct futex_thread waiter;
 
 	f1 = &_f1;
 
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
-
-	usleep(WAKE_WAIT_US);
+	EXPECT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
+	futex_wait_for_thread(&waiter, WAIT_THREAD_DELAY_US);
 
 	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
 	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
@@ -52,8 +116,7 @@ TEST(requeue_multiple)
 {
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
-	pthread_t waiter[10];
-	int i;
+	struct futex_thread waiter[10];
 
 	f1 = &_f1;
 
@@ -61,10 +124,10 @@ TEST(requeue_multiple)
 	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
-	for (i = 0; i < 10; i++)
-		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
-
-	usleep(WAKE_WAIT_US);
+	for (int i = 0; i < 10; i++) {
+		EXPECT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
+		futex_wait_for_thread(&waiter[i], WAIT_THREAD_DELAY_US / 10);
+	}
 
 	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
 	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
-- 
2.34.1

