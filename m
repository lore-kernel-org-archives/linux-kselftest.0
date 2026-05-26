Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A52E1722;
	Tue, 26 May 2026 02:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763212; cv=fail; b=ZMC/DtM3JUxRqevGEM50NH+vT1od/gBx9CHls82qedd63WwOktwOBXZLK8My4hp+01N61vTzBI2gKdjaoJR5iQ1dEbu3uBxlizBKQytK17KHuF16Y7S589sSqEVXBv59sVU19P5NQaVPmV2fgPez1GOjnf28+oOoayqqY+DUd/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763212; c=relaxed/simple;
	bh=OWgYfzQSJJ+qHaT+Nfed5c/UAuQ/f637HpBvE0F9ND4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JEQJ7yCXV2L1KnNET68I4sk+tyHlyme3eMnpTju36yv3sXTGvMQda1Ggh/0D19YRBElGlQBi7pUpk0VgPx9xPdz6B7uZLeqJa/vBy5gsccbT9V4e8FwAJ0t3ElCB/Kd8Hjfii+B/iVQH8jEz/VsD0ROGf3Zkx/rm0wdbjUlAcEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tk0jLuHd; arc=fail smtp.client-ip=40.107.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tk0jLuHd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjaTRHdJVs5Bz+baZfD624p0Krau4T3+Z3+k5y7Te6YUG/No2jdUjUGrfW04FKaEZFjsPevJSUTx02zrmvqPyh6zcqQPnAJaIpHT7MiI2CX1y2AbxLuz4yt14XYkfzHp47EHKSi0nmaA+BhHIpO8u6TEFxjQP25lCauZ90Xc30bO6unvDazhzo5gIw93sLOmlvyxE8PJHyM5cXhaxrqh0Zsr/paQ48iKlx/w3vOzK72bOn4FofwGK0vNfG4Y/L5VRLr2q2ZtpmIumoP+HdLOXtQLIM/rD39v0DAzTrlMPFjdaJIhgXWIKGGVrss5n1+RgJ7zFz4nR5I6AfVVb/UMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve2g+tU5oD0YpcNCAfh9yHdaU6vTPnzNna1WJRoZ02w=;
 b=aU4zz/HTbTbSk8BfIGO2x6oAuriB1BAFc//KIP2VX8fa6j6JvFvyfYeJGtVNgwNf09KzfYCTMQMEEQC7XoPH27J43EPIYFV6T+O8//I4dGDWxctlDo5QX9Eoss2zGjjjyqwSUPQT7eVFLo9PZk4jNi9KJH7xDq5OiA564lg6yDsuVWf+gZwcCvlDbLIPXs831tMRNRmv+4dtXv/WzRe3s5mslo87pSNjCjqrYUim6JCIZyXQ6Ycg2KqiYF0Siy/C6aBlqQCp2KlFk5lfGuf9MNuKPjpPYi6yiXXHvQQIVc/JtvPfjSGcKiM5PZ8u8qqPtSMgHO2uVyYkzJjrY+FIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve2g+tU5oD0YpcNCAfh9yHdaU6vTPnzNna1WJRoZ02w=;
 b=tk0jLuHdfi29KOPmSA1XrLT1S/YGKYWW75KIKKTUNeNZ/DKlM+Yyb4q/ly7Bh7mPnzO+9u4lUQZte/lBMito2GAgmQrVy91rXjkVnqD9+2eNILRY+2bClGkNK1IDjUNZRetMyI+J5qemBOCQ7y2RH8BsT92T9KuRf+qBt/09/sTq3ip6MWf/tbzaMqQCkE6n3kckIDMlqwzVoClx1Vr0jJyAqkjYeL7JcKN2llOIr9//uLeVn3d+do++8eL3gjBjCmTO7H3JoG7skqCKfR4xboqDuL1zDgXwp6m7p2uSrVYPL4oV10AibdKj7j+CpZRHEaWH1OmOIVl+8atTzsWC6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 02:40:04 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:40:03 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH] selftests/resctrl: Add ARM vendor detection and fix non-contig CBM check
Date: Tue, 26 May 2026 10:39:55 +0800
Message-ID: <20260526023955.7681-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 129c0b6b-d87f-4271-ac48-08debad016f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|5023799004|6133799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wuNulAHQIf49idFPdttmmPQoef4DHBIoUa/d4Ztk8qSO276axB57ZiF8SneJTJ0I8e0to5rYeaxr36rajn/hYyvnmV51hZW6x5zDSXygNJX0VDhD9k8PCygjt5mrG9c2ky3WKq1ePbxwEwZ/3LkY+ePD1BwAZAJ8n3835zpA3P16GZyxjfSKqy9zbKKbLuFGQyH+4+w6dkBrKlLCKqfoORxPYo7rfb9TNHCGO6n1p1C7zFrHvdEgx0QKLJP8rGVUFlAB2Y17kUuGUASuKmDjAZu6g9BQ8AUIl9sKNm9ORoQp8q6uzyTeGtegEpJRPunAQ8PV48vyfxJXL9gIIWNisFbkqgEKVViHJw+KUQuTMN7QaAyB8nvQFooYOPAl6/4QN4CR6N7wLgQy/QVB8dce8COoSXUKzoYTaDO9F0Y2AlbhzysUM15JXB8/hQY0cATO0X8+IxeLVpRexbjr+3ZVM6x206IScZv5PtZFkYkIqI3g/l61bU4kTWdKkYEv6oevdO+VJ+i2hvC7vRCQrZOqkNR9ez85ashBeOkk05TcwlUdjLbonEuZ2IerrAD/lHFZWDRntXG1aJQlKNXEX7+b7e/0iRuN9RSSStSvpNDdMtm5xRndnocsnEoyZ31Xo1fAZI0Wy5goHzrXaC/lwXtfU8UbBkV6pCtEklzw+NLAbG3O2VFnKOBiZEyKvSdv7zLM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(5023799004)(6133799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpuJz4Ryvzgph0TxX/zLF6jlt91+ktrLm/Qe40eGeSnSiHH+RCD7W0fE8UqR?=
 =?us-ascii?Q?m7EFe21eSpfAQiYjcpLEamGIFvHLaSl7UhM3JeKUqoJdSotuGAiHCZyEwg7Y?=
 =?us-ascii?Q?4pnJf0PShwE7UpLCZQvOuGNpxbeg9NrYLL8H1q3pabCjZPISHsXRsdNJ8gUk?=
 =?us-ascii?Q?+J0tlvkVBDhIdEIQq4FZ489DzobWIgQm99ZLQ/cO5wUZzTQDjpGOEda9tHZW?=
 =?us-ascii?Q?UFz0Er6oIyl0ZNz0Tu9RrDfnYV7++R3VcP+SNvwtvg0XYCDNywyoWwkMUGDD?=
 =?us-ascii?Q?ALbtrf8/KI7DccponFe6HccGD/P30r8TMvf8TLdlMzSG3oUq2ClA0jdPZNsu?=
 =?us-ascii?Q?/dzjXl3wUJUHdRf1YIC8x9sf+xP6dRoW1HtB6lrL54NXbLuihaqcolgmmwn3?=
 =?us-ascii?Q?b8t9YZlXJ902oGJeZFF4xTM1mxongJMSHomWg1KUVZCRXoLopG9pwM7AZP9l?=
 =?us-ascii?Q?03mIhiaiV3s2EFz4oq35/ECO6kQnkKMwhnOQlhj2OODL7GDilOkXhuAam4k+?=
 =?us-ascii?Q?SIf6a9YucjmET5XnjVC6mSTCDOU/H1Fxab2W24NDd8+feU+ZinrgItmmsbIG?=
 =?us-ascii?Q?dLVirAVRKzzIfQUC6AbiWmzd7sECQPh+B8m/GN+g/5UX5g8l4PHO4Eg98n4q?=
 =?us-ascii?Q?RiE3RJMHhySlT/mTFx/RxI7cqH82+PT3QM4oCW4DwfejSj62enyjEkxT3Bsb?=
 =?us-ascii?Q?+mLmpDiU3WdSLV1PkCw6p7N64nnHmo9qz2wtXrRy+xu+JZhwXFo7f5X/zE3d?=
 =?us-ascii?Q?vZTFBpQgkXgiIPGIeGOVzNV8HPqUMeWdo65no3z9fjGEV9+6F6C26Z77JiWv?=
 =?us-ascii?Q?AoxvHaf/QemZHk8UDR4W1z+zQMsrsvvOM5o3RjOtP0W54UditTgvISWYtSZV?=
 =?us-ascii?Q?qKdtGUrVT/lMfsRCJERBtHMfYy1RV2HuWIck4hBUCIVho+fR0a8/EZWvhU2y?=
 =?us-ascii?Q?R9BwbTU1GGx4ed4yVUJfeDLJfx+Vm7Eo2cJLPB+GydAJfNgRDOupeg72GWxB?=
 =?us-ascii?Q?8OKy8BVts5MNJG9xprIs5j3QqPtFT6t8oncKRPFMmr+oTm6IS59AXsbbPm6V?=
 =?us-ascii?Q?KZWKKhiJgpL219QhHNXe0dmJonfw5TZFEY9S7ZZmFGsHCXQqrgNfz9kTgMj1?=
 =?us-ascii?Q?+or8zJjsEm9qL5LASUj+M/Lel9sxem/UnaCGhPd8SD/1Nu2C93WA8rjMYTYd?=
 =?us-ascii?Q?NZLS7K3APKKBqqjmNFi8XmF9Ox+jDchRlv7jOXZPtx4j6y5X7s9wSkeDZjZQ?=
 =?us-ascii?Q?p6rUnwhlaeQe5yucukX8sv1T1lSlSr9oasFXc5WLMS5VzdajrXWUPubror41?=
 =?us-ascii?Q?x8qjZYYWkpsr5oVht3Pt/aZy87ImiwAc4AsSfycDJN1lwZvEUx9n/rKiZere?=
 =?us-ascii?Q?jLOuICWqPsgH+H/s4cnYbU44b8nhlKkTyA0gCL6WuU/eHbd8SYpN91fFb2SZ?=
 =?us-ascii?Q?880YoXzzwD8DFtRiB/MasAeQYQB650d6ncxmhszyB/v033oBUo7Pnf7LWHjs?=
 =?us-ascii?Q?Npuxf7OgSGiJvmno/JTZ9ral8PQ48Px6l56oZH19oiQ7k/M546iFBB7+Nnv1?=
 =?us-ascii?Q?OAbErirCV5eTuplm1zAwX+AbS52rDIGLwO7e1bZ8Z4uMn/6nIfkw9p+WzWMu?=
 =?us-ascii?Q?g5n42RF6ZuLBPO8xs3xUomE2Cls/IH8TpUodZP0tOIUdmQxeuq3HiJfZ+clB?=
 =?us-ascii?Q?zW5ejuJat27GWy4gIwxCBoB4HNb0zKpJ5K3w6Yy4y9zNsaPvSKPCV3Jth+pB?=
 =?us-ascii?Q?0Saw3LwHfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129c0b6b-d87f-4271-ac48-08debad016f4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:40:03.8831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdS6vFvynEvSu+LiHRpthZ+mq+i2phGV9Sf/nhGL4EFcSyACmBGbHsX6+2N5hU9aZ4k4p0rnl0KYu2v+Qpq3aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052

aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
and arch_supports_noncont_cat() falls through to "return false".
L3_NONCONT_CAT spuriously fails on every ARM MPAM platform.

Define ARCH_ARM, short-circuite detect_vendor() to it on aarch64, and
add it to the AMD/Hygon alwasy-supports early-out in
arch_support_noncont_cat().

aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc...) but MPAM
mandates non-contiguous CPBM uniformly, so per-implementer bits is not
needed here.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c      |  9 +++++++--
 tools/testing/selftests/resctrl/resctrl.h       |  1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 11 +++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index f00b622c1460..37ca70523ed2 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -292,8 +292,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	unsigned int vendor_id = get_vendor();
 
-	/* AMD and Hygon always support non-contiguous CBM. */
-	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
+	/*
+	 * AMD and Hygon always support non-contiguous CBM.  ARM/MPAM
+	 * defines MPAMCFG_CPBM as a bitmap with no contiguity constraint
+	 * per ARM DDI 0598.
+	 */
+	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
+	    vendor_id == ARCH_ARM)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index afe635b6e48d..670e5b128b4d 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -40,6 +40,7 @@
 #define ARCH_INTEL	BIT(0)
 #define ARCH_AMD	BIT(1)
 #define ARCH_HYGON	BIT(2)
+#define ARCH_ARM	BIT(3)
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..b97d3541fcb2 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -34,6 +34,17 @@ static unsigned int detect_vendor(void)
 	if (initialized)
 		return vendor_id;
 
+#if defined(__aarch64__)
+	/*
+	 * aarch64 has no userspace vendor_id in /proc/cpuinfo.  MPAM-capable
+	 * ARM implementations follow ARM DDI 0598; treat all aarch64 builds
+	 * as a single vendor for the purposes of resctrl selftests.
+	 */
+	vendor_id = ARCH_ARM;
+	initialized = true;
+	return vendor_id;
+#endif
+
 	inf = fopen("/proc/cpuinfo", "r");
 	if (!inf) {
 		vendor_id = 0;
-- 
2.43.0

