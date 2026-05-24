Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023097.outbound.protection.outlook.com [52.101.83.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9529DB6E;
	Sun, 24 May 2026 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779649749; cv=fail; b=LLTKRWktaRL8vJ5ohP7K1+H3Gcq4Qr14Clf7ztUlQQ92SyKW5nr03GQvv0mYputTeOTzFAHI4/wDjRXHAPC8ZPoI90wBPuOiyl4WxtIpCGs6En0A2NilDUy69SgQ1xb7bun9I0BwjcbJcd4L+TBKUEZEd9CCqeZ3i6K1V9XglP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779649749; c=relaxed/simple;
	bh=/twYauPAXMSKEpX9p59U1Quy83/Wb1lXafVjgVzDcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNHhCWZaB5sdpk+gTIaPng83/phaZt+601dYMpEWYoCf1Sor98VYF/QLY9yIlGOvWF1a0EjYlPsdUWBj8e1TA4Ay4wB1yOe3WHvQwB5Wws6DhQ4lvgpgGZWYBILSFpkyZMzXOjAi+4fRYkndyUg5GudJtB3WdqRbataov42jOVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=E46wWGOu; arc=fail smtp.client-ip=52.101.83.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="E46wWGOu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OU6HGHDhORyY6JfvynTI7ASaj++4S58z8djjQodAOML0yUIUglkMPk7qxR0QneY//Z7ezsmWlZex07ZATWYw/ZmQp0JXZYBd2gMiV6LZLQIbFHG4cbf8x8ttXQ6DSzQ6KuTslzE9c+X1sg9qJc4/QVn3P9JRBmGVghJiHiUM5qUxUDKFVlSJrSYspSihxSUpbP6vDa9da4t64t6admkiarrTbafyxfvOBPZ0NNrMl2Anipl+yZ/HnAlcZWLOMtgtnl8fUPkeqD2XjVsm6qPK+tMHEFlpTsvqzngUNJiOZljYGC2XGLAehn05xaXZELIXv64cUXLZPakc2+nSEkPU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfCo1wizKD0fxk+cLY1zEqc4Ib+DmObxlZ/DqYws9nM=;
 b=U9NtpLloWwP4rgJwC1hcUEsduKud2O48HWPtXxWYHyc8Jq7LlGiYjFYTYSV3ulgoJf0Z0xMr+XC1xOxK+Qi1jUjIHkg6q/g8rZU7pqsPwsN2SJf5rNkJusmi9s4Oo9l/pi1x4dtxTmnEGyGzjeUp9dt02oUkQmBq3rBS/UDTBjU//YC+T231pVNBa3sur34O9pwZNcPSJ5rVXdVEVBRdHE4pEyHDuvC5wlY9fIdCHF3k3lOX6IjnSp/sAaH4J0i+xeYUZ1UDsBqr9mpcXlOCbXNEOrRKvKHL8YAXQu925OPgtmXqokQS74zBr/ibdbT4gAieLMlmfVhOeyxIzr3GIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfCo1wizKD0fxk+cLY1zEqc4Ib+DmObxlZ/DqYws9nM=;
 b=E46wWGOubqcOApQhK7K0ocVbfyN1iPOzidexlUtukPtooFI4CJEsEwMxuptI4VQgDVOT9F23UhP5Z93WfCs3qG3XEEP4U5wFn64FmyBov+K/cwTBcpzycXeGnbwdzXZjUUPRDigiTRcN/vCXbjGsp2vAgcqko7kU6GM12Ur197A7XzqAjUCXBYxGRcTbEDb2sSpcjClNiYO3ydDlPeEJ/MNXSeZdx/ZADqFPo1Ta1o+yARLixs5WxidOVDRNL9rz0lz48OCrEVTqXXou2ruKmhTwEgyf7pEYadmc8prt7nb+94kADsUSpzdFgIA36ODBPJmE3ZmHYrJjOczJAryeRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DB9PR08MB6506.eurprd08.prod.outlook.com (2603:10a6:10:263::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 19:09:04 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 19:09:04 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 1/2] selftests/mqueue: fix warnings in mq_perf_tests
Date: Sun, 24 May 2026 22:07:12 +0300
Message-ID: <20260524190844.46196-2-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524190844.46196-1-eva.kurchatova@virtuozzo.com>
References: <20260524190844.46196-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DB9PR08MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: b4efe893-74a6-4482-ecc7-08deb9c7ec24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	l5FPxwNmmFm4i4kpFHDSkNxhOQWyeGN6VOw8UpiRu33qzyHk0oZhdZ+GAHBVnhE4LMM4aok89BxF50Be/Zg5yJzEEtjOLcznALfT9pinhwoKzAaKIi2T+kyrTwQu3hqI+Mt1v4uN/rRLQz9XOkBWXTabAVXTCn0w7FC155zLRzGSCxdGPi0r/61JU9das9b2Dg4YkXjBzfcrEMNN8G3X+cKiJu0zA7XtBCzVTJAgGYqpMRrAHcnRStcxShaIqZrJgpTT+n+4sIekOJ/9LvTdcsu+tXbZ2/oXukHjGfQcGLCLtLiEHpK61Pk722Yno7pmjF1N6SnNfW45JUzp55bnuGMLSXRlcBZdqREC6gmgFuu2jogNlqBVfD5q8AQi4Kjgy1fTci3tSo3UTS/jabCTmJ0jE2Y264kPxHkSytdT9bv/LdJ7RCO/ORAVmx9ycQhzZ6oKMmBcHTEouzMPzuriB2HEJmrmxga0ikh60K4YA5IVbpFIhKACyTofXsFD1dFgCqWRMytEOxpjABY9CeykzHqycY+gSj6DjjjiFahDITCPoF8q+E2dLyJstghBrrNdsn9wkFdEFDN0DvTwffhTI6UD/9sbIbrE+Lvdd1TJwdsSkgni3h/8W4jDgbM1OzkaDe+WlNXo4z5d04LcqO0aOpljZBXYQmiiQwnX2fD+HI7mS9tWOk+/YD7v8/TMpfqp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sw7Y/phLXR4se1ET1U3jEkP88xyVZKY4c5H6QG6kQzcTfvRuUpIBgKNxdfYI?=
 =?us-ascii?Q?aA2gm9aXO/IidcaPtoJmI2d+T0UW8htdxuDUTvxQnNOMN04nNQVkZAE5QZlQ?=
 =?us-ascii?Q?7NLLyohYXhpZFEZTdXaJpkqHXRD8NUQylcrR69C8ASbTgvfQkkrX1mAXTDN4?=
 =?us-ascii?Q?gguYZJsyn3P9mUOS1lTGHJwiPcI10x6DcNoFlWRU5foAo0c5HEzvWJxqql2o?=
 =?us-ascii?Q?uc+WjBfOUY2kxq8kSOgjXOsUl+WcxymV5M5mCDk4SDgHgDuIt0MpBBwRTX6O?=
 =?us-ascii?Q?cG1+UScFlvYXkyVcz7drNxdhSKyx/qAc+SGrTPl4Sq8dKCbwDpMyzS68yEIv?=
 =?us-ascii?Q?MswZLreq39k1vW+sB5OivTPG8gxsDhZe8+Je6CXPOTdHrzlnazRhfV9UjsEy?=
 =?us-ascii?Q?phMh6BYVWy5OiydkRSj+lYk29eCWy0YC0SK0eYkwuHPatEsu3DaoauJ5jI9Y?=
 =?us-ascii?Q?JOMeS996QYyFqWbATK/3ch7HYCOYq2IjS21qPwjINr0umREQD0DIWfokkLHm?=
 =?us-ascii?Q?kx5ge/3ae1r4Ar+M5RHUFzgjrQJCMQzjV4vQywS2EdpKR0+MA0KLr+sV+9ns?=
 =?us-ascii?Q?z8sfE6bGO2k2vMj7ni1vd28dYTMX3hD8Ks5NL39l/3M9xAiokQIhS4preesq?=
 =?us-ascii?Q?M/5dCCSZTEo0CIELiDzM+GYGKeaPlunEDZ6hn0MBVr1Z+in54yzG8hmGUeeV?=
 =?us-ascii?Q?oQwjUqvwaJwKOUQyVnkwFDS0j32Xd3agusL1NIcsDJacKAw2kpBxfM635j8t?=
 =?us-ascii?Q?pgUh/uVENrlIptmmYi7xvxU3PnySor0HQBFD3H4lkTiCAgerNXQmfIelEYEi?=
 =?us-ascii?Q?98qgE6LJNpIgfaoHnEYkNOKoaZ3I3V0k9P6ZzyN+Z73mPVARX1QB0gNb+s4H?=
 =?us-ascii?Q?zLDJdl7+QQnbBvJpZ53uoOVdciMID37AGqwSmYue/juMDp6T5nbQwpaOFing?=
 =?us-ascii?Q?2+qY0VLpf3kTI0thRpXjwdMo+ogjXabkOsxmmi8rJ2VktyuEWpX3yoZXvMLl?=
 =?us-ascii?Q?534BZ/DiJ8o2AsTNiEJ+03c3UHUWj9w/JIWkhplkhKQRwywq2WC8gzTfSYvh?=
 =?us-ascii?Q?D9IwqqzxiL+oKmIle9uGP8j3O2YHn477jOwVEUZOFa+Eku7qsmcPrSfsyl9d?=
 =?us-ascii?Q?FTt+ZHb+sDWfXt03/djnxQLqixs597Dr7vv6rVp7r+P2XynpiGW7Oh3v79Qo?=
 =?us-ascii?Q?OsJcc37MVupiNQqT0hR2wVL5yQDbLEsEMlvgDxQGzJoxjdBDO6DvoYoD4lxT?=
 =?us-ascii?Q?zonLNrGL0WDdNEeWU4dAF8SoxVVEWsSI6CMccjbA3teISeQOdJYppn7Zht7n?=
 =?us-ascii?Q?lEPsjU1FNXimPcQlBUJXgOUC6meQJxgHNNRP+9J+ScjyRINRoT+/Mru6Ww+c?=
 =?us-ascii?Q?ieE6u/+5tMU9Lvh6Y/gKxkCAEru4MFE2CM80C/wL2w+UG0VCYy6r6OxMtJKP?=
 =?us-ascii?Q?HRU9FjIVWjEY+kY7w+7uGQgntQ1tYCs9qWMdaBYthvBMqQ+JCuQEoZcijSCW?=
 =?us-ascii?Q?fVHjoniaR2ZRrdUwVUENmceSEy9PuZI/vxk217xDUHQqTk3wtMhLPB7jTEQv?=
 =?us-ascii?Q?UqQwuiGHWL4VFDwODru0TE1tikYAQi5CrtMJY05q7rsPUmFlYUR104dZs+1Q?=
 =?us-ascii?Q?Ggs3h34mL2J/6G9bJFgaQ1HCh4UCbz7p1gO5+NX9h+4I1vH/fv2ImOcAxO3c?=
 =?us-ascii?Q?YNx/cODWSaSv/TRvbmepEAxLeRoVLr3gdi7JzwUGEAYBCbGUgQ4I2+Na/IEK?=
 =?us-ascii?Q?FSHi+uyTKTRjHME+x/FBUANjyjXcqWg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4efe893-74a6-4482-ecc7-08deb9c7ec24
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 19:09:04.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQ1Xr8QClT0JvPwf1cXpMXoUhEZEicow1cH4UjCzfpsN9LobHquygnODwnWV9aCAZ8nz3R4a+ZdhG/aJmeXanLxsBH9TQFlYZ4PBwvIKCzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6506

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

