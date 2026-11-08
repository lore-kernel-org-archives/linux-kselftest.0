Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.141
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148487;
	b=3Irjszdv+ldn+rnhY00PpWLgbvKYLY+KiTaoJBRAvl87ksyzQ1sXjdQI7XjwNdbtD5iX
	 RNNJF3JfmLBrjqHa8D1ReqxwOQrkrnliTOSVU/EMfpl/s+dtOANA8q7Hh1xmoZgbr3L+c
	 ylyP30gj6aPI5RS49xHsq2wWO0PuFn2/fLlJ4NxhNes5t1WbbS5K0xKJhLhCSnEBKeQuD
	 uC87aj37+htV+hPDYhsO09FC4thC811PptpIQrmTAO+5dpIOeLLKsRhTylXq0XLFmhJvz
	 d7IDQlBi7dk5OGBg5DKCrxc5PXR8N90sHWCFQV4bO7Xc+mAfFOXkbQt6qt9GidAyy9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148487;
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
	bh=2UfL2cRDnByQmhtigYwur6fpz0c3fQRS0ywh16x6CXE=;
	b=CLXU3Hy7ojWhXdoz7gIJpF71ROZsr5Owdgu8DCR7Sgzogy6jX09/32d+HzzSDf1DjOfN
	 b5nfUzSIi4aYdryNLOvX2tuoVZGP/yEyAb2DqYR+qi8B2gbm4jjeQMZQf4ktumu/xmQeq
	 C/yIDkcWRBkHs4fBqIASg+F5HCRE7F0w+tQ4IPTxL3z59q/9QEq0nbvwD70utvrzcB9fG
	 lpsNga2Hf+6kx5fgWhB02xm6Y/Zgc+xJZFpiEInAcPbpnqqzCoAiLqQAuMOKu+i7GTKX9
	 CMk+wGJYXU0IHXgINKBBcn4GGtpA+lmsFKq3FmWdx/YsQzR+wtTm/pdHEG92uZJd47g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=HftBzWNB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.141
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022141.outbound.protection.outlook.com [40.107.193.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49C606A321;
	Sun,  8 Nov 2026 14:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F49C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=HftBzWNB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiUjfuTr68s9oJSAgDZIPVN0nnwti9u4PPvsZwma0PQ3gxCsJ9gjterapUPeqcOux08aXMTrN77D+5//tClOJko8n+La6XP6n3nzTdFBlrRfSXT95ekflP5yvEPIAyD40qEDFHERTgqIweNysu3EY+h/X9P/rRE2yg6NEZEB6lJBtyXvMQwIWN/QzE6NqvasxXcNDmIMUinVsPjE+yYlGDYmFqlwAHxXWWlSupOhGTVRqEGamFSEQ2mfMpNRJDP2/oZ2ccWc8UHOm+65flvxJ83LPudu+ht+txpUvhwD1K4NrSHfCaM81zE1cJfmzgqJrOEjUIXgJ+w12uHyaLYK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UfL2cRDnByQmhtigYwur6fpz0c3fQRS0ywh16x6CXE=;
 b=qAlUqbCHdPbdS8POAXmCtOpfppp/NMPw6c3Rrg0kheSVwxNF7EODLiyuZPC46Op8JOQbR+dP5EiHgzVJ/hmRDfAGVv9davFRZGUQC8unjQAhog0Sz9t4seD/KEO7bBPNujy/M56cmTitbAJgDHqIB97b/GPvHvI9YnWs0GkWRAq4OlAO4MhqizBZaNHzDESxcyZqsjTU+DZoqk4hfMptGQi5RW3QYkb2m6i8Q0kpN7GcdrJLGkPe+XrF++3yc8uPW+Ut5eubznRIdPUVGh+g+MYuEyHJ8/LxN0Q8w8Ed4JVCVlp9M6nJgph16RGc9REd+VNX7e78e3bd250FA0xP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UfL2cRDnByQmhtigYwur6fpz0c3fQRS0ywh16x6CXE=;
 b=HftBzWNBvvuqv6/+uwhl7H024Pm0OBqoEVrC3TXkJAqFMt27QGyZNrpgQRKxvE56sXHjv+ZZiYMQT8dpDkBmkU7yHkPC8O5xTiGyTAMCuG2G+rFKsfONNp4cq5rM48xtqUzD59oxmleHj31KjqhAjN9KSLqQdbECXuXLNqdVTFDjhEH4XAkTaeTevFIAM1o0KFCIH/pmeWmE2vu1oy4+nGLplXoPZ+vIM3v2WWv2n1SJgrqHYvvx5ea6/ZnfclgwOcpefw+Z0THjCftHyyWF4sBgitLRBMOjEflHargLjqTMkTp7k+WnjAXrwYdt0z4L6MPCSmzxjJPlrEyhL754lA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT3PR01MB351950.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1a7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 14:34:43 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 14:34:43 +0000
Message-ID: <7636700d-1aed-4e6f-adc6-720b1aa98501@efficios.com>
Date: Sun, 8 Nov 2026 09:34:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/futex: Retry the wake in futex_wait instead of
 sleeping
To: tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
Cc: linux-kernel@vger.kernel.org, dvhart@infradead.org, dave@stgolabs.net,
 andrealmeid@igalia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20261108142309.1527337-1-mathieu.desnoyers@efficios.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20261108142309.1527337-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0266.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::31) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT3PR01MB351950:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d562e9-1d9e-45ea-3ae9-08df3da56db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|261028144727099003|261022105027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	KSPt2L1lZaOu/keCVJ30VnZMCxCgbfH8umxO87F3QJEbTgQ1mvKttavG8Fr2i6cZInNmXGo9JQqLXrjYrUd+/5z30ubuJkUwJaXh4Oj8fl0/4j/YmC9ZrRildQWYr+QUewN/2qI3bpYE3WHS8Hqqo3G8YM2XrG6aHPQ8xAUJtaL5Z4jKDFyHZ4y1Zr8GaTEEvg+l0+HsWZrf7BbBjb1OK7vGytWnZPqk7sKM0Eq0IKJz1rBBMoBAUAI7IVq/Dt44lgfal2v+t4VIBP4TH+iCdWitVmOF2DIaabrO5zehcJoznodLAJaSX3jSjwksp71VoxNv2PF2Umd5TiASTtHnPMRehQXuD5N5pnAOuMS9EchFxWagBy54738uuCBkGuEyz8Z5Y7ykQAtIPTXA2Erl9PwMejNhfDXP7gJETJYwzpo5P7fzW/s1VSvbJcjafJboVtklKqZsi+7ieGDz+/zBNRbXOjl9JlCNTB1KE6ji5qJzZAO7tE/J76GE9OxfifREEyE14kWoRWGi/sKBNzAANPE9kYGaeyyr4Qzur2GSiyeupGVBEiU7pL4jTEaW3baYzWA0NTG69eefIdyXEZN0n4AciQFHZNs/umtJyqoyWLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(261028144727099003)(261022105027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERQQzZJMnVkbk5kQk5yMnRTdmZxVlhJSE9DcFllOVNXdlZ3bDJJV2REamhD?=
 =?utf-8?B?cytIbDNoaU90c2RPcWI3WnNjWVBDby9sS3JaQ3pJa0JuczhnbmFNQzhBWVF1?=
 =?utf-8?B?L1M3WVJRc2RvOGtVNWUxQkFaZzNHYVlDYndUcUVJUFRlMWU3dnc0L0xuSmkx?=
 =?utf-8?B?WlM3Y2VJVHlTOStDSUx3a2tkSDFaUS9pcjMrL1pQMVZybURaeWNZMGRHaE5k?=
 =?utf-8?B?T2R2NTFkaVdRS0ZiRjJBQ0VwR3dJMUxCUGtvZS9QQXdDcjdpbW8ydktvYVAv?=
 =?utf-8?B?WlpPTjNuVVdsdlJFY1g2Z3VseXp0R055amEwT3l3L1RiUDBLT1VCQUdNN01w?=
 =?utf-8?B?U1UvdmgxcUdNdWlabWxhQW1aSlpIcEJ3bXlwOVRYeDE3VUdTQ3ZoZ0tCdEpY?=
 =?utf-8?B?b2hnaEl1eDNhYldma0RtcjQvTFJPSkZJM2xWNFBTeWZRWjQ4NlgyUit3ZUNQ?=
 =?utf-8?B?aXZCbG8xNEFjWFdmRnVmQjFpUW9Jc0dlUHlHblV6MjVJeXZReFlRUTBNUkFK?=
 =?utf-8?B?eGQ1dlF5WFVpZCtXQUtuZlBBYWtRY2ZFQzhtK3dIdXJ5ZlJ5YnlqVkZOVkVv?=
 =?utf-8?B?TFhYOE9ISmduMWVlMEFOTGg1OTRVZmVnelh5Q2l3SmVEcjJLQXBGQURvb2Uy?=
 =?utf-8?B?c0NZdkozM0p4RjVLWVMza2UwOTQ3TnFxT0p2bG0zL21lcU41VE9HaHRXdGZw?=
 =?utf-8?B?Q1JiOER2S2x2MXVMVmRMUkNNdzUxSForVm9zVmNFY3FoZVBNdHFwVkdTVFE5?=
 =?utf-8?B?USthcjNTWjVjcjlQdC93QUx4VlhZQVJBdm9UT09aYjFGTnVGOGU2UTNnY2pl?=
 =?utf-8?B?ZDJYdTFkUFZ5R0kvSU52d0ZoV3oxa1BLVm5hMFpOTklwWmdXTUdUL1ZvcmF5?=
 =?utf-8?B?dks5RmFRTWhCOWpnZkhWUm9GQ3VWVDFIRkJGdkJHZUV5NG52aE5tNGVXM2Ir?=
 =?utf-8?B?MWNUSWNTeStOTnUrRlkzZGhhOWliVGpmY1hodHNkQmRTeHNrdjNzazZzbHBE?=
 =?utf-8?B?NE1YMkdXZkxEUUlJTWM5TkFzc2FlNkhuQlpaaTdmU1NHNzZPektTNFM1eHZa?=
 =?utf-8?B?dWRocWhoaEdCK3Bsam1FaDVaVUhwV2xhUUx5ejNjMW5VSSttMGlRUnZUMkZY?=
 =?utf-8?B?T0hlb1BvVVZBNzJuSC9CTmpucWpGZXc3WXVOQnZkSkVqNDNhVE5vTHkzaWFK?=
 =?utf-8?B?QVZWN3RSRlQwQTJFRm03TFU2aGNQcEtvTTVyWnZUNHpWYkhwTmQxVVJmWWUv?=
 =?utf-8?B?YytJN1hnTFZaemVqYVJyOUdXNnVsUCtObWhFZVdlQ1B3M3VTVG50OWdKbnc1?=
 =?utf-8?B?RGdyMGc4WDhrL3lBSTEvdzVxTXVLY3J0WG1mZUFDUys1Vk5mUTN5R01SLzRE?=
 =?utf-8?B?ODFPNnB3NElJZjF6NThCVVU0dS9QaWhJVHphczB0K1o0OVpWQVBTWTJReDc2?=
 =?utf-8?B?TnluUEtWNmxuZjVON2I0NW1pNmtKNDhzb0dibjFpeWxyUzdTUVpXdkF1aUp0?=
 =?utf-8?B?RmhDdXRkK0R1anNTVkUxNExwYUNRbSs3cmtKR0VOZHI1UEdVSG8zdDdwVFZ2?=
 =?utf-8?B?OUVTNW9GRVRVeUZndk01SE1xdkdXNkVjNjJEZEFvSWcwUCtvQVVSNlFNMTdU?=
 =?utf-8?B?OVo1azhxREVPVG5xd090QTk1eCt0M1lWQkh1QWFqV3IyT0EvWUJDbnNnelh6?=
 =?utf-8?B?cmRNVk8xYmdxaTBxMVRFOUZROERZcTJHWDFwcGFPVk1vT0J6ckxBaFV5dS9C?=
 =?utf-8?B?djYxT3kzc2hrcjZGTFlLZWlZZVUveFlyeHVab3g2MExCbGJ6RmhrcUxwZ2hr?=
 =?utf-8?B?UlhESGsxdUROeTViTDhmYWJjelFHcWl6N0hocWNCV2xaVkJNNGlIZG03YkRr?=
 =?utf-8?B?MElGRi9kemRzc3I1U1RUUDdBWmh4NTNhMU5tdWhwbEdaTjE4ZGpYSEdFUzha?=
 =?utf-8?B?am0waG5oMVBWK242Ni93Q2NuazNXL2FJdHUrMG4vZjkwZ01xcVV3dDlacmtJ?=
 =?utf-8?B?YmRTZ3hIaE9ObzFBTkNSM09UL0hseGVjMS8xcTNldEp0N2ZFMGV6eFVpTkJx?=
 =?utf-8?B?MG9VVDBOaHRjOXNsK3ZZV1RuZ3plTFhtTmpJNlZBUTd5YTA0MlVJTzdyWjRv?=
 =?utf-8?B?RXBaUlFVQU10SEd2ek5KZlhocUEyRDM5U01wVDJGcElWdUxCMjN3a0s2WUF1?=
 =?utf-8?B?N21CaFpzVDdVRkZwbUxCeU1FbkljSWp3RFliWUJqMEhGYktZUTIzN2hQS1hH?=
 =?utf-8?B?eEhZQ3d2VDlBeFVJa0I3OUNXWm83MkVvR1l5NFRmU0hJcEtxOE9qWHlKUHhl?=
 =?utf-8?B?ZlJhNi9JUytieFdua0tkM1Y1MnFHWjhQanFWVyt6ME9LcWxLVnJsRXpQcnpL?=
 =?utf-8?Q?ZYbibTdIH8mmnXHA=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d562e9-1d9e-45ea-3ae9-08df3da56db7
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 14:34:43.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2GdDGq7oJ3T1mGi8c2czYZKxQaHdEQJCnOytbWBSwY/N33PzW1zn2fM1ZINd60stT8sY2yAf7jxd70k9XQaYszbqXdciIRsWcHjml8RrX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB351950

On 2026-11-08 09:23, Mathieu Desnoyers wrote:
> Each futex_wait test starts a waiter thread, which calls futex_wait()
> with a 30ms timeout. The main thread sleeps 10ms, then expects
> futex_wake() to wake one waiter. So the test assumes that the waiter
> reaches futex_wait() within 10ms, and that the main thread runs again
> within 30ms.
> 
> A busy machine breaks both. The built-in locktorture at times holds a
> spinlock for 100ms with preemption off. With it, private_futex failed in
> about 0.5% of the runs in 8-CPU VMs, on v7.4-rc1.
> Timestamps showed two cases. The waiter started up to 75ms late, after
> the wake. Or the main thread woke up to 105ms late, after the waiter
> had timed out.
> 
> Fix this by retrying futex_wake() every millisecond until it wakes the
> waiter, for up to 5s. Give the waiter a timeout of 10s, so that it
> outlasts the retries. The tests then wait for the waiter, instead of
> assuming when it runs.
> 
> With this patch, private_futex passed 6000 runs of 6000 in the same VMs,
> and the three tests 2000 runs of 2000.
Self-nack. That's flaky as well. A bounded retry can still fail. This
needs a proper synchronization flag. Will respin a v2.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
