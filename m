Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921659;
	b=AxTYNN0ZcIWdv6sTOPvSy88OLHGycIvwWjZnVGSq+Fg5td3ndteAiAuAjxRQgkeP8miX
	 fpNvYVlE6iRCayJo0IQarUhCYNssoO1uuWoJpriUyIJlZt+vrjH/xLm+VxU7gsfTlkj6d
	 v8PiN6UjS5K2FgXA0g+K8CmODuFAt7AxwtmNzGk9d4evB/2kDFGNvxeM6nHCvsu8Tbpss
	 gQoua7Itz3ZDbVGiNK2CqkCjJF74kdENhBQeO5MH/vXgLYP6+cJbduy4zz/oGik6sAcoS
	 bPPxE6np0r0veghOOOXVa8jN/ncyN9f45RzCu2n0gJEf0c3P50RdjSJ/2JG4KszaynQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921659;
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
	bh=9hQKs599pA5X4LEF0JKKIDEz8p2PugBEV7Wsnl1BheQ=;
	b=kymeVSuiIBr9uw8XSSo/InzbAyIsdk6FfZAXIIVDusybbI3KERvvpYzVsnJALQ8Q3MrR
	 oOFHIk+G/Y49mpReRd8KC0qyakGU7STjee5nKzhYHVj2UlIkgLA+lk0ftVwKXcklaVadw
	 rwAuYJNAdq/1SozPQCAr4/IkxwtUVxIYE3CYAINTPbrfq1Oo02f5NS8itw0dcOgBkbpge
	 W2EL5OWEtuGtGAGSvSQpwRkSH5iGwBrEsOVA8c5J7opOSNJ7xGPEjb2ecN8/EVzLSdCkc
	 LtxyBhuwCWCj6er3GMl7lZoPmTIkL/Nn+aUXC8raIOJBB/AlSvJDu2bnSOMhg9cXLyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=eSkI5G6W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.78
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020078.outbound.protection.outlook.com [52.101.189.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F038606A31C;
	Tue, 17 Nov 2026 13:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F038606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=eSkI5G6W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU7F7BuYL5fcGWfcniJi1ViAO2OotkqOPoylMWqgNIpEg5qO1WIVk7OojOSF1rzhSgSLpTrMvHHHX+ZjnuPS4QHQGYa98ayWuxMY10sM11nJU1t4/wrRWs3yQKHIRKMzp6TbxtQHu7uHZNTEXXtyTuzdhMVfZQxlVbfa2m/PmZiJlHsiBPszalMz7NclQ1dFRpr0L2a0ctzq6WGgwcpqkcIczgDSIEYKPvS0D5MLfV6HWlvcdiVO95frRooMVcoadJRKEG7UNsJOeLRzRYEeiqdUPWDvvIvajX6e/z2N7am/5DncrB3PBQAd0SMEm51efpIkilIQbF/LXoeC1MBNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hQKs599pA5X4LEF0JKKIDEz8p2PugBEV7Wsnl1BheQ=;
 b=JRdoVRks/CUq85vfd62UVtLLnkm6ogHSDc4bDps/MKXmIuCvMgaqXPMAZfSLlKmtie0TNFkTB6ss8GGAMiracC3jskdj9H2uSgD+DLDFGTEBfnJfWn8odRftqWrUc3Z0yyRpFMu7c+Ek+sXjfW9XQswbWovqrth5zmZKUqxGn05bMjcxSb5Lnfl8ZPz0190TqkoPCs/2kYTDsVXKfZjqMUM6UCjiN1k0viR91zC8ekEV8iYX/AAqGJkIO1xGMXcE6FC5jSiDY67eRHbXNOVKHc66XQayz7On3RHuytVhfDAXquAg9dfNZt0JHjaJyHo/d0pVaBR0ut8ugxSoWMl3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hQKs599pA5X4LEF0JKKIDEz8p2PugBEV7Wsnl1BheQ=;
 b=eSkI5G6WQiTEgPvs0qs5Kx8J/HxgUdd8JkTH65/1nL22obS8ukl8VDMoHqcSRP7kzpruxd76FZgl/J+F959iiCSLS59mOGwaj/NUca42KE5F6rG1epL2gKveFTDlEf9ohHG3y9QaC1vcn/HJ8LAMifhx88LTg3j1Gtjm8m7SW635MWogsY6qn5cVdJdYlIIM62vq26tu8nv6cH9/Yy3y5tfIIdPyNiJAT7RSqH8V8tYMS3XwS5LTYbbgB/C6gFX8ket6Cw4InnxlP8zFgiJ+W7rB1nfxunEkRik11pQy7Z9siavI5+Hpms/cKSQAObk1YIo3DgWiaYaOMHxEtDCNGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by TO1PPFB99324EBE.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b08::686) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:20:55 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:20:55 +0000
Message-ID: <bca68272-5654-49a4-9648-32273d8f53da@efficios.com>
Date: Tue, 17 Nov 2026 08:20:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 4/8] sched/proxy: Tell the class about a proxy
 migration
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 arighi@nvidia.com, akpm@linux-foundation.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
 <20261116192638.233125-5-mathieu.desnoyers@efficios.com>
 <CANDhNCpQ-fyUJRCy_6twENoAy+1yGHaWN8dHw7VbUz6Qn7wqhw@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CANDhNCpQ-fyUJRCy_6twENoAy+1yGHaWN8dHw7VbUz6Qn7wqhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0263.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::17) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 36d1bce9-dad2-49f9-2ab8-08df44ad9c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|22082099003|5023799004|4143699003|56012099006|261022075727099003|261026121527099003|261028144727099003|261021121427099003|10067099003|261026140227099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	sVLhTmUJ524hptGl/f6DRKOxypbSW7zWoQp2176LwQyhSoMiSWFRv9i/W90yXzgL7mFziiS7ar0HD8yUgoUEG4OU+8CMM/zkIYO/NTzg+IQV+WuNbUnoZfd0CYctTmW4/c9vt90qAOIOl8hY2iH6tGsaOffKsbbnRyoo7UaVT9Us/MgX+N8zH8Rnv/zhLHfi7xPBWUnuB5t5xmwK2XWC/JNcfULAp49rSQ/aXmqTVp6LxSt6VOAEiSeK8/fR9q1fZFevt/wDgqfmyIy+Qi/I97oUoq8vjcyloJpDaELw1BcZrrYBtUwaWmvMriJbixFhEvRV5fdyCPZPOIOPHM41Hmg7mbSs5DGeMFHYuoT5wwk7HAYi4JnLs/hKUyjpK/9+QdBZ6pYfLs9ll+UIHOcehMN1QN0e+Y1uguMLwKWkiEj9aiNJvOwq7LYPBVuk9ZQlsSLO3XiEa88mR/js6c6RsKoeA4AmMVrBKY4lFTewyQddzd3PTCPRWh4jfNSjmGSM3pHjR0XZrlTH3oEWsouB1NSjvPOGfogQg75eig6JHhQhoJqBrjaXvgTUz9UtH2PFq9GjHut25wFokMjHmRvnptHOOdgtNIRM8GzJ9j0kD/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(22082099003)(5023799004)(4143699003)(56012099006)(261022075727099003)(261026121527099003)(261028144727099003)(261021121427099003)(10067099003)(261026140227099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZngxeWM1RWl4K0sySHZSR2NhMGx1bUJISWY4NkQxYUFURVV5dVpWaWc3aDkx?=
 =?utf-8?B?OUJEdjM5VWdiQ1NTbFNNb1BLZkRrTEhkM0VQTEtnTVlFbWxGeUhnUFYzdXk0?=
 =?utf-8?B?U29KTnoxR0s0SmZ3WEp0ZkRGend0MVFURFRsU3Q0Z3JFVVdtN2QvT1pKaDRl?=
 =?utf-8?B?TCtGRDZEdnRwN1l4NDJQOUxQSnlkSTJreU5ZWjJkK05KdlgxV3QyNjlENGNV?=
 =?utf-8?B?dnJTRDc3bjFmMFJ1UFdXcHlUQnNYaDAraWJnRm0xd2ZtVThnTDhEVlFiYmdP?=
 =?utf-8?B?RFJFVVhYa0NLVXVVa25qZ2RJa3RKT2pGUkg1aitZUld3R2xCYkFFZGplak1x?=
 =?utf-8?B?WTY0Tll4cmJIbm1sNTNQYTFFeW1FZ0Y0TmxNT2szK0VWRmdHQTVHV1JuWHJN?=
 =?utf-8?B?OHpIRFlhcGZ0UkxiZUxHaG5aRzNtZkU3UFdCMGdmTGVYaUNwWFd4aFJtaG02?=
 =?utf-8?B?YUxaSG1PTVc1N0luMTcwcm1QYkhaZ1hMay9LZ25BdWt6Y3ZEUEJ5YWdPRzVT?=
 =?utf-8?B?a1RmVnp3K2VrR09GL2ZMRG1kclhUK2tqYWI3ajMrVS9KNUxuOEowYWVydDdO?=
 =?utf-8?B?SThBaHdNZDI0SWxQNFZLMmNXVHBIVWpMZTRjMUdpVHIwMEtYUlFTTHlyS3RP?=
 =?utf-8?B?azV3SHZhNk5UTFpuVGhGM1VSOVhxMWlETmwwcks2MlU1cER1ZzRyeWRsYlNV?=
 =?utf-8?B?VnBoU2RMc3BMd2xxd3ZIckhTSkpVa1RRckgva3NJbjNlNEF1VmJQL0lqVlND?=
 =?utf-8?B?VTlHNUZmSmVKR1pxeDA3cXdIUmN4ZU9vZFpLczRSQmcwU3pNVmw2Tkorbndt?=
 =?utf-8?B?REowamdOeGF2M2RpVENOU1hjZktGUnZhaUNPY24rQzRWWUR0SWI5QStEcmww?=
 =?utf-8?B?ZWRraHo1VUJJSXE4RXlwT0x0T2YxNk5Bd1ZZckpGRStPZFhZYWlZejlNOE5Q?=
 =?utf-8?B?OTB5dldjZmhyNlVKNkVzMVVJRW5iZU5aRzlrN2lDU2lZNldXcG92cENpRmJD?=
 =?utf-8?B?Y1RRSnhVWk91cnJJOUt5RWIrUkdNVEJuT0RzK0Z3VXFmU0RyZGErbGNVVjVK?=
 =?utf-8?B?V0VPTVV2OUFMRkxzdGwwdERlTzJLaFQ5RUlOaE9HUHZOcnArQTJrQk4xZGxN?=
 =?utf-8?B?U0R1cSsydUp3azFTUDludVhOYzZteTFkTml3ZGVlL0FKdXZNd1hsTjBDTmFL?=
 =?utf-8?B?TnhxSTBScm9PanNUMjNlVkFvMjdCNVJ0d1ora3NnNUFmQ3JxcTR2WGNTaGJY?=
 =?utf-8?B?NE9YS1FyS28rQzZOb201Z1UwM0w4RFFLNzMrZk94SEhNVUx0Y2phLzA3aTV5?=
 =?utf-8?B?c29uczd2N3VNUXhjNnFCWXFzdEtiRmNIV1lFaWVndTloZTJsbFU2VURXQXJL?=
 =?utf-8?B?blBIUmlqM3lkdEdGZndiUjFHWVhJTlB0QXh0WlFDdUc4cVBqeFBlMXVHd3k1?=
 =?utf-8?B?cjZUL0hFR216NzByc0wydlBxNDUyM1ZWTlJlK3JhTldCQTJoTHJZQXprclQ0?=
 =?utf-8?B?NGg3RUtna1pTdXFoazVmL2VVVjliZ1poL2hyaWwzbFljVE9CNmlaNzMxbUlP?=
 =?utf-8?B?SU9BbDMxUVZmVlI1M05JR3RadkZZSmZBdm53VFZHWHFGZlZqWkZZMUxQM0l4?=
 =?utf-8?B?Y0lLc1RzdFpYMU5OUjljVjIybzg0SlBtZGlhY2RHa1ZPSUhVRDN1b0pJS0J6?=
 =?utf-8?B?NEhJYXFDeVRnVmdpdGVPaUNKWFdOZ2ozTm1uS1RlR3JBMUNvbXZhMDlWc0Ir?=
 =?utf-8?B?V1lEYVJuZ0ltYXZlbG15VXh2VFVReGRkVzFneElmN24wYzh1NElGQXFRaWJN?=
 =?utf-8?B?NTNWUGlnc081cWNYZzB0eU9GZUxtTmNDWGtGM0laY2V4Wjh6N040b3kvaHEr?=
 =?utf-8?B?VlBiMWtvcTdOdXVTbmpnMFhnN1dTeWFMek9tSDhiMnlwR1pVQnhNWDZ0TTht?=
 =?utf-8?B?WU0vYkdrd0h6STJodFZQQjlXaFJGcGdQT3NKdFJ2b0RJUE5ONTlNWEdFdjJ5?=
 =?utf-8?B?d0FFSDFRcXQ1a3YvcnJCRmRyOU5weHFCUWN0UEJyQm9HVEpJMU1aTHhxcjVp?=
 =?utf-8?B?Yk9vUUozMU1tVExreFVHSllyeThlcytRSzh1NUxyN0IvTnFlbWN6NVNBR1cw?=
 =?utf-8?B?STVSQlV0QStBeXdnenRVMEZpT1FDTHFjNGNnZEh4UzA0S2EvZWxoSnNJZURH?=
 =?utf-8?B?US9iSTNObUl4aUlveXBZMmgzYlR4M3A0TVMxKzBxeGxkTzJ0emx0UzBVdlM2?=
 =?utf-8?B?a1VCQm9PblFXdDdpWG9uYzNVVWlmc01Wakk3Q1lBNC9Mak9VQm1jOGRjM3ZW?=
 =?utf-8?B?Qlh0WXNZelRXMWdjUTBMZ3loeWJrdUhOaVpSTmFQcXprakZlR0NaWG1xb2dY?=
 =?utf-8?Q?S2XbmO7mGG/0CkDY=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d1bce9-dad2-49f9-2ab8-08df44ad9c78
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:20:55.5866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsVqubCWHGJzERppugjBrpPqSWMb3N0+gy3hLBqhyKHTY3VQRzukYy4lado0LTwlnyoh5iRo7mus0+tvqH3fhVdO0mRAhKFX45QOV4FApR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPFB99324EBE

On 2026-11-16 15:42, John Stultz wrote:
> So I've got a pending fix from Yu-Ting in my tree (apologies for the
> gerrit link, I've not cleaned up and pushed my tree out yet) that I
> believe duplicates the bit above:
>   https://r.android.com/4410518

Fine with me. pelt_migration (case 5) passes on your tree, so please
drop the core.c part of this patch.

>> -       if (unlikely(dl_task_bw_elsewhere(p, new_cpu)))
>> +       if (unlikely(dl_task_bw_elsewhere(p, new_cpu)) &&
>> +           !(p->is_blocked && task_on_rq_migrating(p)))
>>                 dl_task_move_bw(p, new_cpu);
>
> I may need to pull this bit in separately.

You should not need it. On tip, migrate_task_rq_dl() returns at once
for a task that is not TASK_WAKING. So a proxy migration that calls it
does nothing there. Only my deadline series makes it move bandwidth, so
I will carry this check in that series.

The check leaves the bandwidth where it is. task_woken_dl() moves it
when the task wakes in another root domain. That needs the full wake-up
path for deadline tasks, which dropping the shortcut of patch 2 keeps.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
