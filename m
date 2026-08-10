Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4439439341;
	Mon, 10 Aug 2026 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387746; cv=fail; b=GolYxhugNKOIH8ZCrkIYc7dYzmLOu7CfU06Gxlz+HlGCOZQVCEftD7mYJysWf+f9MRHp3OhiR/QUYGIa+7ep9FxUgfJOqYQtBz2tmIa18AmkPW/MBJU5iz5mzBb0KGbqkSCj8VD0er3ZRUipblkew9YNntYLd/6t/ZKxr8uHJiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387746; c=relaxed/simple;
	bh=NPscShLSjdViI7SVlK7izRBb0MguR397TVqJneCWQrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRey3N/3fqQ9uw2q8wIaHtZnVECtm3D/BmJi9ZSkyJjcoAeRqYYFvJmIhNHQeVjAhf21s4wMCpOUb5t3CQPP524qh17mXbiCJT1DoYc9LYXms1na0wwEYv5j/IfmwjumsKXSiylaA5XnbXr8R7/PtOLn+LKEVN4ij6crvoRL/Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RJZHwUxm; arc=fail smtp.client-ip=40.93.196.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RJZHwUxm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfjAuuAKkLYcelX/gI5cRQ4mHZhOjyriZI9S5EyMJ2J4FYNofJqSMIFMzDbsQMl8r2tXKaPbllI7H0NmWwx0RV9Wq3HwbNURmLBM9lN801DY8aiJLp06Ru2e1HJrYnzmdLS1GgNLc2ozrY7We1IJd5XZCEhwr2omAzT9Wv0G+JPIVDKJ64scxooTXEwWNUdqrfgdku3oZjQiCuPtz26KM5yX3FJ1pV7QugUXgNWAeJelSy8nAJKa+7V+e0fu6HzR+760I+d/qJhGEPHV12lXZPEkbhmDI26u55qLeCeFemtxyheSQ5Zj5hrX234aDG0OLMXUhDf9jbytwlU+PMlPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLblM55n1UkAzRDo5+c71aqqREfU4G5UnoZdtqBBjl8=;
 b=jvqCwusNeSiKDl+JySZAJlqTXs7epTE6oR0Z94IJN6pUryRJn37Jv6EurrZcvOSuzrC18VULtgeoSVYA9du18TYRQ1lt2KAA7wN6lvAG8KodlW2M6hJt4s8O+PAk0l1ti7IwPGNVtH2f654xzOZC8sCdbWxrDfqGcJhbID3rHZ90KC3qRrfCEPKCFy3YM/4SZvLtej9gUsTawRC5MJpgZNl3O5TEBMcPcHtoCJ0hmShL0gLxqM+aXdCvszv102LkZH8Nhd7XSJaj4rimQl/giNmR4VFgA97NC9nn3YyO2EbNKlX+jCg8LFNgfKt6rKdLgaRVWT6p/I5YXwJQyca1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLblM55n1UkAzRDo5+c71aqqREfU4G5UnoZdtqBBjl8=;
 b=RJZHwUxmRsNh59jvQuoOXmy7UeG5c+IJEcBKVxWq7S1dufkmtyQ37M9atgnDLcxUYcpOqV39lp+6Td3kwjJFFWLrjEJ3Ud/fjxm+t4DYjb8RjsdOJkkdLe9vXnitnUyb1fIa8LMCiKJK+jWIRuySzTtbsnorlx6329srK/I6CFg=
Received: from BL0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:91::36)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:48:56 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::21) by BL0PR05CA0026.outlook.office365.com
 (2603:10b6:208:91::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 18:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:48:55 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:48:51 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v4 1/5] selftests/resctrl: Rename variables and functions to generic names
Date: Mon, 10 Aug 2026 18:48:02 +0000
Message-ID: <20260810184806.1089507-2-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
References: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: ffad965a-fd39-4c08-c581-08def71007f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|7416014|376014|18002099003|22082099003|6133799003|11063799006|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	rUlrMJoYb5sZPkeJRxZpNw2NgcauFmH5LyB3Q/syrKEGEwV+MRaw46iwCtTzQrbkMSh7Kja0GWEXTzmSWKNFjNuwTF8uatdrrGW7+ZPu2fUdsaykYdxnL2rkGq47TPDyFu+oiQeHNC8nf37vEzLKutpobXlbSaGDygtHdVAj0tni236ywm4p9Dv4Yx0jSNh9GQLCO3ioUymOZ93RG8ad10Hb75xOeY666miaHfWiCFrcgme4lUagyMgRe8o0KO0cdh3Vg+zlKGrYsEZ/wkV8tL94bZUaN3yRTFa8kSx9EHU2Vj5s/n3Vor1EUp2pRejoGXaFKWisyPTxc9TR28HjA9kyXaaaCPGbSVClz03XEa8q2WPtBbJNRjy8CGYi5ZmV36MSegcvWjBfPT82Ni649y+3zTRhQi8uSOwsjBMBoUTkZrQaiEejb3G5FGK3DSg7gMzNzLC5qM08e6zMpliiZq4UVmamhD9ntcU6ljYjvfwZ0sbauNr3Ly2VHUd/Ft18/yDM5R7YSvP6LUQDz9vVRM7NiDPIiEvM43Cn1qvuGb62sIz9KS193m5U/h/fkm8xBZ9wh4iQvUt3bF/djhUQS9rF/np2S1iqeXeWmc0J4GqEYOlOk6AywLjv0EtzCRJW5LE2/nRV4BV6VOX2SqFUajNL7EsElVcrt58z3B5398rmW3ZuctUOkgw2A9K2J0fdfPQCyjKc2nYEgZFpLScHiQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EkmxVxh/NHvmRxYyaO7xZYuy/IRfZaWHLl194GVQv8BihbI+9DleInxTMym7FHqCoTjdPOUIFzVbHUO41eJM+1V+lmA7dJZTIg1b5Si3AzCBWfZsxXjvQF7yl76d8r08Cr9IqGL9z5pDZ4EHFzbcuZJZkfW/BYXL+1192jaknIUHwoj7udHpi4J1jTZtn7VwKLvgOrV/br0deRxhYAOeT1ALGqmOaK21cpY+KPwESkjM/WWH4BrfxAgWeKH7FKtKwaFSXNT+IpqHr5LhCopHard56kYvjj2XBiImu3PGp64f8h72//mKnNZjC6rhG54uJrY0vKd+WMrEgoDEioLuMft5JVXDiWLlxXjOaiQaVvMJ2fggENW2yK3kC+K2BcshfGdWs22X6Znd43WrbN/RzrIg/iptaIAeM+vXxHEDVZmcgJGBicd47vkctiWh4m+s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:48:55.8023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffad965a-fd39-4c08-c581-08def71007f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357

From: Babu Moger <babu.moger@amd.com>

For Intel, the memory controller is called Integrated Memory Controller
(IMC). For AMD, it is called Unified Memory Controller (UMC).

Rename the variables and functions from imc (Integrated Memory
Controller) to the generic mc (Memory Controller) in preparation for
the support of MBM and MBA tests on AMD.

No functional change intended.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Babu Moger <babu.moger@amd.com>
Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---

v3->v4:
    - Rebased onto v7.2-rc7. Reworked to match the upstream resctrl_val.c
      refactor that reads the memory bandwidth counters into a single
      read-event array.
    - Renamed the remaining Intel specific references missed in v3: the
      get_mem_bw_imc() helper, the imc_counter_config comments and the
      'Mem_BW' bandwidth label. (Reinette)

 tools/testing/selftests/resctrl/mba_test.c    |  26 +-
 tools/testing/selftests/resctrl/mbm_test.c    |  22 +-
 tools/testing/selftests/resctrl/resctrl.h     |   4 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 240 +++++++++---------
 4 files changed, 146 insertions(+), 146 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 39cee9898359..6c6c885eba5e 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -23,7 +23,7 @@ static int mba_init(const struct resctrl_test *test,
 {
 	int ret;
 
-	ret = initialize_read_mem_bw_imc();
+	ret = initialize_read_mem_bw_mc();
 	if (ret)
 		return ret;
 
@@ -73,7 +73,7 @@ static int mba_measure(const struct user_params *uparams,
 	return measure_read_mem_bw(uparams, param, bm_pid);
 }
 
-static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
+static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
 {
 	unsigned int allocation;
 	bool ret = false;
@@ -83,27 +83,27 @@ static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 	/* Memory bandwidth from 100% down to 10% */
 	for (allocation = 0; allocation < ALLOCATION_MAX / ALLOCATION_STEP;
 	     allocation++) {
-		unsigned long sum_bw_imc = 0, sum_bw_resc = 0;
-		long avg_bw_imc, avg_bw_resc;
+		unsigned long sum_bw_mc = 0, sum_bw_resc = 0;
+		long avg_bw_mc, avg_bw_resc;
 		int avg_diff_per;
 		float avg_diff;
 
 		for (runs = NUM_OF_RUNS * allocation;
 		     runs < NUM_OF_RUNS * allocation + NUM_OF_RUNS ; runs++) {
-			sum_bw_imc += bw_imc[runs];
+			sum_bw_mc += bw_mc[runs];
 			sum_bw_resc += bw_resc[runs];
 		}
 
-		avg_bw_imc = sum_bw_imc / NUM_OF_RUNS;
+		avg_bw_mc = sum_bw_mc / NUM_OF_RUNS;
 		avg_bw_resc = sum_bw_resc / NUM_OF_RUNS;
-		if (avg_bw_imc < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
+		if (avg_bw_mc < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
 			ksft_print_msg("Bandwidth below threshold (%d MiB). Dropping results from MBA schemata %u.\n",
 				       THROTTLE_THRESHOLD,
 				       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
 			continue;
 		}
 
-		avg_diff = (float)labs(avg_bw_resc - avg_bw_imc) / avg_bw_imc;
+		avg_diff = (float)labs(avg_bw_resc - avg_bw_mc) / avg_bw_mc;
 		avg_diff_per = (int)(avg_diff * 100);
 
 		ksft_print_msg("%s Check MBA diff within %d%% for schemata %u\n",
@@ -113,7 +113,7 @@ static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 			       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
 
 		ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
-		ksft_print_msg("avg_bw_imc: %lu\n", avg_bw_imc);
+		ksft_print_msg("avg_bw_mc: %lu\n", avg_bw_mc);
 		ksft_print_msg("avg_bw_resc: %lu\n", avg_bw_resc);
 		if (avg_diff_per > MAX_DIFF_PERCENT)
 			ret = true;
@@ -130,7 +130,7 @@ static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 static int check_results(void)
 {
 	unsigned long bw_resc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
-	unsigned long bw_imc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
+	unsigned long bw_mc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
 	char *token_array[8], output[] = RESULT_FILE_NAME, temp[512];
 	int runs;
 	FILE *fp;
@@ -152,8 +152,8 @@ static int check_results(void)
 			token = strtok(NULL, ":\t");
 		}
 
-		/* Field 3 is perf imc value */
-		bw_imc[runs] = strtoul(token_array[3], NULL, 0);
+		/* Field 3 is perf mc value */
+		bw_mc[runs] = strtoul(token_array[3], NULL, 0);
 		/* Field 5 is resctrl value */
 		bw_resc[runs] = strtoul(token_array[5], NULL, 0);
 		runs++;
@@ -161,7 +161,7 @@ static int check_results(void)
 
 	fclose(fp);
 
-	return show_mba_info(bw_imc, bw_resc);
+	return show_mba_info(bw_mc, bw_resc);
 }
 
 static void mba_test_cleanup(void)
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 6dbbc3b76003..d89f71c58335 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -15,21 +15,21 @@
 #define NUM_OF_RUNS		5
 
 static int
-show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, size_t span)
+show_bw_info(unsigned long *bw_mc, unsigned long *bw_resc, size_t span)
 {
-	unsigned long sum_bw_imc = 0, sum_bw_resc = 0;
-	long avg_bw_imc = 0, avg_bw_resc = 0;
+	unsigned long sum_bw_mc = 0, sum_bw_resc = 0;
+	long avg_bw_mc = 0, avg_bw_resc = 0;
 	int runs, ret, avg_diff_per;
 	float avg_diff = 0;
 
 	for (runs = 0; runs < NUM_OF_RUNS; runs++) {
-		sum_bw_imc += bw_imc[runs];
+		sum_bw_mc += bw_mc[runs];
 		sum_bw_resc += bw_resc[runs];
 	}
 
-	avg_bw_imc = sum_bw_imc / NUM_OF_RUNS;
+	avg_bw_mc = sum_bw_mc / NUM_OF_RUNS;
 	avg_bw_resc = sum_bw_resc / NUM_OF_RUNS;
-	avg_diff = (float)labs(avg_bw_resc - avg_bw_imc) / avg_bw_imc;
+	avg_diff = (float)labs(avg_bw_resc - avg_bw_mc) / avg_bw_mc;
 	avg_diff_per = (int)(avg_diff * 100);
 
 	ret = avg_diff_per > MAX_DIFF_PERCENT;
@@ -38,7 +38,7 @@ show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, size_t span)
 	ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
 	if (span)
 		ksft_print_msg("Span (MB): %zu\n", span / MB);
-	ksft_print_msg("avg_bw_imc: %lu\n", avg_bw_imc);
+	ksft_print_msg("avg_bw_mc: %lu\n", avg_bw_mc);
 	ksft_print_msg("avg_bw_resc: %lu\n", avg_bw_resc);
 
 	return ret;
@@ -46,7 +46,7 @@ show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, size_t span)
 
 static int check_results(size_t span)
 {
-	unsigned long bw_imc[NUM_OF_RUNS], bw_resc[NUM_OF_RUNS];
+	unsigned long bw_mc[NUM_OF_RUNS], bw_resc[NUM_OF_RUNS];
 	char temp[1024], *token_array[8];
 	char output[] = RESULT_FILE_NAME;
 	int runs, ret;
@@ -72,11 +72,11 @@ static int check_results(size_t span)
 		}
 
 		bw_resc[runs] = strtoul(token_array[5], NULL, 0);
-		bw_imc[runs] = strtoul(token_array[3], NULL, 0);
+		bw_mc[runs] = strtoul(token_array[3], NULL, 0);
 		runs++;
 	}
 
-	ret = show_bw_info(bw_imc, bw_resc, span);
+	ret = show_bw_info(bw_mc, bw_resc, span);
 
 	fclose(fp);
 
@@ -89,7 +89,7 @@ static int mbm_init(const struct resctrl_test *test,
 {
 	int ret;
 
-	ret = initialize_read_mem_bw_imc();
+	ret = initialize_read_mem_bw_mc();
 	if (ret)
 		return ret;
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..a2f364a9af94 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -49,7 +49,7 @@
 
 /*
  * Memory bandwidth (in MiB) below which the bandwidth comparisons
- * between iMC and resctrl are considered unreliable. For example RAS
+ * between MC and resctrl are considered unreliable. For example RAS
  * features or memory performance features that generate memory traffic
  * may drive accesses that are counted differently by performance counters
  * and MBM respectively, for instance generating "overhead" traffic which
@@ -182,7 +182,7 @@ unsigned char *alloc_buffer(size_t buf_size, bool memflush);
 void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
-int initialize_read_mem_bw_imc(void);
+int initialize_read_mem_bw_mc(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index f20d2194c35f..bd413d2d5420 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -14,7 +14,7 @@
 #define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
-#define MAX_IMCS		40
+#define MAX_MCS			40
 #define MAX_TOKENS		5
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
@@ -27,7 +27,7 @@ struct membw_read_format {
 	__u64 id;            /* if PERF_FORMAT_ID */
 };
 
-struct imc_counter_config {
+struct mc_counter_config {
 	__u32 type;
 	__u64 event;
 	__u64 umask;
@@ -36,42 +36,42 @@ struct imc_counter_config {
 };
 
 static char mbm_total_path[1024];
-static int imcs;
-static struct imc_counter_config imc_counters_config[MAX_IMCS];
+static int mcs;
+static struct mc_counter_config mc_counters_config[MAX_MCS];
 static const struct resctrl_test *current_test;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
 {
-	memset(&imc_counters_config[i].pe, 0,
+	memset(&mc_counters_config[i].pe, 0,
 	       sizeof(struct perf_event_attr));
-	imc_counters_config[i].pe.type = imc_counters_config[i].type;
-	imc_counters_config[i].pe.size = sizeof(struct perf_event_attr);
-	imc_counters_config[i].pe.disabled = 1;
-	imc_counters_config[i].pe.inherit = 1;
-	imc_counters_config[i].pe.exclude_guest = 0;
-	imc_counters_config[i].pe.config =
-		imc_counters_config[i].umask << 8 |
-		imc_counters_config[i].event;
-	imc_counters_config[i].pe.sample_type = PERF_SAMPLE_IDENTIFIER;
-	imc_counters_config[i].pe.read_format =
+	mc_counters_config[i].pe.type = mc_counters_config[i].type;
+	mc_counters_config[i].pe.size = sizeof(struct perf_event_attr);
+	mc_counters_config[i].pe.disabled = 1;
+	mc_counters_config[i].pe.inherit = 1;
+	mc_counters_config[i].pe.exclude_guest = 0;
+	mc_counters_config[i].pe.config =
+		mc_counters_config[i].umask << 8 |
+		mc_counters_config[i].event;
+	mc_counters_config[i].pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	mc_counters_config[i].pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
 static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(int i)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_RESET, 0);
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(mc_counters_config[i].fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(mc_counters_config[i].fd, PERF_EVENT_IOC_ENABLE, 0);
 }
 
 static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(mc_counters_config[i].fd, PERF_EVENT_IOC_DISABLE, 0);
 }
 
 /*
  * get_read_event_and_umask:	Parse config into event and umask
  * @cas_count_cfg:	Config
- * @count:		iMC number
+ * @count:		MC number
  */
 static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 {
@@ -87,21 +87,21 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
+			mc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
+			mc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
 	}
 }
 
 static int open_perf_read_event(int i, int cpu_no)
 {
-	imc_counters_config[i].fd =
-		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
+	mc_counters_config[i].fd =
+		perf_event_open(&mc_counters_config[i].pe, -1, cpu_no, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counters_config[i].fd == -1) {
+	if (mc_counters_config[i].fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counters_config[i].pe.config);
+			mc_counters_config[i].pe.config);
 
 		return -1;
 	}
@@ -109,10 +109,10 @@ static int open_perf_read_event(int i, int cpu_no)
 	return 0;
 }
 
-static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
+static int parse_mc_read_bw_events(char *mc_dir, unsigned int type,
 				    unsigned int *count)
 {
-	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
+	char mc_events_dir[PATH_MAX], mc_counter_cfg[PATH_MAX];
 	unsigned int orig_count = *count;
 	char cas_count_cfg[1024];
 	struct dirent *ep;
@@ -122,14 +122,14 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 	FILE *fp;
 	DIR *dp;
 
-	path_len = snprintf(imc_events_dir, sizeof(imc_events_dir), "%sevents",
-			    imc_dir);
-	if (path_len >= sizeof(imc_events_dir)) {
-		ksft_print_msg("Unable to create path to %sevents\n", imc_dir);
+	path_len = snprintf(mc_events_dir, sizeof(mc_events_dir), "%sevents",
+			    mc_dir);
+	if (path_len >= sizeof(mc_events_dir)) {
+		ksft_print_msg("Unable to create path to %sevents\n", mc_dir);
 		return -1;
 	}
 
-	dp = opendir(imc_events_dir);
+	dp = opendir(mc_events_dir);
 	if (!dp) {
 		ksft_perror("Unable to open PMU events directory");
 		return -1;
@@ -145,36 +145,36 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 		    strchr(ep->d_name, '.'))
 			continue;
 
-		path_len = snprintf(imc_counter_cfg, sizeof(imc_counter_cfg),
-				    "%s/%s", imc_events_dir, ep->d_name);
-		if (path_len >= sizeof(imc_counter_cfg)) {
+		path_len = snprintf(mc_counter_cfg, sizeof(mc_counter_cfg),
+				    "%s/%s", mc_events_dir, ep->d_name);
+		if (path_len >= sizeof(mc_counter_cfg)) {
 			ksft_print_msg("Unable to create path to %s/%s\n",
-				       imc_events_dir, ep->d_name);
+				       mc_events_dir, ep->d_name);
 			goto out_close;
 		}
-		fp = fopen(imc_counter_cfg, "r");
+		fp = fopen(mc_counter_cfg, "r");
 		if (!fp) {
-			ksft_perror("Failed to open iMC config file");
+			ksft_perror("Failed to open MC config file");
 			goto out_close;
 		}
 		num_cfg = fscanf(fp, "%1023s", cas_count_cfg);
 		fclose(fp);
 		if (num_cfg <= 0) {
-			ksft_perror("Could not get iMC cas count read");
+			ksft_perror("Could not get MC cas count read");
 			goto out_close;
 		}
-		if (*count >= MAX_IMCS) {
-			ksft_print_msg("Maximum iMC count exceeded\n");
+		if (*count >= MAX_MCS) {
+			ksft_print_msg("Maximum MC count exceeded\n");
 			goto out_close;
 		}
 
-		imc_counters_config[*count].type = type;
+		mc_counters_config[*count].type = type;
 		get_read_event_and_umask(cas_count_cfg, *count);
 		/* Do not fail after incrementing *count. */
 		*count += 1;
 	}
 	if (*count == orig_count) {
-		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
+		ksft_print_msg("Unable to find events in %s\n", mc_events_dir);
 		goto out_close;
 	}
 	ret = 0;
@@ -183,36 +183,36 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 	return ret;
 }
 
-/* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, unsigned int *count)
+/* Get type and config of an MC counter's read event. */
+static int read_from_mc_dir(char *mc_dir, unsigned int *count)
 {
-	char imc_counter_type[PATH_MAX];
+	char mc_counter_type[PATH_MAX];
 	unsigned int type;
 	int path_len;
 	FILE *fp;
 	int ret;
 
-	/* Get type of iMC counter */
-	path_len = snprintf(imc_counter_type, sizeof(imc_counter_type),
-			    "%s%s", imc_dir, "type");
-	if (path_len >= sizeof(imc_counter_type)) {
+	/* Get type of MC counter */
+	path_len = snprintf(mc_counter_type, sizeof(mc_counter_type),
+			    "%s%s", mc_dir, "type");
+	if (path_len >= sizeof(mc_counter_type)) {
 		ksft_print_msg("Unable to create path to %s%s\n",
-			       imc_dir, "type");
+			       mc_dir, "type");
 		return -1;
 	}
-	fp = fopen(imc_counter_type, "r");
+	fp = fopen(mc_counter_type, "r");
 	if (!fp) {
-		ksft_perror("Failed to open iMC counter type file");
+		ksft_perror("Failed to open MC counter type file");
 
 		return -1;
 	}
 	ret = fscanf(fp, "%u", &type);
 	fclose(fp);
 	if (ret <= 0) {
-		ksft_perror("Could not get iMC type");
+		ksft_perror("Could not get MC type");
 		return -1;
 	}
-	ret = parse_imc_read_bw_events(imc_dir, type, count);
+	ret = parse_mc_read_bw_events(mc_dir, type, count);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
 		return ret;
@@ -222,10 +222,10 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
 }
 
 /*
- * A system can have 'n' number of iMC (Integrated Memory Controller)
+ * A system can have 'n' number of MC (Memory Controller)
  * counters, get that 'n'. Discover the properties of the available
  * counters in support of needed performance measurement via perf.
- * For each iMC counter get it's type and config. Also obtain each
+ * For each MC counter get it's type and config. Also obtain each
  * counter's event and umask for the memory read events that will be
  * measured.
  *
@@ -233,9 +233,9 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
  *
  * Return: >= 0 on success. < 0 on failure.
  */
-static int num_of_imcs(void)
+static int num_of_mem_controllers(void)
 {
-	char imc_dir[512], *temp;
+	char mc_dir[512], *temp;
 	unsigned int count = 0;
 	struct dirent *ep;
 	int ret;
@@ -249,7 +249,7 @@ static int num_of_imcs(void)
 				continue;
 
 			/*
-			 * imc counters are named as "uncore_imc_<n>", hence
+			 * mc counters are named as "uncore_imc_<n>", hence
 			 * increment the pointer to point to <n>. Note that
 			 * sizeof(UNCORE_IMC) would count for null character as
 			 * well and hence the last underscore character in
@@ -263,9 +263,9 @@ static int num_of_imcs(void)
 			 * first character is a numerical digit or not.
 			 */
 			if (temp[0] >= '0' && temp[0] <= '9') {
-				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
+				sprintf(mc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir, &count);
+				ret = read_from_mc_dir(mc_dir, &count);
 				if (ret) {
 					closedir(dp);
 
@@ -275,7 +275,7 @@ static int num_of_imcs(void)
 		}
 		closedir(dp);
 		if (count == 0) {
-			ksft_print_msg("Unable to find iMC counters\n");
+			ksft_print_msg("Unable to find MC counters\n");
 
 			return -1;
 		}
@@ -288,46 +288,46 @@ static int num_of_imcs(void)
 	return count;
 }
 
-int initialize_read_mem_bw_imc(void)
+int initialize_read_mem_bw_mc(void)
 {
-	int imc;
+	int mc;
 
-	imcs = num_of_imcs();
-	if (imcs <= 0)
-		return imcs;
+	mcs = num_of_mem_controllers();
+	if (mcs <= 0)
+		return mcs;
 
-	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+	/* Initialize perf_event_attr structures for all MC's */
+	for (mc = 0; mc < mcs; mc++)
+		read_mem_bw_initialize_perf_event_attr(mc);
 
 	return 0;
 }
 
-static void perf_close_imc_read_mem_bw(void)
+static void perf_close_mc_read_mem_bw(void)
 {
 	int mc;
 
-	for (mc = 0; mc < imcs; mc++) {
-		if (imc_counters_config[mc].fd != -1)
-			close(imc_counters_config[mc].fd);
+	for (mc = 0; mc < mcs; mc++) {
+		if (mc_counters_config[mc].fd != -1)
+			close(mc_counters_config[mc].fd);
 	}
 }
 
 /*
- * perf_open_imc_read_mem_bw - Open perf fds for IMCs
+ * perf_open_mc_read_mem_bw - Open perf fds for MCs
  * @cpu_no: CPU number that the benchmark PID is bound to
  *
  * Return: = 0 on success. < 0 on failure.
  */
-static int perf_open_imc_read_mem_bw(int cpu_no)
+static int perf_open_mc_read_mem_bw(int cpu_no)
 {
-	int imc, ret;
+	int mc, ret;
 
-	for (imc = 0; imc < imcs; imc++)
-		imc_counters_config[imc].fd = -1;
+	for (mc = 0; mc < mcs; mc++)
+		mc_counters_config[mc].fd = -1;
 
-	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(imc, cpu_no);
+	for (mc = 0; mc < mcs; mc++) {
+		ret = open_perf_read_event(mc, cpu_no);
 		if (ret)
 			goto close_fds;
 	}
@@ -335,56 +335,56 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
 	return 0;
 
 close_fds:
-	perf_close_imc_read_mem_bw();
+	perf_close_mc_read_mem_bw();
 	return -1;
 }
 
 /*
- * do_imc_read_mem_bw_test - Perform memory bandwidth test
+ * do_mc_read_mem_bw_test - Perform memory bandwidth test
  *
  * Runs memory bandwidth test over one second period. Also, handles starting
- * and stopping of the IMC perf counters around the test.
+ * and stopping of the MC perf counters around the test.
  */
-static void do_imc_read_mem_bw_test(void)
+static void do_mc_read_mem_bw_test(void)
 {
-	int imc;
+	int mc;
 
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc);
+	for (mc = 0; mc < mcs; mc++)
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc);
+	for (mc = 0; mc < mcs; mc++)
+		read_mem_bw_ioctl_perf_event_ioc_disable(mc);
 }
 
 /*
- * get_read_mem_bw_imc - Memory read bandwidth as reported by iMC counters
+ * get_read_mem_bw_mc - Memory read bandwidth as reported by MC counters
  *
  * Memory read bandwidth utilized by a process on a socket can be calculated
- * using iMC counters' read events. Perf events are used to read these
+ * using MC counters' read events. Perf events are used to read these
  * counters.
  *
  * Return: = 0 on success. < 0 on failure.
  */
-static int get_read_mem_bw_imc(float *bw_imc)
+static int get_read_mem_bw_mc(float *bw_mc)
 {
 	float reads = 0, of_mul_read = 1;
-	int imc;
+	int mc;
 
 	/*
-	 * Log read event values from all iMC counters into
-	 * struct imc_counter_config.
+	 * Log read event values from all MC counters into
+	 * struct mc_counter_config.
 	 * Take overflow into consideration before calculating total bandwidth.
 	 */
-	for (imc = 0; imc < imcs; imc++) {
+	for (mc = 0; mc < mcs; mc++) {
 		struct membw_read_format measurement;
-		struct imc_counter_config *r =
-			&imc_counters_config[imc];
+		struct mc_counter_config *r =
+			&mc_counters_config[mc];
 
 		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
-			ksft_perror("Couldn't get read bandwidth through iMC");
+			ksft_perror("Couldn't get read bandwidth through MC");
 			return -1;
 		}
 
@@ -398,7 +398,7 @@ static int get_read_mem_bw_imc(float *bw_imc)
 		reads += measurement.value * of_mul_read * SCALE;
 	}
 
-	*bw_imc = reads;
+	*bw_mc = reads;
 	return 0;
 }
 
@@ -502,19 +502,19 @@ void signal_handler_unregister(void)
  * print_results_bw:	the memory bandwidth results are stored in a file
  * @filename:		file that stores the results
  * @bm_pid:		child pid that runs benchmark
- * @bw_imc:		perf imc counter value
+ * @bw_mc:		perf mc counter value
  * @bw_resc:		memory bandwidth value
  *
  * Return:		0 on success, < 0 on error.
  */
-static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
+static int print_results_bw(char *filename, pid_t bm_pid, float bw_mc,
 			    unsigned long bw_resc)
 {
-	unsigned long diff = fabs(bw_imc - bw_resc);
+	unsigned long diff = fabs(bw_mc - bw_resc);
 	FILE *fp;
 
 	if (strcmp(filename, "stdio") == 0 || strcmp(filename, "stderr") == 0) {
-		printf("Pid: %d \t Mem_BW_iMC: %f \t ", (int)bm_pid, bw_imc);
+		printf("Pid: %d \t Mem_BW_MC: %f \t ", (int)bm_pid, bw_mc);
 		printf("Mem_BW_resc: %lu \t Difference: %lu\n", bw_resc, diff);
 	} else {
 		fp = fopen(filename, "a");
@@ -523,8 +523,8 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
 
 			return -1;
 		}
-		if (fprintf(fp, "Pid: %d \t Mem_BW_iMC: %f \t Mem_BW_resc: %lu \t Difference: %lu\n",
-			    (int)bm_pid, bw_imc, bw_resc, diff) <= 0) {
+		if (fprintf(fp, "Pid: %d \t Mem_BW_MC: %f \t Mem_BW_resc: %lu \t Difference: %lu\n",
+			    (int)bm_pid, bw_mc, bw_resc, diff) <= 0) {
 			ksft_print_msg("Could not log results\n");
 			fclose(fp);
 
@@ -543,7 +543,7 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
  * @bm_pid:		PID that runs the benchmark
  *
  * Measure memory bandwidth from resctrl and from another source which is
- * perf imc value or could be something else if perf imc event is not
+ * perf mc value or could be something else if perf mc event is not
  * available. Compare the two values to validate resctrl value. It takes
  * 1 sec to measure the data.
  * resctrl does not distinguish between read and write operations so
@@ -554,42 +554,42 @@ int measure_read_mem_bw(const struct user_params *uparams,
 {
 	unsigned long bw_resc, bw_resc_start, bw_resc_end;
 	FILE *mem_bw_fp;
-	float bw_imc;
+	float bw_mc;
 	int ret;
 
 	mem_bw_fp = open_mem_bw_resctrl(mbm_total_path);
 	if (!mem_bw_fp)
 		return -1;
 
-	ret = perf_open_imc_read_mem_bw(uparams->cpu);
+	ret = perf_open_mc_read_mem_bw(uparams->cpu);
 	if (ret < 0)
 		goto close_fp;
 
 	ret = get_mem_bw_resctrl(mem_bw_fp, &bw_resc_start);
 	if (ret < 0)
-		goto close_imc;
+		goto close_mc;
 
 	rewind(mem_bw_fp);
 
-	do_imc_read_mem_bw_test();
+	do_mc_read_mem_bw_test();
 
 	ret = get_mem_bw_resctrl(mem_bw_fp, &bw_resc_end);
 	if (ret < 0)
-		goto close_imc;
+		goto close_mc;
 
-	ret = get_read_mem_bw_imc(&bw_imc);
+	ret = get_read_mem_bw_mc(&bw_mc);
 	if (ret < 0)
-		goto close_imc;
+		goto close_mc;
 
-	perf_close_imc_read_mem_bw();
+	perf_close_mc_read_mem_bw();
 	fclose(mem_bw_fp);
 
 	bw_resc = (bw_resc_end - bw_resc_start) / MB;
 
-	return print_results_bw(param->filename, bm_pid, bw_imc, bw_resc);
+	return print_results_bw(param->filename, bm_pid, bw_mc, bw_resc);
 
-close_imc:
-	perf_close_imc_read_mem_bw();
+close_mc:
+	perf_close_mc_read_mem_bw();
 close_fp:
 	fclose(mem_bw_fp);
 	return ret;
-- 
2.43.0

