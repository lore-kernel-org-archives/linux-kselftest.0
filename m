Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BDD439341;
	Mon, 10 Aug 2026 18:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387759; cv=fail; b=Hn309Wk3iTNClmWp9Ks/lqxPKV+W2i0TnDFCLfM2xNyBwDHWYePREY24YTWobeo9m4mkNuE6CYaoIYfZHsJiW9v0oME3/p1ijOhf/qIZTT0yHti4eC8kxr+YpqNwBVv6Upj4jk/iOxwAR9HXOT9De3RORVHWf/3kj2WT1M//3LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387759; c=relaxed/simple;
	bh=OezQqDas8zPRmv/V2zH3+Fd+bxkjPuz8ZyU5bwpnXZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSxDc0VLFqqfckQ6YsFNTUXp3HQKudqtYQ83oRrxMy/nzOaiaYYQXOW31vU0eVar1qH/JrZj+7B8qSTmn4dcDMyoS2EWk2yaByhw+LQDCfv4pKzK9AyOYe//5lccsqnJr/APxKTlKEBZ/yg+rqFpBIZBKIsSiust3j5jvPW0Yl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p3J31dyV; arc=fail smtp.client-ip=40.107.208.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p3J31dyV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcQNc70/E4FVMEq333IsDYxkdSRxHWI3XHpP3TC+mxJjF8YWM44gR9xywzLYB7AjgIVFkZjbQhvtkJivpqel37OLC/2p8sWtYkiBAe9VAdA7ObS03Sx5I6F7sAUJHyeCRRm8ZTJA5MffeVz0oQV6sAyXbl5XXK4Lv7j+EiUnPk7XmoyXptRJDetnJ3g75FglWHQ9/cl2Tt2OR3LI3KgHkULEuD3myr+t6pq8oAzASoIthBz7DEFzhdXhLwm+45ypRt5R1tCj/WRuuDaSbRkWpAFjlaLBVDgmQBRGWgBIRBGNAcawWGSHzBDYGx/fbzC4/z6RynwUprpM1mbkEUKceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQlyMD611xFSPvE6SH0mZEnSohgaviJsrev7dppa0Oo=;
 b=PF/nzB4JQ/NKWJn1n0ELtuts9RLnrIXA8DsXNxabJL/YbbV8LY2OuorYfKyoCgYPPRgGgCqXXP9ANwBan3uzpB8XcSlWnJno0pqEU2IshSY3Yg7EPoRcRfKe61uVIE6P8tnK4a20zzT43IfTEyeFvtXLQQPiEkYaI/4LJuSoI2KMpLO4HRD4MQMSEPyd9F1mYBcD26+gTTMYQV6RJ2XWvNjrjlI7agSdddMRt3FMUVV0xOp+ffg+70g9A2Dc/0x4eAVivsmW5CvTZVJAgaFNjstFIeLZiH1A0fXbvipsllIdpchplOvlW2U4dThLd0jTefhCMnpMXx/SkzOnBE3mxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQlyMD611xFSPvE6SH0mZEnSohgaviJsrev7dppa0Oo=;
 b=p3J31dyVQvyIGFcvWsifjofiL0c71l4Y9PkPa+PJN3itWZanZeNnN+reyZLEnSwl+dSk/gZvjR8BS/Xaz9JCMox71pLJ53z4qipLKi5gbA4V9x+rBlp3nAOPXNKFC2W6BMF4isd5yQNzh6/rhRy2t3YWk0+Wu9ceRL1ClrvVpds=
Received: from BL1PR13CA0386.namprd13.prod.outlook.com (2603:10b6:208:2c0::31)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:49:12 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::35) by BL1PR13CA0386.outlook.office365.com
 (2603:10b6:208:2c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 18:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:49:12 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:49:08 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v4 2/5] selftests/resctrl: Detect vendor to select memory controller sysfs name
Date: Mon, 10 Aug 2026 18:48:03 +0000
Message-ID: <20260810184806.1089507-3-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: b62ec11a-4d9b-4510-5089-08def710120e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XHXkY5F3U5K1QSFoh2wGcAiaYlHlRGB2kFRbHawO+GYiHi4Lp1zWrGm1l59RPyheS8J+Dh9ObiTUV8rpurBdUxQVQHPs/Ihwn0Iwf1f2uhB0YWA5SFqNX14Owz6lSxc2OncvnjcKt29LEpdVEhOkNkhTjIvftHQgEYiPcrg2TYBx4RaIDRMeYpJr9UFjuH5UyOJu0uvLmr2f/h7pw87hqVaE0Z4gEI9IRBewoKSIbAfTZ0yrL0yh0oRXJWN+DROvxvlJBRlmyBsrxlPiMqpKSX8S9UZOfJ9ZD3BXRgEnBlXBhe1e6Wg5GwXoHH4KcYRsUjVN2/4J3ptwF6jWbnpkj0BZxQjMgh90rmVL3bRee8FzDCD720yBFyclu4hhR8x4ROW8CMEvYx9Dr6mTykCMJCaCcICW4vc2bdpfw3jrio7rgDfxITZexhToKJJbkCYzH5OFJ6qWgb4RUON5gds+Oqff6S3v2f79nIC8ugOPJ1Mmeoa4z8BIAXzKLa44F/qBbR205IPzqosBX3caAS7s54aYu31zCT4gG/jDW0OZHLvc8iOmh1x+oszsUbccvXsuiyy4Kuw8Xmjb6Tzdeqb/4AQjWJg7lq4nyoGWlrAG5zCGUHjgIWY33sfre+2+3MHGFzu6DY+x1UXe5FenXEOF3xR7CAFqTEtKMr27Fzt+ewyF8OYWM6C7uC1+desUofqO3PT8iE8Yu45HJ5/wXybSIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QPf+1emxDS/QVgF9+nM0oCszYy/UEHMa4guOdZaVPfDtEc8zphZxPRqV5ZvD7guRI+P/7fINTZc4SfqEqW3lwrDi6ZsqKEXTf6TlhdzqXpbDNUU+pU/ov9nt3jKQOeiGQQOkmfR9Qh5k5NgIGqHdPEB0pNNOLCUmkipuEmRf+js1PfE336uEypcWWkgKclV7VGSOkH4iGqk/6M8iu6eHCy+H0lxgjkmgADug2RgtrU7SOmEWO6VJ+0qcYlZ5EYb6YoXDXtQYcZUMi46TCjjWlryw0Nf4+OUlIBvYMZvW73aEChn7llw+TA4koQAIqygRx73COHV9jT3U58+ksaeqLZWpmEIIowX9lT9jwUlMkwqjNee0Wwn63kIYUSr4yNNIX6HVgJtapy2ehfWHgImOoQMWTXzHaXansYJ6XcC6okXHfqV+b+kteUHRQSay3RHY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:49:12.7199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b62ec11a-4d9b-4510-5089-08def710120e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019

From: Babu Moger <babu.moger@amd.com>

The test detects the number of memory controllers by scanning the perf
sysfs (DYN_PMU_PATH) for the vendor specific memory controller PMU name.
On Intel this PMU is named "uncore_imc_<n>".

Detect the vendor and select the memory controller PMU name accordingly
so that the rest of the code stays generic and can be extended to other
vendors. Bail out on vendors that are not yet supported.

While at it, match against the full "uncore_imc_" string and use
strlen() instead of sizeof() to advance past the prefix. This is clearer
than relying on sizeof() counting the terminating NULL to make up for the
trailing underscore.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Babu Moger <babu.moger@amd.com>
Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---

v3->v4:
    - Reworded the subject and changelog (Reinette)
    - Dropped the local vendor variable and call get_vendor() directly (Reinette)

 tools/testing/selftests/resctrl/resctrl_val.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index bd413d2d5420..c6089c42aa7e 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -10,7 +10,7 @@
  */
 #include "resctrl.h"
 
-#define UNCORE_IMC		"uncore_imc"
+#define UNCORE_IMC		"uncore_imc_"
 #define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
@@ -238,24 +238,29 @@ static int num_of_mem_controllers(void)
 	char mc_dir[512], *temp;
 	unsigned int count = 0;
 	struct dirent *ep;
+	char *sysfs_name;
 	int ret;
 	DIR *dp;
 
+	if (get_vendor() == ARCH_INTEL) {
+		sysfs_name = UNCORE_IMC;
+	} else {
+		ksft_print_msg("Unsupported vendor\n");
+		return -1;
+	}
+
 	dp = opendir(DYN_PMU_PATH);
 	if (dp) {
 		while ((ep = readdir(dp))) {
-			temp = strstr(ep->d_name, UNCORE_IMC);
+			temp = strstr(ep->d_name, sysfs_name);
 			if (!temp)
 				continue;
 
 			/*
 			 * mc counters are named as "uncore_imc_<n>", hence
-			 * increment the pointer to point to <n>. Note that
-			 * sizeof(UNCORE_IMC) would count for null character as
-			 * well and hence the last underscore character in
-			 * uncore_imc'_' need not be counted.
+			 * increment the pointer to point to <n>.
 			 */
-			temp = temp + sizeof(UNCORE_IMC);
+			temp = temp + strlen(sysfs_name);
 
 			/*
 			 * Some directories under "DYN_PMU_PATH" could have
-- 
2.43.0

