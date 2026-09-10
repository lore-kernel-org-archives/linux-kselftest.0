Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D242E0B5C;
	Thu, 10 Sep 2026 03:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011696; cv=none; b=hNTNgbL//Axr1QQFxy4cEqnytylZTubQ0R/zy7ttUDs+l9c/ARhTy+ISZgkE675pQpSs9W+8pJQK7jpmeojcD/13IYwVVBwUSUjsh3qeyLCe2ihd1KIVZubwG02tZic/8zxr7Ty7i09gWaOY8QRw+mtmsImiN/Aqg+uJtqrRtDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011696; c=relaxed/simple;
	bh=1wwDJEpw5gEsXmbo+gLmfDIOdn+qoV5258NG0Z2Ke7k=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QAQi1QvAauC3Dq/xtp15l9CTVmxTR3qcyI8WYzkccpO+QWzDoYamUw3z78P261AzBT3Rdn1gYP0RinA2T3oqr8xArNPJHahw6ASGvXMSyHSyOxQI4z50kMmN5I+dzSV+IJqZVValjBJXl2vFkod3qs/knmZsPOGGqVzvMO6ROVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVsxcB/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVsxcB/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16041F000FF;
	Thu, 10 Sep 2026 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789011694;
	bh=ulp+TU34kNx1g0TvXb7mz/lbGuv0wf5Z6rXyYC+guOM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VVsxcB/pGyJM9Ml91UKvkF1Hv0JQ7OTGjiSEkK4w4TM0XuB63tjIkmN22J27kumv1
	 meeQxDU7eAO/iT6Y1SVa8o/nqLJO6v+9rOLUkIuRxxXky8i6WBefHfwiX+Z0/ih1ZV
	 rA7/sbCjMDMp8QajLYV8Am5HCOTextg5VXWTeVsR44HNFrjUOkqjO/M6Uc867j/G2h
	 I9d5qT50HUDxApthtE5vzCThadHtgY2LwjX2m/tgwKhgND0CgOG7MCh0yrSK3ZePxj
	 EgC9KNfrnKkTcRvPNTdLJUZinhJX03P7SOStVNqG7oPkuuDWTyOFnzY6lT6UKO/a5n
	 SpWyygErg7N5A==
Subject: Re: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nickgarlis@gmail.com, pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org,
 horms@kernel.org, sdf.kernel@gmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 03:41:33 +0000
Message-ID: <178901169340.219967.5720246601361596190@kernel.org>
In-Reply-To: <20260905093932.43726-2-sigefriedhyy@gmail.com>
References: <20260905093932.43726-2-sigefriedhyy@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 2

- [Medium] rtnl_dump_mcaddr()/rtnl_dump_mcaddr_dev()
  (net/core/rtnetlink.c) resume a truncated dump purely positionally —…
- [Medium] rtnl_fill_mcaddr() (net/core/rtnetlink.c) copies dev->addr_len
  bytes out of ha->addr[MAX_ADDR_LEN] into the IFA_MULTICAST attribute:…
- [Low] Claimed uAPI/YAML divergence: Documentation/netlink/specs/rt-
  addr.yaml documents op `getmulticast` as 'Get / dump IPv4/IPv6…
- [Low] Claimed spec/implementation mismatch: rt-addr.yaml lists
  `cacheinfo` in the getmulticast reply attribute set (mcaddr-attrs) and…

--

rtnetlink: add AF_PACKET multicast dumps

This adds a PF_PACKET RTM_GETMULTICAST dump handler that walks dev->mc for
every device in the netns and reports each netdev_hw_addr in the existing
ifaddrmsg format with IFA_MULTICAST and IFA_MC_USERS.  The dump runs under
RCU plus netif_addr_lock_bh() and is registered with
RTNL_FLAG_DUMP_UNLOCKED.

A few questions below.

> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index 81c5a6104dea1..5e83232c15048 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -4566,6 +4566,136 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
>  	return skb->len ? : ret;
>  }
>  
> +static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
> +			    const struct netdev_hw_addr *ha, u32 portid,
> +			    u32 seq, unsigned int flags)
> +{

[ ... ]

> +	if (nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
> +	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount)) {

[Severity: Medium]

Can this nla_put() copy uninitialized slab bytes into IFA_MULTICAST when
dev->addr_len grew after the entry was created?

netdev_hw_addr entries are allocated with plain kmalloc() and only
addr_len bytes are initialized, and the length used at creation time is
not recorded anywhere:

net/core/dev_addr_lists.c:__hw_addr_create() {
	alloc_size = sizeof(*ha);
	if (alloc_size < L1_CACHE_BYTES)
		alloc_size = L1_CACHE_BYTES;
	ha = kmalloc(alloc_size, GFP_ATOMIC);
	if (!ha)
		return NULL;
	memcpy(ha->addr, addr, addr_len);
	...
}

__dev_mc_add() passes dev->addr_len as it is at add time:

net/core/dev_addr_lists.c:__dev_mc_add() {
	err = __hw_addr_add_ex(&dev->mc, addr, dev->addr_len,
			       NETDEV_HW_ADDR_T_MULTICAST, global, false,
			       0, false);
}

while rtnl_fill_mcaddr() emits the current dev->addr_len.  One sequence
that produces a mismatch:

  1. create a tap device (ARPHRD_ETHER, addr_len 6)
  2. SIOCADDMULTI via dev_ifsioc() -> dev_mc_add_global(), which only
     requires netif_device_present(), so the device may be down; 6 bytes
     of ha->addr are initialized
  3. TUNSETLINK with ARPHRD_TUNNEL6 in drivers/net/tun.c:

	tun->dev->type = (int) arg;
	tun->dev->addr_len = tun_get_addr_len(tun->dev->type);

     which raises addr_len to 16 and does not purge dev->mc
  4. run the new RTM_GETMULTICAST/AF_PACKET dump

Would step 4 then emit 16 bytes out of a 6-byte-initialized ha->addr,
handing 10 bytes of never-written slab memory to user space?  The read
stays inside ha->addr[MAX_ADDR_LEN], so this is a disclosure of
uninitialized memory rather than an out-of-bounds access.

The same bytes are already visible through /proc/net/dev_mcast, which
prints "%*phN" with dev->addr_len, so the underlying unzeroed tail is
older than this patch, but this adds a second path to it.  Would it make
sense to either bound the emitted length or zero the address tail in
__hw_addr_create()?

> +		nlmsg_cancel(skb, nlh);
> +		return -EMSGSIZE;
> +	}
> +
> +	nlmsg_end(skb, nlh);
> +	return 0;
> +}
> +
> +static int rtnl_dump_mcaddr_dev(struct net_device *dev, struct sk_buff *skb,
> +				struct netlink_callback *cb, int *s_addr_idx,
> +				unsigned int flags)
> +{
> +	struct netdev_hw_addr *ha;
> +	int addr_idx = 0;
> +	int err = 0;
> +
> +	netif_addr_lock_bh(dev);
> +	netdev_for_each_mc_addr(ha, dev) {
> +		if (addr_idx < *s_addr_idx) {
> +			addr_idx++;
> +			continue;
> +		}
> +		err = rtnl_fill_mcaddr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
> +				       cb->nlh->nlmsg_seq, flags);
> +		if (err < 0)
> +			break;
> +		addr_idx++;
> +	}
> +	netif_addr_unlock_bh(dev);
> +
> +	*s_addr_idx = err < 0 ? addr_idx : 0;

[Severity: Medium]

Should this dump also maintain a generation counter and call
nl_dump_check_consistent() so interrupted dumps get NLM_F_DUMP_INTR?

Resume state here is purely positional (ctx->ifindex plus ctx->addr_idx)
and neither RTNL nor netif_addr_lock is held between two invocations of
the callback.  netlink_dump() turns the -EMSGSIZE into a continued dump:

net/netlink/af_netlink.c:netlink_dump() {
	if (nlk->dump_done_errno == -EMSGSIZE && skb->len)
		nlk->dump_done_errno = skb->len;
}

so entries added to or removed from dev->mc in that window shift the
index and entries can be silently repeated or skipped.

cb->seq is never assigned in rtnl_dump_mcaddr(), so the check in
nl_dump_check_consistent():

	if (cb->prev_seq && cb->seq != cb->prev_seq)
		nlh->nlmsg_flags |= NLM_F_DUMP_INTR;

can never fire and user space has no way to notice the loss.  The AF_INET
sibling of the same message type does both halves: inet_dump_addr() sets

	cb->seq = inet_base_seq(tgt_net);

and in_dev_dump_ifmcaddr() calls nl_dump_check_consistent(cb,
nlmsg_hdr(skb)) for every emitted message.

> +
> +	return err;
> +}

[ ... ]

> +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
> +{

[ ... ]

> +	for_each_netdev_dump(net, dev, ctx->ifindex) {
> +		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx,
> +					   flags);
> +		if (err < 0)
> +			break;
> +	}

[Severity: Medium]

Related to the above, can a stale ctx->addr_idx be applied to the wrong
device here?

On -EMSGSIZE, rtnl_dump_mcaddr_dev() keeps the offset in ctx->addr_idx and
the break skips the ifindex++ of for_each_netdev_dump(), so ctx->ifindex
still names the interrupted device.  If that device is unregistered before
the dump resumes:

include/linux/netdevice.h:
	#define for_each_netdev_dump(net, d, ifindex)				\
		for (; (d = xa_find(&(net)->dev_by_index, &ifindex,		\
				    ULONG_MAX, XA_PRESENT)); ifindex++)

xa_find() with XA_PRESENT returns the next device that does exist, and the
non-zero ctx->addr_idx is passed unchanged into rtnl_dump_mcaddr_dev(), so

		if (addr_idx < *s_addr_idx) {
			addr_idx++;
			continue;
		}

would skip the first ctx->addr_idx multicast entries of an unrelated
device.  Should ctx->addr_idx be reset when the resumed ifindex does not
match the recorded one?

> +out:
> +	rcu_read_unlock();
> +	return err;
> +}
> +

[ ... ]

> @@ -7251,6 +7381,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
>  	{.msgtype = RTM_SETSTATS, .doit = rtnl_stats_set},
>  	{.msgtype = RTM_NEWLINKPROP, .doit = rtnl_newlinkprop},
>  	{.msgtype = RTM_DELLINKPROP, .doit = rtnl_dellinkprop},
> +	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
> +	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

[Severity: Low]

This isn't a bug, but as of this commit alone the getmulticast op in
Documentation/netlink/specs/rt-addr.yaml still reads "Get / dump
IPv4/IPv6 multicast addresses." while the same op now also serves
AF_PACKET requests with link-layer address semantics.

The follow-up patch in the series, "netlink: specs: rt-addr: document
AF_PACKET multicast dumps", rewrites that doc to cover ifa-family
selecting AF_INET, AF_INET6 or AF_PACKET and the permanent-flag meaning,
so the spec and the implementation do agree at the end of the series.
Only noting it in case the two patches are ever applied separately.

>  	{.protocol = PF_BRIDGE, .msgtype = RTM_GETLINK,
>  	 .dumpit = rtnl_bridge_getlink},
>  	{.protocol = PF_BRIDGE, .msgtype = RTM_DELLINK,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905093932.43726-1-sigefriedhyy%40gmail.com
