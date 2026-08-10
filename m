Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9B35B634;
	Mon, 10 Aug 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355512; cv=fail; b=P2yn9WhCMuLt+YHsBEbcy9+/BDSu9ZgU5OkSSNVSFUQ/VM5pPh/xT4PgtazJBpOMeV7LvVHJ1o2sqGG9fwsr01cv/+i7puXD3aPizsmCR3EN355F4s7e9q9EHV/g5TBT6H4Ml2ONUBTwg6+YViPgK8SEVj/kvlB/zKwLotYSq0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355512; c=relaxed/simple;
	bh=vzdWAMRjzhT5jOKCz2XGS03ZNis4SQ8JULcZ6hOxIwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFT2/l4YYW6be+wTJV3vzfLa2EGn8FluOYudwtBozuQaLTUXv6OR00uhhQXPbdnspYoOevliOwjmS6QNl7K6ngmE3xUKWQZd067xhi5cfC+wlpEVCzW8X/Ava14D/4wqmwEwZHVQP/JmIXWEml+VxcH12DghRfsVttNz5xYTxb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ogvao+x7; arc=fail smtp.client-ip=52.101.57.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ogvao+x7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhfe90yaj+foFZ/r0ohoMWyKt9KaU5MWm5QEaUuz2jd+VIv7GthqgCvRVJkoWCkg9UP/Q4NOYjpO37wKWjMr8JUnHXUrCHMPMsj5hWYcs9Dbi1yJ3AsgJwWU+AHDFBfbeiWi6WIWrGGDZ+jNDA1FqqCLhF/nXPT0oEaPkZX0z291A32phxVFt8gPgFTWQCmiDfHgwLZYdNLI7Euk0mnLZ0WkqwUenei96eVePaKUsgTjYjjJiPA+Q0ajpqNsfBMGEQnt3iwG2is655b4CvMAhkr59zsUXVulXStsnisxERBcvgAkM5eI1PbLlLP0VRy8OXqhkEyLAb9nZ1ZERZlrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFdGQSj6EY2Tbp7GUsbbw7lcjbzmbP1Bt4+RL0di7Vk=;
 b=Njx79+pZttYAfV+pYowaAfHrPU3qAwA/8H900XmwDzVdHYoML7G8mo0kOghTBIpnVnyEaE7egvdkQW6bVtAfHRdz7VQdGd2wh5TqI5Q3J8Ys4qqMidcUgjh5QRmSmPQQJEDhC2eN8nhsivcOarapD4dJ3zqEYD0UkaAPUMc/fXQqKnm3B5bivuLbxuZBkZGm9CoqbpMs567+XONcgbUSSxGTLQpNsZw27MbcpPFh4ygt1K9DGNU6rx9cZ8Rzu40R5Ha8tPxrM6Itnz+S0pBeYEEvLoEDQyF5xUQH8mw84sOth561gRbaqIWFm+JajgMA7kD+OTyXUGkSB0bXSby4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFdGQSj6EY2Tbp7GUsbbw7lcjbzmbP1Bt4+RL0di7Vk=;
 b=Ogvao+x7dDrlChdYhsmB7n4bf4ba51IGlOFPLJuwsk6FrvZ/AUMmeGzDMfQ+oJaGAb92P0c+qLzPXahQW0xg4Vbcq9yW/1jOIXYpHSamXQm+gAdFmnaOqoEOXcnqAgKQ6n3Qtsk2BArH4T4EnTfUPlhWUHv3fh5bABkrVaoM4ghwEkLVaBbXswiaiLnpONOHtqhgz7ysZqoFU/5KooeQC0LhKHibJqgvv4zQUqOzkQMH1oPr0Rkj9BqNGA0fBF5wmRd2FlbkezY7bdjIAEFu5z2I29BKcDQ62VZ8eZWl3+il6dLhYk1FA5VSQ9VH/TxkyH8Ww+N+NeS+wZa0HVkrqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:51:45 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 09:51:44 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.co,
	shuah@kernel.org,
	reinette.chatre@intel.com
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
Subject: [PATCH v2 1/2] selftests/resctrl: Add L3_CBM_VALIDATE to check CBM writes
Date: Mon, 10 Aug 2026 17:51:22 +0800
Message-ID: <20260810095124.32244-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810095124.32244-1-icheng@nvidia.com>
References: <20260810095124.32244-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a32dab-2275-4580-ae90-08def6c4fc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|6133799003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1IK4Lw97ZtxtgxNlvVzUPlyX6NDcLhjI5wv4QKhsvVox4EFMQPHoGOb22QjYBeUKq/xb9snf3jMVyuRUL3ViPVYtRdEDAuQOxmakgJpj0G1TZfd1daZE0Iqaw2dFhIows6p5+KFCT3qYXzvkBbH9BNfmwRLMBwlAguQ7d1ZZtFJq0SroRgVl0V76Mw7FHrDXX2E5jbFJ6KmCLPPsLGm9HiOHqH0XY8yFvDlC1KtamonY91sMI87jQWBwBafGAGS+DWdctwCCXulWieDjImFqEA0lMvvhjb3KGKU2BEU0eSzv14QuOD8mGrCm/wEebEQrRgOn8v+RMS5vWklm8lzKJP9BsLTT/ACEIzstjwKMMppbizJCrqV+zKGaYv9hLoqFJ9JRRvhNVrgZtj4fjMSaX6myEoWvdiLeH2lozEZN5AnpPVCU7QgDckJt9oCr8XXE25KIqcHR8j1WOJpnoI53q0/TVg9SOa+wNXA9YkvfOTaRY9O858D/u3Pv7dmUwrRQkrDiYXy+2rICOhuHHp6+GGiKdukOFVRM+ioNZPmQl60gd65jn41BgTgSSS2Fj7yrKCaCPWO18XIifWZAuncTL2N1qblsm4HpUYgbUQfnm3Ed2vYuqzxlg/E9woz9XffH36rLoWsi0psiDchwS9xNbAtgs2KMnaSRwfEu5+MRG50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(6133799003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fJtXnYqHst/A/LT4xm7sbx/92D7pP8xOw6u5hYBTVyUCil+noKNzF7I5NUSL?=
 =?us-ascii?Q?1XP4mqgZgEc0TLQpSLxxaztbfyZj1cgfzYODuVbDGXtwyeeShmLa/986nwOl?=
 =?us-ascii?Q?/cCXGCeg15fFtyeax++5wqnhe2MnztMIR+hpalBkx8B2P7JZd7bD/mTtUawS?=
 =?us-ascii?Q?dy2YyI5d1uJSB9TOm70Bno6yZeQ2FeH8J6qF6i9iQLSZSZTxGBhGIp/CsZFZ?=
 =?us-ascii?Q?M+lyItKegSFpvwzcReq5N/gghzwn8qOp2w41VpY6v0+WLz1mQZ6IObGqmfXp?=
 =?us-ascii?Q?62ktWgmFqEGJ/WRuYcRWk4r8AqjQUycz7fbqdaiMpJcCeEItw+YVG6cuvdcm?=
 =?us-ascii?Q?H8/+qrhLl9NTNqSeFDTB16o0TQXuFh/snBozlCNXBvsVl3DlWDz2qw4bQaxK?=
 =?us-ascii?Q?rKepJp5LRwqx6EBKAXe1iVLayHHJ7fTMHIhK0Wkc5uby34tVKBPfcd6XjATN?=
 =?us-ascii?Q?XEcvENIoR+MHq1D1lCH9Dr4Ovzf64nT0Gxm2epuVP0eQag0raOJ5faRb9T9f?=
 =?us-ascii?Q?rle7c2sYoZ8FMbg46IZLAHabOyFDo1ajYwnlfmmGS0ZPKUKG/VvLlmNEkO6V?=
 =?us-ascii?Q?DmernzhUiQT3NLlAN+5GXZBqrUsq48pf7xB78JqK53iCgic9k52yroYsIjv4?=
 =?us-ascii?Q?5YI02q/zV/nlUfEqV9hOVc4xURWy4oRxzAflZkke4fE9Tx89FjIXDHkVciKn?=
 =?us-ascii?Q?ksS6SRGJk587Lz4SFFzwhaoWVOaa8LeqKSstfILdnnPwnN+h1t+riOyUelYy?=
 =?us-ascii?Q?4nUWEGWKUldKrl7KyYlLOwRWe8RTl/qIjaxQ9qsZ7nHMuDD+lH3JShGNZ2an?=
 =?us-ascii?Q?wqPTZ9DlJYv4ZAxp9DxYq9fB6KRz7SflkzHkiouhc/siEE4kugwm+nUo2nXa?=
 =?us-ascii?Q?3dTi4w5Oj5iP1aQHdcV9YfPvX2udq0RzFZhFmvHpH+sj2nhfeqao3UwLB4xX?=
 =?us-ascii?Q?wDWfUDYdUGbIp5C63U7Lmhs8LX7CTH2FASp+eomdyIYomJUxTN2cneHQWXzz?=
 =?us-ascii?Q?BtKojl23E/jqMO/McbSj9OykHTpQIJn8EIKV6a3SXwTbjPGMC3DbHyiR0V3k?=
 =?us-ascii?Q?Axr/WzwELqbj9BQK8R7s9nPjRRR0MfKJ0wsdJTcY5lspxTY/w8re1byoHhob?=
 =?us-ascii?Q?BzwIXaxo/vy/iNoqQEUb9OnukCgR/eTnUPMGgwsqfgtXyiGexU9yc1G6a5UD?=
 =?us-ascii?Q?Xwp9ZpQoDAAtSu+Hs8FS+deP3xYNBCJ2lP9Y3Gtw7njSSLxgbpGPzvw0up1B?=
 =?us-ascii?Q?MO4pDbykAugFFOB++3E4bRzIJUOFtcvhqwu89IsyqgaGHYauFjFA/wa9OBW3?=
 =?us-ascii?Q?7cMiMCVM8W7ziijZ8rT2+HN+bhplQODUBaKJHzalhz70wu56t/hP69f4cazF?=
 =?us-ascii?Q?GozbH+D8G/fe1VOmVrUo8p0U+cHCvzYrqcpZ2BmHJULb4hqMRR3gOzgH5cCQ?=
 =?us-ascii?Q?zIq9uSGiIFHfmMvfbiF/H3RRgzxYprdmSklXqH/kycSKD7xeK5JZXJvTGrzm?=
 =?us-ascii?Q?YmXa/60qlwefJHBJ2VMfCKWgFxF5AxOC/LDPVcKEo529GVx+/+eXoroTyNga?=
 =?us-ascii?Q?mJE2xv2fcQO3q97pvJ4LC3uMQmHRsb+V7tIxx2SjbCnUd9VmIFzbpVdkELdt?=
 =?us-ascii?Q?jH0HvCxh7Fj4I4eKRlnBjMZmPPjeGGWMvvWhCjgejqVSB+Tqj29ex432H5Wp?=
 =?us-ascii?Q?zj41x9xTK9bDtHE969hxdhOwlD7YG/ZgWsWmoQH8EyjyUiyn7rWsWGVgWSFz?=
 =?us-ascii?Q?yWL70q4UPA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a32dab-2275-4580-ae90-08def6c4fc66
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 09:51:44.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4OQjTc0IyCjxf42pMznAYJfJl3OMZVxf9cEl0KciPJUalsGaQQpBUqRW3ETUuYejyKVnepf8ENtd8rdhukYBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987

Add L3_CBM_VALIDATE to verify that resctrl enforces the L3 CBM rules
advertised by cbm_mask and min_cbm_bits.

Confirm that the full mask is accepted. Check the empty mask according
to min_cbm_bits, and confirm that out-of-range and undersized masks are
rejected.

This catches inconsistencies between the advertised capabilities and
schemata validation.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
Changelog:

v1 -> v2:
    - Rename L3_CAT_VALIDATE to L3_CBM_VALIDATE
    - Handle empty CBMs according to min_cbm_bits
    - Check count_contiguous_bits() before using its result
    - Use KSFT_FAIL and reverse-fir-tree ordering
    - Use a 64-bit out-of-range mask

Best regards,
Richard Cheng.
---
 tools/testing/selftests/resctrl/cat_test.c    | 91 +++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c |  1 +
 3 files changed, 93 insertions(+)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 371a2f26dc47..a06c57954740 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -357,6 +357,89 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
 	return resource_info_file_exists(test->resource, "sparse_masks");
 }
 
+/*
+ * L3_CBM_VALIDATE - Verify L3 CBM write validation.
+ *
+ * A full CBM must be accepted. An empty CBM is valid only when min_cbm_bits
+ * is zero. Masks with bits outside cbm_mask or fewer than min_cbm_bits must
+ * be rejected.
+ */
+static int cbm_validate_run_test(const struct resctrl_test *test,
+				 const struct user_params *uparams)
+{
+	unsigned int min_cbm_bits, contiguous_bits;
+	unsigned long long invalid_mask;
+	unsigned int count_of_bits;
+	unsigned long full_mask;
+	unsigned int start;
+	char schemata[64];
+	int ret;
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
+	/* A valid full CBM must be accepted. */
+	snprintf(schemata, sizeof(schemata), "%lx", full_mask);
+	if (write_schemata("", schemata, uparams->cpu, test->resource)) {
+		ksft_print_msg("Valid CBM 0x%lx was rejected\n", full_mask);
+		return KSFT_FAIL;
+	}
+
+	ret = write_schemata("", "0", uparams->cpu, test->resource);
+	if (min_cbm_bits && !ret) {
+		ksft_print_msg("Empty CBM was accepted, must be rejected\n");
+		return KSFT_FAIL;
+	}
+	if (!min_cbm_bits && ret) {
+		ksft_print_msg("Empty CBM was rejected, must be accepted\n");
+		return KSFT_FAIL;
+	}
+
+	/* A mask with a bit outside cbm_mask must be rejected. */
+	invalid_mask = (unsigned long long)full_mask | (1ULL << count_of_bits);
+	snprintf(schemata, sizeof(schemata), "%llx", invalid_mask);
+	if (!write_schemata("", schemata, uparams->cpu, test->resource)) {
+		ksft_print_msg("Out-of-range CBM 0x%llx was accepted, must be rejected\n",
+			       invalid_mask);
+		return KSFT_FAIL;
+	}
+
+	/*
+	 * When min_cbm_bits is greater than one, a non-empty mask with fewer
+	 * bits must be rejected.
+	 */
+	if (min_cbm_bits > 1) {
+		contiguous_bits = count_contiguous_bits(full_mask, &start);
+		if (contiguous_bits < min_cbm_bits) {
+			ksft_print_msg("Full CBM has %u contiguous bits, fewer than "
+				       "min_cbm_bits=%u\n",
+				       contiguous_bits, min_cbm_bits);
+			return KSFT_FAIL;
+		}
+
+		invalid_mask = create_bit_mask(start, min_cbm_bits - 1);
+		snprintf(schemata, sizeof(schemata), "%llx", invalid_mask);
+		if (!write_schemata("", schemata, uparams->cpu,
+				    test->resource)) {
+			ksft_print_msg("CBM 0x%llx with too few bits was accepted\n",
+				       invalid_mask);
+			return KSFT_FAIL;
+		}
+	}
+
+	ksft_print_msg("Pass: L3 CBM writes were validated correctly\n");
+
+	return 0;
+}
+
 struct resctrl_test l3_cat_test = {
 	.name = "L3_CAT",
 	.group = "CAT",
@@ -366,6 +449,14 @@ struct resctrl_test l3_cat_test = {
 	.cleanup = cat_test_cleanup,
 };
 
+struct resctrl_test l3_cbm_validate_test = {
+	.name = "L3_CBM_VALIDATE",
+	.group = "CAT",
+	.resource = "L3",
+	.feature_check = test_resource_feature_check,
+	.run_test = cbm_validate_run_test,
+};
+
 struct resctrl_test l3_noncont_cat_test = {
 	.name = "L3_NONCONT_CAT",
 	.group = "CAT",
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..a6fc688ed997 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -240,6 +240,7 @@ extern struct resctrl_test mbm_test;
 extern struct resctrl_test mba_test;
 extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
+extern struct resctrl_test l3_cbm_validate_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..57a4d0815b67 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -19,6 +19,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&mba_test,
 	&cmt_test,
 	&l3_cat_test,
+	&l3_cbm_validate_test,
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
 };
-- 
2.53.0

