Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD9388E68;
	Wed, 22 Jul 2026 02:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686422; cv=fail; b=bQyScu61UbFNAqLevmGMxOXc1OE/Bm36Iuop/Z6naG1QOyxkwzStePpGVA64vU6mwEAbP2nXqdR91yGvVX0UC1kU5bWWaHTAp0rVdm6bV/2+VPX782Hx6TLxQCH9nzN6d8UhwR+UWzwp3xbuAAkmxNSQks7jJc/6yTuHabcj55I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686422; c=relaxed/simple;
	bh=PVPJGqbAeH60CiLxG/vegQpow0sXbcGFg4yJbq/dXBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qFUCGJh2zhi2gxmA4v7S1E8ohyRb36ihNHBJjJhdWz3RV2UPX0O9H3Ardj45MpOGgrvzmsBMdASR+6Kwo5r0ufgIC2zSJfBFWeCOGyohY3DLHsiT428m9SYe2IvkD1n6lHJuLp6XDOa0Tz6M6kWtotg0M0yZ/bkUseHrsYEn9mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UlKYz/lj; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UlKYz/lj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dxr4bZFbcLRmsx6yFWhUMmUS0PDJ9UN1W1nxbemxRVMMh+fkDoFLnV55FrMZHHI7X2QQFk36PVEEnAmcFm4Fqb8wdjbxIGHtVKexSEQ2Y5alp6vPkJeHsH2szDzPFv0KAIRc+JSrRl60W73HrYevLujuHmReaHealCuaFGe+WXydnW/aSLPX+ny7f+UoUdXcRX0MyRwIp15JW5pEal/nzLFzHVWkQ9ousr4EsLRtppFVVLtSYVdG3vb3OlWrr/LwSjULqqYohavc26vapgwtINvEzOz5mBnbJqP5CZdI2899nbPphki8FTwq+7LBGN/fGEO5XLAI7ghb/Tc581dg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJZLGHcDNEvLcg0fyvZny0rcCFqacEclqhQuhC+wFJk=;
 b=yf+oLNN6xQDE+PawSoAsKC+gI/n8bKQGjThLP0ta9Idnu6blMar88Y0v+ARsACu75hRPS+ZYM0Ekj3F6CmX7XFBdWYHs6rOinLsVznUCRTTFyk1taGsJuLzcFrUPVCgFz/Ymh1ZHVDTvZGln1VR0QsBbIXHaF2fSMwhQNOC4JqXzlpq5w1EH78yC5oqmTalRkccJtOt74sj5/afmIGzZsd+oijteFe2SgEqYwLaNCFUdzKu6FTlz0pNV3RBxhkqIn7IzpLvae/TCqezI8C6ct3EVDfz1GrmdI8+6ycn9z4mA1KzEELKttrwwXY0DtBdyuHnklXRxqe6cyoGVjOnyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJZLGHcDNEvLcg0fyvZny0rcCFqacEclqhQuhC+wFJk=;
 b=UlKYz/ljMpMmaz3LKrR5qAM1jwKn0a9l46NkLFpCIZE33i6VtC2/eRktlwWuahhOUow8YUKh5e4zeuJUn81/F/moWTHL4EzmnlfHojDtvZmgAZQ0wWXN7vDxfdDzZ6CVxn06HPhkXNPrdb+x1zYqHwKJZ/mEJqSVByJLCJyFneldkDY24/RINvjCwQw47EKc08VnMxG4fbmiCpr75jT3YldMORQ6SE+H8+JbGpZay6Rfga0dUQxDEUlG0vbe6ZD20IXChQPOwr0428wWsZiOZC3gaFEjfo18s+R+DMIiQ3lMNKA2YH9BXTMUtGLwHhh3VEW6X8cpacugILYIgTxDPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:13:34 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:13:34 +0000
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
Subject: [PATCH 3/5] selftests/resctrl: Support the MPAM memory bandwidth monitoring layout
Date: Wed, 22 Jul 2026 10:13:01 +0800
Message-ID: <20260722021303.9471-4-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021303.9471-1-icheng@nvidia.com>
References: <20260722021303.9471-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0036.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::15) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c092c1-e5b4-4b6c-208b-08dee796d4f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|5023799004|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/HshBzvXTqkFDEe+Fln5z9aJrWrOZ75cGT/54Ys9MpZyyuqcj67gNfxCLSDWFWGy2+JXlYke67lXKs7fGP+hkNZUEirnABkBrsbSQHOi+l2eTZMsGv0o63ltBAm0wXlXQfevFy63T23a02vUUfCJioCYjDvBiyjZohgiM+va4skkAyFLZqaDpozD0FizGKLaKwNTIPWcucp9ywvlOcbUCYlUdSTzekalWferBPUXlmqWsqIjMTpXwi+1INem5ls7FznJYYNsVvLRbjSVYHb+y1R1wBV5YYc368wBDJ13F25o5WiQNi9AyQL864bVaJJn61eIGmPp8lAIsS1QtpaT6Rh4Fp+AHKPa9bPxNaVbcFk4VQutsCqpQ8HsYSV+YM0vuQlsCFXMpS6bZXyYujrCc96gvYkX0QuUjTSUpqDefGRJc6GhUsjfT+M5hDt0ICdjN0BlWGDv4f/C/aQExxLcgkgXTt7z1j2tO7nrtROUQ/khjbqJi1b9E1uLME4i+CiZBOR32W6LZ0oPx2+n49/Wtjl87soFKITdsmH826Lgqt/eCJoYD2Vm9mzQPNMfNn1BRdThbzq9J5lV99xVL3sACrWS7JDYZNUxYSUBFdQHjS2mjHNZTr6IOYWC0ZuoCw2EELOBHkS3CvjTAFPaP9fgswhmodDxNDgs9Gx0HajuAEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(5023799004)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y1AqHgiBOuvgyFNg/7rrMPIPw5WKhAqja8wYqOwHw4CKUCwhTYhWofZNUzpx?=
 =?us-ascii?Q?kpZBDKMMWO1BLV1VxhXoujCrf8QarhJ1dQWCXfotYLWTWF/8VCKCtuwtmF7J?=
 =?us-ascii?Q?NJNpC4eB90VPu6LYTMeWJOGAVFj5zkK/dKhzPIT0jCnwVRH0Zdsn4CZOXX0e?=
 =?us-ascii?Q?zNSmOuA23Njw3pzjnNl3clxaHTugeBoUdNR2Nb1lm8Ispf+F7zTTvClDwk/C?=
 =?us-ascii?Q?HxOogmeYP9YEd6LlsxaFjCww86o0d95oxKs79Bao5PPpzEfBMkU8RunInJWr?=
 =?us-ascii?Q?C/1WOBhCOqFmZiLPNt532/w3cWbbkSPpunSD2ZehiiYVW1X651P5XNCnhZGW?=
 =?us-ascii?Q?aEpLoKNWJfYpakZGCw8FESVnGn9D4Rb1lJR0sZftdYoz59xhuRX4nK29Xxev?=
 =?us-ascii?Q?SbMHtWKTsJu/OrcuY39oDv1WoOYB3q3nDkZDxI6V0DGW7xJvfcGXFBBIqS33?=
 =?us-ascii?Q?JM+lPDUj4my5I2o8QJ3D5eUsjW+JNITX0HjibDaVDsUfbrfYT2mdghDuOLUs?=
 =?us-ascii?Q?CFo/GsSLgiylWJ7G/CwrMagHIulo6y3CcMjhoX09VOMri+7nB6fM/1BCK6tq?=
 =?us-ascii?Q?63jOLCOL6soH77tSAIfDzuvvs0J0161y5JOjZeTw0N5G2wBBCfJZ9Ywf5CRC?=
 =?us-ascii?Q?zKaoqqN2Yu+XIFRq6QQz56EHyDdy9+xFCBT4q8Ny3c7uMztYQE+Pjt4Tpw7n?=
 =?us-ascii?Q?5+clsDIQeYtyxMjpApCKNYxUAKZ9GniYud7XU2kl0kX5dxZMsQFO5nAWqsjN?=
 =?us-ascii?Q?1+jLoV64lkwOESyfIOYWoJyqXWvlLnQvfgrKJ4xoBwlkBBp/hW32Wv58g5cs?=
 =?us-ascii?Q?HUzIDcqiwccTsDOGHJx75okk4noW5IoQ104prRO0C30iYb2fLvB0VD1C/k38?=
 =?us-ascii?Q?vqgWdAM1FsF+hDRwrV9vt44yNXb42NlXrCfBBoki92kDAK7tG49grDXBpI+F?=
 =?us-ascii?Q?tXAzY956Vx08QnnbkZiznzqKgjhLyKsqRLsmEw1acUUSw3fU3XkeJEQHjP8E?=
 =?us-ascii?Q?qyhx/K2OVIq3s2vW46Yb5LrBmp5v8pkQJAw1IrIUC3+lzr1F7wBEYXxSNQV3?=
 =?us-ascii?Q?y45SM++p1NcSV562jbwj8OZkgiCtNRp5Lcxyx0hbWzwkIYEL9xYoBheN8e8i?=
 =?us-ascii?Q?gDd951qx7Bm7ZX9NLN7VA1zqMaZ5hy2ACvn4+XUtTP/ZpBTC72Tm/GjZM1Fe?=
 =?us-ascii?Q?sw3p3BPId/t8bgEG541RPYefkqAUkv5xzDWtqTgIE1bAcwypDnsofJuia6/W?=
 =?us-ascii?Q?UhRNFvX59IfQxz89m1yTwovzzzg5TwyyjgMH6itZ5a39AzB8GPgXYkumBCaV?=
 =?us-ascii?Q?W9Jc0hin9E6CXQAR+h0YBpiGap8RWUvRX4LbqypAB5OuBrtj97uhChOYu0li?=
 =?us-ascii?Q?yXspoxnicoQ2ZyOHsNLFDfkWeZF19Hzw660MrHvzcJo+pNqc3WCmdMlu1GiO?=
 =?us-ascii?Q?9pomwz6STCB8mqrf1yvDjM3R8ZvmUJQ/AdKRgAZJnL8LEZ15W79mHfrBrJIL?=
 =?us-ascii?Q?JEmN42G1LZOpSR1OP2Thu/rrbDR7JQEdUTjZQgd8AEUTkJByDNIURw4jb7aQ?=
 =?us-ascii?Q?sKHNeT+zRIZGJ8l6J7zlkTGftAnf9E99KEj7DjlNILKp3C/pTcZsSZJuyus3?=
 =?us-ascii?Q?u7vglUZ8dv4srbIvQPqHRM//z4lQcmlvg1BIsOyRpltJcRIcnurEcsI5WO/h?=
 =?us-ascii?Q?NAMq0a/Mdf7xvhmP2JwnMGCHWYl8k83soi/kPxcZhvvEQt4RU7HHlVjZSgr4?=
 =?us-ascii?Q?UibTF+dvkg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c092c1-e5b4-4b6c-208b-08dee796d4f0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:13:34.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzSB3ulAiCDqXQawpR55nMGwZKQQ4KhooEsSbExnTS1Bi+ricu3wlNdJOkEb182Ab40QDcndw4y9vr+0ksw/JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

Arm MPAM systems running resctrl expose memory bandwidth differently
from x86:

 - MB control/monitor domains are keyed by NUMA node id, which need
   not match the L3 cache id (on a Grace/Vera system L3 ids are {1,2}
   while MB domains are {0,1,2,10,...}).
 - Monitoring lives in a separate MB_MON resource that provides only
   mbm_total_bytes; there is no local/total split and no L3_MON
   bandwidth event.
 - In "mbm_event" (ABMC) assignment mode a hardware counter must be
   explicitly assigned to a group+domain+event before the bandwidth
   file returns a value (it reads "Unassigned" otherwise), and
   removing a group does not release its counter, so it must be
   unassigned explicitly or it leaks.

Teach the test framework this layout:

 - get_domain_id() resolves MB domains via the CPU's NUMA node when
   the MB_MON resource exists. x86 (no MB_MON) is unaffected.
 - initialize_mem_bw_resctrl() falls back to
   mon_MB_<domain>/mbm_total_bytes when mbm_local_bytes is absent,
   and assigns an ABMC counter when the group's mbm_MB_assignments
   file is present. Note the assignment parser requires a trailing
   newline; without it the write fails with EINVAL.
 - mem_bw_ref_cleanup() unassigns the counter again.
 - The MBA feature check accepts MB_MON's mbm_total_bytes as the
   monitoring source.

Comparing a reference PMU total (read+write) with mbm_total_bytes is
a like-for-like comparison; the iMC path keeps comparing read
bandwidth with mbm_local_bytes as before.

No effect yet on any vendor: the MBA test is still gated to Intel.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |  3 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 69 +++++++++++++++++--
 tools/testing/selftests/resctrl/resctrlfs.c   | 45 +++++++++++-
 3 files changed, 111 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 8b891d3e6650..6c85107c32ee 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -211,7 +211,8 @@ static int mba_run_test(const struct resctrl_test *test, const struct user_param
 static bool mba_feature_check(const struct resctrl_test *test)
 {
 	return test_resource_feature_check(test) &&
-	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes") &&
+	       (resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes") ||
+		resctrl_mon_feature_exists("MB_MON", "mbm_total_bytes")) &&
 	       mem_bw_ref_available();
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index a2b919bd4839..0c3079d31340 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -20,6 +20,21 @@
 #define CON_MBM_LOCAL_BYTES_PATH		\
 	"%s/%s/mon_data/mon_L3_%02d/mbm_local_bytes"
 
+/*
+ * MPAM exposes only total (read+write) bandwidth, under MB_MON, and per the
+ * NUMA-node-keyed MB domain rather than the L3 cache id.
+ */
+#define CON_MBM_TOTAL_BYTES_PATH		\
+	"%s/%s/mon_data/mon_MB_%02d/mbm_total_bytes"
+
+/*
+ * In MPAM "mbm_event" (ABMC) counter-assignment mode a hardware counter must
+ * be explicitly assigned to a group+domain+event before the bandwidth file
+ * reads a value; otherwise it returns "Unassigned".
+ */
+#define MBM_MB_ASSIGN_PATH			\
+	"%s/%s/mbm_MB_assignments"
+
 struct membw_read_format {
 	__u64 value;         /* The value of the event */
 	__u64 time_enabled;  /* if PERF_FORMAT_TOTAL_TIME_ENABLED */
@@ -58,6 +73,10 @@ static struct mem_bw_counter bw_counters[MAX_BW_COUNTERS];
 static const struct resctrl_test *current_test;
 static const struct mem_bw_backend *mem_bw_backend;
 
+/* MPAM ABMC counter assignment state, see initialize_mem_bw_resctrl(). */
+static char mbm_assign_path[1024];
+static int mbm_assign_domain = -1;
+
 static void read_mem_bw_initialize_perf_event_attr(int i)
 {
 	memset(&bw_counters[i].pe, 0,
@@ -452,21 +471,63 @@ static int get_mem_bw_ref(float *bw_ref)
  * initialize_mem_bw_resctrl:	Appropriately populate "mbm_total_path"
  * @param:	Parameters passed to resctrl_val()
  * @domain_id:	Domain ID (cache ID; for MB, L3 cache ID)
+ *
+ * x86 resctrl reports per-RMID local bandwidth under L3_MON. MPAM exposes only
+ * total (read+write) bandwidth under MB_MON, indexed by the NUMA-node-keyed MB
+ * domain, and in "mbm_event" (ABMC) mode a hardware counter must be assigned to
+ * the group+domain before the file reads a value.
  */
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
 			       int domain_id)
 {
-	sprintf(mbm_total_path, CON_MBM_LOCAL_BYTES_PATH, RESCTRL_PATH,
-		param->ctrlgrp, domain_id);
+	const char *grp = param->ctrlgrp ? param->ctrlgrp : "";
+
+	if (resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes")) {
+		sprintf(mbm_total_path, CON_MBM_LOCAL_BYTES_PATH, RESCTRL_PATH,
+			grp, domain_id);
+		return;
+	}
+
+	/* MPAM: total bandwidth under MB_MON. */
+	sprintf(mbm_total_path, CON_MBM_TOTAL_BYTES_PATH, RESCTRL_PATH,
+		grp, domain_id);
+
+	/* Assign an ABMC counter for this group+domain if in mbm_event mode. */
+	snprintf(mbm_assign_path, sizeof(mbm_assign_path), MBM_MB_ASSIGN_PATH,
+		 RESCTRL_PATH, grp);
+	if (access(mbm_assign_path, W_OK) == 0) {
+		FILE *fp = fopen(mbm_assign_path, "w");
+
+		if (fp) {
+			/* The assignment parser requires a trailing newline. */
+			fprintf(fp, "mbm_total_bytes:%d=e\n", domain_id);
+			fclose(fp);
+			mbm_assign_domain = domain_id;
+		}
+	} else {
+		/* Not in counter-assignment mode (or no MB_MON); nothing to do. */
+		mbm_assign_path[0] = '\0';
+	}
 }
 
 /*
- * mem_bw_ref_cleanup - Reset the selected reference-bandwidth backend
+ * mem_bw_ref_cleanup - Release an assigned ABMC counter and reset backend state
  *
- * Safe to call when no backend was selected.
+ * Group removal does not reclaim assigned MPAM counters, so the test must
+ * unassign explicitly. Safe to call when nothing was assigned.
  */
 void mem_bw_ref_cleanup(void)
 {
+	if (mbm_assign_domain >= 0 && mbm_assign_path[0]) {
+		FILE *fp = fopen(mbm_assign_path, "w");
+
+		if (fp) {
+			fprintf(fp, "mbm_total_bytes:%d=_\n", mbm_assign_domain);
+			fclose(fp);
+		}
+	}
+	mbm_assign_domain = -1;
+	mbm_assign_path[0] = '\0';
 	mem_bw_backend = NULL;
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index b9c1bfb6cc02..893f6748c68c 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -121,11 +121,40 @@ static int get_resource_cache_level(const char *resource)
 	return get_cache_level(resource);
 }
 
+/*
+ * cpu_to_numa_node - NUMA node a logical CPU belongs to
+ * @cpu_no:	CPU number
+ *
+ * Reads the "node<N>" symlink in the CPU's sysfs directory.
+ *
+ * Return: NUMA node id (>= 0) on success, < 0 on failure.
+ */
+static int cpu_to_numa_node(int cpu_no)
+{
+	char cpu_dir[1024];
+	struct dirent *ep;
+	int node = -1;
+	DIR *dp;
+
+	snprintf(cpu_dir, sizeof(cpu_dir), "%s%d", PHYS_ID_PATH, cpu_no);
+	dp = opendir(cpu_dir);
+	if (!dp)
+		return -1;
+	while ((ep = readdir(dp))) {
+		if (!strncmp(ep->d_name, "node", 4) && isdigit(ep->d_name[4])) {
+			node = atoi(ep->d_name + 4);
+			break;
+		}
+	}
+	closedir(dp);
+	return node;
+}
+
 /*
  * get_domain_id - Get resctrl domain ID for a specified CPU
  * @resource:	resource name
  * @cpu_no:	CPU number
- * @domain_id:	domain ID (cache ID; for MB, L3 cache ID)
+ * @domain_id:	domain ID (cache ID; for MB, L3 cache ID, or NUMA node on MPAM)
  *
  * Return: >= 0 on success, < 0 on failure.
  */
@@ -135,6 +164,20 @@ int get_domain_id(const char *resource, int cpu_no, int *domain_id)
 	int cache_num;
 	FILE *fp;
 
+	/*
+	 * On MPAM the MB monitoring/allocation domains are keyed by NUMA node
+	 * (surfaced via a separate MB_MON group) and need not match the L3 cache
+	 * id used on x86, so resolve the MB domain from the CPU's NUMA node.
+	 */
+	if (!strcmp(resource, "MB") && resctrl_resource_exists("MB_MON")) {
+		int node = cpu_to_numa_node(cpu_no);
+
+		if (node >= 0) {
+			*domain_id = node;
+			return 0;
+		}
+	}
+
 	cache_num = get_resource_cache_level(resource);
 	if (cache_num < 0)
 		return cache_num;
-- 
2.43.0

