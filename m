Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278A3932E4;
	Wed, 22 Jul 2026 03:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692799; cv=fail; b=sYYzKMgOOOI1fVvw698K7mR/qZozHt6CVRPCFrhOuK65atInsj/oO1oWBUOsOGxLryYoMdj8msXqNTY7KsmIuT2snCB51k1xmlA/v3uqpBl6Ft6xhkZniDcwzdnG/4QmlvQsBahgLsOCrDaOOPD4AImDDUwfJDgnYs2/lnOJnAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692799; c=relaxed/simple;
	bh=zuPs7dP7lmhckEv60fiixUjFc0T7MQ3rU2WNzFu+V7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bSM6+T7B+s5CMHJMSU0K+55HLsqPB/81YCcUAjChBipUyIMhkSx3nH7iLVrZQ3F5is2Ukp3gIxAYSdf+FBHAZmED/viUrBvfjhytEkYVBuZsaAvOqk2KrsLUTibVtPn5aqBHQPsE+wG5XPRi8M9K+zQ2NZgm7ymlyOzELsYcA6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FTUIPzrg; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FTUIPzrg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdrGJoKPmzP7KRStqqScU63I55R3VOXfpYpCLsjMoqpOdo2iL3JV/16+qiQ6oTcLsqscGOTwU8CEA0kxo6BxTc3Pniw99LY3HLGTBvxj3F38bdk6sGIGNFIE5OlisV6V9BbKUxNLijcaDRUB4J3CDmChjio9G7Gc+YQpG5OenSMUjSmcvu5EfMv296igqV7D1WtjBQEKU0d0lNtP2PzfIBPN4fDVxK2WZUK4uVmKGgAkhyHfemr4k8/VVbZIO8q791hoLvC6pEhx6oJPUQF7weKF0RkEmQ/eO9KExypjrQF9cMAKwqTWcmkhu57LRGluP/TSTTyVPQn7NN4fMny3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdiVOwSIU1oSZuzDvYWOXQbqtvTG40Mno0jV6SreNbA=;
 b=WqdU/4uMeiJvuIpc8Kc2enUoWgQXdGWH2PF+GLWCZyHwbnWPz4H5N1dUAp27pm4vNTAbv3sD110SFW/6fHCcbHuMbLhl064GTP8iLrp/BNHXsK6qkZIu2Lt4wAe7kmnCx+5gx9CswLtW/aCX7cBiNNG8VAR6qwkGjx7CkkiQVMo9S/ad1OtmG12wYsb1trHXxXWXD98NFdFSHvpMF9Pvt+GeHSUxBwPGfNlBpmofOooCVJP/FI7dFJtdUIgaNj1uOJRyVL1KggMN5Oa8XfU1GTOzZFvWTth/r2o/FRASn/CSiubCJ3e5DLkct4rvIBEQjE9gYS7FwBDxBmlG5Lo2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdiVOwSIU1oSZuzDvYWOXQbqtvTG40Mno0jV6SreNbA=;
 b=FTUIPzrg82hu4aAheZnVRmTAeEO7ThsHX3ZdJ7pvVtEHQxEg0+eXvzMn/afYOJAY6Z6MnB4rnyl8dwlfajxoGtkztyDHLJhIuWXuby4myXwJ2EqjStihkaOdrnaQjzNdnrZ2F8UNTtJDmhws3FKIVJgeE+YRJvIVy/U+Q9zy3tHjvI7z47eWSIKlc0VpW8KN8UsX+6szEbg1CDfdUPycoqYULZOAA+US/3rz45+hDZ6BF+/tGlbmYIZV7Os/2Ytvg7l8rje3gBrXsxzCe8mKyhOjqm2Wn1VXvrX8/j8XTC+zfr1ABfGixZ3TetpTcPM0lKAYzYMYJMQrQGKATceXLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA1PR12MB8093.namprd12.prod.outlook.com (2603:10b6:806:335::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 03:59:54 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 03:59:54 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kobak@nvidia.com,
	kaihengf@nvidia.com,
	fenghuay@nvidia.com,
	ltrager@nvidia.com,
	Richard Cheng <icheng@nvidia.com>,
	Chen Yu <yu.c.chen@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 1/3] selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
Date: Wed, 22 Jul 2026 11:59:41 +0800
Message-ID: <20260722035943.32337-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722035943.32337-1-icheng@nvidia.com>
References: <20260722035943.32337-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0057.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::16) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA1PR12MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f74956c-3210-45e4-3c95-08dee7a5b031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZN7mHuBzu/Al8Fkt6GtlFV5ZsDue3wjeqsUpNHiTnAMJNc31WZ3bQAUap83CZmfcvWArM8Ix1oa3NCbSWvilKZVZGD1uKm7jkbmHGnT359jYDvykGvQp/3pz05YM6o8RjnmlmEBvp5HkwjipFhnH/RBm7KMkhUhq7hFexghl83Cez3Y/VqMPfs2bLIj9TYHrphCScukG9EEabqMCnEsF36ehRtY9o4PPo5pV/WHARoO0nPcaGZPD+DNxrl95xTh+JXap0nXK0xnc0yXK//HCZZq0dWE5OAE15ldg8hfvlAL6mW4wfa6mOjUluPwYapJFSW223/PImtWwwAzTVTpu/u5D5hs/p+r1KtkOY/Vkhsfm7dn9JTRHYbE9xeJAKd10ERrgCH/dGk/nqPDFcjt9KEnjN+dt5mKPu6saERhhq9VToQ1HyCBZiHmzREq87APqK9mbWBq0fA8tNQVH93Fk0QT5zD4DdCEiXiluy3rZ/55zg1qtCsqlV+lVpyZgq8nt4gX1fjJFAE/O9qreDkxW7hP/+tSyUjCwj3O9lZsw1v4oA3sP9j/hEA1d15FvIeGNn2rMHY6Z7AKXh7TjjalF7Y6ZVFZ61AYnbtcyINEloIP2u+6c8CM7dEXJMCLGiv/fazQwBLbwe1i/aWbo0DAs38ilg2AXb6KoH1ETxI2gxVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1h1UTFjS2hWVmdkalFDcjNVTXpGeGN3RWY0VCt6bENCWE8vSmdMRWZJbUxG?=
 =?utf-8?B?UHIzcEcwUlNkV3liS3JZR2ZIa1pueDFGRzRqazBoYW5GMkY3K3VQbHU1cGZX?=
 =?utf-8?B?aGJGOWpBZEZOQ3lRczhQZnlKM1BDZWpkTVl3ZFdUMXRwckE2ZVEzMUVEZHcr?=
 =?utf-8?B?TVE2aXV5VlpQWHBPbEV4QUtLc3BFUFo1ck5CZytwTitJWlY4Nm9TaUk4SlQ4?=
 =?utf-8?B?M1RuN2t1UlVMdFlEYWhDNGNZOTlha2xFMVljVzdkazVjK2EzZE5pRi9jQTZ6?=
 =?utf-8?B?b1VHNjZvWTBRT09QK2czU3NqV3pOckRnYkdFOVVTbFlqcUVNM1hnRENsQ3JU?=
 =?utf-8?B?SEFLKzFHNUg1QVkvK2Q1RDBSRkgwNDk5YmFneDZaeE1JWUxVbGpqWDBoWVpm?=
 =?utf-8?B?U3Y4WUVEZjY2U3RQRGRMdTFIYWxVNmYreXIyZ3pGb2Nmd2c0aVMxOW85cElw?=
 =?utf-8?B?SS82NDNvTFFFN05Fc0MxL2xmK09URU93WDg2dHhNZllhOW5zUVhOQXVFL1Bm?=
 =?utf-8?B?cS80TmVuVXhkNWFhOHFNclNLeGk2VHZGUHBjVW12cHg1YXErRkN5MDlRZzRk?=
 =?utf-8?B?NnVDQmNQcWF4NDlQMmwxN2Z5SXdwU210akpnQU12em5yZ21CNGMyZnlmMWY4?=
 =?utf-8?B?R2l5WElNMmpNQStDYXJBMW9yRzVaREVCRENXZHRyVXRwaFlUczVvWXB0L1lk?=
 =?utf-8?B?bzhxTWI3UG4zUUtuMFYwS3dYVjk0c2lVVDhnUW1ObHdsZjlhNVN0UzdrS0Zn?=
 =?utf-8?B?SnVrUVpUd1h1MHFuZDljK05MeUU4OGRmb3U0MlJJVDZNUHdLREN1dVB0enEz?=
 =?utf-8?B?dGc0YW1FY3NtNm5GajFzdlc4ZGtta3BDblZsTlRQZHNreUtxcGltdmtqdkNR?=
 =?utf-8?B?c0RpWUpUU3EreGNJSmdWR1Vod3MzSk41TXVxY1c4a2gzWVJuZ0c4YmY1dHVZ?=
 =?utf-8?B?ektVVGQ0VzllN1VORWxMZXhtRkljSUZUcVZ3a0syK2N5V0tBcndtdnRkLzdN?=
 =?utf-8?B?QjBnSkVPeW1hSU1yUzM4SU85S0FuTXZvNW44cjVvc2tiMEZnUzNEYWZCNW1x?=
 =?utf-8?B?Tm5kV25aQXhPOFVtZWNaeWNUVE9mUUJmWFNnTmlrS0VuaElqWm9oT3FTbkdt?=
 =?utf-8?B?ekZDanloc0N4Zy9ld3J5Y0pLYktsOUlMeU9FODJ3V2pja3UzTEJ3UVV4TFg0?=
 =?utf-8?B?anFUY3RzZktyU0h6T1BXa2ZpbHBwQlEwdFJCaUZ3SVAwSGVBWFNxU2x2cTVE?=
 =?utf-8?B?WTFTNHdHMGFTQjRPekIvWFliOERuK0Q2cHUrekg0NHo3aGxweTVGTE9FZWhD?=
 =?utf-8?B?anB3UjQzUTVNT0dKZ0JsemQxb0NRd1VqU1lpbzZmaWhaa2sxVjRpdDZBV1lQ?=
 =?utf-8?B?OVVEYkU2NmRGTkVHWW5vS1AxWXJsN282aCs1L1N0TVVuWGtKZE1FR2x3Z00x?=
 =?utf-8?B?TG1mME1rSFkxVUVya0NCTVpuT3FMWHZWOHFXY3RCSERMbE1wWGk0bFUyUFkv?=
 =?utf-8?B?VUgyR0FQMmlBTmQwYTY2dzBmTVBqWlBFYjNJWno3V1pDemxFZThaVW82N2NO?=
 =?utf-8?B?K0F6a21KcXZab1dvMGcvamZKUWlleTJ5M0E0ZVVTcTBsSzZhYWxQeGRpYkZ0?=
 =?utf-8?B?eVMzR0Zyb1NObjk3alNxeG9xZEVCdXNCQ0J0aDBIVm5ObFdFWndDUW96NG5r?=
 =?utf-8?B?L0VZMUc4aXRDQkZDbGh3bE1SRXV4TmxMMEZyZmlJOVVkcEcwdTdKS0dPaWhj?=
 =?utf-8?B?dDFHR0pRL3FXbHFUZXRuSmwzOWhXenMyWHd6eGxjUXV5YnZ6aXNiYTVkTTgx?=
 =?utf-8?B?S2lLNFk2OGJEZlZRTmphZXkxbVIyZHN5ZUhJeVNxTzViVlNjSWFPK0dOdFlM?=
 =?utf-8?B?Tjk0Z29JUVVJZjZLZWZyMlJzQ2cxVjE0a0g5QXNYWU8wbWlMS3hXanVEMllz?=
 =?utf-8?B?ZFBnZHJxRmxVdVF2WVdnNHMwQXVaQ29XWE9HUzFNTmFacEVkaVFUcmU0emtZ?=
 =?utf-8?B?N3lrMmhoTFBHMXUxRWRTZE0vYXRIaXRtQWZEQWY1ZHJzMTFlQU5EZVlKMHVo?=
 =?utf-8?B?K3hVaXV3enVabi82UTB4WjNWSTZqaW81TUlsZHR6RGFCaWdzMjVkSVJJOWpS?=
 =?utf-8?B?TmpNa3diK21VMDJJdTRDM0Mxb05pSnBFemZoOUhnZUxGb1d5TkVqUVBHdHUx?=
 =?utf-8?B?ME9ZUlRzaFNtRlZmNGNTOFp2Sjc1SzhtSlBJT2ROK2pucWdMaWJWUjVlV25o?=
 =?utf-8?B?c2RrNE9LMTVCUGR2T2lpeGtZbExEeGtmZGZmZVJBSTI3dVZ0SzJla2VxalBN?=
 =?utf-8?B?amJKWklscVNURFhoMjJ2ai9BMTE2MGJYNFdVRDZBS3NxcFdKZ2c5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f74956c-3210-45e4-3c95-08dee7a5b031
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 03:59:54.7827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+G+zw4NOJmDoXoaCNm9fv4hDhuzigYU2kTCfK+mV9pLlJo81o3QfUUCkNWhE2IB8LuYDjBLhxW0fEORRWD1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8093

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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 371a2f26dc47..692860c7ce59 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -357,11 +357,32 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
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

