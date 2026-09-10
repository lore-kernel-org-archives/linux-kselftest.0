Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385BF3ACA4B;
	Thu, 10 Sep 2026 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083965; cv=none; b=OsGH9M8vJ0Wu+sZ7dmtxul961JU3CmWe+n0Z6R77ofWqR9Y1mjEH8KgfPIT4Ow5KXWEKfdqsfcd15U3iBsuIfGjEu5ZFtNfPkUx0qNZ1iMXgnDuT43+OyY8msKeE+jMQ4pRKOjSQJnkQUALzlmJgebBn98oglyBKXpntLUEjjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083965; c=relaxed/simple;
	bh=ee6/pto/YZG2iOE1w6I9ero8vPltHvNnVUSAOTUU+9g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kc8jzn722HjKLqcL1N020uRhxqhSAI+PlG5mEDbDB8Jxvl0V7rmtkYS1f8iz7DXFQVLUdCTUqd9G9T89fx/T2DK7IvQz7G7BMWi7p7zM2+FFw2nBklgtg49WsDjqgxG520E9AN/z76aP84df2FEtGZiUic1FgsC6MBqI7QLw6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHqPBuLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHqPBuLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDA21F00899;
	Thu, 10 Sep 2026 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083963;
	bh=gTp9lxLeKRbiCoZS9F/44u4HKEZO1wVF2r7BeB36fqY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lHqPBuLgBqrS+824l4rkCo+ZQvHSLJyxluudzZ0KnJol3QccbAodAcf9llJDXRYTc
	 3Ynnk3gZq/4Wd8sNNam9xifYPLwj2nakMx81Gc0NFKekltPlJYFuas61UIRNVNxZEm
	 uI+Xpsl+MZQwOFG7r+0vNblonPdK9bR281W1VlXbhlizg7jtYtiCtxF4S2M8DqriAy
	 YeWGXpsST4HPwsckgg7SbXxNg3koCxagh3bAMyF66WGvJ6PP5Oj0mJMi4SE8lJQJEj
	 RuVGjTSZzZ/bj9Jre+zbO4HvkBCG91jt5GnAu3+CACTJt6zCna3hSc8+h22aD/hKoD
	 l6ZneZ/pwIdTA==
Subject: Re: [PATCH net v4 4/7] net: stmmac: Do not advertise S-VLAN stripping
 when it is disabled
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:46:02 +0000
Message-ID: <178908396239.219967.5065369273822811230@kernel.org>
In-Reply-To: <20260908164309.59282-5-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-5-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: Low
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

Critical: 0 · High: 0 (1) · Medium: 0 · Low: 2

- [Low] Commit-message premise vs. actual code: with rx-vlan-offload off
  (priv->hw->hw_vlan_en == false) the driver did not stop stripping…
- [Low] The patch carries 'Fixes: 750011e239a5' yet its hunk depends on
  priv->hw->hw_svlan_en, a struct member added by the immediately…

Pre-existing issues:
- [High] Hardware-stripped S-VLAN tags are handed to the stack with the
  wrong TPID.

--

net: stmmac: Do not advertise S-VLAN stripping when it is disabled

The patch makes NETIF_F_HW_VLAN_STAG_RX follow NETIF_F_HW_VLAN_CTAG_RX in
stmmac_fix_features(), so that rx-vlan-stag-hw-parse is no longer reported
as enabled after rx-vlan-offload is turned off.  Both are driven by the same
EVLS field, so the two features are tied together in hardware.

A few questions below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index cd9671493b41..c81c5bb5b075 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6189,6 +6189,13 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> +	if (priv->hw->hw_svlan_en) {
> +		if (features & NETIF_F_HW_VLAN_CTAG_RX)
> +			features |= NETIF_F_HW_VLAN_STAG_RX;
> +		else
> +			features &= ~NETIF_F_HW_VLAN_STAG_RX;
> +	}
> +

[Severity: Low]
The commit message describes the problem purely as a stale advertisement
("rx-vlan-stag-hw-parse keeps being advertised as enabled"), but clearing
NETIF_F_HW_VLAN_STAG_RX here also turns off the software S-tag stripper in
the same file:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_vlan() {
	if ((vlan_proto == htons(ETH_P_8021Q) &&
	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
	    (vlan_proto == htons(ETH_P_8021AD) &&
	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
	...
}

With rx-vlan-offload off, hw_vlan_en is false and stmmac_rx() takes the
stmmac_rx_vlan() path, so before this change 802.1ad tags were still popped
into skb metadata by the driver; afterwards they are left in the linear
frame.

This looks harmless in practice, since __netif_receive_skb_core() calls
skb_vlan_untag() for any eth_type_vlan() protocol and re-establishes the tag
with the correct ETH_P_8021AD TPID.  Would it be worth mentioning the
datapath side effect in the changelog, so it is clear that only the place
where the S-tag is moved into skb metadata changes?

[Severity: Low]
The commit carries Fixes: 750011e239a5 but the hunk tests
priv->hw->hw_svlan_en, which is a struct mac_device_info member added by the
preceding, non-Fixes patch of this series ("net: stmmac: Rework S-VLAN
handling").  A backport of this patch alone onto a kernel that only has
750011e239a5 would not build.

Could a note about that dependency be added for stable backporters?

[Severity: High]
This isn't a bug introduced by this patch, but keeping
NETIF_F_HW_VLAN_STAG_RX advertised whenever NETIF_F_HW_VLAN_CTAG_RX is on
also keeps advertising an S-VLAN parse offload whose result is labelled with
the wrong TPID.

In the hardware path, the stripped outer tag is always handed up as 802.1Q:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c:vlan_rx_hw() {
	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);

		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
	}
}

while the descriptor helper deliberately accepts S-tagged and double-tagged
frames:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:dwxgmac2_wrback_get_rx_vlan_valid() {
	et_lt = FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3));

	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
}

So on a dwxgmac2 core with rx-vlan-offload on, an 802.1ad frame is delivered
as 802.1Q: an 8021ad upper device never sees it, a same-VID 8021Q upper
device does, and a forwarded frame is re-tagged with the wrong TPID.

This appears to date back to 750011e239a5 rather than to this patch, and
vlan_rx_hw() is untouched by the rest of the series: the later "net: stmmac:
Disable S-Tag processing on dwmac4" only drops the STAG advertisement for
non-XGMAC cores, and dwxgmac210_vlan_ops still points .rx_hw_vlan at
vlan_rx_hw().  Since the ET/LT field already distinguishes S-tag, C-tag and
double tag, could vlan_rx_hw() use it to pick between ETH_P_8021Q and
ETH_P_8021AD?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com
