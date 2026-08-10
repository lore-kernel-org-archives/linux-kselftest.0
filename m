Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69542BC28;
	Mon, 10 Aug 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387781; cv=fail; b=BSAEw5+6NrLU4TcrH6Qoo3w0i93ac+7/IMI8a6QSdiRtMwY0MSK5hv56jcCm755go/QUPjcBH8LyuVWO4MJjRlTgJQxXCk6qbRmC+XEL5PgbHQC/mASLB95amUYm1e7GHFD7WZ+aaTrax0JwnaM3+xlBgNfyb/VuMYZBYXqhDjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387781; c=relaxed/simple;
	bh=Rz/8KqNb8nUr9SXYRodCgTQSA2lmVCQ21fBaANQ8JRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLhJPNCL8sn+8TIC2A8cjw7Dp2e/HCAxdghFd70speGoqVACB2HDNxV2CL7SGWbfeuU/yG/0jGT9LlUGikKid4emTlSx6tcPODtkvhPwk00erLtvr7dTtYdODpRu0A5zuwV40U/XiMD1dUBC+YzcIrlHj6Gqo4W0jTJpOmrcP/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4skDuYRr; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4skDuYRr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBU0DC+IlCJCLV04KSVk9CODVWC6rlie3x9JZfi4g2WNAMwyP+zkx2sl2EgYId241as20rWnucroLRAkRpIIFOhv77bOPCXOjX0EArykJCw+SVcOay99v9zRO2izzWaplFsOGO9ZOiCcT5oKJcqVpNb4N2a9vQAeFlzG5ba69kL85mCqVApluPUXZ3g0FWsZCOCOoKkvE9g2Yp9U4b2n8CDg/uusjIo/BPwnZmnVe8Jh6KlmTJunZ2LMCg5s7kZ8PDQKBwFggUxd48o6GNaI3HFqHIvwcTpJAHxzZB3DRJJeUvU8f0ek1HvRNLbmaIjoDG4+s6gkXifsFwbXJgMATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HQIXpHUioiw3pO6FHs+oJClGa1Mik8fP2n1FTCfgRs=;
 b=wl8HsP63md7uB25kxGDn4Jpr18o3f/D4Mg5F7Mvi0Ik8Ipeodf6kpot+gLAhaoG0lEWGasKiGItG/yHK8PeV6ysToY6VfwJy3oNvP/g47hCbQBVe6gKh+3WfpiGfpTz//Z2zf19iAHYYgq3AP5DMefNVLikV8DU5bsr5uaZ6+oJrBVUNFyyu/EGc5ZQhw5Mny1bkWs9Cq0Hq9xdHJpMBqWapIcBHMZt4WCPg45uASBnD4LIkg4QF9ycpJnTaCxZzu4aBMO42zcCNZlLi6CMHp7Q+PMipIz4hb+DM5ULsf6vayd/5AOmwfxyyQzqxomKKYQ1an7bAik/3wHW3USAoJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HQIXpHUioiw3pO6FHs+oJClGa1Mik8fP2n1FTCfgRs=;
 b=4skDuYRr29oesCMIukWXFzCCxL2gNd4o8DJvcOLjlCGTHH9aA1l3oKQ/hEtWbCiMaiyO0Pj0pbXZbUP4ZJzOG+TlDs8i1QynjXkiqsD8wwLKiAqoLXg8YfK5BlYIhOrW5yitZhQTAT7H+/flOkWfNUH3Xz4VUBX4QJcgkWzh82Q=
Received: from MN0P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::16)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:49:30 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::19) by MN0P222CA0010.outlook.office365.com
 (2603:10b6:208:531::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:49:29 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:49:25 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v4 3/5] selftests/resctrl: Add support for MBM and MBA tests on AMD
Date: Mon, 10 Aug 2026 18:48:04 +0000
Message-ID: <20260810184806.1089507-4-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd0b389-f12b-4384-5c91-08def7101c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|56012099006|11063799006|10067099003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v7o+P5QsJ06JDR7HBPfFv+hqhdqx1gyK1qFzgpAjw90H2CV2oCa1LT7Oek8B3c9GSpCjfmvK4JLbIZQ7k7pjKDx2gddXQV4+kHvjQ1LZOMVL23tFbwLYsGfKj1FoYKbfLlU4BZkQaXCmcwDzW6ZOgcyj5G3rvMspBFi1AC1/vsPMR9gLqgLhFAdZoil44buaqf1zyP5PgHjFhCVkNmYsasZ98Hks+OVtjJn9m5zCJwwhEEWspIZzVR34OJm/YEHaS1KDQ6PXe8A9yQIyKUyO2tDQ1yM+AaEXMiRrBF+bkXc148Rt7CDBfbSlVcbzHdsIPPIM6y/d9m66lKXTjy8DJv3zw0kmeDcRFYZjq993Igh98FVDeQt82+IdFYUlaXX4JKyGDzNRg/GBohvJorA/KQ0pkUi78rmLMTaRmM07+7HAsZICZvzFdfhrHd0tkNwT5ZcIic4cuRqLirN2KF/izD+5kp1yEF7lyNBdoVGtRAUEYMpGhrMpdCezyTzpuHBoDUqBlYnA0aRoEEiY8a9khUHpYnzSHqGe3mL0dNImpnWB/uLg7miHWhR1kvUdbdlBhQhtzfmivGND7+7TXWjG40pKu+4FKG5B7XGLMXdCm/IKjIB67cypf2aCgZUdYhQqUieiPwfi3+yJtrBJqvkoYOHHTWkWZwvRZJQDM8zG+ZwsZMSYvRQqK+1RqaccnvQ1c1vcx3cnWEapL8vYwAKOEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y7c9Yti2d8cMv1Yxp5aemcXDhrjoRIbKkpOmd802UVYgpuThF/TK5M6SBJy3H3NPwf98C8KgBUu5T/2C6tEN+WKL+lKFe1hpdyPfQaffytWn0opk/jZWwYPXgIYAN2BNh3USB7ag2NRT+MieWf5ix2k7xL3VC+BaOpTmMPgoyM3xpKtufMYnlLZ0aX2xWSdELX7rSWLog0cNxXtgLNG+pNhn8DVUAlKV10R42h4sFFA6kmnOpiguUaWwe0tLNQxruPflA47X6Ct8a0lK/fOM5vXZrCck28L3UG5OAlaY6vj/zyNz0aQOCNfmEFj4L3WYZtGluVZ3uv2+8tJuirZZdFKOpEZ9xK+yZHYtH2Nr+ojH6ZkmxTy4H4ziISebQoDGZm5ri6s76ZFkVSrqm6xJjseJcOL9uQVWkqonAkWJXBmR9r41IvjLHyWCRcCaSDWc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:49:29.6225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd0b389-f12b-4384-5c91-08def7101c21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319

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

Keep all the vendor detection contained in num_of_mem_controllers() and
dispatch to a vendor specific routine to initialize the counter
configuration. Only reading the counter's perf "type" is common to both
vendors, so factor that out into a shared helper.

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

v3->v4:
    - Contained all vendor detection in num_of_mem_controllers() and
      dispatched to per-vendor routines, factoring the common counter 'type'
      read into a shared helper. (Reinette)
    - Adapted to the upstream read-only bandwidth refactor.
    - Handled the AMD per-node UMC PMU topology: open only the UMCs local to
      the benchmark CPU and skip remote-node UMCs that would otherwise fail
      perf_event_open() with -ENODEV on multi-node systems.
    - Improved the perf_event_open() error reporting (print the errno with
      strerror()).

 tools/testing/selftests/resctrl/resctrl_val.c | 135 ++++++++++++++----
 1 file changed, 109 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index c6089c42aa7e..4fce7c0c6490 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -11,6 +11,7 @@
 #include "resctrl.h"
 
 #define UNCORE_IMC		"uncore_imc_"
+#define AMD_UMC			"amd_umc_"
 #define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
@@ -99,12 +100,8 @@ static int open_perf_read_event(int i, int cpu_no)
 		perf_event_open(&mc_counters_config[i].pe, -1, cpu_no, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
-	if (mc_counters_config[i].fd == -1) {
-		fprintf(stderr, "Error opening leader %llx\n",
-			mc_counters_config[i].pe.config);
-
-		return -1;
-	}
+	if (mc_counters_config[i].fd == -1)
+		return -errno;
 
 	return 0;
 }
@@ -183,16 +180,14 @@ static int parse_mc_read_bw_events(char *mc_dir, unsigned int type,
 	return ret;
 }
 
-/* Get type and config of an MC counter's read event. */
-static int read_from_mc_dir(char *mc_dir, unsigned int *count)
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
@@ -206,12 +201,29 @@ static int read_from_mc_dir(char *mc_dir, unsigned int *count)
 
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
+static int read_from_intel_mc_dir(char *mc_dir, unsigned int *count)
+{
+	unsigned int type;
+	int ret;
+
+	ret = get_mc_counter_type(mc_dir, &type);
+	if (ret)
+		return ret;
+
 	ret = parse_mc_read_bw_events(mc_dir, type, count);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
@@ -222,12 +234,40 @@ static int read_from_mc_dir(char *mc_dir, unsigned int *count)
 }
 
 /*
- * A system can have 'n' number of MC (Memory Controller)
- * counters, get that 'n'. Discover the properties of the available
- * counters in support of needed performance measurement via perf.
- * For each MC counter get it's type and config. Also obtain each
- * counter's event and umask for the memory read events that will be
- * measured.
+ * AMD: get type and config of a UMC counter's read event. The UMC PMU does
+ * not expose the CAS command events via sysfs, so program them directly:
+ * Number of CAS commands sent for reads: EventCode = 0x0a, umask = 0x1
+ */
+static int read_from_amd_mc_dir(char *mc_dir, unsigned int *count)
+{
+	unsigned int type;
+	int ret;
+
+	ret = get_mc_counter_type(mc_dir, &type);
+	if (ret)
+		return ret;
+
+	if (*count >= MAX_MCS) {
+		ksft_print_msg("Maximum MC count exceeded\n");
+		return -1;
+	}
+
+	mc_counters_config[*count].type = type;
+	mc_counters_config[*count].event = 0xa;
+	mc_counters_config[*count].umask = 0x1;
+	*count += 1;
+
+	return 0;
+}
+
+/*
+ * A system can have 'n' number of MC (Memory Controller) counters, get
+ * that 'n'. On Intel the memory controller is called Integrated Memory
+ * Controller (iMC) and on AMD it is called Unified Memory Controller (UMC).
+ * Discover the properties of the available counters in support of needed
+ * performance measurement via perf. For each MC counter get it's type and
+ * config. Also obtain each counter's event and umask for the memory read
+ * events that will be measured.
  *
  * Enumerate all these details into an array of structures.
  *
@@ -235,6 +275,7 @@ static int read_from_mc_dir(char *mc_dir, unsigned int *count)
  */
 static int num_of_mem_controllers(void)
 {
+	int (*read_mc_dir)(char *mc_dir, unsigned int *count);
 	char mc_dir[512], *temp;
 	unsigned int count = 0;
 	struct dirent *ep;
@@ -244,6 +285,10 @@ static int num_of_mem_controllers(void)
 
 	if (get_vendor() == ARCH_INTEL) {
 		sysfs_name = UNCORE_IMC;
+		read_mc_dir = read_from_intel_mc_dir;
+	} else if (get_vendor() == ARCH_AMD) {
+		sysfs_name = AMD_UMC;
+		read_mc_dir = read_from_amd_mc_dir;
 	} else {
 		ksft_print_msg("Unsupported vendor\n");
 		return -1;
@@ -257,8 +302,9 @@ static int num_of_mem_controllers(void)
 				continue;
 
 			/*
-			 * mc counters are named as "uncore_imc_<n>", hence
-			 * increment the pointer to point to <n>.
+			 * MC counters are named as "uncore_imc_<n>" on Intel
+			 * and "amd_umc_<n>" on AMD, hence increment the pointer
+			 * to point to <n>.
 			 */
 			temp = temp + strlen(sysfs_name);
 
@@ -270,7 +316,7 @@ static int num_of_mem_controllers(void)
 			if (temp[0] >= '0' && temp[0] <= '9') {
 				sprintf(mc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_mc_dir(mc_dir, &count);
+				ret = read_mc_dir(mc_dir, &count);
 				if (ret) {
 					closedir(dp);
 
@@ -280,7 +326,9 @@ static int num_of_mem_controllers(void)
 		}
 		closedir(dp);
 		if (count == 0) {
-			ksft_print_msg("Unable to find MC counters\n");
+			ksft_print_msg("Unable to find memory controller counters\n");
+			if (get_vendor() == ARCH_AMD)
+				ksft_print_msg("Try loading amd_uncore module\n");
 
 			return -1;
 		}
@@ -326,15 +374,40 @@ static void perf_close_mc_read_mem_bw(void)
  */
 static int perf_open_mc_read_mem_bw(int cpu_no)
 {
-	int mc, ret;
+	int mc, ret, opened = 0;
 
 	for (mc = 0; mc < mcs; mc++)
 		mc_counters_config[mc].fd = -1;
 
 	for (mc = 0; mc < mcs; mc++) {
 		ret = open_perf_read_event(mc, cpu_no);
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
@@ -354,14 +427,20 @@ static void do_mc_read_mem_bw_test(void)
 {
 	int mc;
 
-	for (mc = 0; mc < mcs; mc++)
+	for (mc = 0; mc < mcs; mc++) {
+		if (mc_counters_config[mc].fd == -1)
+			continue;
 		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc);
+	}
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	for (mc = 0; mc < mcs; mc++)
+	for (mc = 0; mc < mcs; mc++) {
+		if (mc_counters_config[mc].fd == -1)
+			continue;
 		read_mem_bw_ioctl_perf_event_ioc_disable(mc);
+	}
 }
 
 /*
@@ -388,6 +467,10 @@ static int get_read_mem_bw_mc(float *bw_mc)
 		struct mc_counter_config *r =
 			&mc_counters_config[mc];
 
+		/* Skip memory controllers that were not opened (remote node). */
+		if (r->fd == -1)
+			continue;
+
 		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
 			ksft_perror("Couldn't get read bandwidth through MC");
 			return -1;
-- 
2.43.0

