Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC596383C9E;
	Sat, 23 May 2026 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531990; cv=none; b=dj/dkTwiRT6/sxyKIjxwEUKVASnYBEuTFdVA5g1Ntz9UEkz/TvxMzAAKSIG7TBc2pHzw96OduM79EsgY/M/kFuccZH9bwiYk4BdY8vl5fCkHMQEMJ83N1i47A2ojMrVh4VfK66KjdSBKn7Y87yZVLAOuQ1qsFzarCzjQOkAirKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531990; c=relaxed/simple;
	bh=BzHefG7rr33yy6nquqfF6P+UyfN2CHmgpf9L5I7QVGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d4n5WFGrFEvJkk4g15deuldo5wDlid/IX8Qd7CgTGuUaQPZEfqOObFDynjI19frsc/IlsEYXKQVCeTrHmOCPTA1yu/DUdx5z8gCa/sKBB/IjU1QjY5ZYFNzSYTAuUmjD8xdSXRjobqD4G5b0M+43JBA2BvKH9lPfKqFXVWvOFsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wvwp6GW9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wvwp6GW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779531986; x=1811067986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BzHefG7rr33yy6nquqfF6P+UyfN2CHmgpf9L5I7QVGI=;
  b=Wvwp6GW9zhQcMI8suJDspn9i9tFzT1t3Ji9kSNvVPjm+oHL0pmKIeNd7
   sk8gNkiB0x2Qi2x6OU2mYpqJTcpwksFDBwqYLyPp8kFdwRXUHVVzHajln
   S4pV9mCGsj/zU+NSoqzbYUNEyoxqgj0hVhFctQQkU1xqa7MQR8/FnF6Ix
   NynGCci6SAZ/R+mlxE1Y9r443FowGZ9104QwvXKab1xLvrNMRWkq+yfyW
   NXweiBzFEeN+MvrPRhHS7JYcxvdVuxiapyo91IpdepjWOuhFOODdiNb/d
   l4WuYwv3310XQpteSzxgj/TELDnCRHx5gCXJClbOpvUGp4y06BbIrwPCT
   Q==;
X-CSE-ConnectionGUID: wWR+IwEDT4SVWygqIzK1Qw==
X-CSE-MsgGUID: pr8QRdjaRZ+N7voxRix4gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80410331"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80410331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 03:26:26 -0700
X-CSE-ConnectionGUID: +1cy6XeURPGdMViGu+nzLA==
X-CSE-MsgGUID: bUwKubthQzyoNmRpJ1mysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245425647"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 03:26:24 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>
Cc: x86@kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: [PATCH] selftests/resctrl: Allow CAT testing when no exclusive cache exists
Date: Sat, 23 May 2026 18:17:15 +0800
Message-Id: <20260523101715.3964456-1-yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shareable_bits indicates which cache portions might be shared with
other agents (e.g., GPU, other I/O devices). On some platforms, all L3
cache ways are marked as potentially shared.

The L3_CAT test should fall back to using the full CBM mask when no
exclusive portion exists, since the test logic (writing different
schemata and measuring cache misses) still works. The shareable mask
is a hint about potential interference, not a hard exclusion.

Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index f00b622c1460..b6994ba4504b 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -248,7 +248,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
 	/* Get the largest contiguous exclusive portion of the cache */
 	ret = get_mask_no_shareable(test->resource, &long_mask);
 	if (ret)
-		return ret;
+		long_mask = full_cache_mask;
 
 	/* Get L3/L2 cache size */
 	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
-- 
2.25.1

