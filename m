Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482CA37D13D;
	Fri, 23 Jan 2026 04:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769143000; cv=none; b=PD9VEJMiwpgkVQhSNuS0UE3EgQtzizc+fU6bHQoUJR8ZsFdzyqwcsFvFhhd73EP6j8KVMSnxmyNE2bXG+ctlG7ucOb/DPltHfg2jDdZ159LXLqCfByjxqpadqcmnNXfL1qG/J2Ap/9We3KMLwnjEecxwa5X+ADqOFC1dBsbZ66E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769143000; c=relaxed/simple;
	bh=1gu0totriDn1ozYhHhCpCH4EjVldmns4h+Ibq/ykI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqI3Gap7KfmD5cgl0Svz6J0P841iYjPdnUQGuEDjrL7s5esx1w46wu7oHitTl0CUxFczcUM2aisudiBnWLxICWfV5JLTioP6rJi4RNIu/XDZy/5LcotX/doJVc3M2AQ1oUVnyDYQ2fOmlr7DHnxswduJXAQQhtJHtrMYYT4zeOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=iEVCehe6; arc=none smtp.client-ip=139.138.36.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="iEVCehe6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142994; x=1800678994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1gu0totriDn1ozYhHhCpCH4EjVldmns4h+Ibq/ykI7s=;
  b=iEVCehe6vuAGV/7Ova5DNUzM77HEQp1nfexEjQtORc8d3/Q1da+8stTk
   NlENNbZonk3vwdjc496o4yd2xpNYrfL/KqOuPxibgxrhxWS+9RGb5pett
   iezyjCd/aqzuJoONP7pULYzpZEoUm+AUvFimwAiHvs65yK4x9hto4fsbh
   GtdWCISdl822f/Bw0/uiHnF08B1SS86oieFGTinSW/Shkj1A3DcN9p/a7
   AiLUCZedEhpi6c8/Do6pq3Cddkn1luKJn9ijN6Nap5Hns3hyTB4e+c6yL
   /IrWc9Scjudnn1ziUNL5f8hnSjVZD44KdBSjB8jyeXnDCkYKgQlGxi/0C
   Q==;
X-CSE-ConnectionGUID: TgRRNy1PT/q32hRvQIvsqg==
X-CSE-MsgGUID: B13Ua1ZwS+KxNgmCtO3OlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="214223065"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="214223065"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 63DE31C0169E;
	Fri, 23 Jan 2026 04:35:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1DCD2C060BB;
	Fri, 23 Jan 2026 04:35:19 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E280F1001536;
	Fri, 23 Jan 2026 04:35:14 +0000 (UTC)
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
Subject: [RFC PATCH 4/5] kselftests/resctrl: set shareable_mask to zero if all bits are shared between software and hardware
Date: Fri, 23 Jan 2026 13:40:30 +0900
Message-ID: <20260123044034.141247-5-tan.shaopeng@fujitsu.com>
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

When all bits are shared between software and hardware, CAT test can not run.

In the case of MPAM driver, even if all bits are shared between
hardware and software, they can be used as if software-exclusive.

To enable CAT, if all bits are shared between hardware and software,
set shareable_mask to zero.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/resctrlfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 195f04c4d158..4b9ee803a112 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -495,6 +495,8 @@ int get_mask_no_shareable(const char *cache_type, unsigned long *mask)
 		return -1;
 	if (get_shareable_mask(cache_type, &shareable_mask) < 0)
 		return -1;
+	if (full_mask == shareable_mask)
+		shareable_mask = 0;
 
 	len = count_contiguous_bits(full_mask & ~shareable_mask, &start);
 	if (!len)
-- 
2.47.3

