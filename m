Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A843F23C5;
	Wed, 29 Apr 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467602; cv=fail; b=DZeetwdVmKe3i4lwDbykV9O0uGRxDD87B4U2aPxydF/2hhSHPJz5MnViRvioaJrKWZX8L5QKOOGgYjbM5WuSpy8Gt0TtSOj0ipTfZ1iS+w4/UdmgcBHkX60+jIRkWQgBn70FTyWmciTa56NfEE5up1HZ5VvDH5sxiM22rjr1OjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467602; c=relaxed/simple;
	bh=sHL0uYLE/+UJOF3Fkl5AcYdOgcXPOlt1nM6GdSIAsGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N74t/qCRP9k+aqkd6bi1wzhmtsmj5AaWKjm7FxaJSwcPHZA1qhG8obHVl+rsTOmqQYNmDmmYC6qz8QldYlCQZje+L/VV6Hze6fZ0UhEQWJi2WPPWdDyiNUgTSpmKFUAQXHW7DeQB8VJMCjTUfTIxlTtSWwvb781KtRPbpPB6Uis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NDiLlngm; arc=fail smtp.client-ip=40.93.194.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NDiLlngm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAA9NLSZG8SGPaqGP8q+vcch9CtnsooX52yuXP92EkOYQcWh0V1ZHK68E1nx2h/jfg0nhGLenmmlG/KYMKgymi7wQ1/6FJZx0T7MoBMXxsCoYhBhXmSaTi4e424L+uDltgMoj7cgxEngOCl1mAFVi0KCKuqZ/FB/U8YJ5E6Ds7USPhDT9aMFnVg7I0EhsZzvLGrugyrmV/fUJoskZNaaZjBBRpnay5q8KapMEYsvstG6O5Ju2L0XoXUNDjAdZQ/xBRIZfYvkwHktCcCCQM7hLbRf5ODlxE1VjDp4hK67blNkiJ063BTldmTDHQrMMAmBVPMS+G9MUPNyoPEDvzRvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pRrv8kfo3ws6TH0zWy7z33TiqWPVhuukWXs6IIxyBE=;
 b=Tw+EBFaXKqrZOQPXEegk/+XyifJvUn7qsC36gNK8Fh5S2Z/iYdzD9a9V6Yznw8zfe8ajDB4kxeKBaBzFM6PrJBcOW/2gkHCng/xd8Y2VAi1a9KuacdZ04ut+kAFUzPEFN+BohyBbdBypasJ0Xi97/nKOhW3Zsw+CLOCPeAp2WLAXnKAYvjcz/ZfeZYlE0GF68YJiFkZxQ1flmvxJY9UEWaW6Bq7uGXgpSpYSu3k3sVTTto1yE7DtKE8EPrVwB3bwUaybMjKHYRnvSIF4F0LG2L+k/VLzKK5VuvycjQ9WZVBCFaKpfka0d4SEVBW6j7MMb40/ZUslEe//87TAK+hwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pRrv8kfo3ws6TH0zWy7z33TiqWPVhuukWXs6IIxyBE=;
 b=NDiLlngm712FJhiRQRTGOljqv/080ZRQGaeGqt//P90SkyxgwQDpdgN0qQWEwTamh0QUgUTVoXS7VaswDyjFdJ4fpnUa3AsdCJyHk0vE1qSaWHmxadsWBpvQjoPjWVJcAp286s/uEFAi2hdZR3hwLJjg3eVs5b46lOWhcOWbv3zNAO6JMmKnCNr+8zNBwEGhiLScQSsNGiMKVAyJVh/ZlsBhEi0FxmSYmKCFZSr/Qo7qoatPbpy7sl3OOyizHRKSp9w8X+B77YI7h7yo78apemmuT/0nv7NOPZuL3o00mtskNT/jSiBXEHgiFKTSPrJvvu4eYiASnPfJrwaAXKNZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS3PR12MB999241.namprd12.prod.outlook.com (2603:10b6:8:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 12:59:56 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9870.013; Wed, 29 Apr 2026
 12:59:56 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] selftests/mm: khugepaged: initialize file contents via
 mmap
Date: Wed, 29 Apr 2026 08:59:53 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <0C88ED48-CD1F-40C8-B4B9-2388405A6734@nvidia.com>
In-Reply-To: <20260429115816.98824-1-agarwal.vineet2006@gmail.com>
References: <20260429115816.98824-1-agarwal.vineet2006@gmail.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0003.namprd14.prod.outlook.com
 (2603:10b6:208:23e::8) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS3PR12MB999241:EE_
X-MS-Office365-Filtering-Correlation-Id: 73103e64-fd24-46f5-95da-08dea5ef36a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A7AbMuTztSuxflkzdBO83lJeravHobSXUM6kFOhJ7rq2/HCT9sekvOcdomUtH3YgN+hmMq0iYFlSnpxrgCRB+plzda7Pug04aX13ftzMwywvYN3lL7VQKjlaziLsuxLlrfgR+pWJjcxn+ejpfgIPx48jUKTC+CFhF8ctz2hZnmlQoLQR6z60iZeDichxYF7elATQyZjkNFLCKgkRcGaPqr95OIfbOJQ8ygXAqGG+P6cgJDOq/8xjpSfRNC8am2z2FvfLDGBZV/Y5I6TVTTBQGiSZ6BvN7OY+935R/24Om9whS8eM6UTWgGgHT6QaxDkJrKZGCQHxEK+40wq7CSAe7PUJclW9hiENVtCQHNu77BSVNbY9zE68a334KGQfcfIVMgnxiWK2B1aAq65x3sPej8vjJAXCud8EFtHPS/NP0WljXplyn4PIA9crWKyC7NvLUeoj1kOJ0BLvTmcZUPaG3b6BJeJ8YVbQUT0ovk3xnn3qeHT4pyayXo9/QYs0R+cYc7OshH94b4sn/NgYLZnzNuoxlVznCg+FENsKeAvg903on2YLKWIT4lmvx3aeGrPRvAT/MFx3m4KXFaDL/0wAIbW6uLoxqyIJd1v34Tm8gC2JS/R9SX+CBVCocnqwz16xmG6nJKt6qqI13+JayIK89DgbUzmcuCZMF+HcYedfZMlBs8YUhM5gNdNm9i6RxbOoyWwalKat5GeJEHeNj17QcVq8QDlakZJ09cmxvBQYoxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eqAJQM+RGKy5xfjWobIGq4kpCsoyP3ByKwylRNWMuAAhBvmLFLzkQuqANPZc?=
 =?us-ascii?Q?Fe8pL4KLIQvuweRuK7nlrLYMmanJGbl2Sg49WLCLTGIoR6+yYPg5Amm6fjHM?=
 =?us-ascii?Q?JO3uZYHhhLxO8O9VSMIx7OUGf6n/QjRDpwa2UENtjzVh/R2RizXPMfbfQ4f5?=
 =?us-ascii?Q?ovntD/VVEfioS3A0PZy8nbWugfRs2qysEHHdxAzJOtm4jk+RBMFiCjaez7hG?=
 =?us-ascii?Q?X+wMigLNeRnbsXPcp0d4cxK8AqCoIRypD85k2IH/mGtJQnInmNlVpQK/8yXn?=
 =?us-ascii?Q?1Ztq1U7KIKzeGmghh+Asf7OLRPZ3nRIEYxSUfL5V+Fyc/w/dNw39axFLbBSR?=
 =?us-ascii?Q?cxhlu2agu2k9Ml/o48VkSUITk6nA/qJRhmbCcpxpOGCppuKFdzK+i8baxHSS?=
 =?us-ascii?Q?LJysz0Q2TTnQjQZoy9e/I5BHU31eH3a6Wd/CIPyuTS6EXEWWD27NjqRTnorY?=
 =?us-ascii?Q?gwuU8NFPqdE9sX1DmkW5WobmFGnIOZ89Nf11PjRC8hT9wzP/Xl9TcrjYLWgt?=
 =?us-ascii?Q?upmvPbr0l1H1L+36mOymGpSbWiUMEnw/w9uTWWg0O4l2D2gdLZuJFScql6nA?=
 =?us-ascii?Q?yNIxB6uZKlV0hLOFU0en4CBRudzHj1rtQw/QkWh6zX1kWBgOrlJzSip0bYD7?=
 =?us-ascii?Q?HX3K75LhAqOzO3WIgYv7SYK9UZOSaQSC4rTs5aR3yPA8mpfxhGYrMU+xhp0c?=
 =?us-ascii?Q?xucPhSEXzDgG3H+KdfQCdkLwod+tGpu7kc2P/M8hjNZV0i0dCHeinLKtqbBu?=
 =?us-ascii?Q?0Jvu4X64tBOqTYObI4DCfNIQa7Crl5zW+RR5ilw/7rqfCUsSYeFAqbupozsu?=
 =?us-ascii?Q?WdJS3mbIj2a4j4EcWL1Dovg7lENCmoU4B3tsuGd+6plCNn/92B1bV7gWoVll?=
 =?us-ascii?Q?TKn8TjYChA7QiJ/Zyi/RKVsLUVkjORBO74QQLIAxsmUg4rHYZpgTUU97j5G8?=
 =?us-ascii?Q?EPCnttS6MQWKkdVpSdg9wippfJ9vLzmur6HMbFfxT7S0oJg2lqe+dIu/LZ1H?=
 =?us-ascii?Q?n3ByaAy06yFAHgtoGiKlrvsIXbRza2+LetXZuoqI1FGqcvGomzSYDlFDK0HW?=
 =?us-ascii?Q?ORWXRfyU9ldQuEBHeyC+REWGfo72svE5WJu9Xvw1BYV3k3ELhJVUrSVQiQjR?=
 =?us-ascii?Q?inpmab7yBJwS4BzfplblC3znHV4X95atkp6pJS/4b7cCVrrEGEy3rY1dQxM8?=
 =?us-ascii?Q?NikQWlIP+9rHm3CU+RzlX242LPBiAJ6IAtPDb6YIKMckFDNjAdYqX+ESy5+g?=
 =?us-ascii?Q?F5GDSLtSlcUcvIwtgveFePk7lrIfFVdLuDvNjNg6sAAdE6nRTLdvkU4XF5iR?=
 =?us-ascii?Q?4pF2zegYuOHhc/fGzElm0Yx2iB7T8WzEoCc9P80/E5gUwpqyYRo8IsVpAAI0?=
 =?us-ascii?Q?lmc8m02zl/c1Kc/qvqxU7K1iqHsyMB7RzcCoxYu6dq/rQPEYrM+VCistrDLg?=
 =?us-ascii?Q?tL6L/7+TMfSL70X/NROOiaG5Hq3I0CLEGNIuOuo/mfXfU4v/Gh1pCFaC/UcH?=
 =?us-ascii?Q?4Q7zuHLgWBv5r0ztjasongtcsFWzMIJT3FusGGuu09XAqjGAQkbbLOvITRgZ?=
 =?us-ascii?Q?7QrEgfwCGXH15WdiipB0aazRLHStKX6x8qvBWrBWP5vnyvoenRv3k9cOgp7N?=
 =?us-ascii?Q?VC9VQyrhGmilCMaT/3/jxvyyxovql01NsLFweIsjV5oSKZYjis9cMyrNkHR1?=
 =?us-ascii?Q?XPYwygLoZRJNQN29sy34KoVnkVHyzSw6k5GMjSSEjBrWMlrr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73103e64-fd24-46f5-95da-08dea5ef36a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 12:59:56.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISr47sFU77O11LWQdgqk8bDmh3A07cy4JXNKaUFrnYd3LJsymJf6gcjVTekOTxcX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999241

On 29 Apr 2026, at 7:58, Vineet Agarwal wrote:

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
> v4 -> v5:
>   - Restore msync() to keep folios clean for READ_ONLY_THP_FOR_FS
>   - Remove O_DSYNC since msync() handles synchronization
>   - Simplify mmap() check and drop unnecessary cleanup in error paths
> ---
>  tools/testing/selftests/mm/khugepaged.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
LGTM. And it no longer regresses for READ_ONLY_THP_FOR_FS tests. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Tested-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
