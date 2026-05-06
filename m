Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19872D8391
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 03:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037945; cv=none; b=Iez1+wqqDd1iD1qs7m5LyMSWJ/PBgm2txT24JxH1VhOfMgupMIBlXpl8AigENocGoSthHmA9Iie04EKL6a3mbXDE/P58sT76V7ToKJZdULt1nk6aJLZb2G2i92gqS7PdWN9QB/FPySnjyfkkl2dlXwRltyehTNn4iwuUcmBZuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037945; c=relaxed/simple;
	bh=JSbQVp3uOsviHeOGn/YCNXJLDIgQazpWad8Ou8j2eOk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=p99oOHtphn6HuQho65NMkyCnNYHSdzpUa8CSMFqrUk1OAA55Zz295whFweOyz1dWe8RSZfBxCpL7h4Y6HDZXnlzyiv13+AFnW8w++NNoxtSN5jm0ZUeB3wK4Dioy7pgyNSCi3shpA3bl2kul9PYcswKyfH1QaLc9tsetcZqAWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=WLF7Ynt5; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="WLF7Ynt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778037940;
	bh=VO1X5lXNktXqNg9NuvRxBS3DscdbZQigmnrJ8kj5irc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WLF7Ynt52exvivmVR8FVqU6qj6w1LqtZb7e7Fk1cESB4QSPM4/CGttFkP4F61cFaV
	 251W1bjCwfwWjY4IXSVL42VhwEz/wEbjVkK8mm7ALWvSfzx6rOYRZet/uL2VY269b4
	 DlnL3jtsBSgkSmkmEvpkwQ1FcFNFlz6Fx9PAQhRo=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.153])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 66431A1C; Wed, 06 May 2026 11:25:36 +0800
X-QQ-mid: xmsmtpt1778037936tb4hsuip3
Message-ID: <tencent_39F93C82AFFC2ED3A26A6E92F15957C77307@qq.com>
X-QQ-XMAILINFO: MQqVrAvE77Wl90BFmhOcz1aQ1AeEgPpv0g2/rN3EvH5DoSVmjYQP4R8FuGm0ST
	 byaer9DBrb2V/o5TsH8Nsf+/bNNDV8aiJnRo3I/F9h6LuNhv8pnLG/U6yg6A41Ut0pjU7m0ifQba
	 PNO7jKIP6buZo9YyT2vEdE3BtT/NjriyEVujRvhHnlh+G3w4s7OGCT55sInJdROIfKHGbXwlNGmF
	 j+Ox5cFKzGGzDvrIE43V6z4oqis6mIArCEpeZuwjA2h+vrPqkJbJw4QggWDYsKL8Qon2hFdLxKyJ
	 gsXWf3OBibDsWEdXFDgYwogw8HEiaJ5EK/zBkBmDuOZsF2qn4l1muz8VzOlbZwU3etiz1+NHC0lC
	 tzNJkUPdwq0oDr08dBsKAxzS1s/6oM1Ka+DEWPwhQE7hqgXQYwNN1iMi46sqLIr6gv6BYskE1ixR
	 mlzcFxfn7GScXajT+L5PcxowD8y8tUn5l+ddOcg+x4lVbDWQVRJGuHzaHxL84ItzFH3s/gpYe2OD
	 wyAmTP/POJvZXMjij8IuM7ZTGYyDc0GbpG+mTotd4qU0qZibyBjJCyXEQB4byXjiCbzMNri07ZDE
	 Qvvpnz1SsYrArL+Cg7FAAN2vw8HxR9Z+voNOgrq0/2B20MUgBZ38S+2BtQcwgMZ+y/1AdjeWATPU
	 NA5raMMOrEaCUKpha9wW0tvUMNXUmP/xEe371H6xeuNHUHZKIWrrJioQjK6jKNw6n6I7iqbPpiRj
	 KiWQCFoOmfHUgYszok+jHSO8N2bAI8U91R8obgJ3wOkblPbNvg2FT1Pn6d46ZdXJZ2SNnpJ8O+7I
	 PCxQppP17ZTbbbBcQKDbCHQrbylk97mEitd6MFjapOPOEpdabdpQD3BxwW87gfBVZ1zHoUft6JO2
	 jp1GrS8qvonk8EvHVCAZ4QIOmlep+udBl4eiaAPpwpYmOWNtmOnn80vYP4Oie43lG2AwU0G9pDfG
	 I0LynCO5KDcnV9avXeW0/ms+dYZsr2jsN/FSyrhNJMwueNL+AoA4nE5xHfZ+/e91iTbKfNexO6nA
	 eWSsjuHPUNrr5+YC0W1I8IP2sG4SnsTYfGSRUq7cAa/2Kh1b2ju2XWp0L9q6CDsy5tF+ELlHK8JQ
	 ml0MOPzsLbjop/gdFo/RgVfFREVkkRBWeRUPN7YI45jTiTpcfKtrvywwz2Tdrb7zIsifnzskPTh2
	 +0WPD+bmsgL0Ezi+DrKKzq9qCByNlKQc4eNd4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
Subject: [PATCH v6 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Wed,  6 May 2026 11:25:35 +0800
X-OQ-MSGID: <20260506032535.3984357-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
References: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
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
 .../futex/functional/futex_requeue.c          | 40 +++++++++++++------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f3122..ce10030e6f657 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -9,50 +9,60 @@
 #include <limits.h>
 
 #include "futextest.h"
+#include "futex_thread.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define FUTEX_WAIT_TIMEOUT_SECS 1
+#define WAIT_THREAD_CREATE_TIMEOUT_USECS (USEC_PER_SEC)
 
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
+	ASSERT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
 
-	usleep(WAKE_WAIT_US);
+	/*
+	 * Even if the waiting fails because the proc file system is not mounted, this
+	 * test item can still succeed. Therefore, there is no need to check the
+	 * return value here.
+	 */
+	futex_wait_for_thread(&waiter, WAIT_THREAD_CREATE_TIMEOUT_USECS);
 
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
 	int i;
 
 	f1 = &_f1;
@@ -62,12 +72,16 @@ TEST(requeue_multiple)
 	 * At futex_wake, wake INT_MAX (should be exactly 7).
 	 */
 	for (i = 0; i < 10; i++)
-		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
+		ASSERT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
 
-	usleep(WAKE_WAIT_US);
+	for (i = 0; i < 10; i++)
+		futex_wait_for_thread(&waiter[i], WAIT_THREAD_CREATE_TIMEOUT_USECS / 10);
 
 	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
 	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
+
+	for (i = 0; i < 10; i++)
+		EXPECT_EQ(0, futex_thread_destroy(&waiter[i]));
 }
 
 TEST_HARNESS_MAIN
-- 
2.34.1

