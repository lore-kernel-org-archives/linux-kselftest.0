Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756548BD26;
	Thu, 10 Sep 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048206; cv=none; b=HkfRP8aTyKuqNVTxI3DlOEvKYkJS6CNJlyun2LLFL4xHIujjZSvA2Va9UN8HRElRQM/eVQrkKL5aOIKhtSrCSL18C7RuWQBRQv3iok/2YXcmePoBDMRGa8XeJxYM0atCV7jUjhe12Au4jcrl8qVW+VcCTxM6tNZ/+CqvltRLJ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048206; c=relaxed/simple;
	bh=MIXE/W4RO33rQpcRvhYiNVz6zaRrWHTgVZbD09GCHzQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IsvlM3pkMt5OxznJ45WlhyYE/PaEiQXHAc/klLGLRx8oDd8CYuyXe8uj3K1rz9FXmXs3dtKsAiiDf9Fn0POKLN/7l16q6Sr3mwRqK4VxG1P0xxE8dgbDtZaiAFpZRP25ptc7jKLwROG8qf2OncOnE+2RiMDsh09lB/iSQbrYRNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5g62xOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5g62xOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5251F000FF;
	Thu, 10 Sep 2026 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048203;
	bh=m2jNU5rjsTN3mxv0EJo4IljU7NWJsCPiExkQq1NXtvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I5g62xOL5JCOlCFuPrreFrvEXwvQuCgsG+YorA81WiaUg9iSpx4QlXXFyHf6I267L
	 AH5J952cbvckl3qJHKwSCIOsMR8/tuSYdqq/3rJMStb+9ymSvdAlX0pWjkuGYPDgHi
	 ta3X/fDPqO0ufwX4y4lE8f7Y33zitOByoXy4JSMddaXw+IMUgGq2X1CX1de23cKWc+
	 CSOYY+qMDbnqSMZ7T0azRlN8MJaItyemaTjR9SfLIDSzxtHSff/Ud2n+oB8CMBSEFP
	 dlekwM9FPs5QeM9VQNjoaIQ3IyoQrZiYiz4F/Kc5yJnpgVypgnkeEjYJi7II3ps+iC
	 fq22GVDEJxavA==
Subject: Re: [PATCH net-next v3 2/4] rtnetlink: add AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 13:50:02 +0000
Message-ID: <178904820206.219967.5313952981588630189@kernel.org>
In-Reply-To: <20260909133247.113923-3-sigefriedhyy@gmail.com>
References: <20260909133247.113923-3-sigefriedhyy@gmail.com>
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
  (net/core/rtnetlink.c:4603-4728) resume a multi-part…
- [Medium] The commit message claims "AF_UNSPEC keeps its 'all families'
  meaning from RTM_GETADDR".
- [Low] Incomplete submission claim: the new IFA_F_GLOBAL uAPI flag is
  added only to include/uapi/linux/if_addr.h while the in-tree mirror…
- [Low] Claim that Documentation/netlink/specs/rt-addr.yaml is not
  updated for the new AF_PACKET producer: the ifa-flags enum lacks a…

--

rtnetlink: add AF_PACKET multicast dumps

This adds an RTM_GETMULTICAST dump handler for ifa_family AF_PACKET which
walks dev->mc and reports each entry as an ifaddrmsg with IFA_MULTICAST,
IFA_MC_USERS and the new IFA_F_GLOBAL flag in IFA_FLAGS. The handler is
registered under PF_PACKET with RTNL_FLAG_DUMP_UNLOCKED and runs under RCU
plus netif_addr_lock_bh().

A note on the commit message first:

> This covers every column of /proc/net/dev_mcast. AF_PACKET is the
> family iproute2 already uses for link-layer addresses ("ip -0"), and
> AF_UNSPEC keeps its "all families" meaning from RTM_GETADDR.

[Severity: Medium]
Is the AF_UNSPEC part of this sentence accurate for RTM_GETMULTICAST?

RTM_GETMULTICAST only has PF_INET (net/ipv4/devinet.c), PF_INET6
(net/ipv6/addrconf.c) and the new PF_PACKET registration; rtnl_dump_all is
wired to RTM_GETADDR, RTM_GETROUTE and RTM_GETNETCONF only. In
rtnetlink_rcv_msg() the dump lookup falls back to PF_UNSPEC and then errors
out:

	link = rtnl_get_link(family, type);
	if (!link || !link->dumpit) {
		family = PF_UNSPEC;
		link = rtnl_get_link(family, type);
		if (!link || !link->dumpit)
			goto err_unlock;
	}

so wouldn't an ifa_family == AF_UNSPEC RTM_GETMULTICAST dump return
-EOPNOTSUPP rather than dumping all families?

And even with a PF_UNSPEC handler wired to rtnl_dump_all(), that loop skips
PF_PACKET:

	if (idx < s_idx || idx == PF_PACKET)
		continue;

which would keep the new link-layer entries out of a combined dump. Could
this sentence be reworded to say userspace has to issue an explicit
AF_PACKET request?

> diff --git a/include/uapi/linux/if_addr.h b/include/uapi/linux/if_addr.h
> index 7fb630b7fe31..0a1ad9ebb47b 100644
> --- a/include/uapi/linux/if_addr.h
> +++ b/include/uapi/linux/if_addr.h
> @@ -57,6 +57,7 @@ enum {
>  #define IFA_F_NOPREFIXROUTE	0x200
>  #define IFA_F_MCAUTOJOIN	0x400
>  #define IFA_F_STABLE_PRIVACY	0x800
> +#define IFA_F_GLOBAL		0x1000

[Severity: Low]
This isn't a bug, but the in-tree mirror tools/include/uapi/linux/if_addr.h
is listed in tools/perf/check-headers.sh and does not get the new define, so
a perf build will report the two copies as differing. The mirror already
lags at the baseline commit (it is missing IFA_MC_USERS), so this changes
nothing observable, and tools/ resyncs are usually separate commits. Was a
resync intended here?

The selftest side of the same concern is already handled later in the
series: "selftests: net: test AF_PACKET multicast dumps" adds
dump_mcaddr_l2_check() to tools/testing/selftests/net/rtnetlink.py covering
the ifa-index filter, mc-users, the global flag and target-netnsid.

>  
>  struct ifa_cacheinfo {
>  	__u32	ifa_prefered;
> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index 81c5a6104dea..f54e9cb3bf30 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -4566,6 +4566,169 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
>  	return skb->len ? : ret;
>  }
>  
> +static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
> +			    const struct netdev_hw_addr *ha, u32 portid,
> +			    u32 seq, unsigned int flags, int netnsid)
> +{
> +	u32 ifa_flags = ha->global_use ? IFA_F_GLOBAL : 0;

[ ... ]

> +	if ((netnsid >= 0 &&
> +	     nla_put_s32(skb, IFA_TARGET_NETNSID, netnsid)) ||
> +	    nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
> +	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount) ||
> +	    nla_put_u32(skb, IFA_FLAGS, ifa_flags)) {

[Severity: Low]
This isn't a bug in the code, but at this commit
Documentation/netlink/specs/rt-addr.yaml has no "global" entry in the
ifa-flags enum for bit 0x1000, and the getmulticast operation still lists a
reply of {multicast, mc-users, cacheinfo} with an empty dump request
attribute list, while this function emits IFA_FLAGS and IFA_TARGET_NETNSID
and rtnl_valid_dump_mcaddr_req() accepts IFA_TARGET_NETNSID.

The following commit in the series, "netlink: specs: rt-addr: document
AF_PACKET multicast dumps", adds "- name: global" as the 13th ifa-flags
entry, adds flags and target-netnsid to the reply attributes and
target-netnsid to the dump request, and updates the op doc, so this only
matters for bisectability of the generated bindings.

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
Can this skip or duplicate dev->mc entries across a multi-part dump without
telling userspace?

rtnl_dump_mcaddr_dev() resumes with a bare positional index and drops the
lock protecting dev->mc when it returns:

	netif_addr_lock_bh(dev);
	netdev_for_each_mc_addr(ha, dev) {
		if (addr_idx < *s_addr_idx) {
	...
	netif_addr_unlock_bh(dev);

	*s_addr_idx = err < 0 ? addr_idx : 0;

Between two netlink_dump() invocations dev->mc can be mutated by
__dev_mc_add()/__dev_mc_del()/dev_mc_flush() in net/core/dev_addr_lists.c,
which only take netif_addr_lock_bh(dev):

	netif_addr_lock_bh(dev);
	err = __hw_addr_add_ex(&dev->mc, addr, dev->addr_len, ...

and the handler is registered with RTNL_FLAG_DUMP_UNLOCKED, so RTNL does
not serialize this either. If an entry before *s_addr_idx is removed the
next entry is silently skipped; if one is inserted an entry is emitted
twice.

The sibling RTM_GETMULTICAST producers mark that case. in_dev_dump_ifmcaddr()
calls, per message:

		nl_dump_check_consistent(cb, nlmsg_hdr(skb));

with cb->seq initialised from inet_base_seq(tgt_net) by the caller, so
userspace gets NLM_F_DUMP_INTR. rtnl_dump_ifinfo() and inet6_dump_addr() do
the same.

> +
[ ... ]
> +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
> +{
[ ... ]
> +	err = rtnl_valid_dump_mcaddr_req(cb->nlh, skb->sk, &filter,
> +					 cb->extack);
> +	if (err < 0)
> +		return err;
> +
> +	rcu_read_lock();
> +
> +	if (filter.ifindex) {

[Severity: Medium]
This is the spot where the sibling dumps set cb->seq from a generation
counter before iterating, for example inet6_dump_addr() and
inet_dump_addr(). Should rtnl_dump_mcaddr() do the same so that
nl_dump_check_consistent() in rtnl_dump_mcaddr_dev() can raise
NLM_F_DUMP_INTR?

struct netdev_hw_addr_list has no generation field today:

	struct netdev_hw_addr_list {
		struct list_head	list;
		int			count;
		...
	};

so would this need a new counter bumped by __hw_addr_add_ex()/
__hw_addr_del_entry(), or would reusing something like dev_base_seq or a
dev_addr_genid style value be enough here?

> +		cb->answer_flags |= NLM_F_DUMP_FILTERED;
> +		flags |= NLM_F_DUMP_FILTERED;
> +		dev = dev_get_by_index_rcu(filter.tgt_net, filter.ifindex);
[ ... ]
> +	for_each_netdev_dump(filter.tgt_net, dev, ctx->ifindex) {
> +		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags,
> +					   filter.netnsid);
> +		if (err < 0)
> +			break;
> +	}
> +out:
> +	rcu_read_unlock();
> +	if (filter.netnsid >= 0)
> +		put_net(filter.tgt_net);
> +	return err;
> +}
> +
[ ... ]
> @@ -7251,6 +7414,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
>  	{.msgtype = RTM_SETSTATS, .doit = rtnl_stats_set},
>  	{.msgtype = RTM_NEWLINKPROP, .doit = rtnl_newlinkprop},
>  	{.msgtype = RTM_DELLINKPROP, .doit = rtnl_dellinkprop},
> +	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
> +	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

[Severity: Medium]
This registration is PF_PACKET only, which is the basis of the commit
message question above about AF_UNSPEC keeping its "all families" meaning
for RTM_GETMULTICAST.

>  	{.protocol = PF_BRIDGE, .msgtype = RTM_GETLINK,
>  	 .dumpit = rtnl_bridge_getlink},

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909133247.113923-1-sigefriedhyy%40gmail.com
