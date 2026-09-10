Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F98381AFF;
	Thu, 10 Sep 2026 03:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011698; cv=none; b=ZOXCZNa68S2GaafKRB/pf8Cwvm1b4+kqXV5+TzCpAF0x2gU3HRS09Or4wVv6O2nr4X8dSzbebadBHFEH8If70iezFUZChSaRJxbw8HrUEmicJJyQCsVlEEDWYTE3Ee3JOLkipKoFmwoJVQsJXlFNaMUKSapdYpb4wEUIB4V8sFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011698; c=relaxed/simple;
	bh=w6YMxGA6TfN/6E70BV+uHG+BsvTlQTsOklfijaKjRio=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HuCjWiQG0z1SmkGsatbx/nYUfzJMlENDKVvffreYIBhyIY0/QOyGsRb9JAZV1M2KddkWPF2CdEoeHqSBbXVESBa4H5mO5lYwELYcKvtHajgDpaLIiAURK1+gjiAvkPT+d1hTWyzYp/K4ghdOHx2uX4r3y/41xrLV+LY4/1V1tUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QphHh3vY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QphHh3vY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4962F1F00893;
	Thu, 10 Sep 2026 03:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789011696;
	bh=DANIVoekU9XiwWA5oMrLYSSaU2xk6/wwTj0I+yT4QfU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QphHh3vYLLM7ufXpcqMimO0dLeH5MojSw6HRqN6EkbGDaA0/sDJtZU9Jiv1xmjAhy
	 9l+RwQ+3Un5Gd0QKk5ltfn8nAFTgRRHrpuqJonm2oZgfuxQFQ3iOiMISSnqJ9HFOct
	 ZtVlQhaF0c1gs6XRN8DOP/3fC6jxsJa2/8T7Nk/J9T2rpl6z6K4uth6B68VBiU9IBu
	 2AZ+NEX2Gqbr0kW2CSJD07ZfJnDMVuRWEbFW6LEg+CDnx9XosqVkRYAw3eXU0Pxo1N
	 YXnoCWOEWVA9SMgUZJo/blduNmHhT80avmcjs12bQYslmprRGXidDM/qpIwYAPVk48
	 gv1oL33TB+W+g==
Subject:
 Re: [PATCH net-next 3/3] selftests: net: test AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nickgarlis@gmail.com, pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org,
 horms@kernel.org, sdf.kernel@gmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 03:41:34 +0000
Message-ID: <178901169484.219967.3624591832079760064@kernel.org>
In-Reply-To: <20260905093932.43726-4-sigefriedhyy@gmail.com>
References: <20260905093932.43726-4-sigefriedhyy@gmail.com>
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

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] dump_mcaddr_l2_check() in
  tools/testing/selftests/net/rtnetlink.py dereferences dictionary keys…

--

selftests: net: test AF_PACKET multicast dumps

This adds dump_mcaddr_l2_check() to the rtnetlink.py selftest, dumping the
link-layer multicast addresses of a dummy device over AF_PACKET and
checking the ifa-index filter, the all-hosts entry flags and the
SIOCADDMULTI entry flags plus mc-users.  The case skips when the kernel
answers the dump with EOPNOTSUPP.

> diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
> index 5cc3ebdcf08de..94340dac0e217 100755
> --- a/tools/testing/selftests/net/rtnetlink.py
> +++ b/tools/testing/selftests/net/rtnetlink.py

[ ... ]

> @@ -105,6 +109,53 @@ def dump_mcaddr6_check() -> None:
>                  s2.close()
>  
>  
> +def dump_mcaddr_l2_check() -> None:
> +    """
> +    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
> +    dump: the ifa-index filter, mc-users and the permanent flag.
> +    """
> +
> +    with NetNS() as ns:
> +        with NetNSEnter(str(ns)):
> +            for ifname in ("dummy1", "dummy2"):
> +                ip(f"link add name {ifname} type dummy")
> +                ip(f"link set {ifname} up")
> +            dev_idx = socket.if_nametoindex("dummy1")
> +            ip(f"maddr add {ETH_TEST_MULTICAST_STR} dev dummy1")
> +
> +            rtnl = RtnlAddrFamily()
> +            try:
> +                addresses = rtnl.getmulticast(
> +                    {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
> +                    dump=True)
> +            except NlError as e:
> +                if e.error == errno.EOPNOTSUPP:
> +                    raise KsftSkipEx(
> +                        "kernel does not support AF_PACKET multicast dump")
> +                raise
> +
> +            # dummy2 has entries as well, only dummy1 may be listed
> +            ksft_eq({addr['ifa-index'] for addr in addresses}, {dev_idx},
> +                    "AF_PACKET multicast dump ignored ifa-index filter")
> +
> +            entries = {addr['multicast']: addr for addr in addresses}
> +
> +            # Bringing an Ethernet device up joins 224.0.0.1, which maps
> +            # to 01:00:5e:00:00:01 in the device multicast list.
> +            ksft_in(ETH_ALL_HOSTS_MULTICAST, entries,
> +                    "dummy1 does not have the all-hosts link-layer address")
> +            ksft_not_in('permanent',
> +                        entries[ETH_ALL_HOSTS_MULTICAST]['ifa-flags'],
> +                        "protocol entry is permanent")
> +
> +            ksft_in(ETH_TEST_MULTICAST, entries,
> +                    "dummy1 does not have the SIOCADDMULTI address")
> +            ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1,
> +                    "unexpected mc-users for the SIOCADDMULTI address")
> +            ksft_in('permanent', entries[ETH_TEST_MULTICAST]['ifa-flags'],
> +                    "SIOCADDMULTI entry is not permanent")

[Severity: Low]
Can the entries[] lookups here raise KeyError in exactly the case the
preceding checks are meant to report?

ksft_in() in tools/testing/selftests/net/lib/py/ksft.py only records the
failure and returns:

    def ksft_in(a, b, comment=""):
        if a not in b:
            _fail("Check failed", a, "not in", b, comment)

So when the dump does not contain 01:00:5e:00:00:01, execution continues
into:

    entries[ETH_ALL_HOSTS_MULTICAST]['ifa-flags']

and the same applies to entries[ETH_TEST_MULTICAST] for the mc-users and
permanent checks if the SIOCADDMULTI address is missing.

ksft_run() catches this with "except BaseException" and prints a
traceback, so the case is reported as a failure, but the remaining
independent checks (mc-users == 1 and the permanent flag on the
SIOCADDMULTI entry) are never executed.  Note also that the earlier
ksft_eq() on the ifa-index set does not stop the case either, so
addresses may legitimately be empty at this point.

Would it be worth following the convention already used elsewhere in this
file, where _users_for() and dump_mcaddr_check() test membership before
dereferencing:

    if 'mc-users' not in matches[0]:
        raise KsftSkipEx(...)

and ipv6_route_del_reason_expired() guards with ksft_not_none(attrs)
before touching attrs?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905093932.43726-1-sigefriedhyy%40gmail.com
