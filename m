Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F93AE6E4;
	Thu, 10 Sep 2026 23:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083973; cv=none; b=dqAGxErsG9BWDVjdZfE1STF7ybkRu3qGYkoIEHXAcfYDTcWwJEMV8kX4vrBGXQZ0GrLBdhSKfRCMsMuV6cHPY/xPSB+8M6VlmMQK8NmvSpdO4MYxpzwnvspKVwothuzYfj+wzRVbaNUqKUEynrTNE008FD6Fq8mFDw8+8mhpKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083973; c=relaxed/simple;
	bh=4WFG+/UlqFWZ24zRlzpdVHPzPBt1qtj5NIWeQ55LgzA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ydtf4QCk7mOygFYPF6jZmQXzB5cOKrbJLu2jLgSadnGE7XeGtZeg1mxyYfST4hW/EgSxvCPfnG/oCs2CsTnIZEvlSSSeou6lZS9gV9q2h9YlLjNQT7OSqmfPn7mQjLpWsPJ66FH9JEryXtZqMn6EIe2NQ/IFa79w+BJHiAQCz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oj1dAled; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oj1dAled"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A31F000FF;
	Thu, 10 Sep 2026 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083966;
	bh=bKin1QGY55AdPgTixeORacbQDYMT7clJ8zzHZH3TRxU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Oj1dAledzlSEwNYwopD1K06wGLKiF/sVSFe7ThSheP5BfClxudH7mPJ5bxT8n2qyJ
	 /xiOWxQz4V+bpbMHaqz4nao5+MAGYJirq19/A1lq7pI/TzhNLlqUoydth5ctavc24U
	 R9VJHgsdhg+IPSZ3g9PXrhO/ekK3Glh03jZrPOJFueHPW9SqWKBRZ0taUQJw/EuwTE
	 JBssvdhxwD+DNHhVoCFWEIZrnzKhrc1BxUesEJF/biM8WPXW4+0Qii54EDaEcEn30s
	 VG7RjDWG4JXwz8QOOdBPAhhWvVs2RbEfto/ebdlAcV7VXmIcjEatcuxejOHnoKaFq7
	 zdOA97CgNAo7Q==
Subject: Re: [PATCH net v4 7/7] selftests: drv-net: Add VLAN test
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:46:05 +0000
Message-ID: <178908396551.219967.6360903882566438769@kernel.org>
In-Reply-To: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
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

- [Medium] vlan.py's 802.1ad/QinQ matrix never requests the one feature
  combination in which the QinQ mis-stripping bug the commit says it…
- [Low] test() calls cfg.require_ipver("4")
  (tools/testing/selftests/drivers/net/hw/vlan.py:94) although the test…

--

selftests: drv-net: Add VLAN test

Adds tools/testing/selftests/drivers/net/hw/vlan.py, which pings over
802.1q, 802.1ad and QinQ VLAN interfaces with hardware RX VLAN stripping
toggled on and off, plus the Makefile and config entries for it.

A couple of questions about the variant matrix and the environment
requirement below.

> diff --git a/tools/testing/selftests/drivers/net/hw/vlan.py b/tools/testing/selftests/drivers/net/hw/vlan.py
> new file mode 100755
> index 000000000000..61fa452b95bd
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/hw/vlan.py
> @@ -0,0 +1,112 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +
> +"""
> +VLAN tests.
> +
> +Validates that ping traffic is sent and received correctly over 802.1q
> +and 802.1ad VLAN interfaces, with hardware RX VLAN stripping enabled and
> +disabled on the local interface.
> +

[ ... ]

> +def _vlan_setup(base, addr, outer_proto, inner_proto, host=None):
> +    """Create VLAN interfaces on base and set an IP on the innermost one."""
> +
> +    _vlan_add(base, OUTER_DEV, outer_proto, OUTER_VID, host=host)
> +    if inner_proto:
> +        _vlan_add(OUTER_DEV, INNER_DEV, inner_proto, INNER_VID, host=host)
> +
> +    dev = INNER_DEV if inner_proto else OUTER_DEV
> +    ip(f"addr add {addr}/24 dev {dev}", host=host)
> +
> +
> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    feats = {"rx-vlan-offload": hw_strip}
> +    if outer_proto == "802.1ad":
> +        feats["rx-vlan-stag-hw-parse"] = hw_strip
> +    set_ethtool_feat(cfg.ifname, feat, feats)

[Severity: Medium]

Does this combination actually reach the QinQ mis-stripping case the commit
message says the test aims to catch?

In _setup() both rx-vlan-offload and rx-vlan-stag-hw-parse are driven to the
same hw_strip value, and _vlan_variants() only yields all-on and all-off
combinations. The combination rx-vlan-offload=on with
rx-vlan-stag-hw-parse=off is never requested.

On a device where NETIF_F_HW_VLAN_STAG_RX is fixed off, set_ethtool_feat()
raises before running any ethtool -K:

tools/testing/selftests/drivers/net/lib/py/feat.py:set_ethtool_feat() {
	...
		if current[name]["active"] != state:
			no_change = False
			if current[name]["fixed"]:
				raise KsftXfailEx(f"Device does not support {name}")
	...
}

So the whole 8021ad_hw / qinq_hw variant is skipped, including the
rx-vlan-offload=on part which is settable on those devices. The surviving
8021ad_sw / qinq_sw variants then force rx-vlan-offload off.

That leaves no 802.1ad or QinQ ping running with hardware C-tag stripping
active. Wouldn't a driver that strips the first VLAN tag regardless of TPID,
reporting an 0x88a8 tag as a C-tag, still report "ok 8021ad_sw" and
"ok qinq_sw" here? The sample TAP output in the commit message shows exactly
this on st_gmac, and netdevsim likewise advertises only
NETIF_F_HW_VLAN_STAG_FILTER and not NETIF_F_HW_VLAN_STAG_RX in nsim_setup().

Should the 802.1ad/QinQ variants instead be split so that rx-vlan-offload=on
is requested independently of rx-vlan-stag-hw-parse, so a fixed
rx-vlan-stag-hw-parse does not remove the hardware stripping coverage?

Related, the docstring says:

  Validates that ping traffic is sent and received correctly over 802.1q
  and 802.1ad VLAN interfaces, with hardware RX VLAN stripping enabled and
  disabled on the local interface.

and the commit message says the three configurations are covered "each with
hardware RX VLAN stripping enabled and disabled". Could these be reworded to
match what happens on devices where rx-vlan-stag-hw-parse cannot be changed?

> +
> +    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
> +    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, inner_proto,
> +                host=cfg.remote)
> +
> +
> +def _vlan_variants():
> +    """Generator that yields the VLAN protocols and the stripping mode."""
> +
> +    yield KsftNamedVariant("8021q_hw", "802.1q", None, True)
> +    yield KsftNamedVariant("8021q_sw", "802.1q", None, False)
> +    yield KsftNamedVariant("8021ad_hw", "802.1ad", None, True)
> +    yield KsftNamedVariant("8021ad_sw", "802.1ad", None, False)
> +    yield KsftNamedVariant("qinq_hw", "802.1ad", "802.1q", True)
> +    yield KsftNamedVariant("qinq_sw", "802.1ad", "802.1q", False)
> +
> +
> +@ksft_variants(_vlan_variants())
> +def test(cfg, outer_proto, inner_proto, hw_strip):
> +    """Run a single VLAN test"""
> +
> +    cfg.require_ipver("4")

[Severity: Low]

Is this requirement needed? The test never uses the environment's IPv4
endpoint addresses: _vlan_setup() installs its own 198.51.100.1/24 and
198.51.100.2/24 on the newly created VLAN devices and the ping goes between
those.

NetDrvEpEnv.require_ipver() skips unless both the local and remote address
for that version were configured:

tools/testing/selftests/drivers/net/lib/py/env.py:require_ipver() {
	if not self.addr_v[ipver] or not self.remote_addr_v[ipver]:
		raise KsftSkipEx(f"Test requires IPv{ipver} connectivity")
}

So an environment configured with only LOCAL_V6/REMOTE_V6, which
_check_env() accepts, skips all six variants even though the base ifname,
the remote ifname and the test's own VLAN addressing are all available.

drivers/net/macsec.py does the same 198.51.100.x-over-VLAN ping in
_setup_vlan_ips() without calling require_ipver(). Could the call be dropped
here as well?

> +
> +    _setup(cfg, outer_proto, inner_proto, hw_strip)
> +
> +    cmd(f"ping -c 1 -W 5 {REMOTE_IP}")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com
