Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7B34B2CC5;
	Tue, 15 Sep 2026 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490862; cv=none; b=WXC5qmQRtQ6dR/RX9bJ8WTtuMxeWNCCBO/mNTzFnTdWjdDzJFYtNVGKLjEIs1/dEOF+myS56f4hbotmaKKSR09m8bW8vyf/NLthchFw4/7IRbtwgZz7bDillWPhcqmx567WohxmYdZmJ5GOhN5ZftC6tDJ+T5BIRPMPjmZp6V80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490862; c=relaxed/simple;
	bh=0UbxSj3ntTXHh3sXNxhY/94cHXVP7FcpFpKeTKHqyU4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nhmZZ8MpqCfdXt0k9tau58oh9bYW5JAn8td1UWswTRnTlnAprik0Ywr2EM5qj+inTg7210Eyl7FL4Q5tCr8Bf+yom/6jKRflSl8HBQWpkYrPJGpFoG1PAxjKPIYpTi77cl+MhuuImm+v999JO0WisyZcdzxUi31g7/PKrxamJhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifdMOliG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifdMOliG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D381F00893;
	Tue, 15 Sep 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490853;
	bh=iKhgrbJhNzFogK77tQO9Djxtpxy8p5128nicHkebFuA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ifdMOliGN1F0YGOOIGe+jLmAKMwHORDAfi8FLeCHxYDWoj9Bpfo2XOhaPJYmfwFTV
	 msddS7R7sjlUPVacpzkiKGcmCrY26aLr1c1Q6yVJmMAZrdmmbW2cyGetHX+EKyQ9mO
	 WPBMVHDl6X9UOnl4lEXXlqS2F0e0a3DSTt37cE9eL9dE1STo7Xk54dtBGewI9X7tWE
	 SQg85VhtAHLWFknUF3tqzu9uCXV+sFYOuYAR49EIRYhIc5yIm6jRTs69pdvRx3kcrb
	 6J8oyTwR6ZcQv3ef5WvX9AEDG9kkpQfBwFHir/7e74PELfHBamRj9P7B5uT4fhCAjP
	 XZTHLwm+t53RA==
Subject: Re: [PATCH net-next v5 3/4] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Tue, 15 Sep 2026 16:47:31 +0000
Message-ID: <178949085181.22033.17665408034284926571@kernel.org>
In-Reply-To: <20260914014539.5015-4-sigefriedhyy@gmail.com>
References: <20260914014539.5015-4-sigefriedhyy@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 (1) · Low: 1 (1)

- [Low] The new `getmulticast` doc text (Documentation/netlink/specs/rt-
  addr.yaml:173-179) documents only the ifa-family selector.

Pre-existing issues:
- [Medium] Documentation/netlink/specs/rt-addr.yaml describes a `do`
  (single-message get) variant of `getmulticast` (lines 182-193), and…
- [Low] The patch adds `target-netnsid` to the shared `getmulticast`
  reply attribute set (&mcaddr-attrs, Documentation/netlink/specs/rt-…

--

netlink: specs: rt-addr: document AF_PACKET multicast dumps

This adds the global address flag to the rt-addr spec, extends the
getmulticast reply attribute list with flags and target-netnsid, and
rewrites the operation doc to explain how ifa-family selects IPv4, IPv6
or link-layer output.

> diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
> index 17ead22034515..1a17e55d1cca0 100644
> --- a/Documentation/netlink/specs/rt-addr.yaml
> +++ b/Documentation/netlink/specs/rt-addr.yaml

[ ... ]

> @@ -168,7 +170,13 @@ operations:
>            attributes: *ifaddr-all
>      -
>        name: getmulticast
> -      doc: Get / dump IPv4/IPv6 multicast addresses.
> +      doc: |
> +        Get / dump multicast addresses. ifa-family must select the address
> +        family: AF_INET or AF_INET6 for the IP multicast groups joined on
> +        a device, AF_PACKET for the link-layer multicast addresses in the
> +        device filter. Link-layer entries added explicitly, e.g. with
> +        SIOCADDMULTI or "bridge fdb add ... self", rather than by a
> +        protocol join are reported with the global flag set.

[Severity: Low]
This isn't a bug, but the new doc text describes only the ifa-family
selector, while the AF_PACKET dump path added by the sibling commit
"rtnetlink: add AF_PACKET multicast dumps" enforces two further
request-side rules in rtnl_valid_dump_mcaddr_req():

net/core/rtnetlink.c:rtnl_valid_dump_mcaddr_req() {
	if (ifm->ifa_prefixlen || ifm->ifa_flags || ifm->ifa_scope) {
		NL_SET_ERR_MSG(extack,
			       "Invalid values in multicast dump header");
		return -EINVAL;
	}
	...
	filter->ifindex = ifm->ifa_index;
}

Should the doc mention that ifa_prefixlen, ifa_flags and ifa_scope must
be zero for AF_PACKET, which is stricter than the AF_INET/AF_INET6
behaviour of the same operation?

A caller reusing an ifaddrmsg from a getaddr reply, with a non-zero
ifa_scope still in it, gets -EINVAL with nothing in the spec explaining
why.

Should the doc also mention that ifa-index restricts the dump to a single
device, and that the reply then carries NLM_F_DUMP_FILTERED? Right now
that filter is not discoverable from the spec.

>        attribute-set: addr-attrs
>        fixed-header: ifaddrmsg
>        do:
> @@ -181,10 +189,13 @@ operations:
>              - multicast
>              - mc-users
>              - cacheinfo
> +            - flags
> +            - target-netnsid

[Severity: Medium]
This isn't a problem introduced by this patch, but since the patch
extends this block it may be worth resolving here: the spec advertises a
do (single-message get) variant of getmulticast, yet no family registers
a doit handler for RTM_GETMULTICAST.

net/ipv4/devinet.c:
	{.owner = THIS_MODULE, .protocol = PF_INET, .msgtype = RTM_GETMULTICAST,
	 .dumpit = inet_dump_ifmcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

net/ipv6/addrconf.c:
	{.owner = THIS_MODULE, .protocol = PF_INET6, .msgtype = RTM_GETMULTICAST,
	 .dumpit = inet6_dump_ifmcaddr,
	 .flags = RTNL_FLAG_DUMP_UNLOCKED},

net/core/rtnetlink.c (the new AF_PACKET registration):
	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

All three provide .dumpit only, and there is no PF_UNSPEC entry, so a
non-dump request ends up here:

net/core/rtnetlink.c:rtnetlink_rcv_msg() {
	link = rtnl_get_link(family, type);
	if (!link || !link->doit) {
		family = PF_UNSPEC;
		link = rtnl_get_link(PF_UNSPEC, type);
		if (!link || !link->doit)
			goto out_unlock;
	}
}

and returns -EOPNOTSUPP. Would it make sense to drop the do: block
instead of extending its reply list, so ynl-generated clients do not
emit a single-object get that can never succeed?

[Severity: Low]
This is a pre-existing kernel-side gap rather than something this patch
introduces, but target-netnsid is being added to the shared
&mcaddr-attrs anchor used by all three families. The AF_PACKET and
AF_INET6 emitters do put the attribute:

net/core/rtnetlink.c:rtnl_fill_mcaddr() {
	if ((netnsid >= 0 &&
	     nla_put_s32(skb, IFA_TARGET_NETNSID, netnsid)) ||
}

net/ipv6/addrconf.c:inet6_fill_ifmcaddr() {
	if (args->netnsid >= 0 &&
	    nla_put_s32(skb, IFA_TARGET_NETNSID, args->netnsid)) {
}

The AF_INET emitter does not, even though inet_valid_dump_ifaddr_req()
accepts IFA_TARGET_NETNSID and stores it in fillargs.netnsid:

net/ipv4/igmp.c:inet_fill_ifmcaddr() {
	if (nla_put_in_addr(skb, IFA_MULTICAST, im->multiaddr) < 0 ||
	    nla_put_u32(skb, IFA_MC_USERS, READ_ONCE(im->users)) < 0 ||
	    nla_put(skb, IFA_CACHEINFO, sizeof(ci), &ci) < 0) {
}

So an AF_INET multicast dump against another namespace never reports the
netnsid that its AF_INET6 and AF_PACKET peers report. Would a one-line
follow-up in inet_fill_ifmcaddr() be worth doing so the three families
agree with what the spec now lists?

>        dump:
>          request:
>            value: 58
> -          attributes: []
> +          attributes:
> +            - target-netnsid
>          reply:
>            value: 58
>            attributes: *mcaddr-attrs

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914014539.5015-1-sigefriedhyy%40gmail.com
