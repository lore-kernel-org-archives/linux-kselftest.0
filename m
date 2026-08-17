Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179F82931F1;
	Mon, 17 Aug 2026 02:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786933438; cv=fail; b=AdRVlBWibnIPuzFN0PEWzhwVOtpjns0vOJHwHypxv1KEIe/CE2lVnb7nUI76e2M9hBSU4AtD7BbO7tOebvTgYieTYG5s4VRqF5FB9q9gx7yuXTMWneYXLSecC1g6CSdE+fbSH7nY03xb8p2jmC8lSaVmpY8ef/xNes7R2gNOVxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786933438; c=relaxed/simple;
	bh=eXrhDD/Y88sq8QH2sYxFiO95A1tkmoskTYHmLDM13Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rqbeWpH3iWljiLFX6/0NqG4YbuRqGCC4Rak65zB2qvfOl6mHu1znS0/YolrUbpLhLq2vKkH+Xm5IdFoXEBWDaIUMoSLFq6ZWdplSRUm16xYABSI9s28Xl/jayHOFHp50LQmg13/HHQGESqRyiY99Z03ZgKQW3RJhXeWwF+tkMmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SbkXKHZg; arc=fail smtp.client-ip=52.101.62.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SbkXKHZg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jago+UNVqpOAE7d8XlsIYO3skLEiB3UQLREJ2s+j1+Rk4biiHGHRoNS9FQgR5c4TNVKrQ1vrJdjop7Yjs2D3CBg2CoL/RWPCejMHH0M+E6gqhuAoy8MLGwEhqtgWAhG4PWOCoz6mqI0/CoHjE6DpX6Wxd+M/Co5YtYdV/ZAMYQxDvsPteUUYAqgzgYL3hXbwjDnbZjSIg4+DxX21zP1B6AFkBiXkdY3/L3DaevuQgOnueWW8FGdGzSSGEO8X1wmpm4Nbr8ujnZeUYzmtKDflL+QSsP9YSB/p/g/NVWD28vdX7EiLnUmMq6uWS1reo6pljI/TJ/hrT9nUBBT1o+tiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIZk7A7izJqKy2Haz7BZKGXXDdFkTiSSf5iOxivRfTY=;
 b=GaauGvmlcFUYpRMLHqzLHRdzJnmhe2o9J21BVXRrQTcWZeI9KP7nvR79AY6eH+WXLxewq5na5mkQLN4kthJ30FY85SSgBqCXvYgr7MuELnSGFG0tPst7EUr0BaGDgnuaZVl7HjbC/PzjTMq8n1GTxDIoNPHkG5mWRSVH5GLaMwBnJ2jJocr8MQAjb5zWbZjYbOkgBRP6DlMeulZYDaJ9W/L+p47MvhfmDaAYwo/i2STIk1FMiOSMME/Oc8v7YARQzGEwFq2i6/akGeX/CZnj9GidRJXu9hkRlKW52/6LjXEf9ze+hnyKTn1SdHfIin9Hp1eeAnlCUFpAGe9CjjHTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIZk7A7izJqKy2Haz7BZKGXXDdFkTiSSf5iOxivRfTY=;
 b=SbkXKHZgP0DxRMdmdKpwiT/7P/HpOq5YIXVztOuNR2FT+aPN73ao134G3sqg3wj0FuMB0aCrCKKAT+Ze+GNbva499ETwqLvzCWL0gFQ9ZyyUpjZ5G1+JadvXvQ8Ut4eQdcvk5SdYfP5EcBkoA6lyA0tMMzyRU+xNKaUar5h3Z0qvs+4ysB6cp1OAEHsS8xm0etuHkkWLs8CCg2J72sjluZ9tjbu2mm9zCZ4D5BNJJl5wuAfbh9v6+rCS0FwP6m0zB5VEeF2siAO5Z6eYSXl3Thv0gJIPNbp9n9XyICyti/YRYEA8Magjmzhg2Nzod5PrKe7j93Dm2Dgll6LfN/96MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by PH8PR12MB7304.namprd12.prod.outlook.com
 (2603:10b6:510:217::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 02:23:52 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 02:23:52 +0000
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
Subject: [RFC PATCH 2/3] Documentation/arch/arm64: document arm_cpumod
Date: Mon, 17 Aug 2026 10:23:34 +0800
Message-ID: <20260817022335.3-3-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817022335.3-1-kobak@nvidia.com>
References: <20260817022335.3-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:820:d::16) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 98df07bc-d096-4a04-4276-08defc069480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	I4ZhHKWJ6TxuBhfqXBYm33TBdqeS7siSzcEHyeZ1Ii1DBq3DwxA5tBJdSwrPnnlTiVldZOIfLLaXueqlcZKBygHMhifoZ0tLJIxmu88ynCIimQ7WQVedxifKi95sdLdeCBqNtFeKtXo3t2x6kl6pEhunOOPHP6VVzdvAfdjcx3lfE4yI+sH2YB5cfI0b/nJMbAEayaL+jcGEdq0zvLnRw4qhS9NAZNB/RsSI/lc6AO7p+zUK9IsN68rRYNEEE2hCOV/+RYrj8x+fkt6XkKmJ5O6ho+5kUnCR0JST0Vpua9qHICXMLBBrj+n4b1Vdv2O+gC5qcqImIzjSItyjIPQiNqQWYCwkK2X8VUhKQ24wbmzA1u5Zm9VawAMeEB4BS2TsWdPSugFOXFZnIklQ4ERUTLpUZ7rIihbK54sTNB+FnsEzOXXDuSxKqx/9RYb6LyiRjZwyuQUPknurEi24V3c4oV1UU1JLGMVIM2C2X88i9w043PYRBOlm65Z6GCYnd4WPEl2QfK6Ft/v9T31qaVY3aY4wL2RaDOmfELb2ZvUyX8OmuGVzAH7I5ukEFoVtPvQAcd0BQ6HshW2pKimksWZBm9Jus6o3dfsCvYl07I/EjQC3bPC5veBUdbrNpTZJ0lARlt3QROpLCDOloxxXWguOSix3UkGp8D9HggV663ukj68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWRHTZqNtV+imCRmuK48vRL0f5BWXbDufw97HmVTFAtSZ/JTcJws6YplctNJ?=
 =?us-ascii?Q?EZ7THqoGc1hMg6VGsGXin4wNwz1mS7azLDF/sZv9CzFX8sn+YfDkrffeIAdY?=
 =?us-ascii?Q?9i6nhg2A5Jz8k3YcapBoer/3Dgz/OgryQjrs02SAiu9qz4Mvb1VeoLdj/6lW?=
 =?us-ascii?Q?V5WJ4DitYQ4mh2cj/QdkoHz/a2UdepqJn7EQV7e8Vs0SKokMrz3m3K3rTlgU?=
 =?us-ascii?Q?xzk5SuXNdnlV+KXOGMPIlWwCEYjnLhVOnOjtZlHTC1BQggMnAX+yQzdE1fhF?=
 =?us-ascii?Q?Y19BhReD08o7081nRsScg6z65OkZGnV9uZ3XvuVbqvBwUgILUzj0+/GGsd34?=
 =?us-ascii?Q?VqWlmjVAK1WuQS1Yb25eU7nkFDQgNcpkctf5KORAPOjK0o2w8OzNWkaxP+ia?=
 =?us-ascii?Q?vAE6QnC4iBaHjey/weW4xTAZ+PtKBsGzue6G3C92lFocaxzHiCWswoauSAUq?=
 =?us-ascii?Q?oHteGqA0b/ZLlEbdYz8egi/8Iz9YSueKZ/bB8g4j+gXv/8x+pVbkTmIyHz7p?=
 =?us-ascii?Q?yXT/9pwnt3zF9sg8jEZ8Yu9ucL9Dq+diVIWx9Ltx26mjP4L2Sc6B3Mi1a9EC?=
 =?us-ascii?Q?/RbXzWd2US8FDtnNSsmxssa+rjZldkqXTefJPV73tUmfHr28p5weDLhrbpws?=
 =?us-ascii?Q?T7LCFtBIpdjjoUccjox173pH7i7VUnVdxraH9hQYjTFvAzAPzoCZIb3usFxi?=
 =?us-ascii?Q?jhk3zqlJTJHK4FvRh3Q5rvvy9MLiSBhLMrNW3BXXfAE92AOIbFZij7Vq8gKy?=
 =?us-ascii?Q?7iTnbWAPuRhDoC2JJPSBDUB9cEYNWjP7y3T+BNH9j5gDRRWdbhFy7HoRjpQg?=
 =?us-ascii?Q?361WGkzTShm9BLpVVzer/cSGE5mbng/RPfs9iQhVF1ujU02puRSudJKJRW0/?=
 =?us-ascii?Q?uvZwdkkA22hD1eCOiW4luK1oR0r/UrH25LPWFUBGJwOOAJ2Nq5yZQf1Iofxy?=
 =?us-ascii?Q?lGdUM0G67aS/9nV2WOzZ+IMmt2BS+ho9w486akJ7SOF9DHrLGHAtjLmhSIHl?=
 =?us-ascii?Q?LbbpliQEtPnu8/HmInFddwvT+QznTds4gd8ZaR9vT6f8Xncbt+cknKY7xLT2?=
 =?us-ascii?Q?MqZQGuv+xapM5MOB+NJHFKWTtcFfHJG0NxA46pYpM3gHnfnIoIppczbqgm2Z?=
 =?us-ascii?Q?p34vqFWCc5OF+6D0U1kMYaE9bU8O33SiTFYZRWVJfGodPhVJ2KiGxXLFtC+s?=
 =?us-ascii?Q?NTgrmxMrOZh5c0yOP9InGWcVAXrN4VAx/puDOc/s7rvKqpFLOwvxt3wPtif2?=
 =?us-ascii?Q?eMcx4NQHSFmZyF05qLkiabWLmGYRECBPc57/TKW9yLVM0dSc2EFhp5UrATtC?=
 =?us-ascii?Q?iRIrVa3HIctbBBoZR+E9J95hOEwYF+9/ZTDCah8WiVFPeVOZN+gmQksiJn5a?=
 =?us-ascii?Q?3MkTSidpPtLSWUHI+CMKnCA0Cu88t2M9BjkCYRydAtRJL//4BVE7ydGTGlEg?=
 =?us-ascii?Q?hq9iLFMyXDZjI640233cby5buu2TtJOF3+84VMBwbKE7ar8HaoVJRE5DliJb?=
 =?us-ascii?Q?S0wpbC7HqOYp7vzk2Xh7ulqfw1WQSedd87akysf5eGeBnpHqUgAcN3nM4Yue?=
 =?us-ascii?Q?NWL8S1njYZQwgM9dGaARhx+tX9xspIrLgMJ1Gq/G3FVX4RZ3Ff3c/eJzz8AE?=
 =?us-ascii?Q?Gbl4jd4zF1xkOXwh5R+7vRNVM+ziHvvrkk6J8q2m0myW81c0aokOEDwx2p4V?=
 =?us-ascii?Q?GMfU+gFFftX3atIEfy4gX1nH9ullbhuG+udQcyojtpcZYvzjxh0ZIpx9hZ/X?=
 =?us-ascii?Q?WgNETt5yvA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98df07bc-d096-4a04-4276-08defc069480
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 02:23:52.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9TGZ0ltjZS6WswWQiLHL3LFKBu5E5C2LS8zWkBAGuggoESrfzQ1xbsPwMx5j4SAIwNt9wdZ8pBedB44Yg1ipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

From: Koba Ko <kobak@nvidia.com>

Document the ABI intent and scope for the new arm64 cpumod interface.
The sysfs directory is per-CPU and is created only for recognized Grace
and Vera profiles:

  /sys/devices/system/cpu/cpuN/cpumod/

CPUs with unsupported MIDRs are skipped without blocking module load or
CPU hotplug and do not receive a cpumod directory.

Describe the common attributes, the Grace- and Vera-specific attributes,
and the accepted range for each writable field. Out-of-range writes are
documented as failing before either cached sysfs state or target CPU
register state is changed.

Document the CPU hotplug lifecycle explicitly: the cpumod directory is
present only while a supported CPU is online, is removed when that CPU
goes offline, and is recreated when it returns online. Reads and writes
therefore require an online target CPU.

Also document the firmware prerequisite: EL1 must be allowed to access
the relevant implementation control registers. The interface remains an
RFC for controlled performance characterization, is not a general
production tuning ABI, and should stay disabled by default on production
systems.

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Tushar Dave <tdave@nvidia.com>
Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
Signed-off-by: Koba Ko <kobak@nvidia.com>
---
 Documentation/arch/arm64/arm-cpumod.rst | 89 +++++++++++++++++++++++++
 Documentation/arch/arm64/index.rst      |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 Documentation/arch/arm64/arm-cpumod.rst

diff --git a/Documentation/arch/arm64/arm-cpumod.rst b/Documentation/arch/arm64/arm-cpumod.rst
new file mode 100644
index 0000000000000..7dbe2cd5404a2
--- /dev/null
+++ b/Documentation/arch/arm64/arm-cpumod.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+Arm CPU prefetch modulation controls
+====================================
+
+``ARM64_CPUMOD`` exposes selected CPU implementation control register fields
+through per-CPU sysfs attributes under::
+
+  /sys/devices/system/cpu/cpuN/cpumod/
+
+The ``cpumod`` directory is created only when the CPU MIDR matches a recognized
+Grace or Vera profile. CPUs with unsupported MIDRs are skipped without blocking
+module load or CPU hotplug and do not have a ``cpumod`` directory.
+
+The interface is intended for controlled performance characterization and
+evaluation. It is not intended as a general production tuning ABI, and the
+configuration should remain disabled by default on production systems.
+
+Configuration and placement
+===========================
+
+The controls are built when ``CONFIG_ARM64_CPUMOD`` is enabled. The code lives
+under ``arch/arm64/kernel/`` because the exposed state is CPU implementation
+control state accessed by the arm64 kernel, similar in placement to other
+architecture CPU-facing helpers.
+
+The ABI remains separate from the existing arm64 ``cpu*/regs`` sysfs files:
+``cpumod`` exposes a small set of named, range-checked control fields rather
+than a general raw register dump.
+
+CPU hotplug
+===========
+
+A ``cpumod`` directory is created only for online CPUs with a supported
+profile. The directory is removed when a CPU goes offline and recreated when
+the CPU comes back online, again only when its MIDR matches a supported
+profile. Reads and writes require the target CPU to be online.
+
+Firmware requirement
+====================
+
+The controls require firmware to permit EL1 reads and writes to the relevant
+CPU implementation control registers. On systems where firmware traps or
+blocks those accesses, the interface cannot be used.
+
+Current ABI
+===========
+
+Common attributes:
+
+``affected_cpus``
+  Read-only decimal CPU identifier for the sysfs instance.
+
+``pf_dis``
+  Hardware prefetch disable control. Valid values are ``0`` and ``1``.
+
+``pf_mode``
+  Hardware prefetch aggressiveness mode. Valid values are ``0`` through ``9``.
+  Values ``10`` through ``15`` are reserved and rejected.
+
+Grace-only attributes:
+
+``cbusy_filter_threshold``
+  Valid values are ``0`` through ``3``.
+
+``cbusy_filter_window``
+  Valid values are ``0`` through ``3``.
+
+``cmc_min_ways``
+  Valid values are ``0`` through ``7``.
+
+Vera-only attributes:
+
+``l2spr_cmc_max_ways``
+  Valid values are ``0`` through ``7``.
+
+Invalid writes
+==============
+
+Writes outside the documented range fail with ``-EINVAL`` before the cached
+sysfs state or remote CPU register state is updated.
+
+Open register inventory
+=======================
+
+The first RFC intentionally exposes only the currently validated subset. A
+complete documented-field inventory, including L2CDP, should be reviewed before
+adding further ABI nodes.
diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index 98052b4ef4a1e..9e085ce55d9c4 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -8,6 +8,7 @@ ARM64 Architecture
     :maxdepth: 1
 
     acpi_object_usage
+    arm-cpumod
     amu
     arm-acpi
     arm-cca
-- 
2.43.0

