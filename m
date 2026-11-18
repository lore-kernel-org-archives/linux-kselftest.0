Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044511;
	b=aFEF90zegoESUqsWGEo9ud3WXl+qhohtdrukZy4jVFQL+KAokdGFhLIFBEkoQij0E0uN
	 zupCPFY4spqqeIarocbl0Q3HVkEkqtKxPxDFd70VnlCYG/qrG7oc9zpc7uxGMEKRUvxEz
	 /xFaqrtXgJYjYQ4Yvx6a3DP/RVZTbwsxYZPmm6VkosrcyVGYN3M47Bm4c/1blkIEbpQbX
	 bGEJBHzaHxG+ma0KdjPf7n6kVdkPZw2RnVxL4FO3nNiJu+odvb6XFdTzavc4D5tOUP3H1
	 S9jpI2Bgabf2ra55jMa9bpWWVpkWYSqMW6UnYPO2mm15sT4S4fBRYH35TCTd+VP+3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044511;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=arpE5x6pMkoyhMOGsQMGrMDgYn/lTC6LC8r4fvaRmfk=;
	b=sBgpVo9gIG9wKiQ56ZO+xqxCMoP9XdbK48+2Qs+i0N6l83qOOFPkwGbspupLhT69l9k3
	 0Y9PXofrwDWZ1P603gJKMofxSpzcTdEXq3ti2CDj4KrF8SQkeqB9opw7t//MGTq4loeOY
	 uQ0fRUToLFhQUFoi15f8hCHRQJLb7/15C21OSz3tfoptVE/zwzHBKa66+/PCY1VcKJuRw
	 Hhe5sHUwxh3g0bMT0I7HSH0WC5luRQQfeSs1+LgFDu68Pz2drGFckS69uHGXZMApyNQ1l
	 91h4wnfuTMiyz2TcIkApgE+h9hg6BqmyKDrV6wH+SqPDqu8Rf5BnYiwqmZMTwLJrXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAUMiUU3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E5F60A2610;
	Wed, 18 Nov 2026 23:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAUMiUU3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BA21F000C8;
	Wed, 18 Nov 2026 23:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044511;
	bh=arpE5x6pMkoyhMOGsQMGrMDgYn/lTC6LC8r4fvaRmfk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PAUMiUU39q+XYVe/VP80MG9crMbb1ZijW1gfb61ktxUmESlmyrVSZDGMEAS9L8ksG
	 J7irAxW3ZWA2LOtJsZ3aDTS6eSZNbej4CIF7OFsBa8GkgYc/C6lStOcH0SZI71fcXd
	 tlAb/WlbUwBqzHitKEz45bQO+HRWKMoMEQcvJbTxPHOK2qcT+a9XQda8XHVZoQj9K2
	 KjUi3s+p7B7svCzowBSBgSWBgQLuYDeC4uQY1aGtBWtGfCyfHSXB7/Xhmkuk0hDbF+
	 jc8cgTINcKF0ZnLXnxmLpVvCZ3iTOAHskA/eKHwB/sOOoFe4Gg4ARESUXERaAGYuDl
	 EG33LQxAumBIQ==
Subject: Re: [PATCH net-next v5 4/4] ipv4: replace obsolete routing comment
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Wed, 18 Nov 2026 23:28:30 +0000
Message-ID: <179504451061.3136.1731007912948900423@kernel.org>
In-Reply-To: <20261116202741.13106-5-liamsmith827@grapheneos.org>
References: <20261116202741.13106-5-liamsmith827@grapheneos.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The comment this patch adds in ip_route_output_key_hash_rcu()
  (net/ipv4/route.c) says "Non-vrf unicast honors restrictions"…

--

ipv4: replace obsolete routing comment

This commit replaces the comment above the on-link fallback in
ip_route_output_key_hash_rcu(). The commit message says the old comment
described obsolete fib_lookup(), MSG_DONTROUTE and IPv6 behavior. The new
comment explains how restriction routes and lookup misses are handled
when an oif is specified.

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index b71443e4b522c..d0930ae4c5ae6 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2866,24 +2866,18 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
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
> -			 * tables are looked up with only one purpose:
> -			 * to catch if destination is gatewayed, rather than
> -			 * direct. Moreover, if MSG_DONTROUTE is set,
> -			 * we send packet, ignoring both routing tables
> -			 * and ifaddr state. --ANK
> -			 *
> -			 *
> -			 * We could make it even if oif is unknown,
> -			 * likely IPv6, but we do not.
> +			 * Multicast is sent regardless of restriction or miss.
> +			 * Non-vrf unicast honors restrictions but allows
> +			 * oif-bound sends even when oif has no routes. In both
> +			 * cases the destination is assumed on-link.

[Severity: Medium]
Does "Non-vrf unicast honors restrictions" hold for senders that do the
lookup at link scope? The commit message also calls the old MSG_DONTROUTE
remark obsolete, but it looks like that remark still describes the
current behavior.

MSG_DONTROUTE, SO_DONTROUTE and strict source routing all make
ip_sendmsg_scope() return RT_SCOPE_LINK, and that value ends up in
fl4->flowi4_scope:

include/net/ip.h:ip_sendmsg_scope() {
	if (sock_flag(&inet->sk, SOCK_LOCALROUTE) ||
	    msg->msg_flags & MSG_DONTROUTE ||
	    (ipc->opt && ipc->opt->opt.is_strictroute))
		return RT_SCOPE_LINK;
    ...
}

fib_table_lookup() applies the scope filter before it checks the route
type's error:

net/ipv4/fib_trie.c:fib_table_lookup() {
    ...
		if (fa->fa_info->fib_scope < flp->flowi4_scope)
			continue;
		fib_alias_accessed(fa);
		err = fib_props[fa->fa_type].error;
    ...
}

By default, fib_props[] gives blackhole, prohibit and unreachable routes
RT_SCOPE_UNIVERSE, so a link-scope lookup skips them. If no link-scope
route covers the destination, the lookup returns -EAGAIN. fib_lookup()
with FIB_LOOKUP_REPORT_MISS then reports that as -ESRCH.

If an oif is set through SO_BINDTODEVICE, IP_PKTINFO or IP_UNICAST_IF,
the condition above is true. The code then builds an on-link RTN_UNICAST
route even though a prohibit, blackhole or unreachable route matches the
destination:

udp_sendmsg() / raw_sendmsg() / ping_v4_sendmsg()
  ip_sendmsg_scope() -> RT_SCOPE_LINK
  ip_route_output_key_hash_rcu()
    fib_lookup(..., FIB_LOOKUP_REPORT_MISS)
      fib_table_lookup() skips the universe-scope prohibit route
      -> -EAGAIN -> -ESRCH
    on-link fallback

None of these steps need privileges. On this path, only FIB rule actions
such as FR_ACT_PROHIBIT still apply, because they are not filtered by
scope.

Could the comment and the commit message say that link-scope (DONTROUTE)
lookups bypass restriction routes here? The series aims to make
restriction routes apply comprehensively ("ipv4: restrict on-link
fallback to lookup misses"), but nothing in the series documents this
case.

>  			 */
> -
>  			if (fl4->saddr == 0)
>  				fl4->saddr = inet_select_addr(dev_out, 0,
>  							      RT_SCOPE_LINK);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116202741.13106-1-liamsmith827%40grapheneos.org
