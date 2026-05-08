Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022118.outbound.protection.outlook.com [40.107.193.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187912D249B;
	Fri,  8 May 2026 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257613; cv=fail; b=jW2+jeeom+83d66NQ0ARQJKPpLp9Hfx59O7rzvTs2aQ0RYDir9DYTRfPYmzkKEoBYxUUhNXk0/FDzWL6SFy/xcxecgurlQ9I1+cwTCc6eQPlkfiLRvhl4G4TK3evy4Yk5XyXlRCxt7t5DGa/ffGSV4BqN+tM5yzoVDKBtaii5mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257613; c=relaxed/simple;
	bh=mqbsZYUYdwTU6gBRiR03psW+LzPXmOkStUg05i899+4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RFCv6+aIuu5CWwp0W3zhBtD7olfVWgMSYK49n6FvNP7szYsjqVgx8fjd+IdEvB7bg3SFouobahQCu1G1sOr7MxQ8UWgwFE/7KQn7ku64S5mNewfjsYOzFZS6J5rJZfS+spi1COzFnmNUVmZIefgD1Loh56XRjimlmdNfKbE7244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=afktSzqr; arc=fail smtp.client-ip=40.107.193.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="afktSzqr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUeBHGPfJwP01HxJZMeqtGJkJLieCeEPEnZnLqY9zyUxn6FE8wqD+wWtimjdTJq+ls/IWkh/F6bENvo5b8JVSie6ET5WaVNGoDQMUC6UDvPQ9+wgdaezRguCEJ/pcSsmfI+ohLrOOq+n4sA9mazwyyFLMXu8xGhJT+kboz9L3v5Zrr/e4ayZtV/WgK+XcM04RUPN1+8fUVXCPhBksMbn2F1fhvXlNyuED57xfOVS0YhebQ9oug5u4Z17sjnu4BffTZ7VTR4UYgdz08nNsQPvGd9EAfDbzmAfBX2HsnKKgO4UyUd1KwzM5IjQBrbTxon/T6sljeStlKUCwfD9RXezRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plAu6rbxAMEaOqRY4xd1bXww1LEhz1wqxT2a74tUtPI=;
 b=Wj1I/KX4ovVyEf8vOsr9V4NSdBFCjlHY6mQzDRoRRxPSOFpUjbckdJcu6EacUWpyktV63yS+DkPxxPvlaWmTThpx8xh4hA1FXeqm//ho+k0gQA+9X3ktsl7Srf2iArpwB4vm8dbpC3kC8+P7X5zYyDjgnv0gJkcAsSBK61tKF1ogjAaXCUzW+AGoLHBQMWTJL6TF+65zuu3YcHnPVSgCHq1yoFNsxPoi9Il/Mx1UfZPCQBXNvmRrrkTre7wc9m0WFjzH30Vj8SNlTEEUjvE/PFTrimSvi73UP17q+8WTZai/OWA1r9oVwBMiowrwZgWqu0yYyr9V0fvk27xeJU1BMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plAu6rbxAMEaOqRY4xd1bXww1LEhz1wqxT2a74tUtPI=;
 b=afktSzqryVVLR5a/8scQEv8BRbTjWPm4KswFGbHJayng0C8zTB0AalkIDXSbT1tOzsq2t08i6Hb2q8ajXLqadGlPL8j0fNnwkpD2EMAcWX0MjOr5pk4Ek2k8p7KH6QmSZoyh8nzcjyrZ/50MRVMROUeBx8OdzmESJ8bs+sow+K/prdbSq/Bsf4euo/SCEJDTIhqwDdJeZQqSvaYgMNKsiy7zAUofH8Gf9LvaIChiupMtG2n/wYAgwCOMWt/O1ugiDzyB105WSFPkvJlKzqyvSu2plXCrcHpxMsZSyBJ8fIXg1Zbpu9JS/QBbDWMy81w2f0d8FIccY+b3dVW8JRMMMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQXPR01MB6430.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:4e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 16:26:46 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 16:26:46 +0000
Message-ID: <5616fbd5-612d-4c23-aa10-d6b8de81f9eb@efficios.com>
Date: Fri, 8 May 2026 12:26:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
To: Sasha Levin <sashal@kernel.org>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, corbet@lwn.net,
 akpm@linux-foundation.org, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260507070547.2268452-1-sashal@kernel.org>
 <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
 <af4Fwxndqv2knLov@localhost.localdomain> <af4LvqtLu-yeor-v@laps>
 <b14d54c0-0fe8-4d98-a2ea-2dd830cd5869@efficios.com> <af4N9_YOgDQziRCR@laps>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <af4N9_YOgDQziRCR@laps>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0348.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::25) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQXPR01MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4480fa09-1f7e-4ed6-b2e8-08dead1e992d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HaV0mYJC1Uh/d/EcF9JGsOEy8Ao1a2geutyTZWL01vTgScqvKA58hD8F8cjsWtoHC2fP0mOM2jthjzMlWw3kYz+T+bux1OsRD7V4MJHYoPLYc8PoA9e+O4rHzcQg6IEpTyLgG6eicXSN+QoUA8cPM+9pQERSf+hNJAaDlX0o/UNCLbTwQA9GOEhQNG+bqLNlqb/yyGtWTMQdXRbtfteL/ZQfaWqiayCZMmX3q89zuaKRI7eWkJsEDsUxnh6zHuS7/iXGyTjC5JT9OfSu5dc0I+huFxJzQ3C4lJqacbGfTzWTt8eNEZqI2r8cggX/AAgauULQVt7zGMUu5dy8Mi1OB5fKEEkRckdafLvEiYKXVCryuBi/AVDlXof/J1tKod0/7EJ3LHAxdyukacZFSjsqknvRDPlmx8eXFAE5RM7mjJhoBOuHxFyKBtDkFLmKXCCVcU1P9E31PoG/UIPeVL1p5Mug8y/ObZ00hnuwVmhcIsAXINnobq/tDXKnF1Fjr61Im11TaTI5CDZA4/awaoxtfkwol0/dmKYGFgB0aP+Uss69URU+ph8kdBW4hZbq/Cwmxd0DsZxFpDWLZqUiZwE3g/fCBApx4xvbQJOFh2gET5elRLVAS4pb6SIB/SO5Z3zvWmCSBJeDcPkcyTuCzg3bcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b05hcVNSeE1tcm8va21meCtrUTlZeWhHUTJ3TGc5NlNSQ0o1bFpwcDhORGVT?=
 =?utf-8?B?NzU2NC93UWJvN3daU0ZyS0tDL20wMVFiTWVkb1ZkTE55UlpUbGM4V2h2dFBh?=
 =?utf-8?B?T3duakFMYzdRV0YvUHk3Q09xMG9Pb3BNMDNHbGh3dVY4WEYva3NDeDhNa21m?=
 =?utf-8?B?M005dFlTdW5ML2JnOGJURkZnVC9NbGRZUlNHeHBZNWtpaXArZkkwemlEbEVz?=
 =?utf-8?B?VksyaUorU3lIKzJ5ajQvZlpzVjNhbXJJcDNnaXlEbG1rdXV2VG5BWTIxenQw?=
 =?utf-8?B?VlVMTXVtM2lxWDJLenRaSklUR0puUFlURW9HNERCeGM3TGloZHpweHdYTWpq?=
 =?utf-8?B?ZU9ReXBpVGRGUXI2aEN0eTQ0dnVtbndpdGliak92bCs0ZVlHM1hNR0owVGlQ?=
 =?utf-8?B?YnVZNStYNEl4T2dQNFVETkRxeEZTYkIzRXpKQSt3UW5zOVNyQUNpMXZrRjFP?=
 =?utf-8?B?UFVGTDVSWlJsMjJRcHVScmx6OW5OQW9CSFErUlhpdks4TkdMYTQzdjdLZU1M?=
 =?utf-8?B?ajZzWmlmdG9UczdHaG1rZ1VPNjQwWFRMS1NrSnEzRkE0eVA2LzljUmxaOW9w?=
 =?utf-8?B?Z1RTR1JXb0FmeXJBVjR4emNRS3FLaGY1dGtrQ1pMQ1YrMC9BKzdQMHlQQ1FL?=
 =?utf-8?B?cVpkcHkwanNSTEFyWjFwOHNTaUVpbVNnQ0p1YnVPU1U3V2l6c2UzZHQ5UEFC?=
 =?utf-8?B?WHBmMzZFdUJHcVE1b0dBS1c3dHV3RFRsTmJYVERTSVVPSmlyTnNpeHlsVUc4?=
 =?utf-8?B?bDlDMTJFZXJNL1A2c3F5SlNDdEErTWh5RTBuQmh6RFJxS01saFQwTXJSME1Y?=
 =?utf-8?B?RmpxYVloTlQvNm0raHdQUWZsMmwrdDltZk5FUXJjYUhua25QU3h6c2pEcTVo?=
 =?utf-8?B?dmJhb1Noa1Z1MFpQWXY4MU9pVlZMRHZLb2JvRC9wTFVBSVBjQzJsQ2lRTG1r?=
 =?utf-8?B?c21TWTZDbUNhZExRMmk0ait0WFphSnpQNThTYVhkaXdVNUd4cmZUV0pkQjVP?=
 =?utf-8?B?NEQ5OXNHOUxMSlhlVGxLcXprR09aTUtZNzFxbkkrS2YvWjFqL2RHeXVuZHVC?=
 =?utf-8?B?NTZqcm13NmNYRmdJeVhIRzlBcE1iMnBzbWVzekdGOTFmcWRhNGpuYmdQK3Ja?=
 =?utf-8?B?UXMySVp6eVVDZkRkb3h3d1pjL2V4c0R0U0x2bDZBNXBHcWtWZUlZbXJuNytJ?=
 =?utf-8?B?aGcyVllRd1lnK0JjRUNabmI2a3R5US95MmxLWVNjVTg1SUhZZkRLMFo2dGhO?=
 =?utf-8?B?aXdybkczYllYU0lhMUN2c05IS1hXUUVpT2ZjWFI4Q0RrOXVLekhzU2VSUkJ6?=
 =?utf-8?B?YmloREo3cm9DSDE4c0JmaENqblFZQmEvbUNWZWJLM0VRcWxXMkg5WjJTbDZJ?=
 =?utf-8?B?SnMzQnhPQkVZNjVRN0tmU3pOSzRCK0J2SlVRNWpEYXRuTkdydjUwRU9GL3d2?=
 =?utf-8?B?THdiTUc5T3F4TXNGVytZNzc1bDNiOXFaSVpLSHpyZzgydDJqSExubi9nY0gv?=
 =?utf-8?B?dDkzTm5SaWJZQjZZbVlhRmNYcVVRZEpZbDhGc2g3cmJyQ0IybDEvVnUxSDBw?=
 =?utf-8?B?RGV0Y21INjQ3Z0JqUlAzRHRkY25JWUtuS2dwaEgxTlhzenkxU1B3aG1ZRW5T?=
 =?utf-8?B?bmV4ZXlVVzYyUWpEanl5V0g3RGNGWENTeVRVdjhDTk5wUHRiQSszTWRobFAy?=
 =?utf-8?B?RjVyaEU1SGJWVHFITURTTHl3WEN2U285THdWcEJGMjdKQUJvaE16QURRemdT?=
 =?utf-8?B?azdpSnMvWVJFLzl1a0ZSUWNLRXAxaFVSYnZCTEcrUFlTci9RcjZtOEVwL1Vv?=
 =?utf-8?B?SXBOZTdWaGNmdzZ4NDNSSDc0ZCtxbXpoalQ0MHlHN20yQVdpRG5nNHk5Y0hk?=
 =?utf-8?B?TUVwemY3R3BiOWkzVnl2VTJzTi9tSDdKaWMyb1c0N0NFSUR1QW83OEEyRGIy?=
 =?utf-8?B?Uy9ieDF4UzI2c3grQW5SV2Q3WGtkSDQvUm9zcmJWN0ZlNHRCRE9xallCc2tB?=
 =?utf-8?B?Q3hFQm94UnJ5b2hOVmxnSSs1VmtacE94Y0tkSnBRQm1Fd3dZSHlrZ2RNaDJl?=
 =?utf-8?B?MVdLdzFpUVBzRVlhQlpJcW1ZL2lSSjFrSWdTQ3VYbmt2Zk5rZUQzaHhJZW5Q?=
 =?utf-8?B?cnFibktFUmxmRlNZMGRuMG91aFhhc2NwTkZ0SnB2QjFmY2o3dXUyQlAxNlFY?=
 =?utf-8?B?aktPamR2MHNScHlQNFB0eTB0TExmb3VYT0hkYmZ4dmhJOGFOYWxuZFNkazZ6?=
 =?utf-8?B?TXZHYkxHQTBOa3FybDdwK3FDZ25MYlhQUWQwa25KUVNraXRReWJTUldKdGJt?=
 =?utf-8?B?b01XdUNMZEljSHJsTnRqbGoyM1dTQmxhNzRKeVNXL0dMRVp0eFF2M0lTQnRO?=
 =?utf-8?Q?b0GrwcChGI68YIlNu9j+PO35KGKJ3wP9Kfkqu?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4480fa09-1f7e-4ed6-b2e8-08dead1e992d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:26:46.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSc7Zp7UtF35bn3QYwuamtU6SAiB0uzO9pAH/gKv8IhvtriMtOgOVEZQyqpLn1WRhmUOCHvEAtLyKt2VSurk03uSiJLq+Qp1VP3xe0oJ630=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB6430

On 2026-05-08 12:23, Sasha Levin wrote:
> On Fri, May 08, 2026 at 12:18:28PM -0400, Mathieu Desnoyers wrote:
>> On 2026-05-08 12:13, Sasha Levin wrote:
>> [...]
>>>> One possible approach to prevent "footgun" type of killswitch use would
>>>> be to first apply a statistics collection killswitch handler that does
>>>> not change the behavior: it checks whether the target function is
>>>> invoked at all on the system for a given period of time. Then it 
>>>> applies
>>>> the killswitch if it was not invoked during that period. Overall
>>>> sequence:
>>>>
>>>> - pre-soak killswitch for e.g. 30s, checking whether the function is
>>>>  invoked at all. (period would be user-configurable)
>>>> - if no calls were detected, engage killswitch, else report failure to
>>>>  the user.
>>>>
>>>> This should prevent footguns such as trying to killswitch fork, malloc
>>>> or other core functions which are inherently required.
>>>
>>> Why not just use our good old tracing infra? Set tracepoints where 
>>> ever you
>>> want, collect any data you might need, and engage the killswitch when 
>>> you're
>>> happy with the data you have?
>>>
>>> It feels a bit weird adding something like this into killswitch.
>>
>> It really depends on whether you want to include some basic safety nets
>> directly within killswitch, or leave that entirely to the end user.
>>
>> I don't have a strong opinion either way. I was just pointing out the
>> feasibility of a pre-soak sanity check before applying the killswitch.
> 
> What about doing this with some userspace tooling (maybe under scripts/) to
> facilitate this?
> 

That could work, although it requires additional infrastructure to be in
place (tracing) on production environments, which may not be the case
everywhere. In comparison, if the sanity check is done within
killswitch, you only need killswitch and kprobe to be compiled into
the production system, which is more lightweight.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
