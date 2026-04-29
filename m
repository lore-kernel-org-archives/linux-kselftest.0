Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023137.outbound.protection.outlook.com [40.107.162.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46993D8913
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458554; cv=fail; b=BNEZbztGlgNpx8LuFzEkzUNo5YzpeDyKt/DP7OBac02qaEv6nQJLameRPnt4LPUf7Bhgz+kii7I5MencbT38EkyUBM9ZSHAODPHP3apkD9ZZKF4VVj9O+XJZbojijNaZZgExS+R4FvUlEveAQv3pqwtpF58IkIxlcJ/w6I4PpFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458554; c=relaxed/simple;
	bh=2ZK0exoDpUCvWACH+6YaZBvCeh+4Mpii6AfIc9XSWoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uqjhVQI1P8tSEZkbaVZIDBs9Ps1XYDpISw6Awqmg98u2axhwnh5R81vpN7D2Iczl9EnMfEkQsJ3nYOa9MAg2/k813+u74ekd+2W/xmRo/4MT39apr62FTQ74wEBTJX36ihAGRR3xXSdekkRvjmhfBXfDjtYRcJxNVmpvKRPQmWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=0JnyzCz5; arc=fail smtp.client-ip=40.107.162.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="0JnyzCz5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n007ijE/B4hzl3v0YENgLldQ+dEme3huohuNAtVH87JV8qTr5sVt2/r9QzJmxIQA/kYfL16pClijJSgvc0uzTzhmvdAZ4nYK8plYza2JvraFFqZdiTf2/VT6FR4Vsor2o9OrdnlLkZ6YScgGQv3E1VDDvRkDYABseqNsZ4DQHnQtHpNqX3s+ZK3+M3fO7rYi14QicuIXwM8CbjQi1zXurIl/yuwwyABlHj7jvIBzqQ/UvPY+SqhHwLYJAxGFgwzhgjCQzfgmJeoOBtgpd7NIfzy7PlWucxKPCZf6oB2zCutYj83SCcAtZY49TcWe1bOA+rie6dfzQ90u4eHER6nbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4/v1KTZhVKucyazu2peiUlaXnJU4vXoPg9tvQCBxjo=;
 b=GTKKUw3pNuiYJih9D/aP5//NhFxlgpMXBxvDIifMW9UfAKFMEHF69C0/nIUNiVJlFNN83y7u8BOji/iC1VXYczwUi/JJFgwHgXP2JQ8NQmyv7AWe5wlrAdk3gjy/9wsRhq4lW+XdpPlb+OrCeKizrlvl+D3tRPlBTz18trULt0bcHHP0e4eLpb6dZDKlEEt7eRUNFHvUybdTFmJsc8Bz46t2GLbW+DltFaKO8TJx8TMWYUDzgNqVa0tJiCOCdZrDsr/7nIXI6Vnlv2xCXccUC2tp4fs319nMVoYsucPIhWnMsns2FyFIxg9DiRFuDOkP5ERl3PCN8Ih4SAbQEg7VJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4/v1KTZhVKucyazu2peiUlaXnJU4vXoPg9tvQCBxjo=;
 b=0JnyzCz5yePqgT1HJIxzRCR9pu3cAdUvoUyx8PXddQngFv/TCPwvQigG7eeKpAXs3Eyj+zoteUGdkCqrd7sG59hNvlAT2qYsTeTIpp0plPOKxhlKRRVBvO7JIv5trelQf5KMS+ZiXZ78E2TfY+usyxhoNxnvM1ra9a1WgmMB+IRJZv9MJk7y32mubkOfzUgR0u1valOYEbATOXTI5dqtEGFksJ+UmhC8V1dDTiblvUxBEV8FsXLSYh0bUzHkQofjEgXoouVj/y6WhSetKj2trwoMxw7Yae733G9hElBrbqDMPXhnY3yBPTgrAtM8LupUdt1P0HDfUzF3IfEaQbdNAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:41 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:41 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 11/15] selftests/clone3: remove unused variables in clone3_cap_checkpoint_restore
Date: Wed, 29 Apr 2026 13:28:07 +0300
Message-ID: <20260429102811.47214-12-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b7480bae-c610-4dd8-37ac-08dea5da1517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vj2/apciuThUy6v5B81s3knBNJo9tbIv3+pFgYek1F4PIClJJffWyd1Vk5QuaTGdkPIoMBfzn8Ly5g+KCVkQbn61dW24o51u8IRjC3rglXzqPlx+GvrLtOlCqQsZdAf01K5kh2V40/mdD9Q4XT3NYKbA0GcXEhEJmsKMB4nLGEk1RM7dAeQDEnnkmNuSqrPLWcBRpHfFvmuzytJ29936hOpZfnWlqM6TwWooG8gVCa8X3sj9bmgdS6UqwXb/P9rsTlj80pVnBjaLPJ57eTR8vO0JZ/CXaFE0fomDr+ZbUe6GpTdL0+qWPpZXpBHHNn69X0Ld1V+FlENcqsZEvTyWra+OUJQ2wV9bHBKIaTCC+9GKzDZl6rKCVXo60AT546TwewBmPw1QYNSRt5v7R726hf/RkzG+aK1TD41j/hDdEtJ14a3wYGG+sZXR/5zmgaBh3eHY5JGEkHl1EwX3Nx4GkX53rZZUsu/A8MWibk7C0Spc/NxwKVt7d9eMy9VcjjVexVENsCYlEaDcTOMNSJx+eYiBTT0rRPyaKXssdIMWhn0iMb5ivw2puktthnBIQoXDrm38UALtfdCo6uBGFpHv5oHRcvyUOkHkwDT1ehcb3TzLzOqP8yQ9zpLUmpY06EfZa9yzofAdjrJU4aOjf0HgkOpc7GyUrM35O0Wf2KALQFB7I5Yljm9PNBy7yxUfYqBaRAQLODKeX/8IY7N99iFMlUI2pgT941biwRGZJRmYqoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y35vTDux/TcVALAC249fjYKRBlul0qbuFan9gF0FGilRfNHLFpI5zRtvbqBy?=
 =?us-ascii?Q?wZEhPXkHdV6ZuESeYZOtPdLEsW1Y3Scd0g0xWGamQCnc3L8yZ0PzIpjacoIE?=
 =?us-ascii?Q?dVVTgU48r/Cz+i7hAceuYQP7/Ij5tFKIWgTPVb//3oLNqXKoJSX3oqNopmzR?=
 =?us-ascii?Q?gwcHNBR6Oq/blXv6SG6RVLOY0oXTWaiWwgxkQ3exckXIudvX+spxe4SMWII5?=
 =?us-ascii?Q?faiZ0KzIvYBfXQ+kDCcDXzjkyq8d9Rpmipv8luIdtpFR6ObKMGixuagJm86Q?=
 =?us-ascii?Q?WddRjsuVv1JFh2Ag7dqn4X3YDVia9UtKh749BP8wXOJ4mAS+p3iZ0FzoeB4R?=
 =?us-ascii?Q?+cYdU4bgefkQSIQwZJSMhpuBCM+OYPDMUTApjm0dcUDO7G9EuzV+Vvz/xi6r?=
 =?us-ascii?Q?o70Z6vb5T9ow/RwJHHwXgikGAkMpa9+oAabvxa6RW8g1rcZP+bZgXgpAe7sU?=
 =?us-ascii?Q?qvi3lZhPmIjzBdikuJvfPpYXlbTV7LPRlkeIiwzTz0x+UO+Tvdb0dvwllypj?=
 =?us-ascii?Q?Ytdk558COvQ+lVQNzUdm4E3dirLZVRqvGdH2EIeR6FnJ2kVfpNBQrSO7PV61?=
 =?us-ascii?Q?qigubCo7qI/HxB7T5mszoWajyIShTtbPhI3qvCYN4OTcPQ+yeIDhfyp722Yo?=
 =?us-ascii?Q?wLU4QtnTIDleP0gWurzGhYNHOqD9//MLFwtxS1E2yDAC+R0dbV3CmK3ezMb4?=
 =?us-ascii?Q?YxriGRmnSmV8o1MMagCQ2pN/oA7aasU54SilUpROhZ3rERBPJ6op/TOZYzwg?=
 =?us-ascii?Q?0CxMGXRrbPSq09fDjo+b04FAoHuBJkUnPBdkgvGLdymZVCW11mda0nWY1gIZ?=
 =?us-ascii?Q?qkmQHaN2wiW21k74Jpzzqs8kQvLfqpaI+8wgPz7inVdHAcRBi5vJcpjT/5NR?=
 =?us-ascii?Q?cefQ8z6W/QjW23z3xQKpGkQb1jmiXV53vMW6dB8w9kGeRL3MsWpqONGF0lsc?=
 =?us-ascii?Q?PPHRFwdn/1icKh/T+44BjcY3x1zIhjgoV/culTn7LS6zw8nlXhmjAi33PvTs?=
 =?us-ascii?Q?HsId63iVvIi/hYLk4D+nyxX0f3HpgmEukgQbeiSY2hS3M59gTPziF0m/POQy?=
 =?us-ascii?Q?OWUGmNDWc5SOCWksnu1vvm+Plc1GuSLNQIPJH6Il3A4QUSChCsTODPIcQI2I?=
 =?us-ascii?Q?ebBQHiV9fX3aPhqQR3sopqz7KzYiIao0HHYwX71YBhQqHyrYJdcLZRQoiehO?=
 =?us-ascii?Q?bR2D4TVPssJiQLzjjXDC36Cqnu/HG2dcn0WLHA12a4HrkhXS7b5dNzbIU0QD?=
 =?us-ascii?Q?aEdjW6dKfAnkG4L8XWAQ3q8TZYTi6N9NsqPYHYiitGgnoA3u01whmXaQ9QXB?=
 =?us-ascii?Q?lgyswUng5BJFYv9SuY2xjTqzi3YYNYY/TZxlO+a+KjCKZ1UYa3QA6YBg4/jT?=
 =?us-ascii?Q?5iGScU1cR0IM03IWt6SbaUr/iraq830LTfRU6qtaqNjoIH3xgL0xWIxrSpPa?=
 =?us-ascii?Q?2DLfX/7qcnRhTaWJ1XSc8yqQcn575cgnoR6HGMelQBwKQFq2whKvZPND74uq?=
 =?us-ascii?Q?/YoHxQQv8gB+VJM3qo23qJrHNbnX21uOx2tTV86cfdC4KXuoJjAUoRUMVwGA?=
 =?us-ascii?Q?EgZAkfObLs5GLr+FWa8R2FBx/0LAVpgiLJH02tWui7aLpxPHLqHIXZNnZKDt?=
 =?us-ascii?Q?rsggyCUnrhwiQazeq7xf+UhVn7wYH9vk9EKcpKK+3r+nO82RID+RhQyBfVHk?=
 =?us-ascii?Q?k1VAeTcXF5FKBK8hr17I6Oc+BnCgSaBpEqzze/XLJPFvKI+9Yhrljl2zJ/+V?=
 =?us-ascii?Q?SDM/U0WRs4yBln+3GO34RtI6rRDGgpA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7480bae-c610-4dd8-37ac-08dea5da1517
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:41.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EovieJL9sRnw1XKNlmYbIV+zuiNjLvxB64/0mEQAzEUh06VngPoxw92rvFMbuQG6xuxTFgllqxKIslg95AyE27JvVBuofETPmNKzpGPe5ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  clone3_cap_checkpoint_restore.c: In function 'call_clone3_set_tid':
  clone3_cap_checkpoint_restore.c:57:22: warning: unused variable 'tmp'
  [-Wunused-variable]
     57 |                 char tmp = 0;
        |                      ^~~
  clone3_cap_checkpoint_restore.c:56:21: warning: unused variable 'ret'
  [-Wunused-variable]
     56 |                 int ret;
        |                     ^~~
  clone3_cap_checkpoint_restore.c: In function 'clone3_cap_checkpoint_restore':
  clone3_cap_checkpoint_restore.c:138:13: warning: unused variable 'ret'
  [-Wunused-variable]
    138 |         int ret = 0;
        |             ^~~

Remove unused variables 'ret' and 'tmp' to fix -Wunused-variable
warnings.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 .../testing/selftests/clone3/clone3_cap_checkpoint_restore.c  | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
index e82281efa273..fd4baa0695fa 100644
--- a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
+++ b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
@@ -53,9 +53,6 @@ static int call_clone3_set_tid(struct __test_metadata *_metadata,
 	}
 
 	if (pid == 0) {
-		int ret;
-		char tmp = 0;
-
 		TH_LOG("I am the child, my PID is %d (expected %d)", getpid(), set_tid[0]);
 
 		if (set_tid[0] != getpid())
@@ -135,7 +132,6 @@ TEST(clone3_cap_checkpoint_restore)
 {
 	pid_t pid;
 	int status;
-	int ret = 0;
 	pid_t set_tid[1];
 
 	test_clone3_supported();
-- 
2.54.0

