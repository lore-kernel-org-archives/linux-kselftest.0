Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F838E123
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513597; cv=pass; b=hHQCP+QDUz2bhnewwlzRD68S4AOJcnUTNfJMjykXC+DZElcfBR1TcdM6wWKqTdjTNWZ0ZH4IxndwM62KNTEOVXk3/FzoW5HTT9QHxRKpt1UFOWWKxYUovjasoKoFSn4lKHglUUKJW8QH2tmCtW3lx1yQWdtUxskFm1s99QPURqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513597; c=relaxed/simple;
	bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7nO9EVTcm0gIhvxGWMEUTrdLPKQLcdBL1tY/33jLG18jj2lSxRbzfgualh8R3NLceY+gxHIWLpwXWf4wG5ZgRCJueKFPk5AEGW93dWbd7goTuDPLTQc8xwEJ0UFIuEeouMXS2pmnNp7a7QHdXqeGx274VGTFV9krhNMY09RMDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVNhpJXI; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVNhpJXI"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79ab5fd969aso7353637b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 01:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774513595; cv=none;
        d=google.com; s=arc-20240605;
        b=FnEZQjYlQC0oI2KJgwDE7zWS9Q5aWKmXd2ePuIyGSQF4DrkErZAHRn5fKNCigp4SLQ
         PbOJvoxBbIEN7Kth75/ebUDYVH6XK2UzK0smkpOpa1ZcakhXQvG7VTdPe6c8L4fDD1Az
         1oywAThe7Jl9qEZVNJ3SCoFRv2jeAaEz8Wk3SVe90b7/EDPWtwU1vrZbXr/0Wr33VG3g
         l/FIkO0nj10qRQZNquYU7pTdbz68o3cdJkCxEm4A+zE3cofRHVXEamUCDNUmVRv1HaYc
         wxpOH6HunOB+6P38KTIAYDrWAa9PuBpFjOJWVNa5AYJKlXI6fRT9UGIHERMbkV20stx6
         1/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
        fh=WyLlNMoErPN/AIk4smmrHylX/HjZuu78p7e4sRj2ZRU=;
        b=eOfHhWO+Nc0hM1PMaTKlYjNYtRAOUeJBWTNZF4OmwRQPXzQgtEtOH2iMSQlH5m1gVp
         x80o7NQtdPWFiCO/LaCItJjBb3ooPHPBY1HpwfmlL3708o+004EgGxnYuObOxDpD9Vtc
         y5ha2fYySysQrWLmJlB6o9tkxCJpH/vzVnaPACL6eYkj6I4ARpNZeO1YfuBQ9QRwKpfq
         vrrX2K6SWK5P1Ui9ouW9MX8rfC8YKMQWuv4icPY0QtNAZ46ydLiv+ZmTidmM+EV5a1Lf
         4eSYQxttFLHMEfmA8s2WXvojpMQNVbAH8qsnoRCcPfM4PoCfPgB1+7RWpeg9Hzq4Re+5
         7dIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513595; x=1775118395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
        b=EVNhpJXIzS1Wo3JWLqs8C/YYXDrGugVOxfHsB7LYt/UWt+II08RRUnFmWCdPZRYCRB
         fjtzgKMO58j9g6uQ9wNkhwo9pDWCrjpkUdf/Wxdnrv03YsvOYS4iEV9OTw6GR408vy5l
         NASTZhPGLxd38RPFPdpl0xgh2v18i17EUifz018WADrQ+vAfr60VHYnnVBsZQgMfs+rY
         I2TpltHQkDLNOWYyXchuDQVXhwkHhAK72PDbTdpcC9NRycvj7S+yA9szRu6mQ2TvwVbL
         nIx8j0ojsPMQ8tD+w09vfGU9VR4Kpm+ODVpfQIex/A1aPWrPCFWtSZe9rTwfzmZHW1RX
         4b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513595; x=1775118395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
        b=lqWSXmyjAvqzu44ljRq9bEv+be0ya3CkDV+J1WuSU0C8JJKvMO8YLCoTV9KPsVtvwI
         D1hVnfUam8kCYUXl2zCMsoRrf2vyR9UHsjzUYo30tOkNa8g4oDaathu/sJW/V1coTsar
         ItGvouW5G33PsO25J+wwl32zTC387Zv7m4V8qRKw44ebwguQVu+KG9nAcXfq6VGr49iR
         IsEBaTjjB+4xqNNTfEmp8IFHrROza9fh/c2qigLB99xVUkKYqXRLHvzx9QFFuiGsrwHz
         HZB1uQUlEllZ8jtC8dIQr0IVA4lO4jB3YQEjtCVAGz6buwmb2b93CyJg1aKk+lXCg5g0
         tzvg==
X-Forwarded-Encrypted: i=1; AJvYcCUwalYC8756syvt7Efo5ZAEZ/G6oqWitfy/RjWH+kXkhjCyIBRNEMC6CcOVe3uLuCKOFYOMEO8yjY0VNbdVwzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWLijX7O/5o1tDoOFbBEANe7xrkqIaOjrrOVKUJAkGuOgfek2
	XU94RO10fD/4frqwr6EAkOWkH5qijyQZcZ0hbUdS3d9eiNdulfgzP2s99aU8pGV1Qb7xl1LVXzD
	j/G6MQKtR2eSi+ow9o+l6ioeJCQ61vyQ=
X-Gm-Gg: ATEYQzwlD4giLueVKH8cZ7zRs1v9fLwwajfr4AmIRb+OXKgBOh52dzNvFdth9p9qelC
	h2B1A6lHTWSfBOm8almKDYCVdzbU+gNCjuKAhaIXne7iJgxtSgnuFlZ34BCW7EJHdbjrdofxGyG
	EnQVIu7XYoI5UTzkAoWVVIzvUJxgl4lEJmvb18zw8ALSbQl0pJlCd4H64C+55Fsn844AatE3Tg8
	EI1iIsSrQKvLCXuDEFEMg8ZdZMHLdtVxcUkEYWY8pePFtwEH4sxtbQUAm+eZqQ8vZQzRqPM3VfN
	YRJ+tRDaEM6EVl3DTRm/ZroC56k=
X-Received: by 2002:a05:690c:a:b0:79a:b983:b44f with SMTP id
 00721157ae682-79acf2e95ccmr68192227b3.5.1774513594860; Thu, 26 Mar 2026
 01:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326021642.29170-1-dqfext@gmail.com> <20260326081304.xKa7-s_1@linutronix.de>
In-Reply-To: <20260326081304.xKa7-s_1@linutronix.de>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 26 Mar 2026 16:26:23 +0800
X-Gm-Features: AQROBzAqSiYwDVv-JZ4YazMfucMB6x1v8l0fzYVRYEFWN75xZh-iD6Nf7djB4VU
Message-ID: <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
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

Hi Sebastian,

On Thu, Mar 26, 2026 at 4:13=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
>
> Oh thank you for doing this.
> I haven't look in detail but this cover the "invalid loop" cases that
> ppp tries to catch?

By "invalid loop", do you mean transmit recursion?
https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.de/

AFAIK, this can only happen with PPTP or L2TP, which were not included
in this patch.

Add Cc: Guillaume Nault


Regards,
Qingfang
