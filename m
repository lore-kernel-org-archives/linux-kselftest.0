Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E726A0B9;
	Fri, 12 Jun 2026 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266517; cv=fail; b=JXlyGt+POYRR3BO9Inj/QPzevRLC9sTLBwc1AmoEB5lC1yigYrlQSzAhUIigKYERl8/5s3H+hE0t/r+YdB0SplE9i84MhkmnnCbgzBoMOzbyDy3nZcdp2dU5GR2kY8ibv8A7h/MiddS/CN44JS1WECDoJKNEo6uPmchV3lHb91U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266517; c=relaxed/simple;
	bh=A/cL/FhTasj5Qoux9e1sIw12tSoPkH4+sK29NNbn8n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QD5cfgzrOgQnm1UH+jD2+qA/stb0/OK2QcPpZYpm4tP52rfpMj+vvmJGiJswESwvWR1P+Y+SJtdtYjpVGUQN34jp+VT6EoUDdxI9Ri5avL+m5IGt4VubNGudp/XXtI4JknRCB0JSDPOqJAFKGUZpj0XYU5kj8YyPl81EkRXwh1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iwJTJrb+; arc=fail smtp.client-ip=52.101.52.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iwJTJrb+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tbj6LWgpLHmlRch3WbRPhYKDKscpe/nUi38sTrfnqcO31fy29jvJ9aG9zEbp4f8lKgyLPZgB31YiZ6ButBOpT/dJSu9rXEozTzSahKcavOUEvsdVfObkosEiAaefrIJKe2Psj7icA5L7VquCnUdcdtFeKe2xPfhOWV/AdlP9hFiDKne1m/qEelEIk0bqCbKvJVMpwSiguT3M7mFA+25orf++rhfAtdaUtSUIpCrLF0orfJa2LSvMYcUgZ6oUlDxTZ76esnL6Tw3qnYJp486obT5ozHErx/oTwtDYgSwVCZ3U0EsNhXzMBQ07jgtLeTpsmsIk2dy1zVEgvLQh4TmFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ngvbEmOwT74OTWh4YQvIlJQUNnrzV3NRNsUUFQSO6M=;
 b=oKHpBWqzxYqTp5VfNC7GXLut3XyhI/1Q6c/tcKW/aMcqRH/jf3iqmaHCsHr1xzvmOWiPanpeoEvftPTgUz0zH+C4fUC7VAu+v9WeYVtKt1uhiFO6iCWxpg2Ggra9ievwnkmX1lCuClr0Z6CJrxK+3lbgLp4ST8SxI80RJlMMJDcCLJU5e6p3INU07sfugzkBPQAOzFWkC5H9u63tNtTwNx7VPi4LS8K4Do7fElftKATFlEsDcAi+rZCTlrLGdBN6GKJW8z04liXSS8UCgiPQnqRlZ86NxGN6It8JW6LCrb1k+O5Go6HSGP+joYEcQJWrSoYxpkxHulQTGUHrsc8vgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ngvbEmOwT74OTWh4YQvIlJQUNnrzV3NRNsUUFQSO6M=;
 b=iwJTJrb+8OaKT1VVDKla5Q2K9QADRnzXUgKh1/LPkXOhlG8I4EMFyTLbN8jeQqEiireScMQZ/5LYdLwVq4jlASeGAmQV8jS8mJbmD+DUAJp6RyYCMeoQYQYP0qw8mio/gM//BijkhHEtZK5gZ2cwjMFKVEAe2ndkqvZDiKTdO7Xw0IXb1rfu7PcZ7/Sa9B91NXariIe1wlw0228s/vpgX9+ghW2M1WBxEyo0tPWkZJEQGn09c8PhtotjCPr4C3XWq5pqBVGwTN7Cjp31ew2dam0jmr5ZYsyC0Huf8UpbS/btg8e6NpJlcisQp1+hcA4u1f6WSxb1tUixAQrQDGYeOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:15:11 +0000
Received: from SJ0PR12MB6733.namprd12.prod.outlook.com
 ([fe80::f00d:2f6b:6f9b:8f97]) by SJ0PR12MB6733.namprd12.prod.outlook.com
 ([fe80::f00d:2f6b:6f9b:8f97%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:15:11 +0000
From: Kai-Heng Feng <kaihengf@nvidia.com>
To: rafael@kernel.org,
	shuah@kernel.org,
	kees@kernel.org
Cc: csoto@nvidia.com,
	mochs@nvidia.com,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v1 4/4] selftests: firmware: Add NVIDIA GHES EINJ selftest
Date: Fri, 12 Jun 2026 20:09:09 +0800
Message-ID: <20260612120929.28965-5-kaihengf@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260612120929.28965-1-kaihengf@nvidia.com>
References: <20260612120929.28965-1-kaihengf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0011.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::17) To SJ0PR12MB6733.namprd12.prod.outlook.com
 (2603:10b6:a03:477::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6733:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f4e89e-2030-4f2e-3964-08dec87c4038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|3023799007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rf9V+E8RAHnzJGO6KoNvdbWSdHWBnZ713BvEcht4zE0oHYOT2gtInkMJH1iFE+UlCmMMSvDj+DQARStu4kqy2LvnYuajDFN7VuoSGRvshnCSP563qMJVCRwlkO4n7DaKOr+422eCCCXt2GfB6GW7rvn6bHUUFxwJXVhkdKUfevQCpJPqrsFwGvqZ5ZZo1td6xh2DdqhspMG2nE39jYNnaaqq+ladzZMXEju5qsuPBRCAz6AF39NzikTqwrTpUN/UVB1qtNJa6ClNBFb7OgL0ti2bQ1Yt2kqLb3XHE/srdy007wSXPpqfNoh1lvCJow4zWDKkWd7XzvNqy9cKotwQsLeLVpYOip8CtIpru97cxBRVHgm4xonmkEShkm1aBfIg7i5qV5ocgacrG7S/rE6abXYNjSdsgZ23D3nSn7BwmKt6cf0Yeu3C5M0M7vRgJKQOrcS8OhmYx2tKbc+79Ot/MXUvoFQaoDJs0ERFffRBatcinSG67jpZwn3OLxawPogU8dW8WdtJYBX+K7P9W4evaWAPoDxBZ5vWki8bp/uxSJi8XjSw2sG1+9L9zD4FWOHdPsImjo6/3JjOP/pCRveG9iaMYfr3+0FvV9Jfw0X9OVfKY5flDkWtetwkELs9l8qx3K1mftysr5iiq/hK9ZXBI5NZ1dYSyAdXnGwf1L4XXBJGYR5xWGn3A5RIpCkXQOJp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6733.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XATrM3QN1iqFNJnjeQvgjVsmmY8AOvWOR06VtcIDq6BQSIdwkxoAwHeUtxxr?=
 =?us-ascii?Q?nCb8hEuXve4qtNzl+EUJmVm3taDrtwZG6qaEfgROp8cNPRhkMzTFYx8WSmJF?=
 =?us-ascii?Q?kN5z8XUDDCcjfgJsF4J1ndaCwAG4lw/eqqVNirAYPEQzuzxF2zFZk7hYdUH0?=
 =?us-ascii?Q?4UNme4NAH9hc2HJyxK2MvgWiUND+2hOhA8Fl4hnDaw/01dD3AUThlr9yogRb?=
 =?us-ascii?Q?+yHeuz6eQHl/h3YdW0jg7v/+EEBALOxAKYt2VLrYdp6KPdXSqcmt/qFo05/i?=
 =?us-ascii?Q?vg9wWDsLHfpwHOAR3m2bsqjviZmRRyACFqeg2jUlZqcVxQAiWRZtmONK5e+3?=
 =?us-ascii?Q?NH9KEjd/dvFx7+KGZQw7t1xRmRZ/uBQh2RaDqzFYTaSWU81IPcdp34QqnTeB?=
 =?us-ascii?Q?UYiysAbADl0fU4YO4ESchVU0W/8cZJ9veNQlhvjlq0TCk6FiuVhkk25GfpbX?=
 =?us-ascii?Q?fsy2+fzmjcJehjDRXeR67w4NL1CCYLqpDbamSFmZgPxsiYfZf98XYUy1UFJe?=
 =?us-ascii?Q?tN/e12Q6t+p95DUFaGzIMRFoYX+y9bqqGRdJ9r2TX/r1WF7KyIuldaR+ZI/l?=
 =?us-ascii?Q?nTr0pFfI8qcmeWpWJFSn1ML6Siatormnl7d95sh6YpQQb1SlG1rwR+4ruQsF?=
 =?us-ascii?Q?N7cQ7RJ8Q9k7DDXQb+v6KlE2r9HWOMwrb9Scjc/GsZVytDkSko0/rhg8D8fQ?=
 =?us-ascii?Q?ftB0SDSieFBbvmWWtPHvQU9xOwNRZgwEwnLnR9taKHhzDNSMUbVxTBKStFLE?=
 =?us-ascii?Q?A9PiBALxRQRVH1ZkF23Gb0mhm7IwA2+QS8RIK5sBalnLVfjNlwu3v9Fmr9tf?=
 =?us-ascii?Q?/jw4+VRHiT0OjPwV0DO/SXmCaGIRFc4sdkJ1EMxosUVgMhzusI4O201/nmOT?=
 =?us-ascii?Q?2VBBSXoMf7DxEd7XdIRHVG9KwNP6mv54OG/8b/hr2yUTruR/8ygCYB+Qthii?=
 =?us-ascii?Q?Y6CLuxYJyB84wUmSAifrQyzeyqYBnXnKvZqLeg8pta7s1UTiapMt9k2gvDRR?=
 =?us-ascii?Q?hNei/p2ZbmUMJsEvuo+6eHeH8nN4Zwr1K+p7BN+FLF1NQFUfTBkHsZ9qnXyD?=
 =?us-ascii?Q?sL66b68mDZUSlEGssreffgLtLEKK2y60XRGFq5oA2Ft6JhkhBGM7bzM2ZFHy?=
 =?us-ascii?Q?sxMfVy/IzLPLO1UL74K8KNuLYjMF7Bx6Q0cWCg/ORloyVHpWFEyC9OXCgwjx?=
 =?us-ascii?Q?7m6W7z48yLYeyragXE/Ow6712AT/e2XfEru+ARKlvNJjbAkBJTt6aNiKpKor?=
 =?us-ascii?Q?vXgPv2MRgkuIW5bD1fFmPIASnLGfJUP1RL21WZzKD9sPCdSD/n5lmSNJIH9x?=
 =?us-ascii?Q?Pqf7bH6GMthyXnZHEt7PAds56FrqLeX8xpICy1OXA2pfbb1biaNXnsyEDzyc?=
 =?us-ascii?Q?Xz+sPZBDOiIaFqW+3qMwCcQyCnw50WUAJZkTdqZiyyjbqqH38kuRcH6LaMFj?=
 =?us-ascii?Q?ZbfpTDpYrRXKqq8TWLZ28uKiP2xY45QKXmTdeYZCLAKczFbV+r37RtDUmU6l?=
 =?us-ascii?Q?1F/Nf8/oCIP6CWuqCdQpLQ3L2icI1ckI2qJcuMhN0kY2krRAQkNmiaGnJgAf?=
 =?us-ascii?Q?9Rp+gttcwM8x20n8i/kha+harwMvnDWAw/86z7G8QMRcMGER9cu+b6I6geL/?=
 =?us-ascii?Q?TVXqp2jmlxkLpScWtLwJryMuM5s9gJ5j7nESi10Q0aAgf95h3AlEnNmHoz5Q?=
 =?us-ascii?Q?TCYFNvnPYOJTWSUoxLdn/MAamPkhxdIqjcswEM/HrCXIO/4frOdEmSII+sqq?=
 =?us-ascii?Q?40DhAvRsHw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f4e89e-2030-4f2e-3964-08dec87c4038
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:15:11.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 250iPHVNmEfYIcLYb091S1Ru5nJMgia7OR8uldr0lrGFI3Lu0al5pOPAyzMjDVFqvmRxzQ7heZzjkm+zb1fn9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459

Exercise the full driver path on real Grace and Vera hardware using
ACPI EINJ to inject CPER sections and validate the kernel log output.
KUnit covers the parser in isolation; this test covers the path from
firmware notification through GUID dispatch to decoded output.

Signed-off-by: Kai-Heng Feng <kaihengf@nvidia.com>
---
 tools/testing/selftests/firmware/Makefile     |   4 +-
 tools/testing/selftests/firmware/config       |   5 +
 tools/testing/selftests/firmware/einj_lib.sh  | 189 ++++++++++++++++++
 .../selftests/firmware/ghes_nvidia_einj.sh    | 144 +++++++++++++
 .../firmware/ghes_nvidia_einj_profiles.sh     |  46 +++++
 5 files changed, 386 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/firmware/einj_lib.sh
 create mode 100755 tools/testing/selftests/firmware/ghes_nvidia_einj.sh
 create mode 100755 tools/testing/selftests/firmware/ghes_nvidia_einj_profiles.sh

diff --git a/tools/testing/selftests/firmware/Makefile b/tools/testing/selftests/firmware/Makefile
index 7992969deaa2..b753dd123860 100644
--- a/tools/testing/selftests/firmware/Makefile
+++ b/tools/testing/selftests/firmware/Makefile
@@ -3,8 +3,8 @@
 CFLAGS = -Wall \
          -O2

-TEST_PROGS := fw_run_tests.sh
-TEST_FILES := fw_fallback.sh fw_filesystem.sh fw_upload.sh fw_lib.sh
+TEST_PROGS := fw_run_tests.sh ghes_nvidia_einj.sh
+TEST_FILES := fw_fallback.sh fw_filesystem.sh fw_upload.sh fw_lib.sh einj_lib.sh ghes_nvidia_einj_profiles.sh
 TEST_GEN_FILES := fw_namespace

 include ../lib.mk
diff --git a/tools/testing/selftests/firmware/config b/tools/testing/selftests/firmware/config
index 6e402519b117..1b68e638d0b7 100644
--- a/tools/testing/selftests/firmware/config
+++ b/tools/testing/selftests/firmware/config
@@ -4,3 +4,8 @@ CONFIG_FW_LOADER_USER_HELPER=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_FW_UPLOAD=y
+CONFIG_DEBUG_FS=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_EINJ=y
+CONFIG_ACPI_APEI_GHES_NVIDIA=y
diff --git a/tools/testing/selftests/firmware/einj_lib.sh b/tools/testing/selftests/firmware/einj_lib.sh
new file mode 100644
index 000000000000..ca569a9fe5b0
--- /dev/null
+++ b/tools/testing/selftests/firmware/einj_lib.sh
@@ -0,0 +1,189 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+EINJ_TABLE=/sys/firmware/acpi/tables/EINJ
+EINJ_DEBUGFS=/sys/kernel/debug/apei/einj
+NVIDIA_PLATFORM_GLOB=/sys/bus/platform/devices/NVDA2012:*
+NVIDIA_DRIVER_DIR=/sys/bus/platform/drivers/nvidia-ghes
+
+einj_skip()
+{
+	echo "$0: $1" >&2
+	exit $ksft_skip
+}
+
+einj_require_root()
+{
+	[ "$(id -u)" -eq 0 ] || einj_skip "must be run as root"
+}
+
+einj_require_debugfs()
+{
+	[ -d /sys/kernel/debug ] || einj_skip "debugfs is not mounted at /sys/kernel/debug"
+}
+
+einj_require_einj()
+{
+	[ -e "$EINJ_TABLE" ] || einj_skip "ACPI EINJ table is missing"
+	if [ ! -d "$EINJ_DEBUGFS" ]; then
+		modprobe einj 2>/dev/null || true
+	fi
+	[ -d "$EINJ_DEBUGFS" ] || einj_skip "EINJ debugfs directory is missing"
+}
+
+einj_require_vendor_einj()
+{
+	[ -e "$EINJ_DEBUGFS/vendor" ] || einj_skip "NVIDIA vendor EINJ metadata is missing"
+	[ -e "$EINJ_DEBUGFS/vendor_flags" ] || einj_skip "NVIDIA vendor EINJ flags are missing"
+}
+
+einj_require_available_error_type()
+{
+	local available
+
+	available=$(einj_read_trimmed_value available_error_type)
+	[ -n "$available" ] || einj_skip "available_error_type is missing"
+}
+
+einj_read_trimmed_value()
+{
+	local file=$1
+
+	einj_read_value "$file" | tr -d '\n'
+}
+
+einj_require_writable_value()
+{
+	local file=$1
+
+	[ -w "$EINJ_DEBUGFS/$file" ] || einj_skip "$file is not writable"
+}
+
+einj_require_writable_profile()
+{
+	local file
+
+	for file in error_type flags vendor_flags param1 param2 param3 param4 notrigger; do
+		einj_require_writable_value "$file"
+	done
+}
+
+einj_find_bound_nvidia_device()
+{
+	local dev
+
+	for dev in $NVIDIA_PLATFORM_GLOB; do
+		[ -e "$dev" ] || continue
+		if [ "$(readlink -f "$dev/driver" 2>/dev/null)" = "$NVIDIA_DRIVER_DIR" ]; then
+			echo "$dev"
+			return 0
+		fi
+	done
+
+	return 1
+}
+
+einj_require_bound_nvidia_device()
+{
+	local dev
+
+	dev=$(einj_find_bound_nvidia_device) || einj_skip "no bound NVIDIA GHES device"
+	echo "$dev"
+}
+
+einj_read_value()
+{
+	local file=$1
+
+	cat "$EINJ_DEBUGFS/$file"
+}
+
+einj_write_value()
+{
+	local file=$1
+	local value=$2
+
+	printf '%s\n' "$value" > "$EINJ_DEBUGFS/$file"
+}
+
+einj_restore_value()
+{
+	local file=$1
+	local value=$2
+
+	# Some EINJ controls read back as an empty string when unset, but the
+	# debugfs write handler has no matching "clear" operation.
+	[ -n "$value" ] || return 0
+	einj_write_value "$file" "$value"
+}
+
+einj_save_state()
+{
+	EINJ_SAVED_ERROR_TYPE=$(einj_read_value error_type)
+	EINJ_SAVED_FLAGS=$(einj_read_value flags)
+	EINJ_SAVED_PARAM1=$(einj_read_value param1)
+	EINJ_SAVED_PARAM2=$(einj_read_value param2)
+	EINJ_SAVED_PARAM3=$(einj_read_value param3)
+	EINJ_SAVED_PARAM4=$(einj_read_value param4)
+	EINJ_SAVED_VENDOR_FLAGS=$(einj_read_value vendor_flags)
+	EINJ_SAVED_NOTRIGGER=$(einj_read_value notrigger)
+}
+
+einj_restore_state()
+{
+	[ -n "${EINJ_SAVED_ERROR_TYPE+x}" ] || return 0
+
+	einj_restore_value error_type "$EINJ_SAVED_ERROR_TYPE"
+	einj_restore_value flags "$EINJ_SAVED_FLAGS"
+	einj_restore_value param1 "$EINJ_SAVED_PARAM1"
+	einj_restore_value param2 "$EINJ_SAVED_PARAM2"
+	einj_restore_value param3 "$EINJ_SAVED_PARAM3"
+	einj_restore_value param4 "$EINJ_SAVED_PARAM4"
+	einj_restore_value vendor_flags "$EINJ_SAVED_VENDOR_FLAGS"
+	einj_restore_value notrigger "$EINJ_SAVED_NOTRIGGER"
+}
+
+einj_emit_kmsg_marker()
+{
+	local tag=$1
+	local marker
+
+	marker="ghes-nvidia-einj:${tag}:$$:${RANDOM}"
+	printf '%s\n' "$marker" > /dev/kmsg
+	printf '%s\n' "$marker"
+}
+
+einj_capture_dmesg_after_marker()
+{
+	local marker=$1
+
+	dmesg | awk -v marker="$marker" '
+		found { print }
+		index($0, marker) { found = 1 }
+	'
+}
+
+einj_wait_for_dmesg_after_marker_contains()
+{
+	local marker=$1
+	local needle=$2
+	local timeout=${3:-10}
+	local i
+	local slice
+
+	for i in $(seq 1 "$timeout"); do
+		slice=$(einj_capture_dmesg_after_marker "$marker")
+		if printf '%s\n' "$slice" | grep -Fq "$needle"; then
+			printf '%s\n' "$slice"
+			return 0
+		fi
+		sleep 1
+	done
+
+	return 1
+}
diff --git a/tools/testing/selftests/firmware/ghes_nvidia_einj.sh b/tools/testing/selftests/firmware/ghes_nvidia_einj.sh
new file mode 100755
index 000000000000..6fc4d3189235
--- /dev/null
+++ b/tools/testing/selftests/firmware/ghes_nvidia_einj.sh
@@ -0,0 +1,144 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+TEST_DIR=$(dirname "$0")
+source "$TEST_DIR/einj_lib.sh"
+source "$TEST_DIR/ghes_nvidia_einj_profiles.sh"
+
+einj_assert_nvidia_cper_output()
+{
+	local profile=$1
+	local output=$2
+
+	if printf '%s\n' "$output" | grep -Fq 'Malformed NVIDIA'; then
+		echo "$0: $profile produced malformed NVIDIA CPER output" >&2
+		printf '%s\n' "$output" >&2
+		return 1
+	fi
+
+	if printf '%s\n' "$output" | grep -Fq 'NVIDIA Grace CPER section'; then
+		if ! printf '%s\n' "$output" | grep -Fq 'signature:'; then
+			echo "$0: $profile Grace output missing signature line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		if ! printf '%s\n' "$output" | grep -Fq 'error_type:'; then
+			echo "$0: $profile Grace output missing error_type line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		if ! printf '%s\n' "$output" | grep -Fq 'number_regs:'; then
+			echo "$0: $profile Grace output missing number_regs line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		if ! printf '%s\n' "$output" | grep -Fq 'instance_base:'; then
+			echo "$0: $profile Grace output missing instance_base line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		return 0
+	fi
+
+	if printf '%s\n' "$output" | grep -Fq 'NVIDIA Vera CPER section'; then
+		if ! printf '%s\n' "$output" | grep -Fq 'signature:'; then
+			echo "$0: $profile Vera output missing signature line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		if ! printf '%s\n' "$output" | grep -Fq 'event_type:'; then
+			echo "$0: $profile Vera output missing event_type line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		if ! printf '%s\n' "$output" | grep -Fq 'event_sub_type:'; then
+			echo "$0: $profile Vera output missing event_sub_type line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		if ! printf '%s\n' "$output" | grep -Fq 'event_context_count:'; then
+			echo "$0: $profile Vera output missing event_context_count line" >&2
+			printf '%s\n' "$output" >&2
+			return 1
+		fi
+		return 0
+	fi
+
+	echo "$0: $profile did not emit a recognized NVIDIA CPER section" >&2
+	printf '%s\n' "$output" >&2
+	return 1
+}
+
+einj_run_profile()
+{
+	local profile=$1
+	local marker
+	local output
+
+	if ! einj_select_profile "$profile"; then
+		echo "$0: unknown safe NVIDIA EINJ profile: $profile" >&2
+		return 1
+	fi
+
+	einj_require_writable_profile
+
+	printf '%s: running safe sample %s\n' "$0" "$profile"
+	marker=$(einj_emit_kmsg_marker "$profile")
+
+	einj_write_value error_type "$EINJ_PROFILE_ERROR_TYPE"
+	einj_write_value flags 0
+	einj_write_value vendor_flags "$EINJ_PROFILE_VENDOR_FLAGS"
+	einj_write_value param1 "$EINJ_PROFILE_PARAM1"
+	einj_write_value param2 "$EINJ_PROFILE_PARAM2"
+	einj_write_value param3 "$EINJ_PROFILE_PARAM3"
+	einj_write_value param4 "$EINJ_PROFILE_PARAM4"
+	einj_write_value notrigger 0
+	einj_write_value error_inject 1
+
+	output=$(einj_wait_for_dmesg_after_marker_contains "$marker" "$EINJ_PROFILE_BANNER" 10) || {
+		printf '%s: %s not supported on this platform\n' "$0" "$profile"
+		return "$ksft_skip"
+	}
+
+	einj_assert_nvidia_cper_output "$profile" "$output"
+}
+
+einj_cleanup()
+{
+	local status=$1
+
+	if ! einj_restore_state; then
+		echo "$0: failed to restore EINJ state" >&2
+		[ "$status" -eq 0 ] && status=1
+	fi
+
+	exit "$status"
+}
+
+main()
+{
+	local profile
+	local passed=0
+
+	einj_require_root
+	einj_require_debugfs
+	einj_require_einj
+	einj_require_vendor_einj
+	einj_require_available_error_type
+	einj_save_state
+	trap 'einj_cleanup "$?"' EXIT
+
+	einj_require_bound_nvidia_device
+
+	for profile in $(einj_list_profiles); do
+		einj_run_profile "$profile" && passed=$((passed + 1)) || {
+			[ "$?" -eq "$ksft_skip" ] || exit 1
+		}
+	done
+
+	[ "$passed" -gt 0 ] || einj_skip "no NVIDIA EINJ profiles produced output"
+}
+
+main "$@"
diff --git a/tools/testing/selftests/firmware/ghes_nvidia_einj_profiles.sh b/tools/testing/selftests/firmware/ghes_nvidia_einj_profiles.sh
new file mode 100755
index 000000000000..b25461d2238c
--- /dev/null
+++ b/tools/testing/selftests/firmware/ghes_nvidia_einj_profiles.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+# Run both architecture profiles on every platform; firmware silently ignores
+# selectors it does not support, so a timeout just means "not this platform".
+EINJ_PROFILE_NAMES="cmet_dump_status_grace cmet_dump_status_vera"
+
+einj_list_profiles()
+{
+	printf '%s\n' $EINJ_PROFILE_NAMES
+}
+
+einj_select_profile()
+{
+	local profile=$1
+
+	case "$profile" in
+	cmet_dump_status_grace)
+		# Grace CMET dump/status: informational sample, selector 3.
+		EINJ_PROFILE_ERROR_TYPE=0x80000010
+		EINJ_PROFILE_VENDOR_FLAGS=1
+		EINJ_PROFILE_PARAM1=3
+		EINJ_PROFILE_PARAM2=0
+		EINJ_PROFILE_PARAM3=0
+		EINJ_PROFILE_PARAM4=0
+		EINJ_PROFILE_BANNER='NVIDIA Grace CPER section'
+		;;
+	cmet_dump_status_vera)
+		# Vera CMET-NULL dump/status: informational sample, selector 0.
+		EINJ_PROFILE_ERROR_TYPE=0x80000010
+		EINJ_PROFILE_VENDOR_FLAGS=1
+		EINJ_PROFILE_PARAM1=0
+		EINJ_PROFILE_PARAM2=0
+		EINJ_PROFILE_PARAM3=0
+		EINJ_PROFILE_PARAM4=0
+		EINJ_PROFILE_BANNER='NVIDIA Vera CPER section'
+		;;
+	*)
+		return 1
+		;;
+	esac
+
+	return 0
+}
-- 
2.50.1 (Apple Git-155)

