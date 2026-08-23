Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330EE3101A6;
	Sun, 23 Aug 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787471356; cv=none; b=BMd+0icE6Pl+XgQzc5/zgT6AbuXYtHSV63AwlRKwmqmB/KP3b3uHWvDlNqDqmqhbl7QJ4b0xSFpwhODDNBx3hIArRJjJN5VDtoKQemYadg5hzIdOIOWwIVv74cZ2Nlxh7fu336jn5HEc526Ht/0SgHfFbhH6TgwiEajGhmbZKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787471356; c=relaxed/simple;
	bh=RGX08P+xnEhR0Q9RX3DjlNna4a0Wrv5QiJ4KeOlwMmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRE1lqiE9JNakDI+ogNd00feAjJhaAl42T9YtpZ5GtUDargvTCqtieCQooQHYryCTy/UDzw+Zp2ntSGMciggZpqjVY4nLh35YzQihOKc30vOKqD0TWBsIEENxfP8SFOERvXxAM1yZzeg5qOQ25if2+vX8tCCVbpXrN0Vyntozuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e/xw8yce; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e/xw8yce"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C2854E41360;
	Sun, 23 Aug 2026 07:49:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB1D160378;
	Sun, 23 Aug 2026 07:49:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7614D11C77DF9;
	Sun, 23 Aug 2026 09:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787471344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m8focN8MgYMTxmFhIcF5B+/EEPnshV8AwXtxnCM7fNo=;
	b=e/xw8yceFqEVChChp4aCT7NZ8Y82oMlz6gJosV6pRD9Jiv6ECIc0Mk/R9qhuuK43FbzPKf
	xrTa2Dmk/ISWC/TvAxwy1irIOoKSIp4CeGZe3xM9uebUEZEJ++2EwrxhOl0HLHGvESV4nw
	U0vwMdeADElG2rNsZc+N/UCV6eXFP4OqozvKKI6bsJ33zpwW5V5LIPmFyHWdAAipx9Gp+O
	GF9cGwsMD8j61N25M4CKgLE4OB6J/sb1P/D9Ob9zDf5h0mZBOoqB74mb+AVf4NJsUv1u8M
	Ns9QS0SL2mnjSVM+oU+5K74Xg94uq1YY7bm0mk4deSL3U6aGcojWuxmi7bBvEQ==
Message-ID: <714bc86e-9f9c-4cc7-806b-a3f7e221ec94@bootlin.com>
Date: Sun, 23 Aug 2026 09:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/6] net: stmmac: Remove VLAN perfect matching dead
 code
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shuah@kernel.org, joabreu@synopsys.com, yi.fang.gan@intel.com,
 jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-2-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260821170959.79708-2-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ovidiu,

On 8/21/26 19:09, Ovidiu Panait wrote:
> stmmac_vlan_update() falls back to "perfect matching" when the VLAN hash
> filter is unavailable (!priv->dma_cap.vlhash). This fallback has been
> unreachable in normal operation since its introduction in
> commit c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if
> HASH is not available") because the NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
> features are advertised only when priv->dma_cap.vlhash is true.
> 
> The fallback is also duplicating the code in vlan_add_hw_rx_fltr(), which
> is always available since stmmac_get_num_vlan() returns at least 1.
> 
> Therefore, remove it.
> 
> Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v2 changes: None.
> 
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +-----
>  .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 41 +------------------
>  3 files changed, 4 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 04dafec021b4..6f26dbf95ce1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -633,7 +633,7 @@ struct stmmac_est_ops {
>  struct stmmac_vlan_ops {
>  	/* VLAN */
>  	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
> -				 u16 perfect_match, bool is_double);
> +				 bool is_double);
>  	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
>  	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
>  			   struct sk_buff *skb);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3..16fe56a1f617 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6809,29 +6809,18 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
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
>  
>  	if (!netif_running(priv->dev))
>  		return 0;
>  
> -	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
> +	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
>  }
>  
>  /* FIXME: This may need RXC to be running, but it may be called with BH
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> index e24efe3bfedb..983a90cb9767 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> @@ -162,7 +162,7 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
>  }
>  
>  static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> -			     u16 perfect_match, bool is_double)
> +			     bool is_double)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
>  	u32 value;
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
> @@ -251,7 +237,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
>  }
>  
>  static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				      u16 perfect_match, bool is_double)
> +				      bool is_double)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
>  
> @@ -279,29 +265,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
>  
>  		value &= ~VLAN_VID;
>  		writel(value, ioaddr + VLAN_TAG);
> -	} else if (perfect_match) {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value |= XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value = readl(ioaddr + VLAN_TAG);
> -
> -		value &= ~VLAN_VTHM;
> -		value |= VLAN_ETV;
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
> -		value &= ~VLAN_VID;
> -		writel(value | perfect_match, ioaddr + VLAN_TAG);
>  	} else {
>  		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
>  

