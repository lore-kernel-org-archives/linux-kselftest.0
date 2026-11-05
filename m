Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844753;
	b=uYVRiqkQgSwFPjpfgdvnBsEfjjyO4STsfqv47Ta3djlwrc+y3Hy1xip2evzUR0SIiTu9
	 NNrPz/vXW5aANOiYMzcznQZrAcN9A5BvITPPXAnLh4rmH4qcnlupyDmZtcgRHpiXFNbAh
	 TtXTbyZ5+uWQ1Svg7ji9NADfr61QdaZL/jfB2GbRnt2qbpPakR1vUwUL6/l8Du4Y/EqS2
	 YYjEuvMkeQuiDTuTsn3kkS4I2E4yaVA1Uj+0d6iqSsWsSkKWfP0BbJEnEAgUOsxH64XBf
	 G84mAVlzV29An/bXXfS4xisZGig6EXqRZUD3vLXIMd7bt8LgOGTOjjH66rb2szrpqEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844753;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QaEwYVK0QRwa1prVIMD7IJ4FVuOtJkVN57HHtraLvXc=;
	b=m0Xj2UCEEVIfLwoD1oNy7EsJBXwoGQJXPk7IMjEgSP8M5WOeKYwy60tBywdr/IGP9/OA
	 mhiEOz+3bMVn3Ld8SmEs5ZgtLqyYGHHB3ImlqFOuWx/VL6CuVJW3Xm7Kt8SQ4hdCt9oC7
	 jw6QSTkYS5h/T3miur21iRSaszDTKNusuCo1F09mc9g1e2LYAGFAwdznS2JmwxNlNWSgh
	 S9MyNqb79rGH2Om7QptCNKgQj5LuoAJgJkPypxm8MqsMiwVsta35VyJ1vMzw3Kfuwyeu2
	 J/5d3BNBffphpYIK7e/sN2ov/ukFZq98CpLlSEEHtyM0qpEifJuJehAyvhNq4n6snPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UsUqcTDX;
	arc=none smtp.remote-ip=91.218.175.177
Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530A606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 02:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A530A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UsUqcTDX
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pBrfotY9+XE+xLOo6ESNM23xl8EfAZ2RsF5WJxQ1HQg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793844749; v=1; x=1794449549;
 b=UsUqcTDXiUIUDjy7EsYATTiTE4U6RjuH70yVSspKepTCWFqrC/x3yt0UZgU75x1/nKu1mAnD
 Hk9Ko34P03qH2vXk1TZ87alHQ0PdewiOAmMEK2PuaqC4at6pOlyIV1CTYIBiQUivv/pbCKiY32n
 ScIr6xmD26QRN+0a3WoBlGEQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d7e254c367df15f0;
	Thu, 05 Nov 2026 02:12:29 +0000
X-Mizu-Trace-ID: d7e254c367df15f0
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 10:12:15 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	weiwan@google.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] ipv6: ignore link state in gateway check
Message-ID: <auvl_644NtfQVWrW@fedora>
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
 <20261104195655.1406837-2-aroslavdudkov622@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104195655.1406837-2-aroslavdudkov622@gmail.com>

On Wed, Nov 04, 2026 at 07:56:54PM +0000, Yaroslav Dudkov wrote:
> IPv6 route cannot be added in table when all
> following conditions are true:
> - gateway is not link-local address
> - ignore_routes_with_linkdown=1 on device
> - nexthop has no carrier
> - gateway is not present or covered by any route in table already
> Also multipath routes addition is invalidated by kernel even
> if only one of added nexthops satisfies all above conditions.
> 
> Reproducer:
> 
>   ip netns add t
>   ip -n t link add va type veth peer name vb
>   ip -n t link set va up
>   ip -n t addr add fd00::1/64 dev va nodad
>   ip netns exec t sysctl -w \
>     net.ipv6.conf.va.ignore_routes_with_linkdown=1
>   ip -n t -6 route add 2001:db8::/64 via fd00::2 dev va
>   # added
>   ip -n t -6 route add 2001:db8::/64 table 100 via fd00::2 dev va
>   # RTNETLINK answers: No route to host
>   ip -n t -6 route show table all
>   ip netns del t
> 
> Route should be added because:
> - RT6_LOOKUP_F_IGNORE_LINKSTATE in commit d5d32e4b7668
> ("net: ipv6: Do not consider link state for nexthop validation")
> was added for this
> - the same route is valid in main table (when no specifying table id
> while adding route)
> - fib6_nh_init() initializes nexthops with no carrier
> - IPv4 already does this (fib_check_nh_v4_gw() ignores link state
> using the FIB_LOOKUP_IGNORE_LINKSTATE flag)
> 
> Before commit b2c709cce682 ("ipv6: Convert gateway validation to
> use fib6_info") rt6_lookup() was used for checking if nexthop is
> valid, rt6_lookup called rt6_device_match() which does not check the
> link state. After change rt6_lookup() to fib6_lookup()
> find_match() under fib6_lookup() started to invalidate linkdown
> devices, because RT6_LOOKUP_F_IGNORE_LINKSTATE is not passed to it.
> 
> Adding RT6_LOOKUP_F_IGNORE_LINKSTATE to flags for ip6_route_check_nh()
> solves the problem. RT6_LOOKUP_F_IGNORE_LINKSTATE is already used
> inside the first search ip6_nh_lookup_table() and fixes the
> bug in second search fib6_lookup(). Also RT6_LOOKUP_F_IGNORE_LINKSTATE
> isn't read inside fib6_select_path().
> 
> Fixes: b2c709cce682 ("ipv6: Convert gateway validation to use fib6_info")
> Signed-off-by: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
> ---
> IPv4 example of this situation:
>   ip netns add t
>   ip -n t link add va type veth peer name vb
>   ip -n t link set va up
>   ip -n t addr add 192.168.0.1/24 dev va
>   ip netns exec t sysctl -w \
>     net.ipv4.conf.va.ignore_routes_with_linkdown=1
>   ip -n t route add 192.0.2.0/24 table 100 via 192.168.0.2 dev va
>   # added
>   ip -n t route show table all
>   ip netns del t
> 
> Also when adding RT6_LOOKUP_F_IGNORE_LINKSTATE to flags of
> ip6_route_check_nh() makes adding this flag inside of
> ip6_nh_lookup_table() unnecessary for this call, making another call in
> ip6_route_check_nh_onlink() with flags=0 the only place where it is
> needed.
> ---
>  net/ipv6/route.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 94e5ef1c4f83..73d8a2c95602 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -3424,9 +3424,9 @@ static int ip6_route_check_nh(struct net *net,
>  			      netdevice_tracker *dev_tracker,
>  			      struct inet6_dev **idev)
>  {
> +	int flags = RT6_LOOKUP_F_IFACE | RT6_LOOKUP_F_IGNORE_LINKSTATE;
>  	const struct in6_addr *gw_addr = &cfg->fc_gateway;
>  	struct net_device *dev = _dev ? *_dev : NULL;
> -	int flags = RT6_LOOKUP_F_IFACE;
>  	struct fib6_result res = {};
>  	int err = -EHOSTUNREACH;
>  
> -- 
> 2.54.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
