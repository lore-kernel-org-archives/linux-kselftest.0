Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023137.outbound.protection.outlook.com [40.107.162.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6083DEAF9
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458540; cv=fail; b=AnAusRLILesKUD53ly0+OJWtUZ23MtXbICdRSPqSA0+B1OC2ERBgHIhcBNi0ogVy6wxEwu3w8r+2aMNukNoC6ZvoMg5ekwSCeQDrBuFznLXH7ORFNbRHldWb6QcZwRCk4rNs1xRhYvab5TBZ/6oaHm60snvJuKu8+UgWu+LkCL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458540; c=relaxed/simple;
	bh=JKx2idQPPOCzHwQpXe3A/+/fLSr/YTG4dFQFcYj6OrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tm0D6caNWzIKNnQ131VIeVa51Z+Tx2crgk3jKQW1YKXIwLkp1U3GfbKk3xWko9cbmvlRyMRuw3P/ZdG59mElTAoWDyGdbM5W6saHoE7xMtW/MciPby41KPHylkec9+w9eY6WKm34DD//WNJO+YTgWPfEGGGYNhG3VO7rVt09Vxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=KSr1VGTj; arc=fail smtp.client-ip=40.107.162.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="KSr1VGTj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuNrCdqKF24dHI+ImmkeeimuRRfEwBkbeSx0nBkQEwEQ7d3LZqy2fo8fnu4R63DBf0NawnPA7Qk53omwE/sDrtCLl8UwIKtfQ9knGsK393tM6eS9Od6fAKxPf/gPcJhY85RgpGVtFq/OVzuVX/oBwP8Lsk+fvCWqGxQNeLuYkkzSH/jRLEoi2tWyYLkVyhjDkqfouDCnZNqs30xkSTmbWafqe10DTeSEBdwNDVuXHItbbU1nJcE9n7+bUpMLr0TKbSdY39/jtQM1Mv3Yn04tyXNjr8XKcZLYbwAxIcFTk4M06+BeBDe+BVWc4SYauQ1MWdcK5auuAaeBrUJtdynuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwHt1f9Oj4DjNRG+tNhvwRVUMhE6VWQds7Fm0DD2s8s=;
 b=TQOVYN95BoDNZitmRvvAh2+jnp03dR1Bpp+SJatcp48KF5/RyAtcTLjAe2eokDol9H87IKsoOziAfI7LZhOqxezf2jkHRdVxNF4axSuTbfINI3rJfzMuvkL2Pv1hYan3UlBL79OKed/lXUwEFPT0g6nLMUkO2CLi1qQvuCruv/eqP/rgZs2V8o/qB0OCtQ9gpNNVbkWIHr2pudn7fUHq1ORStb7wTvCZwawce60kTYMl+O4YHN7gYQYPUjLXX97Wx0tun6bnKA5ibZLUW0kBUITaPmJxxfCQCwpL1WVBm4X8ZuNuEI70pBZKQtZeOrcX5ElYUz7GcdFGo+wfePJOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwHt1f9Oj4DjNRG+tNhvwRVUMhE6VWQds7Fm0DD2s8s=;
 b=KSr1VGTjbYuVKavyzcIbe41wS6ndQNXMnnKfsUCz2ZBrXKFN+NJFSkAmznJdThMcVbxurnZhOzvzp5OfZhPAj9c38G9rnTDDUrWNfzfl3laHM2eAx+sf3whHoZ/JGDcpagAHrevDOnKdT3Qn+W1VcSjVyrwv7fnQvDbGwx2mng4u/ZzRnJUyjkYRVXq1Y3EWzdQtQ52jZFZVfRIr2US5xuWvzbU4pUYks1wEiulRzgDNn3qagin1rkEZET1mMop0OkF1CsjCuRdtXjjBGTzzr3SFgWQAmIbyb94PzjMGpIBCgC3w3KlQgXJRNsF65ZAmWCWSScWbUMKX5hG2Lwae/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:38 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:38 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 08/15] selftests/memfd: remove unused variable 'sig' in fuse_test
Date: Wed, 29 Apr 2026 13:28:04 +0300
Message-ID: <20260429102811.47214-9-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DU4PR08MB11078:EE_
X-MS-Office365-Filtering-Correlation-Id: 161d3326-e906-466b-3619-08dea5da12ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lfgPMgM+slpFWpKxQwVyIKwCgs1jqTN13K2xQGpH8fiu3+qpGs1j9EOfX46EZxyfK9kntYFdLhMtZark2CT/UuR5t3xdlW38G277/uizC0rdaFJyysTZ9v5KjyibLPkKF3CvElVqRWSVOLklSEKlQ+0U5gvk4GnNB1FQYLwEN4xMwqcnSm0M2p5kNG4vUDE3Rtkk3Im8bGdtb0Aad2EZi4kd6Uy4oGbnn8xrNn9WUkSF/fzDJ1sZyNVNwpNma6WRdGfd90Vx5rSs8/FmfrK2WNx3vUUMD0DcovwAk05rx4jZ5nAQC1pAdNzw08HZgl4GUrmX82gt3c60QjVcMIlu9T1nww8a0s33JsZQTXw2YCJIlb2L9Mo/JJakKy4tcZv3sTxZWEE3XrrHzbMl5Ob5ehpLiYf4NlqUeMPyjuu22pH+MQ8GVq9S9zQ+CPePjK2TO4ZujD9+45sD4C0D0vyrovlKhqtIzFLHeYij9VqKPCJ3eBg9GpK8SiFzVPTAfBvhPTjFvh974lbZxmcSZVO/0eKFqZfouzuVr0/4EHN90i6MXba3+5yF7lkbYVfjEiGERRC1dKlfRN/niTf2Q1Y42ttAt8x8G1AafCZ/hX06hVnxs8ExnhRvODmbFgKIwIyWK5bYggf4it9iBEJZ9LsP+mTkgKkAAly6oI9ekCpnJ5E+17i/LGayYoUeKMfpgAczwr1JKN41HR0ZebBi1vDdzdedUa23aRKUFJc+dVtIPOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6J5lNO4bB/K8vjOHEk7Xhl1zT5zu/ElmRTMZBA2JIbLwjsbcCvlWdTi87wWu?=
 =?us-ascii?Q?x1CbOrfG2BONMiYcx9kRpnp7V5tDnii992Hs/tfc3mRk7xb3uVi5tqUKmYKw?=
 =?us-ascii?Q?5Q4k9A9MAfardtILqc/p+pF53sEAAYabnqS4/T3O96PA5wesLEiuGzW+yDOq?=
 =?us-ascii?Q?ENeE05ybDL2vlUisPRYxSrYFSns+Ia0mvywf34e/9JQ+hD+5e3+qrS5FYP/O?=
 =?us-ascii?Q?pnoX0JdX/DcldfMCUc3oC7QZg+rHz5PMTJOgnz68D7ZDa3e/D/k5tBzzOeky?=
 =?us-ascii?Q?+M+WK2YMhVW7fGYFg2iFPWa9+FgdYgSlGR6BF7PjvZZ50RkOokApLkr6vRbU?=
 =?us-ascii?Q?OV0DdKqEs56LwmehGV3d4S1XryiNd+03i2pu+OfsqF9esA3TeR5k6I2cf/lZ?=
 =?us-ascii?Q?+02z/W7jbQA/PNb8qYJeV06KdAhRzPUAxG5XAs2d53xLVzB9jAneVlFGlgXX?=
 =?us-ascii?Q?kPl9f03lBGLxCgnB4sO9v6IoKN5e+L9dg1rl+XhJOGWJoRD5Ikqf3WxRo5qU?=
 =?us-ascii?Q?enWpjulIpI25mBE+A0Iu3DkIdy50aPEDkGMVPCI2g/EWI8jGCKvdKD04e1d9?=
 =?us-ascii?Q?fkj1J3DRtpNBCJlDHex23SjeWe135xKTeQRDTufquKuMSO/eb5vIrg7iGXTj?=
 =?us-ascii?Q?izMlHwSkhDnoyOZ7cDEaqPc++EOqyCh/giRQH/V59gf+SELcRiP5c3HXWzBk?=
 =?us-ascii?Q?NyKaITAjOlUF2tqjew1frnOdsCuEeWu6bIAUvHaFplGA9p/IVSPVQ106YQNn?=
 =?us-ascii?Q?aRmuMBve8TZj6JD2JQ/zpBYpEjPzp6MvCrYs1w/sKJRu8xYpqSMRpFcqGQbW?=
 =?us-ascii?Q?xbXAKjAAoFiSKqH+ol9g8DrsRTOnKeyic2SRCyJuU6WsF6ebnDYYvMTXHOgt?=
 =?us-ascii?Q?VLdI0Jv/FCwTOoCSHwetYw6ab/Gvy13lmhU99OyyGrpfZUMpVz/axLxe84Jl?=
 =?us-ascii?Q?P9VUKd4eoBWcVQzVaMwzC4wkRPjWmKWlJRN5QxNsXvBV1DUEcz2jwquwSuBc?=
 =?us-ascii?Q?lUITbwxR7z00ODCKKn2Zlik4pd1wfcNDmLrg3rbrh8bs3Nn3TPpyU+V8RStr?=
 =?us-ascii?Q?qlIeKALTy6+dW0JG/0qoWgbNT4/W68qYhfvVUbLln0D0pB8SmdyvN4D9d5tk?=
 =?us-ascii?Q?8zrcawogaIHk/r7Mx0W1KtSYhpojLYAEmQidV/Otj3hDRZhZtZfcCtVkC8XD?=
 =?us-ascii?Q?L9YMZ3JaSPT0tPBNWbEawgh7Kbu6mHTj9w8K81nkflBGBfnCJoG7Gw1wcbq0?=
 =?us-ascii?Q?3fxucIlC9COozVFMNxmpHqU8au3AMaBqR/uX73W36bM1Y1dzPz3h0V8z7rc/?=
 =?us-ascii?Q?2/gCRb3mEj6nGgC2wF17XREJZxK/CQKzI7sLkgFlCelR3tBxI26Vkpcisjuo?=
 =?us-ascii?Q?LT+i9q+qTxObrlVirVYpYeam4EPlfihZHwh8LV8O6pkHvFKu4HXzK2Nxh4lf?=
 =?us-ascii?Q?0ry/lJ3zLAaz9uRbA4j0xiqlKDWjGzpQGBj00VRBe86IQfGVdymOLJUKjmie?=
 =?us-ascii?Q?fvvLtOn4BciO6W043/nRACleLslHxSXBQ5eNWeTcNs05YKU5L4DjIcLzm2rR?=
 =?us-ascii?Q?DzGquwbbPUZ+NH9kroWFyzr+3b7BOvA6aZnhJHmKy+aZ4uQTirNxKv0URmLh?=
 =?us-ascii?Q?fzjxyY0++Fg/5kR/yKLFDSB4Vkg0hNvGN/XDD16+rRhUpNoGyKIP+a5R1MrX?=
 =?us-ascii?Q?yDnNNdEhF0LUjyyb2HS7jdYWxFEC64bcaZ5Ywm1gTNFetM/hDFxVPcoxGarK?=
 =?us-ascii?Q?rQ9Sm2YfBMEGFFxF5PbFAgg5P3P5lb0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161d3326-e906-466b-3619-08dea5da12ae
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:37.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +isX364Dl1/ghlOnUrhDKzs5DB2epdEhm7xCMap9bvYQ9tHM1vpkfQNn9cGK1HCJpejB/7aIOuvINT07z+GDQzPzN+f5nqly/wUvROC/DL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  fuse_test.c: In function 'sealing_thread_fn':
  fuse_test.c:165:13: warning: unused variable 'sig' [-Wunused-variable]
    165 |         int sig, r;
        |             ^~~

Remove unused 'sig' to fix -Wunused-variable warning.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/memfd/fuse_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memfd/fuse_test.c b/tools/testing/selftests/memfd/fuse_test.c
index dbc171a3806d..510056c1b0d0 100644
--- a/tools/testing/selftests/memfd/fuse_test.c
+++ b/tools/testing/selftests/memfd/fuse_test.c
@@ -162,7 +162,7 @@ static void *global_p = NULL;
 
 static int sealing_thread_fn(void *arg)
 {
-	int sig, r;
+	int r;
 
 	/*
 	 * This thread first waits 200ms so any pending operation in the parent
-- 
2.54.0

