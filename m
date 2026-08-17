Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C8313527;
	Mon, 17 Aug 2026 01:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931404; cv=fail; b=ZLIr+VX6mNtLiAqjyDQHenBz4jYKpJ3gxaHNr4OpySf/tXBOKNqF9VCyEywX8aAdEOSzFClFXWgMB4hMCX46AagGa6BjoYKeHtkBTghYWjQzCgESx20LpmxB1aoZHSOObNoznyJm/iLlh1CkKvtoCI5wmS55lermV2PhvMyuMsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931404; c=relaxed/simple;
	bh=eXrhDD/Y88sq8QH2sYxFiO95A1tkmoskTYHmLDM13Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EyzOz2KcYppQJjgS/++fWttEUzVzttsaTzf19OEftEx9UoYwVEljyI4iGoKetmYTaPnPA1kP6F4F+1wmVyXm4Rp+12vPZoyVHbJOxnFTuHYCrRZy0Au/Kzb/X6xHr0btfrw09I7W+8AsCfp6TvLj2g9IwiaqmEhfF/DjHciU8AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qXjzROnB; arc=fail smtp.client-ip=52.101.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qXjzROnB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMAOizGVlKYn52fTyDX7zM39Inwou8MpqcHWQQl9MF+kccBO158/ov1wZbNHzmt76gEA7Wn5LlSY+K9l5TjF3TJgDz4fZLQJNYpOF4y1JyWZIrUVg64ItT+NJvahrWcIoBbCXoisS0A2SJCqVqKuKCUm//JNGmm+/Cbp6MCsV9gUwK+RqCZ/40BWcSzn7SNXiqBFZuM8TOq6uTa/wMsxntusnZQA/wAWDLgblMtaJu9cr7y4bzvPVWVOq5qz+zc/81OueKlZBWJbqAT+gFA8DN+a/l+urlCqUdXQ1CPMwUk+fe1itt4Y/e6OauKJ9yRVAclLT7NZC2JVO1xUvRkTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIZk7A7izJqKy2Haz7BZKGXXDdFkTiSSf5iOxivRfTY=;
 b=t8nt0g0y0EbLWOtlGD4zO6RJ0DJTajB+yUeEGkKdMewDtINFWfh2Z6gD5x0Hn86zsGvLPr68Je+GjdET+GEdLSi4/n63lyIrsGFfpGWHt5LojW7Xyi4kSXEVmX52mb8qW5SjtfmPm8On6Y3ADm36MqOfhku/3mWga2KkYnjraa+813vPVQECB9VRyJ7nhGSo7try6Zmpp08lv1UbJ7qTdInp+Y0STchSeIKFB8pEiXGZjU0pBaA2bHlq5gMhnI6SPtiBcC38Odkg/n9ZbueecM7Jf5SNwfJKhKjb0z+ekjvk43QtcaPTK7q6gOn7mPWee71yzjzyFijGyENg9Uay6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIZk7A7izJqKy2Haz7BZKGXXDdFkTiSSf5iOxivRfTY=;
 b=qXjzROnBceATZI6pMrzFpWauy7k/9DRoJVAQNNwDIe5+HWN3kvXYjgDOJMkcm5Ky3rRBoXcRrXYu1b/5r1A1QrYKAPKFkgPrfVll/m9AwRM0OtIIaw5dDWRsdHNF11jbzq/kNwNjEXaZNUdUCd7ZbFox3Zzt1OXn53c5N6Akmo8VPztixmdGdSxxtlOcYworRByEf/RHzoTez0EU8dQo8EPzy0b5oAU+OxoJokk7iQKrlQpB1I83ycwaYUOApRFJy1/AE20z8vu827/GGqJKFUFzJ2Uol31fxUzo4ibKtNqf0gRZZJ2A7+zTzoUSvClmAjmz83lOLxyQd4RSCDCkWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by CH1PR12MB9623.namprd12.prod.outlook.com
 (2603:10b6:610:2b3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 01:49:59 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 01:49:59 +0000
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
Subject: [RFC PATCH v6 2/3] Documentation/arch/arm64: document arm_cpumod
Date: Mon, 17 Aug 2026 09:49:42 +0800
Message-ID: <20260817014943.10-3-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817014943.10-1-kobak@nvidia.com>
References: <20260817014943.10-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|CH1PR12MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 109fd603-13f1-471d-0b81-08defc01d864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F5n+Q7abgRbVhjN4G7kBdQofKTyxpg2knaIhUQ5gXUu6rgSgmSJL0myp3RT+/N9imFGLhu4c1d28eAbSELhBJlQOYk7yi73p4AU5gqzJoiPYYEcFBLU8lHm0JlYvgdBgBHswF5pDg1BGNTWKqwmoYeaFZY4d+ANab8qchIF/Y8XPQTa4J2DKRJ6d2HG+LEspPJlyisR1ePF/ZAHkuC8X+8/xgGZzL7YURtnEYTfI8h7b/wZDUJYfERGpaUDALs3JcBjJmPPcukWNVwEJhTa5ueYMJ1bPHGU+FGvz3qr20Qkkmlplk1s98GGSCeoY9KSNmmj7kiOTOKcyZAnj/e3HMzJ4o1mjN/1XnZyPlii14ZtCK26s2k6uk52q/i1luDfMoveIH+pQLvImHULg0Dd5u++T3qKJZtUktfWUwy0RSIB8+6FTR0YG9T3YvYSZgbLyPOv3h16YiXlv5EHcFnJ9Vs/iTzIWA86zyFMyB4mBPoi+BRlZph8hh+FmY7g3kaue32k0zMc2V2PH25gvVDW0vyAfLeI/D8OYW+L8avIm402YBqmCWwLxEO/aiU7n8lzX9URxuiHg6zLoEw7qdsSse5iUrrdm2LQy4PJkhAjoDctGjlsRdGbYNPXQnjsLlNxN+AUj3aituuJlH5hFpNiPlAK3l9XkvR8gtVI2MFjAeGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nhxfy9iYvcni6SQzxehxCSXYuF7qP5o4ZtgN9zEv8qbpGDfdih+kgID11gX+?=
 =?us-ascii?Q?y9/p1IEBcFqiUa8pkoFJHasuXUAtXwUDQauMr73HpOKm/Vo/7nquus5tp4X6?=
 =?us-ascii?Q?GWmpFNHbQoOzb9H+txNtEKRPzdmuE9TbVH7+cNy7/82VjdyKKelhMArSD69G?=
 =?us-ascii?Q?lQRaj4QWb5+fBVxZ6wR6dnrUhl8Vnr98J1Mq2XnKcVY2f4qjeRQicDiJxABx?=
 =?us-ascii?Q?BfQ/7/2RAdfbcu7Odv3paSyh0Upuf9nadPULB+UwwvNhtlDwTyhqLKwmevLg?=
 =?us-ascii?Q?sVm7wNELEPL4KrQMGde3zU4aC4cuJRN4YhkADM4qE/BsOcsl7bIpn3UVMGI9?=
 =?us-ascii?Q?2qP82lPmmMPbG8zBkXzqc4xdzaaLJ/JKU8AZvj2z9eN+P3+HBV1aoXjWA3Yg?=
 =?us-ascii?Q?Z7FL+SZMVDd7eS6UeuULo+VSv0KK+llbKhfskzEPKZb39Upmp8Yjl6TX5Jzz?=
 =?us-ascii?Q?2pWw0bF+d+LMoydJUwkC2b1qfVTzOCRgk2iEJy2dGMoqfKOE+HmJQEwTPdRZ?=
 =?us-ascii?Q?AURC76p9RSdufwe+SvHLEX8I4i917SAzIPjdxmxCqIPGB97VjvghlTl/r7Y5?=
 =?us-ascii?Q?9j7hziUk3uTYVGvpGfrSetC56oLxi/7BgZ3xz+U8cuNGJixKIZIuGtnOG9Eu?=
 =?us-ascii?Q?M+yq4etJ5QsowPMFQZOFa1X1jBYvnXLYejrwOgtTxmXETwL7YR3A8tiFZb+p?=
 =?us-ascii?Q?ABQaLzKTHef4BzChGHZPNLUPQPF0/zpPtc9U1IKq+jYMRwUtXeXoQUhmN8Hc?=
 =?us-ascii?Q?jud2FNaiGN7HrqQW9VLcXYgdajhRqSX6GMhJ3yznL+DmRHkT80xbhXBaL8Dn?=
 =?us-ascii?Q?U6zGsnONpl6bZO9I7C+NPd15/n6MiX07hgsx7nBNwWb/e9qzm5JRDumhtNND?=
 =?us-ascii?Q?165Bz0XJvxZ2RIunEBQOjJk4Ytcp/BsfyeE3ExjshzRGTKFqLquHCZjrOHaX?=
 =?us-ascii?Q?pRfhYwoYcTuZsaR3ntLRruC/UrmP/6B07/M1jqKz0kJF5o3VQDpvnN0oK/RR?=
 =?us-ascii?Q?Ne+LqsO8N/+SP2LPEPUFpW/FOWvIuFc09grD/vICE51HtIvdxkNVx7gu56bs?=
 =?us-ascii?Q?w8tzAmBz/bsbJRo7rIbyOa6SXwNoJFIM3m8d5V0FFREyUK6R3HmBvXXQBsW2?=
 =?us-ascii?Q?26LjGGv0Iu/L3iBQ0hnzJM9ITn1zbgp9T5F66cTjG4YkuL1k02wy6aNyahHN?=
 =?us-ascii?Q?6Ca+IuB0xPzG5n64dXR8EuYUSBngMag7Nr/pPeq676Egg7axtY6C20CrnbqJ?=
 =?us-ascii?Q?DcRsHKIJyXbapGGaUwSBL7qgwLmGsseIfF4LW4uEXnyqJPcYlGr8u2N4Tiq8?=
 =?us-ascii?Q?dEBFL+VEsStXXexJVaNJSocqWdMqpI+utRaNjkyQhvMfGmYNynr3CdvmbC0v?=
 =?us-ascii?Q?yO+QnBuOFtvucCw4w/NNo171zkKroFRoh6XiGAASTy31KSDcdtrIMYLiS7GT?=
 =?us-ascii?Q?Vg7vJiQQlNHfmYGHyJTUdOMdQKfjkYfnyuyFINMkoeD29iPnGMzrqgfQ0bk/?=
 =?us-ascii?Q?fCyGYfznsqJSt/DOUbGiKtB0PSGyzkU4mrLsgCprMY4CBDYm7EAhnjf7IoUQ?=
 =?us-ascii?Q?HopTXAdq/O5bxtNfK76rYrOpisxhzC8Vle6zvydbxVWRArZ3CgkRkEsyD3Tr?=
 =?us-ascii?Q?+RCeXwQQFcVvuvnvmpTS/z7pHgh5ytXCOwVuA6EQI9fVygcvSy0Ys1H5OywG?=
 =?us-ascii?Q?aj3gD04kN4paNA3q08W+ELD4jDS5dBcRV5U3ZQdLE2Hhxa0qJ6Mra3fskEsA?=
 =?us-ascii?Q?WvLH+U2Uvg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109fd603-13f1-471d-0b81-08defc01d864
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 01:49:58.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ8nwnopKqUL821bhU1uhPUOSMewgq1RdziMcA1q1tFzss8WntCC8HGv3dV4loDbf4vr+UTRzrgP90LAQwVoLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9623

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

