Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06B4B04A3;
	Mon, 17 Aug 2026 02:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786933436; cv=fail; b=DJxwE666RKvMfdVaHj39CH824H4rBfHYZH6SS/cAYU/vRb4pj4bFY6puWQL28WqHZM7Oz//qOmdD2BgmByHp5/FwEdJ5lULeJKb26krFvJoLiYGm2zmYqJwBK3xcCYFQxyv08YriIq3J41a7XjeoyFFrhX5SYA+T/H6LMv5w9vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786933436; c=relaxed/simple;
	bh=PWEuMsj92NtItxQ0X23lrTMZJKgGq+LvYOnQoBAGc9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JmlVyJx2Mv/Gq3tPT7zoECOCvELU2rBYopRQHlLMVwIrO0P78AVFySv9lAf+8pXQwZbefX23lIu4vl8t8wcVlRBISpZ4oBXYiLc61Ycp0kgQ6jI13FsmvnYNaYZ1h4HVQyiD+yQx2q+MofgcgKY5c4YW0fr87lMDrnT5EQWChIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BG5I1z3Z; arc=fail smtp.client-ip=52.101.62.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BG5I1z3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caSYS+vuYR5NP3jtARfgnpKiIxm8ZAOtGp7YokA7r6dRegaw1mp1ZyYMMUZ411Zu3NAOHpNTHhsrIKZR8HDrWmOATVN+gErUjN06Nnpu9JZ/ie/ku/Vdw1da0zni+DbAE/BPFjJTWnks52P0syXyfKD3aB028P7Gu8GIBQ2XNJ9K4AAwXK1XjLym1eIKxoPsghZvTRroAo+4u+pLkVDecWoFcf8UfMLv35heWETknh4vfMfpppSJjtWCBbVDy+HyuuYiZqcMIhOkFK9jKDSZlir+7GMBVNKU2VHHaGJLspsFzJK9eGqP+9VyCiPgJ4NBaX90YMFsB2w3RzSO09fGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdGO+Fdk/DXSnS6Pl1ltk/G4uBzItIqT4P527ODkQus=;
 b=V0Ab0CVsbkh+PXoRpkvDJPFFQ8DSfeMLb5Gi8gT7j5qpDfuWV6wvoHo8rY5G3lFybXVeDfBFU2dXS2F3XgaPsUTyMB3YpZJ1miZ6HebGRv7Vp/A+P9ne9oFXgbalM1iFXWaAh7TJsYJcJUNU5gGRQqleIeYpZZvnrafpuU2OdvOmUr9TR4GMA5X8snOy5w/kmFVOyFdyxJwgM+Y2J9PlnhulC3py3Zj8wLg37KmzhzaqzJepxhZ53tyjsE1JfmzjQe331x3ceTvhsGIfPEQjF7oKFsoX2HVV0EKPL4WCA8Qx5LLHqWlK+Kgmodfy0R6SDsbCY3fS0W4X4N4tRAaztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdGO+Fdk/DXSnS6Pl1ltk/G4uBzItIqT4P527ODkQus=;
 b=BG5I1z3Z7eXGoT7D+yWuxtqHW2LB+OWsAVtakMrDofd2dRMW/Rj9FL9LW1PNCl+yCOfvK5TPpeg9vL4zK/qFesfn4WSdPLoXbBmlIuvFFTHC2z6IZmnj6cMEShbjfd45sxThhj0a85dXsX/2/lwMkHCEalfRWgd86BK6mJo6kZl2n/9VfiiY5kF/wZ34N1ffid1MU2pwr+E06kC8rq2sWF802I6y/YYj86ZMw/cS1aUwWBO8oMTwiIEVKLHhafLJ26rvl3cE+8yMcDw9oFL0bMQJNJ6LczS0XQwrTe4+zOCL4c0fiuIbUFMVmJqERUt9AQP9oJDLAzNwxngNSTL8wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by PH8PR12MB7304.namprd12.prod.outlook.com
 (2603:10b6:510:217::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 02:23:46 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 02:23:46 +0000
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
Subject: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation sysfs interface
Date: Mon, 17 Aug 2026 10:23:33 +0800
Message-ID: <20260817022335.3-2-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817022335.3-1-kobak@nvidia.com>
References: <20260817022335.3-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::16) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca3e484-36a2-4e0f-67d2-08defc0690f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	1IiXn5lYDr6lEQFSs5AKAtdd/GkG8zgEmMIRsoCiMPu+S+m2d8md1Igr1vDhN3NjGacRISxabKOmlqKZ5oNxpLQuXVXfuN019U4hImsMuoSCfueqEjb9JR9UBgwmoir8Rzj16K8qyCOIUAYoBBIxJOcWebLdPOK4sFGzz/KbthNHz1TDGtG3cA5yQgP6oT+ldGyxXLYtq34upkTJAJqOi6x/F6Bc/Ob8/NuybXoLtI2p+2XIHJ9zX/vlcGNc+vw0S79yHMlXNNkbdSQAfeZyi8FPBhk5+qjrLDrX1HPIOb5+g562nOdXkb/7GqEFroP5uC6jP4w4/vy7QQmgJYf0YD2XEs0110tzZKTOZ9eJx3+NZN3wxbJyF5gyDtKu13HWsQlLErkxGYNHvCyeuv9LOdinvUK+Vi4B2j/oDKcrw5qO8gUXfAigAIQ5JpgpAKHZsOowTnMvqPCh4Ukjf3r72gpB3UD+W5w/RDl9VwhzdXhiQic76tQZ+lhyPVSweAqpi8oLjFTjHlZ8Ia9agfenKhRJTbwnhem1eLjdRLQqBu55i9i1uy713E92KrWy7be3EtmcGoLmVVLe9nPlEayNRsdvlN3kaAxcS06YmOq+Q/AN2r+KaIQAQaofmcPh/xmz00CoCgkDYt09eoRISwOEWArqClfvvshzf/7qWxW+J/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TMbhMkcwTqv+YkXP/w5XIl3qQ4Gk94KGYF8n6NZKWO/DmuxnkDo3WRlruWDU?=
 =?us-ascii?Q?ijpfvOBGUZ1Nnh+CzeBlqjXngRfUOCCjb+Xo5uG7BzHvmppjjdSficzk3bwr?=
 =?us-ascii?Q?OtGZzAOuIL9EibRr4+KIalxTyc4SsyFG8qDv0cdioh3AtYKuKPPhX/Ha4eQ8?=
 =?us-ascii?Q?LNL0S2UWlArYOpzFn0dCJBZ9a8/NggByTYqxViZF/tGUTMhVTXhgIxd4pEHZ?=
 =?us-ascii?Q?yvH5wY6CjyNILfFjZJOqfmEq07bVQ1yAubcaz96iMiqHl3zLiFe/FzfCSTvX?=
 =?us-ascii?Q?MoUk6clpMLR2eNux0bpud8dQZpopX/gMIfPVWPNXYxFbCH7tshlReGACA3Ib?=
 =?us-ascii?Q?tmlfBGmi3H6v+IFJLyt7hutMGVIxOh8Z94NfjYtFc9/KLPIDXWOOFstzPVvD?=
 =?us-ascii?Q?Yc8X481XXv9fArQ8VKcogR5tgbX2PNXNQs6qqK3XzT2pEReZ6ZYD8MyQJT9E?=
 =?us-ascii?Q?vKZI5mlZS9l4wQomBkuDFDdcTCVFHbgaoKSSFOUPXUduD0QEljhCbroN18Gm?=
 =?us-ascii?Q?0KCQnXaAxfk5QwCkUPYWIPPN7CHGnaOtPerCDbEBPblCF0K/DL7OrLCeeEqW?=
 =?us-ascii?Q?Dk+oyTpr9lVk7vU9NShOwUanhHHZsAVbAbYoNUE/3QcG3r3Umezuj3ctoYnm?=
 =?us-ascii?Q?weAD9mfMh9xlvnMsL1up6RLkcjP96HFx6YXGRYQs/qMxFkdT2hcUzRhRGNdt?=
 =?us-ascii?Q?fQmH3LVUE/BO88ky7B0EgdDYMSHBSo8FfeubSIS5ZnAkYY+TaPe7jaW+blYH?=
 =?us-ascii?Q?1Rl+YaKKWT71EPF64YNyj55ewrZbH1bqYSNOoDUEgbAA9b8Rl7BeWFZ0nj7F?=
 =?us-ascii?Q?u3MFtWDxH/tLtZjzKT9Q8X2AVmZE5TX746QEOkI+2VqZUsnUhvS/pRH6NP30?=
 =?us-ascii?Q?bnEaMWKnlgHQ2t4Xc5Ki9grvN+yxJKSY9ALoHEUIaQa2Mwy5H2M6oaFjPqdP?=
 =?us-ascii?Q?AdVVGRn17gUC9LJpFWo5ow9fB1RTaT9p7Ef3SCZKdoBRnbGMob/yyf6DEIIK?=
 =?us-ascii?Q?hSu2NSJRhibLXmzoqZXXYG8Ihw1pxRlVakMZ2W/zahKd7LwdmYXa9+Kj8q3a?=
 =?us-ascii?Q?W4RDtIPZ3vzj0Lzxc6z32zlxaQh5rNlXThAzgZ8F13Mw7K+TQI476SgeX06C?=
 =?us-ascii?Q?lhUTncPs41Vy4/YhNGvAPEXDcHBWiE+SKlSA/B3X0kVftdJdtEXal008SuEG?=
 =?us-ascii?Q?1Mj545URIPp/QGMYLra/EG8QhZjzokDdXsoYXz9QDKTt3bhfK1vFeJfrVyky?=
 =?us-ascii?Q?sfxe/XvIgy8KIISMia5A3YvUv9axl9d+eeJaiFcT3vZsQDtS0/v1ZOvHzY67?=
 =?us-ascii?Q?TfJk7mv4+7w3hH73fAcdl6Pg4MGKCTPhA3obn5AAuvODDJa4kceZwl/ov2hw?=
 =?us-ascii?Q?vQYhlUyBcrn+IPidFA+EaIYJ1v++9s6LIer4ElvYixggTI/99beGZN59LAmz?=
 =?us-ascii?Q?jR+IwhPNEznAeTebO2QBziGJ4gIMp91eFlYEuoT1SbZ2pv40r/waJWUwceVy?=
 =?us-ascii?Q?CavDRwWnUeKQq7YmUYS/ybCUYTo/mwAwYg4QNKroOD8AxzPbRpCnBuHa5+9b?=
 =?us-ascii?Q?A25atHOow/PDBLp1kUWIO1AtkjC59AJ55POynkJZyQG60lY1cVzmiUVMTeFA?=
 =?us-ascii?Q?3st5/g0nHlFrdIkXjlO618gWwiPrBFNzxUc9DWZxzYKq9Ll0AG/nZHutG0mI?=
 =?us-ascii?Q?SNe/MmyP1PrDzhN9imjQwpi6E3tG0vgnSeKzOyi2dtGlzszljfWmb1E7VqNL?=
 =?us-ascii?Q?xPqSFYNnKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca3e484-36a2-4e0f-67d2-08defc0690f7
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 02:23:46.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxZxVksYiOm/T2VkBOrJXsYzyymTA/Nmgf5YNq5SHvrvTGO7P/cWp4f+VU/txZB2pPgWgnikUBhV/kIomY3dVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

From: Koba Ko <kobak@nvidia.com>

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
 arch/arm64/kernel/arm_cpumod.c          | 471 ++++++++++++++++++++++++
 arch/arm64/kernel/arm_cpumod_internal.h | 113 ++++++
 4 files changed, 602 insertions(+)
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
index 0000000000000..9e64f2c8e7810
--- /dev/null
+++ b/arch/arm64/kernel/arm_cpumod.c
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
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
+	u64 *value = cpumod_attr_value_ptr(call->subsys, call->attr);
+
+	*value = cpumod_attr_read_reg(call->attr);
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
+	ret = sysfs_emit(buf, "%llu\n",
+			 (unsigned long long)*cpumod_attr_value_ptr(subsys, attr));
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
+	cpumod_attr_set_value(subsys, attr, call.value);
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
+#define CPUMOD_ATTR_RW(_name, _field, _reg, _shift, _field_mask,	\
+		       _max_value, _debug_name,			\
+		       _visible_profiles)				\
+static struct cpumod_attr _name##_attr = {				\
+	.kattr = __ATTR(_name, 0644, cpumod_attr_show, cpumod_attr_store), \
+	.value_offset = offsetof(struct cpumod_subsys, _field),	\
+	.reg = _reg,						\
+	.shift = _shift,					\
+	.field_mask = _field_mask,				\
+	.max_value = _max_value,				\
+	.debug_name = _debug_name,				\
+	.visible_profiles = _visible_profiles,			\
+}
+
+CPUMOD_ATTR_RW(pf_dis, pf_dis, CPUMOD_REG_CPUECTLR, CPUECTLR_PF_DIS,
+	       CPUECTLR_PF_DIS_MSK, 1, "PF_DIS",
+	       CPUMOD_PROFILE_VISIBLE_ALL);
+CPUMOD_ATTR_RW(pf_mode, pf_mode, CPUMOD_REG_CPUECTLR2, CPUECTLR2_PF_MODE,
+	       CPUECTLR2_PF_MODE_MSK, 9, "PF_MODE",
+	       CPUMOD_PROFILE_VISIBLE_ALL);
+CPUMOD_ATTR_RW(cbusy_filter_threshold, cbusy_filter_threshold,
+	       CPUMOD_REG_CPUECTLR2, CPUECTLR2_CBUSY_FILTER_THRESHOLD,
+	       CPUECTLR2_CBUSY_FILTER_THRESHOLD_MSK, 3,
+	       "CBUSY_FILTER_THRESHOLD",
+	       CPUMOD_PROFILE_VISIBLE_GRACE);
+CPUMOD_ATTR_RW(cbusy_filter_window, cbusy_filter_window,
+	       CPUMOD_REG_CPUECTLR2, CPUECTLR2_CBUSY_FILTER_WINDOW,
+	       CPUECTLR2_CBUSY_FILTER_WINDOW_MSK, 3,
+	       "CBUSY_FILTER_WINDOW",
+	       CPUMOD_PROFILE_VISIBLE_GRACE);
+CPUMOD_ATTR_RW(cmc_min_ways, cmc_min_ways, CPUMOD_REG_CPUECTLR,
+	       CPUECTLR_CMC_WAYS, CPUECTLR_CMC_WAYS_MSK, 7,
+	       "CMC_MIN_WAYS", CPUMOD_PROFILE_VISIBLE_GRACE);
+CPUMOD_ATTR_RW(l2spr_cmc_max_ways, l2spr_cmc_max_ways, CPUMOD_REG_CPUECTLR,
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
index 0000000000000..04bf345dd383a
--- /dev/null
+++ b/arch/arm64/kernel/arm_cpumod_internal.h
@@ -0,0 +1,113 @@
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
+	u64 pf_dis;
+	u64 pf_mode;
+	u64 cbusy_filter_threshold;
+	u64 cbusy_filter_window;
+	u64 cmc_min_ways;
+	u64 l2spr_cmc_max_ways;
+};
+
+struct cpumod_attr {
+	struct kobj_attribute kattr;
+	size_t value_offset;
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
+static inline u64 *cpumod_attr_value_ptr(struct cpumod_subsys *subsys,
+					 const struct cpumod_attr *attr)
+{
+	return (u64 *)((char *)subsys + attr->value_offset);
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
+static inline void cpumod_attr_set_value(struct cpumod_subsys *subsys,
+					 const struct cpumod_attr *attr,
+					 u64 value)
+{
+	*cpumod_attr_value_ptr(subsys, attr) = cpumod_attr_mask_value(attr, value);
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

