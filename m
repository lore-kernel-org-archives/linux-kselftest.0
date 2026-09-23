Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69162DF13F;
	Wed, 23 Sep 2026 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122755; cv=none; b=buSlokXAeNUBpGjt/s2OpcJ9YzjYS2wY4uAzbbmWPh7R32iFP9yu8n3phcopFX8tWOEhzMjg/l+4vKAqIBYmdcIuegvVjvZPKEj4VNAsqSTot2TJmFQ2XXwCK/Snck0INoM4gsAbzIsvfXJarnnVRAA87gORoQ9gttOcUpASz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122755; c=relaxed/simple;
	bh=CGtjxCX0qbM44FqbhEIENCuMLk53KZEZen+jRshi17o=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PNhi2Ok8V7M5AvEOxkjSNIekKrPYyRFd3r/R6PX5mYa1dy/9/UoVzHorE4DoDsCA7L0GMEczLDh2wlbT1DU23Jjv/ewo5KeEDSNlhqNBkaId1P4f6s6uTl7pTG5P2+0aX+RsbHCfYUOCBNo/cNoHN8gFhaoOacF2dar16qhWFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ct6R0efG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ct6R0efG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B601F000FF;
	Wed, 23 Sep 2026 00:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790122753;
	bh=QX4aWXGyyRTFuOU9wd7z1HhmhDSg11bESRI3/PwP3bg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ct6R0efGlYiadlUWrinBje2+WcmsvHEJ5OqzmDzEn1MPrMZIeKc/N+alNsxLiLhaM
	 bY5Im9PAg5ybydwdmaByrJhEO+GC/iOhOAUDvLYqEVBhSUw47QsffTgbuaz/W0c9zu
	 dqT6zWWnYDOFoZgYlm/3TpCtZMmWVz5EmjSzOk5mzghnC1uoPvPf9uiX04eMQpTYLZ
	 OEM2meuz6zVNtY2evSgNW9vrr/0T8Wob7GpfvTR2GY1PqscCC2h2Eq6t5sKg9sV3Fv
	 FzqgbVab8gIcDydsakRTPMjO3Mp0KhHsOxHFRJvZXqPZmF062hm1emm1ykerm3lYyr
	 FU0bIbYoiEalw==
Subject:
 Re: [PATCH net-next v6 4/4] selftests: net: test AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Wed, 23 Sep 2026 00:19:11 +0000
Message-ID: <179012275175.2160803.16091441325063775173@kernel.org>
In-Reply-To: <20260921235951.3214-5-sigefriedhyy@gmail.com>
References: <20260921235951.3214-5-sigefriedhyy@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] dev_mc_fill_addr() (net/core/dev_addr_lists.c:1210) emits
  IFA_MULTICAST with `nla_put(skb, IFA_MULTICAST, dev->addr_len,…
- [Medium] dump_mcaddr_l2_check()
  (tools/testing/selftests/net/rtnetlink.py:113) issues the new…

--

selftests: net: test AF_PACKET multicast dumps

Adds dump_mcaddr_l2_check() to tools/testing/selftests/net/rtnetlink.py,
which dumps the link-layer multicast addresses of dummy devices over
AF_PACKET RTM_GETMULTICAST and checks the ifa-index filter, the global
flag, mc-users and target-netnsid handling.

> diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
> index dc8c77db48974..5534ade056a5c 100755
> --- a/tools/testing/selftests/net/rtnetlink.py
> +++ b/tools/testing/selftests/net/rtnetlink.py

[ ... ]

> @@ -105,6 +110,69 @@ def dump_mcaddr6_check() -> None:
>                  s2.close()
>  
>  
> +def dump_mcaddr_l2_check() -> None:
> +    """
> +    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
> +    dump: the ifa-index filter, mc-users, the global flag and
> +    target-netnsid.
> +    """
> +
> +    with NetNS() as ns, NetNSEnter(str(ns)):
> +        for ifname in ("dummy1", "dummy2"):
> +            ip(f"link add name {ifname} type dummy")
> +            ip(f"link set {ifname} up")
> +        dev_idx = socket.if_nametoindex("dummy1")
> +        ip(f"maddr add {ETH_TEST_MULTICAST_STR} dev dummy1")
> +
> +        rtnl = RtnlAddrFamily()
> +        defer(rtnl.close)
> +        addresses = rtnl.getmulticast(
> +            {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
> +            dump=True)

[Severity: Medium]
Should this dump be guarded so that an older kernel produces a skip
instead of a failure?

On a kernel without the PF_PACKET RTM_GETMULTICAST registration,
rtnetlink_rcv_msg() looks up the handler for the requested family, then
retries with PF_UNSPEC:

net/core/rtnetlink.c:rtnetlink_rcv_msg() {
	...
	link = rtnl_get_link(family, type);
	if (!link || !link->dumpit) {
		family = PF_UNSPEC;
		link = rtnl_get_link(family, type);
		if (!link || !link->dumpit)
			goto err_unlock;
	...
}

There is no PF_UNSPEC RTM_GETMULTICAST dumpit (only PF_INET in
net/ipv4/devinet.c and PF_INET6 in net/ipv6/addrconf.c, plus the
PF_PACKET entry added by this series), so err stays at its -EOPNOTSUPP
initialisation and an error ack comes back. ynl then turns that into an
exception:

tools/net/ynl/pyynl/lib/ynl.py:YnlFamily._op() {
	...
                if nl_msg.error:
                    raise NlError(nl_msg)
	...
}

which ksft_run() reports as "not ok" plus a traceback.

The two neighbouring tests in this same file take the other route:
_users_for() returns None when mc-users is absent, and
dump_mcaddr_check()/dump_mcaddr6_check() convert that into
raise KsftSkipEx("kernel does not expose IFA_MC_USERS"). Would wrapping
the first getmulticast() call and raising KsftSkipEx on NlError keep this
new case consistent with the rest of the file when the selftest tree is
newer than the kernel under test?

> +
> +        # dummy2 has entries as well, only dummy1 may be listed
> +        ksft_eq({addr['ifa-index'] for addr in addresses}, {dev_idx},
> +                "AF_PACKET multicast dump ignored ifa-index filter")
> +
> +        entries = {addr['multicast']: addr for addr in addresses}

[Severity: High]
The IFA_MULTICAST payload consumed here is emitted by dev_mc_fill_addr()
in net/core/dev_addr_lists.c, added by this series, using the device's
current addr_len for every entry of dev->mc:

net/core/dev_addr_lists.c:dev_mc_fill_addr() {
	...
	    nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
	...
}

Each entry was created with an unzeroed allocation where only addr_len
bytes were written:

net/core/dev_addr_lists.c:__hw_addr_create() {
	...
	ha = kmalloc(alloc_size, GFP_ATOMIC);
	if (!ha)
		return NULL;
	memcpy(ha->addr, addr, addr_len);
	...
}

ha->addr is MAX_ADDR_LEN (32) bytes, so bytes addr_len..31 hold stale
slab contents. Can this dump then copy uninitialised heap bytes to user
space if dev->addr_len grows after the entry was inserted?

The sequence I end up with is:

  1. create a tap device (ARPHRD_ETHER, addr_len 6; tun_net_mclist is
     provided as .ndo_set_rx_mode, which SIOCADDMULTI requires per
     net/core/dev_ioctl.c)
  2. ip maddr add 01:00:5e:01:01:01 dev tap0, so __hw_addr_create()
     copies 6 bytes
  3. with the device down, TUNSETLINK to ARPHRD_TUNNEL6:

drivers/net/tun.c:__tun_chr_ioctl() {
	...
			tun->dev->type = (int) arg;
			tun->dev->addr_len = tun_get_addr_len(tun->dev->type);
	...
}

     addr_len becomes sizeof(struct in6_addr), and dev->mc is not
     flushed; the NETDEV_PRE_TYPE_CHANGE handlers only drop the
     protocol-joined mappings via ip_mc_unmap()/ipv6_mc_unmap(), not
     global_use entries
  4. an AF_PACKET RTM_GETMULTICAST dump (RTNL_KIND_GET, no capability
     required) now returns 16 bytes for that entry, 10 of which were
     never initialised

The pre-existing dev->mc dump path does not reach this because it is
gated on the device type:

net/core/rtnetlink.c:ndo_dflt_fdb_dump() {
	...
	if (dev->type != ARPHRD_ETHER)
		return -EINVAL;
	...
}

The new dump has no such restriction. Would bounding the copy by what was
actually initialised - recording or clamping a per-entry length, or
zeroing ha->addr in __hw_addr_create() - be preferable to trusting
dev->addr_len here?

For the record, the bonding path is not a trigger: bond_enslave() calls
dev_uc_flush()/dev_mc_flush() immediately before bond_setup_by_slave()
changes addr_len, so only the tun/tap TUNSETLINK path above applies.

> +
> +        # Bringing an Ethernet device up joins 224.0.0.1, which maps
> +        # to 01:00:5e:00:00:01 in the device multicast list.
> +        all_hosts = entries.get(ETH_ALL_HOSTS_MULTICAST)
> +        ksft_not_none(all_hosts,
> +                      "dummy1 does not have the all-hosts link-layer address")
> +        if all_hosts is not None:
> +            ksft_not_in('global', all_hosts['flags'],
> +                        "protocol entry is global")
> +
> +        static = entries.get(ETH_TEST_MULTICAST)
> +        ksft_not_none(static, "dummy1 does not have the SIOCADDMULTI address")
> +        if static is not None:
> +            ksft_eq(static['mc-users'], 1,
> +                    "unexpected mc-users for the SIOCADDMULTI address")
> +            ksft_in('global', static['flags'],
> +                    "SIOCADDMULTI entry is not global")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921235951.3214-1-sigefriedhyy%40gmail.com
