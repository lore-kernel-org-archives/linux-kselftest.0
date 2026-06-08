Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409583A1C9;
	Mon,  8 Jun 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916833; cv=fail; b=uT0M/AMuQP2rysQr1fMBlOfWorTkeQP1vhzPOXQw03euUCu6XRDAx69pEW89mEVDO16p1lqoCuOpbMUkPBy81Uh4z7YXIizJtKCaebJz7FzdSWjtiAct4InnCqMjaiajD2UP7GAAtuWUn35ad6Bg/BCVRPiyYNkcD15FJbcf6yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916833; c=relaxed/simple;
	bh=jk74kjFz71Ex/BAJXtIDrRLCUaJlFgwWZyG1DmIkOEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rL+y9fIqXC3kl5WDWvLC3sAgxuDXm3P8qlOBDHzuMcauCsq3Zc8Wn3GTnctmJFDJcfi9uCEq+wH14Yr4uaPUOJshGkTuOlhAh3gf2p2K6YDfLRwpcub47GXBUn3UpAwIdv23BMX1QggRBjQ7qg5ZVPBJYKqy3ZXQcNBTtQl8v20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O7myWPQh; arc=fail smtp.client-ip=40.93.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O7myWPQh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXsel3Zlg8eiyKKNnZs6UvDBKIYskiwr+sdttM4+H3eN+RE+06r6WS1BPycJlO8hCH3sKFDoyY82FDD8QICT++BPo5yUeQnWZbxjSEyOzRUMVYykk//WDYEEqfX1VSGJDPyHwijMQAZGLVuM8uZcu8FXv52TS31BxM7IxwMBqq7rxIT30ZxFV/gwW6ZZKu6T8F2wD7lV0n0dgiJ2Ztk6hNskNRL5UZtEIPisUiATWTZgzg+PgYYqc5iPgvB9VPZ7kfXa7aZ1wn/YDwtMbMX4Eb6ENhQ4/XePoyzWzs6sErCM1Zq/Mp1pjpQ5oWipAZ2FkuLUfcStO+AQBk5ErjzqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpJDLVQ4ettJCBN8krkAWapVdvQLaA7mggI5UqDgnuk=;
 b=xrk6IMJUlcpfsoJGcioV8O+rb46bdxP4ItlrK2y7lt/C0GCUMGCdkNnRD7am1Fjr9XXLF5Am1joW+hldlbAmzEvQ8hdtB98LLJYLFQsaplNLwYXp75PCSJ1/CoxZhUlBSkkRK/jy8WJfbyclw9rjymF5SQ3VhqMhQH9fNWDLAhKyep6ep81pcrTla+5tDURlHza3ud8bh4s0K65pXrur1dwSVZ3KsBNB2a4lhLy0c0mpxGVkYnMTeY70z/YmikpTKCr1UAwR+bKsQpZOlHJQcsTq3dy5/RzmHGHmLb7OL8C4db3Nc97QVzK2VWTAOroIdJJWHOSgrKJ7khdPWl7NeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpJDLVQ4ettJCBN8krkAWapVdvQLaA7mggI5UqDgnuk=;
 b=O7myWPQhfmUOCZAAXOZxR4lzYVQev3YuykMutpwlguvkfeGPuBSWfM7o2BAhICv/Z+ax4qOn3QR5xOOZ4fPIyu+VzRbd+VElE0N70EwMR4XPwuw96eWjC883hBf3GMedoq+VdYnwaPkugrwUCVAYV+QjW+cARp9NOk/BWy9SLHHiiXE9NKg/lNHfuxhtc1GQfsL3LXAVA5ETqKXZt4uF+bqNSChMMte5RqwW8E1ODPdBjgzdpTtN1Od1e9atWGlyQ4tA7teX+sTSeEwAhDi9IjGhF8Vl5b+ygr4hEQskwvP2sG6ZPI8O78pq4Dk78ETu05Y12Hb7Or2CLnT+TsuFxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA3PR12MB7830.namprd12.prod.outlook.com (2603:10b6:806:315::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 11:07:07 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:07:07 +0000
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
Subject: [PATCH 3/3] selftests/resctrl: Add L3_BIT_USAGE to check bit_usage tracks allocation
Date: Mon,  8 Jun 2026 19:06:41 +0800
Message-ID: <20260608110641.44457-4-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260608110641.44457-1-icheng@nvidia.com>
References: <20260608110641.44457-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: a5db5cac-cc4b-4944-9284-08dec54e1407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|3023799007|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jc4FK32qy940QKcJruwb6Uav+r6Oq7qhTW8AJKnwsaw5MG/kZdIzDX3PogXUQLQRbl7U/NvzdHeibetzXum99U8H70OHiutWEckiw7J0UkK3kdA3Ex/IFKH3SbPoU8V0qkEWJDwpUoaVnsGnAEOyY64nLrT1OcQdbk0YbQCSlJc+6oDFRUKgT5qekDuo2jTEGkM+lMYgxGSCOxZBrjvAZZ9rtjTH19OAt4NFPXp4qBgvEi5HLeyDxZOs94S2+ZfHmd+ISfaTX9DFs7BWbpyV5s978/w5S7rTILrEGWWQ6rvromKAhzurin0VOJnjSjTFLbpTdbHTiXHxOIER0QSerxZQPCsP4erXxhwr+psgeX0p4M2vGfBJGVw6jKR8zBOIlRDuI4vhgjWj7kUZuHtN3ziYRK2IW3iAQqWvwgkgAtoGhpnA5ecx/hoA24M0Fn3+y8K85h67RRKM/rDSGxOZ4JIWkCOJjifhuWpdEObJ3/JlZRHnVZFX6RNKc+XjMDCI7cz84KJv9EmXOljNKdW91PvNRREmVuUfjgeCCyhgH2MmefIynIHaV9t2fnualahrX2dORjikUmtbfm/WgDL0M7fl/ALP5bbfbMCDMrsAsCV1dNLcIYjehXkYRqD0zzdeUGZowtJ8SI3GggR9IrcBFjzKTMIn6TSSI+K2MOFCgzvxiIjHJ/MPYU1xAVhiaN2i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NXUyohRYvYsdBMQnFbswBC71m/Yz/SZ0BRKberQ42btLx9nE+6eUrQzk1VOp?=
 =?us-ascii?Q?DBB/spO7daqDiIrEOqL9ZCPfBknJQmalPlYkeaMoLih2K9wj03VXXJVclvb2?=
 =?us-ascii?Q?R4BYE64w7mMvZ/NnOss8ylzRAHi20ZbAzhYWmjwKBlhcRbhByQjsGYm68fl5?=
 =?us-ascii?Q?xble69lNcizFBorxMEuZwKhNjxiiAeWo7cIG0Xc88MGL4iqkFQVd6YFJYCHS?=
 =?us-ascii?Q?aio304YeDeBpUK6f4bEYULq8X5MlVvBBDOmUDnal8lAKoAM05qKnLQ2UF55z?=
 =?us-ascii?Q?1J8ta/XY/S7rMlNeteo4H8iWdZkYaD0qT8NUVRBjQO/TP1UShiN5DU9adFmt?=
 =?us-ascii?Q?8Ykl1zEo1+jsThH661uxGMIgRX+zSlvtqNfxbxsvwVFgU8dIZm+yEkszFZAL?=
 =?us-ascii?Q?DDmA+iNqnAdGYXdsdTvN76xLeM2eVWvOqhMxkuqImz09w39cgYfyYJ5srZZM?=
 =?us-ascii?Q?REFmDsMY30Y1CYv9PK6ZIThoT6aumUQJ7iSTOukXdTzwKQA9SoyW/fulc+kg?=
 =?us-ascii?Q?rfLzZ4Von2X1cj5XJ/vvmtYsUeqVkObL1sbfTbMFoovvsKlSmC5zVvhDN+gG?=
 =?us-ascii?Q?B4XmZ65cw/dC5HdSeKW4c7TJVcOmSU0JhyAterIkFj5mbqjofZoYxqCyUsAZ?=
 =?us-ascii?Q?BMnWfqqpGH/E/vP2/RTq63Pi0rBDf7137IS8wfAR7qXGU6MGomDywXQwx4ya?=
 =?us-ascii?Q?4JqDEyWuVHmD08QmLrCpZeshDdRr0lCcHCSj76hieRfIgvjYK2njqktAlIoh?=
 =?us-ascii?Q?vLo0cmBtJf34EHVEyW2zNM93flNJpmyZU7KVAwrXCwK5x44ja2CJ9jaehk2I?=
 =?us-ascii?Q?SpKIPIMbJqm2ejZa7fOr7D9fzl61h/Ccn8vZlwjsBUxYIDKoxALbPpcCI43w?=
 =?us-ascii?Q?f64mGiRtm900ip4h1V2lw2CJOXdcURUd14bMPAGIhwycuiz6Z66jhC51o3Ss?=
 =?us-ascii?Q?5FLrz1rVv2Mr+LnAst86/fmTufLAtDfVhE0lkRA8Ki/3yzK9kT3O0wZHk7Vp?=
 =?us-ascii?Q?N9zLOZTBdnBvvyt6DYAlG9EOI3x9iES7ZwqqCmj68OMUYbA8x2QgbwafHqEh?=
 =?us-ascii?Q?+cxmQ0BI8F7MaawVfEs6gSSPfnuCsLlyrfBPdyFG3tdx3WO8Jf9ckDyETCdX?=
 =?us-ascii?Q?giYAQb2qYPSSLXUpI7oWh6YrRaG9FF0MHx31R4qoy2gE5DErBLSqtkqkMEBo?=
 =?us-ascii?Q?0W/2peSazkKe1k9WvwNc59u47tyY13cXSv3CO7kDEutaNWezymlCDg/z6vxl?=
 =?us-ascii?Q?+PS6L08XNRyjy0EPLpuYp6iaMfqmRF4hWlPqQGL/2YCWI0O6o0CZKcOvX1O8?=
 =?us-ascii?Q?ZRXDa0RKJP96rBuQel/mPS92Au7V9Dn5mM/YriTNLlKm1FGNEQgVhWfLXT8R?=
 =?us-ascii?Q?hrDTcJyyTJt4SAcmVZN9Y9kIZ+b+SMwYAvH+mOsBMFEgARXn8HulWq3jIwLW?=
 =?us-ascii?Q?0/YvH81K8zzmt4hCHANpVsc1eYi3bkjfHrObR904OoP85QLa56QZThS2oCbZ?=
 =?us-ascii?Q?nHk6s+rtRgsYBgXxDLjxk6XQIqzWm7u1DTeqPIYbkVr5Ru/Mv5jo1XwiVgF1?=
 =?us-ascii?Q?rOgfTuUwuDd0hqwzwck4UbNBw7bXle9ogW0mDJlkxa0LdEcM5W2b9XApFzk3?=
 =?us-ascii?Q?TykjSaKmoaJUQ3tC1/S0vXAhmaCBd8fbcFCSqJyywqHZsyIunGLzgcD2oC0Z?=
 =?us-ascii?Q?OaioQUl3BRN5vKOyPMuVP4UAwlDkL5MaTaFptTSDdxDvZPVxRrepfEacpens?=
 =?us-ascii?Q?ADJf7EyU7A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5db5cac-cc4b-4944-9284-08dec54e1407
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:07:07.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r34Wwpv8ayCXKO/g9NV6+pfGA2/v73fDGmuH414GMyOM/eFO4YPeOdIDjMZji03ZbGEqW3Lkdh6yblGP+sYqrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830

info/L3/bit_usage annotates every cache portion as used by software ('X
or 'S') or not ('H' or '0'). Nothing in the suite checks it's reported
correctly.

Implement L3_BIT_USAGE to set the root group's CBM to a few masks and
confirm that, for every portion, bit_usage marks it software-used
exactly when it is in the CBM. With only the root group present this
must track the mask bit-for-bit.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c    | 153 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 3 files changed, 155 insertions(+)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index d236988916d9..62af8ac98109 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -682,3 +682,156 @@ struct resctrl_test l3_cat_validate_test = {
 	.feature_check = test_resource_feature_check,
 	.run_test = cat_validate_run_test,
 };
+
+/*
+ * L3_BIT_USAGE - Verify info/L3/bit_usage reflects the allocation.
+ *
+ * bit_usage annotates each cache portion: 'X'/'S' mean a portion is used by
+ * software, 'H'/'0' mean it is not. With only the root group present, a
+ * portion is software-used exactly when it is in the root CBM, so bit_usage
+ * must track the CBM bit-for-bit.
+ */
+#define BIT_USAGE_LEN	256
+
+static bool bit_usage_sw_used(char c)
+{
+	return c == 'X' || c == 'S';
+}
+
+static bool bit_usage_not_used(char c)
+{
+	return c == 'H' || c == '0';
+}
+
+static int bit_usage_for_domain(const char *resource, int domain_id,
+				char *out, size_t len)
+{
+	char path[1024], raw[BIT_USAGE_LEN], *tok, *save;
+	FILE *fp;
+
+	snprintf(path, sizeof(path), "%s/%s/bit_usage", INFO_PATH, resource);
+	fp = fopen(path, "r");
+	if (!fp) {
+		ksft_perror("Error opening bit_usage");
+		return -1;
+	}
+	if (!fgets(raw, sizeof(raw), fp)) {
+		ksft_perror("Error reading bit_usage");
+		fclose(fp);
+		return -1;
+	}
+	fclose(fp);
+
+	/* bit_usage is "id=chars;id=chars;..."; return the chars for domain_id. */
+	for (tok = strtok_r(raw, ";\n", &save); tok; tok = strtok_r(NULL, ";\n", &save)) {
+		char *eq = strchr(tok, '=');
+
+		if (!eq)
+			continue;
+		*eq = '\0';
+		if (atoi(tok) == domain_id) {
+			snprintf(out, len, "%s", eq + 1);
+			return 0;
+		}
+	}
+
+	ksft_print_msg("No bit_usage entry for domain %d\n", domain_id);
+	return -1;
+}
+
+static int bit_usage_check_mask(const struct resctrl_test *test, int cpu,
+				int domain_id, unsigned long mask,
+				int count_of_bits)
+{
+	char schemata[64], usage[BIT_USAGE_LEN];
+	int i, ret;
+
+	snprintf(schemata, sizeof(schemata), "%lx", mask);
+	ret = write_schemata("", schemata, cpu, test->resource);
+	if (ret) {
+		ksft_print_msg("Failed to set CBM 0x%lx\n", mask);
+		return ret;
+	}
+
+	ret = bit_usage_for_domain(test->resource, domain_id, usage, sizeof(usage));
+	if (ret)
+		return ret;
+
+	if (strlen(usage) != count_of_bits) {
+		ksft_print_msg("bit_usage \"%s\" has %zu chars, expected %d\n",
+			       usage, strlen(usage), count_of_bits);
+		return 1;
+	}
+
+	/* bit_usage prints the highest portion first, so usage[0] is bit N-1. */
+	for (i = 0; i < count_of_bits; i++) {
+		int bit = count_of_bits - 1 - i;
+		bool in_cbm = (mask >> bit) & 1;
+		char c = usage[i];
+
+		if (!bit_usage_sw_used(c) && !bit_usage_not_used(c)) {
+			ksft_print_msg("Unexpected bit_usage char '%c' for CBM 0x%lx\n",
+				       c, mask);
+			return 1;
+		}
+		if (in_cbm != bit_usage_sw_used(c)) {
+			ksft_print_msg("CBM 0x%lx portion %d shows '%c', %s allocation\n",
+				       mask, bit, c, in_cbm ? "in" : "not in");
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int bit_usage_run_test(const struct resctrl_test *test,
+			      const struct user_params *uparams)
+{
+	unsigned long full_mask, masks[3];
+	char schemata[64];
+	int count_of_bits, domain_id, i, ret;
+
+	ret = get_full_cbm(test->resource, &full_mask);
+	if (ret)
+		return ret;
+
+	ret = get_domain_id(test->resource, uparams->cpu, &domain_id);
+	if (ret < 0)
+		return ret;
+
+	count_of_bits = count_bits(full_mask);
+
+	masks[0] = full_mask;					/* every portion */
+	masks[1] = create_bit_mask(0, count_of_bits / 2);	/* low half */
+	masks[2] = full_mask & ~masks[1];			/* high half */
+
+	for (i = 0; i < 3; i++) {
+		ret = bit_usage_check_mask(test, uparams->cpu, domain_id,
+					   masks[i], count_of_bits);
+		if (ret)
+			break;
+	}
+
+	/* Restore the root group to the full CBM. */
+	snprintf(schemata, sizeof(schemata), "%lx", full_mask);
+	write_schemata("", schemata, uparams->cpu, test->resource);
+
+	if (!ret)
+		ksft_print_msg("Pass: bit_usage reflects the allocation\n");
+
+	return ret;
+}
+
+static bool bit_usage_feature_check(const struct resctrl_test *test)
+{
+	return test_resource_feature_check(test) &&
+	       resource_info_file_exists(test->resource, "bit_usage");
+}
+
+struct resctrl_test l3_bit_usage_test = {
+	.name = "L3_BIT_USAGE",
+	.group = "CAT",
+	.resource = "L3",
+	.feature_check = bit_usage_feature_check,
+	.run_test = bit_usage_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index e2e3cf7833bc..270af2b26ba7 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -249,6 +249,7 @@ extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_cat_occup_test;
 extern struct resctrl_test l3_cat_validate_test;
+extern struct resctrl_test l3_bit_usage_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 66739e96f33c..e622928a2d7d 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -21,6 +21,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l3_cat_test,
 	&l3_cat_occup_test,
 	&l3_cat_validate_test,
+	&l3_bit_usage_test,
 	&l3_noncont_cat_test,
 	&l2_noncont_cat_test,
 };
-- 
2.43.0

