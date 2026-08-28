Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023081.outbound.protection.outlook.com [52.101.72.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC98E3F20EC;
	Fri, 28 Aug 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915098; cv=fail; b=pqyGi5cCUSU+aFVe8gVJr8uJeBFzXqvYNGGzwSpOHU3jz4SRbS/lZ/kjnnpNFKVHnTJQbRELk0QqZyZqLiwGLgsqerarbqopJqlW1rINdgmW2YnAv0wSqOi9l88kj0PHCFGphEwKPttG2CysurHNws8cxa3TVv/V/loHyUXLyqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915098; c=relaxed/simple;
	bh=X346XCCV50Nk29YAht3Ezdqygy0D4PTpi5snVZ2hZAY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=N0DwfsdPAoJKCMZnnKZe5CANnnLOjkcdKIksqOPLXDJ2DISVhAzx+tBVoBReOIJNpnm6q6iEweIyZZxXc/YLqdjWTg/MLxtPc/9S7vLYjZGfImw6n9yVnJUm1JqMAbl7EUoHtLRX5yi/UabFQxqGCBM2gUYehqZ/+VGTT3Iz1cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=2IJjF6t1; arc=fail smtp.client-ip=52.101.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="2IJjF6t1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkm3ecd3Qbb+DStj2B3bgDlstJhnGp2nPyCejAqlElynGplctPr3WG1n+Wbex3mRqLWoQjJ4Nal//dXPmY9vKNmn7Y/3XZIHcHwQv/n0jfA5chwZHe3r/DCfXl0qkQozAf4+4z0nn/49g8IbrlcaWx/vq4eVbMDydnLpZJauYVtKGLqh9m3b/CQWKObvf+IwqoVIqOG3DupqTUK31jL4qb0DDcZMYgWZB6LzZi/FBcgZfY1jaDROH//KtGjkAwG4OJ/cs7gUksyFN06haHbuJvm5eavc7ANmmiwoxEjKf6Qi1nkVoRyTCzorm6ffb+Cwuq986MZZmH3R1TXnnBX0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LDgp9gMZzo2/48psH/VcnH1uZXdXxcBa0kk25HbzDE=;
 b=euJrIG9TZqJFJjgeOISxKdib3FsiTPlKWbFKv1TkLuL7k0z0hw4l/Njntl2i9BnJ9003lr60qkxHH9eLrv4gV6r8e4pbPH051V92xTTWZFIjlRhpMSDWW29otpTRoDRk9UogYKFGVEl9LZa5LvkO8vFpItq+WyCHU6hoicWILPPykhXqJqD4nOPfR/g2LVlUcqh9UgPiNP1QMEfsIMn6PDYLFyK1Lt+Sh/tKyu726My4LlCYLLMWe+qebgTpjKW2APvmQE9jkBHge9VJTqg+VNTNIuUc07Z2BxBj4kkGs7angQE3eDcJ0TrTrwEipOeqLlYdU6Lmy25P/8ah30SSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LDgp9gMZzo2/48psH/VcnH1uZXdXxcBa0kk25HbzDE=;
 b=2IJjF6t1RZskuDs62nVaA14dkMABpHlWtfLBD8kVFiOt9Ul9DV8hFm+7hnBikDadk35Wopc+c3GsuqksKf5uNLMI6IGl7zh5ychOiZXhCxhcsyDtPwS/55zjI81vk/W17Nsb8sne/Mw918DMCx9r/xUl97DIO2kFbkJXVnUTWb3v0wgMTjpCD0zIMV5eJRWFdHVxnKEV6lKNrJE62iBGFDj4vth7ihYYrQVa8kVs8/+Zya8BGbnf6m5cI0R/NXpjz+SxvXOPvQkOToVsFu0DMvwUVsrKsH0PGQxiVUQ5nj+JRoKmEGvlZinpXGCDCF9/zOqR8RiRXdIIA7nuyZOScQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by PR3P192MB0842.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 11:04:51 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:04:51 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
Date: Fri, 28 Aug 2026 13:04:47 +0200
Subject: [PATCH] selftests: epoll: support KSFT_MACHINE_SLOW /
 KSFT_TIMEOUT_MUL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-selftest-epoll-timeout-v1-1-19d15c405d09@codasip.com>
X-B4-Tracking: v=1; b=H4sIAE5rkWoC/yXMQQrCMBBG4auUWTuQBrHFq4iLNP2rI7EpmakIp
 Xc36vJbvLeRogiUzs1GBS9RyXNFe2go3sN8A8tYTd75k+t9z4o0GdQYS06JTZ7Iq7Ebj11suwE
 heKrxUjDJ+ze+XP/WdXgg2vdG+/4Bel2FcHoAAAA=
X-Change-ID: 20260828-selftest-epoll-timeout-0d47c17beaa2
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Schmaus <florian.schmaus@codasip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=florian.schmaus@codasip.com; h=from:subject:message-id;
 bh=X346XCCV50Nk29YAht3Ezdqygy0D4PTpi5snVZ2hZAY=;
 b=owGbwMvMwMWoZLn8xddWhSDG02pJDFkTs4OsWkSW5b3c0PN5Pmdczmfp+OAtSon7Q8/tNk6I1
 k89Oyu4k3E9CwMjF8NMMUWW6aWs860U7zzMfvJ7HcwgViaQKdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZZ
 YmpubGphauhk7Ghm6OLsamjm5mrg5OboaGRlbOpq7WriZWpgaGZgaMXBxCsBcE1fD/t/754VHyt
 9mHuR98H7DrbWWxt26EYUGVQXd7xcbx0248M7CYFd17w7D/WbJQnM6PkdzfwsMZGNPPyUQfcRf4
 o21bVHHnuaEzqLwB/O+vnrCzmKmFW3IJiAns+Kn3Cnz0x8zU6Kn+TE/3l9/9WrgGfFqUe+VgUf5
 LsTOe//L9sFffzmmV/+izDgnflqbo7Op6sf+iTHhIaJ61zdrhL5z4/q57/PH5ev438nKcX18qOy
 /4B9D3EajWpNci7Q3faYrLyhdYGS+cn870z9hz9utT43/NmysqT2yS1Lox7RD60K3HFTxMvb4b1
 Ghv6Pgxyb21hn1bGZFk0MvywYF1M0/5XD8XLTwgTxF9S/Xuy8I/wUA
X-Developer-Key: i=florian.schmaus@codasip.com; a=openpgp;
 fpr=1357B01865B2503C18453D208CAC2A9678548E35
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|PR3P192MB0842:EE_
X-MS-Office365-Filtering-Correlation-Id: 971340d7-49c7-4cb4-b6df-08df04f42ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|6133799003|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	G2lkutcBCAPl77NpjOUVl1af1SrmdAKYrRIqpWbmJSvn/M6UkmfKVcPwIs7OgPblTovcB7HJZhrQ2kuizN7XWHoP7WquNw1SLEQ2bzRFu4Bq+ije2I9q/bLB+XVMPr7m3Wj3AV4d911ZwX1LZdBiuTp8F9tUSczxjjsvwhHdN1Ge1qMLN3SqJdYVaiaqhT1KLEwSV2TcLC8qjSaEjjUy9pdBTsxFPnt7vTPhyeZqn0K0Z+gnb6gnE4MXH8fgRkgVYH0/qnf5ws2fwnPVanm+zZ4G0IzUo8Z0ejrWk+d3TiKiF6vaWOKiFTg15ql7DCLjgywJb1pQ5eSG4O9MQTNAa8LgNKwM20WmuVBW6n7S+2dOa4RYe/kgk1SQ2RBPn3LRRZWA05DMj1btaLzgWXd4NgeGkzxRGdkWWyutTR3ykg2Lgmj8bTJaZEAUQjvmBA9fhc+KWRQJe2RvTWxsLpV1KQLnAzrEQFmj7hkPbRfW8WkEZaH5tVOtkAwMVUE1mnyrh6nVUZacYnUcSFs6V18Om+DhwyNBD43B/1hLQblrgx5DrY506zyGaVCFGxoS3sw5pCg7DgNUx/N7SvpsByDAPhXra+iekC2aLKYjnedu4GCa2nC+pMT7RYVZR63z8eQJmUclu+3h2iG9aaYoV2kxiprroxSOHkWgZ4jjT3N1E9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWVhZHFZLzNHa25aSEZqR0tvQ3NGQjV6Z1NSbVNNRmFMZlNqVHlrVVEvUGZl?=
 =?utf-8?B?Q1ZvdjFaTVVWcWVYaGFyS3NnYTkwUzFqNUVDWXUwQ3JrR1BST2NBNlVQSUMx?=
 =?utf-8?B?emdaUWJhMEZwSGE4UGFDY2RyZkhBQjViaC9tNE13U0NIZU9BMVBWRy9KcUd0?=
 =?utf-8?B?ZVI1cCtGKzJWd3VmYzNsWWY2ZEJzZmZtTHJsSExpVlNSY0FBTWRtUGNZckdO?=
 =?utf-8?B?Z0J2STBPbGhYem9rTlQxNHRlcE9ZdkhlVE5DVndyWGk2a2pQdlphMXE1WGN4?=
 =?utf-8?B?NVdWbmFzc3FaVVJGN2dSVWpBMGJuN2Izbm9IVWZwbTNnZ1J2UzdYZkJ3ajU4?=
 =?utf-8?B?ZGU5TS9XODF2dXZXQjB3Z2lDalZWQThsQ3h3MTlja1REaWo5b3B1TUlleEtU?=
 =?utf-8?B?aHpzVDNqZDQxQk5HYkNDQ1ljZnBGWnByai8yb3RxVVhETGdJeEthOXkrUEYx?=
 =?utf-8?B?VHJtMExhQnVpbFRqLytzSnh2WWZINVgwQTRsdlVUenB2Y2dWeVliRTZmMEto?=
 =?utf-8?B?SS9NSkhzS3NmWXFwWjdBZTR4R2J6Z3JBbmJvZVRXRFFvWlJEakc2ZGt4alBs?=
 =?utf-8?B?QU90ZnpmSUY1enllRmtBbzYzc2tUL2x4Ti85cE9KT0FPMHRzK2xROG1TK3N1?=
 =?utf-8?B?VzdUZitjZ0xhenlmYkJCVE5wVmtZVTNVcmdsT0dsaXA0ck1NY0sxR2d0dkdN?=
 =?utf-8?B?QTQwL1Jhak05REdMelhsU1MvMmpPam50OWVGbHJoazVzc3cwSXU4NlE5OU5w?=
 =?utf-8?B?Tlc1dXMwTGVQbC9Ja2pudVYxckY1MFJhWFZVaStGcHNxUS85eWJseGVKbFB0?=
 =?utf-8?B?ZzZLMWhWQVh3cWU1Qk9zYWtLOUNkSGo2amZaVnU4amxzdVV3bk1hdWpjV1Rt?=
 =?utf-8?B?RUdGWmc0TXRPSnh6MVo2TFk2S254Q3ZUNlBsaTJ0N1pNZnl4OVdlMytqUUZG?=
 =?utf-8?B?QTNzcWFUeGdqUzNoTGtPdENHMXN1WkEreTMzWk54Q3NSTXg2b1gwaXBpTkgv?=
 =?utf-8?B?Q3cwNTVoRUcwd1c1OGhkbHR3UEpKZkowNWlLVjE0bi96aUFZbC9wQ1hHYnJi?=
 =?utf-8?B?TUx5Uzd4SGJpSGlGRzBXeGN1VmJoNXJaSGR3NU0wOGFKUEhRTXMyMllSeGJk?=
 =?utf-8?B?YU9vZlRHYnlzOVErQnBxdGdlTkZkNXcyRU5vRERhSGxJTkJud0dVNzVqbnVs?=
 =?utf-8?B?RWlpc1ZLbElqU1Q4U05qZEVjbHdxTWd6SkVWdkszcnY0YXdaVG5qb0IzWllF?=
 =?utf-8?B?dHU0ZVNDRktnNnI4ZGdwYitBRU1QenBabVVYM0NGcUQ0cWZoQ0JEUFdDMlE3?=
 =?utf-8?B?NStKbGRNZFF3OS94djdUc0Z0ekovWUZYRmlIK3RBUUtYMlJ1MWFkR2N2Vis5?=
 =?utf-8?B?bDZRNkZVRHZhTVdxc1JjekJucmE4cUR0YTJhV2JkWnUrb2RSb0VrS05MaWVt?=
 =?utf-8?B?VU8zT1E2RDljSFYxRUZxZjRFUnJkajlhTE0wTmNMZGVzZWtUOFpxVEVyYmpU?=
 =?utf-8?B?U1dyR2hHbWlNZ0t5ZGliWFlnbWczSTF6cVY4OGxQWTdmZzdVWkxpeGw4RGxw?=
 =?utf-8?B?TGF1M3dKMDkxR0l0RkFEOXhWVzVaVmw4WXA1enhDVlBXNTdoUkV1dkt2K2lK?=
 =?utf-8?B?cTJ3NjhIUDZHbGwwcTJ2K3Qwa3JFOGcvemhNY05ib21LVytMOVZJR1gxVW5s?=
 =?utf-8?B?dk1UNEF4c0pQUDhON0R3dUM1cTZ3eFphM0xvTFlOM01UREkzUFhSMU5SMjF2?=
 =?utf-8?B?ZUNGeUhZNzlHZ0RxY2ptSmZYSkZHNks1UzNFNkVCOFo1dm12RURXNUo2Tko3?=
 =?utf-8?B?VWFoUnNOWEtGbGdTMjZ2UU0yQ2NzZmdnUW9pTFV3UmUwT3luNnlyM0ZPNWUv?=
 =?utf-8?B?bGN2YlUzeE5kTjFMWjZLRkUwNkp0L0tKTXVtL05ZbGpwM3BQdi9QVk1oQlRr?=
 =?utf-8?B?UEY4MWU2YUJ4Q1ZyS3lTbDZwOWlQTDJtSW0rWmM3eDZpcmMyUFhuUkRVcnVD?=
 =?utf-8?B?dldYTzVaaEVzMFBYZjI1aFhjR0s5WVRMMFhDUi9rb0ZXejNhZU50RHVraDJ3?=
 =?utf-8?B?VGpyY0tqc1ArWitSeHFEZEVncFBvbEF5RFlNZ0R3VU1oanhHUG16VUNqc0pz?=
 =?utf-8?B?SERlNkxXbU5OV0tpeUVKYmt6S0ZwQzR0cEI1MUVIdXZObnhTMTBKUnkzOXBQ?=
 =?utf-8?B?WFNZZFZaakI3WElNeVlLdlhSU1FLN0QwZkp1Q1pYUXkzd01zM2I4TnRKMzQr?=
 =?utf-8?B?Qkwzam1obGtIc2MzZFRlS1pyY0c1dkNCY3NwUGRZaDNPZmJRR0RnOVVZdkox?=
 =?utf-8?B?VjlBQTYzdXYwVUVVc1dsQ1FGeXJLbFAxMXJBY0lMclV3cmsxQkh4dllvd2VT?=
 =?utf-8?Q?GPnD+t/c1WzKz5JtjMV56NuvdlszIJaYnhfxcanWjpw9q?=
X-MS-Exchange-AntiSpam-MessageData-1: g5eeLbL/Zk6eXheXGfLJQxvxZf01X9fR5kE=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971340d7-49c7-4cb4-b6df-08df04f42ea5
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:04:51.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImxzSM/jVuWR7GYOKtNmpaIw5wRB3YodGienprcB+HPv5cgeLzAFAMl6r9S+78AVAB3Y5ciNze3rL3Cx3niWqK8I/2UmYW6WR3P/aCc6wUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0842

In slow or emulated environments, the hardcoded 1-second watchdog
timeout in kill_timeout() can easily expire before threads finish
scheduling and processing events, causing spurious test failures.

Add support for KSFT_MACHINE_SLOW, which is already used in kselftest,
to increase the timeout multiplier to 10x (10 seconds). Furthermore,
allow KSFT_TIMEOUT_MUL to explicitly override the multiplier.

Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
 .../filesystems/epoll/epoll_wakeup_test.c          | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index 81a994943e12..8d5b15a09439 100644
--- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
+++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
@@ -40,9 +40,29 @@ static void signal_handler(int signum)
 {
 }
 
+static unsigned int get_timeout_multiplier(void)
+{
+	const char *mul_str = getenv("KSFT_TIMEOUT_MUL");
+	const char *slow_str = getenv("KSFT_MACHINE_SLOW");
+	unsigned int mul = 1;
+
+	if (slow_str)
+		mul = 10;
+
+	if (mul_str) {
+		int val;
+
+		val = atoi(mul_str);
+		if (val > 0)
+			mul = (unsigned int)val;
+	}
+
+	return mul;
+}
+
 static void kill_timeout(struct epoll_mtcontext *ctx)
 {
-	usleep(1000000);
+	usleep(1000000 * get_timeout_multiplier());
 	pthread_kill(ctx->main, SIGUSR1);
 	pthread_kill(ctx->waiter, SIGUSR1);
 }

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260828-selftest-epoll-timeout-0d47c17beaa2

Best regards,
--  
Florian Schmaus <florian.schmaus@codasip.com>

