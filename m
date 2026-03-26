Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E233B2FD5
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516145; cv=pass; b=cNVKNiAfjUgzeyADBP4WVhNhSbhslnAhlX411cPhKFctjiN8vGSZcbMNMEArZZAyOll+R4bdSRZ9xnVWZ4HSI+mcQyX5zzetqRI+1TPFxfUQttN/sSBRUAIHC/EGMeGf277SYsznBMf7ESMV5TRLeVasNySS2bnoob9BYlyXksM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516145; c=relaxed/simple;
	bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtUODbRvI/AdnbyTxbSP52s/XsFMtU7VeSR5bnbAEQ2K/pJE3uZP5g/VrOK9tdvyRulXO5GpvKTr6vVhScZcdB88YjqR0peJ7RUeZzxrW/ELhQO7IMhTLfTx2jLIU4OaL+1zK/v+3sk8fjmdCyr0ax5tF6v12S38j2gdG5kr3To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egxOrybp; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egxOrybp"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7927261a3acso6092027b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 02:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774516143; cv=none;
        d=google.com; s=arc-20240605;
        b=DeRE2uGQa8ihQXixE+6KvjvQ/7I8Vzep4pmTrnpbJEeMRH82K1iEj7OJwceRB+vfCO
         apFZckWUg4EFYotbgVKDpYg916ynL5hYlgJLmDMHpfuA/uVGez/900Yc1sm6SuzaeRu6
         o90WpmEo0YQ48fbznoMpSIa9N+l5dwZLODL9tOHl4VLn9LRjzLlLq1+f3+3/0RYrQOrV
         e/W98kaflFYN2Keby/AxK6wWmtUX4WbNBk+a8mPUq7eI0SCXJvXkRUzvFyoPlG8D8G28
         Dy1oPQrfy6CYhZ3jfxD/IjvXTPSXhztLTMybOCqCJuTfWemBi/VhD/ysQHi1HgnKPs0r
         rgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
        fh=8swnXf8ZY8fTMqjbrM1j/7fG/Bs2IAiPaHrDMjFtr7I=;
        b=FMxzB7/cELNZAnXnAmROnuwghRhGfpzF1hnu27uqGNSER4cMqshs6u1OkaBkFOcMEo
         mJ7vy5RWtCyah9eimahjbSKTQvCB25BpccsH4uwRxaFO80XEpN2Mn0B4l+b8jXe6HRBR
         k1s9IbiJNJaJsXo8KQTenA5PukOFbV0zPttM3kG0O36VIgbfckECbcI2RLQdkB/I9f6Z
         qRBaCDhBiKyAd7CnQDIIYJ4NdAE9KskYinHuZ7S+wuMGAo+bRY/eRgQPyglCwrH27WuR
         Vb1BUPx7/7Nyyo6NJ/YG7CevXH0SSpeux0oF7T106sBjTdQM7n7+qPRbOQif1U75Rjis
         5Prg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774516143; x=1775120943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
        b=egxOrybplSlmvCycHtCuGYbW1A5P5oNITAlKux98JNdH32W3gd7FvITIugTC40APEq
         Nf/gdQIFAgV2ksdsLd7vNMwXcKGMK9ojGYEyh87o8SKjGvdQp1cq332eGVhJ96pus4y0
         3t13kiyljwG+ATCz/fWGN/CqRtf5GPblFfgMNE+jXRdHUs+9j+6mYLoDppfXgKQr51xt
         u8Bu+X9v6yx/7TYZq0lXHgnTrkhf6d4cpVuv3d6D8YAtR0lqGSKu6klwi2djtA/SuIc5
         ecpDDEaouBk6qPRzoWTlsMeKegO8HRjY2SFUb6fs+HqAbuKrEk+c0z3ZkmsO9RK0eD/s
         SLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516143; x=1775120943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
        b=OLbwALB+ZsqHjmRo8F9X6VAZcUg0PRtdn4yfZctpFMMWQX/Y7QDl5m4qW+RNIAG9qK
         U/HK6jrY+elfarjLjJ9HQgd6ikFOgzajK3ta5OCGD5CWd6Rp9TmmJwDXGqtjsPPzJ8ds
         Oz8cDb1HtgiAjDwmsgEv7elK8G+lOJrullpjdl5dyAvMF1X2hKqiKF2y7EJgR2BPumSy
         YolItKNZ5oawvs0hh4VcCDFsZAMUMUbCN0vi26B3qXfZ76zVlVQ/vNy7FsEU6ZXUeBDa
         ifhMeG+FRUBFci44kba/3YD7wveOqh+6TwSRniZ31mOXTTaT9TprAC0z2Ukpt/1a/ZOz
         +Y+w==
X-Forwarded-Encrypted: i=1; AJvYcCUIL/OUQR/L43I1m6eLOqwXZ5LfIWWFLb3Myq0QCbQ1nQz9B1m2V1cOIIubXh0umW3PbhCioBwLfqC7mhCky/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxpmZgWXBAdrdbE5rGg7AUMQ8wEP7xocf/otPhb7YCGD1q6BET
	4nK4L1pEBZaLXwst/EvZ270l+fdaKWwmjOBfVIGlBENQ80lcquFh/h6CvQesCDnc0PCSRuVzWq5
	ZpeTIrPPhNOM10VKgzSUo8HyIrx7xcVs=
X-Gm-Gg: ATEYQzy8l0wyl6dHCaEG7FuQku+hJRqQfKdUJq2kt5D/jy4Y+zHg2Ox5GqRYZXJZL0g
	dgefsFw9tvVcbz1iygm21YVutWxJtm9GVyAS2wg8ungQ8H1atRxhxT6qiKDJYYbyIZLAp2i5wDt
	wVyGphXOBHGTdXs/32870b5cJ/Lh4z1aLUPZlgfOEvBvgENhdUGnB5C2JGG4QP4WkD+Bj4ah0/B
	OufD/b7ph9X0d/Is8CEXN4dikLeMaKIIDg5t32xZ+Zb99OPVQxyHAXQeE93nzFG7MbA1BgbxIoq
	C32PiipMDFR/qj3x
X-Received: by 2002:a05:690c:46c4:b0:799:3a3:2f25 with SMTP id
 00721157ae682-79acf67c2cfmr77450957b3.38.1774516142930; Thu, 26 Mar 2026
 02:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326021642.29170-1-dqfext@gmail.com> <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com> <20260326083020.2fOQj5br@linutronix.de>
In-Reply-To: <20260326083020.2fOQj5br@linutronix.de>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 26 Mar 2026 17:08:50 +0800
X-Gm-Features: AQROBzAFY5MiCnvJ2DMtdJfFsNq_yFZ6iw3jGYwdcM9wBpkBnMh9AY45ZZy5_aw
Message-ID: <CALW65jY48_cq7tZR2S_b+Y1zJw90PGtQcM9JzK1wDako4yUaWg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Antonio Quartulli <antonio@openvpn.net>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, 
	Guillaume Nault <gnault@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:30=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> > AFAIK, this can only happen with PPTP or L2TP, which were not included
> > in this patch.
>
> Yeah, that one. I was sort of looking into but gave up after a while
> digging through code, since I had no idea how to setup that up=E2=80=A6

I used Google's Antigravity to generate the skeleton of the test, and
the rest was some manual tweak and trial and error.

Regards,
Qingfang
