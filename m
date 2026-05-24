Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021091.outbound.protection.outlook.com [52.101.70.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EF3AE6E2;
	Sun, 24 May 2026 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642161; cv=fail; b=QWeGWSShDc/s8uEE4fzfVpE9/J95bUr36tr9xb3qvniUirMHMRXxiRF5oqf80I5e7adR6wKx0DbJc70VoDK4xnUvcmewWEDDJAtwkqY7QiU63bWSHtKGfMjM0j4DeFbUZVoxL78NzadbGOqkncwn8VozpLjxIKhEBFO6eSpePss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642161; c=relaxed/simple;
	bh=m6OjXMsP/+Wa1c4RofSfxKS5NSgCP0Vdkh8KmUwMRQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HAWJG3Zfxl5K9k9VLeWpiJ9SGdaO6PYGYvznakDKqedwG+WZ9Sp7ce9Ux2HsNdLzW0f5lAXCTgTfGxEfsfHB31mdmvknAEaaEHI7D0jGk3H+WIXxKQ/amLVpCybcDW+pXnGJe/HxddUyBuioUcVNEqrvP29vTRF5OGmUHCgST7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=cl9ho3ql; arc=fail smtp.client-ip=52.101.70.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="cl9ho3ql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJaHWc4SJ3DHLpUaZ18f1Ow3sGj0ncFm8TrdbGU/lj1AnjwqrlORlRpHSRINb+E3cC0fAg98R9Mt18R0M3iTIL5Gb5aGrowaqq5A2A/dCY/gnWUuKv1dh8GIi7SnQEFu8pSb+V8BH2CFipw/hnP6NgSdhm3flewOhM2Rwv/C6SDD8Bp+r9TGXUsgbueT1FdkYb/G4Ncy4QR0mry6bTmLmqHAgEmHi4r2HCzNr8mdvIT8qsO01qO3zqtDI6Fg9QR3gSx3+bGw2f4xW8wdOJqA6w5Cv9u29MDHz9+eMGdMXQU+P5WCwphFKsLClwQQW+I2oRfQ9x0OH9uy6K+JuGxDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjLT9zpYJ0mv+Utsm5QRyL6RWP1DQvZ7SDrdeTqg0RM=;
 b=KrHw7IDkXePUeeu/E/+i4EWwPWPgF+Xgt68zMxyoeOU9qx1nPyve8i1zH9CkRsc+vwdnj4isC0vcfkjZc+jop1FZn4eN3S9idNT6OcqrV7CWU/rvpqEZ/XryiHpoFJd2TnZ0akUTc6phQ+TF3eOC1QhNVTKVe+W/z1w+cbDhgmhtghTytdz3ePc8lBeLuN6/f8w2y2Hv/G3stkzN6dWqiWiTaSpk8RZjlatnBH2a6r2xYcKsJyoeswPHVXVU4jv8dO4g63paM+TuTniNN5js7deCTwq7+Hn8s9uZVVSvRG4087gktnFHdK/mhLMFaPbVfLc1+Dva1YoqEJBB7dPLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjLT9zpYJ0mv+Utsm5QRyL6RWP1DQvZ7SDrdeTqg0RM=;
 b=cl9ho3qlBxc9XOWqjf6HvUTSmMugInmqSaaHR5kovfZc4IfEwfd1OFdjSNaW8opKXx6KiMaDagPXY6QHP6no9J45oy1jL5TYjKXfzPjq1n7AcIfLYVOGJrTsC6zqnGIf/FAbjBVVWXy2CT3eXOGPuzb9mIlsdyYZTOe6cIs+B8B1tUoE98yqkFFDampBMYEUv4BCjiINhuhHjmmuw4nv/4VcX43o45cZm0ZCC4tmeW/7RMtadcNmrA6Iq2XO+lklrmIovslZT5MfrDwo7RsUD5nXTq8KJVTXXIfSGs0rXheWZzgzuRwLQfOX7Trvfj27ulYtojM4cnXeMdD8uyWNlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DB9PR08MB7843.eurprd08.prod.outlook.com (2603:10a6:10:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 17:02:34 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 17:02:33 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elver@google.com,
	eva.kurchatova@virtuozzo.com
Subject: [PATCH 2/2] selftests/perf_events: replace volatile with READ_ONCE/WRITE_ONCE
Date: Sun, 24 May 2026 19:58:57 +0300
Message-ID: <20260524170209.37874-3-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524170209.37874-1-eva.kurchatova@virtuozzo.com>
References: <20260524170209.37874-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DB9PR08MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 903afea2-4697-499c-82d0-08deb9b63fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	psQMuUoGQJYkPyrChDf4cTOItwTXwD0e/wZXu2wun8c38kJ/W3KcbKpSu7QTXt4px5CzZe4lEkvmYIB6tGgz5xTUElR6/0e25ytWPt7a1R8AbkRJDOSUbztdNbty9CuTGjKaUMFYhrm/Un7epLjQ7HHqndV52JwHexcSbyDOOfQS4osmnQfXjsuHVVeXjSbnM/p1xv5vgIkAgYvMbp+qJ0DBYLCEf52HwjDGFCHQi9GTdsKkX+RyrzZ2h28/9HoEXxXwBC4ZePnp89JkKGMbmSjWCDj2QnzU56PdyS36EMe7yD9uyfrnJ/DSwBoA5JX4ksZLiAWPyBKt7yx1RueceffTKf1H/9QIohVmVrPOx1xsmqGDJIZ/sR/SHEUg9rz+tOiIpf9ZqIG/dPGPOdsmAbZEp0zhFosB+95qM0N/W4+QY/gLOFokta0YWsiu/6/7C3gc77Of/Atp8DwK6FJNeHLgVmULRf0Am6J2D7qPZ0l3mR4M5yRwwmkKp0jwBkZFNCjW4hRGoUg6lQMVH9P5VXnAQ96va2pgcSY1E8tkejHLsfS+HxYRv+4ZaPXk6w2l9qig4cMv4Bt6bq7PWVWSovQrl0mI75vzwtrxNnjcrReASKfkGBgxTWDFPPMDG/Q5iVOan61bTNI4eLvQxGYvJlcZIHwOEBktR3yf/9cFV88QEOiozfWuz8H/yDlNm4qoX4uT1JDw4AGilM7YhwVrPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YKdMvfQPsQScThjTg2P5t7g2R8YEvC2gjdIPGxQVQLZvSIJVbKabPyJWUA7d?=
 =?us-ascii?Q?ZkRi0EUGgJWfnnCbz2TsY7Q7RgnyDVlYMuBXcmK0UxqOcVqj0Byp6qP8g5A3?=
 =?us-ascii?Q?m2FgUH3uRYHmbOQEJ0w7x8YHT3eLkW1zpqGmoRQPGiYG2gEFv95LjOvLctPE?=
 =?us-ascii?Q?Lb5CiYqr5+FxnxKdKgbNKN/qi+U0IR+8zH7ujYTHSkikCXM6pEyPyqYMTGED?=
 =?us-ascii?Q?sulIfUBmOnWM4dpBCCVbbv13SuxBqj5KNCYCCX2uzQZFjmRYUwUy+bG15Ssd?=
 =?us-ascii?Q?NAE9F8IPGUJ2aKN4ZN3QnBOrzzKAceMcrWweVfmFEugAc0CorFj/tP0q2vqT?=
 =?us-ascii?Q?FJy6tOx8SDz96ZL/f77LePc0mmqPiAT5qYjECd2pdFyLyucFKZNHOHAhVWYJ?=
 =?us-ascii?Q?szPrsGkbYd0Krj26Ue+fkra5SDxsH1E6cYEvVcnO+5B49bgVFsaejM46V1Xr?=
 =?us-ascii?Q?iUDPVhoYYnmtcKCw+Qo8Zm5159WWxHVCGdgtiII1+tcgtwJqI2G2Qz9oIjie?=
 =?us-ascii?Q?8GqxSbxGEAdXXvNh34SCB2t2s7DNB92xpmTqEyG3oM8HJbUZyPYt0MBimQen?=
 =?us-ascii?Q?7MeGmtD46BNOHw2ceYOVslSnfCPOyklb+fEeRO7SjHln6sVUDmpmQgR5BeIa?=
 =?us-ascii?Q?JhDAyP7tn14Uy9uz/QZJ/DhABC48NYKZbu2q0+lRL+DzuDvKwPpQyIlbHQnX?=
 =?us-ascii?Q?UyTSw6pDbE2bJys8gJs/mB2V06kMJxSFkQiwL8GwL04vWYu++3h8PVr8JxAq?=
 =?us-ascii?Q?vDftE3hUIRaAuzb7DJTCSvMeXffrE343s++N8noVxelbdnlcFO3cZ7VzQC6O?=
 =?us-ascii?Q?TAGSFsm22sP2XGQF9hFptS8om++qncjh/PZ4v3Z6Q9nQWLzwU3dGyy2DP7/r?=
 =?us-ascii?Q?IpQlUtF3288RJfhnoS2022oSLKCJ6ZWYqv3za5S+GRCb6ZsjmEOnFigqWjib?=
 =?us-ascii?Q?IvW6jdf3H2Uu4kutVa+xnD3pFcefgbaDsijxDhW+tpoGCkGGjgxRHVP0Ln/5?=
 =?us-ascii?Q?Gn0iHQ2ms9QUNNjOjBPN22FPrQFsdbgkgWs5iDoneDqZpCW74/T10IUKtYc6?=
 =?us-ascii?Q?uwoClpnGz7RLRUaUC8vohh7Wf1r8WZUxsVCtnTh3vbHQsaRO7Zog9mD6v1ST?=
 =?us-ascii?Q?HZt7xiRN9+bm+rfQA/Wo8Yqe7xgEQT93VbFfV95B5IoEopjKZ0x4Izm9R5Zh?=
 =?us-ascii?Q?PzmGnzmDPDgojGtYcpiQbwoiD4x5jdd2/KhnHNgHPevg4qdZ9dyZPfyn12yf?=
 =?us-ascii?Q?PsZ3OzN5a77FHSRJ8Z+z+ye29amJjPgtC9YAq1exmPTwqJhBz+4exxpnbFxV?=
 =?us-ascii?Q?SKRqrS4Ifu+SaOCacfoI7hMnbSQIhmK/YF+FioTZ3BJCtmrAdBTF99jQbfi9?=
 =?us-ascii?Q?JO6InCC93+QAsNOE8jTZ6UuCJaMfffOR8u+GCAooLBJh7m/hJrP/Szddvxeu?=
 =?us-ascii?Q?mMyskzEgQrZ5pOukFwZShvwxLPNJYRTHfqtpZPoUXY1pWoK9bYDpdQGofbhb?=
 =?us-ascii?Q?7H6/+WQ2txOPy9X3DxVCAV8IohfgmLcedQeK+SjdgI2ZGm97BEAAbDsO+MMi?=
 =?us-ascii?Q?DEVe0jTg0jP5Ce5RU4w8Pry4OkO5vCZoNLakBpDgpR2g1+kpvBHGkX6hnbPI?=
 =?us-ascii?Q?gg0sqRVgqTWZj4Zbx6qqvf6HEi6IbpWTqg9U385z42lr4p2lcwAW9K5geols?=
 =?us-ascii?Q?QAJeGuS4Sbq6hdnT1nr/SnRyJ+Raetzdk4Wl8Z0ea2htOXLejTfiRuz/YqWH?=
 =?us-ascii?Q?IeJn18TxnBnXXiu6oTnL/FMyVbFpxms=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903afea2-4697-499c-82d0-08deb9b63fc7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 17:02:33.9159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjF+xgx32TQECW+wMW9Zlo/kJ7spsbaHYXf1RjhZQdxNKc+O/Y/udl7RdASl7em6+LNaS8jiQvP86YRMviLvAe34HYheqvOCC2twmbD36P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7843

Pure cleanup, no functional change.

Replace 'volatile int iterate_on' with plain int and explicit
READ_ONCE/WRITE_ONCE at each access site.  This is more idiomatic
for kernel code and documents the intent at the point of use rather
than at the declaration.

https://virtuozzo.atlassian.net/browse/VSTOR-127669
Feature: fix selftests

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 .../selftests/perf_events/sigtrap_threads.c   | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/perf_events/sigtrap_threads.c b/tools/testing/selftests/perf_events/sigtrap_threads.c
index 6b246e0ffde9..840d5f452d54 100644
--- a/tools/testing/selftests/perf_events/sigtrap_threads.c
+++ b/tools/testing/selftests/perf_events/sigtrap_threads.c
@@ -35,11 +35,15 @@
 
 #define NUM_THREADS 5
 
+/* Force watchpoint access to actually occur. */
+#define READ_ONCE(x)       (*(volatile typeof(x) *)&(x))
+#define WRITE_ONCE(x, val) (*(volatile typeof(x) *)&(x) = (val))
+
 /* Data shared between test body, threads, and signal handler. */
 static struct {
 	int tids_want_signal;		/* Which threads still want a signal. */
 	int signal_count;		/* Sanity check number of signals received. */
-	volatile int iterate_on;	/* Variable to set breakpoint on. */
+	int iterate_on;			/* Variable to set breakpoint on. */
 	siginfo_t first_siginfo;	/* First observed siginfo_t. */
 } ctx;
 
@@ -94,14 +98,14 @@ static void *test_thread(void *arg)
 	pthread_barrier_wait(barrier);
 
 	__atomic_fetch_add(&ctx.tids_want_signal, tid, __ATOMIC_RELAXED);
-	iter = ctx.iterate_on; /* read */
+	iter = READ_ONCE(ctx.iterate_on);
 	if (iter >= 0) {
 		for (i = 0; i < iter - 1; i++) {
 			__atomic_fetch_add(&ctx.tids_want_signal, tid, __ATOMIC_RELAXED);
-			ctx.iterate_on = iter; /* idempotent write */
+			WRITE_ONCE(ctx.iterate_on, iter); /* idempotent write */
 		}
 	} else {
-		while (ctx.iterate_on);
+		while (READ_ONCE(ctx.iterate_on));
 	}
 
 	return NULL;
@@ -175,7 +179,7 @@ TEST_F(sigtrap_threads, enable_event)
 	EXPECT_EQ(ctx.first_siginfo.si_perf_data, TEST_SIG_DATA(&ctx.iterate_on, 0));
 
 	/* Check enabled for parent. */
-	ctx.iterate_on = 0;
+	WRITE_ONCE(ctx.iterate_on, 0);
 	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS + 1);
 }
 
@@ -194,20 +198,20 @@ TEST_F(sigtrap_threads, modify_and_enable_event)
 	EXPECT_EQ(ctx.first_siginfo.si_perf_data, TEST_SIG_DATA(&ctx.iterate_on, 42));
 
 	/* Check enabled for parent. */
-	ctx.iterate_on = 0;
+	WRITE_ONCE(ctx.iterate_on, 0);
 	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS + 1);
 }
 
 /* Stress test event + signal handling. */
 TEST_F(sigtrap_threads, signal_stress)
 {
-	ctx.iterate_on = 3000;
+	WRITE_ONCE(ctx.iterate_on, 3000);
 
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_ENABLE, 0), 0);
 	run_test_threads(_metadata, self);
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_DISABLE, 0), 0);
 
-	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS * ctx.iterate_on);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS * READ_ONCE(ctx.iterate_on));
 	EXPECT_EQ(__atomic_load_n(&ctx.tids_want_signal, __ATOMIC_RELAXED), 0);
 	EXPECT_EQ(ctx.first_siginfo.si_addr, &ctx.iterate_on);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_type, PERF_TYPE_BREAKPOINT);
@@ -219,7 +223,7 @@ TEST_F(sigtrap_threads, signal_stress_with_disable)
 	const int target_count = NUM_THREADS * 3000;
 	int i;
 
-	ctx.iterate_on = -1;
+	WRITE_ONCE(ctx.iterate_on, -1);
 
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_ENABLE, 0), 0);
 	pthread_barrier_wait(&self->barrier);
@@ -227,7 +231,7 @@ TEST_F(sigtrap_threads, signal_stress_with_disable)
 		EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_DISABLE, 0), 0);
 		EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_ENABLE, 0), 0);
 	}
-	ctx.iterate_on = 0;
+	WRITE_ONCE(ctx.iterate_on, 0);
 	for (i = 0; i < NUM_THREADS; i++)
 		ASSERT_EQ(pthread_join(self->threads[i], NULL), 0);
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_DISABLE, 0), 0);
-- 
2.54.0

