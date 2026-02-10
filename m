Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E53203BC;
	Tue, 10 Feb 2026 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741394; cv=none; b=f+bubNyLX/2qID97FIw40vNzdJXdCLE8sPjYv3uS+la0TB/DUQCKZTqyH2PgasvBlt8IzwrumX9JpqoRQwXv/t7M5HuWKygwMk6+YNL7c+mMPYh34cBd5e0XrFBTkl/1NB0bdlRy+g19eepoyOKjxP+peGsodK1Vwqvw1wgZzZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741394; c=relaxed/simple;
	bh=kH8up4x2qXh5qYwxKPcjYKankJXfqnKuAMLBmbTJGVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCwIhEyjQ6LXGgZl9zRkgAOzFAaWeoroDDKHrmIKT3pAtg/IHnaX0zpybNfxj1W9ucNIQfXHfXnSaKuPBBB5F0QwPNaNpO8ycDFDbc4BEX0umqAHbnMDbfzdZAKFLg0SXDso6YdjmO3XpN83vaW7hwKDFUfIDIsVRH+9tK4DNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy3nidyg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy3nidyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770741392; x=1802277392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kH8up4x2qXh5qYwxKPcjYKankJXfqnKuAMLBmbTJGVg=;
  b=Jy3nidygf0t9gdgnZtIOsP47aadx0NlKQ2VTpw4Ne0efk+I7NDksqCft
   MXlBC3bWG88+qND6tcHtGNSPjQdKtJfx0F/+q07fmw7nW+I0mNyD56Lfe
   MMnD2nILus/ObtyC+ER8ib2LCKPzGfAhNENmO/0D3WTiY+RPCGel56BjF
   cQk7QIVQZyYeDIgQaAI7b5clLyLzU2LNXX3SOTEsEzZQrU/Y5VDj/IK0Q
   Isei/k/E36jdh3+WsZfg+uh6wohWsoZvIUNHxoSTVrRRLfuGrfyrdxF+C
   lbeUZxeSvds5yOPzGib4ZmyEp0uYmqhLfrCfNcU2faKuqwqOkz9YrKDYT
   Q==;
X-CSE-ConnectionGUID: iQWkREixQ3i6d8BQzsizow==
X-CSE-MsgGUID: EsEWwTteRUO9LTlX3zm7Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="74476875"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74476875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:36:28 -0800
X-CSE-ConnectionGUID: NOIld8ofTJ+0evx5IeyRZQ==
X-CSE-MsgGUID: A0od80nmTva5r78fUeHwnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212003475"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:36:27 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	tony.luck@intel.com,
	peternewman@google.com,
	babu.moger@amd.com,
	ilpo.jarvinen@linux.intel.com
Cc: zide.chen@intel.com,
	dapeng1.mi@linux.intel.com,
	fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 8/8] selftests/resctrl: Reduce L2 impact on CAT test
Date: Tue, 10 Feb 2026 08:50:47 -0800
Message-ID: <cb76afac753fb1447b5ef1cbcccb692ffe29cdf2.1770406608.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1770406608.git.reinette.chatre@intel.com>
References: <cover.1770406608.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The L3 CAT test loads a buffer into cache that is proportional to the L3
size allocated for the workload and measures cache misses when accessing
the buffer as a test of L3 occupancy. When loading the buffer it can be
assumed that a portion of the buffer will be loaded into the L2 cache and
depending on cache design may not be present in L3. It is thus possible
for data to not be in L3 but also not trigger an L3 cache miss when
accessed.

Reduce impact of L2 on the L3 CAT test by, if L2 allocation is supported,
minimizing the portion of L2 that the workload can allocate into. This
encourages most of buffer to be loaded into L3 and support better
comparison between buffer size, cache portion, and cache misses when
accessing the buffer.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 6aac03147d41..26062684a9f4 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -157,6 +157,12 @@ static int cat_test(const struct resctrl_test *test,
 	if (ret)
 		goto reset_affinity;
 
+	if (!strcmp(test->resource, "L3") && resctrl_resource_exists("L2")) {
+		ret = write_schemata(param->ctrlgrp, "0x1", uparams->cpu, "L2");
+		if (ret)
+			goto reset_affinity;
+	}
+
 	perf_event_attr_initialize(&pea, PERF_COUNT_HW_CACHE_MISSES);
 	pe_fd = perf_open(&pea, bm_pid, uparams->cpu);
 	if (pe_fd < 0) {
-- 
2.50.1

