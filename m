Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020072.outbound.protection.outlook.com [52.101.84.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398331ED80
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473651; cv=fail; b=ahW+VbWR5TO+DWfsnOxfHEz9CpysgQGVJWsouUkUR2/lmUBBdHuEROPo7R4kCTgvqk77W/MwR2Qgl8qMoGdEUPK6Xeq8rPjy2w5Rl+s0Z3NQXU2BF2Qc/ru6eIXzJSK7wBmdmflytHifeKA8XtcYI+WNQSjl7ilRDUy9NHpKuIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473651; c=relaxed/simple;
	bh=QvWyeAn/V2F2eIFZxb0B5LMOPr9Rc0mF+UY9+QRHWjg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EAIjCafoN1V05pBFeyAd2d+k1wsxPnYCx0F7qDLaaYjY2giVFQOVzSe6W4AxXbCArMv+N2+HzGhGDUTmWyJ4aU7SjnkH+ckWeYXqI6jYvlztawH0jq99vK5Ckz/drAaqwhWP6IJ9wdL7BgvLNDZOEOVqaw6dqT3tyrm4YNphytM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=qpp66G9V; arc=fail smtp.client-ip=52.101.84.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="qpp66G9V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFI7mAQDbIKsF39EsQ/rC4Lw250tl0Bpywz8F6NvmWcPMjruwlGycCgyGuRU9L2PFg5nsaF6qZ4UH8FbJEtmT0uIXQB+CINqMBS30uSHxJyF1R1vBHvv7lxgFax1cFLA20AFNtOqfzaYz4rxQb9tA1JWGyOpYsB/Cbz3Gz1Dx5Pn2munFgp1jGqXw92Yf3PoPnsJHS/YmSZXtqtUgi0QV2Qv98GHzWXg1w56rXRzb7y0Ej2cGPyQFJGLwGMLnMuyUgdjzHc4MlmNRyOa0aVcwvkc2l7Hh4BtlxsvlxByy1qwEuATI5udcTlcjyH0NS7rFaNReL/cjYFPqkGwlVARPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4lGZ1q8juhs7ODuV/2OsbcGTuzIzL8Eg7T50M1djjE=;
 b=U5kCP1kBccEzftkIHPCrTEnEgYKgFnqC52j2PuO8Tbu0oVy7r91iNvTogyZS9QjV0S210CCTckDmI6RuWzLh6Z/i4w2qa2yNjbLDtKmS8Y8mamObgwyYzQXQb/Nv4tWeBevNk8OPC/9cWVrH5hTeQDgG2cKZiv6dhW/fiIHNaljUIkb+EXgL0dbSP6LnU9xMINDQ7WShUSTzh6+g2TxbDacKfia0Tc3GCcFK6V0U5VN+eh6P86o9TfGcTSXI4VphB0VX4DZurl8eFvrjCIy1i5mdCsvULyU7pkcKZ5cwafWEgMr0erRvsHtByZx1mDOwx/nbdkVdAX+NhMJEG/Xd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4lGZ1q8juhs7ODuV/2OsbcGTuzIzL8Eg7T50M1djjE=;
 b=qpp66G9VWZgfb61/uSeCSKuFTLW3pR3+2bTLnUVTCUvBfER3RakB4WtIRXpplWcFBxjtdyvRg9AvJEVPJYNie4d+63ASiM1sk1GtST5TmUjmWDU/MbzMoBUXoCgvx8Md4enzTYF9bgwM7DwFpiJ6ZfUPeKv9o4rW019m4UZ9Kl4MN7xnazKmPb0gplHmiSRX3dJieqY59P2Y5+AQDGsx1uRZIhiuYL2k/U586lAVx7ZSvY7l+YN7LqsKagJJnOKcM4RGuXSp24TtB77rUXXGwu30HZ0rlkSuZeKZLX1P+eMAwehW6Hk898fRWOIQG/cXepQ/ggvrKKKO0VdTeMzdwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by GV2PR08MB11765.eurprd08.prod.outlook.com (2603:10a6:150:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 14:40:44 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 14:40:44 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH] selftests/breakpoints: fix optimization and aliasing issues
Date: Wed, 29 Apr 2026 17:38:55 +0300
Message-ID: <20260429143855.90364-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|GV2PR08MB11765:EE_
X-MS-Office365-Filtering-Correlation-Id: c83dc561-a028-4a1c-04b4-08dea5fd4b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PGxgx6P8o4ieqXkDj1WdlB5PZFb5blOWThdHZ1hFuDY3DesbDDd3Em9L3lHhb3Qiz276tPpV4ThiKgBbiOotnrQNH7IqaTMuC2LODhVWXzOFE9Yq5pnIISCsdY6xAHZBg+DZUiqwE9fCRO//jbUOuk89mWxahbe7L633HQ5hDbh/mLl//UoCdLftIPsji/bubvdT77V+Ww5BpZ2zqw3T9bNck8AJU4CGQVWwJFT9i7iai5XHUVxJLfpgZZLsD+DAF/MNGYdsyS5xkkBDRp8ysmzXOFCTvD1/v/85EQoygtjldQlIxfnBCQNLxlcbhLgqrxtm1DORuuXd68X/g3bmn5vV6yOEcX6wfQX6Qmd+ztVrZF1QRdccf1W/E2DIrZRKtsEocBJDkjFn5h7yPTE4zG/C0/qJO1ara3TLjz5g03LOIwk5jTkS9vADKm2ru98F3ZCWpotJv1ADnWRJgXv7e/+iuSWc2+KO/W1ZBh08/Fn1iOn1MKmZjAriPpNmttD3w4cFriJ22y/dKUARWvi9V2vL0E25BI4kkCPaSZScdsNrr4LoEjuS/NzcUO4VX5G2lv875a9Q34coyhF6B/eyNcjza2IfpeGavgoYH2bHgcp8/QhSSH32FubIIGf0z/+jkmxIUsRJ3lUL4qLX9IK4pkUSL1/cdl9zzae2niuOqDtN7DXdS+h7fPghZJANjHFBkpaxh0Y+z31IhlvW3iotpvwZ349Xz0Cb7pPUyZ10T0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mSQpw3E8YqOb4X+esWXP2KTj7/uuAr4sgA+u/5UfFJVdtPa9NbzLl3BTgDOn?=
 =?us-ascii?Q?2xVXGjeAEv8bSvNHgTEiupqcACk0wnDIqMu4mjk5R2KG5LAQgyLoQ3s4O3X9?=
 =?us-ascii?Q?dOZeWhKhuR+LPz/FU5MDn8stEvJylBuU+A7Pt22SLGGiTjjDnGRkOq0xUFmO?=
 =?us-ascii?Q?5gUX1YrshgbJa9izBJYGKqtuuj6wmIiRUEshC78qtQiXavGgQ2Atag6/hYnT?=
 =?us-ascii?Q?6HmtYR30NS8SffE1Y2g+62UDAcxTcaxA1Y6DRD88kwDLV9GuhVJ3zXdVakbg?=
 =?us-ascii?Q?uhJB9RGaNMyQcfllZRs52XTn5lEnhleJO/YCOQli4HMCUSY03Qm72XSD1+ZA?=
 =?us-ascii?Q?CvVK9E79y/6kajCjH75fgT2WdglEj2hBLjL8tv6kqnUQfcvbS10iaI9FxzOb?=
 =?us-ascii?Q?FOf1drp1x9brn9FGdVsnPRdgC08hgvTafY7tTP0X6RRjlcfobp1nZeWW4J+f?=
 =?us-ascii?Q?cIISw4X/WbJuPwREkNkyMvwQ07xwCeAXXtEI50rE+cDtFUQVHkoVwdvdMigw?=
 =?us-ascii?Q?ysVb6xHrel8trJI/uJ4nxoKkwEM5ZtORkRcoq/mrH/czRQ6sy32rObIesWsV?=
 =?us-ascii?Q?G2tJlRrNOYc46Wd6JVPdzuU+eF7iQiYvLYSCsKbn5tEqI7ZmltYIS8IT5I9o?=
 =?us-ascii?Q?j5ZlO08FIchylalLvOYoAUz4Gdp3C5ai8dSQOLZJYri33qf0lFZdl6MFlkZC?=
 =?us-ascii?Q?vJZFySzj0oFwpaMGdvVfj9DJyPnDZyvm7pkXyCRg3Mv+Yp2ibkbQuEaklAk1?=
 =?us-ascii?Q?Z5Tox1Tun6j0mGm5ira9J1jtgT1oQ9zgkFEkWXmuprVJVwFVl7dw5GpuKSXa?=
 =?us-ascii?Q?wfnkOpaUSHKSNDxJ1QCQX5w34ATC6HYXzr9B3wH3yTyvd+W59qGaxD6Vi1K2?=
 =?us-ascii?Q?XCwtUJg+IbJxxvr3QtErCkKXNGDDA9HKLplKuGz/FkqsQcfNmuChLLZiarnZ?=
 =?us-ascii?Q?92yW7GebvE+OXjW8l2MCJeNoPtsHSIv9ufnF+fNjakCFtZbuCuM4QGcPqHvs?=
 =?us-ascii?Q?3/+PVVtK404N0NRTo1KiYvmh8fSgQ9Y/B685cmD+YAoZryGUcal3wwYctmyW?=
 =?us-ascii?Q?VRdj2uEV6RpiJ/48XSTeTljC3kVp/yLJCJdgJrUibC9mg9Hyq3lgERxcdNbI?=
 =?us-ascii?Q?BO8h9Sm3uT0J40sVfWVPAzlNXf6lVjpZZknLlbifYEPI1+Fcx6r5K5hELMT0?=
 =?us-ascii?Q?C3r4coXwYOsYL/V01ZWATDEUHD6jZGaxND+zy2HY1/avCWNq0zU4Vm6J5sUa?=
 =?us-ascii?Q?OSm05oM1E6CV4wNBy/FXJ2khgdqUF1gF3Ql0TmPJlJCdAYCgkbXI87Bk8vHM?=
 =?us-ascii?Q?yLgHEiVoqlPNm/mxQrBE8sqRrWLQ8CoWuuS3CqLdcT/aI+iOfNffudJCZzVB?=
 =?us-ascii?Q?kNEHH7Efea171l3TKxk90CShZkX0rlPZZFB6+PJx2z1UIb4KPY36aXzkfTpg?=
 =?us-ascii?Q?e4DRJeQyP0cylE0rbGVO/X0H6KC58B0DFcrD3XuYftt5M3Dv45NJ3Z9MPUf+?=
 =?us-ascii?Q?AbtXf7XIQcRg4BG0L5TvcTcMv48WvJjLb4fi4wb5jMNROlegZpogsd6TbXlj?=
 =?us-ascii?Q?7nU+o3/vwOUt+ojbppA+DDGmAIwZPdOLTd6+S7uMCGvphKFfS8tC5fn6J/XR?=
 =?us-ascii?Q?1v1eCQYV2+NQTq5hQJDU11GLyRYM37iKGuUUeZI1+xL1smQ1im1Q/LZQOTj2?=
 =?us-ascii?Q?n0BhNXVYN/JuKbsNantwdMem4nEUnl2ZjIRm/mQ/D/N1q7Z1Trs9Qsk1eVr3?=
 =?us-ascii?Q?R8l+MSsuUkpEAIYyXpIuX7dADAvgex4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83dc561-a028-4a1c-04b4-08dea5fd4b24
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 14:40:44.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Hr8xXXcyWiLE+oNUs3fUkco0N6Gxq6RSAX/xWZa1q5jI/YfVQviELk9aMZN0XNf1aMUav2vle6/ma/IUKbhbjJisNA8i4Fe/Ncw+nEczhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11765

When compiled with optimizations, the compiler optimizes out loads and
stores to dummy_var and the trapped flag, failing the watchpoint tests.

Use READ_ONCE()/WRITE_ONCE() macros to force these accesses to occur,
similar to other selftests and kernel itself.

Also fix unused/uninitialized variable warnings and loop iterator types.

Set CFLAGS += -O2 -fno-strict-aliasing -Wall -Wextra in Makefile to
reinforce this and catch future regressions at build time.

Strict aliasing is disabled to match the kernel build practice, as tests
intentionally cast between incompatible pointer types.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/breakpoints/Makefile  |  2 +-
 .../selftests/breakpoints/breakpoint_test.c   | 63 ++++++++-----------
 .../breakpoints/breakpoint_test_arm64.c       | 21 ++++---
 3 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..27d69d7006e5 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Taken from perf makefile
+CFLAGS += -O2 -fno-strict-aliasing -Wall -Wextra
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
@@ -13,4 +14,3 @@ TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
 include ../lib.mk
-
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test.c b/tools/testing/selftests/breakpoints/breakpoint_test.c
index 1159d81890c2..9dffd194c89e 100644
--- a/tools/testing/selftests/breakpoints/breakpoint_test.c
+++ b/tools/testing/selftests/breakpoints/breakpoint_test.c
@@ -23,6 +23,10 @@
 #define COUNT_ISN_BPS	4
 #define COUNT_WPS	4
 
+/* Force watchpoint access to actually occur */
+#define READ_ONCE(x)       (*(volatile typeof(x) *)&(x))
+#define WRITE_ONCE(x, val) (*(volatile typeof(x) *)&(x) = (val))
+
 /* Breakpoint access modes */
 enum {
 	BP_X = 1,
@@ -41,10 +45,8 @@ static int nr_tests;
 
 static void set_breakpoint_addr(void *addr, int n)
 {
-	int ret;
-
-	ret = ptrace(PTRACE_POKEUSER, child_pid,
-		     offsetof(struct user, u_debugreg[n]), addr);
+	int ret = ptrace(PTRACE_POKEUSER, child_pid,
+			 offsetof(struct user, u_debugreg[n]), addr);
 	if (ret)
 		ksft_exit_fail_msg("Can't set breakpoint addr: %s\n",
 			strerror(errno));
@@ -55,7 +57,7 @@ static void toggle_breakpoint(int n, int type, int len,
 {
 	int ret;
 
-	int xtype, xlen;
+	int xtype = 0, xlen = 0;
 	unsigned long vdr7, dr7;
 
 	switch (type) {
@@ -137,35 +139,30 @@ static void check_trapped(void)
 	 * If we haven't trapped, wake up the parent
 	 * so that it notices the failure.
 	 */
-	if (!trapped)
+	if (!READ_ONCE(trapped))
 		kill(getpid(), SIGUSR1);
-	trapped = 0;
+	WRITE_ONCE(trapped, 0);
 
 	nr_tests++;
 }
 
 static void write_var(int len)
 {
-	char *pcval; short *psval; int *pival; long long *plval;
 	int i;
 
 	for (i = 0; i < 4; i++) {
 		switch (len) {
 		case 1:
-			pcval = (char *)&dummy_var[i];
-			*pcval = 0xff;
+			WRITE_ONCE(*(char *)&dummy_var[i], 0xff);
 			break;
 		case 2:
-			psval = (short *)&dummy_var[i];
-			*psval = 0xffff;
+			WRITE_ONCE(*(short *)&dummy_var[i], 0xffff);
 			break;
 		case 4:
-			pival = (int *)&dummy_var[i];
-			*pival = 0xffffffff;
+			WRITE_ONCE(*(int *)&dummy_var[i], 0xffffffff);
 			break;
 		case 8:
-			plval = (long long *)&dummy_var[i];
-			*plval = 0xffffffffffffffffLL;
+			WRITE_ONCE(*(long long *)&dummy_var[i], 0xffffffffffffffffLL);
 			break;
 		}
 		check_trapped();
@@ -174,22 +171,21 @@ static void write_var(int len)
 
 static void read_var(int len)
 {
-	char cval; short sval; int ival; long long lval;
 	int i;
 
 	for (i = 0; i < 4; i++) {
 		switch (len) {
 		case 1:
-			cval = *(char *)&dummy_var[i];
+			(void)READ_ONCE(*(char *)&dummy_var[i]);
 			break;
 		case 2:
-			sval = *(short *)&dummy_var[i];
+			(void)READ_ONCE(*(short *)&dummy_var[i]);
 			break;
 		case 4:
-			ival = *(int *)&dummy_var[i];
+			(void)READ_ONCE(*(int *)&dummy_var[i]);
 			break;
 		case 8:
-			lval = *(long long *)&dummy_var[i];
+			(void)READ_ONCE(*(long long *)&dummy_var[i]);
 			break;
 		}
 		check_trapped();
@@ -202,11 +198,8 @@ static void read_var(int len)
  */
 static void trigger_tests(void)
 {
-	int len, local, global, i;
-	char val;
-	int ret;
-
-	ret = ptrace(PTRACE_TRACEME, 0, NULL, 0);
+	size_t len, local, global, i;
+	int ret = ptrace(PTRACE_TRACEME, 0, NULL, 0);
 	if (ret) {
 		ksft_print_msg("Can't be traced? %s\n", strerror(errno));
 		return;
@@ -251,11 +244,11 @@ static void trigger_tests(void)
 	}
 
 	/* Icebp trap */
-	asm(".byte 0xf1\n");
+	__asm__ __volatile__ (".byte 0xf1\n");
 	check_trapped();
 
 	/* Int 3 trap */
-	asm("int $3\n");
+	__asm__ __volatile__ ("int $3\n");
 	check_trapped();
 
 	kill(getpid(), SIGUSR1);
@@ -263,18 +256,15 @@ static void trigger_tests(void)
 
 static void check_success(const char *msg)
 {
-	int child_nr_tests;
 	int status;
-	int ret;
+	int ret = 0;
 
 	/* Wait for the child to SIGTRAP */
 	wait(&status);
 
-	ret = 0;
-
 	if (WSTOPSIG(status) == SIGTRAP) {
-		child_nr_tests = ptrace(PTRACE_PEEKDATA, child_pid,
-					&nr_tests, 0);
+		int child_nr_tests = ptrace(PTRACE_PEEKDATA, child_pid,
+					    &nr_tests, 0);
 		if (child_nr_tests == nr_tests)
 			ret = 1;
 		if (ptrace(PTRACE_POKEDATA, child_pid, &trapped, 1))
@@ -332,7 +322,7 @@ static void launch_tests(void)
 {
 	char buf[1024];
 	unsigned int tests = 0;
-	int len, local, global, i;
+	size_t len, local, global;
 
 	tests += 3 * COUNT_ISN_BPS;
 	tests += sizeof(long) / 2 * 3 * COUNT_WPS;
@@ -384,10 +374,9 @@ static void launch_tests(void)
 	ptrace(PTRACE_CONT, child_pid, NULL, 0);
 }
 
-int main(int argc, char **argv)
+int main(void)
 {
 	pid_t pid;
-	int ret;
 
 	ksft_print_header();
 
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c b/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
index 5fc0f37f3fd4..b0b908f4de9e 100644
--- a/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
@@ -28,11 +28,14 @@
 
 #include "kselftest.h"
 
-static volatile uint8_t var[96] __attribute__((__aligned__(32)));
+/* Force watchpoint access to actually occur */
+#define WRITE_ONCE(x, val) (*(volatile typeof(x) *)&(x) = (val))
+
+static uint8_t var[96] __attribute__((__aligned__(32)));
 
 static void child(int size, int wr)
 {
-	volatile uint8_t *addr = &var[32 + wr];
+	uint8_t *addr = &var[32 + wr];
 
 	if (ptrace(PTRACE_TRACEME, 0, NULL, NULL) != 0) {
 		ksft_print_msg(
@@ -56,16 +59,16 @@ static void child(int size, int wr)
 
 	switch (size) {
 	case 1:
-		*addr = 47;
+		WRITE_ONCE(*addr, 47);
 		break;
 	case 2:
-		*(uint16_t *)addr = 47;
+		WRITE_ONCE(*(uint16_t *)addr, 47);
 		break;
 	case 4:
-		*(uint32_t *)addr = 47;
+		WRITE_ONCE(*(uint32_t *)addr, 47);
 		break;
 	case 8:
-		*(uint64_t *)addr = 47;
+		WRITE_ONCE(*(uint64_t *)addr, 47);
 		break;
 	case 16:
 		__asm__ volatile ("stp x29, x30, %0" : "=m" (addr[0]));
@@ -80,7 +83,7 @@ static void child(int size, int wr)
 
 static bool set_watchpoint(pid_t pid, int size, int wp)
 {
-	const volatile uint8_t *addr = &var[32 + wp];
+	const uint8_t *addr = &var[32 + wp];
 	const int offset = (uintptr_t)addr % 8;
 	const unsigned int byte_mask = ((1 << size) - 1) << offset;
 	const unsigned int type = 2; /* Write */
@@ -194,11 +197,11 @@ static bool run_test(int wr_size, int wp_size, int wr, int wp)
 
 static void sigalrm(int sig)
 {
+	(void)sig;
 }
 
-int main(int argc, char **argv)
+int main(void)
 {
-	int opt;
 	bool succeeded = true;
 	struct sigaction act;
 	int wr, wp, size;
-- 
2.54.0

