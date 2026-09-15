Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60936342514;
	Tue, 15 Sep 2026 02:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439225; cv=fail; b=tkN7hIb4EyZmkrOhitw36f8W0zuu/CsWusJKSYhK1DUEuvFCVw1ZFWlViHH4olDlRT119ISo57LybpIljQat3tAowYl4UcC1wJTN8v8ZFHyNITy41cqlMMj6hGdEUTzNpi7v0/ZSlbSHsMZsc1H4LmJGp/1ANm+RELkebhm1a0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439225; c=relaxed/simple;
	bh=6G/F8sAeTigGmno5FasRhf+WIUvjsog0vUECI4IS5Gk=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=dDI9wpnLw3EzhrGM6K61WEInhCxyPtufW/8u4zEzAvVjFpeO49ltyzCn0gl6Mx/IUrGBC8F9q8M3Q91A3NccHYKoPQE6YH0CTuRGc7zcuLhzqAry6d91JwnaoiQUK4FMxOU8YLqrxx4F1YOBBManQRLzKeq7vclnSsBHSIe8qjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UWpYAtO8; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UWpYAtO8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoH78O001GljYl4dTZ2phtSS4hAvju2PepSWyVS3WwFbckh4dSUZnu+yRSICGk4lpgCCsx5ihLqBDy3gzoEhfIZ7nkGCco9qNPrQ393CCtg8CMmIksSHAvL8ZPafbP0uMzJ+qiXWL5Frl5vnGbHFGNIFtmjRsPKTaVlAfOPRNALaDViZHP0dhOcXEWp5JIem/TfKQdE29LC5F8Mf1FCmkiP9wlN5YcBEaTBxyFCJX94UXseoOaV2NfnMLbcGezByhsta1paQx/HXjhMFyyDqWaq2FZeJR2hb4j18TCfiGOCHYWAHZz6JPcg9+XzpZu8xJ53+TW8vThhL19uZLtFBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd5rFJiMuneqr4sLvltmdSFyHHKlvhkvRaB+mO/b8AA=;
 b=BAWqL821d5VZxdzE5O+TEg4UG3P2K9J+lQfN83B6kSqMzX9cfyjfIUsSS417J+uo8o1FvIErd/q7hLjQ4eaW96fRgwG0iKdarZ6VVM1SVGQZwTZc+2K7hdk3QRNdHZbMqH2wWIPRxWY9DrGbFP536zWD3kIrU/l0nzIcqcYFsApJ1Qi2JJt2YmTaLnJW/1EXNbMbCjngEc90q/ebzAKZarhbKkQWn/KTFa5VLtR7Mv7w6LQ+uUCgAmOoUUrjq/k4Ysp86HKPfZSsH4GCP81vi7kGZEe1zTBuzydqwJNQdWB4AAbeSnWwDQHP8pWQywiAgKYEQ3gn66NxCYI9OaUTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd5rFJiMuneqr4sLvltmdSFyHHKlvhkvRaB+mO/b8AA=;
 b=UWpYAtO8ogntpvqzebIIO/DYZ2G6h9uX5fa46QAIj3KhnrBDWmJtPCPKA33ZvSjpjHYRatdG6h2peHGVLjOG2LwoXoZLpI5f8FrN3nzdo/I2IuxI3qhnOT1C/jWltwrtHYoQg3plHXLQBZ62+RtgROQ8DdChIP2nQg+OIfoFD4iyTT5LuPcUbPPQLReO/aWdA9bMI82ZhOUHqlNWvEzAdY0aeOBd1s8+MwHH88ZgYdyJX63Tm1Oi25D1T5aTk7ZRHyR9/q+ZwCDWLmgfjn3VBMiKgsME8RQJ471gb2SZKQmaSvfJ4n1ugDK2amBesCkOtD1PIUCqpIDPFrDCbCELzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH0PR12MB999087.namprd12.prod.outlook.com (2603:10b6:510:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:27:01 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:27:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 22:26:59 -0400
Message-Id: <DLFJ9GNOF56E.1PDQZVO24RME@nvidia.com>
Subject: Re: [PATCH v3 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "Jason Gunthorpe"
 <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>, "Sarthak Sharma"
 <sarthak.sharma@arm.com>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Kiryl
 Shutsemau" <kas@kernel.org>, "Peter Xu" <peterx@redhat.com>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
 <20260914-fix_hpage_macro-v3-2-c9a305a01d39@arm.com>
In-Reply-To: <20260914-fix_hpage_macro-v3-2-c9a305a01d39@arm.com>
X-ClientProxiedBy: YQBPR01CA0158.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH0PR12MB999087:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f63125-7a77-457c-c3e4-08df12d0d2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|6133799003|22082099003|18002099003|3023799007|921020|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hK0h80alvRBdS3p4nbML4yyEj8fLhBDmR+t4KyAoNGA6fH9tkMf2J/b71eErNBRZT+Dl4O4RzKEbCly6AOPDYqnL+gy7pzE7rfW32qV01yvpo/UgQbUUu/otG71GZwIa+VxB5pJLVRAtEOMNgOs17VG+jIDbJ1KMXtpP4daLIGz2emikffVQJLalYYnmqMLprGf2epQFcLk3fSWzGQgJfXTD0j4He7P79rVFX2hweoLlAFxMW8kVpJYnM/sxpCGL+37jwSp+FZw6gQMTLsXc+gbl4l89n+bLuAORklybL3ZtUtDC3pu7msu7DHdzw/QYCoUCcdbYr1TX9sqraohOJltCBmflg8ky58TdKe/2MvrOVXqEX1KqKucM8ZBovB32EYWkTCZSMyW0ZroYtpYHKrkCWTa5EsaPhCwFcKzLXgf4MgyY9FLplSRm2Nob2u0L8nONKJi2hQeXfWMmfnEMX9vTfYuQ/+mc4ryEqGH9rQrXkYgAI2t43T6jv2LL0qsfOYi2+Mm+GBIS+eO6cgWTGyMM0RC3sVpZJ/+IhgBnT353sqB1SqKms+GcWPXRecIOhmKChiWvkW2G12tH3Y1ESok1nCWQ99T11e+sPwS9g8wgWpk76ZU2iGOjixOAcsyno6pU8/wRKxcq8olbkyCxkBMbcDjJpdQ0UVuadQF+qBd/opQqA9U0eFuBFO2ukwSI+GYQS4HeB+FYgB/yVTpLdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(921020)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xCa0UvSFlFdU9xUTQxcUFrY0xWcHhjZVN3akExblZwc0p3ck9PTjEyREJM?=
 =?utf-8?B?UzdKNTJSQXNURUYzZUJ0eFhXYmtwZERnRnNhYXh0dUJLeHZQQmd4NytkTzBW?=
 =?utf-8?B?RjFwRHZGMTFXVnkvOVJwY0tEYXpTSFlCb2lWdngxbktVMzdIM2dRWEhFclVY?=
 =?utf-8?B?N0lMU0IzRVduZkJpdEtHM0k1NVoxU1dLS1RQSWczVXNMZ01idzhUdG5TbGpk?=
 =?utf-8?B?MHREbE04cTBhajNNQVVpZ0pRZHNoR2FPV1Q4cVJPZHhZeG93ZGoxS1ZBak8x?=
 =?utf-8?B?Z29oMXYxVllpN1JKY2poL2YyYzhlWU1nWU9TdFBZdTBPNlBCakZCNXJkMExD?=
 =?utf-8?B?U0JxN1lLekIya2V1T1B1US9lcnhMUjFJTG93T3dyWVBRYnhocEN5VDk4SXhP?=
 =?utf-8?B?UWdLUDlEZTV3aGxVUXZjQ2Q4b2ZmWGdwNnRtSTMzZUtDVG95ZlhqTXB0Y1Y0?=
 =?utf-8?B?QldBUkZwSk1lYzlvNlBtQWJFVzlHbmNlVndCTjF2cFFJd2NjcDl0K1VONXJZ?=
 =?utf-8?B?WkhEK09tcjF0MnRqMkJMTnF1RXdVbERhY2xRcWZZSlJHOEVlRmdjd25DekhJ?=
 =?utf-8?B?NHJ6WjdWcFBldUIrT2hmZG5waHpQU0JwR214aXNMeGQrVmNiTDJyZldNeW02?=
 =?utf-8?B?Z2l4SmJOUjhlS056MllPUTBSU0NKTEVkc2FUTG9SN09yTUxodk1BeDNxMUt1?=
 =?utf-8?B?TkcxbGo4NklTNHFnOFRGMkFvRjVkNW9lMXE4a2luQVk3Zll6bU9uWFJLeFB5?=
 =?utf-8?B?MFZSQ2FvUkFBZ3h2dHBRb1h6ZGdhMTN4ZUVaclRNblV0dS9HVC8wamxpd2VC?=
 =?utf-8?B?TDRSV0FqNGk4WmY0ekd5SGx0ZjI5Vmk2MmJ0QlJHeWN3L1p1YWI0UXhFekRo?=
 =?utf-8?B?RDhIR0VIUkJMRFUrNGZ1RnkvTU9nK2UvK3hCWk85VVdkZi9XNG9iNXJRWVNL?=
 =?utf-8?B?eWxCK1RUbS8vbWNkN2wyLzFpVHBZcWtXYm13KzJPTzFuaThpa2J2L3R1U2Q3?=
 =?utf-8?B?RVhCVkVWUFFITEd3MnA3UElhVURqYW9TZGRzdXNNcDhNRVQ5dk1ESWw5WWRh?=
 =?utf-8?B?L3VMYkNxM2wvZjR3dkQ2SXZmSlh0ck4zVlozMUtQN2Y2dUtSZndaS2lXdFBX?=
 =?utf-8?B?TnNtTVEvZXdaUk9YaXNlbFNFbE1pLzkzVmV2NkxraFJyQlVzN2Y4YStvQVhj?=
 =?utf-8?B?T2lZQm90WklGYkhrRXRyWHE4eGNPV3BSbklCRUlXNUJWODBjOU5kMDRRN1lH?=
 =?utf-8?B?d3M2Z0NBUlZ0NVVDdEV6WnF0ampLSTh2OUNqc3RuM3VkN3Fsc1Q3aWpzZ09I?=
 =?utf-8?B?cCszbVRGTTZXd1lRS3djV1BhTkwzUXRXSWZXTElKRGdpMWNmTkcvc3JvZ0s1?=
 =?utf-8?B?ZzE4SDRwcTVwTGZCeExLbnVNMWpzY05SL051Nm9GSlNvZEFwU2hKMUJTU21J?=
 =?utf-8?B?bi9kamRvclJNQkYzVXZJQnd3NkFxblkzVkI3WnBrejJYS1E0NnBoSHRxaUxV?=
 =?utf-8?B?aDdlRmNKUVhXT1kwbXZaeWsvT09CSXV4WUNzei9ZNFNsc1BqNjlOUG9hNzFv?=
 =?utf-8?B?Q0w5SXFiQ0ZnNjYvWFE4TTJ2OVpTVFlUZFU1STUvbDZ6SkEwM2FpMTNYbGVT?=
 =?utf-8?B?TzN3RENUdTF6L1lsamtpeTA0VjAybHlkNlhwN2djK0EvWlh0ZklWbjFSZ1B4?=
 =?utf-8?B?VE5YUEI5N2dYYUcreWlPUXg0UStpbm1aTjR6ZURaVTZmRlY1b1JoWVlhWExw?=
 =?utf-8?B?VDIwNU9QRmZvL2xwV0NBbzNvNU9xUDI4NHpObm1qQ2xxejJHOW5oeHFqQTZi?=
 =?utf-8?B?WVZvT3BZZHFxRXptWTVSOWowdzNtQW1EUFp6b3MzbkVMend1VS9mNTRNMVBR?=
 =?utf-8?B?U2svbUVLUTVqNzQwTkt5OVZYcTJHTVFsL3k2VXN6YUZYQUk5OFhSaENWYVlT?=
 =?utf-8?B?ZkNscnVCaEwvQ3B3aUlWUDYxUXZ4VFFobDdmcm9BYyt2eFU4QVh2WkoyUURK?=
 =?utf-8?B?aU1WM0RWQTRyanptQmFYWXBwVllkRjludzNCaEJMOU8xRitOOFRpTFRKS1Jk?=
 =?utf-8?B?M1JyUWQySTlvUVVnbGhDZHE3b3hNbVUwVTAxZzU3L0dGZVVKSXJLUG1UTkNS?=
 =?utf-8?B?TkVrayt1Y1RhemNIN204cUNqOEw3dG1HSzVMSS9XQ0VOcng4cU5QRHNBQnBi?=
 =?utf-8?B?Wko4aElub1pnajJEZGtIQ01EcFhieGlxNFRFZXQ5cGpRVzI2THpLcVhMLzM4?=
 =?utf-8?B?YkQzY09TZlhjUUR2QmZ5Yk1PRHUwd1Jmdi9PcFJlQkU1K0hBbHMrZDhuR25l?=
 =?utf-8?Q?0pKMOJbYlTnRPwyCU9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f63125-7a77-457c-c3e4-08df12d0d2ec
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:27:01.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeHkxuhoGoofdZjalvgJv9HovnhdlNFGTV1XPVsa9ukq15iEzRmpf+SIyrURDuwI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999087

On Mon Sep 14, 2026 at 3:30 AM EDT, Yeoreum Yun wrote:
> HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> When this macro is used in some test, test result would be strange in
> the system where PAGE_SIZE is more then 4KB.
>
> Here is the example with transhuge-stress test with 16KB PAGE_SIZE:
>
>   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virt=
ual memory and 1908 MiB of ram
>     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 fai=
led, 2566 different pages
>     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 fai=
led,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 fai=
led,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 fai=
led,    0 different pages
>     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 fai=
led,    0 different pages
>     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 fai=
led,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 fai=
led,    0 different pages
>     ...
>   ok 1 Completed
>
> Remove the HPAGE_SIZE and HPAGE_SHIFT macro and introduce pmd_pshift()
> helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
> helper, pmd_psize().
>
> Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
> which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
> and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
> PMD-sized units, the test may fail with the previous size of 100 MiB,
> which is not a multiple of the PMD size when the base page size is
> 16 KiB or 64 KiB.
>
> After this patch, output of transhuge-stress:
>
>   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtu=
al memory and 119 MiB of ram
>     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 fail=
ed, 2585 different pages
>     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 fail=
ed, 2585 different pages
>     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 fail=
ed, 2585 different pages
>     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 fail=
ed, 2616 different pages
>     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 fail=
ed, 2627 different pages
>     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 fail=
ed, 2628 different pages
>     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 fail=
ed, 2630 different pages
>     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 fail=
ed, 2631 different pages
>     ...
>   ok 1 Completed
>
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/guard-regions.c    | 11 ++++++--
>  tools/testing/selftests/mm/ksm_tests.c        | 16 +++++++-----
>  tools/testing/selftests/mm/run_vmtests.sh     |  4 +--
>  tools/testing/selftests/mm/transhuge-stress.c | 25 +++++++++++--------
>  tools/testing/selftests/mm/vm_util.c          | 36 +++++++++++++++++++++=
+++---
>  tools/testing/selftests/mm/vm_util.h          |  9 +++----
>  6 files changed, 71 insertions(+), 30 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/s=
elftests/mm/guard-regions.c
> index b724d62d2b75..eee29ef88cb2 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -2195,14 +2195,21 @@ TEST_F(guard_regions, pagemap_scan)
>  TEST_F(guard_regions, collapse)
>  {
>  	const unsigned long page_size =3D self->page_size;
> -	const unsigned long size =3D 2 * HPAGE_SIZE;
> -	const unsigned long num_pages =3D size / page_size;
> +	const uint64_t hpage_size =3D pmd_psize();

Is it better to use pmd_page_size/pmd_page_shift instead of
hpage_size/hpage_shift for clarification? Maybe in a follow-up patch if
you think it is reasonable.

Otherwise, with David's concern addressed, feel free to add

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

