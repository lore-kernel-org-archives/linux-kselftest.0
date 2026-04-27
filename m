Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5694C282F18;
	Mon, 27 Apr 2026 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289100; cv=none; b=Dr01xrcpmwDx5nPp1X2veEsS6FhU89ZkE96xBFgeeRCTHte5HsCjtMY75lKcRZS37BxoyNLAlFk/IIULuHIYLA8oTEOvaXQUm3nWDDpm/pbeoXmgt+Q7SvioEyvQRuJhJd1ZSCjnTP7uQHqotflqbAYXurKRZu2f6O21b4fjMlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289100; c=relaxed/simple;
	bh=UpAn5JxGInmWvOx/t0uFzS0UW5xYrSpKdpA2YC40okQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnxtHONMG2h7MzS1YBxGcpvylpLmmqG/BSwcRVN4GhOpVsz/RGdc6iNNq4wNIA3wBu3X8aqnR1rFfVtohN7EmnBeiQFCisJpB4x8P5AkAbQadwiiHIbABAPWFnwBz8DRS2fHnkegECYUkWCrtBVk/wSFhRZhdeWf9/0I7D3W8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ccy/33Gp; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ccy/33Gp"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EF751684;
	Mon, 27 Apr 2026 04:24:52 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E37E83F763;
	Mon, 27 Apr 2026 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777289097; bh=UpAn5JxGInmWvOx/t0uFzS0UW5xYrSpKdpA2YC40okQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Ccy/33Gp/ZyVcHPhwLgcLT8SSqzFurqpMZcunerOj4h9iq16fKTXpC9KjYhQINVWG
	 PpZoTpino2K1Wl9rMsoFcuzi2xvRAvlf6VJ+/UP0T/+SrHnms6OYboekJrw+Es6hgI
	 5R82Q8beHhrIPi4S+Aq++NaZTdR2klL8fMNpVF1I=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: shuah@kernel.org
Cc: pbonzini@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH] selftests: kselftest: fix wrong test number in ksft_exit_skip
Date: Mon, 27 Apr 2026 16:54:47 +0530
Message-ID: <20260427112447.147985-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ksft_exit_skip() increments ksft_xskip before printing the KTAP
result. As a result, ksft_test_num() already includes the skipped
test.

Adding 1 to ksft_test_num() increments the printed test number
again, producing an incorrect test number and wrong KTAP output.

Drop the extra increment and print ksft_test_num() directly.

Fixes: b85d387c9b09 ("kselftest: fix TAP output for skipped tests")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/kselftest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index afbcf8412ae5..827b47cf4df8 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -449,7 +449,7 @@ static inline __noreturn __printf(1, 2) void ksft_exit_skip(const char *msg, ...
 	 */
 	if (ksft_plan || ksft_test_num()) {
 		ksft_cnt.ksft_xskip++;
-		printf("ok %u # SKIP ", 1 + ksft_test_num());
+		printf("ok %u # SKIP ", ksft_test_num());
 	} else {
 		printf("1..0 # SKIP ");
 	}
-- 
2.39.5

