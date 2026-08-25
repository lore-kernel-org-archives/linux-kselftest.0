Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A23314C3;
	Tue, 25 Aug 2026 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681843; cv=fail; b=GHAHmjs3T7iXy48YmDBtVwk1EoAym2CDVxwMIOsoeOmfRxrLmzO5I5PeVTGen+H8bX98ugv8MOws1UK9hF2N+YyY+Ktr1ZRxAKTn4FblnzH5fcS0/FlALp13jiT4Ax2C6lFQHETM3iq1jgd43k4rE8nV+jyB9isKuld8l/55Qks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681843; c=relaxed/simple;
	bh=pOavo+i65gZARQvRZFsVJTHP7GYZI+d/ajkYIYunhzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FM5xAefVaQr0OcGlk8VdSI+g2Ty7gjVKxrrFUD699H88xFB+FQxFwKzvWQ5wCVipaIjz3Dlof0Wi5zTCz8bkxSBBSRuHsJRQ5d5liyZmZMFrjTXQZap9Cr6du6clZhhe0oMOkoDwE2/i64omfVtA73kvBtQjiPUXiX6TYfSe1Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sRLHNC78; arc=fail smtp.client-ip=40.107.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sRLHNC78"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVoPWY+znckJ6ndTUwDukk5xIPBmptXLbYAB75epqNCMBrg78XTE6AIynQ2rbyfdHMrDLRMQ3tcZkLIabTeLtQrlLgz1cQF5A4v5ZQRHmGZOYHItRUl0/nXp6jmsljVZ3/jK4vZiVAB4QCDlIw1aWeQjTt+Mg6aG8/1fJR+rjF/Ujc5ctEtyLElUoYSs7cR3eVPTJLLSyItIsN4Z+R+3p+rA4+FBwOxy11UIlrq1kU9Evous1Nkh3RLxjycReLTBv00OAhKUEGT0zYRIE3Izp0mXrZKQsfVfVZt6opxMR54wcqhzgRJIcXHYCe61rwpZfR1iYFgOf45g0O/Zvk97Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCRxdJOd6DMi9nCjxkxgjOEpdGeOFFnQxgkkKHVyZqw=;
 b=BDTD5QLuimVpj1pQlXISbmkDnqjAsbfKBqVKh3eR8e7LGNqv9Jz4u8PJqnsno1ZRCockARHHIMZsWCJsM33OloaTwbdrCcGzH92h2VS4jfhL2G40X+RA9WVyb1oSKC96Wt/ShdyFc1OFKY5U7TyyoCtTgEu+9QKMOE3gkSVf6/osNTX7aogE5SCH3o+i+ExvK9voEdFyPFM9mQzopUIpib6MEHk0FBFnIKfn27u9P6AVbCUr8J3mlCJgseBpMuaA7awqlRYuk4yopE1M1yAqCUH/UCF+SB7nRO7rWW9/IyqMnVX+olTlZxy138Q3H5cG2DUAWGbSi42dxxUjRfaq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCRxdJOd6DMi9nCjxkxgjOEpdGeOFFnQxgkkKHVyZqw=;
 b=sRLHNC78mycT+NHLdqqoDBtUGHt8QImExI7pzXB5TuOppReMtGrhgpb2ymEo7neQ0X50Es/omZslmQOocv2aRziVQhlb5sOmjzLmJ6IgRZrQ4dKEMvU0HnqX5vrphLKKaJZquDqS3DCl/+PDp2s+GmiAdco59aH9/EeyQLWXImMEXg8pCTQySXFa6OUu1Ik6Gid5tIH4vJC69q11zNss0P4PgAqp+Qkluqmi/GS6RL810MLWnUF1iwwObjD4EBjzFc4RvJU8CdwygH6L/BPSQynKzTKO3llOVWMdAC5v0mww58tc3Rfxz349NspgE6G9B3bJPmMtS7f/SSdy/fBUnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by IA0PR12MB7675.namprd12.prod.outlook.com
 (2603:10b6:208:433::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 18:17:17 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 18:17:17 +0000
From: Koba Ko <kobak@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>
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
Subject: [RFC PATCH v2 3/3] selftests: arm64: add arm_cpumod kselftest
Date: Wed, 26 Aug 2026 02:17:01 +0800
Message-ID: <20260825181701.3-4-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825181701.3-1-kobak@nvidia.com>
References: <20260825181701.3-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::18) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 2612a2dc-ed63-4529-fdbf-08df02d51895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uYjoHcCU/6AYL/cOK3KJR2+HyHb8OXZFgKKFXE6+xd30S20bGyIO9ux3/ElZbVJOWDdXituOTMspKuR2MwHtpi1elmi1PdY0LH5kejIyXSHHg++qkhVHoOPctGEiHeWda/0nEhqUu77njbjj69DLX0jWMM3pcIMRYhDOJRG/bBvdF4XcJn6Cy9jZYCJMcaNftJ/91CVZDac9AqAnDtREg4oQ+vl05f14bl2v6bc9AyU6ucmCAFw2cX11QqvWF83m3Xjvsh6eJwVdrOiOxSKBg8m31CoZxa0meeXfD3icx6kMs11cQo/Yxjzi0yR8D2SVDeSU0SF1zqmZ8hXYD6Y2yy7u+lngyOMN+ML2viAUrBnSrUbDy46idOIeHGXH44EZapS8jLaPz5hFkHEY6uKvUqdfx2EG2OuI+fxDKMFkaI8O3lbvUfgBtAD2l4+dgaTlUl5w6TegSrJVze8j3fis4TeERjHaG3pwagmrShfsP0ex2uFRq4/nWVCZ1QzfUtz+GKvTAW9oD+LM8Tmnx2/Jk+RWHOx7yheuUwsw09EiRcz/uninHQg9U/L0o1EPWW1nGAHrQ4+gHDuLIKMVjBkb7vPM2MI3yujzXzKuNFm6qHs739JXgt1U1d/ps9BJv6s3h5XuNKtKOCuxMjLTdfNN0ckMqybEbdMjWCnqMXC/f3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dVYhwYKK5TIDcc+3Rkjy9JEJ8pfRLFZnhF2Zhcbc891h/Nwc6J3+sTz99kd7?=
 =?us-ascii?Q?PkyteK/JiHg8dT/TVawgUOEUD4evHxaRW89+kh735vDc61pj4taJUn5Zy7rC?=
 =?us-ascii?Q?6z640dGFrtmTWnj9yzHeG+yeqaDrbTzW61wPiRMzKzsMuaSCBXAJyuPZ2n8w?=
 =?us-ascii?Q?IfborT6GMCxTePT2jtd3Laahfo4q3g3nTg54FxNNFycmWXZoFgoj2+8sXePY?=
 =?us-ascii?Q?JDfEPdK4uSYV34Rdp6SO3uaXuCrz2Gz0NM3a0wQqhS22TxF/sgIGF+yJbLSy?=
 =?us-ascii?Q?nmmuzk80u0cF2GpaIzaDb02f/RHZP8Kbe8vETF6+WeeCYh53kV5KanXL/Nuo?=
 =?us-ascii?Q?DbY8+yn0liMQmAfczwjIIrPNBU6rG9M00iJhWTHQu+sjRTx4YZX0ilB37NQa?=
 =?us-ascii?Q?tZxEM6TgKdFlLzQPxfjyVGg+8YzmP1s12FYufIjJIT1rU2tTGxW56d1VYH80?=
 =?us-ascii?Q?V3Cxy93Cpq5KCuuwsFE2ChJYmZlDSVDooeFmkO1pkgmIi50I9TWO3fzz6C5w?=
 =?us-ascii?Q?JLNkLSj0EOxgjsBtuVsI+7KfOHOAgfscO46HfxEDMQQbAzpsp/tV7+EHPCjK?=
 =?us-ascii?Q?f3lG3jWLqYL3EeO4MFkTVdao1PiOp64/LpquYCZ8jDzZx048YZf6B38BcN4D?=
 =?us-ascii?Q?J4/mpgW1rhKWBg74t5xxpyZYmYqKFgJxxoq2BHnlKWNwEqh7LWszdKSKlFqN?=
 =?us-ascii?Q?PCobtJ69ExrLcbtUBpZxbZIVopFoLNC/rG9xFncFUIbTSqu0o7uiGIpRpYHf?=
 =?us-ascii?Q?aTuuByH20DGkz0Zcoh3e3kxs15AgSxcOPwd0fXLizrheUy6RnyWUaSN47HsY?=
 =?us-ascii?Q?UZRvahPLeBOtdhwC/5n8nY+5FlmvWvWg/6hfWGgJPLGUzKRxk8cKRcqqfv7V?=
 =?us-ascii?Q?I5zqA26g3DYFrZhk8dg501ksVlKjPRBF7slC0S7RFHCZR8ntZsZOLZoRwtrW?=
 =?us-ascii?Q?FFpSRcURE+vSMdvfYME8wgktTbKuAMZrVbLRyeQgOt6CIYFZLr8Fuvas+E6/?=
 =?us-ascii?Q?empte7IuCAJQmORAN2Iy6zFJNprWSf2i8GgYXbNBGTuiLCPeQroNiYEQNcKC?=
 =?us-ascii?Q?P+/wdmljdSO7JHC/vWOFvsh95lToTddiBYjPPzRlcjRddsnwu4qXc1nOt7+u?=
 =?us-ascii?Q?PhWUkecQyxRkziLVjPLSxC5qEcU7QEGwwOTePy0Fq8OmhTfnYlYQxClnxsdk?=
 =?us-ascii?Q?IMwvezYU12dyapaUEGzmmFXvryhjIpzlNAyJ7vIylSQdmOQvJlRIav/oyFgV?=
 =?us-ascii?Q?GlC4lt0bP4wyD9TfZQZ5f2tyRoOR0a8j6cMi/RN0fp6pwUDou7camIYRVJ2i?=
 =?us-ascii?Q?gVT85lObb90+L4BGRHDnN5cho3UgLkfvrp9HD2sVX69juTIy4Nb0L+4eyu1J?=
 =?us-ascii?Q?6u1OhWE2xWE/hr9ufvj90n2g8JuUf6W9LF5LSY5jf8bhv3qCxkCNHnkQg1Ar?=
 =?us-ascii?Q?iePEJQMdwnSiSUagEgIzYalahTm4E3+LFheAjQr7SCtVSG4Pe5VNOzRxJTc1?=
 =?us-ascii?Q?FAkFfLjNWtWZ+90scHRLENtZi3vtE1dMmBC8J4nZC7wPVygxGHPWHX0pydPJ?=
 =?us-ascii?Q?I+YOwrT9zHMVCBaIa8R+h77N3KrNtjoDY2wHhs+aHAvwWqjSbiyIQ52eP85O?=
 =?us-ascii?Q?hcGvfSKCzfKA8HG6yKEyuyPAgO3iQ4boumKX4avPFAGJQkqqb8sNUCTjUMSz?=
 =?us-ascii?Q?njhdXrO0Xe6BmArNeotqD90MMZ9P+U4fYxcFCBuZzi99lIitkpS5kD47iYOi?=
 =?us-ascii?Q?F1JEJt1yCw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2612a2dc-ed63-4529-fdbf-08df02d51895
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:17:17.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY2WeoZljh9DZxvaK3HVkg08Ioq++dqSu2kYr9zcUav6hVwHTj1vVarnNEKIFugDwPyZQX49Rbq2gdjKtrsUKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

Add a kselftest for the arm_cpumod sysfs ABI. The test loads or reuses the
module and selects either one target CPU or a snapshot of all online CPUs.
In single-CPU mode, skip an offline target before module validation.
Observe the per-CPU online attribute first. If it is absent, immediately
require the CPU directory to still exist before treating the CPU as
non-hotpluggable and online. If the attribute exists, it must be readable
and contain 1.

After module load, recheck the online state before classifying a selected
CPU without a cpumod directory as an unsupported profile. Fail if the CPU
went offline or disappeared, log and skip CPUs that remain online without
a directory, and require at least one selected CPU to expose a supported
Grace or Vera profile. Return KSFT_SKIP if none do.

For supported CPUs, recognize the exposed Grace or Vera profile-specific
layout and validate the matching attributes. Only ARM_CPUMOD_EXPECT_PROFILE
supplies an external profile expectation.

Verify read paths by checking that attributes return decimal values and
that affected_cpus identifies the current CPU as a decimal CPU number.
Validate affected_cpus mode 444 and every visible register-backed control
mode 600 with stat before functional write checks. Optional valid-write
testing writes each current value back. Optional invalid-write testing
checks selected out-of-range values and confirms that the prior value
remains unchanged.

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
 .../selftests/arm64/arm_cpumod/arm_cpumod.sh  | 543 ++++++++++++++++++
 3 files changed, 549 insertions(+), 1 deletion(-)
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
index 0000000000000..a161d2012df4a
--- /dev/null
+++ b/tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh
@@ -0,0 +1,543 @@
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
+check_attr_mode()
+{
+	local attr="$1"
+	local expected="$2"
+	local file="$(current_cpumod_dir)/${attr}"
+	local mode
+
+	mode=$(stat -c %a "${file}") || fail "failed to stat ${file}"
+	[ "${mode}" = "${expected}" ] || \
+		fail "cpu${current_cpu}/${attr} mode expected ${expected}, got ${mode}"
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
+	require_cmd stat
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
+	check_attr_mode affected_cpus 444
+
+	for attr in "${COMMON_RW_ATTRS[@]}"; do
+		check_attr_mode "${attr}" 600
+		check_decimal_attr "${attr}"
+	done
+
+	case "${detected_profile}" in
+	grace)
+		for attr in "${GRACE_RW_ATTRS[@]}"; do
+			check_attr_mode "${attr}" 600
+			check_decimal_attr "${attr}"
+		done
+		;;
+	vera)
+		for attr in "${VERA_RW_ATTRS[@]}"; do
+			check_attr_mode "${attr}" 600
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

