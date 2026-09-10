Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406D3ACF1F;
	Thu, 10 Sep 2026 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083971; cv=none; b=jxkjzqhQ6+wEodUt7cPGfqOSYHr9IbjNBOzlx3+bNz9SW3QL7KP3TCd3C8u1byfZsMfHvNDbVUeEAcneLKjq8jMz1ZC34HOVuBvQe/3H6cWa5U+VnISHdK6tzp4auLvFNQ+orV2XcqehWgv3GmtFtTCJnqeUBGSGB6Zc+58udXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083971; c=relaxed/simple;
	bh=lPXmHh7BiZ8OzTpBGPF9yGzo9Cm6uy50Zb+wAjKJsQY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LI35J0RPEdrAj1AHy2iIrVWAiyrXUSg8mGlajx5Sme6W0rkqxnUy5/Wq/xw+KLKVihv0q/dDS1tAvxa/skMjmYElQ2BbnlH8psLDaAl5bLEJfF80qrpsapsLj2UG4bSWT/kWzCBJpt7xnOeKvN/eUbl0hHXP8UXlZPorGgrEk20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCfBa3Jx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCfBa3Jx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C361F00893;
	Thu, 10 Sep 2026 23:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083965;
	bh=HTME+v/cMNyTCzlzbZXDScM0UiZP82dI2/R8CbtOkEk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SCfBa3JxCMHk4KzjAWREZAGswfnDoSSxx34whZ2MrbAH3QlPjQMQXi+pxqq9cJq1m
	 x8n7GrLAf6uuTmK7UVoJ6zHPhwMCr+91g8d02awYhFXjnSjqP2AuskuotbUiCabKyl
	 klTXh1gFe1qGli1blLN4FqWYMSAnQzLyRtIiHKaOOPgqKggJtLwK7E9RnARxDNPTac
	 GdUmwiYtTh+7WpCekctlrE8w03rAV9FNH2r89FwBZ/dDbZgg/Q37DO7D4KaZ1zrhsp
	 WYtG5xYndz9icH0wR7i9718nSI21BfLNJLVYH+oCiW7Okohl32aenNwKIy8mpQfBP2
	 q7Yhj7j9h5v8g==
Subject:
 Re: [PATCH net v4 5/7] net: stmmac: Disable S-Tag processing on dwmac4
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:46:04 +0000
Message-ID: <178908396401.219967.17191601368324370160@kernel.org>
In-Reply-To: <20260908164309.59282-6-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-6-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

- [High] Incomplete fix: the bug class the commit message names (a
  hardware-stripped 802.1ad S-Tag being handed to the stack as…
- [Low] The in-kernel selftest stmmac_test_dvlanfilt()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1069-1076)…

--

net: stmmac: Disable S-Tag processing on dwmac4

This restricts NETIF_F_HW_VLAN_STAG_RX, NETIF_F_HW_VLAN_STAG_FILTER and
priv->hw->hw_svlan_en to DWMAC_CORE_XGMAC, on the grounds that dwmac4
cannot report which tag type the hardware stripped.  The stated goal is
that 802.1ad tags are then left in place and handled by the software VLAN
path.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c81c5bb5b075..eab2903a66e4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7952,15 +7952,20 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
>  	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
> -	priv->hw->hw_svlan_en = true;
> +	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
> +	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
> +		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> +		priv->hw->hw_svlan_en = true;
> +	}

[Severity: High]
Does this leave the misreported tag protocol reachable on dwxgmac2?

The commit message describes the bug as vlan_rx_hw() hardcoding
ETH_P_8021Q, but vlan_rx_hw() is unchanged and is still the .rx_hw_vlan
callback in dwxgmac210_vlan_ops:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c:vlan_rx_hw() {
	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);

		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
	}
}

On DWMAC_CORE_XGMAC hw_svlan_en stays true here, and dwmac_is_xmac()
below sets hw_vlan_en, so vlan_set_hw_mode() still programs the MAC to
recognise and strip S-Tags:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c:vlan_set_hw_mode() {
	if (hw->hw_svlan_en)
		value |= VLAN_ESVL | VLAN_DOVLTC;
	...
	if (hw->hw_vlan_en)
		/* Always strip VLAN on Receive */
		value |= VLAN_TAG_STRIP_ALL;
}

And dwxgmac2_wrback_get_rx_vlan_valid() collapses the ET_LT information
the commit message points at into a boolean, so vlan_rx_hw() has no way
to tell an S-Tag from a C-Tag:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:dwxgmac2_wrback_get_rx_vlan_valid() {
	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
}

With that, doesn't a received 802.1ad frame on a dwxgmac2 interface with
default features still reach the stack with skb->vlan_proto ==
ETH_P_8021Q, so the 802.1ad VLAN device never sees it and an 802.1Q
sub-interface or bridge VLAN with the same VID does?  That is the same
QinQ symptom the commit says it fixes.

Would it make sense to either derive the protocol in vlan_rx_hw() from
ET_LT, or state in the commit message that the dwxgmac2 side is handled
by a follow-up?

A second question on the gate itself: the DWXLGMAC entry in
drivers/net/ethernet/stmicro/stmmac/hwif.c also uses
core_type = DWMAC_CORE_XGMAC, but dwxlgmac2_vlan_ops has no .rx_hw_vlan
callback at all:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c {
const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
	.update_vlan_hash = dwxgmac2_update_vlan_hash,
	.enable_vlan = vlan_enable,
	.set_hw_vlan_mode = dwxlgmac2_set_hw_vlan_mode,
};
}

Should the check be narrower than core_type == DWMAC_CORE_XGMAC so
NETIF_F_HW_VLAN_STAG_RX is not advertised on DWXLGMAC?

>  	if (dwmac_is_xmac(priv->plat->core_type)) {
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> -		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
> +		if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> +			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
>  	}

[Severity: Low]
Should the selftest gate be updated to match this?

stmmac_test_dvlanfilt() gates on priv->dma_cap.vlhash, while its peer
stmmac_test_dvlanfilt_perfect() gates on the feature bit:

drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c {
static int stmmac_test_dvlanfilt(struct stmmac_priv *priv)
{
	if (!priv->dma_cap.vlhash)
		return -EOPNOTSUPP;
	...
}

static int stmmac_test_dvlanfilt_perfect(struct stmmac_priv *priv)
{
	...
	if (!(priv->dev->features & NETIF_F_HW_VLAN_STAG_FILTER))
		return -EOPNOTSUPP;
	...
}
}

Before this change both gates were equivalent, since STAG_FILTER was set
whenever vlhash was set.  On a dwmac4 core with vlhash, does
stmmac_test_dvlanfilt() now still run while exercising no hardware?  The
vlan_vid_add(priv->dev, htons(ETH_P_8021AD), ...) in
__stmmac_test_dvlanfilt() returns success without reaching
ndo_vlan_rx_add_vid():

net/8021q/vlan_core.c:vlan_add_rx_filter_info() {
	if (!vlan_hw_filter_capable(dev, proto))
		return 0;
}

so no VLAN hash or perfect filter entry is programmed and the frames are
validated through the software VLAN path instead.  Would ethtool -t then
report the double-VLAN hash filter test as passing on a core where the
feature is no longer advertised, while the perfect-filter test is
correctly skipped?

>  	if (priv->dma_cap.vlins)
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com
