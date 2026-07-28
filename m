Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AD41E6C4;
	Tue, 28 Jul 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233615; cv=fail; b=W8jnMqdcmrwVx1WksoFR7T3W63g0CByxJ5GH6REyyNBVcbChQzHwT8DCaIGiqXU9LiPlAvMTu0O7Zuv3tVVs+QnvRK44jHGJYM6EeerUbRIxq6rMDjl93NhXejTw8Ox6yP1imOnmYv4v47ahQjvQwncpWFn8JvJ8e/1xvOpJfFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233615; c=relaxed/simple;
	bh=WQ6eo+bxmAXkDM3Gp3rkFSk5yDGBYWjN7H5KFprwudg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZPWYyaqdTJG0xN7PzgHwFpL/erbEZ37mfIDJ40bhe6bnS1v3BlxEN0F6PcFanMpXgOIgdLBGkOVuNuw2+m9qdEN9DZqfW+bCqoYQGC5UTpfUkHvVhYisDRwkui4dBnIVBPyBgGApsLSREsUx3D+HAfXimBrBbvWFZcCeeEp52zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RW9tkTX7; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RW9tkTX7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJfhGCBvN2YDxmAQ3NtB+DD/vtjbFNryGRmVkvqsBlRFpwyc3hGBQjvmbvh5NerRF92Df8PqnqdBqWGQwCqz7AckQyGknCMSkV2kDDey1X2GYSQIikXv/6b3Kh3UMsYknz6Rqaf5A+Cs1ycvLwwmRVLw26bxFOvbOcb7XPx4D2IfoyFPyU0tnnc/i3mdas6fhgalSme9Ml17/iCxm3YxUNfOZ0ZIhARkoCx64PyEFkTXvqk1aykXrtci3ynH4FYbpt2ojs2RJi5KOM71rFfPnglvprt4RKhVFX1YFnMnNA5dR70/DTUHJHxZN0ZNRVdd9hW4Fh17OFZsJysZviMbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBBicBa4VAoaCQzXpA+gbRets+Lbp6japr5bP5JjnV0=;
 b=rZLRKbr+D86FQe155xtSLslyiQv+daJLcfZHh2lS7S91ObPpZnqyPZTncuS8cV3qY9yWAHq4uBDGEWxMf+D/EadOmyJOrDvFlzibRpbLng5oukRU+tkQz/p5HClaLaOluB2HSBAsoGYJ+noFMWQfEyg4Aga38nNUuAmUUj4y7tuJIwLi1KV7CguTGmhyJ+kiMAt/G851PTNBHdTBa06ADg+p4VKAuNLUiZCjznUwCendxXaEItaTeEd2j/9EIiD12+/bmjc+5hLL/urYFMQNZEF4HDTpIb2sYLoGsWn9pnbGiiENNLayPqL68mrBShcV9rxNyyoY70WsFzLl2SyyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBBicBa4VAoaCQzXpA+gbRets+Lbp6japr5bP5JjnV0=;
 b=RW9tkTX701ddc/X2idRKkVMhMMHbZYfD2WGoIlkyi2ndB3okecJvjnRkza0AF51Ybfpo88G0AJbzdnqrpzcurLJ0ZMxC3hk12ugBl+18AVVVvylIXCql98ykxQh8ymvpt17FxJzqU+VP9uGX72q9sc/f/yUfsGpbEeAqFVWUNjYCduX5NDPNSLO1KhaKaFg6ASNUiBNepfwrsclc/6nUdPyT04v0gXaqqZS+7f0Psij91QkWKPFRnYwnZkiZtmr+EC7QxBKkyEKISnjpKl4Yb59QZKXIUzOBmmw1+G2WOKZb9r+iOoYFR37yIlLk5cTrl9iItr3yzrGo8mewcOAF2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by PH7PR12MB5655.namprd12.prod.outlook.com (2603:10b6:510:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 10:13:28 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 10:13:27 +0000
Date: Tue, 28 Jul 2026 13:13:18 +0300
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
Subject: Re: [PATCH net-next v3 1/2] ipv6: report why a route was deleted in
 RTM_DELROUTE
Message-ID: <20260728101318.GA849975@shredder>
References: <20260725031214.43059-1-sigefriedhyy@gmail.com>
 <20260725031214.43059-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725031214.43059-2-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|PH7PR12MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: de6ff63c-848f-48de-4927-08deec90ddf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|6133799003|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gpXcnpwK/1Anmw08yYg4BfoJh5z+quDJWCPucq7AHGJn+9J/7xJE7ORp+DGU1fMZ0E6roHZjd9EqD10za2fsiFDDRfROCL2hDr12YcV1A/BYqz4ikZZhNHwR4cF9pDzFv+XhqP4RY/tk/SqkNeUdC/rZHf5iLlXkyMgx4KZRw0ai67zmzDF+T5ALg4ME9v78HoUk5/w3Iac/LgENaE24WvQqKM07AorRwO1zr7DrV0o4KZpgkeyfnXZ7s/nXNU63uWNkaQPn5N/XMjMCPZPEEnF1SFx/afP4cT8mKjIeFogQ6DhIq5Fc9DYY0z68k/D0ilNwzQOAESZuGtb125RHd8XCNLpK4xo3zf+MV1Ev/EeLJ8qcuQUBLdCMYvpgaizw30XDt6aSm+c/7MaFv6/Cpo4RIQ6Voz+j6F+Jum0KByQuZat+Yo4QH7Qs4+sbnHLKNML/WcnCEyovs2RF0cQTwGClP+TaqwuTBQaJR3jj/RAGuHSUzwcrk62WVW2jxHeul22FEv7mXdq4WRV3i+W2sDECp7uSnt+ZegLl+y1IbBkaXA4qH84P/gObE5IkuVzPx4fFO5Sm/P4GEn6Ehuua2KIgcOaqJmtvhPvihMB0NqNAL2sld+oNR1hwnkUxn1CdhUKuP2HHHsHO32mw40sMHRBUTwT4dus7R1jvnZvNMeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(6133799003)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mgnuPEho3aT2IxQU1bi5VAEUhGVYVHLksPSLIgypGrxrzf+Vkizax7LN7lfh?=
 =?us-ascii?Q?4olRsHOXie4Lqwe7HF6pq4GKTvaBFwfBAQsXbFK5wRHfAoJjTgfZZu51/SJw?=
 =?us-ascii?Q?uyRgsqc+PILhTU28oHy/GZWrJjya54AQSZLWdEvXWP1jMR/lWAnNj21NP+S0?=
 =?us-ascii?Q?RNKQwmRSd4s+yL7uohrjApFPQfh5sA5yFrBmJbsqhhDUgAHC2QZbVBsiEG5X?=
 =?us-ascii?Q?rbhrVVRJG0Jow1sJS7vCiwIpJqrxoKFpSQaduvx4xLQpNMGKqqcujEWWS74c?=
 =?us-ascii?Q?XLm521/4r2lAr9lFgYMvA5HgL9ybOwkhJTo3mxwEOS7BrKcSco0f26QWtwN6?=
 =?us-ascii?Q?MxDiyGTAzK3BL9S+0Uh6Y4NbEEkwruBIfSqVqbtRZyqo5o8Z1PW2EMqcpc5b?=
 =?us-ascii?Q?y6ICAVIhXZGUpeJOXILJwtr/0TcUpoAWc+h4gNNxolb3OxAAX6zIDZbKGyUY?=
 =?us-ascii?Q?z8CWvaeIkiEYaMOBBP+of+33PiZpv5ukzvU217QDIGGxV6JtsQCUcTlnXsCC?=
 =?us-ascii?Q?aGXuxNAesrNlFO+45JwEaMo+9yQidjXDE9MxBZPfx8tKxRMM1yZLVvQgeSxq?=
 =?us-ascii?Q?EXVgl3/TJl/G+CsW5MZlO7GuC/P1qnIUrt0hcwtMUzvMm+46DYkt0yysEWu6?=
 =?us-ascii?Q?c5z31c8gIp3J9RBeo+gCOZTqNO9s6+iZOmCTMnLHlTRHgD6/2/bDchet4fdz?=
 =?us-ascii?Q?V4uZFlHe8FmXlxSiQasoiKAzNsnqQ6+QNHLx4pftPgyoY5Of0NiigMwJ60n0?=
 =?us-ascii?Q?NlJiTy+ThBYEE4KZMjyWmygiZOSRjcXun6y9+btPKD+bTWMZvMY9KHY1WyOQ?=
 =?us-ascii?Q?5MQAdGnEykvaKvArNIHZyf609WWKKNATj83aAnrMZdPBc+rVBoIwWN0NZWFE?=
 =?us-ascii?Q?0MMITmfvrcEFEK6KWY+Oth7KZjmYdehV7rDH84d5ALhwXEl2exIALdtOXh1h?=
 =?us-ascii?Q?PP76OiojZCe54+n7ZQobhHpsh5XehEsiRiOaanW6qFXytD0ePHPiZ4o5mk3E?=
 =?us-ascii?Q?XLOz76TLY5T59tYPrSzHnOfFNWUbCfwPpr6D/BJibNdcmzyFo6eLgihJOixU?=
 =?us-ascii?Q?zm1DqrJQvq5V5Ao14u7mNLDz2mc8sr8Wj595VO/2RTKwe8u/pEIu2U9SeyHT?=
 =?us-ascii?Q?L9OBkjzsbsRHF6N/PzPDs2qQw1VrKGB9Ci6EqFr+ZS+VT6444M6kDTOC5d5e?=
 =?us-ascii?Q?dVvinVnm2VWhIo8IEZvt/gvux44L44nio++hwmcUdsT2Vtx9qYQTT9RPbjXR?=
 =?us-ascii?Q?JUNOyh2ywrWcOnSUZWMTnTZ3q2mEiMru8OsuR8byo2M8COdm+lbnZUV7Gws+?=
 =?us-ascii?Q?zWaCHvDwExAslZ4VQvmQnE4S0wC5tNpMcjcUhPoKKOZYjA4P5/BBT3SHkREi?=
 =?us-ascii?Q?gDkaQIAZtfv+YjPP/imH0N/6I93M71XA6cEHo/i0CB8A0/GZiYo5HvsQdoMC?=
 =?us-ascii?Q?oKgkzSfvTj2rm/pqeV4+pwNDvw2fBusTddDdNCmuxpa/idtBmnycO2ISN6dd?=
 =?us-ascii?Q?zJ8q3h7Z1LNNeuNGXSmyMfU2Q8tCb+2KCKDlGwKEelw6jlz2EpkbrOXDt/IX?=
 =?us-ascii?Q?0bYShwPrupHe/iRXDgBo/ircStVmzLRBIViXfVFXOZySj7wUZZhYwD/WF5dz?=
 =?us-ascii?Q?MkpkIX/NMSDOZ9sApTEOQmo3zTXAQuE6gkR3HSCn/0ixZTFzyRtAOsiWCaNI?=
 =?us-ascii?Q?W7sASOPCvoTrli2q3ja39BdeQraUpe5jr4HFO5XIbUZHPNCmfv+9UI/d72EO?=
 =?us-ascii?Q?KGiHy2ENHg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6ff63c-848f-48de-4927-08deec90ddf0
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:13:27.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 025Qmlr+tQ5Jfr90/gRjLfJaL1Km1gB3zgoibR7VlLbIcpMxF/itlPBNf2KnyJVHxrs0VU5RA8SfH2P2wiNgBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5655

On Sat, Jul 25, 2026 at 12:12:13PM +0900, Yuyang Huang wrote:
> Add RTA_DEL_REASON (u32) to RTM_DELROUTE notifications to report the
> cause of kernel-initiated IPv6 route deletions, so user space can tell
> routes that expired from routes explicitly withdrawn by Router
> Advertisements.
> 
> The two causes call for different treatment in user space. An expired
> RA route means the router failed to refresh it before its lifetime ran
> out, which points at a misconfigured or unreliable router; user space
> may want to react, for example by disabling IPv6 on that network
> entirely. An RA withdrawal (zero lifetime) is valid, RFC-compliant
> operation and needs no such recovery. Today both surface as an
> identical RTM_DELROUTE.
> 
> Plumb the deletion reason through the IPv6 FIB and notification paths:
> - Update `fib6_del`, `fib6_del_route`, and `inet6_rt_notify` signatures
>   to explicitly pass the `del_reason` down the call chain.
> - Update `rt6_fill_node()` to emit `RTA_DEL_REASON` attribute when the
>   reason is not UNSPEC.
> - Record the cause in the kernel-initiated IPv6 deletion paths:
>   - RTA_DEL_REASON_EXPIRED: for routes cleaned up by the FIB6 garbage
>     collector.
>   - RTA_DEL_REASON_RA_WITHDRAWN: for default routes, prefix routes, or
>     route information option routes withdrawn by Router Advertisements.
> - Update the `rt-route` Netlink YAML spec to define the new attribute,
>   notifications, and multicast groups.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> ---
>  Documentation/netlink/specs/rt-route.yaml | 67 ++++++++++++++++++++++-
>  include/net/ip6_fib.h                     |  4 +-
>  include/net/ip6_route.h                   |  2 +
>  include/uapi/linux/rtnetlink.h            | 17 ++++++
>  net/ipv6/addrconf.c                       |  3 +-
>  net/ipv6/ip6_fib.c                        | 19 ++++---
>  net/ipv6/ndisc.c                          |  7 ++-
>  net/ipv6/route.c                          | 66 ++++++++++++++--------
>  8 files changed, 148 insertions(+), 37 deletions(-)

There are too many changes in this patch. The meaningful changes are
mixed in with a lot of churn. I suggest splitting it as follows:

1. Add the rta_del_reason enum and ip6_del_rt_reason(). Call it from
ip6_del_rt() with RTA_DEL_REASON_UNSPEC. No functional changes.

2. Propagate the deletion reason argument from ip6_del_rt_reason() all
the way to fib6_del_route(). Purely a mechanical change with a lot of
churn.

3. Change the relevant callers to specify the deletion reason instead of
RTA_DEL_REASON_UNSPEC. This is the meaningful change.

Now the only thing that is left is to expose the deletion reason to user
space.

4. Add a deletion reason argument to rt6_fill_node() and pass UNSPEC.
Purely a mechanical change with a lot of churn.

5. Change rt6_fill_node() (and rt6_nlmsg_size()) to expose the reason to
user space assuming it is not UNSPEC. At this point it is still not
visible to user space since all the callers pass UNSPEC.

6. Add inet6_rt_del_notify() (see more below) and call it from
fib6_del_route() with the deletion reason. The inet6_rt_notify() callers
do not need to change.

7. Add the multicast groups and the notifications to rt-route.yaml (see
more below).

8. Add the deletion reason to rt-route.yaml.

9. Add the selftest.

> 
> diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
> index 33195db96746..d7ef80fc9c71 100644
> --- a/Documentation/netlink/specs/rt-route.yaml
> +++ b/Documentation/netlink/specs/rt-route.yaml
> @@ -78,6 +78,15 @@ definitions:
>        -
>          name: rta-used
>          type: u32
> +  -
> +    name: del-reason
> +    type: enum
> +    name-prefix: rta-del-reason-
> +    enum-name: rta-del-reason
> +    entries:
> +      - unspec
> +      - expired
> +      - ra-withdrawn
>  
>  attribute-sets:
>    -
> @@ -185,6 +194,10 @@ attribute-sets:
>          type: u32
>          byte-order: big-endian
>          display-hint: hex
> +      -
> +        name: del-reason
> +        type: u32
> +        enum: del-reason
>    -
>      name: metrics
>      name-prefix: rtax-
> @@ -299,6 +312,7 @@ operations:
>              - dport
>              - nh-id
>              - flowlabel
> +            - del-reason
>        dump:
>          request:
>            value: 26
> @@ -313,7 +327,37 @@ operations:
>        do:
>          request:
>            value: 24
> -          attributes: *all-route-attrs
> +          # del-reason is notification-only, the kernel rejects it in
> +          # requests, so it is deliberately absent from this list.
> +          attributes: &route-req-attrs
> +            - dst
> +            - src
> +            - iif
> +            - oif
> +            - gateway
> +            - priority
> +            - prefsrc
> +            - metrics
> +            - multipath
> +            - flow
> +            - cacheinfo
> +            - table
> +            - mark
> +            - mfc-stats
> +            - via
> +            - newdst
> +            - pref
> +            - encap-type
> +            - encap
> +            - expires
> +            - pad
> +            - uid
> +            - ttl-propagate
> +            - ip-proto
> +            - sport
> +            - dport

At least sport and dport are only used in RTM_GETROUTE, but it does seem
like they won't be rejected if encoded in an RTM_NEWROUTE request, so I
guess it's OK to put them here.

> +            - nh-id
> +            - flowlabel
>      -
>        name: delroute
>        doc: Delete an existing route
> @@ -321,4 +365,23 @@ operations:
>        do:
>          request:
>            value: 25
> -          attributes: *all-route-attrs
> +          attributes: *route-req-attrs
> +    -
> +      name: newroute-ntf
> +      doc: Notification about a created route.
> +      value: 24
> +      notify: getroute
> +    -
> +      name: delroute-ntf
> +      doc: Notification about a deleted route.
> +      value: 25
> +      notify: getroute
> +
> +mcast-groups:
> +  list:
> +    -
> +      name: rtnlgrp-ipv4-route
> +      value: 7
> +    -
> +      name: rtnlgrp-ipv6-route
> +      value: 11

This hunk (adding the mcast groups and notifications) is not related to
the deletion reason. Please split it to a separate patch. There are too
many changes in this patch as-is.

> diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
> index 9cd27e1b9b69..7ca0e2124e79 100644
> --- a/include/net/ip6_fib.h
> +++ b/include/net/ip6_fib.h
> @@ -468,7 +468,7 @@ void fib6_clean_all_skip_notify(struct net *net,
>  
>  int fib6_add(struct fib6_node *root, struct fib6_info *rt,
>  	     struct nl_info *info, struct netlink_ext_ack *extack);
> -int fib6_del(struct fib6_info *rt, struct nl_info *info);
> +int fib6_del(struct fib6_info *rt, struct nl_info *info, u32 del_reason);
>  
>  static inline
>  void rt6_get_prefsrc(const struct rt6_info *rt, struct in6_addr *addr)
> @@ -531,7 +531,7 @@ static inline void fib6_rt_update(struct net *net, struct fib6_info *rt,
>  }
>  #endif
>  void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
> -		     unsigned int flags);
> +		     unsigned int flags, u32 del_reason);

Why not use enum rta_del_reason like we do with kfree_skb_reason()?

Also, only one caller calls it from the deletion path, the rest pass
RTM_NEWROUTE and it's weird to see something like:

inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags, RTA_DEL_REASON_UNSPEC);

Maybe create inet6_rt_del_notify(rt, info, del_reason) and have it call
__inet6_rt_notify()? Then we don't need any changes in the addition
path.

>  
>  void fib6_age_exceptions(struct fib6_info *rt, struct fib6_gc_args *gc_args,
>  			 unsigned long now);
> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> index 09ffe0f13ce7..98f1684fe378 100644
> --- a/include/net/ip6_route.h
> +++ b/include/net/ip6_route.h
> @@ -128,6 +128,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
>  int ip6_ins_rt(struct net *net, struct fib6_info *f6i);
>  #if IS_ENABLED(CONFIG_IPV6)
>  int ip6_del_rt(struct net *net, struct fib6_info *f6i, bool skip_notify);
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i, bool skip_notify,
> +		      u32 del_reason);

Please use the enum throughout the patch instead of a plain u32.
