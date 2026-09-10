Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B518368291;
	Thu, 10 Sep 2026 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004901; cv=none; b=KKKAcA0dYd4VNy2rBDGw4n50XsWsP2ZClhEOqpJMUTUhElo8cAyQlSIK1sui7bd2+mBWlbYJBmVEROkE2KUDNTbV/k9RSgMJKEU8wyPMKbgGvwvRws/XYD1W6KI0uOvnp8+Cg0hr7iJckUHOdEZN0Er+ldqL0yvZoVi2spZH8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004901; c=relaxed/simple;
	bh=u8NaKQ9o2x2ktD13eEfew5wiYcy6EbcMB7XVFVvZ0Vk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kZfdJ1EVHrsxCfa1z3wjROYKPfLsDDAkT0l77C/hlwiyJ/kUI47JVOOV5ZMh6SlL6OJLmvkebW037w3mRhAqk5UjymnatTYr/FkKeU5B74wi8QbVgdmYeXf7TgRFRLlHZLQfFghbiKR2L7h3aU7mWTEgr9Y9SQsr+l9J9bykvlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQKmQh3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQKmQh3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC961F00898;
	Thu, 10 Sep 2026 01:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789004896;
	bh=+6iBRDJ1GgN4ZJK5Ro8Z41kqXbpt9fKjIMyksIwW7Zg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YQKmQh3NpJ+UUxgMqqiRRAtfIVg6RP8f8PMe2if1vm5BQdGEhJyUW5aQZOtC/LbcV
	 YViQokj4nKV+LYfEiSvm/6b+L0LlvzpH9zJJyaLoRjOWc/eg/2UxaTjopvOlWGdZY8
	 IbxQbfw0kZ1OsY4rWccUABsSbwydDLPTsjVzahClerWbjmSY2XmU/BuCgXVVgJ6Y93
	 rcJ27008o9NqIOWqvc+kzZt2qM9h+sJ9JPWV/amzCCeC8dqj9D59xe7KCS0OJ+4Kx1
	 b5D2zU6VTuccbGr3LTeLNlYXLYgdeLC7DWrlk33tn0eDXX+yc3wa6wY1Z8tCpIYUJ0
	 HGxxupDJSpGwA==
Subject:
 Re: [PATCH net-next v2 3/3] selftests: net: test AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 01:48:15 +0000
Message-ID: <178900489529.219967.8506896899151263500@kernel.org>
In-Reply-To: <20260909013401.14408-4-sigefriedhyy@gmail.com>
References: <20260909013401.14408-4-sigefriedhyy@gmail.com>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] In the new `dump_mcaddr_l2_check()`
  (tools/testing/selftests/net/rtnetlink.py) the non-fatal presence…
- [Low] dump_mcaddr_l2_check() creates a netlink socket via `rtnl =
  RtnlAddrFamily()` (rtnetlink.py:125) inside the temporary netns and…

--

selftests: net: test AF_PACKET multicast dumps

This adds dump_mcaddr_l2_check() to tools/testing/selftests/net/rtnetlink.py,
which dumps the link-layer multicast addresses of a dummy device and checks
the ifa-index filter, the flags of the all-hosts entry joined on link up, and
the mc-users/permanent state of an address added with SIOCADDMULTI. The case
is skipped when the kernel answers EOPNOTSUPP.

> diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
> index 5cc3ebdcf08d..cea636f10aeb 100755
> --- a/tools/testing/selftests/net/rtnetlink.py
> +++ b/tools/testing/selftests/net/rtnetlink.py

[ ... ]

> @@ -105,6 +109,52 @@ def dump_mcaddr6_check() -> None:
>                  s2.close()
>  
>  
> +def dump_mcaddr_l2_check() -> None:
> +    """
> +    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
> +    dump: the ifa-index filter, mc-users and the permanent flag.
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
Does dump_mcaddr_l2_check() leak the netlink socket created here?

YnlFamily.__init__() in tools/net/ynl/pyynl/lib/ynl.py opens
socket.socket(AF_NETLINK, SOCK_RAW, ...) and only releases it from close()
or __exit__(); there is no __del__, and the class installs
functools.partial(self._op, op_name) attributes on itself, so reference
cycles make prompt collection unreliable.

This function has no "with RtnlAddrFamily() as rtnl:", no finally: rtnl.close()
and no defer(rtnl.close). On the early-exit paths below (KsftSkipEx for
EOPNOTSUPP, the re-raised NlError) the traceback also keeps this frame alive.

Since the socket is created inside the temporary namespace, it keeps that
namespace referenced after NetNS teardown runs 'ip netns del'. The same
file already uses the symmetric idiom in _rtnl_route_subscribe():

        rtnl = RtnlRouteFamily()
    defer(rtnl.close)

Would adding defer(rtnl.close) here be preferable? Note the neighbouring
dump_mcaddr_check()/dump_mcaddr6_check() have the same open-without-close
shape, so this is mostly about consistency.

> +        try:
> +            addresses = rtnl.getmulticast(
> +                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
> +                dump=True)
> +        except NlError as e:
> +            if e.error == errno.EOPNOTSUPP:
> +                raise KsftSkipEx(
> +                    "kernel does not support AF_PACKET multicast dump")
> +            raise
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
> +        ksft_not_in('permanent',
> +                    entries[ETH_ALL_HOSTS_MULTICAST]['ifa-flags'],
> +                    "protocol entry is permanent")

[Severity: Medium]
Can this raise KeyError instead of reporting a clean check failure?

ksft_in() in tools/testing/selftests/net/lib/py/ksft.py is non-fatal, it
neither raises nor returns a value:

    def ksft_in(a, b, comment=""):
        if a not in b:
            _fail("Check failed", a, "not in", b, comment)

So when the all-hosts entry is missing from the dump, execution continues to
entries[ETH_ALL_HOSTS_MULTICAST]['ifa-flags'], which raises KeyError while
the argument is evaluated. ksft_run() catches BaseException and prints a
traceback, and the remaining checks in this case never run - including the
two SIOCADDMULTI checks below.

The same applies to the ETH_TEST_MULTICAST lookups:

        ksft_in(ETH_TEST_MULTICAST, entries, ...)
        ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1, ...)
        ksft_in('permanent', entries[ETH_TEST_MULTICAST]['ifa-flags'], ...)

Would a guard before the subscripts be better here, matching the idiom used
elsewhere in this file, e.g. _users_for():

    if 'mc-users' not in matches[0]:
        return None

and the "if attrs is not None:" guard after ksft_not_none()?

> +
> +        ksft_in(ETH_TEST_MULTICAST, entries,
> +                "dummy1 does not have the SIOCADDMULTI address")
> +        ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1,
> +                "unexpected mc-users for the SIOCADDMULTI address")
> +        ksft_in('permanent', entries[ETH_TEST_MULTICAST]['ifa-flags'],
> +                "SIOCADDMULTI entry is not permanent")
> +
> +
>  def ipv4_devconf_notify() -> None:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909013401.14408-1-sigefriedhyy%40gmail.com
