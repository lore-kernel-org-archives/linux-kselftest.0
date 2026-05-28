Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C23B38B1;
	Thu, 28 May 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964217; cv=fail; b=tM+ucXdOT//AS6lMQ+uyoO3kkquusplQU0V2tIDPnVamtgej7DZhISbzJltVyzk17UHLxxe3OPdccCWTesnnRQN6JDOUlmLKyPoyKdGdHiqO+J9IfAVjik+TANEMcCU/IyzTQ+RICoWZPgRkRIhQQMWdPT7NuoO9DnPihMlaGL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964217; c=relaxed/simple;
	bh=S8WqR0dPKgPUz5oPjkVchMr70ERbkD6LP95Lq6BPuRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctJ46aKJH5pDlXZHI2kaqSGV3nseyOzUgHk1r19NpRRGplkiSPZ0js5HGDihUy9qBX6hEM6bClyD+mQsxSWPhTsdlesX01FpnRb/Cp1jg84Y2Gl4kA74mbLIECLRl1P/bc9rGcbD1GrtpaDxudsBy++YPlnfbzwN8ojyIUlSFv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pQe+z5Ag; arc=fail smtp.client-ip=52.101.46.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pQe+z5Ag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ30ETGQQsGfbi5DjjI4U59LQ+v1oGDl9vxnMa0cuHsUE6ImmYedMaErt25TQzBgftVVFGxwIa3e8TbsPf0vrNo6sz8Xg2Lo0mxM4lNtPP7HX2mOng00u0sifWBldxmuosRfuBStg8Ii3M5aVUprGCK49l7hjtzWlDrBnvM1mnwwRFB4n6HZAjkzGe8JanxgrzwF00POsidUjQM95LtxHRZJVXq77VC0HQoBxkZKk6Hcl5caKG/ccSYGTVy/luio51Jm/zGjY7IkIpvF+vBwaXJjnATVoYX6p9/DmDEkilHl8hDCy4IuHQa6DY5d/Vgr9GH3zSeH6HSHKSI1gqqC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UpI6G+2Xk0SlWlR2PXG9val49GMJPSCmg11LDJYzyM=;
 b=hJK5VLaorRcDFAYOIscR0iehp0InDKIShIjHZKlDEeVmsT+02mvaPbtvtWk7KWoa+yy/e4chOg+Kn/OlUjgh47AosOg9de/kq16h7nWPLhI4injPDaC8sjwzoZcgPTucs64gpcjzkZ3erf3BWLBTChBDEy0RvTO3ocLN9C1Lo7Z1XgbIrtLBo23zt2NuR7vEFD3IE8JPNuVKzm6k0mj+gcxVhS04JbOzzumgVboWyYhaUqOd+uRSa+IG4Hf2bx7evWdgu7tSEe+/blu6fXyEwjCwV/YaXHV2hsz6PVsknmldn2ZY3ES9O/rKG76jdA3OZlksNZS6xSPQOB/BxGezYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UpI6G+2Xk0SlWlR2PXG9val49GMJPSCmg11LDJYzyM=;
 b=pQe+z5AgSh6XqVh1ils+RYMqW0m7NK7MkcdrCPkD0QonqPiWXp+8hloUEFDrltfVh47qVey7HytM0UoYCAsQDpXiPfNLrMrLM+6vAkyWQhuYNAnWnvJGkFqLm31iMbhmTzAKE7OQTfp+iR0X7dzHtyBtypdhCkUyZ1nbvt3QdxWA8AGuFj/pt4ypJCaqN2NzA5fbPU6UcAUhwcma93Ez3DjV7mSniSB6IWFp/ghJu3JoDJ5h+Sp+Hqmukjq3JNCEI7PxZxc3O8zI6Gj/g70OjhFEY+NlKh05G4mJk6xOJUFO4H+xLBUnF0NKA+Q483LFMvcUBWOycIf58FpdkR2lFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Thu, 28 May
 2026 10:30:11 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 10:30:11 +0000
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
	Richard Cheng <icheng@nvidia.com>,
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v2 1/3] selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
Date: Thu, 28 May 2026 18:29:54 +0800
Message-ID: <20260528102956.33121-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260528102956.33121-1-icheng@nvidia.com>
References: <20260528102956.33121-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::15) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a969d7f-e120-4097-8b12-08debca418bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|5023799004|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EJmlE2gSUgKQHEqLcMcJY/j6RczFggCbjrXFkNr3/BK82FUGL0Nv7f3HpNVDX6E9snAeoGTuxXYo0OmKyGpcHoQViJoD6BZsH8tqS8GaCGL1dcrwP1XV3pzHsvZClyRCpmmMQlyIrpYv35+98PR54RM060jCoElHb2RQphMMDdB4ta1YgGcylGa+zowTpQv0x4cusenD+uHlTpe2HkHY0yRERLQPvoPdKvfJA7mLOtV+V7hOEtLSsmjSrTQ9plcYZS38slBwd17jrlZVBTIgNPN4l1LXn4lxshPmc1FEi4e7AJ9TKkqg7uYOvjJNHdtc2h8LjulkX26QL4Pr7wRUv/rNitoyXUYBdpz/f+EAYeXvYc6DOmdArirLjP2pph66ZwamIlTpBr9jzfk5UJAOm9KJu6xLnGbVcvFBE3fQ13dHlImM4E29F5M/CWPQif/ijLJwUxJG7AaFvYcGpRb5tcIW+jw/GX90dm6FUukDSth2OosKVaYgNitYcov6URuxd5asespf6PB0gOpZ8KTp+s/5dCjLgVy6N3tsCtbazpX3UUujpA4wVIo8TqRdwZR6LLIapbgyXNLs9G7tzApWSpFQKEcGMONtW+tqR7Rp5SJl9eIQl4RPLMtpOI1FcTQYmkauCyUo3m0IwwCn2mB+RoXCWl/PLDZKGS762NTYbyZbYpQjPRO2B7syFEGQBU2o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(5023799004)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VuU2IDCL/VVhpoppc5antHjK3/l4WNcKWiU8KRbv4Cdoc9oWKv9YXk5aC6js?=
 =?us-ascii?Q?ZaBYCl4o/QIaaBmUf57IphI8G1Xc9e3KVLjIBYmpmuvsArQ+zcvMHODaNph7?=
 =?us-ascii?Q?+sIp/EX0jViIrFzLokKt69eksu9gYI5Sd9IFoPUBc44WfxIK+0sMUqmdnyaL?=
 =?us-ascii?Q?uue0623oQyk1eglIoHxVAoddZz+9In5uJO1texI5xRWM6PJZ11/qb6bUYArF?=
 =?us-ascii?Q?sXQaYDAQfVge5pH8izpGqKekmrp58s+/RnABr6h+BPlx4n4fdjUQuPVvFP2U?=
 =?us-ascii?Q?8VRikrKMSMgOpUQQjTr9mzXC7OIn/QBcyNqc5CflnRKVWqk7o/O6TGRxsGEM?=
 =?us-ascii?Q?fPjPDNXW3+FRu5XkkILIuGsZooYD6DN+SyiagAn2db7PzTDyIdi6Gp//tx58?=
 =?us-ascii?Q?qKG8u+1jXtXUpoJdKZW6RYzAu7R8bgRlaJpe7KYiMcVCJsvOZhCX8LaBdoji?=
 =?us-ascii?Q?5A8HhOq6pg2+2HXsm6YI5BL3bVB38uFFul5qOzxoRpAq7PI/BLTNhdofje3R?=
 =?us-ascii?Q?xB85RoeF++SqGUKUUz2AJvv/FET61E0K7uXvuxVcR0BRuUaLj3xwlOzKUXUn?=
 =?us-ascii?Q?g5oP5ShUNQUR5Vg0oe/usr+i4IQYuH5vsA+Z62BlB+nqOu6+nYCSp4tTEjNu?=
 =?us-ascii?Q?Rl7fwPDhlpky31D4DP056mNZ4LWr+eA7jW7qjl1x3ayz54D9/+QzvxhM/NBY?=
 =?us-ascii?Q?ZM8ZoUioo9GWMAxrmIbaSA5OKl3oqvWtizijmHf7Ze0w9rfju74TNCA8bmhC?=
 =?us-ascii?Q?UqTK0bBYYhMBxRG+Rc/UFkMPf/I4u2hXarzhJeawiPYJt/fFw9NCREcKNjyN?=
 =?us-ascii?Q?vD8fAlfpIawDq8FmgBtOxWtawQA2V97xLhlPF2AoHRbnhZpsCTjk6pQ8uD7Q?=
 =?us-ascii?Q?QZR4vVHq+EN5Siv/YonpnB4zJjt/2uAsxrX/nHYDXzHBOHiutva4oH1wH1KU?=
 =?us-ascii?Q?5VLlFHNWbvRi/7r56+no+HyNnYXeeLdEuJVZD/ybT72vEBFJwiRM61HRBh0t?=
 =?us-ascii?Q?ppgRgLThUUR4MlQPrrWCKY2pTGw/LCLWBVPsT2u5RpMfJZUwcEghhXZUL1tJ?=
 =?us-ascii?Q?EzlzR7DXpHB6Y/QYDb0T4UyCI4LQ/S/PvdoHFsYSWHq9OZPVgbAV+FBXIIyw?=
 =?us-ascii?Q?uxy9YgOiK3xt66d5fWnozG6XnRvtUOC4OWZ47Aj7vEcz6a+nIZmOqrOZb0I/?=
 =?us-ascii?Q?4mQdYeam83dJCpJcMe7Hg6rhBKT8WRc5cm3RpLIdUxrpHxzrfZOvVPwVbtI8?=
 =?us-ascii?Q?CKwgjEd+zSviYB5DmJmZLb6LxS6erTm4IqNt/NBAReVPyX0h5Fw7MMXGVeRr?=
 =?us-ascii?Q?YZeTN8LA6A/2AFTKg7T3yj+8lFAEVZh5jJ/hDBJxQR/SpOtrshXpUrx3ROr7?=
 =?us-ascii?Q?DWq+sUNSCYWbZcCzwFT2o8+C2yT4tPShM1sgaAXCky4VsiCmzSLx4uSty3ZG?=
 =?us-ascii?Q?Zlhy0S++ykiX5XduLUBEaeliXSZI09YChRYWb5dP2L8nkrUqNWzcsKXnYyPI?=
 =?us-ascii?Q?pFh8rbQXcU56BgQEAUFg8rQRvQanbAxfOPIh3RfwNbOg5l5ps4TIb1pGTjja?=
 =?us-ascii?Q?Ic3ZoeIJY2lzUPv7xFluXk6I7rqYqLUcMaVzTio8XcXTcFg7sHAQQfAa8ABg?=
 =?us-ascii?Q?YmAY2yKlnvfh9W/u8c4RJRVWag/NvG/1rZalKyODyQUB4OQnf2zgzdUj9XjF?=
 =?us-ascii?Q?vYV13O4FSu/h+kiTQM9QghyjCLDlLN97nMIhpVKSKZ+PT0KRPk0W1O4/NWS2?=
 =?us-ascii?Q?agmtWQYsAg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a969d7f-e120-4097-8b12-08debca418bb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:30:11.1833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xrvwo9JaOkLym8Ru2quOLZR9Yr+G0/sUiT2Hx90xXKHv2i/aCL+hLiCgaQi5HT0teaG36Y7NfevCmLQlAFfgWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

L3_CAT measures cache isolation, which requires at least one cache bit
that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
must be non-zero. On MPAM, shareable_bits == cbm_mask is a legitimate
state, so there are situations in which no bit can be reported as
exclusive.

Previously get_mask_no_shareable() was invoked inside cat_run_test()
and silently returned -1, which surfaced as a test failure on arm64
MPAM systems.

Implement cat_feature_check() to perform the same check at feature-check
time. It prints a diagnostic and returns false so the test case is
skipped instead of failing.

Tested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index f00b622c1460..dc414e55ae94 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -378,11 +378,32 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
 	return resource_info_file_exists(test->resource, "sparse_masks");
 }
 
+static bool cat_feature_check(const struct resctrl_test *test)
+{
+	unsigned long mask;
+
+	if (!test_resource_feature_check(test))
+		return false;
+
+	/*
+	 * The CAT isolation measurement needs a cache portion that no
+	 * other agent shares. On MPAM the kernel may legitimately report
+	 * all bits as shareable; skip the test if that is the case.
+	 */
+	if (get_mask_no_shareable(test->resource, &mask)) {
+		ksft_print_msg("All %s bits are shareable; cannot measure CAT isolation\n",
+			       test->resource);
+		return false;
+	}
+
+	return true;
+}
+
 struct resctrl_test l3_cat_test = {
 	.name = "L3_CAT",
 	.group = "CAT",
 	.resource = "L3",
-	.feature_check = test_resource_feature_check,
+	.feature_check = cat_feature_check,
 	.run_test = cat_run_test,
 	.cleanup = cat_test_cleanup,
 };
-- 
2.43.0

