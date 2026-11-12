Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518236;
	b=qSbBbkUNAR7fgeaUHImmMFqwKZ62Gi/JebijknTARsvU0OXq3TLi+XGQ7oLuKrI3A2I2
	 Mi29qc4dV3D/3sSUKPovm60pYfTQjpoRZ/+CzQLjBT8MxToztW8tCD4Iq1d39hzGs8AJw
	 8wpD7wK20wrVXcKI0yfvEP87wNyz88NAM0I5NQXYcEgZr2rYO3dd7mINGjl6tFrnfv0Ho
	 D0chsqwbCy0lHsKIRGJavof1hGp65ZCqewH0c9mKfql5zavjWfoAkxHR2rRgBpdfvhKhj
	 c23VkvcPnB5Y8jdFM3dil3HaoUzoiQLnCxN5e4S2og/4cdn5bNTfSFVFvPNkuM/A8zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518236;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nCeolnG7xjqaBJL8tNZxUEnHawYs1R1nNtrCWLAobc0=;
	b=Bn6BN9ABkXj2aCMMLAKhXkbUvRd8CCxuuEiMjfNmwTgnLreOsRH/ESmTJ14SP+WAZaFD
	 2nT6qBwXjcv4QIKpeB54teRLNu9WJQjy1dF3FsXJAouj5uR0DayerHIK42WYJEtSnHzik
	 UG5Xnjl1x3wDweseioEr4g1y5iZyAnLkYD+W4p0zidLsAjNbF98vmzCq1qvYEv6vYrVq/
	 oRdf00K8TKkg8NxOE2XqD6PQSaSfLpSwb0m47CvZe8PXPSGnnjwP4RUeTqXeLD2X8Tjqk
	 W2M14x9mq4gvFrKXbugR1WYrbZ8+6RuP9/F12uUD4mL5AW16K88GYlNjRF4V3DgPV8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtAcJnIn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CCC606A31C;
	Thu, 12 Nov 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtAcJnIn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7B51F000C4;
	Thu, 12 Nov 2026 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518236;
	bh=nCeolnG7xjqaBJL8tNZxUEnHawYs1R1nNtrCWLAobc0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UtAcJnInrsx/Yo1EkpKK/o6/1cGbqiQMpEizHK5gUp48dXpXAkLzPHDrjOKg3ZFU8
	 d+67RcpXYxexgxkt9Q4e60+IfbF3OytLOuYRwk/TFRe5GSuXrTRqhl/eckP/2DlDEt
	 79tx+jNdESdRE5bAihtN896sjxaSWaJ4XCdKyyscDNO5g0AAIDrkXl41noLUb4LcGP
	 bLko8YrnkpFSr/IGQe86OQJPciS6KlYFR9jH7xIFyNvvhv6/LG71iaBMngM61wf5/O
	 OLqeIzEa1jYxNN1fh8cRHJ+EAVK9wGwPrCTyUYjQwJv5ECYO8CHWL528y56Tn4XWpj
	 z2hxKurAxcHeQ==
Subject:
 Re: [PATCH net v2 2/4] ipv4: restrict on-link fallback to lookup misses
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Thu, 12 Nov 2026 21:17:15 +0000
Message-ID: <179451823511.2199510.15480690224597348773@kernel.org>
In-Reply-To: <20261110061536.10811-3-liamsmith827@grapheneos.org>
References: <20261110061536.10811-3-liamsmith827@grapheneos.org>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete for route-based restrictions.

--

ipv4: restrict on-link fallback to lookup misses

This patch changes ip_route_output_key_hash_rcu() to call fib_lookup()
with FIB_LOOKUP_REPORT_MISS. For non-vrf unicast with an oif set, the
on-link fallback is then only taken on a real lookup miss (-ESRCH).
Before this, it was taken for any fib_lookup() error, so blackhole,
prohibit and unreachable restrictions could be bypassed.

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index 3a90c8d28b940..80a2c8a3c571f 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2851,12 +2851,13 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
>  		goto make_route;
>  	}
>  
> -	err = fib_lookup(net, fl4, res, 0);
> +	err = fib_lookup(net, fl4, res, FIB_LOOKUP_REPORT_MISS);
>  	if (err) {
>  		res->fi = NULL;
>  		res->table = NULL;
>  		if (fl4->flowi4_oif &&
> -		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
> +		    (ipv4_is_multicast(fl4->daddr) ||
> +		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {

[Severity: High]
Can a reject route that scope filtering skips still show up here as
-ESRCH and take the on-link fallback?

An unprivileged socket can set an oif with IP_UNICAST_IF, IP_PKTINFO or
SO_BINDTODEVICE. It can then send with MSG_DONTROUTE, or set
SO_DONTROUTE, which needs no capability. Either way, ip_sendmsg_scope()
returns RT_SCOPE_LINK:

include/net/ip.h:ip_sendmsg_scope() {
	if (sock_flag(&inet->sk, SOCK_LOCALROUTE) ||
	    msg->msg_flags & MSG_DONTROUTE ||
	    (ipc->opt && ipc->opt->opt.is_strictroute))
		return RT_SCOPE_LINK;
    ...
}

udp_sendmsg() passes that scope into flowi4_init_output(), so
fl4->flowi4_scope is RT_SCOPE_LINK by the time fib_lookup() runs.

In fib_table_lookup(), the scope check comes before the reject-type
error check:

net/ipv4/fib_trie.c:fib_table_lookup() {
    ...
		if (fa->fa_info->fib_scope < flp->flowi4_scope)
			continue;
		fib_alias_accessed(fa);
		err = fib_props[fa->fa_type].error;
    ...
}

By default, prohibit, blackhole and unreachable routes have
RT_SCOPE_UNIVERSE, which fib_props allows. So a link-scope lookup skips
them instead of returning -EACCES, -EINVAL or -EHOSTUNREACH.

If the destination is off-link and there is no link-scope route, the
lookup ends in -EAGAIN. Because FIB_LOOKUP_REPORT_MISS is set,
fib_lookup() turns that into -ESRCH, and so does
__fib_lookup()->fib_rules_lookup() when it runs out of rules. The new
err == -ESRCH check then passes, and a route through dev_out gets built.

The full path looks like this:

udp_sendmsg()
  ip_sendmsg_scope()               -> RT_SCOPE_LINK
  ip_route_output_flow()
    ip_route_output_key_hash_rcu()
      fib_lookup(..., FIB_LOOKUP_REPORT_MISS)
        fib_table_lookup()         reject alias skipped, -EAGAIN
      err == -ESRCH                on-link fallback taken

On NOARP or point-to-point links, like the cellular case in the commit
message, would the packet then go out the interface the prohibit route
was meant to block?

The commit message says:

    As a result, routes and rules that are supposed to restrict traffic
    (blackhole, prohibit, unreachable) are unable to do so
    comprehensively.

This looks fixed for rules. fib4_rule_action() returns -EACCES,
-ENETUNREACH or -EINVAL without any scope filtering. Routes seem to
still be bypassable with DONTROUTE plus an oif.

The comment added later by "ipv4: replace obsolete routing comment"
also says "Non-vrf unicast does honor restrictions". That commit calls
the old MSG_DONTROUTE description obsolete, but this case would still
apply to it.

Would it make sense to stop treating scope-filtered reject matches as
misses, or to handle the scope case separately?

>  			/* Apparently, routing tables are wrong. Assume,
>  			 * that the destination is on link.
>  			 *

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110061536.10811-1-liamsmith827%40grapheneos.org
