Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF814BF92;
	Wed,  4 Mar 2026 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637714; cv=none; b=T383RpaQSs+0mOCUMXoWNRUE4HEyJcMdgR42zgJ9b6POH5kZsScxC1JfL8g8mzkUsX60X84g6OyUAMKuDsPHiwOs1s7UzhykCYN/A4IRF5glYuIv8wJ/cFcs9aoucEC1YKnKsCC8asABPqgJ2HuLwXE3O+IQDZCp8xGjHXwkyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637714; c=relaxed/simple;
	bh=EVSFeWtFnWKIOJfFAETl8vPB1Cze0V6tyU8guwGha7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7j5QB7lTDQavoLZ09QTxGuLIzwpLt7GLyP/X3QoojTd5GJn92IBLR1NI8RqSJnxRAMn6abQdCqDSzAK+yUg7rM7E2zg9azLbprLm3FfqQ+LAg8W/HVd3RWKiISSkGOhfElTRQzGP8LZ4SLQhoGjjNT2AeX4JRH8GctHZcHG2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hj+cH/kN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hj+cH/kN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E414DC19423;
	Wed,  4 Mar 2026 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772637714;
	bh=EVSFeWtFnWKIOJfFAETl8vPB1Cze0V6tyU8guwGha7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hj+cH/kN15cW2w+zHR/iGObRg6/7ZT1/yml954LV7j0/OV7ffdoNVvryAkeig1LmP
	 T2N9AHP3og8SFSlZUAWv7YJ+RDZz2DcESp91UiPjLX670MEj3pVdvVexdT6yM7Vqgk
	 eBv8VxiTvPYj20yN9HY2TMjAb9RStUlaX6UvUWLi5rWEGRBpE8h+uLm9NmDXdP+t6z
	 Ri+p++P7jdIS+O6Wvk3mw1EVqe6Xf1RaS/nw0C8dGFB3w514EfczLzBoyMO/2MtssH
	 kLfgBogeacQNYLDOjttNqt6M+PmdK63tJB0bzYPhvjlnok3SA/9Zljh/XfEzSTaC1B
	 rO3EAS0utAs9w==
Message-ID: <47b171c6-30d3-4689-bd6e-88881df38dfe@kernel.org>
Date: Wed, 4 Mar 2026 08:21:53 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 1/2] net: ipv6: fix panic when IPv4 route
 references loopback IPv6 nexthop
Content-Language: en-US
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
 idosch@nvidia.com
Cc: jiayuan.chen@shopee.com,
 syzbot+334190e097a98a1b81bb@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260304113817.294966-1-jiayuan.chen@linux.dev>
 <20260304113817.294966-2-jiayuan.chen@linux.dev>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260304113817.294966-2-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/26 4:38 AM, Jiayuan Chen wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> When a standalone IPv6 nexthop object is created with a loopback device
> (e.g., "ip -6 nexthop add id 100 dev lo"), fib6_nh_init() misclassifies
> it as a reject route. This is because nexthop objects have no destination
> prefix (fc_dst=::), causing fib6_is_reject() to match any loopback
> nexthop. The reject path skips fib_nh_common_init(), leaving
> nhc_pcpu_rth_output unallocated. If an IPv4 route later references this
> nexthop, __mkroute_output() dereferences NULL nhc_pcpu_rth_output and
> panics.
> 
> Simplify the check in fib6_nh_init() to only match explicit reject
> routes (RTF_REJECT) instead of using fib6_is_reject(). The loopback
> promotion heuristic in fib6_is_reject() is handled separately by
> ip6_route_info_create_nh(). After this change, the three cases behave
> as follows:
> 
> 1. Explicit reject route ("ip -6 route add unreachable 2001:db8::/64"):
>    RTF_REJECT is set, enters reject path, skips fib_nh_common_init().
>    No behavior change.
> 
> 2. Implicit loopback reject route ("ip -6 route add 2001:db8::/32 dev lo"):
>    RTF_REJECT is not set, takes normal path, fib_nh_common_init() is
>    called. ip6_route_info_create_nh() still promotes it to reject
>    afterward. nhc_pcpu_rth_output is allocated but unused, which is
>    harmless.
> 
> 3. Standalone nexthop object ("ip -6 nexthop add id 100 dev lo"):
>    RTF_REJECT is not set, takes normal path, fib_nh_common_init() is
>    called. nhc_pcpu_rth_output is properly allocated, fixing the crash
>    when IPv4 routes reference this nexthop.
> 
> Suggested-by: Ido Schimmel <idosch@nvidia.com>
> Fixes: 493ced1ac47c ("ipv4: Allow routes to use nexthop objects")
> Reported-by: syzbot+334190e097a98a1b81bb@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/698f8482.a70a0220.2c38d7.00ca.GAE@google.com/T/
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>  net/ipv6/route.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index c0350d97307e..08b4a324987e 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -3582,7 +3582,6 @@ int fib6_nh_init(struct net *net, struct fib6_nh *fib6_nh,
>  	netdevice_tracker *dev_tracker = &fib6_nh->fib_nh_dev_tracker;
>  	struct net_device *dev = NULL;
>  	struct inet6_dev *idev = NULL;
> -	int addr_type;
>  	int err;
>  
>  	fib6_nh->fib_nh_family = AF_INET6;
> @@ -3624,11 +3623,10 @@ int fib6_nh_init(struct net *net, struct fib6_nh *fib6_nh,
>  
>  	fib6_nh->fib_nh_weight = 1;
>  
> -	/* We cannot add true routes via loopback here,
> -	 * they would result in kernel looping; promote them to reject routes
> +	/* Reset the nexthop device to the loopback device in case of reject
> +	 * routes.
>  	 */
> -	addr_type = ipv6_addr_type(&cfg->fc_dst);
> -	if (fib6_is_reject(cfg->fc_flags, dev, addr_type)) {
> +	if (cfg->fc_flags & RTF_REJECT) {
>  		/* hold loopback dev/idev if we haven't done so. */
>  		if (dev != net->loopback_dev) {
>  			if (dev) {


Reviewed-by: David Ahern <dsahern@kernel.org>

