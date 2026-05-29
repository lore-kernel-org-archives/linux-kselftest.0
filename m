Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7963340402;
	Fri, 29 May 2026 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021464; cv=fail; b=r+KyYJ3wmMX1tibL4dfd7ahpqMognGWDBq9we9EGBORFRM0gi4R/oIYBnWPomqFDXDb2krnsDQV8aXA6eXkjSDO4IUuckiDadxQc93v0wXnqZ0tdVbDicYp1iTRMWdwZpRf6r4NTo6sUkQRwftiwqv97Ws/6/fPysAfeeVGQQVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021464; c=relaxed/simple;
	bh=0cEBHvfVMNa/Rx6otdq2qzHvz+atc77dSnjLUwyCEkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tWYauYpaxaQFZI3Yk73vbB3TzOl8NsSL1ljPBcdDgYrmoi+pfBQlxtUxK6sYpYfK/pJCmhjfOJj0FD/RNZbwCPsqvbkcHwSvkoJx33SdECqdvHl9WkzWoJLYjOOuoe5J6WOmSTCZqotJfHxRl/lzPp+hKx1W6UD9lbJ77jKC+YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iuEaZTbS; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iuEaZTbS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yM4B2dzm9t2tY/MV73Zuw0Nq4s9B8j6D4Gwl1M+bhl8BWE+zacwDDzybWxyhJSAyp4bJZhqoYxfT3xbMrgtFzLQKO7uI9MBZtZYOcc9YJZVDb8Jel/ObFllHzRbzkeDBKfHc1E0os6LPdTkXlqIlcxQJ1iMjXiotPaqQmpvG9XAn4mRC6gg6yaU9TR9E+EFM8PZpi6lyk0E98uiSKcBRWI0BF9C3EiY16SG7iF+1wL6spyW/BqMWpMWnCL/e3jJVKtjT3O8qsf9rWxEWaUopNOm7HjZe0n3cCMNeEwwUKReS9L3xZYRS6oZgWOEM9/9n1HJDkOKASUgPcONwKxxAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFOzYBwlIAFggBDMXw6aGqOFxh3qRX74cjBNaMtCEjg=;
 b=zCYBympu9JO/AxKEMdUghpMinjXBEJ+ZVbd3sMfOXnhdZIFscF9pXGLOx59yStilvWmRS4VLQgG+9QbxdsbcNVWNtQtTwgoo7pmhKhmLAy9pz0cuj/x9VZzb803L2sMxbr5vjABlVtCUEcxAZb0rTgzqcMY0QlNRvSGvwf0w5SAklSpyi8jvhuGxWSUIz/n3dsVCijeY16F3vT+ZXE77mg3bN7sb9Ef2jgipgE//FlyybAvl7c62NKrIOE37erwdfyH05W5888g4Vc0ZjPJ9a3PDPs0AuX7TSO1nNfsg3eiI4BwMCXHSQOLK1FJEtAOfNAa/SV3sdm4jhEKLKyObew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFOzYBwlIAFggBDMXw6aGqOFxh3qRX74cjBNaMtCEjg=;
 b=iuEaZTbS6Na//KOC5NIFT38EhmmU7EaP4O82dzi+OOB6KwLYPrW8zrM1Wyz5PliiDfWcEHL/XLp3a258+TGYv89N536Fu8/rtsAThFqDO4zPqcS6hz3yGXH0UwOIFesZwdQzF7qIFolJpr7RcMkHhNaTyrL/eLeKYBPA2v0EBeoM0SDkMnA7ixPFbiU4zFbBW9OTtNcMBLj+JGQmDkB4nk0X++02DRrUvhI+D57j7kqrrNNK5iiqKJOyBgXxa6qFBBTVz4KxVkOporlap60Y46Qs1lYTo6wYRwpQfOiUn08yWNVqw3UmMXkvXVtWdLGVPkHQPQQoeDDHGTvMOsCZAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 02:24:19 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 02:24:19 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yu.c.chen@intel.com,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v3 3/3] selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
Date: Fri, 29 May 2026 10:23:51 +0800
Message-ID: <20260529022352.8308-4-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260529022352.8308-1-icheng@nvidia.com>
References: <20260529022352.8308-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::15) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 16dfca31-73ae-450c-1611-08debd296398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	pfj8fA1C2J6f5dJeYkFtTyZBufhRD+ItyCG5TmywwT0dN0tJ0H6B0YaZCJ2RNXEGDlC9cgW0nnGhQqIt9NE2JD98Zr+erX7o87EwB344WASdcmC6eEB9v+oxEvGS7uTLOAUDIN8W+Q0h+HU1yhBITmsvUylbv9cYWwqS1xDFS1dDeeyGQlSk2Q1t7HkvFvkPYI4RF/MrOwOZmEnGnaYJBvT2TQS/ltJwpl1g2yVa3ayoDdI57wO2s6gCmzDN/bcvt9ZFl/KqhdD55edeL6y3XxhsBLIxzMG95iwNPvusKZfAXLyS0EWa7mml5ks9UYhzGhIWHycTGDKG/bzCGPWgGVlUPLQr59xZr0pTh2zlGuIc0CCcKTfPrxoI3KUM1OEsmoPf+lGQrbrr4UldyTAzKpZB6GlsCaMZyDZ2XEUn5dgqhu8bzn3aDlvfR4Onkv2auBd3HF8ExRM7TfEgzKtQfuZ8F8PEUID5QMQTI11bzJL6+BPoTnYMTnoOe+7IL2VgapndaBozGfmJJohYQwcLZ1EJGlb+8Tdrwgcr6ad7OBCajeI5Geq89TckB6wfnaWbYvCFR/aLq7wa/ruXv8zYJlwf29PSiBFQ8sA++vaGw/0fHAaJkJgJ6pOWyyFS5XKiUbMKX0muYdMp7fI/A5BsQIoAhR5+o9EvshbD1sAcl+aIDMfd/VM9sjmJK3gBgp6I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eqre32UPULtUN59egmawkMHfWAciJPqF5TelRH+YuqkZbbzfncfmBuGtLPbQ?=
 =?us-ascii?Q?R1TCpCcROZD6m4zWZZ0tyRx9QpxE3dU0n+v7tV+rJqOvDRXYtuzwzfBwYn7F?=
 =?us-ascii?Q?rVVBnpn3tCUdkXjcTePszpa1pa3lbU4Pj24+omM3C6enSKEh0wQcIfHIqLRP?=
 =?us-ascii?Q?J5i2jr7erYWXaR8xlXG6iUUa01OzN4UaEbBZElMZOE7FxRbRByLq+IJI3j0h?=
 =?us-ascii?Q?Scj0ZcAnIEGDpdpNNoEjx4xTUKsvulB+M0AMSwWHWOVAil3eFlrtKUNF7/9x?=
 =?us-ascii?Q?d8OUiCoJdCb9vrvLICcdnNFRcrmCKzmTvQpE2qSmyGxitNc1NFMQRDjxlOeq?=
 =?us-ascii?Q?+NbVSvr1GLjWu7hnOdiR8z6srK6DHCg4BYgpABPPf2/XHi/FMPC+wED9gq4b?=
 =?us-ascii?Q?y5gqjaIyFTOhCfvYSWZH3HhVWR5Fg0uUZSstTkAcAygdllAdjlRiyvEaAmyW?=
 =?us-ascii?Q?OWrz1CfwIvvetZ/dusKiypCIIUwLaunoTLffj711hZFo+jJmV9DotaJhzgKU?=
 =?us-ascii?Q?eBJLhhMYNjFpOx02dhoEC9HyrOdtleKxIKyyTjdN9Oa8vKIdmtey+n9Jplvx?=
 =?us-ascii?Q?gOrtCltBJfB908xsRAk6NtHacRLz0CXRSVIFcJSm81HFVFkjUSJb2DU68roO?=
 =?us-ascii?Q?wNpA7Hbe5JD6kCQ9X74tBYpjVUEQs93sKLnsAdndRmDXVcNBECAkb3gBWibD?=
 =?us-ascii?Q?gtEctw8ucOng466aiiYq64tJcaE5W1eppHjKvio2p1sbGVxtbY+5K7LmkoqR?=
 =?us-ascii?Q?71knNXLivWK/XQtHCcfEVy8BIX6pOHm4/ZZkpd2iAYew2q1ha34O6CUP25Ua?=
 =?us-ascii?Q?zzrECY1+MKfUQcRyyz3NmiYr+t+eEX2g5yFzXApXdCqobIRkzlxJJ+dREDBD?=
 =?us-ascii?Q?mLhvtHFlIG4KP+7Ed0FeUWEYsX343mXyt/P+NUAvsnucLG9m1DwOXkeJkVrV?=
 =?us-ascii?Q?PRF2irNKH76SutuCc/zjOPjeO7kd/tfTJrICRb62lvFX8fgoaVtSduru58Mw?=
 =?us-ascii?Q?z8AfqzDoKN+RfKqxHGPSaRrdm3dKNKVavmoGCpgtzxi2I8H5MJyZwL8mKFcX?=
 =?us-ascii?Q?oIAJMt3n6fCf7RE/Bxz/CV2FJE6mJJQ+wJQvHPVF8w2gVQZwM2caswLRXz9a?=
 =?us-ascii?Q?uD+wGJMGPdHWCGN+ZJL3Rc1Gv816V2KXcZTr94bnvmTqCKQ1lltxPM/Xh6eg?=
 =?us-ascii?Q?UCs5s5f+AldpnYRYjLMzq7W4DNADtkMzFgh+sfuJw5B993ddzvgM39+vdwvx?=
 =?us-ascii?Q?pX2DLxASPQspZUjR++yv5SY6by/vyvtRH04mBtKENkKvMfhhd8XDGxpWHmtM?=
 =?us-ascii?Q?2cOp5uvnVPLlZgn6I2dEXPphKzreqvi07ZzgABHwwpUjgpSLfyZZrv9A+NwV?=
 =?us-ascii?Q?eDsMkR+XNmrfsNMgdt6cusVYE0de9HHXdoNKyxLNZWcS9GLXBhZ6epC6wtnX?=
 =?us-ascii?Q?Erl/8Ka+YHPlWsUk7zqOFUcAtvkoSL5O8g7eIry9HUOdEPHEBOZeBTzpuki5?=
 =?us-ascii?Q?uKoRx0U6y1Qs4al4yB/QeUcImf8ZpOh6OGcOimdXe7HRF95M21x9HweNE3E3?=
 =?us-ascii?Q?tA7RvNMkoIH7a0cs6Q01XfNkTcTf05le0DN4UNW1DvUOVuBxEP0QQWPqPC8X?=
 =?us-ascii?Q?nDvQX63bnQPH/5COzrolspM7QZ30zuGCyG3TuzCnfmIe45ODPgiO76KTfjfQ?=
 =?us-ascii?Q?PDetft482vejtc2PouKXNiWMk6oDwKeFR2TuneIy6A+/gxNbgGOz+kW7IMvm?=
 =?us-ascii?Q?eT/WmkkZ0w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dfca31-73ae-450c-1611-08debd296398
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:24:19.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsTlnVm5HgrgRqh/QdIszbSV2XytGg4MFG7EEcRULGhbYYyCC0RpiGM0rg9H9TRVZMgkucLyuKl+bODZYlBaVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788

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
 tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

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
index dbcd5eea9fbc..cfece594a8c6 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -23,6 +23,15 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l2_noncont_cat_test,
 };
 
+static bool detect_aarch64(void)
+{
+#if defined(__aarch64__)
+	return true;
+#else
+	return false;
+#endif
+}
+
 static unsigned int detect_vendor(void)
 {
 	static unsigned int vendor_id;
@@ -34,6 +43,18 @@ static unsigned int detect_vendor(void)
 	if (initialized)
 		return vendor_id;
 
+	if (detect_aarch64()) {
+		/*
+		 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
+		 * MPAM-capable ARM implementations follow ARM DDI 0598;
+		 * treat all aarch64 builds as a single vendor for the
+		 * purposes of resctrl selftests.
+		 */
+		vendor_id = ARCH_ARM;
+		initialized = true;
+		return vendor_id;
+	}
+
 	inf = fopen("/proc/cpuinfo", "r");
 	if (!inf) {
 		vendor_id = 0;
-- 
2.43.0

