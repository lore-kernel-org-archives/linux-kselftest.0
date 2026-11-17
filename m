Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921372;
	b=1ZnkMlE/zPdGKH/xV28D+WoYXmNiYrDHsYf33D1DYuXTceoMge72OVvcOz9YTLWDogbj
	 s/urISCeb3V5fzBGQMap2Fw+nwuIoLxjRD+Se6Xm5SSEVE+84/Wy36nQx26hfd6InAQMc
	 FhGodPSKnM8dCs+vcXXQCawPvULkpmwJ7Tn6KD7Nqp5fdgREGVdgdUd9fAPBW7X5zl4Mg
	 VV/NyfqhMrsNA+UsRe9MIy+LnwYfosgmrkZsZMxaxU5Lo6l8noSc2faby/dGsDQwI4Irl
	 IKawr0bjf9rcI968H+0QR8UVj++kvq0PJsopihnOieMNCih6tH+V86oGSNolHty8GFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921372;
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
	bh=qygKaxFvEesfKDnkrDKAflVAtxbsDlFiWGqkH5wIDXY=;
	b=DzcaDNRQLIXWhNb5wLAo1Z5aTZSGgMBr3E6tZCqHJfFqKEtN1LGle7F/TpLaJCrWXTz5
	 Pccf7clcIRH/dzv+mDxyuHnxanlHglsHQyTESJVKGDsbZ7J+FODXqHZgAVJb4j4VFgX/Q
	 qxMZF0wpk4PLCMldIk0xsgrcdbxLXBRScdmu8RNzKS1gb6CV2KOOMFA9nZzkHtzI5s4lw
	 vQv9BLwS9MIrPdl6DDPUyL9LQHmQGIlYLUGhbgzWDdA/Egx/wTMFClkIgszQj0m2dCpBN
	 qb6wGwkHLUkh9iNeZEP0yAPbfhvcwq+fDlqKDjOKO7ZnK/1lCNQMT4RJsM+i4+wljng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=nUTMhkTy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.135
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022135.outbound.protection.outlook.com [40.107.193.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42613606A31C;
	Tue, 17 Nov 2026 13:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42613606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=nUTMhkTy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3IuxhrBHH0KLzlfgXJIqXHv26IJFzx4FEyWBFF+ZP2dRUn/0Xj61k9qx7ekWMusEeFLi9qBFKGk8cvEbHLo0f8cbFe4tOxzS8hkV4XqnRmSMsNftg1TfISG3LJBco2TlYAyKgTiHJlkgkFisAin8lNGyC+2+lHvmK+CxC58HMdTAq7MFoi3zKpasX53LNfLoqOmBCxPlGimSqzcnkveIkyGpcXhvjHtnXxh7Vq4t7TjJSf3BwUD89A7AfZeHtD1oRmXQIc6K4Mi+0c88d5d3Fh3yGgcR+Vt/0k6KmBilBkreofR4Ls+HsC0zSZWcvrWgZCARV4eV51LV2VfNsNKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qygKaxFvEesfKDnkrDKAflVAtxbsDlFiWGqkH5wIDXY=;
 b=JwsH4xTzrO7RQ81O6brs4Dhorceql6t48CKwKI9vrFB0F3nu6ShtoMnE9YXSE1guf8yWmFDDrmNaOQdKe1oWYkJcQxafVRG/qeDNtNGRFfyypxpgJKmsj9vBZHDrjYXk2vnsB48Yi5ViwM6FyfsxEo3YxqHR47XuQgW5CNXB2nS5mVhlTB+V9+XG2Wa6YUktzc6PDZFZwxJVCpqU5VGKPI9SIycKBuJPuDKMOj+CqRcGyJo4IsMl3SihO0QkyCTBIeyVT/lvdO3RE2BN8TEKs0YDMxfKfA0J5g/1nbR/zQGQn9gQLHqO481bDu+lww6qEnjnp9j62OAhAM4VYnNDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qygKaxFvEesfKDnkrDKAflVAtxbsDlFiWGqkH5wIDXY=;
 b=nUTMhkTyYyaE4kIe4oIYAIpabKY53gqM9MRzdQOtdD8hTtWsspTU7B6FcsigW7QRv9NrzihZmA9Xaj3apRK4ssEhcHC8EwNR4qdz1CnJNu2+bj583qMT/p1IAHE6lJBEwd3Ia7LrDjMjLuexnTDdK6qFoFVYMu3C3Vb4Vc8m55TTdn/1f6t0HvmwPDmPn1eBqZONYTlAaZqexZUVrV2mFY/4KyEoo22VNR84MYb6rN8xNlNIkvOIgj4dCzxF7FALPORR7UirxN7nrtorWVOUmOmaTSm4/cbhGD0f7WxezHSW/a1fCx/YQO8zFLjbbHGnAbrzZBi6oOmjOelPP16LTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by TO1PPFB99324EBE.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b08::686) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:16:06 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:16:06 +0000
Message-ID: <fda5e270-2a76-4752-a845-94815992d14b@efficios.com>
Date: Tue, 17 Nov 2026 08:16:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/8] sched/proxy: fixes for proxy execution, with
 selftests
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
 <CANDhNCruzSQ3r3WKPz9J6J5-DEm+L4hC8g6PvnuYnx9SiBTKhA@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CANDhNCruzSQ3r3WKPz9J6J5-DEm+L4hC8g6PvnuYnx9SiBTKhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::8) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|TO1PPFB99324EBE:EE_
X-MS-Office365-Filtering-Correlation-Id: 7700701c-a2ef-4385-da52-08df44acf020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|22082099003|3023799007|4143699003|56012099006|261022075727099003|261026121527099003|261028144727099003|10067099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	KqGgtD5/wnXnvc1UnK5x9vKwkcK8Q4HsjYWFcUHaYoFBOkk+qmAbMgJok5LjcTsKm9rmHpWZAi2ZYbHhIosRAe/2PXBVEiuocbf/I6T1mhCGZeRGMF0OmMLREKxMKNCakCw4xnT1GOzV2XyswRJF3Qhq3C82vZZagYCtu1Kuh4v6wuSBELpU5weGWhCtdwqYG8z+QPB1U2N9e2QrhrhFCG3HPdfCPK+qYU7b3V+5Q9aebQh4gIAVF8PEj+EJYrn8nDdpifY7tr1pa4lHebge0+jskL21y4oAyNL1qsBVlbsy6h91Tt4C5VVEdAL2EgWESmsyM8cVm3CUHLMSmqbuCc0ZJnM9JGUM7ZL0wp1BKj4ci6a7O1nOnjdpf/l8Nw8ucZJWh3vphPzMEU/uIJd++msEcF+F+4JsTOFKaB5rEBiCSs+ve4cSrc8uANzQ9ay5Cgq2Fa7cumeAHV0ndBqxQ8EE4t6zUjZmxFxB7nimO7Mt2U4/dGT8qIfC7tpOTSmSDK99vV8+5L/R5ZCyP7anP4LM1KENUgV37I03bHRenPMniNiidFbnOaIhSFyxi6XV12VcaEZktyZdmIOG0Xf1eZMrU3skzC8XF8DqQp+5S4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(261022075727099003)(261026121527099003)(261028144727099003)(10067099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YldMblZwRmkveFdSaWVPQ1QwY2dLTnluOWs0V3kzeW40cDNxMnczZnI2Z0kz?=
 =?utf-8?B?QXdWL0JEMzErSEpaS0ttN0VRUFlxTHZoQ0Y1cWVvT2swSEJEL2JRamdVeUZ5?=
 =?utf-8?B?WllwZlllaU14UXFUbWd6WmlmRFJjYkJsYjdMZGlCMFVqOFZMRXZQUHQ1bnFS?=
 =?utf-8?B?aUZxdlU4ZEdoR2JnVWpueHcvaWUyMjc5YmZWY2U5Q1ArQ0FUSzhlU1FoRzdP?=
 =?utf-8?B?WUJvWkZOQ0xjN1NmZGh3NTJFSUR5cllTYXFTdUpMWVJBTFBsZ1REUVp6cS9v?=
 =?utf-8?B?b0c1WFZIWHl4TTN3R2hOcTFOdFhYS3VxcGlQeU9sVlRoeUN6MTlnVlBQWm8x?=
 =?utf-8?B?VFVvSWJ3ZFVvMGFkVkdNVFZjV2NnWUduUmlFKzAwcldIVTRmLzhZMUZYQ1gr?=
 =?utf-8?B?dUtKVWhySmVweVNmZjREV3poZ2NwTjlhVG8zMTJ0R3N5bVg3cHJrVUp0dSt6?=
 =?utf-8?B?V1psMkpuZ1pyY3JpdDc4Y1diWnlFazZyTWxnTDVGSDhNZjRRWWFzSTNoSE5I?=
 =?utf-8?B?eXRwZmJrTGUwcUkyNklGOTZzVWtDLzdGRFFQY2g0S1FNZUNmMGs1RnZrSk91?=
 =?utf-8?B?bnhnbjd3dlNrZ0txbE5ITlNJK0t2T0hVbEJ2MXR1c0p2N01lRnAvSWlsbno3?=
 =?utf-8?B?Tm9VZ2JiOXlGM05zQ0QzVHNHTUNqQkJROVdtNHgxRG1mK3JJNjFmUmhWaFRv?=
 =?utf-8?B?b1BSZU0wUEUxczJoVkJScHl5ZEJqMERQSnNXdzZMOWhZWTJMSmN3QUludkxS?=
 =?utf-8?B?MGFEd3lkMTFWcC9OSldSQnNlZkhBK0ViUXloTzVvRVJJbUgwemNlNnp0N3dN?=
 =?utf-8?B?NHJlRHNzZjN6akJwMlFlYlVoQjRVWWtnS1B0THdCTEFwdnRvNnlHdW13Q3lS?=
 =?utf-8?B?OXU1Y3NYV3hOSkpYSFhQMWM1NWpSWlRXalptNlhZaHZkazZVbVVIdUQ5NDkv?=
 =?utf-8?B?SFJ6Q29CcjlmTlErRzVPUFhuaEt4SXVDZnpiVWJ1NFNJZE05WFUyMGNIamo5?=
 =?utf-8?B?M054MXV2cGZnYllZUjNpOXZaZm9iMkx2Yk9VR3RlK0xxWWFVZENOcFRQSGky?=
 =?utf-8?B?cEY4bDlRcTd1OTdobkw3SHQ0bkdoL29qNE9HQXBQM0F6YndFNkFaMTlrUDYw?=
 =?utf-8?B?RnV6c25PYXdTK2lLRzVickpNcVhHd1I3czdrOUlwenFGVlVkZ055THF4YWhs?=
 =?utf-8?B?RmI4VVRzTkJ2VEo0SUtyUmx1cysrbTUyajdRdldrT2JkSDdrOURXSEQyYTJQ?=
 =?utf-8?B?K0pBZm1vSjd4VE55eHRBY0lYWERIMllrdzZPN2hDTE5ncXZ3U2o5S2l1YzZL?=
 =?utf-8?B?VS9wZi9tTDVlT0JRNU0vcVpzblVueForQ1VvdDdUaHRzeWFUM1JWVEFnZHlh?=
 =?utf-8?B?VUg0VWp3ZHdsekUwQWF4eEx6L3phTmsrWUwzVm9kRm5EUTdub2p2ZHZFN2Vz?=
 =?utf-8?B?cHdMbUdwOUxqazVXakl2MDZwUCs0OXVZRjlBUEJzd1ZBUVB4MDhycm9rTDM1?=
 =?utf-8?B?UklwK3NVTU5JTWRibVhPK0NMSnIyODVRaWdzS2IyY250UW41Y0lNKzZhVXdT?=
 =?utf-8?B?ajNVeDdoLzliSUNYbnArNkRVUXNuTnphbEFEN01YcldWUm9SdnZSNDlwQSt4?=
 =?utf-8?B?bU5ua1dsZEpBTllUanUyQ0Q2cnpRbmtlSEZqTG1QRDdkc0lLZEFXM3VsK1ds?=
 =?utf-8?B?clM0TGtxd1Z3M1dkRXcwOTVNMkdGWXJhUDNzN2M4UzNMZGRmWThrOGdrNmFu?=
 =?utf-8?B?MUV6dngzUnNLWmJnc3RzRWJmRnozNDBGWGlvUTk1bExSRFpDc1U2UDM2UXFD?=
 =?utf-8?B?SDlndEdyRE1TN0g1V2gxajNFc2hnME1nUHlZOE9haDVETmtkaFVURExhZmVU?=
 =?utf-8?B?L05ES1QrVWJGMTZ6UUFwU1hOM250dnBXQUo4aEJXb29XdjJFRVBZUlNacURj?=
 =?utf-8?B?dEY2V1g1QnJVT1ZEUjhEenRNRTA3clhpbW9wRzI4bnArbmRsOGdLQmUyOFRO?=
 =?utf-8?B?aS9KdDlqZTgwdEs4WWRrSmZiRVJUd2FQbTlrWW1ZZmJGd01iTkpUQWFKNnho?=
 =?utf-8?B?Qk5YNkJRaHl4Y2FMYmhJaVBNNktsMi9CNjBlOXRTSytURHJYU2JqK1FCMVc0?=
 =?utf-8?B?K1lNV1hLMTU3UmRuaWdDSkZwM29MczlSeTFEc0tjNHBUcE9aS1V2VHVnbE5h?=
 =?utf-8?B?emNPNFBjdHJPMmFtZm0vUHJOdWFzZ3V0SVp4aTM2RGdOZnVtRjBzNEk4UmdL?=
 =?utf-8?B?RW4zM1E4ODNCbDVoRVZzK1QraG0xQWp0Lzc3WXprd0orUUNscWR4aDZsZ3pP?=
 =?utf-8?B?SytjNnU0aU1PU0FmM25qeVE3UFJSLzJZRkphN0xjSXZsL3VJdnQzVVE0ZzZZ?=
 =?utf-8?Q?ZS5qKZdWfm7BGbcglTxEg0DsscMfUuy+TstOY?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7700701c-a2ef-4385-da52-08df44acf020
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:16:06.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQs/qxIEhDOiuyfhhCmpskf7eQEWPCRQTbQtr+StJEYRMhyfb1y47VPIfz/fgdLvFP+zSVvkzx0M3VZcjseB+PIulNyys9MSzzT73Rk/yks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPFB99324EBE

Hi John,

Thanks for running the tests on your tree. I answered on patches 1, 2,
4 and 5. The rest is below.

On 2026-11-17 01:28, John Stultz wrote:
>>  3  Stop the chain walk when the blocked_on chain is a cycle, so that a
>>     mutex deadlock no longer locks up the CPU.
>
> Already have a fix for this.

deadlock_cycle (case 8) passes on your tree, so please drop mine.

>>  6  Check and admit a proxy-migrated deadline task in its own root
>>     domain, so that sched_setattr() no longer fails with EPERM.
>
> This one I couldn't take as it was dependent on your other series.

Only one line of it depends on that series. On tip, that line becomes
task_home_cpu(p) in place of task_cpu(p) in sched_dl_overflow(). I can
post patch 6 on tip if you want to take it.

> Basically after the first two patches tests 6, and 7 continue to fail.
> Interestingly, 7 does pass with proxy-exec off, so I need to look
> closer to understand what is happening in that case that isn't
> dependent on your other DL patch series.

Case 7 is what patch 6 fixes. Its sched_setattr() checks the root
domain of the CPU the waiter was proxy-migrated to. That is the root
domain of the mutex owner, not the waiter's own.

You also see case 6 fail with proxy execution off. It fails the same
way on tip, so it is not a proxy execution bug. The waiter changes its
parameters and then leaves SCHED_DEADLINE while it is blocked. Its
bandwidth stays counted in its root domain:

  # total_bw A: before 52428, at 300ms 262143, after 262143

My deadline series fixes this. With it, the case passes with proxy
execution off.

I also ran the selftest on your public proxy-exec-v33-7.4-pre-rc1
branch, with the test module added. The results match yours, except
for case 5: Yu-Ting's fix is not on that branch.

>> - Patch 3 also stops the donation on a ww_mutex cycle that the wound or
>>   die path is about to break. The donor then sleeps on its mutex.
>
> Is this a concern or did you verify this occurs? I thought we
> wound/kill tasks before the cycle gets created (see
> __mutex_lock_common(), before we call set_task_blocked_on()). Maybe
> I'm forgetting something?

You are right, and it was not verified. I wrote it from reading, and
my was wrong. A task that wounds or kills another first clears
the blocked_on of that task. The victim sets its blocked_on again under
the wait_lock of its mutex. It then sees that it must back off, and
clears blocked_on before it drops that lock. The chain walk takes the
same lock before it follows the victim. So the walk never sees the
cycle. Please ignore that point.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
