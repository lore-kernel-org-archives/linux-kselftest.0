Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2801305699;
	Fri,  7 Aug 2026 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117977; cv=fail; b=cQLufR7kDTXA98lua0TOqDqZoneAHQxVw3eoW1OTw4SHadlXCgokPXZ4CwUm6xWC2sfnxPXrc1l30dumYd/NcSjFLLbcwMjaXrSseHJWe0kdFVYi21wnpZ1UKjnljpllBmXi1bjRQb3T2VE686ojgEMh8Eq+Dhk36Qk2kEIskho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117977; c=relaxed/simple;
	bh=yjdoqwsyabPNhm3lJVU/jtU6UvLosdowYzV5pcQ+Ee8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZbcL08MUX7lxHf6wDdNYLMnm6edQV/MG1d9mGZyjWMDK6SKjeKxSX7YJiHzGIExKxjuiDlBT16VYSkTQQfbIxNkW85zHhxMbopJLK+ToQtG1rnwxkdxt3+KEXgFBaf8F4OszQ0ofMk7dnsTusqjJhLVRV+5cSxKfpG083NsibVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UK4vnVvq; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UK4vnVvq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGOuLZRviO9EkOvpzOKysKBQGykc07cmDtHMxa1zeGwDUnWnn1xbDwboZNQM/rvr4xBBDESO0mpOO5RJL4M8WUeTHvUzc35pKdNKaTBKrDV06jwFe92b8Zqd0z7a89YvcHRLYTxpfYK23WEZ3wrI+0rye0KWO9lkNKfNc1BHaCzCvBRTwPbZx/OTL9YS7mCxlzZUNZ8XPWlWk6FK+lStm180kWZNYZLH8lt7CcpfwJpo6R7K/bR1f8WO+2VUMKgz8Y+uQdn01BlcPMAjNfjKDNK27+Svp2JssoWw+scy8Wq+RmT7H4inZOc3FHzEYqdrMoGapwVmEfjkp4gQuPhXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWv8vw2244Ldbbb6sHjZ0fKMvqtrE7FxNXCGAa4qb/o=;
 b=RiZTaNsQILSwOyph1NnE8SO29rX3w+dNZM1d7oQGcwd/SYOPRc7PeEkvGhqT00UNnw0udFQ070pCdILAlQ8J8STMxeAfdD/UFh0HFAp8KLkq9fqcageFzC0rwiHPypWYXtXATYdyR8moOHC6NTdCirVjmqDMG+ylIx8QGrD/7uEU9SHPpobkp/j3tvtkCXkYLRYbxQ6WPy0IaGUrQrrt5+b10+RqJXhNI4q/ceSgc8dgS69V/kW0L7vZ6RuLmIRqA2aMAdcqdiuLhH4kpYjvXGxdWEuus//oRhgEvY7JBYd68IqsJPpBMxR8K+xVCekf2f2aY29Sg1xoYc5p2yF5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWv8vw2244Ldbbb6sHjZ0fKMvqtrE7FxNXCGAa4qb/o=;
 b=UK4vnVvqzAnWdmRc8oj34u5AqoxfSeDqiBy4ix5xDnMtzN7eS9RtkqETFJZXngQf4fiKyojQm9FgfCu5DcQW1UlFyjSDA6LRwRSHxYjn+Y/WTpFQALeY6GHfgVp0aHjYwWHpZjwO+Xz9W/dgJXchktRzWuA616HmHGbdU94bY8A7bdC/WpXuWHBHTpoXKRq4UPeF3pPt/XyHQL66TIkdu0B1puuAQJf0bZs5XLww8ytwcB1OlC4tfj7+N5H6B3RAUj4PkaTVB+xGxakitmLPaX3ArK1+YSrNQgjurghJ9cl3fRD+/Mha4tQu3IKz/ZP9Hc/4yXpZhBt04yUfPkPhQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Fri, 7 Aug
 2026 15:52:51 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 15:52:51 +0000
Date: Fri, 7 Aug 2026 18:52:41 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 00/10] ipv6: report why a route was deleted
 in RTM_DELROUTE
Message-ID: <20260807155241.GA2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <CA+7S2vKRASitG1pK_RPG1L-hDsJyev1q-+ViRhCppBg9aFuZvQ@mail.gmail.com>
 <CA+7S2v+upifiRtBmGjHqBbOLFWn_m1dj+mezi7rFZGYLb-DChQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7S2v+upifiRtBmGjHqBbOLFWn_m1dj+mezi7rFZGYLb-DChQ@mail.gmail.com>
X-ClientProxiedBy: FR5P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::13) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f55d874-4b3a-468b-3bd3-08def49befd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O0BJDXln5kjD32FAcMcS40Q5gv1/EedHZMjjv5SRCIRC0YR3Hi7OV2noppf7PCv1LTqf9gPF5Imp6IhM5GSXxxITeVkEmnY+nC3Xas576gpvGl+anof8owJDm18zjTEAGRsSGwphiDxteaHmTL+aIWT6JUzIARO/6xZ1wf63BnCJM4R73dpJyTPECJsehSQ2wAM+e1PEvPbVXPZGcZekGnJQqHc+IH0It4ySQCRe2M68piaO+kd7nswdFSpC8XGzDMoA+NsOOvmkPVukF8CpG5iIsHY0eYIaUfxLU3ql5cZtFocAsJGixTAY7CghNsHLoZguuWbfJp/SpayvavBWp/GxlXe4leM6WodW0bBE8pxxDyiRrr15/ESU26GfyJt1zfRMRqDOjdpmcqbMrmf1s17i4zqoHzjn2j80VMX8B6KZRrwi5jjvCHcpn1n3dxmct+tk8+Oa5GpZKOVUcNpUDjHOYRr1kWkrdhDLcZ6+6FYKc/CNOaHFeeJkx/HuTmYrLuMjH2zhl8GP+/f/saNcYzxHie/pB2vgjHhl8elaNnHZB1MhR0i3H8plrknrA2hxPqiWYqdRIMhch8p4ZAqSTdo70dH4cBlfv00rO1bgp8tGrpxzzpuEapGV9PYWPrhWUQXRzA5ld3f+bIRcwWol2jgvBG54vd7yKzmIGuI2qvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RbAim517VgiH7ft+yhVAcaw9t1N+k1Q3XshHFXp8XHUaPCg458uo2NZ5uwHb?=
 =?us-ascii?Q?fFek3iNv/Q++4dP5wtpfZxDCFpUS2TLjhGedu4r6wf/IZM6fdeLj3rftumn9?=
 =?us-ascii?Q?Qtqq9D29SCP+Ed6N2E2Gnfawoa0xlK2awi4jnJMwfELD0b72gkAFW3Bz/RqP?=
 =?us-ascii?Q?MlumsS8LHlGgWQD6WJJcjTnXZevyqllQxII2oMPfDvB4lJhYkKfO7XcarJiR?=
 =?us-ascii?Q?BZCYBgm1UozziYa7iadWXpj07QpaubAtpQ58BMbu57wSq1wmBZtKneUoBmj8?=
 =?us-ascii?Q?vog4WUSwTmfOIjnTT8BGscMKcful6ykmQlxdY2n+1Gkl7NTvo1HnF6Bja6lj?=
 =?us-ascii?Q?401UJ0BdkbRK+a9ob4M1PsKhyMyARi1nonKvKyp7Q7Bo0D6Rymg+3IQR9sQD?=
 =?us-ascii?Q?aZr4yfQAqjpR7X0UAoUtpJ6YgrUw4g2nAGxJP8FKjfnZwmaYg5RA2Hb7uK/v?=
 =?us-ascii?Q?1AR0bgEyGLkdVFK3Lg/8ieQfgx8cOO/eQxf3C13BmcI66mO7A3Kj/NeMrZ/8?=
 =?us-ascii?Q?juw9Cme+jx8HXSB5oBN6WQKR9S9XNSdS8Nm4qA3gya5XX6Eifhan/xi79WKE?=
 =?us-ascii?Q?c9qQXUAifQ7k+Z9PL0cGOXyDIO3LV4NkOcph6CFWXWh5F7VEs5v1k2UATBhY?=
 =?us-ascii?Q?0nSVpKGfEm/dbaNlWh2FU8adpSezwx6ZCMJaWApQfNWN7vfApVlOxvTaGVc1?=
 =?us-ascii?Q?jhbc6Q+xjGYl2H48ZSnEJZq3EB/AcGefKZSZ7UMUP2X7tVCT0OPa+62r37VJ?=
 =?us-ascii?Q?b3sIucSAwNKa2BGqJ84mCKrqAXlR9spz8q7KnkwyBQG7cgGjA+Iuy25zF07e?=
 =?us-ascii?Q?3+3jwzRxZLj0p4CTzxS+a5RhkdhMGQi9shqdcQMjy0IIUoy5Vs5EyB6cUByH?=
 =?us-ascii?Q?/d8RVTklpp0EPisRnPORYibeRpDqxPmgZwVFPFy4QPq/IGTgx89c29PSdO2W?=
 =?us-ascii?Q?NSjnMeDzbsTKbnW5HF3PaGRqGNmU4bwwi2U55l6ug7c6ZFRyuQ65oKKj9pEE?=
 =?us-ascii?Q?uTxc8ZsG56n9fFwLeak2h5zyorhXMLxH0YKvo6+tbT0LSN70CpZOAeMEERgZ?=
 =?us-ascii?Q?CkQ6tcNx4t3/bZHfwM3bR/E7vaEz1exb65YjQyTEAGQkLUTk1w5OVTyLtjMJ?=
 =?us-ascii?Q?nMg5z2YPebjlqxCrEg1K6sBnH8dhijq4oMuLeagss29QLenX4nwbBKID1ml6?=
 =?us-ascii?Q?MR+lBJ8y66JcodEBMmDdQqBJ48yWmk8lZVjwIxK+YTViyXmRevMx2Wq/EqkG?=
 =?us-ascii?Q?bIncxsOHrY6WdUU3H5Yekq/Xrt5RVSDsLawA01RWJH2DEiEMzWMrHonQ5m22?=
 =?us-ascii?Q?LQANa0Rt9r08b5rMTi6jMx9WSxFmDZeBrETDUrrDdKxDTAEPlfU/H8NSNPIm?=
 =?us-ascii?Q?mhUKH8EOuN3rbDiVPLmai/XwoFhpDVdynNmt2ZwPsQoTQW1/kxfjf9nWuZKX?=
 =?us-ascii?Q?vMMNf+qr9DZx1AK1H15w6WO66nYyvORy+s/A2IRgRZcoqRA4R6x7G1H2tdxa?=
 =?us-ascii?Q?1mq5VZJcjvI49kvhwsITyOXWck+QKkrGDncinb/uHUyTXvKf+AZlayg2+BjV?=
 =?us-ascii?Q?F43q/2uTtMeyDL4s89UdVEYVbizW/Za5Bd/9A1uXTdopxPKIjKpNOAP2dvG6?=
 =?us-ascii?Q?ZfCcbtr2s/5Y01dxtHFR2WBQp4nn0GHfHU/lQGznEAIPgMuuIXO4ouif8lF3?=
 =?us-ascii?Q?X9uKzBWEGT7RYhS4mGbR8COce8ZCmO53KX2eDgWcf/ECjtXJWIk1UQccqi6N?=
 =?us-ascii?Q?sYAY6i9GIg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f55d874-4b3a-468b-3bd3-08def49befd1
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:52:51.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuoMtltryxAkAuqaZwmJC8gB8tfavcINdRRsmnQXWMsmqR56k3b5W+R4r2Saq00n+9xMxiw6x5tZGGENIFnpkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

On Fri, Aug 07, 2026 at 07:11:29PM +0900, Yuyang Huang wrote:
> Reply to comment in the other sashiko run:
> 
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260804014714.4362-1-sigefriedhyy%40gmail.com

[...]

> > Should the #else branch also get a stub for ip6_del_rt_reason()?
> 
> The ip6_del_rt() stub exists only because __remove_nexthop_fib() in
> net/ipv4/nexthop.c is obj-y and calls it with CONFIG_IPV6=n. The new
> helper has no caller outside net/ipv6/, so a stub for it would be
> dead code. I would rather add one when a caller needs it.

But why put it under '#if IS_ENABLED(CONFIG_IPV6)' in the first place?
Just move it above, next to ip6_ins_rt()...
