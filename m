Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349B24A047;
	Mon, 17 Aug 2026 02:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786933446; cv=fail; b=l6Qihfo4H0vqb29vPIyp4gVd9W/fp1L6FRcE+KGGTqWeuQgb7c3Kw7olCy5BuiAxH8a/L4FRVN7seRsApr7wG011Rj1ibXQWCKBE7OeuDvr86Fru2dlAqkXM+69EarJ0Y5Qb+wfbyCb9cvNNw4OJRHgdIw4jMGM/Ch0iIQZ2mH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786933446; c=relaxed/simple;
	bh=xqR7/39TbDTrt8w4jIUP/Jdvtn5UQ3VofUdpVm0WB1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sunOLYJBgHfkQ1Tcxn4nIZSyAnQ1cFd2TE47hk0KmbNuQscRho1r4ti58zluF1+fy9H0F+xbiqUHL8If6HHBc+lkTVq1PvbKk3FPrmFTTTYMGMkmtKWVcTmeH+tz9qJl66xjTcJmQs5eMlXXHbdLKGcAi4StTTbyzhEkboOVMws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eu0HOzh4; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eu0HOzh4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emsxtG3kD5gH9/Oe0cvKkYe8z4hYMche8t9kre7xAyhlmNBYg8qTig4hZSA7lFE28Hgq9kfu8aA88XMaFOhIIHyiPi6A/xY2NFl/okWpJPQa5AGxMeHeik8OMN0HsbE/A7NLXsDfN7vTAVf+AUaDyaeewlxy7KI2V3voLbbyBXCd/5ZMkDPuTvh3d+xd9+JM8LVHRdN+w1SMXQDrY83vR16E0F0Lixu8mXC88PkfJxGU1aEpyCK3M5qHa6yX+179IXCQqKoreD9E1jed4yTgRMXUPcsuV8Px8WC7sCf92WTW1CXUzvnHTMJ54AOXopykNL79/IxEWyiOVn++7jLJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQAxvgqjbvX41xUCvUO7mIi6f9RrgIkDc01xplWyZDc=;
 b=OxXa3NTnbPD3EPqYgy8JpQdI9FgosHldRcKzSDaWI4MZdi5gJHAzBlSu1lq8XvHOVE9Hp3GOzl1lkY/WOVowhAx3LaC5xAXe5xGYvwesw9Zs4uuTaJQ97/U1//OzB+KN4yF0aBls725iKfknGoPm/Sz6QD8ltFLkPzk/jnEka5xP8h2TWnmO+1LbeOIi6vG7hEo27RiXsNuWsNPZcVbDt3rLmoKxYrSEuh8EbmH5bcWCX600AHpowfwv3EjSQ9n7La1AF6Z2fekFhmKKysfzn+nqXZKzlWdkCW7CQiR7iswlKW6N1TRr7Q92CLzlXVUaWLvbOboFc1CY8192+CZMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQAxvgqjbvX41xUCvUO7mIi6f9RrgIkDc01xplWyZDc=;
 b=eu0HOzh4+86qfbmaXrRmFasinRfuQfs74oFjPpN0WmpBlJyWGtr94Q2/Qdsz4Gv5tQ+FzD7AWPRirm/wLlIMe/Qxk0bDX4g2OSlpq33UjIDJ4FUiH039yXKGe+lYM4mrXDJA4KfvFnzR9HR/z3IIgcrHvxPdn9Kv2NvRlCBx6fvtoEBJV1jzSGLqDq+eE5z7Bh4SaHooooZ7sdZ3sjeI6KgmNC0Tb97eyHJtXs4xvgDvrrl+SpqCsYkN0n+1eRqiMTdCsoYoBGbCFViH14Jot/U7qQGRC3dcJWPqzzdjclNTZDAOaY7iG7CPGjBWUwKwbZ+EZOE0TKEBSemfeYgHzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by PH8PR12MB7304.namprd12.prod.outlook.com
 (2603:10b6:510:217::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 02:23:58 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 02:23:58 +0000
From: KobaK <kobak@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: [RFC PATCH 3/3] selftests: arm64: add arm_cpumod kselftest
Date: Mon, 17 Aug 2026 10:23:35 +0800
Message-ID: <20260817022335.3-4-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817022335.3-1-kobak@nvidia.com>
References: <20260817022335.3-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::19) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 508df5d7-76b6-449d-ca48-08defc0697db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ku3yOlH19wL8m4hxpcBJnYc5jqtaKmDKlUDBZ4Mp5DSpEPcG0yYC6sUWF3rkj/znHv2dQ1181xhTWIevH67cvQO4sIYlDNLJIxPgDJYC2ZMS5BBqRRMpFa/Icp5eio4Awc7LutpNed6+6AfGwfG0Ljgz0IcyBZEXcEVMhFCztcCq8DQ2Hqz4ZplRCL1a9vylaHycViOYxhXryx5MMl1BzLDLP3eN6p4zX3i6FZr5K/7zJ2BCWfUEc79iXR6L+cRZ+xap8/KDPGIGO0SnqjcZBaZNXNTqwVOGMAWupo12HJda4nRhIFuczfEJl+jtJOa/HXGMtgZ59PH7VTOB6KqMOog1yYXRo/fcHIF5b2Y+8NP8xGtZ9ohgiWnR/7ZPltxrm4pX7btr9vaOik6ndDYu5r/gzY0BHdRXU6fd0/7+ISPiUk/3cwqgaivl/MA+V9LMpz6dOQcpJ6lIyoyokXZQrbwMGKBWOkj0rgSkYQPjbpcthUpgOLIPyXydFLet2cpEQqU+lC1Ynm3gkbA7R3WVYZM/iXOtuUG/m7Fbm1mmpRENZA6lKgErVR8C8wXIrjhHk7jwWXDIA94OWGP4I4kNN2AbHWlbICyIP9jq6qu8nypgtbTI2QXo3FGsimW/0oASTZi1ceNG0d0HSIgb5WdZJmsqLwf6S+17bwW6NNZf8ho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pDJesf2RAKomQ3AW+1IHl3N/avMDDMnGvunSeZ3LUobU/h2i6O4s5aq3iGeg?=
 =?us-ascii?Q?APIHfZWjJscC/IKRDq+OKosZHpUetcT7PUpJIbGSSch44atGrU4Dx5YyPkFx?=
 =?us-ascii?Q?vsLwtT23jXtu0XdNaRUFRyh+cA8M1VLg7+bG4DNtM7CfpGTjtFxSU1yu4F5a?=
 =?us-ascii?Q?7uAj23yZJvvBL3UQUXHuVzUlwNIaLKvyNdYl4RPKTau75z8GlMowS3VKJCe1?=
 =?us-ascii?Q?2K2hK5/zkOmaFV46Bec50pN0IahoMyyheuqpqroZacyjd5s9K5iVN4tVQSKv?=
 =?us-ascii?Q?GyAMwqfYiC0MM0EKG9kdsEjJEVFkNQtoOo785QGRRVvCm4jV3JLVStLsHwNp?=
 =?us-ascii?Q?oQB8xeJvAI88y8MwxoMgUAkdfZp4zDbuBKa7BZnZ58RVFLSxAv7R7hd9gvMA?=
 =?us-ascii?Q?3qD125CIYp50vpWbN+NP6ZX3WeHJLh5yTBeseMqQjEhoGUE09+hvU+Ozs1+K?=
 =?us-ascii?Q?2Qf/eJayUMwR4ikatxPlrv2pM2kunvOebJdmIaFn4EPL/MGT0DfibAJaVDpH?=
 =?us-ascii?Q?qnp/sNxADfsoN3cJR2oKGCQOPQ/VUnILhC55YTu9J9v90f8jOZOpGETsbzSi?=
 =?us-ascii?Q?M78OCUKsLoS11t9ABSVTuLqN2YJggmmJwIS39ylF+DA7j1nT/jwvsYi8PN9I?=
 =?us-ascii?Q?y99bcAlN49bpIHoTd3L3w/5cFkArXX7D3og1sW+DBGiGbdxCycqG6QaeAPVv?=
 =?us-ascii?Q?q+HyqtXAmF7lqJBcq7PSeZCzymuh716C6IovUfGHeKoFv7FnMUfYKgT24js5?=
 =?us-ascii?Q?2tMKQbztU74ee24VVhQ4JZNzoUHyt6tEj6ZPC/am17VESN4MGYqZbNQMyzdk?=
 =?us-ascii?Q?BJqIffNnEF9VVZ8tPSeRfMOj9POFWSQSFKDFWqKRhR8Ih2y14LeifobeBa+K?=
 =?us-ascii?Q?NUnyqGYXCXagyeI8K0Ke7nFV9B7/n1VlG/Is9rSKFXbdBUtdVRT3jb7RuKeD?=
 =?us-ascii?Q?ksQV82P3ZYb05903g5CBHQfMC4yBi40AJvrq4p8guk/QL59mJ73sfKJvJxPW?=
 =?us-ascii?Q?zAICNlMv6ps8NKRCWZiqmFUmy0vPuyQHVhAYfVxzv35j3VYSO3LflNfI70kK?=
 =?us-ascii?Q?PjNLHECLn4fxwHJjGiqho3hCs+xPrvn2yd4bGpOp7LkDjt8itsseUgQxnxXJ?=
 =?us-ascii?Q?ufjdc1Ozc5FiYN/0aUL46vdjEVJaC07Tyr6yY47vp2+qpwjVJAVp5tfRG4I7?=
 =?us-ascii?Q?drp9wKoR39He+FvXn68hzWgGcZmm6PPa64Cr866QKfk9rlqoo3ued5vB3nKD?=
 =?us-ascii?Q?q7+Xbgpzrk0G6AFUGNgImOuOCxPUpR+DmvdZmj9rmbuF7X1QGknO/26RXAwU?=
 =?us-ascii?Q?iyvBlqjxZGMv2wcFslTOF40EM+mPxyn5ONxCAnjkJaJVQRnpnlX2oTDii1De?=
 =?us-ascii?Q?BUPCSlA1I+nq3ZXjHhqAiVNftxZtB8YQsfchjJu4lsweTXxkR7PvQlu/+qRM?=
 =?us-ascii?Q?IzDscl+N9SiL/LsUF+Z8f8bOcqqed4xbAlW1JmXWqv8aqFBJA3rwVk1Io46U?=
 =?us-ascii?Q?vbuz7u61Hf1iSsvB+OyP71suVIJK2/kKLIyap/TZUHGe7aUGV017ASiFGyF9?=
 =?us-ascii?Q?IqY659GZwr+ZqsLer1wGqjfBwqVAt3ggooH84F6u8X/VthuvcsMh4t/kO5F/?=
 =?us-ascii?Q?Z4VBd2Fciyz5IVipTbxBponnQGzmLnEkccvbCj2jy8M14frPdmeS9Neyr1Hl?=
 =?us-ascii?Q?1cuKxGGEHpyVMYq8oorvGgkrwZs22FPDNN7y+JG2S0axSfs/wTOL3OSGOmJt?=
 =?us-ascii?Q?ScLhCwYgJQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508df5d7-76b6-449d-ca48-08defc0697db
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 02:23:58.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNHsraU/6lOvRlj5s1zYp7p6An4bEC5UthxOQbRAX8gd1VnQdfFmAoZVftAGmEu7B/UVo7cH2h+0tA016ZJNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

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

