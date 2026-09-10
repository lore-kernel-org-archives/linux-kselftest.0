Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FD49E12D;
	Thu, 10 Sep 2026 23:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083960; cv=none; b=TvmVf3mOw9EUNWVnDXR2Lkw47u0zZg2JdIfqHyW5ImdW14MgRT3X+J//xksiHeR7P80RttGStNElTKnsUgTUwJj60k0zt079fKksxoAaWvXAQDU9GLUhg9nQ0ZZsVIlvlZlPG6U+ZNtEDpFEeeFyEKO/Ob0ADj8wafj2y6lyOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083960; c=relaxed/simple;
	bh=+O3CtQGxIg0Q+Qz5HT1B02PydpiyJL/I+yrSuVTj2Vg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QUx52dP/gQ8ktGBdQPoTbilGwntk2icvtJIcC+hP1P7l7zlPPy95MOmj3P1ppU4tL+/UhqXE9OmUKf1PPGS/DITmSHPEaxc+45f7j4sWbRfG2uuMytrdgsOs4+T7zbcaHdyhE2xAdSUX5s2U33IKU0dDlVLhzpWmK6B98cdnTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4XxoVV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4XxoVV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C581F000FF;
	Thu, 10 Sep 2026 23:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083958;
	bh=hIXlAmZhvd51LswZ7HvfeI0d4Z0o2ZTt1SJi9IxuaTo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O4XxoVV8d7plkRZt1vihRfv/5KDKkZrqzVEZcDLggkRlggcTw7AJBl9IkZvNzS0P2
	 0Eu4mUqlfAscLhvMbOY55IVRVaLqSssZt+3xQxJNFM9sLBHN0V/raW8ODWDdrUjXd2
	 m7aXcfRTshjM6tNHGd7+wOGiREsWUJaXkrrPQ8r2zH5706Q4OmD61jM39vF6q9ezDV
	 2+jLl2Xa5U0BMxxHRxgjT2eyMZxJ2MLwgQ2dFzDeoFYlwRuH4q5YK4xceCIXC7aXnt
	 qzyT2lGmPvJJPfvliuCCV55qCxyXwlkPKEE2iFCfsiZ0b0lnYqZkwbIUoNNlnuG3XQ
	 k2OdacV15jCuw==
Subject:
 Re: [PATCH net v4 1/7] net: stmmac: Remove VLAN perfect matching dead code
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:45:57 +0000
Message-ID: <178908395746.219967.12509019591003417803@kernel.org>
In-Reply-To: <20260908164309.59282-2-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-2-ovidiu.panait.rb@renesas.com>
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

- [Medium] Incomplete removal: the two in-tree self-tests whose only
  purpose was to exercise the deleted VLAN "perfect matching" fallback…
- [Low] The commit carries `Fixes: c7ab0b8088d7 ("net: stmmac: Fallback
  to VLAN Perfect filtering if HASH is not available")` while its own…

--

net: stmmac: Remove VLAN perfect matching dead code

This removes the "perfect matching" fallback that stmmac_vlan_update() used
when priv->dma_cap.vlhash was clear, along with the perfect_match argument
of the ->update_vlan_hash callback and the corresponding branches in
vlan_update_hash() and dwxgmac2_update_vlan_hash().

No Link: tags were present in the commit header.

>     stmmac_vlan_update() falls back to "perfect matching" when the VLAN hash
>     filter is unavailable (!priv->dma_cap.vlhash). This fallback has been
>     unreachable in normal operation since its introduction in
>     commit c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if
>     HASH is not available") because the NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
>     features are advertised only when priv->dma_cap.vlhash is true.
>
>     Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")

[Severity: Low]
Is the Fixes: tag intended here, given the message states the removed code
"has been unreachable in normal operation since its introduction"?

The unreachability claim does check out: NETIF_F_HW_VLAN_CTAG_FILTER and
NETIF_F_HW_VLAN_STAG_FILTER are only set when priv->dma_cap.vlhash is true
in stmmac_hw_init():

	if (priv->dma_cap.vlhash) {
		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
	}

and the VLAN core only calls ndo_vlan_rx_add_vid/ndo_vlan_rx_kill_vid for
devices advertising hardware filtering (vlan_hw_filter_capable() in
net/8021q/vlan_core.c).

So no user-visible misbehaviour appears to be corrected, while the patch does
change the ->update_vlan_hash signature in hwif.h, stmmac_main.c and
stmmac_vlan.c. Would it be better to drop the Fixes: tag and target net-next,
or alternatively describe a concretely reachable failure in the message?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24656b35350b..24d64cce1d87 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6816,29 +6816,18 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
>  static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  {
>  	u32 crc, hash = 0;
> -	u16 pmatch = 0;
> -	int count = 0;
>  	u16 vid = 0;
>  
>  	for_each_set_bit(vid, priv->active_vlans, VLAN_N_VID) {
>  		__le16 vid_le = cpu_to_le16(vid);
>  		crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
>  		hash |= (1 << crc);
> -		count++;
> -	}
> -
> -	if (!priv->dma_cap.vlhash) {
> -		if (count > 2) /* VID = 0 always passes filter */
> -			return -EOPNOTSUPP;
> -
> -		pmatch = vid;
> -		hash = 0;
>  	}

[Severity: Medium]
Should the two self-tests that exist only to exercise this fallback be
removed in the same patch?

After this hunk, stmmac_vlan_update() no longer reads priv->dma_cap.vlhash,
but stmmac_selftests.c still overrides the capability around the ordinary
test bodies:

stmmac_test_vlanfilt_perfect():
	int ret, prev_cap = priv->dma_cap.vlhash;

	if (!(priv->dev->features & NETIF_F_HW_VLAN_CTAG_FILTER))
		return -EOPNOTSUPP;

	priv->dma_cap.vlhash = 0;
	ret = __stmmac_test_vlanfilt(priv);
	priv->dma_cap.vlhash = prev_cap;

stmmac_test_dvlanfilt_perfect() does the same around
__stmmac_test_dvlanfilt().

Since nothing under test inspects dma_cap.vlhash any more, do these two
wrappers now behave exactly like stmmac_test_vlanfilt() and
stmmac_test_dvlanfilt()?

That would make the "VLAN Filtering (perf)" and "Double VLAN Filter (perf)"
entries in stmmac_selftests[] report PASS from ethtool -t for a filtering
mode the driver no longer implements, and they could never fail for the
behaviour they name.

Verified that both wrappers are still unchanged at the end of the series
(bb70e68e6ebc), so this does not look like a later cleanup either.

> @@ -184,20 +184,6 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
>  		}
>  
>  		writel(value, ioaddr + VLAN_TAG);
> -	} else if (perfect_match) {
> -		u32 value = VLAN_ETV;
> -
> -		if (is_double) {
> -			value |= VLAN_EDVLP;
> -			value |= VLAN_ESVL;
> -			value |= VLAN_DOVLTC;
> -		} else {
> -			value &= ~VLAN_EDVLP;
> -			value &= ~VLAN_ESVL;
> -			value &= ~VLAN_DOVLTC;
> -		}
> -
> -		writel(value | perfect_match, ioaddr + VLAN_TAG);
>  	} else {
>  		value &= ~(VLAN_VTHM | VLAN_ETV);
>  		value &= ~(VLAN_EDVLP | VLAN_ESVL);

With only the hash and no-hash branches left in vlan_update_hash() and in
dwxgmac2_update_vlan_hash(), a nonzero hash always enables hash matching, so
the "perf" self-tests end up programming the plain hash filter. Would
dropping those two test functions and their stmmac_selftests[] entries (or
re-pointing them at the vlan_add_hw_rx_fltr() path) be the right follow-up
inside this patch?

[ ... remaining hunks snipped ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com
