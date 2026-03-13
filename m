Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D5374E57;
	Fri, 13 Mar 2026 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433986; cv=none; b=QKUkjFHx6fLUAg7c3LQ6npa+bBc8FB48c4tv+qVzn0RamGTiLuJ977wPBff1j1rtSgLrf9meFDifkzR0971aqDZfkAeqQVrz6oDH5qGw66F3krmpeNpcW3Y6zTGILnv4v2Yhwq+yHmP+wJLIlUMC058CklJWeHaIJek7X6TLmos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433986; c=relaxed/simple;
	bh=2D1jGTPCH4a1Z7vhqzVpwmCENBPnUn+PfbsVlqLp23c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPdXIZil4tbgoEy9rtycY1xSrsBndkvuj5j6u397FwmRsNbUX73iFZls4SNDJ0JYqvPI7jK9Ct/7abjhZI08kiTu+dqpnH/koT1GgmoCVYj7Ss6DH62RpgWJRtS5LbXOllfuy/lpcDRx91kKSLVaQZigyQVTED0LHvGBdJaRaeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLYvw7Cv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLYvw7Cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773433983; x=1804969983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2D1jGTPCH4a1Z7vhqzVpwmCENBPnUn+PfbsVlqLp23c=;
  b=bLYvw7CvI+ej38zd44wheHqskYT+s6sRviLspVeFIQBvni6FUxQEovpG
   jKpgjEV1Cydz9w4aPhtverMBe2TJLB5Kg/NtMDaVjnV/4n9HbuVkov7at
   Kcvd+m/bc6NvbddQ5170cb9AEDXZRb6qM+78CoIEouS1TVSWFfzZAaLjc
   AvXFNannW+uhbbf2iffyzHU+VZomvu6Lu1WFxPDxd6jo1z8ud0FVzo/JR
   Y447ikWoMxW8Uj/kjnF/uYllBDOtrcE5AZ/WEFJcHizqvwuMPXeeAQpsh
   fdrbiJNgFCbQrbp9Fo5PGW9dsb3OomnrDD7dbBd5QaRU3w0yQE+gepoQf
   g==;
X-CSE-ConnectionGUID: 9sHNWcFlSmqrX6lz+woghA==
X-CSE-MsgGUID: ttirlQdUTQ+o94WCACx9kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74519319"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74519319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:56 -0700
X-CSE-ConnectionGUID: YQ8S024OTbeSSaBLLMi4Gw==
X-CSE-MsgGUID: Omyv3AS3QJKPHtV9ZbPDYg==
X-ExtLoop1: 1
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:55 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	tony.luck@intel.com,
	babu.moger@amd.com,
	ilpo.jarvinen@linux.intel.com
Cc: fenghuay@nvidia.com,
	peternewman@google.com,
	zide.chen@intel.com,
	dapeng1.mi@linux.intel.com,
	ben.horgan@arm.com,
	yu.c.chen@intel.com,
	jason.zeng@intel.com,
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v3 10/10] selftests/resctrl: Reduce L2 impact on CAT test
Date: Fri, 13 Mar 2026 13:32:37 -0700
Message-ID: <d4e13dec81de69c7ab08638d3f928b7d4ee2b1ac.1773432891.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773432891.git.reinette.chatre@intel.com>
References: <cover.1773432891.git.reinette.chatre@intel.com>
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
Tested-by: Chen Yu <yu.c.chen@intel.com>
---
Changes since v2:
- Add Chen Yu's tag.
---
 tools/testing/selftests/resctrl/cat_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 6aac03147d41..371a2f26dc47 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -157,6 +157,10 @@ static int cat_test(const struct resctrl_test *test,
 	if (ret)
 		goto reset_affinity;
 
+	ret = minimize_l2_occupancy(test, uparams, param);
+	if (ret)
+		goto reset_affinity;
+
 	perf_event_attr_initialize(&pea, PERF_COUNT_HW_CACHE_MISSES);
 	pe_fd = perf_open(&pea, bm_pid, uparams->cpu);
 	if (pe_fd < 0) {
-- 
2.50.1

