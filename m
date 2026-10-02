Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010039.outbound.protection.outlook.com [52.101.193.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E84BB5D4;
	Fri,  2 Oct 2026 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961419; cv=fail; b=N4umpLgxm7HJ8eZkfrj7GnuSCO+rJxhPW4daV8eLzxXREJcGW+dNVl7Vd0JETDbfojv0sZiOgcgxdY6W3zr18DMwNbpkJjMXVAa2twCtAIyUJ4tSmh+N0aR81TiobSoPLy4a5gw2N7A2mIhBpQJcRCMhOor2XaLRI+VVpitjGLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961419; c=relaxed/simple;
	bh=64P5HUCwxLEmSp1vp5RrAEhdRdcORXfCWZaL1aIcROA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oiHqvjTopdubOXGQJmW9yn4inFbS1o+WoD7XfKvJcAp0pEeCHM1w2n5WdnsmdPtcJ/zNhQAtWCNqumAzn2K+bzb4HI1ZPMOF1w1Y8qihmcqGlFj/4mbesoHfL88YByZ7U/5aWZEHi/tpHOXWne+jOi8ddhruSrtJIcsPty8kVAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R7Pmz0Qf; arc=fail smtp.client-ip=52.101.193.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R7Pmz0Qf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKM21wQ1i9/1IuddO5wNuXlmjbiLttk+5O2GF0jby1i7WtequB53oYIV9fCcKk/DzrvKisaVM3TdLJ4bQwCnpg12jvjm/W6sYrMNbGmyXlEsdmkzg9188CDCmp6ZqoKCW2QGB+ZqG7rhz9H6jhVPn0vUrOeivCkJ8F2HgAWVBCTRv1hkSMPi21c8Z6BijHfWvjptZl4v41dq7cvpzg7gpP2u3oj9l7fv4TysID7dp9nWyLGdPR846xq80x7oVNS1t4mPQANdrg+GR/ZG6/QsYgVKR/vXhVk0S0mI1H3T2H8/T+2dTTCKWGVX/cgM6ji6Vg4PEdaNgrCJcurZKrAVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ola+kWt3nSqUZCB4FVLNsH+1xMBDm+bb8nfDPEnccwU=;
 b=klAs8sAQPnVVDPgOCduPyFhdKh3hS7uycd56J+OHH6kfR9SEszmI2B2+u75acY8aa8rWoF3s/308nTL/JZzfQvoTe7BjxfBCaxh1We8hWPp6HoN2dxWEJ6opFePJFgz3xqBhnbphCu5eOOygZoI7GBhLB60D6JawUdm6h15xrTBlzjjY4EyG21ppO0rz2JdsBbbUMFtcUmq2BZ9GrOqm3X+5rShmiJkTJL+IThDIsxd5bfHmYCdu+qa9jHkJKVq20jTfaVX4pYYJEO4A5/aJwExsS3Wj3CpwW79mrqcQoesVAeYCcjwYcKYKR5oA0IWFeOkJWCYCr5zaERtMKWyuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ola+kWt3nSqUZCB4FVLNsH+1xMBDm+bb8nfDPEnccwU=;
 b=R7Pmz0Qf0oHC9XlYDEhXL/LeJIEwuMNfCbS2QxqfBSEwhvyHaUS0gwKAQKOPB4XsDmJAl1fPjX0TrH5azy2JUrV5K1wKwIqgVJwcfGbQBRi2pNs7wkGax47Jb3M/0nHJ+uwD8YcT5bbIJUMp+s6P6k33hHTcarqbL4aiRItooYO9UGSVEyEg4szwFWgJHUg0XZvHfBZi9g9mtbcc9He54RUZGEbdDRvWMHm5ZSPs/sLaeT7bBBrRYWm0op2GUzDT1aZEOORrt4ujclsrFJm+qGaHKm2YefoQaICsj2iFp42Hkl2Keg0riSNOcggnPK9NmcSw2VwL6t55emc9WSafzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by BL4PR12MB9484.namprd12.prod.outlook.com (2603:10b6:208:58e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 17:16:44 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 17:16:43 +0000
From: Zi Yan <ziy@nvidia.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v9 2/4] kselftest: mm: replace usage of /proc/self/smaps
 for __check_pmd_huge()
Date: Fri, 02 Oct 2026 13:16:41 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <4ED8960A-2BB0-4282-967E-E821E11B93E6@nvidia.com>
In-Reply-To: <20261001-fix_split-v9-2-0f4ba8bbdbdf@arm.com>
References: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
 <20261001-fix_split-v9-2-0f4ba8bbdbdf@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAPR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:208:329::26) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|BL4PR12MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8f6989-1c63-46f2-e3e7-08df20a8ee6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	2tSWQjhog5Y0opWoVDs1/s/Ugr4B72f+fHFKtfJ5C/UPnjEzH0n1zFgCcWficj8H6nsWipBHAcUnl6b2k0sPJ2BpN0uCr+3i9RWtxKePrj7VGU10KNVBmBIoQiKUu7/TzchYWN5P1gxVyBykVIl4vkRfZxkl6PWrbrvxU+tsiifqMhANY065u5bzrl//vnIHyduGPch3iF5VLu11mQxQgjyZhBPOzv7wcnabtWVKor4RiyyFaNnRHUxOL/s6wqQSU7MVTxJx9cAD/qSI4lwgJMzYf3b8ShBFh8cllb0NZdTEjuYABtWFgHpXeK9b4y6ve62w4G4kyPxFKtbzIrb9CEDX9EHX8mO0FxCR6uzSQMWOGmSvc7Xx0jyv8hLeV30QjnZQzD5z4bKW/EBgXthYJmyAmCMoj2JIMT6OnaLgQ+Bv6cQ9FRIPTccUTE39wVV3cmGUSzTLonE8pz4Ecw7zF7Nz8U9HaQmJn/bVaWqfxpw4tUhvBBRlnZqqDTBwFnugqtXvX61OFYAr68tfPMtfM3m/Yhb3mT1uFtLwASlNZSqMakzkrofub2Dx7gmFESpQ9RJ+wPErbri+vPkHA5Am7ei7tliAlOk+MhMU9VzT7Y7IcD9+tiuU8nykJ9dusA2rYDRqEt7qrQm60xBgywJN/4rj++TE2MyoaVFwdKw4b4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNjR2xMdlhTdzUvd3pnN0s0WFNjVkZtWFZqUnVrZm5HOVVpNDQySkxVNXpo?=
 =?utf-8?B?V0hUWGJwL2ZDbFJvYnRGeWNJSVIxU3FGS1Y4RjlqTzNXUVFTTTdXc3A0dTJG?=
 =?utf-8?B?UE5YYkpiaUFaWlFPaXY0Y1ozUFE5YzVZMFZYOGs1U3hoSmV1NGJZZm9DKytk?=
 =?utf-8?B?SE9wR1k5RElaUTJuSzY1RjNWc3B0RFBZRW9ZV2pmOG1tSmFFNmY1b1VWdlJj?=
 =?utf-8?B?cmRrSGNOTU9kb0ZzWnFWNWpCRkdoK1d2V3B6TWlGSEs0MEVCQzlHVjBDZURZ?=
 =?utf-8?B?MG5peWRySnZ2VHJEWG01Yyt5TE40dWVvSER2K1RMb2E2RjViWHdlMjZ4K3hj?=
 =?utf-8?B?ZkkzSThHL2NqVjZMVGk1alFTVHhKNTk1RUx6MWFyR2hFSnZSdVhOeWlCdEx6?=
 =?utf-8?B?Nk10Um5sbUpzOG5Rb1FMd0xJa2RUdjlGMCtnc3VjZi9pUzRHQXo0M3NGZnBK?=
 =?utf-8?B?ZXlGRHgxaDhlWUVYbWJBdy9EdWMwYk9NQlFBdUh6ODdTTUhPMFZVSFZoUkxY?=
 =?utf-8?B?UFN6eHhra0ZHNU5qMGY5aWRnaXJCNjFFaEZTdiswa0s1MmdKR2ppU1pEOUFT?=
 =?utf-8?B?OWNTN3ZZNGNrMlBzaEtYckp3MDcvQjgvV0R6eTArcUNkcEdyQjhVUmlselpa?=
 =?utf-8?B?OFBtNnY2R21KTUhmd0lRUDlMSHRyZ1haR2V4dmxOVXFXd1ZkU2daQ0Q2VUdR?=
 =?utf-8?B?a1BEZ094c2RXaHN2WlV2eGxLSTlqSkQxSVE1LzdCNUUzZzkzdGxEbVNweExY?=
 =?utf-8?B?UGtPUU43WlpESjI4bmNYS3V3KzlrSFRybjgzRnl3UXFrU29LTW5ncDdGd3JH?=
 =?utf-8?B?bUpieS9FS1Nxa0hFSW92SjIwWXhNUWdIV1lFMFdURE95Y0dyOHM1MStUQnRG?=
 =?utf-8?B?RGNSSGh6V1d6WEJNcjkrUDBTb3NoVDF5bE04MFdjbm0rK0hvTGJFejNrSWpj?=
 =?utf-8?B?bnhyM1cvbmh3UGlyU3NoekRJZlRlVEx6SjhMM29OVW1PRGpGeTlTRFlDRWFB?=
 =?utf-8?B?ZFZIOVRGb3NNKzJPeFJyQnBRekk2OEJWTTd4OXdHVmNjS3BkZzNnelNzYmpO?=
 =?utf-8?B?cnZ3UWsxZ01kWFZJWU9lRDl3cFAwVEZyZ0xWYTBWT2Y5OU1FTUZVSVFpYlFq?=
 =?utf-8?B?amRidk1ndzBkSlN6ZFkwQis3MTlNZkZWblE2WnkyQ2VHS0dBNjI0RmtOT0t0?=
 =?utf-8?B?Qk5lVThua05BcEl1dllnYkZBNnRTczJ6Qk1oV0NKUW1IWHgvSTU3U3hZc0hU?=
 =?utf-8?B?YUpxbnpVOGlRRzF4cDAyeGw2eXlBNmpxZHZJVXR6TVFFOFRPaFFpR1ZGeTVT?=
 =?utf-8?B?MG0yMHBzU2FPaGpLRldjSExaOHFRRStOczRWR3ZuK0JvYkhGOGw3cE50RXBZ?=
 =?utf-8?B?WGNsaGNFZUovTVN4SGd3bkNlNWgydU5rNndweWRXSXk5NVVPc0RBZzRZdWl4?=
 =?utf-8?B?NDhYUGdHRzNiMFAzVUlWZFY2Y0pQdHB0OWUrZ0pLYkdtWnZCeENHSEMwOEpO?=
 =?utf-8?B?RVdzbTBpdGtDR2JVWCtTNnBXSXpwVnBwQlhhSmF2elpJZDNtQ3hrMTNCM3ln?=
 =?utf-8?B?S1dhL2VZcWd0RmRwVkRWZ0hCVkkwRHZteGVCRjFRNDZoeGJCVVk5aFVzVkZK?=
 =?utf-8?B?RCs3NUVXdU5EcUVZbVNyV2dFRDBaQkowdU84VFNQb1dOU083VDVkeTlhOG5F?=
 =?utf-8?B?eXM0ZGsyM0MrUUsxVGNzYk84S1Q0S0xRNzI2Sk15a25RTGVnMDdVYW5FeDl6?=
 =?utf-8?B?ZmlOY0tLN0FDWWdHbHNkekV6TUVJSzRVRHI2L1k4YUJEWjZBY1Faa2hDWTRD?=
 =?utf-8?B?QVRRUnNSVDVxOVlzdm9sUzY1blQ2MlhydnBNT253cWFnRkJraWhUVGRPZkdp?=
 =?utf-8?B?NDBERkMrVmZJZEhucmNBTm9iNWh2aUJSSmdNZHdkbXhrSUtvcWlTaUxwTVNv?=
 =?utf-8?B?RVZqQnErNVpudzRFSEtLSWRZSllmaGNwQ3hmV0NUeTZoZWFrMXlyUW5KL3d2?=
 =?utf-8?B?NmR4VitJMndVQm41bG9zNW4xcytER1UyTDgydXhKWk8zL0IxMWNFN2ptanBZ?=
 =?utf-8?B?TStBRU9RS20vdmVuUW1lM0lSb2ErcW8vWlZXMndOU0ZFaWx6UmswMHZ1SEsv?=
 =?utf-8?B?cmdTNmpwVmRHbGNlUWdUWi85blA4OUwrUE9iTTMzQncxbW9aRStCUVFRajkr?=
 =?utf-8?B?YWcrcUU0RE9LSEc1TTdTcGUwSG1DWnhZR3ZIV0I4YTh5WmZTekg3RVk0WXlC?=
 =?utf-8?B?NTdRSDBPUXRBT1NhWE9vTG1ZMU9XVldwWHNQeTNaY3daUkhCakJobFhzOE1F?=
 =?utf-8?B?a1V4cEoyTWxZYlhHTzg2ZnNtSzFESndZQ1hWOGt1T2UzbEV4dHVOZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8f6989-1c63-46f2-e3e7-08df20a8ee6c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 17:16:43.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXaJ3ZtVOwFnCDmf5RLKn5PDZ3GrH3GTesGDs27PM2Am/ddc+dyY73nzMvi6d+8v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9484

On 1 Oct 2026, at 17:17, Yeoreum Yun wrote:

> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> made by memalign().
>
> The underlying VMA may start at a different address from the aligned
> address returned by memalign(). Furthermore, a subsequent
> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> already set.
>
> This causes split_huge_page_test to fail because the check_pmd_huge()
> helpers incorrectly require the address returned by memalign() to
> match the VMA start address reported in /proc/self/smaps.
>
> Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
> /proc/kpageflags to detect huge-page mappings checking PAGE_IS_HUGE
> and PAGE_IS_FILE according to type of huge page.
>
> Since shmem pages are also file-backed, simply check whether the page
> is file-backed.
>
> Fixes: 642bc52aed9c ("selftests: vm: bring common functions to a new file")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/vm_util.c | 78 ++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 29 deletions(-)
>
LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
