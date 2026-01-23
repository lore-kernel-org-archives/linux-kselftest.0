Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F12EAB6B;
	Fri, 23 Jan 2026 04:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769142938; cv=none; b=kEHohP8vsP4m/3RwL9rfK1NKOu4G4kfzaYBrKKf95Z90J8hxYztCObxkCiGdjCHPfYNG5Bv0XAagfmUUJmJttPutq6SI59emn4HenZfszlKv4Ze/CQVzixVh5hn7eqHcZ+L0Kh/6kD5h8Vu+ukhUScg3g7/4uIwdN010vquRQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769142938; c=relaxed/simple;
	bh=jSzi3osQGXYel0AVxMTyFvIA70HNOFE1gzNweLFqOzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJ4PLgnAR3KLCV34Dl8kFMC4F2j3MYapO3OKggSRwCrTfRGjGa9oP8XjUFaPMkeYODgki+qHs2wTb1NTGDmTbnP+SAzGgITnm3kglUH4l3N8u27bh6yjaCInqIcx4hn6lpwOBp/rhlawTLubR74LazOHUdvrGviSJTdAqNN6o+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=F+YUpDx2; arc=none smtp.client-ip=139.138.36.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="F+YUpDx2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142931; x=1800678931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSzi3osQGXYel0AVxMTyFvIA70HNOFE1gzNweLFqOzo=;
  b=F+YUpDx2W1w1pKH0NCxDjYN6WRPHsqFlAfDRN9er8AF0wjBmCR9Es64W
   goluDsO/L+PA43nYvIXXTTkf63+p1s0Q86NhQBcJfQShqTMx3dENXPaK3
   6i2vZk7+NUDGJSVyKzpgmZ6mrQGln0TrFAmo//k2artwvgPPJhOdM0eQT
   X5mnAgKh/QW0h+yn1SRPm4Vc1FmUb8gPlH2JJFU8XZnnEAF0ErkPIB7/N
   II0cflWYdRqpVJcG/Yk3q76F7+0ME1pfZc1IfNBgPsitflK9JPuiNU5VG
   +qfnxZTiG0yG5xBrK6GRUgfVjrCi00jUA0ClKA+pPb1TYaGLTicYkFzRU
   w==;
X-CSE-ConnectionGUID: 7V8KAKm3TWSQUYEn4pW/7w==
X-CSE-MsgGUID: pceR4MIVSbGf8o1z8OdaGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="215388599"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="215388599"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:21 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9E7A51C0169E;
	Fri, 23 Jan 2026 04:35:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 57933C06D7E;
	Fri, 23 Jan 2026 04:35:22 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2EB7C1001523;
	Fri, 23 Jan 2026 04:35:17 +0000 (UTC)
From: Shaopeng Tan <tan.shaopeng@fujitsu.com>
To: fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tan.shaopeng@fujitsu.com
Subject: [RFC PATCH 5/5] kselftests/resctrl: Add support for CAT test on ARM
Date: Fri, 23 Jan 2026 13:40:31 +0900
Message-ID: <20260123044034.141247-6-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, CAT test is limited to Intel architectures.
Add cache cleaning and enable result checking for Arm architectures.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 2 +-
 tools/testing/selftests/resctrl/fill_buf.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index e1b30ab4cef5..58b1590695d1 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -113,7 +113,7 @@ static int check_results(struct resctrl_val_param *param, const char *cache_type
 		ret = show_results_info(sum_llc_perf_miss, bits,
 					alloc_size / 64,
 					MIN_DIFF_PERCENT_PER_BIT * (bits - 1),
-					runs, get_vendor() == ARCH_INTEL,
+					runs, (get_vendor() == ARCH_INTEL || get_vendor() == ARCH_ARM),
 					&prev_avg_llc_val);
 		if (ret)
 			fail = 1;
diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 19a01a52dc1a..dbbf80d22f42 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -35,6 +35,10 @@ static void cl_flush(void *p)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("clflush (%0)\n\t"
 		     : : "r"(p) : "memory");
+#elif defined(__aarch64__)
+	__asm__ __volatile__("dc civac, %0\n\t"
+		     : : "r" (p) : "memory");
+
 #endif
 }
 
-- 
2.47.3

