Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021111.outbound.protection.outlook.com [52.101.70.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E01ACEDE;
	Mon, 16 Mar 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660903; cv=fail; b=Vkp9OdoxeYeN+nlIL6jr05x6rKYsa+i7TrsKwmU0NHbD+7sdusbDM5vFRCCjT/azYbhWd2NV/C7XxyZOLtOmz3efyc4AoDZ59mdP61lbcHkmi601zP76TYKU7t85ZvVu0RZBUJHkyL4Rv94oO8a/ih+Q0Uh+6i+DXV78TYrffvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660903; c=relaxed/simple;
	bh=pD4XdGBNSVCG5Fpvrh3lV/4xzeER5UFoYV1msrjHI8g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q06fB0o0FXI0nP0HLuqFHg/myn+rZ8+R3xLFqIIcUv2jYgfGEQ4mT7inpzC2Wobd9d6qzx4WyuCwbmzUEzmcSTBlaEZaV23lsjzdlLg8C5aklz6NIeD4A1edn1t8ik4jf8drxAhjGCJmVCt6m4daGz71qxv4/EqiRPFuRrG38yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=sz3IizwN; arc=fail smtp.client-ip=52.101.70.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="sz3IizwN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtXFy4bp6luk/l4Q8gdzgHObNh10/fZPPYZfCG8+rCfz5Pwc57Cx8XiAbm30MekKNrkUMNUHTrLfX4/boPqmMliASK9FRZ+3aZly4xZjAPXQ2dGqRxy8B10t+1J3KQxtWbeUcXs9/YenzLU+58+4the5qREXJqy07bMwpvyddeOItL1tLN30xCEY4K+dzHk2fzTO0rIUGYIhh58Vwq/0rpoDBKV0djGlnUoM4aKQziqZYL2NddsDP+uKziz+t2HCjzR5CzQ408o0bxeeyDyR0mTT8U5OZNJWL5MT/MY8BgMz4ju6nGxnmy+Wsm7YLI6mL1UnaWpHJV2lF03afUO5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBWWrEBvMRPLY93QvLkaI4dEfFqiZeZ4azJlNlZ6YT4=;
 b=ldQLfGQV9KdtjG6fbgkZZMOzNIYhB09GPDtIUsBnZ4sChAjIKg2U2wk58swA9GL3BLz3nUPC2+QA4fV6SvKzoF2xnvRT/mAlssOvI/ZdyWmfnBvIVBzcUBKaT/BuIZqPRtMRLN6+B6f8y6cvTO7Mb+3UNg2l/z/cd4BBCuuoFgV8eIYRAesqhPS/VhAjIvDk8dThYklGz5s0EbOaLSvMOjGe8FfDMlFIdZBtDeJ5QeWmsz80HfBvPqNAUXqhtwsaqyzXVXHMt1zNJO8Pdh4M6v0HC8lfj3d+RKx2AuK3U1rOUyYJ9w2GQAv7gvUSNE2NgvzkXlPep4v9TUMxO16vxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBWWrEBvMRPLY93QvLkaI4dEfFqiZeZ4azJlNlZ6YT4=;
 b=sz3IizwNVLvzmd0y83pkuyEzw9woi1DvSb8sR40kNxvbB+rrZcPXT2rzntuLEcoiIrnnO4hNzYf3lbCeembo+g1F81VuhoaCcm4MhBAV9+YUaTlDC/6Bohqp8CwBNJKn6bQo3PES+PY1CRHdsuiz/mF0s956HJDfT6TonZ+tvqTG8j4Sy6eMYrEHI0fhBUbHWdlarwd5WrGSLKhr0v10bufIV77hyNSz+yQ3RtUV0+24uXxzamPWEzyudPoby9m0MBpJg5OZiVnFSDp+QOGlm4gA96J2EIFwv9mTQ8fUu2UPBGe+gFNK8y59bwAzcrFxgv6N0SgMuzw/eYT2T1Psjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by AS8PR08MB8181.eurprd08.prod.outlook.com (2603:10a6:20b:54e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Mon, 16 Mar
 2026 11:34:56 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 11:34:56 +0000
Message-ID: <04c179a1-d3e2-4a87-a024-ce1b144f1b60@virtuozzo.com>
Date: Mon, 16 Mar 2026 12:34:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] selftests: Add tests for creating pidns init via
 setns
To: Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
 David Hildenbrand <david@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Jan Kara <jack@suse.cz>,
 Oleg Nesterov <oleg@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
 <20260313111014.2068913-5-ptikhomirov@virtuozzo.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <20260313111014.2068913-5-ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0401.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::16) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|AS8PR08MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ce27a0-bbfc-416c-0cbd-08de83500c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|18002099003|56012099003|22082099003|83080400003;
X-Microsoft-Antispam-Message-Info:
	0skyrMzeKUeuVmF6M/IpMMcqI5FXh+uJ/jT9ljxgdXiHKLSC3T6m9utgLOoXSa7HPmqdWOpL11evY5uL5fsKlFb+Epo5Sg1zUZV78AL17BvzszeA8/6WLOwB2BAyvdQgGyMN20swHzGogFef7iGKLiRSx5pJr0DshsJLbtu1eXJ5iFGjTYV6u7xrO6kcpkzTk59MfwssEJHhzDJ10s++XvdSsENHA1gqx00BEdYI5BkzgDWrjiVtKH2rBxpUG7ItG1vVNrEXwoGtbvVJkT2+/nU0AY5ClnBCk8dg6NBVZMjHP2lgfq+XYxf6C3hFQmGna5DkJBoQ6K6I+EnUbQJVjL4Clq5vI+KZQI+CZCCbk8ISFaeTYV5CzCO6U6DSeOurFvu4grKrsqhD29oyokTok6VBcoL9a8p79cB8p7xClheH9+xZWNnXBbSOGiNb1keEp3fd6zgHQrStDRnrlybFOybIeZzKDkpprENSHBMPFaBFQVAW+8WSsQhO3fhmyP/jWH0pBX0OG+ngX7FLEQPXMRKo3QXAOB14XfCL880nACwnmaKSb50p3xKQxNXzR2hZGqBSwZ5uOhZY/WZk6yTyl2kv77af182Lb+GUa1a0Vxm+8pgHNM/uV74D/f1LHmb699D4cRxgOiBUavj5GVDyF/Qd3mHifGvOrZ6P2xZyl8Al1jUkrv7U+b5omiFJZ81KNDpi+AN3++s/mxMO4h71xGkn1GbAIj55X7sMM+p8N8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(83080400003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEdaQUlpOEhRMGNyWHZkYVVpamVvUUttYnl1Z3IwQ0ZVVGxZRHZPWk9pZkh1?=
 =?utf-8?B?ZGdOQ24xLzQvNmwyZUJkWFZZYmxMendjazhiSVhPekI1UmlvcDdtcUJHWHRH?=
 =?utf-8?B?OUdzZ0N4VEFEUDVlR1oyU21GK1l6bHVvb1J0ZDFoaXhQbEViWnpzQU51U21i?=
 =?utf-8?B?N1p1VGtIejZBb1lXSFFORDN4Q1lRQlVOTzRuQUpiZVZHUGhMTEZmZ0tRZjha?=
 =?utf-8?B?K2ZrVDdPc3VnRlV5d3h1Z1R2dytVSWswalpobkVmS2pERS9CSyszcTY3MzhV?=
 =?utf-8?B?bkhNU3pmWGRxUU1UeTdITUhoOG5PTlgxV2p3UnJwQmR1cEhpQWFvenNKcUlG?=
 =?utf-8?B?WTZCRXAxWGFtZEVycUgvRTBoREo4MklsenhSNitPRDZaaFFSdGRzdXRiZTJL?=
 =?utf-8?B?Sk1MRWo3a3E2dHE0SzdOb0tmS2dyMk44cWNrQmxaL24ycXQrZDdQS1BIRWJp?=
 =?utf-8?B?ejdGbmVRYmttRHZ5OHd5cWNxTlBuNFhQYWljd0wzWmxPQ3U0Um1Wbkp4SVlW?=
 =?utf-8?B?NHBSUlMrNkVlemswSVoreHpuaHduZVBRTlV3SHRNc3g4NXJZS25QL2g0Qkht?=
 =?utf-8?B?YWJTNnZIWVBtblg0dThjM0dxRUxHSjRYVW1uUy9KTk9TOCtXQlpyTHZiZzNx?=
 =?utf-8?B?S1orcjBPSXhJSXZzRkNvUGhaU3Q4Y3lFMnYrTHdNQWZhTzV3Q1A0dVZacEJF?=
 =?utf-8?B?b09PUnNGZHJXR2F6MTBWaFFEeHlpelp1cmFQK3IrTzZzMWJrVk1pZFdlRXdJ?=
 =?utf-8?B?TS9zb2MvTHZ3Q2JDK2YzMkUyTEFPWnBvV0Q1TWpHRHN6K3FyZGZzUmNkeWds?=
 =?utf-8?B?SkYvN0ZkSUhXSmNRdXNJQUhqVFdGV01DVXUyMjgyS3lZQnBSa3FRRHRtdlZX?=
 =?utf-8?B?Nndxbmc1K3QvU0ZRbXRmNGdmaVEwLzZ2K1lNalArRk84KzNHVFlQdVhQa0c3?=
 =?utf-8?B?MEtpMGpxZlJ3S2g0eFB0cXFkYUhtQ2JkUHd2MGxPUldIWXF1ZXE2U1JHck9B?=
 =?utf-8?B?WmNQaldQQ3oydWV0ZHNUOGZTOWFLMCtrTlM0NVJiY2V5QkhkSTNrVnVWSGtp?=
 =?utf-8?B?cFh6d1lJclRpcmp2VmZ5Ym1rbWYxQ2lNZHVjTnpHQkwvWG9aMnZ6VXVJR2FD?=
 =?utf-8?B?QlJhQkh2ZnNTSlNCWUpWYWZpTjVyWDZDMHdQQ3p5ZEJNaExoMUpwYUpPZEJ6?=
 =?utf-8?B?eTA2Z2N5R1FONlNYZjRCTTcxT0kzeEVaeTliYUJCaVZCT0JlRmdLMElwMUJ1?=
 =?utf-8?B?WW82WnV6R1gyd1FSYTgwVFlZRldoSVVTSDZ3WURCdzhsMGtsOUhUZUxPVTFC?=
 =?utf-8?B?UjUzQ2lBcFFwVHM2L0Z4SXBSdjErQmVjY1RXcUx6eS82K1J4RlZ0NnJRczNn?=
 =?utf-8?B?UklvU0VzU21PdGs3MkdZSDNLQjRPdUhpNisybVpGeDQxVGs2cURmN2JEdzM3?=
 =?utf-8?B?T292cnUxY2NHd0RpSnlqOWFQYVRnaW1leHlnQzZ1QjVwSlB1dXZRTjdxRnNt?=
 =?utf-8?B?QjA5K1k5MjZLK1AvRkpHbWtLSndnQzlWWGhoZjJFSDJJSUx2TGRtRTBnTDZz?=
 =?utf-8?B?VWMwTmZDR3hNT2xBbVBmdFVDUlY3UlZab1ovN0ZTQ0doWHpiYmhpaVQ0YnQ0?=
 =?utf-8?B?RDZuKy9YbXJORmxXeXVTS3phUEtCQlFoVm9QczAvVFlvZHB6Z2h0emxpbGFS?=
 =?utf-8?B?NmFHZVM5VjQxUHpIYlQ0cXFyOFJqME5wZXRpVUNhSW5LU1VBQ1VVRGF1Nmtm?=
 =?utf-8?B?elR1TklhN3RSa3FpL21KbnBQR3IxRGVhM0xYWDh1UE1ZNGpuanA2ck1EU21R?=
 =?utf-8?B?b2l4OGd6ZExaeGI2SVJMRkJpWHFCODVtaFVqM2VOcStHVjJQSkZkb2oxTm5E?=
 =?utf-8?B?czVJMTJ4WUJwU0ZnVVpDVUtlMjdjRUx6T2FqZ3A2WVdmTVgrUWRJczhEODJL?=
 =?utf-8?B?MVpXWTlNcXBJTnpOdmVXQmI2K0tuSkg4STN6b3N5NlYwUHNaWHVFNzdUYVRh?=
 =?utf-8?B?MTVyTE5XdmRXN2hacFVYYm8zdE84akI1ci9zQzQ4dUVYZWdZK3UvbWZQK2xn?=
 =?utf-8?B?R2lwWjZPL1hZMzZVTlVDSDFWQ05wUTFVYUozVDQyNUhwWnQwUGs0K3l3V2I2?=
 =?utf-8?B?dEZDNVFOcUlPUGdxSkNiOXBaRzVIR3ZqN25Udm1hbDFIRGNUczJSYVliTWlw?=
 =?utf-8?B?U1hkV205cFpjb3VDYXdNK3BBV0VPdytCRWJpbU1OTEpaNUZIVTBmMHVYNXVH?=
 =?utf-8?B?d3NITEZxVmZIQjl1djFVSGRoaFJNRTZCTHIzM3VLZDBzK2pTSWt2MTQvZHZa?=
 =?utf-8?B?djd2bG5DY3VYZnhTU2JVRmsvbXU4TWNjOGV2Q0krMVluQmdNaGpxTlZxQ1JH?=
 =?utf-8?Q?ABCrPoY+7AYRh8rLYbhnMYgVDMx3VkvZ389EK2fWPCyhG?=
X-MS-Exchange-AntiSpam-MessageData-1: T34LkL1nAJWaoVNarktZmU3u0tZoQ8rkYII=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ce27a0-bbfc-416c-0cbd-08de83500c18
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 11:34:55.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iqz68zcTIZTmScHt3e7CdjOSpm8bKQvguFZ4h75BBRIM70NlLlSIMZKmW7PeuxZ0nqY7CXWnNXMNRn8zXhE6q0rqB1VndmzgKqiqJ/MKtOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8181



On 3/13/26 12:09, Pavel Tikhomirov wrote:
> First testcase "pidns_init_via_setns" checks that a process can become
> Pid 1 (init) in a new Pid namespace created via unshare() and joined via
> setns().
> 
> Second testcase "pidns_init_via_setns_set_tid" checks that during this
> process we can use clone3() + set_tid and set the pid in both the new
> and old pid namespaces (owned by different user namespaces).
> 
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> ---
>  .../selftests/pid_namespace/.gitignore        |   1 +
>  .../testing/selftests/pid_namespace/Makefile  |   2 +-
>  .../pid_namespace/pidns_init_via_setns.c      | 238 ++++++++++++++++++
>  3 files changed, 240 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
> 
> diff --git a/tools/testing/selftests/pid_namespace/.gitignore b/tools/testing/selftests/pid_namespace/.gitignore
> index 5118f0f3edf4..c647c6eb3367 100644
> --- a/tools/testing/selftests/pid_namespace/.gitignore
> +++ b/tools/testing/selftests/pid_namespace/.gitignore
> @@ -1,2 +1,3 @@
>  pid_max
> +pidns_init_via_setns
>  regression_enomem
> diff --git a/tools/testing/selftests/pid_namespace/Makefile b/tools/testing/selftests/pid_namespace/Makefile
> index b972f55d07ae..b01a924ac04b 100644
> --- a/tools/testing/selftests/pid_namespace/Makefile
> +++ b/tools/testing/selftests/pid_namespace/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  CFLAGS += -g $(KHDR_INCLUDES)
>  
> -TEST_GEN_PROGS = regression_enomem pid_max
> +TEST_GEN_PROGS = regression_enomem pid_max pidns_init_via_setns
>  
>  LOCAL_HDRS += $(selfdir)/pidfd/pidfd.h
>  
> diff --git a/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c b/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
> new file mode 100644
> index 000000000000..7e4c610291d3
> --- /dev/null
> +++ b/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +
> +#include "kselftest_harness.h"
> +#include "../pidfd/pidfd.h"
> +
> +/*
> + * Test that a process can become PID 1 (init) in a new PID namespace
> + * created via unshare() and joined via setns().
> + *
> + * Flow:
> + *  1. Parent creates a pipe for synchronization.
> + *  2. Parent forks a child.
> + *  3. Parent calls unshare(CLONE_NEWPID) to create a new PID namespace.
> + *  4. Parent signals the child via the pipe.
> + *  5. Child opens parent's /proc/<ppid>/ns/pid_for_children and calls
> + *     setns(fd, CLONE_NEWPID) to join the new namespace.
> + *  6. Child forks a grandchild.
> + *  7. Grandchild verifies getpid() == 1.
> + */
> +TEST(pidns_init_via_setns)
> +{
> +	pid_t child, parent_pid;
> +	int pipe_fd[2];
> +	char buf;
> +
> +	parent_pid = getpid();
> +
> +	ASSERT_EQ(0, pipe(pipe_fd));
> +
> +	child = fork();
> +	ASSERT_GE(child, 0);
> +
> +	if (child == 0) {
> +		char path[256];
> +		int nsfd;
> +		pid_t grandchild;
> +
> +		close(pipe_fd[1]);
> +
> +		/* Wait for parent to complete unshare */
> +		ASSERT_EQ(1, read_nointr(pipe_fd[0], &buf, 1));
> +		close(pipe_fd[0]);
> +
> +		snprintf(path, sizeof(path),
> +			 "/proc/%d/ns/pid_for_children", parent_pid);
> +		nsfd = open(path, O_RDONLY);
> +		ASSERT_GE(nsfd, 0);
> +
> +		ASSERT_EQ(0, setns(nsfd, CLONE_NEWPID));
> +		close(nsfd);
> +
> +		grandchild = fork();
> +		ASSERT_GE(grandchild, 0);
> +
> +		if (grandchild == 0) {
> +			/* Should be init (PID 1) in the new namespace */
> +			if (getpid() != 1)
> +				_exit(1);
> +			_exit(0);
> +		}
> +
> +		ASSERT_EQ(0, wait_for_pid(grandchild));
> +		_exit(0);
> +	}
> +
> +	close(pipe_fd[0]);
> +
> +	if (geteuid())
> +		ASSERT_EQ(0, unshare(CLONE_NEWUSER));

I think it's better to move this hack above to the very top of the test.

Was found by https://sashiko.dev/#/patchset/20260313111014.2068913-1-ptikhomirov%40virtuozzo.com

> +
> +	ASSERT_EQ(0, unshare(CLONE_NEWPID));
> +
> +	/* Signal child that the new PID namespace is ready */
> +	buf = 0;
> +	ASSERT_EQ(1, write_nointr(pipe_fd[1], &buf, 1));
> +	close(pipe_fd[1]);
> +
> +	ASSERT_EQ(0, wait_for_pid(child));
> +}
> +
> +/*
> + * Similar to pidns_init_via_setns, but:
> + *  1. Parent enters a new PID namespace right from the start to be able to
> + *     later freely use pid 1001 in it.
> + *  2. After forking child, parent also calls unshare(CLONE_NEWUSER)
> + *     before unshare(CLONE_NEWPID) so that new old and new pid namespaces have
> + *     different user namespace owners.
> + *  3. Child uses clone3() with set_tid={1, 1001} instead of fork() and
> + *     grandchild checks that it gets desired pids .
> + *
> + * Flow:
> + *  1. Test process creates a new PID namespace and forks a wrapper
> + *     (PID 1 in the outer namespace).
> + *  2. Wrapper forks a child.
> + *  3. Wrapper calls unshare(CLONE_NEWUSER) + unshare(CLONE_NEWPID)
> + *     to create an inner PID namespace.
> + *  4. Wrapper signals the child via pipe.
> + *  5. Child opens wrapper's /proc/<pid>/ns/pid_for_children and calls
> + *     setns(fd, CLONE_NEWPID) to join the inner namespace.
> + *  6. Child calls clone3() with set_tid={1, 1001}.
> + *  7. Grandchild verifies its NSpid ends with "1001 1".
> + */
> +
> +pid_t set_tid[] = {1, 1001};
> +
> +static int pidns_init_via_setns_set_tid_grandchild(struct __test_metadata *_metadata)
> +{
> +	char *line = NULL;
> +	size_t len = 0;
> +	int found = 0;
> +	FILE *gf;
> +
> +	gf = fopen("/proc/self/status", "r");
> +	ASSERT_NE(gf, NULL);
> +
> +	while (getline(&line, &len, gf) != -1) {
> +		if (strncmp(line, "NSpid:", 6) != 0)
> +			continue;
> +
> +		for (int i = 0; i < 2; i++) {
> +			char *last = strrchr(line, '\t');
> +			pid_t pid;
> +
> +			ASSERT_NE(last, NULL);
> +			ASSERT_EQ(sscanf(last, "%d", &pid), 1);
> +			ASSERT_EQ(pid, set_tid[i]);
> +			*last = '\0';
> +		}
> +
> +		found = true;
> +		break;
> +	}
> +
> +	free(line);
> +	fclose(gf);
> +	ASSERT_TRUE(found);
> +	return 0;
> +}
> +
> +static int pidns_init_via_setns_set_tid_child(struct __test_metadata *_metadata,
> +					      pid_t parent_pid, int pipe_fd[2])
> +{
> +	struct __clone_args args = {
> +		.exit_signal	= SIGCHLD,
> +		.set_tid	= ptr_to_u64(set_tid),
> +		.set_tid_size	= 2,
> +	};
> +	pid_t grandchild;
> +	char path[256];
> +	char buf;
> +	int nsfd;
> +
> +	close(pipe_fd[1]);
> +
> +	ASSERT_EQ(1, read_nointr(pipe_fd[0], &buf, 1));
> +	close(pipe_fd[0]);
> +
> +	snprintf(path, sizeof(path),
> +		 "/proc/%d/ns/pid_for_children", parent_pid);
> +	nsfd = open(path, O_RDONLY);
> +	ASSERT_GE(nsfd, 0);
> +
> +	ASSERT_EQ(0, setns(nsfd, CLONE_NEWPID));
> +	close(nsfd);
> +
> +	grandchild = sys_clone3(&args, sizeof(args));
> +	ASSERT_GE(grandchild, 0);
> +
> +	if (grandchild == 0)
> +		_exit(pidns_init_via_setns_set_tid_grandchild(_metadata));
> +
> +	ASSERT_EQ(0, wait_for_pid(grandchild));
> +	return 0;
> +}
> +
> +static int pidns_init_via_setns_set_tid_wrapper(struct __test_metadata *_metadata)
> +{
> +	int pipe_fd[2];
> +	pid_t child, parent_pid;
> +	char buf;
> +	FILE *f;
> +
> +	/*
> +	 * We are PID 1 inside the new namespace, but /proc is
> +	 * mounted from the host.  Read our host-visible PID so
> +	 * the child can reach our pid_for_children via /proc.
> +	 */
> +	f = fopen("/proc/self/stat", "r");
> +	ASSERT_NE(f, NULL);
> +	ASSERT_EQ(fscanf(f, "%d", &parent_pid), 1);
> +	ASSERT_EQ(0, pipe(pipe_fd));
> +
> +	child = fork();
> +	ASSERT_GE(child, 0);
> +
> +	if (child == 0)
> +		_exit(pidns_init_via_setns_set_tid_child(_metadata, parent_pid, pipe_fd));
> +
> +	close(pipe_fd[0]);
> +
> +	ASSERT_EQ(0, unshare(CLONE_NEWUSER));
> +	ASSERT_EQ(0, unshare(CLONE_NEWPID));
> +
> +	buf = 0;
> +	ASSERT_EQ(1, write_nointr(pipe_fd[1], &buf, 1));
> +	close(pipe_fd[1]);
> +
> +	ASSERT_EQ(0, wait_for_pid(child));
> +
> +	fclose(f);
> +	return 0;
> +}
> +
> +TEST(pidns_init_via_setns_set_tid)
> +{
> +	pid_t wrapper;
> +
> +	if (geteuid())
> +		ASSERT_EQ(0, unshare(CLONE_NEWUSER));

I found that the above hack is not exactly working in this test as later unshare(CLONE_NEWUSER) in the test will fail with EPERM. To overcome this the setup of uid/gid maps is needed.

Maybe there is some alternative way to mark this test only run from root instead of makeing a quite complex fallback for unprivileged case?

> +
> +	ASSERT_EQ(0, unshare(CLONE_NEWPID));
> +
> +	wrapper = fork();
> +	ASSERT_GE(wrapper, 0);
> +
> +	if (wrapper == 0)
> +		_exit(pidns_init_via_setns_set_tid_wrapper(_metadata));
> +
> +	ASSERT_EQ(0, wait_for_pid(wrapper));
> +}
> +
> +TEST_HARNESS_MAIN

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

