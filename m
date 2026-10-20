Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491769;
	b=4yjKqI/wWX9maeoBi8rtfUkBnpSaQM1UZZNHSPBswuqT/6s9ZSFqvEF7HHNxpW+uIfu3
	 4kShGtu36vRRftRZZyA5eaoEJRY7hCkHwPPqrPffP8lhAiIBMj5S02bSQ58l7590FRUQP
	 5GggrCSWErsUpVUHPDGvnUHz1r+2EOyPiP9+1jf3p7kfpCu5E8qQYmTTAsSKXMObc8Q4I
	 rekZuMviF62Faz5NRyWEyO3+UCfDl6VNzZURO94BShQfmRfKFxVcgvkoKuF8YAxwSVCUj
	 hb4GgufLSivHKbMJS4fQtFL8zNJ93/j6V2R3vO3CZsec80jnO5KXbd6Fi+wvxDU68qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
	b=XsKzUUacWA9SrI93AgndVVb31wqFBGWmOIt0Pzrdz57XHaZ2fGziq1JgHoR5qcWdViYQ
	 0Y9ClUOkvLyG08xGBEkDvIssxKHPTYERC5kU80NeVRVwbPJmJvIsdvJu4JJYK9ed9aDG2
	 VwAnpZGpuqi3+7wXfoYXnlyyt12sCywevf0ZNe0sariOutr5NEZSrmtlKt4mOR0hk6pJ5
	 g3LDF0xq7ZPm7lvjLMGu/8EhWy0ToBk87c0v5nEqOV7knr/SmA9Kkc371u5ysIzk/ZwxY
	 miBFOw67JJKRNwnFeIGPLCZkJcV7PYaKGbco//7qYd2xxmMkq+QeNsMZwIncxgjsvWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAeXLhva;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37263606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37263606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAeXLhva
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so3010340e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 03:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491767; cv=none;
        d=google.com; s=arc-20260327;
        b=l0Ko0PX7D6P3ZIVDNm/EbHgpQkxq2y6F+HcO/iyPrmMDqbeciU8aSIW908U+EfoNA4
         OJE2elO2AMi25IcDaBnk0McOyyPiDSD/P9OnGT18FGTTCSKqIwGNRScRE6/hfeZxnU3f
         OQN+Yg2ObaOGBzEEtLtOP5EENr8ZqVi1BekkzzoqsqIoXIGx1dqwiRBSJuWuO564WSLr
         HH/kCFvT+yRFrkGfHDJXcSZZH5EaeY3/+dSKETtRFOj2Iyi4wjxuJem+W+HnTCQ1J6FH
         0hh2BHAeORyRDS2ABGXuB05s3ca3qPsdb66I9fndJ9tqDJ2SYQ/zlEzb3jRBPkuNCDdS
         qReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
        fh=nfE7gx7aA6/LcqrKHNJHllYhE+zvAJj6W08hm80oodo=;
        b=WlacTLKcJfcC0xadg0AiljkDN7DpBroN0/ki5hFnDowify23ROGfL8TvUgCQAdvX3J
         5LsNYcvxsdr+84QHVmrMxVljudxtMXErDjrkWD3B9REYPgCz4VaPhcxqOYVY0Lc6fqBx
         cdQqA4OXMB3OzX4+3qYM4+1mqKEOGtQx6vtbv+p9Ug9rW3LyKWqs0cZx95567JAFLLql
         sDNVRoRmOud6N2n3bPcM+FuhU+cTK5lZj0JKrhw/wPeL1ikMDq1LXVRpuyh2AiFBs0+A
         Rh3Nmf1NWdrK7R/M+othRe6JiVjsiS1cRvRM8YXJiJm09dlkiZ/uk+2wJxHjoZepJJXs
         Np5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491767; x=1793096567; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
        b=mAeXLhvanluEkjo1PmluJSdlXstt4qTX5kS5IyN69H8ESLCM0C7Pxty8hpRlpRnXnh
         zxeHwIv8Esb+BwfrRoTbcsWwm1Etpst+Ydbo8/xnUYBmplXhjqDcuALWUSAO7N51DJys
         AyzhaaO1KuNv3pjCLqNsGCU1jUY3U1ygEUEZ3bpIT2riyBOBtdi0QBkSZtm4x8vjxpgA
         dRxD5+Foy1UvYXzADUJkVEcbG3jKtRWlvN8Q4dEO7WaREbcuJssfS5MVYKXpnojR0ivg
         YCQxSQIcVHj4A38duEzGY55qQQvuZTDH11WNXolbWDWqrPtYQ/5Oglpu5UG3KINeNR9f
         nu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491767; x=1793096567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
        b=nrSOMAsRZ9UGJMdUJNn1AUqmcvVwUP6noyiZhRJTg0PmUQx8akA7QGFforPhk8ajbp
         jsh8wsMJMJsnpPq7a/jnv4bhWOtz0wF9RiTItnnqDcwBygwSs6wiHmeZkIVwOm0sAKHU
         DsTQvXmAdjpmQ6gmPU3gQDQarvzHfjOaNnvtjcca2CEA/M97Y5UMVRLiRTwCuKP+7PSy
         ErW9gElHrZM0Bl00nxyIlKOxxWbLNUvBvr+igrJag47VxzAAMXyidFPzHcNKf6N56mN1
         F7WY9uoMZLoo/yRUbWRjo2Uz8qZXg2Q9UyyK7wqGWrmdhmNWTixIPwbII7agYqRKP/Yf
         wdgg==
X-Forwarded-Encrypted: i=1; AKwUvBxOsz9nBQ73Zmq1gebLEbP/vFiCiWvV4fRA5JJlZR+ZhJunBcJaOW+fSVBpFS+Qdo4/aKObP4/n9Pr4qy512rE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYwOEaAq0GvGdKrLACJZJQcPRanWdL6WRE/RGrKsumUGlscZ8R
	+7yc5kJfFsSc4cXswOgMKTwH1mZQmzqL9OeRjFWB38IVyvrIiwXJr/PSPVR982Xx4VcqGy4p5zi
	mCa8VuoNKlxew/ds0YvBybaXwJRv3SpM=
X-Gm-Gg: AYBFou0wF9kNOU7HKr6QdFeG1Yh6rcg/sWvq1JHr9duryK/3udh0XjRdvF9leUGhkQ+
	pXS/JcaOOVxyHgxi+ZiWe7saWh1uh2PtGebXf+6R7lDcQGPd5MCn15Y3PbfXihv3YQBu9zDpkzA
	UNfDkj5uqBwgj39DY8mJTE+GjvgA4z+AV7sugaFKbHLACBzBF0WpSaoq/L4D4vlziL3npWWh54K
	OnDWelScp2y2DBEcZa/W5KacWsIFB3MDFxL/9hlrianp/Thc9MoqPcZhGFPrEyEsaMwjXWloZ+q
	IyFVQXu/YnjjZCKsCzMJw9m4YPO0W6ORzYTP861OoTy/MnJyHI1vnfwmlinuRtwVwvNM+q55bCv
	xg5lvB08O0YGLdaAFcaSfJd3bPJphHWqv77q+s0vUR0J8NGg2ZjURidM=
X-Received: by 2002:a05:6512:114a:b0:5bc:f280:e7ca with SMTP id
 2adb3069b0e04-5be509ef7d9mr3121213e87.7.1792491767173; Tue, 20 Oct 2026
 03:22:47 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
 <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com> <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
 <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
In-Reply-To: <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 20 Oct 2026 19:22:37 +0900
X-Gm-Features: AclHuK-kxJ7GesuN76pq16qYPFjVn7o8AWFRCTQQtoJTT6S63wPtOHkARgKHwik
Message-ID: <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com, 
	aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch, 
	claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net, 
	kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net, 
	shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> To clarify: every I mentioned in my previous email was about possible
> follow-ups - not to be included here.

Understood, I will send them as separate patches.

> My understanding is that there is sort of a pending/implicit question
> from Jakub on v9: why are you doing this? is does it solve some
> specific scaling problem or is 'nl is nicer" thing?

I think the motivation question was on the v5 thread, and I replied
there as well.

My original motivation is to simplify some userspace hardware offload
code I am working on, and to finish moving "ip maddr" to netlink.

RTM_GETMULTICAST already reports IPv4 and IPv6 group memberships with
IFA_MC_USERS. dev->mc is the only part of the multicast state still
available only from /proc/net/dev_mcast, so every consumer that needs
the full picture keeps two paths: netlink for L3 and procfs text
parsing for L2. The offload code above is one such consumer. iproute2
is another: "ip maddr show" already gets IPv4/IPv6 over netlink but
still parses procfs for its link-layer entries. The iproute2 change to
drop that is ready to follow this series.

Also, compared to procfs, the dump provides a nicer API: it supports
per-device filtering, other netns through IFA_TARGET_NETNSID, and
reports concurrent changes with NLM_F_DUMP_INTR.

Thanks,

Yuyang
