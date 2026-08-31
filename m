Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2884F4052AC;
	Mon, 31 Aug 2026 23:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220147; cv=none; b=LQLI5DU/c+n8LyB5v5jh7H5uRDDdJcUQkf8zgOAuvY7vLzC4T7HPwOkfttNOpjtdNz2mPpeTRlu5YWLW10HiYEfAeWOU/8s4Ue/Zup6WKOgT91nzck2b8VlWLm0zRXm8CsKIrVkZvwuRRTYl2G+CkU2ftkWA6nYnTB3DMOorsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220147; c=relaxed/simple;
	bh=C6IeKNwQm/sqLTjJ8znlz4zTxXZTyh46Mj0/8a8vvz4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9WdNKy4o4jfMgIAfFSYsOXiNYGodhVZGxW64l0/7Xc06XAWrDxj5b4gxou1hZnYgi92NRO4phjPVdYg1v8qXe8QAbOg01WqfuN+SRIM2XGxQweM1TLz60W60k9dyQkBpT7MBx872ZdLI1j9bMssKZgMbQGLkMMHROcnDkVMY5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW8hiMNR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW8hiMNR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AAF1F000E9;
	Mon, 31 Aug 2026 23:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788220145;
	bh=Unxr3BbyQGkGI0cPruc6eSumydLU0CJBjIYvcTDq5Qc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZW8hiMNRQlKPNHk5SB6pekdpxoh5wqhetiSHQDU0LUepKpz064MG3/YKIwp9y0trv
	 j6xjzAd+bYb0/wUHzxIk2f1bgu2LsO/BAajf0gHOKFURgbwn9I+8M64lyxK7P9G1u6
	 Sx40y7ZAqMp3ULpATWYPhJDo3tv2PPw9qamTvIe7jr0bwXTtQFBBKiudRR3LfzAbuD
	 SmrejKoobgfCHCgXkVZtdWfQp+9kXTwuVayRkUlNvQX/IvNL2DuQX8tTXNfcHlhvOz
	 WRqWDHg1pt2eUV4MwWCau0RBtoaND/ZwJvKyUbIPtC7+oFaswN+2Mg6UTNKIlsncX3
	 2+tsuaSU91HoA==
Date: Mon, 31 Aug 2026 16:49:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 5/5] selftests: drv-net: Add VLAN test
Message-ID: <20260831164904.325ed438@kernel.org>
In-Reply-To: <20260825164522.4244-6-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
	<20260825164522.4244-6-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 16:45:22 +0000 Ovidiu Panait wrote:
> Add a test that validates ping traffic over VLAN interfaces. It aims
> to catch drivers which mishandle hardware VLAN tag stripping, in
> particular QinQ.

I take it back, sorry, looks like AI found something to complain about:

> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    set_ethtool_feat(cfg.ifname, feat, {"rx-vlan-offload": hw_strip})

Does toggling rx-vlan-offload here actually change anything for the
802.1ad and QinQ variants?
In net/ethtool/common.c, netdev_features_strings maps the two RX VLAN
parse features to distinct bits:
	[NETIF_F_HW_VLAN_CTAG_RX_BIT] =  "rx-vlan-hw-parse",
	...
	[NETIF_F_HW_VLAN_STAG_RX_BIT] =  "rx-vlan-stag-hw-parse",
rx-vlan-offload is the alias for rx-vlan-hw-parse, i.e.
NETIF_F_HW_VLAN_CTAG_RX (TPID 0x8100). Stripping of an 802.1ad S-tag
(TPID 0x88a8) is controlled by NETIF_F_HW_VLAN_STAG_RX, which this test
never reads or sets.
For the st_gmac/stmmac driver used in the commit message log,
stmmac_rx_vlan() gates each TPID on its own feature bit:
	if ((vlan_proto == htons(ETH_P_8021Q) &&
	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
	    (vlan_proto == htons(ETH_P_8021AD) &&
	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
and STAG_RX is only advertised for DWMAC_CORE_XGMAC, so on other cores
the outer-tag stripping state is unaffected by the flag the test flips.
Also, set_ethtool_feat() in tools/testing/selftests/drivers/net/lib/py/feat.py
only programs the feature names the caller passes, and _setup() applies
them to cfg.ifname only, never to cfg.remote. The TX counterparts
(tx-vlan-hw-insert / tx-vlan-stag-hw-insert) are left untouched as well.
Would it make sense to include the corresponding STAG feature in the dict
passed to set_ethtool_feat() for the 802.1ad and QinQ variants (xfail or
skip when the bit is fixed), or otherwise document the limitation?

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

Following on from the above: do the 8021ad_hw/8021ad_sw and
qinq_hw/qinq_sw pairs end up running the same outer-tag configuration
twice on devices that implement S-tag stripping separately from C-tag
stripping?
If so, the commit message statement
  "Three VLAN configurations are covered, each with hardware VLAN
   stripping enabled and disabled"
and the module docstring entries for 8021ad_hw/8021ad_sw and
qinq_hw/qinq_sw would describe coverage the test does not establish, and
the QinQ mis-stripping case the test aims to catch would pass in both
variants.

