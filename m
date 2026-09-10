Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228B92AD0C;
	Thu, 10 Sep 2026 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004903; cv=none; b=Bw4HcXA5SOQRAse6Lh7ef8DG7RHTdZAHz9TUgj6bTFxxA5APyqqzTmNzQWBOpkaaLMBFb/kpbX+yofwWxLQdLJ50EsgbUdm1s3NigG5e51VTGpcJW7Haf/KKBfYF0Rqrxny1frZXuWsuy+Xn9KUZeXKMlzlZ1m0OGsZAWSE9XMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004903; c=relaxed/simple;
	bh=Op38X0QKyvfBSRJmv2tYyJQbmhAyDWQ9w9wfwmiCOnU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WLwuF8+AJludCokjbn+bLfev8E8cvtUDkjF2j3RFvooGxvIptfQ/vq2AdWoh6hivzwKpE07HADWP2zYdLxQuHMRZhZ2mN600Z+YJruTBQ2WWcWMQ0StuG4LMjGICh6X0vFw58n3TXGXdBXoQwFwX31vpvCT+rgvuwN/o6wwzT58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DItqm+0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DItqm+0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0AF1F000FF;
	Thu, 10 Sep 2026 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789004893;
	bh=lkfWavWEsNieCCDof9bbHOrbBo8ZnaLm9+RpPTLquI8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DItqm+0COA6xG991An+MAu6iWBhJtky3gt2weB2i2Y4NbOujZucDVtPY+5plGtvbc
	 Gdo9H0b2KgzVZrmo7lNaLiGHB4zEcAjkX826P2fI+MEHRYbn7sQqLc5YyxaP29t2Ab
	 44G6ZhF8PM4aoru0eRCNDlM0WOYy0yMr9SnpVg7msJ7U3S+mN9Oaqj9b4VH0H816NR
	 aW4KmXaNFwt7mjqwjkVmM0D5nAtIX47vvyfxBZ0vOaOZzP6JpncVhjwPB2W5l/lksT
	 auAnteK5DOGjy+WYIl0Rx7gjpaJG7uO7VMQlIYckeHbe1xmMjzG0mOstlAGdkKsyQw
	 Dsry9i81bHd0g==
Subject: Re: [PATCH net-next v2 1/3] rtnetlink: add AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 01:48:12 +0000
Message-ID: <178900489222.219967.5701707176821161509@kernel.org>
In-Reply-To: <20260909013401.14408-2-sigefriedhyy@gmail.com>
References: <20260909013401.14408-2-sigefriedhyy@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 2

- [Medium] rtnl_dump_mcaddr()/rtnl_dump_mcaddr_dev()
  (net/core/rtnetlink.c:4598-4623, 4655-4694) resume a multi-part…
- [Low] The commit message claims 'AF_UNSPEC keeps its "all families"
  meaning from RTM_GETADDR'.
- [Low] Concern (validated as resolved within this series): after this
  patch alone, Documentation/netlink/specs/rt-addr.yaml still described…

Pre-existing issues:
- [Medium] rtnl_fill_mcaddr() emits IFA_MULTICAST with a length read from
  dev->addr_len at dump time (net/core/rtnetlink.c:4588), while struct…

--

rtnetlink: add AF_PACKET multicast dumps

This adds a PF_PACKET RTM_GETMULTICAST dump handler that walks dev->mc and
reports each netdev_hw_addr in the existing ifaddrmsg format, so the
link-layer multicast filter no longer has to be read from
/proc/net/dev_mcast.  The handler runs unlocked with respect to RTNL, under
RCU and netif_addr_lock_bh().

A few questions below.

>     This covers every column of /proc/net/dev_mcast. AF_PACKET is the
>     family iproute2 already uses for link-layer addresses ("ip -0"), and
>     AF_UNSPEC keeps its "all families" meaning from RTM_GETADDR.

[Severity: Low]
Is the AF_UNSPEC part of this sentence accurate for RTM_GETMULTICAST?

Grepping the tree, RTM_GETMULTICAST has a dumpit registered only for
PF_INET (net/ipv4/devinet.c), PF_INET6 (net/ipv6/addrconf.c) and, with this
patch, PF_PACKET.  There is no PF_UNSPEC handler, so an AF_UNSPEC dump ends
up in the fallback in rtnetlink_rcv_msg():

	link = rtnl_get_link(family, type);
	if (!link || !link->dumpit) {
		family = PF_UNSPEC;
		link = rtnl_get_link(family, type);
		if (!link || !link->dumpit)
			goto err_unlock;

and returns -EOPNOTSUPP.

Additionally, rtnl_dump_all() explicitly skips PF_PACKET:

	if (idx < s_idx || idx == PF_PACKET)
		continue;

so even if a PF_UNSPEC RTM_GETMULTICAST handler were added later, these new
link-layer entries would not appear in an all-families dump.  Could the
changelog drop or reword that claim?

> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index 81c5a6104dea..b2febdb6915e 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -4566,6 +4566,133 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
>  	return skb->len ? : ret;
>  }
>  
> +static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
> +			    const struct netdev_hw_addr *ha, u32 portid,
> +			    u32 seq, unsigned int flags)
> +{
> +	struct ifaddrmsg *ifm;
> +	struct nlmsghdr *nlh;
> +
> +	nlh = nlmsg_put(skb, portid, seq, RTM_GETMULTICAST, sizeof(*ifm),
> +			flags);
> +	if (!nlh)
> +		return -EMSGSIZE;
> +
> +	ifm = nlmsg_data(nlh);
> +	ifm->ifa_family = AF_PACKET;
> +	ifm->ifa_prefixlen = 0;
> +	ifm->ifa_flags = ha->global_use ? IFA_F_PERMANENT : 0;
> +	ifm->ifa_scope = RT_SCOPE_LINK;
> +	ifm->ifa_index = dev->ifindex;
> +
> +	if (nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||

[Severity: Medium]
This isn't a bug introduced by this patch, but can this copy expose
uninitialized bytes from ha->addr?

The length comes from dev->addr_len as read at dump time, while the entry
was filled in at insertion time by __hw_addr_create() in
net/core/dev_addr_lists.c:

	ha = kmalloc(alloc_size, GFP_ATOMIC);
	if (!ha)
		return NULL;
	memcpy(ha->addr, addr, addr_len);

The allocation is not zeroed and only addr_len bytes of
ha->addr[MAX_ADDR_LEN] are written.

If dev->addr_len grows after the entry was created, the tail is
uninitialized heap.  One such path is tun's TUNSETLINK, which does:

	tun->dev->type = (int) arg;
	tun->dev->addr_len = tun_get_addr_len(tun->dev->type);

without flushing dev->mc, so a 6-byte entry added with SIOCADDMULTI while
the device was ARPHRD_ETHER would later be dumped as 16 bytes.

The same disclosure already exists through the world-readable
/proc/net/dev_mcast, where dev_mc_seq_show() prints with (int)dev->addr_len
over the same buffer, so this is not new here.  Would it make sense to
bound the copy (min_t(unsigned int, dev->addr_len, MAX_ADDR_LEN)) and/or
zero the allocation in __hw_addr_create()?

[Severity: Low]
With this patch alone, Documentation/netlink/specs/rt-addr.yaml still
describes operation getmulticast as:

      name: getmulticast
      doc: Get / dump IPv4/IPv6 multicast addresses.

while this reply carries a link-layer IFA_MULTICAST of dev->addr_len bytes,
no IFA_CACHEINFO, ifa_scope of RT_SCOPE_LINK and IFA_F_PERMANENT with a
different meaning.  The following patch in the series, "netlink: specs:
rt-addr: document AF_PACKET multicast dumps", updates that doc, so the
divergence only exists at this point in the series and needs no action.

> +	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount)) {
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
Can this positional resume cursor silently skip dev->mc entries?

Resume state is the ordinal position in the list, and both
netif_addr_lock_bh() and rcu_read_lock() are dropped before the callback
returns, so between netlink dump rounds a writer can unlink an entry that
sits before the saved index:

net/core/dev_addr_lists.c:__hw_addr_del_entry() {
	...
	list_del_rcu(&ha->list);
	kfree_rcu(ha, rcu_head);
	list->count--;
	...
}

Writers reaching that only need netif_addr_lock_bh() (dev_mc_del() from an
IGMP/MLD leave, SIOCDELMULTI, driver or bonding rx_mode churn), and RTNL
holders are free to run as well since the handler is registered with
RTNL_FLAG_DUMP_UNLOCKED.  Removing N entries ahead of the saved addr_idx
shifts the survivors down and drops N entries that were never reported;
device add/remove similarly shifts the for_each_netdev_dump() cursor.

Neither cb->seq nor nl_dump_check_consistent() is used here, so
NLM_F_DUMP_INTR can never be set and user space sees a truncated dump that
looks complete.

The sibling handler for the same message type does maintain that:

net/ipv4/devinet.c:inet_dump_addr() {
	...
	cb->seq = inet_base_seq(tgt_net);
	...
}

net/ipv4/devinet.c:in_dev_dump_ifmcaddr() {
	...
		nl_dump_check_consistent(cb, nlmsg_hdr(skb));
	...
}

Would setting cb->seq from a generation counter and calling
nl_dump_check_consistent() in rtnl_dump_mcaddr_dev() be appropriate here
too?

> +
> +	return err;
> +}
> +

[ ... ]

> +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
> +{
> +	struct net *net = sock_net(skb->sk);
> +	unsigned int flags = NLM_F_MULTI;
> +	struct {
> +		unsigned long ifindex;
> +		int addr_idx;
> +	} *ctx = (void *)cb->ctx;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909013401.14408-1-sigefriedhyy%40gmail.com
