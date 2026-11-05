Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891992;
	b=nqJKbrWcNx5icJ6Htm/DFt/YtD3YOGDEuLo/tcMPQWMTH+hhvGnAKQV6Q9/J6C9VAURu
	 9ZaWqUWft+x2Ck8MtvYAdOb5kNa6Mwm6DiokR4E1ktsLuUlbfeAuMx70jBU2sXSHHmo6/
	 M5m7dIDzqaTnLIvYKrH2qqSfZJe/z4xMDQdkrRrszvAhE8NwZ6pN6e2Q3ti3k9dN0wYfX
	 Cv6hIUVa853IOFbfbdB6UkgTMdBwfpHbm4Jgcpytp0nHBTA7TUnYV/X1XPeCPzMZ/pEAp
	 L2X132m6ewxnROLCrMzlCvwd28pkIDUcjZ1JrLme11BPaXKc/7VksVMCz81QwClclYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891992;
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
	bh=su5MhqTGKgTrL6fTV2UJPNNex9wVkIWEa9Ke3XPLe0w=;
	b=DFHcNVOgFioQivdJZ26MwcFxIJOYyURP1nF47G6Z6jpJiFhESKoRU+dP7D9uIGeKJDbB
	 fClWDRnciPphTbam+qwY/KwXV1XM7lp6SY/BlPwodvZUVl6Hsre5g/geXeSo8scFlRyhw
	 kMwh2mNVsvqetiNBK4ufksiFH9usclW2kM9EpCekBzmYASmEF6jOaZCiGF85p/8ScAZfM
	 JsTLwZgLS/J5KMQaktqZKOylKHlutMlh6WulKagyep9vLS7aR0xAjiU6/u0j+7F/t7QQq
	 Au6KWebSFvs+aFrMNORIPI7+z46uIRK+N/rS/KeJuEz/stb9BjjOE4BfMYJhLvNCjuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h6nLtHmV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.2
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984716082BF2;
	Thu,  5 Nov 2026 15:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984716082BF2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h6nLtHmV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uidAdbDxyNWxavNKiFEKDcT7lkN4JSZYBaNs0/5TDguJl3jWzP5ey936K7svLD+0zjTgHfJjpZB9LCdh8xRH/9GWD4u8ALCvKApAyPcJ2L2pGnE6fHvF/8xcHzTTGf3BwuVyzRRRPSTE0p81SyoQYdlAkuP8sSsaCOh+Bz+huXO8IwOj1pXfwqArBBiTg3Y4p3TxEWs5nhxjpNGHC5WlxW6Bx9xQn3Jhk66cAbCj3ghU5qAt3xS7WI/FlwwSnHql9PLolwbtcfDGIf3OvxIQwXpoi8z1U8ZAfVATtXKYTs2X2hVsDKsYfbTzP/kLCWXV7YV2T4FnBaWnJFv/OCxfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=su5MhqTGKgTrL6fTV2UJPNNex9wVkIWEa9Ke3XPLe0w=;
 b=mTdXwgQ2L7A92V2an6fzcTbQa0vbit12FzdDaTXCmh+UjJ5+6QAD3cleddvqZh32tC6g2X0GeEauqyrKlza6Y5EpXqNTpnpx6sBS8QhWUsULMg5Y94ddKC6SZRBFImz8X8GAA7ckpIj8zMzvkXlVs+MJhDrZKHAR8q9vjbM1qMhYI4XioWjquYsl4WpTOd9zFrmVKLJvqv4asO/u7iNdUEwxOUotiw117x66aazjmiWfyKyWE5ag6B/OpUsgeXaW/sSQBigt/U4NR4B4a57qYJH28Bbin/FKCJiy+KREjDtNdr8vdvbuB0XkGw8iuk/TvQJgZo0G5SCMUiGkUct7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=su5MhqTGKgTrL6fTV2UJPNNex9wVkIWEa9Ke3XPLe0w=;
 b=h6nLtHmVIvN/MlgVQ7vjXsQfynLCIYyuWKvZl9MJlbsUNzitwBIMhhlhII+BgqHeowEgu4IVpRaSuTISN17NpccY5qeW7HS1ZdBi+QnCYt8Tpyh7yOFWWUtjmUB1PzUnGp8KL7+rkTcgBh9a/oMKe5nwee37dZsEecMT4VCvItEsWbLNKrz/fSbKG3SJkPwNBb0yR7RgCIqttaU/R/3Wpha+XUOcUsEgWBr22L01eA2j8A0Yvf0LC6mJg5G6dc5fq2TSh0pakCckoQVjRgaePr50D5uMpq03j0WYrdw/Fd9NJWf/255a4SNBi2iqW+tz4yk7H9qaAzhDoeM0iE4o+Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS4PR12MB910612.namprd12.prod.outlook.com (2603:10b6:8:506::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 15:19:47 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 15:19:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip split_huge_page_test without the
 split_huge_pages file
Date: Thu, 05 Nov 2026 10:19:43 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <4B926B36-D797-4861-B6D6-27E8D7870287@nvidia.com>
In-Reply-To: <20261105030242.1241448-1-sashal@kernel.org>
References: <20261105030242.1241448-1-sashal@kernel.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:408:f9::15) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS4PR12MB910612:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ea4333-6395-484b-9688-08df3b503939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|17002099007|6133799003|10067099003|22082099003|18002099003|11063799006|261022105027099003|56012099006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	447M4zxk0XPxAHbG9TSdtDi6Fkk4UCXeVvj9NxrHqIE2/lPdi1swjcJOZHiV01RlUwKgJlxhCB6xe52BVK/dB7V2hL1PS3AL1IZIpQSaDRhFiG0XZFIVPU8GEBdqC9VJVvufKPgAjaTakX84rE7oPHXtEShF2+e2NOKrkE7njMiF8oy9/z5s/U6NouOl2/IGk9voCplDb+WdQ4qfqfKz5fan5rtpxAEEuYfXrEvUBrjFrGFzPzszIYYtbxO7Xs99wSxBPNculkscs6qVVBP/Mc0cztOHk5xPbnJERsl0gjr96CzXJ+8+xqcMCqSgB7KPgIZnJo2qo8tXnaZZHyXiBX8K50EfIrnC9+CNWFeVRQJAsnpIXMY/IDO879DH0rw/Z9cKiS1V/fwR9CzQdsVPQTBvkkgs65NCdIfR1g1EqcMGAnQy6sXKjEslnhViq4E58qXTNzGZB/kbZeONKVqVMadeRHlUixk6V2+wM65HOs0MCf0PbeOQ3SUQia6TmikomeDIkPG5PhooxYHM31WzUKP4/xVrBELLkvaDpwH/yWHB4DiPNAfAZNvQJkMBE/5lMP4WwV8qbiWHs9qlmCwg9GwABhsAxXIQ7aAvyVMx1hWyvoaYFKaG/U9g04BtZflTTO9mLYWJtX8ZwYbLL38lHCKYCTS2IWIFn8/qsfiyW3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(17002099007)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261022105027099003)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?psTpbcLvPUXoViMLwrHgYAWtLedHivP00NQNW0u2mV1arNdaNKCTiBVtEv+G?=
 =?us-ascii?Q?nEzfVoIossY4b8x/FPhndAIj3BLgozKii/jv/ThscfF9TNzMoPmMHBIiiIVH?=
 =?us-ascii?Q?d8dHvQA/+dkZejX/5YmKxcYCTFJP6Omvmo5nNxkTU93/ZXEJ23HR/8bp0W7+?=
 =?us-ascii?Q?8i628l+GTc29rJvLuvqi5jMudKdP2NVCGXlredsUy3RUASbw74wvc4JXlIz1?=
 =?us-ascii?Q?nUqqL1vtmhKFj8TchVD4GKU2gi0jSVyOc9K7273wx8lyrU8lSPWtud8F72sD?=
 =?us-ascii?Q?+PdvCzX4+xmc6gepDQDNqLOUVF48K1HfB2YH/7XySadd7SJwTqFsnzMyelgY?=
 =?us-ascii?Q?uopRa94Z7yQ67CiMqkP3p/9c0t8pt5TWraQFbVkYgzNSroX25tpCAWvuO76h?=
 =?us-ascii?Q?0JhRrKLLO6k5PbfPMK4l7RJpFXhB8tjB3+nzSVdo4NUcD1JFpDVn/9glUJXi?=
 =?us-ascii?Q?FSW5eNZEUn6FkVuD/zPKPr/eXC9FteN4B6kn5osefA/gLJBXquDUZVhO074h?=
 =?us-ascii?Q?4v4UrMA18YVj4cW5YUcVnNx+XkjMg1598cVtN34RdRluK4sdcqKXgqVl/GpB?=
 =?us-ascii?Q?NKh34MlPRfEQokPmOb6HgewFJs6hyQO6GXiCXxolD97osqQUNAC0Lpz9zW+h?=
 =?us-ascii?Q?be77MbVLaSfQkoWsD4kbyVeDOA3CweeA+EL112pQ4EIgO2m8N+1a1m5IIXze?=
 =?us-ascii?Q?i7Lt+YHJpJyTj8kk+SeVnn60fuPFNhmATBVY/3xRqSQIqLRwATrD3uQmWAJ8?=
 =?us-ascii?Q?5Lnfc0MsYhtrHuLF8VLVEmeTq6Ncf5nct9s3C8K94Vx5T15KjIAW48v6LDBn?=
 =?us-ascii?Q?Znk5idwv5OINheOivcBStHeosxblfNA+8RkH3tZfAv3pNd+eGRIV3UIuLANM?=
 =?us-ascii?Q?0TmVj2sPNjRhFWOb8AE3VrN5Jd7ZVeaaHMDCHxBiYgiHVPkmd9LjfM++Hka0?=
 =?us-ascii?Q?iVnGWCy7erYiX62I/zQGwwJSJHn640JlA846NmPASotDLz4eyVrKFHV5qbPz?=
 =?us-ascii?Q?CoTHISNRm0hbsIdxY6mFXbG4ZrgDzPf/VwlLblNmZaso0LqlPlAmTCTTy/k+?=
 =?us-ascii?Q?t8PizXT8qFTGRWH8IA7Dm1l78zCLjqRpXAm8UgGF+kWk8w2IsqH3DVcgGGKc?=
 =?us-ascii?Q?4ZxbZIWVl+jEhNU+Vvev+zSWcvT3FiPtLvEMAxQ/aO4mTg4JLfyzeWnd0d2D?=
 =?us-ascii?Q?MH7CD4gygYeUuyfXNhCFnlX/Rw8zoDl7WMjWZG0TWwK+5rqKbJYMeqiLtYRr?=
 =?us-ascii?Q?tD04j4eN4H2hXKdx3rCHcD6/dPwoRs4/Ki9kW81fGWhQcmGfSdv9q57Kky/H?=
 =?us-ascii?Q?eWCunlEK+oiotPl6+Evt6Ux/Wm5lyhGkOeONeD/qce+6py2KvWFT3VzVHEdh?=
 =?us-ascii?Q?t+SrIQsl+clxSCtTQGCNe1EZV4iNlH2uEoYNHpG84cV3SwrUpbS5q9MjRgGe?=
 =?us-ascii?Q?BYzqwt0Wa3fHRezkRboyZ2l3BtDLMLchMjQVwOIVtN5wyR9oxgr5IOeJyfDs?=
 =?us-ascii?Q?KMm0sgzxE0giR2Hk/0JCcW4tOQo3i/VCBrUQ4aHZlGs2ec9l6FD9x71nQouO?=
 =?us-ascii?Q?cAvVldTQKBDE+iSDjXvbz5mRixb1FWABLNGzPG75lH0mmP4IMgpi0aORZ1ey?=
 =?us-ascii?Q?iE6OUrBFzfphpMnmKrSTWVIZ37YdbBak5wp9pliPJ3EKHRZaYKXOpZBfJ6Mc?=
 =?us-ascii?Q?1GRVEdiNj1aocR5vC9jRE6QZRtP3ngerZWLuSe9L+h9VJhOD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ea4333-6395-484b-9688-08df3b503939
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:19:45.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+jIEMrJQ4QwuiUO+TX/MMzE3ZIA4cE2eMvJYdPpQWYw7XCJYtiSVfBNxcPbTigV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB910612

On 4 Nov 2026, at 22:02, Sasha Levin wrote:

> Every case in split_huge_page_test goes through
> /sys/kernel/debug/split_huge_pages. When that file does not exist,
> because debugfs is not mounted or the kernel has no CONFIG_DEBUG_FS, th=
e
> first write bails out of the whole test and it is reported as a failure=
:
>
>   Bail out! write_file(/sys/kernel/debug/split_huge_pages): No such fil=
e or directory
>
> Skip the test in that case.
>
> Fixes: fa6c02315f74 ("mm: huge_memory: a new debugfs interface for spli=
tting THP tests")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with KernelCI's NVIDIA lab, which runs the tests in a chroot
> without debugfs. Tested on an AMD EPYC 9655P with KernelCI's x86_64
> build of next-20261104: without debugfs the test now skips, and with
> debugfs mounted it still passes all 62 cases.
>
>  tools/testing/selftests/mm/split_huge_page_test.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Thanks. But I do think we need a way of specifying the necessary
Kconfig options for selftests. Oh, we do have one:
https://elixir.bootlin.com/linux/v7.3.1/source/tools/testing/selftests/mm=
/config. Can you add CONFIG_DEBUG_FS=3Dy to it while at it?

Otherwise, LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
