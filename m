Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820833451B3;
	Fri, 28 Aug 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929990; cv=fail; b=DQIHq2PV/EFLUBNE5l1BBIIVjufCQnoUYHlo5uRzs/x6pmB7OYWT8DY8+80pMcwd/z2ayzAZ/0twkmVTk2htfyKQFtqCJphAbtlyflM0JwJG2R4i4b22tNFMLzcVp/OCc6+ycATBb4VQQp7aLifp7/T6fDBgcGpZhwZAUmwzHNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929990; c=relaxed/simple;
	bh=6obq1NrW/0EtoKovkaIrr190BcX5n1ZZ7vXKbCr4RYo=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=Zx3YXGOzpW/vshxdVg78li487WiKv56mCNmSQIaBjOowDSO8OWjeH6FTQ6e/zHJh58S2v1q9QFpmsLnxUUwZ+Huqx+PEHGVlR7aFtjV8szfufKJ7ANsb9WRMVmbY9jc1hz8P721B2AGP3SKnFa+6SjwH6VfeVyCdg037P56dSZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NhYfzgUz; arc=fail smtp.client-ip=52.101.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NhYfzgUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bitq2IKKIoWFIcXgdGMl011krBFposFdLfZ8YWpWCJAF/aBV6pPgaxPuLsJh5DJrY4e8UdbeZbeQ/zgThNn+HdzjVh10O5RLk34NQizg0k9scCu1oB+0L4I46Xa0sW+fmsYAnMF0RIRQ7Xm/1bPV/z9Janj1bFQyPJOc5I9sJcQPpPnaX7SnAnLfk9v3tnUrASshI5tN/rj0o2G/sEVmW5D0HrjZ/rZn8IyUlVZECZWyrV25qGtTODs5LIsdNXn0vKZtnr/z94XhcRjYTv3rV0krDGpWnqo87K41tbSeBNrNR+I4SaDoLSXin3b3HddPx3E7yR/AL991rcJu9FP7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmfbptkEE3XALNNgR9MxxtWU7Ah6JNGAOltLGzk5iD4=;
 b=kM7ZbokUXUBgt7kowsvzxIsFJOEpVCERF+jvFKkscSJDz9Ggj7em5D2vVVYB4mGnb2MTVW7uYb2zzw8JhegjrCW5qrqnQNqHmeLgUSdXNyFldip1HPRV3lInXEg7Me77i6qUM9e+AYy8yke5HvwJAU8kvhNPN1gYx2slwaKLwDGZztIVhD8G07dWHQGrtT3dQWerT7oG++tvxjwHW6Bxo5Z6ZVO+u2EtI4aMHzgVpoQWHKude2ztG572m/L0xZZMMbzwDvUp1YLCYdupwCfYgbM9ArTcZB5swDT4vRCtvdP6qy/zg2xAIRPx6njs9F408dLILSvO12WbLjapmbYfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmfbptkEE3XALNNgR9MxxtWU7Ah6JNGAOltLGzk5iD4=;
 b=NhYfzgUzsTQsU+ALTMOqD7xnYjj5LwxXlJfjFOae33lhZQlOL127St8/NNsY//BLnE4/aDx58kq28ifrXyqhe4NVjtETKpUK7vk3gfcvVHfN9lx8YPzNM+YxoqWfEd/nHGRNmV8USZL5jfJZ2QaLyNvl6zn052H/3kHVqmjiRelUSJ3ACrcmz+4gIY2c7fblQZPmnnIUehZES9o5skCgrgwKnVLn+9zm6rJ4lEZ4+fIXuX9O4BwIbYwhRkGOHRiOquMSBVSdT3ybxlGdyEwljsg7XFN3EJ/mWMLqvcc++5C0LRJ7kP6I10x/vAzPU5hMWnYN5YD6A5n4VBj6TjGQZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:13:03 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:13:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 11:13:00 -0400
Message-Id: <DL0OA5ZF6VX2.33NA9XE20959G@nvidia.com>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Shuah Khan" <shuah@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v3 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Cc: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-2-374022586a4b@arm.com>
In-Reply-To: <20260828-fix_split-v3-2-374022586a4b@arm.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ0PR12MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1469b5-94cc-49d2-58db-08df0516daac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4NnFLN4srVqhO78v208/lm0Tb6Gn68HZj3JCFd4ARmDzW63d56R7itW8DJ9ttADoSuD/q0qXer3pzMHV0dMRA6kfAyu/mb2jzpIBesSpzws+ObiX1G+IyS4ai6umV0G0XEP0L1gi27Z/4eGviZfGMY89CCZKEthKED2zfQWOhVIHVSxsZjnDxut6XStgOMoFPdnjUoFYjxcznzMblryvvynicHosuI8GoLjRfGi4fXtGocHo83L2AsWFkOPeNd1A4cGl1hYmE+c2adbo0+DlVNPe06zwrEHq+rLjA9215rPlc19lFLQXzPgrJDtL/weiMcrQeNCv4KEEQCDx7JKXwER6/a9x9pKnpu+C6qAwi4AodCcyOBiXyRCBY3++d5pUAXFFQhPjfP3iGLdo5/klENJdfoaU+8NV4q3c/J6kkVf68tnC/2oPHX15WmqKE6pIejoornuK7m/jUJsAOSRHQteJyp45BZIG19FD90uyt1K8IOz7Xq21Y0IEESOPBJNa5+AljsPbEs+yXYnJu9+6BEzvRaImVYzjAztuwOUPw9s9Cs2PyvMvkpjXa0Mk709gbURWDVkJnQvK/W6dZieq8K5ZbJJdpQ3O3ON8OQG1mJ5DyeuEPdNDo3mopArZ02VMp5fPJ+ICZhRiDWYAL2ODvC/iDveoWLOUyMvSEYstc6FNeFIWSj4D5yXD+pxNz1cqf4mXce2JoGHCfyeo7I/pYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajdGZWFEcVpjQlJRNHJNc3EyR0NzYUNFZktRMzVyRkNxcDc0OUZiaFBueEVm?=
 =?utf-8?B?eDJSYktFaGZQdms0dUd2SC9hNU9lNytRdlVwclhZSnAySkRwenpGYnIybGJU?=
 =?utf-8?B?clpGRG5SbGJOTVYyZlFmNXJhQ2lRNWlqWFQ2QTU0eFpsdGNTRFFuUUFyQUcv?=
 =?utf-8?B?bzk5R3JkWmRnUXVTUU5mSFBzc0J6UW0zQXpObGh0TEpqSDdxUGQvQUJSTTI2?=
 =?utf-8?B?ZE1ZVGxPYWdLT2RDZCtEZGxZWWIvVHN2UDJnRm1xeE1FZTRUYmhuRDZ6eDN2?=
 =?utf-8?B?ZDVjSGkvTGRLQ3ZlODRkRTNuY21RQXlhWEdJZDVWMXBGZnRlMmdUZzJ2QXZk?=
 =?utf-8?B?d2ZmZm1xN0tGcnUyeTkxN0ppSWNTYmJzd3FqK0tLM2Rqc3Jydkx6R2F2MkhD?=
 =?utf-8?B?V0FpenZBNlNMWFh2U1NLU2svR3NFcnoyb2JrVnhYbk5WV29rK3ZHMDI2UCsy?=
 =?utf-8?B?ZDI1SkJZb1RjV2QvSEF2dDlCa3llZ1NDR2xuaXlZZHdiN0U4ZHBLeDU1V2JG?=
 =?utf-8?B?UnAyNlQxMVV2K1Vvd2dXNFJJS01Zdk5SVzdteVlOZ3ErMFY4cnAyVU9iNGMw?=
 =?utf-8?B?Vnh6ZVgrZGRPcVRNYXRyMC9Lc0RGemZBWDhwOFplYndrYmlYdW0xbktVYmRT?=
 =?utf-8?B?RGhnRzc5Z3g2eXFtaUkzOU5PS3NMcGFKaFhXYmJCNXh6ZUdmL2FNZ2QzZUVk?=
 =?utf-8?B?YS9xc3M4VDNiazZJREtDTDEwL1c5SFgxN1ZwYm96UkZBODg2M3Fpdmg2cVlv?=
 =?utf-8?B?M1FMNG9FWmcvY0FVTVdkL3JGMEpXTEVJb1dlYlF6U3I1RVVGcXZ4SmpGTG9i?=
 =?utf-8?B?eVAwMzQxRE04OGJFUjJKRm8wZ3pVajZpVFlYNHVkdHA1c1ZTb0F4SnFTbTd2?=
 =?utf-8?B?cXZoblZWZFVuOEdKd0UzdzkzbTIyQVVFNWlXQjBsYjduQkVsM2JxdlhWNlpl?=
 =?utf-8?B?dnBTTll4MEtsM1E0a2FJMERhYmNGZmlMNDhPRUE0M3hFdUROeC8yTWJJMWxX?=
 =?utf-8?B?SDY1V0taMlJxR3hrNCswQWVBLzdoamcxb1BzWHJ6Qzh3NGpqWElTdkNsODll?=
 =?utf-8?B?dzdnQ3N0Nm53eDhGZEk2TEkxNzZ3TWNtQk5SbFB5OXNVcGxtVU8vaS9EMXR0?=
 =?utf-8?B?d0JMRS9oaENYc0lRTHlyd0t4Mm1WN3RYajdlVGZvZGExcXdVTmZCei9ocG5v?=
 =?utf-8?B?cUFjNm5hbkY0WGd2TWY0Uk5JUHE3UzVWZWFjL1FBa1M3MDZqTDlyeGE0T2lB?=
 =?utf-8?B?VmtiWDgyOVdtbnBKUzVQWXhLK1p5K3d4WGp4L2o3bHhNQVlYaXloTTZHTDZx?=
 =?utf-8?B?K2M1M2NUWEgyZENadTJnWjdGYWRVc2lKVjREdzhGSkNnbWRBaFF3MHFUYmJC?=
 =?utf-8?B?TGdnM0FSQXNDZDUrNDJKZThxeFdxclhhdUJqQjdjTzJjZEs1S040WlJ1Yk1Z?=
 =?utf-8?B?cWxlTnZ5Wnd3Ly9xWldnTWoyd0lGZkZaa1pFLzB6Sm1lb2JkSTF0WDZ0TE9L?=
 =?utf-8?B?NnRrQjNJWm9KN2RaWDBieDVDa3ZuMUhHK0l1bEVEMW5sSHlVallyOUFJMmdP?=
 =?utf-8?B?ZzVGcHlMTXJGeFB1Y0tQd28zNlMwNmowNUQ3K2dQTFVuK1Nad1JSbEVJaTgr?=
 =?utf-8?B?d1B4bHlTWmFTcWttT0ZFVkFVMjdRNitvcWo5TFRqcSt5Rmw5UEFIOHN3bWxT?=
 =?utf-8?B?TEdCMU04VnN4aWtvUDUwWTYzR0ZpR0M2ei9KMUtlVU5GaDY0NlpHcHBBOGVT?=
 =?utf-8?B?eVZObFJUclhqRGJvTlJ0L0hWQnR4Mlc0dUtwTWpub0c5TGJMeEx4STJOSTV6?=
 =?utf-8?B?NUViN2hZU3ZxS01KOEc5d0hpa3QwK3phYy91THNCQmVBUTZzZll3RDBYL1J5?=
 =?utf-8?B?bWlFbkticEFNOEZkOWtlQTNhNXFEOU8zUDdTTkFQc0MwaVEwNjFSMi9YaDlk?=
 =?utf-8?B?U3U0QTF0clZ3T3Bha0dFVjNZZ0piL3Z6cGNBVS8vajBLTEdmdUpYVkxreFQ0?=
 =?utf-8?B?elFzTkRXWG5Mbkp4dU9ZZ1N2SWp4b09OanBML0JZejgwUy85QmU4QWt1SDVW?=
 =?utf-8?B?Q1hKYWUrYVVRTXE3Vm1SSVhCMUc2dHRubXROTWFSUGtsdkxpWHBGMjZEVXJT?=
 =?utf-8?B?Vk55RnI3cW0rZllwQnZrb2tuN3BwRGFGOFBCTCtlajJtMzYyT3ZnZ3ZhVHFq?=
 =?utf-8?B?a1hGa2JjUk16eEFrUEpvck1oZUpPU0ZNb2Fvb1RTTGtseXMyN1lZUVB0Vlh0?=
 =?utf-8?B?UHFtSjZvWHJUcHVKa3ZkRzdwdDlFeE9VWWhvbFhiUDdobUM4Wm1ueUNEdlJD?=
 =?utf-8?Q?wQc3gB/NyqLUAfk+TZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1469b5-94cc-49d2-58db-08df0516daac
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:13:02.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PxXnFrhWAnMPdxL08IKQFHk+MALdkIVh+AIm7JX7JT4XqPuPrdRSbPeynmrpBoM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5673

On Fri Aug 28, 2026 at 4:11 AM EDT, Yeoreum Yun wrote:
> Since glibc commit 321e1fc73f (=E2=80=9Cmalloc: Enable 2MB THP by default=
 on AArch64=E2=80=9D),
> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> made by memalign().
>
> The underlying VMA may start at a different address from the aligned
> address returned by memalign(). Furthermore, a subsequent
> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> already set.
>
> This causes split_huge_page_test to fail because the check_huge_xxx()
> helpers incorrectly require the address returned by memalign() to
> match the VMA start address reported in /proc/self/smaps.
>
> Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> /proc/self/smaps to detect huge pages.
>
> Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/vm_util.c | 145 ++++++++++++++++++++++-------=
------
>  tools/testing/selftests/mm/vm_util.h |   1 +
>  2 files changed, 92 insertions(+), 54 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftes=
ts/mm/vm_util.c
> index 4821a3563036..083b72d92b14 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *patt=
ern, char *buf, size_t len)
>  	return entry;
>  }
> =20

<snip>

> +	for (; start < end; start +=3D scan_mapping_size) {
> +		categories =3D pagemap_scan_get_categories(pagemap_fd, start);
> +		pfn =3D pagemap_get_pfn(pagemap_fd, start);
> +		if (pfn =3D=3D -1UL) {
> +			if (!allow_nonpresent)
> +				goto out;
> +			else
> +				continue;
> +		}
> +		if (pageflags_get(pfn, kpageflags_fd, &kpf))
> +			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
> +		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
> +			nr_pmd_mappings++;
> +		if (kpf & KPF_COMPOUND_TAIL)
> +			continue;
> +		if (!check_huge_type(categories, kpf, type))
> +			goto out;
> +	}
> +=09

There is a trailing tab.

> +	if (check_pmd_mapping && (nr_pmd_mappings !=3D nr_hpages))
> +		goto out;
> +	ret =3D true;
> +
> +out:
> +	close(pagemap_fd);
> +	close(kpageflags_fd);
> +	return ret;
>  }
> =20

Otherwise, LGTM. I assume the replacement of memalign(), from the
discussion between you and Lorenzo, will be added in a separate patch.
For this patch,

Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks.

--=20
Best Regards,
Yan, Zi

