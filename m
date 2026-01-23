Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA93816F9;
	Fri, 23 Jan 2026 04:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769142987; cv=none; b=Zr7C2rU34+7+YuV+D4i6PB7TUKzt6ORiigePcabPiYy+bDn3TKcjVvAkpbBGMx6WzfV2zFSkSaDtqjJmhitI7chbx0CIdmkRebqhbgJ+zrrSvc12xTk74cmA+U+8E2HOmcrN+CmSinx3Z4wmR6pZio/HqPqUzjA/YOG0BKA84pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769142987; c=relaxed/simple;
	bh=E20KvvUHj07LhgVAFxu8+QqX2a/r8ZIupvRwxelIVQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfRqDVmfnjHJGTqJ2mCCrGrVf5P9WNWv7aDDIs3FPHKtZTlk9UCJyiyoMiFnGGBzLcRvda94athZgcMNh5g+Vo4ydTkmPswNlu+i7CexmV8ojE05/p8lRZuGAPUinpMI/cRuJZ6hvqlctBFZhCF8+OcNomNIVwWyTZIE//gr3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=ICktuVmP; arc=none smtp.client-ip=68.232.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="ICktuVmP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142983; x=1800678983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E20KvvUHj07LhgVAFxu8+QqX2a/r8ZIupvRwxelIVQU=;
  b=ICktuVmP2t1Mj7PnUUhJ3n1U9S3wQCcBRjYpByQ+A6asxmWlQsgz+D9X
   hAhpttJxLD43lxt4+re1604zhYnVP1AG3rcyY9r9wgUt+LEjOjYFKI2o+
   sSMT6iwmXy6jgIgy3/wYdaxTNhNXP3FPG3qdcyPLLFxGkbOlUBHdtRP4S
   IxtBv2DYVN2ZGDg4QKYOSmUuzmoHhBa7vVCWEuj3jEBYJSXr188fXXEHM
   a5o1kpkuLq4eDTQlISuh655neqr9c6ftLZytUYoSlHPVaqElLXr20Bgxe
   d22NItTlX9USSU4YsaHu+kzmDYow/LJHH689WGovXjONshNajlrBct+rL
   Q==;
X-CSE-ConnectionGUID: iX13rB0yQmyeXmVLCAWMTw==
X-CSE-MsgGUID: xkvYfC+WTdKwGofD5JO3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="227432469"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="227432469"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D4576820C28;
	Fri, 23 Jan 2026 04:35:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8E2BA926755;
	Fri, 23 Jan 2026 04:35:12 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6188E1001536;
	Fri, 23 Jan 2026 04:35:08 +0000 (UTC)
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
Subject: [RFC PATCH 2/5] kselftests/resctrl: enable noncont_cat for MPAM
Date: Fri, 23 Jan 2026 13:40:28 +0900
Message-ID: <20260123044034.141247-3-tan.shaopeng@fujitsu.com>
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

Arm(MPAM driver) also supports non-contiguous CBM.
So enable noncont_cat for Arm.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 94cfdba5308d..e1b30ab4cef5 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -291,7 +291,8 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
 static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	/* AMD always supports non-contiguous CBM. */
-	if (get_vendor() == ARCH_AMD)
+	/* ARM(MPAM driver) also supports non-contiguous CBM. */
+	if (get_vendor() == ARCH_AMD || get_vendor() == ARCH_ARM)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
-- 
2.47.3

