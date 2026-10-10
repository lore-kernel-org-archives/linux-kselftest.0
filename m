Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF24A3D20;
	Sat, 10 Oct 2026 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636092; cv=none; b=XGlqojeZYbOfVrvZl7bI26z7LlUCBSdViZN9ZF0LUzVbcToqcycpw2kzbGGGxMIuxF9htTMQtg+l4GqqcNkovtLYtFZVm4Ttq8HFVrILPhf2+jLH3HbkHu8S6STyxTtZj3vv1EBnZ7/hImaimKegEFa8JCfOzpiGbEwv1izkMJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636092; c=relaxed/simple;
	bh=QkSNig5LBnyM66BlBxd2zcgr6fFs5wo1eIyE9jsgU0M=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E45k8uavh7LgHQwnNqKUTMLvnye5ChgK1Xlort2PwmFOkW26j7jdY/D8rqx6r8KFjDyEaKHVzx6CkPsJzuAn9Ofm2H4I452w8FMmboVk35do2zMx/KlS0ZYwXnvL+6G7m+0h/FlfW5DvE7bjdxLEDES30g5MapSw5zW46bt8M9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mawcfZ/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mawcfZ/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CEA1F00899;
	Sat, 10 Oct 2026 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636090;
	bh=0433hHwAl3GPEOHIa7ZVbTfX2YVubrHSWcxuBTeRHak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mawcfZ/S3Kc+jbfCU+hnHFx+GnYnjkEyuQHT2z7Su5Zfb2wmJ9fmcjNx7enn1hT6Z
	 Qtk6gpNDkrWQRCL2IfDnTYCALnrSltzyb7ON9gcd+sxINrXJFzYrEatDdfuFJ4yOq9
	 c0C5CNffds+/3A9NZB5pADcc3sqtTTPrNY12FrFqaCm8LsFI6nOK3K31ZPxlvi7sag
	 M/Myprwy/ioIZmuDWtsIW8Bn3MYqVWy1azc0cZAX/jOqeUrVgSqiIUf0jNXJ3A11AG
	 byvtIYc6UEuGvEjExkcX3mu1UN10LSCJzZggeqV5MgTcUStPHZmVC9iPSCGpxVEor8
	 YSqJdI5z0/h/A==
Subject: Re: [PATCH net-next 05/13] amt: match the Membership Update tunnel by
 outer family
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:28 +0000
Message-ID: <179163608888.434549.10646268821919364034@kernel.org>
In-Reply-To: <20261009122426.551178-6-omar@blockcast.net>
References: <20261009122426.551178-6-omar@blockcast.net>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says "an IPv6 relay never accepts a Membership
  Update", as if this were a live, user-visible failure.

Pre-existing issues:
- [High] amt_update_handler() can re-arm the delayed work of a tunnel
  that amt_tunnel_expire() is already freeing, leading to use-after-free…

--

amt: match the Membership Update tunnel by outer family

This patch changes amt_update_handler() to read the outer source address
with amt_outer_saddr() instead of ip_hdr(skb)->saddr. It also matches the
tunnel with amt_addr_equal(), as amt_request_handler() does, so the lookup
works for both outer address families.

> amt_update_handler() finds the gateway's tunnel by comparing
> tunnel->addr.ip4 with ip_hdr(skb)->saddr, which on an IPv6 outer header
> reads bytes 4-7 of the source address as an IPv4 address, so an IPv6
> relay never accepts a Membership Update.

[Severity: Low]
Can an IPv6 relay exist at this point in the series? amt_v6() is:

static bool amt_v6(const struct amt_dev *amt)
{
	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
}

Nothing assigns amt->local_ipv6 at this commit. The first assignment is
in amt_newlink(), added later by "amt: add netlink attributes for an IPv6
outer transport".

Until then, amt_outer_saddr() always takes the IPv4 path. That makes
amt_addr_equal() in amt_update_handler() give the same result as the old
tunnel->addr.ip4 == saddr comparison.

This isn't a bug, but could the commit message say that nothing changes
until the netlink attribute is added? The first patch of the series does
this.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 5e8a74cc0700e..b977b00a6fd55 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -2646,7 +2646,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	skb_reset_network_header(skb);
>  
>  	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
> -		if (tunnel->addr.ip4 == saddr) {
> +		if (amt_addr_equal(&tunnel->addr, &saddr)) {
>  			if ((nonce == tunnel->nonce &&
>  			     response_mac == tunnel->mac)) {
>  				mod_delayed_work(amt_wq, &tunnel->gc_wq,

[Severity: High]
This is a pre-existing issue and this patch did not introduce it. Can
this mod_delayed_work() re-arm the gc_wq of a tunnel that
amt_tunnel_expire() is already freeing?

amt_update_handler() is called from amt_rcv() under rcu_read_lock_bh().
It does not hold amt->lock or tunnel->lock, and it does not check whether
the tunnel is being torn down.

amt_tunnel_expire() runs from that same gc_wq:

drivers/net/amt.c:amt_tunnel_expire() {
	spin_lock_bh(&amt->lock);
	rcu_read_lock();
	list_del_rcu(&tunnel->list);
	amt->nr_tunnels--;
	amt_clear_groups(tunnel);
	rcu_read_unlock();
	spin_unlock_bh(&amt->lock);
	kfree_rcu(tunnel, rcu);
}

Consider this ordering for a tunnel T:

CPU1 (amt_wq)
amt_tunnel_expire(T) starts, T->gc_wq is no longer pending

CPU2 (amt_rcv, rcu_read_lock_bh held)
amt_update_handler()
    list_for_each_entry_rcu() finds T before list_del_rcu()
    mod_delayed_work(amt_wq, &T->gc_wq, ...) arms T->gc_wq.timer

CPU1
    list_del_rcu(&T->list);
    kfree_rcu(T, rcu);

After CPU2 leaves its RCU section, the grace period ends and T is freed.
T->gc_wq.timer is still queued at that point.

When the timer fires, amt_tunnel_expire() runs on the freed tunnel. It
calls list_del_rcu() a second time, decrements nr_tunnels again, and
calls kfree_rcu() a second time.

The report: path has a similar problem. It takes tunnel->lock and calls
amt_igmp_report_handler() or amt_mld_report_handler(), which can add
group nodes to T after amt_clear_groups() has already run. Wouldn't those
nodes be left with live timers that still reference T after it is freed?

A remote gateway can trigger this. It only needs a valid nonce and
response MAC, and the timing is predictable because gc_wq fires 3 * GMI
after the last Update.

IPv4 relays could already hit this. Once the series is complete, this
patch makes the same path reachable for IPv6 relays. The code is still
the same at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
