Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894F494825;
	Thu, 10 Sep 2026 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048208; cv=none; b=aAngGZjmWOkWM6s782/BP+J+NSFBXpkasp0SCnYzqLKeWhJzZ7GmOAo4toi+x8uGF4IADauOWuOZk3GTlI4LN+IugaTXYReDsv3vNRLLF6s1iYglRo3ZGUQOkiEhCXIHhGAlONxKZVkyeNc9rXPAu1lwZGGy2FHkX0Y0jHbAbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048208; c=relaxed/simple;
	bh=9uqGhByEx2A1WxyFoZME5gMeqKVADEzaBb5B8fHI2x4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PkjFKfpK3v5ZQacDCni6tEU3Z7egkXuupTl68t6pdzl+Va8pHkwxY5kQi+A2KUHfJLLhwY2lSxo44HPaZayeZTPJYchshK/PIcFMcEpXnMOrGuglRoZSxgzuZsK9CHpHn7gbvAIahWja0ZSicyjUZls7yzfLqAnQ4zGA5BaLeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNd4wz0f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNd4wz0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBD61F00893;
	Thu, 10 Sep 2026 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048205;
	bh=I+6M3P8K0PiEyuq4SIt3bi4AW8uTGNjkP3eYdcvfMUQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XNd4wz0f0L27jm5r75DLI02NG6oaKvcGgx3F5bnBelGIGkQGF62e9l0wGMCdtbeuu
	 QnrlFpJb0RorMe8+3MrkKkaIe3WyYJhV7p8Gjvc5llzA5XYgfGw1XrWwitzh9G5vED
	 SmOEmytqZiE2y+ZlF3d3M/yTawD0wUL6bUeObLU6h9LLkyqT7N9tKuj3D8QyuzUO/S
	 tjg15thOcpDtST0yZDP3Q5aEnpX5jAbFr4GHyq7JJI8BmBNVzMZItVvcWhsPK9Ny1y
	 0s0o03Zy64MzpiHhew/0hx/+/bL3uTOrQNUBXqWP1SevNNjDCekqrK2tzfLUaa6iiE
	 1pkBg5Jc97ivA==
Subject:
 Re: [PATCH net-next v3 4/4] selftests: net: test AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 13:50:03 +0000
Message-ID: <178904820373.219967.782013244688408761@kernel.org>
In-Reply-To: <20260909133247.113923-5-sigefriedhyy@gmail.com>
References: <20260909133247.113923-5-sigefriedhyy@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2 (1)

- [Low] In dump_mcaddr_l2_check() the ksft_in() membership checks are
  non-fatal, but the immediately following statements index the same…
- [Low] Reported concern: dump_mcaddr_l2_check() creates a netlink socket
  (rtnl = RtnlAddrFamily(),…

Pre-existing issues:
- [Low] Documentation/netlink/specs/rt-addr.yaml declares a `do` form for
  the getmulticast operation (request value 58, reply value 58 carrying…

--

selftests: net: test AF_PACKET multicast dumps

This adds dump_mcaddr_l2_check() to tools/testing/selftests/net/rtnetlink.py,
which dumps the link-layer multicast addresses of a dummy device over
AF_PACKET RTM_GETMULTICAST and checks the ifa-index filter, the mc-users
count, the global flag and target-netnsid. The test skips when the kernel
answers with -EOPNOTSUPP.

> diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
> index 5cc3ebdcf08d..41da259c3a09 100755
> --- a/tools/testing/selftests/net/rtnetlink.py
> +++ b/tools/testing/selftests/net/rtnetlink.py
> @@ -1,17 +1,21 @@
>  #!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  
> +import errno
>  import socket
>  import struct
>  import time
>  from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_eq, ksft_ge, ksft_true, KsftSkipEx
> -from lib.py import ksft_not_in, ksft_not_none
> -from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily, RtnlRouteFamily
> +from lib.py import ksft_in, ksft_not_in, ksft_not_none
> +from lib.py import CmdExitFailure, NetNS, NetNSEnter, NlError, RtnlAddrFamily, RtnlRouteFamily
>  from lib.py import defer
>  
>  IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
>  IPV4_TEST_MULTICAST = b'\xef\x01\x01\x01'
>  IPV6_TEST_MULTICAST = bytes.fromhex('ff020000000000000000000000000123')
> +ETH_ALL_HOSTS_MULTICAST = bytes.fromhex('01005e000001')
> +ETH_TEST_MULTICAST_STR = '01:00:5e:01:01:01'
> +ETH_TEST_MULTICAST = bytes.fromhex(ETH_TEST_MULTICAST_STR.replace(':', ''))
>  
>  
>  def _users_for(rtnl: RtnlAddrFamily, family: int, grp: bytes, ifindex: int):
> @@ -105,6 +109,66 @@ def dump_mcaddr6_check() -> None:
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

[Severity: Low]
This isn't a bug, but the netlink socket created here in
dump_mcaddr_l2_check() is never closed and no defer(rtnl.close) is
registered, so the fd stays open until CPython collects the object,
including on the KsftSkipEx path below where the traceback keeps the frame
alive.

Note that dump_mcaddr_check() and dump_mcaddr6_check() in the same file
create rtnl = RtnlAddrFamily() inside NetNSEnter the same way and also
never close it, so this matches the existing convention in this file; only
_rtnl_route_subscribe() uses defer(rtnl.close), and that one keeps a
notification subscription alive after leaving the netns. Would it be worth
adding defer(rtnl.close) here anyway for symmetry with the netns teardown?

> +        try:
> +            addresses = rtnl.getmulticast(
> +                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
> +                dump=True)
> +        except NlError as e:
> +            if e.error == errno.EOPNOTSUPP:
> +                raise KsftSkipEx(
> +                    "kernel does not support AF_PACKET multicast dump")
> +            raise

[Severity: Low]
This isn't a bug introduced by this patch, but while the test only ever
uses dump=True here, the getmulticast operation in
Documentation/netlink/specs/rt-addr.yaml also declares a do form (request
and reply value 58, reply carrying multicast, mc-users, cacheinfo and, after
the AF_PACKET documentation change, flags and target-netnsid).

No family registers a .doit handler for RTM_GETMULTICAST: the PF_PACKET
entry in rtnetlink_rtnl_msg_handlers(), the PF_INET entry in
devinet_rtnl_msg_handlers() and the PF_INET6 entry in
addrconf_rtnl_msg_handlers() all set .dumpit only. rtnetlink_rcv_msg()
then takes the out_unlock path:

	link = rtnl_get_link(family, type);
	if (!link || !link->doit) {
		family = PF_UNSPEC;
		link = rtnl_get_link(PF_UNSPEC, type);
		if (!link || !link->doit)
			goto out_unlock;
	}

so ynl --do getmulticast, and anything generated from the do half of the
spec, can only return -EOPNOTSUPP. Should the do form be dropped from the
spec, or is a .doit handler planned?

> +
> +        # dummy2 has entries as well, only dummy1 may be listed
> +        ksft_eq({addr['ifa-index'] for addr in addresses}, {dev_idx},
> +                "AF_PACKET multicast dump ignored ifa-index filter")
> +
> +        entries = {addr['multicast']: addr for addr in addresses}
> +
> +        # Bringing an Ethernet device up joins 224.0.0.1, which maps
> +        # to 01:00:5e:00:00:01 in the device multicast list.
> +        ksft_in(ETH_ALL_HOSTS_MULTICAST, entries,
> +                "dummy1 does not have the all-hosts link-layer address")
> +        ksft_not_in('global', entries[ETH_ALL_HOSTS_MULTICAST]['flags'],
> +                    "protocol entry is global")
> +
> +        ksft_in(ETH_TEST_MULTICAST, entries,
> +                "dummy1 does not have the SIOCADDMULTI address")
> +        ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1,
> +                "unexpected mc-users for the SIOCADDMULTI address")

[Severity: Low]
Can this raise KeyError instead of reporting the individual checks?
ksft_in() in tools/testing/selftests/net/lib/py/ksft.py is non-fatal:

    def _fail(*args):
        global KSFT_RESULT
        KSFT_RESULT = False
        ...

    def ksft_in(a, b, comment=""):
        if a not in b:
            _fail("Check failed", a, "not in", b, comment)

So when the all-hosts entry is missing from the dump, ksft_in() records the
failure and the next statement still evaluates
entries[ETH_ALL_HOSTS_MULTICAST]['flags'], and likewise
entries[ETH_TEST_MULTICAST]['mc-users'] after the second ksft_in().

The preceding ksft_eq() on the ifa-index set is non-fatal too, so an empty
or unexpected dump flows straight into the indexing. ksft_run() catches the
exception and marks the case failed, but the mc-users check, the global flag
check and the whole target-netnsid sub-test below are then skipped rather
than reported.

Would it be better to bail out before dereferencing, the way
dump_mcaddr_check() and dump_mcaddr6_check() do with

            if before is None:
                raise KsftSkipEx(...)

or to guard the dict lookups with an explicit early return?

> +        ksft_in('global', entries[ETH_TEST_MULTICAST]['flags'],
> +                "SIOCADDMULTI entry is not global")
> +
> +        # target-netnsid dumps another netns, ifa-index is relative to it
> +        with NetNS() as peer:
> +            ip(f"netns set {peer} 5")
> +            ip("link add name dummy3 type dummy", ns=peer)
> +            ip("link set dummy3 up", ns=peer)
> +            peer_idx = ip("link show dummy3", json=True, ns=peer)[0]['ifindex']
> +
> +            addresses = rtnl.getmulticast(
> +                {"ifa-family": socket.AF_PACKET, "target-netnsid": 5},
> +                dump=True)
> +            ksft_eq({(addr['ifa-index'], addr['target-netnsid'])
> +                     for addr in addresses}, {(peer_idx, 5)},
> +                    "target-netnsid did not dump the peer netns")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909133247.113923-1-sigefriedhyy%40gmail.com
