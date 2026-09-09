Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1C3C9891;
	Wed,  9 Sep 2026 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985826; cv=none; b=q5glcd0QAw85QXC2JLx9FNTO0dag/80tpA1Fv0UXxj8nivjtD6EkUBHqsSTwn9QF3WhnPvTOxJvsQylM6fmatvLhM386KPGHX/WilydYWvjFwicMm+lJeZ3LX9O3CxOQKtcfGkngys701bKHIaSE1X9DlYQ4eFI3WxlkHrX6H7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985826; c=relaxed/simple;
	bh=LGVG5wgoxq5v0/GNNkulEJvG++Bh9ZsV3SBFZetv5xo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFYXaglxlXyA/vz4ah39H3VVxWHVIsFNIWq6PDqiJEWW0j5V6K+0klIA8xvS+LCGENtqxgNqIBFQm18MS91Vec1kJFw0B8rpqKZf8UvTytcnNmt33JQy/NpiGf8pK4nC0E1Kr8d0DfApArZwQB3JoEqPheTeKIVo/3L2X8hUgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gr3rHPsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gr3rHPsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EC31F000FF;
	Wed,  9 Sep 2026 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788985820;
	bh=4NF93pv4hlLONiEkdgn+sZDEdD085KmMYD2qugUAdak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gr3rHPsI1vGNRQ/BCKTB2avhCLlZqFrlfLfpbQRQTJ6Qjigv/pCLtlt8LQh0Nu5mV
	 kD9LhqsSx9vqEgmVbjMulsejb2JWG3wp3JqAZhxhfvUXVTgG7WyD85qYD14KEeyO4o
	 YU5VMcL61UTiHT7cm/Grstt2mEyRepWMAmusl/eUiCHyOusB7/p7Rc/qFk8GksLVNP
	 QJ5KlVdGNufgk5E1DFBzQXwcQfLtxQAx3EQXOFH4Sz4oLHSiO3pklB9Jxb51oXtfOe
	 vOU1Tq4PM/PyTxkXrmjw8PGP5XVTXEcqlOF1rBYPG9kgxXsHgo+Bps9bCXV9lQ9fmq
	 EHzlybHAfJYrQ==
Date: Wed, 9 Sep 2026 13:30:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 adrian.pielech@intel.com, sheenamo@google.com,
 przemyslaw.kitszel@intel.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD
 or not kept on link down
Message-ID: <20260909133019.048e7205@kernel.org>
In-Reply-To: <178898507124.219967.9302814811759079514@kernel.org>
References: <20260908181956.1357684-1-kuba@kernel.org>
	<178898507124.219967.9302814811759079514@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 09 Sep 2026 20:17:51 +0000 netdev-bot+sashiko@kernel.org wrote:
> > diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testing/selftests/drivers/net/README.rst
> > index c6bed9a985bc..3fe49bce4f3a 100644
> > --- a/tools/testing/selftests/drivers/net/README.rst
> > +++ b/tools/testing/selftests/drivers/net/README.rst
> > @@ -70,6 +70,15 @@ LOCAL_V4, LOCAL_V6, REMOTE_V4, REMOTE_V6
> >  
> >  Local and remote endpoint IP addresses.
> >  
> > +Tests reconfigure the device freely, including taking the link down, and
> > +expect the addresses to work immediately afterwards. IPv6 needs help::
> > +
> > +  ip -6 address add 2001:db8:1::1/64 dev eth0 nodad
> > +  sysctl -w net.ipv6.conf.eth0.keep_addr_on_down=1
> > +
> > +Without those the address is flushed when the link goes down, or spends
> > +a second unusable while waiting for DAD to finish.
> > +
> >  LOCAL_PREFIX_V6
> >  ~~~~~~~~~~~~~~~
> >  
> > diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
> > index 25903f580b40..6262080a8bf4 100644
> > --- a/tools/testing/selftests/drivers/net/lib/py/env.py
> > +++ b/tools/testing/selftests/drivers/net/lib/py/env.py
> > @@ -239,6 +239,25 @@ class NetDrvEpEnv(NetDrvEnvBase):
> >          if missing:
> >              raise Exception("Invalid environment, missing configuration:", missing,
> >                              "Please see tools/testing/selftests/drivers/net/README.rst")
> > +        if "LOCAL_V6" in self.env:
> > +            self._check_v6_env()  
> 
> [Severity: Medium]
> Do the in-tree environment providers meet the invariant that is being
> documented here?
> 
> Two cases look like they do not:
> 
> 1) NetDrvEpEnv.create_local() (the netdevsim path in the same file) adds
>    the addresses with nodad, but never enables keep_addr_on_down on the
>    nsim devices or on 'all':
> 
>      ip(f"   addr add dev {self._ns.nsims[0].ifname} {self.nsim_v4_pfx}1/24")
>      ip(f"-6 addr add dev {self._ns.nsims[0].ifname} {self.nsim_v6_pfx}1/64 nodad")
>      ip(f"   link set dev {self._ns.nsims[0].ifname} up")
> 
>    Both the devconf_all and per-device defaults are 0, and
>    addrconf_ifdown() drops permanent global addresses when the aggregate
>    is not positive:
> 
>    net/ipv6/addrconf.c:addrconf_ifdown() {
> 	...
> 	int _keep_addr = READ_ONCE(net->ipv6.devconf_all->keep_addr_on_down);
> 
> 	if (!_keep_addr)
> 		_keep_addr = READ_ONCE(idev->cnf.keep_addr_on_down);
> 
> 	keep_addr = (_keep_addr > 0);
> 	...
>    }
> 
>    So a test that follows the new documentation and bounces the link
>    would lose the nsim LOCAL_V6 address. Note also that this path never
>    reaches _check_v6_env(), since the call is only made from the branch
>    that requires NETIF, so there is no warning either.

This is no different to the HW case, we expect the outside runner 
to configure the system. As proven by the fact that the WARN print
added here does not trigger in NIPA on netdevsim:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-drv/results/816282/13-napi-id-py/stdout

> 2) tools/testing/selftests/net/lib/ksft_setup_loopback.sh sets up the
>    env that this code validates, and adds LOCAL_V6 without nodad and
>    without touching keep_addr_on_down:
> 
>      ip -netns "${SERVER_NS}" addr add $LOCAL_V6/64 dev server
>      ...
>      export NETIF=server
> 
>    Would every run driven by that script now print both new warnings,
>    pointing at in-tree setup code rather than at a user
>    misconfiguration? Should the script and create_local() be updated
>    along with the documentation?

Not sure if and how that script is actually used :S
