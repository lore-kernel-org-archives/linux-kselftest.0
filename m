Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675586;
	b=ynjK3LA9KSnoVJsOtTHIU6/jvkv/UsfCz3siEuFSQwhEHrbJ0asAL9SAXgxT8/OftK8M
	 eY+dLQ7JGnysYPXEvn4gPR33LWTuSIVezrxzjUyDz+TjgT6fFmfKm+59p18G3DFtBlgIP
	 0bpU9x2fRegrKbGqrB1pZJXe0hPVSPi+WYi6M9RSWRWehaypJaXmDfnuTzBTqMR+6PQxD
	 yhaJ+2ZHxh7XKN7VQvlpEHA5dFbrgv8hiGrB8lj32869JobEJxlnkBJcwQoRDsQ+2LQVv
	 fZOAZJRfHpB/o/+FInId02TDC8u5rQq6l0VlRF7gBD7LbaBPND7/idOmlggs4ff4YoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675586;
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
	bh=2KiJd3YeeCnfrVh4xmffe5gOutvekzTs/VoIckI0P74=;
	b=H4adlg8OO5iUJKr8qPiVYdXlmGDtvIt0eb8/57SrLLxkTUn5Zyuy1YsVoJufFQF/+Njf
	 kq/Ja5J+zDlcXhBfmPs3ctI8tdwtv/+xEJ5VjQ5Vtq4oEr+Y/hGyFvetiCt3n0yMjkFxR
	 3GerEWgmWe1yx6UFitv2xEmphdQNyXS8RmWsaTo3h3y/4Nq7KAyDEvtImxp4dUUIrKWld
	 Kcazmmrlaj+13W0U5S8dyEMCae5B0IPKzECyqEZ7BE6Ea69KEHcmqg4TqmLf8LOEUW1U8
	 MYU0DW/LH6iDi1/49XLlzIcY3+UmbBX8sWVIih/KElseh16ewX2iRReh1XVDa5J4Lyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="pOkpmZ/Z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.23
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4101606A31B;
	Thu, 22 Oct 2026 13:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4101606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pOkpmZ/Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=am5w8Kfac/0945EtcXzuKprP6RqFCAg8j8SD9ZWZ3OgGxAhUBdmb4xAyu75mZk/vuVlCI8WFwhEm03GLsdLPtl9+JzPLD/fcrhBhehKNqB0vUxqZOQI+JjatV2BFdGXIsAIChTvAO+TYztJ8roELBdsuGcm6bF0cCWHE1HRqkWl0FEWeDDC/MPMDR9ZPRIc2Ms9itgt6XLYD+Z4aVLLjrdgfWC7/mwZuErRIBDhE8AW13LkerBosORu94LrR4ADBxR4X8XRsTW3I7aVECQ8jWvCxk60hrAF/B9oHpNu1bqF1SyZ7l6LyAUnQcMQPHu9rAaFFqXIFELRF1oUtJZLPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KiJd3YeeCnfrVh4xmffe5gOutvekzTs/VoIckI0P74=;
 b=gbKJhBOeyAC0LUbxwdg0aL9IOuRQja+WpGX8V6M8s7Bv6shywVOf9KjsgQ5ZcVJK6JfDW1uVD3pZHqT8vTWpprTke+MvsPB4K92PrEr/F62AQAl9gB/AYatDO08g/PNWxgInqctorOl6JVbaSmOVSls1C/034Aeu9FEFnI4xrQ+3rgUTaVMuDCAD0DO4F4QiBxBlg0+lV4WHMEIOI/JXqiDCMHVJWGh8xcMLkSecH2yOt3WKQWfRuaXFXsh4yNPEBDAFTknnrN3FKkPmvxDZVa9axKrHIRpLyMEaQMU1kLoHk6Jhu0BZ61NJy7IKoJmK/xnbnBMfIf+C4ok7Uncb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KiJd3YeeCnfrVh4xmffe5gOutvekzTs/VoIckI0P74=;
 b=pOkpmZ/Z5YEKOX77VwLsXTa9HBvdMW0pOE0OShCvaZXoqWg7XMNb1RoVOwO4bMFoz7j+28rZ0N9Brp66BP18VygZu6HYa9hRmKx61xAwx+FOy9Lm9jixK0DhX3kPf/62WRrIXvtdjDzoL47Y9GBEzEwgHJZf5APKoa2uxSgftt4=
Received: from DS7PR03CA0014.namprd03.prod.outlook.com (2603:10b6:5:3b8::19)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 13:26:17 +0000
Received: from DM3PEPF000265B7.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::9a) by DS7PR03CA0014.outlook.office365.com
 (2603:10b6:5:3b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 13:26:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B7.mail.protection.outlook.com (10.167.23.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:26:17 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:26:13 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v5 2/5] selftests/resctrl: Detect vendor to select memory controller sysfs name
Date: Thu, 22 Oct 2026 13:25:13 +0000
Message-ID: <20261022132517.46805-3-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B7:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 38cf556e-971b-4db1-cf2b-08df30400dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|6133799003|10067099003|22082099003|18002099003|261021121427099003|3023799007|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oHQIbdm0NdOhSV6iZT9qSa/w+7HCrIkBKcekTL6JGqz+TR44hhgR9Rge49qS6jHSt1d2jpz1BlhHz44B4XaAfXRUwQSjO+jHu3NuRMkBvLPJXjDqVdF3hvUfMgCUjCZBZ5jRJGRlBjnV6exHloCNUem6AqJ+D8dTxFiNrAZcfOtt1ZE+ecYgsDYonNrnD4Fj7IXgu3133VcSWDUIsZi+HPDGZUVXKs1uJou6Apl5rGzDpTMIfyKofmtYb6nHdD0RtLq1LlrXRMvYUEWjYh+WSFXWXCTp2VbwoUL2hbUkHGm8tHg0AKhyzl1h5UKIAyvZpWdRWuSiSXTHoBPl+/pesfqsT049tyHUOcA7MHPJjWTwLnBLmcvk3XcWtXJsxX1n8eIC0eC+s4/yR5GmNi2+2vOz23Y4k76q8pHNc38LOffJp3mxZKITRKmC5BUEL2F8luFLnTnMHhZP1l2doNQs04ewN+uX2ZWI3f2mA+gM35Wf7DPZJODJCh7vGP9RXoAfYWUNqH2D9ahCC6X529wi2myhLvgeJAIXXd6arpGyfg1OByxgShAbR4sNCMM8OzQnx+oyfSWFpRcbYZgAOTx06Gj9sMummGiZDQbwsaYZF9CN8buN0+elEcG51d7eKMI5H4BOq8tRaZrBuJHMiilIr/JXYHEY1J/TXif+nZjUdG+sRZqx/qoJQm/56Z7TOgQ2sek12wIYKFsUj1/XKGlmow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(3023799007)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Id+eII/faNJcNgYpblIgjS1gbvTvnGzG/PL2QopfKu9+Ef2MGoFnCATLQgfQkhfi9/HrshmUBgFFzh+OWjAzrLJq6P/cGP8GoGHlY1AGlQ17BAeP6XUyVx6jSNJyDFJmibb5KbYZ1mP+4mdetBBEEQ4Buq64ZUC9hP5oFMlkjOOiMsN35SZt6MjdomZXAjFMGvt9tL+3Qxcz3UjhtmZpb+mmD21Glos7Z3VRWO0F9LKNm+tnCHduZzc1lISa9x9i0wXpjH0daFNJY6aZrwG8r9vSNN07ng+QZN6tornSidmtFgzGd3yYl/4+3mgcJ1iAyeOmh0ebVsIywSUR3hWMgh2SzyAmyVZ/J8f0VxGpzGf+vMxV8GJPN/k0lO9rNBRMJmFAGD5JuawmbpPFgJJ5CQuUwwX2gaUTXbn2WTy/3d6pdBJAWBsJ/E2xd3b4gbI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:26:17.7120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cf556e-971b-4db1-cf2b-08df30400dd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825

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

    v4->v5:
    - Rebased onto kselftest/next; the vendor detection now lives in
      enumerate_mcs() (previously num_of_mem_controllers()).

    v3->v4:
    - Reworded the subject and changelog. (Reinette)
    - Dropped the local vendor variable and call get_vendor() directly.
      (Reinette)

 tools/testing/selftests/resctrl/resctrl_val.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index c9cac957726b..fdbbe2155cea 100644
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
@@ -235,24 +235,29 @@ static int enumerate_mcs(void)
 {
 	char mc_dir[512], *temp;
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

