Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728027;
	b=BpiGx9Yl69AV8H8NxRx7x1mLp4j7RB2XBgvE2BETY3v4c16GN/rOcicvqMMqRGZgJ+C6
	 xJkemJTEGRg1qRiE51mlhCr8Bwhu0TDY7JacPu02gB/P9CqxUCaA2aqu2JffX//7wOle0
	 ORouVdFerb5SFfR5BMCyPqdYWftRsuj1P2ojZHTKKmsAETDaY1ptuIa6xvaSzDKG+0Sm4
	 Q2zhuIysfKCdBH4njx1LqJFijpSuzQlrGlA81Nve3v6GQN/1WxC1w2LdvyWosWbj+UfxM
	 SrlT+MayRh9fea36RqYRabzn/qHp1ik4FtMZJt6xug44ZucwTpvhA31o132qbS9rtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728027;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MdLocymIfUOTbasyv0c+gPZHRjx8+cIIkYhve/nhgK0=;
	b=RbnHKx5Cvs64kpi6pBwoQ7vBicW7Joyd0bVBQr5rsD6O9lS29geMzDN4FT88PatywvsF
	 OnRzPO+zkVjPMHwUF4pKnyq9Ir9ZfJV/h5Ml1ki8DciYRg4bsZfsUn2dcLG3T0vuYMt16
	 ZwzYnr2RNTsEibTqHAORUgnZTiogGRKYvrOf5sHAzGFagAQjlv5K4/Ez97+WZj8gOAbrl
	 WDBvVoox5kIZO+BSv4sKkx8evRPBJiMFYOspudOZ2kk31KVYLmZyipZJGRq52WldhQhvW
	 7d/xVmmZsD/9ckvogvVs3jXFejJocphafWBGXK5H67dVlPK9pk973ixj48uOG5RmHAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUNHJPAT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45846606A31C;
	Thu, 26 Nov 2026 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUNHJPAT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF9D1F00893;
	Thu, 26 Nov 2026 21:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728026;
	bh=MdLocymIfUOTbasyv0c+gPZHRjx8+cIIkYhve/nhgK0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KUNHJPATioGGypSl7o7R9Fb6HfN1LNbyljrOzYJisklOg3vvpvDbHgq44v+szjO1p
	 0drA4xcFYdXri8DXzpEDDSFpNohPAMb838YAWn1GkcDlRaxM6xqXfbtC4mJBaEGan6
	 Z9S5m5SXUAgg/rkq8CxNv6vymuLIBCbKZUZaovNXmXvHf/LzYQpm651nBySxdPpzCv
	 JQPvKZS28BghDnwLphwpZnedbbS3sagSdcV8D3oPHS9LabXQ8O88RbLk9KwCQNimfL
	 YrqgZtJLrF6F3JkYg8FuvrVSkY5hQc51YXMaDyeKlzSUxKbGpkBn4NYf26MBNhEP9t
	 c/KQM1ZNsoIMw==
Subject:
 Re: [PATCH net-next v2 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
From: netdev-bot+sashiko@kernel.org
To: kalash@nexthop.ai
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org,
 joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 26 Nov 2026 21:20:25 +0000
Message-ID: <179572802536.3135.6305865608768923950@kernel.org>
In-Reply-To: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai>
References: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai>
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

- [Medium] The commit message names the real cause of the misselection:
  the lookup returns whichever reuseport listener is first in the listen…
- [Low] The new net_cachelines documentation row lists
  sysctl_tcp_l3mdev_exempt_ports as an RX fast-path field:…

--

tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl

This commit adds a per-netns port bitmap sysctl,
net.ipv4.tcp_l3mdev_exempt_ports. For listed ports, an unbound listener
does not match connections that arrive through an L3 master device
(sdif != 0) during listener lookup, even with tcp_l3mdev_accept=1. The
goal is for VRF connections to reach the VRF-bound listener when both
listeners use SO_REUSEPORT.

> diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> index 2833ce6cba1d4..062153c2793c7 100644
> --- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> +++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> @@ -150,6 +150,7 @@ struct_ping_group_range         ping_group_range
>  atomic_t                        dev_addr_genid
>  unsigned_int                    sysctl_udp_child_hash_entries
>  unsigned_long*                  sysctl_local_reserved_ports
> +unsigned_long*                  sysctl_tcp_l3mdev_exempt_ports                                   read_mostly         __inet_lookup_listener/inet6_lookup_listener

[Severity: Low]
This row marks sysctl_tcp_l3mdev_exempt_ports as read_mostly on the RX
fast path. In struct netns_ipv4, though, the field is added to the
CONFIG_SYSCTL area next to sysctl_local_reserved_ports. That is outside
the netns_ipv4_read_rx group:

include/net/netns/ipv4.h:
	__cacheline_group_begin(netns_ipv4_read_rx);
	u8 sysctl_tcp_moderate_rcvbuf;
	u8 sysctl_ip_early_demux;
	u8 sysctl_tcp_early_demux;
	u8 sysctl_tcp_l3mdev_accept;
	...
	__cacheline_group_end(netns_ipv4_read_rx);

netns_ipv4_struct_check() in net/core/net_namespace.c also has no
CACHELINE_ASSERT_GROUP_MEMBER() for it. Other read_mostly RX fields,
such as sysctl_tcp_l3mdev_accept, do have one.

Should the document leave the fast path columns empty for this field?
Or should the field move into netns_ipv4_read_rx with a matching
assertion?

>  int                             sysctl_ip_prot_sock
>  struct_mr_table*                mrt
>  struct_list_head                mr_tables

[ ... ]

> diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
> index 860145d810ed4..063f6dd00a64d 100644
> --- a/net/ipv4/inet_hashtables.c
> +++ b/net/ipv4/inet_hashtables.c
> @@ -362,6 +362,11 @@ static inline int compute_score(struct sock *sk, const struct net *net,
>  
>  		if (!inet_sk_bound_dev_eq(net, sk->sk_bound_dev_if, dif, sdif))
>  			return -1;
> +
> +		if (!sk->sk_bound_dev_if && sdif &&
> +		    tcp_port_l3mdev_exempt(net, hnum))
> +			return -1;
> +
>  		score =  sk->sk_bound_dev_if ? 2 : 1;

[Severity: Medium]
The commit message gives the cause of the misselection: "the lookup
returns whichever is first in the listen bucket, not the VRF-bound one".
Is a per-port opt-in sysctl the right fix for that, rather than a change
to the lookup itself?

The early return is in inet_lhash2_lookup():

	sk_nulls_for_each_rcu(sk, node, &ilb2->nulls_head) {
		score = compute_score(sk, net, hnum, daddr, dif, sdif);
		if (score > hiscore) {
			result = inet_lookup_reuseport(net, sk, skb, doff,
						       saddr, sport, daddr, hnum, inet_ehashfn);
			if (result)
				return result;

The first reuseport socket that scores above zero is returned at once,
and the rest of the bucket is never scored. So the higher score for a
device-bound listener (sk->sk_bound_dev_if ? 2 : 1) has no effect.
inet6_lhash2_lookup() has the same early return.

inet_reuseport_add_sock() requires sk2->sk_bound_dev_if ==
sk->sk_bound_dev_if, so the unbound and bound listeners are always in
separate reuseport groups.

inet_hash() puts AF_INET6 reuseport sockets at the tail of the bucket
and all other sockets at the head. That explains the IPv4/IPv6
difference.

With this patch the default list is empty. For every port that is not
listed, the IPv4/IPv6 inconsistency and the TCP-MD5/AO bypass from the
commit message still happen.

The new check is also gated on sdif. What about the same setup without
a VRF? For example:

  - an unbound SO_REUSEPORT listener and an SO_BINDTODEVICE(eth0)
    SO_REUSEPORT listener on the same port
  - a SYN arrives on eth0, so sdif == 0

inet_bound_dev_eq() matches both sockets. The unbound listener can still
win when it is first in the bucket, whatever the sysctl is set to.

Selecting purely by score has caveats of its own. The sk_incoming_cpu
bonus can raise an unbound IPv6 listener to the score of a bound one
(1+1 vs 2). Changing the default lookup behavior could also affect
existing deployments.

Could the commit message explain why a new UAPI knob was chosen instead
of fixing the selection order in inet_lhash2_lookup() and
inet6_lhash2_lookup()?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e%40nexthop.ai
