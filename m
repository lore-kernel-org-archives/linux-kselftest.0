Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020113.outbound.protection.outlook.com [52.101.189.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867D3CC334;
	Tue, 25 Aug 2026 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686537; cv=fail; b=NKbFAPHBjsFmpRVDE1F/ej36E7VAobLIWtM4zmudVf7o2toAJ+vpUQuzSp+6MDG+xaeO8TKU1Xc0cnNOP5KrQl54pjHXRdxUXBB/DCuexvqzZGGqBUYWD7Wl+SqGP2iGOhd8OF22qc0ImVvtOp/Br/iTPxqm/9xDgieaP1j14tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686537; c=relaxed/simple;
	bh=OZ9a45153G+GWCEHqE0HJ5H5oJ8ptKfOJIroU+Vbfmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U0wGbyp34jgMqi/wM/kuQmZ7OxwJYIFn/rLbmwO/+3GeYPZbiMLkQh38/4oHe2a5bXlgfutgYoNKgI7NYFaNCjEVBHAF7UA+tdCwu4Ld9sCZS7zn2zKbBAUrS4M36gSgPxPUFjJuZUrd6zwaLcbk/O577p9jwQ+0BhJvUC7QcSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ScDD+Ykl; arc=fail smtp.client-ip=52.101.189.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ScDD+Ykl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvEa/3NudgPlA3YkUfEqqnqjGq98PcIMLgCoXt9jEo715tizCmr6J86njRClsgo0rI+pSAM6lSd2sE3Y5d4Ose9Blm6RKStosmAjBq57kYcpdNN/zWT6xJ8N8DRYVSMRWSdlJFussUcu1VHQs0Ri3vK8nFL3l1Fohqn7MtoidrwVpLjCUjncJuMua1KDVss+gUn5kG2fwpucY2qd8RCz2gunnEvC7nI8DMVJzUa8hog0An1hDqdpL5BfnNF6NIhAzs667oM72jklr+4VIRtaQQ3dEw/fxplLwTLIAWknS0vXKOs7FP8brbd3EmtgG5WaxKk/lqa3unTPI5szX3/clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZFNTcZGqjuz4XAnAHf4NSNDLzBPRoAr9LgHtD+DJZA=;
 b=T8+blSzpzciHMYDtyU4vNRia1ouRLCKh5hO6g4U1lkhlUEx08+Z0rW+zXZB0ItJvd0EDFVZEHdiI6inTCzVwM+CvI0fxLmuUza3CaKn20Kk6716yjaGG44eqBPyD4izavtIy2PdQrzdLpPkTMz8NRUsISkJkWPr+V7ziTc+/bLDJBG+lq4Ew7WF5/Ew71VF5/7A+RIw9H5ZX/V2alp/TnVLHVfduwmVZ5ru13ek6P8ztX6BbkYhFZLnBaM21l3Vjzm61iRbxfe9HRPG4rfELszUOLpz6DBEKwhMW3wfGAJ/4Z5u7xoZMIfw8qNmrHAfRrzLdEhoWPqVVBD3Du0Hkow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZFNTcZGqjuz4XAnAHf4NSNDLzBPRoAr9LgHtD+DJZA=;
 b=ScDD+YklEu9kNSfbT/HM/dlZJr4EqNL9lolPQZVnMkMmt/OuC5hoVm7KZmIRPKpaXYZg6Wl6cFaSkkm7yRE7RR+MzX1tWIDgGsrpR+ahYbG14VlEWosrhS0xwSW1QK7n7rJEjEMAAG+i5tSxJ2qm5AKoVt9EtIFt0+CJ+UiWBI+AcpG9AYYYvNZ7zLqpG3m+p0m/BjVr2K+DhJd70kE+ulePUVHkFKMScrwsEMT+84t9IZYIPLR5WH8CqOlpYMTaMz2wAmz78AGPF3quZ/VUa3W5ocHTkvabO9Bsi0qV71ZawV/NKi2sMTDwI83xLbjLDE4RGaTsXzy950ZQWPJEeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT1PR01MB9497.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 19:35:25 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%4]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 19:35:25 +0000
Message-ID: <9b27645d-1f5e-4992-8268-b5b384bc6814@efficios.com>
Date: Tue, 25 Aug 2026 15:35:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/membarrier: Skip unpermitted membarrier
 command test if preregistered by libc
To: Andrew Morton <akpm@linux-foundation.org>,
 Chris Gellermann <christian.gellermann@codasip.com>,
 Michael Jeanson <mjeanson@efficios.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
 linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
References: <20260803124900.3328789-1-christian.gellermann@codasip.com>
 <20260803124900.3328789-3-christian.gellermann@codasip.com>
 <20260803133704.8802e73e1a212364e64f67ee@linux-foundation.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20260803133704.8802e73e1a212364e64f67ee@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::7) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT1PR01MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b839be3-879f-4849-f8fd-08df02e002f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KNX8z3iEDaDZ1D1cHNtfuOHnV5MohOb13n8i6ZUWJ2fkk1Upd+MNb92BlU1rsZGssiviNDbYlvkGgqgqZbkmSMOg17VshWNYrj308E2pjG8Hb+8yThedeybW+6wuMvNdctGooS2/vMWHQTGwOmvywjMcAlSTIMZ0ZaIeAUOc2wl0il3QuD+gZmKK4gGHxzKgaMc5isXYpzvd6WaLyHTYpmMJn6GiOxRsUf7oRDp31WD14IgkAqiCQTIp9FGV+i/AJZculk4uV8iHxJhsJ1WJLz0LX17uyLMvKkIyA8MsP+eOJaxniujWxDwmOMNQ8WW0rx8b8zHvkK/3gt742wsCBgxXUKurdLFXeGy/Omn891xumC4BY2CvZ+rsiC/Ky2iV0iljCEyOCkZZLNLluuv6ogLrx8HpidxHvQM/lchyyAboyR3LMpY0FNjvlYCAm+JEMvBKl6sCunWa6kg4Yk9C2ixFBegXHfUKBfGDzczUPSiSK2+DugSRDOmV92WtrdSWvhL4HMF1M14COMqz4a/qpJ/IhQzFv2g99f8IYz/TObRMU2XkGC35wTudM3ARlTf40/H6OjIFP6BHKse0XSdFErjCUKNY+/sylG9rgXBNenc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnFReUp3WURianRPOFhsSjJhVkdXZm9NWXhzSHpocjZaYjlSWnFRZUlZYjJG?=
 =?utf-8?B?K29GRU94a1owenlEQm1DdWd3SkpEWWIrUTZXVFhqekRsM1FYK0ZZQlkzeGt3?=
 =?utf-8?B?SkkvNHBoejI1bngwMklSK3hQNjZvUFp6SWtUcFRFZ0NKN1M0aENlcmh1SUZP?=
 =?utf-8?B?bm44cy9lVHBGYU9uV1FhYyt6TGdoWFozK0hRb055Rnp4V2ZmSmtwT21VZ21Q?=
 =?utf-8?B?cnJrSm0vb2ZyRm90Z29iblZ6RWRPTWxXcDN6eDdjdjZaV3lNTjRnUmJqdUZJ?=
 =?utf-8?B?cC9yOUlSN0s1Q056M2tlV0hhWEpjV2h2MFR4d2FtL2JraXdwY1BQUXg3UFhS?=
 =?utf-8?B?dnlyWnlSWTdrV1JPR09wWktDM0hPa3ZwbllZUk5KZVFDbkN5S2JHa29hVkU2?=
 =?utf-8?B?MjhYZ0VrTlFaTVFybDlxMWJ3NVEvV1kvcjh0T1M0MDNKQ3FmQU55b3RDRXI5?=
 =?utf-8?B?T0tYaUdJOW5HOGwzZnUyM2xLYXJxMVRjYm5ZQ3RmL01OdlJxUU8rU0tJaUZv?=
 =?utf-8?B?Nit6SVZXYSthY2dWMDJsUjFWMmd2aGczYXgzRkZmakRtblgyT3k1enVFeDcr?=
 =?utf-8?B?S3prVVllQktSVDMxdytubWgyYUdkUittNTN3WHlmbnlFOWRLUFhFdHROOENZ?=
 =?utf-8?B?MFEwV0FiN0VOS1UxY1d0c2JnZXh2VWUzakZ2VUhXLzNyNEUzMm5lU09GTkw4?=
 =?utf-8?B?NWJMVURSTkV4NGpacFJud0dhNHJqK3VmUS92eXhWQUY5eFZzVzc2bTY1bHhK?=
 =?utf-8?B?dDRJZldDcHU4bW5UMHNsdWVVT2dhTWNhK0pQYlgxd2dnSEJsTjZEOWc4OFNr?=
 =?utf-8?B?KzVYRjV4aTgwYUNLWjJUa1VnNXc5SERlYWxqdzFWVUZvZ3Q0dmtIcktha2sw?=
 =?utf-8?B?MzNxV29zWHg2S3ZIVU81R3F2QXR3c3JGTGRZQ3FPWVVSVktRZzkyT0ZqSjBa?=
 =?utf-8?B?bmhudi94bnF4d1BqUWNrWWVvc05KYUxLYk5xUUVLZEt4QjNrMitlZTBUVWVI?=
 =?utf-8?B?eGFGWTlKSEh2amhkNVZDbHJEWmFoTmhDRGFXQmV2bUFXbFQvRDc5ZjhZakR5?=
 =?utf-8?B?N2NOamJGYmJ0M0Z6Y2E4N2w2dWpXL1ZFRnptZ3gvZGpJcjBGWUwzWHVLVUhR?=
 =?utf-8?B?NG9NRUQrZE91WXUyemJHSU1oSk5ZeWVUZFFRaHU0Vk4vSDNyLy9nSklvNm45?=
 =?utf-8?B?cVNhRDBmS1NCdGNyTEhGYjJublNkN3pKS3hqdGQ1dHNmZ0p3VE83aTViVncx?=
 =?utf-8?B?NGpwcSt0Ymd0NFVUUjJlclZscFJFYmtDYlJHMk12QnBqTUJIaWlySDE5VW5N?=
 =?utf-8?B?ekpOeVlTY1llN1F2czJUYTl6d08xZzM2d1g2c1ZSS1hRWFl1MEpiVFhqV2ZJ?=
 =?utf-8?B?UWl4TFhPWW05WUJqYVJOcW93QTdKdkgyajYyMlhxSkgvSzhtUVpTeE9Yano5?=
 =?utf-8?B?QjRrUktwcGcrcktzaGdraTBTeWs2a3ozdjUxUGhpNGgreVlqYStUbkxIUFdm?=
 =?utf-8?B?ZU4zbDg1RmpQcTQ1M09IeEVOb2Z5MnhQdXI1dEIyNENvVVRHM1JxZ0dnNWFD?=
 =?utf-8?B?NG5yVWJQb09LNE55ZEpvRERBajJSS3l1S1NHRTJxYU9oNU5rRmN4cVRJRWJy?=
 =?utf-8?B?RU1GR2grWGNMOC9oOGRrZGVzNXFmSkR4MHZLbHBGZUZ4UkRjSjE4RVJqdnFG?=
 =?utf-8?B?TG1FWEYxc2ozOHN0MWV5eXZMWkI1WTRMOUxKTTNEZCtwb2ZjbVFRdnpWV3NQ?=
 =?utf-8?B?T0N2NGc1ckRmZzhhVlUycmUraWRVaU1OVGo1Sjd1bW00eXFYQzRWRzFIYXJY?=
 =?utf-8?B?TU9zZmxnM1REalBGbzNFY2hyZ3JUaEJzUVB4MUhReFNxS0pBQWlScUhpZlRJ?=
 =?utf-8?B?K0duR0tLekErcTR4M2JnKzFYU2tGNXZJTUNRMFM4ZVYxb3pHOG44eVMzM04y?=
 =?utf-8?B?c0FKdjNBSXhtZlZvU2hQOWRWS3k1MGo4WWFxYW5EVERNRlF3QUtZVFkweDZt?=
 =?utf-8?B?OWJxQ0c1YnNTb1hCcGdaSGlxaDNPL3htZGc5bVJXRlE1QjRKN0V6dnFvTkxV?=
 =?utf-8?B?eVJiOHFhM1BrNzNyeE96a21USWIxS2JoK0tlcnNLZGJrdlVzOFRuK1o5TVNS?=
 =?utf-8?B?dUt1ejBrMVdrcnpqTjgxazBDTlJWUkh3dEJ4ZS9yZzZuSE1NTDh0cjRaTXZX?=
 =?utf-8?B?YisxV1ppQ2Nwa1VlN2lwQlAvUFAya1Z6UC9kL2l4dzh3S2VXcDhqaTdKK0pL?=
 =?utf-8?B?eEJYVk4veUMzYlVjek1hRitWNDQvU290cCtLeFBWYXpTSHRydCtZNThJM1VK?=
 =?utf-8?B?NHc5R1dQMit6NkJIMVgvWFd6cU8yWitJK2kzNFpkTEtRUGc4cTlSbjRqVC8w?=
 =?utf-8?Q?hq6M65+2mMb2ntJ8=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b839be3-879f-4849-f8fd-08df02e002f8
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:35:25.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Shqjwuet5uk3pRx8MBPPqrx3q/KOO8OCUiARAUSqLOrBydcy/P6iKc3vcaVZY0MEO5Z1tpfNpIQ+a2y0a9wBe3D5NSYfuzORzYBqQ8EA7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB9497

On 2026-08-03 16:37, Andrew Morton wrote:
> On Mon,  3 Aug 2026 14:49:00 +0200 Chris Gellermann <christian.gellermann@codasip.com> wrote:
> 
>> On thread creation, Musl registers the private expedited memory barrier,
>> see pthread_create [1]. Thus, invoking the barrier command will no
>> longer be rejected by the kernel with EPERM. The test checking this will
>> fail. Check if the memory barrier command has been registered and skip
>> the test in this case.
>>
> 
> Who the heck maintains sched/membarrier?
> 
> Short answer: everybody I've ever met.  All are cheerfully cc'ed.
> 
> Perhaps finer-tuned answer: Peter.

Adding Michael in CC so he can have a look as well.

Thanks,

Mathieu

> 
>> --- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
>> +++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
>> @@ -113,6 +113,16 @@ static int test_membarrier_private_expedited_fail(void)
>>   	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
>>   	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failure";
>>   
>> +	/*
>> +	 * Some C libraries, like Musl, register the private expedited barrier
>> +	 * command when creating a thread. Expecting an EPERM on an unregistered
>> +	 * command will therefore no longer work. Skip the test in this case.
>> +	 */
>> +	if (MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED & membarrier_get_registrations()) {
>> +		ksft_test_result_skip("%s test: Command already registered\n", test_name);
>> +		return 0;
>> +	}
> 
> AI review
> (https://sashiko.dev/#/patchset/20260803124900.3328789-1-christian.gellermann@codasip.com)
> thinks that membarrier_get_registrations() can return -1 on old
> kernels, so we should check for that before testing for
> MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED.
> 
> Seems nonsensical to me - membarrier_get_registrations() doesn't do that.
> 
> And policy (my policy, at least) is that selftests test the kernel
> they're shipped with and anyone who tries to run them against any older
> or newer kernel is all out of luck.
> 
> 
> That being said, and stepping back a bit, is this test testing
> something which we would test?  If pass/fail depends upon deepest
> details of the chosen libc flavour then perhaps the whole test was
> ill-conceived.  wdyt?
> 
> 


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
