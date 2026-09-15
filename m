Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51554B4897;
	Tue, 15 Sep 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490864; cv=none; b=S1aKJ6VdajzFWgw717ezH6wjJxUj31s+kI962cUAXK3lgfPn0k9UgVyDHjJG02vHNbkDvY1H/+SHgX7O4qk1GmEsOfyZfxMzZu3ZVfDc7V8M2R7hPc12aaF+dAboXuK6PHHK831rkeYSsioGp2nrAYhNjsBit68xeAcJpg5F4Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490864; c=relaxed/simple;
	bh=4e8Edf/zSUV2pcCcsK0IJFkZeM8VT/stO2Hps18qSXQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Efsx+cmrtwEzVcjSeDSfuphXWK4ce+fzpro/p+RzXDKcykOLNFsqv+nSmmd4V1kTIto+hJl6Usg0nAilWzKqtQIHoPC7NTDek2j+x7DnhVoLVOQdDwgDzVR4V/x+NRPFVbmlScausPqEkz9ZTjMxasmCQWQHa353Gze6vyE+ESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsDotScJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsDotScJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121CF1F00898;
	Tue, 15 Sep 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490855;
	bh=wQTGhVBk/d9xhwVchhz7P4qAlWwtKub4VGlwBeDzFTQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZsDotScJsk1Pa2VDvs0VNmPKY0Bihf6hD1OvFVRkHQAGVn99JGIc2rnP6n7G0NLp1
	 8U9xIq02Pp0X1bVnNvY1hb5B85iOByAkFdyhsXFR9T8IXLmmNkg95b6RugRTWSrshQ
	 BGvk6hKh1j9IIV8AIhlrQbvcqsJbcIK6q1EhatBNUCEaXlXJNEmBu8+5hObLbn0RWy
	 4xQUhfZGs2jOmTrLB7jP2SbW3JNDBAXchPlDBCIiwP64Hg/FiLBMlKJ0t1/rCgNp1a
	 /fkt54WaxI9O5rcox+Ivodzg+FvFQL/z6Kz/+Us9ulbpy6GpwOaKkLNs9Z/bvQLT4o
	 +LR4xcXsE8TTg==
Subject:
 Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Tue, 15 Sep 2026 16:47:33 +0000
Message-ID: <178949085358.22033.18209492388519439190@kernel.org>
In-Reply-To: <20260914014539.5015-5-sigefriedhyy@gmail.com>
References: <20260914014539.5015-5-sigefriedhyy@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] In `dump_mcaddr_l2_check()`
  (tools/testing/selftests/net/rtnetlink.py:161-173) the…

--

selftests: net: test AF_PACKET multicast dumps

This adds dump_mcaddr_l2_check() to tools/testing/selftests/net/rtnetlink.py,
dumping the link-layer multicast list of a dummy device and checking the
ifa-index filter, the global flag, mc-users, and a dump of another netns via
target-netnsid. The test skips when the kernel returns EOPNOTSUPP for the
AF_PACKET dump.

> diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
> index 5cc3ebdcf08de..d69d375a2deff 100755
> --- a/tools/testing/selftests/net/rtnetlink.py
> +++ b/tools/testing/selftests/net/rtnetlink.py

[ ... ]

> @@ -105,6 +109,70 @@ def dump_mcaddr6_check() -> None:
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

[ ... ]

> +        # target-netnsid dumps another netns, ifa-index is relative to it
> +        with NetNS() as peer:
> +            ip(f"netns set {peer} 5")
> +            ip("link add name dummy3 type dummy", ns=peer)
> +            ip("link set dummy3 up", ns=peer)
> +            peer_idx = ip("link show dummy3", json=True, ns=peer)[0]['ifindex']
> +
> +            addresses = rtnl.getmulticast(
> +                {"ifa-family": socket.AF_PACKET, "target-netnsid": 5,
> +                 "ifa-index": peer_idx}, dump=True)
> +            ksft_eq({(addr['ifa-index'], addr['target-netnsid'])
> +                     for addr in addresses}, {(peer_idx, 5)},
> +                    "target-netnsid did not dump the peer netns")

[Severity: Medium]
Can this final assertion actually distinguish a dump of the peer netns from
a dump of the socket's own netns?

The test body runs inside a fresh netns, so lo is 1, dummy1 is 2 and dummy2
is 3, making dev_idx equal to 2.  The peer netns is created by NetNS(), which
just does:

tools/testing/selftests/net/lib/py/netns.py:NetNS.__init__() {
    ...
    ip('netns add ' + self.name)
    ...
}

so the peer contains only lo (1) plus dummy3, and peer_idx ends up as 2 as
well - the same ifindex as dummy1 in the enclosing netns.

On the kernel side, rtnl_dump_mcaddr() starts with the socket's namespace:

net/core/rtnetlink.c:rtnl_dump_mcaddr() {
    ...
    struct rtnl_mcaddr_dump_filter filter = {
        .tgt_net = sock_net(skb->sk),
    ...
    dev = dev_get_by_index_rcu(filter.tgt_net, filter.ifindex);
    ...
}

If filter.tgt_net were left at sock_net(skb->sk) instead of the resolved peer
net, the lookup of ifindex 2 returns the local dummy1, and the entries are
emitted with ifa_index 2.  IFA_TARGET_NETNSID is then echoed straight back
from the request value:

net/core/rtnetlink.c:rtnl_fill_mcaddr() {
    ...
    if ((netnsid >= 0 &&
         nla_put_s32(skb, IFA_TARGET_NETNSID, netnsid)) ||
    ...
}

so the reply set is {(2, 5)}, which is exactly what ksft_eq() expects here.
Would a kernel that parsed target-netnsid but iterated the wrong struct net
still pass this check?

The commit message says the test verifies "that IFA_TARGET_NETNSID dumps
another netns" - is that claim accurate given the above?

Would it help to make the peer namespace distinguishable, for example by
adding a unique address with ip maddr add ... dev dummy3 in the peer netns
and asserting that address shows up, and/or by creating extra devices so peer
ifindices cannot collide with the local ones?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914014539.5015-1-sigefriedhyy%40gmail.com
