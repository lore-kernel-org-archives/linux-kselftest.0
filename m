Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473CB3803DF;
	Wed, 22 Jul 2026 02:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686284; cv=fail; b=i/P3tdxn+1YUrexoorwAPgiZ+MtzY0/RSzy0iZq1YjYjBklg+WWFwPEzdMPNS/mPhs+u654xqN+FRJ1JMKUaPB7ySALQMVo5R2Ki5zCEHdv8Sw5LIaqNNIY0MNx+gGHexTXan1fX6Fe53BvXafagOMu4pVAixG0XCOvV7ct8dgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686284; c=relaxed/simple;
	bh=PVmjkhDy7t/mP0CBxEJIpc0vOONwSiXjTqFUv0LswhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bJfVl50HsmmHupViPqYLc+IL5cmaL4E04cRK/JFM1VRG+3jm8yA28trBakhD0DgoER6Vvak8+Yz9lSbgEi1HCgr2x3GIuEMXLlYNDxR0orFq+YOg3FG8fIipmU/+IgeBkVfcqlKVM/XfVra4BSbNVRRoTxbHFuSE/0KmUUCLXD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NvvYx6fK; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NvvYx6fK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5JAatd1/ixCRDd39Pw3JjSX3BJJtzN1WR5CtDHQujsy2u4k7bEmbFjnH7SkuTGMRm+/6EkZdDZSYLE93nV+Mt+L/MLbDFZ311iKJkQDqRLdgXD0DAPRvlrhy4H6MUimdb37yNadmTuO3ue3bBURw5aVmQPsjIFOxqjzYy7dZ/trVgJigMSFpWGO/rFNl2gJbi/vUNl7PjDSG3739AeKMDNqjKOt/+Nrd++yv8eG8Kiv1IF+ycesFrItM04k2RlKr9W2/io45iEFBEK+2Dhn2PfGqF3d6Yu07m7V0GHMQ9nnN5u63HfRYa5BNnoGpsjiyYsQEKeSEO73O3yrfXleSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+C6R7OjklUGbR/MA/vk4YgAEs2qYDJg2gLSaLDgqko=;
 b=q3FVcff5ihrk5vV3uj941gqWJjmkICahq/sdTBKuv2CHL0WPJtbg32CADpVTHQfTNuS2AphgHoOmTi3YXs44GupIb2yyWWyLmIEk3Lh0pxtxErQcwKzHCSsRWE65h+UAN5+bz3Ip3v5YWgVtDEKHFwMdbZkBrOVplODFfTYGLgD042LCC821Cx+j7YjgoDDq91s9UiTusEW2VNf6xgdOtZmsEknxXjqrY4XuE0CdKAtAPLRCrlZ+NV7Tlu8p2ygsZvIlJB17FCXSCK7pyOikzK6JIlGVHlGhfvH4STMfhBBpL0GpsMiiUEQpOM8dl0Fot5e4vBABVfL2Zxafhx2dSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+C6R7OjklUGbR/MA/vk4YgAEs2qYDJg2gLSaLDgqko=;
 b=NvvYx6fKh003bWWrrf7iznZFkp/cHICQpRg1azBdr9EX/eqggGYt8Xwv7hlUMHdIfnsqfuOl6TWiWFl8G9rmceuQm1zrVw0StrPya/juUuCSdKLSSpN2T/zdq/qXtxUPZjFWSvPCPDGnC6AsRran+IK5oPIObdhiAqJBgz/h6dsH5maF3r8O/bABH+czckfAFDE8vqURJ/QhDMKAeH1zArye5a87dc7iOEeqMG/FAs+fe6r1oDt7QU5UvKZuHWqAR0PwUR5c3RiyFF4VDC0k0nTX20y4OduxpXHmgef/n2DJyhXAlH2hPEhlOE1BmzaWGOpdTsj3/RgbuBKE42aKQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:11:20 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:11:20 +0000
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
Subject: [PATCH 2/4] selftests/resctrl: Add MBA schemata write/read-back selftest
Date: Wed, 22 Jul 2026 10:10:55 +0800
Message-ID: <20260722021057.9370-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021057.9370-1-icheng@nvidia.com>
References: <20260722021057.9370-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b623c5-6ee4-43e4-f4d9-08dee7968508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q2NwPZcgsCFLUOb6o6dUABT8SIc2eREG8Hr7VwAlL7qoLXgaopOfWZOuufLqGXISMWSG05fVt0pOLUEviY9ZLK3VsMjfzci3SC/d9aw2f9VFEArxaH4PiF1lAKncSg31mE8iwMTgnpA/pmLOx6iGFkJ3xyM7bPLBikx28w/w3tcv2QiEFcHxHr4FzfTx92zLk74JZz4b9Lk3UkYTHw6+MHEquWuSnwZvGattOtXn6mMzliUlw9hsqBXSvHbr1va7OT6I3r3rnSu7GwFS2xdK25TQKew0cLq11cZmtDlLBPRApg2X+BqWKhtlo5c6OELcM8bmbEXfAlQb1060lRtpjZxJyr3UUqWvopPiaABrJJWtNX59Lr8PD0fBhloV/RI05B8Kd0MLifpV9gb2CugsJFsYPvOrVt+5zY88nW27BcOR/OWPMcbd6zAkm4qRoHKuHNvl9n1TnnMQM0cYUYXFEX/j6iQDtS+mNfX6NT+pBu68WzqOtXeT3w/xN74qDqeaiA8M6g39gKf+O9/hi+MSUt8VvhvVepulCmpjjYzqS3tUlljhoi3n9tbE6ckEpNsEPIJiPp+IJMJC9KaG7Egvo1uDb22wKz8QMqo0GX/7jxPRiu47mPg2OJZEVQuBVSNjHzsyBA84pks9eYsfc2Qb452MvE6/Pfu7FZyIaW+SU2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VS5C1HC3EQ3+EfbwCZ0tEhrRZqsM1e9VR/tI+XZV2/iR3K9/zW/WxTu773X4?=
 =?us-ascii?Q?mfeZsOAG6lRETGaXc/OPhAl4D54IldJ2D43NnjUssBPUX2xZE37bwfR/BzOv?=
 =?us-ascii?Q?xEghwAeQbJdttybyzG3jSXJX12cZYI8WFjS4x0G7uZhu0Q7k5qEO3WXFueth?=
 =?us-ascii?Q?hBcFB3sHbzxbvvPmdaXSiam80ZR3L4odpgHcaHNx+mcU1IqChg4Sok6sTGiT?=
 =?us-ascii?Q?CQbHAyGjvRBuq+goFpQaM80ErU2yanUrRcGtLrLfRPRyZF46WsfQa2AgfIIS?=
 =?us-ascii?Q?oDbpo1MlyCgTgBu//sNrtiLlsXGVclmQxai7i6NWd1v4SnLlS36opiMPBftZ?=
 =?us-ascii?Q?2EoWMhU1jaThG99UV7nIjjnucOSkYHyLAwKNkBEI2t+Qsi9PLS4l7lH6YZMA?=
 =?us-ascii?Q?fUevd1FAS+krPFd1bEZcAbe9FiuNfSTXGfRQ3373e0UiNBIbSdN4u5Eohgdl?=
 =?us-ascii?Q?K+0wOcN697aS+MW/9Dy685JS/A59hO04f+srbohGzkZaLzM+Y46kbg5UIR9y?=
 =?us-ascii?Q?vzc0tzaq2jY07wicFhvQpG0R162k3YtBEhvgz43qy1UoWvTzKjyRDxZEm8Kx?=
 =?us-ascii?Q?BJI02NElfcADarriofFFM1l9rh3y7XH52oMfHoakn4PDXwrlMcAE9obM1a4Y?=
 =?us-ascii?Q?MjobztOJEvtDUrITm22jaoNlniwHXdc6mCqVyCq085y0V9YbCh8t8nJFHtyC?=
 =?us-ascii?Q?POf85Gdf7nCbDUiItfnS1cP3EbP1W/bagycjQWW2vi5spA9K3XYuEkebzqul?=
 =?us-ascii?Q?w8zTSrlp2g24QlFvoLnI/7NpZK7cWPr6MynPmMNZhbzRve1AvT+DsMDqOCwS?=
 =?us-ascii?Q?o5u2sFbyUAmWGDvmPG/ypNsXxwPv7dTOfAzn2FhxsVGk3shwXwDTwve7y++Y?=
 =?us-ascii?Q?clIfajalaV7IAbNO2J/NSHillr5n2Rq08mKYYUl5NxS1aBphYXBD7pR2y4fL?=
 =?us-ascii?Q?IuQPZvdKDTawfgtLvSJsYO6WwzAR+8Sla4oxJdpQuMKP2TRzU9L+tcbJ9boc?=
 =?us-ascii?Q?V5rhQmR7ygnAmshMPUUORahCRgBO/xFTea/omSEv0iEwQADx58M/zPbjTbIs?=
 =?us-ascii?Q?JSVhLnroT9phXxUCouZSXH2EU/IT/QbCJZuBG+rKBP3OnAsndwSMA/FSwZA7?=
 =?us-ascii?Q?WNrIz51te6grBaFKYeLCZxeWELCoCXj7zP5S73OwvbOiWn6kDi56lXPudrNp?=
 =?us-ascii?Q?QxbC00g1OZZOi8BMUxkfDg3CcbKhCK3lW6QBk+sm1SRA3I6Y84F/j8zIOsuL?=
 =?us-ascii?Q?1JXKGsLqQbsI50WM9OkRk4V6VgayZ2XkZG4U86ddItVrkCmpHGvtA11w917E?=
 =?us-ascii?Q?ASWsgpaKIPnZV2wzet4/I/j/nE4Cmoge6m0CGaGnFhUkhB/OQ1bB2bhoy1xp?=
 =?us-ascii?Q?ofwUecVvjJ8nbNgrKjNeObNuWBgjsPImyUGXbLfq9xXl9nam9G8naA8uWaAJ?=
 =?us-ascii?Q?hZOo8uqrnpxn7o89d1LWU+ZhalMOH1zr1dDucfkcToUbit9w8ofxTQvgaVSy?=
 =?us-ascii?Q?gcyZfSMCzJDutquEoUNF3CV54GYi8qjFfx6o8rDiySZaPB8GSFhVxTEBG8a/?=
 =?us-ascii?Q?vtD7h1S0Zf2qQkSVPYzHLwshYIGZV23dBkc5khvW/qbnSVnoAd+hdyCH+Us5?=
 =?us-ascii?Q?plQGnxFI/ZW96CCjJOPPfavwV2pXGNVNIiMvNUofIPSt2gB3oy1+amKbyHI0?=
 =?us-ascii?Q?Qf8CDTk5MC9/NPArfP1S/ql/l4zXUVQgTrjWM21tUc4+1FAIRlvbTISM2l7G?=
 =?us-ascii?Q?Kzo9iPn5ow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b623c5-6ee4-43e4-f4d9-08dee7968508
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:11:19.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm4trL/z41GeTlCo7G4bpTm36bDo0k4Bf5WMyPZl8X/ONa4k7xbxbm7ni8dKDElWy/+WG9GvZQzie2um1LND0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

Implement MBA schemata rw test, in a temporary control group,
write a few legal percentages to each MB domain, read each
back through the schemata then restore the maximum and remove the group.
Domain ids are taken from the schemata.

Add a resctrl_write_schemata() helper for the raw write.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 .../selftests/resctrl/mba_schemata_test.c     | 115 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 tools/testing/selftests/resctrl/resctrlfs.c   |  36 ++++++
 4 files changed, 154 insertions(+)

diff --git a/tools/testing/selftests/resctrl/mba_schemata_test.c b/tools/testing/selftests/resctrl/mba_schemata_test.c
index b92011e42726..ff101b814982 100644
--- a/tools/testing/selftests/resctrl/mba_schemata_test.c
+++ b/tools/testing/selftests/resctrl/mba_schemata_test.c
@@ -150,3 +150,118 @@ struct resctrl_test mba_schemata_info_test = {
 	.feature_check = mba_schemata_feature_check,
 	.run_test = mba_schemata_info_run_test,
 };
+
+/* Read back the percentage for one MB domain from a group's schemata. */
+static int mb_read_domain(const char *ctrlgrp, const char *resource, int dom,
+			  unsigned int *out)
+{
+	unsigned int pct[MB_MAX_DOMAINS];
+	int ids[MB_MAX_DOMAINS], n, i;
+	char vals[MB_SCHEMATA_LEN];
+
+	if (resctrl_get_schemata(ctrlgrp, resource, vals, sizeof(vals)))
+		return -1;
+	n = parse_mb_schemata(vals, ids, pct, MB_MAX_DOMAINS);
+	for (i = 0; i < n; i++) {
+		if (ids[i] == dom) {
+			*out = pct[i];
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+/*
+ * writing a legal percentage to a domain takes effect
+ * and reads back, and restoring the maximum works.
+ * Domain ids come from the schemata directly.
+ */
+static int mba_schemata_rw_run_test(const struct resctrl_test *test,
+				    const struct user_params *uparams)
+{
+	static const unsigned int cand[] = { 10, 50, 90 };
+	unsigned int gran, pct[MB_MAX_DOMAINS], receive = 0;
+	int ids[MB_MAX_DOMAINS], n, i, j, ret, fail = 0;
+	char vals[MB_SCHEMATA_LEN], grp_path[256], line[64];
+	const char *grp = "mba_schemata_rw";
+
+	if (resource_info_unsigned_get(test->resource, "bandwidth_gran", &gran))
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
+
+	snprintf(grp_path, sizeof(grp_path), "%s/%s", RESCTRL_PATH, grp);
+	if (mkdir(grp_path, 0755) && errno != EEXIST) {
+		ksft_print_msg("Fail: mkdir %s: %m\n", grp_path);
+		return 1;
+	}
+
+	for (i = 0; i < n; i++) {
+		for (j = 0; j < (int)ARRAY_SIZE(cand); j++) {
+			snprintf(line, sizeof(line), "%s:%d=%u",
+				 test->resource, ids[i], cand[j]);
+			ret = resctrl_write_schemata(grp, line);
+			if (ret) {
+				ksft_print_msg("Fail: write \"%s\" (ret=%d)\n", line, ret);
+				fail = 1;
+				continue;
+			}
+			if (mb_read_domain(grp, test->resource, ids[i], &receive)) {
+				ksft_print_msg("Fail: read back %s domain %d\n",
+					       test->resource, ids[i]);
+				fail = 1;
+				continue;
+			}
+			if (abs((int)receive - (int)cand[j]) > (int)gran) {
+				ksft_print_msg("Fail: %s domain %d: %u%% -> %u%% (gran %u)\n",
+					       test->resource, ids[i], cand[j], receive, gran);
+				fail = 1;
+			} else {
+				ksft_print_msg("Pass: %s domain %d %u%% -> read %u%%\n",
+					       test->resource, ids[i], cand[j], receive);
+			}
+		}
+
+		/* Restore the maximum and confirm. */
+		snprintf(line, sizeof(line), "%s:%d=%u",
+			 test->resource, ids[i], MB_PERCENT_MAX);
+		ret = resctrl_write_schemata(grp, line);
+		if (ret) {
+			ksft_print_msg("Fail: restore write \"%s\" (ret=%d)\n", line, ret);
+			fail = 1;
+		} else if (mb_read_domain(grp, test->resource, ids[i], &receive) ||
+			   receive != MB_PERCENT_MAX) {
+			ksft_print_msg("Fail: %s domain %d not restored to %u%% (received %u)\n",
+				       test->resource, ids[i], MB_PERCENT_MAX, receive);
+			fail = 1;
+		} else {
+			ksft_print_msg("Pass: %s domain %d restored to %u%%\n",
+				       test->resource, ids[i], MB_PERCENT_MAX);
+		}
+	}
+
+	rmdir(grp_path);
+
+	return fail;
+}
+
+struct resctrl_test mba_schemata_rw_test = {
+	.name = "MBA_SCHEMATA_RW",
+	.group = "MBA_SCHEMATA",
+	.resource = "MB",
+	.feature_check = mba_schemata_feature_check,
+	.run_test = mba_schemata_rw_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index a6ad25a08ae5..75d1ad5c6968 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -203,6 +203,7 @@ int get_cache_size(int cpu_no, const char *cache_type, unsigned long *cache_size
 int resource_info_unsigned_get(const char *resource, const char *filename, unsigned int *val);
 int resource_info_str_get(const char *resource, const char *filename, char *val, size_t len);
 int resctrl_get_schemata(const char *ctrlgrp, const char *resource, char *buf, size_t len);
+int resctrl_write_schemata(const char *ctrlgrp, const char *line);
 void ctrlc_handler(int signum, siginfo_t *info, void *ptr);
 int signal_handler_register(const struct resctrl_test *test);
 void signal_handler_unregister(void);
@@ -249,5 +250,6 @@ extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 extern struct resctrl_test mba_schemata_info_test;
+extern struct resctrl_test mba_schemata_rw_test;
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 5d45ac95d988..9b3ac0437bf9 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -22,6 +22,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
 	&mba_schemata_info_test,
+	&mba_schemata_rw_test,
 };
 
 static unsigned int detect_vendor(void)
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 8b428a22496d..1196418461b5 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -521,6 +521,42 @@ int resctrl_get_schemata(const char *ctrlgrp, const char *resource,
 	return ret;
 }
 
+/*
+ * resctrl_write_schemata - Write a raw schemata line to a group's schemata file
+ * @ctrlgrp:	Control group name, or "" / NULL for the default group
+ * @line:	Full schemata line without newline, e.g. "MB:0=50"
+ *
+ * Unlike write_schemata(), the caller supplies the exact
+ * "<resource>:<domain>=<value>", so this works where the domain id is not the
+ * CPU's L3 cache id (e.g. ARM MPAM, whose MB domains are NUMA proximity ids).
+ *
+ * Return: 0 on success, or -errno on failure (e.g. -EINVAL for a value the
+ * kernel rejects).
+ */
+int resctrl_write_schemata(const char *ctrlgrp, const char *line)
+{
+	char path[1024], buf[1024];
+	int fd, len, ret = 0;
+
+	if (ctrlgrp && *ctrlgrp)
+		snprintf(path, sizeof(path), "%s/%s/schemata", RESCTRL_PATH, ctrlgrp);
+	else
+		snprintf(path, sizeof(path), "%s/schemata", RESCTRL_PATH);
+
+	len = snprintf(buf, sizeof(buf), "%s\n", line);
+	if (len < 0 || (size_t)len >= sizeof(buf))
+		return -EOVERFLOW;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+	if (write(fd, buf, len) < 0)
+		ret = -errno;
+	close(fd);
+
+	return ret;
+}
+
 /*
  * create_bit_mask- Create bit mask from start, len pair
  * @start:	LSB of the mask
-- 
2.43.0

