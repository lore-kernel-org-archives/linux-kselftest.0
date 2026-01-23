Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAAD35DD1A;
	Fri, 23 Jan 2026 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769146915; cv=none; b=glnjiVu2k7RwlFc0zOSVYcoRu4QDYLAIxCXIF2fh7EvbuUPiB0IiO2D2jzLGK1oOeo5egO+05vEycNvHM3/dsO2MwaMfq+H1FeRKSXznvqxiBX0n9kUcdTjlpzu3Xnmq4sR11wCeLLSXuI1fROBsgU1zg+Y3rbQs6BOLIqvyFDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769146915; c=relaxed/simple;
	bh=8IUgQJtm4WgDsJWqbaFGSrkmZHMOOP2tv3ysZTroZo8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=W7vIXs6qxCcotWj0MRNmQpt3K39dF34cAxG1PPzarsH70pMSbxiw6PVjf1MvswJWExP+axIVnrlLNStrLyfsPTKXYqdg5pRM2bV2743XC9OKKNmxXAbqSkcq7Djw88W2auC18+POPTimK7XJTI3KcFcWjPgF0UuLVHMX7Hxb8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Bjlho6Fr; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Bjlho6Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769146899;
	bh=N6KytkYyGFnHwx6zf4Tve/5BwuGfZDgSWNH2Z8eP1hI=;
	h=From:To:Cc:Subject:Date;
	b=Bjlho6Fr/mOQVVm2TNZJv4Ull0kpHLl8Skt13JPrLaqACl9cW93iCuZ1TsdO7CIaT
	 yFEkcKlizoav5GXfuH50HqOGcXaw8i5nVNgMi3mnxl05yPhySasSo+RoXYcMisxMxe
	 xvFcs0Na4zGN8+Z7dsMi7gp3Lg5HFAkaCBHLW9Oo=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id A62AA441; Fri, 23 Jan 2026 13:41:34 +0800
X-QQ-mid: xmsmtpt1769146894tueovpe7q
Message-ID: <tencent_3F58110777CBF8A0ABD3B96DDEDCD75F9706@qq.com>
X-QQ-XMAILINFO: Mg/13mbJq/Rup2Qb9E+ZlmTxIiTy8mMr064SUCCg7XyYKp4bJyfkIGcr28ZoJd
	 StvpUicnkPq+JP7LJlj0jBvwjzu13UFUSPhT0ehoVq0YHaxwEbafnYOTqyeN3eueHcSZecTfQUrC
	 YqEHS6xVE2q1o3DoONXiTaZsb8r7hl6Hz1kgkTsq1ks+sK+RlOtYf1U/g1RqQSkzphd9pOZNNu/M
	 qFcDVY7TeKU8VHUg1mDElmgaeSwfHEEd8UYeExfuzKi7olVnBqGOfwuXJo+omwOG4AwmI+4m5pPg
	 eFbNhSdHNQoEuPdtpt6tgxGExDAzgSAZ/zOK79voonQjhVc5iAnBqNfDHrs5QZiRKiEHTXimzl+e
	 I7e/mXQ/C8b558ml4NcAwfCwSoGF//i4ptrqd64+Bp4kWdjD6EKwV5+ZOa1/RM2dp23H6IqiqcHs
	 kjFXanOFolVZtdnHwXyDcNVO8GPl4pjcYiUc2Tn66OVGn/8akFFknfH952JtnZVfpochhd8FTM/e
	 HfqhhiUPYiwxe0sqXX0BDOCq3h3p5t/f93dGsQNet7UEGGtWvbNbV91nvvAnujNvCUgmfuXtaGvs
	 s0rdG8UZCstbZHvhPle7gYOdpbcON7/5WeR54qgL47fE13BpcD1tELs1r4cD6+iemKyPJtB7ysMg
	 B27Wd4RUl+XkmcFDTfQwCSLhDZpKPm6OYmXJT8wOoAuizz2lKC/96Jy6Omed2nfvnppGE3SliLsS
	 hr/okDvzEVZX4kLPr/pInsJ90KxOahUR3c+n+kQ0bveXKuPKY6S2AW90JfpzatI4uwpp75KV8Zmm
	 XEHOAaLXPQJ246vySBbFgfC/lyBVHlRvu1/gXEbx/yIvyL1g4G3OrHi3sB2nkga1EP2UuhZQKkc2
	 X968ZUvXwCvVHlZnhnvDCbfP4WfWL4A7ReRCP8Esw5h7VUmHTwAmwdU2oR9xc9eDVgbyf3k+Qv1i
	 PeETpg/vsBOSb6lTcafHkKrSuW0gPw9VZfj9qI4YHRt4YlytaVDYTsZ3LsjbDQbgwLTIYulsiP6Q
	 xROcLRsoegY3ewVp55kxKwoDLwkHTy867jEYXpg4k4Ip2k56HL40/TUnAenzA=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: akpm@linux-foundation.org
Cc: licayy@foxmail.com,
	andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	justinstitt@google.com,
	kernel-team@android.com,
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
	ywen.chen@foxmail.com,
	Edward Liaw <edliaw@google.com>
Subject: [PATCH] selftests/futex: fix the failed futex_requeue test issue
Date: Fri, 23 Jan 2026 13:41:32 +0800
X-OQ-MSGID: <20260123054132.101222-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
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
   pthread_create-------------------
        |                          |
 futex_cmp_requeue                 |
        |                      futex_wait
        |                          |

If the child thread is not waiting in the futex_wait function when the
main thread reaches the futex_cmp_requeue function, the test will fail.

This patch avoids this problem by checking whether the child thread is
in a sleeping state in the main thread.

Fixes: 7cb5dd8e2c8c ("selftests: futex: Add futex compare requeue test")
Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
Co-developed-by: Edward Liaw <edliaw@google.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../futex/functional/futex_requeue.c          | 65 ++++++++++++++++---
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index 35d4be23db5da..f17debd756303 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -7,21 +7,27 @@
 
 #include <pthread.h>
 #include <limits.h>
+#include <stdatomic.h>
 
 #include "futextest.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
+#define timeout_s  3 /* 3s */
 #define WAKE_WAIT_US 10000
 
 volatile futex_t *f1;
+static pthread_barrier_t barrier;
 
 void *waiterfn(void *arg)
 {
 	struct timespec to;
+	atomic_int *tid = (atomic_int *)arg;
 
-	to.tv_sec = 0;
-	to.tv_nsec = timeout_ns;
+	to.tv_sec = timeout_s;
+	to.tv_nsec = 0;
+
+	atomic_store(tid, gettid());
+	pthread_barrier_wait(&barrier);
 
 	if (futex_wait(f1, *f1, &to, 0))
 		printf("waiter failed errno %d\n", errno);
@@ -29,22 +35,50 @@ void *waiterfn(void *arg)
 	return NULL;
 }
 
+static int get_thread_state(pid_t pid)
+{
+	FILE *fp;
+	char buf[80], tag[80];
+	char val = 0;
+
+	snprintf(buf, sizeof(buf), "/proc/%d/status", pid);
+	fp = fopen(buf, "r");
+	if (!fp)
+		return -1;
+
+	while (fgets(buf, sizeof(buf), fp))
+		if (fscanf(fp, "%s %c\n", tag, &val) == 2 && !strcmp(tag, "State:"))
+			break;
+
+	fclose(fp);
+	return val;
+}
+
 TEST(requeue_single)
 {
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
-	int res;
+	atomic_int tid = 0;
+	int res, state;
 
 	f1 = &_f1;
+	pthread_barrier_init(&barrier, NULL, 2);
 
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
-	if (pthread_create(&waiter[0], NULL, waiterfn, NULL))
+	if (pthread_create(&waiter[0], NULL, waiterfn, &tid))
 		ksft_exit_fail_msg("pthread_create failed\n");
 
-	usleep(WAKE_WAIT_US);
+	pthread_barrier_wait(&barrier);
+	pthread_barrier_destroy(&barrier);
+	while ((state = get_thread_state(atomic_load(&tid))) != 'S') {
+		usleep(WAKE_WAIT_US);
+
+		if (state < 0)
+			break;
+	}
 
 	ksft_print_dbg_msg("Requeuing 1 futex from f1 to f2\n");
 	res = futex_cmp_requeue(f1, 0, &f2, 0, 1, 0);
@@ -69,7 +103,8 @@ TEST(requeue_multiple)
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
-	int res, i;
+	atomic_int tids[10] = {0};
+	int res, i, state;
 
 	f1 = &_f1;
 
@@ -78,11 +113,21 @@ TEST(requeue_multiple)
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
 	for (i = 0; i < 10; i++) {
-		if (pthread_create(&waiter[i], NULL, waiterfn, NULL))
+		pthread_barrier_init(&barrier, NULL, 2);
+
+		if (pthread_create(&waiter[i], NULL, waiterfn, &tids[i]))
 			ksft_exit_fail_msg("pthread_create failed\n");
-	}
 
-	usleep(WAKE_WAIT_US);
+		pthread_barrier_wait(&barrier);
+		pthread_barrier_destroy(&barrier);
+
+		while ((state = get_thread_state(atomic_load(&tids[i]))) != 'S') {
+			usleep(WAKE_WAIT_US);
+
+			if (state < 0)
+				break;
+		}
+	}
 
 	ksft_print_dbg_msg("Waking 3 futexes at f1 and requeuing 7 futexes from f1 to f2\n");
 	res = futex_cmp_requeue(f1, 0, &f2, 3, 7, 0);
-- 
2.34.1

