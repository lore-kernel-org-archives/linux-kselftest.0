Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365D45FFC7
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795438; cv=none; b=oZOiLprsjJ79J6I0/vr4PLMYlTmJuASqoUjeoDqYO3Q6j4CuxgDwghUaumvFMlhtrsy2XRE6QtzCjzy2ZGNCZpER3Vxo75NYcclp903jNaeUqvRmpSU/mdp7h7XrfVSMT59/tc2nY3snoToSi5Gw1nd8dmmw46NtsnI5maMqmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795438; c=relaxed/simple;
	bh=OAARye3bqTwYbW4R9i8hEdUhoTwMnRP1LZaGR0XvoSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FB1GqttCo/2I+oYpmW8v8oeQEn3QNTA8hLg3o/apMJ2W1ZYCsfJhJZXIhDF2PjfwD11cyERZ3RjZMNx7XJYywNIHt+8l5bmJanb3scMJ9FuGj/X+Yy9wJbcgU9dpIca/qxQnZf0yxhrbVa7OmtGGVxMsG7bKjiAps+Cqka7XfFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+3W+e1+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+3W+e1+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d0726ccc2so14217065e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795435; x=1789400235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwmjFU3bbTIZNihHLqre37XheLVH2NBtdBfRtXysiDA=;
        b=H+3W+e1+PnV4Ek/4ourIs8vjKykypxxsIy+fIuoBHWdJwssJau679ZoottG9yPktym
         GHCVCv1SgQcrzP3R5PkkEsZHaa0yo5aUYrZNVnLgEMAuO4YFdfYLO0DTojyYGaLXq4A/
         olNh6gyLBdzaD0D9FFiyYWsqPdtvxFri3OPCNpzk2b0ez95iiUkxMC0l4oSCqQDx+bGl
         GJn+08heUdNbm+f/ebqmN3T34hjzt0UHp+bFBHr4JfX/Fn7zdvVwE0VXU/i6wx0QhzmG
         WSXM7cfm+zxPBhDNwp+R2nKt22CZPMpaYKNfbLTJol4aDJmogWNwGT0yQKLIwIE2SpN5
         nwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795435; x=1789400235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwmjFU3bbTIZNihHLqre37XheLVH2NBtdBfRtXysiDA=;
        b=tHYMNtgMi2XYD9wGzFBglVcY89uFiVvfrh7Kf4KQ8kdFF9gNFLmber3zOaAN3xpqiN
         WPYd0QSc4olBirM5fZsUI3oBU5cNK9faQhqEN5WVgHBhkLqBoPfiBEeTutY87vuoO2SL
         N0Ss2/OoxKGQNjuatozM/Oqr+QtiDq9soz90amGvdi+zFpdkWkyQWqPrgArazv121pv7
         2ADKta0HDIsIQLSPWbdBT2GnDZDqb57rzeuooSD9RJOUdnbUZj/E4jKoW7DqyyEsLDzI
         hcyf276tI4uE5OnqmiJIDinkqe3VobsjU5yxs3H5nUg0h8atc1KBnHFsDsheyzxLJZEu
         xsDw==
X-Forwarded-Encrypted: i=1; AKwUvBym1AH/FG7mUZl656vQCTgP9gimY4yt0Eqt9rxSvUO4LhQ3PU6FxZqqfrw1akEAlhvDEMLL6OUQeugxVMEqrTM=@vger.kernel.org
X-Gm-Message-State: AFuF++l3nQmwbDJGZp7Vc6DEZBeJ3drdH8keRiqh0wMZGNM2bOihwWa/
	8McEp0xv4ULVACqmHJflPC/MJj5P+VJ2svZAINNl0FH+Bv2/zKtvTq6Q
X-Gm-Gg: AYBFou2CyhXCQ2ljDsWTdsNdfM+t+yThcbRODb/pplmJySX8xEAJr9jLH2FdVgUJZbx
	LBWqVPj+qdzCzYZWbbmK9Pu/MJijHMnBf821UA7xmAe+sq8xg88rrUqkd6/BYOFb+KSJ4PZeCA2
	uDbo6XvRQPe8nudqMWwjicNWEHpW4D6Iiipl8ZQcU5y9LFb9uXJGUxAgFgtNt+WtIiODkL273qj
	bntA50pqaDs0wTvoTLi3ImzE8HBFXuhLh7uQuwnO+/W8/BxfeUGNhy2Bpi+1hI1nRH3arfbSDbU
	GoC5GYS57g6KJ8AUgtkxiIMvp8l8/mU0YgzzsNDHAJJTA93bG6TFYZugrwV4ogXSoAQkGFyN9ZP
	k/LThWmfWSDk4VU8kfe56JY6nUygdhuqc/fWxSM46I6v/8BuWKVx3OTl6OlpAIEOtRS/T/DI31C
	INJOW/QuuafVOh1s829LFOt14lixJU5BNwiKEZmVu+SahoN4oGbs9rD1JX4i+G9ip1/oGbjXDhe
	M4kY1WFhVRKUdrm+uaWQWOdLF3KOWBP2U0eeK+Dp0Wk3RGFaluWTraXXgsJqg==
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr549249705e9.10.1788795434804;
        Mon, 07 Sep 2026 08:37:14 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm404982005e9.12.2026.09.07.08.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 08:37:14 -0700 (PDT)
Message-ID: <2520c402-e54a-4451-ae2e-9ab9816c11ed@gmail.com>
Date: Mon, 7 Sep 2026 16:37:12 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] net: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kselftest@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-2-hemanth.selam@gmail.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20260907044635.7141-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2026 05:46, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
...
> diff --git a/drivers/net/ethernet/sfc/mcdi_pcol.h b/drivers/net/ethernet/sfc/mcdi_pcol.h

mcdi_pcol.h (and the Siena version) are generated from firmware definitions,
 so any changes you make would be overwritten next time they are regenerated.
I have forwarded these changes internally, so they should reach the firmware
 team.

> index b9866e389e6d..b00e7c100566 100644
> --- a/drivers/net/ethernet/sfc/mcdi_pcol.h
> +++ b/drivers/net/ethernet/sfc/mcdi_pcol.h
> @@ -5736,7 +5736,7 @@
>  /*            Enum values, see field(s): */
>  /*               MC_CMD_ETH_TECH/TECH */
>  /* Pause abilities to advertise during auto-negotiation. Valid when auto-
> - * negotation is enabled and MC_CMD_SET_MAC_IN/FCTL is set to
> + * negotiation is enabled and MC_CMD_SET_MAC_IN/FCTL is set to
>   * MC_CMD_FCNTL_AUTO. If auto-negotiation is disabled the driver must
>   * explicitly configure pause mode with MC_CMD_SET_MAC.
>   */
> @@ -10173,7 +10173,7 @@
>   * configuration.
>   */
>  #define    MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_LEN 4
> -/* Handle to the port to from which to retreive properties */
> +/* Handle to the port to from which to retrieve properties */
>  #define       MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_PORT_HANDLE_OFST 0
>  #define       MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_PORT_HANDLE_LEN 4
>  
> @@ -13547,7 +13547,7 @@
>   * an ancestor of the current user (see MC_CMD_SET_VI_USER). Note that LL
>   * queues require this to be called after allocation but before initialisation
>   * of the queue. TLP options of a queue are fixed after queue is initialised,
> - * with the values set to current global value or they can be overriden using
> + * with the values set to current global value or they can be overridden using
>   * this command. At LL queue allocation, all overrides are cleared.
>   */
>  #define MC_CMD_SET_VI_TLP_PROCESSING 0xb1
> @@ -21387,7 +21387,7 @@
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_ALL_MULTICAST 0x200 /* enum */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_PROMISCUOUS 0x400 /* enum */
>  /* enum: Allows to set the TX packets' source MAC address to any arbitrary MAC
> - * adress.
> + * address.
>   */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_MAC_SPOOFING_TX 0x800
>  /* enum: Privilege that allows a Function to change the MAC address configured
> diff --git a/drivers/net/ethernet/sfc/siena/mcdi_pcol.h b/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
> index b81b0aa460d2..4d1da698c524 100644
> --- a/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
> +++ b/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
> @@ -6861,7 +6861,7 @@
>  /***********************************/
>  /* MC_CMD_CLP
>   * Perform a CLP related operation, see SF-110495-PS for details of CLP
> - * processing. This command has been extended to accomodate the requirements of
> + * processing. This command has been extended to accommodate the requirements of
>   * different manufacturers which are to be found in SF-119187-TC, SF-119186-TC,
>   * SF-120509-TC and SF-117282-PS.
>   */
> @@ -16293,7 +16293,7 @@
>  
>  /***********************************/
>  /* MC_CMD_GET_LICENSED_V3_FEATURE_STATES
> - * Query the state of an one or more licensed features. (Note that the actual
> + * Query the state of a one or more licensed features. (Note that the actual

Neither this nor the original text makes grammatical sense; I think the article
 'an' should be deleted entirely rather than replaced with 'a'.

>   * state may be invalidated by the MC_CMD_LICENSING_V3 OP_UPDATE_LICENSE
>   * operation or a reboot of the MC.) Used for V3 licensing (Medford)
>   */
> @@ -16798,7 +16798,7 @@
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_ALL_MULTICAST 0x200 /* enum */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_PROMISCUOUS 0x400 /* enum */
>  /* enum: Allows to set the TX packets' source MAC address to any arbitrary MAC
> - * adress.
> + * address.
>   */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_MAC_SPOOFING_TX 0x800
>  /* enum: Privilege that allows a Function to change the MAC address configured
The other sfc changes outside of pcol look fine.
-ed
