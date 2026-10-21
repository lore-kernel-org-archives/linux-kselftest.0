Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792620440;
	b=BnhjlnuPm+aGJRFPOUAb8g2oTx8VsEkIi2Yyu1gqGHsdR43LeJdT+yblv8gPkJFVuBaO
	 hpWpeFtFLqX8uZktGVtnQ1rZXF5a1oz76QoSh03vsLaL5RkUxVS2gLqmxf+JxhFwRIlp5
	 eNOzlbd79Xvt/wdghVJA3RCWPfIUCTp1EkbeuF9HuFFIlXUxYjSuIEUeZFvg9x/EzGHxU
	 qYIL21kZVEvZW4duZmZlplB/EWkEyODb4kGz/nQ/f9VP08DpHxgJ5l/JpEhoBN/qhH9X2
	 FcZvKjyTNavC2JcOXH5J0Dn/FyPeRprA6tYThixv/hs8KarqUaZarwQCJPcLQHbgmTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=C0u0/9pvcVlcUIo5ZldC4VZN02KqtRcVCReP8bcjUq8=;
	b=eIFg9EHDrsfsLFSGV8ehHRMvWy2LkF1FnXs3xQiMRiI/uoJC4ZOy+C7LXcuseRwz5ovf
	 ycafwsvnnRasZviFa3qksCuSBj6QvKX9syG0R4zARd0wMATEwC2G+tVKmYhBbRmGZtHw7
	 sD3/lCRWSOM2DiJW+6eWOsuIbhJBzqJIUeebKHGxlFDmagE7dHKj8VmV8bfiOIYdI2K4K
	 dWO6BZ347RKi3L1YX4egZxWYEjlnsPFf53zrJX6hnNP5DOsiEDktB5bJinGNbKvqybyxW
	 K3uSG9jngtv/NWGa5E3rDd8TISZuqDhE6NHwKPHiIFUqxZfRxwIi2NQeJEFcKNFU7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iRad8MFx;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC3606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 22:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iRad8MFx
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cb9e9405fso63269785a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792620439; x=1793225239; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C0u0/9pvcVlcUIo5ZldC4VZN02KqtRcVCReP8bcjUq8=;
        b=iRad8MFxVjg0EAUy3IIiedM4z5AaJ0KF+bdAh23ReapVskGy6lW8MF+8yIfjjSS0aF
         fayr/nVOBitMBPlohzM56OTCfr1jcAlH72nrGtZEOWzPF4S9pTeI9bblaGjDiE6HVvM7
         9KrjlHfA3hIAl0jkKI8I4l9JU18y8pq7Du8iaIACRFZwWfAtpvglpzG7EDMaWkjeFusy
         /jvE0eCF1+6aF02vzsK6q34Q51QnAIw4+PLbW5jnCcAGE02CC8DAdk4qP5vFveQhCi4Z
         mBaRmKM8JAvYRBQ/23tww+CP7wbZgleUhJ1mokp5nS4vE4kYnVPOCn9/UCN1PuZLkOgy
         aczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792620439; x=1793225239;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0u0/9pvcVlcUIo5ZldC4VZN02KqtRcVCReP8bcjUq8=;
        b=DbH3EGjucp+lcUYEzMJIstYUjb/+rx7M7sRIDoJn8Nf5LVMzgifOI1NfaVrnKe/8Gq
         /envMLgbqNZVqSvpbqxYVkpZQVtAELeCEdKBgy9YNTQEDMl9fxhcr6CM9P/NPwcPXJcm
         CUUhg87/DMwBolsJoB+SV6cUke8bSc1wppPFWkpKCIrIvqNTT/wAroX6IoE5wv6fmBsw
         UegRPiAapF3TntQuQiRNxyxluLpuIMm55Jw+ePjk5AtHFQ59uQq/6jJFeXzUCkrlLMW7
         2z70Xu1syhsAyLhHUaU+nqUVBp0tVSRdjgLCSPPoM9GYBRlET4BjWeWft9yuvv2NG56N
         ErtQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7+O0iz968cJTzy4l7mvzUsBjYnRX0ofgH2bLgqWnGgcl54kyIi4CiDF1nwQS/iV3TAURvI/SnIrpnXAl2J+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/LnSAL51KWSDcQHlTQQPL3yXA5RzHotbjWtkbGwWJyElNI40O
	LzYmiD1/lLtsG1UsXzJ5Ogv6pRl1fU7iIajoMIbSyGy2Ob5GI+jwMDjU
X-Gm-Gg: AYBFou305+tOG484RGPX+CmbimAgQyRJ2ikkG+X1nY/BWmalH82KHJDNNrqJk+tR3dD
	+/I79BL+PTD/Fr106UuYPbnUJ4XuUaddgjAuIdcTGMmbAHg2wyvf8WDAW+U4lNUt3L8/WhexhiW
	Npyrtp4MR1gqviJdd7EDqCVdnt46t4BOZ60c67FVwk0exWJnzPErd4oWNGf3VlQQ2KsbpXH+oqq
	DGI1eiUauefXHZQ6MYg5UdaC1Fhyaa7naaQ3qctMmkU3FMVkb3hdRJ2H1C7M8YvvZ3KOt+sr8RC
	Ez+2ExmsnLDdU1zIwHxrNiYcVD6s5RoVsnu6GNkhEFQJpM7tHNDTfhglSVspezv1XGms/nWREXl
	e5SY1zjkbAtIofC7eUiFCs8rCsGLU3GKbehLiGHLQ4Op0ggTMJ6TfkWYRhSQWnW8u2ruTOxgW0q
	TNUtVzli2nZQsu2AqCIHNIBWxYiNHwvqAIW3lWhPPmuHriXyXy2+G9EA1kseL+gCUZTzRdPP74D
	y0ASoASidENVHD6V6eTlttD3MyV9J4KMoASf5/CLbjqR2hNI/vnsOVU27NFWA==
X-Received: by 2002:a05:620a:3188:b0:93c:68f0:f09b with SMTP id af79cd13be357-93f57ebdd17mr685263985a.5.1792620439473;
        Wed, 21 Oct 2026 15:07:19 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6f16dsm365188585a.4.2026.10.21.15.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 15:07:18 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 18:07:14 -0400
Message-Id: <DMAUWQVPIVKP.1QAK1YSA76EHJ@gmail.com>
Cc: "Daniel Zahka" <daniel.zahka@gmail.com>, "Jakub Kicinski"
 <kuba@kernel.org>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman"
 <horms@kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>, "Raed
 Salem" <raeds@nvidia.com>, "Cosmin Ratiu" <cratiu@nvidia.com>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261021210200.788191-1-toddfreed@meta.com>
In-Reply-To: <20261021210200.788191-1-toddfreed@meta.com>

On Wed Oct 21, 2026 at 5:01 PM EDT, Todd Freed wrote:
> While working on adding support for socket-less psp associations, I
> noticed that this case was not being handled correctly. It will be more
> relevant with that series, because it adds udp support, for which the
> psp nexthdr will be taken from the inner packet.
>
> Since the tx association encodes intent to send encrypted packets, but
> because of other configuration (socket options, routes) the packets are
> sent unencrypted, sending this change as a fix.
>
> The first patch drops the packets, the second patch adds selftests for
> that case.
>

Why not just fix psp_dev_encapsulate() to put the psp headers in the
right position? With the self test we are going to make PSP + ipv6 ext
header =3D=3D drop part of the uapi?

> Todd Freed (2):
>   psp: drop transport mode packets with extension headers
>   selftests: drv-net: psp: test ipv6 tcp socket with extension headers
>
>  net/psp/psp_main.c                         |   7 +-
>  tools/testing/selftests/drivers/net/config |   1 +
>  tools/testing/selftests/drivers/net/psp.py | 120 ++++++++++++++++++++-
>  3 files changed, 125 insertions(+), 3 deletions(-)

