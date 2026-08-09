Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FEA78F2B;
	Sun,  9 Aug 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265458; cv=fail; b=tUuJJcXVvwVIbqhu7oDMX2kDfzwb5/6KfKjx9zGqZWrbjhfOvdykip0CTZLVIvCUANKDrLDvewOLFqm02qQR9y71FThLzMGQr42B3Q5Ddpp/BfHMzOl/gFSg05I7d4SPAw7rrwWn7Kd1tRtgXGI73fvMJ5P98/9qDIgUyG+dy64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265458; c=relaxed/simple;
	bh=y8XzuABbxFoxyEn1yTROP08c57VJuuLMBJL0avh3Uk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K59mpYCN+FK+Au646vVofRgEVLnjZXfg1jVUiYTmLxngR3diQsGnVe0H1Fmwly9lrlbf/NwaaBxc9doVWbZ6r2GjYQYcVUwt1M3WaIaxNWjNpPNLD2SqsijlDlPw0iN1aSssY2P4YLxgrxcSr/EFts+bH6EYU3/pWJalKC93sjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I+JzYRhv reason="signature verification failed"; arc=fail smtp.client-ip=52.101.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I+JzYRhv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2SQBGXdrQzVo8aeQDTIjruRABDZ7FsOSB0t511QOoubXgikkHV73tJComMcX48LwbYlQ3kCxGi3Nl5HDWuJLRBNxUq4QsJuW9rigYGokqV4sSjZamEu5RWOZPnCn2dBGzdHYYtXY44PV9T6z6eSfSwGiVFPce7QjqKhw83oYx7KojuodFM6TZp4jhX68PIsMLmI+F+nznYbkVA+zZ9QCb0MKdS9SAidTwa3qCDUaZT6UbwbyeKMfc1YqQgIf4tmf1PBUOyfQL5nVpY8NWuvMbcy7APFhC5uE+tHAJZuKo3+jf5dJ7ov3Wl+IzU6zMj+XlCuRKyQNz3GwP/MfpG2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdWTCATNLrv7khP6pHIQ8PJimc7cIYEJxpSeRwfCzoY=;
 b=DjMV5NoAE/AMMa7zX9roffgO6r0YRU6XNgbKXf68qiY+d33yb2dRY3zIEsTn8jigX3nc2iLu5k5Oe/Y+bj+1p9w8m5dOMNnXZCInhuI+l+IOGeQvouJve0QwG2J1MLaXeMXKN2SnGrE3DNHM3rRQ3d5dhQxNFEdZku25smSS9I0A22K98IzlVuxFyu40wP+EYF9DMwyW+F0JO3/f4+Bc5xCAp4l6NW12bI/WrPDi+YiO8gvVS8aBIKLOUTCSS5XPLE84xuJA9cYtIbn6q9R1OzmU1Namkvuos0jEquORZOCSE/CM4UDYXZCrYV1DWl0Fbqc691cqN06rR+/XY6g+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdWTCATNLrv7khP6pHIQ8PJimc7cIYEJxpSeRwfCzoY=;
 b=I+JzYRhvH0c3eIj1AoaMbAbMRoNICUmdOT5ld4egWCfRM3pZAHvJw6KNoADzhJurfpgWFdnAD6coWkg9h/60rwbv1TzzXtfUPjemdipVFE21YxeG03e4nhI8H3xE/ZzPKA0Qe7NqduTFRo4CMnGRGojD+6TkenLGEZtrTnBWMw49t3Ezr5vvHzRMjlDZEkYgJLA6NG6IRUEIftyTdIOk0L6zUQP8C47dajtXrdVOc1zJkEqM/3lYDDb8YjoctE8El33Byy+7PIsPKhz0ntrOxqmOnez1fvU5rYwP09VgNMBHHbycUImYsec2+ihSCa/lleSWgJX/FePTEI6nBVQjcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Sun, 9 Aug
 2026 08:50:52 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 08:50:52 +0000
Date: Sun, 9 Aug 2026 11:50:43 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v6 01/10] ipv6: add ip6_del_rt_reason()
Message-ID: <20260809085043.GA2339479@shredder>
References: <20260808005642.26901-1-sigefriedhyy@gmail.com>
 <20260808005642.26901-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260808005642.26901-2-sigefriedhyy@gmail.com>
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e8a41e-7e50-4886-d2c9-08def5f3512f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	I6tG9dkwBFzN6Khh6aa9YMW5Ltl1Vd1MGPsS2oS/IKPnuQFSFdeCOVfgCsEdTV3pX3TP3mMSGy91suHntOQSKpI1kF2+8TNa32ezUhNmthHjFWQ6fpzhcey/e9jWL29/cBCIps3W/G9LFHkBgBIgYnzZzYbVpnveBM8MNuh798q4qyNALDpXx6X3uPLRrK8tbqfUkggUp4Tk+I5fznIxeQds2bkn0oMH3FivAKCf9x62q4zDc0RqgHRTUWEaENitw3u+3s93MRQYly4IkHatfTm/cSu7pAXVV9VepD0b6qYD6PqGvi0tzHUFjezYb62BFtms2Hjk1GI5hVv0MBHXR2gkGY+DxuPVKz27GdV+1YUeE+6QDhbrIbGiei7M8UsRUmK3az5/qhc/PrNOyKpCaw4EEP9Z3hojiVhDB7x48zb6IE2uzGdn8gn7V7c+Hlv+VEYq0D0xlBSunvN4Wtx1frSpUSykgzgOtHyYWGBAg/gNCyfKda1Fj2rDqUNEVndO91/Ap9NKhMu+xk8UQAv5+V/41jbwIndBOvLUHBUS2UwlfTMSfFTYkWcyMuiBiB/LodTvZEiw86TAfMHfj2q7vWAzRxWMkFPYzQQv0uvPZ2sAaLoa+eUFtBfxBZ7PMflb7lFmbEKrSjgSAhUTJwAJZ/LgtHEtRMhu7jHI9PxvLco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eqsciufp6fjZsr/gH7rv77fNkxdptNy3UIOx2byKiqyEUgcpw7qW0AXMKY?=
 =?iso-8859-1?Q?B5mapson9qR8YpShQTu68F0cWwZP7WGSHBTykMaPMF9pue9u0Gc9LrE8Jx?=
 =?iso-8859-1?Q?evJGfsfNXEm3Y8Enj1RoZYfwkAIuyxvb6YpXi4s0fMk7YtIYoFI8ZvJ4VJ?=
 =?iso-8859-1?Q?SU0QcQXYzTo9qkuP+dcNeiU1DYlB8gKpWZ/LnceICiT2oWvZOqF/KZlI7a?=
 =?iso-8859-1?Q?/J3ongAGKMTVvDVMRPDCpe4BWztF9bZD93qID+Mur/3fN7HWoZMQ+q3A6c?=
 =?iso-8859-1?Q?8ZH48BmkohM+S1qmgfgyHQ2epI4d72LAXLM8yon3T/cfQY2wWEYJZBaHrp?=
 =?iso-8859-1?Q?Y/SzZvJtcnjx2BAUTS6AnmHsD4vUVRXGxSQbC4LEq4ScIBy8DWpdaPHLkn?=
 =?iso-8859-1?Q?KO+byOLLhdgZes0E0FRJ6cjaJGK72Tc6rqGFyf1+os5/4fFeIVwq7Cv+YK?=
 =?iso-8859-1?Q?6tkQ9tKr4CaQokqLjPDAKk06GnYc0RVqneL0xynarjRRRb8lIt92Pq0xgT?=
 =?iso-8859-1?Q?MkoLMv2wMTfynW0hloS5B2lplDCF2glQhRjN5FxFAfj4DjphmkySas0V1C?=
 =?iso-8859-1?Q?TityyTwZ9Y+hdiSG0wVPeURaJeJFIaQ6i5KXLItMrpfJ+bQz4RRiCw78K9?=
 =?iso-8859-1?Q?OAVrzrT0IAoiBSk9FIsrABmpC95rCsAmhvdBlhRpP5/oWljAJ7SnL8KPVk?=
 =?iso-8859-1?Q?jtwZkJ7D9zjeml4OCmQdOsC2DgcqQYu76FnbPcCqU+c2AufordKNJLVl6/?=
 =?iso-8859-1?Q?s+tGfIFEhccInGqAE4cUFRUS983t976A9N1lYVPZ8C7JBNHRqaENjcTONY?=
 =?iso-8859-1?Q?UxK+YvA66ZDnF1+AdyiL0M8Hhg7KgBCB58XYQXEfarrb+EkgtT+sdX48cG?=
 =?iso-8859-1?Q?3qjiCpGUA9xiJGJVT/1IWOEGuK2NIc3UWsawbMxCHw+u1tZpF2Aw9qhf4n?=
 =?iso-8859-1?Q?FrG6yCZHtW+4wnfn9i40yHWh7wU4zkpoGmxCX1r0jiuXtoRqYlbVHIihGZ?=
 =?iso-8859-1?Q?iVdEAZfqH6wrFTNIUioA9PIeaURqeFv9ITjNcXQJauzKjYcICdMru/03dM?=
 =?iso-8859-1?Q?xnHDZbIl4EC4qCvM3Q0hQmAu3LCBQM3rHDxozOt8yhMUUpyE94IjrxgoBk?=
 =?iso-8859-1?Q?FwF6IS+agmy500xk+7Y0AtIYHzG/RwIhu4pEXL+vW7yMcU987DOwFCuVNT?=
 =?iso-8859-1?Q?GCI6NJa1dhFhRpZG7HUtvbXe0WOr11MjNHOjR/JHdz3ZqPz2G/wPN836Bp?=
 =?iso-8859-1?Q?+ueTGkDuC01IgwtRJu4ZrJHj4wiQm0QLEu23w/vbkrrtEhQrvv3VKjIkBL?=
 =?iso-8859-1?Q?6Jq9sy6mH2rZKo1aK39G0tPu/cKLId/EvCL66DxoHnZZAB4EAIFtMuT9EH?=
 =?iso-8859-1?Q?nMs8bJjFQms2Il9GpNRi6XKmTj4xLni9dLZkCkeLLWfhLEnFRBjHRDFGoa?=
 =?iso-8859-1?Q?dyChoggfDx9fHppGr4yRM5+uCYaGmxeWYO4G3lTwuczS130kXvLgNt2hgO?=
 =?iso-8859-1?Q?nfaWZMadaal5Wx+8DAIJ3QO1KWdKVpi9lzOwC/J1lptDGL1HStGqGGBEWV?=
 =?iso-8859-1?Q?QCrftrc0qmwZvLiSRf+SN+y6HahvHqnAHvOf9y2Vhm30KC2Hrn/OzHdf7a?=
 =?iso-8859-1?Q?bsCNiXAFQZxD8s81bPf7p3ZeAIEb6+/mc2dmg43q4HQ/4r+3insalIazQD?=
 =?iso-8859-1?Q?VijASnGh3f6pIgcFbbdTTK/ti0U63iXXK55MIzIrNGGz1tAkPHeAbi84Jb?=
 =?iso-8859-1?Q?9ZKR+F0J7Jex9gYJMKw0TFk4lQbNft9S4KXth0O3UOQ33J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e8a41e-7e50-4886-d2c9-08def5f3512f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 08:50:52.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTGNsGUJVfJUt6hrmthX7piJkqVWIIfBFL1d4Tp2Ezf3DOUzE3sBjH2APTGPN5PzaT2wKhvj5xIlWUkHGHHQBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773

On Sat, Aug 08, 2026 at 09:56:33AM +0900, Yuyang Huang wrote:
> Add RTA_DEL_REASON and enum rt_del_reason to the rtnetlink uAPI, and
> add ip6_del_rt_reason(), which takes the reason a route is being
> deleted. It has no skip_notify argument: a caller that records a
> deletion reason wants the notification that carries it.
> 
> The reason is unused for now. Subsequent patches propagate it to the
> deletion path and report it on RTM_DELROUTE.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

"
Discovered by: opus-5, old-prompts · Missed by: sashiko-gemini
Is the statement "the kernel rejects it in requests" accurate for the whole
shared RTA_* namespace?
"

Nitpick. It's accurate for IPv6 which is the only address family that
currently emits the new attribute. It's also accurate for IPv4. Other
address families (MPLS / PHONET / IPMR) can start making use of
strict_start_type in their policies, but it doesn't belong in this
series.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
