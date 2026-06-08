Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013037.outbound.protection.outlook.com [40.93.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F533FE2F;
	Mon,  8 Jun 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916827; cv=fail; b=bxXbvBAcp3ip5lrP2T08Ma8U0orKwG4mrB1DR47o404vWhUi0+1wsJp9GvD8BECVSdIZvdRTJ3/DitWQwhiVra6R60AezjwwBVbLC3Lo9VcEr5DVbyPhvU5B6TAup2UT8qCjxC/IFaJZ1b9aGPiNSddg55dHBzLqB1I6V7+iQXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916827; c=relaxed/simple;
	bh=6CODls7skTyYtwVJECtv+1GuyYpFZjRKWYLxiMrCw/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l1Uep+xl1M/oEmNo27IMvzdUDIKjM8gy3ThRJ16z7E+rn6L/gp1n3+trx9TsN629fNfjXxtXFC4pVU9pwk6Cgjn4xyMl9zB7Ycis/XSxSS+BH8oTb1Y99AXSili0U7KFj1pqfesfscSEUbeZ6+sAmj2eZ/vTs4bK0AMNJ9LVZvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pJvp/q/P; arc=fail smtp.client-ip=40.93.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pJvp/q/P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3e2zfkvoVmph9p3AKp6YeDyJkbb+BlWYvD6ihTG7xZ+cGb7eejfejPuCDLJQ1N9Mstp3SFqekVsY99Chz/GM5e6m++Q5h83bPjFhoMAtBHSNVoVQ6uLJUc8H8k5S34aUc7eRlZXCgzEckQMR/q6vfZSKm3zE/DjhMiVtnci9DkaJvKWQe585P8JR8+OtUhasL1yED8DqiY/KXhmCrKf5yi0dFJH0IvYZA3awK92zpPUjEQ5AyPWsUlz1462uMMRPKTfDUf3Q8F4QfN6WM7FqGuR+l5Rx15SWGe41kgl42EzChnj6gnY7ounwgcG8ZJty6Pk24zXFP5HF6clEuJU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCMGVNJYRRNwb9CFWlZEUORpE+5qaN2L4yQ/OnW4leM=;
 b=ONjWT5AWQn2XRk4af/TxdmpdGjzJqRpflwIDKVyGLBk/ziq36ooBUekzdl5qne9z7QjHk/3CLU5iZSq12T1PDcg6rZ32N3k8R6uf2/4Cyq6uqIUFFvRKftxKA5YY3oyi+LALoRK9wC2CH0CnrKa645A7dwpJQxuHT5Auko7z+aTQQhmBxKFXuUv+k6XSNHcvsWwJp/IBEQAbVqitYwmZFSEg1nxBp0nFiTQ7fT/QUHeih8MM4X9FxUXRaHDa75+f+6YUwQXjXLWo0Op8gueOLH1dg3AEl8H3mqJ4eP6ytEBgGWuF0ygt+WvGd695Ja30pwProGdoiGx4YX0cNPHaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCMGVNJYRRNwb9CFWlZEUORpE+5qaN2L4yQ/OnW4leM=;
 b=pJvp/q/PRjEHqd4lWNp1gBC5IsxKq7vGkgcnpnXEGHgM4IrB1S6D9FI2SGl8bdIXm7d1HLY9tqL0/eD9AkpzkXS6s7FojPJIVqeZzi//TJe/HNObTx8iEBtpPXAdxXT8PKMMbFqjYSG0bnm1cFZIsldp4bAsSidHCuBbX/xpwdbUmuihOyFPw6VjyoRrVMbGXNTlsoV8iW96KgezHnV65Y+h9kfYvFRRhlRNhW5qicPiKguePeCf3BAkmRWorwLkTVGTzkT8G5R8Rcwqa95gshnalEv/HA9/ksbRwZ+0C62+ZO/VoO7WoL9ZvM3Has9bMmqEwJq6O1nWDr3rubX12g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA3PR12MB7830.namprd12.prod.outlook.com (2603:10b6:806:315::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 11:07:01 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:07:01 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.co,
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
	sdonthineni@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH 2/3] selftests/resctrl: Add L3_CAT_VALIDATE to check invalid CBMs
Date: Mon,  8 Jun 2026 19:06:40 +0800
Message-ID: <20260608110641.44457-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260608110641.44457-1-icheng@nvidia.com>
References: <20260608110641.44457-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0024.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::13) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: db4aa8ce-4c28-4f4e-057b-08dec54e1086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|3023799007|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	n8tDDmQkoMVRAqy6q0uVOHkNGl4H628yiE+dKC38QgcQOe+j7Gnpl7kb9IYfwYiLDUVK/TEfzODnsAuVrWFQ8JKavWx5x+tiZ/hLe1bZXw4y6BMeDnxAV++xBJK5yZfB1PGLLiNiXj2BQNyd2J+T/1OGXgh4bRFajU1u/7WF5udGanQDxE7TRotHY9LEUbmpY/pHVBpcRo2M6JMpiKqQ2uxiepWcYva+Xekv0lxWxm+U163xEgKN+bkkpTFNlnsPS0csM6MXlPQjty6AzutCMaw6jxIS+9+4zO81D/UqInQyvV6ZZeR0ogIuu6Ck8imFqt4kxRV5HaI9VpBdDBYZ+ZLSag5Ymi2yatWhnSCijb8r6lVZY4fuIR9M6NCpDWSJyW21DQ/EFLg9evc78Gv82F/eVXevKzZN3e/0xWzen76zvrj2telBymBbgjUlRGEd2MeUq2yWwa1ZtEd84ujtBDDvibGCj3NqYpTuThuHvfwhOkNSBcpemQWvQ18Z8vqTKJyqjz7MlQr2i3NAaR/6y3bdvzxb2gZ5tcr9EQfVbQkoGpJbHLl+L++gn9s+HYhi1A8nROwmk/HolfKbuAxPWdbYO9yvMS0z3oZjYx8qJbeNHXg3wEbKrOyeMj88q2DXXrBXVQO06l0J3tBHG5LxeOoQwXamM425mXnpQwNc/njTzWr/rJge8o1JO/MM8jLl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7oZGkzLOYrGg3nm6aPxuEIWVGrB4X5AHnwtt/Jor152MFuVQLVs4435m73bm?=
 =?us-ascii?Q?kSdtCRjuKOjJjJMksmNiyfQwdtKo+Ay3+a7DgHhpAurxpxhRhHylowsGwx0p?=
 =?us-ascii?Q?QoSNYFBouVNENJ6iPudYxWSE6uMQYNtoQIbEvWA/pzfT9GQhgTfpUDQnLdYy?=
 =?us-ascii?Q?S6eOqkOnPEnwT8HN+160RWV2BXMxxY4XzNZuvMLn73WdQP6vcZpFHEoL3HIz?=
 =?us-ascii?Q?ItKu3AOWHLQUfJ2a/LZvTk9FlJk13AQEJ9slSH1OlbWVSkoBiEaENfJp/+is?=
 =?us-ascii?Q?wkM0pXdR1ZV1Wxh2wIxEOC6N2l6bbxCdQBqRZwtulwJjibZ68tv6FqwUyNJe?=
 =?us-ascii?Q?uEOvQTjIdY50nmv+PWVys84Lk08jP+xHUycKuNz8VMsQs0nSzVfuNUtQxdz/?=
 =?us-ascii?Q?amhVBp9hh4bda8SkNrt6IwOtR6EFKbXV8x1TwA9tohS4om2fofha8OReo2dP?=
 =?us-ascii?Q?WaWuT+ZFbyKo56Ztrm32reN7yYcN2w+cwDjjZtvPpKftJLx0SUoKZAphfK41?=
 =?us-ascii?Q?T30m8XZqyZVAwg0XUeOVX8kEkL/kS+oqbNw5JHsBpnTsUXcXUdhMWnmGc7bn?=
 =?us-ascii?Q?Khlcr6Gvp8x9uWQeiEOMh/JTJVYlrq/Q89+e+jktdSfMzB5h70/+LjCWwxMp?=
 =?us-ascii?Q?wP/06x9a1GK+woqd8hSLgOSIYdl725yIlzbrILnxRlyvayhA6CVUxT38vkzz?=
 =?us-ascii?Q?r3HF8HuiqpBbzs66GtUvrlSJ1pfSZE8UaTP+HLnuZflIgkhA9zGpLjjLVnA5?=
 =?us-ascii?Q?Wivf3SUVZETHg8zv5h6gcS8Y3uS21fKGY1kONNVej5THd84rQSZeZ7dxP6W0?=
 =?us-ascii?Q?cW8kjYrmPdBgYX48f/T2rKOi53E3WPiM+SsbJMWZGV/5Yq6bzpGgeAD9faPl?=
 =?us-ascii?Q?KVxiMNDg6E81iqMd3ezN4VOSjXFE6BzlTSga+QRJE6Ty1m4VWR1TVuv+RHRj?=
 =?us-ascii?Q?BM9KIjf3MKXLB/TlyaJRsnbqCF//rr1snlloXLDFWjThwL96gxsAbOv6nEZa?=
 =?us-ascii?Q?6b6R4E15EM6rTAPiMtNWwpFccKFT3kN9cqbfgKihthXUl+MKLPjt9xc+j+/C?=
 =?us-ascii?Q?UIUroZmVjdu/reE6n7CaEZ15hgm4QjjArPMDceuSyfhlWejSLpBf60jNPvh9?=
 =?us-ascii?Q?JRyCOfMTDi/jXr5p8zuzyxDPrnVKsR5HXPpvf9vRjyxVEaTUhQutAQ5lPvVf?=
 =?us-ascii?Q?dpTk8ZytrB4TDX5ezL6j9mHg8TB44D9lPVqHBDwBVJva0eU1Cyfu8LHyZdAF?=
 =?us-ascii?Q?R5vPDOt42VUQ2VDNROkrRcXZ2Glf/Aq/DdQ2jqhdqFsi4KgDoyYLFMn2dJz6?=
 =?us-ascii?Q?t6jXSW3e9MwxQ3OR74isNcqqpzVp8csyxwPzdpt6RrrkcDjM/1SoGf0jlZ+b?=
 =?us-ascii?Q?hrwZP/OC+Yuy+xuuLZtPl0FD6nvkorpj9VTt710lK6Kr88q2B1H0cdMW46He?=
 =?us-ascii?Q?Ms9R/isY2m/PaFEjObOGjEn9aPaWiuK+7pAsQxkMI41nXR4J4Yi7QFviQZIw?=
 =?us-ascii?Q?NbJGs8qwQJT7AnFOiReMw64/5OaBsaUY12H7oUuedyi/j44FMz+Ms+l/sLAd?=
 =?us-ascii?Q?QJ/GGy+s3jZ1u4e8nhBWMSv8AKhBugQEkd3E8fLqOiGg7Oixri7Rpf45T8iD?=
 =?us-ascii?Q?tcvHwDGrRLjpBD/0GNRVG887CNB2eBveFqK1+SsP9aa9C20eE0vOQrGPWb/6?=
 =?us-ascii?Q?ZM73O3ZP4YoVPAz3UFQVNLDZDzAu/jNpuVH8r49ddr/F304zWbuN70ATB44l?=
 =?us-ascii?Q?aPUd3Y/EIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4aa8ce-4c28-4f4e-057b-08dec54e1086
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:07:01.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNOA32cPkPp2oZwdFkUm3ipPLLjVzK1OsUpHc3124/Y6rf5A0uYxFRAosmDms4JNuPq1h/Gvr2rRtTEHFhlvOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830

A CAT allocation is a CBM, and the kernel must refuse masks that can't
describe a valid allocation. Nothing in the suite check this.

Implement L3_CAT_VALIDATE, first confirm a valid full mask is accepted,
then write an empty mask and a mask with bits outside cbm_mask and
confirm each is refused. A mask below min_cbm_bits is also checked where
the platform needs more than one bit.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c    | 79 +++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c |  1 +
 3 files changed, 81 insertions(+)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 16a947f1ed16..d236988916d9 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -603,3 +603,82 @@ struct resctrl_test l3_cat_occup_test = {
 	.run_test = cat_occup_run_test,
 	.cleanup = cat_occup_test_cleanup,
 };
+
+/*
+ * L3_CAT_VALIDATE - Verify the kernel rejects invalid L3 CBM writes.
+ *
+ * CAT allocation accepts a Capacity Bit Mask (CBM). The kernel must reject
+ * masks that cannot represent a valid allocation: an empty mask, a mask with
+ * bits outside cbm_mask, or (where the platform requires it) a mask with
+ * fewer than min_cbm_bits bits. A rejected schemata write makes
+ * write_schemata() return non-zero, which is the signal this test checks.
+ */
+static int cat_validate_run_test(const struct resctrl_test *test,
+				 const struct user_params *uparams)
+{
+	unsigned long full_mask, bad_mask;
+	unsigned int min_cbm_bits, start;
+	char schemata[64];
+	int count_of_bits, ret;
+
+	ret = get_full_cbm(test->resource, &full_mask);
+	if (ret)
+		return ret;
+
+	ret = resource_info_unsigned_get(test->resource, "min_cbm_bits",
+					 &min_cbm_bits);
+	if (ret)
+		return ret;
+
+	count_of_bits = count_bits(full_mask);
+
+	/* A valid full CBM must be accepted */
+	snprintf(schemata, sizeof(schemata), "%lx", full_mask);
+	if (write_schemata("", schemata, uparams->cpu, test->resource)) {
+		ksft_print_msg("Valid CBM 0x%lx was rejected\n", full_mask);
+		return 1;
+	}
+
+	/* An empty mask must be rejected. */
+	if (!write_schemata("", "0", uparams->cpu, test->resource)) {
+		ksft_print_msg("Empty CBM was accepted, must be rejected\n");
+		return 1;
+	}
+
+	/* A mask with a bit outside cbm_mask must be rejected. */
+	bad_mask = full_mask | (1UL << count_of_bits);
+	snprintf(schemata, sizeof(schemata), "%lx", bad_mask);
+	if (!write_schemata("", schemata, uparams->cpu, test->resource)) {
+		ksft_print_msg("Out-of-range CBM 0x%lx was accepted, must be rejected\n",
+			       bad_mask);
+		return 1;
+	}
+
+	/*
+	 * A mask with fewer than min_cbm_bits bits must be rejected. When
+	 * min_cbm_bits is 1 the only sub-minimum mask is the empty mask
+	 * This case only applies when the platform requires more contiguous bits.
+	 */
+	if (min_cbm_bits > 1) {
+		count_contiguous_bits(full_mask, &start);
+		bad_mask = create_bit_mask(start, min_cbm_bits - 1);
+		snprintf(schemata, sizeof(schemata), "%lx", bad_mask);
+		if (!write_schemata("", schemata, uparams->cpu, test->resource)) {
+			ksft_print_msg("CBM 0x%lx with too few bits was accepted\n",
+				       bad_mask);
+			return 1;
+		}
+	}
+
+	ksft_print_msg("Pass: CAT rejects invalid CBM writes\n");
+
+	return 0;
+}
+
+struct resctrl_test l3_cat_validate_test = {
+	.name = "L3_CAT_VALIDATE",
+	.group = "CAT",
+	.resource = "L3",
+	.feature_check = test_resource_feature_check,
+	.run_test = cat_validate_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index ce3abf0bdac2..e2e3cf7833bc 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -248,6 +248,7 @@ extern struct resctrl_test mba_test;
 extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_cat_occup_test;
+extern struct resctrl_test l3_cat_validate_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 324a60818aa1..66739e96f33c 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -20,6 +20,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&cmt_test,
 	&l3_cat_test,
 	&l3_cat_occup_test,
+	&l3_cat_validate_test,
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
 };
-- 
2.43.0

