Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021139.outbound.protection.outlook.com [40.107.130.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681BD411680;
	Mon,  3 Aug 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761357; cv=fail; b=XrikFK2jQ1kENLL7LUFTxm/sODPaXedWGN2tRl/WTPyQ9IfUaDKtHLr3mbM7WDzHcS5Rv1NQ1oFl+2OSGEdmE359orxGgTSzvoQK3jvIcRBWusvQ9bzCFv1PUNl9jvqqscwUJXO2IZvHDmABQyfa/IhUjQdrGJDU6S50BlrCtng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761357; c=relaxed/simple;
	bh=5zS/gpxZFU67KT2qYq2mXJwtMfdzCq/bDMQaPmAvW6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cd7WFWyfV1f6gjuX9gpcl49iX/s1cQUWlEZPG7bXO2PR2wnI/qTQHc6DUnngpny/yO16S0M5iGnrdrXONOPdK6jhprdHUBxMOledyHsO52bL5vdnct2ivmfOl1zif/Rv72Hle7CBSeB5tAoDrPWZesYQZ1+IZfLRkC/wH6VbonE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=MI8uE/Ru; arc=fail smtp.client-ip=40.107.130.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="MI8uE/Ru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/NB2p5yQTaeIRGPWbc3w8w+eqvP+jZzMV89e1gaqE+Jce8r97xcXOIsV09L2Ho4CCQHdSUlySxoudvHR2mBQH7kHKyCJdPjmaArh8er7W+Ap4NfLPU5Xan0Fli24yljBssgNzUlWgtFenzqjHsjMWenjxkuNtvaoxevG3Ff+TLj9NPKlnBhwI+1PpUBuRmHRwpwpJEaC24nOsb0lT4mL2DLE5KfXUtYQ5ZJMoW2ypvVRTDZavA0ZIGwdq0rTG6opUeFh15Ept+cD/woGW8t39yHV1vQY9h1ieBlq7RGV/gzBNynDO/yarwWJDd0J9EOf1EE6pzlT9v16CWKISI5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmzjD8soW7n4O/0MMX/8YcNV9XBdAvxyaTsgN/iW1Zs=;
 b=aANvvve74FgcSUsNHmfGCS3Pi38fouKAVFMxFVBYrXq+1pS53aLpRZAus646jRdNaz8tIlH90SGXdwbG5s5BYUYGPeYzrbUqE4QQBtl74s4hZZ/fR653hMsGMEeZqoZt7D+G/0bh6kEoDCSGsXC6W+6VOWz2u7zJl55E1+X/QwkZv7X5ISN6pRSTQyGlOSTLmqL90fTJp8BWHU5DGcEUIj+Z66UI2GMxbAGwexc4uQ4E0aEquAZcyfyhyCyeiDCNXgEAIXLmp78N3Sn6rq+5NGS7E4aO9AFDTpvtLceyoxIadI/x1l2j9mKTlkf0axKvuQ1FlIVRa3ujsgU78ASMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmzjD8soW7n4O/0MMX/8YcNV9XBdAvxyaTsgN/iW1Zs=;
 b=MI8uE/RuApBzMrTtFcOGi7yki0UlFKiRNC94IuUdbQ8HOYGAHAwGfHjkRk7qOwhfYQ+T8ZO1l01XlXQRHdltzohJrqWg31PhXsqRuac6EtFxmXlK4AGpcurrmsGllZuUAX2dmetwVSPMLxHOIWuxrnd+pO+3JTBZ/IYmPuA5ujk4yYuA4E3bm0lpmWwQ8k3iU7+HaoHbjwTbAfKEhzAXevK9bIJtsqsQ11e62hNed+FeOIJBsfo6pqKL+lJ9g+3QFJg5DSYe+WlAyyhh236zw5PvLwUNJ18YQ8afLke4PLtN/G5GaniUHQU9C/0clRTI4oq/wqH46bk1PzqB78cZnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by GV1P192MB2681.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 12:49:10 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 12:49:10 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	reddybalavignesh9979@gmail.com,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH 2/2] selftests/membarrier: Skip unpermitted membarrier command test if preregistered by libc
Date: Mon,  3 Aug 2026 14:49:00 +0200
Message-ID: <20260803124900.3328789-3-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803124900.3328789-1-christian.gellermann@codasip.com>
References: <20260803124900.3328789-1-christian.gellermann@codasip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0441.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::10) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|GV1P192MB2681:EE_
X-MS-Office365-Filtering-Correlation-Id: 49749db8-60a3-43ea-4069-08def15d9d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5HskcvaeYWQb4PMT0KCUyi4psoJ8UoIojLvOenjicXkTNGCeOHDp3/y8J/XRcMnD8kaihG8mHwxyRL4uw3g0UpJb/BRJUhdkE7sWDmbsiFnMgQ9PRplFfCWlMvK1vFE15B/t1VdADXqPyJCE+0XS8Z4fUAy3sR89/HyPqsJ6F5pDDPQAbQR7bfCmqOiH17m230mRBKBDEIJdURVMLy07gc65PRij6HQ6ihkI97r+abTn8fkyXWdkTUji4nNInWlT/A1Y3XywtoB1cxDpw1uWjN/RxQViC587YJNeGnLZKCIJjK0GWIOWDI4oagxWkBQwCZ6MqwwCySfOz80orCi6F6caQ+2jtyInSEmdKhDmOHE/1xhGIDOZYsxKjkUcVpKr+8/3h3z5L0laFnat0YSCk9gwuJUjr1xjjr3+U6C0hWSdseKKBFFXIkcfUl+xRM8p+rkMvkCvSNzKEPIVUKXBF1ccGne0lYaSGn27tWfPUY45czepzTfhFoothS+NXjTB2r2ETnRw54J/CgQzOycD6qw6iLoB/7wm3Pl4IsWzORJJv9Vp1H7W2OG+ssqdzl0Opqah/EOuBNu/uMBobn+E0C8ivGpdqesMr9YVV+NDics=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w3ESu6gg3qqr88xM1qvxsFhPFUlgPfHFsSMmqtxHUBQI3RNW0TE8cglUKWAp?=
 =?us-ascii?Q?rXqVDs17Ebol4XU42z4pPweAwYhEon3+aBUcU64/DeQ/fYZeYckyIuzMJSpV?=
 =?us-ascii?Q?kfXMoJoqxbCZe9mfejalBsQjI0U2Lbvqy13xYgIRhRjWFaLzoWdhezlCc/MV?=
 =?us-ascii?Q?dsZUH3md/JoHVXLpsDno0ZcsAngeKvGUphxzo1YAP6JO5LkM1WcZvOI8db83?=
 =?us-ascii?Q?6XaBLgw72c+kFG15kzsZAC5r3lkWvzqj/9Cu6u6zO1olcr5pj/vxBKx4asby?=
 =?us-ascii?Q?qBrW3OIJkkUVC9f5YdcReIxTmlHXKgq6kVf+DZOup0QdB/t6osn5xpyFWRLm?=
 =?us-ascii?Q?DpmTdrpS1AoylI8gFL0STPt0aLue0ZlxNRe/Bo/a257VQIoF9rsDMiF4AcBp?=
 =?us-ascii?Q?l34vJkXliysDUveEeGLEyFPWkGhxwwsyGy1/iOeajInKGngBRhpPArcGHJBS?=
 =?us-ascii?Q?6awb16ZPSfLrKkNbYohs5w8pUfmJV17x+IhTRumPjJ9NnlmeI7Y+2j7yb91I?=
 =?us-ascii?Q?5+4dyMAoyUoe8V9MInYzPtM59NBhNPfpz5FiiSblMUGAzasU36L3FywGmIcO?=
 =?us-ascii?Q?qSF1x5B7uHXFnlCGoAXtJizKzNd3Oizc6klfRxejQ1tiP02z3f1pySUNJDkR?=
 =?us-ascii?Q?eg7Ycy5/fYiCOxXUYic6xW8orVTk2ubkrf1GKKvuDc7DgSGZJLSCVBeTl2md?=
 =?us-ascii?Q?rClAzdgcmBd8cm9h48sZ8TPjiu051qeysGOvy+T5UTjDKFeqQThx+V7TKJtD?=
 =?us-ascii?Q?3cbdYW6KU4/MW2bWtPvX1+Pyqq3gZtKYxYLHmsG8HirU0wjenO7NOPz28POI?=
 =?us-ascii?Q?9nbLCUH785FB6sNzNWpMVs23PK7ezdBQUlqDyKwY7RR+b20OM1j1trdr0fOq?=
 =?us-ascii?Q?qM2n+Ek9ZVT9crwBCiSR7tgI9Sa+at2lf9gVUDxosicw0wyePfRPPYYqvL+l?=
 =?us-ascii?Q?85fSZmiFEA6Jmf3SYsc+DBP1mjW6y9rQIj/AVZXQjnSQ/Hb6POZsf+Fpq/fi?=
 =?us-ascii?Q?SVc5uhkI+/BRnFOKi0apKKZVI8foLQEp1qKnR7cMnt1rmEY9jQNEU9EQVU7l?=
 =?us-ascii?Q?B6tsu2JJ9EBvetukWsJYek1rrav992Xg5h1nXWpcYA1HDJiQD+mDgcCWyunA?=
 =?us-ascii?Q?cfvbDGn4dhE4GTtBSWCn6zUBiBMCSPyS1euru6b1Is4fh+fIS4VgEoin+54F?=
 =?us-ascii?Q?Uld7jFbBWZjLtmTC71BF7lRo4ehiVWEqY27FI3eO0w4gzc/f+kvgdyJo1pdA?=
 =?us-ascii?Q?FROoyAdL3O/Vy5/jDVLmJkwqap9m0GSm570BL7Ng7eR8s3S8o5At3Q7OcxJt?=
 =?us-ascii?Q?2tBMXX/F/QALUsxgMkT79j5oQ/4oQlVthvyt6uCn1EcdB6Wmm4At1rC5ocON?=
 =?us-ascii?Q?9RSUOEqJzlgxWt6SEWfJTe9ueDwsqKyvm9p/i0dzPMpTUZxsFPR1n+k7AQfT?=
 =?us-ascii?Q?flwQcZ0Z6cSMzE8e3VSIEYf8b76bamtC4Lz5pZSI4w6FWFwXA5gupVtWa9dK?=
 =?us-ascii?Q?c+k/Btlg1+rEAGmLqcsSgxEnATPPhO3PcO4+QUO7Ng8OPKawVx3EgtEVS0SQ?=
 =?us-ascii?Q?b0XuzEr7c/vXLA11+NUMDFyjUqsro7fo0q216rBhtnOq/4vK79G2GC97UXhR?=
 =?us-ascii?Q?BU65MVJ3HIG2XqDCOkzImx40aVJQnWyIXCx9t4v0NuaXvdcPvdHPR3z/lJWX?=
 =?us-ascii?Q?GT2lx2ktZmMTIcSE085+769SZSs8LmQS7gt7jGt5vD71nhMRNfKZzBVvWQBy?=
 =?us-ascii?Q?46URxakEj8ALDhmUi2ROdry2hSXugsort9NwoFkUGcmj+OHvFMHfkGqlTWHU?=
X-MS-Exchange-AntiSpam-MessageData-1: 9I/bHhuiZ8nsITHBaj6DNdueZeb0X+yUHpk=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49749db8-60a3-43ea-4069-08def15d9d16
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:49:10.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qedIoEA9OdbtMsVGn0Pz5hOPvJ+Dkj+YQTVzq5LpI3emWPJP/RKziUneskB30W0IG9f4j8Zh+QHB1f/vp1lbdtW4j+u4ysKbD9qQGm1JIo4wLx0YeG+SzJ/QlzAc/eng
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2681

On thread creation, Musl registers the private expedited memory barrier,
see pthread_create [1]. Thus, invoking the barrier command will no
longer be rejected by the kernel with EPERM. The test checking this will
fail. Check if the memory barrier command has been registered and skip
the test in this case.

Link: https://git.musl-libc.org/cgit/musl/tree/src/thread/pthread_create.c#n260 [1]
Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 .../selftests/membarrier/membarrier_test_impl.h        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index 29aac3bc4988..b4dcbb32538d 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -113,6 +113,16 @@ static int test_membarrier_private_expedited_fail(void)
 	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
 	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failure";
 
+	/*
+	 * Some C libraries, like Musl, register the private expedited barrier
+	 * command when creating a thread. Expecting an EPERM on an unregistered
+	 * command will therefore no longer work. Skip the test in this case.
+	 */
+	if (MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED & membarrier_get_registrations()) {
+		ksft_test_result_skip("%s test: Command already registered\n", test_name);
+		return 0;
+	}
+
 	if (sys_membarrier(cmd, flags) != -1) {
 		ksft_exit_fail_msg(
 			"%s test: flags = %d. Should fail, but passed\n",
-- 
2.47.3

