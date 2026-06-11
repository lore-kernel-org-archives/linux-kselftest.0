Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C24B34750D
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166647; cv=none; b=aCA7IttQnpAiAmgBYDypETNUtN8qLN1gjYpH+wtPrEpjNAslNXZLgLXDmaw6rJuG974uECszYVPMUzID8hpRr9X48fakLE7qdxwgUA28Z5ORjU6fSJ/QORzd98jdyDbJjKfdosSQJNK5JwsomYyyWbT6JtGhxTgamWVh80/rzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166647; c=relaxed/simple;
	bh=XR0V+4h+8MJh9uy6euPn7a63rvq06PZMS77yDeSWSwQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O5Rrb6wEzpnUkVIvHUNgNeBMiDuTeO5eYlvbnY4pLTndWf5Dy2KSsfTIk1wpw1bfyMJB5TZEnJxR86NO/UtUYij96/H+GVNUhsvgeWttB8b0ArySnwcOwBpq15xHXrl2xoBpZ74gwEJNsJMtC2gnDY6rcSgtc0OezUrLI/+IL6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEIN7waR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W0VVR2hZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEIN7waR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W0VVR2hZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781166644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0b7sev+YXar1BdsAXXs6+O/y7RGvS4oVWMa4UAvNR4=;
	b=jEIN7waR2UDP55G4M1PsvhJ5AghntcpJFBJAMtucsMcT8Fqa7ECpdqrWT26lK6IisETmkQ
	OmMMgsvt4ezS8tlPm8VuP/P3LhC3w3/oDVolb6ArDhHyxaotAUWcHqBK+A4+SwlOmcqAL4
	yrCv04auzcNdTN2badaDe/vsJUvtBsc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-G9JupaRjOQOCbxlk9x93cw-1; Thu, 11 Jun 2026 04:30:42 -0400
X-MC-Unique: G9JupaRjOQOCbxlk9x93cw-1
X-Mimecast-MFC-AGG-ID: G9JupaRjOQOCbxlk9x93cw_1781166642
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4600c8cb13aso4729999f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781166642; x=1781771442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0b7sev+YXar1BdsAXXs6+O/y7RGvS4oVWMa4UAvNR4=;
        b=W0VVR2hZwFKl/M3Sp+D/1o9rThGTAvzejaH1A92ykZOnsNQ732pOqNdo62QflzOUJ0
         SdC4FMerrZSY97TQ+Ce7ZlkOFYA4zToBmohim4aJyMqBHJxylI74CLqiYDfipp8y+ula
         Smbz8jRc5GXghQ4/SCBqgqJC/nd5lW45e2/PTQc2WYwJI/jEXbFzuKA/+Zjh/evxbbdS
         AVeIB7u1MwwVtz+VTeHFbjAfVf/laYPFRAPYqL8VaUN4AK4+enNS6Vne+yAHopfKnEtM
         4T4ICE+8SvhTrnIMegVc+1AWycDVAd2C9qhh/v63mZ9TgYtwAltClP9AAaw18R0j5f1P
         Jtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166642; x=1781771442;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0b7sev+YXar1BdsAXXs6+O/y7RGvS4oVWMa4UAvNR4=;
        b=GO7LgeKfQo1XOMQH0IsQsTRtBgWcIsetQXseZ/jnX4yhalumKVW6QcEzRJPVkSqy8G
         9NaXw/JKyqm8o/M+b9nrQ5DhlykcfdjkBfhRPCCA+nSURWqqLUMbWW8r8Ew54E6YWw6J
         CqvgNQOySwJKNWquEOUseDJlkzhDgiyLLIgF6o9ohm2b2tDtJ48a234wnZ4IzboNZpQ6
         qqaRwIzQ/qWDOV8whnZJ74oawIyvULCsKK7+ij+K2jNBHk2+1g2WT4ItqFJq8JAsBSuo
         EjV+K/58NnmTWbhoyoj4q8M5FiVj+KhmKMjR2BcC/aAZrRKZkstMhjspAQxdUu7zr/S5
         zQ8A==
X-Forwarded-Encrypted: i=1; AFNElJ8zlufD5wZfyGkizKqBcmmdotz+aYupLjJJHGtZCFeIVR92M/1owwujpWmynxi0oat7f3bWGxq9+TCuavVdESI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgdC+DCHKIurgU7kxHmqJhVGzO9ABt3UCeBSLzTjjc2cIT1A+
	+9+4l9vVMLJ92kDpxQWEQllYCC4UsQB6coLxK6jZlT7I8Hd3HvkYxJjgnPVF/IJPtSnJZcjLq2H
	L14vGp3dTpq/ns2lGrPLUuW/rYw+FeOhOU09YbNDtabPQhRgzcE5/1bU5bECJnSWgVXTOXA==
X-Gm-Gg: Acq92OHqt5hZB9dcCv1okqstljhSL5x/i5HZdtI6gNxdlnhBvFmtt17eAElAdBZswII
	+9a+/vdLYTTpIQeGaXdOFtUfkYemmTrxIM+gQOeF4HKZsot2whAAp0e/yRs5cwI51TSbXLrBSX+
	UkMWOFTDch9goqWJw/GeNHOIsYvaRzmBEEPvQL53HP9KZ54DvWtoDgdqn3nKyni0S6lZTouoyuN
	2NZkIn1376ZVJeGpY8uYtyLsQH/7tlbng0TYsk85hhcky9PtzjPAyIlfkZjBHABXS4wH9kh0HDr
	xDzRvqs0YeBNBsyIVS1ysAZUao+DkfnaPGWp9ZCl1dkom7cAqbz7y5fQYagZzc8UCaUoYmsIeGJ
	gn46A8BfS5mEv7vtjg/rSZZGNZ8SgYCAlkLzbv4MMrdYUAMy2Vpe1nbEw
X-Received: by 2002:a05:600c:4444:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-490e534d301mr20585905e9.0.1781166637006;
        Thu, 11 Jun 2026 01:30:37 -0700 (PDT)
X-Received: by 2002:a05:600c:4444:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-490e534d301mr20585325e9.0.1781166636452;
        Thu, 11 Jun 2026 01:30:36 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c9057bsm55175325e9.5.2026.06.11.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:30:35 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 0F0E17BCC96; Thu, 11 Jun 2026 10:30:35 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, bpf@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, davem@davemloft.net,
 kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, shuah@kernel.org, jiayuan.chen@linux.dev,
 menglong.dong@linux.dev, emil@etsalapatis.com, Sun Jian
 <sun.jian.kdev@gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Run generic devmap egress prog on
 private skb
In-Reply-To: <20260611080850.536996-2-sun.jian.kdev@gmail.com>
References: <20260611080850.536996-1-sun.jian.kdev@gmail.com>
 <20260611080850.536996-2-sun.jian.kdev@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 11 Jun 2026 10:30:35 +0200
Message-ID: <87se6t8ono.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sun Jian <sun.jian.kdev@gmail.com> writes:

> Generic XDP devmap multi redirect uses skb_clone() for intermediate
> destinations and sends the last destination with the original skb. This
> can leave multiple destinations sharing the same packet data.
>
> This becomes visible after generic devmap egress-program support was
> added: a devmap egress program may mutate packet data, and another
> destination sharing the same data can observe that mutation.
>
> Native XDP broadcast redirect does not have this issue because
> xdpf_clone() copies the frame data for each destination. Generic XDP
> should provide the same per-destination isolation before running a
> devmap egress program.
>
> Fix this by making cloned skbs private before running the generic devmap
> egress program. Use skb_copy() instead of skb_unshare() so allocation
> failure does not consume the skb and the existing caller error paths keep
> their ownership semantics.
>
> Fixes: 2ea5eabaf04a ("bpf: devmap: Implement devmap prog execution for ge=
neric XDP")
> Suggested-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  kernel/bpf/devmap.c | 41 +++++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> index cc0a43ebab6b..a3d6c60dbddb 100644
> --- a/kernel/bpf/devmap.c
> +++ b/kernel/bpf/devmap.c
> @@ -512,35 +512,52 @@ static inline int __xdp_enqueue(struct net_device *=
dev, struct xdp_frame *xdpf,
>  	return 0;
>  }
>=20=20
> -static u32 dev_map_bpf_prog_run_skb(struct sk_buff *skb, struct bpf_dtab=
_netdev *dst)
> +static int dev_map_bpf_prog_run_skb(struct sk_buff **pskb,
> +				    struct bpf_dtab_netdev *dst,
> +				    u32 *act)
>  {
> +	struct sk_buff *skb =3D *pskb;
>  	struct xdp_txq_info txq =3D { .dev =3D dst->dev };
>  	struct xdp_buff xdp;
> -	u32 act;
>=20=20
> -	if (!dst->xdp_prog)
> -		return XDP_PASS;
> +	if (!dst->xdp_prog) {
> +		*act =3D XDP_PASS;
> +		return 0;
> +	}
> +
> +	if (skb_cloned(skb)) {
> +		struct sk_buff *nskb;
> +
> +		nskb =3D skb_copy(skb, GFP_ATOMIC);
> +		if (!nskb)
> +			return -ENOMEM;
> +
> +		nskb->mac_len =3D skb->mac_len;
> +		consume_skb(skb);
> +		skb =3D nskb;
> +		*pskb =3D nskb;
> +	}

So with all this pointer soup and back and forth, the version you had in
v2 (with the check and skb_copy() in dev_map_generic_redirect()) was
much cleaner :/

-Toke

