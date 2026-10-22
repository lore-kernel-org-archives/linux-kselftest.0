Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675560;
	b=Gz/aW1h+YeNg8fNpQODLtK7oCNi12w92EPsMTthJDf+ug15dqz8Wo4sgzZ65nP/PTtwN
	 wPW+TIAHn+5uslbOxOcHos0W+xS0cGF7Uau73G3QqElggpi2DMmJ34xT5YjGEP620xh1I
	 vaQS0F9Rjxagu5KSq5v4zifLsnYznqAo23dIXMQz9163jg80QmGPEizxpGZ1G3LDWvI8/
	 81Atl7STOm48ImpXbCsN1WEUnNyI5qGHqED+jVsWHLHtW5BPCuObg0BP23jPF/JDNhw5N
	 3tie1vuXB5q3u0XvKtmbq/daXN+8xIeTKmzmJyPLSY3mATwub5vYqJdxfhoKcESlXFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675560;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+qXuw6Z8nHO5B60O0yQwDNFC6apMOb4yT18O7Vykhdo=;
	b=RKF/nt8WMY7R9E0XYuEw5rUUZw45Zgglj5qS76mLYdJ627x8ElzhCMWW8Du2JHq6KP8V
	 knnBIvNvTkQcByc631+f3pjB+igdvRFCHHpRNci1JQztgAc1NEG7hoZVUPfzMpfxbMlmI
	 lWSfFfKz1q/zCjMtVnH1yGWtBb4Swipn06TDl873UJAFnMi+0xwfPu+4vn787emcPy6QM
	 AYRcfd8EOLM5HYrdJoAL3nekI2qK3WGvGAC352maA06pHMbNi9WMO+itSIQfsSRMkkis+
	 wvHfMnI6fecLB5buv5BqnqMyNUcseMyNaTiuRIx3yD9FCkAIjsOtRMTJzHzl2BH3TNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3qX8Nvo3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.40
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D5606A31F;
	Thu, 22 Oct 2026 13:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3qX8Nvo3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DY+cFSQMCFLAFoURFL1RARG0zcpAgbqBg0xPr/PHNg/IhNclnK7xy0uwHtEinBhr5sA6gG3dTmR/8IOjcA6GCENtCo27eIl0hZKxqfIshnwl5e1zgX6Ai+DgGWayZu7xaa/iJboR3q09rWG+S31qyQOvKyUEXWGuTqsdx7xf3nlnl44V4IkxApO3yvRQqkc3i8mSb0GmOybtArZ5eFCn9vm+jpYAxmf1sB3gBWcJwVR188ICKrL2fAZ6pVTlv7ONkZc3P5tFg8t9yL/A2QMxM4B8CQ6lpS75d3wDQz0fU0BfjJBduDZ4wqw55OuCht189CBPCwacfo3FRaGVoh3+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qXuw6Z8nHO5B60O0yQwDNFC6apMOb4yT18O7Vykhdo=;
 b=uvuOJ9ddnVqkDfdlOxeTA8qRE4I45l/qnbDm3N+EW0QB/WeU++k/nq87qfNHrWzIIFi8ny+2CrXe3PR/UVaWy1S+y6wsrklqdgmHBanM/Q9AptHk+284mQASaZnraZH6FyYDfYeHTEW8n+DVQXsIc3QhJMLUchSRafJzZhIoe1DTzjDQNwXapIwh7t1Y9iwjcf4okGDhLgNGpHbx7FvaPi51JEdTGlcJGzXrKNTNGZ8V7BUrr+imdI1tJpjRKvou+OzjuVMlO0lF3h/aIhSoic6DRbn93nk6mZEbDtaUT8/SHKzS+LVfwn5mieemRxxGNz68wtgWdWs27fbB7Rpkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qXuw6Z8nHO5B60O0yQwDNFC6apMOb4yT18O7Vykhdo=;
 b=3qX8Nvo3tJJlta3THnj4ZL7tvJ+a3CqDlHDLtKK+Rc0F+PsXpobOGWQd6Yuh1lsCqnAn5A2uAu/R3/Us2iZRzK1CYCs8wS6K/Q6oPPRUyFJeT+C7ybW8YMZfzFB6fNtP/18+enSrccnWjOZuFq0DbkxZSmvOGB+C7tRl+kPoLQE=
Received: from CH0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:610:b3::32)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 13:25:44 +0000
Received: from DM3PEPF000265BD.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::5f) by CH0PR03CA0057.outlook.office365.com
 (2603:10b6:610:b3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Thu,
 22 Oct 2026 13:25:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265BD.mail.protection.outlook.com (10.167.23.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:25:43 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:25:40 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v5 0/5] selftests/resctrl: Add MBM and MBA test support for AMD
Date: Thu, 22 Oct 2026 13:25:11 +0000
Message-ID: <20261022132517.46805-1-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BD:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b96f617-fb39-4a60-e0ff-08df303ff9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|6133799003|18002099003|3023799007|11063799006|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FQ/n/lVNicTD9LBAfLQM3k08U/dvlu+pqYSDKpEuTl8eDebTQm+vB2Ehx/oJba+un5HVW2jnt3BhLJiFTvCcGuZ562x67pNbaKBHn/l6CQ9Le3DtK0tFIKxfovdlWGjAfEIez4j9HGBWn0oH/MnY1djrxpVFiLPVs1UEL5SxpoETKeRCIZ+Lle4/4yZ2RPvyasXzgUrNTharW6NNzuj0ESLcg+cAV2+IWxzRXnY1lmdqFA5SAMmimB+kDl5M2m8xCk+46LmkJr6vvCF/ib+MDgCV4lE+8Z0ZYRNJj3tr1IcJEF17Q92VlbQMOHkDr0CkRIe1yqYPzpbCIDwg0lDWsNhQ8jjBd3rvjM2kTT4QtQWev5KQ2KRYQeOCxAVryiAaGBWO17n6Offve0Q32sY3t376c7Q0nJNAO/XeyEamRVPGRvJ2B8qh5jguna6IZp1pBk08vyaP0ASMTpnbxlYoxwFzpdIjZb72Vbyl8CqyIr2n0ud39BEyHPJhd1lHoT88uWOEaZTeHYoGAABWhuHhtuCP1TD2X0EKMBNae9BR8ul+P32KS9/zaL6LREVCdvQx+3qz34axiS8pUyYp6/g8Igws+tLGWHq2axQ06PYEClM2XLabYDxkhecuoWhdwE+/XbvvuK95rK6rF6ihTX0wTd6q6MUPPsCsiEQLfEpww8U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(6133799003)(18002099003)(3023799007)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iqkpd/9g6UcEDuN6AH8bRAjnrNgEiPwxU1tRxP0juEacuL+4fB/YZNMyEF02KL2gVPopPgQeDLy5kF0dBUgdP+XPZX8ik1tp8JYNmjW0G8ZfItWtdy3FmrHEwnpmDfd5gsJCdQLKsfY8Im/W55xW9MFzGmFObhvX+nW8GmfRZcOuFiQp6EjnfQddwLrtW/4cBhiUclXncMUWX4iT7LMLrjYw+lvHF1T3sStIRIb1KmTcRhVlvSPmC1Ah4Au+Vr6XdcEoQXJl0UU0tiJPjJ3DeeBDh1+FwsdXKM23W2saz1RqK2oEPMccUMeBWRFGy96I8NGqnnf1un6MnDifZXRGtlNxUXzY19HSWMRMV0MuuikUvyd5PLneYwxUZUHWF5RGk9L8aHhRGmskuQHEJvungjQNQlM24P99LP+HkXitwFnMRkBTiHBuPUjPa1W0fbhz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:25:43.8503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b96f617-fb39-4a60-e0ff-08df303ff9a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622

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
     contained in enumerate_mcs() and dispatched to per-vendor routines.
     On AMD each UMC is a per-NUMA-node PMU, so only the UMCs local to
     the benchmark CPU are opened; remote-node UMCs would otherwise fail
     perf_event_open() with -ENODEV.

  4. Sweep the AMD MBA schemata using absolute bandwidth values (4 GB/s
     to 40 GB/s) instead of the Intel style percentages (10% to 100%).

  5. Extend the vendor_specific gate of the tests to Intel and AMD so
     they run on AMD as well. The gate is kept (rather than removed)
     so vendors that enumerate_mcs() does not know about are skipped
     instead of reported as a failure.

Testing
-------
Tested on AMD Zen5 (single-numa and multi-NUMA); MBM and MBA tests
pass on both.

This series applies on top of the kselftest tree's "next" branch.

v4: https://lore.kernel.org/all/20260810184806.1089507-1-swapnil.sapkal@amd.com/

Changes since v4:
- Rebased onto the kselftest "next" branch. The memory bandwidth
  counters there are now kept in a dynamically managed linked list
  (instead of a fixed array), so the whole series was reworked on top of
  that infrastructure. The enumeration routine is now enumerate_mcs()
  and the AMD path allocates and links each UMC counter.
- No other functional changes relative to v4.

Babu Moger (4):
  selftests/resctrl: Rename variables and functions to generic names
  selftests/resctrl: Detect vendor to select memory controller sysfs
    name
  selftests/resctrl: Add support for MBM and MBA tests on AMD
  selftests/resctrl: Enable MBM and MBA tests on AMD

Swapnil Sapkal (1):
  selftests/resctrl: Use bandwidth values for AMD MBA schemata

 tools/testing/selftests/resctrl/mba_test.c    | 107 +++--
 tools/testing/selftests/resctrl/mbm_test.c    |  26 +-
 tools/testing/selftests/resctrl/resctrl.h     |   6 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 384 +++++++++++-------
 4 files changed, 334 insertions(+), 189 deletions(-)

-- 
2.43.0

