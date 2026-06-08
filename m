Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1027FB0E;
	Mon,  8 Jun 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916821; cv=fail; b=nO9CnfkioqIY7wIwghNd2/EG3aMeRxfWGP0WgaAviCsnkA9uBnFu0sAqGC+Y5eEntp/Y2fCCI4qmkxOTWrxQrNB/XQ3U2eDunAX37cznNzh2pemrSS9PDP6vuRJnoRt8TicAK7iGTPSozKgjYnn0LjR5t/MvI76H48ZvNIgjtS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916821; c=relaxed/simple;
	bh=GwNe6ZqhTDBzAh0EGqGvkl5Zsfpqac+ZitvXsy80P1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BY3Ft4fbd3Jh5BRleFIU/roo1RTrTj/JncTjwNlS49G+v8Mi61IF5xPpKWUoOrc3Ep4DI3QB7FzEsaBYoioLH8nqqLwCrpN1fCo7bd3wGhHSUzgTxIcBEKygPmejEf2vZ6vQDldCZm6t7e/nyx5sIIGTTwY0nhXlBUU0y2k+gEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mtsg2zQS; arc=fail smtp.client-ip=52.101.61.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mtsg2zQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lysWF1FSiOmy25Kn2BYNIIJh3/tgzFj2b2h9B7YKHVy2U7MKDmNLpSsKCyxbMwb7IVWaMZl+mgwzDTBeQ3sSqUI/rbYNFRDIpVysISIppTizJL5o7C8pzbYe8NctNkfLrxP0+rGhkdDDd7h/SsxlOLkTdH0GMF0JcwOCio3qOPpOSzDDcWpV2Dcd6GLkXpawKwZfsliai8wteiqvyRR2Y0Jdb1qjO3cTEAOfVRWDxOwVktmygDgvC2QenyrWZtu1REKE0fixHUs5dQHbIuO6N7TNaP+fn5A1zn297OhqkZQdbnbwISC9nk2KJfGgVlfWj9A906AL0wEz/41IFFCe4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTpaid+0NW+9I4G81RP1v1MFG2ncjM4z/UonW1QP6Rg=;
 b=mOPhYWzCDXGiFTzRutAtalg5UJH+g4nZOZg2zoKlRaRnO065MWxU4gfjjTBPt3BI5ddnJPYh7z3AlrqBQRuChKLXgiZ+jgja099EiQ2qWlIgrLxtL38fXb/v/EE1SH+3++OlHcvbSv+ZXLAhSVgzFs4jsLOgCQRraAi49FR7Jzdxp64SWTm5sIyApqQXDSIQL5uRfUjLJ0+8iyXJlNAU1kPFhNADaUiXoaXroPWPfHJNusFtqkNgNn+esme2xD8sA9IHo9qzgf9tpVLGx28RSeWhS+z7uzLt9lilHRL7NdyAGSRqPkw4Ym3fFCmgFUSYl2kuYHrIJziDN7DrzDtCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTpaid+0NW+9I4G81RP1v1MFG2ncjM4z/UonW1QP6Rg=;
 b=mtsg2zQS5mpa2/78YIY2Y/XxGcG7Bd6N1zM8JW/o4q16DoURcGcF4wO17aJQoKf1f8X5Px0dFO0ctfpO4UKYlQwOdYwKrLijkZWQ9tAc8dhTJjOcidEvCXX1GUtvNkxNwE06yJnZP2ClPZBy8xwp2kK3zf5oW3B6xa5bggb6Wcwvil2vJ9w0QLBvDB3jdAfijnDx+mPifcRU9Ll/5VxHUxO+GjpYeEdEeC3Y6Et+hXawGsrUHmc+cv/cHncKHplnylNfrhjK92Gp1q5lWBvQq+gWZifiX/oZL7krQXKpQ3KC5j3MiY5iXAYE7Ij+hJqQVLQn587Ltefg9bUiK3ojSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA3PR12MB7830.namprd12.prod.outlook.com (2603:10b6:806:315::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 11:06:53 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:06:53 +0000
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
Subject: [PATCH 1/3] selftests/resctrl: Add L3_CAT_OCCUP test to verify CAT bounds occupancy
Date: Mon,  8 Jun 2026 19:06:39 +0800
Message-ID: <20260608110641.44457-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260608110641.44457-1-icheng@nvidia.com>
References: <20260608110641.44457-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0023.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::7)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: d7fa8cc7-9797-4f32-0c36-08dec54e0bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	z/mc6enme393XnCNeSVGBiiQiG4XSlDbmV27clyr0tYkeY6Hvztueib7U6r3Xb9QMiDVknG7ObMgpHgmsTuio5ShYwzEBPs5eiuUOBfgnucdVIwvhJ8/UZch9F0RVeZj7Kcl2UN94CnTfEy/466T+jvN8fxaUCgXHnW+lvGaoYHHSam92XYlmnm++5EyfXcx8nwNFXEujary//+DfbrAz9jgiIRNUtz3urvP7BDT4HIdWEHev0mvRBMgaqlBf1PtFrEaUCuaAf3BcbiyWIa54HyLIlqvDzIlV292vqoyRV6EBkPme4tQzQC5DcH6O+ctEscDogEOpk57kutuVRip5j3FORL3i9YydCgqbzgBubqCjeoYHGYk9XrRD4stHdxnI4wPQh6eDhm/p6aJUGd0r3hKekxsLA1PQCUKhycQimJSu/bzhlDTzlk2JjNybXmvKxfTMHqym/49P1g5JkL7LK7JO3L3JTT4p0aPx/H/yoMth2zFBXxSC7DDP1OVhbMYFIf37cMc/zRNWCG5P345oBcZrVQ24ZzFsK0hW75I8d7Mi6cyRoHZJduWzP+gO0VEFtf0zhnnALyW3k5mdZMrjyGF1HckzGnOyEXhZYTCGAU8ZT1LpKuBsbxFqTFO96jVqfxKE9M6uVnlRCH5nl+/swU69oQ4yPF8NU2HLfCFvWsYldxWNmaZlgvl3tGACuB/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GnN2M5EKC3LbPBbMAtqv9nUjerg5GN9o8PhleJYS4YaLfPS0vpF7RJ/S8aPD?=
 =?us-ascii?Q?wBzd7FLZHb9WTrAYvCwpDn2AOleKL78tep/ABW3zj2LnrEaThCW7sQloFXhB?=
 =?us-ascii?Q?DxkGanPZUJlELcuXW/P6A6aHzu+lnit9c4nKiNrFJA/Yevcewy1WhmEww8/j?=
 =?us-ascii?Q?HIFk+vtH5hsCNC/YZ4wr465MwWKW0PhHMBe9fNimHt98C+uffsfbtHXgvd6l?=
 =?us-ascii?Q?oyPtrUmzNDsXotmH9fwhyUaEsNCRAQ2K9u3DoQnkTgu7rGPk6njpWN+eP4Vv?=
 =?us-ascii?Q?SUXrkSsaALnFO1YMQ39pbCOtrA6nyC5ER4BJiFPOYJ/74F7G6uyzD98aWrHj?=
 =?us-ascii?Q?i2Ng/Ck2lRC6zu8/awnMyyHhsaCiqitsAtPrab1EqAzQg0pqKQfFjlssNzAN?=
 =?us-ascii?Q?kvZxaJy/XN40KyQsaqTYjcCnVahBgWg7381nJUJ3yUp9RgKhkJGpxIGy/ZhN?=
 =?us-ascii?Q?pmGp6hLzCAuD1lrvfA/WaT2bH02ppEboS6ws40ZKWEVKcTFCFIUKMePZrCG5?=
 =?us-ascii?Q?sZJQkx1Ty14RPzSA9T1CyK3o+Kn+SXgym64xhm72qHFbrICHFlKQgVR6J/Cm?=
 =?us-ascii?Q?QaaXnu/qnPA/HIh2tekjcrVOZ0eW9A44DjTtkh0AfGbv5qm4Bps5+rPKWoTW?=
 =?us-ascii?Q?2WsNeT9qNOupEOOqw4VgZTmBmE/+1YCIdmBz9U3Lsh/Awv1VFQ/dwXJq0aN8?=
 =?us-ascii?Q?jI9X1zsPdV/DOSKe48yuvVX50oxzJoMqDmoQPJ2baHUqwFVYtNrZVcg7nKfO?=
 =?us-ascii?Q?jEDvz63xtFA/innvC5/ui7Kn3aPoMGxtL3aID+VIODwBQe9/GEgZeuTgqWd0?=
 =?us-ascii?Q?LcAgB6dk17vhhBNdP7Sm37YE/XVzuj5rA5AOU+FMXiIhorSenHkoJpJ81o6D?=
 =?us-ascii?Q?0JZswymX3nzIIHl7SXVdGFY8RNLYNY01xFH3bSyEMIIEqzdZcU5kXf2R54C8?=
 =?us-ascii?Q?wH6FaBhCBbsLQIIH6QWTFkyKapXNcrlqx8u/75bbTt+fbHNkAhZSlQ3xdXG6?=
 =?us-ascii?Q?vb1wgWGmbFMNzvs2YfaZj+QEXLtO01++yXz1vx4/aE+K3X90QJKIIGVrdZwl?=
 =?us-ascii?Q?a2HrMsvbxk2FqaIqZHKGCCWJhOyVJWX9E6UfyvRfq14yJylSCn1J3uBxGM7o?=
 =?us-ascii?Q?WeXfZc93NTHs3V51GtbDhs8qqj2GFt9fwyD6lYE/Qv/7oqkRV/BH1FJlLHkx?=
 =?us-ascii?Q?WQGU8nhYXU1i/IBfxRv8yUB03Oeh3DFSwwSQ3OsQ3wSvpAAfEeFnLUScNCzD?=
 =?us-ascii?Q?FiKY7a2E/0li1YRgxbu/ZUmujkbPwQYqA20ikBhvvPCByIgJpZ28LzZk9aVH?=
 =?us-ascii?Q?Ftp3aS1kGIwxzxBaS1tZUoXhiwqq4nX8QPpZku95a6lV4oPuG1o8Y9R3EDCo?=
 =?us-ascii?Q?FqOZ9JYPPZgHDC9dZ9lDqrdNXwDDqJLu7keMsYQkgg/xSuxysxD281xOdc3b?=
 =?us-ascii?Q?91Zn1yF0IoV+a8oV6+LDotyFbV6HKS8Gt9VuM0XwrFnXL5t9tgfex722P5gW?=
 =?us-ascii?Q?CrOGrxrAX/74vAeUWc1crUORtofv1oS4eOwBQ7PaEnp8eZlMuaRlxhMRp+zD?=
 =?us-ascii?Q?kqqjSKQ2WHngACrg7DCumefr39PmD1apPCB4WgQYLuFhcSTmfK8oPZvqHt4h?=
 =?us-ascii?Q?pnxXs/Fjns1UyW6K2uALNQMeyYVICPPFr2ekkxhZUczTAu9O06snMsKqs3Dt?=
 =?us-ascii?Q?05XuQPPok+/A2Gsqzdi+REUJNYTv9KAu8/PQannFq1Qb4LILOY7vMwTCuyly?=
 =?us-ascii?Q?q/WUHRc4Hg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fa8cc7-9797-4f32-0c36-08dec54e0bf3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:06:53.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uV40SKKrz87yLw3iBgT3UaN2pfkZv7QGrjn0Bpqv8+wxzkGZxKfaKL5qeEoARoJBAwW8TZiqZf/S+QqOpI6doA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830

L3_CAT needs a CPU-exclusive cache portion, so it's skipped when MPAM
reports every CBM bit as shareable, leaving L3 allocation untested. CMT
only checks occupancy accuracy, not that a CBM actually limits it.

L3_CAT_OCCUP gives a group a small CBM, run a workload spanning the
whole cache, and check every occupancy sample stays within the
allocation. An unenforced CBM would instead let occupancy grow to the
full cache.

Move CON_MON_LCC_OCCUP_PATH to resctrl.h to share it with CMT.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c    | 201 ++++++++++++++++++
 tools/testing/selftests/resctrl/cmt_test.c    |   3 -
 tools/testing/selftests/resctrl/resctrl.h     |   4 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 4 files changed, 206 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index f00b622c1460..16a947f1ed16 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -402,3 +402,204 @@ struct resctrl_test l2_noncont_cat_test = {
 	.feature_check = noncont_cat_feature_check,
 	.run_test = noncont_cat_run_test,
 };
+
+/*
+ * L3_CAT_OCCUP - Verify that a CAT allocation bounds cache occupancy.
+ *
+ * Unlike L3_CAT (which measures interference between groups and needs an
+ * exclusive cache portion), this test gives a control group a strict subset
+ * of the CBM, then runs a benchmark whose buffer spans the *whole* cache -
+ * i.e. much larger than the allocation. With CAT enforced, the group can
+ * only keep its allocated portion resident, so llc_occupancy settles near
+ * the allocation size. Without enforcement occupancy would instead climb
+ * towards the full cache. This works even when all CBM bits are shareable
+ * (where L3_CAT is skipped).
+ */
+#define CAT_OCCUP_RESULT_FILE		"result_cat_occup"
+#define CAT_OCCUP_NUM_OF_RUNS		5
+
+static int cat_occup_cpu;
+
+static int cat_occup_init(const struct resctrl_val_param *param, int domain_id)
+{
+	char schemata[64];
+
+	sprintf(llc_occup_path, CON_MON_LCC_OCCUP_PATH, RESCTRL_PATH,
+		param->ctrlgrp, domain_id);
+
+	/*
+	 * Confine the benchmark to the allocated portion *before* it starts
+	 * filling (resctrl_val() calls init() before forking the benchmark),
+	 * so occupancy reflects the restricted CBM from the first sample.
+	 */
+	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
+
+	return write_schemata(param->ctrlgrp, schemata, cat_occup_cpu, "L3");
+}
+
+static int cat_occup_setup(const struct resctrl_test *test,
+			   const struct user_params *uparams,
+			   struct resctrl_val_param *p)
+{
+	if (p->num_of_runs >= CAT_OCCUP_NUM_OF_RUNS)
+		return END_OF_TESTS;
+
+	p->num_of_runs++;
+
+	return 0;
+}
+
+static int cat_occup_measure(const struct user_params *uparams,
+			     struct resctrl_val_param *param, pid_t bm_pid)
+{
+	sleep(1);
+	return measure_llc_resctrl(param->filename, bm_pid);
+}
+
+static int cat_occup_check_results(struct resctrl_val_param *param,
+				   size_t alloc_span, size_t cache_size,
+				   int no_of_bits)
+{
+	char *token_array[8], temp[512];
+	unsigned long occu, max_occu = 0, ceiling, floor;
+	int runs = 0;
+	int fail = 0;
+	FILE *fp;
+
+	/*
+	 * Check every sample, not an average: CAT is a hard limit, so a single
+	 * sample above the allocation is a real violation that an average
+	 * could mask.
+	 */
+	ceiling = alloc_span + (cache_size - alloc_span) / 2;
+	floor = alloc_span / 2;
+
+	ksft_print_msg("Checking for pass/fail\n");
+	fp = fopen(param->filename, "r");
+	if (!fp) {
+		ksft_perror("Error in opening file");
+
+		return -1;
+	}
+
+	while (fgets(temp, sizeof(temp), fp)) {
+		char *token = strtok(temp, ":\t");
+		int fields = 0;
+
+		while (token) {
+			token_array[fields++] = token;
+			token = strtok(NULL, ":\t");
+		}
+
+		/* Field 3 is the resctrl-reported llc_occupancy value. */
+		occu = strtoul(token_array[3], NULL, 0);
+		runs++;
+
+		if (occu > max_occu)
+			max_occu = occu;
+
+		if (occu > ceiling) {
+			ksft_print_msg("Fail: run %d occupancy %lu exceeds ceiling %lu\n",
+				       runs, occu, ceiling);
+			fail = 1;
+		}
+	}
+	fclose(fp);
+
+	if (!runs) {
+		ksft_print_msg("No occupancy samples collected\n");
+		return -1;
+	}
+
+	if (max_occu < floor) {
+		ksft_print_msg("Fail: peak occupancy %lu never reached floor %lu\n",
+			       max_occu, floor);
+		fail = 1;
+	}
+
+	ksft_print_msg("%s CAT confines occupancy to the allocated %d-bit portion\n",
+		       fail ? "Fail:" : "Pass:", no_of_bits);
+	ksft_print_msg("occupancy=%lu alloc=%zu full=%zu ceiling=%lu floor=%lu\n",
+		       max_occu, alloc_span, cache_size, ceiling, floor);
+
+	return fail;
+}
+
+static void cat_occup_test_cleanup(void)
+{
+	remove(CAT_OCCUP_RESULT_FILE);
+}
+
+static int cat_occup_run_test(const struct resctrl_test *test,
+			      const struct user_params *uparams)
+{
+	struct fill_buf_param fill_buf = {};
+	unsigned long cache_total_size = 0;
+	unsigned long full_mask;
+	int count_of_bits;
+	size_t alloc_span;
+	int n, ret;
+
+	ret = get_full_cbm(test->resource, &full_mask);
+	if (ret)
+		return ret;
+
+	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
+	if (ret)
+		return ret;
+	ksft_print_msg("Cache size :%lu\n", cache_total_size);
+
+	count_of_bits = count_bits(full_mask);
+
+	/*
+	 * Allocate a strict subset of the cache so the benchmark buffer
+	 * is larger than the allocation and CAT has something to enforce.
+	 */
+	n = uparams->bits ? : count_of_bits / 2;
+	if (n < 1 || n >= count_of_bits) {
+		ksft_print_msg("Invalid number of CBM bits %d, expected 1 to %d\n",
+			       n, count_of_bits - 1);
+		return -1;
+	}
+
+	struct resctrl_val_param param = {
+		.ctrlgrp	= "c1",
+		.filename	= CAT_OCCUP_RESULT_FILE,
+		.mask		= ~(full_mask << n) & full_mask,
+		.num_of_runs	= 0,
+		.init		= cat_occup_init,
+		.setup		= cat_occup_setup,
+		.measure	= cat_occup_measure,
+	};
+
+	alloc_span = cache_portion_size(cache_total_size, param.mask, full_mask);
+
+	/* Benchmark buffer spans the full cache: larger than the allocation. */
+	fill_buf.buf_size = cache_total_size;
+	fill_buf.memflush = uparams->fill_buf ? uparams->fill_buf->memflush : true;
+	param.fill_buf = &fill_buf;
+	cat_occup_cpu = uparams->cpu;
+
+	remove(param.filename);
+
+	ret = resctrl_val(test, uparams, &param);
+	if (ret)
+		return ret;
+
+	return cat_occup_check_results(&param, alloc_span, cache_total_size, n);
+}
+
+static bool cat_occup_feature_check(const struct resctrl_test *test)
+{
+	return test_resource_feature_check(test) &&
+	       resctrl_mon_feature_exists("L3_MON", "llc_occupancy");
+}
+
+struct resctrl_test l3_cat_occup_test = {
+	.name = "L3_CAT_OCCUP",
+	.group = "CAT",
+	.resource = "L3",
+	.feature_check = cat_occup_feature_check,
+	.run_test = cat_occup_run_test,
+	.cleanup = cat_occup_test_cleanup,
+};
diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
index d09e693dc739..ef51daa8061a 100644
--- a/tools/testing/selftests/resctrl/cmt_test.c
+++ b/tools/testing/selftests/resctrl/cmt_test.c
@@ -16,9 +16,6 @@
 #define MAX_DIFF		2000000
 #define MAX_DIFF_PERCENT	15
 
-#define CON_MON_LCC_OCCUP_PATH		\
-	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
-
 static int cmt_init(const struct resctrl_val_param *param, int domain_id)
 {
 	sprintf(llc_occup_path, CON_MON_LCC_OCCUP_PATH, RESCTRL_PATH,
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index afe635b6e48d..ce3abf0bdac2 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -31,6 +31,9 @@
 #define PHYS_ID_PATH		"/sys/devices/system/cpu/cpu"
 #define INFO_PATH		"/sys/fs/resctrl/info"
 
+#define CON_MON_LCC_OCCUP_PATH		\
+	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
+
 /*
  * CPU vendor IDs
  *
@@ -244,6 +247,7 @@ extern struct resctrl_test mbm_test;
 extern struct resctrl_test mba_test;
 extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
+extern struct resctrl_test l3_cat_occup_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..324a60818aa1 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -19,6 +19,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&mba_test,
 	&cmt_test,
 	&l3_cat_test,
+	&l3_cat_occup_test,
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
 };
-- 
2.43.0

