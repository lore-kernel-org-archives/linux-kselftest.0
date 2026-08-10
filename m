Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E9A3B0AC8;
	Mon, 10 Aug 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355519; cv=fail; b=a9dxeruP2H5ry4XFpbVtro9IgIemT8LjTyVO55D4pJ83unZvNqdpkfO1bW5JVExTIE0PKAN0qgPNqW+bsz906MX8w3eLPtV1o/ojiDK6s+juY0E6EW8PA7Z2ZaO4XEJ357VS2/oUc2L8aOfXLCz7K1SGzvkFexxl1Kiq3ZeCooE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355519; c=relaxed/simple;
	bh=o6FXfo/eLEpRb2Nbc00BV7dPli7nApqb+WZrWW1eRwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NiDqOPaKhOylYhK77hPn0VMGWOMqY+awMvCZtzXHAjKhvXlmu+uKcqQI8A0boQbPt3Dh889pES4oUDzVZ5HkmZmWFmaztd8wVfVwZa5MHWg9/TentoKTkutVHqNJuPQnqIs6bfWZPny1sjYGhuic6POwGgAYpjzsD43CYbrN+Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TTaSGDWD; arc=fail smtp.client-ip=52.101.57.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TTaSGDWD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyA0XY4majFQEGisW3HId3BJCyEwWGTrWyfICsaVUd+PsSqFxX670TD4qC+Iqlpy/+5wFbXkzNx3xGk3x0w7jlSxqnzXLWdAE8cMoHAL3WEi8tYRFCzaH/Dn+dux/RqXgYIKnd0gPrtFwfgWWSX5yxkoGbLXJVj9QZi8ocah0VllKUnL4T4CoFsovJ6K1d4U5N+Pj8ZtOvMkEBWZ7XmutCLiBZyEUTtEKOBrcyA831E5fpc1qKmp87NUc+aXNs+68yfcSDf3aLk3PscPuU9MuEaXTlyBSyfI4GcETL1Qo1M59NLJU0/2m8pwEL2O6A6iQJvS9HDmNjTdB5E9l9q3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yiz59TjMgylMOwZC9uEAHDT/pR1XQX1SqILr7QSw6iw=;
 b=hSARZTJ9WK8oB9RBTJDldVtlkpdnMG9DEX/QGX12DY71J1aetjUssiyFYWW25KtbzJ5ikdLcN0ep/uHTO7175OUuhJOaMNku/yJEyN4BcHdSd7V5G9x2uuSc3mRtuyB2G2R/SWDh1VMs0j9tOfBc71dBc4WK3yVH5K3PQaKBrTS6ffDcA0/Ue67MnoE+K81ZUJG31xwjUzOjDMqqkMyfS2JUKEwLdIJwGaruEbhwwd9wEsbaGBPLOVWt7NeWUhjw3DhDO5SmS+5JpqIX+7FgRVtasjOKqRnnjE7FzLPT7QOmYvpFE+6wISQPc4rqnD6cXorPQAgno0BPFKwnbq+DrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yiz59TjMgylMOwZC9uEAHDT/pR1XQX1SqILr7QSw6iw=;
 b=TTaSGDWD+nNE/9DTfeo8zs9Y71sbn2tF4aeULk7N5g8zR1/wCPikbCefzMKpHRGK1rDRwGAv0QYOJUKrbyMU9bj9GaRxvA7BMC1pCPBtHVFFLb3qVGRn/BbDeIk3341+aGaifR52Z+4ydVYroFDhl1p10NoF/EJ49etdfsTrVa4kFX6Pef1/phcR8XUIef3qFEgZax7WaDlAandSKnCTeirHL69uVboANaAQrO0mVkWQSmjXKXCHHVNptGagLmT80uvVOgHR7wC0rDEAu3C/7RqyRtPJSeTzki4krezqrZhr0teFnDe0zBM0AN1J6JQYV+h2W11TUutMCWze/lS0TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:51:53 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 09:51:53 +0000
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
Subject: [PATCH v2 2/2] selftests/resctrl: Add L3_BIT_USAGE to check allocation reporting
Date: Mon, 10 Aug 2026 17:51:23 +0800
Message-ID: <20260810095124.32244-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810095124.32244-1-icheng@nvidia.com>
References: <20260810095124.32244-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db2fb01-73fb-4d93-d0bd-08def6c50170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|6133799003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tjfQbJWueHLwxh/GKbg2ygMaJnAfPJ742Xu8eFA8VL/gkF5dowltfpcL6uZljBnKHzxAjIXevsFxV1ke/Eh3TJqXb+i4UGjZUX1zfesWN0t75nkKkdOovqynEwIO9GkUpGRYfbvwinK1li395iPvmut/CZv5yaXZ4O85T3vIB89brHIbP3SH7I6H0Bsd7wF3zwVwNm4NassisEsXRijlDCp+iu93KZDD+fScOMFkh8MfHk+ZjzYi1Yi7uOC6coe1SfWSPf9jHQCKpPc8UwTc1Py34evmkz6z7/K+1L7eGymqQ8wsgpCqPOpLup4lDwbRhox7xzwhHKKFnE/un1vuPmxpjJZrKNXD7+7Pp+8LKjeb7uNx3JO57E3zQXa/vVlKkSMepeCpJ/WBDrrMGa2LJWa6gt5KDpw8fB9DbGQu+dLNPiSBsML+UZpTMv8PKSMrZB/sdHQNBmEnWMbLWJfvZIO0k54dO41uWmytF4o1jaTJfQT/9prQmyFxido/rr+jYGGVptnsU3HqNF2Z+1AJefwu9rz/ikJdj1BVV+LQ4WSO1v+pzFJPKKbNrstinp5O8dd81AEefWvhoZ8CpGsMUfJ2z0Ttu5PH5rTotteADfE2SicCyCiDG+gX9d701xGgX9iiNP+TAMvj5mC1+Rg9FaO0fr4MzsxMTFHAxOAz31M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(6133799003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?648pVYxgWCPC5l8z956e8BnmG+c5w/oRVpgqlj+vI0eg0J4vT4xd5QX7kryN?=
 =?us-ascii?Q?otT3cCWGzWjUFkSdAAK++GCx//6IrJ7fG/ekD78Nj2Vq/0L/3fFnMx2YwHc9?=
 =?us-ascii?Q?HVQ/X7cJSsivkB4waXj22qPW9RVoTEvV71UyZcNAIcXOsc3VL9eN6j0QEX6b?=
 =?us-ascii?Q?fc8v1KUeNb5Sz+rG/Wi9qceF0RK5fgbCjku5wbfwcCMU/IYJsVRL30tfvnZd?=
 =?us-ascii?Q?XDFVVz+VEa8c4HeSLy73rotGJQYqFb1OCwktThgkGUWpKhHY0C0vDhYHbHL1?=
 =?us-ascii?Q?Jxuvr/iwzVF+vMvWlJjKaqSNt8tQF1eyz/432AJqSUb4ME/QkdznGx3DjYIA?=
 =?us-ascii?Q?xXwUto5sSPopiWSEhdrpp+qn0Ojawug675ZkZQV/3FcOJy6VEKQs8UQi5L6a?=
 =?us-ascii?Q?sfe+5a0ysndSTLG2f0pwDRR2IWqxTgKa3uuF62ZRRP5hmcpAOtnTlQ+Mp7kn?=
 =?us-ascii?Q?20F8T7R0qvyrks7vGMTfvG8Zufc5zCX7qpz9Ga/BRjM5918FsVjA5KuVBufe?=
 =?us-ascii?Q?qYVox+P1KMoYSZCvUZ4hsGJkNsdipSiuhdPAlVtzjaiAe1C7vdg8eTs4qP35?=
 =?us-ascii?Q?WMjyu7dGxtnHjXy9FpdQwLiNxID4F4LOenFQGxyRKH0sCF63k+/h/p7LQrkj?=
 =?us-ascii?Q?jXg7Z9jhKD+nfmso5lqU3AuI6XRxNxUNGiRZTHYolLWqbxL6pDSxtdFvygPn?=
 =?us-ascii?Q?B69ATkUfg+DBAqnJ2eifygseXXz3ypR6vQBPgI1w+bwa+tGVGBv+ZiSz76Y2?=
 =?us-ascii?Q?POXGcbH4g5JV1lqKuQM4hF44dzTGrm0SGor/aP7j3qaKttE0UOkIBp+iJ+t9?=
 =?us-ascii?Q?CuC3yglvhBiNztKwzl5RMBysI9REp9V/2VXk3dKeKQoibzRkIrq6Tb6ZfG/w?=
 =?us-ascii?Q?4EryNeAJd/hknHOBhYvTHWuPIHPL2bCP+UFyN74+YPsWesCcSJqrhioZJ6Fw?=
 =?us-ascii?Q?P32iegzMKG6CnaH3t+bUSl2dcNQk9HFCAABWhGErxrsP9rJlICm17VHLwUzo?=
 =?us-ascii?Q?YMhFNJnFDjIgrdP0mT2pqhiFQr9LVs5lJpekHCLQ7li8nWfmCGHnvay6qzCs?=
 =?us-ascii?Q?YmpoWYxVxosBsbnZ378x3H08Vp5RgwaVOZZiXROCO9nzyjO0MtKHRbP91nb3?=
 =?us-ascii?Q?UKEDQnWdpgULym9mRXC2eLfxi3VHpq5IV5VQF2aeTDYtYh+wp0zpHpYeVkrV?=
 =?us-ascii?Q?06DOTxe+dPBQINLsHnN+Y9Y8150zmz/F8fLldFsNkczHt8ck/ZOJ5mVQWDit?=
 =?us-ascii?Q?6gKHCNzuvaAk8fxRUtn1vL5UakyqeKvKizTT/GXQ5iaBiM4iXfnpHBjVJidq?=
 =?us-ascii?Q?gT9UZmke+j0j/d1ZEQV9rNPO7CNfOEoZF6Pbw9DjJOhemkRRQbfK3zPlMku2?=
 =?us-ascii?Q?as12tUwF93Lv2P0WQGaQPupxtDI8o3bwIFOwtoOSTer2PTh8mSRAQNsB/bB/?=
 =?us-ascii?Q?bw4+f5CglgPescdd3/evIXzJvjPZr8sPQJlgJwA+CqgOfsKl6kIRxtlMOrOi?=
 =?us-ascii?Q?tTTZxoYW9/Kv/A8/DzAk21u4zD1xqw6NcTLmnlKjJVNzuS5ZO5+SmQYdTx3Z?=
 =?us-ascii?Q?AUiPBiEDvlRgYamJarNXkKV/spRhyr/WxuL5kNhRQj/+FnUcQeT9mdl2BF3q?=
 =?us-ascii?Q?ng8c1uSYUlKwp6hFY6Afk0l6PI0ElS7UD1+whWLlMf9PLCRAahIK33/Dgllc?=
 =?us-ascii?Q?/OtemqmBvjtBlH0M5bRnlRfrlDEJTPfZ5Qonur6UWkuEhcWDr+Vo/T+4SVGa?=
 =?us-ascii?Q?IgYv1UeJBw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db2fb01-73fb-4d93-d0bd-08def6c50170
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 09:51:52.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c66c0ZCc8z8bUdY/qr89AN4JrWZFG32xVSd+qRoMOY4Ru0YdPgNJAF3EdwW6jx3OTAtJwRRmp7okbwCY/MSKUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987

Add L3_BIT_USAGE to verify that info/L3/bit_usage follows the root
group's CBM.

Write full, low, and high valid masks, then check the selected domain.
Require X or S for portions used by SW and H or 0 for portions outside
the allocation.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
Changelog:

v1 -> v2:
    - Simplify helper names.
    - Add an explicit character-validity helper
    - Simplify parsing and avoid fixed-length input
    - Move domain lookup into the mask checker
    - Generate masks according to min_cbm_bits
    - Remove unnecessary CBM restoration
    - Move tail comments above assignments
    - Use KSFT_FAIL and reverse-fir-tree ordering
---
 tools/testing/selftests/resctrl/cat_test.c    | 194 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 3 files changed, 196 insertions(+)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index a06c57954740..9205f93fd669 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -440,6 +440,192 @@ static int cbm_validate_run_test(const struct resctrl_test *test,
 	return 0;
 }
 
+/*
+ * L3_BIT_USAGE - Verify info/L3/bit_usage reflects the allocation.
+ *
+ * bit_usage annotates each cache portion. 'X' and 'S' mean software uses the
+ * portion, while 'H' and '0' mean it does not. With only the root group
+ * present, bit_usage must track the root CBM bit-for-bit.
+ */
+static bool bit_used_by_sw(char c)
+{
+	return c == 'X' || c == 'S';
+}
+
+static bool bit_unused_by_sw(char c)
+{
+	return c == 'H' || c == '0';
+}
+
+static bool bit_usage_valid(char c)
+{
+	return bit_used_by_sw(c) || bit_unused_by_sw(c);
+}
+
+static int bit_usage_for_domain(const char *resource, int domain_id,
+				char *out, size_t out_len)
+{
+	char path[PATH_MAX], *line = NULL, *saveptr;
+	char *usage, *endptr, *id;
+	size_t line_len = 0;
+	long parsed_id;
+	ssize_t bytes;
+	FILE *fp;
+	int ret;
+
+	snprintf(path, sizeof(path), "%s/%s/bit_usage", INFO_PATH, resource);
+	fp = fopen(path, "r");
+	if (!fp) {
+		ksft_perror("Error opening bit_usage");
+		return -errno;
+	}
+
+	bytes = getline(&line, &line_len, fp);
+	fclose(fp);
+	if (bytes < 0) {
+		ksft_print_msg("Error reading bit_usage\n");
+		free(line);
+		return -EIO;
+	}
+
+	ret = -ENOENT;
+	for (id = strtok_r(line, "=;\n", &saveptr); id;
+	     id = strtok_r(NULL, "=;\n", &saveptr)) {
+		usage = strtok_r(NULL, "=;\n", &saveptr);
+		if (!usage)
+			break;
+
+		errno = 0;
+		parsed_id = strtol(id, &endptr, 10);
+		if (errno || *endptr || parsed_id != domain_id)
+			continue;
+
+		ret = snprintf(out, out_len, "%s", usage);
+		if (ret < 0 || (size_t)ret >= out_len)
+			ret = -ENOSPC;
+		else
+			ret = 0;
+		goto out;
+	}
+
+	ksft_print_msg("No bit_usage entry for domain %d\n", domain_id);
+out:
+	free(line);
+	return ret;
+}
+
+static int bit_usage_check_mask(const struct resctrl_test *test, int cpu,
+				unsigned long mask, unsigned int count_of_bits)
+{
+	char usage[sizeof(unsigned long) * 8 + 1];
+	char schemata[64];
+	unsigned int i;
+	int domain_id;
+	int ret;
+
+	snprintf(schemata, sizeof(schemata), "%lx", mask);
+	ret = write_schemata("", schemata, cpu, test->resource);
+	if (ret) {
+		ksft_print_msg("Failed to set CBM 0x%lx\n", mask);
+		return ret;
+	}
+
+	ret = get_domain_id(test->resource, cpu, &domain_id);
+	if (ret < 0)
+		return ret;
+
+	ret = bit_usage_for_domain(test->resource, domain_id, usage,
+				   sizeof(usage));
+	if (ret)
+		return ret;
+
+	if (strlen(usage) != count_of_bits) {
+		ksft_print_msg("bit_usage \"%s\" has %zu chars, expected %u\n",
+			       usage, strlen(usage), count_of_bits);
+		return KSFT_FAIL;
+	}
+
+	for (i = 0; i < count_of_bits; i++) {
+		bool in_cbm;
+		int bit;
+		char c;
+
+		bit = count_of_bits - 1 - i;
+		in_cbm = (mask >> bit) & 1;
+		c = usage[i];
+
+		if (!bit_usage_valid(c)) {
+			ksft_print_msg("Invalid bit_usage character '%c' for CBM 0x%lx\n",
+				       c, mask);
+			return KSFT_FAIL;
+		}
+		if (in_cbm != bit_used_by_sw(c)) {
+			ksft_print_msg("CBM 0x%lx portion %d shows '%c', %s allocation\n",
+				       mask, bit, c, in_cbm ? "in" : "not in");
+			return KSFT_FAIL;
+		}
+	}
+
+	return 0;
+}
+
+static int bit_usage_run_test(const struct resctrl_test *test,
+			      const struct user_params *uparams)
+{
+	unsigned int count_of_bits, min_cbm_bits, partial_bits;
+	unsigned long full_mask, high_mask, masks[3];
+	unsigned int nr_masks = 1;
+	unsigned int i;
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
+	/* Every cache portion. */
+	masks[0] = full_mask;
+
+	if (count_of_bits > min_cbm_bits) {
+		partial_bits = count_of_bits / 2;
+		partial_bits = max(partial_bits, min_cbm_bits);
+
+		/* Lowest valid partial allocation. */
+		masks[nr_masks++] = create_bit_mask(0, partial_bits);
+
+		if (partial_bits) {
+			/* Highest valid partial allocation. */
+			high_mask = create_bit_mask(count_of_bits - partial_bits,
+						    partial_bits);
+			if (high_mask != masks[nr_masks - 1])
+				masks[nr_masks++] = high_mask;
+		}
+	}
+
+	for (i = 0; i < nr_masks; i++) {
+		ret = bit_usage_check_mask(test, uparams->cpu, masks[i],
+					   count_of_bits);
+		if (ret)
+			return ret;
+	}
+
+	ksft_print_msg("Pass: bit_usage reflects the allocation\n");
+
+	return 0;
+}
+
+static bool bit_usage_feature_check(const struct resctrl_test *test)
+{
+	return test_resource_feature_check(test) &&
+	       resource_info_file_exists(test->resource, "bit_usage");
+}
+
 struct resctrl_test l3_cat_test = {
 	.name = "L3_CAT",
 	.group = "CAT",
@@ -457,6 +643,14 @@ struct resctrl_test l3_cbm_validate_test = {
 	.run_test = cbm_validate_run_test,
 };
 
+struct resctrl_test l3_bit_usage_test = {
+	.name = "L3_BIT_USAGE",
+	.group = "CAT",
+	.resource = "L3",
+	.feature_check = bit_usage_feature_check,
+	.run_test = bit_usage_run_test,
+};
+
 struct resctrl_test l3_noncont_cat_test = {
 	.name = "L3_NONCONT_CAT",
 	.group = "CAT",
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index a6fc688ed997..765aa5d5814d 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -241,6 +241,7 @@ extern struct resctrl_test mba_test;
 extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_cbm_validate_test;
+extern struct resctrl_test l3_bit_usage_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 57a4d0815b67..e6e948d55f38 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -20,6 +20,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&cmt_test,
 	&l3_cat_test,
 	&l3_cbm_validate_test,
+	&l3_bit_usage_test,
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
 };
-- 
2.53.0

