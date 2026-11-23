Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429174;
	b=BJXNpBxXl9QY/TkeoRVWGp2e+oPSZOgeqt/JKSSRpcwK9yNzj3SROofWta2qxQ+9QvQT
	 2XVOJKGpLGL4Vqa3Z9hUW9eHA8awQ48iHr58oTyZOWAIiT+K2uk/vWJ+++gEVtCg+Qnwb
	 DXaeYcL/5sugyRnRDXNz99F6OMv4g195UtwobH7f2Q2Mxvct15GUSzSRXxgKDCGZgTVYR
	 RpWki9zU+zRvblS0+gDBQDusj1UOfyjX2aGv4kjY9G2gb7XOSXYIfO7nFU1/s9/SDfRwD
	 KR78RzA2zEySrxSRol05L/fDKDGs+07QhmeH/Qj5UNaoOEntEnrzFeU5+8xjxG+RYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429174;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=F8v/n8HAlGN35GNXNOZO9vza3hTM28edWtZoDu3Dyfk=;
	b=iwP5+Dp2EzwhzyCIWxbbl/ni51Q1WSERTO2Cm0hKZ19YW7rKwMQQC65SSRcQuyDueA4n
	 7ySnFRmY0h8FFuBzGXWRiD94ZQs1YAzCXmXFnKhzgh1GHq0DY7x4vprRo4tQWl5Zz3UsX
	 WESY81a4W9vQdVvM5yQrxHsO1PTUt54JYZHbbof8lyxNz2ybkoIufbUqbsUMFsAriEuG6
	 4M5LlGxAr7aSAnZi4hrUaixSo8hQzrXNX+AxwDDdqUpYq2ZmW52sUYt4p91YQI8mvROeO
	 vB7n+B29yXaUTuR/m5+k6S77jtQyEJimJ7SGWAaHyXcezpXRd7T5Y6XIwmznBzNGwWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z5ez2xK/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D1606A31A;
	Mon, 23 Nov 2026 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z5ez2xK/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF941F000C6;
	Mon, 23 Nov 2026 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429174;
	bh=F8v/n8HAlGN35GNXNOZO9vza3hTM28edWtZoDu3Dyfk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z5ez2xK/vqwV0tZavLQQZIYA/oXS5T7++ezWNmN5QyAk53WoRLb38ns2iajFu//Bq
	 dfOLooumBywho0Oe7HQRkmD2Q/y4I8q3wGilEalvciQbk05haexQWxEWZBt2P/w2KC
	 Tt4gUSPm0fUpPtOkKMUxDTOqxlWwBgp0EjmzOxE+ZV7eJxjTgm78d8BNxw62yW2s2t
	 xHGqB88Wj0FI8lr7uBXwhOj/GvPDI8DzGr4oIY9PW1AW6Y9a8aWwxBm54iGjXXuXTw
	 SxDu52AR0bmppIOJ0AmOFCar4nAtqj4VOjBTk13BJiavMryMqGZWGZ6eqoHCMxT6XW
	 a4v6K44LDSnqA==
Subject: Re: [PATCH net v6 1/2] vxlan: reset the remote's dst cache when
 snooping moves a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kuniyu@google.com, mschiffer@universe-factory.net, nicolas.dichtel@6wind.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 23 Nov 2026 10:19:32 +0000
Message-ID: <179542917290.3135.7119976710700884013@kernel.org>
In-Reply-To: <20261119095256.42005-2-ilskdw@gmail.com>
References: <20261119095256.42005-2-ilskdw@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch does not close the stale dst_cache problem it says
  it fixes.
- [Low] The re-check under the lock in vxlan_snoop_move() runs its tests
  in a different order from the lockless fast path in vxlan_snoop().

--

vxlan: reset the remote's dst cache when snooping moves a MAC

When vxlan_snoop() sees a known MAC arrive from a different remote, it
now resets the remote's dst_cache, updates remote_ifindex and clears
offloaded, matching what vxlan_fdb_replace() does. It compares
remote_ifindex only for IPv6 link-local sources. The remote update now
runs in a new helper, vxlan_snoop_move(), which holds vxlan->hash_lock
and checks the entry again once the lock is taken.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b374721..8738be39e6019 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -1434,6 +1434,51 @@ static int vxlan_fdb_get(struct sk_buff *skb,

[ ... ]

> +static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
> +					     struct vxlan_fdb *f,
> +					     const u8 *src_mac,
> +					     union vxlan_addr *src_ip,
> +					     u32 ifindex)
> +{
> +	struct vxlan_dev *vxlan = netdev_priv(dev);
> +	struct vxlan_rdst *rdst;
> +
> +	lockdep_assert_held(&vxlan->hash_lock);
> +
> +	/* The entry may have changed before the lock was taken */
> +	if (hlist_unhashed(&f->fdb_node))
> +		return SKB_NOT_DROPPED_YET;
> +
> +	if (rcu_access_pointer(f->nh) ||
> +	    (f->state & (NUD_PERMANENT | NUD_NOARP)))
> +		return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
> +
> +	rdst = first_remote_rcu(f);
> +	if (vxlan_snoop_same_remote(rdst, src_ip, ifindex))
> +		return SKB_NOT_DROPPED_YET;

[Severity: Low]
Is this check order intended? The lockless path in vxlan_snoop() calls
vxlan_snoop_same_remote() before the NUD_PERMANENT | NUD_NOARP test. Here
the static-state test runs first.

Consider this sequence:

CPU A in vxlan_snoop() sees a dynamic entry with a different remote and
calls spin_lock(&vxlan->hash_lock).

Before CPU A gets the lock, "bridge fdb replace <mac> dst <src_ip>
permanent" runs vxlan_fdb_update_existing() under hash_lock. That sets
f->state = NUD_PERMANENT, and vxlan_fdb_replace() sets
remote_ip = src_ip.

CPU A then takes the lock, and vxlan_snoop_move() returns
SKB_DROP_REASON_VXLAN_ENTRY_EXISTS.

The packet is dropped, even though it came from the remote the static
entry now points to. The lockless path would have accepted the same
packet.

Would it make sense to move the same-remote check ahead of the
static-state check? The nh check would have to stay first, since
first_remote_rcu() is not valid for nexthop entries.

> +
> +	if (net_ratelimit())
> +		netdev_info(dev,
> +			    "%pM migrated from %pIS to %pIS\n",
> +			    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
> +
> +	dst_cache_reset(&rdst->dst_cache);
> +	rdst->remote_ip = *src_ip;
> +	rdst->remote_ifindex = ifindex;

[Severity: Medium]
Does this fully close the stale dst_cache window the patch is meant to
fix?

vxlan_xmit_one() does not take hash_lock. It copies the remote into the
lookup key well before it looks at the dst_cache:

drivers/net/vxlan/vxlan_core.c:vxlan_xmit_one() {
    ...
		ifindex = rdst->remote_ifindex;

		if (addr_family == AF_INET) {
			key.u.ipv4.src = cfg->saddr.sin.sin_addr.s_addr;
			key.u.ipv4.dst = rdst->remote_ip.sin.sin_addr.s_addr;
    ...
}

Later it calls udp_tunnel_dst_lookup(), which does dst_cache_get_ip4(),
then ip_route_output_key() on a miss, then dst_cache_set_ip4().

Cache validity is purely time based:

net/core/dst_cache.c:dst_cache_per_cpu_get() {
    ...
	if (unlikely(!time_after(idst->refresh_ts,
				 READ_ONCE(dst_cache->reset_ts)) ||
    ...
fail:
	idst->refresh_ts = jiffies;
	return NULL;
}

Here is a possible sequence:

CPU1 (vxlan_xmit_one)            CPU2 (vxlan_snoop_move)
key.u.ipv4.dst = old remote A
                                 dst_cache_reset()  /* reset_ts = J0 */
                                 rdst->remote_ip = B
<jiffy tick, now J0+1>
dst_cache_get_ip4()
  miss, refresh_ts = J0+1
ip_route_output_key() for A
dst_cache_set_ip4(route for A)

After that, every later lookup on CPU1 passes the time_after(refresh_ts,
reset_ts) test. The IPv4 obsolete check only fails when the route genid
changes.

Would packets with outer daddr B then keep using the next hop chosen for
A? That is the blackhole the commit message describes, and it would
last until something like "ip route flush cache" or another reset.

Doing the stores before dst_cache_reset() does not seem to help, since
CPU1 can still read A before either of them. Would this need a re-check
or a generation check between the route lookup and dst_cache_set, or an
rdst replaced via RCU?

vxlan_fdb_replace() and the other dst_cache_reset() users follow the
same pattern.

> +	rdst->offloaded = false;
> +	vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
> +
> +	return SKB_NOT_DROPPED_YET;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119095256.42005-1-ilskdw%40gmail.com
