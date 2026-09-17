Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A2A4B8293;
	Thu, 17 Sep 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640069; cv=fail; b=TfMP4zCleiAZjinOjVxWGDjUqpEdO6YlR9OHCG3v7Jl8AJoX4brPGyB3KWNFiiGZoUDw/9/jSulsLmRIuoZ/e76Kp1fxgGTFOo9YK1AryriPj5RKw+6mDqjpRW9vmNXeIQa3Gv5TVi/tn0/dYMTj0tvqMQacl+Ltf1jGuRvmiKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640069; c=relaxed/simple;
	bh=1Wsi4Q1Oxw7RpcPkmuwU2w6YrZgWf7cLpILVWdG63Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uKRjEHf+F1kzLUUDxJ1mJar9ITl1zbI+KcF0GDpNCurba4z35vUECjE+XpmQW0MdZXorz90ODs/BqMwxUpB8sX1O/jF6hfCNAxeqm3/9AJrhaGtEsZHEjB1TKwJBnYO2pbEUKBrxGBQHkIsmTGW5TVnCyfJrdksNR7gsSydWp8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hPZB/8e2; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hPZB/8e2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE35saoQsJOJvJCc6M48kQ8d9WDo+cCGO12HtqQ/UytnkQgfhnr8io+RjMtU7ucAP93eHiBfvgTUYZHqTBAe0f7WjSDvc+eTZFYTwcsGwBvew8/kwcCLBbmdGHpFTd50OUZ31X5qx7oxIeES+7f/F76eykYeTFn5br1SFc9B22y/a4Rh1vOk84z6wbxZJknd2vcosnkN2itVSxi/KlI43j58pQxlrBfqFQK8tXicd+vXx9ZU5c9tqdRRtj8iclaD/EnHdWqBAdcm2TuGaq8jLqzULhHDxZwCs2/oXdwfxuiIBR3sICtR6+QmiIvrHShgnleSHh4vXsLPdkp+XvxbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7qvkGi+xakqT9aGCHob/5o5hvCFX46Dgexhw47mMXY=;
 b=yClh2OgkFeDPpjS5dd59QXD/ypFRfJ5KYJWlZtV+Zfaz6LbJCui/gkS2bZOXjcMZ9DYNnt3d8poPISle5xhjPliDlBreclu/GgD07Xinm5ZmQKvqIBvrXYk3VX3Uoy+C2kcpy/WWeljGdwgUA/aU/SqkMTD0aFreR8l5a3gOyHFdfEVm7rTLLxVkkUax68+37TfEhFY8Ze9EHH6E8WXdKyCeZnZ+I9rdKdDbhmkkIzq5WumWRTiU+bn4emAj6+H1A1ZpMFgZ1uFJXVQgC3fpjS/VGR9LqOI2BhEsHycpKY9qwtNY5dKvyd+CnuPZBPZEG/C017Sp74foU46KVJmdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7qvkGi+xakqT9aGCHob/5o5hvCFX46Dgexhw47mMXY=;
 b=hPZB/8e2txYZjaObwF2VLMH71tb7Qc08S44B95N9nw0Qn4iScFX4RJgfAbX1tTLIKvluGuPzsjRQbsSH7Ly/jsUhNuQbXAnfvh1Q9QKQ+LGJ3YuObsZjJ2MFKiCJa670Xms4whTJT9Ld0e/rYg3uvakngIf9DrbSWxX/NOwqqgVevtw30NT6DPypfjc6CiISHaf8/z0uyKxWEM7ALoVterbWSw5og0Mj/O9sH5o4BZvX2xqL6M/JSTxr4XvxNUoPhDYdXJMawenqHNZEtEFMgZsM1KlcVqpcNaqHu+JjT5W3WXvYJB7t5vpariw7ZYVsL6WSMHa6pVZsoSzxY3RjSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 10:14:16 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 10:14:16 +0000
Date: Thu, 17 Sep 2026 13:14:05 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Chris J Arges <carges@cloudflare.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net-next v2 2/3] ipv6: hash uncached routes by device
Message-ID: <20260917101405.GA1202580@shredder>
References: <20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com>
 <20260914-hash-bucket-route-lists-v2-2-29f6297d8a5a@cloudflare.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-hash-bucket-route-lists-v2-2-29f6297d8a5a@cloudflare.com>
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a4066f-5afd-4472-bf22-08df14a46dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|4143699003|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iZXXdWIv76hWNcu2Z0vfHQC/Fj8V/IypGxfoEDax2ibNZPwSWP101hGo80+Ay84utra7MmutYHV3iTjJgJ0TXQRi6OC3WaqpPupBQG1TGjs4P76NRsLaFQe5WqJHWSvA2MjJ37SbEYIAcjcG3iWGSTR+90R9wpaZqwZQ8fvMoTj0+P4RYGb+rw4Hz//wCA0X8WpVvenlJT1uAraDP+eRoQLKMjyb7uv/HN7d5c9BrGyIciziN4zv7eamK8LY+ND7q0TRC74QfJopZCghs/9jrFQWNkpiXNGw5EYC7Hifmp3GQRNJ/zGQhUW8vAY2iGbRVykBuZqH5gJ3kEeiIOwnCJZZ2rKWNeAelkR2/zHlX74A2krQbp1xIVo/AVn2c2brKPk26OlY0oWYFitxrNjifE58G+tRjJ1vcPj6qvI7pAk2Q5d3+0mlMH1/wMNuMkJ1FI1em1twxU/OcF/HMItpqwpaEKoqg9mYL+53bflMA4R3n+Yg4lRp1f+z2T+bVzPdGCZCy8MEkGMYTTLhJmlYDKS7oJ1PRjx6gsPik91wj3mKK8nb0BTfRLKEXhmLHHLxvf+G0oCNtSm0eBYzvNH+n0QN1KPaWdoLLtGKaDlOhdn3hTc5nomvhfUfj9YPlHP7UxpO5MxWp8jV3/vqe60zWjyG4CCbSH3yur/l0UcROtE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3l4YToU8xL7u1TRdw4Gkkl7s+WV0o3QbFaOKGeGLN9iC6tnBH52AV1n25LV?=
 =?us-ascii?Q?aj0VE3frduW3dtBcgwVIPes6L4VPHcfFRYdZv3CSJxQM4WTsQGciUWaM0Dvo?=
 =?us-ascii?Q?/uDWy39xfTXfFelDZoJjEZaciVW1F+izhP6FBI2wxt/m8KCDIjRqRsrx24Zw?=
 =?us-ascii?Q?C4Lm7eMumPm4G3JOz5DJ2hu4JrKZoQP+CgpTRhHz9LCPvxHCW/3B2pRR+fAC?=
 =?us-ascii?Q?ORC2S5RcV+ocIwJO5FN63I9K3jycxJp+WHWmiXyVhe4mIqdYTXvX4rwoTIwZ?=
 =?us-ascii?Q?ApdfvQBHKyEYDMU/ky5hcyJ048L/vaPBcuIKcPD0SGIlVWjWtGpE3YvNGxo3?=
 =?us-ascii?Q?nqC+DfrVirc0m8usCDH8TAjDm6+XNH0rWWkPxfKRTqC1265NYhgY45zN57lh?=
 =?us-ascii?Q?loA1QJ9REObySFc4qMmwcUJw89QLTn5C6Shoa34Rgq5CUuv7h51QT/qxGWdu?=
 =?us-ascii?Q?ahEprE8d+BkUgDqo82bsb85DpsobH5D0b62S+957fOClABVHAQ6I8LAok3sm?=
 =?us-ascii?Q?UFcO8mVvUGTd+tUH0hXOwAZrlcKsP33E0zynKHAgid0/38lLRGEHBm0fAIla?=
 =?us-ascii?Q?qGd/hcYoLpzodZEME8f65EqqMbOAGi0DaAAKnR/ixFuppOpHnqQDbr6sU2GO?=
 =?us-ascii?Q?aCsyu+ao8SEN4/nuYGSW9UVCPuDoXu6e8b1SIJFkI6rmFK2SyqtkEK+XTtQL?=
 =?us-ascii?Q?YDk6tkGe/DdQZ9HQxX90p/TkxdkdIkl0fACicKN4ajxcmGF4Wmp5IuZgXgQj?=
 =?us-ascii?Q?iNynplf/hHUaNlUCi/ncaNDwqDiY0SmRXCJzghERpYKG8eIMX6jyO0AKq7VZ?=
 =?us-ascii?Q?lXdtRq7tDn6WaF9IZR+pgk1wW+kPSLdtR7kobdhHiCB8min20TuTAddBeBCV?=
 =?us-ascii?Q?1NcozayborQqg2joJPJFUxkzR093krYN6FyQXfOT2Mumu1YE5gnggX/5QhTm?=
 =?us-ascii?Q?qO656nbJ6iIXtN0C8qfTeXPBg7etrucxo9n/XQg1qlZSG4B0/j77g7A6gBC0?=
 =?us-ascii?Q?+fL0Gbwg3qJp5OX4DQCR5jjooM9JQJ5tvRiLT4wPBxry4bw7EPMjTOjvE7PC?=
 =?us-ascii?Q?CkDaV7bv5K+B6EcrK+kC7MK4vv9Dcpv2i9Qw7MIo8958yg/N93eNONY1Psuf?=
 =?us-ascii?Q?K1S1cwlgto8j/dZGzAoYj0kCXVHmeAgZCPrdiiW/b0iYoOxUBj2lskgR3CjV?=
 =?us-ascii?Q?SdISo3L8LPAX4/JrN1Wtk05lGC47ZN5iBv+XsFlfL4Pl7GwPTS3tQhwd7MBr?=
 =?us-ascii?Q?4TpuFByFQu2e/UTwokONz11yM4vRksI/GphqHxSP74F38wB42ewAznpEDRAY?=
 =?us-ascii?Q?hzRjaHqWs1vvd1NrfD+bKUcflDF0kq2s6nrlbZewNar9owGTNp6qELYMwTVH?=
 =?us-ascii?Q?AzB5Yt/0RKvPDFPm69iZn6L8u3zUiv0mVjtj6e0A572Wjnf37DcV7aNx78Uk?=
 =?us-ascii?Q?JPXo9m+LUkqPGjuxEIx0qtnPD5Y7X7KoxbubIj9zDPGeKVl8tlrQV9Ohyn7P?=
 =?us-ascii?Q?G5iktkTowp0VEFSoS16fz7woC90ZmU0g/iqjwzrs3xeZjPgqsklesaujL3wZ?=
 =?us-ascii?Q?DpqG3BtO59+PovXBv8NDDCSLapJCupnzdMIWz6Hw9AXFiJLyqv54GFf3np/N?=
 =?us-ascii?Q?bUId0KI/d83o2Jppe4rDTqM95Gmdxn+pjH4TNnBXAFBQkaPv5tVRqjnFC6KS?=
 =?us-ascii?Q?l4DyDx3a7vO8ZNkAmQLQOI+u22jb7/et5+/zZ/tQOB0mnBil18CVRfbtsooR?=
 =?us-ascii?Q?LxFlma3IMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a4066f-5afd-4472-bf22-08df14a46dd0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 10:14:16.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH//PQeRlkDARQOaBlZh4IvkfSFgkSPIK0ExM8M878UNMEkS96Gv5zqqmEW557Sdn0G9EaCZz4lohtP7pYPkuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470

On Mon, Sep 14, 2026 at 09:03:36PM -0500, Chris J Arges wrote:
> rt6_uncached_list_flush_dev() currently walks every per-CPU uncached route
> list for each device being removed. Hash uncached routes by their inet6
> device so ordinary device teardown only visits the matching bucket on each
> CPU.

The code is doing something else and hashing using dst_dev():

	struct net_device *rt_dev = dst_dev(&rt->dst);
[...]
		ul = &table->buckets[hash_ptr(rt_dev,
					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];

> 
> ip6_rt_get_dev_rcu() can return loopback or an L3 master while rt6i_idev
> still refers to the original interface, so such a route must be reachable
> from either device. Place those routes on a separate per-CPU list that is
> always visited in addition to the keyed bucket.
> 
> This avoids growing struct rt6_info while filtering most unrelated routes
> from ordinary device teardown.
> 
> The table has 2^CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS buckets and defaults
> to 64. Larger values shorten each bucket, but every additional bit doubles
> the per-CPU memory used by the table. The default costs approximately
> 1.5 KiB per possible CPU on x86-64.
> 
> Signed-off-by: Chris J Arges <carges@cloudflare.com>
> ---
>  net/ipv6/Kconfig |  13 +++++++

Same comment as in patch 1 about the Kconfig.

>  net/ipv6/route.c | 102 +++++++++++++++++++++++++++++++++++++------------------
>  2 files changed, 82 insertions(+), 33 deletions(-)
> 
> diff --git a/net/ipv6/Kconfig b/net/ipv6/Kconfig
> index c3806c6ac96f..0253178668bd 100644
> --- a/net/ipv6/Kconfig
> +++ b/net/ipv6/Kconfig
> @@ -18,6 +18,19 @@ menuconfig IPV6
>  
>  if IPV6
>  
> +config IPV6_UNCACHED_ROUTE_HASH_BITS
> +	int "IPv6 uncached route hash bits"
> +	range 1 10
> +	default 6
> +	help
> +	  This option sets the number of buckets used in the IPv6 uncached
> +	  route hash table to 2^IPV6_UNCACHED_ROUTE_HASH_BITS buckets. The
> +	  allowed values select between 2 and 1024 buckets. Larger values
> +	  reduce collisions, but each additional bit doubles the per-CPU
> +	  memory used by the table.
> +
> +	  If unsure, use the default of 6 bits (64 buckets).
> +
>  config IPV6_ROUTER_PREF
>  	bool "IPv6: Router Preference (RFC 4191) support"
>  	help
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 7535b09068a0..080dce329168 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -40,6 +40,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/nsproxy.h>
>  #include <linux/slab.h>
> +#include <linux/hash.h>
>  #include <linux/jhash.h>
>  #include <linux/siphash.h>
>  #include <net/net_namespace.h>
> @@ -133,11 +134,27 @@ struct uncached_list {
>  	struct list_head	head;
>  };
>  
> -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
> +#define RT6_UNCACHED_HASH_SIZE	BIT(CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)
> +
> +struct rt6_uncached_table {
> +	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
> +	/* Routes that must be discoverable through two different devices. */
> +	struct uncached_list mismatch;
> +};
> +
> +static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
>  
>  void rt6_uncached_list_add(struct rt6_info *rt)
>  {
> -	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
> +	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
> +	struct net_device *rt_dev = dst_dev(&rt->dst);
> +	struct uncached_list *ul;
> +
> +	if (rt->rt6i_idev && rt->rt6i_idev->dev != rt_dev)
> +		ul = &table->mismatch;
> +	else
> +		ul = &table->buckets[hash_ptr(rt_dev,
> +					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
>  
>  	rt->dst.rt_uncached_list = ul;
>  
> @@ -157,40 +174,51 @@ void rt6_uncached_list_del(struct rt6_info *rt)
>  	}
>  }
>  
> +static void rt6_uncached_list_flush(struct uncached_list *ul,
> +				    struct net_device *dev)
> +{
> +	struct rt6_info *rt, *safe;
> +
> +	if (list_empty(&ul->head))
> +		return;
> +
> +	spin_lock_bh(&ul->lock);
> +	list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> +		struct inet6_dev *rt_idev = rt->rt6i_idev;
> +		struct net_device *rt_dev = dst_dev(&rt->dst);
> +		bool handled = false;

https://docs.kernel.org/next/process/maintainer-netdev.html#local-variable-ordering-reverse-xmas-tree-rcs

> +
> +		if (rt_idev && rt_idev->dev == dev) {
> +			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> +			in6_dev_put(rt_idev);
> +			handled = true;
> +		}
> +
> +		if (rt_dev == dev) {
> +			rt->dst.dev = blackhole_netdev;

Please use:

rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);

See commit 1469773b246a ("ipv4: use rcu_assign_pointer() in
rt_flush_dev()")

> +			netdev_ref_replace(rt_dev, blackhole_netdev,
> +					   &rt->dst.dev_tracker, GFP_ATOMIC);
> +			handled = true;
> +		}
> +		if (handled)
> +			list_del_init(&rt->dst.rt_uncached);
> +	}
> +	spin_unlock_bh(&ul->lock);
> +}
> +
>  static void rt6_uncached_list_flush_dev(struct net_device *dev)
>  {
>  	int cpu;
>  
>  	for_each_possible_cpu(cpu) {
> -		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
> -		struct rt6_info *rt, *safe;
> +		struct rt6_uncached_table *table;
> +		struct uncached_list *ul;
>  
> -		if (list_empty(&ul->head))
> -			continue;
> -
> -		spin_lock_bh(&ul->lock);
> -		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> -			struct inet6_dev *rt_idev = rt->rt6i_idev;
> -			struct net_device *rt_dev = rt->dst.dev;
> -			bool handled = false;
> -
> -			if (rt_idev && rt_idev->dev == dev) {
> -				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> -				in6_dev_put(rt_idev);
> -				handled = true;
> -			}
> -
> -			if (rt_dev == dev) {
> -				rt->dst.dev = blackhole_netdev;
> -				netdev_ref_replace(rt_dev, blackhole_netdev,
> -						   &rt->dst.dev_tracker,
> -						   GFP_ATOMIC);
> -				handled = true;
> -			}
> -			if (handled)
> -				list_del_init(&rt->dst.rt_uncached);
> -		}
> -		spin_unlock_bh(&ul->lock);
> +		table = per_cpu_ptr(&rt6_uncached_table, cpu);
> +		ul = &table->buckets[hash_ptr(dev,
> +					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
> +		rt6_uncached_list_flush(ul, dev);
> +		rt6_uncached_list_flush(&table->mismatch, dev);

The mismatch list can be quite long depending on the workload and every
device needs to walk it for every CPU.

AFAICT, when there is a mismatch, dst_dev() is either loopback or a VRF
device. Can you instead hash based on rt6i_idev->dev (fallback to
dst_dev() when not available) and only iterate over all the buckets when
the device that is going away is loopback / VRF?

That way, in the common case, you only need to walk one list per-CPU.

>  	}
>  }
>  
> @@ -6987,10 +7015,18 @@ int __init ip6_route_init(void)
>  #endif
>  
>  	for_each_possible_cpu(cpu) {
> -		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
> +		struct rt6_uncached_table *table;
> +		int bucket;
> +
> +		table = per_cpu_ptr(&rt6_uncached_table, cpu);
> +		for (bucket = 0; bucket < RT6_UNCACHED_HASH_SIZE; bucket++) {
> +			struct uncached_list *ul = &table->buckets[bucket];
>  
> -		INIT_LIST_HEAD(&ul->head);
> -		spin_lock_init(&ul->lock);
> +			INIT_LIST_HEAD(&ul->head);
> +			spin_lock_init(&ul->lock);
> +		}
> +		INIT_LIST_HEAD(&table->mismatch.head);
> +		spin_lock_init(&table->mismatch.lock);
>  	}
>  
>  out:
> 
> -- 
> 2.43.0
> 
