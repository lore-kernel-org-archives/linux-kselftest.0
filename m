Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726521;
	b=FCujQMW9rSIMBp03ZEb8lvtGr9xqCbiGr6fU9CM3Si03tJ2DzcOebBanvg0HvObf8gkE
	 dEDEe4mYeVVaYoybZNHDm2QWD8GAV2ylTESOfcEMacmSLdTzbtb3ejQFePG25xChvePtB
	 +//TY3exrom68qlJn4mb8bhCaN4uTkOpnfxC2t2w9uCvj/ilnKPApgJ3EKafzLBcVfKJR
	 MZStm46vRTy4k3/dgpoROjghiB2zDFZUZyY9jDsSKbYTTAX4KXFyvHJxJKdPBw3yjtYAj
	 yMaXEdt3BlmRQZqyanEiuaYlo4xi0mxOzTz4Yiz4Tgi01iiyreod8ka56w3P0UUJFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=WG8u27/WmbWF6C9WqnFdauWWHkIDT4nMCSatNf2Dopk=;
	b=C2T0z+3aVJsFjINJ+PGvEg4CvwpaWEH/ugJqEGQDOnj/lky0d/FiRmbN4wSUaM0leSQH
	 lN6egzyj69pl8qg9wjTnAqXa9c6KTVs2edDt+f96OQgZf3X0auJtusR51F5q3sjeHpp+j
	 TFTIZU0oxjzo8DSx6JI0YkwbLZkxDwGxofvF385t52PYopEsmQgrv+Pr8/hR7xDIs/uNA
	 RQQA+Bbdwfx5SPabxh+OSs4WCJLdGlTCkgf+GLsT3LPfaKXXSJcEFXMVpspPY6r7bpRd7
	 WrTx6R3CtdeJ5CVtm7EngWMK2zQxiYYb0gq11rgTCZZmvZNw1DCI83bpk8Dujt1p42g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRk9pbpx;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531A606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 20:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8531A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRk9pbpx
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f037bc348dso58949365ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 12:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726521; x=1796331321; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WG8u27/WmbWF6C9WqnFdauWWHkIDT4nMCSatNf2Dopk=;
        b=ZRk9pbpx1qYIlFNLdBpTk1l5ax99IpkBgvxNndr/7zOBPE6nwy4dYpgboyM6myBcfh
         Mi6xXUv3+6WgJDwvQwrPwgFzyk9MtzD/rI3kxjQIdCGy9DoJ8BjUgOlrri1ZmEUwaiZf
         GhaPLezWmjAbMscLibq+ydYSoMaq3aVttbOp/ZKZpLswK4/QVdl4WFEEsg5DKXMC6+1U
         y+2P5zEzVaqP3Vju4lAasWaBFSECJWxeHJRlQ7x3rlCK609SjbO5ErXa3VRVUYBnkYU/
         c4o8lMyCUXE6bprS76giqjnE5nQCcW1iw1M8Q6SAshZ6wIl6nn8AQT8HNllqw84pqxwE
         qXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726521; x=1796331321;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WG8u27/WmbWF6C9WqnFdauWWHkIDT4nMCSatNf2Dopk=;
        b=XOiW9bc2ss34RmAl8EZTMpWsC4aQmpSFifLRr/EMFzx3NLwvnIq+/8yYrVyR+a0RGZ
         AIKaZmTN+3RVJTORDsidYcT3nDR3n6veQNqQMYpEATMXU6ihY4XZ+ZRWhY5KKmcKp6/p
         G9G+hEKQu4jLRARvXr8o8bj6y+bMzGpSzdc/AayehDbO1q2ysf9rIG1ON88yWk+SztxJ
         G9qWI+siU2fex1FxGJz1cy/YOq/mwahjwYjY2Djw6fbqQagzBb4iFKBEh5ZkoL0HF+wx
         DzfIVQs+YXf6iJXy9qn9sKE9gl0VAu+Ey95bwQBZXZjf68zo9LhewfshXuSCpihQ19EU
         iQ7g==
X-Forwarded-Encrypted: i=1; AL+hErFFPubc8onbZN9Ngxd33IsP4a3bbtgheAuBTYL8SATVRhwWR1e6P6kxUFH+hkVfP4X6iwxbo30cT5myHcjSIv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MMhqfEB7XJ3kSwm/YWH9J7b7cqpEqV6+62HfiwsksUY0dv7hr
	QLtALEm7E3+gwuHDXdzGWKobnIoB09s/7vhcayZ5edV7AuW9yHK64Hb4
X-Gm-Gg: AZFdTZd4nJ5mXSBjUowoL/jUzFOJnNwOhnI3ELvZtfrlrVSFDb3Z6d5gfXBk0y9Cv8J
	5X/xAi2yLigFbT8lhUTsxno3B0M2iYOVLGHz4sEHeWi/n++KrRISeSG4jl5roEqZLU93E1wx5u2
	hj2MpBNF9vohiSsvFyES9fFRRZgmbliCal2OMOIVI+aRb3eqrMY8EPhPA/JYz0ZDZFDCl3FoKT3
	QHIMueEKJUR4Ia4t8ZNdn3sS2z5jCyWtyAo/lV1SHifKEu+vh5yLf0rrtKN7Xuv3O83jPG/Z3n2
	IqcITOTd+DBXZByiOfXSyNLLpgkWOzi49Xv0c63zpXTeiR3lf/gF+9/8ZUKn2VfLfW6i5KYJv9q
	jOtEQp1BJ+bEwnPbxcirqR324RZHMMhYUBltBzNQgbIGNA7/OrttYkmVPZ9Uv8fjVf9m0H/hERm
	DeQ+Kkj6HATdnN/HEGLdzM4YExm6JUlY6Sh7W7LeZnmBOt7a5Jo3OeZRzgmCiaC4vX2pvPo73tX
	TN2NEgiIpTjwLgrulyHAqELGWIRoS7TRr5HR87DNB5KFXuoEBk30aelHIaKRzEs4cAkV9sgb2B1
	aQ7Lzi4QmkV6n/5027mQjiFC9PooHl9FnxLJQpN9htp6VgpqZ3YQ0nAMkvd/bKeGz+tbYFiDlS5
	ywEqnBiTW59vE2Oh8CjGdacFjJblP8rUBA9gT4uAPMXSJH0GCEg+LB5o=
X-Received: by 2002:a17:903:230a:b0:2ef:e755:bba2 with SMTP id d9443c01a7336-2f03f2b6004mr227987945ad.62.1795726520672;
        Thu, 26 Nov 2026 12:55:20 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04913a77csm100950515ad.34.2026.11.26.12.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:55:20 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:55:19 +0000
Message-Id: <DN5FXAJD2B7T.26NBT62PWILGJ@gmail.com>
Cc: <jiayuan.chen@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, <bpf@vger.kernel.org>, <netdev@vger.kernel.org>, "Tianyi
 Gao" <tianyi@cloudflare.com>, "Octavian Purdila" <tavip@google.com>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Alexander
 Lobakin" <aleksander.lobakin@intel.com>, "Ilias Apalodimas"
 <ilias.apalodimas@linaro.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "Lorenzo Bianconi" <lorenzo.bianconi@oss.qualcomm.com>, "Magnus Karlsson"
 <magnus.karlsson@intel.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "Simon Horman" <horms@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v8 bpf 0/7] xdp: fix page_pool leaks
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>, "Slawomir Stepien"
 <sst@poczta.fm>
In-Reply-To: <awbq4F8pF3YSGX2D@boxer>
References: <20261124104016.532341-1-sst@poczta.fm> <DN3QVHST3PUQ.3NINFUW0FL9IW@gmail.com> <awa0fvxzngTtIYVd@nr200> <awbJFmKWy50Dp0yS@boxer> <awbq4F8pF3YSGX2D@boxer>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 06:04 AM Maciej Fijalkowski <maciej.fijalkowski@intel.com> wrote:
> Nothing leaks with your diff, it is only about recycling, so I'm fine
> with keeping it out of the fix and following up in net-next. On top of
> the on-stack rxq it should be small: for skbs veth copied (what pp_cow
> tracked; an uncopied head is usually not page_pool memory), keep
> MEM_TYPE_PAGE_POOL in veth_xdp_get() and take page_pool refs instead
> of page refs. Unlike the RFC, which keeps skbs as skbs, that preserves
> the XDP_TX/devmap bulking (the RFC loses 8-17% there [1]).
>
> Would you be OK with that as a follow-up?

I'm not sure whom you're asking :)
but makes sense to me.
net-next is the right place for it.
