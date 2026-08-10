Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E24398ED;
	Mon, 10 Aug 2026 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387796; cv=fail; b=MEy5/UR05gCLbnXj8Jdax7LWNiSEP8yajfhHXWjGppgEWhVSIg+Z+a6v7P7OYZrZeAjKdpLOxglXH1+WkxSHsHwUBBhqXMIm1ye+lau1UIMBlORDt2my4tsW74TnT8grK4H9lsA0jzCauCMG4GQ7FSBA1Xb/3hitqu+goFpLGfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387796; c=relaxed/simple;
	bh=bHqN1WmGbNdhsl9pf12V7NFYid1Sup6dt4LQEUBr+PU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ho1RV5vhe9wk8y5jRKwWETkLtZB4TM/phQX3mFecEVx/7/xF+iKJNQJyfnY+EUoV0zro+jR9ceih7iMYxNq2FJX02zpnF4wSILEvWX1fNtTapNoZHnlOwtojyZtGZBScMVh3N6is55eMcnlUxdVaQoRJKq5d8tLl2GOZeQ/HSjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=clQE4K4O; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="clQE4K4O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6ch9v46zOpBGSqG1fL8YgKunaySETwhYWWvll+Ocp8j6HmAerkk71HQO2jJWFTYpOQb8e7wCAAtGEg7N5ppwKkJ6O6HDisQ7WEeJRVSYuJuI07IfvFpY6m8GvQ3Rpxk0rOZ4cqQjeMsQ+mfMrzSe6trqX73CDFtd8dRvzrWYqO/0sZzpBl9MNsDwNU+Gl1y4+HiYvcuJ48jheyhgmrjGFbdGFjLJs21ZMXWRjdigU/LUvOdb87eb12FfGZjx6ikvmlUcbuFjq0Nb/qFhSk/bKSWlb/gwvw/14PZfBymQLqvhfr82PGqguQpc2QZ5dFvFNBVS4OaNFIFlIePf7xldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ITm9QWWJavwWARp/ZvCKC6lTHr/CQCP7b26o01QhSk=;
 b=AOKpEOAN7U7ZTEHmiHXWu/+yEog2uUpu01NDiLZFlvdjGy69A6JGbZpFcBgX6fMiXfgVpVrZIql3xeGLq0E3phceZ/ve8MeHg8OhgOEUmxwmGAWh6H8uqDsJB4+Irfv4Fr7uD1NkYtsjYzi+IGzFCa928iFwdz7E6o9j+xbxbYHIVIN6d2LjZPN5HY0v5Qqix3ITAZvBye3K39Xk4C8yDL+TQCvD0MQuZM1hVFzZqnpLVEwIXe81s91K2S5pkH07KrSG5IdRnxkfx2ZXsDTO27g65JS+wCky1zYuE+npLkwpNscNzapyPcP2Jpqj2ntmfTLu5S5nCrs8lYTFwh3/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ITm9QWWJavwWARp/ZvCKC6lTHr/CQCP7b26o01QhSk=;
 b=clQE4K4O9gEfmQn10gGWUTi5pC/GJy1VIr5HKTdw7Gv/++pFlhT0ZO9QQ0dT72CNEQDY0yt90dV+CeEuujFQBRRCMPCryJacO8rmr5Yl2r58VY1wqlXIqh1H1iSiv5l+F+VOa9IktxcAv0kxswbw2OuPHLeW5uCUsi4p6+3nJpg=
Received: from BN9PR03CA0973.namprd03.prod.outlook.com (2603:10b6:408:109::18)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:49:46 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::24) by BN9PR03CA0973.outlook.office365.com
 (2603:10b6:408:109::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:49:46 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:49:42 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v4 4/5] selftests/resctrl: Use bandwidth values for AMD MBA schemata
Date: Mon, 10 Aug 2026 18:48:05 +0000
Message-ID: <20260810184806.1089507-5-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de836ab-389b-4268-8e7c-08def7102638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6RLwRfmTuV6JgMSnLSCbyl1MvDSN6khDSYmncAkk0mXn2aoijKjQpFQsYRrbbhVKJnSSOQvT9Wk9T20qqbLhVfV464l7owGrIFBrO1ugRijt2b+8S3BhfkGJ7Vj+fzAeNJDRwqPUHwpBsv0sE3uNTmTB3GM0sTbz6WyENOGjghFzHcgUJNx8EuroudJ1fSQGbRH0h2rQh+1uQZAFkBxWtJ+697xRwPVTs/5hCWAhMdqFTJTHNhR8sbcdtqwAbVKAEUJY6JVhSdhiFPOn1zsc6Iwu17XXbuW+5zmQWcc1WvyA4UomGCegJt+tgpmumk6aYxdr9rUS3Rdihhh6u14QzRr5gxAU2MDwhTRJ9jF05MI/4iNRH51U3QFqn5Im8IZDZKJGg4xj78LHp5+LEWH78hX01/HBcy1UqxtmkWVUS8T7fXPWwaDGxzbKqaVqqFtYSTlKwhqlSMrhak+uADPTADD9suA+qM6IrXXY1RYOyURGWbncSgNWfLScIGL1M1PdqEz2RrgGHP6e+f76xFdpFxyiNMCMpwghPY7XbRnlqVueJ1GzxXr31gcnURj310CKq/ZL2nl99CVc6TxKe5+if6WpK0Zcq7rW37OaX3tGqQHX247Fx/mZyLpKRrW+s7RXoHqD0n2LnYl6ob0sHFak/OBbbDYZFmN214OKqEMZn/KMX66oyBIDYT5jSuT8v/9E7x94xcd4HazEd3Ze/szG4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7QXO+tpBVgCD4H5/8FQ9CkyE4JWszoNt0J8oQMmAz/FKnUaRmijiZ5n07VwpHPnZPFLbeLgb1WBfmGupU/OXDaEEn2qlgnZxspUXFjGOHWazjM6yoIXKGKbpL+dPBj9EW7ClDFHviFKRmEXdS7966zi8cmcPu/a4oL8J76TMGd6WS5vh4fJA/Vmx1eptmTeiVduCpt/KaVEnX5SKPqb2QnQGA7yPIbS0t8gYRJhvf8ZUzEzigQhkLUA1f5fLD4/vAD4XahST5zpx22bPxXaTGlzd3itFj0FKhGj6l2SfY/4t07PpGrtko/JBXlIBVtHHpGtlDvncL4tRv5qTNEBJOhjo4D7bor9TP6PMFBwk09dbPuORJw5STBJur2kzuqudcET0T/91G+duI3KNtK9AiMTqYXcXQvdxWJZL9ppoFgZWLRiBngRbu6s5TZPTquTJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:49:46.5532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de836ab-389b-4268-8e7c-08def7102638
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666

Intel MBA (Memory Bandwidth Allocation) throttles memory bandwidth using
a percentage, so the MBA test sweeps the schemata from 10% to 100% in
steps of 10%. AMD MBA instead uses an absolute memory bandwidth value.

Sweep the AMD MBA schemata from 4 GB/s to 40 GB/s in steps of 4 GB/s.
The hardware represents these in units of 1/8 GB/s, so the test writes
32, 64, ... up to 320. The number of allocations swept (10), and hence
the number of measurements, stays the same as Intel.

Select the minimum, maximum and step of the sweep based on the vendor.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---

 tools/testing/selftests/resctrl/mba_test.c | 79 ++++++++++++++++++----
 1 file changed, 66 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 6c6c885eba5e..9fcb9992c529 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -13,10 +13,51 @@
 #define RESULT_FILE_NAME	"result_mba"
 #define NUM_OF_RUNS		5
 #define MAX_DIFF_PERCENT	15
+
+/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
 #define ALLOCATION_MAX		100
 #define ALLOCATION_MIN		10
 #define ALLOCATION_STEP		10
 
+/*
+ * AMD MBA is not a percentage but an absolute memory bandwidth value. The
+ * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
+ * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
+ * 8 GB/s -> 64, ... 40 GB/s -> 320).
+ */
+#define AMD_ALLOCATION_MAX	320
+#define AMD_ALLOCATION_MIN	32
+#define AMD_ALLOCATION_STEP	32
+
+/* Number of MBA schemata allocations to sweep (same for both vendors). */
+#define NUM_OF_ALLOCS		(ALLOCATION_MAX / ALLOCATION_STEP)
+
+/*
+ * The fixed-size result arrays in check_results() and the aggregation loop in
+ * show_mba_info() are sized and driven by NUM_OF_ALLOCS, so each vendor's sweep
+ * must produce exactly NUM_OF_ALLOCS allocations. Enforce this at build time so
+ * that changing a vendor's min/max/step can never overflow those arrays.
+ */
+_Static_assert((ALLOCATION_MAX - ALLOCATION_MIN) / ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
+	       "Intel MBA sweep must yield NUM_OF_ALLOCS allocations");
+_Static_assert((AMD_ALLOCATION_MAX - AMD_ALLOCATION_MIN) / AMD_ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
+	       "AMD MBA sweep must yield NUM_OF_ALLOCS allocations");
+
+static unsigned int mba_alloc_min(void)
+{
+	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MIN : ALLOCATION_MIN;
+}
+
+static unsigned int mba_alloc_max(void)
+{
+	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MAX : ALLOCATION_MAX;
+}
+
+static unsigned int mba_alloc_step(void)
+{
+	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_STEP : ALLOCATION_STEP;
+}
+
 static int mba_init(const struct resctrl_test *test,
 		    const struct user_params *uparams,
 		    const struct resctrl_val_param *param, int domain_id)
@@ -33,15 +74,17 @@ static int mba_init(const struct resctrl_test *test,
 }
 
 /*
- * Change schemata percentage from 100 to 10%. Write schemata to specified
- * con_mon grp, mon_grp in resctrl FS.
+ * Sweep the MBA schemata from the minimum to the maximum allocation. On
+ * Intel the allocation is a percentage (10% .. 100%); on AMD it is an
+ * absolute memory bandwidth value (4 GB/s .. 40 GB/s). Write schemata to
+ * the specified con_mon grp, mon_grp in resctrl FS.
  * For each allocation, run 5 times in order to get average values.
  */
 static int mba_setup(const struct resctrl_test *test,
 		     const struct user_params *uparams,
 		     struct resctrl_val_param *p)
 {
-	static unsigned int allocation = ALLOCATION_MIN;
+	static unsigned int allocation;
 	static int runs_per_allocation;
 	char allocation_str[64];
 	int ret;
@@ -53,16 +96,20 @@ static int mba_setup(const struct resctrl_test *test,
 	if (runs_per_allocation++ != 0)
 		return 0;
 
-	if (allocation > ALLOCATION_MAX)
+	/* Set the initial allocation once the vendor is known. */
+	if (allocation == 0)
+		allocation = mba_alloc_min();
+
+	if (allocation > mba_alloc_max())
 		return END_OF_TESTS;
 
-	sprintf(allocation_str, "%d", allocation);
+	sprintf(allocation_str, "%u", allocation);
 
 	ret = write_schemata(p->ctrlgrp, allocation_str, uparams->cpu, test->resource);
 	if (ret < 0)
 		return ret;
 
-	allocation += ALLOCATION_STEP;
+	allocation += mba_alloc_step();
 
 	return 0;
 }
@@ -75,14 +122,15 @@ static int mba_measure(const struct user_params *uparams,
 
 static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
 {
+	unsigned int alloc_min = mba_alloc_min();
+	unsigned int alloc_step = mba_alloc_step();
 	unsigned int allocation;
 	bool ret = false;
 	int runs;
 
 	ksft_print_msg("Results are displayed in (MB)\n");
-	/* Memory bandwidth from 100% down to 10% */
-	for (allocation = 0; allocation < ALLOCATION_MAX / ALLOCATION_STEP;
-	     allocation++) {
+	/* Memory bandwidth for each of the swept MBA allocations */
+	for (allocation = 0; allocation < NUM_OF_ALLOCS; allocation++) {
 		unsigned long sum_bw_mc = 0, sum_bw_resc = 0;
 		long avg_bw_mc, avg_bw_resc;
 		int avg_diff_per;
@@ -99,7 +147,7 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
 		if (avg_bw_mc < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
 			ksft_print_msg("Bandwidth below threshold (%d MiB). Dropping results from MBA schemata %u.\n",
 				       THROTTLE_THRESHOLD,
-				       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
+				       alloc_min + alloc_step * allocation);
 			continue;
 		}
 
@@ -110,7 +158,7 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
 			       avg_diff_per > MAX_DIFF_PERCENT ?
 			       "Fail:" : "Pass:",
 			       MAX_DIFF_PERCENT,
-			       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
+			       alloc_min + alloc_step * allocation);
 
 		ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
 		ksft_print_msg("avg_bw_mc: %lu\n", avg_bw_mc);
@@ -129,8 +177,8 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
 
 static int check_results(void)
 {
-	unsigned long bw_resc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
-	unsigned long bw_mc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
+	unsigned long bw_resc[NUM_OF_RUNS * NUM_OF_ALLOCS];
+	unsigned long bw_mc[NUM_OF_RUNS * NUM_OF_ALLOCS];
 	char *token_array[8], output[] = RESULT_FILE_NAME, temp[512];
 	int runs;
 	FILE *fp;
@@ -147,6 +195,11 @@ static int check_results(void)
 		char *token = strtok(temp, ":\t");
 		int fields = 0;
 
+		if (runs >= NUM_OF_RUNS * NUM_OF_ALLOCS) {
+			ksft_print_msg("Got more results than expected\n");
+			break;
+		}
+
 		while (token) {
 			token_array[fields++] = token;
 			token = strtok(NULL, ":\t");
-- 
2.43.0

