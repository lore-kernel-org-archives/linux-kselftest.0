Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAAC3290D9;
	Wed, 22 Jul 2026 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686408; cv=fail; b=MqxVKFZ+EMzE5L/dgh4XJ0a+cXrbHyxUrwNiEhwoRt6eIsTDXMCFJ3F+OOOnX62EnzBjJn6Uqjktvzw0jf4aI0zwcyE2RmgNpIx9ptFQMnPONDjmwjX0YJYDam7FWo4AcN45ZMQDw9wHcpHLd0JKyi59CSE//2iu875AxTu5iGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686408; c=relaxed/simple;
	bh=6CSbNCRh3YDm72pI6OEgqfuKeQNHzSqmmEDQ7mKq38k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DRYCmkzhEkm4tEAJKdso4IdCo7MZMlGs/lq0sEA/KTjfNYrvaca/YUEjHrU6IX0D4iBPWrqidcslA0rRr9tAqJydOuaRzsFb1dD123nDmIZ2yMnfVWr9RXJnD4YRl+9nBOVJpl/VXAVuUx1d70C6AUJrhENpyfe8jgC7l4bIGCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=csEluHRA; arc=fail smtp.client-ip=52.101.61.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="csEluHRA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz1WbZp1J1jQmTkLZUYv9MzzE9tRBWgirkz/RQhzFOE8WxU7AZwoINRt5cz5JaiJDKihuetIE3/tZuF/2drjFnQ5BwnA8hSwmNIm4AyOEGPEL/4pnZHipt8InO0xUdSv5BMoPfJ7xenZQwSgE+38KCap3fJnVKk8UdP69//XpKJ8E+StwQPCDSIuQzhB7FkYSEiguE0+n1Ck5elBV1BbxYL4phea6OaSVuEts6eAwT4tb97CuKQQ1Gx7hyfrQz5BHbxbyo7TB44Cx3ZJEE6oEQ/+1PWKnGMh0JnUdmaIhxGJAsZYRg+mGMSNoBMpDkaLL+mAC+GcmwJRTtXG+ZvH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++CKLm2v85L/K6DtqpbZ7tzklr9oVdC+KaxGpZnsyTc=;
 b=QDx2WpY7XpAn7VyM3bWqnRlToKHx9mHPMxoaMlMoZphwSLW/S96jHDngozYN0SRklUb6YtC2KQra7RC+E7XRxwpNttk0pok2yy/mpK0dJfEX0muaU0MfliOiO0KBq1+lpurEj2uLibR8Ck5e7DbB+mRfR/erTOgYPZGC9kmvaCDgLu/BJwQkbQFB0Qq8BA1Go+FKWx8lFnha4jyHWq+3Eu5QZoPvXfpLnimmBuspA4xzKdyq1M240QR/ILCNFA267s8OPWJ/HdiZZ+rxHoBPAWbGT0JI80cwUg7pI+uo3+EvQfbKrfxSDd+GgFLfBhpAzDpZ1Oyvs/JumfW+/Fz+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++CKLm2v85L/K6DtqpbZ7tzklr9oVdC+KaxGpZnsyTc=;
 b=csEluHRA6WrSq53h8+zWZ9ZxiAXRuoAo8tvw3hvr2TlFdA8J869hYvcUxXGvO3o+ItE6Vk0Ht5dyJXcTX8fC4+kc9W9RIHA8xOR4J+zvXpp7YUHD3CLYww1iBzdKjPm0OUh01qAA9xoOpQWIRnHJLHaGMfTwvNsMdHmwIhVMfOmhafChbJdFABitN32PrS5Q7OBxW/JZU/mQg7PIJ4dzRFzaqjIhDmT+Km2I8zZI0pFlZ0xmxt77P7ZgG1DAX4d9DwiVMYRlY/ba9n2ieRbJycD+lXgrw6/kLaRkRwwCN4u/kPUixf5oyqy73ZbK3TMeXJ3P2j+3hGkz5jB/heutRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:13:20 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:13:20 +0000
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
Subject: [PATCH 1/5] selftests/resctrl: Make memory bandwidth measurement vendor-neutral
Date: Wed, 22 Jul 2026 10:12:59 +0800
Message-ID: <20260722021303.9471-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021303.9471-1-icheng@nvidia.com>
References: <20260722021303.9471-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 298a6254-7ddd-45da-0b1a-08dee796cce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cxhYlGfs7tuJCr1caVVA8CTpvF5/W6zh6ITLqLWje31rCZWLGHZR3np2KZZPP4FZbIC+qL66u48v85UeQciAsTGQFSfM0Mu4pO83hBpcNJ82jYAFG4r+p5kKrPdEj+/esBH82BTwrYDJ3kE8xNQTzfM2IfAFuAkOCVPuB/V5pYaNOix5Y3VjmQ+e/UExUSjuumNuoZ0s6b2v8M14zsyJQibI+3uJ4YuIKcx/C1m3LBNKJ5c+md6QwwpMZH5i3kZci1h3BsneeKNoEG8dXFa9L1YLnFaSq9/jxFxnG4dmNtp6bHmcW4jzKL81jEsTM7AqI6Km0xsRHcuYJli81LQBEktSoXGKp7RSsQtlQItv5CFHKIvljxbgTSisaOs7Wuss+XYu6GYIZeHuyGKdPqbVO/meDdj5YfGTpjtYEs2Bm7NEoFmtWe9hXb0IpK+iTWKxUfFmRdW1a+mBHPFNdtb0iI0ASfiIomira6PJkAxZrPwFVgvdKhtJnznfgwT9tWVjcECHUurSmdCf1qgDhuZaNbWgmWcSa9lpptheS5CZDNAeUNvY2N+uYfZ2T2kD2MeCJAZWRgrkd49Qn7vgsLLTEH2PlTBCoKEOd5TrWBZQmy9kZ/ehqdgcyNFaVcUeb6WGnPzD6mCA4aP08D/i4AnimLYIcW9RuRVFX0MZZxM58eA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R8LSVmVvTo2IGph3SWHmH36xUcBrUSUtNFPqbTlee8XmxG+mfxPzxBLhnDQ2?=
 =?us-ascii?Q?Oeg88sgCscSN63O/3lLLM4ivbP59xU8MTPdzLqEO2L4H3B7KX1jlruf3pwmQ?=
 =?us-ascii?Q?e4d0qfDR6EMOCJelYQuJTalfXKc5i/fzk8y783F2B+xSw5D8KRWzg5RSaW3b?=
 =?us-ascii?Q?A0IZRPuCYWt7HBSAlyDt++HcdkuW9UcmgQKC8rTMKRSAipgf8nV9KOaiWNbv?=
 =?us-ascii?Q?dp83gi+9hg33PhvF8v5vtoSepjfEmr4l9CGyv4SIBUM/9l4T1SIrImrSU7zx?=
 =?us-ascii?Q?9pj5GK89s2AlGkmbz6q84UfkxKThy6Qv1Go77FvrAI+FN1j4y1I6TuGBfIdt?=
 =?us-ascii?Q?EkHByKjF4iWWiv9RqdP/OiulCz7tafHw2HNPNv+E9D8FlP2/pj82Q0VwIDB/?=
 =?us-ascii?Q?lW1U7kjI+xgli1rjwZAj7C2Fjak1lVPphuAnwM0TVXlKduzDD4e2qFTDkzhS?=
 =?us-ascii?Q?7OIcC9zpW2MfrpHVAW2z+UkGLIrUp1ksiRhz2vo4qQB5/Y3ibXLBv5IrnUgk?=
 =?us-ascii?Q?ePwAWNVlmoKtOJbI/b8N4bgZ05iim1+BMv2vwodr8vN0LUPUWC8DAFzye+2W?=
 =?us-ascii?Q?hxEFzFRBsaqqCIy61hoPKxJNcXbhX8yig6P4LR20arPG/d/fp9P/mXNPg3cD?=
 =?us-ascii?Q?6v/Qf5GCgLWpc3nrOs6havq2YipoH/F/y/pM8uvJxGfFR1w5soaVu13X9FZ+?=
 =?us-ascii?Q?lyKxiEMCkqEIBxScOqvzXsFxx1bXsYyODj29h8DPx35SdSY9/F9ORxv3Ob55?=
 =?us-ascii?Q?sKIdfSl69TkGQe2UpmiOOd2r0sXmSfksImWobbkmhp8AhOPQLpnYFsLCCyk8?=
 =?us-ascii?Q?vMZTU0WPpiFUF2VkASSittZC5hH0lfc5c8LOGZChVbE4/o3sM6u2UJCfH4Vz?=
 =?us-ascii?Q?Lsi6YRYOqQZsmoosw62bwxHFEFzT0JzEeeMTf4kbsRXEsEfSRArXEuxZW+OP?=
 =?us-ascii?Q?pxNauFI2FpJi4WdouqGk65P5vqJocajYZLbZhHBq2T7poZVzF+1hXsoXFiTK?=
 =?us-ascii?Q?uMirnd8F3OKd88bTFafF5EmDQI1RKxaKnWm8TEte3Vp8GxFhpXok5NW80pQO?=
 =?us-ascii?Q?4gljvtKHlPHGfUI6Sh7EbgrpgNpyTCtK5UeouHzNHufoC+OHbgcLrLHvkyLL?=
 =?us-ascii?Q?NYvONHHB2JELydJCqg2bHm+eqQU+IS1r/zVIXIvom9Psix8FKX9+VI2fYwbF?=
 =?us-ascii?Q?13lN+da7UyrtiEcojaSRwxbzuyfTYo4DDvcvM43iG7MBXGRklJIklWBu4tae?=
 =?us-ascii?Q?J7YQaiKjSqLuKM0wT0g29QJwKN3Horb+e0xPxP9bB9xzphOFrzubBqtsSEFM?=
 =?us-ascii?Q?qGRQYP/qioFxSqjsCuxofiNVXUCczvG1qGB7detHxTLb2BNaEyv+l2Y3o7qS?=
 =?us-ascii?Q?2hRyBIM1V9BO7gt4rl/FI1uNNtwNJ5/GmxA8/Ub2ulwuuw73k2Twb/cbLGIZ?=
 =?us-ascii?Q?3hRgsT/mRUDJrGRte8jq4YvA5p5of+r7UWdrR+VPcyrB8Xr9WVZexX8Iy/jc?=
 =?us-ascii?Q?KdrdxJPifnV8NUSEJkOsz15wcvfH9hZoR8N4lBDOLU7i5OIuuAzJlA5TruC2?=
 =?us-ascii?Q?1S5slEKpjXyki1KxGDj7Kbt3VpMTTxHg5KJkDwQGdxWD4CjJ5ki3oKywpjzw?=
 =?us-ascii?Q?G7/Ub1kC0pgR82zFd4GUAUYGOCk1XYFxc6uYzMb7FPvOuEFh0C0ep/rr8252?=
 =?us-ascii?Q?iTnw6+Zt4RXnGpCHy8h+T2UnrlnNXBIf0PIXWRUL81kbbtqq6ENbp/zcLxbm?=
 =?us-ascii?Q?8B6C0Ug2JQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298a6254-7ddd-45da-0b1a-08dee796cce5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:13:20.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIpz0KOFcCwJyfpjWp7zJO2DCMXfrNI3Ahrmw3y7y+8JtdI4oLv/9wjLxBbu8FDZGKXC1/8132zvaYcmLEz/1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

The MBA and MBM tests validate resctrl's bandwidth accounting against
an independent reference: the Intel iMC uncore PMU read through perf.
Most of the machinery involved (counter bookkeeping, the one second
measurement window, multiplexing correction, result logging and the
comparison with the resctrl value) is not iMC-specific, yet it is all
named after the iMC.

Rename the shared machinery and the result labels to vendor-neutral
names in preparation for supporting reference memory bandwidth PMUs
on other architectures:

  - struct imc_counter_config         -> struct mem_bw_counter
  - imc_counters_config[], imcs       -> bw_counters[], nr_bw_counters
  - MAX_IMCS                          -> MAX_BW_COUNTERS
  - initialize_read_mem_bw_imc()      -> initialize_mem_bw_ref()
  - perf_open/close_imc_read_mem_bw() -> perf_open/close_mem_bw_counters()
  - do_imc_read_mem_bw_test()         -> do_mem_bw_test()
  - get_read_mem_bw_imc()             -> get_mem_bw_ref()
  - "Mem_BW_iMC" result file label    -> "Mem_BW_ref"
  - bw_imc / avg_bw_imc               -> bw_ref / avg_bw_ref

check_results() parses result lines by field position, not by label,
so the label change has no effect on parsing.

While touching it, reflow the result-file fprintf() so the previously
overlong line (101 columns since before this change) fits within the
100 column limit, keeping the format string unsplit.

Functions whose logic is genuinely iMC-specific (num_of_imcs(),
read_from_imc_dir()) keep their names.

No functional change intended.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |  26 +--
 tools/testing/selftests/resctrl/mbm_test.c    |  22 +--
 tools/testing/selftests/resctrl/resctrl.h     |   4 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 178 +++++++++---------
 4 files changed, 114 insertions(+), 116 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index c7e9adc0368f..468ba8accc18 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -21,7 +21,7 @@ static int mba_init(const struct resctrl_val_param *param, int domain_id)
 {
 	int ret;
 
-	ret = initialize_read_mem_bw_imc();
+	ret = initialize_mem_bw_ref();
 	if (ret)
 		return ret;
 
@@ -71,7 +71,7 @@ static int mba_measure(const struct user_params *uparams,
 	return measure_read_mem_bw(uparams, param, bm_pid);
 }
 
-static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
+static bool show_mba_info(unsigned long *bw_ref, unsigned long *bw_resc)
 {
 	unsigned int allocation;
 	bool ret = false;
@@ -81,27 +81,27 @@ static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 	/* Memory bandwidth from 100% down to 10% */
 	for (allocation = 0; allocation < ALLOCATION_MAX / ALLOCATION_STEP;
 	     allocation++) {
-		unsigned long sum_bw_imc = 0, sum_bw_resc = 0;
-		long avg_bw_imc, avg_bw_resc;
+		unsigned long sum_bw_ref = 0, sum_bw_resc = 0;
+		long avg_bw_ref, avg_bw_resc;
 		int avg_diff_per;
 		float avg_diff;
 
 		for (runs = NUM_OF_RUNS * allocation;
 		     runs < NUM_OF_RUNS * allocation + NUM_OF_RUNS ; runs++) {
-			sum_bw_imc += bw_imc[runs];
+			sum_bw_ref += bw_ref[runs];
 			sum_bw_resc += bw_resc[runs];
 		}
 
-		avg_bw_imc = sum_bw_imc / NUM_OF_RUNS;
+		avg_bw_ref = sum_bw_ref / NUM_OF_RUNS;
 		avg_bw_resc = sum_bw_resc / NUM_OF_RUNS;
-		if (avg_bw_imc < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
+		if (avg_bw_ref < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
 			ksft_print_msg("Bandwidth below threshold (%d MiB). Dropping results from MBA schemata %u.\n",
 				       THROTTLE_THRESHOLD,
 				       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
 			continue;
 		}
 
-		avg_diff = (float)labs(avg_bw_resc - avg_bw_imc) / avg_bw_imc;
+		avg_diff = (float)labs(avg_bw_resc - avg_bw_ref) / avg_bw_ref;
 		avg_diff_per = (int)(avg_diff * 100);
 
 		ksft_print_msg("%s Check MBA diff within %d%% for schemata %u\n",
@@ -111,7 +111,7 @@ static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 			       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
 
 		ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
-		ksft_print_msg("avg_bw_imc: %lu\n", avg_bw_imc);
+		ksft_print_msg("avg_bw_ref: %lu\n", avg_bw_ref);
 		ksft_print_msg("avg_bw_resc: %lu\n", avg_bw_resc);
 		if (avg_diff_per > MAX_DIFF_PERCENT)
 			ret = true;
@@ -128,7 +128,7 @@ static bool show_mba_info(unsigned long *bw_imc, unsigned long *bw_resc)
 static int check_results(void)
 {
 	unsigned long bw_resc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
-	unsigned long bw_imc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
+	unsigned long bw_ref[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
 	char *token_array[8], output[] = RESULT_FILE_NAME, temp[512];
 	int runs;
 	FILE *fp;
@@ -150,8 +150,8 @@ static int check_results(void)
 			token = strtok(NULL, ":\t");
 		}
 
-		/* Field 3 is perf imc value */
-		bw_imc[runs] = strtoul(token_array[3], NULL, 0);
+		/* Field 3 is the reference PMU value */
+		bw_ref[runs] = strtoul(token_array[3], NULL, 0);
 		/* Field 5 is resctrl value */
 		bw_resc[runs] = strtoul(token_array[5], NULL, 0);
 		runs++;
@@ -159,7 +159,7 @@ static int check_results(void)
 
 	fclose(fp);
 
-	return show_mba_info(bw_imc, bw_resc);
+	return show_mba_info(bw_ref, bw_resc);
 }
 
 static void mba_test_cleanup(void)
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 84d8bc250539..001a87608835 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -15,21 +15,21 @@
 #define NUM_OF_RUNS		5
 
 static int
-show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, size_t span)
+show_bw_info(unsigned long *bw_ref, unsigned long *bw_resc, size_t span)
 {
-	unsigned long sum_bw_imc = 0, sum_bw_resc = 0;
-	long avg_bw_imc = 0, avg_bw_resc = 0;
+	unsigned long sum_bw_ref = 0, sum_bw_resc = 0;
+	long avg_bw_ref = 0, avg_bw_resc = 0;
 	int runs, ret, avg_diff_per;
 	float avg_diff = 0;
 
 	for (runs = 0; runs < NUM_OF_RUNS; runs++) {
-		sum_bw_imc += bw_imc[runs];
+		sum_bw_ref += bw_ref[runs];
 		sum_bw_resc += bw_resc[runs];
 	}
 
-	avg_bw_imc = sum_bw_imc / NUM_OF_RUNS;
+	avg_bw_ref = sum_bw_ref / NUM_OF_RUNS;
 	avg_bw_resc = sum_bw_resc / NUM_OF_RUNS;
-	avg_diff = (float)labs(avg_bw_resc - avg_bw_imc) / avg_bw_imc;
+	avg_diff = (float)labs(avg_bw_resc - avg_bw_ref) / avg_bw_ref;
 	avg_diff_per = (int)(avg_diff * 100);
 
 	ret = avg_diff_per > MAX_DIFF_PERCENT;
@@ -38,7 +38,7 @@ show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, size_t span)
 	ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
 	if (span)
 		ksft_print_msg("Span (MB): %zu\n", span / MB);
-	ksft_print_msg("avg_bw_imc: %lu\n", avg_bw_imc);
+	ksft_print_msg("avg_bw_ref: %lu\n", avg_bw_ref);
 	ksft_print_msg("avg_bw_resc: %lu\n", avg_bw_resc);
 
 	return ret;
@@ -46,7 +46,7 @@ show_bw_info(unsigned long *bw_imc, unsigned long *bw_resc, size_t span)
 
 static int check_results(size_t span)
 {
-	unsigned long bw_imc[NUM_OF_RUNS], bw_resc[NUM_OF_RUNS];
+	unsigned long bw_ref[NUM_OF_RUNS], bw_resc[NUM_OF_RUNS];
 	char temp[1024], *token_array[8];
 	char output[] = RESULT_FILE_NAME;
 	int runs, ret;
@@ -72,11 +72,11 @@ static int check_results(size_t span)
 		}
 
 		bw_resc[runs] = strtoul(token_array[5], NULL, 0);
-		bw_imc[runs] = strtoul(token_array[3], NULL, 0);
+		bw_ref[runs] = strtoul(token_array[3], NULL, 0);
 		runs++;
 	}
 
-	ret = show_bw_info(bw_imc, bw_resc, span);
+	ret = show_bw_info(bw_ref, bw_resc, span);
 
 	fclose(fp);
 
@@ -87,7 +87,7 @@ static int mbm_init(const struct resctrl_val_param *param, int domain_id)
 {
 	int ret;
 
-	ret = initialize_read_mem_bw_imc();
+	ret = initialize_mem_bw_ref();
 	if (ret)
 		return ret;
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index afe635b6e48d..0de72327a085 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -49,7 +49,7 @@
 
 /*
  * Memory bandwidth (in MiB) below which the bandwidth comparisons
- * between iMC and resctrl are considered unreliable. For example RAS
+ * between the reference PMU and resctrl are considered unreliable. For example RAS
  * features or memory performance features that generate memory traffic
  * may drive accesses that are counted differently by performance counters
  * and MBM respectively, for instance generating "overhead" traffic which
@@ -187,7 +187,7 @@ unsigned char *alloc_buffer(size_t buf_size, bool memflush);
 void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
-int initialize_read_mem_bw_imc(void);
+int initialize_mem_bw_ref(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 7c08e936572d..ee44fbae2cbf 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -14,7 +14,7 @@
 #define READ_FILE_NAME		"events/cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
-#define MAX_IMCS		20
+#define MAX_BW_COUNTERS		20
 #define MAX_TOKENS		5
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
@@ -27,7 +27,7 @@ struct membw_read_format {
 	__u64 id;            /* if PERF_FORMAT_ID */
 };
 
-struct imc_counter_config {
+struct mem_bw_counter {
 	__u32 type;
 	__u64 event;
 	__u64 umask;
@@ -37,36 +37,36 @@ struct imc_counter_config {
 };
 
 static char mbm_total_path[1024];
-static int imcs;
-static struct imc_counter_config imc_counters_config[MAX_IMCS];
+static int nr_bw_counters;
+static struct mem_bw_counter bw_counters[MAX_BW_COUNTERS];
 static const struct resctrl_test *current_test;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
 {
-	memset(&imc_counters_config[i].pe, 0,
+	memset(&bw_counters[i].pe, 0,
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
+	bw_counters[i].pe.type = bw_counters[i].type;
+	bw_counters[i].pe.size = sizeof(struct perf_event_attr);
+	bw_counters[i].pe.disabled = 1;
+	bw_counters[i].pe.inherit = 1;
+	bw_counters[i].pe.exclude_guest = 0;
+	bw_counters[i].pe.config =
+		bw_counters[i].umask << 8 |
+		bw_counters[i].event;
+	bw_counters[i].pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	bw_counters[i].pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
 static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(int i)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_RESET, 0);
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(bw_counters[i].fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(bw_counters[i].fd, PERF_EVENT_IOC_ENABLE, 0);
 }
 
 static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(bw_counters[i].fd, PERF_EVENT_IOC_DISABLE, 0);
 }
 
 /*
@@ -88,21 +88,21 @@ static void get_read_event_and_umask(char *cas_count_cfg, int count)
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
+			bw_counters[count].event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
+			bw_counters[count].umask = strtol(token[i + 1], NULL, 16);
 	}
 }
 
 static int open_perf_read_event(int i, int cpu_no)
 {
-	imc_counters_config[i].fd =
-		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
+	bw_counters[i].fd =
+		perf_event_open(&bw_counters[i].pe, -1, cpu_no, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counters_config[i].fd == -1) {
+	if (bw_counters[i].fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counters_config[i].pe.config);
+			bw_counters[i].pe.config);
 
 		return -1;
 	}
@@ -124,7 +124,7 @@ static int read_from_imc_dir(char *imc_dir, int count)
 
 		return -1;
 	}
-	if (fscanf(fp, "%u", &imc_counters_config[count].type) <= 0) {
+	if (fscanf(fp, "%u", &bw_counters[count].type) <= 0) {
 		ksft_perror("Could not get iMC type");
 		fclose(fp);
 
@@ -221,46 +221,46 @@ static int num_of_imcs(void)
 	return count;
 }
 
-int initialize_read_mem_bw_imc(void)
+int initialize_mem_bw_ref(void)
 {
-	int imc;
+	int i;
 
-	imcs = num_of_imcs();
-	if (imcs <= 0)
-		return imcs;
+	nr_bw_counters = num_of_imcs();
+	if (nr_bw_counters <= 0)
+		return nr_bw_counters;
 
 	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+	for (i = 0; i < nr_bw_counters; i++)
+		read_mem_bw_initialize_perf_event_attr(i);
 
 	return 0;
 }
 
-static void perf_close_imc_read_mem_bw(void)
+static void perf_close_mem_bw_counters(void)
 {
-	int mc;
+	int i;
 
-	for (mc = 0; mc < imcs; mc++) {
-		if (imc_counters_config[mc].fd != -1)
-			close(imc_counters_config[mc].fd);
+	for (i = 0; i < nr_bw_counters; i++) {
+		if (bw_counters[i].fd != -1)
+			close(bw_counters[i].fd);
 	}
 }
 
 /*
- * perf_open_imc_read_mem_bw - Open perf fds for IMCs
+ * perf_open_mem_bw_counters - Open perf fds for the reference-bandwidth counters
  * @cpu_no: CPU number that the benchmark PID is bound to
  *
  * Return: = 0 on success. < 0 on failure.
  */
-static int perf_open_imc_read_mem_bw(int cpu_no)
+static int perf_open_mem_bw_counters(int cpu_no)
 {
-	int imc, ret;
+	int i, ret;
 
-	for (imc = 0; imc < imcs; imc++)
-		imc_counters_config[imc].fd = -1;
+	for (i = 0; i < nr_bw_counters; i++)
+		bw_counters[i].fd = -1;
 
-	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(imc, cpu_no);
+	for (i = 0; i < nr_bw_counters; i++) {
+		ret = open_perf_read_event(i, cpu_no);
 		if (ret)
 			goto close_fds;
 	}
@@ -268,56 +268,54 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
 	return 0;
 
 close_fds:
-	perf_close_imc_read_mem_bw();
+	perf_close_mem_bw_counters();
 	return -1;
 }
 
 /*
- * do_imc_read_mem_bw_test - Perform memory bandwidth test
+ * do_mem_bw_test - Perform memory bandwidth test
  *
  * Runs memory bandwidth test over one second period. Also, handles starting
- * and stopping of the IMC perf counters around the test.
+ * and stopping of the reference perf counters around the test.
  */
-static void do_imc_read_mem_bw_test(void)
+static void do_mem_bw_test(void)
 {
-	int imc;
+	int i;
 
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc);
+	for (i = 0; i < nr_bw_counters; i++)
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(i);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc);
+	for (i = 0; i < nr_bw_counters; i++)
+		read_mem_bw_ioctl_perf_event_ioc_disable(i);
 }
 
 /*
- * get_read_mem_bw_imc - Memory read bandwidth as reported by iMC counters
+ * get_mem_bw_ref - Memory bandwidth as reported by the reference PMU counters
  *
- * Memory read bandwidth utilized by a process on a socket can be calculated
- * using iMC counters' read events. Perf events are used to read these
- * counters.
+ * Sum all configured reference counters, scaled to MiB: read CAS counts on
+ * the x86 iMC.
  *
  * Return: = 0 on success. < 0 on failure.
  */
-static int get_read_mem_bw_imc(float *bw_imc)
+static int get_mem_bw_ref(float *bw_ref)
 {
-	float reads = 0, of_mul_read = 1;
-	int imc;
+	float bw = 0, of_mul = 1;
+	int i;
 
 	/*
-	 * Log read event values from all iMC counters into
-	 * struct imc_counter_config.
+	 * Log event values from all reference counters into
+	 * struct mem_bw_counter.
 	 * Take overflow into consideration before calculating total bandwidth.
 	 */
-	for (imc = 0; imc < imcs; imc++) {
-		struct imc_counter_config *r =
-			&imc_counters_config[imc];
+	for (i = 0; i < nr_bw_counters; i++) {
+		struct mem_bw_counter *r = &bw_counters[i];
 
 		if (read(r->fd, &r->return_value,
 			 sizeof(struct membw_read_format)) == -1) {
-			ksft_perror("Couldn't get read bandwidth through iMC");
+			ksft_perror("Couldn't read reference bandwidth counter");
 			return -1;
 		}
 
@@ -325,13 +323,13 @@ static int get_read_mem_bw_imc(float *bw_imc)
 		__u64 r_time_running = r->return_value.time_running;
 
 		if (r_time_enabled != r_time_running)
-			of_mul_read = (float)r_time_enabled /
+			of_mul = (float)r_time_enabled /
 					(float)r_time_running;
 
-		reads += r->return_value.value * of_mul_read * SCALE;
+		bw += r->return_value.value * of_mul * SCALE;
 	}
 
-	*bw_imc = reads;
+	*bw_ref = bw;
 	return 0;
 }
 
@@ -435,19 +433,19 @@ void signal_handler_unregister(void)
  * print_results_bw:	the memory bandwidth results are stored in a file
  * @filename:		file that stores the results
  * @bm_pid:		child pid that runs benchmark
- * @bw_imc:		perf imc counter value
+ * @bw_ref:		reference PMU counter value
  * @bw_resc:		memory bandwidth value
  *
  * Return:		0 on success, < 0 on error.
  */
-static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
+static int print_results_bw(char *filename, pid_t bm_pid, float bw_ref,
 			    unsigned long bw_resc)
 {
-	unsigned long diff = fabs(bw_imc - bw_resc);
+	unsigned long diff = fabs(bw_ref - bw_resc);
 	FILE *fp;
 
 	if (strcmp(filename, "stdio") == 0 || strcmp(filename, "stderr") == 0) {
-		printf("Pid: %d \t Mem_BW_iMC: %f \t ", (int)bm_pid, bw_imc);
+		printf("Pid: %d \t Mem_BW_ref: %f \t ", (int)bm_pid, bw_ref);
 		printf("Mem_BW_resc: %lu \t Difference: %lu\n", bw_resc, diff);
 	} else {
 		fp = fopen(filename, "a");
@@ -456,8 +454,9 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
 
 			return -1;
 		}
-		if (fprintf(fp, "Pid: %d \t Mem_BW_iMC: %f \t Mem_BW_resc: %lu \t Difference: %lu\n",
-			    (int)bm_pid, bw_imc, bw_resc, diff) <= 0) {
+		if (fprintf(fp,
+			    "Pid: %d \t Mem_BW_ref: %f \t Mem_BW_resc: %lu \t Difference: %lu\n",
+			    (int)bm_pid, bw_ref, bw_resc, diff) <= 0) {
 			ksft_print_msg("Could not log results\n");
 			fclose(fp);
 
@@ -475,10 +474,9 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
  * @param:		Parameters passed to resctrl_val()
  * @bm_pid:		PID that runs the benchmark
  *
- * Measure memory bandwidth from resctrl and from another source which is
- * perf imc value or could be something else if perf imc event is not
- * available. Compare the two values to validate resctrl value. It takes
- * 1 sec to measure the data.
+ * Measure memory bandwidth from resctrl and from the independent reference
+ * PMU. Compare the two values to validate resctrl value. It takes 1 sec to
+ * measure the data.
  * resctrl does not distinguish between read and write operations so
  * its data includes all memory operations.
  */
@@ -487,42 +485,42 @@ int measure_read_mem_bw(const struct user_params *uparams,
 {
 	unsigned long bw_resc, bw_resc_start, bw_resc_end;
 	FILE *mem_bw_fp;
-	float bw_imc;
+	float bw_ref;
 	int ret;
 
 	mem_bw_fp = open_mem_bw_resctrl(mbm_total_path);
 	if (!mem_bw_fp)
 		return -1;
 
-	ret = perf_open_imc_read_mem_bw(uparams->cpu);
+	ret = perf_open_mem_bw_counters(uparams->cpu);
 	if (ret < 0)
 		goto close_fp;
 
 	ret = get_mem_bw_resctrl(mem_bw_fp, &bw_resc_start);
 	if (ret < 0)
-		goto close_imc;
+		goto close_counters;
 
 	rewind(mem_bw_fp);
 
-	do_imc_read_mem_bw_test();
+	do_mem_bw_test();
 
 	ret = get_mem_bw_resctrl(mem_bw_fp, &bw_resc_end);
 	if (ret < 0)
-		goto close_imc;
+		goto close_counters;
 
-	ret = get_read_mem_bw_imc(&bw_imc);
+	ret = get_mem_bw_ref(&bw_ref);
 	if (ret < 0)
-		goto close_imc;
+		goto close_counters;
 
-	perf_close_imc_read_mem_bw();
+	perf_close_mem_bw_counters();
 	fclose(mem_bw_fp);
 
 	bw_resc = (bw_resc_end - bw_resc_start) / MB;
 
-	return print_results_bw(param->filename, bm_pid, bw_imc, bw_resc);
+	return print_results_bw(param->filename, bm_pid, bw_ref, bw_resc);
 
-close_imc:
-	perf_close_imc_read_mem_bw();
+close_counters:
+	perf_close_mem_bw_counters();
 close_fp:
 	fclose(mem_bw_fp);
 	return ret;
-- 
2.43.0

