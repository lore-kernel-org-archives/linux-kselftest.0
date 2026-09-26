Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2655377A93
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406170; cv=pass; b=hG69SQgTpFxv4IpeMPrDLUyW/PnDgW1C3w+p5/T0DiaRNYtCiMy9iAcU9+xE3EnOYYKO1hWChOvSQ6Z6igh04yzDJQYhmdMpe2UeWCp/jLLwNeyv8PhskHtgMzLj8fT/UdOeChIBugpN1JWuNCvPJcdMMKeJUAec6s4z/AXh6YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406170; c=relaxed/simple;
	bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoiWr1TkpB5sRV1jHvSHCeGq1oVCgzA8rWIzQDnV6GlXYBYJqe6ISITzEvBHy+jvqcCN0IAKzMyu5oJnbHERuKCNRywQ5HORMxuQvYsRiPoPTE8r6bQvmGGHICpwC9ql6j2Lps96GcegAwgtyeQTMWQsdLbHe2qXdho99HLksAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwcY+1J/; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwcY+1J/"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6595b02ebso5016051fa.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 00:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790406167; cv=none;
        d=google.com; s=arc-20260327;
        b=JMT0xYVYHtlpZwCQNU0N8W1x7hpAHcb2VvdpNMcqcXodQ19YE7d94QSI5BCI98+Jog
         sXjsscbWcIc7tUJghyf9rDYkmmyPEf4tyjpPjtXdiadccbaKDzT8AJWHJpVgw1+yjGRD
         zDdXWhl/Bb8ghsch3aafiuBrpMddJgmiWANKJnO7ukrk1uBdMRa0hX1HaokPNPbysVW/
         DvitmCFd/nEpW5MaHAIzvjpTiKAQK76qt5fLJlvfKM5T0lDoFyxK4z9LMUG+rw5h+L7N
         eXt07YVhvFJljm6fcfCte8uUOU+ala2NPj/Ex7SSoI7GA7tLOAg5+02J1lsESmcyJBcB
         +Sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
        fh=QUb0yh8qwbLLg0ObgHHBBWADRPiuwRfRBOAMXPDOkoI=;
        b=WVQGhXLP9oLxOT5wsAK3P8czExHQK5A/cd3OJST55jVdTa0u6vtdeNs93fSfAZHifs
         dhu5Npd4m1WW6khwaHMvquGLTrJq2a/bSKEqcULZzD2J3RHDYFrDI94HHA/Slab/aDfm
         LpDRGTeUhWELCix3YJNyEDNwdLFgkgQEJcTkxJ0oQNjQPYFsWwGhknTV7ozSdd/v8hCa
         /HnFc1boUgCnAeWgwlVrh8N1D5s06cq8Y8KD79hWS8f0/V6MIa97oj0MDvdB4IStb0bC
         3krKJDtajoFu16uhhQEYiUTgYRpsVgDbBcoRhN7rQ/BTkUC6mzWAcsluWtYQ7POwLBJE
         +1Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406167; x=1791010967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
        b=bwcY+1J/5QUzoD9giyqfZGNKr5xwUSjxXwqxhkM0pDX8PSJ7nMNrdTGHY8LVCStX9G
         O2v5yFlbcqjNc02z6khHCHoDFJzMdD1R38kTTa+HHAaxHDs8gBgSb2buYys6moAktk/p
         gOV+m7tZPZgmdPVbtqYR9+15THj+8+6xf+ejmS3e7KUzHvJIT4cUChjAvh6e12GzdBqb
         Rjpww+SjjXAWB8lCvXmXj5v94i/yjO59Q/Fk0wCDpTp4DRe0xdW84ONmQjWnCwHkVqQM
         BRA8V9NgOrraP8o+7iAKaR0XFFU1D2nR4IXVfm6qVRhrKRtEYbhGuPI8ZnToXk36JikR
         Dv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406167; x=1791010967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
        b=eVZcUqNpBLRe/YZxM89CYyK++4K3XehCUL8nzFnEu4r0dz6q8x8croTSR0yLrUrrfM
         UzUktE0i/YIE8V3VoPoYXhW3R4B/V4NlrQ0XKrc3/xceA4KUhcivhDwHozahUJ+8rahb
         KJSx3auUFYEnK7loJu0Mx4GBBy2HgSHn7rfG1z0zUrggqb0oI2M/llZ03Ezsr8ini5MK
         T+e6pWmE4UcqmLWnkyJeglNjVXcohuYz/e5UMj76euL5BKyZPsQ1jKwJkc9w9Y66IbPm
         evejprf7W8QCe8x3iLHD+MqUw7faSk3q6yIVB+HzYn0Dyktv6ICGlw3/D33KkpgciY1/
         tGvA==
X-Forwarded-Encrypted: i=1; AKwUvBz6NDdZGp1kSmu/NT7NuP6Twl10bmS/wTKZTKzxrJPCZx0Hyz5joSXnVoBdhJ3i8ASpBgtpvXJVbDlqBr5Nl0w=@vger.kernel.org
X-Gm-Message-State: AFuF++kWj/mIwVA6ozYGGuzs66IpK5FPBRL3xJjAEXKX1DW8frsziZpy
	DyYTPi6AkMsQNwXJ28+WVNLk08oZB1MFUvAWU4D3LyE6DNR0KrYNLwG2XeAh8yOcbSh0nBH2mLd
	4Pp1kDhumt2G1X5F3430Wzx3qkpwOUfc=
X-Gm-Gg: AYBFou3v9tgeW933izv5YBiYnAM+ZAH1ExSOq3vZLeVawazM9kC0Q+NhfwGFOy+Pqzc
	q5KuBQijxUulZkf9CuzsZaysNXFx+I7Ysde96EzQM24H/Hsh8ns+hEapHZHikHGFF7Vs6Ug6Fl3
	tz4GnzeHriBVoRPurB4Uuo+sk0z/jxBBW1Pc078mf8P7FY07yDJrVLg3mP470LtG9/iOzQy9979
	QkVptQV9jft1ZtgUEXNrFHyGzNZa6dqLyci13iovG/C0G3VmrE8OoNCGoY+S4FsTQ6xvUfFvUhK
	4TuQ7v1k1HTzcQX8VOI/Po59T4LygZlR1wk5ByEp+eG4vqQOw9BvcxiRNRwjfbSO7sOHxSJVcNU
	BWAyYPODm8wY=
X-Received: by 2002:a2e:a9a9:0:b0:39c:8124:93b3 with SMTP id
 38308e7fff4ca-3a64c7419a0mr11104021fa.9.1790406166593; Sat, 26 Sep 2026
 00:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924011554.3494-1-sigefriedhyy@gmail.com> <20260924011554.3494-3-sigefriedhyy@gmail.com>
 <6541b309-4e1f-462b-a867-57b67bba1b94@6wind.com>
In-Reply-To: <6541b309-4e1f-462b-a867-57b67bba1b94@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 26 Sep 2026 16:02:36 +0900
X-Gm-Features: AclHuK8GvYlXAIGomaFcHDshMtPeFRf47FxfSP2FpiyAnegN159jNnhl7hdQoVQ
Message-ID: <CA+7S2vL-6m4RACthX==UVhVw7N4xRc73EbwMJHLXTY+=Px=z_A@mail.gmail.com>
Subject: Re: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> There are several lists owned by a device (dev->dev_addrs, dev->uc, dev->mc,
> dev->rx_mode_addr_cache), the name 'owner' does not reflect that it is set only
> when the list is dev->mc.
> I wonder if the name should be changed or if __hw_addr_init() should be updated
> to always set owner when the list is owned by a device.
> list->count and dev_mc_genid evolves together. Perhaps some helpers would be
> less error-prone for future patches?
>
> __hw_addr_count_inc()
> __hw_addr_count_dec()
> __hw_addr_count_reset()

Thanks for the suggestion, will update based on the suggestion in patchset v8.

Thanks,

Yuyang
