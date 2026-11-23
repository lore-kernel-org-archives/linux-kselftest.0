Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435878;
	b=bj7tnNMgGQzhHN5k9WC+mjZl8UATj3VPWkWiUnL3nijZTPSnfNmrymUzsYSZejzb1itB
	 jKr6bqqPKAUItD1dQgTskRL2u+xo5a4B+bHOAbcVr7HeaHoJX1rZm6BbonqJmTlbDFjZa
	 zOV4RZ+RzYWcGAkOlRo8d8/bP6UmHPy6LNGAdQVYcgRrYXzNAD5g6AN56cEiwXr2lym3i
	 bSalQSOXckff8YafeLlEPkAChlRaq6GpqfYl2eoNJEaRIhKoJfn9KRA0KvjLXXMmJ4Ows
	 9e07sJOyJOd4F07Dg5kvMo5E9Ct9E2lYHHy4oEx6f7v+9IbGRd4/SM6SIfdsi6OhYaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435878;
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
	bh=bb8GPTzOlMmtjkNYOF5FV+rcUlQ7ZKYC7R0qLZd8cpY=;
	b=5Xvce0faYxkp07jcvEiRWJ0WRHFT32+PFRkXFvQNLiDUodPg0n5zz1ipd+qICADHOAJB
	 W8GgkmS43eYSih8UDqjULRjD9bsuaVc+gLF8eYTKMWKsNEtbUTeYbnu6iK/dRkjUaC2Jy
	 YfyEYMTBVoRp+NWaiwOPSvD5uz7WUqWgORgFnpB2DV+O4eHl030xGtGeA9ZH/k/44E/B/
	 0hO+5jy4T4CaxpWkXfnRyp6AH2ZMcv/GTfq1ponSWd7e6uGykA7YMl+o7+6J/Sydnkykl
	 xXctaYOWOC3ls9cDhuMixSH4a0ThlFpfiaBqKxfobOcWph3b10wY+Khtd8oN7Xkyoww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s74ohwG0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.63
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D2606A321;
	Mon, 23 Nov 2026 12:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s74ohwG0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev3YRVgaFQQrfmVqgioJU057MquksFuP1HnBqHpAqDfJZ0mQl4y9mj9A8AxUeHP0HynL8qAKi+0L5KSnUvJhzNSdVSHdOooN+JRprpTs+Y0pLqtV1cMiLBkDNvEZzLbw3KJOtjpT5xvHopCR8HpRqq0yyU1k++iSQuY2RZkLKY/T6CQltFIo6d2WyTIEHZFPFpRNmAQDhFtrfruzfyGyxsW8s2ZL0+U2FkCe1S2pw2Rx9gF2XFCIBm8WZlKwlnIHa+OhCIT3/O9OKy5J2lYfYSE6YGhWfvpDgjCuqQljWsJ9ccr8jRNIW1DptrcUAor0CY8KVZmhIehRE8RMW9vJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb8GPTzOlMmtjkNYOF5FV+rcUlQ7ZKYC7R0qLZd8cpY=;
 b=Qj46d9x9a6Ias64Jz4V+bltmqVilLXmA/fGw/OpNuG9PWHrwHRnGWIG3w8B0B81+EEOui3i5zeAtX+JlevkN5ZYiNNk4p47bEgeEOIaduKComBW7tT7vrcgLoLQ+4pJq/AkSzBw7B8G+KK1HUIQ9535Baq8MxbscykdYeznosaw82FzSZY/ByzVcRwDtHQYlWmEBQyWwyOiueJplgvBOujXO5qt9EXDfb2BmHXhW2kYHo2zNCZr8vBSQhL2vsuAtR35fhfF5SsKbefEjE0H38WqOF96hgGxoUsYBBfv8BR0bg1AJMksRY3saFJvlgg0XMOclaVAcGjNS9zsQg++Liw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb8GPTzOlMmtjkNYOF5FV+rcUlQ7ZKYC7R0qLZd8cpY=;
 b=s74ohwG0ldC7N34rgn9ycNaL4BptdYxZIvJn+T8KDZGsUGLhNfW7dTniiM9k7Q3LAaejsWXIORhAU7sT6Cv0oQbkoIQNZxwPg9zPVqXLp84O+J4qMv/W1JkhVw5OIYSS70dKLM/gb+nVnmD/QrFHQGzTTkQDDDjJiqh3rBBWTelSJ9yBqhrAFwBJdXOl0bqFRoJNNWEIBl+ZT5LKVGi+QANGRGpUcHqduj2yYlsZtSLNQv5OT/PK4O4YtoF/RHVN8ewapWlz0X99ainT4neaoZCtkfJQvN8scUNqJhCy0R3sF3wUltkhd24IGMTqhBPXti3UCrZYsxrUIeBgoeoUNg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH7PR12MB6956.namprd12.prod.outlook.com (2603:10b6:510:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:11:11 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:11:11 +0000
Date: Mon, 23 Nov 2026 14:11:02 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/3] ipv4: Check a Fragmentation Needed
 against each path of a multipath route
Message-ID: <20261123121102.GA3286403@shredder>
References: <20261117193141.27004-1-deliran@verdict.gg>
 <20261117193141.27004-2-deliran@verdict.gg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117193141.27004-2-deliran@verdict.gg>
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|PH7PR12MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: d8571582-d1c7-4251-c2ee-08df495add0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261028144727099003|4143699003|56012099006|10067099003|261102123227099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	r8bQsIiAXeQmCBGQ23ClvYarctJgiP8EP3IwuggVzKOe2UCedvfPMne+KIJookaBH3S4BVwElDuIRLsHh6b0hyNueXP67EsYcTPVeWOBIqN5T5e9VgxU4GGNrJtHL82J7fX0z3tbK1XPzuzXKZ26N/x5g3IYnAt+2gghB57F45vl8kdxkJruorsBH1KiID+6t34QIH92WifR4VS5NmISjPmhMH/ZA8osdVKgo+FeF/hQFuemw7Q45yyj+JM60HByFeiI/1zYtMEro5uxI28hlY+RlvVTVNkdWlsC6c3S2OQwhYtYg7LLYkqa9+GI/WHFkBf/QTmV6PpKcymlRbNge4U6GW0lVI4QzZ1MPIoXcHDtmExLQ4IYodV4nvn4KtsgaZ3Q+xvVOUgka4o4Gf85AJs2X3xavMngjqOBI9N5SCLaXCIqfxferKxGfhQEm/TwpnQ5bJ9ILgJyCWnPOvs2XKLP1saBg2Y3XVEsG46DR7LL77W7g+Rih7sIZqyTVRbsEemDsspaT9v5I948zs/Ne0zNb0B5wuM5vbcLCOH4/IqRm7Q9jMRKZ4rdSXGvssI07N468qg/Whez+XA9zJ3V+JLJNcgAuri9ZkOX7OMr8osu1NiLDC87458onhpDCo/Pb25vHe6ajZcuZ6q3rhjUclkKP80f1mr2O5j9g7ESz58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261028144727099003)(4143699003)(56012099006)(10067099003)(261102123227099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5lbIwDE3nEIY8oFLUG2EJnQVEIDgrd2tVM+H1pGpJCbeSXY/reZH70yWBr3Y?=
 =?us-ascii?Q?o330VOhr5uz6eYqa/J0ktadoG2wbeTel5PplMn9kNLksK/ek5Jmns8/KOkkJ?=
 =?us-ascii?Q?KnkOxEsqxfF6Kh2UTN1Kh2YiXxxlGgxC1//ir+nPzHyXE4LUjyWWyukRoJeq?=
 =?us-ascii?Q?AdjVEhwTh0ZYvtqO8dmVVliRMTjnh9EtC0YfdgdDoF1I8jrFZphKvis5oofK?=
 =?us-ascii?Q?SSavnwzcKhipIt3GD+1/pphMyL8Mie6M2p2jK3QofNDhnliaHIzn3+VEyMBH?=
 =?us-ascii?Q?eaauNxEnW29FTxTPTCv2QUHXddpeOI6h3hqj7E5FlfzEBqZx5H1YLcJPlQcp?=
 =?us-ascii?Q?8L+wv0IWmf2TLnK/std4J8/x/JFTOTnfpO8ORxIcfB4sDploYATibr7xKxVt?=
 =?us-ascii?Q?8ek6aegurOW7G5Lh9eM4cWHuk0HJa96emvPFijO4sBZfurlzAfx5Dn8zcARW?=
 =?us-ascii?Q?+ZWPmBvQKmrFUCO6YHsdLciB7u8gJ5kfbIzuU/juElx+fmevwB8261h6IOV3?=
 =?us-ascii?Q?HA5MDcoK/RU6up2tMPjQ41vfLcG2YTv1g9WPi7065fo/53N4EhHa6y5Md44i?=
 =?us-ascii?Q?4PvgXW4M8E7bRlF8PXEseHLxNaZvFCOTmQt82vwRp0RRQuK5dXcjCnAR7BZc?=
 =?us-ascii?Q?7lejLorZH9MbmrDnR89ttCNiJv8np2LRyhAKc8xhD8Srce92qomQ/iKEigTD?=
 =?us-ascii?Q?QH70zbNz1AK5QgwvvNogYOVib94kPCEQ7SJ5Mm/yKIQ/ICea38UfIXDK0ewi?=
 =?us-ascii?Q?lfMZJleHV6MJ7NdccmPy6rKN5Ivpk+Xk41caIhvsRXYRX2a/083I87E/O3Qe?=
 =?us-ascii?Q?IzZgntIGiPdGG+ACIyC8/EA1v9NZwYCuu7Ed+kW5L2r/dwqeI3RxyfCACt/J?=
 =?us-ascii?Q?UB/kJxDgsnjql8DkfzL2zvQkk2hCp2I3mUTedd1u0lS/zNdzoTvKjtnSYJqw?=
 =?us-ascii?Q?xGXPTQIn9+BSxJF/sVDpl6sZSZsifFdiuX6qcOZ9JlhDicyHYiWsoH2TYFHd?=
 =?us-ascii?Q?sd9of9jHg2sN9k6kFjf9gYYdTMx4TmClW+T8sFYWyu1325zEB9pMHfJWdMR1?=
 =?us-ascii?Q?WSAct9v7wFQw/ks685iOS3SaafggPYOwNzFMzZMU5227cJtBl4ZVxXil083j?=
 =?us-ascii?Q?iAb6ji5xs9zcgJDEuQt3fr9N27rBA6rtzo+RVrLgPgEtwee9MAAqLzD8gnMX?=
 =?us-ascii?Q?Ty64x2uuWnmT9qT8LDkcr40eDMuHRnUkFyFHKzho7rCsR3qo4OBDdjAWFh9q?=
 =?us-ascii?Q?hvu42TtQ+IfIqaMGcNBHxqBC4RnagvyHA9trQwCqLphAQtKKgtRfa1IOaOZq?=
 =?us-ascii?Q?Az/fvdOTF7HxYB+W/QfTeGQsCCDb8l74WCfIVih7/wP6ATG9KekAefNDsIEP?=
 =?us-ascii?Q?e19PClMaNio9MMHCZHODy6RC8ry+Y9W1xnllIF2Cptyw2L/6d6nFiZAReLpq?=
 =?us-ascii?Q?smb+W2b8WDjdCr42GwsmOOI1E3fW8U8y1z516Rt0uFWUxDnvzckslICflzVO?=
 =?us-ascii?Q?xSEUm4uu6DFqTPr3y2xuqjGosOgPiRMsQDjVVFkzyrCgpJ4yP7leCcp14KMa?=
 =?us-ascii?Q?6yQvvhfIStv4YJOo+ZeyCDr5LxQiIrdM17WxsbOW1Eej4u8MW1FUVbw0tF3e?=
 =?us-ascii?Q?eVmo1NM1UmLqXDCBJ9SVfFVCPDGYdKukn0ZpnoQGjaOnTiKKnbZMW/hlDyVR?=
 =?us-ascii?Q?iujM8QqVN/BG1MGFyIulRMDxPsUQseXX+lmoc9MbAzlL56h9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8571582-d1c7-4251-c2ee-08df495add0e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:11:11.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0T1e1cc/z1UnxwQ/4o1N6b/jgQpGdqdXcztu9J4M8+FY/eFJ0+y+vgCZP/yht4wQW3UydMNpq44vQ5ToFXd+cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6956

On Tue, Nov 17, 2026 at 10:31:39PM +0300, Vladimir Vdovin wrote:
> Since commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths
> if multipath enabled") the mtu of a Fragmentation Needed is cached on
> every path of a multipath route, as the lookup for it may land on
> another path than the one the flow is on. But the mtu is still checked
> against that one path only, by the early returns on the looked-up dst:
> 
> - a path whose mtu or pmtu is lower gets a pmtu above what it can
>   carry, its flows blackhole until the exception expires
> - a mtu locked for being below ip_rt_min_pmtu is written as is, over a
>   lower device mtu or locked pmtu
> - a looked-up path narrower than the mtu, or already at it, ends the
>   update before the path of the flow has learned anything
> 
> Check the mtu against each path instead, what it uses now as ipv4_mtu()
> reports it: cache the mtu only where it is lower, cap a locked mtu to
> it, leave a locked pmtu alone. The checks on the dst stay for the other
> callers, sockets and tunnels, whose dst is the path of their flow. A
> Fragmentation Needed that changes nothing costs the ICMP callers a fib
> lookup and a look at the exception of each path.
> 
> Fixes: 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if multipath enabled")
> Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
> ---
>  net/ipv4/route.c | 90 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 63 insertions(+), 27 deletions(-)

This seems too complicated for something that should only happen with an
unusual configuration (nexthop devices with different MTU).

Let's say that we have a nexthop group with two nexthops:

A - device MTU 900
B - device MTU 1500

And that the PMTU to destination D is 1000. AFAIU, there are two cases:

1. We get a PTB and look up a dst entry on A. We see that the current
path MTU (900) is lower and return early without creating an exception
for destination D on B.

This can only happen if the PTB lookup hashes differently than the flow
(e.g., non-default hash policy), it never worked (even before
7d3f3b4367f3) and it also requires the PMTU to be between the MTUs of
both nexthops.

2. We get a PTB and look up a dst entry on B. We resolve the nexthop
group and create an exception for D with PMTU of 1000 on both A and B,
despite the fact that A's device MTU is lower (900 < 1000). Packets
destined to D that resolve to path A are therefore dropped.

Like the first case, this case also requires the PMTU to be between the
MTUs of both nexthops.

The second case can be fixed with something like [1]. The new IPv4
selftest passes with it and fails without it.

Can you send [1] instead of the current patch and mention in the commit
message that the first case is ignored since it requires a complicated
fix, never worked and requires a very unusual setup?

I think that patch can be targeted at net-next without a Fixes tag, as
even the second case requires a very specific configuration and nobody
has reported it.

[1]
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0a5f6d77094..205921567634 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -1085,6 +1085,8 @@ static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
 				nhc = fib_info_nhc(res.fi, nhsel);
 				if (!nhc)
 					break;
+				if (mtu > READ_ONCE(nhc->nhc_dev->mtu))
+					continue;
 				update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
 						      jiffies + net->ipv4.ip_rt_mtu_expires);
 			}

