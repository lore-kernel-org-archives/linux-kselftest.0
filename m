Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794731603;
	b=x9/5CNa+OJSmXM2RBOn1VzK6ufSXdkIBw2KFInRyE6xfx8TIiQtJ916zmjDmDa6tZhIf
	 D6ubgVQ9JMclYNbRjm6llsrBySOpcOsFG7aDmPXTyxFwPTaZK+7rLBFYtSm5WN/aJLo0N
	 E1dwtQ+pBf/VG7Jl82nRZR0VE9XMY2LFRbnpUtLb4SFiH0h8pwshGA+2ZkTT1zUhURom6
	 CenqEbsxYlmh1HKDwoPo3Eh4w5ckELMp66MRQ5UoXYGGJdvWXMhF3ukoAq03XuFzKIs7P
	 B3qggNh3H2MxGZNl8LVWtAKocr+gs77G7YmvkbA4UhS0VoUF01hfQSphOsXriRi6L4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731603;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vIEaZdhJOgwBvONbgkhfl6j7iPHJref3ZYSoInj3kxM=;
	b=j/mvV3gO1ltYEz66sqAW7cjTOyEK35jMQNave3PrRZYIERYiLPG/UxTlMOm6kqMhiZOj
	 DT3uo1IVJSq5/Gq2hQCMtG8/+aW2GkOQiM7NMNdgdr/9YTz4bRI3jiqXugc9WbK+iFyGi
	 lf1RHzJJkryfRkloezUSWACeW7kaiiu1GfsN7nPJKJCUNBbkfiknhcPI5xnUtFnB2vyZZ
	 pQvDWkrZ2f293jtTlekvGs/kz7jdaidagdfWY8/r+9BY7mlaG/8qNHNstsi9QUZypHYF6
	 pK0GPTKtMvhKeT9+K7PcglMECwTF7Aa6dHmdPN3vaDSm44rKdLH4vd+2DXQMgBDeaHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q9nsvps0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.56
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05527606A327;
	Sun, 15 Nov 2026 08:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05527606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q9nsvps0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZKBcWV23KW3jtg4BPlfcPiYQVDsahjj/YY7erPBSDHvuggvttevpJByauQhoXlp0qnGwsf4H5bnDPTqMjzPvBG0ImILlZ8SsDE6vtXdxT5uv3ti6P+Ox7YmvLxdmFOWsnj+t1FcipRXQA2A2NOrgCchUh/Cw56ck9Oi0bG5QCE4kba4NDpm1N3JrQOSO6W9tAqSfKpgiu4Y1cbiK5mEaGaGeRkFuDRgaaR9BdFuFLPhVTWJGZtS8cjODckKd7i9QKm55SKvcTZSaIQcW4/2JBM6//DlLnaEwDDmqB/5H7VlGd4pES7w1tbo3ToLbBzhtajKlAULcxbDovGX0Awmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIEaZdhJOgwBvONbgkhfl6j7iPHJref3ZYSoInj3kxM=;
 b=Ppn3UNNSJ1AKwqWOdzb7uUWHK4Us5zCXAHLXhsrNy95A39VNRWFGw2kHrC5WwRSjWgKYVMwKMSYcAwb1IH9BsAhptKl1F8Yt9y4re7Hgjyf9zimyzDlXs0j3jidLCq5PkZoM6sIAJP8VRz0AN+Qe0oOE/yupipPgYHnkWPppfFTDnD/EgN3+0K6fPhpoPoGoJWiWsztcVpUrbnbWhMJC4YUvGF4LNc5mPOJToIjUzml30lxXKksXa8rZyiSeEKqsDp0k7gpk6mwhhWs6mm6K6yqpEscK+6KWs+jIL2ELl5RVxqV17tC/Zd4NuAjm8Ih6tRCdZlZEH9xlamuOJFzBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIEaZdhJOgwBvONbgkhfl6j7iPHJref3ZYSoInj3kxM=;
 b=q9nsvps0m/71OV0vwRLmO14V4zf6ImRqdokt/uOepmfo07ITE+aGg8MjdA6/zJeWytwPwv7vzDPLy73/zn2FTlhs6w7C1wkovzIbAoSLSuivxkM8631dBKNEhpULHkjXzmjDxOKwW/k1ZWLKPE6IkX9hbGsvw1jbSkqSDTu2ltH8wpQ86aa2JZGASpGNbRo2ZHAzZd2Bo9qbuVU/g7YQqjV7DTHT83oqOelXKWWGL0SBbCIKAjI+cUhHB6BGU52NJe3EPSkpv6RoMv5Y1sjibPYHDZuIuQG7qW9ownn4gg5S24+cf22edu5pipSqeSKscmODpFmDoMpE++R7tOWbuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 08:31:26 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 08:31:26 +0000
Date: Sun, 15 Nov 2026 10:31:18 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: Re: [PATCH net-next v3 4/4] ipv4: replace obsolete routing comment
Message-ID: <20261115083118.GC3764829@shredder>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
 <20261112235932.23836-5-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112235932.23836-5-liamsmith827@grapheneos.org>
X-ClientProxiedBy: MR1P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::12) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2e9790-f9e5-45f5-f42d-08df42f2d6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|10067099003|261022075727099003|261026121527099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	5SynxB1VUIBl1sfB3xjtTIYinZQoJFwW4pG3Z8Bg0h8YLn0ZIH1cgTo7cRiNcI5bmGfqPXHWgzlCH5LmvNZ/EbQmf79+JPqJsdZ44CMt6B+oGvfSmaUVvOUniPvBRWoayIEvh4wHmSD2NStc4T0WbYYF1zaPc+20IB1KEZC35Kj0j+MZKlJhs2r0qPRO6xgwguj1xPKZfG7efIw+DgzRh8NsvPgITn3dUkaFHlTGxFsZBFqbWKY6J8HJhWSoXUYeSXXe38pnsS4/jd5OsEMSCWoYoKcwqQxEmaIyoXmrw9ZcjSNIEw2edRMrRLjZqyG5Tz++fu4GNfw/bwahSUKBsozzbwezeAStdMhUXA/ve3C4pDNTR5c6SXFnzilcM6FL1ot9jRg1lbH+QQ/GiV+juqIM4UYBY01J67dUdeSe6TR8tZsSMlrbZ+3VWsIQ6eqkuJIq+IYXZor1ciw1gh7tzwA+AC7GPV1skG1ubl0L5PAEXWOJs9tWopojxujIRQfPdAsI0CiZGnzswjp4weJt2lwWph9QVFV6r9EfOZenbW5O2auQ//BlOx7dO50b4ZAIhofDm0IHazlUYLIGGrLFo821IfS0+yEwhLK+qsotOYAvNQFvpZeik3YlQvJNx3KS3a2nSoRPDh5ZcllyonDdCmPqbS5YwNUkploeM4kHOFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(10067099003)(261022075727099003)(261026121527099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/29xwSj/b1FViDB54Dm3LiP6xYe5dv4oXCOrMnTxtWX0IU6DmQSXNVw0Aeo?=
 =?us-ascii?Q?PM0ceAiLvhUCpx8oru0n5GUCpfRmPedM4+RrkueTHsyDlUXsN4kPh0QVwoNe?=
 =?us-ascii?Q?QauD+V7yTr8b7vdch2shz6eMPTYCabS0KAh0u13ypVTaW2q4r8JLeUxn4Os3?=
 =?us-ascii?Q?7YLU4G8AQdmJT/zWfhSaJWqFaTGA+U4MI+0lQ1Xim3wOsjnlR73shNQEz1uJ?=
 =?us-ascii?Q?i08Ezv9r+iqAuOVMeP0uYplIvQq31YT1c7YAuyuq84m9tErtEc48dTenvBDp?=
 =?us-ascii?Q?9z7aCkD34iKIc+KYaefAVZ+ILYWHMQwNUKQ8Yp8igo36eyq9tVPHYa4/oJkh?=
 =?us-ascii?Q?CziGNJ/E1y2RnKf0JRQREN8i2A3xrveLYkViExP9B55h3zwi3+HYtZL7USzy?=
 =?us-ascii?Q?N927y9bGxJl9PP8RCgjNC7LZYtRgxSI5yfIMKd8fXNc7RSHrvf6ejxfBezZP?=
 =?us-ascii?Q?sUXRGsO/JRG880h+hqcf2My4A0Pwdcchra6lSXUwBC/yjYyT6W8sjV73wHfq?=
 =?us-ascii?Q?sCAWQdJVyRODIIkrl6g8IkevyHSWNwIAYGU5OpwzDaBk3vdxcjAUY+IOA1RE?=
 =?us-ascii?Q?QNh3H9iioBLuGlwqCuUlVQ51WfNEp0VoY+O9QpuHCrM5mjHNIqyh82u/VvQ0?=
 =?us-ascii?Q?XTtxREWxO9iqLD6UKZ/ZW70xoLdslznGEcWFfki9mbwBDATWVL+sGEl1FFm7?=
 =?us-ascii?Q?kyxylNOup6gV+j5BkM0xy1ubKdIKptG9gYeFrrdQw9CTMIcaWLrFpAaRQDjv?=
 =?us-ascii?Q?e8wc45IGJqjugXUxWtj5Yqvl+QSyEn6F7PQggIa3eiZ8dd1C0pGKH03DpAt5?=
 =?us-ascii?Q?LEjlgktBxLxD0IJmqpkxgZ5xUaFquaO2o+swMnQTOW+mZ7uxnMCLZCcBtwmP?=
 =?us-ascii?Q?GqcNCn616jIfH1uZBX/eyCC3o2HH//j5GpnCr7soTMu7jHZvh7mbc1d9xVhR?=
 =?us-ascii?Q?v6UeD6i5VP0N9xsSQQn+sSZ2Lz7VeKEUxHqTPH6917gByoyL50b0OSIUJbwJ?=
 =?us-ascii?Q?uSsz6xLc7KeKdhAPajqfPFCqf05EmhvS5rcxTsw4dJOFTqavQ280DutIY4oI?=
 =?us-ascii?Q?h5cw1WBSib09oPFlXwoe0xIodtAMPCGR9AsIPA3QG/9LfUIzFlY3W3FiQYSK?=
 =?us-ascii?Q?zNOLeSNqsbHeTKkjzTYA0KpEKFGu+9o0S4+7zHavtij5aez/V9h98WVTvMUa?=
 =?us-ascii?Q?JHqiE2Xpn09YEcC7eXAPqAOAYDvg1bDGftPRbcn9uVkIPqBjqSBmDSAMXb3Y?=
 =?us-ascii?Q?rncM3L+dsDzmnP/Zhp1l+l2DfO5dDLOC9tRtHLnKe5uvYxy92Otq+VOCIRcU?=
 =?us-ascii?Q?GeXo9uT7qlciT0MOjITo3lIe3a+TpeKJaDQ4M7JvVD11/MKDEp88uP4Wiq+M?=
 =?us-ascii?Q?ca2mYpqH8EeksZeI+S2fx6Fc6vtPPWdzN7WSWNmiVZwPdIXGUG8wE34URNWO?=
 =?us-ascii?Q?dOS0JpiKYtjoLYiCDeAo+As6inuwdye+TYtbqSvH3MkgL3ndUKmALd3pAtrd?=
 =?us-ascii?Q?ft//JTwpjxqIf/WA99BaVrIzLE5l6dssumJA+wGl3MGqY87ddBXzKh+L4kCH?=
 =?us-ascii?Q?rRL1opC+02OKws/GdOVREgrWg6XktHOGI/lyKBxJl+taA4RufW3piAfFIV0C?=
 =?us-ascii?Q?hvZe0cHmkh7pbHxJogZDb6B+vF2bcNJejsoNB3NjTDKJhkmXgasFx+SWF0Tk?=
 =?us-ascii?Q?ekQcrtKUzvtSre4aA0qZax+DB4knYX4T1aMc6CAn7aCscf5p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2e9790-f9e5-45f5-f42d-08df42f2d6d5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 08:31:26.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85hlvP2VR2/9zen2YJFQfopU6DGzg4nmTph/5r8SNnXYRR2r+oRPPnAK9wPS58KvGsvh9HUjsqFkQiVgocPibQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044

On Thu, Nov 12, 2026 at 11:59:32PM +0000, liamsmith827 wrote:
> From: Liam Smith <liamsmith827@proton.me>
> 
> Replace an existing comment which describes obsolete fib_lookup(),
> MSG_DONTROUTE and IPv6 behavior.
> 
> Signed-off-by: Liam Smith <liamsmith827@proton.me>
> ---
>  net/ipv4/route.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index 03db105303b4..d862b5ecad71 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2856,24 +2856,19 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
>  		if (fl4->flowi4_oif &&
>  		    (ipv4_is_multicast(fl4->daddr) ||
>  		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
> -			/* Apparently, routing tables are wrong. Assume,
> -			 * that the destination is on link.
> +			/* When oif is specified, fib_lookup() is called
> +			 * primarily to determine if the destination is
> +			 * accessible directly or through a gateway. It also
> +			 * checks whether there are any traffic restrictions
> +			 * (blackhole, prohibit, unreachable), or if there's a
> +			 * routing lookup miss.
>  			 *
> -			 * WHY? DW.
> -			 * Because we are allowed to send to iface
> -			 * even if it has NO routes and NO assigned
> -			 * addresses. When oif is specified, routing

The new comment should include the motivation for the fallback.
Something like [1].

> -			 * tables are looked up with only one purpose:
> -			 * to catch if destination is gatewayed, rather than
> -			 * direct. Moreover, if MSG_DONTROUTE is set,
> -			 * we send packet, ignoring both routing tables
> -			 * and ifaddr state. --ANK
> -			 *
> -			 *
> -			 * We could make it even if oif is unknown,
> -			 * likely IPv6, but we do not.
> +			 * This fallback path is always taken for multicast,
> +			 * regardless of any restrictions or misses. Non-vrf
> +			 * unicast does honor restrictions, but falls back if
> +			 * there's a miss. The destination is assumed on-link
> +			 * for both.
>  			 */
> -
>  			if (fl4->saddr == 0)
>  				fl4->saddr = inet_select_addr(dev_out, 0,
>  							      RT_SCOPE_LINK);

[1]
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 18cb8bfc5bfc..0b5f6e9cc437 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2859,24 +2859,18 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 		if (fl4->flowi4_oif &&
 		    (ipv4_is_multicast(fl4->daddr) ||
 		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
-			/* Apparently, routing tables are wrong. Assume,
-			 * that the destination is on link.
+			/* We are allowed to send packets via the specified
+			 * interface even if it does not have any routes.
+			 * Upon a lookup miss, assume that the destination is
+			 * on-link, unless the interface is a VRF device or
+			 * enslaved to one.
 			 *
-			 * WHY? DW.
-			 * Because we are allowed to send to iface
-			 * even if it has NO routes and NO assigned
-			 * addresses. When oif is specified, routing
-			 * tables are looked up with only one purpose:
-			 * to catch if destination is gatewayed, rather than
-			 * direct. Moreover, if MSG_DONTROUTE is set,
-			 * we send packet, ignoring both routing tables
-			 * and ifaddr state. --ANK
-			 *
-			 *
-			 * We could make it even if oif is unknown,
-			 * likely IPv6, but we do not.
+			 * Unreachable, blackhole and prohibit routes / rules
+			 * are honored, but not for multicast packets.
+			 * Multicast in a VRF relies on this fallback since
+			 * the lookup hits the unreachable default route in
+			 * the VRF table.
 			 */
-
 			if (fl4->saddr == 0)
 				fl4->saddr = inet_select_addr(dev_out, 0,
 							      RT_SCOPE_LINK);

