Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921749;
	b=sEuaFR6Gd5MSdStRSWac+2LII0GpaQDww8h7MRa7tA0jNx8+JeIfFrpd4R1Oepeb/mtq
	 gNbeXr01Zrh241M8MuApcZg0nAVjHo0ImU82kzWTsuIv0qfM5Kosx4OfSgMBt5IoQ0Qe5
	 b8V1Tplic8QQNuJyZil1oNYJ/WNl4mcAZv2VybtZwlvIQISWskJnGQPBbnN97dBpZwSQU
	 kmBYEZjtGvc3deujF7MERhu587AlQ5OWFCrAv8OfV2wHy35b6v4ImfJyjrj3aqID9qJ/8
	 NIEvGzlFR8YDeRXzqn9IGTHkdqt6wfcDOlPk3WXZPmGp/z94llL+//kCIp6LxqWwvgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921749;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=33qaQ4771NTprzqfLHANMa3dcM1F/TqW0EurN//O0S4=;
	b=QykzuLuZxozk8DvIpt8ch4XD3lsnH8PGlUI1Dg8uDcG5IQy9OW6HHhX6YpWz/SX+P3F1
	 9JVG5ar/5X4uk2vgzBCQQ92rJHtO/a14HoiCbfw08pMHAA/mwBXmnrirmxonAw1dfVfio
	 DX7paIBBsH4DxODmAxO1scib0+1ZSf2Ixpu45YOYg6epZNUpns1ur8h9/9kYUjvxGFIVr
	 sRPWPMIdsjQxccXuxCE8ohYUpHCTD8eMnMLkZNA1qXxFt3hv3fAkR/N6uLOGykOLtXjoA
	 UWox47I/sWvLB7YIIXSku0w8NjNWmNeWYIXns/ThzcOZMtcSe9UUTxtJrrqzq87zWng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b="t3EC/v44";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.130
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020130.outbound.protection.outlook.com [52.101.191.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C6606A333;
	Tue, 17 Nov 2026 13:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F06C6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=t3EC/v44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2GT7TXoVtbLAyvexDuPGXzvbK3lkXWP9R+gipidtU7F2kRQyx2N+61HhvS5AfaaofcncQTcD8n+H38w/FtmAkPz/NFm6Um9heVPsrc6HUb8jqCASBvew/hQY/RA+aA6BaRB3aHI7inAyd4fnoElLOSic3ZO8Ukfzi8cQSj6I1bSZhIbwRna8SyPjCoMKzkadbKw0KzEAah8TbXMd57Xuqg3OdeHYOAc6SFneGsP8gU3xcjvCEH74+1ppM7jKyPf+iCwAxkWIoHAUUN2b8PFDGnUsXZcnyQJbQnDkW9LDUVl6rhnU6VUS1o5E1LGLrB9Lh70jr8sw/E9bOoGeFQaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33qaQ4771NTprzqfLHANMa3dcM1F/TqW0EurN//O0S4=;
 b=B5vFc8yMc2q1YirrHswgeea7iZYghNBl4LKXZ4zTsKuAX1n608tALoUf3BkT/kI/GW9P3TsyFpNkyEKnWlEDcgKhtAspcdhGlxKgf75smaK8ZIzO5Sn8Idr2o53Kk/8Uns0szuVY48GXYqIybKj9zw1i7jVmNTdtlWU7xQals/8QaoSQdzKRIII9q5cQpiKnwWaK/1YjimnZ/Sd3XfrviMvKB5L6Ip41wOwfT0LCQD9Cr/4AQh/QlAZRxmaaEwwZSsYUc/fQV9+DToY1h++MOW+7gXCqVT7BSSOzhNKmB6KMWF55B11F2EOHSCyWpJe7NE0OT2bQKWRwqySXpwyHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33qaQ4771NTprzqfLHANMa3dcM1F/TqW0EurN//O0S4=;
 b=t3EC/v4400AOaxDPP4CSENgtt4Gf+4YuLSiAxSVC4AellMQHgoJFT2wW004U2Nk/Ye072QAUfenvTndYikoonpTw8EO3ARhTSPt32w1eyCqz5R8+cxXtonm4DWpc6cD4d6cL7ONP4KmDnTXmMsId7GZRp0YrMGZrwMk5gRblIyNicu2Ok2BTLYHHsfUzpNRMaEwqHDnLzpiLzRQiKHOn8fMx2q0pc06SQkBs65+31D+NZG1ZJl8Vb2pY4rcK0dBqI/lKbcyvPMPg6aYZaC/nHCkpu8SM6RdmrD8zHlECpsWPT9wQY7fy/IvdP8G+pefXFZ0VEl+EsZAGXKCJu3SZHw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQ1PR01MB688080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:cf::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:22:25 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:22:25 +0000
Message-ID: <710de08f-09e3-4dea-a5e2-6c2c55522161@efficios.com>
Date: Tue, 17 Nov 2026 08:22:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 5/8] sched/proxy: Clear blocked_donor when the
 donor stops donating
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
 <20261116192638.233125-6-mathieu.desnoyers@efficios.com>
 <CANDhNCoQteppE0ERWyz2LJ4PBLBKQymmzzbKwrxMwv1sAL4VPw@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CANDhNCoQteppE0ERWyz2LJ4PBLBKQymmzzbKwrxMwv1sAL4VPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0320.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::15) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQ1PR01MB688080:EE_
X-MS-Office365-Filtering-Correlation-Id: b87285b0-e5cd-4155-7728-08df44add1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|261022105027099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hG5+xMppIS5PVjBxm5GcwFLalcUnOMAxs2GQpJ8YnET14NUDCeqU+5/QqjbwWpCu1qWURkVdtAGFbafrJT/L0Wj0KvCfVWi7xX1P9VCTUdMs2INmuzjA2BymtDFL5bSX7Vf0auTW/XNZi1WOiDxUisqLK43rhTFxYIkd3K2+SV+kax6aFsyQoxubYFpViG4ANj8swZ2BWB34s7Rgg9VcnFGVc/37qsoRe6EXcW9lJYssuJsLwRt537rJ8Vg4BAM8Ruwu1g0L9EC8GSeIoUgDQ3PezNUVjV3W2no+WAO/EG35PeJHyZ0psPkjIwPR9BNxRcQ0Y7EkOomT+BEgHPvQyG9ataiFilWgVKdm8w8GyIDPm4o6/FNrJyt5dHNq7F8C7wxpWOWMZ3POEgYAb/z7XEzbzXe0AdmzR0RHndPynft3bN9jVf52ItvWZaJI2B8Jb9SeAXgaONKn9FU7hyG9ZBnO5M54Tj5x4A1CypBn/63e8hTgxEgE9LSAw7vXCW4AK/uNUUkbA6z7HsA8/l4IHiSPV55xpewD3x7i1C7o6tNi819qsezmxcmyQ4iYnE3EgUckEru5T36R9Lwaz/U3242tyFLe3QWKgXnsCIa8M/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261022105027099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXBZUFJPR3hWbDdFRnp4VERDOXJLR3pQWGZqMkFoV2VKUm4xWGpqQW1BUnlL?=
 =?utf-8?B?eURDNTBqMHNROXpzU0RCYTBuWndCd1FuVVJNVWxOQ3QyZ0ZDd0pIME9ab3VE?=
 =?utf-8?B?blk0cjNSdjMvRXUxYVIwcVdFZ2tzTFNya3RMeThlMndJWEswcDBZN3hZUEJF?=
 =?utf-8?B?MkhGRFZYSUk2bnpMNy94L05rT0FRSUJzSVRKVy81eUZ3STcrNTRuRXRJV2dO?=
 =?utf-8?B?Z2FucFU0TWZOajVXUjdYR01BQ041OGdOaVBjbHA0SGtUN3pmV2Y5bW83QkJ4?=
 =?utf-8?B?eDdEY3diK0pjV29kTVp5Q2kyK2hzTThDQmtkQWd1OTRHZ3dJVHg3VFA1RUZK?=
 =?utf-8?B?TnJaUFpxQ2NBVjJ5Q3NVMklmYjNyUElnNXpuY1lPUFJlY1k1Ty83RW03OHlm?=
 =?utf-8?B?NURRYXg0azBSdk1xWjJnZWtyQ3BSUnBJY0huY0hiT0dBMXpuLzU1aE9UZmM5?=
 =?utf-8?B?U2F5MzBEMk1LQzcvTW0xNDdod09Qa3c4Q1RnNmxReTBYMkpJeTNLZXpvZHQz?=
 =?utf-8?B?bllrdE5VNTNLakhPOWZLcVQxYlRLYktYV1hDRndxWmNTV1VXd2pFQ1lYMGtr?=
 =?utf-8?B?enFuNGhaR1JVYVV4ZERkNm1CNjMvRmdYTnN3bksyY0FUb0V6WFAyRnMxcnNO?=
 =?utf-8?B?eWJxR1BjZ01DbnkvWm9Ma0dsTG5CS0wrSG5ZQ1FvSnVwVmpNTEZ3a1k2Qkx5?=
 =?utf-8?B?R3FDbHNYSVJDVkl5N2FvYTZDU3M2QkNUOFdkazFLd0hqRjNYM3B2TjhZZ1hs?=
 =?utf-8?B?SDBkSzhXdGlxalJSRVY4TitQTEJoVzZEVDJKZHNqeFNGaEN0ckxBQ1k3azlZ?=
 =?utf-8?B?K1FQUllyM2JpQzJFNlNwUlltUFdLM2ZoT0dnTjJ5N2lieUJ4L1ByTEI4WVRV?=
 =?utf-8?B?M25NR2p4MENsajN4YndBV1RpYWhCN0g0OEZoUVljdlRObEN4UHNKVEUwQlNQ?=
 =?utf-8?B?WEsvRjhCcTZBcEFQaTJmd3NUck4wemkzUGs4ZjdoekZ2NVA3TmdvYW0wSWY3?=
 =?utf-8?B?T2dzU2JpVGJaUENHR0lhelozL0xqWXBLdm1Nc095NW9qSUphdGhWVkxZdmlI?=
 =?utf-8?B?OEJ3QkJDaVphQzg5blVrait1TGRwN08xV282dTE2MlVXM2F2MnJ1OTRaMGRS?=
 =?utf-8?B?MkFqdWJ2MXFoUUgwSU8zUFVvMXNCc1VObm9LMFNrSkJjZ0ttQWV0QVVLV2FP?=
 =?utf-8?B?emRyN3BUZTA0Q3c4UW16cXBWY1FUZ2FYSGl6aEJZdWprNXpLZHFaZGhQaHFq?=
 =?utf-8?B?cVB2QXFITm1vZU5EZ0pxa3Jia3hqV2ZGcE83MzJiZ1Nrem1yU0ZiR2VJK3dU?=
 =?utf-8?B?NDV2NEtseWpWY0Q4SG11czRWUlNFSHBlWWx0NTg3V01iUXFUMlZ4Rk9GRFVz?=
 =?utf-8?B?M2FvMHJyYzVPUjMrOGdPZGlrd1RuK2d5cVdVeWFWMmhDN2xlMXN3RHlORGpL?=
 =?utf-8?B?Q0hYSXBOYWUvSWM2TGJOUTNFQWM0REI3cE5aODZBODJuNytkZVpIS3B3b0pO?=
 =?utf-8?B?VE5UVkl2RytUUEE5YjV4WW1DU1NzNTNtdHM5VUljVzZiYlFtcTZLRWVjRUlB?=
 =?utf-8?B?SWtUMFRQRFBOZlNmclJwU2FNY2J5SWxGZ3duR2ZnQXg5NGtwY0xLTkYwR3Vq?=
 =?utf-8?B?ZDVzWE1CZk45RVhod1pxaFlFaU5jcm9JNS9kTTUvZWp0ZGlqQStaek5JUVhO?=
 =?utf-8?B?SGNzK0FFODBvM1FhVmRCUnppd1lqbXRvVE81cTROZjBJRWM4V3BDZ0NJUjFK?=
 =?utf-8?B?VG8zN0FFa0FqdTc2cUNLSjRxWjdvUmlURlk4eXdYZ0lQdDRrektiMFRaT25L?=
 =?utf-8?B?bEVLTE1GT0MzeHNnVkZHY1htT20xV2VaVkVzMUc3eERYTytWZTBLSC9vNk1X?=
 =?utf-8?B?bFBTVEROYlhMSXRqYUtQMnVyS0E4ZUhXWGxKOUpMMDRDWWx2UjAwQzF5M0Zw?=
 =?utf-8?B?akd5K2lWRDB4NnRLdGE1REZweGZzNnhrZWJ4Q3ZPMitFQUMvaTIxNUlPZkl3?=
 =?utf-8?B?N21lOTBtZVBEanc1Q3hKRW8venBOdlF0YlRrUzYzWGZKOWpRTkVRREgxVXMw?=
 =?utf-8?B?VXVickFiWmJXSkZ1YXY5clBGbVg4akhVZTRIbFVFZ2ZvUmgwUTBmUFIzRjZq?=
 =?utf-8?B?cUQ2VkI3R2t2bmFnVG1WckdWbGNLNSt5QXRxRWpNSlZrUjRCL0JwblR5VXhW?=
 =?utf-8?B?MDBYYVBlSGQxVXdCMXd2aXhnUE1adWFmTUdicmN1MFZtSDh2RG00ZEp3OEth?=
 =?utf-8?B?YUx3U0tZSUNTSUQxd3E1M2liODVnUW5ib0NPUzF2U0xMaXdjZTBWc2ViaThV?=
 =?utf-8?B?VmVSdFQxZndQMW1TV2lvcC8wMm1VcENlMXNveTY0dTZUeFNqc0xqRkcvRHMy?=
 =?utf-8?Q?B4NQidynxmI+nUT8=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87285b0-e5cd-4155-7728-08df44add1f3
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:22:25.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Yrrygw5JhEDBZdysHI+3BrveldJSPQFKchBFzYpPrCipJ8qHCUZOZkyxJAEqtshP71sJkAZ3sYGDGE07UiKmY05uJKfaJEg95bSjoG5xuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB688080

On 2026-11-16 18:16, John Stultz wrote:
> That said, Its not immediately obvious to me why clearing on
> move_queued_task() is needed? Mostly because: why would a proxy
> blocked task be migrated before wakeup? If a proxy-blocked task were
> migrated away, __schedule() would just proxy migrate it back to the
> current lock owner's rq.

Another task can move it. For example, sched_setaffinity() on the
donor: affine_move_task() calls move_queued_task() for a task that is
queued and not running. The donor is then queued on another runqueue.
If it is woken there, the clear at wake-up runs on that runqueue. It
does not see the owner. The owner still runs on the old CPU, with
blocked_donor pointing at the donor. Your proxy_needs_return()
clear has the same limit. The proxy migration back that you describe
only happens if the new CPU picks the donor before it is woken.

> as you mentioned there's no test case in your test for this logic.

Right. It was found by reading, and I did not try to reproduce it. The
owner would have to stay in the kernel without scheduling while the
donor exits and is freed.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
