Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50F471422;
	Tue, 13 Oct 2026 02:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791859740; cv=none; b=cnA52X7jRCm8VWAKqF8bnlVFDJkhdz32L4iABSt4RakgF9SGUOHY6k64BA8W11gkT+0Xg5ppqrkLmlHBsDHb3xdl8sEA1awrB8qZIZCx//r5oQMXy8rOsHTC9+3PwiefAVmVcJV2JCOAaulniNUOfq8TQeIPUsMbuN4ZrQfQCpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791859740; c=relaxed/simple;
	bh=xx/0C7V5lSsu1SJZQPWv/nB52Eqqvb8P+RDAqaBBUGY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ww0iYtVuxi9UHbzBwBEPI3X6MEX6TmerxE3nhtSdfwq3pB8YQ9fzYhp0CYbcA3BnOL0P6cMzSFx8DS//khCci4wwo7LriM4FT+5T9zHWoxsV7mJ2+1HN65TcLOLbVICPPfa4YdFVURQItfAER0ggPE9yFgiT0vqqPQqVfRMLQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/RkucCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/RkucCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225FB1F00893;
	Tue, 13 Oct 2026 02:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791859739;
	bh=zXq4C2rVp1oXkpjFcds+hIlD+z3dKEns35PhsHfo54Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O/RkucCSMFlDTrrg1ThuOq5O4gEyruD46T5wmc3/IPLkmHwgbXIHHVFKvVtN70p8X
	 02EomRZqkxb9x+mq9QPD73PotcK1XbUUWUeoCorwICEMwshxg9rg3OH+W7PcMZsWfT
	 rOy7jKpXKJKdPJYJ6hGp3OTXQLC31aXDyUSaFEJ6ZA2aJ5qIeLuWZu8jjzkhMmc1sJ
	 4kqFNyW6k3nyBk8+D8+D3Ct4i9qovA4GdSXefbYpTDvCD+ks0/4+VnbefDuCXyadkW
	 8leYR4L0u81QpsIz85+lhZIdEiPBnL+Q5Wz8zR6YceCskGUYaZNWIf25uOTs5fG0zN
	 euFd6Kf/avkuA==
Subject: Re: [PATCH net-next v5 3/3] selftests: net: add a test for the gtp
 netlink family
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 02:48:57 +0000
Message-ID: <179185973768.434549.10719134041790779224@kernel.org>
In-Reply-To: <20261012024800.400616-4-anilkaushikwireless@gmail.com>
References: <20261012024800.400616-4-anilkaushikwireless@gmail.com>
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
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The test does not skip when the kernel lacks GTP support,
  although the commit message says it will.

--

selftests: net: add a test for the gtp netlink family

This adds a Python selftest that uses the gtp ynl spec to exercise the gtp
generic netlink family. It creates a gtp device, then adds, dumps and
deletes PDP contexts by TEI and by MS address. It also adds a GtpFamily
ynl wrapper and registers the test.

> diff --git a/tools/testing/selftests/net/gtp.py b/tools/testing/selftests/net/gtp.py
> new file mode 100755
> index 0000000000000..199bc44091909
> --- /dev/null
> +++ b/tools/testing/selftests/net/gtp.py

[ ... ]

> +_NO_GTP_ERRORS = ("Operation not supported", "Garbage instead of arguments")
> +
> +
> +def _setup(ns):

[ ... ]

> +    try:
> +        ip("link add gtp0 type gtp role ggsn", ns=str(ns))
> +    except CmdExitFailure as e:
> +        # gtp.ko not available, or iproute2 without gtp support: any other
> +        # failure to create the device is a real error.
> +        if not any(msg in e.cmd.stderr for msg in _NO_GTP_ERRORS):
> +            raise
> +        raise KsftSkipEx("no gtp support (CONFIG_GTP, iproute2)") from e

[Severity: Medium]
Will this skip when the kernel has no GTP support? The commit message says
"The test is skipped when the kernel or iproute2 lack GTP support".

With CONFIG_GTP=n, or with gtp.ko not installed, request_module() for
rtnl-link-gtp finds nothing and ops stays NULL. The request then reaches
this branch in __rtnl_newlink() in net/core/rtnetlink.c:

	if (!ops) {
		NL_SET_ERR_MSG(extack, "Unknown device type");
		return -EOPNOTSUPP;
	}

iproute2 requests extended ACKs. When an extack message is present it
prints only "Error: Unknown device type." and returns early, so it never
prints the "RTNETLINK answers: Operation not supported" line.

Neither string in _NO_GTP_ERRORS matches that output. _setup() then
re-raises CmdExitFailure, and add_del_pdp, add_two_pdp and del_unknown_pdp
each report a failure instead of a skip.

The iproute2-without-gtp case ("Garbage instead of arguments") looks like
it is handled correctly. The "Operation not supported" string seems to
match only iproute2 builds without extack support.

Could "Unknown device type" be added to _NO_GTP_ERRORS? Another option is
to check whether the gtp link kind is available before creating the
device.

> +    defer(ip, "link del gtp0", ns=str(ns))
> +    ip("link set gtp0 up", ns=str(ns))

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012024800.400616-1-anilkaushikwireless%40gmail.com
