Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39038A29A;
	Wed, 22 Jul 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686291; cv=fail; b=uJjk396YPbyEZJBwi9zb3I5iK+Isnns8+JoHhH4L6ATgKZ7mLTRNK8N3Mmp7nU0z2KRfMOJf/V/WOwPzEgTV0476BT29MqngXAebXnWVtrKjW5HIGuGbcXqymqV+6n7fesCSyU8odgbDm5mdizO6fogHFYLdNhz/0iuSSAQc52A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686291; c=relaxed/simple;
	bh=PwKf3tr93Cmnbhgm8PipTJ8557uQpLpqXdn/sazBx+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZG4JUh0Nch8kDqq+oIyfCDIpaH6qOh6D/FGJ6kr7EDOx9q1KUwmiXRl2+sw6ze4Iip+OY4j3zzfWa4ikRgZMvoSZM/5Ui8AxLxUopb3Bux1sIF6Ka8J1hJE9pGKh0WjYsoRhierfeJgpkpXYNOksBDsOZb5LWm/K3uZWLlGIUhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y24EqHJf; arc=fail smtp.client-ip=52.101.43.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y24EqHJf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gay0azygFBZZjFoJVjCjRPQ0hOfImE6ryci3B1IVgxIIqt7ZxYfH4MaKUF/quH8g5rzsr7gMgujbFaLe3Pf0N2TBRaEOdMrdOM107HAVjb5V5a/0Cma43an/B4muWPT2kNKR0PghdI/RrbMRremMYlQPNy7iDlmcvYz2tzwVy3M1d71fyyuhDu9hH11OuQyvJ1HFz+Pj7NWw5qYqpy9y2uNeQhvj6PpD112WW5pguv0EGYU1bKyN7wxQXLWHIYYHZGnYp6KaqMBNdAZqefeLBapRthskxJyRIRld+n10NTIh/R5vFLZEt5it8IuSdA8UUhaHbocDfVjLSTd5BW8PMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8W2SMfMKXgt09qZxhINxhoeDQ2X2jMqZLLnG73TycKo=;
 b=SAGJJ9JgxhK0ZAhIFU2fPW1zOFxvKhfhHP2+PzTzjvmF5cWFloybrzi/OdgQ9yVXML5YKgGXwUypev1Ko8bwYT9MRLklDBqG4GAuhGTaYcONUsH+nkgokWv3Vu96Vd1dfSqqWj5gozaHhVBYykLQiwOqXKJLYG6UznG4seXcFZiMKHZBNGPEmmfAVOEvlbCirlDm8JHiNaL+VtphI6ih9GUspKQZCacwXSW2uamdMq5TSQ8W/1QtyyVwUe8eZlU6EXQ+tmuOFzLy6YNGCLPdpzfNjb2pGfnKhJcGcg16YQS7yJ9pbI70ymUgXAzD9zeCz6bfegOcNr7k2QXy7jQPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W2SMfMKXgt09qZxhINxhoeDQ2X2jMqZLLnG73TycKo=;
 b=Y24EqHJfWZzJN4AOY38/4PdMBY20bkSrI7/AAgDBBMqRgJEnLgPurznNL8R/wiVtD/5GEhkrVous9KryPZSo5Y00TPbN5uRbrzBHPCq3Vr74N0nGMVIz95nGA0UDTvcYgzqoHDuyj2iAsJgaZnK2rtSkDnMRYt9dVOL1hoFKMafZurH37Z0zoj0GgRdCgGt4zzZD72PGj+kcKwhLpaANafLO9HW0xpF08RhcYIcXjDRrDfvXZJXSBdAxGcnvTLbO1WE7ijEikTaF63k+ch2N9a3U8+pXrjnJjLm5vPQkCNll6VW7PiCZPg7IlLOKY4ZdVkGf9NMz4OJ+2bEyPqdJbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:11:27 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:11:27 +0000
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
Subject: [PATCH 3/4] selftests/resctrl: Add MBA schemata invalid-write selftest
Date: Wed, 22 Jul 2026 10:10:56 +0800
Message-ID: <20260722021057.9370-4-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021057.9370-1-icheng@nvidia.com>
References: <20260722021057.9370-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::13) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: afc8580f-f8b8-4d43-d0ef-08dee796896e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tkY/RDTuwLgrqukDo8sibom7uBXRxYwkqNmKesqjmq+kck6gqPwXGHQN7Wq3G7dyA2MpPZvyXqMrQQG3tgRqdY7cgtv69YionLuGl5MaqafsrFIvLm6Lr90RJtpRdCGGI6xmDAjvDk03WR1YZAZ3+qEF+K86Bv3nREV4AVtaXP8/n6gMhWI4c5CTPYiiYk4lu/v8/pEy02wpRzPMUXIGrF7c5A48ElG6Um7DaH/V8SKxGskTwnuHUDkNYhmPrbedhmYEDwmPZtp9FiZzgCbH5jG6wCEah/ywFEt4JX6mW3Am+DsTsFvpfw9Da4s20QLM/RqWPmko8y7TdDiD4X+XlNMWx7MvBaH27mVuNI51jRqdwt417CKX8h12wBVZ7R2+7kwu6B4D/fLudwG3/aCCaDsUYkCvLq1MfRZe39KvkbtvcaQvrUSmNLv+79B6sYQfteFX4FtWzShAmDBbE38Cwz94wGBBAnt261WNsPK/OCmzhEcxBdgRK94YE2GySKOAwwMgwePvB5y/bhwYsAM1ti2pIKaduraHchvWwX3JppUx9/chFSXVVuMxx2CrlcUlzp/0JtDr2TQ9HfSmsxjMngPdE5bjVvAFHIfV5FlxWOhnRtfj4USSzekQZ+Ut/EErzSqkUaot1zDNYfQ44BWwHRwym8ZRTqMeE34WZeiYbRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HdXPvbkXVN+5pKotZ3Hcxuo7JW/2wtxFOIiFgeb+zXqg36e6g6NNS7doG1aJ?=
 =?us-ascii?Q?aIJb7L3Md2PnUTS7oBPwB7yt8vFud2XRPsju8iF/rb+c22i2iFebr+9amErH?=
 =?us-ascii?Q?PFZMMwseL5h90RdVuOCVrOM/h0bkdna+yH7CEQHSjm7+KVFaZwdQblGsjHzX?=
 =?us-ascii?Q?oXzRv/TJZHcygtzDWvAGlPnLnMv3e5aTxrKaX8IoidaDcaJCYY12prTEqykN?=
 =?us-ascii?Q?euR7e8xj/coCtvDGGn75fIM4P8P5B2IqiDIV85CttR/6axlXOwa9kxaTHSDT?=
 =?us-ascii?Q?HH7jA2HHGAqzcIrZFY5cDYazwCBJS2QukMfftB8SU83CJ1OKdkYNdM4Q0K4X?=
 =?us-ascii?Q?M+W07SgWxtTPUXVPcCjYVfRRbJFrSR1oCHrPEiyt5wElKHxMPc0j6gMjoYmz?=
 =?us-ascii?Q?zWTzgZ+MRYTUfoKyZTIdYVDqe9wugA5rzf+OZcRXYZ4LpM28V7tMQhsOuKZh?=
 =?us-ascii?Q?HlhcXx7cQcoM8iXnCPWbZl/x8BbswImK2sSEJZDKiNszqiYvgu/ieaTVp9WL?=
 =?us-ascii?Q?BJKOtBT1NntR/17In9QbREv2dBgpjEME76ZuarK1P+OgBmK0XOWk7Ecw+CyD?=
 =?us-ascii?Q?HFsTamV/AHRLJPPNsClIyPqlIkDhihRMxOKoNpDJ4TcMKPR1EtVjS/O8vpPR?=
 =?us-ascii?Q?ysOSTMH9lL5enQOchpIrS6KGp9z1HjU/PxhPfDIfRUUZTbZ9qVJjmAjjuoXj?=
 =?us-ascii?Q?KzX8wS7aAFDLgpyJsjQGq9a2JGUXwqY/+kbgAlUI2I9xczxCyrqSBGaVLCne?=
 =?us-ascii?Q?PGHe5cavDBCkKi3u5BT8ju1gczi8AiInoVETCWMBfzMoJhmvisV9JIZxYRur?=
 =?us-ascii?Q?6ohpfzKLAawj+8x+jfpNh0dmOVkZvKT4sKYTGGg5kuUhOt2PgZP54fjMo0LK?=
 =?us-ascii?Q?v6G7r/4xtkPoOUpi6HMy7Y65sAQviTx2ZYvDcgJHK7sSw6mu7eLNTNGDZ2mU?=
 =?us-ascii?Q?xpHJnOJtO8oi9/2z0/ZafQU2bCarEiqpEi1nn5uh/ZEg7cmVEyT6WwrgG9sx?=
 =?us-ascii?Q?5ptorEW0pFpKxSgrxpmYQhflOeruDmD3EwaHGnnnU0auXTwyWDi7gRxH52zA?=
 =?us-ascii?Q?PEwbQPOnMMqNCSbvOI2TBQzo5Ru71DvOvscrQSx9uxBgfyb4dHw250X42a3g?=
 =?us-ascii?Q?NtP7lWdOSpq1Yy2Y/5uiLEr0Uq29YtzrSnT0PAn0khOaG219cbyDBy9BNhd5?=
 =?us-ascii?Q?g4pbIkO+mxzGt8GRysZ50I8dPsiv0fib0004xce/0hMGWZqafxlRfMaU0djA?=
 =?us-ascii?Q?M01IagKikeR8Q+34tIEtmnXjw0bmYncenge0/5N/brXb3+EyugJgsKkerZ1I?=
 =?us-ascii?Q?wHNvQnC2ZSnq4aai7xcGzRNcM+5x+Dmo3JkVb5Pxl5ZMU2b3iUey5JDthuM/?=
 =?us-ascii?Q?vchOeTtJde2xNQPbar50xcP14INZX/zXAcJ66Z6HxkRMKO9V9QXx3PkSDOWh?=
 =?us-ascii?Q?k8+eoI4eimjVAT+HHDMnMvHWte/63ovsqWKQdyMNt4zYyEjwhu2cgsFmzddR?=
 =?us-ascii?Q?M8JMH3Ge1eWQJv86cYRzVmgWnvbnXTIGACG+0zt1MTS7ytVRyKKRHshUXGk/?=
 =?us-ascii?Q?wk2N4wx8NG8tNxBNoNt0OjU6+QiJrcZfpvr3JYqOFie2SxNE/2OBg1fl/dAJ?=
 =?us-ascii?Q?s2f6rRFzJMNLwzEz3wj7yuxB6Wwl/JjoLYk2YVdyWeOp6T2sgNtetI23IR2i?=
 =?us-ascii?Q?xQ+OGsplsTqEzIfZ123ai+9kBMGQIREHLIIH3V76cDDJngBh2Zz39TnaVpSt?=
 =?us-ascii?Q?L+vS9qSm4g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc8580f-f8b8-4d43-d0ef-08dee796896e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:11:27.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/HIzbqT7BSjBi3GvWic+WpKFkebsvPxPqfD2lDYpungZ1WZJdAm+fLsPfLsUx9PhluTSJ+TDvQXA1QyQTCddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

The resctrl ABI requires invalid MB schemata writes to fail and report a
diagnostic in info/last_cmd_status.

Add MBA_SCHEMATA_INVAL. In a temporary control group it writes an
out-of-range value 101, malformed values abc, -5, and a non-existent
domain id, asserting each write fails and last_cmd_status contains the
expected substring. The bad-domain case checks errno only, as the kernel
does not update last_cmd_status there. A final write of the maximum
percentage must succeed and report "ok".

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 .../selftests/resctrl/mba_schemata_test.c     | 123 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 3 files changed, 125 insertions(+)

diff --git a/tools/testing/selftests/resctrl/mba_schemata_test.c b/tools/testing/selftests/resctrl/mba_schemata_test.c
index ff101b814982..0cd257dcec91 100644
--- a/tools/testing/selftests/resctrl/mba_schemata_test.c
+++ b/tools/testing/selftests/resctrl/mba_schemata_test.c
@@ -265,3 +265,126 @@ struct resctrl_test mba_schemata_rw_test = {
 	.feature_check = mba_schemata_feature_check,
 	.run_test = mba_schemata_rw_run_test,
 };
+
+/*
+ * Read the first line of info/last_cmd_status.
+ */
+static int read_last_cmd_status(char *status, size_t len)
+{
+	return resource_info_str_get("", "last_cmd_status", status, len);
+}
+
+/*
+ * invalid schemata writes (out-of-range value, malformed value, nonexistent
+ * domain) must be rejected with a diagnostic in info/last_cmd_status, and a
+ * subsequent valid write must still succeed and report "ok".
+ */
+static int mba_schemata_inval_run_test(const struct resctrl_test *test,
+				       const struct user_params *uparams)
+{
+	/* Rejected values and the stable last_cmd_status fragment expected. */
+	static const struct {
+		const char *val;
+		const char *substr;
+	} bad[] = {
+		{ "101",	"out of range" },
+		{ "abc",	"Invalid MB value" },
+		{ "-5",		"Invalid MB value" },
+	};
+	unsigned int pct[MB_MAX_DOMAINS];
+	int ids[MB_MAX_DOMAINS], n, i, ret, bad_dom, fail = 0;
+	char vals[MB_SCHEMATA_LEN], grp_path[256], line[64], status[256];
+	const char *grp = "mba_schemata_inval";
+
+	/* Enumerate the real MB domain ids from the default schemata. */
+	ret = resctrl_get_schemata("", test->resource, vals, sizeof(vals));
+	if (ret) {
+		ksft_print_msg("Fail: could not read %s schemata line (ret=%d)\n",
+			       test->resource, ret);
+		return 1;
+	}
+	n = parse_mb_schemata(vals, ids, pct, MB_MAX_DOMAINS);
+	if (n < 1) {
+		ksft_print_msg("Fail: could not parse %s schemata \"%s\"\n",
+			       test->resource, vals);
+		return 1;
+	}
+
+	/* A domain id one past the largest real one cannot exist. */
+	bad_dom = ids[0];
+	for (i = 1; i < n; i++)
+		if (ids[i] > bad_dom)
+			bad_dom = ids[i];
+	bad_dom++;
+
+	snprintf(grp_path, sizeof(grp_path), "%s/%s", RESCTRL_PATH, grp);
+	if (mkdir(grp_path, 0755) && errno != EEXIST) {
+		ksft_print_msg("Fail: mkdir %s: %m\n", grp_path);
+		return 1;
+	}
+
+	for (i = 0; i < (int)ARRAY_SIZE(bad); i++) {
+		snprintf(line, sizeof(line), "%s:%d=%s",
+			 test->resource, ids[0], bad[i].val);
+		ret = resctrl_write_schemata(grp, line);
+		if (!ret) {
+			ksft_print_msg("Fail: invalid write \"%s\" was accepted\n",
+				       line);
+			fail = 1;
+			continue;
+		}
+		if (read_last_cmd_status(status, sizeof(status))) {
+			fail = 1;
+			continue;
+		}
+		if (!strstr(status, bad[i].substr)) {
+			ksft_print_msg("Fail: \"%s\": last_cmd_status \"%s\" lacks \"%s\"\n",
+				       line, status, bad[i].substr);
+			fail = 1;
+		}
+	}
+
+	/*
+	 * A write to a nonexistent domain also fails, but the kernel does not
+	 * record it in last_cmd_status, so assert on the write error only.
+	 * Use the maximum percentage so the rejection can only be due to the
+	 * domain id.
+	 */
+	snprintf(line, sizeof(line), "%s:%d=%u",
+		 test->resource, bad_dom, MB_PERCENT_MAX);
+	ret = resctrl_write_schemata(grp, line);
+	if (!ret) {
+		ksft_print_msg("Fail: write \"%s\" to nonexistent domain was accepted\n",
+			       line);
+		fail = 1;
+	}
+
+	/*
+	 * The rejected writes must not break a following valid write.
+	 */
+	snprintf(line, sizeof(line), "%s:%d=%u",
+		 test->resource, ids[0], MB_PERCENT_MAX);
+	ret = resctrl_write_schemata(grp, line);
+	if (ret) {
+		ksft_print_msg("Fail: valid write \"%s\" (ret=%d)\n", line, ret);
+		fail = 1;
+	} else if (read_last_cmd_status(status, sizeof(status))) {
+		fail = 1;
+	} else if (strcmp(status, "ok")) {
+		ksft_print_msg("Fail: valid write \"%s\": last_cmd_status \"%s\" != \"ok\"\n",
+			       line, status);
+		fail = 1;
+	}
+
+	rmdir(grp_path);
+
+	return fail;
+}
+
+struct resctrl_test mba_schemata_inval_test = {
+	.name = "MBA_SCHEMATA_INVAL",
+	.group = "MBA_SCHEMATA",
+	.resource = "MB",
+	.feature_check = mba_schemata_feature_check,
+	.run_test = mba_schemata_inval_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 75d1ad5c6968..c32ab5c2cc56 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -251,5 +251,6 @@ extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
 extern struct resctrl_test mba_schemata_info_test;
 extern struct resctrl_test mba_schemata_rw_test;
+extern struct resctrl_test mba_schemata_inval_test;
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 9b3ac0437bf9..7a7184783e6a 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -23,6 +23,7 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l2_noncont_cat_test,
 	&mba_schemata_info_test,
 	&mba_schemata_rw_test,
+	&mba_schemata_inval_test,
 };
 
 static unsigned int detect_vendor(void)
-- 
2.43.0

