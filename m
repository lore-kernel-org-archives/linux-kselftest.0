Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E771D9346;
	Wed, 28 Jan 2026 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769584590; cv=none; b=WM8dE4M9+LHlra+4FWk4GN2SH07V0EbT2v46JzvmsEdKq3gi27EdYdtBRnmhVJIzEiHxiY9mwFDSLAwje6nk/s4+S7E2grK/c0Cv1BpfIhX0AG7BC6o8+ar9rA3X2t0irXnOLqCxC3py4KzfQbohNm/VEwT1PPvpcCJV+tdbcyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769584590; c=relaxed/simple;
	bh=cc/4MvYQW3AVaMospqyppf/6T8Bhygb2pcx1Oiu99M8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=H8b9ui+Y0xiu9HxjyhQcisoponhNWgvSs5S75uCJQ0dlPjpzuUB7LcAViWwyiUBmucdko+eocavQ4EIH7L/1sGkUSW+iUp1b6zi6MoAUStYPdc+bQoid2yH9+tkrmoifkCWSZ4cL71MdTqZQzrtUvBzXY5ZcEFPlF7NKTXhRJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=X9ce2+1Z; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="X9ce2+1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769584578;
	bh=UsOMW+fH/0u09b+I9Maxdl9lX3AzM+KsG85N0ClPTyc=;
	h=From:To:Cc:Subject:Date;
	b=X9ce2+1ZXsjCEsptq/NrjPwiuDlWAggTlIcijLXL1VMBkgQZnaPiW80aHIptL8h4u
	 /twSVgqW+3WukWxSDxyLlUZJhECLoJi/lK/wzD6raWSJuTHMyrQvysOXTF2nH0sJy8
	 TpoACiT/xvttEJMpygYy4QFFRTZpNlvXc90DCsx0=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 40E82410; Wed, 28 Jan 2026 15:16:14 +0800
X-QQ-mid: xmsmtpt1769584574tpqv0ipnd
Message-ID: <tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com>
X-QQ-XMAILINFO: M9B58rdLYxrLjCqmWwUQoEih+LW97yLf1OdkCA7vnUGLQ+kDRxqiTcgglZJkyD
	 qd0XtXOZaHeRu4Cdwh2BnsBbcKO2j428bCpEPmvc76KUJHHZLvqMRpw+dBxh+JP1YnDC+XTPp+9R
	 pDwm8N/JHvuRZ9CKVapHVHuvlV9+FOr4MYYBvKU5GwVc0B9iXYWyHhbnjTH1XJEoUNRYBL2+evD1
	 0ThthzD8I4aX3pP2C/hR1SrMbyhOmeCav9IClwOz68HUZ8SkAK/7c1eLHp7XJoyjHP1djKjbMJF/
	 wCQ037zaEo904ptmOdiv7INvKKLY95NXNsvHxSJ8P77QP08Kd8fFwAesanCSjCdVX7c6hSOC9AT/
	 bFsi796DGDQ7AuA8Tk5lJoEdT81GFawxSjNzTewgNybfvw+TW5SoerPPMzvQ6faKw8a26pCypPAj
	 u00UstW9FmMzVq8WvVmr07qrOr8B7KbDEa1nTvBNFqwrEPEJt7892E0Pe7UnBURUNBs5wt4CxDvj
	 m1axv1epDQ9SOHB+9Y0edpmfdVYPXHXhWzvz/ddgZFfOFDSzocLzIdBQYadkrEvGyV1a97lOQqP5
	 LNEZI3wHbmsdFiBnnahCiUwmw4r6ZZAZpBvNfzd7Rmg96vdm9Acn9alspCu3dFDPmxBm50He7YV8
	 1A99WnMhB1QRaizBumt94qAvCPKlT6Q8OjhFj4tqLQAJF/OyOS5DOoD2k4UXY9eewRRgcgAVi4SH
	 ZQ8RCrKc1/TswqQ18jJTySPXuDzpdy7D75PV30aEcEvWNn8mFZ+l4H4ey6nRJD+NQG5PjCZE01C/
	 dViUPdbuwq3wzNZoUGtu4zneuSkuxglmpa/Gaow3ed7LEAzcqXeTeyNjlP/YRnRAy573cJyoxDDn
	 CHM96GFYDtDr7kuOQWkcrlr1lyAMpzEHCJPJ0ptPVrDeBDrq4zXP91NuzDHbFF5r2cHPpCAHSCMK
	 YZvkC4yjGc9PW1RNgMOOWzHDEiRVNx13/r/E/CgHbYH2N43mI4nmrvWF/oGo/BOTibValE5ualMD
	 hxpyj2JaXvFFU3EOTEACTq+rpoBju0oLuyd7PHf+YKvtmjWHKs339ZHZM8ROooQWleJLq0UjIXJg
	 lyb46DJl4d44FPQFOGR4hk4LWvmnEt4ZC0X7Da
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
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
	usama.anjum@collabora.com,
	wakel@google.com,
	Yuwen Chen <ywen.chen@foxmail.com>
Subject: [PATCH v3] selftests/futex: fix the failed futex_requeue test issue
Date: Wed, 28 Jan 2026 15:16:12 +0800
X-OQ-MSGID: <20260128071612.416371-1-ywen.chen@foxmail.com>
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

