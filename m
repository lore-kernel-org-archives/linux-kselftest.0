Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91642D592C;
	Wed, 23 Sep 2026 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122753; cv=none; b=XENIcipavSdaQrMXZalItrx3vXUBB9zoPGf8jbB2bkxPl0ErYM6E3r1fiNWTJE4wCp4L21e3lQvjZbTC3Jv64kzFWsx3oBF/Oy6qXH1jO+5Syab49SZgSXBxpHRYakaQlFyvmVG1pGVCAi15yeixEsxApjMTajGdsa/n5RCoqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122753; c=relaxed/simple;
	bh=TROaLcEnt6IP8M6dfs8FzdIHRulbOj0BqY6zDTM6Z60=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VN0GHcyFAu2keFYTpZVr4zk10T2HusseST8ObEMVbsHcHxSVLk3DnGDfk9anlJJK3CeXlXqBMwJ8+d1lLXfHPXwvd6na4Wr7YlfybjU/2Ct3CDF3bqpK7QAZXFS2xAuwrmNzJCAI4TbOxF1yivrV+sKNQZF1PMNoLyJrSPB5R+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2cGT+Tu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2cGT+Tu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9567B1F00893;
	Wed, 23 Sep 2026 00:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790122751;
	bh=1Zpa2vfOKVwL+CTe4hc/tD12/KKGPFOKFOexwGKucpk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X2cGT+TuGjJpGeC3RHxUN5/7gs/zBT9XL6iZMRmJxmuY7YreWdkT5Oxn5zgmUrR4c
	 6dK9gSqotxf4cr5U2mcT9OyQsCqryAPLDc6GCXZnvVWDqJ/qOWyOZrpKs7i47y2wcR
	 2bSN0inBqx/nmA66dXATt5Xl9cjbrQPJFGpnIBqBx10ZPePT758ZiOMVAdRbjLDZ7u
	 SGOV0lEne7wI+YoNmryNXalgMNaTA9JxSdvRz9gBV886LOq26R5MBHZM25Bcxs+EZi
	 mCqATldQWjf9pdQjFEoLPjjVMSrumD+eJNv0QQS7s7PdBOGCFoKX0dgoR4HpRg1Uae
	 fW18efWW6ccVg==
Subject: Re: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Wed, 23 Sep 2026 00:19:10 +0000
Message-ID: <179012275019.2160803.2891956767256297440@kernel.org>
In-Reply-To: <20260921235951.3214-3-sigefriedhyy@gmail.com>
References: <20260921235951.3214-3-sigefriedhyy@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] dev_mc_dump()/dev_mc_dump_dev() resume a paused dump with a
  bare positional index into dev->mc (ctx->addr_idx / *s_addr_idx) and…
- [Low] uAPI vs netlink YAML spec out of sync: the patch adds
  IFA_F_GLOBAL (0x1000), emits IFA_FLAGS/IFA_TARGET_NETNSID in…

--

net: add AF_PACKET multicast dumps

This adds an RTM_GETMULTICAST dump handler for ifa_family AF_PACKET that
reports every entry of dev->mc in the ifaddrmsg format, with the raw
link-layer address in IFA_MULTICAST, the reference count in IFA_MC_USERS
and a new IFA_F_GLOBAL bit mirroring netdev_hw_addr::global_use.  The
dump runs under RCU and netif_addr_lock_bh() without RTNL.

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
This isn't a bug, just an observation about the intermediate state of the
series: this commit adds the new bit 12 and starts emitting IFA_FLAGS and
IFA_TARGET_NETNSID for AF_PACKET RTM_GETMULTICAST, but
Documentation/netlink/specs/rt-addr.yaml is not touched here.  At this
commit the ifa-flags enum still ends at stable-privacy, the getmulticast
dump request lists no attributes, the reply set is {multicast, mc-users,
cacheinfo} and the op doc mentions IPv4/IPv6 only, so a spec driven
decoder such as ynl would see bit 12 as unknown and would not describe
target-netnsid or flags.

The next patch in the series, "netlink: specs: rt-addr: document AF_PACKET
multicast dumps", adds "- name: global" to ifa-flags, adds target-netnsid
to the dump request, adds flags and target-netnsid to the shared
mcaddr-attrs reply set and updates the doc, so the gap is closed within
the series.  Would it be worth folding the spec update into this commit so
that no bisect point emits attributes the spec does not describe?

> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index 08528ca0a8b31..b69565f8ff05b 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c

[ ... ]

> @@ -1180,6 +1184,179 @@ void dev_mc_init(struct net_device *dev)

[ ... ]

> +static int dev_mc_dump_dev(struct net_device *dev, struct sk_buff *skb,
> +			   struct netlink_callback *cb, int *s_addr_idx,
> +			   unsigned int flags, int netnsid)
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
> +		err = dev_mc_fill_addr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
> +				       cb->nlh->nlmsg_seq, flags, netnsid);
> +		if (err < 0)
> +			break;
> +		nl_dump_check_consistent(cb, nlmsg_hdr(skb));
> +		addr_idx++;
> +	}
> +	netif_addr_unlock_bh(dev);
> +
> +	*s_addr_idx = err < 0 ? addr_idx : 0;
> +
> +	return err;
> +}

[Severity: Medium]
Can this dump silently skip or repeat a dev->mc entry without setting
NLM_F_DUMP_INTR?

The resume cursor here is a bare ordinal into dev->mc, and
netif_addr_lock_bh(dev) is dropped before returning, so the lock is not
held across a dump round boundary:

	*s_addr_idx = err < 0 ? addr_idx : 0;

If round N stops at ordinal k+1 and an entry before k is removed while the
dump is paused, every later entry shifts down by one and round N+1 starts
at k+1, so the entry that moved from k+1 to k is never reported.  An
insertion before the cursor reports one entry twice.

The only consistency stamp is dev_base_seq:

> +	cb->seq = READ_ONCE(filter.tgt_net->dev_base_seq);

and dev_base_seq_inc() is called only from list_netdevice() and
unlist_netdevice() in net/core/dev.c, so it tracks device register and
unregister, not dev->mc mutations.  nl_dump_check_consistent() therefore
cannot raise NLM_F_DUMP_INTR for the mutation that breaks the resume
index, and user space sees what looks like a complete, consistent dump.

The writers are reachable without any privilege, for instance
IP_DROP_MEMBERSHIP: __ip_mc_dec_group()->ip_mc_filter_del()->dev_mc_del(),
or IP_ADD_MEMBERSHIP: ip_mc_inc_group()->dev_mc_add(), and multiple dump
rounds happen as soon as the reply does not fit in one skb.

> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index e3444fd240615..204dc9040e3cc 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -7278,6 +7278,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
>  	{.msgtype = RTM_SETSTATS, .doit = rtnl_stats_set},
>  	{.msgtype = RTM_NEWLINKPROP, .doit = rtnl_newlinkprop},
>  	{.msgtype = RTM_DELLINKPROP, .doit = rtnl_dellinkprop},
> +	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
> +	 .dumpit = dev_mc_dump, .flags = RTNL_FLAG_DUMP_UNLOCKED},

Since RTNL_FLAG_DUMP_UNLOCKED is used, even the dev->mc writers that do
hold RTNL (SIOCADDMULTI via dev_mc_add_global(), "bridge fdb add ... self"
via dev_mc_add_excl(), dev_mc_flush()) are free to run between two rounds
of this dump.  Would a generation counter bumped on dev->mc changes, and
folded into cb->seq, be needed here, or could the resume point be keyed on
the address itself rather than on its position in the list?

The commit message says:

    stamps cb->seq from dev_base_seq so a device added or removed between
    dump rounds sets NLM_F_DUMP_INTR

That statement is accurate for device add and remove, but should it also
note that changes to the dumped objects themselves, the dev->mc entries,
are not covered by that counter?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921235951.3214-1-sigefriedhyy%40gmail.com
