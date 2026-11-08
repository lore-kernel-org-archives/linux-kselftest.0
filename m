Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149398;
	b=UDcpD/KVAC8lSjiKMEeZiBa+nkdEZBzBtm0M1dtwWMrHaZTXHCIBTPwABirdcFcsfehR
	 APykly6j+DCwOuLaahWlounjSASd/144b9VvkJ5+Uo8xlM1rzl1yc+5VMvgOcR1XIOpmy
	 Xr9IJbCQMxeD9qi5dj1X5pBK4n9gQH+ewoiZD28kjjZQLskuQI2PjNvlaKiz3UsRrtDUl
	 xIVzr415PQPJ41dhq7hM+7rJLoUJ29KnqVIXlPsAFXMIJsIgQRz2sb5nO4PWa0S6VDHDG
	 OFRLD3n/gmLTqvR/CZrqNnMYQpx2BOee+yK46wq0BkJzjLLkftOL0o/FS0s5LkLsqEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149398;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WveXipwhMzIMi4QC31qttPIMCtV8M6uDwDZ0Zoo1AZE=;
	b=vicXMC9VQrmEg3odxbtmKjlh/ppePmGayyQks2DwDEGT0DSqL4m6fG8meQpwJ+m4ZjTe
	 MqoPYKf0GEYMtxf1enxfH41a/Apa6aq1y6SIM8bhvYZwhRc18cEzr2K+LOISH27Xa7J2Q
	 HJ4TOfD59a0Q5LTCgednzDezJpXydCH6d8+HaYU4b5YSiiW18TQpqMGF5VCNrtw3bw+XP
	 8Rp3EQZNw7LwhyG2ARVy8Ql308wDyOv7B7DcF5kwH4XaWa6SaeJHSlsl2NhT8RMXPC20i
	 qmWovvIPW+/rygvV93efGZhfabWWO+lOBJSwiLlpKvsaNMe2CjaodVpu+kcf4LOXSMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=aN2GqYj0;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7146606A322;
	Sun,  8 Nov 2026 14:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7146606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=aN2GqYj0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794149397;
	bh=WveXipwhMzIMi4QC31qttPIMCtV8M6uDwDZ0Zoo1AZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aN2GqYj0ovQWp4cQqPVrkvDSyj0J8wQMgwwZoauWxveyJ718yePrQq+s7EJ4KEDxY
	 7NRRKL+G2aOisx5rd0D9hr8KtgLPLWn4AiugcGhw9m2x1ykv61/oBiai60rEK0S4o4
	 5nu/lGG1/bcTmUsmSIWrUBNFuNSuV1wDKabICQCpUC32u4klJVE80k9ePx2zKVHOsd
	 WinmUQz1cnTGLyr8hqohQPmdk+ygRcN52DEFkjbjh/SPMFHv8nQTHImegGAiNTC404
	 n+yDa+Z86VikVh1F3cy84qoisVPkBdCiTLfhWOKfHE5NXTi4RjP4ILBEibDN18nVS1
	 4DrQKLAcc0OMA==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMwn073jYzMk7;
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
Subject: [PATCH v2 3/4] selftests/futex: Retry the wake in futex_waitv instead of sleeping
Date: Sun,  8 Nov 2026 09:49:51 -0500
Message-Id: <20261108144952.1531160-4-mathieu.desnoyers@efficios.com>
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

The private_waitv and shared_waitv tests start a waiter thread, which
calls futex_waitv() with a timeout of 1s. The main thread sleeps 10ms,
then expects futex_wake() to wake that waiter. So the test assumes that
the waiter reaches futex_waitv() within 10ms.

A busy machine breaks this. The built-in locktorture at times holds a
spinlock for 100ms with preemption off. With it, the tests of
futex_waitv failed in about 1% of the runs in 8-CPU VMs, on v7.4-rc1.
In each failure, futex_wake() found no waiter in private_waitv or
shared_waitv.

The two tests also do not join the waiter. A test can then end before
the waiter checks what futex_waitv() returned.

Fix this as the previous patch does for futex_wait. The waiter sets a
flag once futex_waitv() returns. The main thread retries futex_wake()
every millisecond until it sees that flag, and expects one waiter woken
in all. The waiter waits without a timeout. If a wake is lost, the
timeout of the kselftest harness ends the test. Join the waiter at the
end of each test, and check that the join succeeds.

With this patch, the tests passed 4000 runs of 4000 in the same VMs.

Fixes: 5e59c1d1c78c ("selftests: futex: Add sys_futex_waitv() test")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 .../selftests/futex/functional/futex_waitv.c  | 50 +++++++++++++------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_waitv.c b/tools/testing/selftests/futex/functional/futex_waitv.c
index 4858d5faeecf..ccfa31fd20fa 100644
--- a/tools/testing/selftests/futex/functional/futex_waitv.c
+++ b/tools/testing/selftests/futex/functional/futex_waitv.c
@@ -20,25 +20,20 @@
 #include "futex2test.h"
 #include "kselftest_harness.h"
 
-#define WAKE_WAIT_US 10000
+#define WAKE_RETRY_US 1000
 #define NR_FUTEXES 30
 static struct futex_waitv waitv[NR_FUTEXES];
 u_int32_t futexes[NR_FUTEXES] = {0};
+static int waiter_done;
 
 
 void *waiterfn(void *arg)
 {
 	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
-	struct timespec to;
 	int res;
 
-	/* setting absolute timeout for futex2 */
-	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0)
-		TH_LOG("gettime64 failed");
-
-	to.tv_sec++;
-
-	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
+	res = futex_waitv(waitv, NR_FUTEXES, 0, NULL, CLOCK_MONOTONIC);
+	__atomic_store_n(&waiter_done, 1, __ATOMIC_RELEASE);
 	if (res < 0) {
 		EXPECT_EQ(res, NR_FUTEXES - 1)
 			TH_LOG("futex_waitv failed: %s", strerror(errno));
@@ -50,6 +45,25 @@ void *waiterfn(void *arg)
 	return NULL;
 }
 
+/*
+ * Wake the waiter of @uaddr until it has returned from futex_waitv(). The
+ * waiter may not have reached futex_waitv() yet, and a wake then finds no
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
 TEST(private_waitv)
 {
 	pthread_t waiter;
@@ -66,14 +80,17 @@ TEST(private_waitv)
 	}
 
 	/* Private waitv */
+	waiter_done = 0;
 	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, _metadata), 0)
 		TH_LOG("pthread_create failed");
 
-	usleep(WAKE_WAIT_US);
-
-	res = futex_wake(u64_to_ptr(waitv[NR_FUTEXES - 1].uaddr), 1, FUTEX_PRIVATE_FLAG);
+	res = wake_waiter(u64_to_ptr(waitv[NR_FUTEXES - 1].uaddr), FUTEX_PRIVATE_FLAG);
 	EXPECT_EQ(res, 1)
 		TH_LOG("futex_wake private returned: %d %s", res, res < 0 ? strerror(errno) : "");
+
+	res = pthread_join(waiter, NULL);
+	EXPECT_EQ(res, 0)
+		TH_LOG("pthread_join failed: %s", strerror(res));
 }
 
 TEST(shared_waitv)
@@ -104,15 +121,18 @@ TEST(shared_waitv)
 		waitv[i].__reserved = 0;
 	}
 
+	waiter_done = 0;
 	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, _metadata), 0)
 		TH_LOG("pthread_create failed");
 
-	usleep(WAKE_WAIT_US);
-
-	res = futex_wake(u64_to_ptr(waitv[NR_FUTEXES - 1].uaddr), 1, 0);
+	res = wake_waiter(u64_to_ptr(waitv[NR_FUTEXES - 1].uaddr), 0);
 	EXPECT_EQ(res, 1)
 		TH_LOG("futex_wake shared returned: %d %s", res, res < 0 ? strerror(errno) : "");
 
+	res = pthread_join(waiter, NULL);
+	EXPECT_EQ(res, 0)
+		TH_LOG("pthread_join failed: %s", strerror(res));
+
 	for (i = 0; i < NR_FUTEXES; i++)
 		shmdt(u64_to_ptr(waitv[i].uaddr));
 }
-- 
2.47.3

