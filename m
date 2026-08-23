Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B16331EB9
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787471405; cv=none; b=NPXX8U38B19U0SYrNllk97HPvVni8Ghrwi8CenIt1/nmQtGFxn75Clr+Vm2SCJQNgDyHxR6etqdWbTxe29PVGWVJZsRXSoI21CHFRsZFE6riGn4eio/B7c5hxcSojjs0GXtVlGa4tAon3UCGue5QheHa3kobKCZHIcav6mWhZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787471405; c=relaxed/simple;
	bh=u7GVsaIAqP5gBE2OM2KUTIP7EYzE75vY8OHAIyB+GX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZfRFjODyTSCHU+st+9dZLFMhvxCq+4A7NQybtD7MtCXTUQnwWCURHyT5HqhD/ZO8fXPt290MMoS5XDtH5prM3ajPm8ZnQmIUeu+rl8oi4xNWsj1emBQSty0KXcUXfLz0ytMzjW/hQnKgtLAklN3kWxseF/2PxM6kGD05daMAu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GE+BuqPW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GE+BuqPW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5772C4E41360;
	Sun, 23 Aug 2026 07:50:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2286B60378;
	Sun, 23 Aug 2026 07:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1858B11C77DF9;
	Sun, 23 Aug 2026 09:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787471401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d76hSxmuaOFdQA12QBnAjVEJYYylYbR4s4u+o28nAZM=;
	b=GE+BuqPWdq+dCDRIuQsUYk33c5ZLhde79ZffEBZQCz4ZKPPwsC0q8UuaKH4+gKL4zaEXJB
	1HGQELhX0VrKd2x8epsfb01d8IAjHMgmTknXGGUHsY18CKgAFm/jXrouRi+OJu3V27SHg8
	vQzJ1iiC60EP4P1U2gkdvhRmPW3XzrFBQzK3gKnbcdd1Fa6HKzpoab3RZ/w3zIjGxPKC3K
	V4oRt+wj1N47FVMwHa8wl7x6wgy1DQ5WlNSk7gSnn2wOt0VEVKzyLVz2LJBJ8QTH/Da9/P
	WhUxL38B/fD5s+noP9s16NJ5TlMcFLuFIOehHo12fe4+MDZST+/Dw9Ojhf7ELA==
Message-ID: <c632ca88-f5e5-4595-b507-955d1a2fcab7@bootlin.com>
Date: Sun, 23 Aug 2026 09:49:55 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing
 only when supported
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shuah@kernel.org, joabreu@synopsys.com, yi.fang.gan@intel.com,
 jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 8/21/26 19:09, Ovidiu Panait wrote:
> stmmac_vlan_update() turns on double/S-VLAN processing whenever an
> 802.1ad VLAN is registered, without checking whether the MAC actually
> supports double VLAN processing. That capability is reported in
> dma_cap.dvlan.
> 
> This was found while investigating a separate bug in the double VLAN RX
> stripping path. The outer 802.1ad tags were unexpectedly stripped by the
> MAC (because the ESVL bit was set).
> 
> Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that double
> VLAN processing is enabled only on supported hardware. Also, advertise
> NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only when
> dma_cap.dvlan is set.
> 
> Fixes: 3cd1cfcba26e ("net: stmmac: Implement VLAN Hash Filtering in XGMAC")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v2 changes:
> - Advertised NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only
>   when dma_cap.dvlan is set (reported by Sashiko).
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 16fe56a1f617..880cf3fab913 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6820,6 +6820,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  	if (!netif_running(priv->dev))
>  		return 0;
>  
> +	if (!priv->dma_cap.dvlan)
> +		is_double = false;
> +
>  	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
>  }
>  
> @@ -7954,14 +7957,18 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
>  	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
> +	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
> +	if (priv->dma_cap.dvlan)
> +		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> +
>  	if (dwmac_is_xmac(priv->plat->core_type)) {
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> -		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
> +		if (priv->dma_cap.dvlan)
> +			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
>  	}
>  	if (priv->dma_cap.vlins)
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;

