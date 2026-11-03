Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723062;
	b=cNcN7a1oSsuzRhXWNWH4xPSPSct/+eX5YeE15fZl86PJupVtX3xqdQl5rMIhX5IQs7a8
	 tmbu32iMs7A2nimIX1e+oMtpC/q+NMVAqkH/It38kml9o6OfYUH66eem6+EpxcqsUWjkP
	 eS7GnJ5eDu8PIa14O44e4wegdcKn6VuEYCIQpeJitPnCBYuXBcbuSjcLfpssHBdFUj3xM
	 ZgVReCf+kQMG73ytgU/1s1+N+U/2whmQqmR3mg4hCgSmIXxOWabaXTEEB5uEw6IqcH4W4
	 wdvV+p+ykFa0WZqto9oZHEBKeeqt63OiAJx0eeEE0VYgHxgNUAeO/VxGnn3Sxj6ch7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
	b=FG3l/u+4cfGii5+0Pz8YiKmkUmR6EIjFtjbJML6urjgOlI970M4b0/D41dZKxjsKif8C
	 GYqRc979lT18zRkGweJUjVQMpWabmxDiFmBosRvdNhy1qx06CSAjAy0U4ZwP9JHF+kyFf
	 3xxQ9K6xv4tyxytnv9kLT1Kz8oPTiTtPJVAjDW+0bRz8Bi27TgO9pTFKQ9yw/2kXYu0vv
	 Vx79zJVIv24cffCM2J8nlWjw983HuoIAOg7hYuDIAO3oGcsm/J4sPcm1iVhItPjN6Y6Qu
	 RQAGETmPfBLMVkGlGVXdVGlWNhFhfJMj7LcwXpDIIq338D04V/6d6jKwRg1MAJI44IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyQwWXPa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE300606A331
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE300606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyQwWXPa
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a54bba0442so41245e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 08:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723060; cv=none;
        d=google.com; s=arc-20260327;
        b=Gh13mlBAMb+jZk+kY3miBotl31aF7dwL6MOazsbblgXQmBwrNXxIiK5oam3bksUG11
         NaFo2k3pg4/7DwOwM71lLo5Pf7/vFpJzBR05WoXGJ36LkRjvNhi9bdZwfSgT8S+ktcuh
         BZzy/0jrpg41MspFotKwyEuZsi7Gb2CQHp841vazEUorBn50sP2wNlfWIdzt61qQuip9
         LdbGii1+Hlue8pL5Uipb86DbGy8ifP1eirvzBMPN2HooVkA0wN1OxSiECdSq3OxUNVVv
         KS2Noc3uLCGUUV0VL2Ul9ecR1FbjLv51+kFa1mNwwAO/LO3sejCfVGYPu7xcd//x4nIQ
         0bLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        fh=m5yFw2cPHdIod8NVcAeIJRSZgxwHc83zg8gBkR7Xa04=;
        b=IBuk8vabR5aQ3B2BasNItfgPh6jbjmEeYFAUPzvp8UJHLIEqfhzdgjUW0klIZB3l64
         fbD28b6RyBC6PHyDKu23KYgCOlWgLBjkznDtTDbVTMFv4jTjknH5uhqXTCTTFIe4Qqt5
         nVPtyBejhq+jmAdAgKytLd54h+vcKrmp88RVyNN4AzUyptSsNJemJqG2DPPYbXHhNOsp
         Mh6E078x/0SxXE8uzmjCZLB3vOpPi0xkMQiwtSUWuNVYZYFua8sd54TsO9L/BCiI4lnR
         dDBAkK5mc5w1rPEA5FirAX4jyNiHxf4olofBx+W4FJgAPcJJBaDvqy02Tk26z+VGfhWF
         7ekA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723060; x=1794327860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        b=gyQwWXPakqNPqfLYpECPqP6kIovu0Rno6xf9dsy6UzX8gWi245sCaxZa/cASDVGW+J
         u0Sphg57Zh/hS9iwpMru/kTgY4p2YWrbrjOSDbwjweKZa/kzCWwdk3quGrintQuo4Taw
         bm7ZbWvvsGfiz/7tjXeFRZGCOUT7z2vERL07JW7OAhvGY7E9CwOF8ORk5D3Ni6GSO4p5
         QsJkYuDyBI5XRQqzd2SuOJkRpwJvbqNF5yHEXrGOJk994AEhZtn+eXpBlmtZxeAJ5jJT
         VQgPhac+bIdKj/k/+OPjoAWglWwq+xHwqmEvt06Rve98YDSDzI77rOQtSJ7coUAYHNjw
         JaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723060; x=1794327860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        b=RP1WJlUp3WEYNdEcWcKfWLfNDcWyProlQhvYWtG4PmKpMPrzG/BrJ9zQ09HYMRPFa7
         B/gA9hgpI6K0fGtEsThlW8FTag//jNMQX08H3IRWUOX9RQLDbmsiFkTt/6EgRjwR8J66
         zhUYFG5zPr9JwxHwqF9GvMzd7Wd/e7Uw7uVMuffdGXnLVG1h+DxE5zU637R9b4WyQyBO
         66zE5WE33PewfOwZvT4J2ByFZHx8A1fUoYeKCssNmktd1pIB6SDbqsH7Mw+LgWWM6Icj
         grncKMjdo+K/DVjXC9eSf6AxkAngzTVgdOEY3ydU1N/5VuE8kHgDiRKKdZPvpK4Zwvib
         lM9Q==
X-Forwarded-Encrypted: i=1; AKwUvByHC/w/NFC2P3npA043uRBlm6HKJzNOwKlTFB+yykiNwuTl+0/H2Tg1Q4SyExqeV6CTQzSHnG+UQ3ZdK/88Ky4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DyfOFJ1XbKQ1eh9Orgj2ni1BeMvfYbg5DQ20fdyy763JczF48
	Vv3Q8vt3ijMpM01H8hzFs5rySYh3gAHWZFBg6JYrZuQuZ/B5f9Kcgj5y7sWBc63RV90K+S/xZCi
	uL2t41+FMT47U1j3KM+jsPgZRqFQ7nt+TGGsrKM0z
X-Gm-Gg: AYBFou3jhOb5iPpJnqNMcg4mnvpe1MH50Ul7iE8/NO7/fJ4IytM0VhWFCIK33b2BFki
	6ZGuS1A4t4/lpbtp8yQ2Fc/L14pvgS/lL8aLqKuzmIO262LIphEiorYi2DZpEA1sGS+c33FL/6l
	6gqAstgYySLvsZxQ1300u2jmnWIcHjeHkRzTgXM5TaHWUbXQCOuo53pAPIWLCqVxVixm/qN45bb
	0mfvaem1mnV2ufI/9RdGrVj2grs2KgZOY9YVk+KVXdzkvzlN0aYW8idI3OuWwWpdz3z1zNtWhqu
	OBaYxIG336khvWqrMgCcycWuHuVjGXnHgRs63OPjlZXaL0tzaUUGMjp19Yk+ZEz8XRJxVvqcmxv
	fHUPE8+wONemlUjGgUQqlMoz3leoA8PT7BIACxHFWHOVDguStv3eVsQSzb9GTPKGG+Igx+CZqyD
	M0Waqkb7Md59KrWxaVYfJXDnw=
X-Received: by 2002:a05:600d:848e:10b0:4a1:eb11:489d with SMTP id
 5b1f17b1804b1-4b2e3792525mr718955e9.16.1793723059760; Tue, 03 Nov 2026
 08:24:19 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155459.534792-1-sashal@kernel.org>
In-Reply-To: <20261103155459.534792-1-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Nov 2026 08:24:06 -0800
X-Gm-Features: AclHuK_dqXVxHCWjDX7Q7eybw3sAcf-f-Ua-B2wyA1INBKZKvcYJncwSGXQwV3g
Message-ID: <CABdmKX10Ykk8qhZt9GjEm_vWz4Fx_WGjpvQLeSbohu4O2_8h9A@mail.gmail.com>
Subject: Re: [PATCH] selftests: dmabuf-heaps: print size_t with %zu
To: Sasha Levin <sashal@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Shuah Khan <shuah@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:55=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> On 32-bit architectures size_t is an unsigned int, and printing it with
> %ld warns:
>
>   dmabuf-heap.c:215:43: warning: format '%ld' expects argument of type 'l=
ong int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=
=3D]
>
> Use %zu.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
