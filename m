Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA422AE78;
	Wed,  4 Mar 2026 04:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597022; cv=none; b=NqHNjqt9i92k4XFztAc5J4sOi48MgpHWKVd43p4C/1FlJlMO0d24wvqRDshDHiMp35GYEcixQ2AFF+1bwUgh5bOlQaa6lMIwJ7IPWnV2GG0aM0xsSULO5clpuvVa2dX7F14azHUDv45Optjr0IG+x7JWUrx7yJ/WL0ifr1jzuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597022; c=relaxed/simple;
	bh=pAU+XZhOpPW7pPOSKQHPzcEEiNx934dH1xni3wzxCao=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ank2XoWiAW8E53q8NoLnWxlXAEAHdMTL+pyLpHPdE5XbAj/RIFuNw/Cp4XZXztunNp7jNRMUta4h0x2KZY0A99947uAu3M02SBrwLMpkgfPzdUCkJE39xjEfOY57psKu/jogdWD+uH+GGwBlaoyNc5au9vcyXhqjq2qxsdf9IH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JNNoMsiK; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="JNNoMsiK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5rjXjPi3ygoF9zlQzKK9wz5P+uMbFuksLLJqZkprQys=;
	b=JNNoMsiK8IdJX1u9H26y5EZjR3gBLmA8J453wbd/riS4B0EGdywqJr3Zjner8KAI3gAM2/j34
	p7Q6ltguC2Py6cEt4F8tZa3fUsZ7cI8+ZpfFEAdzkyfoNk6DLd2FwP/ze29c+IWN4dtmTimpNfG
	YCo4Gc+tP1RngASz1T3684o=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6N3txLzpTJr;
	Wed,  4 Mar 2026 11:58:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B7C140561;
	Wed,  4 Mar 2026 12:03:35 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:34 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 0/9] Add support for HiSilicon platforms and refactor
Date: Wed, 4 Mar 2026 12:03:25 +0800
Message-ID: <20260304040334.765860-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi all,

This series adds support for HiSilicon platform and ARM MPAM to
the resctrl selftest suite and refactors for more extensibility and
maintainability. This expands test coverage for resctrl selftest on
non-x86 architectures.

The upstream kernel has been actively working on enabling multi-arch
support to the resctrl interface:

The ARM MPAM driver was merged in the Linux 6.19 kernel (commit:
https://lore.kernel.org/lkml/aS9w1LWtsZFLX9I9@arm.com/), adding the basic
mpam driver. Following that, the resctrl glue layer based on v7.0, which
makes MPAM usable resctrl in user-space, is now under review (patchset:
https://lore.kernel.org/linux-arm-kernel/20260224175720.2663924-1-ben.horgan@arm.com/).

Previously, the resctrl selftest suite was tightly coupled with x86
architectures (Intel, AMD, Hygon), relying on CPU vendor detection,
specific PMU names (e.g., uncore_imc), and x86-specific implementation
details. These assumptions made it inapplicable to other architectures
like ARM.

This series address that in two parts:

1. Refactor for Extensibility: The first five patches lay the groundwork
for multi-vendor support. This is necessary not only for HiSilicon but
also to make the test suite more maintainable for future architectures.

2. HiSilicon Platform Support: The subsequent patches leverage the newly
refactored framework to add support for HiSilicon platform.

The test suite has been successfully executed on both x86 and HiSilicon
platforms. However, on the HiSilicon platform, the CAT test cases
encountered the same issue as reported by Shaopeng Tan, where changing the
cache stride size resulted in an almost unchanged average LLC miss rate.

The results on the HiSilicon platform are as follows:

TAP version 13
# Pass: Check kernel supports resctrl filesystem
# Pass: Check resctrl mountpoint "/sys/fs/resctrl" exists
# resctrl filesystem not mounted
1..6
# Starting MBM test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Benchmark PID: 2603082
# Writing benchmark parameters to resctrl FS
# Write schema "MB:0=100" to resctrl FS
# Checking for pass/fail
# Pass: Check MBM diff within 8%
# avg_diff_per: 1%
# Span (MB): 250
# avg_bw_imc: 7108
# avg_bw_resc: 7239
ok 1 MBM: test
# Starting MBA test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Benchmark PID: 2603168
# Writing benchmark parameters to resctrl FS
# Write schema "MB:0=10" to resctrl FS
# Write schema "MB:0=20" to resctrl FS
# Write schema "MB:0=30" to resctrl FS
# Write schema "MB:0=40" to resctrl FS
# Write schema "MB:0=50" to resctrl FS
# Write schema "MB:0=60" to resctrl FS
# Write schema "MB:0=70" to resctrl FS
# Write schema "MB:0=80" to resctrl FS
# Write schema "MB:0=90" to resctrl FS
# Write schema "MB:0=100" to resctrl FS
# Results are displayed in (MB)
# Pass: Check MBA diff within 8% for schemata 10
# avg_diff_per: 2%
# avg_bw_imc: 7858
# avg_bw_resc: 8052
# Pass: Check MBA diff within 8% for schemata 20
# avg_diff_per: 0%
# avg_bw_imc: 8019
# avg_bw_resc: 8059
# Pass: Check MBA diff within 8% for schemata 30
# avg_diff_per: 0%
# avg_bw_imc: 8019
# avg_bw_resc: 7994
# Pass: Check MBA diff within 8% for schemata 40
# avg_diff_per: 0%
# avg_bw_imc: 8044
# avg_bw_resc: 8073
# Pass: Check MBA diff within 8% for schemata 50
# avg_diff_per: 1%
# avg_bw_imc: 8030
# avg_bw_resc: 7925
# Pass: Check MBA diff within 8% for schemata 60
# avg_diff_per: 0%
# avg_bw_imc: 8028
# avg_bw_resc: 8014
# Pass: Check MBA diff within 8% for schemata 70
# avg_diff_per: 0%
# avg_bw_imc: 8025
# avg_bw_resc: 8069
# Pass: Check MBA diff within 8% for schemata 80
# avg_diff_per: 0%
# avg_bw_imc: 8038
# avg_bw_resc: 8013
# Pass: Check MBA diff within 8% for schemata 90
# avg_diff_per: 0%
# avg_bw_imc: 8062
# avg_bw_resc: 8038
# Pass: Check MBA diff within 8% for schemata 100
# avg_diff_per: 0%
# avg_bw_imc: 8057
# avg_bw_resc: 8026
# Pass: Check schemata change using MBA
ok 2 MBA: test
# Starting CMT test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Cache size :23855104
# Benchmark PID: 2603684
# Writing benchmark parameters to resctrl FS
# Checking for pass/fail
# Pass: Check cache miss rate within 15%
# Percent diff=8
# Number of bits: 5
# Average LLC val: 5733171
# Cache span (bytes): 6277658
ok 3 CMT: test
# Starting L3_CAT test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Cache size :23855104
# Writing benchmark parameters to resctrl FS
# Write schema "L3:1=7fe00" to resctrl FS
# Write schema "L3:1=1ff" to resctrl FS
# Write schema "L3:1=7ff00" to resctrl FS
# Write schema "L3:1=ff" to resctrl FS
# Write schema "L3:1=7ff80" to resctrl FS
# Write schema "L3:1=7f" to resctrl FS
# Write schema "L3:1=7ffc0" to resctrl FS
# Write schema "L3:1=3f" to resctrl FS
# Write schema "L3:1=7ffe0" to resctrl FS
# Write schema "L3:1=1f" to resctrl FS
# Write schema "L3:1=7fff0" to resctrl FS
# Write schema "L3:1=f" to resctrl FS
# Write schema "L3:1=7fff8" to resctrl FS
# Write schema "L3:1=7" to resctrl FS
# Write schema "L3:1=7fffc" to resctrl FS
# Write schema "L3:1=3" to resctrl FS
# Write schema "L3:1=7fffe" to resctrl FS
# Write schema "L3:1=1" to resctrl FS
# Checking for pass/fail
# Number of bits: 9
# Average LLC val: 381964
# Cache span (lines): 176559
# Pass: Check cache miss rate changed more than 7.0%
# Percent diff=-0.4
# Number of bits: 8
# Average LLC val: 380588
# Cache span (lines): 156941
# Pass: Check cache miss rate changed more than 6.0%
# Percent diff=-0.0
# Number of bits: 7
# Average LLC val: 380438
# Cache span (lines): 137323
# Pass: Check cache miss rate changed more than 5.0%
# Percent diff=-0.1
# Number of bits: 6
# Average LLC val: 379917
# Cache span (lines): 117706
# Pass: Check cache miss rate changed more than 4.0%
# Percent diff=0.0
# Number of bits: 5
# Average LLC val: 379946
# Cache span (lines): 98088
# Pass: Check cache miss rate changed more than 3.0%
# Percent diff=-0.1
# Number of bits: 4
# Average LLC val: 379529
# Cache span (lines): 78470
# Pass: Check cache miss rate changed more than 2.0%
# Percent diff=0.1
# Number of bits: 3
# Average LLC val: 379853
# Cache span (lines): 58853
# Pass: Check cache miss rate changed more than 1.0%
# Percent diff=-0.0
# Number of bits: 2
# Average LLC val: 379777
# Cache span (lines): 39235
# Pass: Check cache miss rate changed more than 0.0%
# Percent diff=-0.2
# Number of bits: 1
# Average LLC val: 379159
# Cache span (lines): 19617
ok 4 L3_CAT: test
# Starting L3_NONCONT_CAT test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Write schema "L3:1=3ff" to resctrl FS
# Write schema "L3:1=7f87f" to resctrl FS
ok 5 L3_NONCONT_CAT: test
# Starting L2_NONCONT_CAT test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Write schema "L2:4=f" to resctrl FS
# Write schema "L2:4=c3" to resctrl FS
ok 6 L2_NONCONT_CAT: test
# Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0

Yifan Wu (9):
  selftests/resctrl: Move CPU affinity and resctrl FS setup to child
    process
  selftests/resctrl: Refactor resctrl_val.c for vendor-specific mem bw
    measurement
  selftests/resctrl: Use dynamic linked list for iMC counters config
  selftests/resctrl: Move memory bandwidth measurement init and cleanup
    to resctrl_val.c
  selftests/resctrl: Refactor CPU vendor detection to use lookup table
  selftests/resctrl: Add support for HiSilicon CPU detection
  selftests/resctrl: Add support for HiSilicon memory bandwidth
    measurement
  selftests/resctrl: Add support for HiSilicon MBM/MBA test
  selftests/resctrl: Add support for HiSilicon CAT/CMT test

 tools/testing/selftests/resctrl/cache.c       |   4 +-
 tools/testing/selftests/resctrl/cat_test.c    |  18 +-
 tools/testing/selftests/resctrl/mba_test.c    |  35 +-
 tools/testing/selftests/resctrl/mbm_test.c    |  34 +-
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 .../testing/selftests/resctrl/resctrl_tests.c |  89 +++--
 tools/testing/selftests/resctrl/resctrl_val.c | 323 +++++++++++++-----
 tools/testing/selftests/resctrl/resctrlfs.c   |  25 +-
 8 files changed, 380 insertions(+), 150 deletions(-)

-- 
2.33.0

