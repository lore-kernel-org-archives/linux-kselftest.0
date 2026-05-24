Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021091.outbound.protection.outlook.com [52.101.70.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA0339A4A0;
	Sun, 24 May 2026 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642159; cv=fail; b=aq5ZyfuKlCEp2b80sC/3QYUg1ryc5z0Tt2iGs9ZXTa7VC3mVJ4Y0l6Gm2euLcBD6kjudsTX1OKUhJHJozKH67F30x7VhqbC9aHbl//KRzVV6nz2FUy4J/JVTT5AD6/ODhJbGJ86wKMCVCZj1X7w0F21wzTsx3bmnATqqCEV1gbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642159; c=relaxed/simple;
	bh=ALHDmAQV0hyUwYG6XfU0iqynIng9AJUkhp54s4MGWrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=huCWH7y11RautqfzJ8+AcKcWDw5gee4JGKRQAaDcjh0IqSgfvWkgxlMjGQJmZzkVMa0YrKTP0Al90YLLIIy5mKDYNjqISTi7+tLAaB33tbWTTqYGMYeSQn8Ab+dgmkS5Bs3pRB6ZqwwVVp/YBPTeskoY3S2hFJiPb9OWUvlnhjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=SRCPybeV; arc=fail smtp.client-ip=52.101.70.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="SRCPybeV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiOXiAH0P5HWOr4S8PEFrytdYWYZbfilPu4OAJZZ49m0AzKBZVDzJ1vfWtP+TmpkhZxJFihL29DrTJc/KH3roCGa91+lEi9LkgnBT8Ur+FaSqq7EufphbZJS4u7BQiuWgQCk0UZcQoTwx9kz3CgvIE4AqZi04/qECNFng/1xEie7ez/4Irh4sv+XSLFTbP3Dmaj81J2RiAqgK5bH1RkaCO7QD/+TBugVEgepA0/MaM4a2cANttZvNvuOlUY3hto2btH2OZapkS9I1rk64MIaGx5If2T2BVVPHufYaNn6pbS1gYwvmh96ts7vg46m5idO3sf+bv3gqLpAX2JuZtxNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwY0HYMhWaQB4E2GYrMA2gEpuOYeQFIadZ1LjunC1ro=;
 b=m+wQPl31D9qDuJbcAAnFxgMn/w/ZRjrP9rJ32Z7e6pDG23g34urEMYUpxmp9pLu6r5V/ok17nlEn8I90QWuG5T7GNPGtGxvpU3EvZ/7b1S1KgkcOI9qqSQa034TUxnn77sl2qknlHI97UIOvl0goyZxHIFwu/MXunDzi3/ytLmStuGr/qt1sjEQnKnyxaokO59tJBATGAbf0I4FGd2EGAYNpgcocq7X7O4ZZVnFuKnjeRtLSxTrgxDHki1HXq6uXydbhqzQfPCIHbtZdBg6Xj2xe1MZ+4nDcnTCg/AcUbGUh5xhHg0ec5Z5NNv1jQ8C8TQMR9Xfj2Q9X8XvzrBhcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwY0HYMhWaQB4E2GYrMA2gEpuOYeQFIadZ1LjunC1ro=;
 b=SRCPybeVuZJD0ufskRqXsCCdxxzqEZpaPt7hQgl/c6jT2doKK++rO+36919bzh9BxOv+4FJTiEKwki1y7evEXubPulLIUXVZ8A22buQl0zbm6a0dPW952gC78J+2jxHMxC6lGEa8AUHdNZSwj0+UNzgL9GTmS6W+2BZZf2D5uERKa6a38F7+ps4KaulZIwcZXqOx7Xcc8nVJMJXPf9RrpStT7lLoyK6cQ1JghbdS1GJmM5OPqDYyacaIX7996sENmXa3J/oeOlKLZ/q9osXH7M3ytPKqJkTFCxhZ7kXQN5wdsENSo1mRcs3ufUn8RsHCX5Oo9DwQhUtjP4zFr/K8XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DB9PR08MB7843.eurprd08.prod.outlook.com (2603:10a6:10:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 17:02:33 +0000
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
Subject: [PATCH 1/2] selftests/perf_events: fix sigtrap_threads tests fail with -O2
Date: Sun, 24 May 2026 19:58:56 +0300
Message-ID: <20260524170209.37874-2-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: db3b6626-5bc1-484c-8d0c-08deb9b63f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CI/IqheUa4GSNb3bFhnlsEy/NhmyIl7Y2ipGArXUINIUVHx3pQNTm/ejzEpzRuzxVWPEaB/+wTkcha5SrDIjhtLGupc8DQmCFx63WrnhVDpUMmzIpRvd3j6Pp64CWtz/wUcW2pCNoCzCHGJ/LzAd7gjy7wmP8RzOdk7ja/zBywn40HjeJjBM3WliK7zf7tJBrzvSWaY2PAPwu7FUAVGRsxwZw+CQ21nDfLDHFBP9p+8ajg62o1u2ljUPymA4di+b8oA2yad9QnRtP16YbrvMjfAjowhGJI634rMKEn+fHodvj5TgSkvYRNOI6mqMSvbR8640MNOcIA7MeWl65YBgNk9eQ2/8/G3VaSo79mwF6h7fDgH5uZz2k7c9KaZ/RfZjQcnd3OBTdQiiamZUBM8pVnMlZDqaC2Gwp2aOkq75etQPN1mPUvgYtV1dr6WxoRxfxicvHgexZ2OFjsUhfezTBcvKSqJUPzESyllsInCUjvGc8U6EHNX0nJAmqmIrQU0w6z3mp245MR3hkD55gGYwn3oA1vtRY9Ajg6ZLi3MA3ujSaxa6+vwWgAGv0pE0+sSPc68/3enOpx80QRx2osx7JyCRhEUrp3whD8ZkhP+XFQosOc8L+BKUfu+aN9AIIe0GKXk3b0xTxEa00euAn5hEWLlvr79GhgQNz8o96eRzixRQQljG1pCQ/g/UAvSmD7X+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OFf2vz/N3AxXtUhZ+Cl1YGmRKUzIg+5Rd1Py6qGeP12GYu56ePzPY0fU1RsQ?=
 =?us-ascii?Q?6IWUcSgjMpwKRs26X2sIErBYAyADKew0If530meTpRP3HEv2m2j99W6uSCXo?=
 =?us-ascii?Q?wlvcmF+cUyQ6pPgE6B4/hKLnkSZNQ1kqq/ppZGsEqNHSTTNpfaR27j5F/T3a?=
 =?us-ascii?Q?rJcL8ZqSx8dK6xWfMk1TR9ExbSPJsbjqGlHUxLOn6CQdTz5N4DSjUJRCmI7C?=
 =?us-ascii?Q?zGm+6YWTpiJsPvnFM0hGL1G7oEGxQbrXJYAvfpjyAfqXEmY9sYqzCWQe+ahL?=
 =?us-ascii?Q?PTlEu1B1fySw2PH2oyfUyJk9QdHf/z1wIBchGzbGphXCry3EuPPPr3bIVKUz?=
 =?us-ascii?Q?7Ql56ah2CeVOX0OiTNWwIhgCCsWvBzgn+3CJ4du1gQEECTb9nypUKRRAytdR?=
 =?us-ascii?Q?DfP2VrtZ/IV/9WT+fcj1aJ7qFEl2GgRjK5UvEhzqnG2mOJInMecJfhTaEnKg?=
 =?us-ascii?Q?LCmSvFSCHutVO1mYEkvDJfzM4PhgknFIsoSCzwfGzqXvrBhQZylAM42cplq3?=
 =?us-ascii?Q?Ha7gtGkq+Z1YUrNOK+nOHTXYcgcNutcfl4QOwzLZ71f41/WJMvo50GN18iMn?=
 =?us-ascii?Q?KdsrClwXXf7S6xuVg1IC3Yhz5/IFKDl9eF2ulNHQJvPC22w3+jgbsn1NEwIC?=
 =?us-ascii?Q?r2Ryeuxc591RzvYj8mEEwuPg3/FYw40jIZp+ArQxbFAeJuqtLtsDpCR8VW2t?=
 =?us-ascii?Q?05Jja1doeijR8vgiFMTSZuFQvyR3SDNDTuPJD92IFnFp6O5e7C/amVMUTMBO?=
 =?us-ascii?Q?I33VDThOpJ4ys9lKFAEkgGtmVZKhbPLzalSfmbmsViuhzfaDRS5XEv6QWKsO?=
 =?us-ascii?Q?0uRsECMLpJsrGHU+J7U6jQT/UF7fbpAdyKIpO3xRpwW0MZCR+IYQbCWztnfj?=
 =?us-ascii?Q?z0wrguW51EmMHucQAyFO5wO4+5g06gS9JXk8f8si2z95d0urt4AjZA+po5s/?=
 =?us-ascii?Q?0f68NSY1yHQWdq76l96yflO/YdZGt/9Ynue6cc+KTBQGOXtkfwZFPMBkJZSB?=
 =?us-ascii?Q?ZQF8eaFahRa+pBbJvR96WZ5oMSs3POyw8Gv2gGikMDIcFahx2K/GXQkfI6pr?=
 =?us-ascii?Q?jlRErsGAY0LWWtTZ3uWY38YmThw8SyqlVS0URU0p5McHgnvHe5BOXQGSWyHi?=
 =?us-ascii?Q?CYhzel+YxMTfUNduUtWHfXNPDWKVLFmN6hf3/USyE3WGsBD5E3KwZ5luuFPg?=
 =?us-ascii?Q?594e7jvdy7r4uLIMYQxmOCZOi7+HXZUtdHcm2SeLnntIrr/EypFzKE8cL7aF?=
 =?us-ascii?Q?Se7TMocnlLqn07pLxg2CifQRJezkGR2BImfKSmFWFNsVVsZ4h8q3OEJ/KQgL?=
 =?us-ascii?Q?cax1KhksgNL8TBjNvLj36HYCyi+If3Fje4xEguEXE2nQRtv5zWUhy8u08Pkp?=
 =?us-ascii?Q?5dennAAAlOo2APC7ieoLSGyz0XHcRI8LEFYv18eVcF9Em5awV+0HyLwIrEfV?=
 =?us-ascii?Q?bTt59m+c4jXfCnfJ1Gmkp3xltEoHVC4oe0Udw8gnV9sb8EBFb2dV4u1QdknX?=
 =?us-ascii?Q?JnJLSBHuPt0W+8Ks8fGIkXAzopTjZ9Qbravk+Q9l3jPEf84NZldIiWQ0dmHv?=
 =?us-ascii?Q?h4sVqZ2DWwKHdy8H8fynxK8eNiSC+2UH2wJViBUo51AI4nb+VlQKwSMPA9DW?=
 =?us-ascii?Q?qNvb0Wg2qJW2btqgFy4+6RsVhFivq7SBxLmPUG1J5/0SWS0ufPMlzaOUiGX/?=
 =?us-ascii?Q?007t2lI8joS3wphmyauehlbM2b3qr/DnVIIdg6+qH1StO7+ryLNB+RPdetdg?=
 =?us-ascii?Q?eJbQ9s6xYs6Nt2AYEKzDPcVilAVTWlE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3b6626-5bc1-484c-8d0c-08deb9b63f7d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 17:02:33.4257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wyla8FbWwp6Y9t7+WAUtxcDxQ3HShkh0/SFyj9px1h5sT7/eQfWiVc25qHN5ZPh8sfcGS2VpEXYhFQm3jNCoQbF+SgSYJBni2zbevzqzywY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7843

The enable_event and modify_and_enable_event tests fail when compiled
with -O2:

    Expected ctx.signal_count (5) == NUM_THREADS + 1 (6)

The test sequence is:

    EXPECT_EQ(ctx.signal_count, NUM_THREADS);  /* compiler loads into reg */
    ctx.iterate_on = 0;                        /* triggers SIGTRAP, handler
                                                  increments signal_count */
    EXPECT_EQ(ctx.signal_count, NUM_THREADS + 1);  /* stale cached value */

The signal handler already uses __atomic_fetch_add/__atomic_fetch_sub for
signal_count and tids_want_signal, but the test body reads them as plain
variables.  At -O2 the compiler is free to cache the value across the
SIGTRAP-triggering store to iterate_on, so the second EXPECT_EQ sees
a stale register value.

Fix by using __atomic_load_n() for every read of signal_count and
tids_want_signal in test assertions.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 .../selftests/perf_events/sigtrap_threads.c   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/perf_events/sigtrap_threads.c b/tools/testing/selftests/perf_events/sigtrap_threads.c
index b5cf8355345d..6b246e0ffde9 100644
--- a/tools/testing/selftests/perf_events/sigtrap_threads.c
+++ b/tools/testing/selftests/perf_events/sigtrap_threads.c
@@ -159,8 +159,8 @@ static void run_test_threads(struct __test_metadata *_metadata,
 TEST_F(sigtrap_threads, remain_disabled)
 {
 	run_test_threads(_metadata, self);
-	EXPECT_EQ(ctx.signal_count, 0);
-	EXPECT_NE(ctx.tids_want_signal, 0);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), 0);
+	EXPECT_NE(__atomic_load_n(&ctx.tids_want_signal, __ATOMIC_RELAXED), 0);
 }
 
 TEST_F(sigtrap_threads, enable_event)
@@ -168,15 +168,15 @@ TEST_F(sigtrap_threads, enable_event)
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_ENABLE, 0), 0);
 	run_test_threads(_metadata, self);
 
-	EXPECT_EQ(ctx.signal_count, NUM_THREADS);
-	EXPECT_EQ(ctx.tids_want_signal, 0);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS);
+	EXPECT_EQ(__atomic_load_n(&ctx.tids_want_signal, __ATOMIC_RELAXED), 0);
 	EXPECT_EQ(ctx.first_siginfo.si_addr, &ctx.iterate_on);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_type, PERF_TYPE_BREAKPOINT);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_data, TEST_SIG_DATA(&ctx.iterate_on, 0));
 
 	/* Check enabled for parent. */
 	ctx.iterate_on = 0;
-	EXPECT_EQ(ctx.signal_count, NUM_THREADS + 1);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS + 1);
 }
 
 /* Test that modification propagates to all inherited events. */
@@ -187,15 +187,15 @@ TEST_F(sigtrap_threads, modify_and_enable_event)
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_MODIFY_ATTRIBUTES, &new_attr), 0);
 	run_test_threads(_metadata, self);
 
-	EXPECT_EQ(ctx.signal_count, NUM_THREADS);
-	EXPECT_EQ(ctx.tids_want_signal, 0);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS);
+	EXPECT_EQ(__atomic_load_n(&ctx.tids_want_signal, __ATOMIC_RELAXED), 0);
 	EXPECT_EQ(ctx.first_siginfo.si_addr, &ctx.iterate_on);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_type, PERF_TYPE_BREAKPOINT);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_data, TEST_SIG_DATA(&ctx.iterate_on, 42));
 
 	/* Check enabled for parent. */
 	ctx.iterate_on = 0;
-	EXPECT_EQ(ctx.signal_count, NUM_THREADS + 1);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS + 1);
 }
 
 /* Stress test event + signal handling. */
@@ -207,8 +207,8 @@ TEST_F(sigtrap_threads, signal_stress)
 	run_test_threads(_metadata, self);
 	EXPECT_EQ(ioctl(self->fd, PERF_EVENT_IOC_DISABLE, 0), 0);
 
-	EXPECT_EQ(ctx.signal_count, NUM_THREADS * ctx.iterate_on);
-	EXPECT_EQ(ctx.tids_want_signal, 0);
+	EXPECT_EQ(__atomic_load_n(&ctx.signal_count, __ATOMIC_RELAXED), NUM_THREADS * ctx.iterate_on);
+	EXPECT_EQ(__atomic_load_n(&ctx.tids_want_signal, __ATOMIC_RELAXED), 0);
 	EXPECT_EQ(ctx.first_siginfo.si_addr, &ctx.iterate_on);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_type, PERF_TYPE_BREAKPOINT);
 	EXPECT_EQ(ctx.first_siginfo.si_perf_data, TEST_SIG_DATA(&ctx.iterate_on, 0));
-- 
2.54.0

