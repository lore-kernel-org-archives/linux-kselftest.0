Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149398;
	b=siu1DP/1Hqv6GXbiFiI96ViuJHGHNM6kcN42vUP/qeG3C7CfdrhqFrMPPtg1a+P8jw05
	 pxXOr5WJVJUFfh8zpl0soakqMDNJoK7+fdBMDmGYmfIOkDYkTSxeI+N91ggEFI48WHe4A
	 wR+rvFs1fEDw0bmG9zfB9RspO88PzW3FajzCRC8/VJUmhvN2RipFAi4KhhUu9URqnOm49
	 g359uhE7dJt6dEhQoyO0EKDTanY/zrrlHDcw9CTAhSshxxKPmdJQjsUqR7IJPpalcv4Q7
	 2SViOgrBaoLQwV12e0teEcpnqjeHlCCWq0G4zdVzNk9yKwooDAbsSwENJokwr1kZYMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149398;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ONGWbYniCPvyTDRzGn9mSohHz4LCbYgHANGfEzGa/rA=;
	b=xF6/l1VJ9z4CtmyJtz9NKZg/YzZ5gfyqeLGG9B79z8deB0SDVh8jRsYUUbeFZpdtk8fj
	 48ust6faAM4a61g3RWgsMBIuOmWyGcET8XNNfGhBgMSUkSttC/3/3N7Y1vsFrjL4kb2DT
	 0yuyW+Eo3gEixiPpQTXe5t0yGWFiN0+KQ4WePCABnUwnwHNXJDlTOTwUZxUMmknkxNuWW
	 E8fMI48wO38QPPYe3DudGrDQpMshU4f9dq72cjNUM6gvyaph2AxORuxvEExDoEZYtBGWJ
	 h1f3BD9l5wSSvfQmXAC9a3112ebS+7lWnwtnHB75wUgvjL9EFZM4gbOm4o4EUjpQdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=WKdeu7gB;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C578606A31C;
	Sun,  8 Nov 2026 14:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C578606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=WKdeu7gB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794149396;
	bh=ONGWbYniCPvyTDRzGn9mSohHz4LCbYgHANGfEzGa/rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKdeu7gBvdFXRxKLGEXPg4AFn+l4Pk6ECPN6Ww61vjkMBHgYARtI9R/vmUOib8lJZ
	 1nDVi1vG4ZJFPjLLvhu5hb3542LUs2s8xth/THgnGhsfkeq/JCT4tIg2OzwPrzAmVs
	 ysAqVlE1NpPx2Dxm6V3n9KoEoGC1CN9jfQAiOEDz+VEkQdfWth9qPJsAQ3APFD2naU
	 OF3bGq0B6dsvjtnInXmnIhJZY28thLRozo4guvFJWnlxQQ+sS8V2jptf1p5H9Kvyjp
	 VxpzExSj3l1GFxpnToB91Lc/ltarNRwRRAia7ixZZ8QvZS+6pxgp449PAPkp3d+y5A
	 Eh+FkjmAWsq4g==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMwn04BJhzMk5;
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
Subject: [PATCH v2 1/4] selftests/futex: Let futex_waitv() take no timeout
Date: Sun,  8 Nov 2026 09:49:49 -0500
Message-Id: <20261108144952.1531160-2-mathieu.desnoyers@efficios.com>
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

The futex_waitv() helper of futex2test.h copies the caller's timeout
into a struct __kernel_timespec. It dereferences the pointer without a
check, so a caller cannot pass NULL. The syscall takes NULL as no
timeout.

Pass NULL to the syscall when the caller passes NULL. The futex_waitv
tests use this in a later patch, to wait until they are woken.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/futex/include/futex2test.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
index 53e88b60ac6d..a4616b6edcff 100644
--- a/tools/testing/selftests/futex/include/futex2test.h
+++ b/tools/testing/selftests/futex/include/futex2test.h
@@ -68,12 +68,16 @@ struct futex32_numa {
 static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
 			      unsigned long flags, struct timespec *timo, clockid_t clockid)
 {
-		struct __kernel_timespec ts = {
-			.tv_sec = timo->tv_sec,
-			.tv_nsec = timo->tv_nsec,
-		};
+		struct __kernel_timespec ts, *tsp = NULL;
 
-		return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &ts, clockid);
+		/* No timeout: wait until woken. */
+		if (timo) {
+			ts.tv_sec = timo->tv_sec;
+			ts.tv_nsec = timo->tv_nsec;
+			tsp = &ts;
+		}
+
+		return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, tsp, clockid);
 }
 
 /*
-- 
2.47.3

