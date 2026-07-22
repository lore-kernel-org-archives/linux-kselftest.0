Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E36A386562;
	Wed, 22 Jul 2026 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686278; cv=fail; b=bAbv0mud/ne5ECmgjkD7zwJOircULqHfbDn8s877l/H/Kmf4ByNMrEPVDc4wnCujZ2OYhkTimtqyO744UbCd6ITHl6kCRMMznLijtLs67Vy6AT2IgAMR4STNYcYOP2dOiOLj8UH9cJi6zKha4MtumRwkkMhEeJ8bN/HKQsSVNUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686278; c=relaxed/simple;
	bh=i29OkurGWsNYRNbJXNmL/sCpn7mrRAnG7Ax2dCKl+G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ECy+o9QVk7PwZUwni1eLyTWGNcutGM8IOSePeh1tNHJDzf8nVR28NAuoRAABk5MYJrVSvG17BOIRF2BjZ9ihST3xVk4Nq9X0ovtpmPUlk0wnsm5yZ04apnppXoO/nF0dRTdvMyU6xMRb1cIUF2jtU/OnxRQLgqkCL3+9etrc5r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N8UHYn8h; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8UHYn8h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ccxz64L+tqPrmlJ/WPNAiotWEBSJseOOZOWyGbAR/bnhFLTwIut7KJ7/43BizX5Z5M12YYhahQ2dv2IPQ/YyCz64DtZJfAlL6Iytz43hewC74y3QL3jL16BUgk5CMp0vAp69Dc+XTO/9gQZAjXMHIkLtpw6JcG2yN262Q0/cRPHZ+CyPYX4A85zVBoCnK1dCcB4BEgGEx5ZwVECTI3U6O/vouK0tIWDLSWs2b0lDLrpvehp+Ahj6VeZBm5HcXbvjFNMceat+x9zF5BxZc7lPscx/fQKHT8yKiJCQ1YiAIMdN4GCKx/OejD4nQgGnxNRpWd82ayYPgY9J6yXlPgJZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JhYm05UbULVkteQ5Ssl4FTIusgPNlwBXxldVT9SnqM=;
 b=QkVimGNwZnfFCZCphNBLfKPkFE6n3v7huZQMpFYHzqJnN6wTGwsTmMv/LbrrOwNk9SQBhOqu4sy6aXZskODkWA21kSmxKzyL3nSWOzhKt5/IfMO7V2eEup5fxS9LfU6w+swJfOLkATz1Id2KE7b1V0psQbXDEiTJPtNzZun+oDDjlA1QfemuJ+kzpHszHtOgpd/zsmiTFTTuxrBDIqfZey18InBGuE+AX5trWCO5hlVnzIJliDhrs2H7D3BCu6mJt8w/xwmE3f7voLU7N9u6DVLyKH9IaLRpx4JKMgEjqxG9PkvKQudycug5YecL7/lKYxkaVkAGcamraMzA5+XOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JhYm05UbULVkteQ5Ssl4FTIusgPNlwBXxldVT9SnqM=;
 b=N8UHYn8h8d+9PG3m9SKuX6LKQU/6+V7/t6Z7SNytWJAyV+ntV955S3KQVANF1CMA7tE+q+F1jPFSqWaooqCvSDBQlZc38bI55504FCBzWD6Pz7K5bANKypdcYHhevkaGP4NIL2I+1PF4f+G5KT2ANd5fKT3kpfqkW/xqF7IAZTuIp4p0hx4vTt7IsYqvjsLKCobsTOUxsWRlpiNDmxpx7rVGx442JrjhT2BVASKS4y8o9YsYkU9EONXTRSgtuFwAVZ1ir2xa968+96fCBSs4wnH5C4vSBGWHZQAZCrgRlOt/5gKN6vSAz9MgTf+hR2rp+R7R692vFKXh8oVeeD43Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:11:12 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:11:12 +0000
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
Subject: [PATCH 1/4] selftests/resctrl: Add MBA schemata info selftest
Date: Wed, 22 Jul 2026 10:10:54 +0800
Message-ID: <20260722021057.9370-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021057.9370-1-icheng@nvidia.com>
References: <20260722021057.9370-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0053.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::8)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8f31ac-56b7-4c9f-7b04-08dee7968066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7ehfvtodw0TA1Us6rTlN1SapxNSG6BYDwfIU+MWq8dQswKGuvFxAkiiSX+LBU0L54QK6KXUQF3pbpZLJg8mUi0q2Lmt8Pxjop+YS+3epeazDr9cZaY/RU3qyoHH5fDMeyuaC20wF9ZCzbskCErnxk1y7R027rh8ihjvVkGLsVlIOrQJ1V8XVS/7E2wRpDNT+lJDfsd3Q2CG4d77Ksz81fgG/jihebNPt2HJr2fg/+vLf6p8AqWYdw7XOYr3AdTk/Cx0jqP8+zUW7PJU9fYDHkeVuTrbsrpK/vSi+IKWynYaiwN8TWZ2QJvzi8XInoo/NfDGi8jSX4fPayld2+kZCEiDfZ8/EzFHceGMOm7Uy3LEbCEI5rO87e9Qau0bDsl6c0NN80hfflDxhH1rjV9ycMjMtQtcxXs40RZ81HyP2HuoYwlDcXrvaQrK3VD7ZJXIJPhHNXRUrso85nuWdHfelmflFcEnkDN5JpdzbuUgTQRaAQEv+wy5PyIq3Y8VXChe0calb2GeYZrOO49fE4muOdoawPM5Y+dKHUtyrMPTsy92Phn410hKpqcarywCb0R+s88qUnW2x05nSbSALuncuBERQxEYa0vzXGisT4D2bcpqOiry0ZZI+Yt/IcovzOO9AKm0EN05Wy5803PmcB5er/DnepfzEMh5Gc+2IcqUpr4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GPTZRQdNfWboLVC73mtlh5VNfmvNCsePovbeQxk8W/gWDepZdcszR+dcLFNo?=
 =?us-ascii?Q?a0CKbL9GLTHL89UrKoXSljbVfvc9x72s0+X77ReW+k2b1pvFPvpiwqs8+7d7?=
 =?us-ascii?Q?pRAOEoV3twh+thTCV5W1fDIQT0kE/CkEwpcHeS6klchWN8OmIWxmT1iMkr90?=
 =?us-ascii?Q?mpLEUYl3bcSCQCosW5AuVQulnBlnN0px618OvCtoANwjzFtBXvcsE1MPQXm1?=
 =?us-ascii?Q?N3r0BWzETMEu8mKvMHbJNyIcMDleVyhryNHU2G1zai/vFjFVRqtkkWY5oWj7?=
 =?us-ascii?Q?JIoVPZqEB4pzV1nZFLk54lZ+F/aH09wqco16ZfrU8QBXipScTG1D7I1Ksypn?=
 =?us-ascii?Q?jxZ10jY6vp2b7Abk3QNHJjsuSJfXk9zuVqup4O+YR5cngsYHIYpg7ykY41Yb?=
 =?us-ascii?Q?gUslUlZK5OSFZZs45u24ICoHgin1UusqelGI9TxrSiR4MmUl5c1N55WsQepT?=
 =?us-ascii?Q?7EsFKnvetldBs2NA2om6BRGiVZDggO1NGiOv+QSSXzM3c+9NsHDXLmoSOV09?=
 =?us-ascii?Q?JRZwVvLDYxHZIeIa2czU2aVqEUhQ0liau0Q/hbjq+Uthts6B15otTZW4lX9l?=
 =?us-ascii?Q?YVq7TXWwo5hWoBof8j4H6BbcZunWg45ZlQA6mptxAbfuXluj/kH28qkDwQ+Z?=
 =?us-ascii?Q?EO9JTHWif2vCYDSr8Nq7//1ivko9zbij6tEzIHta9MIQTVvHg5F5RuTUfq/l?=
 =?us-ascii?Q?L6Fr0uemf+gR+cNXnxJ9frcVAHE4RRbObH8KHw0IfCGfIKZplhCByC/RoDXh?=
 =?us-ascii?Q?T+qqNXvlc8Jth7qg+ELTZJTFnKNQxxA2i37AEg9a3OeugJB5u7ds0mSXdA1q?=
 =?us-ascii?Q?+QvZxO87u5FablkXgNzJ24KRfO+mrKQZslMOZCoH5v+lCOlszQQUoJxzEfLl?=
 =?us-ascii?Q?qPlN9amLIMrXPkr9EzvPsKdDg9WiE9FcVy+XoyNgASj4yHjgQY3L0V96OhNM?=
 =?us-ascii?Q?nuW9IVeAlKRJJB6SSkzKwCqTb1tfHL/Vp4NrsMCzzi1IeULeQUHF48HIxUvt?=
 =?us-ascii?Q?y8BRbPTifleTXgg1dpwa1eSIeaJ2tPgWiDqoVYGZ4H0xcFLibyyqfvW5xmSd?=
 =?us-ascii?Q?IbnFGk6+uUzLUjVIViABvTh+ZAJkG942tkloQRYHtUZmG/g3GQMz1n3DjeVr?=
 =?us-ascii?Q?AC157LCOVnaJNzpENxcViw/8TS+JRjIxyaCAsKRiDA/16TFwLh3JQkkyl+UH?=
 =?us-ascii?Q?EqTJwDBt4uZoF+5r9hVPITtnTC2vdULW94CMnqjB0AvbyGkTI+a6CnSEN6ZO?=
 =?us-ascii?Q?Zyc01/7Fk41VC3FocG2mLx1ie16i6P0gpno44r3xyyYwDoYLK7kG4NsSZ/IS?=
 =?us-ascii?Q?oOcDIHmPXAFQ5mQFbtmq50x3i2mxN+sAPCuyL2vS49XQIXRYs4nz2Jz6l4pz?=
 =?us-ascii?Q?qlkQuqZ2aue04xDH/ZlQ+fg60qcq9PFprSlNGwqFL9maMqbBkPFyY2ftZfFe?=
 =?us-ascii?Q?5dsGmmLAVEW2ye00yF8P8RdKY2j/qboEcTOwuQD8rMv9vGx+fhUBHE6Cw4Yv?=
 =?us-ascii?Q?LqibK51dNTNlEgYHG7Nbg/FbWoGfUkJ2vDfj/BLaWtJL6+eHzXLtR2Ek3w+E?=
 =?us-ascii?Q?KKAgrJtgNuKgIadwI0QxX5z1KBnCbfAw3wmaJ3sRQ4/ZFAh97cuZtEJmu2AK?=
 =?us-ascii?Q?bd3PioWhgbyDjcLMBsRhGnnIAHNV8dgzXPS/Tzdax/gYiu/SQO/wq6bvI0Vx?=
 =?us-ascii?Q?9EKzRpxj952XbXuAysQK8C5wZy/BmNxWZ2uEBv9FM5znLFYe7vd2uwoZsozw?=
 =?us-ascii?Q?uh/YRnXZ7w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8f31ac-56b7-4c9f-7b04-08dee7968066
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:11:12.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVtd5ro8tGY5HmJ0g8B1ISaQxzEUfg8XTVp0dXjXI90LKHVNP20SuQg27+Tcpj5mk1soLjQYPO93T8lqgVsbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

The existing MBA test is Intel-only: it validates the MB monitor against
the iMC PMU, which doesn't exist on ARM MPAM, so the MB allocation control
interface goes untested there.

Add a feature-gated MBA_SCHEMATA group. Its first case, MBA_SCHEMATA_INFO,
reads info/MB including bandwidth_gran, min_bandwidth, num_closids and the
default schemata through the resctrl filesystem and every domain resets to
the maximum.

resource_info_str_get() and resctrl_get_schemata() helpers are
implemented to assist the test.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 .../selftests/resctrl/mba_schemata_test.c     | 152 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   3 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 tools/testing/selftests/resctrl/resctrlfs.c   | 121 ++++++++++++++
 4 files changed, 277 insertions(+)
 create mode 100644 tools/testing/selftests/resctrl/mba_schemata_test.c

diff --git a/tools/testing/selftests/resctrl/mba_schemata_test.c b/tools/testing/selftests/resctrl/mba_schemata_test.c
new file mode 100644
index 000000000000..b92011e42726
--- /dev/null
+++ b/tools/testing/selftests/resctrl/mba_schemata_test.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Memory Bandwidth Allocation (MB) schemata / control-interface tests.
+ *
+ * These are deterministic, userspace-driven ABI integration tests for the
+ * resctrl "MB" control plane as exposed by ARM MPAM.
+ *
+ * Each test case is a separate struct resctrl_test sharing the "MBA_SCHEMATA" group.
+ */
+#include "resctrl.h"
+
+#define MB_MAX_DOMAINS		64
+
+/*
+ * Worst-case length of an MB schemata value string ("<id>=<pct>;" per domain),
+ * sized for MB_MAX_DOMAINS so a full line is never silently truncated. If a
+ * platform exceeds this, resctrl_get_schemata() returns -ENOBUFS (we fail, not
+ * silently verify a prefix).
+ */
+#define MB_SCHEMATA_LEN		(MB_MAX_DOMAINS * 16)
+#define MB_PERCENT_MAX		100
+
+/*
+ * parse_mb_schemata - Parse a percentage MB schemata value string.
+ * @vals:	"id=pct;id=pct;..." (modified in place by strtok_r)
+ * @ids:	output array of domain ids
+ * @pct:	output array of percentages
+ * @max:	capacity of @ids / @pct
+ *
+ * Return: number of domains parsed, or -1 on overflow / parse error.
+ */
+static int parse_mb_schemata(char *vals, int ids[], unsigned int pct[], int max)
+{
+	char *save = NULL, *tok;
+	int n = 0;
+
+	for (tok = strtok_r(vals, ";", &save); tok;
+	     tok = strtok_r(NULL, ";", &save)) {
+		int id, consumed = 0;
+		unsigned int p;
+
+		if (n >= max)
+			return -1;
+		/*
+		 * Strictly validate the whole token as "<id>=<pct>": %n records
+		 * how far sscanf advanced, so a non-NUL byte there means trailing
+		 * garbage (e.g. "0=100junk"). Domain ids are non-negative.
+		 */
+		if (sscanf(tok, "%d=%u%n", &id, &p, &consumed) != 2 ||
+		    tok[consumed] != '\0' || id < 0)
+			return -1;
+		ids[n] = id;
+		pct[n] = p;
+		n++;
+	}
+
+	return n;
+}
+
+/*
+ * the MB resource advertises a sane, self-consistent
+ * control contract and the default group resets to the maximum on every domain.
+ */
+static int mba_schemata_info_run_test(const struct resctrl_test *test,
+				 const struct user_params *uparams)
+{
+	unsigned int gran, min_bw, num_closids, pct[MB_MAX_DOMAINS];
+	int ids[MB_MAX_DOMAINS], n, i, ret, fail = 0;
+	char vals[MB_SCHEMATA_LEN];
+
+	/* bandwidth_gran must be in [1,100]. */
+	if (resource_info_unsigned_get(test->resource, "bandwidth_gran", &gran))
+		return 1;
+	if (gran < 1 || gran > MB_PERCENT_MAX) {
+		ksft_print_msg("Fail: %s bandwidth_gran=%u out of [1,100]\n",
+			       test->resource, gran);
+		fail = 1;
+	}
+
+	/* min_bandwidth must be in [0,100]. */
+	if (resource_info_unsigned_get(test->resource, "min_bandwidth", &min_bw))
+		return 1;
+	if (min_bw > MB_PERCENT_MAX) {
+		ksft_print_msg("Fail: %s min_bandwidth=%u > 100\n",
+			       test->resource, min_bw);
+		fail = 1;
+	}
+
+	/* num_closids must allow at least the default group plus one. */
+	if (resource_info_unsigned_get(test->resource, "num_closids", &num_closids))
+		return 1;
+	if (num_closids < 2) {
+		ksft_print_msg("Fail: %s num_closids=%u < 2\n",
+			       test->resource, num_closids);
+		fail = 1;
+	}
+
+	/*
+	 * Default group: the schemata must carry an MB line with one entry per
+	 * domain, and every domain must reset to the percentage maximum (100).
+	 */
+	ret = resctrl_get_schemata("", test->resource, vals, sizeof(vals));
+	if (ret) {
+		ksft_print_msg("Fail: could not read %s schemata line (ret=%d%s)\n",
+			       test->resource, ret,
+			       ret == -ENOBUFS ? " - line truncated, buffer too small" : "");
+		return 1;
+	}
+	n = parse_mb_schemata(vals, ids, pct, MB_MAX_DOMAINS);
+	if (n < 1) {
+		ksft_print_msg("Fail: could not parse %s schemata \"%s\"\n",
+			       test->resource, vals);
+		return 1;
+	}
+	ksft_print_msg("%s default schemata has %d domain(s)\n", test->resource, n);
+	for (i = 0; i < n; i++) {
+		if (pct[i] != MB_PERCENT_MAX) {
+			ksft_print_msg("Fail: %s domain %d default=%u, expected %d (max)\n",
+				       test->resource, ids[i], pct[i], MB_PERCENT_MAX);
+			fail = 1;
+		}
+	}
+	if (!fail)
+		ksft_print_msg("Pass: all %d %s domain(s) default to %d%%\n",
+			       n, test->resource, MB_PERCENT_MAX);
+
+	return fail;
+}
+
+/*
+ * MBA_SCHEMATA group feature check: the MB resource exists and uses the percentage
+ * schema. Non-percentage MB (e.g. x86 mba_MBps) and platforms without MB skip.
+ */
+static bool mba_schemata_feature_check(const struct resctrl_test *test)
+{
+	char fmt[64];
+
+	if (!resctrl_resource_exists(test->resource))
+		return false;
+	if (resource_info_str_get(test->resource, "schema_format", fmt, sizeof(fmt)))
+		return false;
+
+	return !strcmp(fmt, "percentage");
+}
+
+struct resctrl_test mba_schemata_info_test = {
+	.name = "MBA_SCHEMATA_INFO",
+	.group = "MBA_SCHEMATA",
+	.resource = "MB",
+	.feature_check = mba_schemata_feature_check,
+	.run_test = mba_schemata_info_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index afe635b6e48d..a6ad25a08ae5 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -201,6 +201,8 @@ int get_full_cbm(const char *cache_type, unsigned long *mask);
 int get_mask_no_shareable(const char *cache_type, unsigned long *mask);
 int get_cache_size(int cpu_no, const char *cache_type, unsigned long *cache_size);
 int resource_info_unsigned_get(const char *resource, const char *filename, unsigned int *val);
+int resource_info_str_get(const char *resource, const char *filename, char *val, size_t len);
+int resctrl_get_schemata(const char *ctrlgrp, const char *resource, char *buf, size_t len);
 void ctrlc_handler(int signum, siginfo_t *info, void *ptr);
 int signal_handler_register(const struct resctrl_test *test);
 void signal_handler_unregister(void);
@@ -246,5 +248,6 @@ extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
+extern struct resctrl_test mba_schemata_info_test;
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..5d45ac95d988 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -21,6 +21,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l3_cat_test,
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
+	&mba_schemata_info_test,
 };
 
 static unsigned int detect_vendor(void)
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index b9c1bfb6cc02..8b428a22496d 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -400,6 +400,127 @@ int resource_info_unsigned_get(const char *resource, const char *filename,
 	return 0;
 }
 
+/*
+ * resource_info_str_get - Read a string from
+ * /sys/fs/resctrl/info/@resource/@filename
+ * @resource:	Resource name that matches directory name in
+ *		/sys/fs/resctrl/info
+ * @filename:	File in /sys/fs/resctrl/info/@resource
+ * @val:	Buffer that receives the first line on success
+ * @len:	Size of @val
+ *
+ * Reads the first line of the file, stripping a trailing newline.
+ *
+ * Return: = 0 on success, < 0 on failure.
+ */
+int resource_info_str_get(const char *resource, const char *filename,
+			  char *val, size_t len)
+{
+	char file_path[PATH_MAX];
+	char *end;
+	FILE *fp;
+
+	snprintf(file_path, sizeof(file_path), "%s/%s/%s", INFO_PATH, resource,
+		 filename);
+
+	fp = fopen(file_path, "r");
+	if (!fp) {
+		ksft_print_msg("Error opening %s: %m\n", file_path);
+		return -1;
+	}
+
+	if (!fgets(val, len, fp)) {
+		ksft_print_msg("Could not get contents of %s: %m\n", file_path);
+		fclose(fp);
+		return -1;
+	}
+
+	fclose(fp);
+
+	end = strchr(val, '\n');
+	if (end)
+		*end = '\0';
+
+	return 0;
+}
+
+/*
+ * resctrl_get_schemata - Read the value portion of a resource's schemata line
+ * @ctrlgrp:	Control group name, or "" / NULL for the default group
+ * @resource:	Schema name (e.g. "MB", "L3")
+ * @buf:	Receives the text after "<resource>:" on success
+ * @len:	Size of @buf
+ *
+ * The schemata file holds one line per schema, e.g. "    MB:0=100;1=100".
+ * On success @buf holds the value part, e.g. "0=100;1=100".
+ *
+ * Return: = 0 on success, < 0 on failure (including the line not being found).
+ */
+int resctrl_get_schemata(const char *ctrlgrp, const char *resource,
+			 char *buf, size_t len)
+{
+	char schema_path[PATH_MAX];
+	char line[4096];
+	size_t rlen;
+	FILE *fp;
+	int ret = -ENOENT;
+
+	if (ctrlgrp && *ctrlgrp)
+		snprintf(schema_path, sizeof(schema_path), "%s/%s/schemata",
+			 RESCTRL_PATH, ctrlgrp);
+	else
+		snprintf(schema_path, sizeof(schema_path), "%s/schemata",
+			 RESCTRL_PATH);
+
+	fp = fopen(schema_path, "r");
+	if (!fp) {
+		ksft_print_msg("Error opening %s: %m\n", schema_path);
+		return -1;
+	}
+
+	rlen = strlen(resource);
+	while (fgets(line, sizeof(line), fp)) {
+		size_t linelen = strlen(line);
+		char *p = line;
+		char *nl;
+		int w;
+
+		while (*p == ' ' || *p == '\t')
+			p++;
+		/* Match "<resource>:" exactly so "MB" != "MB_HLIM"/"MB_MON". */
+		if (strncmp(p, resource, rlen) || p[rlen] != ':')
+			continue;
+
+		/*
+		 * fgets filled the whole buffer without reaching a newline: the
+		 * schemata line is longer than @line and was truncated, so we
+		 * would only see a prefix of this resource's domains. Fail
+		 * loudly rather than silently verifying part of the line.
+		 */
+		if (linelen == sizeof(line) - 1 && line[linelen - 1] != '\n') {
+			ret = -ENOBUFS;
+			break;
+		}
+
+		p += rlen + 1;
+		nl = strchr(p, '\n');
+		if (nl)
+			*nl = '\0';
+		/* Likewise refuse to return a truncated value into @buf. */
+		w = snprintf(buf, len, "%s", p);
+		if (w < 0 || (size_t)w >= len) {
+			ret = -ENOBUFS;
+			break;
+		}
+		ret = 0;
+		break;
+	}
+
+	fclose(fp);
+
+	return ret;
+}
+
 /*
  * create_bit_mask- Create bit mask from start, len pair
  * @start:	LSB of the mask
-- 
2.43.0

