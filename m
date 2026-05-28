Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D53B5F59;
	Thu, 28 May 2026 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964230; cv=fail; b=HdJknBQst/9x1siPfLI461VotZNuvM8UDq3WUbJ38U9LNXnBMUeS13m5JoCZeO/tmS58eJop6wRu3a0D9YY9upYIwUrvIWE6voN7CtCqE9EACOshvlsJsF7CN1Kshnt9OmlbmP+/cbAuo1t+VpEsL5NQ/meFwQ5Wc1jU8EJP0n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964230; c=relaxed/simple;
	bh=lsVFEUEXplTfHpbpnFeWGxT5R6Lcw6OJKy7HuuUWcg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nl5Ig8ru7fs0bYlePMzBIV2UzSDHjixa3KFYPqGsfbtFJegL8J8brBtUz8Xx1c5ZLZuMfMl+T4GVPfepv0aNVOlJrin2I39mi/5D3iRInXZtOTOAf594IapsF72xZ/xRfH8ojY9NsF8OdpCogba4h90m5yLC89wIvxyQcnxY7w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aWs/r3Xr; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aWs/r3Xr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut7oNHdLjbxavQwZpFeK9nogFwzXbKVVUJrX4Q8ybK0h6efb26oi0J5RF73wq/QFPp9F5QXdd2dBLsFUjEam5vymftlOqWCzrfVihFglrDkXjKmv8o6F/e1PDLTx/DG/9ucndbofzm6Y24uzizvYL8H2+xfo1xeinvpCqbzWOih6IzATtmgw+9HVOLUswS9G1PD92ZHsVrZVYGMDM8ZRzJQNg/W72ctLau9wiY0Tr2XKA9JIktHes8e94zhlmBGW6bv2dtFm/xeZR2q+bhRs+Kpy/FURjFV4Rencij1NU0qIQQipE812MjPiPktQNTzB3GRJOzjDUJwgcpeNI4ZwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRbd+EdPyNJhKA0N/thzCSunCasxmUF3YOtUubs00lA=;
 b=dzYzBYfcvCUK0Zg0X2IQXrRd3wYMRm06ENPGjXJQQlHxuEzucfaGr9qMXxxQN8WkHNazFtFfu9mqS6KVeiQ2zWmT14BSl6DeioD0TFnhP3DCOx6GaW/gGQO4NQZwodsCyoq7mfIg5JFPHrVyizpTq+FuJJE/9Uuk3S+6Xb+T+atrvBqBi94GvGY24U08TZbloHuCdcomWV3svDPMj9N5NLqTeEc/otfDCSsb1bOs72+sY7VXjg/lFC/2rhMXSUzMnKdyjShfjM/YoiKlUnyFI3KmY9W+wzK2cMnSxER78JcS1af9YdeknDwOy18D89/J+tqAVSvjVoh4Mcln54HOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRbd+EdPyNJhKA0N/thzCSunCasxmUF3YOtUubs00lA=;
 b=aWs/r3Xrv8CpcKdEGLHoVCXpb8lkIcAcYL5hL/krkFU3rn4jyu4VyG22QjDOxHxImZXPqcCKa2YFq1l3oCQKQXc37SF1e88IJQcYmsLsU60+haq7g6nn3dNWR4CvrqENlM4A1lsf2C37tPbT7Kk+ZqYKCLICnfNX+mTGU9uK0rOC/v/pXB3PxD81pMX7TLqQ47okbAIsaBH938YgvH3LTjle7dMiVte58VtrXy2OJ06iviG53byLt4zcUy3NiOnsMl2k+ricPSIafwAgMRIh2VjqY1hR3O8CDZHHNfAQq3OuJm30H2x0kbLjStyknEucyugFTP+Xwd5g2GbKdrIAcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Thu, 28 May
 2026 10:30:24 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 10:30:24 +0000
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
Subject: [PATCH v2 3/3] selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
Date: Thu, 28 May 2026 18:29:56 +0800
Message-ID: <20260528102956.33121-4-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260528102956.33121-1-icheng@nvidia.com>
References: <20260528102956.33121-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: e51e54b2-488c-4a23-20db-08debca42076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|5023799004|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HRYNgqri+UgMZvh570hagd9xeOwCNDRu7VriE2vINY42O4oVt4lcaBYImXJvcLkqvwrVLRjU9v7gBUz33U2LW1cN92djpFr4ZsxK0z6JLRxo8LzH9MhGSy2jm+zD9dYhbfKPxaYxHpCaxTGMUJukhnX90jI+cLDtDPhFnWp16Be2ex1x+FbdM1Ch6e94uJjTHCSz4bye68sklXKxsirJEQ2at48gdyPJL00biPIPDZmR7mIXmpd70wLZxN3AsYu0gobxEoQ+ScQMR65Pots+ODts7ldh9lFKg8gmjtiMpC4aBlRtHL97wYPowyCkpjGkR6AMbSqXuAFCiXNCo8A19iHdRIuBeLvjpmWJj8ak6Kx5tPu5cZEkkt8wkSzeAxdpd1KkazrjgkfcEtd6qybwbTKDv7mEQFLBCgDk5EyA7tZbfRiijttBxRvhqiF5pWfgpPtVl8HeB9MzDJLsrvUWSBtrtJsK8dqgM66rkljVzrPEFQXZrgepF57uydRIfIXDjb/gYmf5Fhr1QggtxwVmqY1jfeHgtgFAiOkeu/niqJWeKAn0zn/Jknm/l5oLPT0RAYYLU7FEsUqrOG7dP3bdJbOPd+sFI7qCf/Y5CD2jo+JXCrdeQd/RBK1IcRti2WA2KIJERQnq8h4EGRkln086XWJxVm0f9Fj2vb2cWMfhY+Xi3Zq2p5v82Sy78f5OOfS6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(5023799004)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzXW2S7ytse/AzD7+DcK0zai5E4mBR/rB6CrHWdmlxWktn1LVqG801Zl24/a?=
 =?us-ascii?Q?rvWh0uPAMhw/HBhcZ1qo/wYklPKQPxHHVorQ7CTIa2QaABtquwFO5NFR2sEv?=
 =?us-ascii?Q?uQbmYyAJQkURe4isn4nH3CuUPw15lQ14ol+uju96TU6mBJgvspaxxh9o0H7q?=
 =?us-ascii?Q?SJdlhz1PoGSdGP+KZ0CIks7F+sThN3vifBrywA8Dz3pzKIfm4z5xS0UeNQR8?=
 =?us-ascii?Q?OeTfh88w7M6MjucY6D8zlFFhL4O/On+OOJ7Q4jZZMThkxwbCb+0RBAxENLGR?=
 =?us-ascii?Q?jZjO4WKG+slFuPtRRniglcT0UDcuYOpAHr+trdqp2NqhcLCsveRli6Xmz2yo?=
 =?us-ascii?Q?7hwVqsfTK9AZXIWHn2I2IQFhJwdb4RbUQ1EcvYz7SATosvwSPeTiZZZpT0v2?=
 =?us-ascii?Q?+DXnzxnN/TV3jvbUBeVshNOrB7i6WzFFdHv1g+Ce+KPucOef5aTX32jIlnAD?=
 =?us-ascii?Q?sPbs6OElduhIeDjzfhP0Mssy5xharxq4fwWJyjnUUL4FOP9UK2tK2bZ6ZVcT?=
 =?us-ascii?Q?l/oqaWv8u40bhtFDVUSr1+56J1zTj/0QyFRkGqVTjUCaDQffpAqt0GYkwYC9?=
 =?us-ascii?Q?aX7ByEbRKWt2KyUSmbhu0pBmovOApWNoh9K8JsV1pmre/g+oUsp7uhRq951L?=
 =?us-ascii?Q?JVGD2GlWU2FeVH1d8XhJukVjFYFkyRdTW4eK4LJON+zw/H/frUOfqAeCLbiu?=
 =?us-ascii?Q?eLCvYKFRIClABcwp3WWpieN1U1zQzg22xstBJKNm/j2EEvPqbblNQAud82Lg?=
 =?us-ascii?Q?7fndo4Qq2cCsnwEobosFsB2sg4iwM18JzajmzOfQjMZIQGF5A1nTbi4fcCgT?=
 =?us-ascii?Q?UC4qbcAVdB1rMO0iMGrX68KiTbY/5+Q7go1OEI3NO/snOoqyCpA+X7g/QrOi?=
 =?us-ascii?Q?TvnVH1SFMB94nX1PTenuSb4JLI9hk/tRiOjsaT/Cl9P/iWjv39XgJwprmqjs?=
 =?us-ascii?Q?i/41j4wXrqudjwDMgrGILvzjOTWMasI099gYPBR2TtSnqDvwcQqyYg/3noNk?=
 =?us-ascii?Q?nG2ruzf8+4MX5H6IIu0U227dpBf2v5UYcineleBXPGqEhDL/bCkwQ4H5rnpN?=
 =?us-ascii?Q?j0cNfI1HSuXAp4RuUDp0rh6AGKB3vy6ctwB/A1EoIE+8S1/rxAj0BOSU2gXa?=
 =?us-ascii?Q?DlDFsrmiOcQBBXIXYktGGT0v7TH+Os+/xw8RzK1WJ7vh0YjwezWY27rbIxET?=
 =?us-ascii?Q?zBl1qOPsQfy42gz4b4vdg3ZrHIjOHKZnStbsmoI8kQI1Gweq2k6Hf8RVockL?=
 =?us-ascii?Q?k3nRDH9ow7KEVyI15kFFKZq0P2ISwBWGhxjW0fiadmuh4Soua013pa+glnIR?=
 =?us-ascii?Q?dD4b5b8QibrU+qKFibMg0dm/ZwemcPIw5rOgSNtJ4dT7jrQKqD5vFa0U7eaW?=
 =?us-ascii?Q?RFtZyCsWXo0B+pBGjfiyPvneNJKt9X99kKlcmmT6b4uYaBiw7NgSYbPPtwek?=
 =?us-ascii?Q?ZuXWnSo95FSJ8vW/OtG4wfDbA2TYYVkHSQ5zCofzulAJNhNYG/HjJ/6thHsA?=
 =?us-ascii?Q?fCca7ks0V7RFk2tCO03z/6pOsPYuL8NAI4D91Jt2mnwfPRuUX2Bb+02eh+rJ?=
 =?us-ascii?Q?KSQ/HbflyYc/5gdNZHCLW43bJvNEWBHob508FeL4hm3i+pMn+8jpRcNcLj4u?=
 =?us-ascii?Q?yfMvjMfABJhOkyhAjv84yIJooUXuk750qQ+NKE7lO7gTW6JC68/o3I4qM25+?=
 =?us-ascii?Q?dUK7Z8Yd8Kj5Eke5TzVOUM5gKs5fLCIFAnmsvfuXbpqhHH2Jn/engz1qH2Fn?=
 =?us-ascii?Q?ZN7w9lNucQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51e54b2-488c-4a23-20db-08debca42076
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:30:24.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxmgnicWOU0e9zwQn5xGzSfkNADeWgZ2SG4GBW27rmXXxx9yNWSS41JtawoVPrOGg8ZQK+n9q5oBFW+anxVgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
and arch_supports_noncont_cat() falls through to "return false".
L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.

Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
add it to the AMD/Hygon always-supports early-out in
arch_supports_noncont_cat().

aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
mandates non-contiguous CPBM uniformly, so per-implementer handling is
not needed here.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c      |  9 +++++++--
 tools/testing/selftests/resctrl/resctrl.h       |  1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 11 +++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index dc414e55ae94..ce66016dbd88 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -292,8 +292,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	unsigned int vendor_id = get_vendor();
 
-	/* AMD and Hygon always support non-contiguous CBM. */
-	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
+	/*
+	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
+	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
+	 * DDI 0598.
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
index dbcd5eea9fbc..b28dae83d0a4 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -34,6 +34,17 @@ static unsigned int detect_vendor(void)
 	if (initialized)
 		return vendor_id;
 
+#if defined(__aarch64__)
+	/*
+	 * aarch64 has no userspace vendor_id in /proc/cpuinfo. MPAM-capable
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

