Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021085.outbound.protection.outlook.com [40.107.192.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB0331ED6;
	Tue, 25 Aug 2026 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787687032; cv=fail; b=aK7WAqZDGTHPIfc0E9Hwy/j0KX5DRbp2okeLOuLkd/TzRqIwlYy2KSML17ptbZaZLuEMcHhxMei22/Dp6k9dAQR+HdGRKqmVjNvkNQstf2BGdLdw3Y8XGROpRaU9jPGOPaXAu0ZHY06SFVpN1d3uP+pdUyKUInufXSlhruAzxNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787687032; c=relaxed/simple;
	bh=2XBybGBZdB41OetFPVweyZa1GdPkimtK0W8ZiNFx4Tc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M75o8J9wJTI/bkke+32enAIiZ6tFZbBE7z3FenQDJjGh4cPrxxrPF2pg9IQOvP8Mkvc+kDqsYNdQdMjLYJNAuAArwTHUNAo674Puko/cF9wk41SS/E3AZZismmcmuqOg7ltBWzTF5Wdbd3ThL3r30KA4WNB7S1Ne+ozla9fqfZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=XnU0u+uH; arc=fail smtp.client-ip=40.107.192.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="XnU0u+uH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTYtXBUq8NMBjyuOm6pvRZ23V6XcmD+iD86QANSqHweAiotINhs0nMS0cxoRk65hImfjQKo8ENX6olTC/xX6NpOahtwkT8JPR4/qjjL5dZVils0RKeOEv0djRcCAlPUakhQljJbIGqR9+MNVg99nZ2MIS9hYoyqKJpAtMqgRJ6stNQy40+aOc6FPw4CZ5YZ/C5E86+BRQz6pgB8gAzh8/iqnGWMU6KvVxXM5k5VMtJyWyUYXeAKdQab9diEnIPlE6NYZeES3Zd95haxbC0P4pPezhDwminDgOZDHvbzYYp7KXQWTblUd84BM5jtz5ecCnLj85Kz0jpDAMY+kkJTvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs0Lo3QmZ9i0wyCg4QCjO0TM7GQfJX4dZkLHoojS2Zg=;
 b=WcYxC//hWligz6qE+Jx0Ipmb9dzJmsdjzsM7t4dyOM9/h3S/EEJ4sXx8gmCYz1EIHHl1zeSPyHHqO6MFOZRTyjAn+/NsDmAfPJq7oBbAzYWG0ZKudXO8vP7SWtCldpkBETVDmRnUm2TxqGYfcmzfoB+4+uBdETIIIEY2Mls9p8Etj6F3kxuLpNbsWloY9LBmNUnauRJzeiwi0qIfKoC+EBqztisJ6X7wCHocl5daNBSvG2ngldxe3cjYDaLYN2fVzoBPRtrbeOBSZyeFpJjn6XuGWnabRwidi1S22z1Azeu9UCGuBpDO6TcJFdSafXktCnqCRsBQn37a892TgIzhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs0Lo3QmZ9i0wyCg4QCjO0TM7GQfJX4dZkLHoojS2Zg=;
 b=XnU0u+uHtHY5dEt5iuK8tbEHty0wRBoeitpweY6CuODl0YLpLSK2zPDw5SpNnC5Ef+8NeRY6MOO1b3X2BjDl0mlkQRSIi2MMqhNYmYibvqreXU+VKoYRmtkvtKMOH8CZy3BWypoH10ow6h6KNagdCSc40+0SMP+K2vlHWz3yKyBbs24qZd6YKnaMdfUy+sRMKrymJMHTEXegbpTmpi9Ll5VbkFc93aXW0S6ARe4Gb8BIsLma/PB5T2zAKLZQgtJXRexxsFy+tPKv7LDekj/VBV8l97wyLFaENRP+jGVSFm5hzMjaD/aJCXtbSetITgPFvYd7+EhKkEEsg/acwiqZpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQXPR01MB5771.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 19:43:46 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%4]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 19:43:45 +0000
Message-ID: <2a9807a4-9c0c-46b9-88bd-aa12a244390e@efficios.com>
Date: Tue, 25 Aug 2026 15:43:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/rseq: Fix circular dependencies in Makefile
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>, peterz@infradead.org,
 paulmck@kernel.org, boqun@kernel.org, shuah@kernel.org,
 Michael Jeanson <mjeanson@efficios.com>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260818155337.4774-1-mahad.ibrahim.dev@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20260818155337.4774-1-mahad.ibrahim.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::18) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQXPR01MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2f5824-d016-4723-cf64-08df02e12cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|3023799007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3KQbMU5GT2iRFcHnqSq9z8QJQoPS928dSZQRdw3TCTffKfaKJ6yGJflJs7w+PY8qP5UTbj4ECNv5UPEChiCo4w1va41yI/bhKF3RBs3TnzXWfVdhk9cYv0rkL5f4STobg4IfPP+EYoJ0j+Si+O7CmFki+bmMdPgXBs75QMdBZzuF6jIGTkXAMVQAP3IqxnDdTamvkn9lzpKxP75r5fHO3gsWP4CncWJ87Qq3oyYEIP+kHqwdTXZs9LnMwHsnPyaGOF6cwjnToSenLvNBntEUvMxaIJM9ZpT7DFmiyXSByoaCva3r3VY/Tulf0k1eNK4ZKeFkKxSo5HK+4TVRKskoMvu2j1ElussryuLxXHndMggXU6tmTIfmHzwuEm0kc+prfydKwFV5eKNbaqUA2+7OqNY0fuAw3re+4ASY4aj8qKGB8hOKQKWCHZyJFwtIn6MrwiISY7aShcxJqD6rGa28j5NKXs3N85HmUYO5uQVBQ10HYkBN3UwwuZD257bgOHVPvJftMgXX6yvYh7XWv3WjTsnOvSgYkm8Eu0uRzgj2bAIEZkrgsyOyE4KCDebCpLSRTaZriW9y63n+4WJLXUcai4xPbWGdQscOWyckYFEqbCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JlYUJxMGFwdWc3aHlZUzV5L3ppVWNMakZ6d28zMjBPQlUwM0trNjZScW5M?=
 =?utf-8?B?blBLYVIyMXRDcUxDc1hVeFdac0h5L29sOG5FVUtwbUlsZjlrbFB3OGNkSjhv?=
 =?utf-8?B?Z1RSYVk5eEZYZW1EeDExWlI2VTIwMkxVQ05WN1BPOFZrTmNXT2ZGblM1T2tD?=
 =?utf-8?B?eEMyYnBNSFRpay9ydTIyUGhOY3dsWk5vTStaK1lxM2ZSeVJub2JOdVhNd1h5?=
 =?utf-8?B?bEs0eHhhWHdueXdmMjJWejRzZlpMOTNuTmRrcnZiK0pxR2lXR1M4dnRvTXc2?=
 =?utf-8?B?dThYVWtxKzN1MjdMclBBaXBWUHdhQjNQRVlKNWc1VGU0MkhORi9yVWUrMHJr?=
 =?utf-8?B?cTBseGV2NC92Y2x1ejBUMnFSRDk4bWVqRzJZSnVsbDBWZmNzdlVTWW80aWt5?=
 =?utf-8?B?b1VNUUZ0N3psQlRBY3A3RUlRM1kvR1ZEWlRGc0hTQkxwNklGZXhYZVZ0aWpn?=
 =?utf-8?B?M3dsN3BRK3NubUg0bUhsRlArMEtzZW5xMkhrTXFFQVkyOWh5ZXBpVU1NaGdl?=
 =?utf-8?B?djZCb0o1UnlwK2VxK1VWOVF1QzBPb2s0c2pRbUg3eGxLMjVHKzFWOUZlQXRG?=
 =?utf-8?B?c3lxQ21NZ01OWFlmVm04cWJLdXJxend5dmxxbnNmR0gxakMvRndUeHFFV3Ju?=
 =?utf-8?B?VXRPSEtpNVVMUDBtQmNOYmtPQTNNL0xPU3BTY3Z4UlJ0cEZiOW9PaUxpeG1Z?=
 =?utf-8?B?dXVxUVNCanNxTi96aUROWFNDSVhveWd3QjczOFRlM3o2TVhwMUNGNWVxT3J4?=
 =?utf-8?B?TTBnSitPcTh6L0dSaytSRTR6VFhVNTV2YVJ2aDZGQXJDVGxQUlNSbENaV01S?=
 =?utf-8?B?ODhOUE5CZEtUNEY2bzNqRkF0ekJtRzFkRnVBY3pUdUNVeHdkcDlwbTBBZmhx?=
 =?utf-8?B?eWR0UFo3SzF4VUZoY2Ewb3c0d1JjWTF5NXlCQW1HdXVTdWJVd0NrbERKNFBu?=
 =?utf-8?B?Z2diWUZJYXVYUmxDZ2lGYitKOHQycGYxY01yOUxPbVdCa0hDUmhhcFpCN0U2?=
 =?utf-8?B?ODE2eTNwU0JZU20vNFNOUVlybVdyRjNDOWtaTVdaZ1Zld3RaUVlBckxoRWdx?=
 =?utf-8?B?YTVDWjVrSGRXWWVjRisycFZSZ3oxUTJBanc0SHM5SVlWRDRGQmJOVjIvcGY3?=
 =?utf-8?B?cUhXaENleTlMeTFqdmFYcVdReUV3d3F6Z2cvQ3ZpblVRcGdOYWF2QktBUUdi?=
 =?utf-8?B?V01GTkRKanMzZlljb1JDa1dIUGxQQndyWS96ZlBKcFRaZFgyQjNmeFI3MWtO?=
 =?utf-8?B?MkdYRzBmaFRHdnBMK3NTSWpJWGhBKzBaS2JLNEt5M3BwV2FVZEtHSmhkTFJS?=
 =?utf-8?B?aFRkbytmdG1qS1F2MDlGSWJjQVFRcjJTQ1dIN2xmSG45THhJQXVhdjRmVGR4?=
 =?utf-8?B?Ky80cmpkVjBpRWVjcnJmRUJmM21iRDZmL21xNGtvTjF3cFF0ejZLeDVwN0gz?=
 =?utf-8?B?RjJIbUd1RFM2bXduMHlaNEVhaEx6RURXRVFnUCtmQmVHQVUrNldBdTBSN21P?=
 =?utf-8?B?OThvdVdFRm5zTmdyak9ycWl6aklCUGdOaHlQd0llSTVSMG82N2RnNi9IYVRG?=
 =?utf-8?B?YmtDeEpoYStJUGlxVTBQMEN6S2FKcG04eUNuYWhRZGxzRC80MmlKZGVGRUJq?=
 =?utf-8?B?R1ZDU2dZR2wxdUx3QVJMRlhYcE9Ia1h3OVpjbGR1R0Q0ZFdBVXlXNGlaSnVH?=
 =?utf-8?B?UEcxVVFLbEkvaFFzS2NMNzFZOFF1Tk1lU2ZvZENyc2c3QUNocDJhRUU3WGZx?=
 =?utf-8?B?TG9lNkxqa1NOa1lRVFROSGNDWHF0L2tDRWR5b0cybndFNTVuY2RtSEJlWFBk?=
 =?utf-8?B?blhiSC9zeldKYXJTKzJtMnhYNlprWFlIcElNVHI4WVJmbjRIeStuM2EwTWZD?=
 =?utf-8?B?WmVKd2pjTlJkQWJRcTdMVXJYMjJMV3NEUnJTeEhSdWVNVHJmSXJMMGZFbUhx?=
 =?utf-8?B?TjRTUkMvTmU5WHdHcEJIaEwrc2dubU9GZWd3QWFRMHJJYTEvS05uZWIrVW9F?=
 =?utf-8?B?TVMvZWVkR2ZBUFhkV1U4ejNpc1RIL1N3cFUzZlR0elh2ejVEc2lCUDY1bXcw?=
 =?utf-8?B?UXFwbFV6WUFZcFArZzdTZCtZNFdCSE9obVhDa2dHNitiVGJkejdaYVpGWkd6?=
 =?utf-8?B?MC9kcmdZMTF4MHRpcHk2eFBVb3pnN1VhSzNleEIyTVk0RUJKangzSi9UaVV6?=
 =?utf-8?B?czhQWnRHVjlTZmpGeHVXZThMTXFHUElkUUlydFJmczdMUC96UnRtZlFJWDQ3?=
 =?utf-8?B?SFdNWUJIdm9say9OZElHek1NRTJtQlcvTmhsVysrWVhSNXVhSkRSbkxFVWdw?=
 =?utf-8?B?ZHg3d2xjMlZjV3l5akxiRXNZM1VVbmtMbWsyRXhHSzYyU0t2TUdDMzNUc0c4?=
 =?utf-8?Q?i1YZhnLIjxSJK9oBpus8MW1n/5+COV/vmFPuP?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2f5824-d016-4723-cf64-08df02e12cc7
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:43:45.3826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKW6smD/41zCIc/Faqx6C2wdhTco223psROng0d+rtk8jzq7TIPqt0FGiUYxIF9zYWcTXqWU2bXXGrEGRiF99TROZ9P0OrP5FHIdNor7zhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB5771

On 2026-08-18 11:53, Mahad Ibrahim wrote:
> TEST_GEN_PROGS_EXTENDED lists the binaries which are to be built but not
> run. However it is also listed as prerequisite for every generated binary
> to link against; all binaries only require librseq.so.
> 
> This results in the following warnings:
> 
>    make: Circular .../rseq/check_optimized <- .../rseq/check_optimized dependency dropped.
> 
> Such warnings are emitted 36 times in in-tree and out-of-tree builds.
> 
> Additionally, the generation of a single binary pulls in all of
> TEST_GEN_PROGS_EXTENDED as they are listed as prerequisites for each
> other. However since Make drops all the prerequisites which form a cycle,
> the build succeeds, but results in unintended behavior. For example
> building a single binary like check_optimized compiles 9 binaries while
> only 2 are required.
> 
> Fix circular dependencies and unnecessary compilation of binaries in rseq
> Makefile by isolating librseq.so and headers into a single variable which
> is added as the prerequisite.
> 
> No warnings are emitted after the change, and building a single binary
> only compiles that binary and librseq.so. Verified in-tree and with
> OUTPUT= set to a separate directory.

Adding Michael in CC.

Thanks,

Mathieu

> 
> Fixes: cb48828f06af ("selftests/rseq: Don't run tests with runner scripts outside of the scripts")
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> ---
>   tools/testing/selftests/rseq/Makefile | 28 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
> index aba6317f6cb8..9c369e59bb2d 100644
> --- a/tools/testing/selftests/rseq/Makefile
> +++ b/tools/testing/selftests/rseq/Makefile
> @@ -37,41 +37,37 @@ TEST_FILES := settings
>   
>   include ../lib.mk
>   
> +RSEQ_DEPS := $(OUTPUT)/librseq.so rseq.h rseq-*.h
> +
>   $(OUTPUT)/librseq.so: rseq.c rseq.h rseq-*.h
>   	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
>   
> -$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/%: %.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_benchmark: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_compare_twice: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_mm_cid: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_mm_cid: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/slice_test: slice_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/slice_test: slice_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/check_optimized: check_optimized.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/check_optimized: check_optimized.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
> 
> base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
