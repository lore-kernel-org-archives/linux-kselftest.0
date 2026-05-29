Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010021.outbound.protection.outlook.com [52.101.193.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716030567E;
	Fri, 29 May 2026 02:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021453; cv=fail; b=I1rSlBvl7DHUZ8E4CVdtLsGT5IfoRdNAVY9h7xOt5kPmlisRtxwPDX44z0fTRpLf+8pdFTEDvD+BnYryc1Qpk/WWZFEwS9Rg5IWr4xR97cGzPFWbiRLqMbCUW8CgaLoL9UsfDdNLzuTVcKpQkX15TA1B8ZMnWzm+7qX9sCcB2rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021453; c=relaxed/simple;
	bh=i/h02ofveOGnRsC7VSEcoSb3RMxRAVPO8KBP/Tk4QBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VfGSP56emfjbdEofnX61fyxXn/4ixz3R5grNJbJk9fb5Uxz4QB84IvW52xbMju2UqKe/iiqrhoqu+nhc2DSrDa1wgJqRD45xsjXXBoKTHYFTplM+lJMPoYrK6vduwUkBObFhrwC8WVamtCfrHIxJ9W5iCPvaTX5yrDExGO1TRP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BaJUIQIZ; arc=fail smtp.client-ip=52.101.193.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BaJUIQIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xY8tL6a0ETIC/59o4+t80e5t4y7IlNOA1tB1mpVFXZahHwdsSbEEUEIi6VSbwwvIpF9Qd3oOk20QI/1tVYC9fwuJYzsiRmElnJS81b4o1AlI0qOp+Oh58mfetnio5r/kSId5oiizEyAvb1B0sHEU8/6fnhm4wQOBWhJl597qFOl+HGParfQVY3W0H4mNmvdhCRUOP1iPheKAqCOsuFgNfywB8D7Z925jZNlRb0FMvMiKxWdg8rOFaEbELmOKk1r71QrxklzmVSI1cC9vqZ9xtVmNid44Vmf5l1C7uBLk4twLG78Z56Qd4WzsJLrKNB/y57vOC//KJLGyLCeL4H75xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD56rcluFJjw2kTUYfEf3iT2sLQSerx2Q/RLWkCxzD0=;
 b=tt/pMPRwCabx4x7KWHvCsADmKw+wHTaNfL/lhSSV4HVBPaCCbbk52J3Vmxg1rRQTqs94Nfochs/4X6DMdYVCFq06L8iWRfBy0Bwifz2fNqW+8fdsgHxW2XD56d0liflf+PB8gKzyt4NwSuXjXk6InqUcgsD73YPCwic6RkaX+llpwZdPrThb2dxZtT5sAORchvGjWb7ge7rLIDh9NaPdxT/kgpKNZDS40x0zRs67pd9j4FbdJrJLC10FYP7LQnS469ShBAmS4pkyIPQf3YWkvPyyYTcVk0WKEWVYDkIirgwcEIwkRIE1rY99REW2/Ebn7IzRTiJKmXHnyvA9lBuIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD56rcluFJjw2kTUYfEf3iT2sLQSerx2Q/RLWkCxzD0=;
 b=BaJUIQIZU21znvceOsogT0tcRUVOqa8zqRIa7dYis5K0gTyA1XM8axpBP4NQkJv5tgEmymX2y14IpNPyI60C5n1GQblNjANX7rSR1ThU41YJ8s4l7kw7K683FdmjjWfnUpchhw8Cx36lMSCo9jjA1tyI7+3L5l8e9VVsem/CxoftNEbr83ZNULIO9JnTP16MdWIgGcKXM1nat1s+u0R1HKsfQLDVDQ8ZjTf+15az7g2y4MwDz+x+H9B/qlBPfo5PO+RoOileOjZ3wBS609U96RI2SbPknkiW5LYLo6GEbsuh/FVl/3uE78qzjXtNFBj8iravkKZ1qOj5WUSChgRteg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 02:24:06 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 02:24:06 +0000
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
	Richard Cheng <icheng@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 1/3] selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
Date: Fri, 29 May 2026 10:23:49 +0800
Message-ID: <20260529022352.8308-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260529022352.8308-1-icheng@nvidia.com>
References: <20260529022352.8308-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0004.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::13) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 034a1915-5636-4dac-2069-08debd295bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|22082099003|6133799003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lISns9Z4U01+KoLPSyF+4/AYvhVIWlH5nG+rH02RLuQBlsoh6Ioe09x2HNCc3vjO6G/vrEIEK7g8gEYsrzI1Egx8ITmBRC6J1bCHai55n5qBHqDG3LtectKPdA1DyffG4z8ThSQmDBk/FKfbeejF0kqnwyMUcQIKt2Doyc8BDEtsPwtGQuZX+kVxGgmXw9bzFzg+tsIamJeEH9WEu6h7z2Q58ayaTyWZCKSaaUJKEtb2jCfnQZ61xOeb80U7lyO1TWGtjm3RE1eXIJcVNuQeY6bUoII8C4+BxXjTiKjQKNMLA/V8WCteudZ3jIRUYjzW1kPrl5BIpAc+xlX5yGlD+8mthtKBSWwTTv4qijuQ6yKHP7IJTyqWBRI7LiVijyuDDtlbYYWcI6TtqodK6mlt0H4kbUmCvX9rw/u2n11s6o2mUeZuQGIsdtT5Nc6ILug5xnX32ZANDTHXYryMTWZVUAwmaFG93GwS0yvEDXMK9DpK18KeVwlmRrrqtEUx8owz6c9UfudgJ2l8Wevl6VxJe1h7H9fCzbuLA5n2G0XkTTVLlux8QO80wVL1+ydLdCrQN8ohE5M56/oqFDBtzWvrSelHCqsFosHx2BZQkSph/FAxJbxRZUjYqU4xYid+QIiBHc8Wt27K+ja/f+2NcXGSzU3VIjY090ikeSAZnsWFElDrJVn9yVxxajmgbzjK6g0W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXN3Qm54ZUdiRVdMeUpWY2dDc1FLREY3MUhQNDk2dUJ0VDZHem1PZUp6WHgx?=
 =?utf-8?B?bmFhQkZ1NXB2a1hWdjU3clBPSHhqaHRpRmVrb0x3a0IyVElTOFpFOFdBb01v?=
 =?utf-8?B?N1Q1Ykd3OEFIN0RkUmY3RmJJb3ZIbUVkYnZ2anY3eWVnMmRBVVFYMlp4bG9T?=
 =?utf-8?B?NEkxaXVCRkV1VmZxZyszRkM0UjJDdVUrUGk1ZW8rVWlBV3A0S1hRREh6UWxx?=
 =?utf-8?B?NzIrT2l4ZFF6KzVCR2pEMTd4VGQ0SnB2M3BUNFVTT1h6SkJWckVhcVMxeG41?=
 =?utf-8?B?d3Rob0dUdGtha094V1A5bjRLZXhwbDBQSGNqQm1ZMzFaMjBGQlB5RU1pM2g0?=
 =?utf-8?B?cjg4d3YrYXlyc3RyUDBFYjhPb0kxUk5pUVNnemJPT0M5V09zNnNTdWlQRC95?=
 =?utf-8?B?bmIwU3MxWDljaG11Um8rVDA0QU5pVTljRnV5dElldmJMZ2dtdjRxSHA4ZDF5?=
 =?utf-8?B?bkp4ZUMrLytMS2NmczhPcGlBMVFaRjJ0cnRyNWZ3ZVJRS1g2ZjBuVUlERUt1?=
 =?utf-8?B?dldVZHpnZ3l6bllJZ0NrVVhCQkFTeGRMR3dITkhDZmxua0JFRlYzd0doYVVP?=
 =?utf-8?B?RDZyWEtxa1N0R2lDTllaTWdBcUwweVFIYXVDWThMNUxQK29sMmZ5N2JxOXZB?=
 =?utf-8?B?UkRON0ZOOXgrMU5jaEUxVlFDcjUrNjJ2YW14YjU1cEc1eTlTaXI0VjhDWFF3?=
 =?utf-8?B?VEpwcFNWcmhXaGkzbTV2YzRBd0ZzRVFEakFqTHNXQzVFNUUyT0FGYlVnV0hl?=
 =?utf-8?B?d0x0MU1WZk5ncFF6YlNrdTI5aDdxWk1BdGY0S0UwdFJZOVByTFkxZFBlbWNT?=
 =?utf-8?B?TGxjdHRnMXZ5bFoyck9mRXl2ZlMvNGZVOTYwYWtxNi9QcG8xSUcvdmVWRk9R?=
 =?utf-8?B?MkFkUmdIWW5aZHRMdkJnLzcrN0tPd0NwNSt6TTBNYXVMTTJhR255bkxMR0JY?=
 =?utf-8?B?TUxCVmE2SDdYaFFnekMzMmVZKzVJRkd4T1dSZ3ZMd3R2Wk55Z0NPTkpWeDJX?=
 =?utf-8?B?V2IzVUxzKy9JVzhpbENldGhPNzcwTlJCc2NnNGRuay9sNyt3b3h6OUk0V09a?=
 =?utf-8?B?OGF6RXFYd2hmVGhmcGpYVHJtT2EzM0UrdDJKenBzcWtVcVo1a3R3YXA5R0Fn?=
 =?utf-8?B?UW9vYzhzTHY4dW95Z1hDdHZwY0w2U0tkaG5ydW00bU9GbnZYWWhMdkhPd0xU?=
 =?utf-8?B?QlQyM2NiUnZNNmlMWUVzNUtxZVpXWnFMditMa3dUN0tJRHdqdThLNTJnaWdY?=
 =?utf-8?B?NWtMTVlTdGczd3VHSTJaN2pqb05UbVJNVnpldTRPbUZIVURZcHYxOS9rbUVp?=
 =?utf-8?B?R0dETTBEOUFRaXNORE5VYUZHUW85eWxFMVRlQkVmMlpGeUdlQmRaTklKcVNE?=
 =?utf-8?B?bzdkZHhJSHBjVlAxYmpJQVZxcmQzd0FWY255NVRZaldZMks1a1N3Z2h0dzRi?=
 =?utf-8?B?bFROaXlOcVlra1ZJMTBzQU9MLzdSaW1KY25YVW9OVUF4ZU1yMUxuL1lsbm9a?=
 =?utf-8?B?V3J3M2JtTUhzNjh2VzhNTHJuYnUxcHNhZ1hJRDREd29NZjlIZ0RwVVFsNFFK?=
 =?utf-8?B?K2xabFQyVFgrbGw5VStjRm9mZ0NQWS9zTGJNV256aTRiaXZaeEhvUzJQUW5J?=
 =?utf-8?B?eXlsaVN2R1FuRnd5OUNZNEF0WldPRS9XTkdBL3o0OFAyK0hOUnZFWWRPeUpt?=
 =?utf-8?B?ZDhPcGhVek1XNUtPdkswMzFsUXdoL2pqRExEenlLMEZibUhESW5ZanBiOXpo?=
 =?utf-8?B?R01mSXRtaGFTMGprbitJdCszcDZrUDRJTHh0c0Y0VVp5RXo1dEVDcjNKdDBy?=
 =?utf-8?B?Qy81Wk95QTNISEVpZk5udkI4aHg4eXFXaDlGTmRjVU4zNHBUVGlzbHBEVGli?=
 =?utf-8?B?dSs2ZUZ4T3RkZFJMditKa3YyK0N5eTJmK05aYTl0WGhNMXBqV1oweGFxTSs4?=
 =?utf-8?B?SXlCRkh5anUwbncxZjFnOTAzZWovYVdnK1g1NjRWY3M5RjBSU2ZDb2FGb0NB?=
 =?utf-8?B?aTRyU29kbjRyRTQ3T3JSczlVcWVEbUtjSVJLRkxBdG12RFo2cFpROXJWekNU?=
 =?utf-8?B?c21UdWpmWTdYRkVDeml0OFA1YXZMQ1lrUUlsVENNSGY1aWJ2VkdPa0VoRExR?=
 =?utf-8?B?bTdENmxDTEFudFd6SGNaSUFaVGluK0FGTGFXcTJlSEZKZWZJSFpOYURTTlZx?=
 =?utf-8?B?c2xzTWpyajRDNUpWS1F1M3FtZVRmVld6QXJQaDBFYjU1alMvaStNV3V0Z1FR?=
 =?utf-8?B?UFRwNzlQWkt6czBGRjdLNXNvdjc3b25vQUxTSVdqYWNsTUVrS0NtQkhUc1FN?=
 =?utf-8?B?QllqNmtpRFdzak9MeGowZVVLZ2pGRlM1L2tQWnRYQnZmQmpOamVnUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034a1915-5636-4dac-2069-08debd295bcd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:24:06.7557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVqf79MoA3sUIGgKlX2nBBZlYXQDr63bxJ1YpIhgPAS24aG67DYiBpprLXUay3dI78ibtbn3iZwoyyt8qGCSIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788

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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

