Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A9445041F;
	Wed,  5 Aug 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931427; cv=fail; b=UtGXWWSnbhqIqqzc8InYsvuibxo3UnghuwK/eYOh9Fvz4fkiftQW7XYojRtmGOWq3HWitPspPFbVMZo6x13bi+CMy0waDrahS7tLR4PXbUgv55c8LnUCop2GDr6q4mbcIezQFr/L97QyCAqdu5XOCIT1GhkDs2RDyDGBqxQeX6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931427; c=relaxed/simple;
	bh=GqWuG/vijU/8OAG1VVTS5SNshTz8Ef2uX/29Niikqog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uzy4s+Lhr6/Dxq9g1sKCEOMJDVv9TqJ+ruAg2eb82pNDHxVeM8XKWoefhEQJG60CFiaoPZml0uQ33y+6tMxr0BOgJCzRd9MrAqSfDRUC4qnPC0P4tAoJMfwgWa2jUfvU1Wjj7U2TBDQewx8O5eF6vDyJGFTJeHuMzLO0vmMHXpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lkKLIH6H; arc=fail smtp.client-ip=52.101.53.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lkKLIH6H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibWiiSAunLYiGq+PMHqUehN1yWqhF1RWK4Fbp38dS47fSspS8jaZj5YmryVUTXdPfxJnY5UTHTUZUfypdgzNoNugoVTR5PpnbrmWrUx1wZUUpR4U6uA6FW1zyPWNCfJfu0B/4+URdYedhbDzrEWP3nFTujl1nRjA31dY+nGB4QJV3klRSf7euDC8Io5t4tpvUg1QZNRLL4RBktL3oUBNzTgPVHkyQL4Q5P5OQNEbBY7KH7RHZHt1g8gFuOJN+Ey/z+pnAbudBcuFZ59O8+5gkZzUkQO0MsVCZWgPMGuGMD4JTrMx+MEIeTxjD9VG64iK7d7ckB64dsscEV+CAdk5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GGGxmnsBL+xC+y6iPpg+l2ZXqAWscTzrr22l7BgzOk=;
 b=Wam/2NNNZo+OfpU8CgUOExUrpalf8Ue5uOHxnQEj2ArF0XM7DyOz8O8tE4AhXQICrL+f/14G72FvG96yI/EPU53LHLWudedzfQxMNj58QZCAAJKkUOyEyda0OpxIvrArOYfah7vN6pfdNh9o+aI3H82iBGeorBIGuywqTpR8SSbze2AJBvZ/4v20bCN40Y6bR2cYjEtEtfXeVEUbCfAd00Bp1tV9gKDOhZi/iOxo4NYF2wIHaFQACs3pwLYexJXhCDRD0jJCP9TSlXybTnAJ9APXbDQb9fjUcBPuz8GmX/jpsGEcCQssflrlDQSQ9o06AGsRDmE444PSVT8J57fazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GGGxmnsBL+xC+y6iPpg+l2ZXqAWscTzrr22l7BgzOk=;
 b=lkKLIH6HPFcd8lxVV3cuBZOSHc8BZlV+MKYV+Va2hsHgikxjASiBYRVhkibb0jRh9N/yeZHKWKKJaOf2ie/xqm9Lh+5wSottBssGF2If1aKdh8/azFLpZ6+PgIjrmU9sBihosuxqwwBIcSYfcii/IPndLjjbrA091iMbStJknjscwjxYAiatSlfT4YurXiRJbKbHYl6nau6T4sOvnD2k2o95P7D1wWQlPDxOBQohO2dI2eZj7L7MmdnEnT9jEXtrlKavniA94+BCPKMGJFLFyWwt5Ippxbn4/G4n/e+ZSpY6eHoMjv/h4rUCz28fgiMLLTy1z5KBb+QLbcbBm+9NSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:03:35 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 12:03:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <kasong@tencent.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nico Pache <nico.pache@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] mm: support splitting mappingless swapcache folios
Date: Wed, 05 Aug 2026 08:03:33 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <590B3189-5B66-4ECB-84CD-7B7EF18C0E54@nvidia.com>
In-Reply-To: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 0059d001-99bb-4031-4aa3-08def2e99380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	rUmWr150zUAWZnKV7lTlEqrJe76Wd+rcBaBK6YL9fSWFLg94KSLjF+M9lwtSBU7rBr+DoVibuB6vC+q8StKA3blRZw2mkWf3Msg7rfF619vFncSnLtX0BCBgoYJVt5Rf3LbT8B9Ley1juQIjMZVypJDRPmivSTqYNGhes5UeQhsFuwYWXtJUKOPHGuYrdTbIB2s3bilI8qiW9DY+0BNg+VNjipaM3dzVuTZadyJniLHnBWmvjeVBBfVGRHEFTKn5a92fFJGcjZxxMrlm7tISS8OgzRRxjiUJdVwQ2r+EyktmMXEoMOorMN/YE1EjFKshM/6mf0XzFlQC3RpT3a4I3JDZEj8a37hXigUj00k147tqbk/B4OGkul1Q6Eq2XIp0Q2ZW9RVggUsMfyWrv+NF67WC4DjnP78qIr4l0gClla4qrl/CVGzfetPtTZ+JG2E0NfHO43XbJ/btnlJ4VQh/2wKmVoJmjOlfmfKVslMWNTLfy/FcNik93YzaQrSHncdCQNVxyuH5j6VS/pQv63XSUf6VXjIHje/fQcgw33VcIBqMHa/JNZMQG0kE1ELlujFume1+jo7I6uXG9SkCinhA1Hk0sna5Gz44achkoLYjJ65YfpZhjYxTuWINBaHXwbxZgKC9DwLxQwJdiL2+mpulL9RUGwL2vk3a0FrlHG7u/nY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uy84b1BFSVByeFBmVXZhaFdTMm5wWllvMlVGRm92OUlNbnF4UUdzdTRad3c1?=
 =?utf-8?B?NzRxTWJrVU1WRmhKRHc1b3V6V0tOLy9lcnZJeTdDa0FuQXBCQXgzK2wvR2li?=
 =?utf-8?B?UnBBY0Q4OVgrZ3BXTWVObjJVREVTcHJxaFNSZmhoMFRpcnJmQldBOUtxdG1R?=
 =?utf-8?B?VjVoSlBsYVF2b3JqdUJvV2pZcmxZeEFPTnFGOTFGL1hSUEFmVStlWnRDeTJt?=
 =?utf-8?B?QjUvQmtUMXNTbDN4THY2WGcySmp1c2xzUFZOMTRKRDVSVlVOSjFHZTF6bXRH?=
 =?utf-8?B?bjJlZ0tVVG9tdldFbVpLcTNnWnByb2lnVi9MSUZEbFpib1pmR1JtVk9FeFU3?=
 =?utf-8?B?SFRvRHoyTGpNdVM1dVNCK3RKQ2VXNHFYRzBtRFdETi9RQVFpMmJMRFhkRnky?=
 =?utf-8?B?ZVlZSW5menVRZURMWEdKSVgvUFpTcTBEZTJMd2FBWnF6RzZqQ2VUMGJhT1M5?=
 =?utf-8?B?bTNJRFQzMVNYcG45RDFxalZONG5HaW1WTmhvVnduN3U1bXgyVXlWVXBjOFhz?=
 =?utf-8?B?eUpjQWlTejNGR0lFRkJDaTl2T0Zic1Y1N0ZoUnFsdnRCQjdUZmpleU5SU1RO?=
 =?utf-8?B?SDU2R2I5RFVDcTJwSTZiUEJLTWt3YXhZVTJXMkVEaG92eDMxMXVRUWhYTlZU?=
 =?utf-8?B?dkl3V2VydFMxZ1Z3d0dRZk9xdkw4MTRJYnJMeFJoZVhYb2F0VGwzSW4wNU83?=
 =?utf-8?B?bExKcWdqVHFnSnNWQ3FTbzNFM2t6bHRBSDhWVHRtNzRZREcrSjVxZXFTblpH?=
 =?utf-8?B?TWg0aHhWTU5zMTROb3poZFd2bEVhUUluZUp6elJvbWpkTWNZUDBtTUdtQ1JU?=
 =?utf-8?B?UW11dTJHNzErSzh2WkllYTBlanRoVHc2NldyNVdKa0UvSmxpdU9xRlAzZExs?=
 =?utf-8?B?aVRSRHV2YzdzaDRvQWg0Rmd0cGltVUFXUGtGekdBSnRwZy8zYjN0VVZPQU9j?=
 =?utf-8?B?dm9zcC9vODJPVVhxMzhacHBwRFF1cWhGaEtqWWRqYzRpakRtN0UzY3dMdDl3?=
 =?utf-8?B?WDhHbDVLNnU1VFZXN3ZINmhQRkczejVGZm1RVkZCYy9ZelRjWC9vNkwxYWJM?=
 =?utf-8?B?NHpiOUJEWHRpSjI3SzJUcXArSkJ5dXE4eEZwTENWTFcrOE9lVnNqa2pNV2p2?=
 =?utf-8?B?SFowREkzclhQQVJRNkhZajFWZnVuUm1FS1QwMDl5ayttMGw2VmJ6U0F3Si80?=
 =?utf-8?B?QWt3Q29oSkh3aFJuUG1PU1IvbjdkUUNib1loajBmcERjK2pPYkprWXBRTTRO?=
 =?utf-8?B?ZnNFcEFoWGlxUnJ2czJPOTFqNXdtWE42T1VzVXpuT1lVSk44VkhxVFhTazhy?=
 =?utf-8?B?eWI5S2NkL2orVlBBdElKcFhCQ3I3ekIrVTgxcUsxcXpLUkgyaHExREgvMmtn?=
 =?utf-8?B?WkkxKzdaaklyOW9tQVdCYW0ya2RSUWR1NnhYWE1sZlV2TVV5SUFVdE1FVnhj?=
 =?utf-8?B?K2dtY0ZKUnpVRU5UTGZwckRJdnM1K3NkaG1ldEhiTWFiUFpFZHNhbGhVYjNF?=
 =?utf-8?B?dG1LQ280ZjhaVGVFRjhvSElIU0ZzWmNmSjRDTFZBNkF3bjVEclYyNG5xMWFp?=
 =?utf-8?B?ZXc3TFN4Y2xFV2d4cVJRYlczRU5temJ5ZHA1cWVoN25Ga3gyS0R2VzBvdXpQ?=
 =?utf-8?B?NGpwRHhZU1JmMzVUWlBTMUNVeXJSQ2hvMTc2Y2I1Q1BYZkl2aDlFc05XY0Jn?=
 =?utf-8?B?Y3FwcTdkU2tYQnUrNXk5djdETDV5MVdaWVVjWXVaTW1zUXg5RDU2YW4rYUp0?=
 =?utf-8?B?c1dvbG5aam91ODZMWndwQU04d0gxSU8xMFZRMHJYVE53SFJOaHpkNkJKQ3Vz?=
 =?utf-8?B?bFdGdE5GcUtrdndxaVN6REE5eXlEVkh0VllzQ25SUkdIYXp0cG9MdzFLLytL?=
 =?utf-8?B?cS9uUjVlY0o0cG5XZkxqRFE3N0ZiS3dDeWJ1TENudi81SGM1RXBKTDNpem00?=
 =?utf-8?B?c0daOENCcjQ1Y3J0Q0VtTlAwNUNKb0Y5aHV2b0pHSXhucWlic01wWFR2bDJC?=
 =?utf-8?B?RVBPSFFwTGI3WWRnbjNNY09XSDl6aDk5WjBXRmtqN2VKWjVoTEhnN3hlOFRG?=
 =?utf-8?B?NGQvdnR1Smw3SDNBTldkam1RUFBPQndwTnlza0hFb2tVREx1VnBkY1RsS2l2?=
 =?utf-8?B?eFZYS2xWZ1Y0SjF4ZUU3QXcwMnorRGJ0UFhoMTlUSWNJck01L0hwc3RXYlBG?=
 =?utf-8?B?bW1OU3NWQ0tkLzZWRzVZNXI5bGZLK2RTRW1QM1RlcVFsTnlTMnBVd09JSU9T?=
 =?utf-8?B?eWl4RVA0b2d6ek1IK3hkcGhpbjFZY2ovd3NOY0tSREVGNXh4NEhNcGxZMUZj?=
 =?utf-8?B?cWQra2JtMTVzZ2dpNjh2Qm9BVE5vOHlzWnp0UXNMYkZxdFV3MmNKdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0059d001-99bb-4031-4aa3-08def2e99380
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:03:35.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2rqvXFnpwxO+W9xPEqkCIwCGPl+RM0rtxuW7mt7ala7Oxhu4NLRb4qBPvkS0Cni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371

On 5 Aug 2026, at 7:18, Shivam Kalra via B4 Relay wrote:

> Large shmem folios lose their address-space mapping when they are written
> to swap, but remain valid members of the swap cache. Folios read from swa=
p
> but not yet associated with an anon_vma can have the same mappingless
> swapcache state. folio_check_splittable() currently mistakes both cases f=
or
> truncation and rejects the split with -EBUSY.
>
> Implement the longstanding TODO for this state. Allow mappingless
> swapcache folios to use the existing uniform order-0 swapcache split path=
,
> while continuing to reject truly truncated folios and unsupported
> higher-order or non-uniform swapcache splits.

Thank you for your patches.

As Kairui (cc=E2=80=99d) mentioned in [1] (see =E2=80=9CA bit more details =
on this=E2=80=9D),
we might not need to implement this split. I will let Kairui to decide
how we should deal with this patchset.

[1] https://lore.kernel.org/all/CAMgjq7CHDG8JhesSPMkn1kzG8jKb0BXO756BvxMQC_=
MCn2eTyA@mail.gmail.com/
>
> memory_failure() is one caller affected by the restriction: it cannot
> isolate a poisoned base page within a mappingless swapcache THP. The
> end-to-end test uses this case to exercise the complete shmem pageout,
> swapcache split, and swapin path.
>
> The first patch contains the MM implementation. The second adds focused
> KUnit coverage for the split eligibility checks. The third adds the
> end-to-end hwpoison selftest, which pages out a shmem THP, poisons a tail
> page, and verifies both isolation and the data read back from swap.
>
> Tests:
>   - The split_hwpoison_swapcache kselftest passes under x86_64 QEMU
>       using virtme-ng 1.41 (2 GiB RAM, 4 KiB pages).
>
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
> ---
> Shivam Kalra (3):
>       mm/huge_memory: allow splitting mappingless swapcache folios
>       mm: add KUnit coverage for mappingless swapcache folios
>       selftests/mm: test hwpoison recovery of mappingless swapcache THPs
>
>  mm/Kconfig                                         |  14 ++
>  mm/Makefile                                        |   1 +
>  mm/huge_memory.c                                   |  18 +-
>  mm/tests/folio_split_kunit.c                       |  52 ++++
>  tools/testing/selftests/mm/Makefile                |   2 +
>  tools/testing/selftests/mm/run_vmtests.sh          |   1 +
>  .../selftests/mm/split_hwpoison_swapcache.sh       |  57 +++++
>  .../selftests/mm/split_hwpoison_swapcache_test.c   | 261 +++++++++++++++=
++++++
>  8 files changed, 395 insertions(+), 11 deletions(-)
> ---
> base-commit: 0b53bff4fa05ff0d3ffbd3d3bb10fae69dfab498
> change-id: 20260722-b4-mappingless-swapcache-9badf123138a
>
> Best regards,
> --
> Shivam Kalra <shivamkalra98@zohomail.in>


Best Regards,
Yan, Zi
