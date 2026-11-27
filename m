Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805906;
	b=2fgElPC5zzQkZEArq5JSCIRjOZXlb9QgawE+gwl/E1SY1ZvR59P8bBE8xNNTkJYb+foL
	 /67H8krhr/ZpdNdWHFYhskosspSMPgZYKzC99tzjaz8A81lr7UpuhNA647xTLGVBubZEr
	 aViK+SRMSGxgFtF6/QdDEYubAyval2aNrimUBQY7kHRTRKSMqnl/JGuxF7RKu1chuH3yi
	 pT62PzNZ2gDPEOHm1AQPa2vXvZSN40LJ6OGDwobhzH2JN9s5JaNEVrtTr+fveQ4NyfouT
	 Fksl6vOn5nhY8LSBjnhocfqkxR7yzTc2/Nbr6M4LEiROBl2k87sZla3g3L1RkqFGLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805906;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IUEMjQyKvdg75ReLfe0GUIqEXU/84tt1/W6uEXFVIFk=;
	b=qUijGaICIJUEPBaSh8OD0IqVYHHbLfc7kja64Vx/xO8bfKRL/BnH4CHNZbwGvI9QJf/j
	 gG10K30jGJJeQeYyLtWRmstL7ZPKKo9eD4ZZCD+f3TcqDEad4N3jhEmb9buj20AzdJuxy
	 ERvH+LZK6WBYIrGVlLsdUIwBwX2xPA+Fa20p3+cpkzj7Zr7Y9tGnD2BaVmmLA8JatBqJM
	 s3dLBo3ACxUapaoW/iGflai7eKc2POUeWlhZGdxFvRXP+ak8zVb2tLXSbfRzf57sRvbwy
	 7qEeb4JP4O/sLojrRPw1U/uSC+OZNvnbHQ9IPRh1c6jwIO8bPGdFlULFs1qbQDrZ61Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b="g8+SvOq/";
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D37606A339;
	Fri, 27 Nov 2026 18:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D37606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=g8+SvOq/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795805904;
	bh=IUEMjQyKvdg75ReLfe0GUIqEXU/84tt1/W6uEXFVIFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8+SvOq/nczwR5r3Cak97lIEVYqs9JvHAGv6BeJn3/5jgrfV4H5WycezC4BDsYUG4
	 FYqoZ1NnmH7bewrFnaZxxi3zo4b3VWxAEkTx3I4B7AcHcgAJ39SHMZ4JHT25J3FTol
	 Rij1s7kESbfkvBQ8z1AKIyltCLpCLAyrF9DQ7ZT609hgWeYWfc320dsPPpRyVzwnwZ
	 sEkCSNGDnfWzlN5hzIvYjqQGctjGLgyMNfxieCH6v+taJMvpDRQoE6/kh1Ss+yJ0NR
	 3LgjQDae8MxJqC+C91Ayj2Hwq//2091AHaomce9gUYk4uUA5xCtPeDWGLePtgB0JHp
	 LPbFcA02LWb6Q==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbjNw1ncQzXCx;
	Fri, 27 Nov 2026 13:58:24 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Gellermann <christian.gellermann@codasip.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 05/16] selftests/membarrier: Run the tests on nohz_full kernels
Date: Fri, 27 Nov 2026 13:58:10 -0500
Message-ID: <20261127185822.158216-6-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
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

A nohz_full kernel does not provide MEMBARRIER_CMD_GLOBAL. The tests
skip everything when the query mask lacks this command. The other
commands are available on such a kernel and are never tested there.

Skip only the MEMBARRIER_CMD_GLOBAL test.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 .../selftests/membarrier/membarrier_test_impl.h        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index 4b9d1771916e..49f5fdb56dab 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -97,6 +97,13 @@ static int test_membarrier_global_success(void)
 	int cmd = MEMBARRIER_CMD_GLOBAL, flags = 0;
 	const char *test_name = "sys membarrier MEMBARRIER_CMD_GLOBAL";
 
+	/* A nohz_full kernel does not provide MEMBARRIER_CMD_GLOBAL. */
+	if (!(sys_membarrier(MEMBARRIER_CMD_QUERY, 0) & cmd)) {
+		ksft_test_result_skip("%s test: Command not available\n",
+				      test_name);
+		return 0;
+	}
+
 	if (sys_membarrier(cmd, flags) != 0) {
 		ksft_exit_fail_msg(
 			"%s test: flags = %d, errno = %d\n",
@@ -356,9 +363,6 @@ static int test_membarrier_query(void)
 		}
 		ksft_exit_fail_msg("sys_membarrier() failed\n");
 	}
-	if (!(ret & MEMBARRIER_CMD_GLOBAL))
-		ksft_exit_skip(
-			"sys_membarrier unsupported: CMD_GLOBAL not found.\n");
 
 	ksft_test_result_pass("sys_membarrier available\n");
 	return 0;
-- 
2.47.3

