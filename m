Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675573;
	b=v09r2B53m2lmLsjqTjO3FXSKlbN3femCznhNyydhVKorgHuSVc6Y/IRk8jbIGczA2/1N
	 MplTsyX55Ltq5KxzMM4weo9oA063ZtE9u6XBx5onFcMBBybC/LUrIv3Zg/Yv30iHulKl7
	 WQLVxRhU6nmyz+PnQYPy56J2RPhY1Dkc2CxdOiCIG9RCOC8kVkzVvl/nI06Ku/NSp4VVm
	 d2SAe8lQa/E83FZlkj9FMuBN0ZO1t3aBChA0GqsKnVQRyYUsY+tNmXX0YADCNKYgechur
	 qH1ZQZZSGHCH8TSJX1pdS0i6lfOPMBpsRwKCKYqn6KprEv3EJVFZcT1YYPwMn17jDEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675573;
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
	bh=cGEUOtjB7NG3Rbao45AaRELnu0aOwHZXulyQELTw7h8=;
	b=vO5MI9iXfv8hJ3npAYIu9rkq4cY7YBBF+gTieRxpHLX6JjFJG80XKiXxV6PWymArejzo
	 +F5odJ4kOA2A9k+VwzHZYzYUb8P++vVmJ9fQ3r9llojM0cRD4zDPdbNiVPRwoTKus6WVt
	 /DxFV7e0MFOFjYcfZ2P/TnCUJzzMY60XQILbE49N6cjD2RlvKJ8wG7Ajkg3CZnlgdrOQW
	 gakavkz7HjXBf83QPCIwMx+PVdqICCb/7xCdZIxGs/d2rTXhjtMADVkJuScU7vHTFHmy7
	 EOhjNlutnmoI/ukvMAqEh93nHu8YavgabVWHIA7gbB5RAvn8bNVcnLh3ueY2buKZ/Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EUIIxSo0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.50
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D5D606A321;
	Thu, 22 Oct 2026 13:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D5D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EUIIxSo0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1tSONfUDhRhUpc3YvO8pCvlKOyPwc1/OBW5qpRA8ZJw6VUELSselRmeWHZjq0VUPFWqqMq6aTWSwst+T1GLK3sTtJgY3eth7uU5d/cj4NGifhUqAIqEksysBMdw9SL5kOqQw0av0Pq4vHy0AT7Dt5oxZQ2Ie0QvOCvua7St+SnhOKrVvBjudkjh6F9u8RP8bkFRm0ZIydmUD5Ju3ahpN8pwO6rfM90rToGpjk8jt1RyKgQbIiHFkAudQtyerI0BXkY748sCr1r/BjmUILFFItFox+AtJJKc6oIfbNRL3bNTTDxwfitDa01cf29E1HVq3Zraf1v9YwL839t8GNG9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGEUOtjB7NG3Rbao45AaRELnu0aOwHZXulyQELTw7h8=;
 b=XqpJ0ffCzd484slbNewTyq4eRZ7jwHLZs3dpUwA4ia9L44oglPPNouZb/50HeDg7V4IVk+b5s/9lpdfa9rCReWXHTbHaYC8QQ07nlZl5hrnPUsxIQhLBsAS8daHKV+CC+C5LK29W/zOcuawgduPzQviltOzqsQJLao7gSc9vn7U5qJJ1YW5zkuYBGrx/yEk3QzPAMPgoCksawrJyxrWfi55xJpuoalSLzl0HeigrQulXT13oYggx8Q7BaDJDRy9esneSnrJF9f8aB0AEdxj98otcdOjL7UDJuNvMOxaH5C/QqrFSE+yPpUX+SzWsF3GbLtl3OFmnoWX/0oK7tt/Y4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGEUOtjB7NG3Rbao45AaRELnu0aOwHZXulyQELTw7h8=;
 b=EUIIxSo0OdF14vmrjQ3V14A3b+bf9Yr4YS6NkZ87a9AfE/EPR4/u+SfC5EggEO06gcboa3PgIw2WFw9ew4x27El9No0IYdfn/4IwLyw5ciMCSeexMPSVx71Zz+SL6TLTfrz9pC4JpvfC3bNfC/DYDe4Pr3NTcLmAXjzaakgLhkg=
Received: from CH3P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::32)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 13:26:03 +0000
Received: from DM3PEPF000265BE.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::1f) by CH3P221CA0006.outlook.office365.com
 (2603:10b6:610:1e7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu,
 22 Oct 2026 13:26:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265BE.mail.protection.outlook.com (10.167.23.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:26:02 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:25:56 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v5 1/5] selftests/resctrl: Rename variables and functions to generic names
Date: Thu, 22 Oct 2026 13:25:12 +0000
Message-ID: <20261022132517.46805-2-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BE:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ab74b9-df8e-4fae-cbcf-08df304004e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|36860700016|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|261021130227099003|261021123027099003|261009223027099003|261009221227099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	u1PxIdclvXQ+7ksSVAuI7DFI8RqHuvhHrhchlAM99PUUlhzYYynUcVkzaAyX0H4xcG0Flnt9TJzpfw1JTX53ZdR5IZjDtj8BfNrqbWhwU7mdRrlJACbtOTAewxRJUI4vMiGKjk3GOIyEnHbTuc8M1+D5wNmw89IGYFcjAcU91tZtqWCfKx1iRVfLVxepdnsG5FQQkWb9pt5V6mTCQGvhNkndKEJ7bA2FOQoqyQ7dxA71CEK1MHh0mmra/rGBKEVlWCrpIzn208l8CkSl8WfA3dclcnzED3XBMS5VOTSmnggFJj4WVhJalOqgJL7b8NRYp+n59yTePxwTdqH+LzULE2Ky9mNAigpg6ZBUXvPxxGlUCc+yO8+efoJgwH7zHzCIC9C8tzHTTZYSITkId7Whoyoo9ZTrhTt8tvtrr7txoZaO2TGKbPAtAXnaKnvvsY6I94MeDQtzQCHlPWx/47FKkFlBJ3YjvYHUKeT6Z8BQORpn0CCKMLlO2uTAvNvQDG9ukfuZfF8/BC8v01p0q0XF8i0nmyk3ykrEvI1Lgx41VTBY+5nEy9EhUvXs3977NeV3cCN2NZHG1zlWmZ7k6FFeDdCgk/YV1DR2jPVTEx6/fTW7778yi2O+H4fohljLxDuH+2yTXYgLGpSzUUIl03UBCmiRVLU7zYH9bHl3oZtef4LYOA6PIK925tsvj1mpWuq6l0r2Icr7JIEuIFcYJFu+Zw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(261021130227099003)(261021123027099003)(261009223027099003)(261009221227099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	krVjvN0nX5gj8ydP95q2EZsKHf3OGuOVmSsOYrRLNp/oEB3/lKjouuJwMqErnNKxH9NVQ4FwzLMVVu950J/lWslmWb6hrwBPPKtETpqSpsDKlHoUxKUPXJU9UZSacG0f6ST87X1rfIWWlrqcmalHmgq/VzcgWeQwBhwog2MbggW0w/R87Zohn4d2EOTndGgoOBobOxHe8XDPycCLKv0R2LgAfJCN8ADKRhkTb00T8sBcxc41jag87Y0DG+jJ3wmjs3auYNtEjqcBHH1MZWx/qfNTBDrsBY0YrRgXUO6usQ9FpIIZgJUVMIs8hgOZDJn49xW7TUKRZtHIlL9f50NDi6Knfu7W3rocb34LH7LrWsyr63x6ixgVukHHHHFrHhp0hfd83U65tPYr+TscYZFn0MeKi+iot5aAM1hFyINMiTuOkoXNogxRI3VRnycp3kvp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:26:02.7576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ab74b9-df8e-4fae-cbcf-08df304004e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114

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

    v4->v5:
    - Rebased onto the kselftest/next branch and reworked on top of the
      upstream refactor that moves the memory bandwidth counters into a
      dynamically managed linked list; enumerate_imcs() is renamed to
      enumerate_mcs() accordingly.

    v3->v4:
    - Rebased onto v7.2-rc7. Reworked to match the upstream resctrl_val.c
      refactor that reads the memory bandwidth counters into a single
      read-event array.
    - Renamed the remaining Intel specific references missed in v3: the
      get_mem_bw_imc() helper, the imc_counter_config comments and the
      'Mem_BW' bandwidth label. (Reinette)

 tools/testing/selftests/resctrl/mba_test.c    |  28 +-
 tools/testing/selftests/resctrl/mbm_test.c    |  24 +-
 tools/testing/selftests/resctrl/resctrl.h     |   6 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 256 +++++++++---------
 4 files changed, 157 insertions(+), 157 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 4bb1a82eb195..17ae73d3476c 100644
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
@@ -161,12 +161,12 @@ static int check_results(void)
 
 	fclose(fp);
 
-	return show_mba_info(bw_imc, bw_resc);
+	return show_mba_info(bw_mc, bw_resc);
 }
 
 static void mba_test_cleanup(void)
 {
-	cleanup_read_mem_bw_imc();
+	cleanup_read_mem_bw_mc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 68c89f50a34a..e24c6237a22f 100644
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
 
@@ -125,7 +125,7 @@ static int mbm_measure(const struct user_params *uparams,
 
 static void mbm_test_cleanup(void)
 {
-	cleanup_read_mem_bw_imc();
+	cleanup_read_mem_bw_mc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index a7556cdae0de..cb8d68292a21 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -50,7 +50,7 @@
 
 /*
  * Memory bandwidth (in MiB) below which the bandwidth comparisons
- * between iMC and resctrl are considered unreliable. For example RAS
+ * between MC and resctrl are considered unreliable. For example RAS
  * features or memory performance features that generate memory traffic
  * may drive accesses that are counted differently by performance counters
  * and MBM respectively, for instance generating "overhead" traffic which
@@ -183,8 +183,8 @@ unsigned char *alloc_buffer(size_t buf_size, bool memflush);
 void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
-int initialize_read_mem_bw_imc(void);
-void cleanup_read_mem_bw_imc(void);
+int initialize_read_mem_bw_mc(void);
+void cleanup_read_mem_bw_mc(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 7e7d0f9cc249..c9cac957726b 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -26,7 +26,7 @@ struct membw_read_format {
 	__u64 id;            /* if PERF_FORMAT_ID */
 };
 
-struct imc_counter_config {
+struct mc_counter_config {
 	struct list_head entry;
 	__u32 type;
 	__u64 event;
@@ -36,40 +36,40 @@ struct imc_counter_config {
 };
 
 static char mbm_total_path[1024];
-LIST_HEAD(imc_counters_list);
+LIST_HEAD(mc_counters_list);
 static const struct resctrl_test *current_test;
 
-static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counter)
+static void read_mem_bw_initialize_perf_event_attr(struct mc_counter_config *mc_counter)
 {
-	memset(&imc_counter->pe, 0, sizeof(struct perf_event_attr));
-	imc_counter->pe.type = imc_counter->type;
-	imc_counter->pe.size = sizeof(struct perf_event_attr);
-	imc_counter->pe.disabled = 1;
-	imc_counter->pe.inherit = 1;
-	imc_counter->pe.exclude_guest = 0;
-	imc_counter->pe.config = imc_counter->umask << 8 | imc_counter->event;
-	imc_counter->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
-	imc_counter->pe.read_format =
+	memset(&mc_counter->pe, 0, sizeof(struct perf_event_attr));
+	mc_counter->pe.type = mc_counter->type;
+	mc_counter->pe.size = sizeof(struct perf_event_attr);
+	mc_counter->pe.disabled = 1;
+	mc_counter->pe.inherit = 1;
+	mc_counter->pe.exclude_guest = 0;
+	mc_counter->pe.config = mc_counter->umask << 8 | mc_counter->event;
+	mc_counter->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	mc_counter->pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(struct imc_counter_config *imc_counter)
+static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(struct mc_counter_config *mc_counter)
 {
-	ioctl(imc_counter->fd, PERF_EVENT_IOC_RESET, 0);
-	ioctl(imc_counter->fd, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(mc_counter->fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(mc_counter->fd, PERF_EVENT_IOC_ENABLE, 0);
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_disable(struct imc_counter_config *imc_counter)
+static void read_mem_bw_ioctl_perf_event_ioc_disable(struct mc_counter_config *mc_counter)
 {
-	ioctl(imc_counter->fd, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(mc_counter->fd, PERF_EVENT_IOC_DISABLE, 0);
 }
 
 /*
  * get_read_event_and_umask:	Parse config into event and umask
  * @cas_count_cfg:	Config
- * @imc_counter:	iMC counter config
+ * @mc_counter:	MC counter config
  */
-static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config *imc_counter)
+static void get_read_event_and_umask(char *cas_count_cfg, struct mc_counter_config *mc_counter)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -83,20 +83,20 @@ static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_con
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counter->event = strtol(token[i + 1], NULL, 16);
+			mc_counter->event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counter->umask = strtol(token[i + 1], NULL, 16);
+			mc_counter->umask = strtol(token[i + 1], NULL, 16);
 	}
 }
 
-static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
+static int open_perf_read_event(int cpu_no, struct mc_counter_config *mc_counter)
 {
-	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
+	mc_counter->fd = perf_event_open(&mc_counter->pe, -1, cpu_no, -1,
 					  PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counter->fd == -1) {
+	if (mc_counter->fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counter->pe.config);
+			mc_counter->pe.config);
 
 		return -1;
 	}
@@ -104,10 +104,10 @@ static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_count
 	return 0;
 }
 
-static int parse_imc_read_bw_events(char *imc_dir, unsigned int type)
+static int parse_mc_read_bw_events(char *mc_dir, unsigned int type)
 {
-	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
-	struct imc_counter_config *imc_counter;
+	char mc_events_dir[PATH_MAX], mc_counter_cfg[PATH_MAX];
+	struct mc_counter_config *mc_counter;
 	bool found_event = false;
 	char cas_count_cfg[1024];
 	struct dirent *ep;
@@ -117,14 +117,14 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type)
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
 		goto out;
 	}
 
-	dp = opendir(imc_events_dir);
+	dp = opendir(mc_events_dir);
 	if (!dp) {
 		ksft_perror("Unable to open PMU events directory");
 		goto out;
@@ -140,37 +140,37 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type)
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
-		imc_counter = calloc(1, sizeof(*imc_counter));
-		if (!imc_counter) {
-			ksft_perror("Unable to allocate memory for iMC counters");
+		mc_counter = calloc(1, sizeof(*mc_counter));
+		if (!mc_counter) {
+			ksft_perror("Unable to allocate memory for MC counters");
 			goto out_close;
 		}
 
-		imc_counter->type = type;
-		get_read_event_and_umask(cas_count_cfg, imc_counter);
-		list_add(&imc_counter->entry, &imc_counters_list);
+		mc_counter->type = type;
+		get_read_event_and_umask(cas_count_cfg, mc_counter);
+		list_add(&mc_counter->entry, &mc_counters_list);
 		found_event = true;
 	}
 	if (!found_event) {
-		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
+		ksft_print_msg("Unable to find events in %s\n", mc_events_dir);
 		goto out_close;
 	}
 	ret = 0;
@@ -178,41 +178,41 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type)
 	closedir(dp);
 out:
 	if (ret)
-		cleanup_read_mem_bw_imc();
+		cleanup_read_mem_bw_mc();
 
 	return ret;
 }
 
-/* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir)
+/* Get type and config of an MC counter's read event. */
+static int read_from_mc_dir(char *mc_dir)
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
-	ret = parse_imc_read_bw_events(imc_dir, type);
+	ret = parse_mc_read_bw_events(mc_dir, type);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
 		return ret;
@@ -222,8 +222,8 @@ static int read_from_imc_dir(char *imc_dir)
 }
 
 /*
- * Discover the properties of the available iMC (Integrated Memory Controller)
- * counters in support of needed performance measurement via perf. For each iMC
+ * Discover the properties of the available MC (Memory Controller)
+ * counters in support of needed performance measurement via perf. For each MC
  * counter get it's type and config. Also obtain each counter's event and umask
  * for the memory read events that will be measured.
  *
@@ -231,9 +231,9 @@ static int read_from_imc_dir(char *imc_dir)
  *
  * Return: >= 0 on success. < 0 on failure.
  */
-static int enumerate_imcs(void)
+static int enumerate_mcs(void)
 {
-	char imc_dir[512], *temp;
+	char mc_dir[512], *temp;
 	struct dirent *ep;
 	int ret;
 	DIR *dp;
@@ -246,7 +246,7 @@ static int enumerate_imcs(void)
 				continue;
 
 			/*
-			 * imc counters are named as "uncore_imc_<n>", hence
+			 * mc counters are named as "uncore_imc_<n>", hence
 			 * increment the pointer to point to <n>. Note that
 			 * sizeof(UNCORE_IMC) would count for null character as
 			 * well and hence the last underscore character in
@@ -260,9 +260,9 @@ static int enumerate_imcs(void)
 			 * first character is a numerical digit or not.
 			 */
 			if (temp[0] >= '0' && temp[0] <= '9') {
-				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
+				sprintf(mc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir);
+				ret = read_from_mc_dir(mc_dir);
 				if (ret) {
 					closedir(dp);
 
@@ -271,8 +271,8 @@ static int enumerate_imcs(void)
 			}
 		}
 		closedir(dp);
-		if (list_empty(&imc_counters_list)) {
-			ksft_print_msg("Unable to find iMC counters\n");
+		if (list_empty(&mc_counters_list)) {
+			ksft_print_msg("Unable to find MC counters\n");
 
 			return -1;
 		}
@@ -285,58 +285,58 @@ static int enumerate_imcs(void)
 	return 0;
 }
 
-int initialize_read_mem_bw_imc(void)
+int initialize_read_mem_bw_mc(void)
 {
-	struct imc_counter_config *imc_counter;
+	struct mc_counter_config *mc_counter;
 	int ret;
 
-	ret = enumerate_imcs();
+	ret = enumerate_mcs();
 	if (ret < 0)
 		return ret;
 
-	/* Initialize perf_event_attr structures for all iMC's */
-	list_for_each_entry(imc_counter, &imc_counters_list, entry)
-		read_mem_bw_initialize_perf_event_attr(imc_counter);
+	/* Initialize perf_event_attr structures for all MC's */
+	list_for_each_entry(mc_counter, &mc_counters_list, entry)
+		read_mem_bw_initialize_perf_event_attr(mc_counter);
 
 	return 0;
 }
 
-void cleanup_read_mem_bw_imc(void)
+void cleanup_read_mem_bw_mc(void)
 {
-	struct imc_counter_config *imc_counter, *tmp;
+	struct mc_counter_config *mc_counter, *tmp;
 
-	list_for_each_entry_safe(imc_counter, tmp, &imc_counters_list, entry) {
-		list_del(&imc_counter->entry);
-		free(imc_counter);
+	list_for_each_entry_safe(mc_counter, tmp, &mc_counters_list, entry) {
+		list_del(&mc_counter->entry);
+		free(mc_counter);
 	}
 }
 
-static void perf_close_imc_read_mem_bw(void)
+static void perf_close_mc_read_mem_bw(void)
 {
-	struct imc_counter_config *imc_counter;
+	struct mc_counter_config *mc_counter;
 
-	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
-		if (imc_counter->fd != -1)
-			close(imc_counter->fd);
+	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
+		if (mc_counter->fd != -1)
+			close(mc_counter->fd);
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
-	struct imc_counter_config *imc_counter;
+	struct mc_counter_config *mc_counter;
 	int ret;
 
-	list_for_each_entry(imc_counter, &imc_counters_list, entry)
-		imc_counter->fd = -1;
+	list_for_each_entry(mc_counter, &mc_counters_list, entry)
+		mc_counter->fd = -1;
 
-	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
-		ret = open_perf_read_event(cpu_no, imc_counter);
+	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
+		ret = open_perf_read_event(cpu_no, mc_counter);
 		if (ret)
 			goto close_fds;
 	}
@@ -344,54 +344,54 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
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
-	struct imc_counter_config *imc_counter;
+	struct mc_counter_config *mc_counter;
 
-	list_for_each_entry(imc_counter, &imc_counters_list, entry)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc_counter);
+	list_for_each_entry(mc_counter, &mc_counters_list, entry)
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc_counter);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	list_for_each_entry(imc_counter, &imc_counters_list, entry)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc_counter);
+	list_for_each_entry(mc_counter, &mc_counters_list, entry)
+		read_mem_bw_ioctl_perf_event_ioc_disable(mc_counter);
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
-	struct imc_counter_config *r;
+	struct mc_counter_config *r;
 
 	/*
-	 * Log read event values from all iMC counters into
-	 * struct imc_counter_config.
+	 * Log read event values from all MC counters into
+	 * struct mc_counter_config.
 	 * Take overflow into consideration before calculating total bandwidth.
 	 */
-	list_for_each_entry(r, &imc_counters_list, entry) {
+	list_for_each_entry(r, &mc_counters_list, entry) {
 		struct membw_read_format measurement;
 
 		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
-			ksft_perror("Couldn't get read bandwidth through iMC");
+			ksft_perror("Couldn't get read bandwidth through MC");
 			return -1;
 		}
 
@@ -405,7 +405,7 @@ static int get_read_mem_bw_imc(float *bw_imc)
 		reads += measurement.value * of_mul_read * SCALE;
 	}
 
-	*bw_imc = reads;
+	*bw_mc = reads;
 	return 0;
 }
 
@@ -509,19 +509,19 @@ void signal_handler_unregister(void)
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
@@ -530,8 +530,8 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
 
 			return -1;
 		}
-		if (fprintf(fp, "Pid: %d \t Mem_BW_iMC: %f \t Mem_BW_resc: %lu \t Difference: %lu\n",
-			    (int)bm_pid, bw_imc, bw_resc, diff) <= 0) {
+		if (fprintf(fp, "Pid: %d \t Mem_BW_MC: %f \t Mem_BW_resc: %lu \t Difference: %lu\n",
+			    (int)bm_pid, bw_mc, bw_resc, diff) <= 0) {
 			ksft_print_msg("Could not log results\n");
 			fclose(fp);
 
@@ -550,7 +550,7 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
  * @bm_pid:		PID that runs the benchmark
  *
  * Measure memory bandwidth from resctrl and from another source which is
- * perf imc value or could be something else if perf imc event is not
+ * perf mc value or could be something else if perf mc event is not
  * available. Compare the two values to validate resctrl value. It takes
  * 1 sec to measure the data.
  * resctrl does not distinguish between read and write operations so
@@ -561,42 +561,42 @@ int measure_read_mem_bw(const struct user_params *uparams,
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

