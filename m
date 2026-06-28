Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E7823D7E3
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658826; cv=none; b=F6ohKuwGND/Goo+FVeuhYgPXAYt2dbReKXZbB+s1pVRHht/FyKN6IWD5iFHnXXJhe0zsl5ahDZbABUopF5UWVcSwEDbMZER0Sd6tSuWmYRSAqCwkHMyhZoKf9f0cYET+xet1dy1WSd5WqenktCDahJWb3I1eE2btQaa5WDEFSlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658826; c=relaxed/simple;
	bh=i7XXYJUISkux6zfskNSs0ePDivkdnagx6hWslkGSXpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5sFM9Dc2PGqzMqPWDVeS1AzaGNlLELh8OfH3vo9pmofypy0ZQTWd9DIyvq+FcVVNI+qm24wVch5ZynwdqSroBji+8RzcdqzjW/BhgTyBT6OpgJOMJkClQSAntu8zfZdvlUsfIm4FhMZrnyBz6DOK3rk8k9aOa0e5S8vOUNoO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FOBNQ/v6; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FOBNQ/v6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782658812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aryTE8Mrk4B5WC0zqD7PdlOBCGGpjGZPOFEIHL9ser8=;
	b=FOBNQ/v6Z2m45SWi0iKeic8o+NapntBcIJA/U5puSk+tpY9pEDmScp7oCeKexMrZlp28PF
	9+SDizCxDuYj62JctdpPXusZN8sOWofXPHpPxUnzE4U76PRKx9fmFn3lGCcdhjktOgMgpd
	I4Gb2bu5OKMbCtpQIOu2RpdOouPMRLk=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: shuah@kernel.org,
	peterz@infradead.org,
	aniketgattani@google.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/membarrier: Add membarrier_rseq_stress binary to .gitignore
Date: Sun, 28 Jun 2026 22:59:51 +0800
Message-ID: <20260628145951.37022-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Tell git to ignore the generated binary for membarrier_rseq_stress.c.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 tools/testing/selftests/membarrier/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/membarrier/.gitignore b/tools/testing/selftests/membarrier/.gitignore
index f2fbba178601..031920478205 100644
--- a/tools/testing/selftests/membarrier/.gitignore
+++ b/tools/testing/selftests/membarrier/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 membarrier_test_multi_thread
 membarrier_test_single_thread
+membarrier_rseq_stress
-- 
2.53.0

