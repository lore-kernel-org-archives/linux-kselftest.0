Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDD1F7916;
	Tue, 28 Apr 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406175; cv=fail; b=iMMSkghvxhAvFiM906uY1maEZv0phXBnWQcooZ//arz01EHxdBElP+R3Aucsy9EBRcaoYVi3LSV9Oloc8jRwEiIHNgtYE2EuOGRwt3A9vZ6SSXh02T1vEDxNJq29wyQYhxbgvd4Nps32v9IdfVIiNGuhGYNp21bZoCmD0USaXbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406175; c=relaxed/simple;
	bh=lhn/lPzBoVARQIhkYeh5gApc2fcoOdfrVjBrIcmOq3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sZSkOWSbqkGdg8boSDxmT8n8Ay3FGao0r7I/DbnCvaOu18oaheX9aPx36f7+ll7YQD00JdqqD2ljnO8CNdt0b5GrbowFUIlwnwEDcbx51O7f54GYZ3l7HBKZxZ1xMoCfdUkpuw0DZW/w/sZS1B0YrvT7tNgFzPEVqZUL6QTBdL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bq4ptY0M; arc=fail smtp.client-ip=52.101.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bq4ptY0M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0Y484dwk8K8bdXIcXv5Sexi1UMFJ0ABgZWBTAlFMYKQ1bSUPovITTSnUgE+QQePcNIyXkG04ykRDQ4UuSMZnex83HTLEkLSWaYJqlwBW8EFqhKwaaRwEu1ZIZgW7ztp0Xo9gL9XmmgHn31jzmsEV9Tr4av+3HTV+HrVSoBOImJ9giAzVpjbFGlYytUC8ekbJCA4Il9EHwiQOAYMZyt0q8bMVkkfSUDzuROk5Ye9rsGNsjd4WJtpVrYEPQLidIGoJhT8i1QfCYIXSkvcWF693oyTLX5d8NDNfiGKP5E1NBLtWn/J/ROLcwd7a+Tvobggllg4QehQzLxkuhuKDSv3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrbLkWbIUYZuV7Tie+5k9iP7c/Bchu1zUYb81KoyOo8=;
 b=hArLdM4Kc3c9w/1bn7acCqpKGCgyXrq7aisf+v9YFqZY0BH4SHxkltvy3yxDnGBR7FOSqpalsHA97gFCqjjB4mRHPmUYEx3p2KnCY5hMoQV49EPQp0clMloyOz37CKpOnPAiNSYwBmA/mfbCtWYk0B6qoMnj2TvSAHeuOnu3G0o/uJxF2+9liypZu8suFc1lXhw/dRuQjGYu6CbCpgma3QcUnU7zQ/ArBbtStjqWIpDCqhAsjmwj9C7F/Npsr4LUXSnzdknC2c7NMuGGUXCUF8I12FlVmItaj3217nkYvQbFDPMEkt/d16PUyzIbKcSRPWHvZesrkBWKCWGrkzF6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrbLkWbIUYZuV7Tie+5k9iP7c/Bchu1zUYb81KoyOo8=;
 b=Bq4ptY0MEPVZeVU8Cz8JhCcq0bwUDW2ed53Et2nSBNK9up7qd4QzS0rGPqnIf1zTjdS6TiWnphQr2OSEQ8B2JcwdsEAnb2yk6WQi99JKir3t5nh0dzI2tpY3xcioDTxgb46D9PkeOGDzsoMKYCbdoIS1rHq9l6vrplNZFS0W67FGViGMPRNNnPPFod3ydMehFcdvYwD0USd4sUUC88qcwBp/3WRPKyZM54+gglnuuTgNION38NFaXyuJqE2sUjeIgThyd2Ogvl208hd4mEqVsrltqOL5ww4JoY84ghKuc31EUmCyB0t8+ulDNzTU9VrDxU969rzw/y6GGMMmUQdIvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 19:56:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 19:56:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] selftests/mm: khugepaged: initialize file contents via
 mmap
Date: Tue, 28 Apr 2026 15:56:06 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <583F8EE1-5C49-4250-A24B-0D73372E3864@nvidia.com>
In-Reply-To: <20260428133138.88802-1-agarwal.vineet2006@gmail.com>
References: <20260428133138.88802-1-agarwal.vineet2006@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN0PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:408:143::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b76fa87-5cdc-4ef5-8456-08dea5603086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JqvBoX233zILnZVJyVlSHzvb6esuzXopBjJm2eDMjoQDpE7SCEBAezOTbRHx4B5uAptzsCF39M+mHXo2HAPxwt/ibyj9FFKRB/LTOLjIXnB5Fo0sDqZy0mFzcgGgYxouewGVaQJAQo5KVl13WnSeTs5n5iluPmoGaFrXeU5IQrfHZfUG7gYaxiRn/ahhNvU5wxxdEYTHAYpLghXHIErPcprBNVMjIomzBYaSKt/PzaQsP9cclLcPpBDAOCTCgaECAp5JI44VcaUjV0jQ2tWQlUAr35iIip3uc234vUT/k3rUzP8JblDpF1ueXsbnugOP3+rpe+J/vw4aCnY0DP7V9XCTZg3hfZVCwhR9HkcD1wy7sZffpHfz4ttHkO5fCD3CjqRFPT3iN7XwADqgzrwj5AhGSoLT+50tgDhZ5Q9tc4QrQSwLRtOYNHgTfZqMALPA30mf8ibubeyvZlatyyYARAfcpnfAwvGX4bDCFt5N+BCnsYCtRDnCpKqF4ef1FShx5R7w0yk9kB347mgKVnK8HCOOH1Fiuiqn+VAB9z9NhJ0lB+8nPhbKE4/8P+hOIXKiKHKvJ/lR2mBLXlajwcXiMfDlwmQy8cm7jnL7LaPFQoKxPsLTNg4kS/2WHDWmBQd9KgQoPNQPUZ6LIr1o6k1jJf2PNCIZI3zB1DCIauAVN871w9kMZ4CC9fe1Lto/iRRelONcNpJCZGNCdqLshbDl1uyL9nhDQuH7OPjCUoCGrIs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PlRS3w5eBE5hyG/uDObQYHCeUat3kxv0lJ6pA3jIrjHi1VVHnaKRREn0fIdW?=
 =?us-ascii?Q?PFd8IBO21FA3yhx7ThxsyjtiC4IUf1/Pfd78y9OaDIHAw0GlZrK418tEUVjN?=
 =?us-ascii?Q?PLzyXH3hg//DA0cjERTQBnw1aqK92FThcRC+A79bkstvSRHS9MBZ/gl6ku1m?=
 =?us-ascii?Q?8OntcJ2d02Z/9CTL2YOYAmLIWKXdr4jUFxsaqFtf+e9i9Ht93JCL2/ZRkYfw?=
 =?us-ascii?Q?rmBlQffCbkOgnhHsmjAHfpsEx56yGiWGNltxcumUdIYHo2SWT8uRD6/mDN1i?=
 =?us-ascii?Q?Jdlt4hMnJ9iXJGiHqLRJ7TwsW0wJqZvodkDIJKy3Po9g9m7fVey1k9hXhhkt?=
 =?us-ascii?Q?/1mn3pM+YxussOoXkLutnNsNu3dv0I9+bCL84KjUSite653V0pe/ru9x6HUj?=
 =?us-ascii?Q?x9XL5UiXP3D2nDh3g4LdIkrFvDgoOFs4pcL3LZgPv0FHprIcsLGgcMK+Zadn?=
 =?us-ascii?Q?N9+NJ8oOGu+9Z1fYDCj/TZ14s//gX6bSUjMwCTgXrXK1ubG23KVlqhWQ0qB8?=
 =?us-ascii?Q?fJYbdPnutABbW5CLpVCqYuXiZJTrAx3ei7TIoXGQsVp9EvXcXCRBUJ76H0SW?=
 =?us-ascii?Q?NNu1wKVoWj9EytD9Shb44lRKoN6eJuCTVzDR/JiNZ0JC8XNj7N4WvEV+aUED?=
 =?us-ascii?Q?qFF0Rua8yDI3ocv5NjCV8VD2ImUomfrU3/fzqfaaXLtutvFN6JQOyuaE+QrG?=
 =?us-ascii?Q?tIEiXWRNW/MtwuN3MbZuFWQcJKrg2q7D5WmdzByUfKNY0uSPE7usGDao7H2o?=
 =?us-ascii?Q?35dtDeV9wGcy34IkKINdlzdKrrq+oGZULoU3VtzPE0CCZ2REmOumOHTNg6sP?=
 =?us-ascii?Q?dZY4Dxl1m4bho6886KoomGjsFqSS4ArST3S6/AQ+hImZN6QX9AxzKSP2VN0K?=
 =?us-ascii?Q?YhIxe2LYmwDUUUezOnlz/1QU8IobtBvzYdqZfEZu+1+rJG9U8VA2OtY2Dspn?=
 =?us-ascii?Q?/J/ICYmubE41o7Yrz3iP8zkR5jfq6oN7CquW3ZEn5c2YlsEzp5lo1xZeopGk?=
 =?us-ascii?Q?ZoCQFQE0tZsSllP0w58jrplEtD9mec9CJOcYgrK88Pbr74vIvoSPpOkIfu0s?=
 =?us-ascii?Q?naBCN3CeRi6xCpPLtOMX3eEZGnaWluFIvHs+2RgNuREkdWMPtY75E0Z39P+7?=
 =?us-ascii?Q?D/3dLDqN6OZXSOSbfZjgeDtean3m/KaOE7e3kZkJBAtQlKtUaCvNPeTtXAfo?=
 =?us-ascii?Q?dFtdkCZleIHT5uesZONJRb3pOfzcndoSAJYELKyIhbakJRQdleeihhJPmijY?=
 =?us-ascii?Q?+bECzW1u2q0gP5MQgn6epORl/vk5yyP7dNU3WlR7YPcdbYfNcPLdiUbgrzeq?=
 =?us-ascii?Q?MP+o96NOUhppRpT++MrQj5+nw5LJCf9ZnoAeMSUuWRofBzSm4/Y8wTh49FSR?=
 =?us-ascii?Q?vL7C4jF/oKoV4FITQu9pxtkda6CQSE/tPWnGBMuvfzYZQkXBEKlLFKWcGRRI?=
 =?us-ascii?Q?F/dIK81ooQEGbyqS6dU4LQsAOnm5QMOoObc6HU5DVlHz+ARK74Myz/ACqPMo?=
 =?us-ascii?Q?x6VjxRe0JHLD+1bHFVcwTmnt9sBEVtvsSVFL5x+e85zN/uXwQvXm1SRuQEC6?=
 =?us-ascii?Q?qngGclP/X+DNcJaK4ILsrn4oci0h6IBfkyP2+m2RR18MJrAtlD2jWt5Rpvny?=
 =?us-ascii?Q?Q2+absKA60u3L/2qgnoch3ydcpvXcstSP7GoAUsxQN4eYn7QEEswgUECHsjr?=
 =?us-ascii?Q?ZZFTJS6LAb2Upic5w4d77n96LVJAa41bGot0GvMhz7DxV6Rq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b76fa87-5cdc-4ef5-8456-08dea5603086
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 19:56:08.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE38TqffduucAri0cKvhfEtEXEetr0roPlbhmUHTY2TgWMZEKwYDiRBWrJXw6hUN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426

On 28 Apr 2026, at 9:31, Vineet Agarwal wrote:

> file_setup_area() currently allocates anonymous memory, fills it,
> and writes it into the backing file used for collapse testing.
>
> Instead of copying data through write(), resize the file with
> ftruncate(), map it directly with MAP_SHARED, and initialize the
> mapped area in place.
>
> This simplifies the setup path and avoids the need for explicit
> partial write handling.
>
> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
>
> v3 -> v4:
>   - Restore unrelated blank line removal
>   - Restore original close()/munmap() ordering
> ---
>  tools/testing/selftests/mm/khugepaged.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

This patch breaks the khugepaged test for READ_ONLY_THP_FOR_FS.

When I ran sudo ./khugepaged all:file ~/ on ext4,

collapse_max_ptes_none (khugepaged:file) fails.

Run test: collapse_max_ptes_none (khugepaged:file)
Creating /mnt/test/collapse_test_file for collapse... OK
Opening /mnt/test/collapse_test_file read only for collapse... OK
Maybe collapse with max_ptes_none exceeded.... Fail
Unexpected huge page
Restore THP and khugepaged settings... OK

Reverting the change fixes the issue.

It is also causing issues for my READ_ONLY_THP_FOR_FS removal patchset.

>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/se=
lftests/mm/khugepaged.c
> index 3fe7ef04ac62..6e929a484a1b 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -381,9 +381,19 @@ static void *file_setup_area(int nr_hpages)
>  	}
>
>  	size =3D nr_hpages * hpage_pmd_size;
> -	p =3D alloc_mapping(nr_hpages);
> +	if (ftruncate(fd, size)) {
> +		perror("ftruncate()");
> +		close(fd);
> +		exit(EXIT_FAILURE);
> +	}
> +	p =3D mmap(BASE_ADDR, size, PROT_READ | PROT_WRITE,
> +		MAP_SHARED, fd, 0);
> +	if (p =3D=3D MAP_FAILED || p !=3D BASE_ADDR) {
> +		perror("mmap()");
> +		close(fd);
> +		exit(EXIT_FAILURE);
> +	}
>  	fill_memory(p, 0, size);
> -	write(fd, p, size);
>  	close(fd);
>  	munmap(p, size);
>  	success("OK");
> -- =

> 2.54.0

The code looks OK, but I have not had time to look into it yet.

Best Regards,
Yan, Zi
