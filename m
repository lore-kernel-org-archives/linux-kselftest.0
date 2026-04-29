Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023137.outbound.protection.outlook.com [40.107.162.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0F63D9DB0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458534; cv=fail; b=jM+5ShADKdPj1tHgodVoOohBDneLWLY2P9cj0LOxotG/yJul+QjFDCSF94Jph2Q5+NqMb/cGflE80hbnCwePAKOtzaeOE6up6yEV6kMh0eCPvD7rqXw8P2EBtTVft4uRRMh1UOdQpmduRkofjnctgkMV8hgjVKP2ialvuOyERe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458534; c=relaxed/simple;
	bh=zcfko7lUDlYErlLuHlleOAm5lf1pkXqUE+zMjR/0gCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h2lXw5kXUcjCd56enifTOs0O3FIPRh4uER3aU6FX/q4wA+J5eJb9vuGcY+auHrHTjcIGMC4GcmHX3vsyiFEc8+/KJ7fKcoP13uzDKflFsBuSZCvSf0H8wxmuZG+gnjWqhlBC22gUxG59ywn84Dy2W8qBslp9dqHK7TooO7xJv0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=LCqKNY5k; arc=fail smtp.client-ip=40.107.162.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="LCqKNY5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdFUL5xDrpFdFtTuXj7QesDWryz48jqxR+Bn83Y3VqRqEOgG5u9Tz8fY5l85+Dw03wSxCOhcWb7bRSMZAsFWHvx0Qk6/PcSa6LK8Hwsnn8NUGnWNA+GWWF1XblgCZlE55U3hfWyvNHfzTYfgkZ8rgcDi6WCXtWTIVudIqFV2mMQ6G6RPQipp7PK1nZ2/XaOfSj8aFYxhxxKyC7NqOtE/aQ0FRaPuXD86r44QVGbvU28KYML3uQkp+DZWXLpvQj4UxiyPhvuW4sIJzGrd+qXhZO/YwJNh7Nt3jhSefhDuU9+2hFiM+vZja8zZ/75g59jhFm4AUHKH7jcST2wuecqOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkYEYChdNk3gtVYeGsWn8yRWLgmftNf64guVv9MXOr8=;
 b=Jdxm0bZKvFwP8wxIVtK7ol8I0ZffsOeYnLgwlJDNEZjkceM9FPu4lzyByv1zuXeOUGuJThdG47QFIl7fS990jwoKKcBk0DkoCqxOaLUXxpMFBDRZLvgZi3RuMG0SMVRUCnsZrZ5ZlKQGUwlbhLizXk5arFveZWCZqk6m/LXTHAY9HQv24UNs/OJPwo+23kyMa9T+G5VN2cKoDhr9klwW7/TeWR3fe0+nJER2daafnr5J093Lhk96vIY0me3nsG4Ho/q/R+E6CMP9la8ZZ0s4f/zJ0Q29cZ8hR52HWff+H28QzX2Zwwn0T69iA3yVn6D7W9NEwqeYLxShx4cqS2FmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkYEYChdNk3gtVYeGsWn8yRWLgmftNf64guVv9MXOr8=;
 b=LCqKNY5kk43Z3yjUoKjcLR27b3LePPgtKce+cgMRytoMk4yKVwD6S5fME8w9S1vGWEL/vleUDRxARookxu58YucNYd02ipHnZhX/qnKtDU07Y57+BOwp+R1eiukF6Ze/I9rqIJtdWf81S4Wj5LWDP1TAjkVMRx0afE9kBcCnSXzwlpkdt5gIz325QmUYcJ8DEIlKhbpP9g4NyK9uwmDu/TxqptKxFCiEnyZFyIZo2Ho75uLaXvJ8xDdfhilGfAGy9et2pcS1rSNSZLfUFgra5Jj6aKC3uAzj5u0JgkoNnH2GSV3NtcZtUCRj4f/1tE0drIYSnuypIcaGZfPbFpBIjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:37 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:35 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 06/15] selftests/mqueue: fix -Wunused-variable warning for 'usage' in mq_open_tests
Date: Wed, 29 Apr 2026 13:28:02 +0300
Message-ID: <20260429102811.47214-7-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1c024146-8537-4378-3838-08dea5da1192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1KwXb19d6zaH1BogR/HzPiQGOwTOTQgP5rPHTf3af5QNeSlgRs7OuOvhSzCmKcnr7/jA4s1u5lVeE8d3Ka/ebJOEszmmdO2hL35j7lpIV5MYqA/JDjxFso0u6M5/ldTrMtnb8E1Ad8TQocKTqNoyGPn7u1WadfO0N4bcBR62+ihOlIw1fErzWYMt2+GEysz7W/UHPjVbgReQnfNT0pdW3/TxDXrwbeP7p71ZePLK524XFm2ddR3KV3jeTYMaqcDesQqA9PzK5cIOqsyREFy/d3yHL2dYpRZi+KqErdQzrZkp4ibrEpuW8Q0MLHCmnYH4e3Zbr0zP6M9+OrA4c436afFByTludzFPnDs0YX2eWB+XR6HUueEuAoYilt10qE9QomtA0b+XhUjmYLtGcj5oXpF/KjAHXeA0hfEv6MpGAqlgWeqtHyF4O72FETEXK18yUDAkkXPIbKS2uPGb2g2nnZVsjo0oQmsxEk8BqndzBQ0xf+Cgv5odycR7sILuvQw+FRfCbwqIRfy5p40aX4+dMxZ2n5ZRVCiqyvQ+E/oatLu7IMjqAWQqhIrBTdGsD7BwklBFPHadfteHS8d4l+6Tsik7yAQwuE8QOk1dM6dWrovcL5eu2k5zntR84ALBnRJOF1I0sPop70fB94yXN/bl2LF0puhSaObIga9L5wUFESFKLHL94zCvNfZYEAhXYWGcLePIBMuPLdL5Srm3GKISUTAAHatjymgvuPt79+rwd4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RlAz5469b7BobnEMlLTkarfZS51QFb+sCPAeWyAPqo6aqGB+MfLr4MLtx24c?=
 =?us-ascii?Q?XqPzq+fwvXhKLGNo6SQandbtdV0PvSqYDnGy58Chk76IXOmxcILgcFD8qaRO?=
 =?us-ascii?Q?51UyO4+FxGxZti6KZAD5I4CuW6chdbevehYNUavDchRMToijzQ3+pZRLQxKo?=
 =?us-ascii?Q?6+5V8CsVys1LiEKki1MEpbFkruL0fo/3zgGSlOzkd0BZhLB27Xuw6CP+qc2E?=
 =?us-ascii?Q?kTWbj8ILkWvDmPSo4itFFh86B9+MayLO4OMHJRoOARO6WXxItSvID9vWSQ3v?=
 =?us-ascii?Q?ClhK/Ak1kRntOmKVbQ0yBv2oV/HVEtjX37p6585AySmYZm17E4SLXvVUnymp?=
 =?us-ascii?Q?BuuwW2dTtcX2OMw7TVmPmAtqDivD1hllYeNxiFkeKre1COSdDP7pCgA5aoRy?=
 =?us-ascii?Q?JuAX8YdNoEKJkxwrxuMHI4Wju3C2TJTu2/M0dnT6eToH73URFl4HlqrrubC9?=
 =?us-ascii?Q?Sjfmjd2PrekScMsU6rfq4SWShPfAcbJNjAoZy03Al3nWsNZAVfULRjK/l8BG?=
 =?us-ascii?Q?Uqdo+Lk6P59EL+rPCx6Cr90HOYEwlETOv6t7HqUMPB7VHkFxNPEtvNv/5VmI?=
 =?us-ascii?Q?Sd3CYdeywWnz1PzqZu/gBBcDGRTA5EScDMGXc6BxOOTEFX+5d+BLlqxye0HF?=
 =?us-ascii?Q?JLzf1tX7kdTbb1MBPDmq/pidGPTV10tH4PfIWZvcP+ocYOzh7fud7+j1oeZ6?=
 =?us-ascii?Q?OONoEI/J4AEp7e2dhXSeCECA6EeToaOsCw1gvcK5NlYYhDPDtOwx6Mcu6bi/?=
 =?us-ascii?Q?BnIzgkvJGxToYBHk57Aqoj060qqzw8HltB0Nytm+SCPYJbgqkqysqEylDWI0?=
 =?us-ascii?Q?K2/J8adUjV0K1efEp1hDmVkjchPcrjP2yp9uCCaUrN/ga7e9PtDNVrNHN+jM?=
 =?us-ascii?Q?lL+aAkQWuFuENvHhwunJzUNBkBPUdUAhHPhdjR7j3JabrKiR9zhhTlB5DHMs?=
 =?us-ascii?Q?bsNZLKjyFZBvW2nQqNvWHNnhrOfJj04UZ48V8DYYIyyoDnDjN34mRvtugeFY?=
 =?us-ascii?Q?nTt6fNoaOzD1oh3MbarKH4R+8UU08/WolhWi8JaP+S5sCN3WzpW/JhiGajFm?=
 =?us-ascii?Q?Hhh95TLLG2IZsP9sLV7cxRTVxjPfKaK5+7qVbPfMswVhhCPleJvZgjp+ti6E?=
 =?us-ascii?Q?Hf0dsJyHOkf8R5V4PRFqIS9vScRP7YN0BosMIfw3Bu67Pp3ZOtnyfBLS+W5e?=
 =?us-ascii?Q?Ha/rwvMNitf/uF/MmgI9+vPxOgAFa7Nk3nNCVzFhV6Y0LiLBcaocMj5rbsEr?=
 =?us-ascii?Q?AlPXjNZvx8RTZ2w6MIoYF7fHpHwUA52frxs99a4kakLIHdXamNHocDJUq2ax?=
 =?us-ascii?Q?Miwr6SvymE61LxaYms+t0tEgjFIJCUr5NEja0HSIaGAwxERAqwrHIXqCjVhm?=
 =?us-ascii?Q?49/rpU5cpBItlvcwIbk9tcQb+k4XQY3nAJqv5EbTnDnFkbs1nSNkLSE8vZgz?=
 =?us-ascii?Q?IYwW7hFRbdNL4TAN0tGk1O3L6674+kFLlR0hyeNvh2fRhIXFAuVxTUrqxdjs?=
 =?us-ascii?Q?ARFMkdy18G595GqqGbay0O7krTnN2VfrwKmUwfyQJSZNV5Gd+5XsCDvQop3I?=
 =?us-ascii?Q?NHvegsJ0ohzcGuq3bbjTWInW3XwbA3JMS0rRAf0ppA8UD+Vbo6mIf7JiXAAD?=
 =?us-ascii?Q?OnAWQz0mkQ4K6LB/Grxe550QTne7T32pzIxw+Un8wLr8li9fMNSxOHocnpvp?=
 =?us-ascii?Q?ulV+6eCOvqP+ZHE/+FGypb6ghlsdZRpHOqutvjszB9Ee0pu/DcbOqb+2AzN/?=
 =?us-ascii?Q?2Rh5a8k/v9welFgqqpFZNmJ0eO2nuk0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c024146-8537-4378-3838-08dea5da1192
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:35.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfR2W+Dnms5Ju4/gYDg0C3kiNNxf8ziatrrZtV+tl6hIRBoZaE1wMUQVXbEgWPSCBhYROkLBHVhNg1EvjWF3ahu19/UNOzOrr5YwJGvUacA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  mq_open_tests.c:38:14: warning: 'usage' defined but not used
  [-Wunused-variable]
     38 | static char *usage =
        |              ^~~~~

Mark 'usage' with __attribute__((unused)) to fix the warning.
The variable is kept for documentation purposes.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/mqueue/mq_open_tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mqueue/mq_open_tests.c b/tools/testing/selftests/mqueue/mq_open_tests.c
index b16029c40c0f..f7955507917b 100644
--- a/tools/testing/selftests/mqueue/mq_open_tests.c
+++ b/tools/testing/selftests/mqueue/mq_open_tests.c
@@ -35,7 +35,7 @@
 
 #include "kselftest.h"
 
-static char *usage =
+static char __attribute__((unused)) *usage =
 "Usage:\n"
 "  %s path\n"
 "\n"
-- 
2.54.0

