Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74F3F0AB8;
	Tue, 22 Sep 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078514; cv=none; b=cn80I+2e5gJjoPzllw4Og7sr/ZQOZQ/2qB2bPryzBCR3WamVj+QYtjP4Dj58NKHSZb2tWYCKY3YhiyBG0/X+2zdq1Co2B//0jPn1mfuawsslGY2+vlY5KZ0vPSg5ihc6kG/3meDdtOzfUb3AGa9VekjnIsQpAbg49Rvu/FX2OHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078514; c=relaxed/simple;
	bh=HAoe+qByPiy0LFMtD61sw5Jo9+lV5hwVIFOfp1tl83w=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KK4wCn1r9mgj/nALkjTdZH4s3zbjPvG0Zvzy3v99HdET21eq0Ivt38KYFwJspYWEib6OzzSM90Tav7y3uQjv3OFhWDvUyKAx/EefKgnuWAd3J6f3FdmHtFLweHnM1j8sSBFmIHQgv47t/clneGYwknIbtdhiAPYqiSQpk0rOhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niz/nDlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niz/nDlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AE41F000FF;
	Tue, 22 Sep 2026 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078512;
	bh=0d1w+TjzOQS+Ilh3EbfVNckPxJlFQXv/gfk8jKULqy4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=niz/nDlYsxpm+xTzc0DEE2ktE9yMEnqmc4PGgq46EotEsR4S8BM5QKzYDyIIWrl1b
	 MrBd3aLRfDuyUeVl3aLkRcr5RMBzI97AJaXz+MzSJIDW6i4j+/Y/qdkWwDw4NUn0zl
	 oX2SaAjIgLzJWkSg6owxuZ2bJIOEztzvKkMfOToIA78l+OguxYQLAIIbtCxEiytIg/
	 wyO2MmYiHFL5eu/DhV0IF1Z6hG2K0/6ql+lCL4ZWvAL1Twr9lZDsCbEMG1GCvx9cx3
	 pn9yXce2begPPSBgQo/TEuG7O2v0DUENjJo2pwYfO3X7iJ4mok0RQBfxQPbrPLpHJU
	 kN+ucYj0GBG3w==
Subject: Re: [PATCH net-next v2 3/3] selftests: drv-net: Add VLAN test
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, nb@tipi-net.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 22 Sep 2026 12:01:51 +0000
Message-ID: <179007851123.2160803.1611661157953066905@kernel.org>
In-Reply-To: <20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
References: <20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] New configuration knobs VLAN_LOCAL_V4 / VLAN_REMOTE_V4 in
  tools/testing/selftests/drivers/net/hw/vlan.py (lines 48-49) are read…
- [Medium] _setup() reprograms RX VLAN stripping via set_ethtool_feat()
  (tools/testing/selftests/drivers/net/hw/vlan.py:91) and then…
- [Low] Concern (assessed as a false positive, retained for policy
  combination): in _setup()…
- [Low] The only traffic validation in test()
  (tools/testing/selftests/drivers/net/hw/vlan.py:115) is 'ping -c 1 -W…
- [Low] Documentation/implementation mismatch: the commit message and the
  module docstring…

--

selftests: drv-net: Add VLAN test

This adds drivers/net/hw/vlan.py, which builds 802.1q, 802.1ad and QinQ
VLAN stacks on the device under test and its remote endpoint, then pings
across them with hardware RX VLAN stripping enabled and disabled. Six
variants are registered, and the test is added to TEST_PROGS along with
CONFIG_VLAN_8021Q in the hw config.

No Link: tags present in the commit header.

> diff --git a/tools/testing/selftests/drivers/net/hw/vlan.py b/tools/testing/selftests/drivers/net/hw/vlan.py
> new file mode 100755
> index 000000000000..00c90b930f67
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/hw/vlan.py
> @@ -0,0 +1,127 @@

[ ... ]

> +OUTER_DEV = f"vlout{os.getpid()}"
> +INNER_DEV = f"vlin{os.getpid()}"
> +
> +OUTER_VID = 100
> +INNER_VID = 200
> +
> +LOCAL_IP = os.environ.get("VLAN_LOCAL_V4", "198.51.100.1")
> +REMOTE_IP = os.environ.get("VLAN_REMOTE_V4", "198.51.100.2")

[Severity: Medium]
Are VLAN_LOCAL_V4 and VLAN_REMOTE_V4 reachable when the harness is
configured through net.config?

These two lookups run at module import time against os.environ, but
NetDrvEnvBase._load_env_file() in drivers/net/lib/py/env.py merges
net.config entries into a copy and exposes them as cfg.env only:

    env = os.environ.copy()
    ...
            env[pair[0]] = pair[1]
    return ksft_setup(env)

os.environ is never updated, so a VLAN_LOCAL_V4/VLAN_REMOTE_V4 line in
drivers/net/hw/net.config is silently ignored and the hard-coded
198.51.100.1/198.51.100.2 defaults are used instead. Would reading these
from cfg.env inside the test body work better, given that
drivers/net/README.rst states "The variables can be set in the
environment or by creating a net.config file in the same directory as
this README file"?

The two new variables are also missing from the "Variables" section of
drivers/net/README.rst, which lists NETIF, LOCAL_V4/V6, REMOTE_V4/V6,
LOCAL_PREFIX_V6, REMOTE_TYPE and REMOTE_ARGS. Should they be documented
there as well?

[ ... ]

> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    names = ["rx-vlan-offload"]
> +    if outer_proto == "802.1ad":
> +        names.append("rx-vlan-stag-hw-parse")

[Severity: Low]
The commit message and the module docstring say the "sw" test variants
"disable all of them", referring to rx-vlan-offload and
rx-vlan-stag-hw-parse. Here rx-vlan-stag-hw-parse is only appended when
outer_proto is "802.1ad", and the same list is used for both directions.

For the 8021q_sw variant on a device where rx-vlan-stag-hw-parse is
active, the feature is left as-is, so the "all HW RX stripping off"
baseline the docstring promises is not established. Should the wording be
narrowed, or should names include every supported RX stripping feature
when hw_strip is False?

> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    feats = {}
> +    for name in names:
> +        # hw: skip the features the device does not support
> +        # sw: request all of them off
> +        if hw_strip and feat[name]["fixed"] and not feat[name]["active"]:
> +            continue
> +        feats[name] = hw_strip
> +
> +    if hw_strip and not feats:
> +        raise KsftXfailEx("Device does not support RX VLAN stripping")

[Severity: Low]
This isn't a bug, but on a device where rx-vlan-offload is changeable and
rx-vlan-stag-hw-parse is fixed-off, 8021ad_hw and qinq_hw run with only
C-tag stripping enabled and report "ok", with nothing in the output
saying which features were actually applied.

The skipping itself matches what the docstring describes, and genuinely
impossible requests still xfail through set_ethtool_feat() in
drivers/net/lib/py/feat.py:

            if current[name]["fixed"]:
                raise KsftXfailEx(f"Device does not support {name}")

Would it be worth printing the resulting feats dict via ksft_pr() so the
reported pass records which stripping path was exercised?

> +
> +    set_ethtool_feat(cfg.ifname, feat, feats)
> +
> +    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
> +    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, inner_proto,
> +                host=cfg.remote)

[Severity: Medium]
Can toggling rx-vlan-offload here make the following ping flaky on
hardware that re-initialises the datapath?

Some drivers implement ndo_set_features for NETIF_F_HW_VLAN_CTAG_RX with
a full down/up. e1000_set_features() in
drivers/net/ethernet/intel/e1000e/netdev.c keeps CTAG_RX in its changed
mask:

	if (!(changed & (NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX |
			 NETIF_F_RXCSUM | NETIF_F_RXHASH | NETIF_F_RXFCS |
			 NETIF_F_RXALL)))
		return 0;
...
	if (netif_running(netdev))
		e1000e_reinit_locked(adapter);

so the call chain is set_ethtool_feat() -> e1000_set_features() ->
e1000e_reinit_locked() -> e1000e_down() (carrier off) + e1000e_up() with
PHY re-autoneg. _setup() then creates the VLANs and test() sends a single
echo request without waiting for carrier, so ARP plus the 5 s reply
window can expire inside the re-link. The deferred feature restore
between variants has the same exposure for the next variant.

Would a carrier wait (as drivers/net/lib/py/env.py does on
/sys/class/net/<dev>/carrier) or a retry loop like the one in
drivers/net/hw/rss_ctx.py be appropriate here?

> +
> +
> +def _vlan_variants():

[ ... ]

> +@ksft_variants(_vlan_variants())
> +def test(cfg, outer_proto, inner_proto, hw_strip):
> +    """Run a single VLAN test"""
> +
> +    _setup(cfg, outer_proto, inner_proto, hw_strip)
> +
> +    cmd(f"ping -c 1 -W 5 {REMOTE_IP}")

[Severity: Low]
Is route selection guaranteed to send this ping out of the VLAN device?

_vlan_setup() installs the address with "addr add {addr}/24 dev {dev}" on
the innermost VLAN, and this ping is not bound to an interface. If
cfg.ifname or any other interface on the DUT already carries an address
inside 198.51.100.0/24, two connected routes for the same prefix exist
and the pre-existing one can win, in which case the ICMP exchange leaves
untagged and the test still reports "ok" without exercising VLAN
tagging or stripping at all.

The reverse case is that installing 198.51.100.1/24 on the VLAN hijacks
the prefix used by a REMOTE_TYPE=ssh control channel living in it.

drivers/net/macsec.py does the same VLAN-on-top-of-an-offload-device
dance with the same addresses and binds explicitly:

        cmd(f"ping -I {vlan_name} -c 1 -W 5 {remote_ip}")

Would adding -I for the innermost VLAN device here be preferable?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918112529.96039-1-ovidiu.panait.rb%40renesas.com
