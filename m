Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147799;
	b=2PAz2maaTiZ93n2yxULg94IjIgcqLUsFc492FZbyeeOdsoaTcJtJVSWkQkGHLbsIbR2q
	 ZlONOjK0zZKl2kQPSbX5A3bXEvqtpQnizbgx1eOQ5WOhv+IJI32xqcIeC8yT0Mtb7+1Hn
	 5X9yt0uZaaUiEvlKdK4ILmFSQ8Wz/hSm2FVk7fWNDBQZkSkkvXX2s5oSg2zMcMK2l7jqy
	 pw6VCS9AS5ir3HlsUBTcHmwR4BGjFK2Hdd94aDGXTAqbs0G+v7sstzPD8meYRxuV6jY2T
	 5VywkWBxLPf6lx50ZfItC24syao8OQig4K+ocM/R0zvTRdhVc0mj4Ekf9PGtmG6cXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147799;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gG+88wZUi/y1Vveym/bPnrUsXqEu+rY4Y/0wdGlvsFA=;
	b=yLDHFuUhnb4fftosqdAlS3sidYdFoNWeWAo7XKNq/VLWyJ7+Z1IdQzi4pX9vooAw3MDp
	 sgWoWX18LHcO9k6qJCAB4irVo0QElu61QFEFnEcOs/kE5U0VtA/W14X0P/8XyWy9JmxXU
	 Nq3dslwDjtE9yeW9UIdrMNsI66P6S3ATmzKSudcHIt2F+VDZ/HhXX7E7rH9k9hUALwUhY
	 3mYfJK3BjBfeKJkqCzIizLuZxyAR17SC/xOPRXTMPbKVfpGXkdX/31X/WUYy3omrOkxHQ
	 y6sDitqe0lTS3YZ6rwbkvlTFKEZXQBWdWaeeW9A4YI1eMjra4yJBkrVD1wkTkLCnz+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=KmhMSfKG;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89436606A332;
	Sun,  8 Nov 2026 14:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89436606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=KmhMSfKG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794147797;
	bh=gG+88wZUi/y1Vveym/bPnrUsXqEu+rY4Y/0wdGlvsFA=;
	h=From:To:Cc:Subject:Date:From;
	b=KmhMSfKGaxO9tKxXEjvFJrmTyZf+j8HXCvghmKXjQFYbSf28ffi+zbV7QKcFktAoL
	 pCNEiEC+/nsOej9VmUpuETduHhll1WzIg7KA7KIoPt6DleEgVTO1sy+EzLLst+dbV6
	 R1LgNn4IiiIAUt1H+XHPbWesCTKSqU3JNE5tWSWVLsO8XZBKb8Y25DoeMP0zqPvydO
	 QqaUUXwT/SbPFXU9/Y9XU0K06vanF9RHlsx6YA7wLdTtRoFm5k+AIx+UKxNqBXB64c
	 6DEkI1uVGTr0cLOhooRBkJYiD5khFBKhM1HWOR/JmryGFBw8kkxRwRKRjq6XoICmHY
	 BAEPuo2HmfD5g==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMwBF2kCPzMmP;
	Sun, 08 Nov 2026 09:23:17 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/futex: Retry the wake in futex_wait instead of sleeping
Date: Sun,  8 Nov 2026 09:23:09 -0500
Message-Id: <20261108142309.1527337-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each futex_wait test starts a waiter thread, which calls futex_wait()
with a 30ms timeout. The main thread sleeps 10ms, then expects
futex_wake() to wake one waiter. So the test assumes that the waiter
reaches futex_wait() within 10ms, and that the main thread runs again
within 30ms.

A busy machine breaks both. The built-in locktorture at times holds a
spinlock for 100ms with preemption off. With it, private_futex failed in
about 0.5% of the runs in 8-CPU VMs, on v7.4-rc1.
Timestamps showed two cases. The waiter started up to 75ms late, after
the wake. Or the main thread woke up to 105ms late, after the waiter
had timed out.

Fix this by retrying futex_wake() every millisecond until it wakes the
waiter, for up to 5s. Give the waiter a timeout of 10s, so that it
outlasts the retries. The tests then wait for the waiter, instead of
assuming when it runs.

With this patch, private_futex passed 6000 runs of 6000 in the same VMs,
and the three tests 2000 runs of 2000.

Fixes: c3d128581f64 ("selftests: futex: Add futex wait test")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 .../selftests/futex/functional/futex_wait.c   | 39 ++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
index 5292f5d2c3b5..e7ebc7d8be1d 100644
--- a/tools/testing/selftests/futex/functional/futex_wait.c
+++ b/tools/testing/selftests/futex/functional/futex_wait.c
@@ -14,8 +14,9 @@
 #include "futextest.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define WAIT_TIMEOUT_S	10
+#define WAKE_RETRY_US	1000
+#define WAKE_TRIES	5000
 #define SHM_PATH "futex_shm_file"
 
 void *futex;
@@ -32,8 +33,8 @@ static void *waiterfn(void *arg)
 	struct timespec to;
 	int res;
 
-	to.tv_sec = 0;
-	to.tv_nsec = timeout_ns;
+	to.tv_sec = WAIT_TIMEOUT_S;
+	to.tv_nsec = 0;
 
 	res = futex_wait(futex, 0, &to, args->flags);
 	if (res) {
@@ -45,6 +46,24 @@ static void *waiterfn(void *arg)
 	return NULL;
 }
 
+/*
+ * Wake the waiter of @uaddr. The waiter thread may not have reached
+ * futex_wait() yet, so retry until futex_wake() wakes it, for up to
+ * WAKE_TRIES times WAKE_RETRY_US. Return what futex_wake() last returned.
+ */
+static int wake_waiter(void *uaddr, unsigned int flags)
+{
+	int i, res = 0;
+
+	for (i = 0; i < WAKE_TRIES; i++) {
+		res = futex_wake(uaddr, 1, flags);
+		if (res)
+			break;
+		usleep(WAKE_RETRY_US);
+	}
+	return res;
+}
+
 TEST(private_futex)
 {
 	struct waiter_args *args = malloc(sizeof(*args));
@@ -61,10 +80,8 @@ TEST(private_futex)
 	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
 		TH_LOG("pthread_create failed");
 
-	usleep(WAKE_WAIT_US);
-
 	TH_LOG("Calling private futex_wake on futex: %p", futex);
-	res = futex_wake(futex, 1, FUTEX_PRIVATE_FLAG);
+	res = wake_waiter(futex, FUTEX_PRIVATE_FLAG);
 	EXPECT_EQ(res, 1)
 		TH_LOG("futex_wake private returned: %d %s", res, res < 0 ? strerror(errno) : "");
 
@@ -106,10 +123,8 @@ TEST(anon_page)
 	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
 		TH_LOG("pthread_create failed");
 
-	usleep(WAKE_WAIT_US);
-
 	TH_LOG("Calling shared (page anon) futex_wake on futex: %p", futex);
-	res = futex_wake(futex, 1, 0);
+	res = wake_waiter(futex, 0);
 	EXPECT_EQ(res, 1) {
 		TH_LOG("futex_wake shared (page anon) returned: %d %s",
 		       res, res < 0 ? strerror(errno) : "");
@@ -161,10 +176,8 @@ TEST(file_backed)
 	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
 		TH_LOG("pthread_create failed");
 
-	usleep(WAKE_WAIT_US);
-
 	TH_LOG("Calling shared (file backed) futex_wake on futex: %p", futex);
-	res = futex_wake(shm, 1, 0);
+	res = wake_waiter(shm, 0);
 	EXPECT_EQ(res, 1) {
 		TH_LOG("futex_wake shared (file backed) returned: %d %s",
 		       res, res < 0 ? strerror(errno) : "");

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

