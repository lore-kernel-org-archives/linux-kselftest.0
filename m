Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7733649B1FC
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 19:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278877; cv=pass; b=N83u8lFJNJN5ovWMaZkhi1IrTmKVLCizf6ZpZ2FAWDt28hsLw9tFQvUthzYG/TOfRtRTSW+8kjUwqmSUpdd15WmoSH01RCktewYuJ5QXW9mI1eUJqU7rKeMcP2wZXmvIiU/CLnfGGeqc60r7Y2p8Mso5UvHkPjzj1yvUOiFchBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278877; c=relaxed/simple;
	bh=bgEUev2/WA/xtTv6tfLEW2vV4/QUHdZ+xHOitzvHWxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lx6Ek/Ke1lvMW8NWOwYWr6Pu2QgfKm3Xpnspvb0SD09pDwaZ3gSxbD24h50wpnvXPfR0lYVQBCAMaQ59fEFVoHnTobHTI7Th++7zdRUZWbblDqB3anK9boKo5CuHJb4nJOFvuR3DnzScvIMaVZ7txolSmWGa+hLZHpaKkHZNcus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WmMn9C+o; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WmMn9C+o"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so98657f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 12:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278869; cv=none;
        d=google.com; s=arc-20260327;
        b=oDXMRAJbTRTf/+MRko1bKZB+kwJISDnGU+W4VVOzAgDTUBjTrSkP7Oz5eCo15TO6Eq
         VCEDmLY5/LuXCTXteu2hCyR5OK42ElQkRT/g3VRTF3nPhAzl7Lp1Hc7QUrHTY9THHznG
         33qA6kQ2YkWL/zIxzIVW3Ou/iCojEXvVUxxEjjnqcU0U7QL0Ql1IX+fZ6J0tO3ecV8j7
         YtMpDpiSJNrXDHQseGtQBAENlpXnXhP5VbCebrFNSwFArB4N4YtlGV9bgUEbTavVRqdE
         R5hwX4ZMUP2G2O7OfXL8ej3B9p4xwzJukvIrbmI49IZtGORvHI6NsYCx7W2v6zuenDh6
         WtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h41Xw1fnsOQR0sx8RF3G8IgCDeEFjEbkE/RdEqTN4CI=;
        fh=MCjXxzdolYPvRrXXT3JNGTEF0H1SdkbPHkdadxA186Y=;
        b=kZlhF5xEGG4hPf2GE/x22jbXEsDDrl9evhKtfWt909yUi1qitT9NeLGuDic3C6AvvF
         bp/8AgU9WKB5UpCDF6E8CCzDaMB66HnvehNSWgf1EzqbVyN/5UludGK96EFglvVERi0v
         8sl1JAuNYyFJ96thsETIadPxZSZez/noISlkPNweMdDMTDn8jYEPtpoVmrXtIuqKbowB
         00S9XTZRqJTFj/450L77jYjHArWwcFhWlADQnbzj2dXYCngnp55Vc853n5xXl6slZLJI
         9xr0yutgqs9B/0xi7eg3mBbo09UiqsW6IHCzxQ3+pHqZZ5m4NEcCLklHCzRmBPQreDNB
         pEVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278869; x=1790883669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h41Xw1fnsOQR0sx8RF3G8IgCDeEFjEbkE/RdEqTN4CI=;
        b=WmMn9C+oxJ61uKuUc3cMxu9RZF2rwLj8bUxNBvv3JbD//ikt0RfQrk1gBdMaM00Dw6
         OvaNe/i62s1Nim6rBQTMbOu3W4+dxXRBRZz0sUNY//4u4HGCeQJNB9c/j2SbE8pLOCEy
         rb73INsv8mgsp3pIn+LaxkroNcIsyRPIR4HytzA8k9lycLOaFIE+azyy+hIeh3cxeTFD
         K1PtPh6pJM0jEAc4siKsJQwsn5lvuE7FY6IjWvcBjnRVk9cDKXBvNAgwzy/GZeul0EqB
         pywIg+8S7m1ALnyKiQSBbSQB7vLmfMNc4AAn5B6rWg12PvJ/HJac3LRqc3ctqvgd2U+v
         ILkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278869; x=1790883669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h41Xw1fnsOQR0sx8RF3G8IgCDeEFjEbkE/RdEqTN4CI=;
        b=vavnHIfW0WpNm1Xvxvj/QxTl4A1N+elXPk9FUK1ykFBAGWPpiasvThOjyaiGjisyPZ
         LTB34ocbdx8Z24e0CtI+oOJAyp4bVCjjYW06VvnNwyQJvi1beqE4j17w8/7/nzBDNBMU
         tt9jo47mwF+yzB+ruThE4zKmYvBmGgib3oHQWjibypox82h3nfFbmD5yzTsSQ26meN7m
         UiMuFbJQ0BXjsukN3d0E08B+MgcoNpdh5uuJ7doJEruQpQfyO7WQQUmXc4eMZk85bcF7
         pTBEXHQ4qOEKV+7VUjF3FT51dVXKMl5I/9ywJLmaWQAVWtVnLAe0OGSLjy8lYOcg9N4e
         a5Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwW/kJoBQ4btUM8EfkaZYfbe3c4HjaVIStJfrk84IuUDN28c8lVg9JkIR4MA2PgH2psH5tNa5LXagMOiASVcDA=@vger.kernel.org
X-Gm-Message-State: AFuF++mvDFgABF7POcNdQ/ni019Wrqw8M8VHP6C9Kkb+zhfHETWYHhMF
	mLiUdMOUn5c7OL77CBHOLDFfJzY69g6bp8oFDYUrfCltM8ku/iE9TYaoh3OCioGF+jxRkRG/40m
	Gt457MQMFBTnF53yuJjTPl/euFfiZcJ51wTRKLso=
X-Gm-Gg: AYBFou05w4QSTUnjvv+eGh79nYUm23nwsV9X132DkOSwXnJTYn8EURGuANJwcEO5rbW
	GAMvDSuZ20wZ0QCzbc3ERQ8r0WVU3zHNtQ3eTPB9gPCXuGx6VxfXlO6Nbb9nttGWS29EmMEv8PV
	pkhqD6oidyybJ/0tXqows74Vvl++Z7xoMPvV88aWoUk/CSW/3Yy5Bi5GtSG9hG+Y3AXFPHFlMr/
	fOUycp4zis2AvFXpPK7dLEEwZOt0C02lKWmW2+O60LmfjgoXJSpxlcRRVjKGxmjRvoonw54PsCF
	LL2CO70t2SDHfHBrR5qusJlmk3CNiAfs96KW75O4j/fkwUso+lrv0M3tqJ9JrIvwMTxsqbbVyuU
	9KonuhVGu7MzchA3isD0/TL5gYiRhWDnOCg/IYt/+pbNy8PSKkP8VU+TwOnbzAoSN5apgHeNRbW
	jO702/mY/CqPv9Y036OQ==
X-Received: by 2002:a05:6000:2004:b0:487:ffe:7219 with SMTP id
 ffacd0b85a97d-488716f4324mr6632733f8f.27.1790278868680; Thu, 24 Sep 2026
 12:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
In-Reply-To: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Sep 2026 12:40:56 -0700
X-Gm-Features: AclHuK_afT3ctq6aSy0pVcz1YzUDdQbAo-wmNktAE4b7mg6mDhHhkzG2dA3w-_w
Message-ID: <CANDhNCrE3dkrE_251o52z=igoOFOhwg=u0284-DVYJABBBLPvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests: timers: count what tick is worth in the
 drift estimate
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:52=E2=80=AFPM Eva Kurchatova
<eva.kurchatova@virtuozzo.com> wrote:
>
> raw_skew measures the drift between CLOCK_MONOTONIC and
> CLOCK_MONOTONIC_RAW and compares it against the adjustment adjtimex()
> reports, but for the latter it reads only tx.freq. The kernel takes
> the tick value into the adjustment as well, worth a microsecond of the
> tick length per unit, a hundred ppm each, and a time synchronisation
> daemon does put the coarse part of its correction there.  Where it
> does, the two numbers cannot meet:
>
>   # Estimating clock drift: -51.724(est) 48.277(act)    [FAILED]
>
> On the machine measured, chronyd held freq at 48.278 ppm with tick at
> 9999, so the correction really applied is -51.722 ppm, which is what
> the clocks show. The skip for an externally adjusted clock does not
> catch this: the clock is steady, the offset is zero, and neither freq
> nor tick moves during the run.
>
> Count what tick is worth alongside freq. On the same machine:
>
>   # Estimating clock drift: -51.724(est) -51.723(act)   [OK]
>
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>

I've not closely reviewed the math, but it looks roughly ok to me.

I was going to object that I thought we nulled out the other adjtime
values before testing, but I must be recalling a different test
(adjtick.c I think).

Acked-by: John Stultz <jstultz@google.com>

Thanks for fixing this!
-john
