Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670801;
	b=b9+s/mT2Mw79ckPYVcONt2vhSUKyHrKfmg2/Xjj32xt0/Qrr0tIfB5n5Yh6fFty3gCRJ
	 xT3N+lIP5ISXa23PLGlpCJjZZtg6Yu9qEmJBFW9I092FK05S9j/qighQetVY8LLtgMtan
	 V6AikdaN1Dj0L4hoRPMRuZ4XlHcWauv0nPpnZRg53piHaC7XQ7cGxwm0caYVMTTw02vnJ
	 2UuMyFazFjKT/MMxNUYaqwHYGpJiTLrfWXclUpvr/NAqcGvpu9FZBb5dUC8KKqb5yYjqp
	 QftG43ymP8mja52dksLxtvATyKvL+iVI6c13+NKtKavBhE4nW55dHS50tcAaIOJp6WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=gQPf1gojSipDfNLOKsfEvoilcb1WU2m4yt6GDonHOXw=;
	b=eAbvoNQyJhkIDd+DmN1lmgndGlU2/LFHn8gYYdpC9VX5tGS9l7JubZaWZiCanho+9HvA
	 mKBqoFTBxP41PhMY+uGW9AioXrYsYVT55a2Lbw+59OHYi0cPM6NMNg8UfGnmHhXITJHoE
	 SZR3Lm8E8/mTFnUaRH/2t/xAHJBl+VncdDWajJxp0T5Dz65SfsNqXFmghEOPV8m6zT4xs
	 YvCP/ElsDL1anvpTTzfxuJ0ZzdMN6ur7QNtFxrK0KQY0KDVbyxSMwzQuhEZOYKRLHg0Pj
	 4kt56FxWuJkFOjcU+CXpWP54Jxx9zH7sRMClbHfF6kQsofrtCN5CZkjRMe2gYEYGjTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZCQJ8kLB;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1D606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 12:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE1D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZCQJ8kLB
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533797e72e8so13609951cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670799; x=1793275599; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gQPf1gojSipDfNLOKsfEvoilcb1WU2m4yt6GDonHOXw=;
        b=ZCQJ8kLBJ/MoSPXRe8glkbJdNFWhnxWRRkDnFOjub/FZcJMQmkE1MFqc1aZEPDE9hJ
         oVBCyqu74h/KrpBIeywlmu/wEiQhWF4qvn9c9Djt3knhAb0a5BC5jDJJWPZsT0m3CMNX
         W+fUs17d6PXFlZ8g83RRkClLll40EeJvANyUBZrOnHBGzSQt2AxLqprx864kwUB0b/6c
         wNUp3W4oGTuXf+bRYw9kyYaa5Ai6GL1o934vdKOutIOOkIkhnEAiyeg6m5iKNq7qRA9m
         b/ZRJ9/mFtAd3fQu8PLXqvPeReGjgbUb5RW0t3AwDmqeTbMwl78bbHeRH0akkZjZFT+g
         Wc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670799; x=1793275599;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQPf1gojSipDfNLOKsfEvoilcb1WU2m4yt6GDonHOXw=;
        b=dHI4HwnvJg+iHB89+52+dRL9LFcKLIdXDGSNqubBUQE3suD5LllBmtifq5mO7NAKnH
         D2UqDQESXkuII6ENpgX3nW+D8aiS55Agponvm4OJp4qZO1P3RyTptDlYLQrF0Bgpd+Xc
         3zqeVfpSz/lgDSDjJnwWy9PNKqMZ7f55HxvsCMaM/89VkzMW/iACBgVFLMSUMrqTLrIr
         FNguPiqcz3FQlnVAAvnX8ifPmmidp4BVzMkXGIyXTn0opaVxg20IhFXKUGjq6K5zTB4f
         Ro3nTst4NOstzccC16ycBAjXrK5zukFpTYQbh1fqYUH8G1zKYt5XclWEvLL2h4Xt2k2X
         RdzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK3sqGH7YJqFpYR7w+nW5zzImTJ7g5Kn4l0rXLY7qwPaIGrNcSlSLLYYe+n5IOnwXTnQy8xZ5XzdXTWfv5nK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbXs7Lm5SFlPk+fSHmfhjgYYxph1NPPxcjv36Dc1EMjnI2u2MK
	qP2SC1aU02HD3yBVUqQU0Zf92J8jwuwf1KU1sC0kw78+YsX1CBSaYoM9
X-Gm-Gg: AYBFou0/GwDp5whnv4tAjCYOYxvz1JknUvqikRmESPpFtUoLYkI10BgGGdEtct+3bS5
	erQSobQ2t43fCPFyiAXzSEhXZE6ZRhSLKsdE8OJguPo83dSSosckoSN4xJQs9LeV3iaCPGUXIvg
	yB1wv1V1HiShZo5yakDy474XGzIGVrti85ChbJO9z/9C0Op/KZuKZsWjO7F5dCP4+bVHYwzUmH3
	vlpAzaAV4HQfPSOY9eB1N+0qlOTueZBmYsWZI86Mxawkpclufu1PNjUIYVNXPaTlnfGj9XMErSx
	MaiitcIPLRm90zBvoTkxArkPQMxLxSXJN2r7mBTNtWH67P2Wrxl+AiNYSmscjFOlxLyTjuAiY5j
	tJQqC+kkl1enxPGSLhXU2+OmjQiBWdSmbr50S9h1KMT8Ly1ucrqUK4+pdnUtmHiFgwif5NXitv7
	n85+2JtawjQl08JsLmuHMKHvi6gOtJrx8wKlH5TKvYMpad+MGY6oEFhGd49MbwWTSbyKYR7HnTE
	3K3kQu5ciHQouBLmrkf0VpfGtfHKrlFLiBQcHqIhbJzo5na2iQZJz4NeyUT/w==
X-Received: by 2002:a05:622a:15c4:b0:532:d773:99a3 with SMTP id d75a77b69052e-5369b4f30abmr78052581cf.6.1792670799372;
        Thu, 22 Oct 2026 05:06:39 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab76a3a2sm24907881cf.22.2026.10.22.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:06:38 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 08:06:37 -0400
Message-Id: <DMBCRFEQZ7D8.1SQ5SSTSTGZFR@gmail.com>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Bert Freed" <toddfreed@meta.com>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
Cc: <netdev@vger.kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Willem de
 Bruijn" <willemdebruijn.kernel@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "Shuah Khan" <shuah@kernel.org>, "Rahul
 Rameshbabu" <rrameshbabu@nvidia.com>, "Raed Salem" <raeds@nvidia.com>,
 "Cosmin Ratiu" <cratiu@nvidia.com>, <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261021210200.788191-1-toddfreed@meta.com>
 <DMAUWQVPIVKP.1QAK1YSA76EHJ@gmail.com>
 <CADh2yMypAdV07rRufDqj1aOdEzAqEaH2bDkJ2jYV_z1_9iXRkg@mail.gmail.com>
In-Reply-To: <CADh2yMypAdV07rRufDqj1aOdEzAqEaH2bDkJ2jYV_z1_9iXRkg@mail.gmail.com>

On Wed Oct 21, 2026 at 7:16 PM EDT, Todd Bert Freed wrote:
> On Wed, Oct 21, 2026 at 3:07=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.=
com> wrote:
>> >
>> > The first patch drops the packets, the second patch adds selftests for
>> > that case.
>> >
>>
>> Why not just fix psp_dev_encapsulate() to put the psp headers in the
>> right position? With the self test we are going to make PSP + ipv6 ext
>> header =3D=3D drop part of the uapi?
>
> If the original ipv6 packet has extension headers, then the nexthdr on th=
e
> fixed ipv6 header identifies the first extension header, and the L4 proto=
 is
> in the nexthdr on the last one in the chain.
>
> psp_dev_encapsulate() places the udp+psp headers after all the extension
> headers in this case.
>
> The issue is that it rewrites the fixed ipv6 header nexthdr to be UDP,
>
>   ipv6_hdr(skb)->nexthdr =3D IPPROTO_UDP;
>
> It would need to walk the chain, and set the nexthdr on the final extensi=
on
> header to UDP, instead, if the correct policy were for udp+psp to come
> after the extension headers in all cases.
>
> I'm not sure that's the correct policy though ; for some headers (e.g. th=
e
> fragment header) it might make sense to leave them on the inner packet.
> Note that the psp spec does not describe this. Perhaps the user should
> express the desired policy?
>
> Explicitly dropping ipv6 packets with fragments is consistent with the
> current behavior (it already doesn't work).
>
> -Todd

I think walking the extension headers and inserting before the transport
header is better than dropping. I agree with Bjorn that rejecting
fragment header makes sense because the receiver can't decrypt the
fragmented PSP payload.
