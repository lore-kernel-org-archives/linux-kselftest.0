Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804001;
	b=vynwhFlgUOvP9g6Ym6aH29W7UGYNupqQsA0bftl+dS810RJFFqrc2lXGCJWONEfmxKlf
	 6utqcUmmK6xfZWFPL1fJtV5sOscMVnUH81cexxc7LUT/cvJYbX35P88sxTnlvhjP+QcBF
	 zCXPkhkm05oN8jR/XFAHBfMGTJryNMvcMIYJCUTd0G50jjuDwWGEUpo7IGfvZOWK6qbB8
	 erzkVDPrUMDTfah7EYKzKIzZbxtbo9orHtr225qIi6f754lV6A3Nz4WAExSVYdXm0Mu0Y
	 WEdZZeRCgo9FPFeAGZEc+jcMMsXuXEJfJe8Nol6290eCl5xmXULiR1kzWlaFDD5GPbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804001;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W0M+QFiTzI1lqSuBhwE3o3ta8tLlW62Sj46FgVterKM=;
	b=n5tJ/2gdHtD+gpQfg2Fo1gbQc0qe9pkHTEiNxcwiVKdXC5siUDIdN8ALfSfXmfEXodBU
	 sqXxwSDHHEKW4nMlLA3J0AKADUT4MMeK2BCzpAxK/F8VNDERjRh7si3tM/1OQU024OJSJ
	 UG9G9V/hr71NdzUdWjo8X+Xn5bfXLBwiGoY0wWpW1y+Yoc7JCSaEL6x+cdKiSlA/tRJUR
	 FIxBXaVIprCbdAIYe0v9puTmjtbWpRKSFM01mgJd5Mh/ZIHmoa0JfAGx/Snmny/pEpjWA
	 Yd5uGfA6AUVsvb3VAXiaifihwjRU4VxQwCDibQo/TlJLZAxGt34MGzn0u3RDR+tJqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC9047bD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1266F606A31C;
	Fri, 27 Nov 2026 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC9047bD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D841F00893;
	Fri, 27 Nov 2026 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804000;
	bh=W0M+QFiTzI1lqSuBhwE3o3ta8tLlW62Sj46FgVterKM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EC9047bD+sQV8PSueArN4PdFl1CigIoYZqMNZOZ8esJ47hsF/C/thblxYiNanNwHf
	 aXnkUOPZ3UJ/0EzGM9kxRgfWkYHRrXrbGBfMZTYu0xGDmH6HTSPhWT3ORUNUCPaSna
	 GZ1GW5o5j009HpDjF0gue4RW3P47CYE8pjiLK7INLdNUVAjN4gHo2OCTFBpdJaNQij
	 LIHvYjSkm3iqcEkP9lGw7nGN/zKqr7GIRjAGPAag/WNLsF70x/uvaO/bnbdxwRPHbV
	 Q0gLY0WaHxWJS4G7ihiLVKtHeOcPWPfUy3plXP75YesnfAhuFhcUJISMsP7G3QyKbI
	 xy5OsXf5rcodA==
Subject: Re: [PATCH net v7 1/2] vxlan: reset the remote's dst cache when
 snooping moves a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kuniyu@google.com, mschiffer@universe-factory.net, nicolas.dichtel@6wind.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 18:26:39 +0000
Message-ID: <179580399973.3135.12029769847251459361@kernel.org>
In-Reply-To: <20261126182329.91058-2-ilskdw@gmail.com>
References: <20261126182329.91058-2-ilskdw@gmail.com>
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

- [Medium] The patch closes the deterministic case: a snooped migration
  now resets the cached route.

--

vxlan: reset the remote's dst cache when snooping moves a MAC

When vxlan_snoop() sees a known MAC arrive from a different remote, this
commit now resets the remote's dst_cache, updates remote_ifindex and
clears offloaded, matching what vxlan_fdb_replace() does. The early
return compares remote_ifindex only for IPv6 link-local sources. The
update runs under vxlan->hash_lock, and the entry is checked again once
the lock is held.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b374721..584d56d03b1c7 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -1434,6 +1434,67 @@ static int vxlan_fdb_get(struct sk_buff *skb,

[ ... ]

> +static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
> +					     struct vxlan_fdb *f,
> +					     const u8 *src_mac,
> +					     union vxlan_addr *src_ip,
> +					     u32 ifindex)
> +{

[ ... ]

> +	rdst = first_remote_rcu(f);
> +	if (net_ratelimit())
> +		netdev_info(dev,
> +			    "%pM migrated from %pIS to %pIS\n",
> +			    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
> +
> +	dst_cache_reset(&rdst->dst_cache);
> +	rdst->remote_ip = *src_ip;
> +	rdst->remote_ifindex = ifindex;
> +	rdst->offloaded = false;

[Severity: Medium]
This fixes the deterministic case. Can a route for the previous remote
still end up in the cache after the migration, though?

hash_lock only serializes the writers. The TX path in vxlan_xmit_one()
reads the route key locklessly with plain loads, well before the cache
lookup:

drivers/net/vxlan/vxlan_core.c:vxlan_xmit_one() {
    ...
	ifindex = rdst->remote_ifindex;

	if (addr_family == AF_INET) {
		key.u.ipv4.src = cfg->saddr.sin.sin_addr.s_addr;
		key.u.ipv4.dst = rdst->remote_ip.sin.sin_addr.s_addr;
    ...
}

Then udp_tunnel_dst_lookup()->dst_cache_get_ip4() runs, and on a miss
dst_cache_per_cpu_get() stamps refresh_ts before the route lookup
happens:

net/core/dst_cache.c:dst_cache_per_cpu_get() {
    ...
fail:
	idst->refresh_ts = jiffies;
	return NULL;
}

Here is a possible interleaving:

CPU1 (TX)                          CPU2 (snoop)
vxlan_xmit_one()
  reads old remote_ifindex,
  old remote_ip into key
                                   vxlan_snoop_move()
                                     dst_cache_reset()  /* reset_ts = J0 */
                                     rdst->remote_ip = *src_ip;
                                     rdst->remote_ifindex = ifindex;
  /* jiffies moves to J0 + 1 */
  dst_cache_get_ip4()
    old entry rejected
    refresh_ts = J0 + 1
  route lookup with the old key
  dst_cache_set_ip4()

After this, every later lookup on CPU1 passes the
time_after(refresh_ts, reset_ts) check. That CPU keeps using the route
for the old remote while rdst->remote_ip holds the new address.

That gives the same next-hop mismatch or blackhole the commit message
describes. It lasts until the cache is reset again or the route goes
obsolete. Later packets from the new remote take the early return in
vxlan_snoop_should_move(), so nothing on the snoop path repairs it.

The same window also seems to allow a torn read of the 16-byte IPv6
remote_ip while the plain struct store is in progress.

Storing the fields first and resetting afterwards would not help, since
a TX that read the key before the store can still miss in a later
jiffy. vxlan_fdb_replace() uses the same reset-then-store order, so the
netlink path has this window too:

	dst_cache_reset(&rd->dst_cache);
	rd->remote_ip = *ip;

Would closing it fully need a different invalidation scheme? For
example, the rdst could be replaced under RCU, or a generation check
could be added.

> +	vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
> +
> +	return SKB_NOT_DROPPED_YET;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126182329.91058-1-ilskdw%40gmail.com
