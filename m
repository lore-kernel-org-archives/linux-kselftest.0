Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448430;
	b=f7PWyVi7THTQnbgTGdqOitxUh9soVtSviG1HRPQwLg2bvmfGLYu9a+uowVx7uObPujvc
	 ObwdAkOWtY67n64340lVld0Lg1Kr4ETOfNquVybKRtc//A5VkerKCG0uPVeH/DK8XZzpD
	 5n49yyF4TLLYLvRFHP5/zbvXmgDVpqGaKtGnyGJzGstS1k7FpLfzJquEeI8lfZSq7c7xa
	 NOdyveRzAbY5Wa++QYJfGHWQPeRyQ3EVsPdILmL3xAWwrmuTMlKYMOqnphDssSgpQtenL
	 ndabYQsx2v1OMGVfNp6nFSsgtuWbK0ct+1hj4grghv3aVOA7gZSOU1IZ69YZr+Sjwog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448430;
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
	bh=txfYluJCCySe/4qjl14LymA0WkLgMfGf42JrvVZo+tM=;
	b=ZlPwIAGUY2piogDQHQbRzvQlRis/dejCbzuu0HOvXf2Wx83w4u9dzBe668izf+SRZqdO
	 3kPUzHJ1WU1uq9w37Iz7+N8tZRqiIUly0u7hEgeqTj59IzzfNMtMeyfNgBrYGPuVhiXdx
	 WDUZ355lmA00NBrXvaqTlde3KHV0JqBrzUNmSLu/jFeps14LRnS8zzSLYTuNNVuPBUqP9
	 LUpPj/lE4BR6FFQ291fd3ypWligpg5lOBbe99pbqCVpKL1KaPt8gU+DDR9yeIHewh16aY
	 DbZbHn5cBUG4NkZVe59SOzAFpHNJITR41YAzHxd+VyvbBMnCySPQkWOPvc302dibPcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YohIAvI6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.70
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C21606A33C;
	Mon, 23 Nov 2026 15:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C21606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YohIAvI6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrAdgN/cY7jdWKuoTEWkIgnsrGZVXeU0RhafsHu3rTm7ZpSSR62y3yQ6F4zlokFyY4TEzW5M0e+pkZw0rpsLiAuHsCL5pMsIFAmddtGbx0RPkjm+KDjcOcTodnDTdeL9XS8B9lM5nR58gxgTpcq5/XRW9wDrny/n8xtuXQe/mjhKjKEJ52Yp8lDw3hSenIjiCqQ0hXUJy2sf4WBwhPNgNnS238kVYjvLm1huywNyRC4qaPoNk2FemO1/jzwezODb4Lp9KOpEyjlSHU4ydboogV/R9RNt+OnuqZcJmH1sLAFb70oc4ZZkUBzjxHIHyE0klf2IRFtCquFbwaJlJvU9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txfYluJCCySe/4qjl14LymA0WkLgMfGf42JrvVZo+tM=;
 b=pJ7075RsnE2TZ1Y/Iy1TFGpywj+2U0ihlZLDjqbY3/u+f6JhdLZz39s6va4YTi4lycKMLXJiMyNFyJV4CXC6r82N9asxMz4NvsZEeORurANXMYPoT3PewlpFAh0ZGlQrbCTZHjjpZIR19ciuhSCPdZag7BzuhzsXKgPXhHUj7zBF2jn1bp+g3Gq4YOz16v0poyolPEsWE1R72NmeuSbK/usqYuA/IdYPUKo4tE1w2zp/xINj0m+55ICDSx4NyYvJN6kE46OdhR8MEM2OkVRGziHwnTol96IATc/lDZjM1BFZD31u8PfV2tIJIl41WTFf4fh6ACrNDFlhGuS4W1JmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txfYluJCCySe/4qjl14LymA0WkLgMfGf42JrvVZo+tM=;
 b=YohIAvI6eutI42oAA+8AVfSjAFWr44/RPTAc3ASIoWGy6HFO+sYlBraLiS65j92yZj0hXQ3T08bnbMpsfNso13Bhf5aqt0de8kM/i/wsINmXiRLxnAqTpie9/cuOFMfMQljbRPZZuOmuwTEJ6htTZB8qczuEe9nBLW4mxmkxAx/A4eN8BPizaHfDA+7Z6/blJbZS1ygT1NVIBeMiBhE9hS/NR3RHyqbB/rYDlhhRxIwUnnByS3Db0WF1c2HzQ0hPiTKxqAkDU+w2C9YCAm9Bzl9kUMzQzscRkkd9DT996aHHoYY6xLRHCXNZACiSoNCYjHl4GR20KVxOMDA8seqOSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS5PR12MB484139.namprd12.prod.outlook.com (2603:10b6:8:47c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 15:40:26 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 15:40:26 +0000
Date: Mon, 23 Nov 2026 17:40:17 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/3] ipv6: Cache pmtu for all paths of a
 multipath route
Message-ID: <20261123154017.GA3456673@shredder>
References: <20261117193141.27004-1-deliran@verdict.gg>
 <20261117193141.27004-3-deliran@verdict.gg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117193141.27004-3-deliran@verdict.gg>
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS5PR12MB484139:EE_
X-MS-Office365-Filtering-Correlation-Id: dc13ea93-e23f-4500-415a-08df49781828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|11063799006|56012099006|4143699003|10067099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/eKHiPmQLQpXwRVzcWb+pkRjkztk8QSMYnqNJvp7VRaUidZy0BPt3HfNg+FKami+IKCGs1RWIVb820JHratXiLuFtbbd1um13vFUCWiO2mULQ7b6EAB63EkMBACfMn4wlcNCnPEqVqIxC39mw+v6rsAb5xO/4x8P2LkEmIS/6YlWyO0qDSWA3xnGc2xdY1N45fUi5UzwVyx89fg4OjCzy6bvJcL+NVIidnt799acE+3I5fgZ0++gwJbOY1hFS+s4inE/VjFLN7/ZYKU/HKGqPDn02uIaSAS3omnHXSxpiH+YW8WJOx7AKaLa/2k+Vn9OGVAW+1gFcKCRyfIyVySqfACk9AircGGo6m5xRpbYGiIxocfQc78ckw5oV8pPLogZYCAjFSgZrzKCBLHw6XkqbHSuKrpMw02Tho7TA9Vh3svxSqhhYaWmIJHznmFk/OXfckdfPcMFNxJDwsIPqzS2entFqaAe0Kz7H9b+aSn6Cyxduz+l14Xp3HehjFjnMLMkj//XK7LqVqGHZnzyl3lrHOeRG3FjPFSN4ljkfLKdXa53SoPSF1Uy+9b48UDCQ4UrDhBKcIGvKaC4T1I14KCqvCHQWJ7C7ylcEwmuwHYc9dYN0D86DnAnP5T4EFmJiFrM9b0CrMGNp7Qxz6yqy3b5Cq/plcF3JJQONabEhv8Gn3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(4143699003)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2235wAir+ET4s2Z8PlPpp0t0Z1wndsJ4yM6mFSIuh7S9URzxz8BrRpZAGrtu?=
 =?us-ascii?Q?tqzKBGJAL7N6xDznSQ0/yciGKTVSjmxF/rhvYjPg0ZrdeWUZbJGly4IywTIL?=
 =?us-ascii?Q?MVPpLGU35aKAWQKyURTJtL87OlXKEg8xRAfs4MeaNnxYycWdwH8nE9EAmqb7?=
 =?us-ascii?Q?0Wl9l5X3ADDWfouSqoHhI0zIj8wzkFQJKqXcsSJRcKt6bZ5jIFpddFe6Eg0g?=
 =?us-ascii?Q?QWev+WvPgclY0NQv9wC2mpPQIj66IeP7Rg0g4K9hACyityBq+VFjPDePNtfL?=
 =?us-ascii?Q?hStZO5gt5bCGjS5Jpm3Vc1iZ0vQA8b4QDcYQ8MwptcH6MuGzU+uZwpcogKpv?=
 =?us-ascii?Q?NqJ4RF68o0pnLa45AQzUynER0jhNYiYwLeMwRlARtjmAdTBL1upgVpo7Tr6s?=
 =?us-ascii?Q?U8loKVm4ozgGxpGqLCCKD7pEvmm8LhO3iKh+wEIlWEtMuVKyM9kMJOxk5sQn?=
 =?us-ascii?Q?7U5Darv2OWi/nD6xH4erzEWOuzvQxz3sqNOI9+Yzf1nJ1Ll8JbIAdqLkGfoO?=
 =?us-ascii?Q?72K8d/boPqCQPyzJ7S48f7FqjkmATJKtj8MC3XQPG9v4Nxn47TkMKvve16hX?=
 =?us-ascii?Q?kuAPNL8Kmk1GYBr9s0yIem758IgDstVPJhRq8j3Q9ldc3SiOID7mf2/HWFYS?=
 =?us-ascii?Q?qFJ/YlYBQxYkioLRNgRq2CAxIwkxmj9T85DI7o/fmj6DQP92CKn2HXCtZ2Mm?=
 =?us-ascii?Q?F0Vf46lJUhQssu4/IM+pBZaI85E9148/+N2lxCc6HQcVApCcrUibOrURjPNc?=
 =?us-ascii?Q?sWHHXzD9TRhWQc0wZXiFSbRh8liIGaabZ76CFcAuEbf/m1RPrqIof1TQbVnN?=
 =?us-ascii?Q?qA97xOQ1E2NVlAwPvm7s652WshFnJZmt3U0I05pxdyX4tQC8WjL5nP9/EDNf?=
 =?us-ascii?Q?PjpAOqkagzKOqIFbymIhquBvOHMf0FLspQ/2MRWzq9vZSj69pOC0hL8uLdXN?=
 =?us-ascii?Q?92h3DA25Dc19mh0H+CvNkFnhk8qXMjVtgU8XcueIPoXkzy8ahLNpSgman1PK?=
 =?us-ascii?Q?F9DMSRk3/FnhBwIO8Rlf2LRlrxLU2wxTNuph7g0hVwUFjKDsh26GAAOE4zwt?=
 =?us-ascii?Q?HH/dDCMWyAxdrJLCgxdwHk/wumizNmyQO3GVnAqEw4Z+glKB3TpczcWXaXkU?=
 =?us-ascii?Q?GaOrUXqKXxmmwk5/PEXGdb7kaS6iD1PKjr5Gb1nIx9yXYjHY45iwb8g2B3L5?=
 =?us-ascii?Q?ecdwZumrfvGyKO2V4sVI/6NOhP0OhLuJLMyVKWMoae0szOirFHrliCJY0BRb?=
 =?us-ascii?Q?HHw+T2360eiy51sNuXTEX9WebYwLeb5r35M9Xu3roBARLwMFO7oMVoZErxQ/?=
 =?us-ascii?Q?qR5kXX3mgbCb16LF1Wnea/PseE1me7/+fqpWy12CVYj1sNjJu9zlyhMh8hoX?=
 =?us-ascii?Q?BWPE9r7pvo0Gzim8A/jgmUzDHmsGh9x4PUCDgT8n1I9TnLjR4dAfObqj6Vaf?=
 =?us-ascii?Q?jOiCqcsczJS6ojz44oMLPyDuiSSKPYpJa2pnBcXLEKfrXlor1QY9FHNSAjeO?=
 =?us-ascii?Q?UbJeEW7Vo0mHyhsItlZa9y0x3E3cj8mXx7f9SLKLaPOhvKT7l/aclasV+9Jf?=
 =?us-ascii?Q?KbpuGfpgKD1lRbJDHXpJi2y+0bd0eMMopLRcc7Cx6leBwZ2IIoEXongYwpfG?=
 =?us-ascii?Q?BeQtEtM3xNDg/77K7xXWbplEsbjf6dMlltuEo7/x1T1e37DljI906RIz6+gd?=
 =?us-ascii?Q?nrdF7tGBJe43eOxoTOnr7eBeV+0bwtb9rdgE+EuckR1HPi4S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc13ea93-e23f-4500-415a-08df49781828
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 15:40:26.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErwLUhhHpxt9L7fn1LMbWu3aUyW9l5JcXt4G/2NUYnOlHBHFbUO0e2X2GyvCqs7C7gLkkRg52HZJHezY2ZY6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR12MB484139

On Tue, Nov 17, 2026 at 10:31:40PM +0300, Vladimir Vdovin wrote:
> Same problem and same fix as for IPv4 in commit 7d3f3b4367f3 ("net:
> ipv4: Cache pmtu for all packet paths if multipath enabled"): the
> exception for a Packet Too Big may land on another path of a multipath
> route than the one the flow is on, and the flow keeps blackholing. Cache
> the pmtu on every path of the route instead.
> 
> For IPv6 that means:
> 
> - ip6_update_pmtu() looks the destination up by the interface the
>   Packet Too Big came in on, or by a hash without the protocol and
>   ports for an unbound socket, neither has to be the path of the flow.
> 
> - the paths are the fib6_nh of a nexthop object, or the siblings of the
>   fib6_info the dst came from. Only ip6_update_pmtu() walks them, the
>   dst of sockets and tunnels is the path of their flow.
> 
> - a path only lowers what it uses, the pmtu of its exception, updated
>   in place to keep a gateway from a redirect, else the mtu of the route
>   and the device. The looked-up dst isn't checked anymore, it may be
>   narrower than the Packet Too Big while the path of the flow isn't.
> 
> - siblings not in the tree and a nexthop replaced by a blackhole are
>   skipped.
> 
> A Packet Too Big now costs up to one exception per path, as a
> Fragmentation Needed does for IPv4 since the commit above.
> 
> Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/
> Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
> ---
>  net/ipv6/route.c | 138 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 103 insertions(+), 35 deletions(-)

Why not make it similar to IPv4 where we always try to update the PMTU
on all the available nexthops? Something like [1].

Anyway, I suggest finishing with IPv4 first, then moving to IPv6. Send
two patches for IPv4 (fix + selftest), then, once accepted, send the
IPv6 part (another two patches).

[1]
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 04098cf32eab..550616981086 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2911,12 +2911,52 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
 		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));
 }
 
+struct rt6_pmtu_arg {
+	struct fib6_result	res;
+	const struct in6_addr	*daddr;
+	const struct in6_addr	*saddr;
+	u32			mtu;
+};
+
+static int rt6_nh_update_pmtu(struct fib6_nh *nh, void *_arg)
+{
+	struct rt6_pmtu_arg *arg = _arg;
+	struct fib6_result *res;
+	struct rt6_info *rt;
+
+	res = &arg->res;
+	res->nh = nh;
+	rt = rt6_find_cached_rt(res, arg->daddr, arg->saddr);
+	if (rt) {
+		if (arg->mtu < dst6_mtu(&rt->dst)) {
+			rt6_do_update_pmtu(rt, arg->mtu);
+			fib6_nh_update_exception(nh, res->f6i->fib6_src.plen,
+						 rt);
+		}
+		return 0;
+	}
+
+	if (arg->mtu >= fib6_mtu(res))
+		return 0;
+
+	rt = ip6_rt_cache_alloc(res, arg->daddr, arg->saddr);
+	if (rt) {
+		rt6_do_update_pmtu(rt, arg->mtu);
+		if (rt6_insert_exception(rt, res))
+			dst_release_immediate(&rt->dst);
+	}
+
+	return 0;
+}
+
 static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 				 const struct ipv6hdr *iph, u32 mtu,
 				 bool confirm_neigh)
 {
-	const struct in6_addr *daddr, *saddr;
+	struct rt6_pmtu_arg arg = { .mtu = mtu };
 	struct rt6_info *rt6 = dst_rt6_info(dst);
+	const struct in6_addr *daddr, *saddr;
+	struct fib6_info *f6i, *sibling;
 
 	/* Note: do *NOT* check dst_metric_locked(dst, RTAX_MTU)
 	 * IPv6 pmtu discovery isn't optional, so 'mtu lock' cannot disable it.
@@ -2947,47 +2987,43 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 		/* update rt6_ex->stamp for cache */
 		if (rt6->rt6i_flags & RTF_CACHE)
 			rt6_update_exception_stamp_rt(rt6);
-	} else if (daddr) {
-		struct fib6_result res = {};
-		struct rt6_info *nrt6;
-
-		rcu_read_lock();
-		res.f6i = rcu_dereference(rt6->from);
-		if (!res.f6i)
-			goto out_unlock;
+	}
 
-		res.fib6_flags = res.f6i->fib6_flags;
-		res.fib6_type = res.f6i->fib6_type;
+	if (!daddr)
+		return;
 
-		if (res.f6i->nh) {
-			struct fib6_nh_match_arg arg = {
-				.dev = dst_dev_rcu(dst),
-				.gw = &rt6->rt6i_gateway,
-			};
+	rcu_read_lock();
+	f6i = rcu_dereference(rt6->from);
+	if (!f6i || !rcu_access_pointer(f6i->fib6_node))
+		goto out;
 
-			nexthop_for_each_fib6_nh(res.f6i->nh,
-						 fib6_nh_find_match, &arg);
+	arg.daddr = daddr;
+	arg.saddr = saddr;
+	arg.res.f6i = f6i;
+	arg.res.fib6_flags = f6i->fib6_flags;
+	arg.res.fib6_type = f6i->fib6_type;
 
-			/* fib6_info uses a nexthop that does not have fib6_nh
-			 * using the dst->dev + gw. Should be impossible.
-			 */
-			if (!arg.match)
-				goto out_unlock;
+	if (f6i->nh) {
+		if (!nexthop_is_blackhole(f6i->nh))
+			nexthop_for_each_fib6_nh(f6i->nh, rt6_nh_update_pmtu,
+						 &arg);
+		goto out;
+	}
 
-			res.nh = arg.match;
-		} else {
-			res.nh = res.f6i->fib6_nh;
-		}
+	rt6_nh_update_pmtu(f6i->fib6_nh, &arg);
 
-		nrt6 = ip6_rt_cache_alloc(&res, daddr, saddr);
-		if (nrt6) {
-			rt6_do_update_pmtu(nrt6, mtu);
-			if (rt6_insert_exception(nrt6, &res))
-				dst_release_immediate(&nrt6->dst);
-		}
-out_unlock:
-		rcu_read_unlock();
+	list_for_each_entry_rcu(sibling, &f6i->fib6_siblings, fib6_siblings) {
+		if (!READ_ONCE(f6i->fib6_nsiblings))
+			break;
+		if (!rcu_access_pointer(sibling->fib6_node))
+			continue;
+		arg.res.f6i = sibling;
+		arg.res.fib6_flags = sibling->fib6_flags;
+		arg.res.fib6_type = sibling->fib6_type;
+		rt6_nh_update_pmtu(sibling->fib6_nh, &arg);
 	}
+out:
+	rcu_read_unlock();
 }
 
 static void ip6_rt_update_pmtu(struct dst_entry *dst, struct sock *sk,

