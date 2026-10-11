Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F383A382B;
	Sun, 11 Oct 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791717646; cv=none; b=MbyW7brhRLIRr5m7xndWUmIxgztfM2dbbjhGJ4oZL50rdyUZP1BERyHWyfzYvrOAdfDSxlZ8WHhfdhgdyB0ah2F+e14nVFVzpmMfc1Iy4zZIdBVt/TA+M4aX/VWmAMfpGjZYY9BiPw7bgLS2za5AxwFX46fMrfmhkAyQiNeTqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791717646; c=relaxed/simple;
	bh=wlf7nsUliOWIWbjtkTQ1W4deN/zMC5EUiykRWzU3Hno=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NeVTAlU57k01gYbQWjGt0ayK0wfdhuyc6I2TvOJ1UQWNBEDTHBh8ZMNgEK8luxfstRhutJpZAOkEY8UaCZizHa3UO5doLaL8RvchV2JA4Wh0ih+asCGCUj6W2NhlABzHk/y/oRX7dOkvi9O2nJ53v1BECv9jGR7ICqHIFZyENHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRt64lxb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRt64lxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A464D1F0089C;
	Sun, 11 Oct 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791717644;
	bh=MRGNEMdVEZ/pe2HQ8uuM1oqnOADaMzPiTnjNzvu0fJo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JRt64lxbzgPrQMsWKsjP7Y9ULmS/yetSQ1HEkTTyvV/m/3cJNEUbdu1DZrzNiMOMk
	 B7MaLaUNWvEnvpTSN2fUzfGb4JeHnq042YWrq3A6OKX0e8C6FBSMp/QU0WgABzPf4w
	 1Xzh2JPnu3Z9NcrA/xScMJJUWzgxgmWI4aj5KuMutqoVJmM5DOwFXKyonMyWYLbWyR
	 MZUq73AV3bUzHgkrY0VhYPEqyNzLx8Rkwn/5xQPNjP4F9e+PIEisgP+z/nf3BXvoeO
	 AkJDpkujJwePK7Q4W7ftlxAMBSb9LT0Vst8Wjs0/xZdWGTXZQCsugi2ELly5/bHVy7
	 +zZD8lqGiWffg==
Subject: Re: [PATCH net-next v4 3/3] selftests: net: add a test for the gtp
 netlink family
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 11:20:43 +0000
Message-ID: <179171764325.434549.3580917696239237625@kernel.org>
In-Reply-To: <20261010105740.223992-4-anilkaushikwireless@gmail.com>
References: <20261010105740.223992-4-anilkaushikwireless@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In tools/testing/selftests/net/gtp.py, _setup() catches every
  CmdExitFailure from `ip link add gtp0 type gtp role ggsn` and raises…
- [Low] _setup() in tools/testing/selftests/net/gtp.py creates a new
  GtpFamily handle inside the test netns for each test case (`with…

--

selftests: net: add a test for the gtp netlink family

This adds a Python selftest that uses the gtp generic netlink family
through its ynl spec. It creates a gtp device, then adds, dumps and
deletes PDP contexts by TEI and by MS address. It also checks that
deleting an unknown context returns ENOENT, and it adds a GtpFamily ynl
wrapper.

> diff --git a/tools/testing/selftests/net/gtp.py b/tools/testing/selftests/net/gtp.py
> new file mode 100755
> index 0000000000000..b307699b3c1ed
> --- /dev/null
> +++ b/tools/testing/selftests/net/gtp.py
> @@ -0,0 +1,115 @@

[ ... ]

> +def _setup(ns):
> +    """Return a gtp family handle, and the ifindex of a new gtp device.
> +
> +    Create the device first: that loads gtp.ko through its rtnl link
> +    alias. ynl resolves the family ids once per process, with a
> +    CTRL_CMD_GETFAMILY dump which does not autoload modules, so the
> +    family must be registered before the first family handle is created.
> +    """
> +    try:
> +        ip("link add gtp0 type gtp role ggsn", ns=str(ns))
> +    except CmdExitFailure as e:
> +        raise KsftSkipEx("no gtp support (CONFIG_GTP, iproute2)") from e

[Severity: Low]
Is this skip broader than intended? CmdExitFailure is raised for any
non-zero exit from ip. That covers old iproute2 and a missing gtp.ko,
but it also covers a real failure in the gtp newlink path. Examples are
gtp_newlink() failing to create or bind its UDP sockets, an -EINVAL
regression, or -EEXIST if an earlier case left a gtp0 behind.

add_del_pdp(), add_two_pdp() and del_unknown_pdp() all go through
_setup(). If gtp link creation regresses, every case would be reported
as SKIP instead of FAIL.

The patch also adds CONFIG_GTP=m to tools/testing/selftests/net/config,
so a correctly configured run should not need this skip. Would it make
sense to check e.cmd.stderr for the specific "not supported" messages
and re-raise anything else? drivers/net/lib/py/env.py already uses that
pattern:

            except CmdExitFailure as e:
                if "Operation not supported" not in e.cmd.stderr:
                    raise

> +    defer(ip, "link del gtp0", ns=str(ns))
> +    ip("link set gtp0 up", ns=str(ns))
> +    link = ip("-d link show gtp0", ns=str(ns), json=True)[0]["ifindex"]
> +
> +    with NetNSEnter(str(ns)):
> +        gtp = GtpFamily()
> +
> +    return gtp, link

[Severity: Low]
This isn't a functional bug, but should the GtpFamily handle be closed
when each case ends?

YnlFamily.__init__() opens a netlink socket. It also stores a
functools.partial(self._op, op_name) on self for every op, which makes a
reference cycle:

        for op_name, op in self.ops.items():
            bound_f = functools.partial(self._op, op_name)
            setattr(self, op.ident_name, bound_f)

Because of that cycle, reference counting alone never frees the socket.
It is freed only by the cyclic GC or at process exit. Each case creates
a new handle, so up to three netlink sockets in the test netns stay
open. Each one keeps the namespace alive after NetNS.__exit__() deletes
it.

YnlFamily already has close() and __enter__()/__exit__(). Would adding
defer(gtp.close) in _setup() be cleaner?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261010105740.223992-1-anilkaushikwireless%40gmail.com
