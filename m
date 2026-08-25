Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53778347505;
	Tue, 25 Aug 2026 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681840; cv=fail; b=sAhWMWj+lYKac5F9pFJ84KlFSLOrWCiLt36HSsH1etaH29XAfbxHIbExfvRq7has5XuLAMr2q5RFWs/1NT1Pd485i3Ccj8FFeNZHlmI8mtjJrveVEpv8GdGWx7Bk6NNT+AyxLJi7BNTSIHksHS5bC/ZkkyJmiUMQe3dhB+UeuFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681840; c=relaxed/simple;
	bh=K3Dw2+h+Bqzux+Q8IJmhk31/9DSirrHYsFN601M/s1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvSc07l7E7ZFLPA22d++JQ3Wr2+5ne4OvVyAn7n8xRZ9MAFiOBt7S0uI9/tF7rcY3XLQdLVNNzEQ98CuR6fcS3NNBhZPjLO6umP5DJmkWv+2rtKZlUfx9DS/yGzBLrdIjg9pksDXYVz1UoUbVT8iDnX5k2xPTwkezWyrcJMjSaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F1VfB2Tz; arc=fail smtp.client-ip=40.107.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F1VfB2Tz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjU0/PjKLqvzPXWqvuHBMomx+MIU1cxmrocR6iMO8TMrtH6LyndrTKT9CmErHoHkXb8WE7zniwEzgIW7YaE44xU3w72uqdtxJlu+KcyrANObX2KPAXbLuB4zH1sVzXnfJeOdQb14gsJUMg/JVLm5U0t74q7/lsGMqBxfY467skKh+kQuNw+266OOLNlndCHtLfuEENydcgRAAWpliimU9pZBZkhDAfI9pckULg2Q6bRcWYebRKQpJlXsfiW4aExyOtBj+YH5vzdDlgbnNWg3vw8Ic+YiDE3k5v8FXbNXtfQEbErj+d0LHRD+Wrix5DtXu1rPDGc481Bmmw9W3Gjwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/3TQFD4h5Gz2cObvaCD/Z/WQqrA8cEtpo+oWXJLaMU=;
 b=adrzoiQF/NRtAPMpxVnvWPWH08Eyy0SabDh2jvrAFMRDuhhpevmxQ280Igf/LunM3asRMWcD8j1Tamie1QiOZ7t/+r/IzSCdp00UmwjAN6HxqpzDV2L7jtvYGgQhOE95aG13uMyhqO36bOzpmB5wRCgO2y+5tZVFRZcoFbOY/D/ixU/hFc/Lkt2L2fctcvzvOxun/pt595vQLEj2AeSa9DNCW4YHky29nX/HeJctp/xGiXLIxkMkDq4HwVe/k4b7Hr03+QHJYuY8Lfw9PzbvRhdThukzPBShxJi9aXjudBHcqbW2cpPaPixtm4KAR1C8SNQhSwsYbOThg4UeC+GvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/3TQFD4h5Gz2cObvaCD/Z/WQqrA8cEtpo+oWXJLaMU=;
 b=F1VfB2Tz7gl3RlVlC27fgGJSUf3wPERIFaA47/VH/3LCNHjZtQUT/ef20K8OyA4l4stM/y8mKzJTuXHrECGHViqDfe5kOqVetR1lDnSRBTemTmLfB2XKQ2J3+946MXJ/3hSlx6i30BqXFwBXUvnzDIdFbzv9lbMLS4tFelVs9TEgQ3PWgdNGKWnEdxVdzk1VL93mmygZrlvnxJVfkOOn4qafGlN92h6po679aVA64oUXdY1T0VjemDuvD4Unk+tSwnjhwLMaRG5YCbJkb7g0gjdfbIKML//YO9LIyeo/opexaAKcbldnxruD0qZxN3K1DFy2Wtd5+EnWd51qbQ2gtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by IA0PR12MB7675.namprd12.prod.outlook.com
 (2603:10b6:208:433::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 18:17:09 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 18:17:09 +0000
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
Subject: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation sysfs interface
Date: Wed, 26 Aug 2026 02:16:59 +0800
Message-ID: <20260825181701.3-2-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825181701.3-1-kobak@nvidia.com>
References: <20260825181701.3-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: d67e5779-99f2-4b3a-d251-08df02d513a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jLUI+aYp4VDg/CborNIl9e9WkDvfh1WCS9vKVwgmx1E6p2lGtpQDx3aHRcZebobyYsAs7gz/kDn91MTWDn/N3+55fDWPfqasXUhnxSpqnHxsopwDkhi+nrndO0WUMGXXL3X7Lz2G8TT7VwNB+QOiQp42NCN/W3V9aWg42UoXbIUpf0fRXe77e7SiaZpcSqgLk/o9VGolRHOuFvMQQrr5T15Hf13z2ExwTDf3jjysM2SaqvGmTN1DDuXbHLrGMi/At7akNSkb2pBk/gzsh4hsPv3/KH1g8cIgz69jDciNtuJ+4y4hlOl/FFAFw2aDnkrSrW6bQuJTg91ZVDwN+9b4BFpy2QNV8bL5VR7A4zJ3YSQvod0hkvPocKxm14tfOEn/DMThj+afpmz0De9Gm24/GHoppYCiEPeqyYo49KSOWaFtz6IR5cJFXg59GcrpfreU4bilwkFoM9GxH8jMDqI+DScGMCyVN75Y7ftDV+czAE1td6rehnVnVoOk+QUNALzVAkcJz6mcKERd2NzeciCKNpiIVFQzCUGXt5C5K7UVH+znwxhWeuqCwSSitNdbm5sFMmoZbCP0nncC3nM9VpvBKh15Dqn9Mt5ljCmNhHI2zEGjf/5fIuRHZQsVYDpmuq0PO+4JOdg53qu9jEyYjASOYC2bsLtgKbkE+e1rltpAF7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AoM0QQFJVncp3PhYehHBgW9B8YEcKkFq9G4SRkcjqiQZZfp4vFbJOhS+y/FH?=
 =?us-ascii?Q?0NDCNVZwsx4y4ybOCPCOCIVZDP+7VsWqgJOo076lnszScD1xKvfBTfDbfB7R?=
 =?us-ascii?Q?/+zVb5uptrLej/RdwPHeWpZxP1rjLvVEZFLR+ZUhtGSDQh/KZkxbZ6W0kwFp?=
 =?us-ascii?Q?sg1pEHIOOwnh9rwGUoxWAk/qwWpSNyuhc1wWWugjmBdmmrVhZDudLqifnqGG?=
 =?us-ascii?Q?WgRpskOeI6O2i5gnLj/hDgA9AuN/uP7nHhB+zVSwk3jhprz2m8RewyZY1XEg?=
 =?us-ascii?Q?aO4S8CnkyMQQO8TDMCjJPCg6x8hl4dMDE93ByaQUWQcZlq+5OGUZYeL96IBt?=
 =?us-ascii?Q?E9VTSM6UxC2tRxoz764uJvyRghi4Ezj1JOgtYTR26M2OpKZEi5D4lTyxa2GO?=
 =?us-ascii?Q?d1Ch87iko1UzBvA5lM5ufVMjzHnEgndKxENkKpQR6ab77FkPFhtFM34DaZ9i?=
 =?us-ascii?Q?OzcZ3BIcnyP6z5gwS4WkdWHY5CPRbCMoDLuLAnRtwl6uN18lz2elIJMO+S9Q?=
 =?us-ascii?Q?nfrsvKVYgUTfDp1v5pwtjPPMeWsbce8waYxNL6T8Wktv1GZ/Y2XylkrBqKoM?=
 =?us-ascii?Q?b2amuqse1Pd9gsIzuhueP3NZjLEUprFUilpyolIlWYuzl8tioS+LXuqgnnqV?=
 =?us-ascii?Q?XNZgHdnP4iTYvr4N0pUD2+KO+OcY5Mr4nbVdXGaRy5gFVx3UF5j3idIANb+q?=
 =?us-ascii?Q?7kor4aC1NJ273E1rtzbAa3U8qWLjopPXCbyGBrEBbU6eqgOtWdXZ+zehMV3D?=
 =?us-ascii?Q?23JYqQq2AsMVzBBr6UOvBLfvHJK1ltdAWi5OZSlL4hbcY44P9j8QoWIvfS6e?=
 =?us-ascii?Q?NZKM+ejOQeclbSCdgwrBYVPJxGHOcEidbUuKKiOViE14NBE7fLFMbs6j7jGf?=
 =?us-ascii?Q?Dv7TxhQw6UxLHmrwHiAxg/OOZ+koeMfQODTT1qhOWI+EkmQp2SUmmZYK3Evl?=
 =?us-ascii?Q?qAK8Yq/vm3dbpNNtl9jaXDG4tr/culisgiTW0WZa+gpx8tWl5fjRMbM55Lwk?=
 =?us-ascii?Q?bxXLuWLhMi/HTj01YV0uw8eX2wd+mDWkOSpLCyS2X1Aw9XMGd4xsRsrj7Tpz?=
 =?us-ascii?Q?uvAh/9D3hlXtRAFzT2T24ZdHvBxuM1NTY6HjcPpIDrUoz0pQnQaHuPtXMNPA?=
 =?us-ascii?Q?O6YL37CqePSRrWjagj7nu6Kk8CWF6cymgB8TWJYYlJpjcs7xLJskZ65EEx2j?=
 =?us-ascii?Q?iS5jIyxzh6b5jWxHzmkVw11t+oUvsGKBq0zBrqJC6q0jsAomreasQB7HMdMm?=
 =?us-ascii?Q?COe5BhdWlTAwY3zaz6b3K4+lk7KitQfwrieVpB4AmAWXuOxnhMf3ZBQrqQHz?=
 =?us-ascii?Q?8Hw1Sy8mcJcgycW12MYpxRzCGzT41TjrGaCUAzo1jT7Mi6/ELcnIwsaIHAzC?=
 =?us-ascii?Q?29VVmGMFCR/1fZF702MIdDPWX4RI3IGCXe2kJFsMznlOXzze7xyth34SNCDG?=
 =?us-ascii?Q?pHZF8f2JHCwWAMMgHmdCCv7h1LN+bxs9JTGs5R1vXMxozcy97NysvH0A2AV+?=
 =?us-ascii?Q?Vs+JLZNBuzhlhGB4EdyEWOD9gy//RFe1gKDAR8HxGF6c6wXJ8WBl9sk1cXLP?=
 =?us-ascii?Q?i6auWL8F52MYCtEGYFM4pgPU6vAjtaYqMdFaPY270rpb5WxGNJVLWNtJnLvG?=
 =?us-ascii?Q?Xm9BT+vEvYz3bPvBOb66T2nxkqdUzVDKpb/hh48aVUbfXBcwtif5boiIP9/A?=
 =?us-ascii?Q?LVp1HyaqzSQnAUSvZI5HIF0m5ukDcidtkAS5yE70/Wwf4KHWPNyjRGUN3YHB?=
 =?us-ascii?Q?M57gSv6MeQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67e5779-99f2-4b3a-d251-08df02d513a5
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:17:09.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW1+DP4QyUkzRA8bUY99gLJpdYRORiO6fiQc+rn0VXb3hdME/SFa6BfhF+l4iQ5sC6aMeUiDJIv3qjJNJ8ZBhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

Performance characterization on arm64 systems sometimes needs a way to
inspect and bracket selected implementation-defined prefetch and cache
controls without exposing raw register contents. Add an RFC-only arm64
cpumod interface that presents a small set of named, range-checked
per-CPU sysfs attributes under each CPU device.

Establish the Kconfig and Makefile plumbing, CPU profile detection for
Grace and Vera from the target CPU's MIDR, register-field descriptors,
per-CPU kobject and attribute helpers, locking, and target-CPU read/write
callbacks. Common attributes are exposed for all supported profiles,
while Grace- and Vera-specific fields are exposed only for the matching
profile. Place the option at the end of the top-level Kernel Features
menu because these implementation controls are not tied to an Arm
architecture revision.

Per-CPU cpumod sysfs state follows the CPU lifecycle. Module
initialization populates subtrees for every online CPU while holding
cpus_read_lock(), so initial enumeration and CPU hotplug state
registration are serialized against concurrent topology changes. Offline
CPUs are intentionally skipped during initial setup because target-CPU
MIDR detection requires an IPI-capable online CPU; a later online callback
creates their subtree.

Profile detection reads MIDR through a synchronous callback on the CPU
owning the sysfs subtree and returns nonzero only when that dispatch
fails, so no IPI error can be hidden. After a successful read, retain
CPUMOD_PROFILE_UNKNOWN as the unsupported-profile sentinel. Subtree
creation skips that profile during both initial online enumeration and
later CPUHP online callbacks without blocking module load or CPU hotplug.
Object and sysfs setup failures remain fatal and are propagated.

Keep the dynamically allocated kobject state in a private per-CPU pointer
instead of the CPU device's generic driver-data slot. The online callback
is idempotent when that pointer already records a subtree. The offline
callback clears the private pointer before dropping the kobject reference,
allowing the release callback to retain ownership of the final free.

Register-backed controls are root-only read/write files. Reads
synchronously execute on the target CPU and return the live register field
value from that callback. Writes remain range-checked and continue to log
the target-CPU readback after the register update.

Register the dynamic CPUHP state with
cpuhp_setup_state_nocalls_cpuslocked(). The nocalls form avoids replaying
startup callbacks for CPUs already initialized by the explicit online
enumeration. On init failure, release the CPU read lock, destroy all
subtrees created so far, and return the error. Module exit removes the
CPUHP state with the matching nocalls helper and tears down all remaining
per-CPU state across possible CPUs.

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Tushar Dave <tdave@nvidia.com>
Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
Signed-off-by: Koba Ko <kobak@nvidia.com>
---
 arch/arm64/Kconfig                      |  17 +
 arch/arm64/kernel/Makefile              |   1 +
 arch/arm64/kernel/arm_cpumod.c          | 458 ++++++++++++++++++++++++
 arch/arm64/kernel/arm_cpumod_internal.h |  93 +++++
 4 files changed, 569 insertions(+)
 create mode 100644 arch/arm64/kernel/arm_cpumod.c
 create mode 100644 arch/arm64/kernel/arm_cpumod_internal.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919b..5e4ada4884b89 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2417,6 +2417,23 @@ config ARM64_CONTPTE
 	  bit, for any mappings that meet the size and alignment requirements.
 	  This reduces TLB pressure and improves performance.
 
+config ARM64_CPUMOD
+	tristate "Arm CPU prefetch modulation sysfs controls"
+	help
+	  Expose selected CPU implementation control register fields through
+	  per-CPU sysfs attributes for performance characterization.
+
+	  The exposed controls allow hardware prefetch and cache-management
+	  policy fields to be inspected and adjusted on CPUs where firmware
+	  permits EL1 access to the relevant implementation control registers.
+	  Systems where firmware traps or blocks these writes cannot use this
+	  interface.
+
+	  This interface is intended for controlled performance evaluation and
+	  should not be enabled by default on production systems.
+
+	  If unsure, say N.
+
 endmenu # "Kernel Features"
 
 menu "Boot options"
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index d2690c3ec5288..f180a52284e7d 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
 obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
 obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
+obj-$(CONFIG_ARM64_CPUMOD)		+= arm_cpumod.o
 obj-$(CONFIG_ARM64_MTE)			+= mte.o
 obj-y					+= vdso-wrap.o
 obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
diff --git a/arch/arm64/kernel/arm_cpumod.c b/arch/arm64/kernel/arm_cpumod.c
new file mode 100644
index 0000000000000..bf21521594495
--- /dev/null
+++ b/arch/arm64/kernel/arm_cpumod.c
@@ -0,0 +1,458 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
+ */
+
+#define pr_fmt(fmt) "cpumod: " fmt
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/device.h>
+#include <linux/cpu.h>
+#include <linux/mutex.h>
+#include <linux/percpu.h>
+#include <linux/slab.h>
+#include <asm/cputype.h>
+#include <asm/sysreg.h>
+#include <linux/bits.h>
+#include "arm_cpumod_internal.h"
+
+#define DRIVER_DESC "CPU Modulation Kernel Module"
+
+/* Disables hardware prefetching.
+ * 0b0 Enables hardware prefetching. This is the default value.
+ * 0b1 Disables hardware prefetching.
+ */
+#define CPUECTLR_PF_DIS				(15)
+#define CPUECTLR_PF_DIS_MSK			BIT_ULL(15)
+
+#define CPUECTLR_CMC_WAYS			(61)
+#define CPUECTLR_CMC_WAYS_MSK			GENMASK_ULL(63, 61)
+
+#define CPUECTLR2_PF_MODE			(11)
+#define CPUECTLR2_PF_MODE_MSK			GENMASK_ULL(14, 11)
+
+#define CPUECTLR2_CBUSY_FILTER_WINDOW		(9)
+#define CPUECTLR2_CBUSY_FILTER_WINDOW_MSK	GENMASK_ULL(10, 9)
+
+#define CPUECTLR2_CBUSY_FILTER_THRESHOLD	(7)
+#define CPUECTLR2_CBUSY_FILTER_THRESHOLD_MSK	GENMASK_ULL(8, 7)
+
+static enum cpuhp_state cpumod_hp_state;
+static DEFINE_PER_CPU(struct cpumod_subsys *, cpumod_subsys);
+
+struct cpumod_attr_call {
+	struct cpumod_subsys *subsys;
+	struct cpumod_attr *attr;
+	u64 value;
+};
+
+struct cpumod_midr_call {
+	u32 midr;
+};
+
+static const char *cpumod_profile_name(enum cpumod_profile profile)
+{
+	switch (profile) {
+	case CPUMOD_PROFILE_GRACE:
+		return "Grace";
+	case CPUMOD_PROFILE_VERA:
+		return "Vera";
+	default:
+		return "unknown";
+	}
+}
+
+/* IMP defined CPU Extended Control Register */
+#define IMP_CPUECTLR_EL1	sys_reg(3, 0, 15, 1, 4)
+#define IMP_CPUECTLR2_EL1	sys_reg(3, 0, 15, 1, 5)
+
+static enum cpumod_profile cpumod_profile_from_midr(u32 midr)
+{
+	switch (midr & MIDR_CPU_MODEL_MASK) {
+	case MIDR_NEOVERSE_V2:
+		return CPUMOD_PROFILE_GRACE;
+	case MIDR_NVIDIA_OLYMPUS:
+		return CPUMOD_PROFILE_VERA;
+	default:
+		return CPUMOD_PROFILE_UNKNOWN;
+	}
+}
+
+static void cpumod_read_midr_remote(void *info)
+{
+	struct cpumod_midr_call *call = info;
+
+	call->midr = read_cpuid_id();
+}
+
+static int cpumod_detect_profile(struct cpumod_subsys *subsys)
+{
+	struct cpumod_midr_call call;
+	int ret;
+
+	ret = smp_call_function_single(subsys->cpu, cpumod_read_midr_remote,
+				       &call, 1);
+	if (ret) {
+		pr_err("Failed to read CPU%u MIDR: %d\n", subsys->cpu, ret);
+		return ret;
+	}
+
+	subsys->profile = cpumod_profile_from_midr(call.midr);
+	if (subsys->profile == CPUMOD_PROFILE_UNKNOWN) {
+		pr_debug("Unsupported CPU%u MIDR 0x%08x\n", subsys->cpu,
+			 call.midr);
+	}
+
+	return 0;
+}
+
+static u64 cpumod_read_reg(enum cpumod_reg_id reg)
+{
+	switch (reg) {
+	case CPUMOD_REG_CPUECTLR:
+		return read_sysreg_s(IMP_CPUECTLR_EL1);
+	case CPUMOD_REG_CPUECTLR2:
+		return read_sysreg_s(IMP_CPUECTLR2_EL1);
+	default:
+		return 0;
+	}
+}
+
+static void cpumod_write_reg(enum cpumod_reg_id reg, u64 value)
+{
+	switch (reg) {
+	case CPUMOD_REG_CPUECTLR:
+		write_sysreg_s(value, IMP_CPUECTLR_EL1);
+		/* The remote callback executes this barrier on the target CPU. */
+		isb();
+		break;
+	case CPUMOD_REG_CPUECTLR2:
+		write_sysreg_s(value, IMP_CPUECTLR2_EL1);
+		/* The remote callback executes this barrier on the target CPU. */
+		isb();
+		break;
+	default:
+		return;
+	}
+}
+
+static u64 cpumod_attr_read_reg(const struct cpumod_attr *attr)
+{
+	return cpumod_attr_unpack_value(attr, cpumod_read_reg(attr->reg));
+}
+
+static void cpumod_attr_write_reg(const struct cpumod_attr *attr, u64 value)
+{
+	u64 reg = cpumod_read_reg(attr->reg);
+	u64 field_value = cpumod_attr_pack_value(attr, value);
+
+	cpumod_write_reg(attr->reg, (reg & ~attr->field_mask) | field_value);
+}
+
+static void cpumod_attr_read_remote(void *info)
+{
+	struct cpumod_attr_call *call = info;
+
+	call->value = cpumod_attr_read_reg(call->attr);
+}
+
+static void cpumod_attr_write_remote(void *info)
+{
+	struct cpumod_attr_call *call = info;
+	struct cpumod_subsys *subsys = call->subsys;
+	struct cpumod_attr *attr = call->attr;
+	u64 readback;
+
+	cpumod_attr_write_reg(attr, call->value);
+	readback = cpumod_attr_read_reg(attr);
+	pr_debug("cpu%u %s: %llx\n",
+		 subsys->cpu,
+		 attr->debug_name,
+		 (unsigned long long)readback);
+}
+
+static ssize_t cpumod_attr_show(struct kobject *kobj,
+				struct kobj_attribute *kattr, char *buf)
+{
+	struct cpumod_subsys *subsys = cpumod_subsys_from_kobj(kobj);
+	struct cpumod_attr *attr = cpumod_attr_from_kobj_attr(kattr);
+	struct cpumod_attr_call call = {
+		.subsys = subsys,
+		.attr = attr,
+	};
+	int ret;
+
+	guard(mutex)(&subsys->lock);
+	ret = smp_call_function_single(subsys->cpu,
+				       cpumod_attr_read_remote, &call, 1);
+	if (ret)
+		return ret;
+
+	ret = sysfs_emit(buf, "%llu\n", (unsigned long long)call.value);
+
+	return ret;
+}
+
+static ssize_t cpumod_attr_store(struct kobject *kobj,
+				 struct kobj_attribute *kattr,
+				 const char *buf, size_t count)
+{
+	struct cpumod_subsys *subsys = cpumod_subsys_from_kobj(kobj);
+	struct cpumod_attr *attr = cpumod_attr_from_kobj_attr(kattr);
+	struct cpumod_attr_call call = {
+		.subsys = subsys,
+		.attr = attr,
+	};
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		return -EINVAL;
+	if (!cpumod_attr_value_valid(attr, val))
+		return -EINVAL;
+
+	call.value = cpumod_attr_mask_value(attr, val);
+
+	guard(mutex)(&subsys->lock);
+	ret = smp_call_function_single(subsys->cpu,
+				       cpumod_attr_write_remote, &call, 1);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t affected_cpus_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct cpumod_subsys *subsys = cpumod_subsys_from_kobj(kobj);
+
+	return sysfs_emit(buf, "%u\n", subsys->cpu);
+}
+
+static struct kobj_attribute affected_cpus_attr = __ATTR_RO(affected_cpus);
+
+static umode_t cpumod_attr_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int unused)
+{
+	struct cpumod_subsys *subsys = cpumod_subsys_from_kobj(kobj);
+	struct cpumod_attr *cpumod_attr;
+
+	if (attr == &affected_cpus_attr.attr)
+		return attr->mode;
+
+	cpumod_attr = container_of(attr, struct cpumod_attr, kattr.attr);
+	if (!cpumod_attr_visible_for_profile(cpumod_attr, subsys->profile))
+		return 0;
+
+	return attr->mode;
+}
+
+#define CPUMOD_ATTR_RW(_name, _reg, _shift, _field_mask,		\
+		       _max_value, _debug_name,				\
+		       _visible_profiles)				\
+static struct cpumod_attr _name##_attr = {				\
+	.kattr = __ATTR(_name, 0600, cpumod_attr_show, cpumod_attr_store), \
+	.reg = _reg,						\
+	.shift = _shift,					\
+	.field_mask = _field_mask,				\
+	.max_value = _max_value,				\
+	.debug_name = _debug_name,				\
+	.visible_profiles = _visible_profiles,			\
+}
+
+CPUMOD_ATTR_RW(pf_dis, CPUMOD_REG_CPUECTLR, CPUECTLR_PF_DIS,
+	       CPUECTLR_PF_DIS_MSK, 1, "PF_DIS",
+	       CPUMOD_PROFILE_VISIBLE_ALL);
+CPUMOD_ATTR_RW(pf_mode, CPUMOD_REG_CPUECTLR2, CPUECTLR2_PF_MODE,
+	       CPUECTLR2_PF_MODE_MSK, 9, "PF_MODE",
+	       CPUMOD_PROFILE_VISIBLE_ALL);
+CPUMOD_ATTR_RW(cbusy_filter_threshold, CPUMOD_REG_CPUECTLR2,
+	       CPUECTLR2_CBUSY_FILTER_THRESHOLD,
+	       CPUECTLR2_CBUSY_FILTER_THRESHOLD_MSK, 3,
+	       "CBUSY_FILTER_THRESHOLD",
+	       CPUMOD_PROFILE_VISIBLE_GRACE);
+CPUMOD_ATTR_RW(cbusy_filter_window, CPUMOD_REG_CPUECTLR2,
+	       CPUECTLR2_CBUSY_FILTER_WINDOW,
+	       CPUECTLR2_CBUSY_FILTER_WINDOW_MSK, 3,
+	       "CBUSY_FILTER_WINDOW",
+	       CPUMOD_PROFILE_VISIBLE_GRACE);
+CPUMOD_ATTR_RW(cmc_min_ways, CPUMOD_REG_CPUECTLR,
+	       CPUECTLR_CMC_WAYS, CPUECTLR_CMC_WAYS_MSK, 7,
+	       "CMC_MIN_WAYS", CPUMOD_PROFILE_VISIBLE_GRACE);
+CPUMOD_ATTR_RW(l2spr_cmc_max_ways, CPUMOD_REG_CPUECTLR,
+	       CPUECTLR_CMC_WAYS, CPUECTLR_CMC_WAYS_MSK, 7,
+	       "L2SPR_CMC_MAX_WAYS",
+	       CPUMOD_PROFILE_VISIBLE_VERA);
+
+#undef CPUMOD_ATTR_RW
+
+static struct attribute *cpumod_attrs[] = {
+	&affected_cpus_attr.attr,
+	&pf_dis_attr.kattr.attr,
+	&pf_mode_attr.kattr.attr,
+	&cbusy_filter_threshold_attr.kattr.attr,
+	&cbusy_filter_window_attr.kattr.attr,
+	&cmc_min_ways_attr.kattr.attr,
+	&l2spr_cmc_max_ways_attr.kattr.attr,
+	NULL,
+};
+
+static const struct attribute_group cpumod_group = {
+	.attrs = cpumod_attrs,
+	.is_visible = cpumod_attr_is_visible,
+};
+
+static const struct attribute_group *cpumod_groups[] = {
+	&cpumod_group,
+	NULL,
+};
+
+static void cpumod_release(struct kobject *kobj)
+{
+	kfree(cpumod_subsys_from_kobj(kobj));
+}
+
+static const struct kobj_type cpumod_ktype = {
+	.release = cpumod_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = cpumod_groups,
+};
+
+static int cpumod_create_subsys(struct device *cpu_dev, unsigned int cpu)
+{
+	struct cpumod_subsys *subsys;
+	int ret;
+
+	if (per_cpu(cpumod_subsys, cpu))
+		return 0;
+
+	subsys = kzalloc_obj(*subsys, GFP_KERNEL);
+	if (!subsys)
+		return -ENOMEM;
+
+	subsys->cpu = cpu;
+	mutex_init(&subsys->lock);
+	ret = cpumod_detect_profile(subsys);
+	if (ret) {
+		kfree(subsys);
+		return ret;
+	}
+	if (subsys->profile == CPUMOD_PROFILE_UNKNOWN) {
+		kfree(subsys);
+		return 0;
+	}
+
+	pr_debug("CPU%u detected %s profile\n", cpu,
+		 cpumod_profile_name(subsys->profile));
+
+	ret = kobject_init_and_add(&subsys->kobj, &cpumod_ktype,
+				   &cpu_dev->kobj, "cpumod");
+	if (ret) {
+		pr_err("Failed to create cpumod sysfs subtree for CPU%u: %d\n",
+		       cpu, ret);
+		kobject_put(&subsys->kobj);
+		return ret;
+	}
+
+	per_cpu(cpumod_subsys, cpu) = subsys;
+
+	return 0;
+}
+
+static void cpumod_destroy_subsys(unsigned int cpu)
+{
+	struct cpumod_subsys *subsys = per_cpu(cpumod_subsys, cpu);
+
+	if (!subsys)
+		return;
+
+	per_cpu(cpumod_subsys, cpu) = NULL;
+	kobject_put(&subsys->kobj);
+}
+
+static void cpumod_destroy_all_subsys(void)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu)
+		cpumod_destroy_subsys(cpu);
+}
+
+static int cpumod_online_cpu(unsigned int cpu)
+{
+	struct device *cpu_dev = get_cpu_device(cpu);
+
+	if (!cpu_dev) {
+		pr_err("Failed to get CPU%u device\n", cpu);
+		return -ENODEV;
+	}
+
+	return cpumod_create_subsys(cpu_dev, cpu);
+}
+
+static int cpumod_offline_cpu(unsigned int cpu)
+{
+	cpumod_destroy_subsys(cpu);
+
+	return 0;
+}
+
+static int __init cpumod_init(void)
+{
+	unsigned int cpu;
+	int ret;
+
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct device *cpu_dev = get_cpu_device(cpu);
+
+		if (!cpu_dev) {
+			pr_err("Failed to get CPU%u device\n", cpu);
+			ret = -ENODEV;
+			goto err_unlock;
+		}
+
+		ret = cpumod_create_subsys(cpu_dev, cpu);
+		if (ret)
+			goto err_unlock;
+	}
+
+	ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ONLINE_DYN,
+						   "arm64/cpumod:online",
+						   cpumod_online_cpu,
+						   cpumod_offline_cpu);
+	cpus_read_unlock();
+	if (ret < 0)
+		goto err_destroy;
+
+	cpumod_hp_state = ret;
+	pr_info("module loaded\n");
+
+	return 0;
+
+err_unlock:
+	cpus_read_unlock();
+err_destroy:
+	cpumod_destroy_all_subsys();
+	return ret;
+}
+
+static void __exit cpumod_exit(void)
+{
+	cpuhp_remove_state_nocalls(cpumod_hp_state);
+	cpumod_destroy_all_subsys();
+	pr_info("module unloaded\n");
+}
+
+module_init(cpumod_init);
+module_exit(cpumod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1.0");
+MODULE_AUTHOR("kobak@nvidia.com");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/arch/arm64/kernel/arm_cpumod_internal.h b/arch/arm64/kernel/arm_cpumod_internal.h
new file mode 100644
index 0000000000000..bc1e5b441ed79
--- /dev/null
+++ b/arch/arm64/kernel/arm_cpumod_internal.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal arm_cpumod data structures and helpers.
+ */
+
+#ifndef CPUMOD_INTERNAL_H
+#define CPUMOD_INTERNAL_H
+
+#include <linux/bits.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+enum cpumod_profile {
+	CPUMOD_PROFILE_GRACE,
+	CPUMOD_PROFILE_VERA,
+	CPUMOD_PROFILE_UNKNOWN,
+};
+
+enum cpumod_reg_id {
+	CPUMOD_REG_CPUECTLR,
+	CPUMOD_REG_CPUECTLR2,
+};
+
+#define CPUMOD_PROFILE_VISIBLE_GRACE	BIT(0)
+#define CPUMOD_PROFILE_VISIBLE_VERA	BIT(1)
+#define CPUMOD_PROFILE_VISIBLE_ALL	(CPUMOD_PROFILE_VISIBLE_GRACE | \
+					 CPUMOD_PROFILE_VISIBLE_VERA)
+
+struct cpumod_subsys {
+	/* Per-CPU instance lock: serializes sysfs read/write for this CPU. */
+	struct mutex lock;
+	struct kobject kobj;
+	unsigned int cpu;
+	enum cpumod_profile profile;
+};
+
+struct cpumod_attr {
+	struct kobj_attribute kattr;
+	enum cpumod_reg_id reg;
+	u8 shift;
+	u64 field_mask;
+	u64 max_value;
+	const char *debug_name;
+	u8 visible_profiles;
+};
+
+static inline struct cpumod_subsys *cpumod_subsys_from_kobj(struct kobject *kobj)
+{
+	return container_of(kobj, struct cpumod_subsys, kobj);
+}
+
+static inline struct cpumod_attr *cpumod_attr_from_kobj_attr(struct kobj_attribute *kattr)
+{
+	return container_of(kattr, struct cpumod_attr, kattr);
+}
+
+static inline u64 cpumod_attr_mask_value(const struct cpumod_attr *attr, u64 value)
+{
+	return value & (attr->field_mask >> attr->shift);
+}
+
+static inline bool cpumod_attr_value_valid(const struct cpumod_attr *attr, u64 value)
+{
+	return value <= attr->max_value;
+}
+
+static inline u64 cpumod_attr_unpack_value(const struct cpumod_attr *attr, u64 reg)
+{
+	return (reg & attr->field_mask) >> attr->shift;
+}
+
+static inline u64 cpumod_attr_pack_value(const struct cpumod_attr *attr, u64 value)
+{
+	return (value << attr->shift) & attr->field_mask;
+}
+
+static inline bool cpumod_attr_visible_for_profile(const struct cpumod_attr *attr,
+						   enum cpumod_profile profile)
+{
+	switch (profile) {
+	case CPUMOD_PROFILE_GRACE:
+		return attr->visible_profiles & CPUMOD_PROFILE_VISIBLE_GRACE;
+	case CPUMOD_PROFILE_VERA:
+		return attr->visible_profiles & CPUMOD_PROFILE_VISIBLE_VERA;
+	default:
+		return false;
+	}
+}
+
+#endif /* CPUMOD_INTERNAL_H */
-- 
2.43.0

