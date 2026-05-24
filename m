Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413C399CEE;
	Sun, 24 May 2026 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640763; cv=fail; b=So3y018l8HzxXf3DXp8VSrSwkFGey8aIoplZKQNziuLlcBkko3E4rkFnlxZVKW5ScEXu1THBqw4xS9Sc9bzXvdtQOdiGpMmSbt3ThiQwFLRlqERAVfhsHOTICLtn7HkPZAtYydg3mKG9UVeK+0awFCgxeirmWppXruPSZ90laSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640763; c=relaxed/simple;
	bh=S18uHzTtD0F1BlVTslKDOFO2Uzx+B3qqUppXlUmqb8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r70D+DUx1PJpFP6WTHYpHuCv4RtyY+p2pLZPYi75mAKaHsADSirFWIOm24OFqGSOu59vtyYHS9H/nyr8aum7NXFWhSjO5VV0HJQinZkShQYlHRj5nw4dct19YmMxOzDkyFFMUy9DkA44byIumOS52lm6d0lLW2O11dpZsnZbpM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=fW9zCSDX; arc=fail smtp.client-ip=52.101.72.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="fW9zCSDX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1WJDE8cCbKTsjbuqJbs00hfe0SkJN4KWsoN5sLeTU+1Q7+YZVZl6BQblwly9DxCZc8MjKA19fBZHBlSE8Mgaj4iks84dDj0meBgkdcHnpgpnW1zcLgT7adx6G9ypJnN35/wFflNuRNimEoCLpp0aBxuqI2T6mEEnE+cgeGOaBmt1NSS7C+FvrWNQAQfpxDYXKX7SgwIvojFYW9cLWUklfbr2TmjmIS6vA5W6BPZTx08uXLp8CfTxNwIF7DQdwEqD8CFc08Zlv7WuCIj/aG7532p7ZeDLG59zit8VQjyCAunorE/nr/s7FTbkg8/7TH0O/lfJ8J3jnYzoPHFTVOZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ+y0I/+MWDKgNvPEEgb5r6M5r1SiSYPQYzEH5c9wwE=;
 b=eC6ZtWsGkinJwJWOXNdZkUQJSXF6LpKkjx6R/2MtTTm833zyPh0YrzrvVEIgdGdwjvZ1WGRGqkeCllqccexKT1EYSc+B7V+QttF2mR9JG1tmR2uUT15AlVnvn/WBE/vKawyWkkTmOXTzJf142dVzpxRf6U+KaHs0GlqhpsfNk8E/U85dh8rEHLFlItaJphdwZ3zwa82TAVMcvhOUuwmYoYMpWrPfZTmWDN8CcEeIFpWs76yVTVKdtzEmKZpmrQG5HV++4S4zruzlqUWb56A6dXgf+Mhf6x5IC8pYYPlOZns3gPGbtlygMGKtDwZ+M7hZnVZl/tjYxw0SVqcJdw8tWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ+y0I/+MWDKgNvPEEgb5r6M5r1SiSYPQYzEH5c9wwE=;
 b=fW9zCSDXeDY+X24BEvVgvUKnp6+eH2Y5ETSjhaxvHVlL17L9gbQMpumU+z9UOnVu5axKj7e8SSGDe5Q90clqasFw2GH9+ZMc6aDlE7736Zd/6wYwobboZPLs+WnK+kqS9rpvoG78pChKOW6WNgtFZ3iKEIgpYKvpMOr2NzqdffZLi8m0o4dd44T3CozDLe21++abxgedMPx7vgM5zn3R9KIA/jg8eahzLfK4loDFGzTyMRbKTGqJgESZFpzt635pY+mA69wF3vCM4rJocEWN2gJo97Wu9+OiZitBVPTwaHiHEdF1Tp49xHZNgMm7iy4LpzARgp30x2nyAIzn9F/sBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by VI0PR08MB10944.eurprd08.prod.outlook.com (2603:10a6:800:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 16:39:16 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 16:39:16 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	areber@redhat.com,
	keescook@chromium.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 2/2] selftests/clone3: remove unused variables
Date: Sun, 24 May 2026 19:35:50 +0300
Message-ID: <20260524163840.34247-3-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
References: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|VI0PR08MB10944:EE_
X-MS-Office365-Filtering-Correlation-Id: f49cc28e-75c2-4a17-4062-08deb9b2feea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xZAc12wXZ8vwI27MqyxiZLyTn1kj7JBu7xx1iCRdIDmX2MLAdNC+CPRObt7RRpUQtENIa/OOtVjiAWrFwh0Y1lr5ZW/C8n6wWZUdzBfZgUNwDTH6mr/bb6HQml4yMRptYcc/cY32OFaXqeNWu63C/J3x9ss0G3gp11gUoeFDAUuJiiay4IfFRjgTqtucJWNEPAR1aIEYqr/QHSySlKP4Re3Vk5YpGe6/RI6AOu6FATHa4gh/TZvjkqjkpQ4ooygZddE2DrFSR1sZo7+wfQoEswl/UbiN+wSahpNWYFTDJ2MHTjPt2L5A6Pi+4JD7HEqCke3/jtccNyWQcbr/54xqHefda5kXqR71tyGM2v+hccaEI0AenDNIxfGR4hAKDiJiwPUhFyqs8qa3PY+G5YAMGETve6JygNCEQiFxUX00ZYkEKC1Pb/vdYxeWb4rjXIGR5xmiD7BiMe6J1zNzWScmYptsrJoqwz8dcfpaOi2nKDB+4EjqHPL7Lkm+3p90n47RhYPYp+HPqdckQ6MrdMP3bvnHWo7nlOAL2uxQ8qNFjWwc7IMhZeIUJ95dhMXJ5tVySoCIGAY9hREO0rkCWrliV37nGuMv9hS1MUFDTUWEnOz6licu5s1cpUY8fucQj+D9pUoIWTojJCfceliINtpQgTEBXu9ABvQgvF8eE9T22oXfIdTVKzOCAM81eZuPeTCW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N/JNUpn9B9gQunmztMMRhX3I0S46B+kayx2uMHrzemniSTwzBLaA5vUL+mtr?=
 =?us-ascii?Q?FvKCmJ+07Y1JDihluvn6Zh2eKwM80ovFmv92niaMXBu0bhKkTuMBhFJu/mQw?=
 =?us-ascii?Q?d9ERf0cB9KVL/h/CZSOrNdj0uXL+zWqhJWa2yPMk1228YK9QYbCwMfWi1JQN?=
 =?us-ascii?Q?qAFQs+FAkJksomW2D9IEjleXpIgF1YAqvnV19mgwypizvI1XDBOpGi+/uZmY?=
 =?us-ascii?Q?6pWiRQb9K2DMv37vv2dV4cE3QVZ4J/Ia6vWaWuTPtWzkIvX8NV8fvrADqJ2f?=
 =?us-ascii?Q?O6zXzu3kf6H6ZgvIolwX6I6Z5OVM1pT0Let2BVEB2M75/hb9Gc7QsXO+qXe9?=
 =?us-ascii?Q?ADAYMjtq3Aeu9nmEHBXqrJ9w5ztg3F2m8oVE7nYvk2PlKU5lrFAzeWPlBP4y?=
 =?us-ascii?Q?49Eqk4SmuQ6fr9Ln20TyMMIoWyqKYEig/2tSSv5h8PpbexGriRDZdcTXvkgX?=
 =?us-ascii?Q?x3OyZL8joAR9C8tyQySxj4G7L7CvouRcCz7Jx/+kCGsvrYA4oxsHKHW65Y0l?=
 =?us-ascii?Q?6qcH5lLYGlih36d+oajkZiI6Xg7/1BVb+lGqyiDJFJHCjH87lGk16ki8Gn7+?=
 =?us-ascii?Q?s6D/pyOSnqCcYlrUdnSCVkai43/9fcBOZXZmLiqjiTcqmbDFAQJSKCp1WMHc?=
 =?us-ascii?Q?fgxA1WPXHG7QeGqgtJ8pXeOAGvtiRI7AtTzoWMudwZuTmfJrcfRc8HpdFpre?=
 =?us-ascii?Q?zPZFCRImvXBUx9hpKD5g1KgrXjL1K8eg5S1620pplhzXH0gt1FmHTMAeOAM/?=
 =?us-ascii?Q?uC2nFc8QeGXDctP5rYADGgVyA2zHdgAnXMSEhjAL7QjiTAeXQs/xTXZYAnSg?=
 =?us-ascii?Q?IAhaQawTW3Y3vR5kz5bwe/l2VF+o9QszHKezn60zU0Fra6LkNWVvWrisJk3C?=
 =?us-ascii?Q?hBnlnFAEv4fTOr8qF7K5N6sqxJDOffyaFDZUFZvxXo9DDcCObtWcEqu5cTaj?=
 =?us-ascii?Q?KPZ599N1uZBjDk48I3l7vXl3luNVAmgEVYAGGx2fOZs1JRmewsuqIOsCUWhl?=
 =?us-ascii?Q?1oVIpSGbqnko7NikCUg3lrHtx1611NleU6BmAu9qMs4bLVf6bFK4Satq8aaJ?=
 =?us-ascii?Q?pt/DOtPya6K8YAFChbHdq++lCBUrLLfe3SH2o9oP3ldXrGuCTfFdGIIApmrB?=
 =?us-ascii?Q?kJ8AMtrEG+XwpAflIJ5NMMn4NxaFU6tlWgMU45yALj6h0ZkyWd0ATjF5WexA?=
 =?us-ascii?Q?O+ORmseqlxJlRvTA42NoS4Kvo/Ri1uBH3MimJGkG5kA5m4BmTgupfXc8Dspg?=
 =?us-ascii?Q?/GbMIH8yb8k1AkbOSBgOWFPaWBSWzomqQ8rgTkZFP+Z+79OMFcwAyKqKL1Tn?=
 =?us-ascii?Q?ii1d6Yby63TN4cwAXrYqvSefUqhEJ47m3BNZ9ZqUgfIUtJcgXp4x4cdX/cJy?=
 =?us-ascii?Q?YGINM8qH9pEL2bRl6qdT4EeGl4VT68qMayNpTy88FJqchunbUr1UZ4/Qkwsr?=
 =?us-ascii?Q?6qjp224r0dOXVbkOkbiY9sdP86kiQn5Cm2VkDtq+uk5qP4MYlQnGtlxH9ETT?=
 =?us-ascii?Q?D0nZTxlFXdToze3UhuEDKFi/lxMde8zid4keE7X15/lF+lRVfv13jmkueMfV?=
 =?us-ascii?Q?60rmtb7DhTaJOhoxnUWRAVHvDcnluwnw30gr8kCEw8uVLy1sci3rzV4j7CY7?=
 =?us-ascii?Q?F/B8CRwKVQAfvB2Y8JXBevdxRFdNmcaYpvYgoFdvy45qNWuksgZfD+Dbrb1m?=
 =?us-ascii?Q?5FQVp174rkx9BgzJN0HBpe9d22e9X/FytsJYgZ10GYlUhXZh0yVxh0rKl1xU?=
 =?us-ascii?Q?vYuCkNwUV57Eh8iXKBcuN/6BWDJgQjE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49cc28e-75c2-4a17-4062-08deb9b2feea
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 16:39:16.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBzgPWJSwBGHTh9vzZFGOLks04pz3zQevEE7NvsP9wxrUiLBmEg1NSMrQ6M/83CkFPPJUvtZ8ZTiKifTlOCq3i/k8THqhFyVMyhqW+7lMow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10944

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
index 49fb2edd5a7d..ab62bcf4107d 100644
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
@@ -125,7 +122,6 @@ TEST(clone3_cap_checkpoint_restore)
 {
 	pid_t pid;
 	int status;
-	int ret = 0;
 	pid_t set_tid[1];
 
 	test_clone3_supported();
-- 
2.54.0

