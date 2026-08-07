Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1F432E85;
	Fri,  7 Aug 2026 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119730; cv=fail; b=PCvvDwbDNRmPvyKuw251cauHHZd0NHnYxutcHGtQhaLYhu9R8qTH4YpQ6mLUrZRneRWSwF9xnr4uI5LQrv3eqdeRA0up2ee5dEZauzc3F6CDTa1yM3lmD4hTuRRGXhUnC+lPPeajyxVGF7WFYRWDQJFBGPVmIpbCaQC50mQ+rT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119730; c=relaxed/simple;
	bh=DLNn+S//8D6tGmOP3B51iriffjhivmm+/k9CmF5M04s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SFcDUlStL/XCqeGiU8zLUkYlzAz2mBph14ybkJa94ehI2279isWVnEHQaCtGdG5oS0b81o8RvluWHUNeTOqHrEjfmANBeU7RZBV1xKlS8VOX7Igqa4IwkDQuU/NyeIG1KiN7AR1E4sXXo+/JqRCbhcu5Sn7YbBeqTw9YcsfqCjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AmhTLVzD; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AmhTLVzD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU8ok2pRipLVgdquy5cBx/eSCj7vkH1nXOkn4wDa/R7YGcZX8ColLJXztqxIGlsO4GFEDNPA2nDWI0t/o0jwtfJFlBwSTDbpV0Mnmh21m2Ld3ZT7gNN4/qk+VDIZceOYdWBn/yt+/wttA+/l5pNuXTqsUP2ujB/NokqQmyYsFLUl6OUHFVgtSo6hyw1kOaKe2AmsqUd469lTN4YBct70GpYxdIkql23OvNB5a5Lfm5ndruAD55enQSXGfbRF2SYAQvAXNGwZAcyS/ryjA/gUbINZeoCVYwHtMnjJXFWNNtIml/ArUpBj8IADe9fo8L6afks954wTeaaDlwmhkOTDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK44OD/oFnVMYbCxYVEWtvPRAGVEQ/aUAX2BAjzZKOo=;
 b=mZVbVn8ALS/hyyhmq93TjU7qmoYQVKsTjabzdyQDTYSgHVbBCTQTE+DvDbMiDsUAWTvvatSR/g9l0Vg4YhyDaAAIbsiapYHHtJ4jGM0s/HZdDxC6am/YWRGK48NP8HufHhBxT9kLF+B3AZygD0CwoF4vIxzrH1O2BK8lF053FG8u5taXu7i4NxMG70pbj3boJ60SBeZIsQyGdxKHJHN9hcUcmJ4/bFfUEbwqTK3lkyB59gqrNBM89loLQnaAJTzClsd8oVMC74RteLXMr6IAbNocNcEC6QLAjB0Sn65fBDoi7D9alS9SUuFvxNI6qRqj7UcFQ0bJcbSW3/XqPcU0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK44OD/oFnVMYbCxYVEWtvPRAGVEQ/aUAX2BAjzZKOo=;
 b=AmhTLVzD37FkMkslGqFbfb23m+ZyVTMjbnISVfpahoB/eGiKngGn3m10mauKk02qbmrGuQSy8ApotPBdxs16bE1UjUFeOIfk683b4s989yvj1o2vkx9KJzekYoYGJX61O5F1zs8u/x+/7De9W3+MMuOvsmROX9Ibbe9nDhI8Y7hkGEpJrZOimFuiE9F4NqjilaXAldBInu0zsU62oscRd5Z3OZiwg5w0QI4maIUjq0QYjkp0ClgNxncoSqKm+O9vnTX7dgDwRqJgDqGKjy9NzISPfDZ2934ET1Cu2Ogaa3MmDn+7MRYdjDg3pqsvstzfOOuMof4HUPrwA5GKW1aYCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.23; Fri, 7 Aug 2026 16:22:03 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 16:22:03 +0000
Date: Fri, 7 Aug 2026 19:21:54 +0300
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
Subject: Re: [PATCH net-next v5 01/10] ipv6: add ip6_del_rt_reason()
Message-ID: <20260807162154.GB2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <20260804014714.4362-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804014714.4362-2-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
 To SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4bc6f0-1aa5-41b2-dfc2-08def4a003c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|10067099003|56012099006|5023799004|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f8pERJiYrSP5L1JU0uC5XOxtjKx++YViRVofSY3WotL3S1zU9NY+UU0LxTnhsL59yxl3tKrdc8bybspu9cYcTOMfkRJKKwvNQdx1gA+5hJQvC0KoEqVa62DukpEfJtLW95NStLcp2SPi5qux1GLT12J2rephE595FYJiIqXWrMtnRdwiyZnJ9KWTJGFG3Q7tC30BSHndbgI45QSaeTDKE1fLyGSXFEcLT9D9KTsQDCp7YsXu6lAV2pxAPO3r7Sm7xrGra8Hmq/3abPair4OPg4Gch6dOr32a7K93mTw19R6Nt7bgdi80pKBvAxLkYHtJmXPadOhCNdVKglb+QcvzPFfea28eO//OqqCM+QccH0kd8oVQDTeYwj8bCciNPpiUCy4RHmdLmxTpxKxl0RcclH0I9dO9uZnvC1lCLnU4W4pxmLVMAR/V9MCZtnmO6HiX9nnTjy48Trz0Kh+qzWY6o1Wln38gXevifMO+ReGtwO2PoDCjhATF3nw4ZOySA/TCGFzsrlOKeb3AKaBUa++tspt594RPyIRMwf04FH273XSulRbj4JTV2T9Tw7hl2gief1w6s2jJKJGZKGHlmOMzBORMIWPaPDiLbn9OiRfeXw6vfTg5zAlmfOWLG+rIDHSm9WspHi9Z9tCpVpaLTCRf6vt/NcikvKM/xIDTdPiuhCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(5023799004)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ihxDgd7W4NwRkij5OhZDNSSJk+fuBZGZ7EniGDJzUy765Ei6rqGh4OLXypu?=
 =?us-ascii?Q?XRHHxhmeJcKDpXMNjifsz4ek5kbOTKeHgu/CChLxpL699UKF0Jjf9Ri2obV8?=
 =?us-ascii?Q?G+cuM8scguRA5H2bDU7f3zjaXfoG8ZW/pC3SDZhMle7ksQVwPYgVmtPxkH1D?=
 =?us-ascii?Q?DlOQWpI3y8cV0Uy45zfuFwqSZroh/PsglxCrNfgKQ+iNx3qqWV59LsXXBBkY?=
 =?us-ascii?Q?yIKGi2nf5uUp3mVJBRhmdzSBBIdpTCdGTQyN+TCUTjUtW8ymNN6fciXuDPe3?=
 =?us-ascii?Q?EJEgIeh63EcgsTFKKb9khNahuvd6tJ6O+sAe2TFV/chrknA8tcF/HpkBkD2E?=
 =?us-ascii?Q?glfS0wBjb+uqxmZEb7gMzLCO1rvTcGcw00VZvjd285hdyvAVhcxZxYYQOGTU?=
 =?us-ascii?Q?GEy5N3vnqMopRNtWGEJg6sWHHLq2DQj4xuEZWhi7WhtZObuQU+y4IsIorNI6?=
 =?us-ascii?Q?jvYhRFeWFM5ULczFFIPL9l+FOztXturEZvSZ71HRHyPDNhybgR06hgdtgF3K?=
 =?us-ascii?Q?aTonewJxWlgk7ThszF/Yyw3vtQVmO2QWvYGGScVz4FoM5RafGTaQ4PTJZQxx?=
 =?us-ascii?Q?qb60uNLRd0COUs5opFephsI9xwY7bnT6Ahd/5LUCvn3r6IGa3vRBMYFNfTTL?=
 =?us-ascii?Q?8TCAIi+cp4o+VYIRtny4mBWLqu1doD9Ijd1xtDEFYzToLSch2OJNZLhyPEhh?=
 =?us-ascii?Q?CqxtqleLaCQv7w9Hazlme2ddjZkcQBKhW3TRWh0XeXs1+dJRi8D4Z2bFG4fX?=
 =?us-ascii?Q?8TKpF0CTkV4sxiRuZGmnQyzVYHxVweZwrNmggi+LpVprlQ2OPzNZYPD2vwIL?=
 =?us-ascii?Q?5j96J4tvUf4UO6svYtx7cTV3s2+iLgB0IrW+Ev4shmcCMsyQvQRwc2CDE+zu?=
 =?us-ascii?Q?fznVyuBDgLvGlPgzvc70Ft0F+RNcEYbgAzQrXRXTNy4CpLrBPBUVU2C/brm+?=
 =?us-ascii?Q?yCIbhqmohRdr+ZvUn5ohcELpiWe2FnjLf63UNnbLdjwWf7f2DajGwTPkjgDB?=
 =?us-ascii?Q?q2LyqNZvNeZbpJskJr1jwomUhvQNBzrzayo/hLPvQxPfHMasXzqMcLw35Yo+?=
 =?us-ascii?Q?d6KaPTxqOdN5lM+ETiZEoHQv2VcUmcQJ+cpBn18qykdfgQzADoC4baHoznU9?=
 =?us-ascii?Q?HK1wDqJr7Sp3EVKJsnUlb0yFprGgAwkurUE04FfchSeRTlQ3CsqsoJ2kE7Qq?=
 =?us-ascii?Q?xiWytRrmG7sblr8f87R0d/wLfhIce+P90UYM0o6ePeSToIC38nQW7gmI3TTj?=
 =?us-ascii?Q?+N3Z29CdTHxV5AMvemRinFeAS593ANsE7fHVRVl4WzVvYNnH8IHquYbkuxAE?=
 =?us-ascii?Q?2IIJ+dymGHqAe9M3kmB7WtAGTSUduCh2FDXFe9eEl5ZDKNzLeYSR+u8M+N4g?=
 =?us-ascii?Q?PXRLyVagJNC/wbc9XJ+65fvhzp03KJ1PlQqCaTc9EYF6fE9fiHOo7yHFBecx?=
 =?us-ascii?Q?vUGDy7YUGh5R5RlTUHJNBYPr+3IhNGoix0gkAmuOHSvuMCsFENX5dF3WXrR4?=
 =?us-ascii?Q?IaNXZ7wqaLxVRyv7KzoxSSg2ps8uHrdmlu0t6Mrj6Lm9DAlItTQZgve6HGFF?=
 =?us-ascii?Q?4MY4TDQPFBv03ULL6GRj4vBv/Vx/3Bfk/TtXDpOUoNZOjHb41mGUkTzGqsze?=
 =?us-ascii?Q?CeNSjmlLxJC5c+prCrAJosKKPXTxN2j3IY2NVVhehR/FUSHteJJuICOw1gmA?=
 =?us-ascii?Q?znWw1iFX/uR3C0gqzdGJr8gwJk4AkdJUUaiOXP0NMhFJ6GfCu/Nc7dp3vT3s?=
 =?us-ascii?Q?Ps51/yTOcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4bc6f0-1aa5-41b2-dfc2-08def4a003c6
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:22:03.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxxARxu8gre1ACUIuISec9MdXKwpbjHT7VGVje57BDzPG4Lu7KPNV5GzvdXgY2/sRDq+l4zgmXc1GGVqsQWsXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

On Tue, Aug 04, 2026 at 10:47:05AM +0900, Yuyang Huang wrote:
> Add RTA_DEL_REASON and enum rt_del_reason to the rtnetlink uAPI, and
> add ip6_del_rt_reason(), which takes the reason a route is being
> deleted. It has no skip_notify argument: a caller that records a
> deletion reason wants the notification that carries it.
> 
> The reason is unused for now. Subsequent patches propagate it to the
> deletion path and report it on RTM_DELROUTE.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> ---
>  include/net/ip6_route.h        |  2 ++
>  include/uapi/linux/rtnetlink.h | 22 ++++++++++++++++++++++
>  net/ipv6/route.c               |  8 ++++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> index 09ffe0f13ce7..7bcf0e5bd887 100644
> --- a/include/net/ip6_route.h
> +++ b/include/net/ip6_route.h
> @@ -128,6 +128,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
>  int ip6_ins_rt(struct net *net, struct fib6_info *f6i);
>  #if IS_ENABLED(CONFIG_IPV6)
>  int ip6_del_rt(struct net *net, struct fib6_info *f6i, bool skip_notify);
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i,
> +		      enum rt_del_reason del_reason);

Since the function is only invoked by IPv6 code there is no reason to
put it inside the guard and it would also suppress the comment from
Sashiko. You can place it near ip6_ins_rt().

>  #else
>  static inline int ip6_del_rt(struct net *net, struct fib6_info *f6i,
>  			     bool skip_notify)
> diff --git a/include/uapi/linux/rtnetlink.h b/include/uapi/linux/rtnetlink.h
> index 27265fd31e5f..66cfc17ede0e 100644
> --- a/include/uapi/linux/rtnetlink.h
> +++ b/include/uapi/linux/rtnetlink.h
> @@ -399,6 +399,7 @@ enum rtattr_type_t {
>  	RTA_DPORT,
>  	RTA_NH_ID,
>  	RTA_FLOWLABEL,
> +	RTA_DEL_REASON,
>  	__RTA_MAX
>  };
>  
> @@ -407,6 +408,27 @@ enum rtattr_type_t {
>  #define RTM_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct rtmsg))))
>  #define RTM_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct rtmsg))
>  
> +/* RTA_DEL_REASON: why the kernel deleted the route. u32.
> + * Emitted only on RTM_DELROUTE notifications, and only when the deletion
> + * path records a cause. Absence means either an older kernel or a
> + * deletion path that does not (yet) record its cause - consumers must
> + * treat "absent" and "unspec" identically. New causes may be appended.
> + * Currently only IPv6 deletion paths record a cause.

Please add a note that this attribute is rejected by the kernel in
requests, like you did in patch #9.

> + *
> + * The value space is family-agnostic: a value must never be
> + * reinterpreted per address family. A cause that only one family can
> + * produce still gets its own value rather than reusing another
> + * family's.
> + */
> +enum rt_del_reason {
> +	RT_DEL_REASON_UNSPEC,		/* cause not recorded */
> +	RT_DEL_REASON_EXPIRED,		/* RTF_EXPIRES lifetime ran out (GC) */
> +	RT_DEL_REASON_RA_WITHDRAWN,	/* zero-lifetime RA / PIO / RIO */
> +	__RT_DEL_REASON_MAX
> +};
> +
> +#define RT_DEL_REASON_MAX (__RT_DEL_REASON_MAX - 1)
> +
>  /* RTM_MULTIPATH --- array of struct rtnexthop.
>   *
>   * "struct rtnexthop" describes all necessary nexthop information,
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index fc42d67e5822..ca374b056f5a 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -4004,6 +4004,14 @@ int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
>  	return __ip6_del_rt(rt, &info);
>  }
>  
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *rt,
> +		      enum rt_del_reason del_reason)
> +{
> +	struct nl_info info = { .nl_net = net };
> +
> +	return __ip6_del_rt(rt, &info);
> +}
> +
>  static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
>  {
>  	struct nl_info *info = &cfg->fc_nlinfo;
> -- 
> 2.43.0
> 
