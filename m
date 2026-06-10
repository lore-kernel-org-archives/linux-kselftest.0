Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4133F385
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 02:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056835; cv=pass; b=s6Efwz20cRWsnx5OxR1GVEYeR5bX/qmplgLWsxakv2OmJqs4jLVxgW1ExKwi6rjzSQXAAqZ0lpOxwb/Dif1xsnsq8gSyv9ncAG4itGv5OFc6bAa1wMxDRS7c9dLvtiolTpS13COJzDBPX0gThPclnd19YNb2/fmjiaFQqWweTAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056835; c=relaxed/simple;
	bh=mRVgDARQ+qAbaZF3g1EjOu0YqsDTXhBlD9Y4+9FuLAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6mH1secoPnHff/txH3Ix+LKJMSHwfkL0+Df1F9JRA8nROdvLnA/ak+YghVDNsf6zBQVG5PFGGi0BZKbPdyWNRZ1pautAtJ63MEoRps24scVMSNqt7MQ+FmDGMWy3GJoD0elQi2sFZqVi+SCeGOPVCK4jpEnM00DgRsIDMrLbZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oaYvuVmB; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oaYvuVmB"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13807d2f898so5396303c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 19:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781056833; cv=none;
        d=google.com; s=arc-20240605;
        b=BAmGySdtjgEkTRrtvgkbeI1wOngRmjYknepwjzAttTKXIYmuWV3yVJosfwgVlgimJc
         tWDeSNUSxFX2sXIl8SuxSSobXLFuwkhFJMq5Pqt7OK/g9Ac1oKh7LwKvz5Znisnb4Z7X
         uDY5hM/WXK8LMbcWOwfmnjY7FVbK7vRvTAuG1hqd/9IVlEBvaT16GuR0sRFlB9MyxUUA
         aOdg4IhEre+dobXnQcIuG4Q6cvjBiVa5U4EN9D3UC0RJ3yXRAmxlkiUTwUydsFK29wAX
         fASqmuuV22Xa9hIM9sdP9Mlhr/WD9sFzv0qmWBhsiwUEx4d/8P+EP4RwJPjkN64TLdzY
         yPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRVgDARQ+qAbaZF3g1EjOu0YqsDTXhBlD9Y4+9FuLAA=;
        fh=MdyVwTnPvhbZHFaj8sLmpUKvYgBEiwx6INzRFNi/JQY=;
        b=aNToWKXS3iiPi1ZOvSs/sQSEwKlrqBKjaOrh81DMGLkPTSzr92cnBcZsYB7DS4dZzZ
         JkZZworZH4gOYyBV0e+8d+RSj/wtRTFPifZ5iMQGuv3+/Rnx3TliATu8ooK+nMQXaSmZ
         xf4CRXecZ0baa6KaU0Nb/H0cNPQlJBqlmerEdqV+z3UFxINrFNuuiJMAm9abD1JajFce
         m7v+Mda/rVRQT69D7t9EvZ08Dez2XT91J9OZUsLFu4epgW0L1kXKXoGcQSLGdqO0x8Vl
         j68HLuFv2QQzCSdeSgHAeP+R6oWgLZdikPnEROVardiQc643z1KIpaigQ+MvNqkNF38a
         E7bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781056833; x=1781661633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRVgDARQ+qAbaZF3g1EjOu0YqsDTXhBlD9Y4+9FuLAA=;
        b=oaYvuVmBRxkUVFf9qmkJfyrPW8cyKbC6ZkAdBqdjWC/jw0PyncyipEnmG2GC71b2Sw
         GbXCg+XOrPHBS2MzvgBA8d+sfMHSETVKQ6AQTLxgoXpx+lH3oKghnf2VExjsuO4iDmYj
         /e+Q9+E29wP2gGS+Zi5Ga7ZhQbZTUHAz6ujn6sA6hFHjooIYonERdxCuowOOlgmM28gG
         3kucQjgqPqq8Zvckor3blVsXPHxdbTliG/JvxM0Ydntt3s6CEDmjoYx10BU2Xz4mNUoH
         FTLeQA1YBFfr1ZfIPKVo97tLxoZKikbpiI0FZsxnwcz8XH67C/+INVwWiDZoKxh56R40
         XlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781056833; x=1781661633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRVgDARQ+qAbaZF3g1EjOu0YqsDTXhBlD9Y4+9FuLAA=;
        b=MHXAaMZ0IFZj9XZeBmCzKdqASb5ZIHgVCms1AP82l6rTGtWxhfNJhVzuJjToiANlmb
         AqNDTfV1NdIVAJ4VfNQIAG/YepthbT0d3170te1EyXpnoGU8cc2A8zOMZmOXmS/dWE41
         PYiqu5qrEYPJ36plFQr4+P5YcvDXehwrPZfzoEpZ0cDyyfOEF1pvFZ6IVC38Nb2ciq34
         uE9jFKgWoYg07x7DLBTP0U2YLJ6PDj1uFAT5mwa5qiAwqJi85emK8DIeqcTmEOkxWN8g
         QIbtBFTaps2K34Gu8oTjgAAFqJw7WWUNMavPBQourFUkf3WpO7xQPqvirbC2oiXbxfhY
         kLiA==
X-Forwarded-Encrypted: i=1; AFNElJ+N6gcMXPjm5L9ohn8MDqLeVq7GM953PPjeCHBLeXyNxthFDVrmfzBzsMbeP1x3ixSuR95Kp3zw28XRDD5slMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlaeE6gh2iATvUEN2aH21HUhsJgnajPKeN+oYiZ1184WB+WSv5
	urNrvWkXuZvjWHFqP9r/qo+VdOZAzxWuhMXsxgNafC5oZ2emDpt0NU9147RtaHDS2xM9oGUXQZb
	d6x1GjDQOZF7WnrncPpqRPG1u6/e1/OLkOLzX67A=
X-Gm-Gg: Acq92OFuWdTZS4kG839zAgC5EGhmC52SA62Ue8fN2TuVwoLaAoX7wrgcEGb73I2Yohp
	6iP5tlHojMhMv1n2EDLEaYC9FCOUYHzxyNbG5fG70XLDdQGddTJ6+BDPYXuvJ+M0Mli5ksmHYVW
	Fs+P3CPZJ+szuGnINpk06GCvxeCD/RiW6cF7wAFO8mG9VMg5ZYygI0WdXgOwY80uUO2AIcbQHFf
	uAMkQc/GtvbUGgMRUqLtZCe3sniAabLDNktVq7av9Dl0YlJm5Oi42jIC4yGm/8sUhgNS5Ju+iuM
	XjrKyXqE8dngTg5d8+2O1QQFHDQkkUGDCile2arF2msmpgGkT9EBfSbQIHD6Q/J9S4HVl6ejc7p
	0+Y47p4hSeJw/TUb8z6Q52MKTptaBG68fTep0OfHN79hNWQ==
X-Received: by 2002:a05:7022:221e:b0:137:fe07:8a2c with SMTP id
 a92af1059eb24-1380671fdfamr11991332c88.22.1781056832305; Tue, 09 Jun 2026
 19:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANDhNCrDSy8Zf9yo4uKGOtJnLVSNqF6pOqZiRr9giyEG89qpMg@mail.gmail.com>
 <20260610014721.718362-1-wakel@google.com>
In-Reply-To: <20260610014721.718362-1-wakel@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 9 Jun 2026 19:00:19 -0700
X-Gm-Features: AVVi8CdaB8uh_ClYhwsTNecOtJogIRHhf7pwROPp8mHdXjM4UzGmgHy1yGTTPWY
Message-ID: <CANDhNCq9GibNuAfJezCj1xSd4cKcN=5BqEVy6H4QJu_kdD4eXw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: timers: Partially revert "Remove local
 NSEC_PER_SEC and USEC_PER_SEC defines"
To: Wake Liu <wakel@google.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org, tglx@kernel.org, 
	shuah@kernel.org, sboyd@kernel.org, cmllamas@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 6:47=E2=80=AFPM Wake Liu <wakel@google.com> wrote:
>
> This partially reverts commit 80fa614e2fbc ("selftests: timers: Remove
> local NSEC_PER_SEC and USEC_PER_SEC defines").
>
> The original commit removed local definitions of NSEC_PER_SEC and
> USEC_PER_SEC in favor of including <include/vdso/time64.h>. However,
> NSEC_PER_SEC in vdso/time64.h is defined as 1000000000L, which is
> 32-bit on 32-bit architectures. This causes integer overflow warnings
> in several timer tests when doing arithmetic like NSEC_PER_SEC * 10 on
> 32-bit systems.
>
> To fix this, restore the local definitions of NSEC_PER_SEC and
> USEC_PER_SEC in the test files, but use "LL" suffix consistently
> (1000000000LL and 1000000LL) to ensure 64-bit arithmetic and avoid
> overflows.
>
> We keep the cleanup from the original commit that renamed plural
> definitions (NSECS_PER_SEC/USECS_PER_SEC) to singular ones in
> posix_timers.c, but we now define them locally there as well.
> This also removes the dependency of the selftests on the internal
> kernel header <include/vdso/time64.h>.
>
> Signed-off-by: Wake Liu <wakel@google.com>

This looks ok to me. Thanks for putting this together!

Acked-by: John Stultz <jstultz@google.com>
