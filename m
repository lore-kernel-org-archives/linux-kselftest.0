Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECFB2F2616;
	Wed, 28 Jan 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595994; cv=none; b=CLdZyrSL0jRW+drRwps7OzeK91q2LDc/fL1YHgyKfXxA7cV6Prz/q0lJqKiOjX9TjSl168DfqWMmebJRS3ALUoLFECZr5I+r3BvyFCnqle1xJdpBaz7fjpikohu4UyLns/+2Q8aENgfinZz641bmXrG5dEOFUccMgBOtOdc1gCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595994; c=relaxed/simple;
	bh=JEFNtcIXJumMTCCZ7WL3ORROgBWp+0/0HRw8Qv3b7J8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=GH2ITZaUML5rZkIgaLksrYMu1MbJxWVLIZMebL+/PwzRqxy7W7U0sgyzoUDWqYqW95JB/RqMzjxOgVdhcaEWvA/gekwE8vWX+yVBDkG1nV1pPf6ESrYgiBweBPXHLL+4Vd2aQHD9pBOUQdFOZDC+ZyNaEbyMLXuQ73szsOLEckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=XgKTAE9E; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="XgKTAE9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769595981;
	bh=vZREuVvORdvibmY/zt4BBeWKYOCiAtgtDPs4Wwc+bR4=;
	h=From:To:Cc:Subject:Date;
	b=XgKTAE9EGxnahOWsQR6z2UdcWxLEFMHTXK4eW2ltl+QEE+MpevzfzFa1gyIDm+fnu
	 2Zq7J2pDq4L0tNo+l6SCvRcxBXCFToGzNZkl72d+r2Cl7p1DV2ljJmZj32XSzo/1iM
	 amikiRzpt4x5XrtzQm3DVy+KdlasIJSe1YSozUR8=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 6368CA94; Wed, 28 Jan 2026 18:24:54 +0800
X-QQ-mid: xmsmtpt1769595894tgn259yxe
Message-ID: <tencent_204540DCC2E303AEB6E77679C05F5C5D3808@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JunghiCKXdczfvSrrg4EklZGrDMQJTELDXreLk5drwLjHvHxqFU0
	 5pbMNYNqjWaxjWLvON4v9YG0aCKEVNIRxgRtxRSw2tUG4B3IGdeLENtVIsKvjVj+IZE1zUf1dDRM
	 dhHdnv5ff2iXOUYRLnD74bzT751CyqHMGL2eVY/YdGiYpOpC30HC14qJ/MlXsSpPbsQJ78Q07O4J
	 +6oiXSB4J3UxaxXD+edu7nxjhfh8pKjKGOhp+GwWVfYW3Iul+R5+6KOUsAbc7X+GIbTul7eplY8F
	 VF1msbx1km1haVK7CCk2UD3ZUFyKA5NDtiHMZ2Z0cYEMQXrUYWOYCLFZHoL+wo6crjHs+MHNSMi7
	 /8wJq1c60mWqCtsedDvj9QSUGNqZ3r04uh6O/sK30jCRKuofVQfZRGY3ZSMNpdJJZVNArHVJyENv
	 PEZ/gd0IEBOpaQyJ4XIcFtbCGMX0nfgrY3LCRFVN/cUtReGMs3AxnV2k3RKMv0WDksteM5ZWJ/dC
	 BA4RAxC7LEr5Hqy4mwZraI13dAaBV+eHd6B3atJAxbmJYc8GaC6qk+x8mzaBwIrlt68F4YhYM4tv
	 8TBzG1rbBrQSGuA//xsZadZ47TZhj3xfXM5rpUSYoWwmLHfauTWapgWIO11G+0gHkeP1NweWSwF4
	 5D4LslrejCn1MtA+2cxcEBU6Vz4ob+6swignf6bhbN060Nkxtw6kGOS8LnBqgxFmXOjmfthEN9L1
	 sOfp3JoIrQkDNJYsiZIXEjqtUjjkUuBmBfvMG99TOmZdVjLaqaDRwBsJ3mslO+RzrFtVWo87Gnn3
	 ShSHljWi4/EVB3yYhEK2Qfx1MnKZJYDaCUoh9RnqVV9yevWjaWZIqHKgHwv0BEs9txd8dxxKHX7c
	 hlFtwIr44GuOXpJW1fIfra5uYpeiw/5y4U3jwF3V165HPAl9gpwcGE1esvW8NLsFGKyzbce9g4z8
	 PM12s4Nj72o58craR6/9pZJdAeBNmqS+OjhXz4KEmHBvkjgmy9Rh+lsQ4IDIbJozmlVZDBWWsHud
	 +8irjdD0pJSak8AkMFAa/KChSCnBh2PNTtS3YwKtiCasDuoQBGA5dSqKhg9JuPFWQYfajKjchMpR
	 ymZ1BbVKLqOHOs7fg/sPP054bE3tKA3NAiV0gl9Oj5jPwvO7g=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
	ywen.chen@foxmail.com
Subject: [PATCH v4] selftests/futex: fix the failed futex_requeue test issue
Date: Wed, 28 Jan 2026 18:24:51 +0800
X-OQ-MSGID: <20260128102451.422871-1-ywen.chen@foxmail.com>
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
v3->v4: https://lore.kernel.org/all/tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com/
    1. Add a new futex_thread.h file.
    2. Add a new function named futex_thread_destroy.
    3. Fix the issue that threads are not reclaimed in futex_requeue.

 .../futex/functional/futex_requeue.c          |  31 +++---
 .../selftests/futex/include/futex_thread.h    | 100 ++++++++++++++++++
 2 files changed, 118 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/futex/include/futex_thread.h

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f3122..38743adcfd20f 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -9,10 +9,11 @@
 #include <limits.h>
 
 #include "futextest.h"
+#include "futex_thread.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define FUTEX_WAIT_TIMEOUT_S	3 /* 3s */
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
@@ -33,27 +34,27 @@ TEST(requeue_single)
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
+	ASSERT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
+	futex_wait_for_thread(&waiter, WAIT_THREAD_DELAY_US);
 
 	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
 	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
+
+	futex_thread_destroy(&waiter);
 }
 
 TEST(requeue_multiple)
 {
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
-	pthread_t waiter[10];
-	int i;
+	struct futex_thread waiter[10];
 
 	f1 = &_f1;
 
@@ -61,13 +62,17 @@ TEST(requeue_multiple)
 	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
-	for (i = 0; i < 10; i++)
-		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
+	for (int i = 0; i < 10; i++)
+		ASSERT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
 
-	usleep(WAKE_WAIT_US);
+	for (int i = 0; i < 10; i++)
+		futex_wait_for_thread(&waiter[i], WAIT_THREAD_DELAY_US / 10);
 
 	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
 	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
+
+	for (int i = 0; i < 10; i++)
+		futex_thread_destroy(&waiter[i]);
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/futex/include/futex_thread.h b/tools/testing/selftests/futex/include/futex_thread.h
new file mode 100644
index 0000000000000..9761f67b6d30b
--- /dev/null
+++ b/tools/testing/selftests/futex/include/futex_thread.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * library for futex tests
+ *
+ * Copyright 2026 Meizu Ltd.
+ */
+#ifndef _FUTEX_THREAD_H
+#define _FUTEX_THREAD_H
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+
+#define WAIT_THREAD_RETRIES 100
+
+struct futex_thread {
+	pthread_t thread;
+	pthread_barrier_t barrier;
+	pid_t tid;
+	void *(*threadfn)(void *);
+	void *arg;
+};
+
+static int __wait_for_thread(FILE *fp, int timeout_us)
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
+static void *__futex_thread_fn(void *arg)
+{
+	struct futex_thread *t = arg;
+
+	t->tid = gettid();
+	pthread_barrier_wait(&t->barrier);
+	return t->threadfn(t->arg);
+}
+
+/**
+ * futex_wait_for_thread - Wait for the child thread to sleep in the futex context
+ * @t:          Threads for testing.
+ * @timeout_us: Optional timeout for operation
+ */
+static inline int futex_wait_for_thread(struct futex_thread *t, int timeout_us)
+{
+	char fname[80];
+	FILE *fp;
+	int res;
+
+	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
+	fp = fopen(fname, "r");
+	if (!fp)
+		return -EIO;
+	res = __wait_for_thread(fp, timeout_us);
+	fclose(fp);
+	return res;
+}
+
+/**
+ * futex_waitv - Create thread for testing.
+ * @t:        Data used for returning from the thread
+ * @threadfn: The new thread starts execution by invoking threadfn()
+ * @arg:      arg is passed as the sole argument of threadfn()
+ */
+static inline int futex_thread_create(struct futex_thread *t, void *(*threadfn)(void *), void *arg)
+{
+	int ret;
+
+	pthread_barrier_init(&t->barrier, NULL, 2);
+	t->tid = 0;
+	t->threadfn = threadfn;
+	t->arg = arg;
+
+	ret = pthread_create(&t->thread, NULL, __futex_thread_fn, t);
+	if (ret)
+		return ret;
+
+	pthread_barrier_wait(&t->barrier);
+	return 0;
+}
+
+/**
+ * futex_waitv - Destroy thread.
+ * @t: Threads for testing.
+ */
+static inline void futex_thread_destroy(struct futex_thread *t)
+{
+	pthread_join(t->thread, NULL);
+	pthread_barrier_destroy(&t->barrier);
+}
+
+#endif
-- 
2.34.1

