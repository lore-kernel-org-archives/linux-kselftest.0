Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313235;
	b=xXG389Cr+voe52W58ZAbv/lOLMs2a31xME4sRzqQUYVlpEjXNyA7cp9nfeo/QfmIuFF5
	 FgSDanCirqTR8CEzPND2/8WYuIspCW8ovSVIMueBU3tTrXN/L8Qnuwlt/P2Q54zjAOJp/
	 eJeMnaYw4ej/pR7QMkqScuN20w9qG2zrLJYCTmHSQFUehOd5vmMLM5UWSFSu14JV0gTPU
	 vTmj0IkN4zO7lviYq4RbKPsy9ctlN2u2nxgzDKx8iNNK5wxqUPV7K3HTJ1lQdFmTVOS5M
	 K1yoXbs6a5N+X9o0c+r+pchnkYyHAXREqG5erUfX6/llXD15Cl/i+Hk+o1F2G92JuVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313235;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6rM2EcZTe3ev5LTc6GsFrDgE2qx75I9quZj2GOEZIZg=;
	b=0BdVmg/fW5mb+fcSnlfVy8rotGdjbadFN4Du/fTCF/xtW4etKbutF1+oZkv3gj6Vs0cq
	 NgrFpU8zEVhhLyKxkV/x8T9QR95LeFAYBPLqLMj4cIYzO7s9/EAMnYJo1f9LJXKvliz/q
	 z4vuFv5fU82fUKgjai9VX6xydh8aqTihqduHlboD7lEw+SMfG7yjUE7MN/ecVRi3i7m4d
	 Bz+Zgr15aV9gkKkVxO2DHnKpD3acWU3ytY7yv6EPtkfw0ZjjKMEP/pHIprYMPqbktX8zo
	 hN2vd/2tonRAaB6zoz5yF6zu0fixEs+aeFPyhPhRwGdlOamCNkWZdcx4Pz3zap/i9zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gq6lxTZH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B7606A32E;
	Tue, 10 Nov 2026 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gq6lxTZH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E241F0089F;
	Tue, 10 Nov 2026 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313235;
	bh=6rM2EcZTe3ev5LTc6GsFrDgE2qx75I9quZj2GOEZIZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gq6lxTZH4cxRQwCO+gixC3+400bZsgkL+HI9hqBrQvX8EOuqFhxw92WuTo+wTkafG
	 Io5hnrbhM/Cg+XCnyJ5/IQXj/JfU5ycNZmKVdj9T42UQyIqN3NBky+JSwBGGvvZeo8
	 VVV+A0InKjZxGzTB7OQe2c+J+IjT79hOyYwser7I1WRbfVM0EI/vOebqoF6gs7Q0kL
	 R8Bz3sEij1+vpv+gylytk/n6U1L6o0K0ydU0NHrHc5oCV3emN1fk0lRbRvwXZ233Q3
	 E4rQGcwGgDeeMDFV+HJFggChFDFAQfP7/vqNLb3GnERl+3+pSuFQNyAXPLu+n0U8VD
	 IlVmpef2C6MCQ==
Date: Tue, 10 Nov 2026 12:20:30 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: mohsin.bashr@gmail.com, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
	maxime.chevallier@bootlin.com
Subject: Re: [PATCH net v2] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
Message-ID: <20261110122030.GD18859@horms.kernel.org>
References: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
 <179387330655.488856.2246156256257342362@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179387330655.488856.2246156256257342362@kernel.org>

On Thu, Nov 05, 2026 at 10:08:26AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete: the same cleanup failure still happens on
>   the link-autoneg-on branch of pause_setup() in…
> - [Low] In pause_setup()
>   (tools/testing/selftests/drivers/net/hw/pause.py, local lines 410-414,…
> 
> --
> 
> selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings
> 
> This patch changes pause_setup() so that the forced-link restore is queued
> only after setup has successfully enabled link autonegotiation. The goal is
> to avoid EOPNOTSUPP cleanup failures on devices such as fbnic. It also makes
> pause_test_support() fall back to checking forced MAC pause on the current
> link when no link configuration change is accepted.
> 
> > diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> > index ca4a55e59c30f..99ce6a59dfcd6 100755
> > --- a/tools/testing/selftests/drivers/net/hw/pause.py
> > +++ b/tools/testing/selftests/drivers/net/hw/pause.py
> > @@ -404,14 +404,14 @@ def pause_setup(cfg):
> >  
> >      if link["auto-negotiation"]:
> >          defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
> 
> [Severity: High]
> Can the same cleanup failure still happen on this branch?
> 
> This restore is still queued whenever the device reports link autoneg on,
> even when setup never changes the link. The remote interface has the same
> unconditional defer further down in pause_setup().
> 
> When the driver has no set_link_ksettings, ethnl_set_linkmodes_validate()
> rejects every LINKMODES_SET before it checks for a no-op:
> 
> net/ethtool/linkmodes.c:ethnl_set_linkmodes_validate() {
>     ...
> 	if (!ops->get_link_ksettings || !ops->set_link_ksettings)
> 		return -EOPNOTSUPP;
>     ...
> }
> 
> That means a restore to the same autoneg on value also fails with
> EOPNOTSUPP.
> 
> Some in-tree drivers report autoneg on and provide only get_link_ksettings.
> nicvf_get_link_ksettings() sets cmd->base.autoneg = AUTONEG_ENABLE.
> be_get_link_ksettings() does the same when auto speeds are supported.
> fbnic also has get_link_ksettings and no set_link_ksettings.
> 
> On these devices pause_test_support() takes the new "current link"
> fallback. The deferred "ethtool -s <if> autoneg on" then fails in
> ksft_flush_defer() and the test ends in a cleanup failure. The subject
> line says the patch avoids exactly this.
> 
> Every other test that calls pause_setup() would hit it too, because the
> defer is flushed even when the test skips.
> 
> Dropping the autoneg on restore isn't an option, since pause_test_support()
> and pause_autoneg_link_autoneg() force the link and rely on it. Would it
> work to queue the restore only where a link change is accepted? One place
> is after a successful "autoneg off {forced}" in pause_test_support().
> Another option is to let the restore tolerate EOPNOTSUPP.

This looks like a legitimate concern that warrants a v3.

> 
> >  
> >      # Local interface admin up, link aneg on
> >      ip(f"link set {cfg.ifname} up")
> >      if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
> >          ethtool(f"-s {cfg.ifname} autoneg on")
> > +        if "speed" in link and "duplex" in link:
> > +            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
> > +                       f"duplex {link['duplex'].lower()}")
> 
> [Severity: Low]
> Could this leave a forced link in autoneg state if the ethtool call fails
> partway through?
> 
> ethtool() raises on a non-zero exit. With the defer now registered after
> the call, nothing restores the original forced speed/duplex if the driver
> commits part of the change and then returns an error.
> 
> bnxt_set_link_ksettings() is one example. It sets
> link_info->autoneg |= BNXT_AUTONEG_SPEED before calling
> bnxt_hwrm_set_link_setting(), and returns that call's error without
> rolling back.
> 
> This branch only runs when the device supports autoneg. Would queuing the
> restore just before the ethtool call still avoid the fbnic cleanup
> failure? The same ordering applies to the remote interface later in
> pause_setup().
> 
> [ ... ]

This one I'm less sure about, but I think it should at least be considered.

-- 
pw-bot: cr
