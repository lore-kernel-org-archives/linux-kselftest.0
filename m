Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445582;
	b=Ie00aiRP9T2045CACRYfA/bziWzt3z2zcpwc2Bomj8Cx+ybnjaT3rM/VuGCOM47PWHBe
	 rnBnZZZmn6hmquyc/g7ZtbIBRZMTnqMHoHA7RbWFy+pBDwFscNsXjOOSbiONmaUKT1eRj
	 t9NCs/K1eBWXx1jtPPFC4Bjxi0abDeYjU40qzSeoPy/l+nODtGIgmWic8dLis6Bh+SxUY
	 KlNb9ANW7KLG/K01QjUTbowssk4WKnWIMkpSnYhJzjFh1zow4hBIacyxNdGtzf2r+qtV2
	 w+BWqwOr0OXPKFnq6yd/10e2t5tHi+Ec8eNaPkgh/QfSRsxwIHnXo6ODFdkjB95Brqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iCMY9zzRpVOQiNVF7wIbVbtJSXaMkhe3lrzE3/4Rz2U=;
	b=w8all9wutb+DVTkfDZpZD8MDAjlQBf5bHkj8O9Z1o4RrOOMUESo5osjTlkJQZ72s88Jy
	 GEi4O5sn/kxEyZw/YjqJc2+tlgtIcT9c724C+fY7PQDIQXiYRboRFZ8xXjKMXbNYicQ2a
	 fQBMe+wl9y2nnKOh/UukB1rsNV/upJLR0yjGLecl7oxN33VT69VGeLO1YoKaaSwAnqdLr
	 dRRDaA/of8OxzkbA8XatVtiI5j0oXHeAWsG3XEoTETKvbu9dmc1BPTe94qWD0FSy11TkS
	 SXeJz/g6Mw3aJTnrb1jqUheOukg33yZGfJxdFQOxzYTpaM1Uy155lD2jBjbyfkMaeHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cuklAEao;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CDD606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 01:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cuklAEao
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so2170901a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 17:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794445580; x=1795050380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iCMY9zzRpVOQiNVF7wIbVbtJSXaMkhe3lrzE3/4Rz2U=;
        b=cuklAEaoE6zQVXGV9gZrYyyqItQzkHyX4+pq6Om2py/IPAk90rm7VxGu5Niy6A/NAB
         /CTDV9uLtEi5ePJ8SHDdTKeOsAKFYuSFlOTJVID1BXTctrPANHf6Fsh/94ViibuZdt4f
         Q2uS27QxE15OXe1B2/UIVLPiH8FWH9HSBHg0lWTpyfxJc/g7mlpZgE8auqJVQ5K03uTQ
         Oec6ye85GtdZOpnEnqGhX+SpcuIigx9tgpLuBeoJyiHnXVCeX6t6W+0E81/rOOn6mkrN
         kDP4wV9wv+R5g1H09iidPza08AYoori8rgGZMt/P1JOfA4OD2urEbz84Z11ZPm+4xZvB
         hNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445580; x=1795050380;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCMY9zzRpVOQiNVF7wIbVbtJSXaMkhe3lrzE3/4Rz2U=;
        b=itUaoN1JCJ2pFI+4AvjYff1HiZlltuaKoHQ6C96wsYO7nxZune4L65Aj60AQZ/DFPE
         L4pDdKdQNe/HXC8kIBmne9ElX/QhA5u2hpRZVC7gOrXvvDaxkMQwpVe+HpGHrU8k+8bm
         nBgRCsn0Q6E/1DmqLi2mNDhYt9tgebN4oS53brX9z7C0xwagDHJqv4d+MgdN3FIY17uA
         GZaOYMB4q39q8C0DoR2i/bAu6dL3Txpphsda7Nqx35YDEiXgrsDk7JPcsmRcdrIY2oZa
         ZD6qLbeQNJCfxdiASnt7mASjvFTRgGTyD1wNP4oL2ZiPvqLspUy/d3L58LBHLhVxzodj
         n6Uw==
X-Forwarded-Encrypted: i=1; AL+hErE+lo1qJ5/yP59t+ckAFLjrkT346Fz2AInpqEFgEB2AfFYelPwiUYPjuZ/IncfhQswrSYwBNLm//yx8TccCDII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f/f57kbeZLRSIjHJgQbQkPMxmyN9a9xWQ55DRaExSAZjyk0mI
	/NbVQtt+/koaoJy+W7gE8VZ8hiJ2iw+tmD5q+WLbN+K+k9bBI7/DPjy4UXbafFUlx5Q=
X-Gm-Gg: AYBFou3QqRC0JM71aDlTYIZEIsC+UNTw0Ck5yzmuq7cHfjKGXn44JnZClGhpHPKKniG
	CTeGpw4eSjLg78csPNG2Q6v+b6Gx9znmDbpobOgSvBJOKkQ+hPtIGWkbBv7y9+oImrYkCPcsVXm
	UnoX6hthEIIiIOtyIKyGqVKTBvoX7cgVXWgnC2HgCV+FAS7Gxmtdm/C29x7qPUZrbTWfifLrpgu
	t9wNb2KCCtJ+AsC1G3Dnq1FJuY6/2vPuOr/UQQR4g+mG8Jc58K7CwO9qZ5TdkpL746J3UWp83EC
	TuRyQGhuydMTZLF/hv4xx1L8PAeD+qFT3N4Wf71AFgCepJu0KydRQIJWccbIEOhmIIRKop2v+y+
	nTDtRK8He5lp2afR0j2jlHJgEc5cVhTkH8xzsZKRep0fHCNJdWNqg6R7gjwAotis8uCQAyG/zgS
	CgN2nzlHOmLm2ONZvyhiTymYjnn7ZiH0JjJc7e9WcZQ0a5OHhV862i5Nho223tkrMA3saHp5N1b
	XQjeAuLKsntH8VOCoY6Zpmc5XwfW/d30egUcht73kpzX6onG62gvpZCmi49CmhTh9TEecLJObhp
	NasRFE3f0Vub/8/Q1N/ccBwm09dkVSdoAV1L2Cx44Vj1deHVl55ZpeMlhQ3WIU2wruZzyExvuTd
	e3MK0FlU1rprj+qUCobU=
X-Received: by 2002:a17:90b:4c49:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b182eacc7emr3660192a91.28.1794445580376;
        Wed, 11 Nov 2026 17:06:20 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182dff97fsm2402471a91.3.2026.11.11.17.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:06:19 -0800 (PST)
Date: Wed, 11 Nov 2026 17:06:17 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Todd Freed <toddfreed@meta.com>
Cc: <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, Jamal Hadi
 Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, Daniel Zahka
 <daniel.zahka@gmail.com>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH iproute2-next 3/3] tc: flower: add matches psp_spi,
 psp_ver and psp_dev
Message-ID: <20261111170617.5fbde961@phoenix.local>
In-Reply-To: <20261112001512.3598626-4-toddfreed@meta.com>
References: <20261112001512.3598626-1-toddfreed@meta.com>
	<20261112001512.3598626-4-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 16:15:12 -0800
Todd Freed <toddfreed@meta.com> wrote:

> Match on the PSP Rx state of a packet the device decrypted: the SPI it
> was decrypted with (psp_spi, with an optional mask), the PSP version
> (psp_ver), and the ID of the PSP device which decrypted it (psp_dev).
> 
> For example, to take the packets decrypted with one Rx SPI, from
> rx-spi-alloc, and remove their PSP state:
> 
>   tc filter add dev eth0 ingress protocol ipv6 flower
>       psp_spi 0x80000001 psp_ver 0 psp_dev 1
>       action psp decap
> 
> These keys only match decrypted packets, even with a zero mask, so
> "psp_spi 0/0" matches any decrypted PSP packet.
> 
> psp_spi and its mask are hexadecimal, like spi. tc-flower(8) documents
> the keys.
> 
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---

AI review feedback on this


get_u8/get_u32 use base 0 for psp_ver and psp_dev, so "psp_ver 010" is
octal.  The man page documents plain numbers; base 10 would match.
Otherwise this one looks fine.
