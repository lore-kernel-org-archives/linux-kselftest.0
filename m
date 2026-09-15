Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CE4B540C;
	Tue, 15 Sep 2026 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490861; cv=none; b=C45GSKeiA/K0fk6cUoW+dqmR8CcTjKZO60Ckxtv0DLR78OLnvpIPakY/jhiOjDmn7MhrP/8jRtL5cYIwQzXivh9qR4Kfrvd8hS39Fon6U0H9gMcKFuzgFqTcsQvW2EgSfo+K8BnEjREW7p6p5Qsmv2w9pYOJH3nPwcNhMdFO3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490861; c=relaxed/simple;
	bh=M8Yo7FgueIDu7IuDgz3qJYrEmrULvUgK81TpaCN7Ylk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oogscA/4O9DPRSoVzL6LE/iztb0CVx+WB5BcBofE6dqQbmEPGZBlFi6MKuV/eB7CeoLF1Q18mY+JzGQCINBQBjeLh76BdAWSPiT+t3FbOEvzrwkIW9IExJ5PaLFbB615yPs52PanWkTBv2xlaYCJOVI5vfuclrfgrgt+K6TsBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGPCQJbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGPCQJbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CA51F000FF;
	Tue, 15 Sep 2026 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490851;
	bh=bwCx00SdgCquvFaRU6yo1GO2KpGZvUNudb1o0rwa0QQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nGPCQJbX69VWeBASYzF89KzUro/AANdNmcbZYo7KfrDDMLWP6hTtNSW9UD5iUifAn
	 UzjneoxORZpbjWHotTixVukrJ0hLeblVsBNyD0jb/4/bU34Id7g5hvLmp4iJW/DZrC
	 LDUkCcG7k1JC+qJpPUgaFGl9uPLvisugvbgura9fjFWkOJOa/8D+Uq2dMwU01ASI6P
	 VNEWS9GvcUEd8bp7U+1rSpErB7MWWAn61MGR70utxRZSOT6J9nYj3aYyITCY+ehCDU
	 Bq0lDWMajDgg1RZs84tPEwiyOvuDNZBSBysx0flBsKD53jl5N4SEqbQ5fViY/cB6Im
	 Wod3R+o8n6TSw==
Subject: Re: [PATCH net-next v5 2/4] rtnetlink: add AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Tue, 15 Sep 2026 16:47:29 +0000
Message-ID: <178949084995.22033.13993818825459759580@kernel.org>
In-Reply-To: <20260914014539.5015-3-sigefriedhyy@gmail.com>
References: <20260914014539.5015-3-sigefriedhyy@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 2

- [Medium] AF_PACKET RTM_GETMULTICAST dump
  (rtnl_dump_mcaddr()/rtnl_dump_mcaddr_dev(),…
- [Low] Commit "netlink: specs: rt-addr: fix the type of target-netnsid"
  (first patch of this series) changes Documentation/netlink/specs/rt-…
- [Low] Reported concern (validated as resolved within this series): the
  rt-addr YAML spec did not describe the new AF_PACKET RTM_GETMULTICAST…

--

rtnetlink: add AF_PACKET multicast dumps

This adds handling for RTM_GETMULTICAST dumps with ifa_family set to
AF_PACKET, reporting every entry of dev->mc in the existing ifaddrmsg
format.  A new IFA_F_GLOBAL uAPI flag reports netdev_hw_addr::global_use,
and the dump runs under RCU plus netif_addr_lock_bh() without RTNL.

> diff --git a/include/uapi/linux/if_addr.h b/include/uapi/linux/if_addr.h
> index 7fb630b7fe311..0a1ad9ebb47be 100644
> --- a/include/uapi/linux/if_addr.h
> +++ b/include/uapi/linux/if_addr.h
> @@ -57,6 +57,7 @@ enum {
>  #define IFA_F_NOPREFIXROUTE	0x200
>  #define IFA_F_MCAUTOJOIN	0x400
>  #define IFA_F_STABLE_PRIVACY	0x800
> +#define IFA_F_GLOBAL		0x1000

[Severity: Low]

This isn't a bug, but at this commit Documentation/netlink/specs/rt-addr.yaml
has no "global" entry in the ifa-flags enum for bit 12, and the getmulticast
op still lists an empty dump-request attribute list plus a reply set without
"flags" or "target-netnsid".  Spec-driven decoders such as ynl therefore
cannot name the new flag or validate the new AF_PACKET reply.

The next patch in the series ("netlink: specs: rt-addr: document AF_PACKET
multicast dumps") adds all of that, so this looks like nothing more than a
transient state inside the series.  Would it be worth folding the two
patches, or does the ordering matter for something else?

>  
>  struct ifa_cacheinfo {
>  	__u32	ifa_prefered;
> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index be9d1625bac31..5f3e692a828b8 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -4571,6 +4571,178 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
>  	return skb->len ? : ret;
>  }
>  
> +static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
> +			    const struct netdev_hw_addr *ha, u32 portid,
> +			    u32 seq, unsigned int flags, int netnsid)
> +{

[ ... ]

> +	nlmsg_end(skb, nlh);
> +	return 0;
> +}
> +
> +static int rtnl_dump_mcaddr_dev(struct net_device *dev, struct sk_buff *skb,
> +				struct netlink_callback *cb, int *s_addr_idx,
> +				unsigned int flags, int netnsid)
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
> +				       cb->nlh->nlmsg_seq, flags, netnsid);
> +		if (err < 0)
> +			break;
> +		addr_idx++;
> +	}
> +	netif_addr_unlock_bh(dev);
> +
> +	*s_addr_idx = err < 0 ? addr_idx : 0;
> +
> +	return err;
> +}

[Severity: Medium]

The only resume state for a multi-part dump is a bare positional index into
dev->mc, and both netif_addr_lock_bh(dev) here and the rcu_read_lock() in
rtnl_dump_mcaddr() are dropped between dump rounds.

Can this silently skip or repeat entries of dev->mc?

Round N fills the skb until rtnl_fill_mcaddr() returns -EMSGSIZE and stores
the position:

	*s_addr_idx = err < 0 ? addr_idx : 0;

Round N+1 then skips exactly *s_addr_idx entries from the head of the list
again:

	netdev_for_each_mc_addr(ha, dev) {
		if (addr_idx < *s_addr_idx) {
			addr_idx++;
			continue;
		}

If a __dev_mc_del() or __dev_mc_add() runs in between (an IGMP/MLD join or
leave, SIOCADDMULTI, "bridge fdb add ... self", or a lower device sync), the
list shifts under the cursor.  A removal before the cursor means the entry
that moved into that slot is never emitted; an insertion means an
already-emitted entry is emitted a second time.

> +
> +struct rtnl_mcaddr_dump_filter {

[ ... ]

> +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
> +{
> +	struct rtnl_mcaddr_dump_filter filter = {
> +		.tgt_net = sock_net(skb->sk),
> +		.netnsid = -1,
> +	};
> +	unsigned int flags = NLM_F_MULTI;
> +	struct {
> +		unsigned long ifindex;
> +		int addr_idx;
> +	} *ctx = (void *)cb->ctx;

[Severity: Medium]

Related to the cursor question above: cb->seq is never set to a generation
counter for dev->mc, and rtnl_fill_mcaddr() does not call
nl_dump_check_consistent(), so NLM_F_DUMP_INTR can never appear on an
emitted message or on NLMSG_DONE.  Does that leave user space unable to tell
a torn listing from a consistent one?

The IPv4 RTM_GETMULTICAST dump that this mirrors does both, in
net/ipv4/devinet.c:

	cb->seq = inet_base_seq(tgt_net);
	...
	nl_dump_check_consistent(cb, nlmsg_hdr(skb));

and net/ipv6/addrconf.c does the same with inet6_base_seq().  Is there
something about dev->mc that makes the stamping unnecessary here, or should
this dump grow an equivalent counter?

> +	unsigned long s_ifindex;
> +	struct net_device *dev;
> +	int err;
> +

[ ... ]

> +	s_ifindex = ctx->ifindex;
> +	for_each_netdev_dump(filter.tgt_net, dev, ctx->ifindex) {
> +		/* The device the dump stopped at is gone, do not skip
> +		 * entries of the next one.
> +		 */
> +		if (dev->ifindex != s_ifindex)
> +			ctx->addr_idx = 0;
> +		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags,
> +					   filter.netnsid);
> +		if (err < 0)
> +			break;
> +	}
> +out:
> +	rcu_read_unlock();
> +	if (filter.netnsid >= 0)
> +		put_net_track(filter.tgt_net, &filter.ns_tracker);
> +	return err;
> +}

One more note, on the first patch of the series rather than on this one:

[Severity: Low]

"netlink: specs: rt-addr: fix the type of target-netnsid" changes
addr-attrs.target-netnsid in Documentation/netlink/specs/rt-addr.yaml from

	type: binary

to s32, matching what the kernel actually parses in ifa_ipv4_policy
(net/ipv4/devinet.c) and ifa_ipv6_policy (net/ipv6/addrconf.c):

	[IFA_TARGET_NETNSID]	= { .type = NLA_S32 },

That is a fix to a machine-readable ABI description consumed by ynl and
generated bindings, but the patch carries no Fixes: tag.  git blame points
the "type: binary" line at dfb0f7d9d979 ("doc/netlink: Add spec for rt addr
messages"), and a prior spec fix, 0c8e30252d9fe ("netlink: specs: rt_addr:
pull the ifa- prefix out of the names"), tagged the same commit.  Should the
patch pick up:

	Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914014539.5015-1-sigefriedhyy%40gmail.com
