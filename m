Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A152EC0A7;
	Wed,  4 Mar 2026 00:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583590; cv=none; b=shp6ZvgSWmq4VqK3FHUFwlWJGs8JJCd2XEg2iqSE1e2Zi1/grOjLF793WYt0sgXaGmldLyeWHz+ev7POVaedD/borLyV1rh55FczZLWIU66+WKMwuU9F/01jBBbAAbfnzJ71KYKenzImE1OtnQXGAJB3lMOTm7Asf7XKZF1zCn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583590; c=relaxed/simple;
	bh=aYBwxsXexDx1wpURXe2fS8HHTkWNax3PozdPsyGor0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oW2N7HBVQpzRBbh9l7MFLJYvKieIAze75LzaJnSMvS6JTFnmO2QuHfCJUn0fubamyVzX6pxYl0DWRaLMP2dTZaeBg7niRSSzThXV7QtpRhrRzZHafMoWc7Qq9Sk+iY7oma8jYy7s0DRx294uOvQdrbAELZA4VNmaRP8OMNDhgXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqMzfW+0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqMzfW+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772583589; x=1804119589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYBwxsXexDx1wpURXe2fS8HHTkWNax3PozdPsyGor0A=;
  b=YqMzfW+0T4G9fVXFginNKXfDlcJGxI33zbxZYz3tr1JethPBRazX32+A
   XCdGSWFL0BCwZLc13jrZGZK364AIGPu8ol3q2951gGPDUqEdjHrUVMSXD
   IWA/QG39Q7QqYwkiJHYHOduVUTAS5GUmiNvUWsQpE+OCjCfMDO1l5Yu9J
   WLtQbF293f1DbZOThctioIZ0XPjbrlyhxJuVcJBfiVJFnbjlwKA4iiaWQ
   v6bspD/PoMEXVAXksos+OKYJeV6pvamn5tJmpWvOTgGtBee56t35Z+A89
   7O40SqoN3rvxBrAKR8nkSIG1XT76JT6ay8EvHNnnd1oNA4vzsTN6zl40+
   A==;
X-CSE-ConnectionGUID: ykl9PHZlRuGptp1UZmaS1w==
X-CSE-MsgGUID: tGh0cTm3RACXsxFYdcWrRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73545029"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73545029"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 16:19:45 -0800
X-CSE-ConnectionGUID: B6q6jkzhSKGE+CeXyVUKlA==
X-CSE-MsgGUID: jPmpRjvbTx2VCLnSfzI3tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218120397"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 16:19:45 -0800
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
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 5/9] selftests/resctrl: Increase size of buffer used in MBM and MBA tests
Date: Tue,  3 Mar 2026 16:19:34 -0800
Message-ID: <e684ae7dfacb9c26ce59bf5d6f85b4f27cd387d0.1772582958.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1772582958.git.reinette.chatre@intel.com>
References: <cover.1772582958.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Errata for Sierra Forest [1] (SRF42) and Granite Rapids[2] (GNR12)
describe the problem that MBM on Intel RDT may overcount memory bandwidth
measurements. The resctrl tests compare memory bandwidth reported by iMC
PMU to that reported by MBM causing the tests to fail on these systems
depending on the settings of the platform related to the errata.

Since the resctrl tests need to run under various conditions it is not
possible to ensure system settings are such that MBM will not overcount.
It has been observed that the overcounting can be controlled via the
buffer size used in the MBM and MBA tests that rely on comparisons
between iMC PMU and MBM measurements.

Running the MBM test on affected platforms with different buffer sizes it
can be observed that the difference between iMC PMU and MBM counts reduce
as the buffer size increases. After increasing the buffer size to more
than 4X the differences between iMC PMU and MBM become insignificant.

Increase the buffer size used in MBM and MBA tests to 4X L3 size to reduce
possibility of tests failing due to difference in counts reported by iMC
PMU and MBM.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://edc.intel.com/content/www/us/en/design/products-and-solutions/processors-and-chipsets/sierra-forest/xeon-6700-series-processor-with-e-cores-specification-update/errata-details/ # [1]
Link: https://edc.intel.com/content/www/us/en/design/products-and-solutions/processors-and-chipsets/birch-stream/xeon-6900-6700-6500-series-processors-with-p-cores-specification-update/011US/errata-details/ # [2]
---
 tools/testing/selftests/resctrl/fill_buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 19a01a52dc1a..b9fa7968cd6e 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -139,6 +139,6 @@ ssize_t get_fill_buf_size(int cpu_no, const char *cache_type)
 	if (ret)
 		return ret;
 
-	return cache_total_size * 2 > MINIMUM_SPAN ?
-			cache_total_size * 2 : MINIMUM_SPAN;
+	return cache_total_size * 4 > MINIMUM_SPAN ?
+			cache_total_size * 4 : MINIMUM_SPAN;
 }
-- 
2.50.1

