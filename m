Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E34303C97;
	Mon, 17 Aug 2026 01:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931413; cv=fail; b=ZW7anA25eBcm39B67IZvZD4V7FcxlazB7P+6xmdNJdfZ0XxBxXBT1Ou+oEDcx+6ZpJjkIQx1+siKcQGZmEp3Vlm/kojU+HtL7XZI2xANl/IGk6lapb83Xgtwf1aOdL1nU/rqWiItuby2XlDrwF/nqCqVwWfGJ63SIFd7BpDyRG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931413; c=relaxed/simple;
	bh=xqR7/39TbDTrt8w4jIUP/Jdvtn5UQ3VofUdpVm0WB1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CVE6b4ED14C6vJYzmn9VkW2MC6qfPaudeFmy0FHyuPuf5JMVn394UKJsrbM81tOoSnzdNNdpwEXF5rJ3cNaMaYQSSBo52SYZsHOl5JwW5tXCNKFHnusBWx9Wpc/RKX0CUz0YVRFsxGvED4HkKFcTEK/xV3YUhtz4e0N7m1oZ3HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t6a1gwmv; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t6a1gwmv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXcTrO4Od8jlUz5yP3xPbZH8COqO8sM/5jpGO3QHtzwNEN4po+kPku9RfUFe+E4VnsbXZqQ9q84yPDdYrTer4ydT823Wq1777QWmJ+U4K6CDrPIXmspICUybUJ/OV8m6ulHz1szN9+7Y4p2kz29U1nYvny4wtFIL8QvmUv2wOxBSwau2EnFiJyw79BeUnGyZH3ocofNM1PVq39hBQBv5PfjuOecREMFcNvCsfh0NlUNFo7j1qZa3ZD9XyaYYdckqn7ddIzZ28A/kvJ5Robzw8eFHmiXcaFuE8iG93020N7ZpEPwdlz19fF2QNzLuM3Ko40YlWZNzoZRWok/kvWS5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQAxvgqjbvX41xUCvUO7mIi6f9RrgIkDc01xplWyZDc=;
 b=IykI1m+srld/ixZ+Ky7H2Ji87TOd7s8cV9Qwfb+pUzPGY/+zq/cMFncVkA+fyXnYAYfl9ZiuhI/89dpQeUL9T7+zHriO06XGEFY/bEzTU7obFIGLlpEJ94Ifp9pLERGrp4hl/4bSqxqihCQ4nxkADU9T4U7Ty/TAv2czLbq/deuy+SXUIg0KVwfJSBv9bVaJHy6fnspnn0sQvBHw1pGG7YEjPiZLiVuFhU/MSZ90Sfn1VnfVdIx6B4QmqI1N10udMQZRZ5uxqCUiNm3xr6XDtaGAtmkVqPJLeJgoi+BEbCrZGvoCtwTIh2Dsb0jhwYr5KR0vc9AM2CVprKuvaVROVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQAxvgqjbvX41xUCvUO7mIi6f9RrgIkDc01xplWyZDc=;
 b=t6a1gwmvH7CdQ2h1gCQKczkN2y4XI4ddvEsA/dwvyU9RE4zkboPq9mgv7U1P9HKB4LlkR/21eEmhXYUxtN6hTpmmrZfZ6K4SjIvrzYCosxPUHa268H1oQlMDYLCb5llwF/BL3QFlb1/RQeICeftLdWi2rFiYKZNym9lkqHHJMBQe1uDLLTLOFG0I64XuawviDv2NHo/Lj0d1HhLzkTyr+CLm4KCvIF19VkBYzbxR2ZQRhVBRrF3uzQmagN8wrX23Wy842RCzx2sFZcdJhZbcXpfg0F1d5Em4CT1GG4nRlU9Y6OF1E9Jw9LB9JoXlkH4b9+aXiVbJHk9SuqVIwNywnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by CH1PR12MB9623.namprd12.prod.outlook.com
 (2603:10b6:610:2b3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 01:50:04 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 01:50:04 +0000
From: KobaK <kobak@nvidia.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	tdave@nvidia.com,
	kaihengf@nvidia.com,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: [RFC PATCH v6 3/3] selftests: arm64: add arm_cpumod kselftest
Date: Mon, 17 Aug 2026 09:49:43 +0800
Message-ID: <20260817014943.10-4-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817014943.10-1-kobak@nvidia.com>
References: <20260817014943.10-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|CH1PR12MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2d237c-6189-49c6-2078-08defc01db9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aAe5kVpnRfJIUy06FRUQMlLswdMfu6Qj5X+pHbWNAOJKnyTi7wJwJopnslSDcx/KFxfNImH/tQaa2hatR2jktg3c3t8z744raC4E6R0twyNgMqWFBBKd++7+aTJ2pObtMimvJwNNE63RHiURhahUEMFyxgu/5utaOCWgwcB2vXnv5gB+MGaBssMLHLNgg0ZtUaqYWdlDeZHFn2GnEibzyQL5m/1eJbiSwdaqB3lWE7Pr2kkC0Lc+X+EHcwBxSuFNfR68SWXKg1HIqdXt+RVrCFVpySImycwE4ntoN/BJ6sht0PcvEsT9nMvM8OrugGW8aLZqRYNxYXQ0jf3TpTUZZtIUSvjlUjmDLQZvqPpzsJlHWlr2qNaTtiKjrOazGy7LmWgTeE6HW5r1GgWNLdi7+hLLmP7d/H3LEM3kwljBvAGAp9P3AzQAkJ2a/23TsbkGZZYqmp10qZgPkLIK01U9JJakf7zEnvBSg7YnpEjjNY+Nl6Kcimt1bdNP/5FKkCgSBltduvP+Ha5WcN9WJ6yiwnRnEgkV3358qhMZxa3Rhupyv19U726D0MY88ers5K2nFz/Y7MLGply/Yu3nBAxdxwsMwyrULt2ZomRtC5cSyNdD2upk6vIUkRPvKKWAV2zv//3YbxFaF0u8WA9uqzYemHj6wGy/ttpo8/pEQ3L/T98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MSJX+pfGdYi/clEaxz4fWot7B5yUWC2Tw6uLzUJgXoWvMqGRfLO6cCByTFSI?=
 =?us-ascii?Q?C6ld6tev4zuhYBsV6OUfMZiMcW+SqI5lFAuBQyhzvtIserdTIjtUELLOmq0t?=
 =?us-ascii?Q?FbpK2ntdQl+G56x7oXLpZrZCig3lAnmVmUBQsOgJxnYWlBFapEwQjg/ITI99?=
 =?us-ascii?Q?JsNKbH1XtXBRupWl3T+zXn3DS4pRFb6z2CXi/Veyg9wfbFQVt7+/AjbMFctq?=
 =?us-ascii?Q?lxLmc88Q3C69OSWHmpNP7Gm+3Mhp0tKkvb4YDqHZ5dfvStA2bj2D/RCPIy3C?=
 =?us-ascii?Q?RVb0ieGlPP6O3PIMPT1gp/GTSiqk9LOIGiawq1wcM5kFSzN1tDVd7g04BLrJ?=
 =?us-ascii?Q?ABG5R3uBO5P47jjFd+07ELTjQVv3qU8OzxnUpck9naBP3Hl3O0ymFxrtZ9Bq?=
 =?us-ascii?Q?B8WJQnyy4HOFLKYJzUaCrAPR5ntINXpUSqfRS6fABxy+13xf37VBlKpasLK6?=
 =?us-ascii?Q?ciJGPoJPzKqT0+SRMgQFvCxvnbONSVU4PPHjiiEsjRLleWyYWtdepABxyuhn?=
 =?us-ascii?Q?3IOMBacy8/j4oWEYuMTBK2TBK3KgEShW+qqL1SuN18e2HsjoNZeeuDk9ruso?=
 =?us-ascii?Q?EI5It1yv5jbDPApwuSinmOq1i1oGOITwIFq2wF1UmMHjShiPLh6TF4YnH1Ry?=
 =?us-ascii?Q?/cQA43fJ8VvkPseuZL1tsWc6Cvw4jK6Wm4Ia8NgTLoQVvRLI6gr6gWefRi73?=
 =?us-ascii?Q?pMcBF4WhRKS1/UkFMF4L2ipK6d3q8S24wjZahh31bwKeYNlW8MbwsJRRhTrC?=
 =?us-ascii?Q?ehMJAz6RYdjrm590a+3gjiOyAmnlFYj9FuX71JFXevJLI3FogZOzJL9karbr?=
 =?us-ascii?Q?DkbZF2x2iKyFNwGoRSUDC6cMc6sov/czOQAZFKTa5sBOMItZu1IvB+XnW/pr?=
 =?us-ascii?Q?HdIpwfWF2X9a9MYZ58HIQSmX/Y1INZN60fXS6ucWsy8u0H/68hdJ8TNUMddm?=
 =?us-ascii?Q?ssHnSviUCgswfi+WHz6QDemLNnHQDx4m3uzDCwoqb8NfGDgRFeYaW30omywr?=
 =?us-ascii?Q?tBxse3SI44HarMqVv1Do2zG/zhGbp6+6P6XIPXSSjjVsMlm/FVLfx17+aMfq?=
 =?us-ascii?Q?CYx/wYBnNKHrSmqSicaRKcpt7Jo+4elsNhFRyC0X+OqK3bb5MR+ETP+oHTBs?=
 =?us-ascii?Q?FTb0kJKp3a2At9xMFG0XcYoM6Di0z0UjQbS/xOYNkcdRvLs0orcg4kOzSqhC?=
 =?us-ascii?Q?LqdrWwzewQpUYdi3ClswbZmZZyh2LzLdl9olalqC36kppqVXhGSDkiVRCnAB?=
 =?us-ascii?Q?Wg3QMZFPsLD19XzF4F1+3l/GyZiJD+ZsnEc+6Aj51UlcjLhy2ZquHm2no/2s?=
 =?us-ascii?Q?gnChd8i9T1ByVFwaEcEv4jNFMLzkN56m3XiC791oW7E6OH5r4L77PdbpJSmS?=
 =?us-ascii?Q?D0XcsUoh8J5UIR44EvkdH2CFvJeCnoS8o9hIJchJ56DjYamtvC76/b7htVFY?=
 =?us-ascii?Q?QhXymyJy90C5L+e114VGN8qOlVGFBZyvgRdkSRvd9Qq00gBWHUOM+lajRovj?=
 =?us-ascii?Q?nidoro0JEcTSjyBqkbhTZ5hpPeKfhAxLJAGPj6AplzUvZZcNv01bo/nlxau0?=
 =?us-ascii?Q?bhLLu1AZZ9avK+NCydcuR4UoHBK2YE7qRn3R5sXNPaDuhmfnEuDtAJMkXjfL?=
 =?us-ascii?Q?dbu/Xb/ghorpzp6TqRq48v5XmwDZpaSvctiK+IhHuOUp557R0cWbUUyrh2AR?=
 =?us-ascii?Q?r+kNIY37cAWDJ9t1j6/EX/0TiAKJSGCfXzE1s5aWnwU3JvWPFVdoGDy17joU?=
 =?us-ascii?Q?ZTA19CkcxQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2d237c-6189-49c6-2078-08defc01db9d
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 01:50:04.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1pQWhEsccbp4e5qvD1AwvGWEclcv9Y58Yc1sS39KGvJQeMk8bf/6K3RjEHt237Q0SPG8PWO5T70HEttNg3xEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9623

From: Koba Ko <kobak@nvidia.com>

Add a kselftest for the arm_cpumod sysfs ABI. The test loads or reuses the
module and selects either one target CPU or a snapshot of all online
CPUs. In single-CPU mode, skip an offline target before module
validation. Observe the per-CPU online attribute first. If it is absent,
immediately require the CPU directory to still exist before treating the
CPU as non-hotpluggable and online. If the attribute exists, it must be
readable and contain 1.

After module load, recheck the online state before classifying a selected
CPU without a cpumod directory as an unsupported profile. Fail if the CPU
went offline or disappeared, log and skip CPUs that remain online without
a directory, and require at least one selected CPU to expose a supported
Grace or Vera profile. Return KSFT_SKIP if none do.

For supported CPUs, recognize the exposed Grace or Vera profile-specific
layout and validate the matching attributes. Only
ARM_CPUMOD_EXPECT_PROFILE supplies an external profile expectation.

Verify read paths by checking that attributes return decimal values and
that affected_cpus identifies the current CPU as a decimal CPU number.
Optional valid-write testing writes each current value back. Optional
invalid-write testing checks selected out-of-range values and confirms
that the prior value remains unchanged.

Both write paths are opt-in. Valid writeback can alter
implementation-defined CPU controls; invalid-write checks exercise
rejection through the same firmware-sensitive interface, but are expected
not to update state. Cover all-online-CPU mode through
/sys/devices/system/cpu/online and, when the test loaded the module,
verify cleanup by removing it and checking that the selected CPU subtrees
disappear. The test does not offline or online CPUs.

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Tushar Dave <tdave@nvidia.com>
Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
Signed-off-by: Koba Ko <kobak@nvidia.com>
---
 tools/testing/selftests/arm64/Makefile        |   2 +-
 .../selftests/arm64/arm_cpumod/Makefile       |   5 +
 .../selftests/arm64/arm_cpumod/arm_cpumod.sh  | 526 ++++++++++++++++++
 3 files changed, 532 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/arm_cpumod/Makefile
 create mode 100755 tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa13..0873be5af0369 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -4,7 +4,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),aarch64 arm64))
-ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs
+	ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs arm_cpumod
 else
 ARM64_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/arm64/arm_cpumod/Makefile b/tools/testing/selftests/arm64/arm_cpumod/Makefile
new file mode 100644
index 0000000000000..db0341cdbc621
--- /dev/null
+++ b/tools/testing/selftests/arm64/arm_cpumod/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_PROGS := arm_cpumod.sh
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh b/tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh
new file mode 100755
index 0000000000000..51c620a74c7d4
--- /dev/null
+++ b/tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh
@@ -0,0 +1,526 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+
+readonly KSFT_SKIP=4
+readonly MODULE_NAME="arm_cpumod"
+readonly CPU_ID="${ARM_CPUMOD_CPU:-0}"
+readonly MODULE_PATH="${ARM_CPUMOD_KO:-}"
+readonly ENABLE_WRITES="${ARM_CPUMOD_ENABLE_WRITES:-0}"
+readonly ENABLE_INVALID_WRITES="${ARM_CPUMOD_ENABLE_INVALID_WRITES:-0}"
+readonly ALL_CPUS="${ARM_CPUMOD_ALL_CPUS:-0}"
+readonly EXPECT_PROFILE="${ARM_CPUMOD_EXPECT_PROFILE:-auto}"
+readonly CPU_ONLINE_PATH="/sys/devices/system/cpu/online"
+readonly COMMON_ATTRS=(affected_cpus pf_dis pf_mode)
+readonly COMMON_RW_ATTRS=(pf_dis pf_mode)
+readonly GRACE_ATTRS=(cbusy_filter_threshold cbusy_filter_window cmc_min_ways)
+readonly GRACE_RW_ATTRS=(cbusy_filter_threshold cbusy_filter_window cmc_min_ways)
+readonly VERA_ATTRS=(l2spr_cmc_max_ways)
+readonly VERA_RW_ATTRS=(l2spr_cmc_max_ways)
+
+loaded_by_test=0
+reused_loaded_module=0
+detected_profile=""
+current_cpu="${CPU_ID}"
+verified_cpus=0
+CPU_LIST=()
+
+log()
+{
+	echo "${MODULE_NAME} selftest: $*"
+}
+
+skip()
+{
+	log "$*"
+	exit "${KSFT_SKIP}"
+}
+
+fail()
+{
+	log "$*"
+	exit 1
+}
+
+cpu_dir()
+{
+	local cpu="$1"
+
+	printf '/sys/devices/system/cpu/cpu%s' "${cpu}"
+}
+
+cpu_is_online()
+{
+	local cpu="$1"
+	local dir="$(cpu_dir "${cpu}")"
+	local online="${dir}/online"
+	local value
+
+	if [ ! -e "${online}" ]; then
+		[ -d "${dir}" ] || return 1
+		return 0
+	fi
+
+	[ -r "${online}" ] || return 1
+	value=$(cat "${online}") || return 1
+	[ "${value}" = "1" ]
+}
+
+cpumod_dir()
+{
+	local cpu="$1"
+
+	printf '%s/cpumod' "$(cpu_dir "${cpu}")"
+}
+
+current_cpumod_dir()
+{
+	cpumod_dir "${current_cpu}"
+}
+
+cleanup()
+{
+	if [ "${loaded_by_test}" -eq 1 ]; then
+		rmmod "${MODULE_NAME}" >/dev/null 2>&1 || true
+	fi
+}
+trap cleanup EXIT
+
+require_cmd()
+{
+	command -v "$1" >/dev/null 2>&1 || skip "missing required command: $1"
+}
+
+module_loaded()
+{
+	grep -q "^${MODULE_NAME} " /proc/modules
+}
+
+wait_for_path_state()
+{
+	local expect_present="$1"
+	local target="$2"
+	local i
+
+	for i in $(seq 1 50); do
+		if [ "${expect_present}" = "present" ]; then
+			[ -e "${target}" ] && return 0
+		else
+			[ ! -e "${target}" ] && return 0
+		fi
+		sleep 0.1
+	done
+
+	return 1
+}
+
+read_attr()
+{
+	local attr="$1"
+	local file="$(current_cpumod_dir)/${attr}"
+	local value
+
+	value=$(cat "${file}") || fail "failed to read ${file}"
+	printf '%s' "${value}"
+}
+
+attr_exists()
+{
+	local attr="$1"
+
+	[ -f "$(current_cpumod_dir)/${attr}" ]
+}
+
+require_attr_present()
+{
+	local attr="$1"
+
+	attr_exists "${attr}" || fail "missing sysfs attribute $(current_cpumod_dir)/${attr}"
+}
+
+require_attr_absent()
+{
+	local attr="$1"
+
+	attr_exists "${attr}" && fail "unexpected sysfs attribute $(current_cpumod_dir)/${attr}"
+}
+
+check_decimal_attr()
+{
+	local attr="$1"
+	local value
+
+	value=$(read_attr "${attr}")
+	case "${value}" in
+	''|*[!0-9]*)
+		fail "${attr} returned non-decimal value: ${value}"
+		;;
+	esac
+}
+
+expand_online_cpus()
+{
+	local cpu_list="$1"
+	local part
+	local start
+	local start_num
+	local end
+	local end_num
+	local cpu
+	local parts
+
+	CPU_LIST=()
+	IFS=, read -ra parts <<< "${cpu_list}"
+	for part in "${parts[@]}"; do
+		part="${part//[[:space:]]/}"
+		[ -n "${part}" ] || fail "empty CPU range in ${cpu_list}"
+
+		if [[ "${part}" == *-* ]]; then
+			start="${part%-*}"
+			end="${part#*-}"
+			[[ "${start}" =~ ^[0-9]+$ ]] || fail "invalid CPU range start: ${part}"
+			[[ "${end}" =~ ^[0-9]+$ ]] || fail "invalid CPU range end: ${part}"
+			start_num=$((10#${start}))
+			end_num=$((10#${end}))
+			(( start_num <= end_num )) || fail "invalid descending CPU range: ${part}"
+
+			for ((cpu = start_num; cpu <= end_num; cpu++)); do
+				CPU_LIST+=("${cpu}")
+			done
+		else
+			[[ "${part}" =~ ^[0-9]+$ ]] || fail "invalid CPU entry: ${part}"
+			CPU_LIST+=("$((10#${part}))")
+		fi
+	done
+
+	[ "${#CPU_LIST[@]}" -gt 0 ] || fail "no online CPUs parsed from ${cpu_list}"
+}
+
+select_cpus()
+{
+	if [ "${ALL_CPUS}" = "1" ]; then
+		[ -r "${CPU_ONLINE_PATH}" ] || skip "missing ${CPU_ONLINE_PATH}"
+		expand_online_cpus "$(cat "${CPU_ONLINE_PATH}")"
+	else
+		cpu_is_online "${CPU_ID}" || \
+			skip "cpu${CPU_ID} is offline or its online state is unreadable"
+		CPU_LIST=("${CPU_ID}")
+	fi
+}
+
+detect_profile()
+{
+	local has_grace
+	local has_vera
+	local attr
+	local i
+	local dir="$(current_cpumod_dir)"
+
+	for i in $(seq 1 50); do
+		has_grace=0
+		has_vera=0
+
+		for attr in "${GRACE_ATTRS[@]}"; do
+			if attr_exists "${attr}"; then
+				has_grace=1
+				break
+			fi
+		done
+
+		for attr in "${VERA_ATTRS[@]}"; do
+			if attr_exists "${attr}"; then
+				has_vera=1
+				break
+			fi
+		done
+
+		if [ "${has_grace}" -eq 1 ] && [ "${has_vera}" -eq 1 ]; then
+			fail "mixed Grace/Vera-specific attributes under ${dir}"
+		fi
+
+		if [ "${has_grace}" -eq 1 ]; then
+			detected_profile="grace"
+			break
+		fi
+
+		if [ "${has_vera}" -eq 1 ]; then
+			detected_profile="vera"
+			break
+		fi
+
+		sleep 0.1
+	done
+
+	[ -n "${detected_profile}" ] || \
+		fail "unable to detect Grace or Vera sysfs layout under ${dir}"
+
+	if [ "${EXPECT_PROFILE}" != "auto" ] && [ "${EXPECT_PROFILE}" != "${detected_profile}" ]; then
+		fail "expected ${EXPECT_PROFILE} sysfs layout, detected ${detected_profile}"
+	fi
+}
+
+check_requirements()
+{
+	case "${CPU_ID}" in
+	''|*[!0-9]*)
+		fail "ARM_CPUMOD_CPU must be a decimal CPU index"
+		;;
+	esac
+
+	case "${EXPECT_PROFILE}" in
+	auto|grace|vera)
+		;;
+	*)
+		fail "ARM_CPUMOD_EXPECT_PROFILE must be auto, grace, or vera"
+		;;
+	esac
+
+	case "${ENABLE_WRITES}" in
+	0|1)
+		;;
+	*)
+		fail "ARM_CPUMOD_ENABLE_WRITES must be 0 or 1"
+		;;
+	esac
+
+	case "${ENABLE_INVALID_WRITES}" in
+	0|1)
+		;;
+	*)
+		fail "ARM_CPUMOD_ENABLE_INVALID_WRITES must be 0 or 1"
+		;;
+	esac
+
+	case "${ALL_CPUS}" in
+	0|1)
+		;;
+	*)
+		fail "ARM_CPUMOD_ALL_CPUS must be 0 or 1"
+		;;
+	esac
+
+	[ "$(uname -m)" = "aarch64" ] || skip "requires an arm64 host"
+	[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+	select_cpus
+	for current_cpu in "${CPU_LIST[@]}"; do
+		[ -d "$(cpu_dir "${current_cpu}")" ] || skip "missing CPU directory $(cpu_dir "${current_cpu}")"
+	done
+	require_cmd rmmod
+
+	if [ -n "${MODULE_PATH}" ]; then
+		[ -r "${MODULE_PATH}" ] || skip "ARM_CPUMOD_KO is not readable: ${MODULE_PATH}"
+		require_cmd insmod
+	else
+		require_cmd modprobe
+		modprobe -n "${MODULE_NAME}" >/dev/null 2>&1 || \
+			skip "set ARM_CPUMOD_KO or install ${MODULE_NAME} into /lib/modules"
+	fi
+}
+
+load_module()
+{
+	if module_loaded; then
+		if [ -n "${MODULE_PATH}" ]; then
+			skip "${MODULE_NAME} is already loaded; unload it before using ARM_CPUMOD_KO"
+		fi
+
+		reused_loaded_module=1
+		log "${MODULE_NAME} already loaded, reusing existing instance"
+		return 0
+	fi
+
+	if [ -n "${MODULE_PATH}" ]; then
+		insmod "${MODULE_PATH}" || fail "insmod failed for ${MODULE_PATH}"
+		module_loaded || fail "${MODULE_NAME} did not appear in /proc/modules after insmod"
+	else
+		modprobe "${MODULE_NAME}" || fail "modprobe failed for ${MODULE_NAME}"
+		module_loaded || skip "${MODULE_NAME} did not appear in /proc/modules after modprobe; built-in or non-unloadable setup is unsupported"
+	fi
+
+	loaded_by_test=1
+}
+
+check_sysfs_layout()
+{
+	local attr
+	local expected_cpu
+	local value
+	local dir="$(current_cpumod_dir)"
+
+	wait_for_path_state present "${dir}" || \
+		fail "cpumod sysfs directory did not appear at ${dir}"
+
+	for attr in "${COMMON_ATTRS[@]}"; do
+		require_attr_present "${attr}"
+	done
+
+	detect_profile
+
+	case "${detected_profile}" in
+	grace)
+		for attr in "${GRACE_ATTRS[@]}"; do
+			require_attr_present "${attr}"
+		done
+		for attr in "${VERA_ATTRS[@]}"; do
+			require_attr_absent "${attr}"
+		done
+		;;
+	vera)
+		for attr in "${GRACE_ATTRS[@]}"; do
+			require_attr_absent "${attr}"
+		done
+		for attr in "${VERA_ATTRS[@]}"; do
+			require_attr_present "${attr}"
+		done
+		;;
+	esac
+
+	expected_cpu=$((10#${current_cpu}))
+	value=$(read_attr affected_cpus)
+	[ "${value}" = "${expected_cpu}" ] || \
+		fail "cpu${current_cpu} affected_cpus expected ${expected_cpu}, got ${value}"
+
+	for attr in "${COMMON_RW_ATTRS[@]}"; do
+		check_decimal_attr "${attr}"
+	done
+
+	case "${detected_profile}" in
+	grace)
+		for attr in "${GRACE_RW_ATTRS[@]}"; do
+			check_decimal_attr "${attr}"
+		done
+		;;
+	vera)
+		for attr in "${VERA_RW_ATTRS[@]}"; do
+			check_decimal_attr "${attr}"
+		done
+		;;
+	esac
+}
+
+writeback_same_value()
+{
+	local attr="$1"
+	local before
+	local after
+
+	before=$(read_attr "${attr}")
+	printf '%s\n' "${before}" > "$(current_cpumod_dir)/${attr}" || \
+		fail "failed to write back cpu${current_cpu}/${attr}=${before}"
+	after=$(read_attr "${attr}")
+	[ "${after}" = "${before}" ] || \
+		fail "cpu${current_cpu}/${attr} changed across writeback: before=${before} after=${after}"
+}
+
+check_writeback_same_value()
+{
+	local attr
+
+	[ "${ENABLE_WRITES}" = "1" ] || return 0
+
+	for attr in "${COMMON_RW_ATTRS[@]}"; do
+		writeback_same_value "${attr}"
+	done
+
+	case "${detected_profile}" in
+	grace)
+		for attr in "${GRACE_RW_ATTRS[@]}"; do
+			writeback_same_value "${attr}"
+		done
+		;;
+	vera)
+		for attr in "${VERA_RW_ATTRS[@]}"; do
+			writeback_same_value "${attr}"
+		done
+		;;
+	esac
+}
+
+check_invalid_write()
+{
+	local attr="$1"
+	local value="$2"
+	local before
+	local after
+	local file="$(current_cpumod_dir)/${attr}"
+
+	before=$(read_attr "${attr}")
+	if printf '%s\n' "${value}" > "${file}" 2>/dev/null; then
+		fail "cpu${current_cpu}/${attr} accepted invalid value ${value}"
+	fi
+	after=$(read_attr "${attr}")
+	[ "${after}" = "${before}" ] || \
+		fail "cpu${current_cpu}/${attr} changed after invalid write: before=${before} after=${after}"
+}
+
+check_invalid_writes()
+{
+	[ "${ENABLE_INVALID_WRITES}" = "1" ] || return 0
+
+	check_invalid_write pf_dis 2
+	check_invalid_write pf_mode 10
+	check_invalid_write pf_mode 99
+
+	case "${detected_profile}" in
+	grace)
+		check_invalid_write cbusy_filter_threshold 4
+		check_invalid_write cbusy_filter_window 4
+		check_invalid_write cmc_min_ways 8
+		;;
+	vera)
+		check_invalid_write l2spr_cmc_max_ways 8
+		;;
+	esac
+}
+
+check_cpu()
+{
+	current_cpu="$1"
+	detected_profile=""
+	check_sysfs_layout
+	log "cpu${current_cpu}: detected ${detected_profile} sysfs layout"
+	check_writeback_same_value
+	check_invalid_writes
+}
+
+unload_and_verify_cleanup()
+{
+	local cpu
+	local dir
+
+	if [ "${loaded_by_test}" -ne 1 ]; then
+		log "module was already loaded; leaving it in place and skipping unload cleanup check"
+		return 0
+	fi
+
+	rmmod "${MODULE_NAME}" || fail "rmmod failed for ${MODULE_NAME}"
+	loaded_by_test=0
+	for cpu in "${CPU_LIST[@]}"; do
+		dir="$(cpumod_dir "${cpu}")"
+		wait_for_path_state absent "${dir}" || \
+			fail "${dir} still present after unload"
+	done
+}
+
+check_requirements
+load_module
+for current_cpu in "${CPU_LIST[@]}"; do
+	if [ ! -d "$(cpumod_dir "${current_cpu}")" ]; then
+		cpu_is_online "${current_cpu}" || \
+			fail "cpu${current_cpu} went offline or its online state became unreadable"
+		log "cpu${current_cpu}: no cpumod directory; unsupported CPU profile, skipping"
+		continue
+	fi
+
+	check_cpu "${current_cpu}"
+	verified_cpus=$((verified_cpus + 1))
+done
+unload_and_verify_cleanup
+[ "${verified_cpus}" -gt 0 ] || \
+	skip "no selected CPU exposes a supported cpumod profile"
+
+if [ "${reused_loaded_module}" -eq 1 ]; then
+	log "PASS verified_cpus=${verified_cpus} expect_profile=${EXPECT_PROFILE} writes=${ENABLE_WRITES} invalid_writes=${ENABLE_INVALID_WRITES} all_cpus=${ALL_CPUS} (reused pre-loaded module; unload cleanup check skipped)"
+else
+	log "PASS verified_cpus=${verified_cpus} expect_profile=${EXPECT_PROFILE} writes=${ENABLE_WRITES} invalid_writes=${ENABLE_INVALID_WRITES} all_cpus=${ALL_CPUS}"
+fi
+exit 0
-- 
2.43.0

