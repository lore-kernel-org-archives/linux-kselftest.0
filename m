Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F26D368957;
	Wed, 22 Jul 2026 02:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686434; cv=fail; b=LDmvIIXyOUx0+1OrtOHevWpErFVLx5R2Zpxomol9m27ueNdeEwepZ2GD4ADxxDPY3Qx0EkO00hdsIJqsVCd2cDVwBRspA5cAvNw5rKFg3zObXsoGIi95l5fCvx9ehCt0ipt/+pYWcgMrDVROklNdOhj3pTlJ1kJYG6fkudT/+sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686434; c=relaxed/simple;
	bh=SjD1RVHa/EAeeMWIYrMaZ8oN2bZu+BWC8QCRC6J69XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dtds25DT2mT75Okqyv7dpjN6o1pQBjRjHPU54wIzVbzhj24ooWNhQH+55ow3tis/w4oNp/EsVDCvCrAtJH0kH87PZx/LxqSGgOUFbjn3MHlu5lzy2eAZpQJtVUE/SF6qY4LChdNpBxgawmkPW5L8WnjWSoWDeGrQGQmF9UTdzts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KKoQwVS4; arc=fail smtp.client-ip=40.93.196.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KKoQwVS4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1UiXSGCXuX8W6kM3P/qMTYSnQAwS5WRpAS0NHz6Zc8mNafSFRI6lyleO05SEbCQPVpT9I3OFT5YOZLCK/AEO2r6J5mswE6Mjh04ItdA1PtonlxPDwci1KXNU2gTSbNnjYHibWQNW1SgyutZ50W0mIEHOkyRy+eVVZZs7rrYG8Que8PYGg3ZDhiuMfTrNyt1veLnsLou8FiFC+Tjsgkyc25gt7X9BZtkmVWbOZgZtSNS9ABvRZ2o9cPaOSjdqCtad6Ut3a2aktcVSi9zHRA4X1r+3DNR4qUZi12X3sAOUMbQJqQCHKorqqAAvzB+bzQ8u5MYFewgQlSQyKavLPhVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6iqZfgPN+yczwKqNuF43oyP16bdtdJ7DkbPQt37Kxg=;
 b=LcrGFVfHIOG7mBE3gQxyyO5toBCVT5JytlEsrzG5kJi0/616OS0BTlI0ub6PuUTtqPOY7tG43UzjXDTXh3Wq4kgcB9UqR9QxvkN4F+QT3mnnLaFYpUJBnPovh9//yB84GwygqVNTMelpS0/5Y6tBjrePPiTB9jMuBriEJ8GKKawO+dXgiYH5AS1/EHAQtCO/3++W2LaDVQZd/dAOGihH8cJs55BoFOZj8kWYKME3buUqrwb6F6t+dVf0/EB/acK9E27B2TqJcbZ01ucC76+k03JHPb7fqQ7VVTq+nY3J6EwUzL3cMrM+PpvuJ0qBMD0pvTkWC87xr3hbAuv2PoKK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6iqZfgPN+yczwKqNuF43oyP16bdtdJ7DkbPQt37Kxg=;
 b=KKoQwVS4jK8/aE5XJb90zpQFD6JN5YMrOGPN5pvsNncOmQm4CN5waZTTZ9CE+Yze+7lYxkK1D9j3SruIe2TSQ0mq5XHJZdRJyB1nEKzcnScQD3fti/9xvENNvc9XcTyyK8hCmgerJ036lQf+2lOGN2XQecEfoLzYV4mIPOf9HFFTuMfpEOFGP2zBAqcl+b6ja+PfhDhBMGwFbyhls7kuu8FLDrbiJF6CHXGp8ogWAxYzyMVjtiPbXhTWivl6j8RA6ds3VfGgEps7e3a5PaHH7I2bhx+3T3Lu95jYyIBhS/u4X8yZUx5AxqGNENiasUnOlVE+ntBEPEqmCZQsJ6zbqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:13:48 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:13:48 +0000
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
Subject: [PATCH 5/5] selftests/resctrl: Add NVIDIA SCF reference bandwidth backend
Date: Wed, 22 Jul 2026 10:13:03 +0800
Message-ID: <20260722021303.9471-6-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021303.9471-1-icheng@nvidia.com>
References: <20260722021303.9471-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::14) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: abc50e96-c23f-45a8-31f5-08dee796ddac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qQx2NmsvHTcoJ4aC7Gu84ZqGy3KRkfcwq4GR+xijdO1n7z0HgM9e0I0/9QbUOU+oWyPCz/IwijjYPsOl+V1owqcz24+zZK+xyFw//RLi9KPCH22bb+L5GtazgXOpjlwC4/1K/1a7RiWz/0BhKGERFG5lvZwxCTm89n391TfZlV28Q8qJ2VTajLZ2WU9hdv+IhKVf4HOR7WWUc44ktHMHRgZIWu/Wnec1pAzlKwsgIMPlR9AO6ng6ledHqx0v5G0J6DdGu2Up8iLul3875HZ/NWtR+nyfB7QJzgARxHSRgTecC+QUBRS3loTdnREbxEDHlvE2GvYXFL4/Kv5grCzGLRAM93+r3Cp+5PAon462Jq6Hi1Ozn+w+zgc4N9qxh9iLrxAjRm/SNMTDLRg3LZU2GOeNsEAPUT7JE+je1F1XTR4reROeSisWfVgvH6vsgDaKOI8YYoULzNR0DFyvssj9JcQSTQqe7yHXHZKfT2DdwbchUIxQfR516jDWTZ3sqbzPnLLAJ32pPRa279uy83nW22QiYbs2bizTVy8MA8QmCeOAHSkruVAUq4Et8DtQi3YoIXELUIH5+EbSfpyr0szbY2++A01b9T08Z89Y1SWdjaa59+Yad+kholxln9a+EUCd5V4QXj/Qpg5r1ZsEEOizzotZouAp6mfGJMTrBkXfFzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gLv4qOMzWtZDKld9qBi3skrwl1RGKuNupeEHpZ+Wunbhmg6rxsvPHzC38VfJ?=
 =?us-ascii?Q?GO5rDz0vbyuecBr8hiPy2svabN6KdfubembiCYGR/z+35FWtzFKUbWFlSREI?=
 =?us-ascii?Q?5x9EfheheYLBMRIE63ecyRE5S7iyOjaUOWEQon8CedoFgVtNLsfpwyXSmlGr?=
 =?us-ascii?Q?gDPHJJ7t68yhJkYLAyO0H/Y8PIgyIds05MDgaxrRYYe1Wt8j4xT+e8Qo6If/?=
 =?us-ascii?Q?LaqAx7n7ePBHdzztesbyNRq1cJu+SzQ5AnC/J1p2p454+eNHsb3oRQpj6Kws?=
 =?us-ascii?Q?A8y5X9x6I/sndrBxh/3YCf+HQcptCsUcduvs3dTFAFQaRnKkpqqhFX8FNdFf?=
 =?us-ascii?Q?0OW6iCrhLmINtVjikVXRdzCL6W83NXJQlqOuPoQO5l8Yov1PI9qcugLoDf21?=
 =?us-ascii?Q?S7Nzj3K48F8lE6k61zHL9ax5g/3X+D9HJcO8bgNcr3B8sTKdzcUwjzcksOxd?=
 =?us-ascii?Q?jZ8cunI57/cUMmQ3au7oDWXXs5NzdPzA4yJQW7Oxh2ewpgiNdq7A5P2QI+ai?=
 =?us-ascii?Q?KFdbuXKcBkBcBya0his2YfPM5e/OZs29Ps9AuS2ehDC4K3bVNQM8cHHNqOId?=
 =?us-ascii?Q?bvfFvAAgp6BhztO5k0KgakHhAzN6y5D5KPFnkOew3VScFG23THC6yVzMgnNl?=
 =?us-ascii?Q?HY3oaszHOihc+pkJD5srwqXNJtycFgwde0+D1KueWFmNBGsDedt7JKglrSX+?=
 =?us-ascii?Q?qn4SFVxD3jWt3Z0Zn/bSSLjriPAb+v50I+2+f/3UEoxgsQU7+ClX0bDIuwVW?=
 =?us-ascii?Q?eY1Au3mMag9l/AVZURuGevtePj4U5hzDGSYnUApTqfxPvgKBXc6wZuBw8INe?=
 =?us-ascii?Q?mzDi8k5OcRsFJt3G3/iAO4a8+dsqyJtQP661lvZdOpx66SAhAOs/TT9TWelS?=
 =?us-ascii?Q?1ZMQsM2agBzpS/Wr76nZs4K6Md5hBhyXFA+V60bH0xSUkdvurxOHOPFVhO30?=
 =?us-ascii?Q?3sXx5et3vIeP9mw6G9kV9xbBWriHyE96LnvQaSgsbyvcwKSO6fMz+UcR7o0F?=
 =?us-ascii?Q?Mm0RWiFyVqWJ8qK6febsf9UwIXDI0vdgWILgQzI5bZbPc96KKH8owuZhCktH?=
 =?us-ascii?Q?zxYlSDYd+RiIsjoL3FuRg0+c9EfdAV7gCerAyNEgGxqcIjXIiVYrvUtCrXkQ?=
 =?us-ascii?Q?VkbxRP23mb0GGPWo4eU3qDeHtDS3v7U097izgvjc29Zb/jgHCw2jRK8/Nfb8?=
 =?us-ascii?Q?iZxJAKyg2UumYN7TAG3cyoA5iUW9HrAAuiBSypDvMHBAF9SXmgjVkjk1tNWl?=
 =?us-ascii?Q?UxVDFgjPhpXrXme9Tw1m0FrVauV11kRnKEXwEm8IWeoE6GxODhMJ6f59cFDD?=
 =?us-ascii?Q?Z4o03pv7mvAwtgu9WjBxxlMXij6TeS0BnXtyfjXikBO0QFkFeY7tJ4IIfUQ9?=
 =?us-ascii?Q?8twEAfiq1QCW24era9CXfKHC9ebYB6r7AC01hQrqfjEGYHsDt6frJfJgR2TO?=
 =?us-ascii?Q?/WUBQfNWEeCvumOVrT94HL60/0UqyD8USgch+mg9O5zy3J0ztu24l/zIFGps?=
 =?us-ascii?Q?6tB6offKrgNWM24t/z6XusDtxa9IGirGjy54RGJnCEs8j2rXUgxLTEZDiqHf?=
 =?us-ascii?Q?/tbCHdQ3aFrt0XNxEef2x3sXKDx1EgjQjtk7QdVgq/7Lrd5q3zxNjuurNPdi?=
 =?us-ascii?Q?bSAz42PrgtnLk3BpFJ49gl8uk0kw0MLhBW2TrRgNfc4NXYYxu9Ryy7XhhMpA?=
 =?us-ascii?Q?6QDoXDcJmMh+h/m24jktMh5Ppg10cN44AKz3irvudU1OSeviNtLtpTF2/tuF?=
 =?us-ascii?Q?qo43/RjcZw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc50e96-c23f-45a8-31f5-08dee796ddac
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:13:48.6069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mItfpbXn/4eMBY0kSTci1tlECP9z55rDu8JhyIGC6K4826lG46tCS6b2HRSn0/gb3sg6ocLnb7opcOymzQbrYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

NVIDIA Grace/Vera systems expose the SoC coherency fabric (SCF)
uncore PMU, which counts per-socket DRAM traffic and can serve as the
independent reference for the MBA test, in the same role the iMC
plays on x86. Together with the MPAM MB/MB_MON support this makes the
MBA test runnable on arm64.

Implementation notes, all verified on a two-socket Vera system:

 - The arm_cspmu driver registers these PMUs under the generic
   nvidia_uncore_pmu_<n> name, so instances are identified by the
   PMIIDR value in the sysfs "identifier" file (product id 0x2cf =
   SCF) rather than by device name. This also keeps working should a
   future kernel register the PMU under a dedicated name.
 - The driver registers no named events on current silicon, and the
   documented byte counters (cmem_rd_data, gmem_*) read zero under
   load, so the backend programs raw events: 0xF1 (LLC refill, i.e.
   reads) and 0xF3 (LLC writeback, i.e. writes). Each event counts
   64-byte cache lines, the same scale as iMC CAS counts, and
   refill+writeback matches the read+write semantics of MPAM's
   mbm_total_bytes.
 - The SCF PMU is per-socket; the backend selects the instance(s)
   whose cpumask belongs to the benchmark CPU's package.
 - The events are opened system-wide (pid == -1), where inherit must
   be 0 or perf_event_open() fails on this PMU.

Validated against the MPAM MB resource: SCF and mbm_total_bytes agree
within 3-4% across all MBA schemata levels (10%..100%), against the
8% test threshold.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |   2 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 164 +++++++++++++++++-
 2 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 22a887a1b4f8..40352df5303c 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -211,7 +211,7 @@ static int mba_run_test(const struct resctrl_test *test, const struct user_param
 /*
  * The MBA test runs wherever resctrl exposes an MB resource, a memory-bandwidth
  * monitor (x86 local bytes under L3_MON or MPAM total bytes under MB_MON), and
- * an independent reference-bandwidth PMU exists to
+ * an independent reference-bandwidth PMU (Intel iMC or NVIDIA SCF) exists to
  * validate against. It is not gated on CPU vendor.
  */
 static bool mba_feature_check(const struct resctrl_test *test)
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 0c3079d31340..e7b6eb255e3b 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -17,6 +17,23 @@
 #define MAX_BW_COUNTERS		20
 #define MAX_TOKENS		5
 
+/*
+ * NVIDIA SoC uncore/SCF (System Coherency Fabric) PMU: the ARM64 analog of the
+ * Intel iMC reference counters used to cross-check resctrl MBM. On Grace/Vera
+ * the fabric PMU registers generically as "nvidia_uncore_pmu_<n>"; the SCF
+ * instances (one per socket) are identified by the PMIIDR product-id field
+ * (0x2cf), independent of the device name. The driver does not register named
+ * events on this silicon, so the read (LLC refill) and write (LLC writeback)
+ * bandwidth events are encoded raw. Each event counts 64-byte cacheline
+ * transfers, i.e. the same SCALE as Intel CAS counts. Summing read+write
+ * matches resctrl's MBM total bytes (which includes reads and writes).
+ */
+#define UNCORE_NV_SCF		"nvidia_uncore_pmu"
+#define NV_SCF_PRODID		0x2cf
+#define NV_SCF_EVENT_READ	0xF1	/* scf_cache_refill */
+#define NV_SCF_EVENT_WRITE	0xF3	/* scf_cache_wb */
+#define CPU_PKG_ID_PATH		"/sys/devices/system/cpu/cpu%d/topology/physical_package_id"
+
 #define CON_MBM_LOCAL_BYTES_PATH		\
 	"%s/%s/mon_data/mon_L3_%02d/mbm_local_bytes"
 
@@ -258,6 +275,55 @@ static int num_of_imcs(void)
 	return count;
 }
 
+/* Read an unsigned value from a PMU device sysfs attribute. */
+static int read_pmu_value(const char *pmu, const char *attr, int base,
+			  unsigned long *val)
+{
+	char path[600], buf[64];
+	FILE *fp;
+
+	snprintf(path, sizeof(path), "%s/%s/%s", DYN_PMU_PATH, pmu, attr);
+	fp = fopen(path, "r");
+	if (!fp)
+		return -1;
+	if (!fgets(buf, sizeof(buf), fp)) {
+		fclose(fp);
+		return -1;
+	}
+	fclose(fp);
+	*val = strtoul(buf, NULL, base);
+	return 0;
+}
+
+/* physical_package_id (socket) of a logical CPU, < 0 on failure. */
+static int cpu_package_id(int cpu)
+{
+	char path[128];
+	int pkg = -1;
+	FILE *fp;
+
+	snprintf(path, sizeof(path), CPU_PKG_ID_PATH, cpu);
+	fp = fopen(path, "r");
+	if (!fp)
+		return -1;
+	if (fscanf(fp, "%d", &pkg) != 1)
+		pkg = -1;
+	fclose(fp);
+	return pkg;
+}
+
+/* True if @pmu is an NVIDIA SCF instance (PMIIDR product id == NV_SCF_PRODID). */
+static bool is_nvidia_scf_pmu(const char *pmu)
+{
+	unsigned long id;
+
+	if (strncmp(pmu, UNCORE_NV_SCF, sizeof(UNCORE_NV_SCF) - 1))
+		return false;
+	if (read_pmu_value(pmu, "identifier", 16, &id))
+		return false;
+	return ((id >> 20) & 0xfff) == NV_SCF_PRODID;
+}
+
 /* True if any x86 uncore iMC PMU ("uncore_imc_<n>") is present. */
 static bool intel_imc_present(void)
 {
@@ -283,6 +349,93 @@ static bool intel_imc_present(void)
 	return found;
 }
 
+/* True if any NVIDIA SCF PMU instance is present. */
+static bool nvidia_scf_present(void)
+{
+	struct dirent *ep;
+	bool found = false;
+	DIR *dp;
+
+	dp = opendir(DYN_PMU_PATH);
+	if (!dp)
+		return false;
+	while ((ep = readdir(dp))) {
+		if (is_nvidia_scf_pmu(ep->d_name)) {
+			found = true;
+			break;
+		}
+	}
+	closedir(dp);
+	return found;
+}
+
+/*
+ * nvidia_scf_setup_counters - Configure SCF read+write bandwidth counters
+ * @bench_cpu: CPU the benchmark is bound to
+ *
+ * The SCF PMU is per-socket; pick the instance(s) on the benchmark's socket and
+ * configure two raw counters each (LLC refill = reads, LLC writeback = writes).
+ * Per-socket so traffic from the throttled MB domain is attributed correctly.
+ *
+ * Return: 0 on success, < 0 on failure.
+ */
+static int nvidia_scf_setup_counters(int bench_cpu)
+{
+	static const __u64 events[] = { NV_SCF_EVENT_READ, NV_SCF_EVENT_WRITE };
+	int bench_pkg = cpu_package_id(bench_cpu);
+	struct dirent *ep;
+	int n = 0;
+	DIR *dp;
+
+	if (bench_pkg < 0) {
+		ksft_print_msg("Could not determine socket of CPU %d\n", bench_cpu);
+		return -1;
+	}
+
+	dp = opendir(DYN_PMU_PATH);
+	if (!dp) {
+		ksft_perror("Unable to open PMU directory");
+		return -1;
+	}
+
+	while ((ep = readdir(dp))) {
+		unsigned long type, pmu_cpu;
+		size_t e;
+
+		if (!is_nvidia_scf_pmu(ep->d_name))
+			continue;
+		/* cpumask holds the representative CPU of this PMU instance. */
+		if (read_pmu_value(ep->d_name, "cpumask", 10, &pmu_cpu))
+			continue;
+		if (cpu_package_id((int)pmu_cpu) != bench_pkg)
+			continue;
+		if (read_pmu_value(ep->d_name, "type", 10, &type))
+			continue;
+
+		for (e = 0; e < ARRAY_SIZE(events) && n < MAX_BW_COUNTERS; e++) {
+			memset(&bw_counters[n], 0,
+			       sizeof(bw_counters[n]));
+			bw_counters[n].type = (__u32)type;
+			bw_counters[n].event = events[e];
+			bw_counters[n].umask = 0;
+			bw_counters[n].cpu = (int)pmu_cpu;
+			read_mem_bw_initialize_perf_event_attr(n);
+			/* System-wide (pid == -1) CPU event: inherit is invalid. */
+			bw_counters[n].pe.inherit = 0;
+			n++;
+		}
+	}
+	closedir(dp);
+
+	if (n == 0) {
+		ksft_print_msg("No NVIDIA SCF PMU found for socket %d\n", bench_pkg);
+		return -1;
+	}
+
+	nr_bw_counters = n;
+	return 0;
+}
+
 /*
  * imc_setup_counters - Configure iMC CAS-count-read counters
  * @bench_cpu: CPU the benchmark is bound to
@@ -315,6 +468,11 @@ static const struct mem_bw_backend mem_bw_backends[] = {
 		.detect = intel_imc_present,
 		.setup_counters = imc_setup_counters,
 	},
+	{
+		.name = "NVIDIA SCF",
+		.detect = nvidia_scf_present,
+		.setup_counters = nvidia_scf_setup_counters,
+	},
 };
 
 /*
@@ -430,7 +588,7 @@ static void do_mem_bw_test(void)
  * get_mem_bw_ref - Memory bandwidth as reported by the reference PMU counters
  *
  * Sum all configured reference counters, scaled to MiB: read CAS counts on
- * the x86 iMC.
+ * the x86 iMC, LLC refill + writeback counts on the NVIDIA SCF.
  *
  * Return: = 0 on success. < 0 on failure.
  */
@@ -661,8 +819,8 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_ref,
  * @bm_pid:		PID that runs the benchmark
  *
  * Measure memory bandwidth from resctrl and from the independent reference
- * PMU. Compare the two values to validate resctrl value. It takes 1 sec to
- * measure the data.
+ * PMU (iMC on x86, SCF on NVIDIA ARM64). Compare the two values to validate
+ * resctrl value. It takes 1 sec to measure the data.
  * resctrl does not distinguish between read and write operations so
  * its data includes all memory operations.
  */
-- 
2.43.0

