Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818351;
	b=RlAWyPRWGcrpCl60shnnjI6jqf9c0XiSnB9udVpVYlasSKSBLm8A30PSvBBUSUBsdxFo
	 sVWGkrnklNlIez5FVqKNoFPr9XfQwyfome4rZH4stFo1FpEWHvK0R00ceg0Bh6V15yxoM
	 Saxysj5kk+OPwtGeonaOsFiS61biEkFCesvBYsSJzDPCBf0pOZDfVHXuJyuFcV3TVqo4J
	 YoGu5BDoEWDGg3iLzJ4iDrcQJczLxIABu7JPTLsEAf0F/6ufAhb44BXFWolMMXM+j4hY6
	 irQCKEylWpnOGiLLfUgxi+ZJcbFZBJkJWyUMiRtuIPr4NxPOGrepaNtRUx6OSl5DBWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818351;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=J3OXrB+qnfqs8J/pcjSchgPpiMrzp5iVIsEEnVjP9x0=;
	b=S3/cH584RgPO98Z7VKHy4vel6WCZ6yhIRqw8fApG6Xp7SSnTXSS5l53Ns+CaeM6eF28F
	 iBJlYYEKidC6jKsVlzOeZXwtC+8Ooi4SiQI2+fDHY4B2hJg/VqCvVrwWZtQkZX/PygNfx
	 M6k/3ysP5lieX+fmKlAbmZoaB+joL8EpkBED47m8US4iIsMzy0+G4PktgcejjvobBvfVY
	 0FJJmxR4MHkP6e46+GTpSX0CMVLOV4v7PmLbs9zcnee1Xf2G9UPlUEWZbJZ6HYzAIivAa
	 m20XJI4LDY5bsFk9y/5/bZPdymUZ+nnJVMzPdc41b1OIzc2FTUlBSrBTSNovoE8lSDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvETFVJz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33605606A31C;
	Fri, 27 Nov 2026 22:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvETFVJz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCC81F00893;
	Fri, 27 Nov 2026 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795818350;
	bh=J3OXrB+qnfqs8J/pcjSchgPpiMrzp5iVIsEEnVjP9x0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kvETFVJzro+dil6nqdRekj5ajUY5DqVgP+NfLdPRaeTp0gVgHF2elnzohQtxmtLuR
	 vDNSB7mqTKmvsyxh/qG1ojIEs+GjlpgaEobqmf4Lt0cOEft1gGuOzdJSnV3kRDX1gz
	 ilMj0dNQ5XdcyL/NYvfaWTQk2dyhKFz2Fle+DGCwOgUHgczmQ1XWktk5SNICDIj/ef
	 WoRHQQTzxwpXlWFAVw7ent73U73bg1lJkTQyvLPRPOf7Np6yZnpHvIr7sVBnW0ABzH
	 yVKkzHy4IZQ9mC+QDCEK6nvzM6cSQZezAq2K5zo/Jdg8NH2C9iQUMk0NH+JPm6h48P
	 DRCrF0zvNTP/A==
Subject:
 Re: [PATCH net-next 1/5] lisp: add LISP (Locator/ID Separation Protocol)
From: netdev-bot+sashiko@kernel.org
To: vjardin@free.fr
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 nicolas.dichtel@6wind.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 22:25:48 +0000
Message-ID: <179581834896.3135.15923750690737278293@kernel.org>
In-Reply-To: <20261126-for-upstream-lisp-v1-v1-1-7382a4bcfd9b@free.fr>
References: <20261126-for-upstream-lisp-v1-v1-1-7382a4bcfd9b@free.fr>
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

- [Medium] lisp_stop() unlinks a non-collect_md device's node from its
  socket's IID hash chain with hlist_del_rcu() (lisp.c:414) and returns…
- [Low] drivers/net/lisp.c does not build or link when CONFIG_IPV6=n.

--

lisp: add LISP (Locator/ID Separation Protocol)

This adds a LISP (RFC 9300) data plane tunnel device. It encapsulates IPv4
and IPv6 packets in a LISP header over UDP port 4341. The RLOC of each
packet comes from the lightweight tunnel metadata of its route or nexthop,
and the kernel keeps no map-cache.

> diff --git a/drivers/net/lisp.c b/drivers/net/lisp.c
> new file mode 100644
> index 0000000000000..8f5a79c88b2c1
> --- /dev/null
> +++ b/drivers/net/lisp.c
> @@ -0,0 +1,1033 @@

[ ... ]

> +static int lisp_stop(struct net_device *dev)
> +{
> +	struct lisp_dev *lisp = netdev_priv(dev);
> +	struct lisp_sock *ls;
> +	struct lisp_net *ln;
> +
> +	ln = net_generic(lisp->net, lisp_net_id);
> +	mutex_lock(&ln->lock);
> +
> +	ls = rcu_dereference_protected(lisp->sock, lockdep_is_held(&ln->lock));
> +	RCU_INIT_POINTER(lisp->sock, NULL);
> +	if (lisp->collect_md)
> +		RCU_INIT_POINTER(ls->md_dev, NULL);
> +	else
> +		hlist_del_rcu(&lisp->hlist);

[Severity: Medium]
Can this node be linked again before a grace period has passed?

hlist_del_rcu() leaves lisp->hlist.next pointing into the old chain, and
lisp_stop() returns without waiting. __dev_close_many() calls
dev_deactivate_many() before ndo_stop, so the close path does not wait
after this point either.

The next lisp_open() then does:

	hlist_add_head_rcu(&lisp->hlist,
			   lisp_iid_head(found, lisp->iid));

That overwrites lisp->hlist.next. lisp_l3mdev() is computed again on every
open. If the link moved to another VRF while the device was up, found can
be a different lisp_sock than before.

Take a reader on the old socket A that is sitting on this node, in
lisp_udp_encap_recv()->lisp_lookup(). It would follow the new next pointer
into socket B's bucket:

	hlist_for_each_entry_rcu(lisp, lisp_iid_head(ls, iid), hlist)
		if (lisp->iid == iid && rcu_access_pointer(lisp->sock) == ls)
			return lisp;

	return rcu_dereference(ls->md_dev);

Every entry in B's chain fails the lisp->sock == ls test. So any device
that came after the moved node in A's bucket (same hash_32(iid, 10) value)
is skipped. Its packet is then dropped or delivered to A's collect_md
device.

The comment in lisp_lookup() covers stale matches from a device that
moved. Does it also cover valid entries being skipped like this? Memory
stays valid, since lisp_dev and lisp_sock outlive the readers.

Would hlist_del_init_rcu() followed by synchronize_net() in lisp_stop()
avoid this? Delaying the re-add until after a grace period would also
work.

> +
> +	if (--ls->refcnt) {
> +		mutex_unlock(&ln->lock);
> +		return 0;
> +	}

[ ... ]

> +static netdev_tx_t lisp_xmit(struct sk_buff *skb, struct net_device *dev)
> +{

[ ... ]

> +	rcu_read_lock();
> +	ls = rcu_dereference(lisp->sock);
> +	if (!ls)
> +		err = -ESHUTDOWN;
> +	else if (ip_tunnel_info_af(info) == AF_INET)
> +		err = lisp_xmit_skb(skb, dev, ls->sk4, info, iid);
> +	else if (ls->sk6)
> +		err = lisp6_xmit_skb(skb, dev, ls->sk6, info, iid);

[Severity: Low]
Does this link when CONFIG_IPV6=n?

The LISP Kconfig entry only has "depends on INET", so CONFIG_LISP=y or m
with CONFIG_IPV6=n is a valid config. Only the runtime test on ls->sk6
guards this call, so the compiler cannot drop it. lisp6_xmit_skb() calls
udp_tunnel6_dst_lookup() and udp_tunnel6_xmit_skb().

include/net/udp_tunnel.h declares those helpers without !IPV6 stubs. They
are defined only in net/ipv6/ip6_udp_tunnel.c, and net/ipv6/Makefile
builds that file only when CONFIG_IPV6 is set:

ifneq ($(CONFIG_IPV6),)
obj-$(CONFIG_NET_UDP_TUNNEL) += ip6_udp_tunnel.o

With CONFIG_LISP=y the link would fail. With CONFIG_LISP=m, modpost would
report the symbols as undefined. The later patches in the series do not
seem to change lisp.c or the Kconfig dependencies.

bareudp_xmit() avoids this with a guard that folds at compile time:

	if (ipv6_mod_enabled() && info->mode & IP_TUNNEL_INFO_IPV6)

Could this branch test ipv6_mod_enabled() or IS_ENABLED(CONFIG_IPV6)?
Adding "depends on IPV6" to the Kconfig entry would also work.

> +	else
> +		err = -EAFNOSUPPORT;
> +	rcu_read_unlock();

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b%40free.fr
