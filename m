Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D438837A;
	Wed, 22 Jul 2026 02:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686303; cv=fail; b=rL4XFnymGKe+h0QXmg5C5gJW20LrTIHhJGgFWFHm6lwm6Czofcu8G6OgxlbyH9amj0IEeBxsNwTtZlalKaImcRTdOtXbfDAuj/Dmtjs5JYxxRVSWVvqu+3NjXd6OHTsAIWTf7OleubwS8Sw0LSS/SXDvKWpWreN14nLW9Q41o/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686303; c=relaxed/simple;
	bh=un02zgr1R/vkA7VsHRIgIv+Ucw/6O/ERlqi2pq92510=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hwTHdHW/06srPJA5Tl0F4fQo5YMmQST3o9gwMunmE/3X4C0WRiK6cxqtz114pRtgSkA8ptP/L7LiJS+PB/UEPG8n89B0jKMNqKgFhSAJMU4KO2S8pe50f+rtLPPmAOu5xHejZoPVOkkhIWny0UVOHASh/GVMAKbvPwUbMMTobEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X7Lf1fpB; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X7Lf1fpB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmlWH2d9XsXSut4B8BlvMnOO6m/PvMt2ZnpHHKx6AaPIHAJxKBZY+7ag6A6TKUyF0EQfZZ/6u+6Siv91+eb3M0bnJ85nlfH6TdHmpUZ5eP+hrISk7beKCNQSiEWAIayaFClapuQIgnmNJb0rxxQRBcPeTAjBSZ30GFNH+bn88i0POYQx6kqeQnPp8/OxPAuYORg12BBKZjeYGCc0lfOZsa9zr5rPB0cpiyspvbf6l6Jgrd1pZQQT8uZm3NzLQwjtxKvTv90exw4IkUs2EKvOKdz0tPth8pJn+Pr/9khyWs7FHhYz8wUPAW4SZPMKxShgUaOYKuBx5+yGhEFMTpyhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2D/1XotN6bRxKpLwJDygg/g4BzaPq9S8H08EeUMjnw=;
 b=BezCvYJUaZouyyZdFFBqT2vvGipS5s5w94YGiBk8vlNwSjDlAyopuPxsjGfpGNLLfVXBl1o5Ckg5tYtmeX2rCZbUEjR8/9oGUDu01TpmyL1C2lxm3nenEuGN4n3VGtnXj6woyx3OQhx7vrP1wcyA52iAPOGQL1ildn+fPpQ+nOjomGKpeLfKY8hIJolEQNU+8zU4QeriS4w2rh/4vyVwiLmUxJdUrW7KtbVMoME3ctnkQtGwHDT/+KiYMSjWHeAs4DYcoYcgP/btONv15r8BBqJzPBoVmup4KOPrpn81YU3iTt6gRQSvhcF5VGpIELszTvcgVo5s5lyD6S/uQMN4eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2D/1XotN6bRxKpLwJDygg/g4BzaPq9S8H08EeUMjnw=;
 b=X7Lf1fpBtS8/G1jN7+B57YrWxetPRSw6x49dd5Y798jim6b2ksMx5tHjx6ZOy0fGWvk9ZqQDh2DaoBX0vH0GNJESKH109uQ9BRJonHY4uxAfeqX/31iH7jFeN9n53x061li3Iui6fq4bLOLkM+sV6P/65mhKjjsjA1Jf1OEBGJ4dtvZNynA7uW4XeqFy08X2bFFloNC6ANloLcjKy4dDH3RCKKVcu7Ry+GzL1Lzl5rIvGYJDC1cqmQeRFpkLTldMTfmSz/Y7aB4s/2QQTlmw9n/mLl/iGUWvr3ymHaAj1/i7V2F29f76iHuSxSwIx5tjnpDdnUTKBT86OaEOo5FlEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:11:37 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:11:37 +0000
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
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH 4/4] selftests/resctrl: Add MBA schemata per-group isolation selftest
Date: Wed, 22 Jul 2026 10:10:57 +0800
Message-ID: <20260722021057.9370-5-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021057.9370-1-icheng@nvidia.com>
References: <20260722021057.9370-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1P15301CA0051.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::23) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5e5b6e-db7a-4f0b-2ce0-08dee7968ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ovSV8J9w2ckyZ7D6Ad6PWdPMI18xt4B+OMIEKOZKPg9x1aZtKGG+KxxJnQGDe6Kx19tLT8lLsr/dN9zc0SH2kgg3zQ9uiNeyQD8n02+BgLjwQqvKfAV3TwjCBOMQaysKwXs2U0x80L41TT/iU/Ke57uWLmjjmQxyxvTytG5U9ihTsI3f8aqQDGkSrOxYu9gojXrXMDUG8KoYjur2/QjvEvH1UxujgGyQETJ8IwF/U4YCQuIwE2ivQB3UMeF38RExq3P690zAi1eYel394ZT7H0bxDtQmcRygb/EUn4MhkDciFoEBV1PW3zbtY1UAP001bC/wbkXoYNJgmKQCZ5lYVSYJnBNfvbyV88ieUWtqXJAknQt15azHeGa/zyTNxb5RNcUIE2EE9TepbwXBrQsCvX5nwnv1Pg3xXIg4rU7z4rs0QAcgKHETTzDnCQD20sAo1GteoJlTAdWID5SsGrpsBZ+wTr/pbKjNwWVqgf2NFD8ExqbSc6ICKLDPo2TK30JQJ2YyZM0KVI6Y6wvWHb1n4rmfBjfIP9JN0PwUyF38vhzIkIF3dJWbgN/DJ+v3KmPL80v4T/v1pDhYl6wiBq9TtLkdud2v0QS8fdcdLL1UUCHDuD5xCkwS1Cu4IbF+UoIyEatqEiuLhUzu9npvSKwMT5SyvFSrjCWu+hkvGj+dKwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q2swe4Rd2oukGNxfdH7zTpEmc6dF4CMXrRK9Xsb1WLXuGzE4o8zF3mrQB0RV?=
 =?us-ascii?Q?T5rY49hBfoAvQE8LUbyNms4dGgmythC7uoDzQ3DY58AzknEi/WE/Co4UDtQQ?=
 =?us-ascii?Q?f8WSoQSgpz8ExkYHhq7ZOwLTiHHL66BqeBDBbHxEygfN+VNqVOYwqIhqAB/K?=
 =?us-ascii?Q?z5Q9BDrSEl9vO4eNvjdDWPHCU0EVXnn+iZui3d8fyEJ/WCaxnnxugXaXzJ3P?=
 =?us-ascii?Q?Wiv2kInqovcaIQJb+1Di0e/N6mBxdcB9LBBo8iPRFxebsBZxvitTqQbXBNyx?=
 =?us-ascii?Q?/MKF13ypKdH516wZd2AqpkqQUwcJWDqUud/zI/SgnJBY9xPVuHZ/UGJPbebA?=
 =?us-ascii?Q?gbsLffpYGIOSUxLYUGTUHmfOxoOBcXafwu3OEIweMN49Zp7Zb+rOzGXoDS8j?=
 =?us-ascii?Q?l6f96ngm6qxCG2Y7ETim8SAeS8fQnKqQvsLi/d0zCLIjiOu7lFVzK6WKwlS+?=
 =?us-ascii?Q?b+ZobQyZFw1mMtVy1gq6M6WftzjmsjcaefdO+LYT8kA+TK1FHgKL4gZtnz+r?=
 =?us-ascii?Q?quLkgwwxTEdSETxYjgZpnQBXnWdnqk5R/gBz/RnHBQHQD7gL2emMXygYX9CJ?=
 =?us-ascii?Q?WH/Ttby3+K8i0d/439LnKzL71yI7pIZaq36hcfMP1CTx9pykEx+kyOtkQV0p?=
 =?us-ascii?Q?5123Q9ERdoupsUxkEBxJLyp5HZhEjl2cVeV/FgFsBC76f903KdFlWygNT7OC?=
 =?us-ascii?Q?lqksIXKvs6K+HpzrGyrl13YhRV5HZSE0PHtoxWqR1A5oCK6rgBidUQ44gqXR?=
 =?us-ascii?Q?VZ3S2/4GAzc8bviR1tyOcPjEoOsh66qgPMmRZVmtzQfPdNy4Wed/nRsOSkAm?=
 =?us-ascii?Q?/XuO6Elpl+IsLkG7jcWmtan5PSxZ3kFB5b8Eg7IlfjmaYj0gJdGTivUS0aoZ?=
 =?us-ascii?Q?9My+WLTz8cySL7qVfN1Hcsl5E1zh+FFF9WPuItOD0NohGXiuuXoMQQJcptrt?=
 =?us-ascii?Q?Vg8zUWpe5Co4owyRcsTzUFlbR7kX9FVVCCh9vQ3FBZlN+f9FESjwL1a6KM0A?=
 =?us-ascii?Q?jDxEC7Nkfee5k7939UZK4XzJmBGbWGh3Hkqol3CMTS4dyUZ31/w4Ya8A/Xo/?=
 =?us-ascii?Q?3ofzOMR25SiMMsD/WNJuURYZyokV9/lAZic1SzEZ3lHHAc1rlzPUPfKt/+kO?=
 =?us-ascii?Q?BSCKYwgeasjAY88QiFn4Bfde0x05umroOCkuICzxRz7T7H7lmwyWU55TLIrj?=
 =?us-ascii?Q?zbH0mSN7xoTzvfhyUT3Xuwf0E2fAy1P3llswppdY0WNzqVOyM1raY2FYTT0O?=
 =?us-ascii?Q?fVc0udv/K/QtgUQ/pCt+WCGnn6qvvahni1mkJiGO+ln6RBnDW1UlIrQfL2Lp?=
 =?us-ascii?Q?9ThuIVlX7MIDb3JW2WiEBH4yOWYBAAPHwrZC6YKbR0osmb/m44XB6FkXI5ya?=
 =?us-ascii?Q?GsPP0boYfZ/KcOhglSMKInm6F9NkK4z0YHMllsgWNG2U2NRwANL1ZF0GsYNS?=
 =?us-ascii?Q?Jsul+CclWBA8UCa1hRSxTKaim1gF39r0O1qoumnubuBLKL8OcfDasjjvWStU?=
 =?us-ascii?Q?vNWBXS1i9uOjCgg3SMasNuRQSiVjZMPkiaKpdu6VEQ2+RfA2t1tRRtG1CoZ7?=
 =?us-ascii?Q?ykUz/OzUCYsdh8xGFy8eRsV4dFYlal5ZSGV2oSvlSqsa9mkJm0zo2rP20jTi?=
 =?us-ascii?Q?x+LN4VmsC4kKq+V5tD8LUUjZHfw+iToxH0vZMwf9dgVOXFfqM5vjygKn7FEm?=
 =?us-ascii?Q?Oc9lOfEfILtYsfu/dJH9uDfWfXvb8Kz8CcAHTD1qKrN0WeyIvCeWEGybwd+x?=
 =?us-ascii?Q?7g7mfpK5Rw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5e5b6e-db7a-4f0b-2ce0-08dee7968ecf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:11:36.9585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyBTcBe38+JBnuyCUlbhUULmDDSu0gHbQaVFeK6UTVrRes+Krv+HcuNZ/rJhzyo7B9Ft+leIU+lvkkCk/OS41w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

MB cpas are per control group, implement MBA_SCHEMATA_ISOLATE test to
verify a write to one group leaves other groups and the default group
untouched.

Create 2 groups, set the first to the max and the second to a lower cap,
then read the first after writing the second, each holds its own value.
The default group stays unchanged. The lower cap is gran-aligned and at
or above min_bandwidth, so read-back is exact and provably below the
maximum.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 .../selftests/resctrl/mba_schemata_test.c     | 131 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 3 files changed, 133 insertions(+)

diff --git a/tools/testing/selftests/resctrl/mba_schemata_test.c b/tools/testing/selftests/resctrl/mba_schemata_test.c
index 0cd257dcec91..d98946b831b1 100644
--- a/tools/testing/selftests/resctrl/mba_schemata_test.c
+++ b/tools/testing/selftests/resctrl/mba_schemata_test.c
@@ -388,3 +388,134 @@ struct resctrl_test mba_schemata_inval_test = {
 	.feature_check = mba_schemata_feature_check,
 	.run_test = mba_schemata_inval_run_test,
 };
+
+/*
+ * MB allocations are per control group: two groups hold different
+ * percentages on the same domain without disturbing each other or the
+ * default group.
+ */
+static int mba_schemata_isolate_run_test(const struct resctrl_test *test,
+					 const struct user_params *uparams)
+{
+	unsigned int gran, min_bw, low, num_closids, def_before = 0, def_after = 0;
+	unsigned int got1 = 0, got2 = 0, pct[MB_MAX_DOMAINS];
+	int ids[MB_MAX_DOMAINS], n, ret, dom, fail = 0;
+	char vals[MB_SCHEMATA_LEN], path1[256], path2[256], line[64];
+	const char *grp1 = "mba_schemata_iso1", *grp2 = "mba_schemata_iso2";
+
+	/*
+	 * Isolation works with any CLOSID count, but the
+	 * default group plus the two test groups each need to hold one.
+	 */
+	if (resource_info_unsigned_get(test->resource, "num_closids", &num_closids))
+		return 1;
+	if (num_closids < 3) {
+		ksft_print_msg("Skipping: num_closids=%u < 3, cannot create two test groups\n",
+			       num_closids);
+		return 0;
+	}
+
+	if (resource_info_unsigned_get(test->resource, "bandwidth_gran", &gran) || !gran)
+		return 1;
+	if (resource_info_unsigned_get(test->resource, "min_bandwidth", &min_bw))
+		return 1;
+
+	/* Enumerate the real MB domain ids from the default schemata. */
+	ret = resctrl_get_schemata("", test->resource, vals, sizeof(vals));
+	if (ret) {
+		ksft_print_msg("Fail: could not read %s schemata line (ret=%d)\n",
+			       test->resource, ret);
+		return 1;
+	}
+	n = parse_mb_schemata(vals, ids, pct, MB_MAX_DOMAINS);
+	if (n < 1) {
+		ksft_print_msg("Fail: could not parse %s schemata \"%s\"\n",
+			       test->resource, vals);
+		return 1;
+	}
+	dom = ids[0];
+
+	/*
+	 * grp2's cap must stay provably below grp1's 100% even after the
+	 * kernel rounds it to bandwidth_gran: align it here, at or above
+	 * min_bandwidth, and expect an exact read-back. If no aligned value
+	 * below the maximum exists, the two groups cannot be told apart.
+	 */
+	low = min_bw > 20 ? min_bw : 20;
+	low = (low + gran - 1) / gran * gran;
+	if (low >= MB_PERCENT_MAX) {
+		ksft_print_msg("Skipping: no %s cap below %u representable (min_bw=%u, gran=%u)\n",
+			       test->resource, MB_PERCENT_MAX, min_bw, gran);
+		return 0;
+	}
+
+	if (mb_read_domain("", test->resource, dom, &def_before)) {
+		ksft_print_msg("Fail: read default group %s domain %d\n",
+			       test->resource, dom);
+		return 1;
+	}
+
+	snprintf(path1, sizeof(path1), "%s/%s", RESCTRL_PATH, grp1);
+	if (mkdir(path1, 0755) && errno != EEXIST) {
+		ksft_print_msg("Fail: mkdir %s: %m\n", path1);
+		return 1;
+	}
+	snprintf(path2, sizeof(path2), "%s/%s", RESCTRL_PATH, grp2);
+	if (mkdir(path2, 0755) && errno != EEXIST) {
+		ksft_print_msg("Fail: mkdir %s: %m\n", path2);
+		rmdir(path1);
+		return 1;
+	}
+
+	/* Pin the two groups to different caps on the same domain. */
+	snprintf(line, sizeof(line), "%s:%d=%u",
+		 test->resource, dom, MB_PERCENT_MAX);
+	ret = resctrl_write_schemata(grp1, line);
+	if (ret) {
+		ksft_print_msg("Fail: write \"%s\" to %s (ret=%d)\n",
+			       line, grp1, ret);
+		fail = 1;
+	}
+	snprintf(line, sizeof(line), "%s:%d=%u", test->resource, dom, low);
+	ret = resctrl_write_schemata(grp2, line);
+	if (ret) {
+		ksft_print_msg("Fail: write \"%s\" to %s (ret=%d)\n",
+			       line, grp2, ret);
+		fail = 1;
+	}
+
+	/* Each group keeps its own cap; reading g1 after writing g2. */
+	if (mb_read_domain(grp1, test->resource, dom, &got1) ||
+	    got1 != MB_PERCENT_MAX) {
+		ksft_print_msg("Fail: %s domain %d: %u%%, expected %u%%\n",
+			       grp1, dom, got1, MB_PERCENT_MAX);
+		fail = 1;
+	}
+	if (mb_read_domain(grp2, test->resource, dom, &got2) ||
+	    got2 != low) {
+		ksft_print_msg("Fail: %s domain %d: %u%%, expected %u%%\n",
+			       grp2, dom, got2, low);
+		fail = 1;
+	}
+
+	/* The default group must be untouched by either write. */
+	if (mb_read_domain("", test->resource, dom, &def_after) ||
+	    def_after != def_before) {
+		ksft_print_msg("Fail: default group domain %d changed %u%% -> %u%%\n",
+			       dom, def_before, def_after);
+		fail = 1;
+	}
+
+	rmdir(path1);
+	rmdir(path2);
+
+	return fail;
+}
+
+struct resctrl_test mba_schemata_isolate_test = {
+	.name = "MBA_SCHEMATA_ISOLATE",
+	.group = "MBA_SCHEMATA",
+	.resource = "MB",
+	.feature_check = mba_schemata_feature_check,
+	.run_test = mba_schemata_isolate_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index c32ab5c2cc56..07a67ac9292c 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -252,5 +252,6 @@ extern struct resctrl_test l2_noncont_cat_test;
 extern struct resctrl_test mba_schemata_info_test;
 extern struct resctrl_test mba_schemata_rw_test;
 extern struct resctrl_test mba_schemata_inval_test;
+extern struct resctrl_test mba_schemata_isolate_test;
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 7a7184783e6a..583ee97bac20 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -24,6 +24,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&mba_schemata_info_test,
 	&mba_schemata_rw_test,
 	&mba_schemata_inval_test,
+	&mba_schemata_isolate_test,
 };
 
 static unsigned int detect_vendor(void)
-- 
2.43.0

