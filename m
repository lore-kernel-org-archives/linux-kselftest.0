Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119044;
	b=AWoeKTpTAYofgsIW7pEB4cOV/uOS+Kyya++B+NZ4OTyMveLLNcyXr+xyLlomThGr4vWv
	 Bozhfhb/M2oaiPhlio2N6M6WYycfQTZ1jPk4WfN/28J1lZaFqSekMg9tmha6k2gvqXSiw
	 jMUCq0TtE+QGCEwty9DkjNCa7EjYkAlOMMULJ9YQ4QqEV/TQpJhxQhNdusN5/hwo63RXB
	 4phpS5zrajipMMW0dcVD+q3DDHtaLq78kjmR7Q1yfx4v+crOxtZVD980UwaIyQ/43MYU3
	 1UGCdYqU2dPsLj3dnClPQcPczJKsr5YThPNmIz1MrL7d7psBnow86wr+kHieW/dS1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
	b=TxjuDQL5lOBnWVJLPP7LNL97RMqqjNMBygi6kDptOH1fOH26M6j6ahFkpPfrsFzq9q60
	 FPiGZlYslB6tLxSrQJBf90RTEF7rvFr0INInKJPUQ/FaHha0uhtnc8QL4QaIAs3gyy+T7
	 yp08Hi86zXu0B3xeXHQ+Yj36VkTh9FMALe9l5KPihJOqoOQzl7JmnWpC/jWYybnFrHFpa
	 ln/fLDv/TbFKa1dRdiu1Wm5wo16eSRp0MWSKDeo9t2liVk9vTY06/wXTZxiwy1hBUISpy
	 41vo01FtspHS06nROFZDY+a0FdnJ2Edt75PGLhWxBj0LMSwdrcvHTNJ2H1Bl1Zo2f4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbOGqzl4;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB3C606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 20:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB3C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbOGqzl4
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b10d24345dso1536237b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119043; x=1795723843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
        b=jbOGqzl4pjTZnlX9CRqhGTwl7IvLx/HCGiF2R1smwd3C1xS/q5+8W6IuVixt3ofp/H
         UcDRPhnfi9vbdbCkAwL2L6B2GgmVewmfYsZXHz4rNAtL3nftLQnKP3S9AEk0k7oLIwED
         WkJLrVbc9mqKig8z//TLZvj4mk9v4eST7U+mBQKCykkKMy2zUfGyWk8m5DQlvPm8o6v2
         YaWg39KQF8X77inqQxHzMloUyf52HDB2HfTAnPXdu+rrErMGNxVat7iZ/qXNL5hj7sax
         DOLdkN/yHC/Ygm2ZtiQstlDpDGfBI2Wou+P5h5w/7Tv+ma5YWs70v4mbBxdENHUpD3xg
         MJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119043; x=1795723843;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
        b=ZxjrBMdNAjI0vngrTg+hl4kBpB4ohUFdRnz1yiCJV4Pb2fHsm6Hn8EksReASSNecr5
         m681URHmMDbJ1vE5h10C3urwRsUuwyNu5nMia0AizT04Qjf9ZATDj5Wlr3uPtOLCHjDr
         TRbeLVmMb111cbm6biNAIrFkUnw8vs74EdLclSZcCeFij41Z31xH/lQUfiWBY8B7MDNr
         ySK45xJ39z5AVPHvTEaqnqd44DEjmvW6MDQTESomqTRb6h+FvENZHX1jTf/wiFACizD+
         01rTgwbJEU4kJtbkGOZ91gG9Ug4lwXP8WoDvBS/9KNUD8XazU/BZLXNH9tpIUEy58h1z
         clbQ==
X-Forwarded-Encrypted: i=1; AL+hErHpOqqlhTG0KDjoN0b7K3nzJBKW0QZccch+ilw85ucY78IAwASDlECuGQ8U571H4o1yQqVG5KiXsxaXmpwx5w4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ukFCrpE1JS68ChMkYI2yGygfLzNTiMLSiIln4jUSA7zzEAxOk
	CAuttOHE6m+JubbnPP7bifq14uEcEA9k3dRojK+NlXuZR5iQ4I9GWS41
X-Gm-Gg: AZFdTZfZRNQw2ZMMCve8Egz2gcLJU9amIxa+yMb9zlIMzfaEYLZ1x8xBtlYmoaFLRGE
	0GKX5dJ+FPu5uuPw3dnrv/NnlXzZgTVHDmqXqL+jDUsY6pstl0XEsfrnhA7DUYGng9EtHoFOSHe
	WYAsbAFuGiujYcH4l1twWD3WHo84yMcZ7BJiYXutZgRArF4xS4NmCzn9FZBEQdzH6s4H/eQQHC6
	h7sO9D9t3UfOH5Ov5PnJplwAGLAyHDV9q48T/VfcNQbDUkiTYzDcWPhUThvOiRqKs3R1qQ5NhZK
	hm2okQhSeTdm9VXUz8c6vImsQa4EenSUZjhVVjwAGn4CrsGKHF+ObMou8gmMxE7fLouoRk9M0Hn
	iMk+uPPwsq9FbtSGVlikccwyxDAM/NQ4+i34NxZ3vs3j7MiSy6S1QLtoxVeT7fB5iOzU729Tdxt
	CV5X/t2ENVuNup38RJsoxMsL0QTEzbK7TydgrZykRumYOWzzDD1JfnvyD++2CXQnMX/9NDbUNEp
	jtZ1+5LIZEz42OgglM9me9yPWpU4Fzo/JQyS2aFLTy6nAqE/emylSRrpaWePqOMwzg10D9aBAmw
	5onSryf2ocOTaHsLogt48wnZfUB+mW/SNLRWEpCEsnqc/082EScIc0UgLJ45C8BVyUrwLImpZHp
	nOzw1KFmncyHPTQ2WSG2rM7WOnzzx9MDqvMk+dIpHc7iEm7HUZI+CR2Qwsru4iHx3YZ8njxSZdi
	UY0plktkz5xg==
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr5285257b3.14.1795119042818;
        Thu, 19 Nov 2026 12:10:42 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201ba5c1sm4973157b3.3.2026.11.19.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:10:41 -0800 (PST)
Date: Thu, 19 Nov 2026 15:10:41 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2124e819195d3@gmail.com>
In-Reply-To: <20261119144241.360238-2-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-2-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping
 header padding
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> __tun_vnet_hdr_get() checks hdr_len against iov_iter_count(from) before
> advancing past the configured virtio header padding. With a 512-byte
> header and a 14-byte Ethernet frame, hdr_len=256 passes because the
> iterator still includes header padding. After the advance, only
> 14 bytes remain. tun_get_user() and tap_get_user() can then reserve a
> linear skb area larger than the frame and transmit uncopied bytes.
> 
> Advance past the padding before comparing hdr_len with the remaining
> payload. Both callers return immediately on error and discard their
> iterator, so the cursor position on -EINVAL is not observable by them.
> 
> The problem was identified during review of the tap zero-copy fix and
> reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
> produced a 256-byte frame on both tun and tap. After the change, both
> drivers reject that input with -EINVAL. The new tun and tap selftests
> pass on the patched kernel.
> 

If respinning, please state explicitly that this restores existing
pre 6.15 behavior.

> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 2506251e81d1 ("tun: Decouple vnet handling")
> Fixes: 6a53fc5a8770 ("tap: Use tun's vnet-related code")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com> 

> ---
>  drivers/net/tun_vnet.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> index f4c652b1fa44..0b9622891681 100644
> --- a/drivers/net/tun_vnet.h
> +++ b/drivers/net/tun_vnet.h
> @@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
>  		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
>  	}
>  
> +	iov_iter_advance(from, sz - parsed_size);
>  	if (hdr_len > iov_iter_count(from))
>  		return -EINVAL;
>  
> -	iov_iter_advance(from, sz - parsed_size);
> -
>  	return hdr_len;
>  }
>  
> -- 
> 2.43.0
> 


