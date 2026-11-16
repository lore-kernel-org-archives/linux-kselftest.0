Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804956;
	b=GwZSrB+ZpZbfKC7Mo5mEHBwCbF/3xq4cCL5dabn9hR8mzaoPLmzJB2wSgO1I7bSeLpNM
	 FCOE94HhHxMVNKCwOvurocbeSfs2LriVvhc/3U8mtFx7GxU+EL765LXhRh/ZLCYzAcjRx
	 d38p0vkBvIu0o87Bcd9AH4Xx8mGrIOXxd4XgSaNFOfixJhBlATNMlCRenNO+MkGaO0xCg
	 YBzD3i3hxPbgX/CI+cF/VuUmwkrubpc70hGiO959RIgv3GNHFZ2TprZbbzlhn//KdOvNc
	 j7gaIzY0AfR75/kr5PMjebgYGdbjyd8DreMoLeRbFEXQJGe/cE+T2C5OTe+LiBZyQKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804956;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kbeLhk4kveCo14x8XWoRSKZ1A1Z6lHlwD7WTyW8dlbM=;
	b=SRRj+QZhIc1uk00LmO5zpBUY4oMWd94ziQ2Ukon0MQv9Iuk5R3ggzjL2LlwDMlDJyblf
	 TEE6SimHE+ae6+NsofMe3lUVwOgF4rRQVDSTS5Y/w66MW9QobnLyC2ZvBTehpg0aKioT7
	 tT0BSnQ9DVC5VzE4MfJB7R2JtofuAVIoLrRPPSOxV7CBRTBifQ3Env8NhVIgYsC7N+DD/
	 L91i38RzdfbkleieNNr9CbH8602YpZsvXtdgehf6SyiBefBarni+f6UkL2iSD++KFCh2a
	 VNM2aKYA8lgEeS1HVcHleh9TkfyOJNjHy/sNO4lfmXqX0TmAaddGbDm6eqPVduy4QPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lw2ofetG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE4B606A31C;
	Mon, 16 Nov 2026 04:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lw2ofetG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF0B1F000C4;
	Mon, 16 Nov 2026 04:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794804955;
	bh=kbeLhk4kveCo14x8XWoRSKZ1A1Z6lHlwD7WTyW8dlbM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lw2ofetG4cDmvHWE14nN9TnT6/h5l3Pb/a8buMjxTJDfjjqQxquddfDe9sK9I4ken
	 Bz+vuhDwuM1vgJg7jyDHEqJBJ4TiZd6L/w3p1MGNi24rKVz5S03Sv2xfL0iy81inX9
	 FBDs+6K+4Q7lrFrOeDgAkKdTZyve8gBg6dqcG/axXXJJbvVDyOjzyFtthPXVJhT4kp
	 tTo3XlVOUlqS6WLpbOXYvAETsXpPZ8ryCdOipBtRPwVHJCmCSHNW8BGN8BaQ0ky1br
	 ueFinberADJh02vjGiS75YXtmPKw/bUkzrH8/aP/XmhLYACIUpO3mGS0cZqRveNUL/
	 waoliR5KHhvzA==
Subject: Re: [PATCH net v5 1/2] vxlan: reset the remote's dst cache when
 snooping moves a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kuniyu@google.com, mschiffer@universe-factory.net, nicolas.dichtel@6wind.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 04:55:54 +0000
Message-ID: <179480495432.3136.17109064150958616332@kernel.org>
In-Reply-To: <20261115040609.61134-2-ilskdw@gmail.com>
References: <20261115040609.61134-2-ilskdw@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new dst_cache_reset() in vxlan_snoop() does not fully stop
  a stale route from being cached for the new remote.
- [Medium] vxlan_snoop() now writes two dependent fields, rdst->remote_ip
  and rdst->remote_ifindex, as separate plain stores with no hash_lock.

--

vxlan: reset the remote's dst cache when snooping moves a MAC

When a learned MAC migrates to a new remote, vxlan_snoop() now resets the
remote's dst_cache, updates remote_ifindex and clears offloaded. This
matches what vxlan_fdb_replace() already does. The early return also
changes so that remote_ifindex is only compared for IPv6 link-local
sources.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b374721..1cfb34fa23604 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -1470,7 +1470,7 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
>  			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
>  
>  		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
> -			   rdst->remote_ifindex == ifindex))
> +			   (!ifindex || rdst->remote_ifindex == ifindex)))
>  			return SKB_NOT_DROPPED_YET;
>  
>  		/* Don't migrate static entries, drop packets */
> @@ -1482,7 +1482,10 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
>  				    "%pM migrated from %pIS to %pIS\n",
>  				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
>  
> +		dst_cache_reset(&rdst->dst_cache);
>  		rdst->remote_ip = *src_ip;

[Severity: Medium]
Can a transmitter on another CPU still cache the route to the old remote
after this reset?

vxlan_snoop() holds only RCU here. vxlan_xmit_one() reads the same fields
without a lock and then uses the cache:

drivers/net/vxlan/vxlan_core.c:vxlan_xmit_one() {
    ...
		ifindex = rdst->remote_ifindex;
    ...
			key.u.ipv4.dst = rdst->remote_ip.sin.sin_addr.s_addr;
    ...
		dst_cache = &rdst->dst_cache;
    ...
}

dst_cache_reset() only stores jiffies in reset_ts. A cached entry is
checked against that timestamp at jiffy granularity only:

net/core/dst_cache.c:dst_cache_per_cpu_get() {
    ...
	if (unlikely(!time_after(idst->refresh_ts,
				 READ_ONCE(dst_cache->reset_ts)) ||
    ...
fail:
	idst->refresh_ts = jiffies;
	return NULL;
}

On a cache hit, udp_tunnel_dst_lookup() returns the dst without comparing
it to key->u.ipv4.dst.

Consider this interleaving:

CPU1 (vxlan_xmit_one)             CPU0 (vxlan_snoop)
reads old rdst->remote_ip
                                  dst_cache_reset() at jiffy J
                                  rdst->remote_ip = *src_ip
dst_cache_get() at J+1, misses,
  refresh_ts = J+1
looks up route to old remote,
  caches it

After that, every transmit on CPU1 to this MAC uses the old remote's dst
with the new remote's address. Later packets from the new remote take the
early return, so snooping never resets the cache again.

Is that the same blackhole the commit message describes, just reached
through a race? Reordering the stores, even with smp_wmb(), doesn't seem
to close the window. vxlan_fdb_replace() does the same reset followed by
in-place stores, so it has the same window.

> +		rdst->remote_ifindex = ifindex;

[Severity: Medium]
Can concurrent snoops of the same MAC leave remote_ip and remote_ifindex
inconsistent?

These are two plain stores with no hash_lock. RX for one VXLAN device can
run on several CPUs at once, for example:

CPU1: snoop from fe80::1 on ifindex 5
CPU0: snoop from 2001:db8::1, ifindex 0

If the stores interleave, the entry can end up as {remote_ip =
2001:db8::1, remote_ifindex = 5}.

With the new early-return check:

	(!ifindex || rdst->remote_ifindex == ifindex)

later packets from 2001:db8::1 return early, so the stale ifindex is never
repaired. f->updated also keeps being refreshed, so the entry doesn't age
out.

vxlan_xmit_one() then uses ifindex 5 as the output interface for the
global address. If that address isn't routed via device 5, the route
lookup fails and traffic to the MAC is dropped.

This looks like the state the commit message says it fixes ("the remote
keeps the previous interface"). vxlan_fdb_replace(), which writes these
fields under hash_lock, can mix with this lockless snoop in the same way.

> +		rdst->offloaded = false;
>  		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
>  	} else {
>  		/* learned new entry */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115040609.61134-1-ilskdw%40gmail.com
