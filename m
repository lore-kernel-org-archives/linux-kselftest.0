Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044509;
	b=p98jLY70tOhwq5ssyLYMuNqlOfMrJM0WigaBhDhwwae55uU8gKbxRca160uUG8JW0XLp
	 ybN+Ri8oBiAdTXAUx75dgqn3kdnlwi78dzB/XgST89KFKWBgkP7DBJK4FotKTzom1XUiD
	 cKFgiA/4gG3C43hjIY3dMQDMR8sKKkIoSg2PJF5Q/Av03hbECzdw8oXLNofB807YcuvM4
	 vSybIJK5qdxXoLxLF46RcSZb1qnkE+71b3QJ4GzaXSXbo+WRzbRX6cB215wIrHTR+G+3u
	 0zn2yrWdsXekIXNntx0cQyaAKxdzpnxqEsGgdScrKXvrMEN/Ze2UsPSruY5bFnpgUPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044509;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wZosD5+/Nj2eIGY2Fv4ggxK50RAWtAyE3IvgDSS2SiQ=;
	b=PIJW4UIqlhLoSUjHuFf/mx+IFxZSVaVDiIOM4ze7F6qRKaBfhXskoUk+JRqIm7bgMT1L
	 We1S3M6BYFq6OBLutY4sQc0hmuQ1lHLTCpKE2jfJvHBAAfA+psvkj4Br8BWCCbx/rmog1
	 ShuXzpo77eDq902y25B8ReY8kr5fH+onNYkBGRpt9LMI3xmGrRXV7fHjg8RV0qX0Hool3
	 vLsIHnokrduG+5VTFRxcw3CPoXqmLXZ+2PzelFPM1qWWXzY811qEKmNhCdK8rrZ9fPKaV
	 H/HGWaZtISdX8JuOhd5pJeoZ08MUfdE1IDxJzQwX/L5r8lwtQiaTg3WAb74e3YJQuog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2xc3CNk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBD606A32F;
	Wed, 18 Nov 2026 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2xc3CNk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9B21F000C4;
	Wed, 18 Nov 2026 23:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044509;
	bh=wZosD5+/Nj2eIGY2Fv4ggxK50RAWtAyE3IvgDSS2SiQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b2xc3CNkofjUuaNiWY+44q1putpRhXHx/AV8RXZg+BA/7bJR0Lo0ks54YS2OayOTT
	 sNDHo7QdvE7gDcWsFywJ8u293UOyfQuJ/8XxL8ktOomjMx/jvkQVdmDKFJb9FfxhGr
	 0oBy3fSOCqRaRmIrpr9pr414OJbz3KgThA3TgITErWki7PTEDgpm+9c8m6AlePI3ub
	 sWLekn/m+ZCggtuzRbBgcJQrnOUrDQ8M20dKGy4vw6Om32e2GTv0BFi2EwyvKBnXBn
	 F6RZA9LEl5z+IYmMCFHFVN8aPG1cTJ+vJy1AQy3PJfYeml9dG9yH82g2Lpt6lcPYNJ
	 e9eK+AJXGF1tA==
Subject:
 Re: [PATCH net-next v5 2/4] ipv4: restrict on-link fallback to lookup misses
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Wed, 18 Nov 2026 23:28:28 +0000
Message-ID: <179504450812.3136.16231358596487999009@kernel.org>
In-Reply-To: <20261116202741.13106-3-liamsmith827@grapheneos.org>
References: <20261116202741.13106-3-liamsmith827@grapheneos.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Route-based restrictions can still be bypassed by an
  unprivileged process after this fix.
- [Low] The commit message describes a security-relevant bug that users
  can see: unprivileged Android apps can get around a VPN kill switch…

--

ipv4: restrict on-link fallback to lookup misses

With this patch, ip_route_output_key_hash_rcu() takes the oif-bound
on-link fallback for non-vrf unicast only when fib_lookup() reports a
real lookup miss (-ESRCH, via FIB_LOOKUP_REPORT_MISS). Errors from
blackhole, prohibit and unreachable routes or rules now go back to the
caller, and -ESRCH is mapped back to -ENETUNREACH.

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index b9f5397336d34..b71443e4b522c 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2859,12 +2859,13 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
>  		goto make_route;
>  	}
>  
> -	err = fib_lookup(net, fl4, res, 0);
> +	err = fib_lookup(net, fl4, res, FIB_LOOKUP_REPORT_MISS);

[Severity: Low]
The commit message describes a security-relevant problem that users can
see: unprivileged apps can bypass the Android VPN kill switch. There is
no Fixes: tag and no Cc: stable, though.

The unconditional on-link fallback in ip_route_output_key_hash_rcu()
dates back to the initial git import. Should this carry something like
the following?

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

A Fixes: tag would also make it clearer whether this is meant for net
or net-next.

This change also depends on the earlier patch "ipv4: add
FIB_LOOKUP_REPORT_MISS". A backport of this patch alone would fail to
build, because FIB_LOOKUP_REPORT_MISS would be undefined, so it would
not misbehave silently. If this is meant for stable, could the
dependency be stated?

>  	if (err) {
>  		res->fi = NULL;
>  		res->table = NULL;
>  		if (fl4->flowi4_oif &&
> -		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
> +		    (ipv4_is_multicast(fl4->daddr) ||
> +		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {

[Severity: High]
Can route-based restrictions still be bypassed here when the flow asks
for link scope?

The commit message says this fixes "routes and rules that are supposed
to restrict traffic (blackhole, prohibit, unreachable)".

An unprivileged process can bind to a device (SO_BINDTODEVICE,
IP_UNICAST_IF, IP_PKTINFO) and also set SO_DONTROUTE or MSG_DONTROUTE.
Neither needs a capability. In that case ip_sendmsg_scope() returns
RT_SCOPE_LINK, and so does ip_sock_rt_scope() for connect and TCP:

include/net/ip.h:ip_sendmsg_scope() {
	if (sock_flag(&inet->sk, SOCK_LOCALROUTE) ||
	    msg->msg_flags & MSG_DONTROUTE ||
	    (ipc->opt && ipc->opt->opt.is_strictroute))
		return RT_SCOPE_LINK;
    ...
}

In fib_table_lookup(), the scope check runs before the reject error is
read:

net/ipv4/fib_trie.c:fib_table_lookup() {
    ...
		if (fa->fa_info->fib_scope < flp->flowi4_scope)
			continue;
		fib_alias_accessed(fa);
		err = fib_props[fa->fa_type].error;
    ...
}

Blackhole, prohibit and unreachable routes have universe scope by
default. fib_create_info() keeps cfg->fc_scope for reject types, and
iproute2 creates them with universe scope. A link-scope flow therefore
skips the reject route as if it were not there.

The table then returns -EAGAIN. Because of FIB_LOOKUP_REPORT_MISS,
fib_lookup() turns that into -ESRCH, and so does __fib_lookup() ->
fib_rules_lookup() when custom rules exist.

The condition above then holds, and the code jumps to make_route with an
RTN_UNICAST route on the chosen device. For example:

  ping -r -I eth1 <blocked dst>

That packet would still seem to go out eth1, even with a prohibit route
for that destination. Before this patch every error fell back. After it,
the same bypass needs just one more unprivileged socket option.

Rule actions (FR_ACT_PROHIBIT, FR_ACT_UNREACHABLE and FR_ACT_BLACKHOLE
in fib4_rule_action()) are not filtered by scope. So the kill switch
built on prohibit rules does look fixed, and only the route case
remains open.

Could the fallback tell a real miss apart from a reject route that was
skipped only because of scope? Another option would be to not apply the
scope filter to reject-type aliases when deciding whether to fall back.

A later patch in the series, "ipv4: replace obsolete routing comment",
adds the comment "Non-vrf unicast honors restrictions", which does not
hold in this case either. Nothing later in the series changes
fib_trie.c or this condition.

>  			/* Apparently, routing tables are wrong. Assume,
>  			 * that the destination is on link.
>  			 *

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116202741.13106-1-liamsmith827%40grapheneos.org
