Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793722304;
	b=guT8fhR9ux+KE7MI3M4GEtfjDmXiqqBMrpAOA8GfYH6R3ECBF8pJUgQ+5wcbjJcCp9zX
	 n76RXzdYfFIZLW6tVFc1NIFwqQ0xxw8llZRK+nqnr0IHbe4egI8nlqtf1/Id0uzoPkNiz
	 ZOxe9JfVDjl/OmnY+SUO01aDaW8yTnjTGpCpuMp1gPi2XLbRhmXsWsbUWC6vaQSxAlrl8
	 6CPrC43XjvReuK05HczTuwmVwFqAmyHPIwT1DXtLjfqau+9I9BXULVKIcwXlfoGZoJge+
	 QgAwAv49V4L4DD3QIUojLEfexS9XvRCX14zlu9N4zypXrXf8U0GjSK2CqKEnPAQiQNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722304;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-MS-Reactions:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=knVfMihA34/swoT1UZQLVmq2kD4XEWEDQcjVhXkvDZM=;
	b=jkC15h99rOGXWeDOpe4atcWT/sgtHcislOit6EWOXtfmnJprMYn+qPhSDPV93fYdiOge
	 0NobjnH7n92W9Ty8J9XoDya4C8oMMBDEO0vGcDuHZlvWbvakm8oAPJw1Rijgg8Q1KHdKx
	 cRSAEAC5Iu2zJ9jk4yIprPnMU+zBrVfVpG0CETB8RVzgvXGWagR7QmjfWmooluNchPSk4
	 pk7WzCJ2SNMvX9KfG1Af5sMUehu3gQmBTaTcF7Pe8pZqKeFMq16mH+GM6DuAcG7tEhAFT
	 xQVAF2M2ItBN90qYUq///YtZ2rKThp0jC4r4F5eXwJRwRw4mR+CLwMmhFJiP4QaZjbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hmt0GuJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.20
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57C606A326;
	Tue,  3 Nov 2026 16:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A57C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hmt0GuJK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s//XKhahjsd3vJTNemz3EyIMJrnkMwD1hOuJ4ozbkjTFxSys4t1i9G99vALIGB2xvhPLEqNfMSxrTnfyyTopJ3Q/Wx6o2av+KFuBHewEDP12k7uwcFE3yAcNyjQcQ55lLF1YjeCJTTS+Eg6f2mBvNcilXmVjklCYee8gNYd8jwpuQDfOH5PtcFS4ikr70zaHW+NqnLKwWikhlqWdJ+TYNovnGfCP/dWSKQn3J7ss+/+AOcWoIPrP4SDmy2YifEvD9WlmWH+Ua5d3E+Psqf2nKeLnzR+0btGNd5xQG3JIavjnTS7+/TeqdlVfkaZL/Qh0emQrFp4sVYyDu8YzkLIfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knVfMihA34/swoT1UZQLVmq2kD4XEWEDQcjVhXkvDZM=;
 b=cfM7c4IhQxWcAPaglzXWN4qRiZelvMEfcucPhdiaT9sLNkePRDuE6Xwof9a6ZXNHykhBGsF4OldliNuE+SvcZwX8GXCsV8NDgiPZySC5+zGIcJ6k7bvxjkP04enaulVHf4+CScBIWNFHplkIbYbTW4NrKjTj1qYmDDtsmJl4zyZFDvygpdviaqDY3a4Ed9UmfurQXV+/Ubf8fq9XxKC6dmq7FszA8r1cVanjHECPI+/UJqX+OT4RNWRpUQ8SnguOCd7AAJJOuxNIlt7hMclirAlk6c678F4zJisln6QVhQSxOvh0jnuWmgh6hszBVqkKpRTWUuZPhlU0FY7zKJDDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knVfMihA34/swoT1UZQLVmq2kD4XEWEDQcjVhXkvDZM=;
 b=Hmt0GuJKlBBcGyePUJFsses28r88zPOlkFMGKxI1zoWc8Wp5gJMCjiR7njDCinuN7ZtO3Il9tDwR0Y/zIlMxSgRC5W2KoCz80+QHejggVicnObVYYPB47WhsmPjfF2jNBM/ftjwqqYj6nfOg9+vw+FKdkd3dNv1rnlfVGp5FMoj58Klh6sm4M9/IlIR51N5QW6WfvTE//t/HZmPRmp2yBltD5pAXQ0lzAJ9naRGaQAjVoeiCWlfOZxQXIEa/1M9ASHhpoivinutkzTgeRjAKJAaUymQ9kfqj5OIs0+DAbKbv5HhVlsqRt5MC4yedD6OGEDkj/R6CgSqCsaiJl2UL3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 16:11:34 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 16:11:34 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: fix format warnings on 32-bit architectures
Date: Tue, 03 Nov 2026 11:11:32 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <29C315FF-6C6D-49D1-9C6C-243903B425E9@nvidia.com>
In-Reply-To: <20261103155451.534587-1-sashal@kernel.org>
References: <20261103155451.534587-1-sashal@kernel.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:408:f7::13) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: e306d695-9cf9-498e-49fe-08df39c5214e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|6133799003|18002099003|22082099003|3023799007|10067099003|261102123227099003|56012099006|11063799006|5023799004|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	txqsWMVIuPYeqGtXG31Iukyp9vCZtGsibCi8ooLXEfrNkQLnjEgS5VtqaJKxYgQAAHT/0VWZo6H/dUZAtTD8NzQ/6U4ctC6p3HYR4Rb6YgThfNOjvVgLodzq6uZTGZtdBXtvW1dJztSBfEZGgIoe80eAsfq8mHsJUsc7YXwuy8dQLoCEBzEEFipGQ0po+c2Y9PR9c4k520qPL1tSxKho54FpUZhu8pcUCmw/7cbj2F3Zk2plHw3EfGVAA/W/V2vdu415cp/KN+rmblxBhFB8CpOkQFv00j3PjftVsqyma27iyDfdT9McCtSjSafcmzNyfSkPRfXXHY/w4oj6OvGg8e2Sr7/W9Oz/RwxWOcc13x9UOrtYTUkVNq8w7Nf8AgG8ss6Zkz6VFw1WttxiMEz95XDBa5df2zzhmqGUwxxOj5UOJ/r4K72eyPHa7xqabREB0GA6RVyLoHTLz/nhTGtU/QcXXjzzx1gjzcusOuNwlNLn11KTgvz/HSkNBwc4y5EaFlOgze+IPYzVqpW4W9q5WySZCrwG+Uy/ASKSQxW4k3t8YMAkaQO4tWfC7q+Wb1TdRlAi4Jkg4EmBhZFCfFIGdCpKMaGMZUwPCwN+ToKTnNtUfvW5Uc9rfXqgFzNcWN361EQFRcESYljyD4gDubthlJ9kifWP3uhLB2tVhLQvrbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(261102123227099003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hj56yKpFuMMJasqq6zJLMlDgYgXjV8l5zxU+wSbWdxKVsEIhqJ4ouhz+IQbg?=
 =?us-ascii?Q?Ne9utpUZY1Wl/rASt/0h2P93bw2du2tXl7PjiJyymJUnC9kvgpQTl0Aw6+KO?=
 =?us-ascii?Q?1B/kCCfqd8M5hVat09U4Z/zWEqzIe0kbLcegjdY70EQowrxZmP98gWrPYPI5?=
 =?us-ascii?Q?sQbmn9KVrBarPR07r/QENwxwHMgFRNjEA1tT/QgUWIIyCfrCxZNlekiVODFu?=
 =?us-ascii?Q?1H9/qnIDgiuSkCoF6Utp9l37wHmIm8Dv/kepLh8XT2JzRaTxHikXAU6Okain?=
 =?us-ascii?Q?cQtYX6xQYcvEVctTumfyiYfzFwun122zRi6CSN5IQMpiq8WRGVohIgAyII9+?=
 =?us-ascii?Q?m7cyGNEb8tfUCHWXgGzqPNTfjcWdhOgjKJ8GUucalOkavc1/HhIuPiNjlVBj?=
 =?us-ascii?Q?cUkWe9aLtiR557G11ceHBuQ4DJdvdgEaA/0oXmDC7c/iKtzUkKeJOsaF85cJ?=
 =?us-ascii?Q?HkHWLWNDbIMc7Ydn0NkRg5+3OQfej+I2xH0zXTyFXpYZyjkPuW73aakU1Ito?=
 =?us-ascii?Q?a+PYN/Qk29KmPJcnvdZMOaXTpUHBiPC2ynrLoj3OsyBl4qVvokRVkp4FPljF?=
 =?us-ascii?Q?pr7mQga6731KOdVWrKrdaTN9C7+p74SpREN5Z0qksf1UtHTWDpo+SyceUYvN?=
 =?us-ascii?Q?tUU9qrXoAJavIT1xgRAL6ztmhH9ijecBvEBGXZW6KW2BmC3lsakjfnukFrvU?=
 =?us-ascii?Q?Rx44/OAlYASrL5Eg2vJEEcg1FrLXGyKk6vFFo9k4qE5mqujkRV5CfS4fwonR?=
 =?us-ascii?Q?H0ROuuqjPzoc5TAA1osh4JOU0Uhl178Py5zgkjBQtsDMqX/azEKGdPeYqpBg?=
 =?us-ascii?Q?ruIZ6JEctyWAvMwnd1y6TZW0zZlwCShJbzlxs4JKzwxKoINeDxG/QycKVuN4?=
 =?us-ascii?Q?FPGZ6fpzzPWgPV6ROoYdxMZGA/J0GFTHK4q2/bk+7/cHolUrt7xtz9LEEmyv?=
 =?us-ascii?Q?xryPmqg5LqDF0Eeak2ytkREvAo8PEuz53paZRZjV/JX19kz2sz6d8SmpItKw?=
 =?us-ascii?Q?19cUXqqA/IY/8I2U1cn7ZnTJtY0N0EEJmQ1n39raYHPpyPdbaWvl5mWc6TpM?=
 =?us-ascii?Q?/ihFb4buk3AB8SL0LT6Vkj48hL55F+Wxv44oyN1x08lK1V4iTWNyTsOjBKbr?=
 =?us-ascii?Q?s82FHAiC6O5BQi+CsyHomIlMnrPrJiMOwmsPba3Rl7/tT1JvTeoBNc+cH+Os?=
 =?us-ascii?Q?OnCjlFdepPuZBPlUR9I2HFYKsXgukdGxBEHDlYVOAxM7FNlnEs+fJk0xaN3I?=
 =?us-ascii?Q?TTSPeRcmUVsXz3MnDon3MJYS0XwLerPw6aLaMTC+zSXs/7O6u7mCdvqoZ2Iy?=
 =?us-ascii?Q?EVwZTpTejq/g2Tyku8mGe5K7iEZD/RTKNCLJwVGp6fYnxAVLARg17NhKLsnV?=
 =?us-ascii?Q?l45WnY5fpIIaqLAtaDgYXAAjAggSSiVM9p2oTOUd8u7i1U6Jiu1jSIZthCuS?=
 =?us-ascii?Q?2p+zvIKDxyJBN4EFHvAbHI5P2F9lTS7D5Gw6fQWANHKO4gyZ64jW7uVm4tSz?=
 =?us-ascii?Q?O7NFOuArRRyFOV5ZXxR/KDnBWA21jCfjpS8g2E9H/+HVBFAexjaLZvOB5KKm?=
 =?us-ascii?Q?At82WdvflVkBKRSsgUFxJRxJgQjpkJ9nDDwzyCVwnQj3qhksx4NmFBTTNp7y?=
 =?us-ascii?Q?udgGaPxCWlEEjz931fkTKnr3+fV0X+rZS7xEtRqvYbXNaqG+ss48v/tK+Lh0?=
 =?us-ascii?Q?ChPwiYlcBij7P6THxAjCM9oSS7wA6es+miSguJoWgmfOwaJV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e306d695-9cf9-498e-49fe-08df39c5214e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 16:11:34.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMiHqqmmT8F4ce+oxaJObpoInlFECMgP40n0fM+ERtEr7mC5BpgeTLfHXWqWyTO2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC

On 3 Nov 2026, at 10:54, Sasha Levin wrote:

> On 32-bit architectures size_t and uintptr_t are unsigned int and
> ssize_t is int, and with _FILE_OFFSET_BITS=3D64 off_t is long long, so
> printing them with %ld, %lu or %lx, or scanning /proc/self/maps into
> uintptr_t variables with %lx, warns:
>
>   hugetlb-read-hwpoison.c:32:58: warning: format '%lx' expects argument=
 of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsi=
gned int'} [-Wformat=3D]
>
> Print size_t with %zu and %zx, casting the nonnegative ssize_t read
> totals to size_t, print off_t as unsigned long long, and scan the
> addresses into unsigned long variables.
>
> split_huge_page_test also builds its debugfs commands from uint64_t
> addresses with %lx. write_debugfs() has no format attribute, so nothing=

> warned, but on 32-bit the commands get the wrong addresses. Print them
> with PRIx64, add the attribute, and cast the pointers through uintptr_t=
,
> as casting them straight to uint64_t warns on 32-bit too.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16=

> and clang 21 with -m32 -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
>
>  .../selftests/mm/hugetlb-read-hwpoison.c      | 25 +++++++-------
>  .../selftests/mm/hugetlb-soft-offline.c       |  2 +-
>  tools/testing/selftests/mm/mseal_test.c       |  2 +-
>  .../selftests/mm/split_huge_page_test.c       | 34 +++++++++----------=

>  4 files changed, 32 insertions(+), 31 deletions(-)
>
<snip>

> @@ -70,7 +70,7 @@ static int check_after_split_folio_orders(char *vaddr=
_start, size_t len,
>  	return status;
>  }
>
> -static void write_debugfs(const char *fmt, ...)
> +static __printf(1, 2) void write_debugfs(const char *fmt, ...)

TIL, __printf() tells the compiler that write_debugfs() is doing
printf_style arguments and the compiler will do the corresponding
checks.

LGTM. Thanks.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
