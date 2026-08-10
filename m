Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4831355D;
	Mon, 10 Aug 2026 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387727; cv=fail; b=jndL5c7hN7zTlDnFB+CHggBXPWCUgGv3miIml2jEdp/qG/MBuU1JBVg7nUMVpLQxqCQycohbkNtbApHxcvpjrCE+f6O/2vlo5aBZfuWnp2YKdV+NE7D00jIKvysdAls8AfBR7+j1AL//gXjKlE/NcRmk448G1UOVswDnXlkpi6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387727; c=relaxed/simple;
	bh=PdkMNAAMS+UenDED5EunNEQ4Ud1pwombK1aOMxvu0V0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y3HT7WPQhMyD1/Gy5ZBXgZoDYwhKWRfPO6SoA7p11oSM+0QBqFpRaW9pnwzrVt9YvATxXfIgU9uL4ICAHwyS40dnM2OUu8lsOEESCVeNC9DiaqvkSmLosxwE6/9TwOCyND8ivFW0AmN49wAsN3LvW48LN4mnvUwtTtemdPyrp6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1iH6kZ4Y; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1iH6kZ4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjYi3HPvReJ+qtVcH6QCTpllQMuMQenCDmGHY7foLOqUfstwZCrZkHjQJsDYaNWllZo6yGq5os29fmXBE51pqo+3irmPUUBXHo7XhnT7m98Y7Fw8DKqzI75PmfQWzL/bfDgZ8XaTLzzPNJVdGeFPN3/ZdY1sZkqu9RQ4n5+dl6itwU/TT9fEQAujJ6Qo5di11/HTsEEA9qJQLPG1mcY4BkYiC1Pp4RFV2rVM3GtUbiY/MDD6f/u1nyc2x10muEskRfbk/joMrgrTGBYooWs0e4jTCb65zkNjtEzSh19wVl4A2+hB09niFTy25sp+9gDSZHKNeHLrHHWl6KCZLU8ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcYv9LebCy1BRm94n0sIIzCIjC8NmX5W9NKIqIShs3M=;
 b=rpVQThH9GIc09MRUBfj3zZyqg6bMAfwNluaDdK251IUpu0iuhQ/d0lebH0mqkFAigP+kncVwT0HPoihaRLASjAmgHFv2kN8NYKy4ADXuOQ2gRAw0OOkw3bwIVWeTJrsHuuPZ5Ah0WP4KvLSl3JNSCGGFSTfkDYFC8WTaQ76LFqIGrb8gb7lGIG6CuOsIyUX2C2+vBfgziMVNkHTPW8ev4gHbtipVVPBO649RWSVJeKCTE2LQXshPaQCZahxtvQ051gYW5anW76vN8/5GFxedbXsCZTA6jT10maKU2u7DbnNHYLoz+qYWle37LfhHycTyqSIqf4IWX+clLd4LUViwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcYv9LebCy1BRm94n0sIIzCIjC8NmX5W9NKIqIShs3M=;
 b=1iH6kZ4YnUeRhjd5Vf1UDi/RLsnNAKhTjFtekE53Jmq8DwcfATOplufoTat9HNzH2OHBQxvx2BZsztRx6uIbG+thDXGdAIT2HUtdNHzKaZLWhxjFAYyDdZXI2xpYAq4N7mMDd6+uKgiS7t0eIW94JMVdvtgjCWxisBvQ355sEZs=
Received: from BL1PR13CA0367.namprd13.prod.outlook.com (2603:10b6:208:2c0::12)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:48:40 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::81) by BL1PR13CA0367.outlook.office365.com
 (2603:10b6:208:2c0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 18:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:48:38 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:48:34 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v4 0/5] selftests/resctrl: Add MBM and MBA test support for AMD
Date: Mon, 10 Aug 2026 18:48:01 +0000
Message-ID: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: af234e5a-49da-45df-6d7d-08def70ffdb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|13003099007|18002099003|10067099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KIn32Ih/aXVYRjIxPit1mTOKxuKntWYUbXAfKoPp83U2Yirwi5kBiI1HC2R47rlSbGe+N1LkDOAcWVXBBnxz/XA/J8Q8jvGXK4FTz0Ul7SyKV96vXBLlwyBjVa90IDTFj8rJ9+blD/djvRywT+0P8hxYZmjaOymrW6FzlM4NKWSsDQVSdnwrDi+rD+EIQoWq6rdT3bvLbqopLcg1HIVg1zM5c0Lv4z3y4GF8kq1O4IR3Lq/SJFM9WOLdlIYRyvcyadQZZi4+x5YRSAdrM6cN04+FNBE12fv4Z86SoTYkuoI1/242enppCVa8Kk0rvmRg6xobUBlONR+EyHLRtsCT0TotQwOOZmdKC3B+mZrJ5+FYSS45xx8PnpVvuKCk9BzxEINxboyLPXGswFXEeV1UWfHZ8ZUyBjqe5PCdxNanmIWvWfMi9VenomcysCB7dtZyDpbIyHtQ3mUxgwPQaPCKsyXhr06OWH9QvVwrDA1zofxuuRrthNXo/nUpaXS+dy5JwA+39BoSIJ9BZ6/HIBm36hyuWoWceYfJmduSWYibh3qtj13nyOXl1LCTXYRgdRBduMMesxdwWHsZDp6bqlmE2rSrmBXkhBqM397Koe2IEP/EAQN4sT5sguEZ6na/B3La2OM4R7Oi9ja6m7HB/l+FDKzkfXztrnigONso19gIVoXxJl5rr6CNyXLUUj96NmtsEU96IeWofpIRnWoVtREocQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(13003099007)(18002099003)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W/Pbg+P37NG/+ne8Efh94gcIDr3YevyeOSFcyDYFXIL+MCXJZVz3crtnMgPh7dF6A4FJuAiSM9CS6hIUEqc2T5QVfBoXl3iAJ0l2SPo+04u+5sqTAsyu4TNsJoMWw2/WNYwSyABMntwhCD1yXxvHqQ6H4m4+kNbPphTtr1DPuRTw7ESNvGBF6/pNA7IsOKFwuSXZdS8I3YlZZnLrzPJel60f6thsTijdI0erZFd3J0Tcce3G9ozG4NfnKri7GPTTkPZjOvSwSFvffbTciAAjJs6od5dAhStMkG3QTVKirhORc8GEVh+9//46ugax//0cMVpjSzaSKDd85GyYSWQYG6bIgQxqFLfQ36HqjqbnsoWnPvrCxSClclK4q6I2pqFxuPTvS9T69zGeubNmHSS2c+XM2VA9FIMgpS1ZDrqCDJhk/0MnIDFkxUWJyLXF0Vax
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:48:38.6042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af234e5a-49da-45df-6d7d-08def70ffdb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877

The MBM (Memory Bandwidth Monitoring) and MBA (Memory Bandwidth
Allocation) resctrl selftests validate the bandwidth numbers reported by
resctrl against the memory controller performance counters. Today this
only works on Intel, where the counters are the iMC (Integrated Memory
Controller) PMUs and the tests are gated behind an ARCH_INTEL vendor
check.

This series teaches the tests about the AMD UMC (Unified Memory
Controller) PMUs and enables MBM and MBA on AMD.

The work is done in a few steps:

  1. Rename the Intel specific imc/IMC identifiers to the generic
     mc/MC so the code can serve both vendors.

  2. Detect the vendor and select the memory controller PMU sysfs name
     accordingly, keeping the rest of the code generic.

  3. Add the AMD UMC support. Unlike Intel, the UMC PMU does not expose
     the CAS command events via sysfs, so the read event is programmed
     directly (EventCode 0x0a, umask 0x1). All vendor detection is
     contained in num_of_mem_controllers() and dispatched to per-vendor
     routines. On AMD each UMC is a per-NUMA-node PMU, so only the UMCs
     local to the benchmark CPU are opened; remote-node UMCs would
     otherwise fail perf_event_open() with -ENODEV.

  4. Sweep the AMD MBA schemata using absolute bandwidth values (4 GB/s
     to 40 GB/s) instead of the Intel style percentages (10% to 100%).

  5. Extend the vendor_specific gate of the tests to Intel and AMD so
     they run on AMD as well. The gate is kept (rather than removed)
     so vendors that num_of_mem_controllers() does not know about are
     skipped instead of reported as a failure.

Testing
-------
Tested on AMD Zen4 and Zen5 (multi-NUMA) system

History
-------
This series continues the work Babu Moger started; v1-v3 were posted by
Babu. I have taken it over, rebased it onto v7.2-rc7, addressed
Reinette's review feedback and added the AMD MBA bandwidth-value patch.

v3: https://lore.kernel.org/all/cover.1718385426.git.babu.moger@amd.com/

Changes since v3 (per patch changelog is present in each patch):
- Rebased onto v7.2-rc7 and reworked for the upstream resctrl_val.c
  refactor.
- Contained all vendor detection in num_of_mem_controllers() with a
  shared helper for the common counter "type" read. (Reinette)
- Fixed remaining Intel specific naming and the ksft diagnostics.
  (Reinette)
- Handled the AMD per-node UMC PMU topology (skip remote-node UMCs) to
  fix perf_event_open() -ENODEV on multi-node systems.
- New patch: use absolute bandwidth values for the AMD MBA schemata,
  with build-time checks that the sweep count matches the result arrays.
- Kept the vendor gate at Intel | AMD so unsupported vendors are skipped
  rather than failed.

Babu Moger (4):
  selftests/resctrl: Rename variables and functions to generic names
  selftests/resctrl: Detect vendor to select memory controller sysfs
    name
  selftests/resctrl: Add support for MBM and MBA tests on AMD
  selftests/resctrl: Enable MBM and MBA tests on AMD

Swapnil Sapkal (1):
  selftests/resctrl: Use bandwidth values for AMD MBA schemata

 tools/testing/selftests/resctrl/mba_test.c    | 105 +++--
 tools/testing/selftests/resctrl/mbm_test.c    |  24 +-
 tools/testing/selftests/resctrl/resctrl.h     |   4 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 366 +++++++++++-------
 4 files changed, 320 insertions(+), 179 deletions(-)

-- 
2.43.0

