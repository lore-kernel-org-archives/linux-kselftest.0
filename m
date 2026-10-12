Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5793164D8;
	Mon, 12 Oct 2026 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791276; cv=fail; b=dXQ9pnkhecsTBeSiMi47VBubM6HM4/COeQzHSa776hWu+i0Tgf+moLq7ZuXxoBZQ+anMYhjT9Y8BvJxHy56VwAIMKro21w4zTNqCWqaM5RFRVsU3v2CMzpy5wuR86bYMhP4EEXs+yWVxG69fkWxB9/oxbWpNhkSHcM2Cwr/MLec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791276; c=relaxed/simple;
	bh=UTOe3d/93OOC/QgcYJWZeMaxXyd4W8/+hsTCtURrPBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVFisRjk7h2Ntc+3bX1GO2D6iJGDMzz25xnnkwM8+ncFPpXnlBnHU8dA5dYodh76MuYzmwAi2isAAl/3glyh66zN8onZRvuawwYDC8vn7st84rFSTS8EVXgh1ikog4M25jYMV3jtLP7dWj3AjD6pP7ez2AmWUP7Co80wToWI/90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nmX7H4b8; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nmX7H4b8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULDuQHYtPMPeNnXdX81MEX+Ci37Qj77JOCt5rw8KO2aOWt+yS8Wsm5PAuXP3TXXtvMSfnJIpcscCe9PtTFXihfKKc5Nt9rk8/hCv8s3pMaHF8ZZ06Hx1CdnV/WkoXfg0ZkvJOy5v+HZqBXOCMDt0pKLu/QW87xJ8xTJ6vFqq/vVa3Y6GaYdSTeN5b5mDdvw4MrTqvXYij6EspxIB4Nqoe2vF9KpErMUtsJ3CMubABdK0FKGNQ3BKOZUESftGvy6C+hunja1L3EZJVfReOwLVXdc/cxeyXAZvf6YdsPrmpUoa654VZfUDyEo9uyqzPixmpYoYX91xewaqT7iEjMh6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPoThLzR9soc384MJm7TI3vqHxAmY193EKTgTPo5uTc=;
 b=AS7dMdWVUVVWOUnglV0h7rHd/s/e0T+TLto7z3uq5/uFOA36b5gXplGJi5N8DL1TMWGAy4VIwaU9/SHG0/HQ/R1VKTBNC3F6U3fsNBkz5PbJ79okOOCDaJiSG8ynJ/MJoC3FuI2dVlMSvDgInuQlWDF9YFZ4vi4rxvVkNGgxIt9oA3DtuR6Cn/f46rk6puVjj5z1GRc4Ogb/czAhtragyazaeVpRaepHnxz+YkkPnJ52RNtxS+ZA8D8cGQ6luEO4/EYgYEOT3kci9v8it76FGZ0MiVFfEhx8HPE+vh/OYhO+n3c4ijPXjPXvqmZodafoVquJSyJtTnHdYlN8fPDUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPoThLzR9soc384MJm7TI3vqHxAmY193EKTgTPo5uTc=;
 b=nmX7H4b869lmn0iEupFk2IBD+IImbKXlZWNyavIBcrwNCVBeC82CQyLPSWQvpof3HElzvUJDzMUxn55txsOR/3w78CJCK00qGpNkFnVasAQPlezO4rXbhxwkUFbpO+OiRIyx73EZ4FrDucRFzdkyTTEhHgO5XVK8PK2hK4UoegBBoFVx7N2rAdAG5BnLvCJgm1ei4Tfg2BH7RTOyGqGGOfS7a3hDEoyGn5rkR7gObmjCACRyKxnWv20YT3NVivUfbrnX/B/RKEuAkUVvlw1Cbyc+kWSP2bwfKvR0v+eDZxlD3/jR2QY11oZv/JbZOLZp1r6bo0D7I/zw5zilUy/RQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:47:53 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:47:52 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	shuah@kernel.org,
	fenghuay@nvidia.com
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 2/2] selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
Date: Mon, 12 Oct 2026 15:47:29 +0800
Message-ID: <20261012074729.40042-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012074729.40042-1-icheng@nvidia.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a30440-51ab-415e-b4b5-08df28351e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	I05gksNGPCPh9nTaxhN8GQkxStpubS9BT5iSxzq38qMxYr0KJ+QHZ07prQEx9Sm7a0UN3Ez5YFGbKj6kdBEyVEvLetuST5lXdIYYyMYqkJn07ADey6BKTDjLzUYMR2X5vWL2ObmFTJFInYwNcDUKtb3ftT03PODwaYFWgSAjNFYjk+oWCRBvraKO7GLvZpQedU4+m/yWIJNQ3mUiO8aok91BQOLQYx2AIci4F2XnmiNpNX5GplBB84JgjN17hckmaM/YnyieHm5NuEQpks2enj2MOGjqB8JuBO2bHowzEbC+zHD2/7XKVwlTGJgypZdi2+C4gsct5ZknzlXrvsqsGhNRgqpx5MUr9y52sC3+5M/E2mG3jNvjEgKeNGxNvr3clWh8TVm0OalHGLd9ARN5XWwKu+37foTRzRu9ldjgkYLpbcDumsQ1jMhl1+ZBSPmCCrINt11/whnrPOalEKRmNyjmXd1Z4fTgYnFKilc8OLAkcnISqLim+iD5VzCpG5JGXU8XfFxRqpoMadMaQOmWkRjkjXNPGlkOnIZh9iUKVOFXlCJHnm/AqA6Yrn7AtattzMQuDk6zDHv/HfnNR9lOFkXHMEZPVPa4VOrCJoAkGt5zF556KoZyjAd7cQgBYyRuisAUbW6S9Xb+kulWThFsVVXe+n9wykYzOP1I9qqEWeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmNneExJZDlRdGNXS3VWUS9BYzNuMFkxVm5tVW5nWDFFWFlib2VCQUFMWDE0?=
 =?utf-8?B?VDZoOEYxdkNtdkl1TFExVXRlSStJNVpBSTNtTDZJN0JQVVlrT2VNUk5JL0V2?=
 =?utf-8?B?ODB0SGxlNENsOWdQWm4vdDdUSVI5TFBSbUkyZlRTcUZIb3QrT1p0OER6Qllp?=
 =?utf-8?B?bzN2eGNCTnVXOFA3VTYyVVpoZHhwSjFaRHZ4bHhXczR4U0xaWWtGcHBaUG9F?=
 =?utf-8?B?aGNlTW1NUTZvOE5CWGVGNis4SHpJVXE3L2E2TmpSMG95VjhqRUkyako3ME4w?=
 =?utf-8?B?ZWpjWmw0bXh0REFnWjlyUmhSS3AyTW11OXN4OVRscG1hb0NYY1BhZ2x4bi9L?=
 =?utf-8?B?M0hxbHJNYlc1OGFsMTlBRzlWQ3JhRWFCejlnM2txZEFiMHpSdUFIb0J0RVU4?=
 =?utf-8?B?OHRScHphb2RPSWdHd3ZYK2RKckx0clhlejhPUTVxek1RZW9lVWE4MkdlSXBM?=
 =?utf-8?B?UGFhQVZCcklUZXlqNnpvVTJhRHZ0YkM3OE12REpzeTdKOVBmNVZ0aWtkdHdu?=
 =?utf-8?B?Ti9yaWZLSzlMeEdPTUNyZktlcFBIL1NKZzNpMVMvZlZxYy90TGJEYVV1S3ZN?=
 =?utf-8?B?V2YvMnhoNVhVam1zU0dVcis1UEE1QWRlNzQ4bG1HWGliV1Q1TTlVMXZEMEtm?=
 =?utf-8?B?SnRWNlZBcFY3Q2ZtSS9KSmVmWmo4YVl0SHhsTnhGRlQ2THNqREx5ejF5cnc2?=
 =?utf-8?B?TEh5c2VSQzBqUFd1T01KWnMzZXVCdWt4RHVGLzl0VGd5c2M3T3h6dlBYZ21i?=
 =?utf-8?B?eXY2c1U4WE5wdC9qMGFYbUJ4Mmx6eTFyVnlLNHhmcUpZMUVIUXAvSFdjRkla?=
 =?utf-8?B?L0NOK3J5dlJOUjRVaTZWa2E4cTJZY2dGNUkreEpxV1R0T3liVDhKKzBNY1Jj?=
 =?utf-8?B?UHlzeDJpWkpPRFgyK2xJam0zOGR5SzQxOHVaaUk5enVCY3V4RjJhaFdFUjJq?=
 =?utf-8?B?Rnc0Nk44QjVLcEd0NzVZOVZsOXNsSWtxTitwc0sydlZGSFpTTkdXcXRDRjVm?=
 =?utf-8?B?UHI5QTRKWWJUUUxMdHhuOGRrRVgramtLTU9vMU1uZ2d0YkZjaUh2SnhxdG9R?=
 =?utf-8?B?ZjVHQVJVcEs2OVM1OFF4MmtFcWVBVHI1d2ZDRjBuZ3ppN2x1Slo0QnMvUW9i?=
 =?utf-8?B?NkQyNGl4MStxTHp3SjliZnVlVnF0SnJqOS9ad1BFUXpxZFpGWGRyWElVSzNt?=
 =?utf-8?B?blRWZWd1TTVwM2RQMUduTkxpcnpHYUFKVkd0NkNvMTZTNS8zcTl4eThpaXV5?=
 =?utf-8?B?OFV3WlhUQWNMS2tLM0Z5MkZHMlNSZlEzTU1xNStQb0JxaTBFK2dDbE50SG9j?=
 =?utf-8?B?UG5peENtMUF3UXB6SHhEdTdnWEZxS0JLZG1wdVgyaGF6OWVqRW9KaGYxa0Jy?=
 =?utf-8?B?c25pcjUrYnBjVXQ5NnJ2NFNOdTVnVzlzUzVDRmFlRkNsNG12Skcyd21JeXNo?=
 =?utf-8?B?Ny9ZL3ZWRWNvZHF4R0p0OEt3cXYvbTBmMDhpZmkzVzk0SmEyMElzN3A4Q3Rs?=
 =?utf-8?B?TWVEVEkrOXdLUmRYV1NzZXA5aCsydGxISkF6U1dNcGdscjc4dUYzZUo5NXVD?=
 =?utf-8?B?enNlaW10R1poYklqVjByM2tNRzMxajdsa3dLcmF4MDNPTjRFVUlIZnJLcGR0?=
 =?utf-8?B?c0xnbjZ3c3dRVGtZdUQrVTJqL0JuRFpFSm5LeWI4MW5nTzVoZkN2Yy8vM0hL?=
 =?utf-8?B?TVR0NHg0WUxMSmUxVEZqS3FWeTd5dDZFWTRLR2x4b0dvK1Evd2Z3RU83eG92?=
 =?utf-8?B?V283N2huQlFLOWNYekVDMGJhdTN5VUJjVFFBQkdiSGV1aVVwZXpNR3VtRTht?=
 =?utf-8?B?S3dPa3ZiYnhEc1ZHcEFLOElNL3pWZm1DUlcrYnQ4Q2dkNXZtc0VsRjhJT0Uy?=
 =?utf-8?B?d05jSkVVMVEweGdJbDRaNGZVbE4vSzZuS1V3TjlraDk3WjBacUxLTisrQzBG?=
 =?utf-8?B?NHlIRVN4d29ZM3F0eEJCdHp3Q0FDRm9TSThicTByUldVTng0b09lOGNLRFN4?=
 =?utf-8?B?R3FHdTZOTGNsR2U2bU02dldaN1RNRXhhUkJYWHJkQ3dDcnNINGRZb0ZSOG0z?=
 =?utf-8?B?ais1WlRiekt3eVdSbGNUb0MrRUg4QUFXODE4QVMrZktXMkFvRnRta05ocXFQ?=
 =?utf-8?B?Mks1d051cGJpOWE0bStlalJ0ZjJrTkNSUnV5dzVHdkhUaDBuTTVEYkllNldE?=
 =?utf-8?B?SEpjUUpnNTRDOXFsTlJtcUdRRStuNUdmY0VxQ1ljQUczZUUxMWlqb2d5WU1h?=
 =?utf-8?B?L0l1RTdyWVp4cWh2VzIwbFJ1N0RwOGtaaHFUc3Q5QzhhZFpxd0syaG93Smc2?=
 =?utf-8?B?b0xJQTNuL3BDWmtESmlocGRpUkN4bXRlUDk2MFlwTGlOeWZzb21UZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a30440-51ab-415e-b4b5-08df28351e95
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:47:52.4538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmgcWiPeZ12b/cW4gelC3uuVFSkMgt+Zsc4B8T9F6LIYZ8IeV6wICFmndBXTaMxyHZznWahwBKe/AhG/gb/sJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700

aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
and arch_supports_noncont_cat() falls through to "return false".
L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.

Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
add it to the AMD/Hygon always-supports early-out in
arch_supports_noncont_cat().

aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
mandates non-contiguous CPBM uniformly, so per-implementer handling is
not needed here.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 0a417267dd74..f4b02b3eedd7 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
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
index a7556cdae0de..03b4500c1f7f 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -41,6 +41,7 @@
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

