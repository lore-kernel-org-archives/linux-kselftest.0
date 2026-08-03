Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA33B1EC8;
	Mon,  3 Aug 2026 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785744911; cv=fail; b=b3Bau+VY1cjvWhevwTkKH/MG0fQlntOi/VfWoiB860uSK+RTtWj6X1yuYg+o/cCjWj+dBcND83AIkLyVo/OrcfKY3mrdRUePUL3t8Mf/BH+XmnQ9Kot7is9/eL6y7zdGz2goCviYxmGi9u3CZossyvK3uHSHFcyNiwOKmzrsPWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785744911; c=relaxed/simple;
	bh=BWn//wz2XpIgqqueYOdd0geL6hWHQhzV7U3itsXn6ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=grL8tvhjQJbHY/4HJwlnCAXU+VpZRxDUurzoD4jS7Jp+domrj3jIHY3gVZwC1x4E2k0SP/XmM9vwGlSdD9Uu0H2JOE35+cenYct5WhnrzNBGXg8zTx13bNTieS0PM37Qk3xy9Ff1rDNVatwwVEO3tNQyXD3hl2rmBMVbl34KTXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G5NbxXqb; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G5NbxXqb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBgoflM90nmE6IAclX/xk0WE7/ylw9K/C2POsxDfWYkswW4zcE3cqbYz4divCUxkhWmTqmvpIMR/TT3YIsdISU0puiNx0r08Z6pMztxMR1FJ3urRjZIq8kTQLG+GLKxrfo8wPnVeTGQoUV05qCHKSdJUvg4UxUJg+ESeK7CVZaQ/vzGrrU2Np/PHdc3M2A76LvZ3eeycJTkqTNu3eawtX/zJOoWj9hIYrjx3mNMw/6aRSmKf2hcT62r8BBwxrA2XKeRQcQVApGqzJmWLGf+0qiI7/ILcgDt6M2QeoVk73B66YencKSVAdRRcTMkE1cttlOVuSl1rIs4vZ4aeGqfReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHAI7QqT50ZcC1mENTcsrdbMInPhJPKCcSn82/7vfgI=;
 b=rgbU/vBAnA8DR+vIUUmHAKydgFh1zGYweyzeTE9ZYrrLBa25PmjhAQnRt8KuDxVp0vdx+Vcp+0z0Oo0yz9zl3Fafkmlq+qFEvQQlac2Qsezlxz0iCMmjEVPHB70YwLdKuAB7tE2mkFFbMhOTbnFphwNuzloB3thafelewrmTSuRd++pZwKeh1Kx8DMkLSzQNKk67iJUfPYapVKNWKOO++3jemR0rTzZiqQe5Pydx0ha2qC7Cw2h77dcBw9kFRtU7si6yxyYMdhvIvdca19m5CJQOiHrtOm6WeO7LYhciTImqzFaxLvtyPUZVZ/KlI0d/aSPOBLZ/hGKtc1Dz1wPTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHAI7QqT50ZcC1mENTcsrdbMInPhJPKCcSn82/7vfgI=;
 b=G5NbxXqb44AkmX4k5Mk2k1Tsvi3EkeyuPVtH4r2i4f2S5o5jckWt+l6kxvMGyLJB0z7/Uu3tMejqs4wccByquH8sZesqIci08ZjDYych4wpENOIMxf7HpAj/joChxwViqgJY4Lhzo9zH6ZcazbQ3ziq2fuK4IZnJIUbU5ISKZBp/B1a6CVawU32nc9iFrLBjPAG98JH/jvFcs00e/h6Mz8+Od6lqYgVdTipF6oS+K+qdRMDDubJnCTAS5vtGadCqweyG1N91CCuNWYjPurTWM6/PzFL8bR5dmW5AZUXDFm4MBMjaLs2K1p7jgzOlnG96NwWl8AyurKfnejmFh7MJLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 08:15:03 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 08:15:03 +0000
Date: Mon, 3 Aug 2026 11:14:54 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4 01/10] ipv6: add ip6_del_rt_reason()
Message-ID: <20260803081454.GA573507@shredder>
References: <20260729120739.47880-1-sigefriedhyy@gmail.com>
 <20260729120739.47880-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729120739.47880-2-sigefriedhyy@gmail.com>
X-ClientProxiedBy: FR4P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::13) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: f45340c8-c9ee-4003-1ea6-08def137519e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/AepK4Mv9s71Mgnj+wM5ZunNJWhFD0RmP0zv2Snrn4AXJVWd7onQ6A5CaE4JwhtLVixyEYyFWhfZdrI2MUqW8a1gWy5vuCdPXVhYrfk5xEc+B5+9eR2pw1OcoMKsVhVkt4futIrq7IbjPJ0g73d8nygVBvnqiwFUMbCnL/AjjJA5VeoBSbujrcyM+tdPPJwVJr+zFClTlrfII/vqVNagrUrdKMOSO/WVbl+wZcxB79r+bC+o3/x/ySzpstxNHDHsaROKADweTCYaStisagT82o5YYF2YSDY//p3vSBy3HnneiTAdjA+cC3Gh3DTIAM1VQHvVSn1RgxA5LT4fL6PASB2yMYUrJ2XJzacwajesJDUGq5VYeoBibJRec0e0116T4mVpp7dNiok3nRXCT8RvY7aRAIGQ87kgByfPdfxs9oFfcJjQbkJ68QHXcwRbor9hapnrGdGK0JtFpyzSh0w+Z4qPZY0QUsuuRlUyrSx3j7fPnaZnf92bzVBko9wTzO6EQiEYP22OiaHu0VtWpBGbjsM35l0LTDJlAOre7aqXdxZvsge9+YTSInKKkr9susOrEICdepsrtV0eAFs3GUeqk01zKbA+X6TUxYV5tQH0n/q4KoL2jAvUca6qoSqoY8r8P8xgTwfsB1mS+BPpRKei8aohm4rJLfLiUM3GAmbNpG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rKvcxAVxUam0py/ty1YKonciqg8d9TYhd49Hj4sOdOKCeovDr8Vz38Wsrp+K?=
 =?us-ascii?Q?1103gstjG+pmGRGgUHrpIhi7KNx8CTxqWzg1V7X/1axUa6vhozj0orqpquHT?=
 =?us-ascii?Q?FM8jil1bhGhQonYfdsFkRreBvMuRpIIY3773g7HEef4piPj5EgYPjencK6GI?=
 =?us-ascii?Q?NsdN/wnGozAc+oRHSQsiEXyrNwAHJcA+QUW2u6BI9wuFEqijqi8ewFWe/bMM?=
 =?us-ascii?Q?bsNrvp1LM2kBUZgrK9ytkluf9b3a9lgIQKtUpo9p9xT35B9EdVUM7U5MXZ3P?=
 =?us-ascii?Q?c49fjaAiL1F1aJ4OCzhzbi3tcojasLj263niF5ABa79YrEPOYXz+rK+M7530?=
 =?us-ascii?Q?qBulcz/Rk8+raFFQz1xZDfuAPZsE7I4s5i3PFkh7iUiQYrGFxw1EOvFY5Umc?=
 =?us-ascii?Q?CSQt8dwy6/Eov+mlbTfmkCZ7EFxa9J2ieK/9N/qGfHKtIQCgZKqWDC6TqE8z?=
 =?us-ascii?Q?FM646gFHXo1FShwh82u9Qqy6TcL4KDf7CSb3JqtakOCfSI2i+42ESesIGd1j?=
 =?us-ascii?Q?Lqa0h5mimWXznlp8loax3gALRvm+oUQbz/y963+471wjlvH5RGNy9JXTL6p5?=
 =?us-ascii?Q?J9l+eSLALH7tb1DQbb2Nv5Wfsm8x8/FeyuvGPrCabsrvDwbcsVmUSbF6+TNc?=
 =?us-ascii?Q?TIyJxLoGq79cyMxsmYvSBnjoHWPD4g3x++FvZPgqDR9+tHWLQ47cfj/52GdQ?=
 =?us-ascii?Q?IVxYYVhYFcVrAvbIZinIuUdDMrpwjzlnckx9JLVVHrh8HCedgZMfl0VqJCKy?=
 =?us-ascii?Q?dzQl9963whhk38KTWC7K2JQDExulA3s/HuuMkeZuC5SeYbmaKM7nLZq3EN1Q?=
 =?us-ascii?Q?kEI5Nx7lDy9oQGdq2Euh4kNDpTU8Yex1cAekJWXGBiZc/pPdVIL/gVNKJuVM?=
 =?us-ascii?Q?D2p5ry3hlFEMw9LMHIq0y7xzIJNQcGQULBwLLdV6nHRYkJWrX9pz323Np5i6?=
 =?us-ascii?Q?e1hXQuGNRPFuowux/1ZwXOV3ypbdHyh1M/9/CcbOZMH39ugRVBQWA8mx2OQ/?=
 =?us-ascii?Q?IaoOOiQkSxBFOdgAGcwqXo7KeSLUm3MMJxMIn2afnnZgHXLwM1dF+7xVRZ7V?=
 =?us-ascii?Q?yBB9pXUZ0L7EkIF/2VYByoWoy5sriADZ/UXWKiXMqFJ3mEGBp+GW9MSZNpW2?=
 =?us-ascii?Q?z/S9DRSNiE2mbKQ+r+FFZdKNdQULDd7wtE2rkYc7CyQOHzelCm5mePfg99cj?=
 =?us-ascii?Q?P/A5rju7DbMuGD/FNG/IqOp49lPzdr2EtZOHLW1jPVsJScFdBG4o8+uJ1RsW?=
 =?us-ascii?Q?671vyt3P2VCoFoWLbUmxtvCIvFBp8tIwkuK8wLlsUcz3N3lF1I4fWsjhKVaq?=
 =?us-ascii?Q?aNB2vm5wdLhQU6KOSnjn4sXd4pkO8YmGM/hZ0+LieIrvo87zrDTfgTj79XOA?=
 =?us-ascii?Q?kOnJdI4O5ooFOO0ZDUo5YiUMIfZxJ32c2z+Q9+IuENmpff1xd//aNPfxzYAs?=
 =?us-ascii?Q?ru5G1oEQwTrb0E/rHFtq7vK6WD54lQy0n8kfETMoBDZAnc+NLtzCdjsXRcoB?=
 =?us-ascii?Q?olr0j2EbaS3CPLgSz6RIqkAXEMmayvrv3mwFTmK1+ejdHXtHqqGsy3TL7m5j?=
 =?us-ascii?Q?tMFYFID3uBQ8sfz6kpg144aFECOTyWs0J/7WBAqpIcyEy4n1JRnqL7Zcge1P?=
 =?us-ascii?Q?djJONmhAx5iM3d5XCOR4NAzyQYqcq+xr50jVyyJCS3B5FWLr7DFykaDaR3/V?=
 =?us-ascii?Q?jBau9FwVhpHnOUVNOH8ewIjxEGwT1NYMz4dgTuqtvM6OLLe6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45340c8-c9ee-4003-1ea6-08def137519e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:15:02.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gIbZGpgGKfi3gn+Pf2RWmBukJUjni/5IWSXlmgtl+8WsKkJ4PD036TnVEyffBNRLJMdSoTWXtDygbWyRgflkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691

On Wed, Jul 29, 2026 at 09:07:30PM +0900, Yuyang Huang wrote:
> Add RTA_DEL_REASON and enum rta_del_reason to the rtnetlink uAPI, and
> add ip6_del_rt_reason(), which takes the reason a route is being
> deleted. ip6_del_rt() becomes a wrapper that passes
> RTA_DEL_REASON_UNSPEC, so its callers do not change.
> 
> The reason is unused for now. Subsequent patches propagate it to the
> deletion path and report it on RTM_DELROUTE.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> ---
>  include/net/ip6_route.h        |  9 +++++++++
>  include/uapi/linux/rtnetlink.h | 17 +++++++++++++++++
>  net/ipv6/route.c               |  8 +++++++-
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> index 09ffe0f13ce7..92ad5a0d03a2 100644
> --- a/include/net/ip6_route.h
> +++ b/include/net/ip6_route.h
> @@ -128,12 +128,21 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
>  int ip6_ins_rt(struct net *net, struct fib6_info *f6i);
>  #if IS_ENABLED(CONFIG_IPV6)
>  int ip6_del_rt(struct net *net, struct fib6_info *f6i, bool skip_notify);
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i, bool skip_notify,
> +		      enum rta_del_reason del_reason);

From Sashiko:

"
This isn't a bug, but was carrying the reason in struct nl_info considered
instead of adding a parallel argument?
"

I did consider it, but it doesn't look like a good fit to carry a route
deletion reason in a generic netlink structure (also used by nexthops).

It later says:

"
One counter-point worth noting: rt6_fill_node() is also reached from dump,
GET and hw-flags paths that have no struct nl_info at all, so an explicit
parameter there is unavoidable either way, and nl_info is shared with
IPv4, MPLS and nexthop code.
"

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260729120739.47880-1-sigefriedhyy%40gmail.com


>  #else
>  static inline int ip6_del_rt(struct net *net, struct fib6_info *f6i,
>  			     bool skip_notify)
>  {
>  	return -EAFNOSUPPORT;
>  }
> +
> +static inline int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i,
> +				    bool skip_notify,
> +				    enum rta_del_reason del_reason)
> +{
> +	return -EAFNOSUPPORT;
> +}
>  #endif
>  
>  void rt6_flush_exceptions(struct fib6_info *f6i);
> diff --git a/include/uapi/linux/rtnetlink.h b/include/uapi/linux/rtnetlink.h
> index 27265fd31e5f..fe00e624f3c3 100644
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
> @@ -407,6 +408,22 @@ enum rtattr_type_t {
>  #define RTM_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct rtmsg))))
>  #define RTM_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct rtmsg))
>  
> +/* RTA_DEL_REASON: why the kernel deleted the route. u32.
> + * Emitted only on RTM_DELROUTE notifications, and only when the deletion
> + * path records a cause. Absence means either an older kernel or a
> + * deletion path that does not (yet) record its cause - consumers must
> + * treat "absent" and "unspec" identically. New causes may be appended.
> + * Currently only IPv6 deletion paths record a cause.
> + */
> +enum rta_del_reason {
> +	RTA_DEL_REASON_UNSPEC,		/* cause not recorded */
> +	RTA_DEL_REASON_EXPIRED,		/* RTF_EXPIRES lifetime ran out (GC) */
> +	RTA_DEL_REASON_RA_WITHDRAWN,	/* zero-lifetime RA / PIO / RIO */
> +	__RTA_DEL_REASON_MAX
> +};
> +
> +#define RTA_DEL_REASON_MAX (__RTA_DEL_REASON_MAX - 1)

Valid comments from Sashiko:

"
This isn't a bug, but since these names become uAPI on first release, is
the RTA_ prefix the right choice for the payload values?

RTA_ is the established prefix for route attribute ids in enum
rtattr_type_t, and RTA_DEL_REASON is added to that very enum a few lines
above. So RTA_DEL_REASON_EXPIRED reads like an attribute id, and
RTA_DEL_REASON_MAX visually parallels RTA_MAX while meaning something
completely different. Elsewhere the payload value space of an attribute
gets its own prefix, for instance LWTUNNEL_ENCAP_* for RTA_ENCAP_TYPE.

[....]

RTA_DEL_REASON_RA_WITHDRAWN is an IPv6-specific cause placed in the
family-agnostic route attribute value space, and RTA_DEL_REASON_MAX has no
in-tree user by the end of the series (rtm_ipv6_policy has no
RTA_DEL_REASON entry). Would it be worth stating in the comment that the
value space must never be reinterpreted per family, so a later family
cannot reuse the numbers for its own causes?
"

And be aware of:

https://lore.kernel.org/all/83360de7addb13a3b5f4d5e722148f248fdb2ae0.1784884817.git.pabeni@redhat.com/

> +
>  /* RTM_MULTIPATH --- array of struct rtnexthop.
>   *
>   * "struct rtnexthop" describes all necessary nexthop information,
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index a1301334da48..9f82829923ab 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -3994,7 +3994,8 @@ static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info)
>  	return err;
>  }
>  
> -int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *rt, bool skip_notify,
> +		      enum rta_del_reason del_reason)

It's weird to have 'skip_notify' in a function that is supposed to
notify the deletion reason to user space. All the callers except
ip6_del_rt() pass 'false'. Can ip6_del_rt() call __ip6_del_rt() with
'RTA_DEL_REASON_UNSPEC' ?

>  {
>  	struct nl_info info = {
>  		.nl_net = net,
> @@ -4004,6 +4005,11 @@ int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
>  	return __ip6_del_rt(rt, &info);
>  }
>  
> +int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
> +{
> +	return ip6_del_rt_reason(net, rt, skip_notify, RTA_DEL_REASON_UNSPEC);
> +}
> +
>  static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
>  {
>  	struct nl_info *info = &cfg->fc_nlinfo;
> -- 
> 2.43.0
> 
