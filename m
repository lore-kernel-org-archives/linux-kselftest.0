Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2153FA5D9;
	Wed,  9 Sep 2026 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985078; cv=none; b=g8yGXcuNAC/ZYcVH4U+A1GQs9ZsFmsZ6HObcz/uSi5stPzWirsQTgJ68hayCoJpI+oBs6dPLKeTaRHmHz5cCd8nBxbg5TXBwUqsebUBcwa8OFp/rx38fnpehrlxXIn4sf2O07GMnMw7X9S8slPNCV30t9LxhfGgg5Q7zkWQYJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985078; c=relaxed/simple;
	bh=OwTX5oQa/qz1fSfUJySvit+dzZhMaGqOd4dg9vLWCMY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PRKx7rezd0Cbr1QRa2p3h/KBB0kcD+zZBFZcTUu9Agk41IFOC68lKQ4A3L0TYnmFEWEzMsmE5CCV2tY7AdUX4y8BNULegGqdX0GRG4Iae+CuxM0JvRcr25HYfQvRjDts1/JJc02J/ulNEnttQ6ohgN8mJT7lRsFtfeUbS5EVR5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4p5viqT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4p5viqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D5E1F000FF;
	Wed,  9 Sep 2026 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788985072;
	bh=ovhPeAfs9CZqMVtwPVq8g1fnukp3Gew/PWs+jlGMpjE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b4p5viqTqbuvQJDAQIsDg5Ivzu9qm8n4OsrJJrEFwHLRlf3AxOBNIPlFdI9+KiuD0
	 g/6rcYrEjpZFQn7u5CbcEsId5OmyO5SMlDrbmBjMu8Xx+WFk6RKXIn5X1Cm6okEA47
	 +u2IzgmnrzA9p+ifAa9OjZglMImCInYrZLk+pO/sAaiRMIrloDePUItc6/9hZKDgKP
	 gOFOsHR6j4ps3cm9APPchC3GZ+tOQEyf3ehheZXCNSgU/B4jurvnG9U9GXrbjMuPBe
	 lTSKxoVHbyz68dfgeSgsvS1khY4z20jct1d6sG0sUGteh1rrAvxSRE5vQxLp/vC577
	 e7995zMnRJPSg==
Subject: Re: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or
 not kept on link down
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 adrian.pielech@intel.com, sheenamo@google.com, przemyslaw.kitszel@intel.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 09 Sep 2026 20:17:51 +0000
Message-ID: <178898507124.219967.9302814811759079514@kernel.org>
In-Reply-To: <20260908181956.1357684-1-kuba@kernel.org>
References: <20260908181956.1357684-1-kuba@kernel.org>
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

- [Medium] The patch documents a new environment invariant
  (README.rst:73-80: the local IPv6 address must be added with `nodad`…

--

selftests: drv-net: warn if LOCAL_V6 has DAD or not kept on link down

This documents that the drv-net environment is expected to configure
LOCAL_V6 with nodad and with keep_addr_on_down enabled, and adds a check
in NetDrvEpEnv._check_env() that prints warnings when either is missing.
The motivation is intermittent bind() failures in napi_id.py on HW
runners.

> diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testing/selftests/drivers/net/README.rst
> index c6bed9a985bc..3fe49bce4f3a 100644
> --- a/tools/testing/selftests/drivers/net/README.rst
> +++ b/tools/testing/selftests/drivers/net/README.rst
> @@ -70,6 +70,15 @@ LOCAL_V4, LOCAL_V6, REMOTE_V4, REMOTE_V6
>  
>  Local and remote endpoint IP addresses.
>  
> +Tests reconfigure the device freely, including taking the link down, and
> +expect the addresses to work immediately afterwards. IPv6 needs help::
> +
> +  ip -6 address add 2001:db8:1::1/64 dev eth0 nodad
> +  sysctl -w net.ipv6.conf.eth0.keep_addr_on_down=1
> +
> +Without those the address is flushed when the link goes down, or spends
> +a second unusable while waiting for DAD to finish.
> +
>  LOCAL_PREFIX_V6
>  ~~~~~~~~~~~~~~~
>  
> diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
> index 25903f580b40..6262080a8bf4 100644
> --- a/tools/testing/selftests/drivers/net/lib/py/env.py
> +++ b/tools/testing/selftests/drivers/net/lib/py/env.py
> @@ -239,6 +239,25 @@ class NetDrvEpEnv(NetDrvEnvBase):
>          if missing:
>              raise Exception("Invalid environment, missing configuration:", missing,
>                              "Please see tools/testing/selftests/drivers/net/README.rst")
> +        if "LOCAL_V6" in self.env:
> +            self._check_v6_env()

[Severity: Medium]
Do the in-tree environment providers meet the invariant that is being
documented here?

Two cases look like they do not:

1) NetDrvEpEnv.create_local() (the netdevsim path in the same file) adds
   the addresses with nodad, but never enables keep_addr_on_down on the
   nsim devices or on 'all':

     ip(f"   addr add dev {self._ns.nsims[0].ifname} {self.nsim_v4_pfx}1/24")
     ip(f"-6 addr add dev {self._ns.nsims[0].ifname} {self.nsim_v6_pfx}1/64 nodad")
     ip(f"   link set dev {self._ns.nsims[0].ifname} up")

   Both the devconf_all and per-device defaults are 0, and
   addrconf_ifdown() drops permanent global addresses when the aggregate
   is not positive:

   net/ipv6/addrconf.c:addrconf_ifdown() {
	...
	int _keep_addr = READ_ONCE(net->ipv6.devconf_all->keep_addr_on_down);

	if (!_keep_addr)
		_keep_addr = READ_ONCE(idev->cnf.keep_addr_on_down);

	keep_addr = (_keep_addr > 0);
	...
   }

   So a test that follows the new documentation and bounces the link
   would lose the nsim LOCAL_V6 address. Note also that this path never
   reaches _check_v6_env(), since the call is only made from the branch
   that requires NETIF, so there is no warning either.

2) tools/testing/selftests/net/lib/ksft_setup_loopback.sh sets up the
   env that this code validates, and adds LOCAL_V6 without nodad and
   without touching keep_addr_on_down:

     ip -netns "${SERVER_NS}" addr add $LOCAL_V6/64 dev server
     ...
     export NETIF=server

   Would every run driven by that script now print both new warnings,
   pointing at in-tree setup code rather than at a user
   misconfiguration? Should the script and create_local() be updated
   along with the documentation?

>  
>      def resolve_remote_ifc(self):
>          v4 = v6 = None

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908181956.1357684-1-kuba%40kernel.org
