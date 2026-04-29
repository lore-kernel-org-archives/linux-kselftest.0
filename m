Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023137.outbound.protection.outlook.com [40.107.162.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BC3DA7F8
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458547; cv=fail; b=rrXzGH3R93Bbx5fZl0CP0pPeS95MzO0q1CRleM+3WcgvsgSBzZ65KpjjosA62GwqTQBlkR2QHBe5+An0XTAsKCnaNVPuHLl6bGzEGbM25uwNKDDE4hdwhJdPKqxM5+PV5V8FRz7U1xwG/jPNxtzCdG1rbAH+AtPKYmFUwiW5VoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458547; c=relaxed/simple;
	bh=Ey6+WqZsaW+7bslBWUn+6epnNKxSxl5dUBQFSWap3n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ji90luKiB5TRI/h7WIr8FwHZ0TfF+bSNyQBJKnCztjKmnq9U1jjqZ0esvTrFrpvbl0GVbIMiCT0UhuOPpJS56CjAs/y4sOpmoDVRPPQhCeunhm8Ij0uT0025DyAF31h2fmHHna9uAxVV1QbH+JKUJ52QrugCWAh0XmeFspPlEa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=i0NKqy4t; arc=fail smtp.client-ip=40.107.162.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="i0NKqy4t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNErUJ6XVlLK9i22SOUk1YivsDbpmCQ/wSqDrRKdDa5rIuL4RCEbDItKHoSyD4qsKhNHPsLiSXcwaEJQ/Sc3TtzzWcaXTBTrF0Qz+LARIS9kZHWN8w1BTzwqvWEcnwWX+CktWpR906pAbS9piJ3ClX67LHh/iZwFA4EnkYzqRmWcfbvkybqFZaU8bzuz0NTXFdvG8TvvRCJR/ar7bXtlCM1gzB4sZl7FkUHcNrAA5pPUffad+wlTG392+zeW7kz2JgRsskB5AMfBZ8x18wjrycVvu8fij6y40mLrigyrxNJF0IWZquZWpVTXgncNjkuALgc9mZKRLnYC+6qIEWaefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9GOWPM8YUJyapNZEMu65SelwNEmhCCA8//IbHZf1v8=;
 b=gEzxP6Dm3juKVq59kWtKMKOkQuYWF9Yw34X9PsYHYW6zKGfRN6ZppY/hGFj3TObG1v9uJ4I5BSf1HM96YLTQWZz40Zu7PDmICuHRF+L9VP9bEv4QP2NpHiAKd7mPh/rnI93ArxcvUKljlNvlsQYbpAAKJiLooh7t8JeRd5U0bAsLhL6mJchkuQpYMx/SB2BQrAyTcl0Xqse4cl/NiM74qM9EFbAku2B6sQ1W8bZ5KRig+sBlMQNTL5DiNapA3FWyBOQcz0sZ3Z4h9ibslXeUbFIPcza8s0gF9HKRc2w5WfwreDBMRahPGrmNl6Oyxzj1o0NFtgossPvM+6B5p6U/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9GOWPM8YUJyapNZEMu65SelwNEmhCCA8//IbHZf1v8=;
 b=i0NKqy4thKCI6phUzGm0rT7+m4FGtSKOJDmfLwzmtE8OatcMY38297yCZS8APJr9Av1EpFo9WwQIjabJ1hc0PbQFYk4eQQSwbKbeEnTYBKz88FrBiQrrKqJISSYwAkif7x49uzExV6n3rngfKM3do6Nn3I5OfR8bi1/9zs/LZa9zavsIMgwMnHm5k0XJry/miVcbH2y5HLGasE3M2YV1txhloP6Pdy+pJTiyg5sdtkPrlKJtzuRpB0XQZo7fGMU1pMoh/L/ZuN5dg8Xa+7Vj5/XaCP4ci2IrkG97BMrB6dCd0pK7aXKt4PgXlePwO1jQRmRGyulZhnogmu/OlwcOmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:39 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:39 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 09/15] selftests/membarrier: remove unused variable 'i'
Date: Wed, 29 Apr 2026 13:28:05 +0300
Message-ID: <20260429102811.47214-10-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28171247-2fd4-4661-9418-08dea5da13dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5btw3xC+6N4G/2UQ9RbeLOQgfXdUxbc0z56nCc8TG/AesZp4rWMEcBelPZ7kP9E5Efn4QztnWhN+inmd9Wh/hLvdlBZd0qqiybzWNXAhQNP84P3knKDE+FbouJxh5saq5xbZ6kHBmEUyxT3HiG73a/aYbfPV/v6cWvAv4DLHjcDnCugaMxVf6MmdgXL4YRyf79Vi42geLiD3Fd6KbbkQZ95S+BX5lyJcl+5ecdrd5WO4+WYmyAiTzFKVUJjXXTh8r62gDDjTbbpukTh/9jRFuTkGylyknS8d0CHg01HYuhL6VIhyDQKYuMXhlqIJGPTb4ztkigwRBLCJJclcheYwCNGNzKHRcBT5qwFHU9gbnA56ZmyrgEsLQ7AsuQjUrXE7H9LQTt+3mUxuiLEbZe9xma/zaEsO3TLAvG7EPE//3RS0gsF4vC7UzrZNKQbZTLJ01DiVKGIbi2VgZyR72M05yK0PK1nKnv8tOnPC2nDpLjmDFRivo1CCzOZcEnaV0qBVqfnYD5+6MbfSEzDCLrH2Gdt8If4VXetM3AQB0XHkyerg+rTtASmvCIsIzNnjzxbLj3qO8MKAie4AG7VEPj3YkhdMpTaS/USQfW8h/QyeiQdC163wZEnRcF12aivbnq2t9EiNBjOrTJi0itAaBTN9E6/aRUZPrJi04cVHMKVBOMe1+IoNGnynCdS8EVXlekr/WH0uTDwJYXuLITC24vdbi1sms105ugg1dUAbSfoy/pw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HogFRd/uQx5k6jE1MOIc4uLYZlakmJcn7YpDIGZhtfT1TM2NLNoX7UAd8XkJ?=
 =?us-ascii?Q?znbBBZ4PVQUS57m0L2IPW1wmN25uJ6xLUJlDowGG0eqjokCYLf7QQ09Rq8H9?=
 =?us-ascii?Q?9Czr+yqCSWAnYG/cTIGLspqpGuTJpN1tZmT56rlTgvhLB5gwpHxtEwj+ZZfo?=
 =?us-ascii?Q?nVjpA+Fcl9DprwFFlh+qgy6f8LRYqyPcVO6t3MEUsaA73fUs9K8K13WwE3YD?=
 =?us-ascii?Q?G7mtY1aCbuLcVseeJYsoyAiLjlUGRhoOu+oLExaDl72NDmEwTRb0xOVwb0DX?=
 =?us-ascii?Q?IQoSCoqWeoXrSmRtptHBUOTBJ0rVy4YlVn5ajrinWXSFBzwNyGbfPmZuzN/w?=
 =?us-ascii?Q?NalTK5pjaggEeNKQeAjSuTsN9rPY0WakXGHaLZPsxGdmDCDYuZ0HsWt/he5L?=
 =?us-ascii?Q?kB+YGnqF9ECsUID+bfiVPH5kYbDb0RspMSLKGjcmmjGjr16F36yutXVqXDki?=
 =?us-ascii?Q?sA0BxmXHjATJDznSZAKBDia9hviAZOCIolQ9oZgtHKZz+AQ0kQMyknEi/C5e?=
 =?us-ascii?Q?stnkyrWbiTy0e+38tB0LQRRgJMeILPup66p+ajokUAKYvjOQJvqZY/AnN9Vx?=
 =?us-ascii?Q?bW1yxp4Uiwfr+prNi3XmgUoYyM2muxrHQHyw9Efa03Ni4xqQRbXO4nhi03Ac?=
 =?us-ascii?Q?+EPDfnDkbsEcsQCteQnGOnebdfhXHhqNCAKezHMRB7UXBjDKURHwgFqS7Ytf?=
 =?us-ascii?Q?wuyA+pXFO6zYCaCCEzkW3RF6UCma6t/Uu3Dv7Zk7HcOWcW89sqrnn6Xn8jRz?=
 =?us-ascii?Q?HfxeNFPBdq45KNxPh1MvmXRiji0eVcVPY8M/23t3+nNSKt+Xrd2maa467lKp?=
 =?us-ascii?Q?wNT+aABZXhQ39dj94z7W7lhPyTle2QYzBlWr6RXPpXPWTGZiFi1/dsLBO8cW?=
 =?us-ascii?Q?CYjdCo3QbZUWX/+1FRsPbY2s8iLlbTCbm2OLPDVdmGKT1wDvzF6EiSx5F0ad?=
 =?us-ascii?Q?6zG9Cslk9KGzGnZZiv+J5gYMFlt7yStCrAiYX3iCa/ve6jWqMFQGH/Y5VKBH?=
 =?us-ascii?Q?d6JbUIHHdJfFdCNV4FPgkWUceRvdWMRrfwtjZ9h6HL7DSDijSPQDBTop+5qP?=
 =?us-ascii?Q?nzXbogMNOUy0sj7lNluSkmWKXEQz3rYe97f8XNUMossYFirAm0CgrGuxPxjA?=
 =?us-ascii?Q?OVKZOx9Jd2TXFtn9M/W20bePTTTnjIAk/XTu0VwVdsAkCuFVL54TqAYj/E+K?=
 =?us-ascii?Q?rZgKr4g9q/4sfxWI7ykPr9oFubYfl4NS47Ywh6iqkYpRDwI09HJppYCkqB71?=
 =?us-ascii?Q?c5D8dRKPVJccQLLFspqAv7TFc0bWX3VbjZz+4w6eJD6agkUEobBbhxv4Z7LO?=
 =?us-ascii?Q?+Zkw4fKIlEbv0Nq+rBISCXWEV6T6cDnaHvamWH6ydA2UkuGeoePMYQtxQqDP?=
 =?us-ascii?Q?Th9IJtbMF14BAYpSDmAWnpEe7jD+1rSM2EzWG9bIURiAqnyh8OQ5PZRpq3x7?=
 =?us-ascii?Q?rddY2pIyLTtTMAEA1XBvwkDet9FVLZPgHYw79kNtQl4Kgc2jJLHWo6daZ4vj?=
 =?us-ascii?Q?NxtEmjIwL7wNqTbZviEsXagMBwc45RdLZeWNfBw7agOHlQdhDFH8hAvQpSxt?=
 =?us-ascii?Q?0STMeYpLSiyZSB2rG9cTKVOzYzVYRoHk4EkhuBq8njblMnPT7APJjTVDxVZH?=
 =?us-ascii?Q?+Vll9t/wTDBUQCn7DAeIMZqOuXh+kI3rxBSbC6Goaj4EtbsFzsUlqJuyZcGe?=
 =?us-ascii?Q?I3ALZjkcPwyREDMmutuvVjbw0Y/zxwEmHBeKvle2prEm/ClB8iJf2mzDHdJ+?=
 =?us-ascii?Q?Fn5i+QGCG9LChoWu1F7VX2w3HBRUdH8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28171247-2fd4-4661-9418-08dea5da13dd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:39.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gc+3z7wIN/3g8kqu6S1Kky1QfRvx6CN8MOYeNVp8vAfqcuyAoznxvnCjPmODRFpy8+uD3gRqZhAGTH/bM4aVg1CABHkJmmO+ECBvXGpsfmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  membarrier_test_multi_thread.c: In function 'test_mt_membarrier':
  membarrier_test_multi_thread.c:36:13: warning: unused variable 'i'
  [-Wunused-variable]
     36 |         int i;
        |             ^

Remove unused 'i' to fix -Wunused-variable warning.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 .../testing/selftests/membarrier/membarrier_test_multi_thread.c  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c b/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
index 4e14dba81234..3dbaf1541058 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
@@ -33,7 +33,6 @@ void *test_membarrier_thread(void *arg)
 
 static int test_mt_membarrier(void)
 {
-	int i;
 	pthread_t test_thread;
 
 	pthread_create(&test_thread, NULL,
-- 
2.54.0

