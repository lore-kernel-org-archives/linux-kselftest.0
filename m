Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820020;
	b=vlLDFgDT4g+9SfiCErqowLRLA7g+9IAUH3KqIVnaoeV8Rxc0CFfyWVMxLwMQjlrNc5N1
	 jaI1oMPlwVAq71xDyXmdTvW3eVmHfS8o5q8wgbbNAwgOPHsTKtJu2v+KkXRJ+sldmgLcd
	 iNJdKiqDgO3G9yaoWUzF0/GXqHsELL87Hoq/T9phJUJrAxS3QXsnFOXqWtfeSe02PGq/P
	 gNf3Fk7iTBvHJqxA8Jxdc6m4F+OfnPpdBO9etFOqaclqEZyzU4l4+rwHhIwO4hEtOw+gg
	 urjauNgTJN9fBnkHiTN08QUophx5Wl0fnjcuCoW+K6mILFOI/OqUDwr0h8r5gyDBL3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
	b=PTeydOKup0nuWkJBj0KsMDiw1lkmjIFHl4onBbhF/Wyk958+wLolLPCeKa2YVr63ATWz
	 DYfvLZap/6j5yY1RnOK906N8YSP9aHBW627N6ILB2Gv2llCofZLlCuDXd769A3wm3x+9+
	 OqRpzajmwhINeXRXQ0f/caffhUFuJboMLZ4OZuQf1a+wrAskY9mQTbWpR/Y4akTgYSc0q
	 1rLWoDkkyUotU44OfZKbbTcg9cLRy0MHIRXlxF6dfGXOeKUUJiumKLqG2N90g6OPjdqlq
	 bdP1MzdX/Y3i276yfp5zuOzWY5oqMq281aAOXG6LmrQzg4PNIT75FnNMAQqCgHXlvCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAzVbDoR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5A606A88A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 09:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F5A606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAzVbDoR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb76bb36c7so99945e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 01:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794820018; x=1795424818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
        b=DAzVbDoROMuDExMfbuvnxK3ei/jkVt8al+uAvr4lNOIokGBrEO444rzMqWh0q3/iIY
         tFEcJuyGjmeaz0oG20AVeJ3eRs1gNe6Yr05Wquy7BWCPz6y6VbrNrESt2jp6R4TTGPt6
         GKNhbEJR2Js7q4oDE02vFaVtCEM4CRSTXmeoc3Hy1l7b3pwXEgtogazICUxxxmHsIb/V
         Adqxz77ChXrsNZQ0Yh7kqFI7dqKgZSb5C7oczrJpZrMcnwJHNjllH5AJ71p21kh940E3
         f1pQXQJXDhvZZU9/Bo2APo1Yl0TFcArez+faJ2ArKW2cwTAfvYQL/y5XFa/JMVyuOCP1
         JrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820018; x=1795424818;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
        b=HUHWZE/FCEp5RPl3udYShZoH8MoNe9U9FBuRkrMksb/4HTgiODf2jUhCu+1kV2Ba7Y
         6ByCxyt2ig7uBsLCHlPFhei8Bmbx3XJU/1QItPXqjkaIP0E8TfhZ8coSvav3rqikRB0Y
         eRdn7B4ozddBUcrcWAloGL3tOKrUYJnNFDnq5xYx7aq10admW0YFhbhqEPxeJLQQoYsZ
         03hltgdLMZuCxcJ7nfSsyosnYyVdnKqf5GKRfW0BoY4YHcjtm07FyJWNCPx2JDC1rxgS
         DNB7g/KiUH4fD4r/4Y3Q9rAI9lYTjYJVrNqm0PLEMNgjTNM4Z3x76EiwvAVzYrNJUb/V
         H2Mg==
X-Forwarded-Encrypted: i=1; AL+hErGx/8YXkjhq7E6u6HKpt48uP49qGOz3amr0YHq9fXO0AwHIrt/1/feB3bD8hfugWYmMYdS36frIRQypENrBuMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FgfGy2xpSn5pV96yoRvGzCc2AyPd6XPEMjhPCNuyzU/uhXDNJ
	8tkxRvrwqknJQ1ikRO1JMrFBn5Zfvs61WhDvASpeUmW+cxgFMaDPsGdo
X-Gm-Gg: AYBFou2vYajiLK2R1loxGvLqqk6yJAjoqWlg4by2rR6jJ717F66lkB7vSHLnO7TthcH
	rmrXgZn41AvAUx9Q7Hi5nsgEi2Acpxby+J5EujrgUABr+lN7BO2NzfVjw7+jx60u+mykmmKhHjR
	x3VzKAtrJWbeWBdktrYBauIySf5CPlFmuZd4/8rSm16ZuFo3zWdSoGVHK3kZVXGE6MDMwimD87M
	q1yupJ7cDXjf8Rhk9s6U58BZij9rGHUpWOsbju+zwQitAQnutLc/mA7NvnEP2AG2aUcVp2zCw/8
	Z0Va70mm7/grmFLqEsxl0LCITiDYoRrvQcWx2d48cmkro3dUPjGCpmfMRwrC/PA3eV+Ct86SlIO
	v4yIkqeGK5DRRyFHe2evcS9oItHQM3VBwaBtNer9gsP29S8SPk41qLD8Ie3a6+tMdwvhV07agEe
	iDrjTknMenqm0ju3WlRvLNSKUTEfwZRX2mavPrnACK64nc/wxTIjFjtqq5cr7KNfBUsX5jx/WlS
	6JSBTXruE6+0Oba9kzy69BbiXNny0Wgi7Yq8BUz1K13diiZ2c/DdDMSfGAuL3dkjcyk0slnqovK
	C5Wuze9SKkOVLVCiVjbFq6UuKpxmYtQ96DMTg/gdeXT78dfus0FGXR3r1cvmR5aHL6Rn8z9A57Y
	J2eaSbXfuhVYBPCAv/6fRG2NxRd+y0zMCBfeXrIPHBDxRx0ozD2bSoXnWqYVNwLyO2loHPcPBFF
	KKCjA0S84VnXq+LABrHx+uRXVp5N7Hc4Qp7In5MuGmuo9q18Jgdgec
X-Received: by 2002:a05:600c:224b:b0:4bb:5ad9:50dc with SMTP id 5b1f17b1804b1-4bb5ad95277mr147508915e9.0.1794820018021;
        Mon, 16 Nov 2026 01:06:58 -0800 (PST)
Received: from ?IPV6:2a02:3100:5ad0:78fc:2c93:94c5:21ea:75ad? (dynamic-2a02-3100-5ad0-78fc-2c93-94c5-21ea-75ad.310.pool.telefonica.de. [2a02:3100:5ad0:78fc:2c93:94c5:21ea:75ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6dc30b3asm81554075e9.13.2026.11.16.01.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:06:57 -0800 (PST)
Message-ID: <79f022a7-6f49-4794-9dbe-4774cc50e1f7@gmail.com>
Date: Mon, 16 Nov 2026 10:06:55 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v9 3/4] net: hsr: segment GSO before per-frame
 forwarding
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com, lukma@denx.de,
 fmancera@suse.de, danishanwar@ti.com, richardcochran@gmail.com
References: <20261112153333.20-1-xiexinet@gmail.com>
 <20261112153333.20-4-xiexinet@gmail.com>
 <20261115214108.UmIyEJ8I@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261115214108.UmIyEJ8I@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2026 22:41, Sebastian Andrzej Siewior wrote:
> Should you repost:
> 
> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 9aefc5f0249f6..5e49f2bb9e39b 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -940,11 +940,9 @@ void hsr_forward_input(struct sk_buff *skb, struct hsr_port *port)
>  		goto drop;
>  
>  	consume_skb(skb);
> -	while (segs) {
> -		next = segs->next;
> -		segs->next = NULL;
> +	skb_list_walk_safe(segs, segs, next) {
> +		skb_mark_not_on_list(segs);
>  		hsr_forward_frame(segs, port);
> -		segs = next;
>  	}
>  	return;
>  
> 
> Sebastian
Thanks for the review. I will switch the loop to skb_list_walk_safe()
and skb_mark_not_on_list() if the series needs a repost.

-- 
Xin
