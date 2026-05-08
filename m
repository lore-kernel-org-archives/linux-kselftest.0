Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021103.outbound.protection.outlook.com [40.107.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CF2E7F3E;
	Fri,  8 May 2026 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257116; cv=fail; b=Ztljb8HFXpVRvWtLTPfpTIeOZkMkvSOt/CznVD5yKbo86QAXlbCfP0mYJNstXugpy1aUmdRPxiB5HBqC8fqmHpFWMLRN+cpkpB2z052EuFeqrd7pgpueQuxa8y8S7cgDtkMdJnLHCpdcXNt/sasPYdfPMURaPWE2dRR3fb+ilhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257116; c=relaxed/simple;
	bh=D27K9LqSYFGLIZvgXiYS81SxQcGmTFhNUviP2A3I5Ik=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gecDYpBS1CAq1xW+Qk5pO9JlAQjp4X//ICV8Z2sgn6wmQz0u4q0Y0ByTCMHYM8Sa2hgNvzo/vo2KvnVSjp08sAD8o2DLh7oEk3dUssYPczosVoLw70CppkKsWY8+rwmIq4DkVxO4JOlvzY+JGtKtS98Fle5RddefauyNKOZwU2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=euu1j0wg; arc=fail smtp.client-ip=40.107.192.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="euu1j0wg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ten7zlkJdbRgzHL4sDPUcglYmjqYU+NIf5KqZYslUmm75fTD+xxPbsAktPhrPrzAjS7kmewkNGngP2X5aJ4CvyouQPIo2Zfn7kIX4o4NWp4XSFrt4qgTtGJ2EJ8muX6ICjezAy8mRO+W0jNQPDMOFoYX+XOP3keVf+OH7YHSNiE+G7HHP/Nskx8JPE25QpoXv1QrJSr3GM9wbspL9pzoZvpwU3bT1B3Rha3ZUNt0LE4TvckqfyQED2NdVafkLXhxq9b6HJ8mYTD1rk9o55KMzDOY/OLeZLKskZwVB4vTTl1o5w0qVJm/A4I4u757P55efNhYwRRoOm7pJgnF+dRqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UZ0k4Xal7fH5VxvEQyuYBP7vn742YyiQ2VvPczS8BM=;
 b=SpRyvQoTSIJBQk4tvXwdX9exeBFscSjkUnl20O+X+WqnbQtI4LQgwoqixE+H9ShNZnDuEZPLojvHyU8oVKFr6wDHvjNvq+c2k+nkWn9ySM0EBLi2xGiMDxlA00fA2wHs8Ai8gp6FXIrjNbhf01iAs0EJ6BSSAb1qcehUxtg/9y6n3514ivSrk9H0/2S7bVO/bLjQ5GSO+i+/orlGo4G/+8gqjtqQzciCWInx5v6xX5WpuABe/bXX/9AsyVCquw1MBkfZ0QW77X3J1VkaXQZtEXgwE+oZyWR0W2kaHBeN61XDOzqGJ0qkSA9RTBfxpKGg0Mv/p9UsKjtbdrWud7b4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UZ0k4Xal7fH5VxvEQyuYBP7vn742YyiQ2VvPczS8BM=;
 b=euu1j0wghyXed0Dy2ZbP9Sg3OZMnTYXr5AW4LbSVpztnNMPso98LVbz3s+HtE88UEsW9bDWprqmHzr5odVOAcgShbqCMrPgGyx/PQqGyShYl5GD1D9meDZXtyoumftT6III2U4+lZ3x7doXPTLIGa7UMRh3k8LpYKipt5WP94wDMx2r6bqPZiVim3OO/Shw/Prxh3yCvf+bpBD2iZZ9Ji5lruJD5T7I5dLr22LKR0EQ6+Kincaq2DOWXv7uTNyIW/2MYj2+w3aPOkEmqwhJ+7UqcWpQI/u9NLDNuJGkkoOx90KwCGOCPuStJ2vzudZTYsT2zdkqIUQsC68FVBrqJCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB8397.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Fri, 8 May
 2026 16:18:30 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 16:18:29 +0000
Message-ID: <b14d54c0-0fe8-4d98-a2ea-2dd830cd5869@efficios.com>
Date: Fri, 8 May 2026 12:18:28 -0400
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
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <af4LvqtLu-yeor-v@laps>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::17) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7c9be5-4cbf-4d72-f153-08dead1d7111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	H53EaeQ2+l1qYfCVf/R44xZUPqOMoeeRJo/X67ZQz9SFYgv5fob0E7euIdu2CuWgU377HIJE7hMq4bcWld+IIUXbkrNo6TZxUph4aVc/DSTt90oIoLHBvY5FL2ARBE6KWpo0SUHv/Z5Tuz4hMhE81/e1+AJmmvVd701ZeJxvNgxYpheNRp+/6TIkteSQhg8WEY01HwTN5eA8J73kpRzmi8ffbNpiRpemCrHpoFjIoQM6PWYbt0Y9MxWqpRYy4bnfUVXMtD4pR387m03OdAm5BwXqfbSVKswrCi5/qAKbsq4V69087ajl7GBJy/cr/0QZ3PqVwaOqceCG9aC4dpoX1h6eSGQHHEyuK92/TG57XpNR71WGz4TJIFubRkNAjlClqkau8cgko1/L9cCkisPpNowu67aiyuKrCQlnT+rjI8ThxBpv9l8EHkCvtPcB5xn6zyBo4gnLkQzJQZyXJXOnyDJZ3ch7rfn1qMCBhxAzyjLjYbD6XrLCTwHK6DKiYb69+/EAtC2U2UzzQ9VwLrJvc1g1iX2qmi4yMeAiAzFVI8R7O0iF7iDnXFYgE6cO47/Jv4hOhp8SmVT9Zjb2+olLrAc8ac7JxToUjzRVOXZflpfZcODe8U/1URGynTIatdooSseLQcQAJEVWAamLDH6RMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1YN1NLK2tNcmxIR283U1k1cDU0OEJ2R1FqbVZib0JNWWJvTitteWxtT2Nv?=
 =?utf-8?B?MDMveUlpa2xsTEowdEZoNk9TNmZXU3UyNmZKSUprYzJjYkJTRktET2JjR1pH?=
 =?utf-8?B?RHBhdkUyckhGRnNFRXNTSWluSGVyQ1lqVWgvSFNVNmI4OXdlalExaERvM2hl?=
 =?utf-8?B?WmxOMkNGZXdBbnpvc0I1alNWTFVFZDlvTGFpZzNjK2ZKWjR4akdXRGFZaWp4?=
 =?utf-8?B?dkdsVjVxeldCR2JqU3NkRjdKUGoxOHJJS0grd1I5V1hRYXlXTVdvWTZrdHhZ?=
 =?utf-8?B?RjdWbmhDcWZxNDFTRFhGUkp5aU9NR1B1TXNMNjk1UW9USnpJOS8zUzlVbVEx?=
 =?utf-8?B?b1Jub3IzOHNHNHU3NkJ5SHpDcUlvVmpGRVQ2QlFuY1NYY3c0S2lsSWIwV29X?=
 =?utf-8?B?K3pMQmJyK25FT0Y0Ri9xaUtQV3JROXhFOWppZTN4Snk2eXlmb3UzL3h5bnBk?=
 =?utf-8?B?cE1PU2NrTVhwamlpWWFlT0FjNkVsSExQTGhNL0M1NmpHYXc3eDdyL2NGbDQ3?=
 =?utf-8?B?MjkwQlUwYVdjUEFVeitpTXlsUWd0a1JEMURIa1pFd0FZcG9OOG9TaFkxamYr?=
 =?utf-8?B?WFlXYVVjMCtERmxRK3VsT1hDdnA4RWJwZ24xVkgzYW82RDZ2SUpSNUlScm9B?=
 =?utf-8?B?UXAzL1NFb1R0cW5HeTRxdmZrTzBuZG9MTmVFWXJaRytGc2ZxcE1tQ3lkekxJ?=
 =?utf-8?B?RFgwTURoOHNSTjZsdWVOVXhMWVpwdWoxM003WjVwbU9MczNBUUtiKzQ4N2lu?=
 =?utf-8?B?blNTNElLT0hvQlcyR213Ym1IMWhJaXN3VnJEcGcra09YcTZPNGpvZjk2L0M0?=
 =?utf-8?B?U3A3V1ZzS1Vqc0phaU5lRnpRWHBjUDAwWHRzSFp5N0RiRUlzcUFvRVRBZGJ6?=
 =?utf-8?B?TWI4a2tvR2pvUFA5Um50cGZmWTJCR3N5OWtMSW1iVkNBVEhWRU9VT3pTQTNL?=
 =?utf-8?B?ckhrN3BSLzBZKzZObktURFA4aVhiaEE0TG5JOHg0UWRJZ0dsOU5xVkF5YWRZ?=
 =?utf-8?B?KzBWN0F0ZHh1eVFYNHBScHBNRmxHejlKbkgvYWdmdFhxMmdvSkNaVEUycEd6?=
 =?utf-8?B?aE5HN0VHeU9hNE0rb0VQcjAxck90SmRHV0FkQUFLVGhWSHhvbEFLMVlPaEd2?=
 =?utf-8?B?T08wNGt5RXQ4anRIYVA1bDBFZjdRbUdXeWFIcUI0c2hTbVkwdlg3R3RoeXRi?=
 =?utf-8?B?NGtsWDZjOUc0V3dLL0s1akpXUHBvTzJDT2d4SzNUbWZlcWdYbjU4YnhZQ2FP?=
 =?utf-8?B?L0RwZWloMFU5dWt2eXpZd3c2aXVaTEM2NC9hbnBmQTlCRnRjenFTWTJWNnJI?=
 =?utf-8?B?UzBFbHUxMzR2TFJ3cUtDNEtTWE1Wa09PMnZDaW13T3hUL3U5OGF3YnA0cXpN?=
 =?utf-8?B?R1hQVUtFdndTUDBpZ09HYXh1cXU0L293ZlgreWxNV3R2SERLR1QyTWkwYmRM?=
 =?utf-8?B?R0RHOStVa3JTMWhrOTBSTlhIV053MmR6MWhxbzEzTUxkUlNPYmVaTTV0QmdE?=
 =?utf-8?B?K2Y0aUVDT3l6SlhXdkpUdWtjUE1kN3BPNXNucHdmWlpQTHF6Qzh6cXlSaEFa?=
 =?utf-8?B?YnA2b0pGbG1nRW1IOXYzZFNsay91SWwvcWJZUXcxUy9mUStXcUVSOWtXek5k?=
 =?utf-8?B?UE5XWC9rdkM3ekxYeDJ1Vllua3FSUTFQOGhsalRKakprYkhiMm96RzlISW83?=
 =?utf-8?B?allBbE1RY2Z4ZnFFQ1lWdVNFb2NHT2EzNlE2ZXVTVE4wN3ZVWkRub2dPOVRR?=
 =?utf-8?B?MHJ3T1F1UDVsNXR0aHJWaXNqWlpWRXVacmNFTkd4YmhWTmRuMTA0bWo5cjZ3?=
 =?utf-8?B?SmIxUGVTYzRqcjZySGVKZVBDc0NNT1k0azFzMlBYbWVJanllV2RuQjhXQ2FX?=
 =?utf-8?B?WGViZHBpU1pkcTJJeFdwNmpvT2ZqWVBEL25SSWEzZmFtWXpvbmdjeVAxMTVn?=
 =?utf-8?B?KzdTOVluZndMdnBYR2dWdERoMmI2d0FyN1F5MDFVUElSQUtlcG9zZWU5WjMw?=
 =?utf-8?B?clRvY0pVWGdTTFR0T1pjbytuWmxpR0lTS0Jnc2dhVEV1N2V3eHBLUVNpTE9s?=
 =?utf-8?B?L2c1UW84clZyS2xVMlgrcnBKeFhQVDRXK3krYXpWdWtCTXFqQXZ5YjhFcEVy?=
 =?utf-8?B?NTZ0SjBwL2ZkZGJjRVQxaDMwY0dxODF3U29PVXZaVFgxQ0ZvSUVYOGJMeWJk?=
 =?utf-8?B?aDk0anlHSFlaOEtsRFk1UXZVRytCTVd4SnJnc0xpelBPYzZNNGszZUpCK2dp?=
 =?utf-8?B?MmxJYWdSdkF3R3JxMUEwRm5kWFd2NUw0YXFyTUp5NEhEYkd0ZUwyYjhhVDc2?=
 =?utf-8?B?T2hQTW4vcll4ZnNtN1c1a2QrMzNSNm9xejZoU0xnTUVqNTB3TS9KanZoUnZa?=
 =?utf-8?Q?m6xlmuk+aG53Ct7AEtJW6y3ihjP9a6u1X0H2h?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7c9be5-4cbf-4d72-f153-08dead1d7111
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:18:29.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+yOmr02T155TweteFLnijr1ypK9M/8vtoKDsmI/VhbeTT/2aXSwey7bAI0z5gctSWt4covqQCUvB2o9vats8KpRy3nntWS8bcQI0Uq1ozE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB8397

On 2026-05-08 12:13, Sasha Levin wrote:
[...]
>> One possible approach to prevent "footgun" type of killswitch use would
>> be to first apply a statistics collection killswitch handler that does
>> not change the behavior: it checks whether the target function is
>> invoked at all on the system for a given period of time. Then it applies
>> the killswitch if it was not invoked during that period. Overall
>> sequence:
>>
>> - pre-soak killswitch for e.g. 30s, checking whether the function is
>>  invoked at all. (period would be user-configurable)
>> - if no calls were detected, engage killswitch, else report failure to
>>  the user.
>>
>> This should prevent footguns such as trying to killswitch fork, malloc
>> or other core functions which are inherently required.
> 
> Why not just use our good old tracing infra? Set tracepoints where ever you
> want, collect any data you might need, and engage the killswitch when 
> you're
> happy with the data you have?
> 
> It feels a bit weird adding something like this into killswitch.

It really depends on whether you want to include some basic safety nets
directly within killswitch, or leave that entirely to the end user.

I don't have a strong opinion either way. I was just pointing out the
feasibility of a pre-soak sanity check before applying the killswitch.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
