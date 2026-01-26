Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E330C371;
	Mon, 26 Jan 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420032; cv=none; b=TUCGMpcCYPmz2i2b/YWWnMT+CY3jNEULjpV9nGmo3YxbR0ndb9ehGaxcfmp56Ef7JDbkEi/xlX87xYacU2Tb5c+VRxeL9k0Qdb3UyWJUjQGbhzEJE0rbscF5+aBQjCv7gYdeCtxbEd6Z14VEvKhqADQK3k4eli401UWQuxQvAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420032; c=relaxed/simple;
	bh=FLMvc0Ezo9gLDdFfsX43IKmoKxHwWt83oe1LAz2iAwI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=VHPV+kNJNaqxQXZwp0zxHONd/mX/Wd/A/BL/XV+iHV8tn+EPVDN9MpJO+y4jT1kgulbPXQxMWn+nj2XE5BoybhIpgliAjCH0YPWyCI61f9kYgxfoj3nlw5T64oyZjVTyV1fb3aUnHHtvCuHg8R8a99WNIaqi0oXZ/FvBmhmuZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=OOOFyqAi; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="OOOFyqAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769420015;
	bh=5diY9tf78cnFQ1ahyFzJdBOgdTvD1wrE/l8gm9oHiy0=;
	h=From:To:Cc:Subject:Date;
	b=OOOFyqAi9se0tbprTGEqPTX0m9/lNbtf0RuIqDsArAsis350URYLVUSFRao+D2eI/
	 VMVcvRLVh0yqNRTVmIoQflok37kfjde0xV20bqm4O6CyHd27fG7/rPEw8Oueg4VESa
	 /c7k1FQzBHQwBOIAPv9Id98DP0wLdX8R4tHcHlFQ=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.72])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 85F98C26; Mon, 26 Jan 2026 17:33:31 +0800
X-QQ-mid: xmsmtpt1769420011t4xq3p91y
Message-ID: <tencent_B9DBF2ECBE56BAB68BDAB949C6935D01CE09@qq.com>
X-QQ-XMAILINFO: MSHuecu5THA//XSa6Cyb64kywjUBs0kXJrjTdE1dNtxz49p4g4uF+xYqvMrmI1
	 Sm+KGnqPmP2QTXkXbL5PhRKzDLKN7BO0U/e/xCtPAHGRxza4Pou+ocNHgxqHVs/Y/l32iOpGzG/Q
	 Hlj7Njky9UI4suVMqPq/zStnfX4GGD/Sze/Gw7bVWyt6FN65aGOG4zFOF/CdsG5PVEPHpKnGtS7G
	 rm85Fa5oDn5eRRW69kdc+z7r62x92jNHC1VhjBAUjBieE7B4TJvAQfuTdDdGPtsashlpXAtxD6bO
	 /A/htFlzEaryaaoMGEt2GdP7TMWhRe5jjI2vwLb7lut5hcEUoYF9qHyEDirqtRw4/X61rIVARJRv
	 XaMOw+0cEIe4nZVeK1oOln/QI0+CgbTCDIpY53bLzXsSSHkxP3tt8rUnHQHjk2Cp6Z7z7PuxHA0Q
	 1PcqPOebc/ob182aN8DWzBMBquWHl6iGvD1u3uMjFUecgV42gCfYuYa7ecxw/HdE7H+5o5ePvL+m
	 K7jN4zEe+LX4YlM2rlsDSK0x29+WFt7Ar2Yafx/G7OXAMmZa+CYq1yup2N5eMRlpA/YTu7BLtk49
	 HgZtpLbwRr6Y1Q7QAun2Czlbdl+11E0JQq3B8y9gkvS4JWb6GeI/sU+25amSy0BRu18oLPt0T1m/
	 rS73n4jeUDIjv6bjjYpnApE0y1Tbggl31ILaEqNyGIXhz3/1dp9lbZzmv1iDCdSHbyeu250bRsTz
	 1EbnNDnguiNJ/VGOlUzhxLZz1NADdrRnqgd24ISJhOced0asG6ffRzhyZ/LQU2yS/4YzpdL5Kgu2
	 QRs77mUi6Sb7iCzxSvfArsRnSAP6kiY3W1NWy5r1iuc4Yd6ND3dJz2VpMGX4FDPlFaAMUN9jIUwd
	 Ew6J5pT2hgrEtUx0zPXKA8KvIBxugTTgXYWm/J5hb5i5mijDNYRtKFvSl+PXemakqt6xmTg5xXpk
	 KEJIzWwfQX23fu4W8PJ8a4fEuHcqOcCNLqE2MDjYqgCBO0y7tBsVLcF4aiRpu7He97nngk/TG+11
	 mV0qsog4QklqbFvQMEl8ivsJKw7pkTIOIlZJHsPC7nbyH/DVHmH27zLaEvEI2pV742QhuF3Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: akpm@linux-foundation.org,
	wakel@google.com
Cc: andrealmeid@igalia.com,
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
	tglx@linutronix.de,
	usama.anjum@collabora.com,
	Yuwen Chen <ywen.chen@foxmail.com>
Subject: [PATCH v2] selftests/futex: fix the failed futex_requeue test issue
Date: Mon, 26 Jan 2026 17:33:30 +0800
X-OQ-MSGID: <20260126093330.351723-1-ywen.chen@foxmail.com>
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

 .../futex/functional/futex_requeue.c          | 70 ++++++++++++++++---
 1 file changed, 59 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index 35d4be23db5da..a9d96105134d0 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -7,21 +7,27 @@
 
 #include <pthread.h>
 #include <limits.h>
+#include <stdatomic.h>
 
 #include "futextest.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define timeout_s  3 /* 3s */
+#define WAKE_WAIT_US (10000 * 100) /* 1s */
 
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
@@ -29,22 +35,52 @@ void *waiterfn(void *arg)
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
+		if (sscanf(buf, "%s %c", tag, &val) == 2 && !strcmp(tag, "State:")) {
+			fclose(fp);
+			return val;
+		}
+
+	fclose(fp);
+	return -1;
+}
+
 TEST(requeue_single)
 {
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
-	int res;
+	atomic_int tid = 0;
+	int res, state, retry = 100;
 
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
+		usleep(WAKE_WAIT_US / 100);
+
+		if (state < 0 || retry-- <= 0)
+			break;
+	}
 
 	ksft_print_dbg_msg("Requeuing 1 futex from f1 to f2\n");
 	res = futex_cmp_requeue(f1, 0, &f2, 0, 1, 0);
@@ -69,7 +105,8 @@ TEST(requeue_multiple)
 	volatile futex_t _f1 = 0;
 	volatile futex_t f2 = 0;
 	pthread_t waiter[10];
-	int res, i;
+	atomic_int tids[10] = {0};
+	int res, i, state, retry = 0;
 
 	f1 = &_f1;
 
@@ -78,11 +115,22 @@ TEST(requeue_multiple)
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
+		retry += 10;
+		while ((state = get_thread_state(atomic_load(&tids[i]))) != 'S') {
+			usleep(WAKE_WAIT_US / 100);
+
+			if (state < 0 || retry-- <= 0)
+				break;
+		}
+	}
 
 	ksft_print_dbg_msg("Waking 3 futexes at f1 and requeuing 7 futexes from f1 to f2\n");
 	res = futex_cmp_requeue(f1, 0, &f2, 3, 7, 0);
-- 
2.34.1

