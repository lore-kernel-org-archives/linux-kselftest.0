Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338E13C908;
	Fri, 21 Aug 2026 00:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787270964; cv=fail; b=MfgoHuPAcEtfA16pe7FGx7nzidf6xgC/trsqPJf7/ZQoNq73XUZL5w6eKGSEoy1YOVCToPAfrQ/fqe/moO9o810rwl7tjUwKMaV3SNSsF1Zepg/fZP6qd/cWmLZx7htLVCHlTnxHa1toOHLnHIzAHGwMQ/HdZnewsBIp3sJ7mS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787270964; c=relaxed/simple;
	bh=Xrg5ShNS5Cn96/pkXPT9ZkGA90wB0hrGttZx/an30l8=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=RLjNcyeqL2lWTPHaid+ZFhh3H7a5yPcHbNVjTThULlI3kSZZwX6FU6vDG/JG9bgLds+iS/fOiaCBqAAYIr3AlqC/mPBT9Ig9ROwrxChN5X1gupqOwSfXOXSxnczF8CEgPc6nhtuwmPsFpR93zkSDnfzy8Lzqzuar2ZJn+Ca2IEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eTRfhMoY; arc=fail smtp.client-ip=40.107.200.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eTRfhMoY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUmQ+XbVinrIYBeJJnXptimPO0lqEL6mDCrNYWFJYWi6JISK4iFxH3Z0yg0tIBI9diwXjCTXARxOvmSz5XUkdWolY9/CHRNFxBtHB7IrJA0wq8/oSLfiHPHWasTF/oaNmkrGGj/mPeFtvm2skJRBB2S1M6Xy890lzJYw2gChF2+wdhHIxUmk8d0b7u8fVDn2WhQwyP+DnUKHdDe0HxxZ043gKjZftyMC7EGIDL/iRQWsEh2B7/pqR7/ZCJ6qtbraqtixKRlAmrWkoyS9puuSt5BK2WJLwS0kFG+MiEuDo6/47nk5mrhnehpn3fqu5EPUXpDjRgo16lq5YegfSRwHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrg5ShNS5Cn96/pkXPT9ZkGA90wB0hrGttZx/an30l8=;
 b=K1tE/OXo+j5nXaDJbXVIonfi8c/7ZjU8Pfho6doAtYPp3PllUK7iGpveqsrWuiBCflzeK/doU8cOmIsE7l4NFRJLZ7u6yLGAf72tO/99PJvCxhECZN/RYPKIrIUzQ4WZEELFa9ldhV473SUZhF/ahHyxLpLfAIZI9kBswudmDgNgDDPvJVflaZwa5dfbCh3G37O7OfdJUiPKb12L4DCGC83TK57jOr6zy1BPqpRzSWx5Ikn0BV4WqJ0uFLw5Ffa1PLm50NFRQU9ZQo40QJrckYFYZ1icxweHEvHka53RNkGaq+aNRvZdVNIQGMKxW9fZyBSvl/vvlu8ZJOOGMDRMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrg5ShNS5Cn96/pkXPT9ZkGA90wB0hrGttZx/an30l8=;
 b=eTRfhMoYUJIDAfoeX1Aa0wQKarDeTLKSYdMRCcS/qs1hDxlJNIv34blRRgOmMP8Sp2ww6mNvGFCHFpk2EOzTp59sisArQ4pR/UUwj3V0hl3I2aBnAKSVjGfCnX+ZFJGaYpEbPK/UcmQpx1+U8pYESG5VwdXE84a0aGM46ffT7vXlnTQhEAmlspAKfZTFDQhYlvWE+7G8QagMwKFMrDhRs5P2/ylGcHLwPhB0VztBNK/DSh2+cf+N1l/WOE/sKPVW1JPN5TU+MS7BCxr5n+U7pMD8asfHGAnID8Xa7XUItvGeaL6QfgqpW4BIuvGLXM0FNdutmccRF/UsmFJdRrYXmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 00:09:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 00:09:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 20:09:12 -0400
Message-Id: <DKU6OCPNSECE.O9BZZWTSU1H4@nvidia.com>
Subject: Re: [PATCH 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Shuah Khan" <shuah@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-2-ab430c58c7cf@arm.com>
 <DKU1AFIKNMNE.2A0JUVSTKHHLC@nvidia.com> <aodxH5Qc6_zVay-M@e129823.arm.com>
In-Reply-To: <aodxH5Qc6_zVay-M@e129823.arm.com>
X-ClientProxiedBy: YQBPR0101CA0324.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::28) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: aa345668-de86-4c45-7d03-08deff186f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rRru/kcwch8M6NSCO/0TXA8QllEXeOjw9Fag46PjoQcDwaR0/MYRl2CT+WgAdWfEebg3CSy02toldCP0wkAYr9X2Gjl/M+TH7+YLh73mFEOdGMvqTKVSp5y/hxg2EbJrYL/+7/+SvQARTAgrz1c6KJo7/PchcYVsQhtTWkU66MuUhjKdHF1r6j4Ze5vucdEc09yTIQIhg2SS7WJoAiYIcP9c/Q6IXIQ9XJ/fEZfA33vGA2ZSDxB7cM1z+knRnZUyvxjD4DPJMQNjmIh6oX+Bxu1T/wqNzNA/LuRPWUApxKdBn4rnNjNvsEs3Iu6HrkNDW7N6EyL5uHx12Ocbrhr+o3trQ2l4itamvY4XckGrqlev2luiKWnzLCDaaz1/cbO0vT6s9HmgDSQhfOeEGVgorrbaYY8tuM/ENysuJv9hCShszQvuAF04Z4XaMyqtl3CmIX+OzMCw1ANcQboe41TWGN1OsIi89oX3HgbKsBAG6sTCvtbKekrLSC92kq7Emi+Q/4L9vNxBkmx+moQz5TsNoC7RUReD5yLwOpuUMefkyo1hKjtdUdMM/qiJeQuaCzbOzIKPnaUt1WzEM7yfZYjXlMpZWlmuocEllCiswTXaG0S+SCKh+ViMkD+qifLadpjetRoiBaleWZdf0bHIC1uae0wJeNw2x9LEs0V6X0cz344=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZMcnU0czNIWno0RGc2Uk5ZczRzL1Ivako4eENWaFZob1RKZWplVkpBRmZq?=
 =?utf-8?B?c3B1RVJ2ZENnSWtlcXFDTDV0TCsrY2t3azZyOFp3MHB2dWE1Qnd4RWhWRGtl?=
 =?utf-8?B?TFQyR3ZTLzM4Y3MzUGxzTWk1cHFIRllVb2JyWXQ4KzRNWUliWlFGUGRjQmJF?=
 =?utf-8?B?SnNOWjM2anljdHBNZUJIK3B3OFo2cTRKWGlyYVZKdmNTeXc3VXZaaHZSKzFa?=
 =?utf-8?B?Q3R1bWMwVG9mT1F2Z20rQ2tTY1NUTHZQcjg0TmJNTzlPL3EvSXFFYmhnZ0FW?=
 =?utf-8?B?ZThkUXBNaE5vUEpLZ0s4OG91TnpMclZnVHkyaXFZWkxVbTgvY0NBbUN0cFBF?=
 =?utf-8?B?VFZRWk5BdjA1ZXN1bjdodGpnSzZGN01QdmFtd3RGSXhQbVowYSs3dVdhdGYy?=
 =?utf-8?B?UFVJa0FDUlJMN3ZDTW81Nm1yalE1NDFobUxJbW90Z01jaDJ2VC85cStRS1kw?=
 =?utf-8?B?aWpORForOFE4eUthS3lOUm94eUdqYkFwaTRSTGMwNXJNUEpZNC9IQmxjYjVE?=
 =?utf-8?B?L2N5ZXNSQm03QVJZanZZSjdnWUsvTDNOeWoxTTZQMkNqRDI3dlozbTE5Mi9O?=
 =?utf-8?B?MUU4M0Irc0hEWEJaR3NHSEsveXQ0VzgxR0ZLMWxEVU5wMmNkY25QNE0zdFdr?=
 =?utf-8?B?SU84VWFTUEVYU3JnNG1tM2N1T0hyOFNmZ3UzUkJiWWJwZG1sYXE0WTJYQmo4?=
 =?utf-8?B?SmQyT29vMVBiOWtReUNiQzRYUW9kL01Va3MyRlJBeHVGbzljVDJkMGRVUFoz?=
 =?utf-8?B?RmFRNGJoQlhqclp3ZHczOWU3NGhyLzVhOGorK1VzZFo1aVFWZHYreGorOUxy?=
 =?utf-8?B?amhRSkprd2t6NERGM2w1MEYreWRNa0tNR2JYc3R3aG1TVDdqeXJLYU5yRWNq?=
 =?utf-8?B?VEFTVmZUbjhzeGVzK3o5ZmduOCt4RElKVEM3bmc2QWttODJIQ0F6V1hTZ2F5?=
 =?utf-8?B?aUtaK2pZakNaSVZtTGJyU3IrWWFvUlcrVnVFMHJwRVpFRXg3QjNmT1g4bnM0?=
 =?utf-8?B?cGtKVTJ0bFhUWHR2TC85b0tIQVAxN21CalllcGVaWDkrVlBKWEtGb1BWczdj?=
 =?utf-8?B?NFpodXVFSXkrN0ZYV3Yxd1pPUUlKdnNEZS83SXl2bklmamJkeGwxWEZLOEMw?=
 =?utf-8?B?Vng2aE1GTDJtMmRvaVQ1bVpOeDJxZFl5RmhKRTVLM1lqTGtpakVuMksyRUhV?=
 =?utf-8?B?WklaQXJFM05WbE81YktISVZCbWJkYmtPVy9ockFUdnhGaDR0dGVEUWo1NnRq?=
 =?utf-8?B?cFQ3TkZsbnZSWTNhekhWdWFZOFlzbkJQeHVDVnN4VEVuRUZoZVMzVWo5aDFF?=
 =?utf-8?B?WW9mVStIMmYwOVRpUzFDR3JrdC92Y20wYTVaRGdCejJLYU40czIwZ1N3cFNZ?=
 =?utf-8?B?K255Qm54RCt4dUpjajdacFRxV3dUdXVnL3RRSXpPd3hCME1rYUp2d0ttOVQ4?=
 =?utf-8?B?em1sQlhrVVZOMS9NbDdtcGFpREhic3BzWUtKd3R2LzlncXJnSXoxb3FFbk4r?=
 =?utf-8?B?NjRJNUNlVXlvMG44RElhVEROb2dsK1FzbGZOeURBVTJxTk45WCs5Y0FwaG81?=
 =?utf-8?B?RnFRYlJYNVU5R1lmRjZSN2xvMTVQWVJ3RjBPbzZleDUzeEtvRVpFWStudHQ0?=
 =?utf-8?B?dDljR1hsVyttTjEvK1NUU1JtNkZzYk9FQm96VlNEejNJUWRIYVFzQThyUkM0?=
 =?utf-8?B?VnhtbFVEZjg0M2NuVE5Ja3pDNFlDeHZqcHR3dUpZRXFFSU9yeGV5bUYxMERs?=
 =?utf-8?B?VkdkMTV2Z2Z6eGJVTmRGelNJYXpjV0RzVkhIckRUVDltc0RBeTlxWWxKRHVk?=
 =?utf-8?B?NWJyeWZEVEVKUjJsUWRWVmVXRVlMZVNCbE1kWEZSQUZhR3BHRkY2Y1ZQSkNl?=
 =?utf-8?B?djRNcllMaXpVdHFLNFNRdkVGTy9QMTR2MytHYnFhc0c0THhhb1RWazJCaTNL?=
 =?utf-8?B?czVUejRkTkhHMFdTL2lNZ2NyejdxR1JJMVF2SDJkQmR1V0ZTbVB6d0h4WFpJ?=
 =?utf-8?B?T2J3ODVkUHR1MlJZeWg0M01ET0dJV3hGSy9WTmtoUTlqcUlFTGo3UHhlSnF5?=
 =?utf-8?B?MFFCTitOVGVUSTJ0aGJuSUVJS1I3N3g0SE1YQlV5SUEyekZnU0xUeFVGaEIv?=
 =?utf-8?B?UWpzRmErTVRUZEVZWFVoeE1XWkYwZ29nMzZqL3UrNUdWMzVWSGo0VEg0OWU2?=
 =?utf-8?B?aVdoWXp1UmNKYktqOGx3eTNmSVVIczhLR1VndG1GMmRYbmV1M1RGdkJUT1FK?=
 =?utf-8?B?ajR1VURhQnN0czc4Y1l6S012blNhcUxkc08xRnl6QWFnWmhZbkNBMHZLUGps?=
 =?utf-8?Q?BwSXFQz1t2lN8eNjUH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa345668-de86-4c45-7d03-08deff186f23
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 00:09:14.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObrGakHrl8dNNhWPAgbsLjiG7WLkLK7gqrgO6yr5KJEg1b2y8XtKOVkrul/xrxIz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644

On Thu Aug 20, 2026 at 5:26 PM EDT, Yeoreum Yun wrote:
>> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
>> > Since glibc commit 321e1fc73f (=E2=80=9Cmalloc: Enable 2MB THP by defa=
ult on AArch64=E2=80=9D),
>> > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocatio=
ns
>> > made by memalign().

I just googled the commit and find that Dev did that. ;)

>> >
>> > The underlying VMA may start at a different address from the aligned
>> > address returned by memalign(). Furthermore, a subsequent
>> > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
>> > already set.
>> >
>> > This causes split_huge_page_test to fail because the check_huge_xxx()
>> > helpers incorrectly require the address returned by memalign() to
>> > match the VMA start address reported in /proc/self/smaps.
>> >
>> > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
>> > /proc/self/smaps to detect huge pages and change the meaning of
>> > check_huge_xxx()'s nr_hpages argument:
>>=20
>> Have you checked Baolin's patches[1] in mm-new? They resue
>> gather_after_split_folio_orders() to reimplement check_huge_xxx(), also
>> based on pagemap and kpageflags. Does it fix the issue?
>>=20
>> [1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.a=
libaba.com/
>>
>
> Unfortunately, No. since __check_pmd_huge() in check_huge_xxx() still use
> /proc/self/smaps [1] for pmd THP, it still has problem though ths patch
> series applied.
>
> [1] https://lore.kernel.org/all/56b16691f605426b33b5cf47319233de6127a6b3.=
1785985999.git.baolin.wang@linux.alibaba.com/

In that case, is it possible to use and extend check_large_folios() for
all check_huge_xxx()? You still need pagemap_scan_get_categories() to
check PAGE_IS_HUGE to identify huge mappings. Or at least
check_huge_xxx() in your patch can share most of the code.

BTW, in your check_huge_shmem(), expect_huge seems to be inverted
compared to other check_huge_xxx().

--=20
Best Regards,
Yan, Zi

