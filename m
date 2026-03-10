Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CC2DEA6B;
	Tue, 10 Mar 2026 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169177; cv=fail; b=a9ruotyA156Nz7CSGfhPEf1vkvKr9iW4pfhYC8ZnpyKkS0FSel+RfGSn393oAMXp3ymsQU2xbhhowMR2vnfFiI+e7CGQXT6kFLteE0DXtBoRvzcGQsjfAFnzbF8T39NB+LkdXd2g3SqP6rpwV/+/jgG8GFFfEI+a6FgVJydFy78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169177; c=relaxed/simple;
	bh=m8bZyTTUFtazhfBTZ0jk2dDfvIppBY4QCeGiMIEz418=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C7WMmFvEHSsdoY7S3cq2DogUPJVN/4wFPgmdLQWgdw2A1EgECLv6j+Jdl9TVSUeLyyLpWJyo+dxKXb0A0Mm4EEqJ6naD+yfKIWdNhrmud0tjVHy9a4qN2EegM2mXTKuvlZtGGMsUkhvVJXtNX1RR+JIcf9ArX8gpRsDKwYdt21A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uBh2taJG; arc=fail smtp.client-ip=52.101.85.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uBh2taJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdnPILxaAbdGseDpjmO9GTL19Sj7ED6MbdgHL9kS5K+2Y72YM2ed6bPhCqNC2b9ecULWyQMLGqOp2250Nzjc39DCX5FnX1KoTGrLwFq47KBmTTZmomwWESFsviyH+MaOSjzgIfydfLq/93PwPx7b81+2skJnFA2QEfCKQ+JiZBadCm/O0l3eVECovexUkcJ/4QEZYUCjWxkG7eibG8rMlyprXRRLcnQwBr4NhRUB4jA6WbzivZaxuMElKo71P62DJ7sBQsyepglz4/UytcLeFW2DjgZeVGzw2/8ySJ3LeRldNc7zO7yx+u4CJFpOf4qM6fktXnxguCcefSe/nsYi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9aZfxcVtJ9gwO51CPBtlnPV+3CqbkVSbepCaN+SWgQ=;
 b=a8d6qWIfL3Ifktj6wSGK7PEI5KDp3+h1LFhIErMfG/3UAwhHJ2WfocsKT3oAQQi+onlzqKTpDux8eLUkIvOWhGC3+PzttFJt4Q6Lz4KvloCVN3+DPcfTGRllkf/lyvrXc0RFhS29H1KEuYbfhLnz+18Md2IEGAUw79rFKCXVPYkTStdj2y8puh4bThHdI5T/T066WRuD2VecQXiklwrreLslEMU9q+Tue+yDya4k4T5/m+Q8+Ed7pIewz8Ud12fTwXDrmTYPKZF2K6GvdRVARkb5I3nKRIWMktmp4iXJCr6iciN3/9vZfKcS9YMtpzoDEc4mc5Mm52RK7/Z8YP7+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9aZfxcVtJ9gwO51CPBtlnPV+3CqbkVSbepCaN+SWgQ=;
 b=uBh2taJGeH8PwTyd3G5EhhmeUHy4G04BZGWGWj56Q8+3wmgIJgN4AtkqGOP105oy9OkIo+wl4v+jvWq0R8X+DtiW6jIAv8QJaaXd15E7ooueG9v4mfte10d1Izorz33cbhMZjEdPYYioXJYnZnZb8Wi/Xlc0Z7kXcvBVgyMXX17Ll8ud4DnR0PpNKISQ6/+HLLNgv7Faw0jN4qNAVK58JVuOZspHT2Ed+zPioEN7VW3cTltcMLOI4Mxrnlx1dYedGCYXAT5OxvpkAgnmK6JvqIVIH8NidgHEnETPiuhzDz8kOM377R14i1w3KgA9B5S7zhoRkLt39oQXBsYgGkE3nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 18:59:33 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 18:59:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, Liam.Howlett@oracle.com
Subject: Re: [PATCH 05/13] selftests/mm: size tmpfs according to PMD page size
 in split_huge_page_test
Date: Tue, 10 Mar 2026 14:59:28 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <788E6384-F8E2-4285-8303-E614AD78A771@nvidia.com>
In-Reply-To: <4284688bbec0901d25f88ee1b55c7495fa26b125.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
 <4284688bbec0901d25f88ee1b55c7495fa26b125.1773134177.git.sayalip@linux.ibm.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e82163-df09-4adf-5de8-08de7ed72a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9KQFPrurrmKsbYAEXdzyGqxV81InbzvMqhA5JaCjQQA/vgu2+t0cqwxr9ldN4q5muDxpW+QOSA5wvKSxF55Xrn52lhgaTosLHqedgKX7/JzD9fds71p1KbQs29GvRfFR3c82NCWUkr3T/MB9Zys7t7c7jZ1usmhrMhfZZzqFzTnVzr56emoKsqJhBZRGMY1QV/cTGUy89Ex3zXoBei1iTtvoEl6eYFUCa3KKWIt6dGqR68NjrixsT+wf5KU7t07NlZ2bHK7hdDrUuTZjX8ij6fw2fSYKvvUzEAl6SnMjMdBBSn2Hkop6kaNj4z2ipCbta4+qorAor+OlH4NjikjRe5CbaRIhgvyPFLBYuqxipDjI3ERdm8Lnn5jle0wxow2Bjh258SotCtkdQG4z82ZesP22BG5RED1rwRfTFYexSt4OkELLlS6bo9o2MUZ7wfJVDULzOSQA23QZYIQL8flexLDDnl7qMTjrhWC3EUk2xS0ziNvecv6itbQGrFGntVhWPya+r49LJGV8Mfm1fG9ixuvIp67rcA0v9USMtWguR5w4j1ADCYiKjj+mGbpyDr1P+mT2mpSSkUd/+9oVfr8wnjcd+78iD3CAGGZwTK9vB3rvkxetQvR5Q0g4SUGaxXjM5TSZdqdfr4JU3BlXUyLDRveyja/ZgKjolakvrNWADBi9H6Bs6Ek4IFekw3DS6IETVddsjQzpS1Y04pwijoWevXEs+75WQZEvGPjIAsJpG1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0P4nMkxy1vPHoxeUuCWXc5cCMrq+h3SmtMKW7Y4mrVE4kIZOEaOXKOs33CfL?=
 =?us-ascii?Q?sPD8jvhXIgds+fjptPjMoEy6GUnGN36wD4YRjvlBn44Bli/D7xGzTx32SCxq?=
 =?us-ascii?Q?X/3hLa9z3azNvInk7Wm2ybo2vOB8SRtFYZoXci9YcDhcxRIeqyDeAMl0PAFQ?=
 =?us-ascii?Q?QDMt7IS40PrDjbspP99MXTbCZ/9r/c5k/57swDuDXU+1ZaopFmJWtEFs2H3n?=
 =?us-ascii?Q?D2z06rT4eJcVaz7QE7b9CMf6cOGGhmDiXkoeklY0cp09TXwJD6WMSyZoWLCo?=
 =?us-ascii?Q?bUvXj1JGUYY/2aSOIjtCC21KD54bvMkVsFXguc/wbetJqVbmBYvHP53NJ8cn?=
 =?us-ascii?Q?vpp5cLrRxntnEJmlBzgZb76P8C0j1aybyvTGzYE2DtnPXrjF7P/vX7rmHFy8?=
 =?us-ascii?Q?R+J7Eq4G3iYZ4Ikoa/LQGJ8IP9p89NeYovwDaFYdm0jma/mtYkd3W5jf4Cit?=
 =?us-ascii?Q?C0fKJsHKRlmfqIJfSckXgUfk0foAQmG+GF/qI6DBkmUI5w1HbTfWAA23Fhzo?=
 =?us-ascii?Q?nucUK3gVEAT86S0mhKLpS/4tcCYDaHSNlGqgApvEz88BiIliuaGgxCyc1wTv?=
 =?us-ascii?Q?RJbqN/9pmqShHIGAVxdGmlkg/2bOtZ54DbWu7XX6w5226nhiiCsyXX5uEYeZ?=
 =?us-ascii?Q?7rdtC/WON/6dwIs7H75AOAV1Pbfx9oBvmfnIdbgjQjuf/uwi1BuWjH75zPkz?=
 =?us-ascii?Q?ok4gwAIPOPj68kqUbiWQNFKm3Tv1cN0oKikk+HZATMhdyRWLo6HkB9s/Nx1S?=
 =?us-ascii?Q?mwwNMkaTNgoMVoVGerkTuj5Y7QgkC68qK9FC3J8Vp5UnHUHX31VAx0u60VWC?=
 =?us-ascii?Q?k8S+ZWclG/21xSJYJnwC58UQRnRDCSdZLKjli7V7V5dX4r7STvhaxXGQ8d/v?=
 =?us-ascii?Q?V42auRGqghIEPb5+WHK2bWVubcohg1D/8WtW9ePPEd6NntpdRHSVvHY1J+Mb?=
 =?us-ascii?Q?YI/JrL4HSf/3uFcM6PH4DIYODNbp/uOkQ9wUT23JW8fAl/tICYxdXXXzdPpG?=
 =?us-ascii?Q?oGhWLiQbaXKoMaTBunxENFw9BECOe1a/g3OWQyo2FtieiOnOBGgFt+5dJdL/?=
 =?us-ascii?Q?xF4tbK/gwXJd7IVk4MtOUGqOd5LKz1QueStxqQ8iTUKpXq1NYNxcemjTpgx1?=
 =?us-ascii?Q?EcPFHS6GVn9wrBOyEp9Vg2eE3HH5x5muRaFhPYx6+YpeZODOr28xa39U+eEv?=
 =?us-ascii?Q?Pi9Djl+pK2BcWaz5Og2LFOIMUuCECkkjHMpA3h/JAByrhAjMlvGzReOMK9Et?=
 =?us-ascii?Q?LjBH7CQjwRw2K+7z4ta4bNt1vnbpqV3+UI9VffJV12zyOHljop1I5mmcA1NB?=
 =?us-ascii?Q?4bOvPVNBB09GehykY5+yWQ7yDX8WQBEbtqvryjEoRi328aWk54eMn4e4aldd?=
 =?us-ascii?Q?Vy8678AZ0LyDZ+SzXX+FSb4iTWt3AwpjxMBszot1q21yyobDteucvcZS2VAD?=
 =?us-ascii?Q?j5dAB8XYAEWZwwj+etoaPRdmef8fPdKIIjpl/GwibvkJbrVQoaRuMZkbWST7?=
 =?us-ascii?Q?OU7HYVIs9l084T+qtA4lgpwfKhOA7NZfA1bGFxBvFaRL5QCdjQoYvTmJIAeQ?=
 =?us-ascii?Q?F8J8rk5BdPpJOJzCqiXNrLoW0bPBwp7WGi0vhrFhgVS5DqG59IjzRvL6WV9o?=
 =?us-ascii?Q?SNUZL4qdymhBaNI53vnffGdx2lgVKktcnsLbkX5E0ntKFv9E312zkrtbIyZK?=
 =?us-ascii?Q?Pk+eQNLLlosey+ps8wxplq/N28Ar3XSmjm05EnCb89kqnIi+eBaxUq9uo0lw?=
 =?us-ascii?Q?+Pspl24qvQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e82163-df09-4adf-5de8-08de7ed72a9f
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 18:59:33.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvbE6hzSgxb4/M24c4Wpl6ZoydUVZ2ottqOeVQF0aqrt78UHF1fGPM2DvVUMeVDw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455

On 10 Mar 2026, at 5:49, Sayali Patil wrote:

> The split_file_backed_thp() test mounts a tmpfs with a fixed size of
> "4m". This works on systems with smaller PMD page sizes,
> but fails on configurations where the PMD huge page size is
> larger (e.g. 16MB).
>
> On such systems, the fixed 4MB tmpfs is insufficient to allocate even
> a single PMD-sized THP, causing the test to fail.
>
> Fix this by sizing the tmpfs dynamically based on the runtime
> pmd_pagesize, allocating space for two PMD-sized pages.
>
> Before patch:
>   running ./split_huge_page_test /tmp/xfs_dir_YTrI5E
>   --------------------------------------------------
>   TAP version 13
>   1..55
>   ok 1 Split zero filled huge pages successful
>   ok 2 Split huge pages to order 0 successful
>   ok 3 Split huge pages to order 2 successful
>   ok 4 Split huge pages to order 3 successful
>   ok 5 Split huge pages to order 4 successful
>   ok 6 Split huge pages to order 5 successful
>   ok 7 Split huge pages to order 6 successful
>   ok 8 Split huge pages to order 7 successful
>   ok 9 Split PTE-mapped huge pages successful
>    Please enable pr_debug in split_huge_pages_in_file() for more info.
>    Failed to write data to testing file: Success (0)
>   Bail out! Error occurred
>    Planned tests != run tests (55 != 9)
>    Totals: pass:9 fail:0 xfail:0 xpass:0 skip:0 error:0
>  [FAIL]
>
> After patch:
>   --------------------------------------------------
>   running ./split_huge_page_test /tmp/xfs_dir_bMvj6o
>   --------------------------------------------------
>   TAP version 13
>   1..55
>   ok 1 Split zero filled huge pages successful
>   ok 2 Split huge pages to order 0 successful
>   ok 3 Split huge pages to order 2 successful
>   ok 4 Split huge pages to order 3 successful
>   ok 5 Split huge pages to order 4 successful
>   ok 6 Split huge pages to order 5 successful
>   ok 7 Split huge pages to order 6 successful
>   ok 8 Split huge pages to order 7 successful
>   ok 9 Split PTE-mapped huge pages successful
>    Please enable pr_debug in split_huge_pages_in_file() for more info.
>    Please check dmesg for more information
>   ok 10 File-backed THP split to order 0 test done
>    Please enable pr_debug in split_huge_pages_in_file() for more info.
>    Please check dmesg for more information
>   ok 11 File-backed THP split to order 1 test done
>    Please enable pr_debug in split_huge_pages_in_file() for more info.
>    Please check dmesg for more information
>   ok 12 File-backed THP split to order 2 test done
> ...
>   ok 55 Split PMD-mapped pagecache folio to order 7 at
>     in-folio offset 128 passed
>    Totals: pass:55 fail:0 xfail:0 xpass:0 skip:0 error:0
>    [PASS]
> ok 1 split_huge_page_test /tmp/xfs_dir_bMvj6o
>
> Fixes: fbe37501b252 ("mm: huge_memory: debugfs for file-backed THP split")
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/split_huge_page_test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
Thanks for fixing it.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
