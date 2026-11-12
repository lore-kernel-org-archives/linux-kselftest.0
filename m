Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794503607;
	b=c5cfpIXGzb2Tw5et9T+SyuyqX32CyFhWD2T7/b/a+CXPvbdHLdYUcpHMUPb/JiOBpXwk
	 V1n1er4df7AdstUUHAtNTc+KxN9/gBVQgk0cnVQet4yRpXe10LqI13KnHvO2JkSzwlUvZ
	 w+FlwmMKZ2VUsJc2iOHPqS4DdQlscHLQwIcHE8vijiA3vuJw1wF4tUwBAXR45JnibKBhr
	 Iu9A9VveGl7LGZmZBxU+GSEyeS9LjvBGKBnHKbXZi5k+YJ6cHse3e3EAe3sUeh3s/q3+0
	 p5f2OYcM1b6FraiX9inptli5Rr8pHZioVQWKaMs2w74a57xy5P/WfIaoDqAudrcSnhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503607;
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
	bh=3pjLuzTZKBSxNkuzYvL0MIfzchIg/11+tj7ZdHL9Z4U=;
	b=1uXN9G35eK82ddedk9FIlONRQlmjQxXKbqAY1MFG2GvoDPz6wTKU9yT2EZ8L4Bn4kUso
	 PRyetOGAa77JbfqqWdW8vsDsevMB9IIRkX8MR0p8j0FyFSiflpRZykhOY97CHthaON1z1
	 iGt1xIsTp7ghITgNr52sdbK3EO6BUjfxv73lUqdNo0w2gKUCOtfE7rDEin532RcyjBa79
	 TGC9sdyypzxXOMOX17ErUjdXc8aZwtoYR9P4H6n+G1LzW3P7joxCn1/0vk4aYr5PmqNUH
	 txheo9vI3wHAz1sZZnYwPdQtn6B8IT2Bx8PPCvNBnpaeSVHQeZLQmp+fzc1He6/1TLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iipr46Ev;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.54
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EA606A33B;
	Thu, 12 Nov 2026 17:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50EA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iipr46Ev
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N47J2gKOwaJ1EHUxiv1QivXZ4qEU2tdybI/7dpT1bBR4ZVepAiXOy1R6I0o9wtxPbYh92rQbAlUepwTGzUOLSYRLocZHf4GcdOhpryusjp7ZWcVHOfyI7/jAnabnXaaESRby/uNFqUGY2NUBqUFrZKvEjv59ZoHaDR87Cij1WY19Nry/bh++FTNLwGbPIEyiMGuu5TI33nn61XD8A75TGe5K6yU1UNWFKHWyVZooBfbdEN5dNcVt5+SnDDbdxkrCtb1TKp5haIlGr0i+9yjaNzoLVGwq8OROj2OyztCCHFjxcnZOL0IYm0bhE6VfQrJvbH5ceUIJEpELljjbxR/J0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pjLuzTZKBSxNkuzYvL0MIfzchIg/11+tj7ZdHL9Z4U=;
 b=MvWmxkf/0sVBBRA2q5DJWxE8PQWIqmmXJudZb5gLGMwA++/xFCeUUoV9+TOICTnfY7p3PiToZV8tsV4AQK9gGZlS6KG0EJ3/ZRIbycuz2fsNn74BLcj/urVi1BGhh9fbOJeOvF8y6CRy6BpLKNVXGTbqVjKXXtV70evpNQcQeH9yI6+VJs1i+QV5y0Ty+UJvGRbGAV78WXpUpnjNN5YfJKjHdwSfiBQgCJcWr5zQwVStoVoGM+qKXElHiCj6+PeLm6fJj4PXcZ5P439uueOuUS9Cp9o6yBgBiuScPyqxt7dCcyEWuLIx8e9f5087ZUSfh9qoV4hFcjV6HEY66z8b8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pjLuzTZKBSxNkuzYvL0MIfzchIg/11+tj7ZdHL9Z4U=;
 b=iipr46Evsqd86w/ONJXqEtxYogwHxhYx0pkddlgqepg22glvV6TLtvG0bKaZ0QD6Lj0IDUxoaAV8qNyGIqWQ4kH0ef5+1ximgdO39HEJqcjhu0vRAWF1zVPuaksWA8O9LuGpRgec8OFqdt4du133uuEeowTZ66zgW40sQa3nG7hrPsij4/lDJBFPrJk+HeP4XhCp5+ViYcd8B2BYIMHhsgtGZ7OhmQRqugUfeRqt8PwA+1I/v+ome7mEN5w5DWADdOsXWaNJQdZRW65wbRcucVdASnNSWYxe8zbqlg9v9JSoeAtEYi8ugifakDFvnZHLlZ3JxaebuCqofWVBsBkirA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by PH7PR12MB7913.namprd12.prod.outlook.com (2603:10b6:510:27b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 17:13:22 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 17:13:21 +0000
Date: Thu, 12 Nov 2026 19:13:12 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	liamsmith827 <liamsmith827@proton.me>
Subject: Re: [PATCH net v2 0/4] ipv4: restrict on-link fallback to lookup
 misses
Message-ID: <20261112171312.GA3335168@shredder>
References: <20261110061536.10811-1-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110061536.10811-1-liamsmith827@grapheneos.org>
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|PH7PR12MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e113ea-edfd-47c7-8a0c-08df40e040df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|10063799003|3023799007|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|261021135927099003|56012099006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	KUHrD6PYLrRwgbZQC9k2MKw305YCdn5DtwFgj2WrVeTrVfbxlIfFL/fO9nKlow5Lz74sQbK2yRYjaGqkzbjAyE14HGx3AE7DsrHochwU0k40UKu0wMvhqazbrF1vnDw2UQZlzyQSFvnhBjmUYgPCdeGLn3AwxOLQVMKWDAqXYEcNNBsJ4JfW38YJ9PBPNaMrxXzBimEeSeHXPMymkkNmSOa3OOuiEPwKJvviqsQ0KeKMwZXD397HUqh73pQa8FsP0DpS9lUOCqLoba8jxTSdRUw7o0v9dHmwPycHaWI/eoUowDWWlAPYzPosrNyq4ep5n4e3KgDoGfduG5l1I851YXBbwmntnRqDC19MG6P8AxZFkBTbxFkc2HlfKSNUvsqkK/Fqcb0208aLtnn7XfHiXwyjh/iY11Vj4UBpre3Qf8UUFphuPYET2S06yoK4/YMCv4H+M1aYtrrPOS6wkjr2GhK5t4/PX748LDr5suAB/eQhbGgr7lI80PJ5cQ9wbbt4ph1HAmJFQnbQMfqFYPrmMANQE45G1Fr55iPviAOHop0DmnB65iZBFfyRQ8VcHVRLbezE5amQHl2LyZpSZJwrpH98V4rz2TiCMOz1TQIpDLOjGyc6fY7sraIp2UMtCBLAIZcG5njwHPSRuluGiyQHU/xZFilRYZWg725fPq5D6fY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10063799003)(3023799007)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021135927099003)(56012099006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nVcpnoYlEDkROzD6CrL5DDyNXv2AFYc/5sRquI4xrMBn0kAdOv2EGU+5UblX?=
 =?us-ascii?Q?fbX3CxsDEuABzEfG9Jmdl1R5iFfvkxvLr7cAHv16v7iec7lognvxWKHSaqHW?=
 =?us-ascii?Q?C7pIPQWUa3mPBL2HWYbCJ/wZCoNEcJO79DcAbJ2N/e+gFu7oxBLye0aZO/if?=
 =?us-ascii?Q?Yy8nqHFcAceLzBKlqZkC74cJIt6aemrFYmqlqS+w73+5fINY45T/2PPqq8lu?=
 =?us-ascii?Q?lODEp+WOj79wgQ0b5lqikOAIclS8bGmrEYMYUuTZXAWgYN8wtA5Ha8acriUd?=
 =?us-ascii?Q?licWnk2Bmp9H1R3mt4pFEa2sZiTrqg90knjOGpCD1PpFqjUqSBAK1W3i89i3?=
 =?us-ascii?Q?TWGDb3Vlytg4tALP6a2XkUZwwi7i+YYdcZg8aj6X7BMZqVbqQebtP3m5W4Nv?=
 =?us-ascii?Q?7fo8Q+EVNIvVqqJxZXSDpGgl9v3gXIHWgwxf5aNqxb0vD4BhbV1GOJlv3QcG?=
 =?us-ascii?Q?oDGdgP3HBzgPSGVyHA8m3uln/wNV9G2s0s7lJDq/OPFE25FP777Gs3imGv+c?=
 =?us-ascii?Q?rUIQh606vAyw7khxtkZxdh8JMBG8VZjNJ/PqKJ0tV7LIS0snFrpprvRJYpaZ?=
 =?us-ascii?Q?ebjzUNnMSSXhdaq74ktRwDEnTSdL40RkCl8t2BBi3B00eVXjfAnd4gSXIm3/?=
 =?us-ascii?Q?wCQsrnwvTALDWHUJLSHlL3Zs5W+IIkUpTA+gKN7P/V1SsgwJ3NxjlixbhwGF?=
 =?us-ascii?Q?LhE0se5KwdDs0gx0gFdxXkFPiH3D4/E7M+x+Fa+lve+3NvMdy63zzD6IqXJr?=
 =?us-ascii?Q?aLXSju731uPuow5R1LURpqLtrsdeoMW9rtvM/uxtlCQmO2btR33tq/idHUEe?=
 =?us-ascii?Q?OWNtb86CG/O6gfrdBzJLod+8IH9ATFA+s6j2aYbw5s8yC4C2pHwvTOm4aaH9?=
 =?us-ascii?Q?QataimCUQlGHpeda6eN6jx6Zbm7R7dFQcYc9Mt9bKJW5pFg/W7/+KNFvJsle?=
 =?us-ascii?Q?vvkDkwkWmI8pq2bRstUG8YWrP35VUWExT8/61MAjqLKfYvtp0FKLfMPvhUpx?=
 =?us-ascii?Q?z1HiCUy71hOs4GVSW3D6/aJ76xydpvVYGWmEs/1Y7vqRonsIt0f8pGgg++0w?=
 =?us-ascii?Q?9VxT/yBTItn270bcB4oBtWzXl9/th/rc+14TEcNMLYqW4oUeq14g6df4GdqC?=
 =?us-ascii?Q?EcGxlx5pZj9d8z6m1zH3Nr1KzIszKEAtjLEqlsRAxY205hpddZkGH4o/qIzP?=
 =?us-ascii?Q?/QzjLCfBNIE7SlcupwmsLe+V4j9WuD9O8sq5r51BCgOZHU+GNptQFeEieY1r?=
 =?us-ascii?Q?tA80QpuYrHOvSXjZE9I/VgMDM3ed2lL5wgYcHnyB0mM1ylbAM98N03HBFQ1i?=
 =?us-ascii?Q?jie8fFbsCXi2dkLRmJZ6gvy4XqHygvFgxcoFQo60qhdamI3dYs/8X9J5H9Us?=
 =?us-ascii?Q?SRO+bZZXMri5/H7LQ9mQguPZF+CUs46ze9F5FRocGU2zW9CxkpnncuVebk6r?=
 =?us-ascii?Q?y+s5lRVP9a+xv/v/jV9q5mscHGcuoAEhWOoUGlIKSH/ao7FSPg0r7yNuNHgL?=
 =?us-ascii?Q?8QXReDRyzCqWcRwlkucmde0w/nNA8dHGkGK9i5/ghAymcduM2kMxJG1Tf407?=
 =?us-ascii?Q?Q4Ux90F+si8Ojvc9vWJnZEyPR1HhCEdJzen5uF+3rsWEu3c7yd3D1oT/ooU6?=
 =?us-ascii?Q?xXEkIU320wTpjWvKHAJhBSEazSLpv3W0XnvxRYjHBPJPcsR+zY3OLHduX/dC?=
 =?us-ascii?Q?7KI/AsM3npmlMhB90PMXNmx/ArTffUh31+LkSGAvIlNpW+ay?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e113ea-edfd-47c7-8a0c-08df40e040df
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:13:21.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVBLRmtQa+8tzpN0xMH+BlYhqfRcbFdunkpZqivopPcsKq61Lim4uwHXxCww5emd3c1pL1sajCxYGk8bAvCm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7913

On Tue, Nov 10, 2026 at 06:15:32AM +0000, liamsmith827 wrote:
> From: liamsmith827 <liamsmith827@proton.me>
> 
> For non-vrf unicast, the on-link fallback currently occurs regardless of
> the particular error returned by fib_lookup(). As a result, routes and
> rules that are supposed to restrict traffic (blackhole, prohibit,
> unreachable) are unable to do so comprehensively.
> 
> A specific example of this being a problem is within Android, where the
> VPN "kill switch" is implemented with prohibit rules. Any process that
> can set flowi4_oif (SO_BINDTODEVICE, IP_UNICAST_IF, IP_PKTINFO, etc.) is
> able to utilize this fallback, meaning unprivileged Android apps can
> trivially bypass the VPN. This is particularly bad on cellular networks,
> where ARP is often not needed.
> 
> The first patch adds FIB_LOOKUP_REPORT_MISS. IPv4 FIB lookup maps a
> routing miss to -ENETUNREACH, which is also returned when an unreachable
> rule is encountered. This flag prevents the mapping, returning -ESRCH
> instead.
> 
> The second patch uses this flag to restrict the fallback to routing
> lookup misses for non-vrf unicast. The fallback is still always taken
> for multicast, regardless of any restrictions or misses.
> 
> The third patch updates tests now that the on-link fallback has been
> restricted to routing lookup misses for non-vrf unicast.
> 
> The fourth patch replaces an existing comment which describes obsolete
> fib_lookup(), MSG_DONTROUTE and IPv6 behavior.
> 
> This was originally observed on an Android device, by way of packet
> capture.
> 
> Tested fcnal-test.sh in UML with CONFIG_IP_MULTIPLE_TABLES both enabled
> and disabled.

The cover letter explains the problem and the solution, but it doesn't
list the user visible changes and doesn't explain why we think that it's
safe to make them. Something like [a].

> 
> v2:
> - Restrict the fallback to routing lookup misses, instead of only
>   honoring prohibit (-EACCES).
> - Add FIB_LOOKUP_REPORT_MISS to differentiate a routing miss from an
>   unreachable rule.
> - Split the comment update out into its own patch and remove the
>   signature.
> - Enable all of the commented out device bind tests in
>   ipv4_ping_novrf(), add a route miss test and update the UDP test
>   expectations.
> - Target net instead of net-next, add Fixes and Cc stable.

All of the patches should be targeted at net-next, without Fixes tags
and without stable tags. The patches don't fix a regression. More
context here [b].

> - Drop RFC.
> v1: https://lore.kernel.org/netdev/20261019032406.88874-1-liamsmith827@grapheneos.org/

[a]
"
When an output interface is specified (e.g., using SO_BINDTODEVICE,
IP_UNICAST_IF or IP_PKTINFO) and the FIB lookup fails, the IPv4 output
path ignores the error and constructs an on-link route via the
specified interface. According to the comment above the code, the
intent was to allow sending packets via an interface that does not have
any routes.

However, the error code is not checked, so the fallback is also taken
when the lookup hits an unreachable, blackhole or prohibit route /
rule. In other words, these routes and rules are ignored when an output
interface is specified [1].

This is a problem for Android, which implements its VPN "kill switch"
using prohibit rules, with the expectation that packets hitting such
rules are never transmitted. Unprivileged applications can bind a
socket to an interface and trivially bypass the VPN. This is especially
bad on cellular interfaces where neighbour resolution is not needed, so
packets can reach any destination and not only on-link ones.

Solve this by only taking the fallback when the lookup did not match
any route (i.e., a miss) and returning the error to the caller
otherwise [2].

It is currently impossible to distinguish between a miss and an
unreachable rule since they both return the same error (-ENETUNREACH).
Therefore, patch #1 adds a lookup flag that makes the lookup return a
different error upon a miss and patch #2 uses it to restrict the
fallback. Patch #3 adjusts the selftests and patch #4 updates the
comment above the fallback.

After the change, a packet that was previously transmitted on-link
despite hitting one of these routes / rules is no longer transmitted
and an error is returned to user space instead. It is unlikely that
anyone is relying on the current behavior:

1. It is a side effect of not checking the error code and it contradicts
ip-route(8) and ip-rule(8), which document these routes and rules as
dropping packets or generating an error.

2. These routes and rules are already honored when the output interface
is a VRF device or enslaved to one.

3. These rules are already honored by IPv6, which does not have such a
fallback.

The following is unchanged:

1. Packets can still be sent via the specified interface when the
lookup does not match any route, which is the original use case.

2. The fallback is still always taken for multicast packets. This is
required for multicast to work in a VRF, where the lookup hits the
unreachable default route in the VRF table.

[1]
 # ip link add name dummy1 up type dummy
 # ip address add 192.0.2.1/24 dev dummy1
 # ip rule add to 198.51.100.1 prohibit
 # ip route get 198.51.100.1
 RTNETLINK answers: Permission denied
 # ip route get 198.51.100.1 oif dummy1
 198.51.100.1 dev dummy1 src 192.0.2.1 uid 0
     cache

[2]
 # ip route get 198.51.100.1 oif dummy1
 RTNETLINK answers: Permission denied
"

[b] https://lore.kernel.org/netdev/20261030151629.GA85001@shredder/
