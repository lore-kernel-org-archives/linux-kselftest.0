Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09451233944;
	Fri,  2 Oct 2026 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961508; cv=fail; b=NyuFQwT2ZFMp2ZNhGd7iZrOCB1qAAO4c4eRblgqGOcawnf8AdFRl+mdOkPqWgUs/b3+OaOk10OMxgG2o84FTKzsd2wN+dqfUCKRv57+bYP2zCBs4z1yPWnkxdSElhzHefQPm04QdYf5pkGwM05F5q9eYidD402g+gQtAagx2E2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961508; c=relaxed/simple;
	bh=ObPj8aIjbIY93JZDX4Jf9+vg95eX3k4desIjncx5GSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zahv1dw1RI0xzLCt1gsAtKdW7fp1BltRMp8ajykB3M7xfImqS4F4BzmV0AOsuxuzknbQr2tLljPWUluIGpiI//u5TQIjXWo+ePDu//1r/XrgIZmu4iJpqLC5BEjOEZxb3HmMon86bBsx9PAv7489YYPEKU6NZPA068fWd7n+F8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dsNCoiQq; arc=fail smtp.client-ip=40.107.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dsNCoiQq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzIzEawDtQSj8fhPzQ29+peib8HSpXQE3sExscTDL05G5eqDLXzlUttiqSqgOE3jtn5I6ncJTjEZJaJl9J65ATucKD5/2E6IOiZh5JiaD1cStMP9zlhL4eKJRe0NM12gucnVJ/o8bnP8RyhctN1c9SmCzgPC5ylFQ9nBcqvUN1H7ZHHhCMfNZSo8urzUJ41S2kzz6vuqP3LvpgBYyEkHhmADAGapJrD16AoeYUxtqlmyrNfU783REKC/GzHECMObJItIdn1uOCj5ZAbr6DdrpCDgtbuI0fzwKsZ/WefBPHRsVIdSwto4OFf0SMFI4tYn0nJMEgQIM8Qb6tKtadjqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwfp8JOnrsItEDt8QqXm0reSHWZIwUB0O10inUaWeeE=;
 b=FktH9Y6CpnW7/1l15VczLs4jjSWID9HGSCWRatsj0R+hmJ/uu3ievUiLEl5ujXPJh4S4E5rFCH14jR8dzB3J3TAlwzAKumLyiP8GLaWufszzwPciuj5wsenSnOK5ErW6HT1Re4Gf0V230gZWR4Uz5RZZGMrmkd3KCBwCzLhpUPPVjrWmDw3PCvgzB6oVuBVAQvypAM7fhvdfEzTFuLF+rM5i/yYoJvaeSLxaOLWXplY1LEw7+r2KLYoAahI8sPkavZXwhbZSU+GQLqexzJLDyNCkrP6jV8uP8tol1KhBICScKXp6tzfy7N5cju8PXIh3IYRmUMisgLTlUnNNrCxDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwfp8JOnrsItEDt8QqXm0reSHWZIwUB0O10inUaWeeE=;
 b=dsNCoiQq1XZbFrcTuRpBoUFtSq++Vx/mvbhjVAxEDjFjo1L9dBM+3W4ktFT+Z9sNdi3No5iYoCSsfl2lZSvW1g0+qGwjIL6GoNqegfyoSLyScgW4Qc3NulJabjrvlVR259E724KBmPLZYU6AlcmdEX8O+ROSrQHFWL9zgnVvFJKVeFsupf25Tk0qWgNYwwDBRqz0CdrygKDQx2u24VcMCBUe8+5ccCoYJW6tR0zSaTQmfNfrZrjq4u927cZ4oB4q14buuwgjavapxJDHRX8X6Ht0EVNuwWZfQwvfjz366FObFxBGsi/shMTu9f601kfpML+medU0XPwSm2tDxJc05Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 17:18:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 17:18:18 +0000
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
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/4] kselftest: mm: integrate huge page checks
Date: Fri, 02 Oct 2026 13:18:17 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <36DEC53C-FF4C-489C-AA05-8051C33416AF@nvidia.com>
In-Reply-To: <20261001-fix_split-v9-3-0f4ba8bbdbdf@arm.com>
References: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
 <20261001-fix_split-v9-3-0f4ba8bbdbdf@arm.com>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0793.namprd03.prod.outlook.com
 (2603:10b6:408:13f::18) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a98c2eb-66a7-49a0-9b7a-08df20a926f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|7416014|4143699003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	InI55kX5rQ8K4S34VSxkpEsVXtDq5/P8bG1heefOeX9e1DNCu/iS1quJFNxtj35uTe/yTUiLV4HL/f7pKoskw6PLtXCPUCspBo4xy20h93Io6RbbYxwiBu3rshipJdUYCP9nL3pgNKjAUMlkxMtVOMojb1AclbV8Sze3/h06nUbAsv9xJzD7n/Iwk6Eapcqst1Ck653ZMWC7pn9gSLwU8qTozIHIyYd0u88fbw1Yq//Sb34fh8Omc8iY/tB9Cb0nkYHySTSwIdCkhyh4y3Y++r+AgQpkQfHZQ5PRhpAOG/5rDfNfLluYs9lwnkYWx44F3b/OSEhUlmxctBEbODiBYGiZKkHWqIk/uq1uVqmjUjj99x/fEoP7Wqf/zl1kgyQH1caHl+YonUo9P8MCoFWJUytduS/uvWCCSJYez6FuIHtXlqztWadS7oyC6Nx0KhSBaXiT7XoKL6BpqJcSrhT5MSxYv/N6rg8ejgcyT+tphMf2/teOY7SmtorXAPk0IAk4s1jouKq3XobLCzurEVG06yKM+qk/TTYZmuglazWVe6Q6Wt+Ror3SPC4M5jmWUZwLVa9G1NaE7MF7TZg7iyBBY8C5rZGJZcmG+OkY3hIZbsVd7UDjqca8I+x6H3XyOwNEE3GZr7RmHYqLJRN/cGWtpWMiRGytugLecGnQRsywYV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(7416014)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PYC6//crLt3/wONU4SFvuwG1CiHxmx9kJGMxMdbF3QpfxYDvbGViytMCt2mh?=
 =?us-ascii?Q?Xj3rJDJPhCaMRwYL4HagOQB21XB2ybVg8IcxBgKfYK/iBqIkLIttMQ+rkIgk?=
 =?us-ascii?Q?zlF+q3P4scFTkBFBHskZ7FCxzzlD2/0mdxItiJEe8kKDjzodKLQrBJmqidNt?=
 =?us-ascii?Q?OJZO8s5c+vIoPwZxtULsZCpcPyOpcW3moLInOGZbmdmzIktU+VjjErDsJ9d5?=
 =?us-ascii?Q?6gN5fXvE6nwSr9szBbylHcnaMqqLKzm+UmBm3TBTtmZfKEtI1lDYSKnBJnxZ?=
 =?us-ascii?Q?AHN2Nv1PCzYSk6X9Lt7HytNVBE6fna5VpBPa+3jscXroxO7gAYI0XZhUzt32?=
 =?us-ascii?Q?O002irAhdDalMeosCsB05DWe+SggEqbOOHK4NV8hz1Xcvn24qIkI+6GejLOJ?=
 =?us-ascii?Q?E1KIRlvw81hX33GeIo2xCFE66KM6ACiFYOnUOPSCQAnKoLJ/+L28oSxzQxvi?=
 =?us-ascii?Q?TMVhjz/hwoQdWsFq/aXgYUWsGZwruoLgBn4qik64B2umwBpu+RdlwY2L48Kr?=
 =?us-ascii?Q?gak3M5XZd9lmB+/Z7UnQNclKa9k2mLvgm8Tb5g8yeSemsUDZOCLn3Ktz8/oG?=
 =?us-ascii?Q?/VeA3QLljvoisgorN5CyaGR0FPR6dRyMDPmwylcoodci8ouSqBvkqChAnZag?=
 =?us-ascii?Q?cLps53eDhWgpd/+vCuaQdlNbfkaYwmUKvLqgyPVQ1UNBpxBMX+WMr90tL7gF?=
 =?us-ascii?Q?GxCwvt9zRC0JvCMuLX6FXkCo6MHFaP9lJo6MopCWahJZYinUUWKAEFxCFrzA?=
 =?us-ascii?Q?F8kO5xh+RQuX+ugPZGoTHmj3S3g8kjf+OTpCANwpryBhZL6rXoiGbKS7gwRV?=
 =?us-ascii?Q?VEWieDMwRIBrGh+CkWv8ppMSXXA9m/X6jTBAVfb3w6H6MRpZ/a9L7aP4K8ea?=
 =?us-ascii?Q?ohKHvDkW9Nr4fV2mcuktfvZlIfb14sFVw7GLE9bPBJZRCQInnjaQhKdwPdNT?=
 =?us-ascii?Q?0kQQ4EJGa334m+ezUUCn9093yInaeaEclrKZLS29SvrvvXuZqwuf/bvrVSd1?=
 =?us-ascii?Q?PFinfRvDyEKTgQ3UpPcfXWfIyj/dMBWZkoQRS033Chd0f6+oNIjooAK4ybZc?=
 =?us-ascii?Q?5/wLvAE1eSF5tRc++bHgyEuco9GZ0baKUjRWqEk59S2aog5zD4rfgj9W4agh?=
 =?us-ascii?Q?9kvBlWw1bM9FZ3dTt8iOzn0SC/McBEplN3jAVpMT/saQSaYHK6HTOxfq5fN6?=
 =?us-ascii?Q?acJVlUZvcCqizX2UB0oi4FgRtN1Mh8cnFeCo3XIKAVCf3y8ORoYYWLkcszV7?=
 =?us-ascii?Q?8RSR7Om3mmZb7BEytIlgox51/+UYBYr/jZjJ9NTWS8SKHeItfKoxWosdW8Ef?=
 =?us-ascii?Q?VTFv6PIj6hhBePPRxYeHeroWUCmKwR71MyEkpJatxIQCL8wJYKF+6MqlMn6P?=
 =?us-ascii?Q?MKx9LX+A5sOmOcewW463WizpAI6JIIAa1EKidHRjLpIwbWZbDpmptlgbqnta?=
 =?us-ascii?Q?1efyRIqxNmh4jFDDdXz1YiyFFEmgT24vFSyLRXPW07Id2gwrVnTYvJh3t6Dj?=
 =?us-ascii?Q?bexOIDhHQcNa3HVSYBb2OKJuAJxJ31sl5TmfEA657qtOSkf7Y9IO94C/V9xN?=
 =?us-ascii?Q?vVIFKR8MdV6LeMm1kkjGJwrSflO9lHdAyg0CJah/wYeT90DeTzDsrbPvo22k?=
 =?us-ascii?Q?vz/pMRimMqk+1RyF/thNJW62sYKw0LGltvk7bQ1AHGZy6AgqzZ23OyNqsbMo?=
 =?us-ascii?Q?xcrE1ClZ9gi3fE7G+Y6JxcvDyaz2opD1c5ScANXkAUOve6vEY1EjR9En/8HO?=
 =?us-ascii?Q?XtcQjaCt3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a98c2eb-66a7-49a0-9b7a-08df20a926f9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 17:18:18.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmU4uUrHnteMPyYNA3roVZmxvwK5LyMDbBW5g+z66+oUQFAxWTHkq7R0vhGHx4T6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

On 1 Oct 2026, at 17:17, Yeoreum Yun wrote:

> check_large_folios() only checks for large folios without distinguishing
> between anonymous and file-backed huge pages.
>
> To add huge page type checking, integrate the huge page checks into
> __check_huge() and __check_type():
>
>   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of using
>      check_large_folios(), since only the mapping type matters. This
>      identifies PMD-mapped huge pages.
>
>   2. Otherwise, use check_large_folios() to detect large folios. This
>      covers mTHP cases.
>
>   3. Check the folio flags according to the huge page type via
>      __check_type()
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/vm_util.c | 90 ++++++++++++++++++++++--------------
>  1 file changed, 56 insertions(+), 34 deletions(-)
>
LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
