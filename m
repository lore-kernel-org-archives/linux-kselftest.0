Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F6B388E68;
	Wed, 22 Jul 2026 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686413; cv=fail; b=f6nbNab/ipxQjaU/ANHF1t9GvFT33+q/3efDL6rIfXdnFeTrPDVhFZNfezqKoL6FNb3SpIrGBNRzycsGvZBbez+DvH+5O0uw7juRsDsxEGuzdEhdxfLzgaq7uWPBu+Q+S71uTZ/WSaIYdK+JrGjH8rcyfcH961H0NHt+36R29u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686413; c=relaxed/simple;
	bh=vTw8hO2jk/SU76/esJAx1ml9G6kUKteWpP+M1WRjPtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u6w8iDt2oL7X0LRjxZ3f4S2Wece8EZqR3OTXtAJFCjHhmZE9XHCBNqOEho1zvmx0m6mtM+ht75oO2zmzuHkagTM9OWzP+y1jwVkvxOmzKHmfLLfOsa5pWkUjSR8NjIACzGzQrKocw5Do6Y0zyF1NlO3Mys2HRdNp0AiVhNSv5zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vpu+DXLf; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vpu+DXLf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzQT/HvrMlqqKGz+U++yTVUpDRyX/IXy9T8FFWbf/sbS1Pz00D0/r2VjLKgGIOMID7nZGKu1oMWi0NpE3fwMIbnezqyOJfmi/BXcQIfCMbJjNyVcrlUeqL8LJKXIVjLYQVEY+PqpJm5V4kDt9O96o8cQOC5Nx+PD2V1HRF3CQb2ExqYA9sRY58NFos/h8Be0L5dA/Tf+Kbw3e+Eo2W8+G4zQYvKocOyUru5WY6vTIBnFTpPSLEfJbrbfIWdWLCf+76epJBtZUZaZXDi/XnKRWtF+eGgFUc1V0WonMF+YHFL+TmTcRbX7JLdC8jGhSTBH4sRP33XvDhRcxBSdTO+uEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GjrW5SBJciLJDjKXrnxUISAjSv14y9IexFVu22a+0Q=;
 b=dmNnIs44rz0efvmCfmtW1Hzz3cqJY73aT8JMJs35SNoio8CtYrupBqLtTOZfPGFBITVGy6zU8UUtR/Ba85w9dprjdNJTelMWqb+dqjwdwGEOSyIB1HSwWCnqX34SalV1vpnnDT2R1wdoQKZr3fNUGUHEkzPidYKzOz3CU0yLx+4pHoPC1aYhMEAzsuYdZXGieK1LnxtbZR2UWBSRxcyg+hROUH1yvzHHaqJoiq59KL/mXiCH1yAC3LFgDgHH5waDTGxrFS5OiRiNOmb/3Uo9Ewr0ugmv+7n0qgvzYpClqaUKDoAd2BAJAlPIGFedYXqBSYHS8Gp2YXPiY9XClUUuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GjrW5SBJciLJDjKXrnxUISAjSv14y9IexFVu22a+0Q=;
 b=Vpu+DXLfaZHzMVoihnomRPiC9NLUCJlgVrC2K2ZzPmgv37FpmiNSsZBIfpdPYLJzmTKwOOEanpNpiu1wLcbqTAUxYkfFRXBvW0H12IJciBwFpNAeZ9H4VhxCCr+D2f6TqZk2yvseK42aop4lR69EJyi6JxHmyId3wZ8ForhJiUKTlU6iNPNzXJsbqH/Fia8o2D8wm199bIdkipwXa32mv38N1xwOxOMrk0SNWl9RuPxs6WuoVPBkZ93tFRt6vnQgHiHLyGrXVlP5PLrOoLDHpDYgD20b55Qx/s8jlJ2Aqaue7qUOBN8X7Tu1ZLHucZ/MecQUaQ0RwD5FafvYhTT/pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:13:28 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:13:28 +0000
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
Subject: [PATCH 2/5] selftests/resctrl: Abstract reference bandwidth counters behind a backend
Date: Wed, 22 Jul 2026 10:13:00 +0800
Message-ID: <20260722021303.9471-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021303.9471-1-icheng@nvidia.com>
References: <20260722021303.9471-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0044.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::6)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b33001-a644-4d88-d34c-08dee796d15e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d0favaZgAss2O8tBHvHF7/ICH6O346IbIGcQTlPVM2VecDkvFAoVwbpfz+iFFBnhO/if4gc7uhO9oNAQMmals0dtH0Jh5lJXv37jW33jN4bc6riorQpuDmbK/PIe7ebYXDaNK44FOvzOj+QOiLkG4NC5NNm6j4TCA0FDuuDhfzeNVlO2jjsETyyRhseQkURlDWWwLmoPkMr+KSLT/jmgZud0zjSNZt/zp7GxUIbVtC/NKqVdKjZ2csphfd4L8jfvuwSSRgLPRNwXfOI6yvOXKnyCWfLrrTxQs+AuBbl5DSh9HtCE/guDpQn6QOV/3I1nlxmskp4o2VXvQv74fa8fB1RC2Sf9tk+NY7jWzp4N7OQwfZF1q6OVS+B7Cf/p9egu3IIxMh/2XZDC7tE+L4w20Ds3Z5gzfiDIvcQslUEo21I6r5tECCKq2vW0n4iuYrV+x+lCfj+XIa8GoEpccfLTGhgB6naYEYJC8JRg9mNXTStA+/3Cj+AlzE6pVyLFcy7+7orB5cJj3Uj0asfdhLCl7QUC5iCZW/4eGcDGwnYOwDC48UNvzpioMyrJrejxyQfOzZEkuZ5+psEz8QDm1opafqaiq6DGZtJ+r1Pf1uT28VB9NIseKhUL6M4h+tRCzdi4pgjhrvB4OtFIvaLoVhO/Z0mWP3aMkht72gqLKW0a8xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MCjCriLjvbW2KYwIfB4NGFeFCKFYP+IAglMknqiF4HW///vHUGs1pYDJ20PM?=
 =?us-ascii?Q?RePIR/nDSfGxj1rwY1Dkn5T0Bt4qEqkBXZlFIQXMP1QleYEyaOcZNC9hYrA5?=
 =?us-ascii?Q?ZkbsKNzNNbK0OgXcQg+Eq20LEkl1nUpowqsHnvhHoSbR6nBrYAjxx3KzRe31?=
 =?us-ascii?Q?4siW/vb8IOiOv9X/lFDlZzw9plAeOILjbXW/iYx9OFoqjWO+fEH/CGV6bhNv?=
 =?us-ascii?Q?mfafNVYvgPohdacaxBJnYVY3+hv18wPbIVVXY7K2jicYQqIcyNO7mcMz+JRJ?=
 =?us-ascii?Q?2u+y6JTcGe9JCHGPhjv9sAUvfoP2Eg7T3wujOj4PkjGq25OKKMvgzen8vRim?=
 =?us-ascii?Q?Gz5KszXG5/bSMmYLLO8bBC9oBj7rH5Nki+W89Me+vPhIrnVESzuFXRs/qfv/?=
 =?us-ascii?Q?GZ5Rk+TAfL8T9Bg0E4YcxuLjhH0OUD0hBZpzIfaVlITGgDo1Exa7ul4i/2h3?=
 =?us-ascii?Q?tuQlYvz3oTdWzVQC/rfLeXXyxFcZ1iEyI23K4qFBj4vlD4vzAG/uedPjNZDD?=
 =?us-ascii?Q?U1rvEvLEZydWkTn8eYgvONkXy615F+7UNjgY/T7cymAhQYEaWMxy3HJSOAyd?=
 =?us-ascii?Q?WBM2tfvQ81xtXaw8f8tERTah5goqyTboODLkp1fB4zHIEJK0zr2ma1pgHkzl?=
 =?us-ascii?Q?K+FVq8busLjHcrMuHWDgHRYW5S71oHhbMbiD1huu/p4nxga+gTP5Vc3g+C7U?=
 =?us-ascii?Q?YyERapd6suCVXsxbYezz6xh0n7tj9vd08+McmdVNdVe68d4Yuo9b/zu1410m?=
 =?us-ascii?Q?iSylWWGhKGgGuf8VNUP8aF34/xCcg1CVNDDU3w/y5CRps+HzqUNqDjgGvt1S?=
 =?us-ascii?Q?VHPPW9kM1MNFpOuq5e9m6felu848X/mWSY+wMMVyFHpeXYpq1ngdOsE4n20T?=
 =?us-ascii?Q?Pthoiyn4ZEcmAEYpJTjedlRWu+0PdD7ryWjss7JvgOmX1exiWe8S0xHFCkbb?=
 =?us-ascii?Q?VMj+RUQ3VT9Hzii1Z3EadcmAkKRoFH2eX4ZUzNjzJrfA6zyNWvhJYRvCVYA2?=
 =?us-ascii?Q?eXLjh4NlA/h0J1sUyMGAT/iBp+JkV3Ol2CxJYV59YD72hthWrL5jUeHsdPxe?=
 =?us-ascii?Q?VRRAue+uYHI1BUDqEYqpEPCjCtjJ2E/ftW75kUfo/pH6TqJBgFG1iIGEE4KF?=
 =?us-ascii?Q?0g8QqmnRI9QotGQNAtA2AdkAQ2OzYC7Zact7GBDVyDNBcyWmZFW3sfxNzL9v?=
 =?us-ascii?Q?CphBwCnunAiFoPZoxaNoVfBMEuw/mikrg80YcDTU2lJScm09gQwCWtnYiNNu?=
 =?us-ascii?Q?u90RGAQhqpwPWAwhBbvyhnpMPVPKuEMZ3L+h2lWvsgKDKlUa2kvpaAIux+W9?=
 =?us-ascii?Q?ZLFoK8NF5fZsOG/p40DJRwHXNSx0I7TbdeObTFWvDyqNI2Yu4mwX2LrO73Dr?=
 =?us-ascii?Q?wINckiOiSdGVCWwHeMUQZrLYQHfu+b84LZO0qOaE66an9iER6kwIqOLTCc3v?=
 =?us-ascii?Q?RmQhR/lNAr/XgPOPUD95QYuErP82+FmsGHqJUEiT6iMutnUtrmPrMdbKzHOi?=
 =?us-ascii?Q?3iJvR3S/QgbtM3e75cDRoFDMk+yWvbKx6rbPNcVOmgPvtVGx7aIc6n30UlyM?=
 =?us-ascii?Q?0pnB8lolKQzJWG2ulXrnx31d/mo/tD89DzNBbA/cYmFXDMOj7+WMFRn2LMLc?=
 =?us-ascii?Q?Tt5yV/noz1yHHrnHtIrVr8/p0RUJqlrJbDiuAWFn8MpT14/rXt3AQSj5IPI/?=
 =?us-ascii?Q?DVFTFH+Hgxq7R0EvtDCZq9fdwsUJ2xYLn4rb0dsFLqLn2Khhcfe2002wYdRK?=
 =?us-ascii?Q?rGp82PzOlA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b33001-a644-4d88-d34c-08dee796d15e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:13:28.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSCojKSmeITNOAHtFOfTqbA1mvCiIC3iydzH0bZDryymrjOH/BZIuBnK1uXPr8CCmgR96rw40U58wmeshRtNKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

The reference bandwidth measurement is hard-wired to the Intel iMC:
discovery, event configuration and perf open all assume the iMC PMU
sysfs layout. Other architectures expose equivalent uncore PMUs that
could serve as the same kind of independent reference.

Introduce struct mem_bw_backend with two operations, detect() (is this
backend's PMU present?) and setup_counters() (populate bw_counters[]
for measuring the benchmark CPU), plus a backend table currently
containing only the iMC. Shared code selects a backend at init time
and no longer contains any PMU-specific knowledge.

Counter configuration moves from test init time to perf open time via
setup_counters(), because a backend may need the benchmark CPU to pick
per-socket PMU instances. Each counter now carries the CPU to open it
on. The added per-measurement discovery cost is a handful of sysfs
reads, negligible against the one second measurement window.

Add mem_bw_ref_available() so feature checks can verify that a
reference PMU exists: the MBA test is now skipped instead of failing
at init on machines without iMC counters (e.g. virtual machines).
Add mem_bw_ref_cleanup() to reset the backend selection between tests.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |   4 +-
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 145 ++++++++++++++++--
 4 files changed, 141 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 468ba8accc18..8b891d3e6650 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -164,6 +164,7 @@ static int check_results(void)
 
 static void mba_test_cleanup(void)
 {
+	mem_bw_ref_cleanup();
 	remove(RESULT_FILE_NAME);
 }
 
@@ -210,7 +211,8 @@ static int mba_run_test(const struct resctrl_test *test, const struct user_param
 static bool mba_feature_check(const struct resctrl_test *test)
 {
 	return test_resource_feature_check(test) &&
-	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes") &&
+	       mem_bw_ref_available();
 }
 
 struct resctrl_test mba_test = {
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 001a87608835..873acf6aa648 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -123,6 +123,7 @@ static int mbm_measure(const struct user_params *uparams,
 
 static void mbm_test_cleanup(void)
 {
+	mem_bw_ref_cleanup();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 0de72327a085..2bd19c22a344 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -188,6 +188,8 @@ void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
 int initialize_mem_bw_ref(void);
+bool mem_bw_ref_available(void);
+void mem_bw_ref_cleanup(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index ee44fbae2cbf..a2b919bd4839 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -34,12 +34,29 @@ struct mem_bw_counter {
 	struct perf_event_attr pe;
 	struct membw_read_format return_value;
 	int fd;
+	int cpu;
+};
+
+/*
+ * mem_bw_backend - Source of the independent reference bandwidth that
+ *		    validates resctrl MBM
+ * @name:		Human-readable PMU name
+ * @detect:		True if this backend's PMU is present on the system
+ * @setup_counters:	Populate bw_counters[] / nr_bw_counters with the perf
+ *			events measuring memory bandwidth generated from
+ *			@bench_cpu. Returns 0 on success, < 0 on failure.
+ */
+struct mem_bw_backend {
+	const char *name;
+	bool (*detect)(void);
+	int (*setup_counters)(int bench_cpu);
 };
 
 static char mbm_total_path[1024];
 static int nr_bw_counters;
 static struct mem_bw_counter bw_counters[MAX_BW_COUNTERS];
 static const struct resctrl_test *current_test;
+static const struct mem_bw_backend *mem_bw_backend;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
 {
@@ -94,10 +111,11 @@ static void get_read_event_and_umask(char *cas_count_cfg, int count)
 	}
 }
 
-static int open_perf_read_event(int i, int cpu_no)
+static int open_perf_read_event(int i)
 {
 	bw_counters[i].fd =
-		perf_event_open(&bw_counters[i].pe, -1, cpu_no, -1,
+		perf_event_open(&bw_counters[i].pe, -1,
+				bw_counters[i].cpu, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
 	if (bw_counters[i].fd == -1) {
@@ -221,21 +239,108 @@ static int num_of_imcs(void)
 	return count;
 }
 
-int initialize_mem_bw_ref(void)
+/* True if any x86 uncore iMC PMU ("uncore_imc_<n>") is present. */
+static bool intel_imc_present(void)
 {
-	int i;
+	struct dirent *ep;
+	bool found = false;
+	char *temp;
+	DIR *dp;
 
-	nr_bw_counters = num_of_imcs();
-	if (nr_bw_counters <= 0)
-		return nr_bw_counters;
+	dp = opendir(DYN_PMU_PATH);
+	if (!dp)
+		return false;
+	while ((ep = readdir(dp))) {
+		temp = strstr(ep->d_name, UNCORE_IMC);
+		if (!temp)
+			continue;
+		temp += sizeof(UNCORE_IMC);
+		if (temp[0] >= '0' && temp[0] <= '9') {
+			found = true;
+			break;
+		}
+	}
+	closedir(dp);
+	return found;
+}
 
-	/* Initialize perf_event_attr structures for all iMC's */
-	for (i = 0; i < nr_bw_counters; i++)
+/*
+ * imc_setup_counters - Configure iMC CAS-count-read counters
+ * @bench_cpu: CPU the benchmark is bound to
+ *
+ * Discovers all iMC PMUs and configures one read-bandwidth counter per iMC,
+ * opened on the benchmark CPU (each iMC counts socket-wide regardless).
+ *
+ * Return: 0 on success, < 0 on failure.
+ */
+static int imc_setup_counters(int bench_cpu)
+{
+	int i, count;
+
+	count = num_of_imcs();
+	if (count <= 0)
+		return -1;
+
+	nr_bw_counters = count;
+	for (i = 0; i < nr_bw_counters; i++) {
 		read_mem_bw_initialize_perf_event_attr(i);
+		bw_counters[i].cpu = bench_cpu;
+	}
 
 	return 0;
 }
 
+static const struct mem_bw_backend mem_bw_backends[] = {
+	{
+		.name = "Intel iMC",
+		.detect = intel_imc_present,
+		.setup_counters = imc_setup_counters,
+	},
+};
+
+/*
+ * mem_bw_ref_available - Is an independent reference-bandwidth PMU present?
+ *
+ * Used by the MBA/MBM feature checks so the test is SKIPped (not failed) on
+ * hardware lacking a usable memory-bandwidth PMU.
+ */
+bool mem_bw_ref_available(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mem_bw_backends); i++) {
+		if (mem_bw_backends[i].detect())
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * initialize_mem_bw_ref - Select the reference-bandwidth backend for this system
+ *
+ * Counter discovery happens at perf-open time through the backend's
+ * setup_counters() since it can depend on the benchmark CPU.
+ *
+ * Return: 0 on success, < 0 if no reference PMU is available.
+ */
+int initialize_mem_bw_ref(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mem_bw_backends); i++) {
+		if (mem_bw_backends[i].detect()) {
+			mem_bw_backend = &mem_bw_backends[i];
+			ksft_print_msg("Using %s as memory bandwidth reference\n",
+				       mem_bw_backend->name);
+			return 0;
+		}
+	}
+
+	ksft_print_msg("No memory bandwidth reference PMU found\n");
+	return -1;
+}
+
 static void perf_close_mem_bw_counters(void)
 {
 	int i;
@@ -250,17 +355,27 @@ static void perf_close_mem_bw_counters(void)
  * perf_open_mem_bw_counters - Open perf fds for the reference-bandwidth counters
  * @cpu_no: CPU number that the benchmark PID is bound to
  *
+ * Counters are (re)configured by the selected backend first since their
+ * discovery can depend on the benchmark CPU (e.g. per-socket PMU instances).
+ *
  * Return: = 0 on success. < 0 on failure.
  */
 static int perf_open_mem_bw_counters(int cpu_no)
 {
 	int i, ret;
 
+	if (!mem_bw_backend)
+		return -1;
+
+	ret = mem_bw_backend->setup_counters(cpu_no);
+	if (ret < 0)
+		return ret;
+
 	for (i = 0; i < nr_bw_counters; i++)
 		bw_counters[i].fd = -1;
 
 	for (i = 0; i < nr_bw_counters; i++) {
-		ret = open_perf_read_event(i, cpu_no);
+		ret = open_perf_read_event(i);
 		if (ret)
 			goto close_fds;
 	}
@@ -345,6 +460,16 @@ void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
 		param->ctrlgrp, domain_id);
 }
 
+/*
+ * mem_bw_ref_cleanup - Reset the selected reference-bandwidth backend
+ *
+ * Safe to call when no backend was selected.
+ */
+void mem_bw_ref_cleanup(void)
+{
+	mem_bw_backend = NULL;
+}
+
 /*
  * Open file to read MBM local bytes from resctrl FS
  */
-- 
2.43.0

