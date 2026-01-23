Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0D3921CD;
	Fri, 23 Jan 2026 04:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769142994; cv=none; b=ppotZ+CeLKJuLc6ytqHcMdb0MCOu4kH5EzTypatq5wOFp4d85nTuQFBw2jMYTmBOQJwRf+fPhsHMCQkaysgaOIyOFA05/cFAqqMLz3b0B4V7ULcLJXWzKK3VW2ame6x42q29b7P3hDNvwO3rm0p+M+G82nLzGqSpiLqyVDY+vdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769142994; c=relaxed/simple;
	bh=AzrEWpdPn2lbCETjVwdiRVnFETmfw9lnNXNoG37WWGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC4W9r0u0XtQ3YD9RCiW52+/BlBnvHNPJPQiiGW6T9VX6X3TKNeWAl5GJTkRLJ0fTjekFi7QZrHdAIi2quULvQbXQwU7ZPeZ2WCfzdtbblTxmtv6dXwF/263+9e4fIebleV52ctnq+1GX1EXD1z+dqG4Ia1mz7NfvJqNXsWOq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=NfuVTCSm; arc=none smtp.client-ip=139.138.61.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="NfuVTCSm"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142988; x=1800678988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AzrEWpdPn2lbCETjVwdiRVnFETmfw9lnNXNoG37WWGs=;
  b=NfuVTCSmp+7mlVY4NXUUySFzuBB+ddKCFSzljzWX3E54cuH1vyOWUdoy
   iTFaQFUTNYTGm4VZZ20Pjjm82+jIDmNziMO2B0waMi3sRQ5nDRHbYBO6p
   7jSsodL0i8ZZVOi0AI7lPSY/zipLa5crxKg4utuzhA7YDpjYDtv+9N1bO
   sI9G5N8VwyaXsSvsTQB3iaHLSFouRfMmIHWj7rKIshAxqlQBlcY7owKhG
   VEHMWx3l5avZo295pGErG6kTGGrpQpClPWrFtzVajYwq/9AmQUEjsgLnN
   vXBRUu+QmRgh6mohW4PowcQDqWmY9/7AnpKK+jQEv6FAdCFYjiLT4y/Lp
   Q==;
X-CSE-ConnectionGUID: 5e/BlqRATjKSlJ1VDFxjfQ==
X-CSE-MsgGUID: vF2DjzW6ToiDb7jE35NGRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="214737196"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="214737196"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:14 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 206B41C001A4;
	Fri, 23 Jan 2026 04:35:16 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C43AA1C135EC;
	Fri, 23 Jan 2026 04:35:15 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9F5A71001525;
	Fri, 23 Jan 2026 04:35:11 +0000 (UTC)
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
Subject: [RFC PATCH 3/5] kselftests/resctrl: remove unnecessary exclude_idle
Date: Fri, 23 Jan 2026 13:40:29 +0900
Message-ID: <20260123044034.141247-4-tan.shaopeng@fujitsu.com>
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

The Linux manual states regarding exclude_idle: "While you can currently
enable this for any event type, it is ignored for all but software events."
Also, it appears exclude_idle is not supported on Arm.
Therefore, remove it.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/cache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cache.c b/tools/testing/selftests/resctrl/cache.c
index 1ff1104e6575..9a4a6c52b14c 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -13,7 +13,6 @@ void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
 	pea->read_format = PERF_FORMAT_GROUP;
 	pea->exclude_kernel = 1;
 	pea->exclude_hv = 1;
-	pea->exclude_idle = 1;
 	pea->exclude_callchain_kernel = 1;
 	pea->inherit = 1;
 	pea->exclude_guest = 1;
-- 
2.47.3

