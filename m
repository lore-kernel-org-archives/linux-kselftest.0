Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562728;
	b=RPwimiQUfP7Mk8HwbAT0hKwBWH3oBLs+3icHE6g1Dr7pS9coUHDVcPO0dY6IGL2QnKhT
	 TyJeIwawxyPOwwqn3THqNFq8c4YVfGM+MczYLTD8xnkiw9YYgsgR2a0ZwbF9ykXbfCP5r
	 MQIzwUVrmX3kcv6FV+ioSgGwRkaChqZnMCjwfZc/Oh8Pa+WVpUUWVNjxk0Bgy5PrzFxPF
	 Py3gEA9w6jtZ8nVcFBIICCuSLIW4gz0ccx48BR3UAQIP+FIXfGU3viS8Nl6h9qosLpiVn
	 iwm2IUiX5ahzEGKtVOzrL13AsmkrYMDi3tCdAFf00hj+pVX/koZqnMraf5TkvYoRz3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562728;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IZBmkb0U/QIBwfBUymnZbxWQi8N60YGG6y4MWPENMg8=;
	b=eftDT2oS72ljtt2W5beyqTvpcOuuL2kD7a4ir+nxPtVYM+qHSW9MK/agSo1VqjX78+G8
	 07jdPbWVTEudxzyXmCG+OAF52U4WoITCR6h3G27MsISH9slzfQFLhkvwEdS7vXiThwr3X
	 ZXbDp6rYvREokUavFh+GGYkdq49Yp4B8YBjyDLkZbLMtysRQfqjnJllPIXn1apYk7hss3
	 NV2Ydcqzpoo6zfu8egNTdbKMEG/DNkFNbX7j935SnsCJGsp5XWW3xTcQB++KWSMU5LoQ+
	 aXmYWcItSCh9CUiV0rvFtMRbUVtoJnmYFT0/cELH7syqhYFUIiMtJdiSF8wu7qB2Vdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwftxduu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29100606A683;
	Tue, 24 Nov 2026 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwftxduu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8992D1F00A3E;
	Tue, 24 Nov 2026 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795562727;
	bh=IZBmkb0U/QIBwfBUymnZbxWQi8N60YGG6y4MWPENMg8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hwftxduuDWJYL0Xme3tEF20H1MKfwVcWhpFKGqcxVloho9Ufa6V+56Dgb5ee1SlI9
	 v2IhxwRvthV1uXcdONMEtPYln7H1FpGm9HjkT8xCNVSuUwwkPb4oFHZrreSHoBzJ1M
	 43BLUDy2AJpnTG897oTpeQpDr6WULfNmP9gKUPJ9JSCYM8Qs+kGPpNB2Kv82FXgwgi
	 //MVK6ewjJ5nBhOkhKnKFdnKblNwmN1heivTbmqSMUP6kCtuG4n2NvNb8XEcPtge5l
	 rbFrp4Wcg7TOMMncV/q8ZpdHnp0pesfs9D3clIHJTimVBvDSAeMmog3zwvhlpx0S/Q
	 lTBw+ghiLkjUA==
Subject:
 Re: [PATCH net-next 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
From: netdev-bot+sashiko@kernel.org
To: kalash@nexthop.ai
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 24 Nov 2026 23:25:26 +0000
Message-ID: <179556272605.3135.9300919500524716345@kernel.org>
In-Reply-To: <20261120-tcp-l3mdev-exempt-ports-v1-1-ccc2a3a6cd09@nexthop.ai>
References: <20261120-tcp-l3mdev-exempt-ports-v1-1-ccc2a3a6cd09@nexthop.ai>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message describes a bug in TCP listener lookup, and
  the patch works around it with a new opt-in UAPI knob instead of…
- [Medium] The documentation and code comment promise more than the code
  does.
- [Low] tcp_l3mdev_exempt_ports only changes how tcp_l3mdev_accept
  behaves, but it is not config-gated the way that sysctl is.
- [Low] The patch adds `unsigned long *sysctl_tcp_l3mdev_exempt_ports` to
  struct netns_ipv4 (include/net/netns/ipv4.h:274) but does not update…
- [Low] The new ip-sysctl.rst text says that for a listed port "only a
  listen socket bound to the L3 master device" matches VRF connections.
- [Low] Updates to the new per-netns bitmap are not atomic with respect
  to the TCP listener lookup that reads it.

--

tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl

This adds a per-netns port bitmap sysctl that uses the same format as
ip_local_reserved_ports. When tcp_l3mdev_accept=1, an unbound TCP listener
on a listed port no longer matches connections that arrive on an L3 master
device slave, so only a VRF-bound listener can take them. The check is
added to the IPv4 and IPv6 listener compute_score() functions.

> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index 3cc80d9b024b1..1de0ee5c0d5b5 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -619,6 +619,25 @@ tcp_l3mdev_accept - BOOLEAN
>  
>  	Default: 0 (disabled)
>  
> +tcp_l3mdev_exempt_ports - list of comma separated ranges
> +	TCP ports for which tcp_l3mdev_accept is ignored. When

[Severity: Medium]
Is "tcp_l3mdev_accept is ignored" accurate? The comment above
tcp_port_l3mdev_exempt() in include/net/ip.h makes a similar claim, that
listed ports "behave as if tcp_l3mdev_accept were 0".

The only new check is in the two listener compute_score() functions. Other
users of sysctl_tcp_l3mdev_accept still apply the global value to listed
ports.

Established and request socket matching in inet_match() and inet6_match()
goes through inet_sk_bound_dev_eq(), which never looks at the bitmap. An
unbound established socket on a listed port still matches segments with
the same 4-tuple that arrive on a VRF slave.

Bind buckets are keyed on inet_sk_bound_l3mdev():

include/net/inet_sock.h:inet_sk_bound_l3mdev() {
    ...
	if (!READ_ONCE(net->ipv4.sysctl_tcp_l3mdev_accept))
		return l3mdev_master_ifindex_by_index(net,
						      sk->sk_bound_dev_if);
    ...
}

With tcp_l3mdev_accept=1 this returns 0. The callers are
inet_csk_get_port(), inet_csk_find_open_port(), __inet_inherit_port(),
__inet_hash_connect() and __inet_bhash2_update_saddr(). So an unbound
socket and a VRF-bound socket on a listed port still share one bind
bucket. They still fail with EADDRINUSE unless SO_REUSEPORT is set. With
tcp_l3mdev_accept=0 they would land in separate buckets.

inet_request_bound_dev_if() also still uses tcp_l3mdev_accept when it
sets the child's bound device.

Should the documentation and the comment say this only covers listener
lookup? Or should the exemption also apply to these paths?

> +	tcp_l3mdev_accept is enabled, a listen socket that is not bound to
> +	an L3 master device also matches connections that arrive in an L3
> +	domain (e.g., a VRF). For a port in this list, such a socket does
> +	not match these connections; only a listen socket bound to the L3
> +	master device does. Connections that do not arrive in an L3 domain

[Severity: Low]
Is "only a listen socket bound to the L3 master device does" accurate?
The new check only filters out sockets with sk_bound_dev_if == 0. For
bound sockets, inet_bound_dev_eq() still does:

	return bound_dev_if == dif || bound_dev_if == sdif;

That means a listener bound to the enslaved ingress device (dif) can
also match these connections.

> +	are not affected. This applies to both IPv4 and IPv6.
> +

[ ... ]

> diff --git a/include/net/ip.h b/include/net/ip.h
> index 5035b313a26b0..c6581080a9a47 100644
> --- a/include/net/ip.h
> +++ b/include/net/ip.h
> @@ -396,6 +396,20 @@ static inline bool inet_port_requires_bind_service(struct net *net, unsigned sho
>  }
>  #endif
>  
> +/* Ports listed in net.ipv4.tcp_l3mdev_exempt_ports behave as if
> + * tcp_l3mdev_accept were 0: an unbound listener does not match traffic
> + * received on an L3 master device slave. Applies to IPv4 and IPv6.
> + */
> +static inline bool tcp_port_l3mdev_exempt(const struct net *net,
> +					  unsigned short port)
> +{
> +#ifdef CONFIG_SYSCTL
> +	if (net->ipv4.sysctl_tcp_l3mdev_exempt_ports)
> +		return test_bit(port, net->ipv4.sysctl_tcp_l3mdev_exempt_ports);

[Severity: Low]
compute_score() reads this bitmap without a lock in softirq context. The
writer, proc_do_large_bitmap(), takes no lock either and updates the
bitmap in place:

kernel/sysctl.c:proc_do_large_bitmap() {
    ...
			if (*ppos)
				bitmap_or(bitmap, bitmap, tmp_bitmap, bitmap_len);
			else
				bitmap_copy(bitmap, tmp_bitmap, bitmap_len);
    ...
}

If the written list is longer than PAGE_SIZE-1 bytes, only the first
chunk is parsed. That chunk replaces the whole bitmap and the write
returns short. The rest comes in a later write() at *ppos > 0 and is
ORed in.

Consider a port that is in both the old and the new list but appears late
in the string. Between those two write() calls, could a SYN for that port
arriving in a VRF be accepted by the unbound listener, without the TCP-MD5
or TCP-AO key that the VRF-bound listener has?

Two concurrent writers could also interleave and leave a mix of both
lists.

> +#endif
> +	return false;
> +}

[ ... ]

> diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
> index 3efbc7f4b4f7d..899d90f34a716 100644
> --- a/include/net/netns/ipv4.h
> +++ b/include/net/netns/ipv4.h
> @@ -271,6 +271,7 @@ struct netns_ipv4 {
>  
>  #ifdef CONFIG_SYSCTL
>  	unsigned long *sysctl_local_reserved_ports;
> +	unsigned long *sysctl_tcp_l3mdev_exempt_ports;

[Severity: Low]
This isn't a bug, but should
Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst be updated
for the new field? That file lists the neighbouring
sysctl_local_reserved_ports and sysctl_ip_prot_sock fields, and lists
sysctl_tcp_l3mdev_accept as RX read_mostly.

The new pointer is read on the TCP RX listener lookup path. It sits in
the CONFIG_SYSCTL area, not in the netns_ipv4_read_rx group, which is
where net_namespace.c asserts sysctl_tcp_l3mdev_accept lives.

>  	int sysctl_ip_prot_sock;
>  #endif
>  
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

[Severity: Medium]
The commit message describes a bug in the listener lookup itself. Would
it be better to fix the lookup than to add an opt-in knob?

In inet_lhash2_lookup(), and likewise in inet6_lhash2_lookup(), the
first socket with score > hiscore that belongs to a reuseport group is
returned immediately:

		if (score > hiscore) {
			result = inet_lookup_reuseport(net, sk, skb, doff,
						       saddr, sport, daddr, hnum, inet_ehashfn);
			if (result)
				return result;

Sockets later in the bucket are never checked, even if they would score
higher.

inet_reuseport_add_sock() only groups sockets with the same bound device:

		    sk2->sk_bound_dev_if == sk->sk_bound_dev_if &&

So an unbound listener and a VRF-bound listener are always in different
reuseport groups, and whichever group comes first in the bucket wins.

__inet_hash() adds AF_INET6 reuseport sockets at the tail and everything
else at the head. That is why IPv4 and IPv6 end up picking different
listeners.

The new sysctl is empty by default. Unless the admin knows to list the
port, the IPv4/IPv6 inconsistency remains. So does the TCP-MD5/AO bypass
for IPv6 VRF peers that the commit message describes.

The check is also broader than the problem requires. For a listed port,
it rejects the unbound listener for traffic from every VRF, including
VRFs that have no bound listener of their own. A setup with a dedicated
listener for VRF A and an unbound listener serving the other VRFs on the
same port can't be configured.

Could the commit message explain why the lookup wasn't fixed instead?

A lookup fix would also need a scoring change. The sk_incoming_cpu bonus
can tie a bound IPv4 listener (2+1=3) with an unbound IPv4 listener on
the matching CPU (1+1+1=3).

> +
>  		score =  sk->sk_bound_dev_if ? 2 : 1;
>  
>  		if (sk->sk_family == PF_INET)
> diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
> index 9df93ad219db8..83d0030512aa5 100644
> --- a/net/ipv4/sysctl_net_ipv4.c
> +++ b/net/ipv4/sysctl_net_ipv4.c
> @@ -840,6 +840,13 @@ static const struct ctl_table ipv4_net_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= proc_do_large_bitmap,
>  	},
> +	{
> +		.procname	= "tcp_l3mdev_exempt_ports",
> +		.data		= &init_net.ipv4.sysctl_tcp_l3mdev_exempt_ports,
> +		.maxlen		= 65536,
> +		.mode		= 0644,
> +		.proc_handler	= proc_do_large_bitmap,
> +	},

[Severity: Low]
Should this entry be under #ifdef CONFIG_NET_L3_MASTER_DEV, as
tcp_l3mdev_accept is? Its documentation says it is "Only valid when the
kernel was compiled with CONFIG_NET_L3_MASTER_DEV". The documentation for
tcp_l3mdev_exempt_ports doesn't mention that dependency.

Without CONFIG_NET_L3_MASTER_DEV, inet_sdif(), tcp_v4_sdif() and
tcp_v6_sdif() always return 0. The new check in both compute_score()
functions can then never fire.

ipv4_sysctl_init_net() still allocates the bitmap for every netns:

	net->ipv4.sysctl_tcp_l3mdev_exempt_ports = kzalloc(65536 / 8, GFP_KERNEL);

So on those kernels the knob accepts writes, has no effect, and costs
8 KiB per network namespace.

>  	{
>  		.procname	= "ip_no_pmtu_disc",
>  		.data		= &init_net.ipv4.sysctl_ip_no_pmtu_disc,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-tcp-l3mdev-exempt-ports-v1-0-ccc2a3a6cd09%40nexthop.ai
