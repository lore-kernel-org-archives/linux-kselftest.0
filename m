Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344593DCD94
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458523; cv=fail; b=KYvM0601Ul3f2N5vq2a8TskzvcKv66QyqFQbSwQvW54vw/p2vKzxTP2xbGNO3Oc+ZWYMUWl7nP2PciATARchgcniy7E2n+Spi7FDBB9Kz5WkBTuMZJdFHPfCp+o0LMI+hO+dPqAOYZk8z2jCPKYaZxgZGk876533JHMcDotANU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458523; c=relaxed/simple;
	bh=QjbM/LCymsdDnJJfvm4jIMFE7awzjiNdzcAAIvdeyKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kpWNV7qX/fEDLnml+9EHJyt/rygMBOWiEiYVMsGpJByDLJJNfoT05l/NL8i5LTMTk4AyJ9V3PkKyPpcqpHakraXr+3JpJJzUVB+ex+5XRM3bCie+FqOA7CpVFNrPe+Dq3Xivaww4pSkSC6PaWUER/3Xt812yMfL6jm0UZTuWOhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=OZQ7n0AB; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="OZQ7n0AB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3LJm/+K8knARekdK1WbjBIiUUmGkGtuagn9BbGoLzEU/EeZUQTlh2+5g65RnSynkNyjzhPCKjCfA3xu1DxzrtV+B3eGELjgJaV3I+og3CfH1PJnhsGLom951kl1xBGmJsvuHso99P5ECZ+MZoWtK2bTbkGA2qTTS8NoxcfCUHlUeoxbRhLOI7eHGXS9+rFMOLsnWx9J6SPasqjarcyikYEuRoZd+N660fFqVIYdHhFsOh68jKiNDE2MLNRCmkKXJiGako6dbfanr+7Wv42jh0RZjyJNW7Uny94Zc6Wabqd5SRa1b7t+MZUW/q+1y9aRGU/2A+h+hO+NvdlPisSNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wOOZd8NXkm1nBvjLuiDjAus2opVrYhLneUzBix9s+g=;
 b=hyLH7LNAfoiMj7uiGU8DqQATHOHySvDUHGqbpcUvBQaCeova5T9Q+Y5wIJ6oO+ktVnBwlOYGwS+XqMHFtqVvHxLr3u9L6JMY3wRWOR7ykzsRQqrMuBBWY+5K+qWtb8mrzr/qyF/Bls+N1DSt/3v/D2CrHHErhQhUl51Ogqu+aUlw3oq1M07dQRc2At+TCt89oLQ6L0U1fMdY1UXSnDTorDBod61IG0BLN+irJyEIvSOpw0hJLHDV9n/B/eMp+j9xGYCtWsPVTTi9GMu8wCCsEo16hK897lWfBFznZAJh8OH7zqH6UPj5eKgmZqz3N0gUIvRfegk8vKa3aq3ZcRAYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wOOZd8NXkm1nBvjLuiDjAus2opVrYhLneUzBix9s+g=;
 b=OZQ7n0ABQsLG6KpQfkS6M/MjgBfIyvjgrm94ncIMrhelFGiBYkBBmMOLtqFlQ0DCn6i3bTwn4SRuNeVFa9vb2zqGy+JG3YtGqzQ8spduqE7VG8kD1a881tGrembHendbrwO51CJXpLhdiQq0Y4h+t3NAhxUl8jgqg7a8bo6A/KiBovDHouycruMWhPG2afXda6GTqLNkVgA9N0Q9LporP+pHi4urUSmSFYwnBSJsfNQgcYZJoeiIqopKJq0ApG3bXsuTM9mC7bEKq56Hbf+VroOYaCRxYYy6l1+Ng3UOm/cJWy39cPY9HJFfbCCPl26VDtrax9feGMkoLYdQijxMGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:31 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:31 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 02/15] selftests/prctl: remove unused variable 'j' in set-process-name
Date: Wed, 29 Apr 2026 13:27:58 +0300
Message-ID: <20260429102811.47214-3-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2b6b71fb-1f86-4527-c103-08dea5da0f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xH4Os3Q8ThAgFL2+OdOqqj0wL+jUr9E0HWqm7/rcPtS1rsucYaCtwQJd6gf66DQmsllFFHKeYR1z39F2/CWmbBBDyM0mPortK8Do4KgL+METy1LJPBRQuugkMQqqeKMR5IXC9/pdEaJiW2ld7MqfFSvLSwx/rR9JdnVi9ci1VCWuni5uq6H4/6sN6mGf0d7qaIV1HBBTjfyJAVLCaDq0vjCDYBCRdvnhjJVGth2qlCrKoEhIuvl4LzaUUAlQG78/Iq/N5VyXscFGaiPDNmWiLJuA6KwsSPFl1htlpXUa1K8ohGFHA2S5ZgI6QYKHCWpwVHRN0iko4awUFK7a2U0t7X7hReU1+VQnExvfJ2uYi5wbUKX1Gdgy1NpRpimX3YXoAOLMf6pr6pLCoc9WnAPFDWvHiFKCghrBnxMlkwnxCd3Y6jEgAy4AmUqYJk718K4sdLNNOIFb/76drPzYXWr3OfPqNuytcx4RXnQAAheFF1UI2/EYX40ePDaQgD+4N/dIPN561swL2ssjVNpvHKoQQ7Z7QnC2/jSmi++vQQnfTYJ6rzQbXroX3FvQ9xftJWzIUQydvE869aMMf5MWzH6lWQ+EGvnvwInkw0FHE2lexsfavsv6pjPGjLm1I2FMGhtKhW5wwuWbqFh3OHGmlHncBLd3/5Z2yv7Xr7V6LNprFyioErDEsWrVaFnGAjvy+UNjt/2/Dbom2KUBaMcv48eymh0BfqAkxHVLT8EonCSu5Iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eDaG/vwqSIhnct0fteZwzqltmJwiQG/h7W7bO2OFp+opPrtoTjTR1pIF1ggS?=
 =?us-ascii?Q?QebGsc9O30LzHQdJu5U4iJErBUJwljuF9i7ezcgsZhiAk/1ocab7ztL7YRWV?=
 =?us-ascii?Q?dtnJjIBdUoCSTKs2KH0ZrD62Y0z/p+pL4HbWd+bidazAN6YaWIDY2HUUMU6H?=
 =?us-ascii?Q?cYQGxEmcrkfhGParmD2pi2tx3XyAF1KrOfSRyKLtsVMy9j6kaiKzBNlnRWfK?=
 =?us-ascii?Q?Nqxu7vzcXrz0eLEQDrbtCEi0I0HVLl99SB5NThQYgJ9vabLZ0EcvmaZwhbIG?=
 =?us-ascii?Q?PaqGFZtWbM/ELSPNky0SfdoTPKU1KCSdSa/vwBqHSPtlv50i/r0Iz/m0H7aE?=
 =?us-ascii?Q?7Pl6UL8Cbi0tjMEwXW/PfrKSmdFQMva8DoMVyS7CnWIp64VBj91GzVwgONSl?=
 =?us-ascii?Q?P2ssZBHTB5ip/nMTL5ldyWVaXKP/2ftduJ6SQ+SbEX45e9mdTu4YojHsZiqM?=
 =?us-ascii?Q?QU/yKC/258mMSvFz4JVTPellI5a6GFv/hQ+kCdycsMJRAN45YpTfqTw3hE8K?=
 =?us-ascii?Q?f+LTbk2Eb4y4nAUu4DJ8sEdbfpMJmFGJ/3IxVJ62VyqyOWmhqeo93C5eEY69?=
 =?us-ascii?Q?Kgo/dS64eLCq3G31sHE19Tp++o654BtTPH3/wkSU+wR/vY++w9EqFRdsN9GS?=
 =?us-ascii?Q?o1LIyOslWdAQYZfvLuH1pdDnK+4dY47briT3yMuqeJCrYO/7goDH+7mmqT+/?=
 =?us-ascii?Q?g76csCiUpRXK5tuNqHwJgb9akmvkVCKfBgeYVNBOPa4NIBpMNishoCq1s0D/?=
 =?us-ascii?Q?YJhabQSLX4p7M7wOh1wt1c0wIdZlkkBshYyziQc3+YZxQCFrVENtyVr3Apo3?=
 =?us-ascii?Q?nBwacCSBdl/ysJ8nPxGyxW9mr+ltyIPPqGopQTEXvya1pvHv1iLAMBHlZMPx?=
 =?us-ascii?Q?7kYn9wYHEakdVtxiyuQzgHidMOgTlId1b91lyXXeYeNoQ3uHfUOUYn1yF1Sy?=
 =?us-ascii?Q?gW1zAy5Vc/wAV+Pyy9HIKew6ut8jldcE2kv5aP2bF3DwhYDWKZEA7Ov3eme3?=
 =?us-ascii?Q?R4tOziGaR3JevxfOGRSuBxPUHiuG/fGN+isplwGb40Jp0vs4gNWjeyGP5mfJ?=
 =?us-ascii?Q?lg4Qu2KwTu7/FDg5+6LTgs/K2yQAzWEUts+SyTjatJ92M9PpytdGQlMrmPiR?=
 =?us-ascii?Q?mvnhNK1tYqKzZjvJOzY8ZU/fE1D3CFoHg1MG44dbgqBExJH6XRcasspsHd3M?=
 =?us-ascii?Q?Cn/gYYJV6FNXM8Csqk/lTxWxknjBHpq+IApI/qIA+ApORjD6cNMNCZFIoiWF?=
 =?us-ascii?Q?KK7YZ87DnV6JpBE7/pltQQp1QyMeAozx4rfY1cNoq3ealuMWiBcDcMsvYeak?=
 =?us-ascii?Q?1vKFZCaro8b4OSJADdb1LBFxeS2IjpaWfpxxxymipa2ekeQxIwG9joNSsqF5?=
 =?us-ascii?Q?tK/f9S3Q/H0Fuj3xVieZTQQ9PwR8xUX83WSlANaR4/m+iLG69eClSzIXDfG0?=
 =?us-ascii?Q?u+q/AnXlT26hzUjPRl9qAhMjEV++VLMmhiVeIcqC8DJzW5l6KrzgTESppoYJ?=
 =?us-ascii?Q?g/bKB/De3oWJwJDra345gzGLXAmSaF4g4NRF8UzCnLqUN7nvx2BTMQKZv0zx?=
 =?us-ascii?Q?mFUdGwDfulG/sPc3AgcAfgRsEw/e87H74eYqy0K0EJu+1YexmK/0u9+bOqKx?=
 =?us-ascii?Q?G61CFqHBMepXnUq9cn3TgJ5jVtKlzFNYdJStNa4ByZyjUxB4mQ8py3cLBmn1?=
 =?us-ascii?Q?kmLTHkYtxMciFAW6LCVZrQTJukVV+WvMeaYKClNe+jxTrX94aoX5KknImnHG?=
 =?us-ascii?Q?HaTMVU0PDNz7nBYZkz8tDVfsEIcs94c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6b71fb-1f86-4527-c103-08dea5da0f63
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:31.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoYc11lqT0qhjmF07W5+K59I6WOCAX4psRWAsgNY4v5biuvOhRB23GTVTBOIrmlwZNynIRh4loBeUi+MX+Mlwe6EKxn2/EnqZnxWbVE58+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  set-process-name.c: In function 'check_name':
  set-process-name.c:61:13: warning: variable 'j' set but not used
  [-Wunused-but-set-variable]
     61 |         int j;
        |             ^

Remove unused 'j' to fix -Wunused-but-set-variable warning.
The snprintf() return value is not needed here.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/prctl/set-process-name.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/prctl/set-process-name.c b/tools/testing/selftests/prctl/set-process-name.c
index 3f7b146d36df..3c5175f873ec 100644
--- a/tools/testing/selftests/prctl/set-process-name.c
+++ b/tools/testing/selftests/prctl/set-process-name.c
@@ -58,9 +58,8 @@ int check_name(void)
 	char path[MAX_PATH_LEN] = {};
 	char name[TASK_COMM_LEN] = {};
 	char output[TASK_COMM_LEN] = {};
-	int j;
 
-	j = snprintf(path, MAX_PATH_LEN, "/proc/self/task/%d/comm", pid);
+	snprintf(path, MAX_PATH_LEN, "/proc/self/task/%d/comm", pid);
 	fptr = fopen(path, "r");
 	if (!fptr)
 		return -EIO;
-- 
2.54.0

