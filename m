Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149398;
	b=pTxTI3F3o6laaaaKtrnFVYKY8fp9VyuwZRYNVICt6sUPra4VP785Kg64epVdfVS+V83E
	 A+PSWifdue3/8qwcx9g1kUrSPbX0Ld3p4AflasX4gi27MN3uwbtIYB7/LMashpYLQFPhT
	 I0sIaFJw6dbMRAgGNJFob8UjMWVsFYAct0j1+wqIuQqcFDCR8L/Sv02t2vyOvpkKzRPra
	 5YpT8P2rIMXQQeraeSgDY7INAogk47u46OencQeWtJ/HSu2JtbD+VfGHgM9AfzJIeQNPG
	 8xQyRDNMbwIuU3uIb7UXsAZsclGq+ALRX+KQA1W4DdTSCa2/BQ3DmTaJaBgJjk4JgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149398;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FYcomQUz3dHcF02RjrtLKBPqJ2J1TQtRK7szoPhyE0s=;
	b=NohbihQKOJuN5LUpA1t1NYhcBzgBv30va00MEFMH7yIkgrZm+0+2yul98Vdn9ILpvq3Z
	 MY5HhC7Qq+pCYfID5tK0g67DgoQNOqWRshQ1CebLzIpQ6PUcL1l6oFmo1ZKhp9sdsB3Cb
	 4p9zbE/L9GHh41V6rSKdmHOsVbd1Xq4Popxm0d5L3b6wEkg5/tMZb+xasreuXkSEA+a5X
	 mym5bAIzmFL2Zq8jOrOEO0jNogMNpHADGyKaap955kbTExBBXdoqfRMl96H9NWUGYnziX
	 XP6Tp/gU5FA48SO1ubTRhDB6tiBrKNpUpbhEKAkyCuXw5Sdtioud8sKsClsNmp8uvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Bn0cSd2J;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B5606A321;
	Sun,  8 Nov 2026 14:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Bn0cSd2J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794149396;
	bh=FYcomQUz3dHcF02RjrtLKBPqJ2J1TQtRK7szoPhyE0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bn0cSd2J42pHCxfJEFz04sznhsyxAiXPlwM/8cg9dMvtMgq4E8ELCl8+++Z0j1nLc
	 4CWQCLffOmYdTcgVjuAKbpS4VUr4BE1DStat4a1PBRjGclRdZJvBljQAV2guT9r+vm
	 oRiVTtZwuoR90zEFEfqN/ZLqh4F6Mf4RdNlbEigFe0WEqP/A7FqZDv/Zp9OnlRR3cC
	 zNqYSJmOY1xlxN0HmdqiucBnysVdNkbUu8NdY9XBg92vXVbTvjxNLVdYqd+rFPSwbF
	 JtCcIngFuug0WniojBsc1UUnWiYvs4bs6UEmHF9N3U6eqMGT9BbwIgv2u7exkG/Yxd
	 w1Cm8yf8iza6w==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMwn05ZpCzMk6;
	Sun, 08 Nov 2026 09:49:56 -0500 (EST)
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
Subject: [PATCH v2 2/4] selftests/futex: Retry the wake in futex_wait instead of sleeping
Date: Sun,  8 Nov 2026 09:49:50 -0500
Message-Id: <20261108144952.1531160-3-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261108144952.1531160-1-mathieu.desnoyers@efficios.com>
References: <20261108144952.1531160-1-mathieu.desnoyers@efficios.com>
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
about 0.5% of the runs in 8-CPU VMs, on v7.4-rc1. Timestamps showed two
cases. The waiter started up to 75ms late, after the wake. Or the main
thread woke up to 105ms late, after the waiter had timed out.

Fix this without relying on timing. The waiter sets a flag once
futex_wait() returns. The main thread retries futex_wake() every
millisecond until it sees that flag, and expects one waiter woken in
all. The waiter waits without a timeout. If a wake is lost, the timeout
of the kselftest harness ends the test. Check what pthread_join()
returns.

With this patch, private_futex passed 3000 runs of 3000 in the same VMs,
and the three tests 1000 runs of 1000.

Fixes: c3d128581f64 ("selftests: futex: Add futex wait test")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 .../selftests/futex/functional/futex_wait.c   | 57 ++++++++++++-------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
index 5292f5d2c3b5..4bf7d8ee238b 100644
--- a/tools/testing/selftests/futex/functional/futex_wait.c
+++ b/tools/testing/selftests/futex/functional/futex_wait.c
@@ -14,11 +14,11 @@
 #include "futextest.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
+#define WAKE_RETRY_US 1000
 #define SHM_PATH "futex_shm_file"
 
 void *futex;
+static int waiter_done;
 
 struct waiter_args {
 	struct __test_metadata	*_metadata;
@@ -29,13 +29,10 @@ static void *waiterfn(void *arg)
 {
 	struct waiter_args *args = (struct waiter_args *)arg;
 	struct __test_metadata *_metadata = args->_metadata;
-	struct timespec to;
 	int res;
 
-	to.tv_sec = 0;
-	to.tv_nsec = timeout_ns;
-
-	res = futex_wait(futex, 0, &to, args->flags);
+	res = futex_wait(futex, 0, NULL, args->flags);
+	__atomic_store_n(&waiter_done, 1, __ATOMIC_RELEASE);
 	if (res) {
 		EXPECT_EQ(res, 0)
 			TH_LOG("waiter failed errno %d: %s", errno, strerror(errno));
@@ -45,6 +42,25 @@ static void *waiterfn(void *arg)
 	return NULL;
 }
 
+/*
+ * Wake the waiter of @uaddr until it has returned from futex_wait(). The
+ * waiter may not have reached futex_wait() yet, and a wake then finds no
+ * waiter. Return how many waiters futex_wake() woke, or -1 on error.
+ */
+static int wake_waiter(void *uaddr, unsigned int flags)
+{
+	int res, woken = 0;
+
+	while (!__atomic_load_n(&waiter_done, __ATOMIC_ACQUIRE)) {
+		res = futex_wake(uaddr, 1, flags);
+		if (res < 0)
+			return res;
+		woken += res;
+		usleep(WAKE_RETRY_US);
+	}
+	return woken;
+}
+
 TEST(private_futex)
 {
 	struct waiter_args *args = malloc(sizeof(*args));
@@ -58,17 +74,18 @@ TEST(private_futex)
 
 	/* Testing a private futex */
 	TH_LOG("Calling private futex_wait on futex: %p", futex);
+	waiter_done = 0;
 	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
 		TH_LOG("pthread_create failed");
 
-	usleep(WAKE_WAIT_US);
-
 	TH_LOG("Calling private futex_wake on futex: %p", futex);
-	res = futex_wake(futex, 1, FUTEX_PRIVATE_FLAG);
+	res = wake_waiter(futex, FUTEX_PRIVATE_FLAG);
 	EXPECT_EQ(res, 1)
 		TH_LOG("futex_wake private returned: %d %s", res, res < 0 ? strerror(errno) : "");
 
-	pthread_join(waiter, NULL);
+	res = pthread_join(waiter, NULL);
+	EXPECT_EQ(res, 0)
+		TH_LOG("pthread_join failed: %s", strerror(res));
 }
 
 TEST(anon_page)
@@ -103,19 +120,20 @@ TEST(anon_page)
 	futex = shared_data;
 
 	TH_LOG("Calling shared (page anon) futex_wait on futex: %p", futex);
+	waiter_done = 0;
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
 	}
 
-	pthread_join(waiter, NULL);
+	res = pthread_join(waiter, NULL);
+	EXPECT_EQ(res, 0)
+		TH_LOG("pthread_join failed: %s", strerror(res));
 	shmdt(shared_data);
 }
 
@@ -158,19 +176,20 @@ TEST(file_backed)
 	futex = shm;
 
 	TH_LOG("Calling shared (file backed) futex_wait on futex: %p", futex);
+	waiter_done = 0;
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
 	}
 
-	pthread_join(waiter, NULL);
+	res = pthread_join(waiter, NULL);
+	EXPECT_EQ(res, 0)
+		TH_LOG("pthread_join failed: %s", strerror(res));
 	munmap(shm, sizeof(f_private));
 	remove(SHM_PATH);
 	close(fd);
-- 
2.47.3

