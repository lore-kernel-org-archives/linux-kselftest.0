Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675618;
	b=TSJGWL0njEL1s7pYezuo3BBat3UE0v+PQ716AiBrQJglhB3a5O3k+iMH1YYrKr3nPa9Q
	 +2abEV6FczHi6toZ3q0Zv/pGCSlPIF8V4OPnNd1LL/gUHHCB5iKWw1n2e4fx3c+rDDW6Y
	 uPbzymGX/Ky1A7acS40B6CUsXxvVz98aRf3nN4ShHPBln7D8Ag+9kMWR+Fnz3weZ1irrQ
	 MlsiYVWZ54ihWBPUmkCJ2ibMzQxvHyLyGUc0Pve74cGIatFhtjvGJkv2zX+0qS2xzwJ1m
	 mGp2bpRNNq2eFwXymh7VbO4w9ztqx0quee+BIf8qvV3XksUxe82u7UKiOWO03G7GLfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675618;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AoLrVQvTknZzliYhzXqdcSlRyUvNkpYegR/YVeFvkKw=;
	b=oM21LNikEs5wMTYogYyUATdpN3C9dPz48oHmkARt+tAquFMvonsPtM62C4gL2Y7MauAp
	 IvBxF0GfRo0Gf3/juSWUdRjDwQ42uUDoOF3iTLki4EWrKQs4iT4l3bNATMS6UGbeuj5Gk
	 c4kJT1ozyh45J5tmjO9nwNrbNFBIc/23yeylkEQRx4ExR9JYbtd3huk+lWSghctMnZ2X0
	 9XkLBrYRcwmUFXCp99YrFPJO1FFKMQl+Y3irrShoIhAUzgde9DKBJn5QoHqjyfGjYuMrS
	 Fx5ZiZI7Xsw2WM8ZO180whqNq7EjCkTHZrc/LSeGjcHn2PYk89NKyuOgMjRnXM6MSVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F+aQqyXg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.26
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4FE606A31A;
	Thu, 22 Oct 2026 13:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F+aQqyXg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sADM9MB3buKOpSHxqZ3qR4M3TP5V22X2akihL1GFiRJlHWllX5ZvlHaGn8tJoUZhpeJDDRiKjlbXZ/KZ57kKl9EBcwtxzU2W5rjOl9JYBSs/P9u8CTrgaqDMSvG9w6OQLRLwDZEblapNeLU6miujRlUDzqt7MPcx9GGhmzqm1BpsNlnraSOBsBaN8TOo3VAxGTDQsD01lkZy8yh9ExGZMKxiBiFIK4tllxEXzv7UfvPMghhG4ICKct0JFp9jumnDUVBN31rBoXxYmj0/5dnNXLtlUzFcFfTmodKDKvotFP6bHaPYjm+X4ALxl64rybOF2HmF7udy4/ZMMolosauc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoLrVQvTknZzliYhzXqdcSlRyUvNkpYegR/YVeFvkKw=;
 b=wxZV+s7BiZvAEiRrJNnvao18gpJgbTGwZ9Xn+B8RPxMCpItKl3ExRJDk6ZGKqT3h6QRRKMHj+KMqRKAYSWD+ER8BpgIS7H1mcBTHzbi7aZdWzcq4pPAHBvUsXuiagLqmILPTXlbb9lgPA8Li3493feCSEHGVMx6wiIQxmWOxAWr8LYNqa4tq4F5q7Tpt0iOlsooL+KU1es8wmmTNKo9zZ4213uBRp/5W6VpDcOzg472pmWaU6BtgeAuGh3vMOertBVSU1hCcxWd9HMWnWqZeVTmGUdDsB4sgJpVETdzsBYMxDcUDJDJGP6OmQ+LGBuENGLqYFqKOzez34Q/S+BGd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoLrVQvTknZzliYhzXqdcSlRyUvNkpYegR/YVeFvkKw=;
 b=F+aQqyXgWvLspcN+7Hd4J3A0LxuXqy7/vaCWy4L0PAieWJeJt32qB7cH5YvB7iLG6QMoawmalgoAEAdumr0st+0gL8SNDQZh/C41ODJTGdNhgEe28JmS8KpLh29EwQpg8DAl0rTPryWdwR6qK2/AW9Xpxx/Oh4KREyOAfZBrNgU=
Received: from DS1PR03CA0008.namprd03.prod.outlook.com (2603:10b6:8:450::7) by
 BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 13:26:51 +0000
Received: from DM3PEPF000265BB.namprd04.prod.outlook.com
 (2603:10b6:8:450:cafe::f) by DS1PR03CA0008.outlook.office365.com
 (2603:10b6:8:450::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 13:26:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265BB.mail.protection.outlook.com (10.167.23.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:26:51 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:26:46 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD MBA schemata
Date: Thu, 22 Oct 2026 13:25:15 +0000
Message-ID: <20261022132517.46805-5-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022132517.46805-1-swapnil.sapkal@amd.com>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BB:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de4cb83-a0bb-486e-0496-08df304021b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|261021121427099003|56012099006|11063799006|10067099003|261009223027099003|22082099003|261021123027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3Dj/VY45oUK6g4VpGnh/8HLUzURTkraM9Hm6SendDv5YQRNA2NLa1AsVLM7zEGw4Cv2jtarGKqn51sgD451Vie+5VC+ntQjN3M0lFIQTicXgdBO48rOREegJDn2XROIQUiPlVN++I0/AZcGu84q57zu6KtdQ/6JYlAhq33Y2nWHCrxY1W3S1I+B6hMybDnQB+F9eUvJb37//adoXwmH3TSeZyiRCF8hozv4VhZIVKgnHBE0E8vUwuSa5bbJMi7aaQ5Ri6aSgWklDEfDX3YtnaXa8uVZTjjsagL9Z3f6uj92zvoMniI9CobNjLjraxYrNBf+rWOcAYt+1kdDLt935FHIF3PfuCfk3yh8OXjbmmuPGtEdWI9vsRtEu0BBm51GwPnt7iXjMOEAkl9HC8zWHeRk3ir5QtObJO3nSMFIxBfHSLRo5P5WSEsOH6EdGvX+CReu1JAp8q6UvvTslhU+nfLdrBCFgwlybcaPAVdWkPmE6xsiGDqOyg669euxAq6jURWoPTkuwI00hC0rMXG2fv1s/KVHJ0zeISvVYmU1PKP6LQCcRkg2eHldMmf5dkZDgXLLk65dPoeCwiU4lzgzCHQhANPU5amLVH+4JyPMCsGxWBE9XZLvy++7Lk2KnEAZm3tBtGafv/g0MXiLjqeXCtsgqgPBy6hohJuf2DkmrZKPFAR3LSScbVuBDchy6cYfVKUin6igERj0NGsPgmlSPbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(261021121427099003)(56012099006)(11063799006)(10067099003)(261009223027099003)(22082099003)(261021123027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	03CQebFyhTEy9oZmxM5+OdT4U/uBFMu3UjX7NLfc0NLiDKaUGP2+KZNtVjzkYrbdZ+F7SdEM7VOGlDlZT6XKMCu1vDQ8NCg7iQOTwvqFxRGgDjT35/DBfkLOEAWP24YoQqs02HM5nQEifnWhaNQm0GFjHpBMk9JETckmjmxPohIXm15t3h7NKwg2a6O+JfcEFBoksFCzMThmHACtcJEdPt+coG3EzzfQnGNnkFNjQFb0OXWLrK1P2Wted8GSeYY6TrmcwZQ6UbgVJB96ErWygEC1NqhvgBs7oTQzHXB6055unJJ3R61MHAc1bE/ngBQf14eLHcULdAecD3K4xDrF7ARQwiuX8rBoVl5YRqY8z16d154O8H+sn6ncduF6HYEVpGr2NZ0T0xcWt3Kaj0y7PcnDR+J9+01CbfSiSp0QpcGXUp/tud6s+fc4TYOWf9AG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:26:51.0585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de4cb83-a0bb-486e-0496-08df304021b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

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

    v4->v5:
    - No functional change; rebased onto kselftest/next.

    v3->v4:
    - New patch in v4.
    - Added build-time assertions that both the Intel and AMD schemata
      sweeps yield NUM_OF_ALLOCS allocations, and a bounds check in
      check_results(), so the fixed-size result arrays cannot overflow.

 tools/testing/selftests/resctrl/mba_test.c | 79 ++++++++++++++++++----
 1 file changed, 66 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 17ae73d3476c..947735e26099 100644
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

