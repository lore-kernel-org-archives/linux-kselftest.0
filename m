Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D703C345D
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917410; cv=none; b=c8N7v1LBJfY0mrU+husybuTS7/V1+Q7y6NJUKb2L3ziREiPbQTXivJyKYT4dhp0Et8ROsOqRcv/XHYayRLY2KMFoMfe3/7B87JEQ7gYYoW3cQpDPcAAeZYJKaxKuihRt1IdA3ANGicdRkl1pQBNLO/BS1/V9MEZvyiFFFMUEPsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917410; c=relaxed/simple;
	bh=0PnjIJb7BB31tuXTXb9O9K08P7IZqTFP8xOl5ts49z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4BCXHNTi/PM8g7Y+xtqWTDIqJVb6VyzYwLK4dmQSyNZCp8sBdZtG6sz2w7VogYil9G5uUXo88QQQ1ePNlb51dgkxUxKs3AoFKIDdc1kXWJu51BPOF7IxP1RdBR6hema57IBuUt8R5I7UXIPJlpa8A0aK+XVMcP+wnVkG5oRbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+Kx2lPx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VvQ8IT3A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+Kx2lPx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VvQ8IT3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773917406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/QrmoRE0Ec4371GT4zD9Iw4up8oNW0PlcBOJIQ423E=;
	b=G+Kx2lPxc9Wbbn1+W9zbtvE/F26K9bWO4osEXZCIVPgZYZez2P5n8+vVOAER70/meXY2/s
	raw97bhPHo0nMMnBaY3ergBU77IVcyq6AVGTuxw9Hwwi+LTh6Hhx/S2VPF5r8h7kYm463b
	LCNbtEOngQg34KvjWEktqFdFqtL6dh0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-kJOFshhOMI2L5t6f5cnDzw-1; Thu, 19 Mar 2026 06:50:05 -0400
X-MC-Unique: kJOFshhOMI2L5t6f5cnDzw-1
X-Mimecast-MFC-AGG-ID: kJOFshhOMI2L5t6f5cnDzw_1773917404
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4836abfc742so9423085e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 03:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773917404; x=1774522204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/QrmoRE0Ec4371GT4zD9Iw4up8oNW0PlcBOJIQ423E=;
        b=VvQ8IT3Aq1s1RyVJaXQI4RrEZ7dyWGk020Baz9N+pqwNDlwipjtbf/Skmc0RUvGxmx
         2cVR3/c654Oky2bZ8emjucih6vYPK2Ts61EnpQ8PN2U+88Cu00y143KKPROs0NT+v63A
         V0S7mHyaknQJl2FBHXMmfz2WaZGmKu0QWxKuzSiOVAn/13ZhGIkR8GRc0wrwPQRaer6J
         XmmwVcKjTiJZ+WtZjbWmc6dZkGqPErjV+v7Q65a+1fhjpO8goTmNWgwHNSuNaRHyh5pL
         Dm6V728+aduL770sSAfWXqJQL4JqK/FglPJcpeZJtxKHDBfD8wG+6+mY3CzAgJER/6x9
         Jy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917404; x=1774522204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/QrmoRE0Ec4371GT4zD9Iw4up8oNW0PlcBOJIQ423E=;
        b=GQLGeX3sxIK9QdziqTzYTM7LONsK1N8nUC2KgO+JTejLTvmPg7dMV1Tc9wJobOZHEI
         OdwclcIf7oAVvk7ui1OtXuQARNlQRL864QUesbJq+PrrkDQ6okpPVIfF5YOBboxdHy+i
         SVATRIGWJU+fHNGKGtLBOTrDvH565vwHVloSm1vQGVqDpvE79t5L6v2Zlso32MkGxbIV
         KnQiS53NeWa5YP7isX3f4RgUBZnvv0hZsqmRMo8giQZkWHfhHaN3IqW+OdSl0bvXFAqB
         +idBCZlX/H2Wy+K1HNqIjdBOFE+5Dpt1DgPKkBjfsULplTT+M7h+2xzHEIB1wDBwX79f
         pZow==
X-Forwarded-Encrypted: i=1; AJvYcCWUVidV5oBXe1GVwYog28uQrNeNfx5X4kgtrTL7L34Lv856EkXiHV7/LeyxHgRhVdcB/0HIIi1Hko1nOceihFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKTkFR8tZfAgK3+iS/IyRuQOs9Y6RE3KWwjW1Emjzn32TdMIm1
	ku3mLzRaOBKd725ODTOLGU/bXmEEnxXLHRFKkRPQ6VAWICqVjM0SljQe/auTFaYwu+d1B4CvRyY
	gsFHDC386hTq0lhfJZpz8AP+KMyfkWxSGYkJv/0AfxIF0zmBjgjXedbYWti5FLsY54nAfJw==
X-Gm-Gg: ATEYQzzDuo0UgG+xRhUseOkmetZB4If6gShMqRbfnOX3sqaX37cyxfJNWszDCLsM8N6
	ztslxlRV6ES9LjegUgZp2jfgyBcE1GVnCXdyRuIQU1FrCjDmRkNIYbsRziFscfy5O4tqW8nZZzl
	uBdQEizty5jAVA2ypQZjNeBItCPwEo0nsaq56E7tcRC5/nehfXISwb+bwgwUDQ2/2HBZKZw+zAV
	WgO9elzb0fpjDaoPbTUsF81bQ9XN3NFpli0bfIW0g3uRMD11jstsQWYzZxnU3STkD/IOUhAYOq3
	YqtLPlyaWYPovgaq2gQqsupWIqR85xajvjCfr8NW0wWQup/RU7jf7BBooj0WLVMG8XRg5/3W5GO
	nR6g35yRAMPU2hu46TpDgR4PHFYMEUiA0bUNKvpsiJam33YgfSxJ1mzSz
X-Received: by 2002:a05:600c:1d10:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-486f4422046mr113298435e9.5.1773917404167;
        Thu, 19 Mar 2026 03:50:04 -0700 (PDT)
X-Received: by 2002:a05:600c:1d10:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-486f4422046mr113297875e9.5.1773917403694;
        Thu, 19 Mar 2026 03:50:03 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a2cd3sm13432241f8f.32.2026.03.19.03.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:50:03 -0700 (PDT)
Message-ID: <f5c9a512-4779-4cc4-aed9-37ce0131b3b8@redhat.com>
Date: Thu, 19 Mar 2026 11:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] tcp: keep scaled no-shrink window
 representable
To: Wesley Atwell <atwellwea@gmail.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, ncardwell@google.com,
 shuah@kernel.org
References: <20260317065137.1533226-1-atwellwea@gmail.com>
 <20260317065137.1533226-3-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260317065137.1533226-3-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/17/26 7:51 AM, Wesley Atwell wrote:
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 35c3b0ab5a0cb714155d5720fe56888f71aecced..bd3a43148a87e891bc632a47ffb5b82c475e8f6f 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -3375,13 +3375,19 @@ u32 __tcp_select_window(struct sock *sk)
>  	 * scaled window will not line up with the MSS boundary anyway.
>  	 */
>  	if (tp->rx_opt.rcv_wscale) {
> -		window = free_space;
> +		u32 gran = 1U << tp->rx_opt.rcv_wscale;
>  
> -		/* Advertise enough space so that it won't get scaled away.
> -		 * Import case: prevent zero window announcement if
> -		 * 1<<rcv_wscale > mss.
> +		/* Keep tp->rcv_wnd representable in scaled units so later
> +		 * no-shrink decisions reason about the same right edge we
> +		 * can advertise on the wire. Preserve only a small non-zero
> +		 * offer that would otherwise get scaled away to zero.
>  		 */
> -		window = ALIGN(window, (1 << tp->rx_opt.rcv_wscale));
> +		if (free_space >= gran)
> +			window = round_down(free_space, gran);

The receive window already has a similar rounding in the `free_space <
(full_space >> 1)` case. This is basically excluding only:

	gran > free_space >= (full_space >> 1)

which IDK if is a realistic situation, perhaps just do the scale down
unconditionally?

Also minor nit, prefer 'granularity' over 'gran'

/P

