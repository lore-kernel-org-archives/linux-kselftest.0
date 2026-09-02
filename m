Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023127.outbound.protection.outlook.com [52.101.83.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058E3AA1B6;
	Wed,  2 Sep 2026 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339042; cv=fail; b=Z4Y+knM3RAZR1HVOuzAZ943rZ7x5bpr68uvSPJjhfz3wTiYXrfsNyhIsbbQ//9PqsNR0W2WODtJU1mOpTmGNVtIGMIgB+a1jg0lA3Xpw1dAx9YRi9sOrhR19cJOH1KtNppzeaE7S1GvCVha1W9HtMgp4XUC1uxL8m5ghmg92a3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339042; c=relaxed/simple;
	bh=zklQBvrGrgqiTs/488dkicrNvDpq/6bQG0JNuv9zjaI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gfbI8/3bD2XgpwGNFtMRqhqgmL3R1GZFN3uLM2n4gSCycb8nHMhGulCxEuUZlQ45NODbjcCvYNnb3wrOlcMhWOTfUnCYcm4qlr312XTw+YgogQjVmHM/gtyPbKcbCSpgWISP2e/q48rXInh87s2ItfVRNze+KcdgWekXee2Ev5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=KaVdAqYI; arc=fail smtp.client-ip=52.101.83.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="KaVdAqYI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5nkgM2vLde6cpD2h84jdgFof6VvJAFAiHiX/E70zy/F4nJry/S/8tlVHK7Ob406eHoeMqVqvISBP+A0d1pkT3DilWj+sbGlLS5vLkHFfHMn8MzWpWMqW5wQg4mFuIQ6jmfTfRUMDXb3+W4Mp3ttGiAx0sVidUL+HBtf/QJQw6LphF5uDagylqKxbwnxho0z1fg+1ySaLmQpCcolLxc1HTIt5H+bHuDLuv0nfczGCwVPnfjrpJeabdRhhNAhFJsUU7CUaY7qsWJQHnsJk37nj/0OdznjAf8sBJBb1UoDh8r96JFvyNXLSWcnAvr3Hjccp7QuDyrVwDx+rYnrrWyrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi4XqxrGBqzIuWmDIgVa4wNhI+WUj+oN8hXyrpinpYE=;
 b=yM0z7iaUa0OQ1N+Fo/kirND65zWhs5+6Mndiw1u+slxyBtoJEj0C0Tm+03rCj+ESnwxQso0NYrgkHYugD56GssYKponrU9wvCgEq6wsWtcjK4+dm/qiBdIduA+bdUZi5k0qI9qgqWa2ae1QhaCp/VgAFRJewN3QVTkBcsr/Xq0309BPElA+pcai1DjbI3UEfjjk75zOgegJvrRtscpfyXia+bMUCAmYTZuUZ8VUUEfSU5NIZmMdSGUyITyHlpznh1QVEXQ7tgiXjtr8iRB9OMnlAtGF1LDpiG3EPdRuCTpnXVGOeGwFnRgvksia0GweSbXou9y06bl9WnqxhBTZuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi4XqxrGBqzIuWmDIgVa4wNhI+WUj+oN8hXyrpinpYE=;
 b=KaVdAqYIFULtek7s2V67WCn0ij7gkFoQZddnWhbBx9EFRf2VLlmOj6W/s4ETi9PqrCt9i5myAV0sYYfusTWcBCCcSsAa1+4qqA7ED+6dapBN/U4M0jGQ++mBBzBp4bvE+kiIH6njFJjaYPnnJPiJgFBnk4YkCQ+PP8D0/gdtzKbbdMAGh+Q+uuMly4tLCiZ1b0GQSe5lv3zDM99T41vycbqvAG14CfBx7f33covtGoBA8ve0RVtXAslSLkw/fd2bXnQP7CLgcO74Rz6eR02hNO3X6068/0mQtkiH0mNNbwfnOpgdb3MUKaNjzUv0YlFFSZV04+kT7X0Et+OgN0I4gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by MRWP192MB3048.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:50:35 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:50:35 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH] selftests/uevent: Gracefully handle receive buffer overrun
Date: Wed,  2 Sep 2026 10:50:30 +0200
Message-ID: <20260902085030.1378789-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|MRWP192MB3048:EE_
X-MS-Office365-Filtering-Correlation-Id: 5322e66e-4b64-4cf6-3313-08df08cf415b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	NIsTD39vVwxuedGmFtOMVpIcBN4js4dEJEH3Hbi+LWXYGg5r2JtUwuxdcoOSCYvS8sXyLrWqqaaEUosTTMU1MfbrYXsQ5aBmUeTCRyzX3Fv5fYRxtqj8CvMvDOod7liN+EMs0vGvKVeZ6db92AkpOeNVdlkCBJ7SnvXl4ZSKC3la/jyUC+LURPqBst5qt3zpm4rx9iVRdu4jKBhLRPfwUOqWg+AoNywg4aEE0QCxC0NOANwSdql7t9potYKjlvA9hm/WcXBYkTX5uefTxwhfi/ZB+aC+P2E8FddZr4Oo3tQ1wb9sLd4h5epXfd6z8LR4L/A/gLhJ9FiFU8CRBIw6VY/O/lgX9c6kf2ddqXmtXaMOqIsXm3bSmQ0L6jHpYg3R8WevOdeibFc7ssW4VbFCoo8sikBHmJFhY9hozZo0EAq4ffD3l7CfsHNLFMITFjOtIwx2j62ZLTaHXy4N5br0uNuw999MEA+JafIyMWFgHDf8IFU1TUGl2fpe854w1nnwcFshiQq8KLqd/F+x7dkYl7pjfMiy4Ce7zpvXiJp7fpINBufMljg/aXMRkqaTfDOA7BRjkA/Omrtn6W5HLMoKYn9ncVIDYeWqnBluE/BOI/T/9bf2YMWTC2QAXk++YkaeYDePRyd/EH3PtOGBLU/OUlwSQb4Xx8VuGYsb6F3vmko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zVDL3DPSTt+OexL8vJO8yJGCz2uQicWnrBfPE8OyRZtMWGsjavtSk/gi/54e?=
 =?us-ascii?Q?73NPgLAlv5vgka2gt8Suy5yIjF2wUxP/DiOgVghSR4oAxGRxPAfel+Q0hVZW?=
 =?us-ascii?Q?18djhUThGFHu3NvLCZyxuGhOzaQxwhtmoLj62AKeVQxSZl4+7sVVsEw6JG64?=
 =?us-ascii?Q?bJonCnzU+kR60bCtsraOJX5iQtursqoqs2uvJJtGfU3xEp+JwIyAl2ZukXyi?=
 =?us-ascii?Q?vDt6hYgGXhwzw9yQr8FJpKmSA94YGjkkDl213586CLZZzIZWBaeKFAXhH6AK?=
 =?us-ascii?Q?D8BmM55YVgzbMU84q+z2D+eeylOoc4FSgSdKoYGW0NzL6FagcM+730K9luOj?=
 =?us-ascii?Q?7Uvw0LbeDRqJUL9wFAF8oT1oZzhhywFwBRYv/XIKV2ba52pV+nXoJBOnd6JT?=
 =?us-ascii?Q?FMq24pDtrZ9UY0dcoJrUIy2wd2QZEcxPguwzXdnZSSPjxFq+NAqFAwxgmlhN?=
 =?us-ascii?Q?iFWBYA8YvTYc9rRZXFZMclIM4XZSQUiWO2gV5Rn29wZbEEyKeKmiC1C8wCV+?=
 =?us-ascii?Q?G3wZR/9tP519NXV2aM96IBCIgDqz6o5qjk1kTO0kKtdAxNFM9gQ3HdWHLnN0?=
 =?us-ascii?Q?f1B77zhaECf7xxdy+2M2g5DSm7uGwltc0Mull7IzIJ/grreDYkuVwO2oKd54?=
 =?us-ascii?Q?u7GA1EetEPkcSRv/F7Z709vLMgqe05EOoIAuOsK3MYpPgUt80bq9LtXrdhnS?=
 =?us-ascii?Q?dIUErOT1sBxZJu0P23PHvH8DcLk4blPJ07WFLwS3AEx6FmGVOCwNxQ8Sf6he?=
 =?us-ascii?Q?WOSqlafbRONd+NPfCmzJ2fJtTYq8YZ08j7qt0bnQqljvb6RhsPjefGYCl5LA?=
 =?us-ascii?Q?ZH135YS9IlwPyN7sfa+Oyu/YRM8K6z2UMoPzD/ScIe0vUJXcHtFBJrr3Szuf?=
 =?us-ascii?Q?71TiOA0LSBaI8mH5H2FhOH4EF1AGi1OATie1WHr15HyaHEFDYUELxkP8kYSy?=
 =?us-ascii?Q?gKhpJDSwt2Ui+mnl8x7/DRtNaIU7s2ZBb9f5n0ToerJ3e4m3QSNzPmhRU37c?=
 =?us-ascii?Q?hCPtoERiket1kCMsxqoQS0ylNBSujbH4c8BGYc966HBmf6LKuxyESFL/vhj+?=
 =?us-ascii?Q?I7UpNeLhs4UbSfBCeFdTwzS1wl4yrTGr7IfFjRoWZL4uggUHlk5xXXOvUgFn?=
 =?us-ascii?Q?nOTr5FmerwoRCc2RRT2H5GCXYs8areGIisjjCHZqiVhCeyBhfRJ6Ld6Rub9q?=
 =?us-ascii?Q?eayQUVvu5vMMmps1VLKnhBMn+z+T6hxcQOKCV2CTDIabJYvzGKvN3MVbTbsu?=
 =?us-ascii?Q?8aR31N8remaewNdm3JSuK6YiXLC3KiCNFqpCltQCAzlkf+oSzoin7bh4lZuA?=
 =?us-ascii?Q?A2BmIhJcEQIOuIgAx82+DCtUe0PcGJWCaMiCwC2ZjrDsB+PdxB4p3+bjdQfD?=
 =?us-ascii?Q?LpMAcXJbwhVZ6WFFsr1sNPklZj/xCrPkHurzdtMJjxTpjBJsteWikIhlcvgV?=
 =?us-ascii?Q?UWcMBCxIHYMk0TOw7z4JtzYFWQjsE1dO5hCz59/eT3O9ic6MA9zTA2tqFQEo?=
 =?us-ascii?Q?FqpJbg6dlx93Pl71IRACHAM2nCB/mNWLflcXgaPb+N0sepLMNfNGHboLPXzl?=
 =?us-ascii?Q?AlIraFnwjpbF+rn41Sow2J10MQGlx/qgqp8Oa2QfWB0m4OQiT5avoxB/tC5C?=
 =?us-ascii?Q?zrLvY0/xnjBvf18PgOsocFyMfgqYusZkJyO5bNUYyOIKZl/0+s7EIkN6pk3w?=
 =?us-ascii?Q?2aXFkWEapTzFsxmQtg896uutUbVt2nWgDimeW4SMm2m0Iaf+wTc05tqKNJhi?=
 =?us-ascii?Q?7libZCWNOutR07JGrXwNsFwaE/FYV7/O5JSlCNUBbKarlPeG5cfFfo36Pi/D?=
X-MS-Exchange-AntiSpam-MessageData-1:
	Vy88Tztui/yM5myO5Yrvt3tY+3CmrBE153Mfx76oE6np1WfL2Vwv0/C3
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5322e66e-4b64-4cf6-3313-08df08cf415b
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:50:35.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRcxBFQ04+FdTesmUs/10obeP6/I8EZcS0MtmIKR0FQ9AOMKzZ2nGlINCbNXM/hueUorsOynRJ3S2sBV6yxozLN2FfmDL271FO8dY4EMeLXqqEgE38sjgI16wEHvPwhs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWP192MB3048

Due to udevd rebroadcasting uevents, the receiver's socket buffer may
overrun and the kernel has to drop messages. Instead of failing on the
overrun, continue listening for the remaining copies if we expect a
uevent until killed by the timeout.

For each subtest do_test() of the uevent_filtering test case, the sender
triggers uevents that a receiver should listen for. These uevents may
also be received and rebroadcasted by udevd. This can happen with
some delay, so uevents from an earlier do_test() subtest may generate
rebroadcasted uevents for a subsequent subtest. Both, uevents triggered
by the sender and rebroadcasted ones are queued by the kernel to the
receiver socket buffer. The buffer may overrun forcing the kernel to
drop uevents. This causes the recvmsg() call by the receiver to fail
with ENOBUFS. To fix this, do not treat ENOBUFS as a fatal receive error
and, if we expect a uevent, keep listening for one of the ten triggered
by the sender. If the receiver is in a namespace where it should not
receive any uevents, a dropped package may be the one it should never
reach. So we defensively fail in this case. The wait is bounded by the
sender that kills the receiver after a timeout.

The rebroadcast can be observed in the udev logs:
udevd[115]:  seq 6774 queued, 'add' 'mem'
udevd[2436]: seq 6774 running
udevd[2436]: handling device node '/dev/full', devnum=c1:7
udevd[2436]: passed 200 byte device to netlink monitor
udevd[2436]: seq 6774 processed

Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 .../selftests/uevent/uevent_filtering.c       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/uevent/uevent_filtering.c b/tools/testing/selftests/uevent/uevent_filtering.c
index 974b076f9235..7414ce86700d 100644
--- a/tools/testing/selftests/uevent/uevent_filtering.c
+++ b/tools/testing/selftests/uevent/uevent_filtering.c
@@ -158,6 +158,30 @@ static int uevent_listener(unsigned long post_flags, bool expect_uevent,
 		ssize_t r;
 
 		r = recvmsg(sk_fd, &hdr, 0);
+		if (r < 0 && errno == ENOBUFS) {
+			/*
+			 * The socket receive buffer overran and the kernel
+			 * dropped uevents. This may happen due to udev
+			 * rebroadcasting kernel uevents that end up in the
+			 * receive buffer as we are subscribed to all groups.
+			 *
+			 * When a uevent is expected, we trigger it multiple
+			 * times to tolerate drops, so keep listening for one
+			 * of the remaining copies. The parent bounds this
+			 * wait by killing us on a timeout.
+			 *
+			 * When no uevent is expected, our socket sits in a
+			 * namespace that should not receive any, so a drop
+			 * means traffic reached it, or that we can no longer
+			 * prove it did not. Rather fail.
+			 */
+			if (!expect_uevent) {
+				fprintf(stderr, "Unexpected buffer overrun\n");
+				ret = -1;
+				break;
+			}
+			continue;
+		}
 		if (r <= 0) {
 			fprintf(stderr, "%s - Failed to receive uevent\n", strerror(errno));
 			ret = -1;
-- 
2.47.3

