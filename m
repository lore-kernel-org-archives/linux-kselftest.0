Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675598;
	b=AEyp8PNfguhZdn7AkoDFS/YIRO07MGaY6uK/l4b+026ovpVnJOVw2Cm7Ju/FeIWWffer
	 GpIhKy1CnfM7nQEenyc/82K0C0iM4a40lya6U3cTP+LLFOeV2OVhPZkFF/Cem6dk9/2WE
	 E2RVcgqWaM0IjAhshItUD4jadwxs8IU6RmaPKGi4PqfnUpFWLBt+l6H0/KNNUPLh9uzAD
	 9VaowYHIJ7AE4oiMvQXrOw9oZJxJZGRtZU4uQj+Ku0cyrtNIpGhNo7mGnF2JZNFDXWMmX
	 3RqWLSZZvQlWNZliznZOEf5IVaxe97bTGP2rMl9variZJNGY6bwBQDnepWJ2V375ntw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675598;
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
	bh=hHUoxq434UQb+S3Lt+0S8oAh5WDsbh5x7QVHDu30p+c=;
	b=0edzoMMdzfk4w4gLWUNUsCdPq7XU7LdwqOn4+Zqe2ytcHiViBd6rJBJn52eJDwhRLc+i
	 Q+7lUDOh0GsD/IxOzdmUwOR2O1bzh/8VmDWwxgmSs2wPTZoZzqyX8TyEYC1b3dbITOMBJ
	 nOp4VKaDbverEx6GeqR9QleIGXzUrxv7abDy4GUdCYVQuDsJa1DfaWLV7sXtedr/lKGpe
	 eXVvuMIp6XVsqAe87XiUtHvd5yDT94hugcFAophfCYJg0+joKLS+6Ux9IJQQiPBTKD5il
	 NEfn3F+qncEb95xwoxB+tgybmV8Irjl+zFY7HHURDmOvJhrlYB8HF5McOPToeI+B/6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u9OnYL+K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.54
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E99606A31B;
	Thu, 22 Oct 2026 13:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E99606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u9OnYL+K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtOzprBL9W6KUr7uka5ZHRfG+mraKUS9lm20xGe4Pt7KkC6b3T60GZ8SwD+VOP0g6+K2aox9W0LydqWZLyYYzYyhBUgPWmckXPjj2tP969o58+8iR6gLq3TOWTXho7WG/Ou8p++Pp60/tkEak2kB7ievPTsMITB04CW/gLjteOWZa4nB4qDUw9GqPRWJLJEf5QWckyEqm5yEIXeMq4xNxv4Qab1eWpz/RbYzhMHS63TVsC7G07Re0+12RVKxj1OLP/UBKFd1s3oWzLehw9iBbJ9GCfY6kAT92W7m3U570OK53Xx7fi9vfYRqdwpSqQy/meV2dOXZrS2GfPuZa1R2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHUoxq434UQb+S3Lt+0S8oAh5WDsbh5x7QVHDu30p+c=;
 b=B5SaKX3+bx1bS+IIVg6BZP8b4y3W72QzSdzv0HihIM3v0fNggMNMGdO5HtLdsb3V1OmxOUCwVYIhCuEHfZGQ5sRS5JuTXqrF0z4sNwNjaJiDSCLpczMbA/IgW4FmiAxGsZhTNBfqNZ1vPtiXOXwy6J9RwryScC6mLZ8DYhSF98yCaljqougObOKMVXgrpDtGiiUVjsEh1Jf1e2XsSCZ6Qvdrm+R/FhIWJ0jnYP1OyjQeJq2rX1/ZLN96hIZMFzdMLkvHysKJQC1LS0kFVquGd3shzh7tQHgrC64YM7+sRH+qzP67l4DcjvbXAPkNIofzPGgsl634qQLoObrVEjrOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHUoxq434UQb+S3Lt+0S8oAh5WDsbh5x7QVHDu30p+c=;
 b=u9OnYL+KvVjTy0UQpGAJIpWLT46ZVpTu/LiBtw4gG+kmnXhTduR6SAM1i9nmyqtXFzUJLsQBQpnamCvxq0eKelRPaxHm1XvNCC+eeTh8zG4nsaFbOo08PJn5YMmG7rA7ZwuDa86RK1xW44F48+Df/48UiwOeefyZruV5paEuiI8=
Received: from DS7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::9) by
 DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Thu, 22 Oct 2026 13:26:34 +0000
Received: from DM3PEPF000265B9.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::96) by DS7P222CA0023.outlook.office365.com
 (2603:10b6:8:2e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Thu,
 22 Oct 2026 13:26:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B9.mail.protection.outlook.com (10.167.23.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:26:34 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:26:30 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v5 3/5] selftests/resctrl: Add support for MBM and MBA tests on AMD
Date: Thu, 22 Oct 2026 13:25:14 +0000
Message-ID: <20261022132517.46805-4-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B9:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c82743-8862-4136-a211-08df304017bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|7416014|376014|6133799003|22082099003|18002099003|261021121427099003|3023799007|261021123027099003|261009223027099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BsOomod4D+GHkMWX0Zkt7045/AiY8yzvl2YMrUVMQj1jMt2+rHe+gFMUBKB7i+WZwmCpam8D4ewt3mKx0+DQpukxEWtPINT0JTmsX9lsSJb02dMhoNM5HAE+mCpPBpyNmzZuc2QbmKCNY5Wjv91fXB66IVxO9cbwAVSumiD0Za1jyRcbQckcXg4eibkqipQVMtUHozxbhPcv5PzF8deQajB/1YX5MKAwyM+Njg9Gy23AlgVJ/XntoyXOGk1dUQLLejHO5CXVhfpmGeKO2Tp35QRIUXuLQaluziUnvooohN11PyvcGLMEHhIdGZASr5WY6MpZMl0shbYqCIObNiUSRw2mkpPB+kmRFfvNtEgnT85par0ozjIeZtPZdRJvLWnnkjTWIvFHRkCq4Iqu9OEjbsedoOm2ieRu8zRYGj/FF1pqOXI1lAZc/NGzZHFmu4BgL2wQ5fAOuIqlpzayrOq8dVvPQmVP0Tbigvo08VVHsbSQMqWWDgWtQmYg7RLubCpfn1OvEfYeCs1SZt02vBhw2a7LD+a1AzMwE4SN9MNeghf56MDI5F6p5HVTss36GLLHehhXL8xXfWqOYM3B/7mLOgn4s3szQUtVO6DOuCfRw9qHytfUGHivKH8Kgfxei5DWCS5TtAq6DL7td+N0+gLcbzgy3mB3AZGsYFHtYbnMtdxqaDB83HS2lOmWyFoYzUqrMaHnhUI+2+N9kOq0DlpHQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(7416014)(376014)(6133799003)(22082099003)(18002099003)(261021121427099003)(3023799007)(261021123027099003)(261009223027099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	57O/uB8bhfc+lEbuNifRKHeg89CNN9f9Zpak0sKupHCJsZH3GBd0oydR8SXBZa5XAfvQvYUpzjvsPSAI+znlyCO9Xob54s5OHstTR9A/75dI1Ywv4kQ1muQJ/EcFDaVYGwxBzJ7K2EXv0zqWIGv3azz+3KMunZIgCxq16PThZpXNTKqUITOaZZ8ykhhjq8w5+F99i8pGVzMJtfSkO7N2PEW6NkGDpop0vQHonm9rn5Ov3/R/Mp8zkEqv1tCmEf/ympJTrB0nJVTFz0Djm/rRIu/NlMUOJ/w8koKtpYufA2wzhhUpwGpY4aFW96HBkvAtuzNZycOzqzIOAR+v55Pa9e1PQvGOy3tgOuJvm8b3xebQkdkpfACDsHPbAuaMrxQWssnjjFruuQapfQh/OT0I0GuVaHYVTCfHrUEm7gXi0tUHYxUHe2uQUq3EVUULoxk0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:26:34.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c82743-8862-4136-a211-08df304017bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799

From: Babu Moger <babu.moger@amd.com>

The MBM and MBA tests validate the resctrl memory bandwidth numbers
against the memory controller performance counters. On Intel these are
the iMC (Integrated Memory Controller) counters and the read event and
umask are discovered from the PMU's sysfs event files.

Commit 25e56847821f ("perf/x86/amd/uncore: Add memory controller
support") added support for the UMC (Unified Memory Controller) perf
events on AMD. Unlike Intel, the UMC PMU does not expose the CAS command
events via sysfs, so program the read event directly:
Number of CAS commands sent for reads: EventCode = 0x0a, umask = 0x1.

Keep all the vendor detection contained in enumerate_mcs() and dispatch
to a vendor specific routine to initialize the counter configuration.
Only reading the counter's perf "type" is common to both vendors, so
factor that out into a shared helper.

On AMD each memory controller (UMC) is exposed as its own PMU
(amd_umc_<n>) that is tied to a specific NUMA node, whereas on Intel
opening an iMC event on the benchmark CPU always resolves to the local
memory controllers. A UMC PMU can only be opened from a CPU that belongs
to the same node and returns -ENODEV otherwise. Since the benchmark runs
on a single CPU, open the counters that are local to that CPU and skip
the UMCs on remote nodes. This both avoids the perf_event_open() failure
and matches the local traffic accounted by mbm_local_bytes.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Babu Moger <babu.moger@amd.com>
Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---

    v4->v5:
    - Rebased onto kselftest/next and reworked for the linked-list counter
      management: read_from_amd_mc_dir() allocates a counter and adds it to
      the list, and the remote-node skipping iterates the list.
    - Vendor detection and dispatch now live in enumerate_mcs().

    v3->v4:
    - Contained all vendor detection in the enumeration routine and
      dispatched to per-vendor routines, factoring the common counter 'type'
      read into a shared helper. (Reinette)
    - Adapted to the upstream read-only bandwidth refactor.
    - Handled the AMD per-node UMC PMU topology: open only the UMCs local to
      the benchmark CPU and skip remote-node UMCs that would otherwise fail
      perf_event_open() with -ENODEV on multi-node systems.
    - Improved the perf_event_open() error reporting (print the errno with
      strerror()).

 tools/testing/selftests/resctrl/resctrl_val.c | 135 ++++++++++++++----
 1 file changed, 111 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index fdbbe2155cea..38cf58c41be1 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -11,6 +11,7 @@
 #include "resctrl.h"
 
 #define UNCORE_IMC		"uncore_imc_"
+#define AMD_UMC			"amd_umc_"
 #define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
@@ -94,12 +95,8 @@ static int open_perf_read_event(int cpu_no, struct mc_counter_config *mc_counter
 	mc_counter->fd = perf_event_open(&mc_counter->pe, -1, cpu_no, -1,
 					  PERF_FLAG_FD_CLOEXEC);
 
-	if (mc_counter->fd == -1) {
-		fprintf(stderr, "Error opening leader %llx\n",
-			mc_counter->pe.config);
-
-		return -1;
-	}
+	if (mc_counter->fd == -1)
+		return -errno;
 
 	return 0;
 }
@@ -183,16 +180,14 @@ static int parse_mc_read_bw_events(char *mc_dir, unsigned int type)
 	return ret;
 }
 
-/* Get type and config of an MC counter's read event. */
-static int read_from_mc_dir(char *mc_dir)
+/* Get the perf "type" of a memory controller counter. Shared by all vendors. */
+static int get_mc_counter_type(const char *mc_dir, unsigned int *type)
 {
 	char mc_counter_type[PATH_MAX];
-	unsigned int type;
 	int path_len;
 	FILE *fp;
 	int ret;
 
-	/* Get type of MC counter */
 	path_len = snprintf(mc_counter_type, sizeof(mc_counter_type),
 			    "%s%s", mc_dir, "type");
 	if (path_len >= sizeof(mc_counter_type)) {
@@ -206,12 +201,29 @@ static int read_from_mc_dir(char *mc_dir)
 
 		return -1;
 	}
-	ret = fscanf(fp, "%u", &type);
+	ret = fscanf(fp, "%u", type);
 	fclose(fp);
 	if (ret <= 0) {
 		ksft_perror("Could not get MC type");
 		return -1;
 	}
+
+	return 0;
+}
+
+/*
+ * Intel: get type and config of an iMC counter's read event. The read event
+ * and umask are discovered from the PMU's sysfs event files.
+ */
+static int read_from_intel_mc_dir(char *mc_dir)
+{
+	unsigned int type;
+	int ret;
+
+	ret = get_mc_counter_type(mc_dir, &type);
+	if (ret)
+		return ret;
+
 	ret = parse_mc_read_bw_events(mc_dir, type);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
@@ -222,10 +234,42 @@ static int read_from_mc_dir(char *mc_dir)
 }
 
 /*
- * Discover the properties of the available MC (Memory Controller)
- * counters in support of needed performance measurement via perf. For each MC
- * counter get it's type and config. Also obtain each counter's event and umask
- * for the memory read events that will be measured.
+ * AMD: get type and config of a UMC counter's read event. The UMC PMU does
+ * not expose the CAS command events via sysfs, so program them directly:
+ * Number of CAS commands sent for reads: EventCode = 0x0a, umask = 0x1
+ */
+static int read_from_amd_mc_dir(char *mc_dir)
+{
+	struct mc_counter_config *mc_counter;
+	unsigned int type;
+	int ret;
+
+	ret = get_mc_counter_type(mc_dir, &type);
+	if (ret)
+		return ret;
+
+	mc_counter = calloc(1, sizeof(*mc_counter));
+	if (!mc_counter) {
+		ksft_perror("Unable to allocate memory for MC counters");
+		return -1;
+	}
+
+	mc_counter->type = type;
+	mc_counter->event = 0xa;
+	mc_counter->umask = 0x1;
+	list_add(&mc_counter->entry, &mc_counters_list);
+
+	return 0;
+}
+
+/*
+ * Discover the properties of the available MC (Memory Controller) counters.
+ * On Intel the memory controller is called Integrated Memory Controller (iMC)
+ * and on AMD it is called Unified Memory Controller (UMC). Discover the
+ * properties of the available counters in support of needed performance
+ * measurement via perf. For each MC counter get it's type and config. Also
+ * obtain each counter's event and umask for the memory read events that will
+ * be measured.
  *
  * Enumerate all these details into a linked list of structures.
  *
@@ -233,6 +277,7 @@ static int read_from_mc_dir(char *mc_dir)
  */
 static int enumerate_mcs(void)
 {
+	int (*read_mc_dir)(char *mc_dir);
 	char mc_dir[512], *temp;
 	struct dirent *ep;
 	char *sysfs_name;
@@ -241,6 +286,10 @@ static int enumerate_mcs(void)
 
 	if (get_vendor() == ARCH_INTEL) {
 		sysfs_name = UNCORE_IMC;
+		read_mc_dir = read_from_intel_mc_dir;
+	} else if (get_vendor() == ARCH_AMD) {
+		sysfs_name = AMD_UMC;
+		read_mc_dir = read_from_amd_mc_dir;
 	} else {
 		ksft_print_msg("Unsupported vendor\n");
 		return -1;
@@ -254,8 +303,9 @@ static int enumerate_mcs(void)
 				continue;
 
 			/*
-			 * mc counters are named as "uncore_imc_<n>", hence
-			 * increment the pointer to point to <n>.
+			 * MC counters are named as "uncore_imc_<n>" on Intel
+			 * and "amd_umc_<n>" on AMD, hence increment the pointer
+			 * to point to <n>.
 			 */
 			temp = temp + strlen(sysfs_name);
 
@@ -267,7 +317,7 @@ static int enumerate_mcs(void)
 			if (temp[0] >= '0' && temp[0] <= '9') {
 				sprintf(mc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_mc_dir(mc_dir);
+				ret = read_mc_dir(mc_dir);
 				if (ret) {
 					closedir(dp);
 
@@ -277,7 +327,9 @@ static int enumerate_mcs(void)
 		}
 		closedir(dp);
 		if (list_empty(&mc_counters_list)) {
-			ksft_print_msg("Unable to find MC counters\n");
+			ksft_print_msg("Unable to find memory controller counters\n");
+			if (get_vendor() == ARCH_AMD)
+				ksft_print_msg("Try loading amd_uncore module\n");
 
 			return -1;
 		}
@@ -335,15 +387,40 @@ static void perf_close_mc_read_mem_bw(void)
 static int perf_open_mc_read_mem_bw(int cpu_no)
 {
 	struct mc_counter_config *mc_counter;
-	int ret;
+	int ret, opened = 0;
 
 	list_for_each_entry(mc_counter, &mc_counters_list, entry)
 		mc_counter->fd = -1;
 
 	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
 		ret = open_perf_read_event(cpu_no, mc_counter);
-		if (ret)
-			goto close_fds;
+		if (!ret) {
+			opened++;
+			continue;
+		}
+
+		/*
+		 * On AMD each memory controller (UMC) has its own PMU that is
+		 * tied to a specific NUMA node, unlike Intel where opening an
+		 * iMC event on the benchmark CPU always resolves to the local
+		 * memory controllers. A UMC PMU can only be opened from a CPU
+		 * that belongs to the same node and returns -ENODEV otherwise.
+		 * The benchmark runs on a single CPU, so skip the UMCs that
+		 * belong to remote nodes and measure only the memory
+		 * controllers local to the benchmark. This matches what
+		 * mbm_local_bytes accounts for on the resctrl side.
+		 */
+		if (ret == -ENODEV && get_vendor() == ARCH_AMD)
+			continue;
+
+		ksft_print_msg("Error opening memory bandwidth performance counter: %s\n",
+			       strerror(-ret));
+		goto close_fds;
+	}
+
+	if (!opened) {
+		ksft_print_msg("Could not open any memory controller counters\n");
+		goto close_fds;
 	}
 
 	return 0;
@@ -363,14 +440,20 @@ static void do_mc_read_mem_bw_test(void)
 {
 	struct mc_counter_config *mc_counter;
 
-	list_for_each_entry(mc_counter, &mc_counters_list, entry)
+	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
+		if (mc_counter->fd == -1)
+			continue;
 		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc_counter);
+	}
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	list_for_each_entry(mc_counter, &mc_counters_list, entry)
+	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
+		if (mc_counter->fd == -1)
+			continue;
 		read_mem_bw_ioctl_perf_event_ioc_disable(mc_counter);
+	}
 }
 
 /*
@@ -395,6 +478,10 @@ static int get_read_mem_bw_mc(float *bw_mc)
 	list_for_each_entry(r, &mc_counters_list, entry) {
 		struct membw_read_format measurement;
 
+		/* Skip memory controllers that were not opened (remote node). */
+		if (r->fd == -1)
+			continue;
+
 		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
 			ksft_perror("Couldn't get read bandwidth through MC");
 			return -1;
-- 
2.43.0

