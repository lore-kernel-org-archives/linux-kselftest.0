Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251A47FB10;
	Fri, 14 Aug 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727558; cv=none; b=HyTE4D9bs2I5KZdgfXIX1X40Jqx2oYSPBBOumY5oBF9mo3rvopf+YQZ9NHw1GJ6Tqc+kn+cU3udc3pbOZ/JUb6E2BKezqPqmX+B1fGoFm3vKohDs2zmy37ZQl4Tcl+4Dgod/Qr/gzGlkUCXvba6IUMoRckRtVIIrstdEhXq8PxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727558; c=relaxed/simple;
	bh=QMMDFYCW4z9wiG2r4mP6Fl9RTPJ2bhHxEPIY5LnjUZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uzRW9px2UuzG+M0rLPmhX2+NJg9ge8QyMsev5I3JcGUfaCgikXym+Pq9JiWGielodl/lw0/nl6mORue6Hcf0ZypDRhzrnBxhXtwHhIbpWBTx5SBatJnF37bfORBcPCXYmv8vUu50oiShISTRTGYX3KlQlJhIMh+xXM159Kipsos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=R9ZPkN8J; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="R9ZPkN8J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=FYE+Nu3QjlgtpAV1NHIeq8Rz6LPuuOKNGggN9nRPSZE=; b=R9ZPkN8J1zpl
	qPZ7UtL2W73BlZtuEiov204685GfHa5vw8AxUKTwiwOM9lcDeHMn0eDO8NkP9r1dOmI/Y6ariXnPe
	d932rI9DYtp2t2mrYvUYv255Xb97SOl05a63bFOwwlM/yExK0+1x3h485niUjpe1FKrCOYCQ5miym
	RFYzxnm4u//hpklDN0YTeJVEPmXsRiN1rBTNc541NfJBv9dwsWcwSrxssvSwyfu87dCU4Cot66rUA
	eXm+aG+agXg4hLwKMpRG/QUCTIQKQLm+XMkxPRX26puLBik3LHWlxv2733tP8Sr4UDWL2GOe4N8gP
	GjZnVGSYjJFmvRpE3OFl2g==;
Received: from [130.117.225.5] (helo=hci8VM.finist.virtuozzo.com)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1wuvBY-00BbTm-0y;
	Fri, 14 Aug 2026 18:57:08 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH] selftests/core: fix unshare_test with large fs.nr_open
Date: Fri, 14 Aug 2026 18:57:09 +0200
Message-ID: <20260814165709.513263-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test assumes fs.nr_open is close to the default 1048576, but some
systems set it much higher (e.g. 1073741816). This is systemd's doing:
since systemd v240 (2018), PID 1 bumps fs.nr_open and fs.file-max to
their largest possible values on boot, as file descriptors are already
accounted for by memcg [1].

In that case, dup2() to nr_open + 64 requires the kernel to allocate a
file descriptor table with ~1 billion entries, which fails with ENOMEM.

Cap the nr_open value used for the test's own arithmetic to a known
reasonable base value (1048576) and restore the true original value
once the test has completed.

[1] https://github.com/systemd/systemd/commit/a8b627aaed409a15260c25988970c795bf963812
    ("main: bump fs.nr_open + fs.max-file to their largest possible values")

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/core/unshare_test.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/core/unshare_test.c b/tools/testing/selftests/core/unshare_test.c
index ffce75a6c228..d40e963dd520 100644
--- a/tools/testing/selftests/core/unshare_test.c
+++ b/tools/testing/selftests/core/unshare_test.c
@@ -40,6 +40,14 @@ TEST(unshare_EMFILE)
 
 	ASSERT_EQ(sscanf(buf, "%d", &nr_open), 1);
 
+	/*
+	 * Cap nr_open for the duration of the test to avoid ENOMEM from a
+	 * huge fd table allocation; buf/n keep the real original value so
+	 * fs.nr_open can be restored to it once the test is done.
+	 */
+	if (nr_open > 1024 * 1024)
+		nr_open = 1024 * 1024;
+
 	ASSERT_EQ(0, getrlimit(RLIMIT_NOFILE, &rlimit));
 
 	/* bump fs.nr_open */
@@ -73,10 +81,13 @@ TEST(unshare_EMFILE)
 
 	if (pid == 0) {
 		int err;
+		char buf3[32];
+		ssize_t n3;
 
-		/* restore fs.nr_open */
+		/* restore fs.nr_open to the (possibly capped) test baseline */
+		n3 = sprintf(buf3, "%d\n", nr_open);
 		lseek(fd, 0, SEEK_SET);
-		write(fd, buf, n);
+		write(fd, buf3, n3);
 		/* ... and now unshare(CLONE_FILES) must fail with EMFILE */
 		err = unshare(CLONE_FILES);
 		EXPECT_EQ(err, -1)
@@ -89,6 +100,10 @@ TEST(unshare_EMFILE)
 	EXPECT_EQ(waitpid(pid, &status, 0), pid);
 	EXPECT_EQ(true, WIFEXITED(status));
 	EXPECT_EQ(0, WEXITSTATUS(status));
+
+	/* restore the real fs.nr_open value */
+	lseek(fd, 0, SEEK_SET);
+	write(fd, buf, n);
 }
 
 TEST_HARNESS_MAIN
-- 
2.47.1

