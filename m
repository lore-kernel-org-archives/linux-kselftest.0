Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818352;
	b=5iF7g2Zos/eIGnakaJ4JaaAp0uOb8z3R+T3lQ3MmrU/CCLIR9rSHAPLhWRh3k7bOJ7cN
	 Taxk4Bxz9VuJg4OEvMSVuqHjYaH0Shsf41wjLCSNonB2WGBsQQ3CP8CXNi96jXE82sP1l
	 q4oTPMLrLhxI5S4zd5AEUJ5XMXruX4eM37avd5BUpO0sn0AqBtiBr6N3qEE/sEK9GEi4J
	 Nnmubojl5zHn58sYAB43Amyc/VSArOrQTEygu4HArLTRfq/R+y9MuYz9frGzNpxDgT4tt
	 coE8cMApdhWu4uB1WXLQP7BxWHY/CPbwf51myAPYCOkorZNRhsVzKnpVgZNSZsRDurQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818352;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a407YldGuJWXNb9YTA7Ms1UcaHO3fsUXFP5hDpnsY/Y=;
	b=k233Fd9LXNXGJkDtLNRGNdi3gf35tDfkRTZqjbqqi3FM6Qs5l67GJSzJWy1eZOnHEEV9
	 2jyH4Zpn09rp1T3876gLShgdwmVljXBhawUNWSvUUykxuRXzesweZixe1o7ABiqVxeGDH
	 /f+6eIZDZVe/8+vFbtEVg1aNC7FkOWCOqAAeEARjxMVkOO3oTtG6x0H8l1uPb0vhidFDj
	 M0WqtaBCao/oPsRrnJwL0CtOLzhTg1lK9gqKgW5Ud47AegZUh0ktIm3AX165JdhLhYgGv
	 ktCFa/O+vBGoipqoN3BAriLcbSVatdqm7oOaGYRciCZxi/m2Els6p19bYEu+0KefdYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnd86l91;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8929606A336;
	Fri, 27 Nov 2026 22:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnd86l91
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0561F00893;
	Fri, 27 Nov 2026 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795818352;
	bh=a407YldGuJWXNb9YTA7Ms1UcaHO3fsUXFP5hDpnsY/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nnd86l91UrVI7p/ywPaPNuin652GI835IX+s5tXGMVhiScfOYMuvrR33mvvlFo0Iu
	 M/kgjMxeXZZZaXb9Xsizm7GBhu9fCbhZk+yZzCPnb73S8MhLj8Mn3E37e3SeR0sTMM
	 1TlSxLfXnoBdJXZzaf0tvopH+OT4+Jei98WN857hz8wmpo2BZD/Aiww0J6Roci5Eyy
	 68un2ycx/xGpWFJhVb3zw7QEeq3/9CM9dmKohITCVm3e0dIVdzo1VD8zJEo1qD2NbD
	 DETjPFtLEIyHf4BSQwqCj3agh3cmUoFtgKjPMmF1k5mRPTp2gIll7WcfFQ8pwhy4m2
	 eLkT3L7rH2Utg==
Subject: Re: [PATCH net-next 3/5] docs: net: document the LISP devices
From: netdev-bot+sashiko@kernel.org
To: vjardin@free.fr
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 nicolas.dichtel@6wind.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 22:25:51 +0000
Message-ID: <179581835102.3135.8668737900789396018@kernel.org>
In-Reply-To: <20261126-for-upstream-lisp-v1-v1-3-7382a4bcfd9b@free.fr>
References: <20261126-for-upstream-lisp-v1-v1-3-7382a4bcfd9b@free.fr>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] lisp.rst says the metadata-collecting device "serves all the
  instance IDs that have no device of their own" (lines 42-43), and that…
- [Medium] The 'Checking the IP sources' section of
  Documentation/networking/lisp.rst (lines 122-127) is the only source…
- [Low] The example for the metadata-collecting device in
  Documentation/networking/lisp.rst fails if you run it as written.

--

docs: net: document the LISP devices

This commit adds Documentation/networking/lisp.rst. The new file covers
the two kinds of LISP devices, how routes and nexthops give the RLOCs, and
what checks the sources of decapsulated packets. The commit also adds the
file to the networking index, MAINTAINERS and the LISP Kconfig help text.

> diff --git a/Documentation/networking/lisp.rst b/Documentation/networking/lisp.rst
> new file mode 100644
> index 0000000000000..70ad8bb29700b
> --- /dev/null
> +++ b/Documentation/networking/lisp.rst
> @@ -0,0 +1,142 @@

[ ... ]

> +Devices
> +=======
> +
> +There are two kinds of LISP devices.
> +
> +A device (1) with an instance ID sends and receives the packets of that instance::
> +
> +  ip link add site type vrf table 10
> +  ip link set site up
> +  ip link add lisp101 type lisp id 101
> +  ip link set lisp101 master site up
> +
> +It is meant to be in the VRF of the EIDs of the instance: what it receives is
> +routed in that VRF, and the routes of that VRF send to it. A site has one
> +device per instance, whatever the number of remote sites.
> +
> +A device (2) that collects metadata serves all the instance IDs that have no device
> +of their own::

[Severity: Medium]
Does the driver follow this description when an instance ID device exists
but is down?

An instance ID device is added to the receive hash only in lisp_open(),
and lisp_stop() removes it:

drivers/net/lisp.c:lisp_open() {
    ...
		hlist_add_head_rcu(&lisp->hlist,
				   lisp_iid_head(found, lisp->iid));
    ...
}

drivers/net/lisp.c:lisp_stop() {
    ...
		hlist_del_rcu(&lisp->hlist);
    ...
}

When nothing in the hash matches, lisp_lookup() falls back to the
metadata device:

drivers/net/lisp.c:lisp_lookup() {
    ...
	hlist_for_each_entry_rcu(lisp, lisp_iid_head(ls, iid), hlist)
		if (lisp->iid == iid && rcu_access_pointer(lisp->sock) == ls)
			return lisp;

	return rcu_dereference(ls->md_dev);
}

Take lisp101 (id 101) down while lisp0 external stays up on the same RLOC
sockets. Wouldn't lisp_udp_encap_recv() then decapsulate the IID 101
packets on lisp0 with tun_id 101? They would be routed in lisp0's routing
domain instead of being dropped.

lisp_newlink() does treat a down device as the owner of its IID:

drivers/net/lisp.c:lisp_newlink() {
    ...
		if (tmp->iid == lisp->iid) {
			mutex_unlock(&ln->lock);
			NL_SET_ERR_MSG(extack,
				       "A LISP device already has this instance ID for these RLOCs");
			return -EEXIST;
    ...
}

Should lisp_lookup() stop at any registered device for the IID, up or
down? If not, could the document say that only an up device takes its IID,
and that the traffic of a down instance goes to the metadata device?

> +
> +  ip link add lisp0 type lisp external
> +

[ ... ]

> +An IPv6 nexthop is used by IPv4 and IPv6 routes. With the device that
> +collects metadata, the nexthop gives the instance ID too::
> +
> +  ip -6 nexthop add id 4 encap ip id 102 dst 192.0.2.1 dev lisp0

[Severity: Low]
Will this command fail when the examples are run in order? The Devices
section creates lisp0 with ip link add lisp0 type lisp external and never
brings it up, unlike lisp101. rtm_to_nh_config() rejects a nexthop whose
device is not up:

net/ipv4/nexthop.c:rtm_to_nh_config() {
    ...
		if (!(cfg->dev->flags & IFF_UP)) {
			NL_SET_ERR_MSG(extack, "Nexthop device is not up");
			return -ENETDOWN;
		}
    ...
}

The lisp.sh selftest added later in the series runs ip link set lispmd up
before it uses its collect_md device. Could ip link set lisp0 up be added
to the lisp0 example?

[ ... ]

> +The reverse path filter of IPv4 checks the source EID. With ``rp_filter`` set
> +to 1 for the LISP device, a packet is dropped unless the route to its source
> +sends to that device, that is, unless its source has a mapping in that
> +instance. The packets that it drops are counted as ``IPReversePathFilter``::
> +
> +  sysctl -w net.ipv4.conf.lisp101.rp_filter=1

[Severity: Medium]
Is the per-device setting enough to get the strict check described here?
The kernel uses the larger of the all value and the per-device value:

include/linux/inetdevice.h:
#define IN_DEV_RPFILTER(in_dev)		IN_DEV_MAXCONF((in_dev), RP_FILTER)

Documentation/networking/ip-sysctl.rst says the same: "The max value from
conf/{all,interface}/rp_filter is used".

Some distributions set net.ipv4.conf.all.rp_filter=2 by default. With that
setting the LISP device runs in loose mode. fib_validate_source() then
accepts a decapsulated packet if its inner source has any unicast route,
such as a default route in the VRF, even one that does not go through the
LISP device.

The device accepts UDP/4341 from any outer source for a matching IID. A
spoofed inner EID would then get into the VRF of the instance.

IPv6 EIDs on an instance ID device also get no built-in source check.
rp_filter only applies to IPv4, and lisp_udp_encap_recv() attaches the
outer RLOC as tunnel metadata only for collect_md devices:

drivers/net/lisp.c:lisp_udp_encap_recv() {
    ...
	if (lisp->collect_md) {
		IP_TUNNEL_DECLARE_FLAGS(flags) = { };

		__set_bit(IP_TUNNEL_KEY_BIT, flags);
		tun_dst = udp_tun_rx_dst(skb, family, flags,
    ...
}

So a tc enc_src_ip filter cannot be used on such a device.

Could this section state the max(all, dev) rule, or tell admins to set
conf.all.rp_filter to 0 or 1? Could it also point IPv6 users to the
netfilter rpfilter or fib match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b%40free.fr
