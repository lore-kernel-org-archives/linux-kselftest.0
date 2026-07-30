Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDEC43A7F0
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439639; cv=pass; b=rfkOi1V+uruUv4rPXAtBL5zaNVBJm0VfnFxkPN3sYjU3gbFdkT6t0+e4T1MGOxRZ+B4u5RaRimGjs+0/XWkjQYcEMOvCu0nYTimprFzFiAQ7o7RyxKVWOEpVvyo5gIsRPk8wIIQVK606G1nbTbxjMveh1jPVPI2N5tonM8ytEDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439639; c=relaxed/simple;
	bh=yCbUja/NuvIyEj2mf1WbqtIKDU89GWY04r7jifeCkLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE74hfoRgrGC56BnacwpJ7EF8Jla6OkRrarYaL41P8TYLIjm9FUYyMKl/95VfjssOFo/2w4cVdJctMCD/k6izKgySK53G8nV1Kr6aqt4XK+w7I+86MOuWSrxAg78FTIFu8Ins3dWij5pS0wtTvOXvA1k3sY+8HTUhy/5pCJAmco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t0YeGcM6; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t0YeGcM6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so2341345ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439635; cv=none;
        d=google.com; s=arc-20260327;
        b=NEqX0b5tQ3AmJBY+x0KiFxdJNomQfEmFFMDTDHK/AkeRBEw8DyleyPikTxUSZ31YZG
         Kp0hvZAYY+/1q1ZSLaLRNR+QJ6t83kS+Lwofhbf0R6UAouh70GLfxxwVK6k4RC+ib6YY
         2baAAJoOFrZPnENeqYxM833ApZNe7CqImTioUoABrdtjpcAzVBsyJGqbaOHdpx6URvUg
         z06lU+Aw0o6uwqGlYB1foTvWsAuESgezcSEony/st9tMz3QSB2wRrrPbd9yAyexydqKM
         p3Nuq3NwGRngY8MbR7FSYOS8kloQkP7kgRR5Wo6a4viLI0dME7IqgWIR4IUJOEVKuVXw
         iGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCbUja/NuvIyEj2mf1WbqtIKDU89GWY04r7jifeCkLo=;
        fh=zs7s+2uwI+zecT2kYHlVLkR8wemJI1Vf60QDTxKqXiI=;
        b=MvJd7FgQV01n5puF0c+5HwTH/xJzaOK6SkiXZ0i36wd5mgi4gP6UyjQF5Iz6Xr7wiQ
         s9qa4S3kkRM92r7d4TWn5DrrXhtviVKDPlIrc8ygm9PiuU/5nChHzk8WnBfNpF6QtmOC
         BRpsemBQOtTn245BzDLLrdDm1gEVIE00iflEu0l+TH8kRhHopmJfT5H54AqwU3+849Jr
         4y3ajHpckKR1AsV1VBISad/UHg4VhhSsaQIy7s+Pk4Vzr2kVq9qALslDXyoLscXH14vY
         z0pp4GQvmJxLO/rLqYeyMhHSIsDpjibWeprwW81djAiIyTm4ENFL9T4UFxxBiGJdLcGb
         NveA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439635; x=1786044435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCbUja/NuvIyEj2mf1WbqtIKDU89GWY04r7jifeCkLo=;
        b=t0YeGcM6b2Jzlc/3rpWINZuY8329SflD4gOrk/tixysLqq68o4FWanlek7j80Q+KOR
         +SDbKIcwUvdDpbvBPXs/kNMd52Cr9ohvuUqvdymrRehXCLcFUXMbqu767CPhp5bMToEW
         zSH9IRboCON2b8jy5HuKfHLzKlMlLflOc9QJBWekfABgwdLm3lSw3jF0xa4HoaraBBSD
         ZFrUYhvCbXsgDrkA0TWdds7BET8AR3D2657JlDyz0lKHbGD3DVTO9LZAxAl8xCsU221K
         Jv09ULjcKl2duaTx522kwsSJh2uk6MEfdogZRhOSX9pAUy4q00V4artYl8sbuY16xGN4
         CcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439635; x=1786044435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCbUja/NuvIyEj2mf1WbqtIKDU89GWY04r7jifeCkLo=;
        b=grvIkxILo2mGrOKOMmLDI5Rcow2/EBxZz3G9hPS5Ceh6UIejPswpqy1nqSbc9EDfCo
         oJ7FR4LI78wHdI4AuKzev2N7486m5/6auKbT50GQBU9BZ1z6Y0LRUP7cPK97CBrVk0RF
         0qDGmFha/ZOiLnQmRzJpPMnWOdEw28y+SHnFp6NPFBunHA6OXIWKCMgzmBSb/TtExbRG
         dLEqOzgBrq0hPrI8yxPfGqmfj1248wmt781enCDEqx9PhQqBH8i4SVCYBKMsoUjZZ00e
         pO4DZAxJOgvNXbFW3P+bs4oeF+4c2PhnPtQBA63mV7BP7Ml4/JDV4F401iJCCVozjrho
         FN3w==
X-Forwarded-Encrypted: i=1; AHgh+Rqnh1OYmCXWyJnHEExexN9ZS0xqboUdyGcenaxyxvW1Nk/wPHK3/kmxk7bEqEHW2c4gEwqWmIHKCTHFmAUANrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpl/+9eeq8r4PhTphk00m09k6/a+VFPz++SQduv0ZRlGGMlfPL
	eeFkamx6x+d2aqFj0CSAW3J8+ZENW+kwJP7+MpzMFzvJ2hinnrPZt4OublZEVE0cIp25EDlNl7z
	GgoF3xcAlkXAkEWuubog43PFe/FOlqqmLpziuKLE=
X-Gm-Gg: AR+sD11XzC38TvGU4rpjeM+hXe9wWMeRiImoK3sX99U6saKcX6eTDbPv6ApwyUbsjZI
	yOUhOcyyU5HS0qAasMcVJOk3E2UV1KjqqLd2tKLE2q8NF5cQg/rq17zHV6y8QmtpDrgSh70ctmx
	IwyPNN0OIF0nkWznoSmF046PpmhCJy0Px7PQvxuc+flU5VYBH4KlpXphK1Qqr9y4iKfJAQZIctF
	LTDZNwuwefIZtje8BG9puC3xoqaLXeqe61N7gRDBab5bJjujhZmjuHtXX96Us2Bt+XaThlH0Gsk
	JcPUHYrBtJe/+3OWIRoq+CATph3H0ZTdU5jlZr+E7Obh0OwQSFOtil3keiasUgp+xS5PIrvp2eE
	Q30upp9vhXo9d27RjGixEkacEcq8KkCSI4PuIwaB9f03a22rJhQoZ9IIV1jLC2uKhzxZOPSbb
X-Received: by 2002:a05:6a20:6a09:b0:3bf:b9de:8570 with SMTP id
 adf61e73a8af0-3c9004ef6c2mr3591260637.19.1785439634586; Thu, 30 Jul 2026
 12:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-14-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-14-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:27:02 -0700
X-Gm-Features: AUfX_mwsIoZWs5J2Q5_Vo1Wpk37CKf-ETG2QSb19q3xR260NSlqlBlmyKsLH3Q0
Message-ID: <CANDhNCo2JSa=6Tmy9v7vintCe6KX+OTHXKe1FjmkrGoZC0vhuw@mail.gmail.com>
Subject: Re: [PATCH 14/16] selftests: timers: nsleep-lat: Explicitly list the
 tested clocks
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:47=E2=80=AFPM Thomas Wei=C3=9Fschuh (Schneider E=
lectric)
<thomas.weissschuh@linutronix.de> wrote:
>
> The test relies on the numeric values of the clockids.
> As not all clocks are meant to be tested, this requires skipping some
> clocks unconditionally, cluttering the result.
>
> Use an equivalent, explicit list instead.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
