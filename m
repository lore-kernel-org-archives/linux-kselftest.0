Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D283DA7F8
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458533; cv=fail; b=PGu6SnW5u69jp4bhgeWSV1+COgruy+AuImoV2a7cY6eyRQOTnffJHO23EYwXbY0Z/HskhLzSBbPAo8s7mcFE27yvfZP+A/ODUCmT7vNtB9JN+wKcN7Tib4ja2wU3m5wrFGIZ/WOqMvoEezdJXefGLqB5uuyL/p+U2bvtqoNm/P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458533; c=relaxed/simple;
	bh=/twYauPAXMSKEpX9p59U1Quy83/Wb1lXafVjgVzDcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NqrjGAeiiGQy+nuY9Pk3NNolfd7YGwIxe0pSWldplKHxge7Bx4I/gN520Nq3I80CFtWzF3aCl/BuzSkts++WrXNJs7zVH9mX3IoPkAIv6e4PvAtGxlNgVA4DrLNDgtexNIk3Iim7XSEhnS0cpldc7ydL/QBAYrod0Aa1soj1Iz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=AZd+pDNF; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="AZd+pDNF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyr9s9a4P3nFBEXgHj6QaHVftCwTLECsA2kAApmUGmPZDnuNbbeHblXGuLyxB7LEpfxlPk3n7f8gFs2064qarFTkByh63lZ8TMmnmcPvVmdl6CxNQnTCd36ZTG4qsY8lqQUQBOxyL5OtPZMyUnkWcmlI3bFhKCpK8QUsu4x8PJod3YMFXpCIFV5QzwM3LJPxNmowBhBQI1ar8TPZ6z8DehHajUvT2Zix85V7MsURWS99nb8ImWEJhImFFc2PcemTbJSete4d752qUyV+fJNITdxvw13u2SLUHy5UP8OJgQG+/3XSe776tMfaDZVEY5djyQD8SuJdF42OM6EZgpMmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfCo1wizKD0fxk+cLY1zEqc4Ib+DmObxlZ/DqYws9nM=;
 b=UvAS5ojVP5E12nAN315SDs3aEDJUkHAyDvwWskI8LuP2OUPxQ+z4XdK30kaoMytkDoiLKZOFBWuIc216OWzwSAAfRwRwQc4T8R627NWv3ROXHKbhdFHMsg0mU1JMXhIERrChsdo1u4p50VV9ccHZ68kBwe+5zZf6f9Jn8e97IhBUNLG+wcidHLl+/H3bxeyJdRHRxKeAW3oaG3Nf3B+BLzmjlfzFNpniungwg0OoKr9wZacjaLsI9/GkReepJ0AltMtCsqDVYLBR87uhlKv467zda2lG4JpsIUjjeCv6u6fdYbrZ+b5weOuUjLCHGmvErPcWFiGZD4VKtjUleU1sMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfCo1wizKD0fxk+cLY1zEqc4Ib+DmObxlZ/DqYws9nM=;
 b=AZd+pDNFLbW6kfgqgMmSIFeApPeYfRnGlZrirAXycBOCduZkg3K1iOFGLKtdIvHCNTiV7lrWwPakqA06WLOuMZBgjCBz6pZ6bXiL4AK1jt1bZhF1R4jU/R00C4uzB6EyOM9ro/B1OCztAKmBCJ2H0xrCrpwWooMXR0B/Hz7JQBOYPCzFsSsH06I/A3B+IsrT4Hktg1YFtX42wne9iT11eqBqFs0YLeMjd9f8hvZt0NCGid/n5AY4PQ2moRRC+KSMVKZAhGXLY5qmxxpi1IyCQ0HQvfrERQf9EN1UJeV1Uo/5ANfeAal7L+KGwzfu0BhHM2fCxTdC+Pn2ROGZs9cH5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:34 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:34 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 05/15] selftests/mqueue: fix warnings in mq_perf_tests
Date: Wed, 29 Apr 2026 13:28:01 +0300
Message-ID: <20260429102811.47214-6-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1cfd3dbb-9e83-4e96-74fd-08dea5da10fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KHLWUbJ3uZeS5cDy8Ox618laz1qTSQHytRbBaqZc4+mKvExfzWkqMg/WS8XdZ1EqmHKofMMGkrauth4Rx5fKvVQtjsRGFtntaQrEv/eTHQRXi9/JpnZmlkvc+R811KKVjWKfijbi6yydTB/fkaHr8Mo14uKGLUyoak29PC/HTy/mOCW2Hy8N+Z8ebFfL56eoUbHJeh5qBf5ksRdXZ8Hh813HvioSq2yXy9b9KTm4oPKVl4MZtzAXa8qkDmILWtzRa7/gO3JOVknrD2KsGNQIKFL/tNSLRKcwNkB9HNSrUhlf7udZcWm7MPtC/SkgYLXWrjBd/sENUD+1sxISDAatrCi/D2ij1+iPMttGm35km1tVLqoAcdxeucKy+Ep/LE7Iub7eTWHpgrC+Vy5NYUYPmyqALArFnr+w3lvA2XWptwZXr7FNZOO/+6Hu8RU+rBNtAThVhsmDpCC/HAhKPAhLolQ34hCaBtyYT0O+n/dFqRAXK17T/T2QD+LcQwkjV+Do1gEXb51PnR9eMJH/RDM8ycWe4AFzCvgjwkK+Cw9gkEzGYDKenZKmMUPWgtBaMDM7yprG3uGIwheulHv3JbxlKivsZJcOIZhLqjxC935RnP6JtpxjYQ/lhk+rSAauWjlClJwXg1FNUPd1/WvBAwfFgvyzY3RNvpNeDe5ab9QRerj5CdTVsQEM0+k/oegVbJpnx5HLkMtnX5bO+SJryJmjJ/6h7GyjaRo8ULOEdQfktog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5XG3xFdFlid5ZocjBlHCVQEJDPA9zBc6HEELTGIr+LzmNa63SeTOzeVpamGU?=
 =?us-ascii?Q?/RpO59ptLh4pRc6MAhSLbQeX9Zxr9lZ7LcTdDvmMhyhAfsP/OJGctc5q1GAw?=
 =?us-ascii?Q?sH5G0KwthodElVGTZ0DmLv/NAmRVoF/14c4Fw+iVxKKzcLkFhhESGaNDANAw?=
 =?us-ascii?Q?81yNnIROXvJ0R7gCsdcUhUJXZ4ZLvrPl8+qDWCkQJ7XZDKM5uCfzj8/Js5oo?=
 =?us-ascii?Q?QbK0RZaQnCy5nzoIbvq8TDjf1IYDss67jdZ384a6E7fUG7WGjvoH7fF716L/?=
 =?us-ascii?Q?ZlpbfVvBHtjWZwxEQfXElw+/h+1uAENIXpGMEHDTGeMhx5cndtuLl36zLouU?=
 =?us-ascii?Q?LYL+17CyOHmETZx4IQjAf+uoPcxcFH7eWzumzAE5nWl/UZJ9FDaZWqdIuUFz?=
 =?us-ascii?Q?DU08a8wfla8CcHx655OVnxokugfFmK5XABuTHiit2b0VmRb2aJlWPhgDky4K?=
 =?us-ascii?Q?sW9+dgSe94h2xAFEzxjXc7sS5NXNWQvFrunNm6mUr0Sw73e81zo1d+BR3OuU?=
 =?us-ascii?Q?pBVq2Xc4yQfXQ87vG7S/r5dRq3Hi9+IsVj53lLVn2WkI0oBVjQKT7y2ZTgtt?=
 =?us-ascii?Q?kd/D1RNQDjZRd00HhxiAXnBeAgafBlK8T3z591Jf3E0Nlyo3kSNaG8YH63Nn?=
 =?us-ascii?Q?KZj70TzJ29STjIJHVE94X0mwsnut52s2k3o7cmO/GrkLMW48WUyMpFt4uhl9?=
 =?us-ascii?Q?cLzXwUphzpZs6DXRTRpvEhTBbuFVjgPxSr1o5UaYueps/TR452E1Ze0UTP1f?=
 =?us-ascii?Q?MUsEAZ1b6I0pi5wo0OHtiSdVC0UfoD0aQiiainRfllAks7SzMFOXNT5oT18z?=
 =?us-ascii?Q?E787uFB3Xjg/oOOvYpflWIhvrY2JPYwzyN0GnGGuvVCqO2vXNCT7/Hle8fXp?=
 =?us-ascii?Q?3jb1LFaB+THSCcWdyVJzUNR7qJX1FHCnHch4Cs/TyW2YMIFb7FdMRwuXH4jJ?=
 =?us-ascii?Q?+F6owjKRmh6aweq9TkljwMRjkUKFF6d26scXMSjjOMXMi9MlaRy30dUKO427?=
 =?us-ascii?Q?983DIroeMtFQlelE3LSjY33kYWxksFZfcUNFuSAQBUuPAIXbb6mLQTLI5Fzz?=
 =?us-ascii?Q?Okpt+HFIcONt1W3u74a6Qh4qxldSgjGZFFSA/mGFO7CeHHufQ3MLIbV/4Ygw?=
 =?us-ascii?Q?uRpwif1alLuvVyLDEvKhYeJytdddoPnXgajWf1XvXQw6fxSjfjgCbe0k8GbR?=
 =?us-ascii?Q?CFHCCnV2LTVEExoL3ZL+pZ1BNJ1fLBcMszUdIOGGbfMO8d+lfTYrNrqwtcpS?=
 =?us-ascii?Q?KYYSZkZZvQnrJ1r+a8dAJj0DgCarrFbypVjci5Zduhk60zJxVC3IYWlkHIzo?=
 =?us-ascii?Q?sp92aEBxe4ira+LjmWiYwvMtSsUfjf0kZbHczyvcLXEZso0CBku5QobzicGD?=
 =?us-ascii?Q?fYrQEQhJklAatLaVYcU/P2z8kdpeCDcDpW60318if+kUiN6bxHgjRmvW7xvy?=
 =?us-ascii?Q?h78voXR40uPL10kr+cfTrK+0sJeQAqBhLexY6rhHZw2vlNJ/8HG2UXeNQDWJ?=
 =?us-ascii?Q?inpMBCTqYhJPZJCOhtyL6Qtl3zMgchraGG5UUGE+lmo3SIGBMzCvVkOOHqXm?=
 =?us-ascii?Q?hcfcwot899DEGhy0VayQDRQU9qZfaDiUmzuuqAyvS77ZKmnQ/+YkMzlUIJAC?=
 =?us-ascii?Q?Rr2GybBAh3Qn/kuCuhoXft7W2J5Oq0G/JERD9XdhSfBaqlc1ltjFlfnVwVKk?=
 =?us-ascii?Q?Nbg2GEP93BayKqEcaYkNWmgXG+8+PjxmHpMn7UHWqDRwrO+TtC/hCwWvfwHH?=
 =?us-ascii?Q?CNG1lcgZm5cho1qFjfIHAhaEGQLdCx0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfd3dbb-9e83-4e96-74fd-08dea5da10fa
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:34.1210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnt5pOtpFJ1yYjbYqEls8NTjJP8mp3RgwEmwvCI5pCIiqQp+kLeE6cV4Dp5ajUfjyIw2LiE/qDz8zfXLsH8BObY6dKJQEWK3a1DFZnRX18o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  mq_perf_tests.c: In function 'perf_test_thread':
  mq_perf_tests.c:433:20: warning: variable 't' set but not used
  [-Wunused-but-set-variable]
    433 |         pthread_t *t;
        |                    ^
  mq_perf_tests.c: At top level:
  mq_perf_tests.c:45:14: warning: 'usage' defined but not used
  [-Wunused-variable]
     45 | static char *usage =
        |              ^~~~~

- Mark 'usage' with __attribute__((unused)) to fix -Wunused-variable.
- Remove unused variable 't' to fix -Wunused-but-set-variable.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/mqueue/mq_perf_tests.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
index 303c46eebd94..a13378464551 100644
--- a/tools/testing/selftests/mqueue/mq_perf_tests.c
+++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
@@ -42,7 +42,7 @@
 
 #include "kselftest.h"
 
-static char *usage =
+static char __attribute__((unused)) *usage =
 "Usage:\n"
 "  %s [-c #[,#..] -f] path\n"
 "\n"
@@ -430,12 +430,10 @@ void *perf_test_thread(void *arg)
 	unsigned int prio_in;
 	int i;
 	clockid_t clock;
-	pthread_t *t;
 	struct timespec res, start, middle, end, send_total, recv_total;
 	unsigned long long nsec;
 	struct test *cur_test;
 
-	t = &cpu_threads[0];
 	printf("\n\tStarted mqueue performance test thread on CPU %d\n",
 	       cpus_to_pin[0]);
 	mq_prio_max = sysconf(_SC_MQ_PRIO_MAX);
-- 
2.54.0

