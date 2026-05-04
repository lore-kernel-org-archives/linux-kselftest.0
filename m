Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E872F0C79
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880490; cv=none; b=e19SSrKVQ9Tr8SJRb3MEy3syRHCeuunvZYJ39evb/MN+BRW9IAnqxvnVpjPMWW8Q7y0SER93pVxqwj0B5K5lpgVRuHvApGJ/XCKYmiKve2x3w/mEuKTwQ09OrGOo/+ADLc+Se7lDyaVx6831Brd0Z9HRDsnVOtsvOAACxlLBUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880490; c=relaxed/simple;
	bh=9C2sSNNeZ1cCc4ayki9NO6X/nZzRwbOwT0cnpksF4xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHnKUrAMHEUXo0pS06o6dGbB+WEAiBuyNk+cozsTSZu0TVag2w2WjbhLNUuqvlalVRloYmPiSC5Bgk/B7gvonDUIl73iYO9RjiDiQQt0bNuISoE0gHJ/l6tha0eambNt0EuvpogCHeeYBdQTpqHi10MArcDiFfVp/OvrjUa9pck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=RUQZ8Jcu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="RUQZ8Jcu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891cd41959so30066825e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777880488; x=1778485288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N53aTZ6Alw9A7BKH2xpHsS6zd2eepFFKtOswmVsDqXA=;
        b=RUQZ8JcuUclm2Iaw/GyghTCe4JX5eTfQMY0hu4ieGEPN8ZvjPUYqGCS/eoSzNPonVl
         xJ4o3VmJLIRwJLc9dI5YzI9gJs3zhK0SAzHxxyKlMtvQs4mKe3t9dm0xg+t+z8yhRBH7
         ysjMNXIyh0tF/XF+5iJA7R921b65NG/cyp2vvBCqbmrZVngQ5k2K06grXLmGgeLCrTLD
         SYehA3mjcf9GyMNsRWiCemUFRi5/5PDtls7l21WntFcd2nzstnSn6jeUkhvBxU6oFIym
         IYzQRBEi+fi7wLtpncciYCxFSX8FOcrpXbecleIZYLPOQEfUzlPVinfl+bl6vh5oC9fp
         HwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880488; x=1778485288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N53aTZ6Alw9A7BKH2xpHsS6zd2eepFFKtOswmVsDqXA=;
        b=pfLNogkcIN/RCdHTBbD7pWKzE0RFPsbu5TifPkJIKsYc4hp5ZUD+uzn6gW6XJVitx8
         DakB+8ugQjx35hoA0hjob1a6fP3HMDm5xBNxKyQcqIL7MnLzDpJWtF3FALHD41aOJ7cl
         HKFcP66ENFPa1wFd5gzsZrcVKju36PJ0Id3xAxbNVitUAJJTvLRH0kbvayolrdPKUzlZ
         zbl+34Wn73/wG+e+FlhmmHYlDHTt8+W1U8ncznHPvPc/ymklHoetl8obzPCyd/dckIwH
         TH8XiRIye/jeOrgaDPPCJgTs9kMxtFTCAmyYDtDFS6wFAdzurmvqcugqtFwUoT56IoKQ
         MqRw==
X-Forwarded-Encrypted: i=1; AFNElJ+WZ8VsayVFvrsLnmQsk0T9FE2s9TedxWO6wYNqHQbTkRclwQYd2x2mjZknTQh4BQOHRKm33Vs591Dq3obg4+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNO7G9Viz0UTPFmCSTH2hQaUs99xHlypNqqLWADzIZpf85nTu
	PT2l20z6YLRMBmPH2QGMTb9QKMHtaDsA92nRUDfG9QuJy4X6T4LRMqru23EA0LAJMx4=
X-Gm-Gg: AeBDieuM1BD1V5zx6BCjeCUxrJw2mVEPargCc0ANV6/kj1OMlczjZxCSbLpWvS4DCuy
	11IOTKcrI+cz8xPWeQBfbCXG3pvA2U10TbIudk0g6lKPsPjdymZD321klkBs3l8sewcr9vBjwno
	yeaJ5ymZK7V7LHmWVYk47K6ZzhhA3sVoohLT6h6ijuLMR9gJmWnk2H6kEL0/bb7YQrYLNcJryzx
	vaZYadus1HlVZVRsFyawcKRBbmAokkS2yPbZUyZsuKmvU2Dq6lOJV0tNRvwaZECvE17QeJfh5Ck
	dPlO6u3UcMRCwbQNo6YJMRhKzLkNwwSRO4HOzp12ShB2S72gk3E65aVHHMmMzcKUcnWO4rRXvAi
	npdY4ieIfYv4H10K5b2hOUXjISDRt6+SEM22BiAzwVzogxTP1tDrN07XESTn1k87vnPF+0zVwZR
	eCE1kyT59z2/H+BE/RodncP/k3uORhevBA8RMQR4ttPAWTBy2VrG5aIOqrrS18sFoq
X-Received: by 2002:a05:600c:c0c5:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48a98662e71mr109163945e9.21.1777880487219;
        Mon, 04 May 2026 00:41:27 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a9919fc3asm86901945e9.0.2026.05.04.00.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:41:26 -0700 (PDT)
Message-ID: <7f600103-db90-425d-8ae7-b80cd9d81ad1@blackwall.org>
Date: Mon, 4 May 2026 10:41:24 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] bridge: Add internal flags for
 neigh_forward_grat
Content-Language: en-US, bg
To: Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, ast@fiberby.net,
 liuhangbin@gmail.com, daniel@iogearbox.net, aroulin@nvidia.com,
 fmaurer@redhat.com, sdf.kernel@gmail.com, sd@queasysnail.net,
 kees@kernel.org, nickgarlis@gmail.com, amorenoz@redhat.com,
 alasdair@mcwilliam.dev, johannes.wiesboeck@aisec.fraunhofer.de,
 petrm@nvidia.com, linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20260503073532.2138165-1-danieller@nvidia.com>
 <20260503073532.2138165-3-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260503073532.2138165-3-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2026 10:35, Danielle Ratson wrote:
> Add internal flags for the neigh_forward_grat feature:
> 
> - BR_NEIGH_FORWARD_GRAT: Port-level flag
> - BR_VLFLAG_NEIGH_FORWARD_GRAT_ENABLED: Per-VLAN flag
> 
> These will be used to control whether gratuitous ARP and unsolicited NA
> packets are forwarded when neighbor suppression is enabled.
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> ---
>   include/linux/if_bridge.h | 1 +
>   net/bridge/br_private.h   | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
> index c5fe3b2a53e8..ec9ffea1e46e 100644
> --- a/include/linux/if_bridge.h
> +++ b/include/linux/if_bridge.h
> @@ -61,6 +61,7 @@ struct br_ip_list {
>   #define BR_PORT_LOCKED		BIT(21)
>   #define BR_PORT_MAB		BIT(22)
>   #define BR_NEIGH_VLAN_SUPPRESS	BIT(23)
> +#define BR_NEIGH_FORWARD_GRAT	BIT(24)
>   
>   #define BR_DEFAULT_AGEING_TIME	(300 * HZ)
>   
> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
> index 31e317a3529c..677cd5d68dc7 100644
> --- a/net/bridge/br_private.h
> +++ b/net/bridge/br_private.h
> @@ -187,6 +187,7 @@ enum {
>   	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
>   	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
>   	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
> +	BR_VLFLAG_NEIGH_FORWARD_GRAT_ENABLED = BIT(6),
>   };
>   
>   /**

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

