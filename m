Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397A2F39C7;
	Sat,  4 Apr 2026 01:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267814; cv=none; b=pSZn3ediOnT5OAtAJASUs62DijVMWovvpQZ+2iXTFyY+fH8KhsmihUrV4qBZY02axUxr30RKRrqCTAh1RKbBAH9jYsVjPL8NVXnEDhBrZJcRKhFtLotNMtH+TYEH4jM5Greakl/9nXu4b6RJn1IcN3LgrBAmFQlCcwivuBWbQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267814; c=relaxed/simple;
	bh=TMYWBwczQQyNXGbZEwr5vrsjgD4HeYYTjcWXQ5+Sv5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqUkaXp9bmwTfk79V/ihwuPPNCFKXgOiZn9Buhhi4wRndtMG1EfYiR18bcb0z3DLdTMmtjdPeyqNqH6txdfvPVo6LA8F6vm5ztPA8woxLpRGKTmcxy0GEWgPndZll11q0Zl8OWutT9LY4aTf8/+t5M38vjMeP9lI1pQjza/fscY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M91mt9b4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M91mt9b4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775267813; x=1806803813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMYWBwczQQyNXGbZEwr5vrsjgD4HeYYTjcWXQ5+Sv5s=;
  b=M91mt9b4XTuciLk7sXnugfHU+3EdRBtmICQG7etDXqOu0X4OmA9Ux/GK
   9Zf9tuWr77B1/1XiT4HVej3N0XyMH77ysapGdCwS6mZleulsr/K5yqyJP
   1LU/DAVlNrClepDq9WdwIjHdF0FDrR1RHPkFBM7JyQNqbwN5eCaNbx7XC
   /yijX4lkdHgP7eeuOqD2dRjVq9/YLeQoU7XZ4vOAj5BJlqpOaLJ0ewtnA
   BRp2REYQWuFjXTRhWCNzk3TavbauW8XePKiP1miJeGj63B42NDeffI94Y
   AeLjFWY/LcnCJ7D/TGemjivta+fTBIw8msd/ReXtwILNwvyVMkwOmgQNA
   w==;
X-CSE-ConnectionGUID: ZI47sMo2TN2k67pnpxoebg==
X-CSE-MsgGUID: XMd9O2DyTLWLDwIGK1CzlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76343419"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="76343419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:56:45 -0700
X-CSE-ConnectionGUID: VWRYRkZaT8+CPdTF+Y0Raw==
X-CSE-MsgGUID: TdQQh+obTtOK4eAOI9UkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="224121550"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:56:20 -0700
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
Subject: [PATCH v4 10/10] selftests/resctrl: Reduce L2 impact on CAT test
Date: Fri,  3 Apr 2026 18:56:09 -0700
Message-ID: <1f5aad318889cd6d4f9a8d8b0fbe83e3848d41a9.1775266384.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1775266384.git.reinette.chatre@intel.com>
References: <cover.1775266384.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v2:
- Add Chen Yu's tag.

Changes since v3:
- Add Ilpo's RB tag.
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

