Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97DE358D10;
	Fri, 23 Jan 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769142923; cv=none; b=P9n0eciIgu5v6OMyyU+f1GHEP8RiFSoTldFbC+xhVU9p68f9SlEkxWPg8Xp7u6zh2m59DM5aB/lTddDhaBRBmH5xtXgrEVnfaQYARISW3B9mBoeK7jq8hRz/1wYZdEa3XifTjp4EIN48OAenHOXFY9waoMmn9zUp1MBz302HnE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769142923; c=relaxed/simple;
	bh=HXA+JXoJiYDtSq22sCzHR5KuBoCaYpCtJcY+LeEPl/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHOZ8F3W7JP14XvqNVF8DLEX5pedbMtDNEAWn8AfqFnVxHRkOZjomA3QhmILdnVjEZbUurTdcnDK/40dyL20OYvXJg7dJREpH5ziF9uRsouEbW5TMJlwDu/2+1KtIUjcKOGV0p6Kf+0KWzxziwWwkHLbx0g9uMVb+k5NCDTORAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Ml8LhM0O; arc=none smtp.client-ip=139.138.61.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Ml8LhM0O"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142918; x=1800678918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HXA+JXoJiYDtSq22sCzHR5KuBoCaYpCtJcY+LeEPl/Q=;
  b=Ml8LhM0OubWWQAUTY3siksvJREHUhNymocxt6gxJR5SzyP2MTqF0LCSd
   iK6IRu1DTaety79rE66U2J7LjtJaRlc20Tn7i96cKuM0IjOzfro3ldPgO
   c2L61td+oSbH/DBWWiChm2hbGp/wQXyUkSZK3Q+KS80yOCW6Tx1weusHV
   dfnoZoKZTvKJUhWpg5HqdbgTzyJn8OBDb77FrfmJvmXdnsIWj3SdE6R1+
   sOQTz8CRDYqq0Vf8vzqkDjtG+pOkEtwEW6c5c4n/Qh/6885+JkZFeFNxY
   +uVcPNalxWBts8uwSy9e9MkxzPoktMnPvCBJzupilkqhqKr5jGiAe6vpZ
   Q==;
X-CSE-ConnectionGUID: 0sEyO8iKSZO3teUzg8AERA==
X-CSE-MsgGUID: 2uA/ai7+QruRkhaUczJAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="205621446"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="205621446"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:05 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E0054100036F;
	Fri, 23 Jan 2026 04:35:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 94D841009E0C;
	Fri, 23 Jan 2026 04:35:05 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7B6221001521;
	Fri, 23 Jan 2026 04:35:01 +0000 (UTC)
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
Subject: [RFC PATCH 0/5] kselftest/resctrl: Enable CAT and NONCONT_CAT tests on ARM 
Date: Fri, 23 Jan 2026 13:40:26 +0900
Message-ID: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Fenghua, Reinette, Ben, James, and to whom it may concern,

The MPAM driver is nearing upstream merge,
but resctrl_test doesn't work on the Arm architecture.
I'm actively working on a series to support CAT/NONCONT_CAT tests for the Arm. 
(Support for MBM/MBA tests will be considered in the future.)

While I've modified the resctrl_test code to enable CAT on Arm,
CAT test is failing in the NVIDIA Grace environment. 
(I don't have any other environments.)
Am I misunderstanding the CAT tests, or is there something specific
about Grace that I'm overlooking? Any advice would be greatly appreciated.

First of all,
when running CAT on Grace, I observed that cache limiting is working as expected.
I verified this by checking "sudo cat /sys/fs/resctrl/c1/mon_data/mon_L3_*/llc_occupancy".
Furthermore, I noticed that benchmark execution times varied directly with the limited cache size.

I reused the existing Intel CAT test methodology,
that involves collecting cache miss counts via perf_event during a benchmark task and then
verifying a correlation between the cache limit value and these miss counts.
https://lore.kernel.org/lkml/20231215150515.36983-23-ilpo.jarvinen@linux.intel.com/#r

I'm aware that the specific cache miss numbers and CAT's impact can
differ significantly depending on the microarchitecture or SoC.
For Arm, we need to establish an appropriate minimum difference in LLC
misses between a test with n+1 bits CBM to the test with n bits.

However, my experiments with Grace showed that even when I significantly
varied the cache span size, the average LLC miss counts remained nearly unchanged.

Detailed test results as follows:

# # Starting L3_CAT test ...
# # Mounting resctrl to "/sys/fs/resctrl"
# # Cache size :119537664
# # Writing benchmark parameters to resctrl FS
# # Write schema "L3:1=fc0" to resctrl FS
# # Write schema "L3:1=3f" to resctrl FS
# # Write schema "L3:1=fe0" to resctrl FS
# # Write schema "L3:1=1f" to resctrl FS
# # Write schema "L3:1=ff0" to resctrl FS
# # Write schema "L3:1=f" to resctrl FS
# # Write schema "L3:1=ff8" to resctrl FS
# # Write schema "L3:1=7" to resctrl FS
# # Write schema "L3:1=ffc" to resctrl FS
# # Write schema "L3:1=3" to resctrl FS
# # Write schema "L3:1=ffe" to resctrl FS
# # Write schema "L3:1=1" to resctrl FS
# # Checking for pass/fail
# # Number of bits: 6
# # Average LLC val: 1609252
# # Cache span (lines): 933888
# # Fail: Check cache miss rate changed more than 4.0%
# # Percent diff=-0.0
# # Number of bits: 5
# # Average LLC val: 1609038
# # Cache span (lines): 778240
# # Fail: Check cache miss rate changed more than 3.0%
# # Percent diff=0.7
# # Number of bits: 4
# # Average LLC val: 1620802
# # Cache span (lines): 622592
# # Fail: Check cache miss rate changed more than 2.0%
# # Percent diff=1.1
# # Number of bits: 3
# # Average LLC val: 1639214
# # Cache span (lines): 466944
# # Fail: Check cache miss rate changed more than 1.0%
# # Percent diff=0.9
# # Number of bits: 2
# # Average LLC val: 1653470
# # Cache span (lines): 311296
# # Pass: Check cache miss rate changed more than 0.0%
# # Percent diff=1.0
# # Number of bits: 1
# # Average LLC val: 1669618
# # Cache span (lines): 155648
# not ok 4 L3_CAT: test

Additionally, even with a fixed alloc buffer size(span = 119537664),
the Average LLC value remains nearly unchanged regardless of the limited cache size.
Furthermore, it appears that ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL is
mapped to PERF_COUNT_HW_CACHE_MISSES in "./drivers/perf/arm_pmuv3.c",
to counteract this, I attempted to use the perf_event measurement event
to ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD,
ARMV8_PMUV3_PERFCTR_L3D_CACHE_REFILL,
and ARMV8_PMUV3_PERFCTR_L3D_CACHE_LMISS_RD,
however, the Average LLC value still remains nearly unchanged.

My modifications to resctrl_test (for context):

diff --git a/tools/testing/selftests/resctrl/cache.c
b/tools/testing/selftests/resctrl/cache.c
index 9a4a6c52b14c..9f00680039c6 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -8,7 +8,8 @@ char llc_occup_path[1024];
 void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
 {
        memset(pea, 0, sizeof(*pea));
-       pea->type = PERF_TYPE_HARDWARE;
+       //pea->type = PERF_TYPE_HARDWARE;
+       pea->type = PERF_TYPE_RAW;
        pea->size = sizeof(*pea);
        pea->read_format = PERF_FORMAT_GROUP;
        pea->exclude_kernel = 1;
diff --git a/tools/testing/selftests/resctrl/cat_test.c
b/tools/testing/selftests/resctrl/cat_test.c
index 58b1590695d1..3ecf22fa1983 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -8,6 +8,7 @@
  *    Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
  *    Fenghua Yu <fenghua.yu@intel.com>
  */
+#include "perf/arm_pmuv3.h"
 #include "resctrl.h"
 #include <unistd.h>

@@ -181,7 +182,11 @@ static int cat_test(const struct resctrl_test *test,
        if (ret)
                goto reset_affinity;

        perf_event_attr_initialize(&pea, PERF_COUNT_HW_CACHE_MISSES);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE_REFILL);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE_LMISS_RD);
        perf_event_initialize_read_format(&pe_read);
        pe_fd = perf_open(&pea, bm_pid, uparams->cpu);
        if (pe_fd < 0) {
@@ -276,6 +281,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
        };
        param.mask = long_mask;
        span = cache_portion_size(cache_total_size, start_mask, full_cache_mask);
+       //span = 119537664; //L3 cache size of my machine

        remove(param.filename);

Any insights or suggestions would be greatly appreciated.

Best regards,
Shaopeng TAN

---
Shaopeng Tan (5):
  kselftests/resctrl: Detect the ARM architecture
  kselftests/resctrl: enable noncont_cat for MPAM
  kselftests/resctrl: remove unnecessary exclude_idle
  kselftests/resctrl: set shareable_mask to zero if all bits are shared
    between software and hardware
  kselftests/resctrl: Add support for CAT test on ARM

 tools/testing/selftests/resctrl/cache.c         | 1 -
 tools/testing/selftests/resctrl/cat_test.c      | 5 +++--
 tools/testing/selftests/resctrl/fill_buf.c      | 4 ++++
 tools/testing/selftests/resctrl/resctrl.h       | 1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
 tools/testing/selftests/resctrl/resctrlfs.c     | 2 ++
 6 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.47.3

