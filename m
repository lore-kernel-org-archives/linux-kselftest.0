Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282F3B19A1;
	Mon, 23 Mar 2026 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284007; cv=fail; b=Vj2UaXrW1zQnwzep7AiHaUhNEjOoSviarGi46xIsLsRb8Y1VBFQF0//LoDGi5no2JiJhFiwWhJGjH4H3Pva6KqLs/4xZgs4ZBMlhCI6hf8crOyZAfSiD5Ffpe8yQ/IjoqIOILdRm0+AYIDfYE+cv61xEnoaqi4QFUsSkpoDaPLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284007; c=relaxed/simple;
	bh=4JrL6itGIi8QhI3fphd7s6WOu7vT5IeYQCs/iBUPqho=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E2m7ZMBxetNOp5j1pfWBCcsAiDFwm4YfT1M1uDTskRJMHvak/3lx6eDB60vs4vZ00cbpdKfSsHzMY2UYb2MWNkh/IwmEeuZKPR+FZv3iI1JQKbao7p0VxcSpMzCjQgSR2H5iWsmxK53Kvw8LNGTBv9Ve5pUpQvq2w1fOR+H3X6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=IluQ+rO6; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="IluQ+rO6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaGakRvRJbFo70PprXSqG915kqjeO2bSvrprUGncDMzjPjufrFBiUFYH3CYO1I04XTCq+iYVZIEpKjxl9dJ6ApLM/VjG61L8nPdkJ3vW/WjLHxV97ELekyiV0WKmxo2IU0CAJQwo5lPoZ2gZAfl3PxffJiJXvfDKjnCxlE3WQzC0ASIKlOaUNgAm400ecTr8nkaseI4hN/fektUlRF+g5sJQ9EjENelCQO423VZ83F0X3tQvEOiu2+dxsqan3gkPz4EkX1b/zF37zqbC3s3CD5Vfrcp1DeqYeur0WPOtv96PY9Apex9DKpCg48uQWrm8YcVgIs1K2/it7TCYGE5IDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU/Y1Txc39YCDtOzpf8Aks6f5ZXeFX5+v1k0gSk/itw=;
 b=eb1eQdgGg5kki8x+L1gVeG3bDNFIkd/MObVLLfs147NepQB1z1s/59hRagCfpfz3oZZLMqIsFq064bZOf4f7olgQanxavpVjUXJ1EVTS3EVM1r4U1iHecGRgvChEzDYM3lTes9yGOVXpISUBkxexduTf376/1TNZ3wPNqQ8ghtiTP8aDaZXbQsKvJV/LVtN6awFOcoUAfajg0NfK8ucLsDMxHns7Ab3otMPexOtJkeECxujSoGy/j4YH9KsfXPUskRkg8NKo/h0gS6KD6jpQxZHUeLDnGQB2IRC8LbAGFfVOfYVKdOwEJuJOJ8iW5TephPVQL1+HZ4QenlAgaClGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU/Y1Txc39YCDtOzpf8Aks6f5ZXeFX5+v1k0gSk/itw=;
 b=IluQ+rO6ucZujr4QXv4Cu+UMZNnCwZxBBX20ssWyzT2bGLrPBou4JP0srOC7RoUMlAGh4Rph43IT2hqAVrhSL7l3Zqbwg3/nBWWDFE0EUqR2816LDNNtMOAdZvPwOTI3ya1W2bcsfMQwC9w69wPoMZPi9DAcBB5Dk5LxngPB5zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8461.namprd03.prod.outlook.com (2603:10b6:408:376::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 16:39:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 16:39:55 +0000
Message-ID: <1ede823e-080e-4283-a018-efd62e0c1579@citrix.com>
Date: Mon, 23 Mar 2026 16:39:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 luto@kernel.org, mingo@redhat.com, shuah@kernel.org, tglx@kernel.org,
 x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
To: "Lai, Yi" <yi1.lai@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <acDV51/6Nml3dzOk@ly-workstation>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <acDV51/6Nml3dzOk@ly-workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 01200fea-6b43-4629-af4e-08de88fad03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CEogXbYCnJI+UfWfCtmKj+qe/tRMIlwmL0YyQPF/8M2Sz5TpWzjWSIcjl4uBMkuLl28oHi5xTsKKVvaaUCXn3MBCquuxATjMrct4LCws4DOpj483XsPmaAOfWGrGTYAHb8WBXZ+6FQwZearXsrkdqGZRso3FL6FvT1Yc6Qp9oANN/m7P6NJWny9jX7ejzy4EqIT6YwNnga1ufBSciF8yY6j6JdSFvX/yFD5LqEW8NlA/AT7kCtUdNXffONrby/a2KAAvHmwSfleADDo/Bc4C4QDjHDspBFlk+ufEzyTdUdJ0ka2h/uUNyx/oyvHmRXu+NLUf6oxail+9yTbU4KYD2U3YxXsegxcDa5vul7csHg6ZXFhjHVIwRUmwKKzuoJLVQaZ2KtCSrfYhWt8zGuU/yi5F7Bc2V4gZm3ph1UnFHTcuhjeVLMv0be/PxcbZJvX9aqS9U7tEWBiz9+VJRu57bn+av1dw342REOPUFJ0uG87ChAjHAwd5D3Ck7nvZQagT/M2z+1A3oxsLK0kHlXrcRV3J9GebhlZ7kmx6I9WHYrl0JYzB9gtEgPcmibzbslR2o7MUD8S4uyDoDVcFNv0HwMujHDdn9o77p/8OnP297Wgs4vOGg5fqJKXW4EqzSyAzLKkkxw991xj57ACKu3a+l/AhPXqliGZnIQ1bSSSXVWtIQKBWgFMyuu3Mc6wjPxnXBvA5zVbFowHiWJEqGHHDVqk45qnnQZJPZnUn39RFnzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHFBU2w5ZVNuUU53NWZSdjlqMjAxRUk0MnR5VjBFWWpINENFbWp4RlVmZXZ1?=
 =?utf-8?B?V3M2NjBDNzV2MmdwL2NGRFl1OUNISTlZcG51Z2M5Y09IekZUaU1IRWRQVW04?=
 =?utf-8?B?OUZ2cWRkcm5scDJhTkM4TFl6THlEYzdJNnUwY0M1R2FHUEFlZnhuS0d3VEVu?=
 =?utf-8?B?d1ZrVHc3WEduVUNUejV6WUpIMS83TkwwOU1VTmk5VkRub0FwdFUwS2c1U05Z?=
 =?utf-8?B?VnRmMGZrMUtoUlo5bjFpWER0anBhNk91NDhaVVp0UnlaT1dFWm5CV201aVEy?=
 =?utf-8?B?S0lSV1c3US9VcjlOV0Z2TEhsK3h6VUpJdkxuaHVhaklMaW1vTWJ0TWNobkg0?=
 =?utf-8?B?Z1NVUmtpZzFKb0txalNQZFU0Ym5qZjl2UDJ1Mmdlb0JObXlyZ0VsWjJnRStr?=
 =?utf-8?B?Q2pJd3Z0bUVsendtRzdwa1VvZHNFL0tzdnVHNThjSlpWNkt2Qk1sZS9OR0tu?=
 =?utf-8?B?T0dDb2pVMW9SNVZrTDJTYnFiaDlLVGhQLzZIMzlkbFFvY2UyQS9mWk5kMXZp?=
 =?utf-8?B?bjRqeGUxd1ZoVnVpNlIvc0dYaGxVSzdhY2haRzdJbTlCaXk5WEhMd2w5Y25s?=
 =?utf-8?B?NEhJUWJGMTYzSjBOUUpaaUNlKzNKek9OR3ZZY2x1Z2w5NnoxcGd4OEhXNW05?=
 =?utf-8?B?dm53MlFXTVY1Q094elZSVnpZWmliZ2xpYjJ3MjN5R09mL2VJSXFzS0p6NndB?=
 =?utf-8?B?c0IrNVNHajNSdVh6MC9VemNyL1pLSHBZdjk0TmJLMFJaVDlNcGFrU3FxU20z?=
 =?utf-8?B?a09tc0F4Y0Z3TWxWZ2k1eEpBbm1FUlplVmtRNTFocVhocW5MR3JlK3NCTFF1?=
 =?utf-8?B?Q0x4elVXbTVMaVpaZFlBaTBJMUxLYnE2emszMkxSc3RpMERIMzcwTnozS2N0?=
 =?utf-8?B?dDFTdGlad21CR3JKKy9Gd2VoU0l6WHRGMkxvT0QwamhLd1hXNnIwVzd3TFJ1?=
 =?utf-8?B?eEtnRkpybTA5Y09IeE4yNVoxTHJnVmVrbDBKUXdFRi9WZEppTVhLcnNvTWk1?=
 =?utf-8?B?emlwckUyOGE5R1FqUHZEekF5a1F2dHlNby9Ia1JMTUd4dm5KbGwrcktYZUZ5?=
 =?utf-8?B?dk14S0VXcFM4ZHdBS3dSMm1Uenl6UFYxMUtrVkM2ZEFHQ0hyWTZjVDlOVTZo?=
 =?utf-8?B?clZIeXFud1FrUnFFMlJHbk1vOUkvVTl6ci9WVjJsa0U3Q0NyL0JXWWd0MFEr?=
 =?utf-8?B?eWlPK0UyOEFoWDlmbE1ZWWpocGZjdjUvWjgwSXdZL0p0cVl3amdJZHU3ZWcy?=
 =?utf-8?B?WTIwY0VMUkdEM250UHlkTXFEblVSMlpjdjRxVE0wOHRyRVVnS0FTejEzTG5W?=
 =?utf-8?B?b2lmL0lZTmpZVS9xL05na1hpeDJxdTYxZ3NyelRmR0hrNjRQQ3REUGxYR0Z6?=
 =?utf-8?B?WVdBRzI1elRSaENLMjE4bERrcFBVV3pBeGJ6SUlucStqK2V3bzNxNWtkNWFh?=
 =?utf-8?B?bnlhdDNvWkJ5WDJPUk1iTWxnNkx2dzBsem9iNEkxVXFKTks4UDEzR3YyQ1Y4?=
 =?utf-8?B?WGJnNkgzQ2lCYmVKcDUvczJBdU9CaGpwS3hId2FUeUp5emwxTEp6cDlXM2JS?=
 =?utf-8?B?bEU0K3pPREV3clNBVW12aVlEdEF4M3VlRmZleWZJRGdYcVJrd0lJYVFkanI3?=
 =?utf-8?B?RUZiT2dQRVNYakRxRzN1eVZpdERTbDFCZVZuY2UwYVI4MU5LT3NvUkVUQmY2?=
 =?utf-8?B?bGh0eTRXQjEyb1dJTW1QVlNDNVdERGNxcWtURVNSNXR3U1JKbkJaZVdIZUVz?=
 =?utf-8?B?M1dGRGg4K3JiOXBjV1FKMnB0b3ViVEpiNFRRZ0QvUTN4KzBmME15elUvUjl6?=
 =?utf-8?B?bkVtdlhxL25NaTJRbkMxTmkzOVRaYUNXOG9UeU1RYU5WNEF4a3FPR0JMZEJh?=
 =?utf-8?B?VHB0Q2xDdW93UVNFbDVJSFhjZ2RhTTREcGMrc3cwelZiZUs4Sk9zMWhPQWNJ?=
 =?utf-8?B?VnFLeFVPMDJYY09HemQvTXhPVFQ4L0xMOFp4VFk1L2xCQllBOUM2RzJxWENI?=
 =?utf-8?B?NkZsSEY4Q0hqWFFnMnFjQ0t4VGdQaTRBaTVuU3YxNnd5KzdHbEVlcWlTOU5B?=
 =?utf-8?B?T2ozT2lNNnpEcEJKV21yalowTnBmTGRSL1pNVitZSHB3L0gzTUkvdUY3OW5n?=
 =?utf-8?B?VDQ0SHZJeFdrcWQvZGhZV0JjWURXejR4SEFENUFPM2ZxNEJ1NmZUYVloQTFv?=
 =?utf-8?B?b2NIRzEyRlp2U3Q5WTZkL1k3YXV0RDI3MFd0YUFBTlAvQTlhQkIramtiLzN0?=
 =?utf-8?B?dzVXck9xQ2hqd0dzVWlWaFVwdlZMOGU5L2Q3Y0RsdjJzSlRuNnJqWitBQXU3?=
 =?utf-8?B?c2lDM3pReXdBdFBqZlRFdGsxTjkwb2RGWHNxVUtvRHBxbFRzZk56YVMzZzZ2?=
 =?utf-8?Q?zxWk0L6dJpefZ4eg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01200fea-6b43-4629-af4e-08de88fad03f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:39:55.1122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKWmPKIQc2M/LesZ7x78cktaKTXecOQsWrZXuenN3m0BMcnVtmPm3rjMGdJ5gVbaFn9Fxr19LU5tGDwhgaAWm2rzcbitrOdtcR6mXE+/J7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8461

On 23/03/2026 5:55 am, Lai, Yi wrote:
> On Fri, Mar 20, 2026 at 08:50:54AM -0700, Dave Hansen wrote:
>> On 3/20/26 08:47, Andrew Cooper wrote:
>>>> First, CPUID doesn't tell you if FRED is in use. Is it even on by
>>>> default yet? There might not be a better way to do this than checking
>>>> CPUID, but checking CPUID is imprecise at best.
>>> A reliable way to distinguish IDT and FRED mode is to:
>>>
>>> 1) Load $3 into %fs (x86_64) or %gs (i386) (i.e. whichever isn't thread
>>> local stoage)
>>> 2) execute a breakpoint, ignore the signal
>>> 3) Look to see whether %fs/%gs holds 3 or 0
>>>
>>> IRET has a fun behaviour where it zeroes NULL selectors even if they had
>>> a non-zero RPL.
>>>
>>> ERETU doesn't do this; Andy Luto and I asked for this minor information
>>> leak to be removed, and Intel agreed as it served no purpose anyone
>>> could identify.
>>>
>>> As a consequence, you can use it to determine whether the kernel used
>>> IRET or ERET to return back to userspace.
>> I was thinking of just grepping /proc/cpuinfo for "fred", but that
>> sounds much more fun! :)
> Thank you both for the review and suggestions. The behavioral difference
> between IRET and ERETU is a more robust way to detect FRED activation
> than checking CPUID.
>
> How about the following implementation to add a helper function to
> determine if FRED is enabled at runtime:
>
> static void empty_handler(int sig, siginfo_t *info, void *ctx_void)
> {
> }
>
> static bool is_fred_enabled(void)
> {
> 	unsigned short gs_val;
>
> 	sethandler(SIGTRAP, empty_handler, 0);

What about setting SIG_IGN instead?

>
> 	/*
> 	 * Distinguish IDT and FRED mode by loading GS with a non-zero RPL and
> 	 * triggering an exception:
> 	 * IDT (IRET) clears RPL bits of NULL selectors.
> 	 * FRED (ERETU) preserves them.
> 	 *
> 	 * If GS is loaded with 3 (Index=0, RPL=3), and we trigger an exception:
> 	 * Legacy should restore GS as 0.
> 	 * FRED should preserve GS as 3.
> 	 */
> 	asm volatile(
> 		"mov $3, %%ax\n\t"
> 		"mov %%ax, %%gs\n\t"
> 		"int3\n\t"
> 		"mov %%gs, %%ax\n\t"
> 		"mov %%ax, %0\n\t"
> 		: "=r" (gs_val)
> 		:
> 		: "ax", "memory"
> 	);

asm volatile (
    "mov %[rpl3], %%gs\n\t"
    "int3\n\t"
    "mov %%gs, %[res]"
    : [res] "=r" (gs_val)
    : [rpl3] "r" (3));

No need for any clobbers.  Let the compiler do the hard work for you.

~Andrew
