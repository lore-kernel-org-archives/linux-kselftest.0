Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9253998A6
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166035; cv=none; b=pUDi80bTjNVHpzeXsTta0a3kyPuyisGW7PAcwcj2ORWlft0Q3QUGXwnT5QUL2MUBBhuASW9CELKec2Zq4gHxG+dYeTnhF/ZqbjoAUiLosmSi00iDrXcPxqIDQLZ5fPu8dgXzXzf2omxYTXnaWjK9lROkOSmWXp47wZc4yok6ya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166035; c=relaxed/simple;
	bh=1XeOmQjiCmitTcAp2U7m3O2xukG+U0k4mys23LN33m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNOQ0lDHFVqK6pq3J3NStKRcowjxmT73ZOMUOeJjsiGPXLXxJYKVrWKgOfD7JKuoXz5VBoCjfspPDP2InADUHhmvCjIIxZD9PRivAI6+HacZIvdrzB+xGREhyAJ8s88JtXiW3P/F9MXVxV0fFBsmTyuULo0uitf3Y9OqUxUxOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDdCgNVt; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDdCgNVt"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cbb92a1213fso895027a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166034; x=1785770834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PA2a81BeXH83G/BeP/kggUZUVWwJJJOgGGWCxqitXXc=;
        b=XDdCgNVtCzEAe4yqWh+ezwqETD7BGhvrYizMdhpblNwmZRah5lPcDCT4JAmYrLyDJS
         gi+ESZzsTA13ceDM+gHnIaUNPlQuyZhSUZx8DMJEV0hCtsWtdLSxCGI2CTf4kGBHWumQ
         mbjp4BbzDqNWx8wY+s5pW8UvEXIlAY9C1Bbhxdo71h6kBDOhVEbqUJqOlsAVLxGSB+X1
         zO/VJ6Sf3+LpM3IggwbKekKkhAqgsmc9zif2NT4+Ds/2C7t4OVUG8BVuAooF8UhVL9oO
         eueQO7QcvPz2qaG4aYDdC/aV1W3W0JV6Nrldt55gj+iGNa0KNWSKkYQE7xm4ucKowKJm
         DA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166034; x=1785770834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PA2a81BeXH83G/BeP/kggUZUVWwJJJOgGGWCxqitXXc=;
        b=BpHLGVvSD26sP8Avip3YR6gh1BzET1bPcvua4x+lLnaxf0U+L52j6oyFKfCvZ+usHR
         WsuUsjEASVAD4A/Fx8mfey1TEvo7Q/UAivTkw1umzpBMF4MgUKLeoT2TCAZIrZqTU3j8
         do6CDQEmdC8HjCK8jy8+X9HlVroMbUxp1qP/KqvRfuMtt8HiId9k2/XGMlddUk8LNg0P
         rgPz/LYGGv0yO2NmPihqPZAGOwQq97gqzqjDDsFFPpLu34eter4Qm1C6jjKyPhAsyMd/
         d2qju6EeyUgjFhQJ2FknTS0Cwp836EA+CULivTaKXLoEwXElshalVj/DC+4kzGCYjXSz
         MFvA==
X-Forwarded-Encrypted: i=1; AHgh+RoSlDSVg6qcp0lXoj/JfnQawQN0rylQtP/jWtSCdcEO9g+oHB3jQKMxqmCNakP8aj8+bDUjbHEXOelKY5ndNqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9osJV9aidzc89E6hG2Ub2GBjiHCX/7HxZwDM7JZ47gKXA6w5f
	zx5TdPu18/BtQ3YbDtqRPcJpdL9ORydYsd2kqtkwr2uJvp62kuHjc+Xw
X-Gm-Gg: AR+sD11z5Oz3Nitu5sv7/Xrr4ZE8BEiADxoQj+vvPA/EjL8hnYO/7YnEkmTG7SpNEUo
	liYi1a7cIfxgrKtgrF4rRTu0sXiebUEODth5O51/57//hT8i1aftvgS2X64tmzvWOx1+e7daydK
	NuAZcU3Ur5WOS75GB63UxZ2/LQWz9ILS5sr/PShiIOKdsVXgGsc180VG8bAS7yADWWkWSxjIp0c
	8T0NqBbiIGTyjfhh6+zkeFvAhyYU0CgOfQ6ACyZ0U21hkXKLnQUtMLS09nFyRBX1Udv69UFPkxc
	frFe+/g0LBY5aO+AQ1AYPkPmf/l5IUz9EeYoZiSSlJbPBBzW3NKkGkPbZqXx+S9HgFi3TjWgdk+
	ABtp9AQKcrIJM1ZnTtCAN0ylOwkuwdkJxWsavzrxgQaC4rCHmiV3KZzmKTgyB39nT8rMjSZs=
X-Received: by 2002:a05:6a00:8018:b0:848:41e1:473c with SMTP id d2e1a72fcca58-84e595d13afmr7024673b3a.72.1785166033675;
        Mon, 27 Jul 2026 08:27:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b2cc2sm3364331a12.17.2026.07.27.08.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:27:13 -0700 (PDT)
Date: Mon, 27 Jul 2026 08:26:16 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: sdf@fomichev.me, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Remi Denis-Courmont <courmisch@gmail.com>, 
	=?utf-8?B?UsOpbWk=?= Denis-Courmont <remi.denis-courmont@nokia.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com, =?utf-8?B?UsOpbWk=?= Denis-Courmont <remi@remlab.net>, 
	Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 7/7] selftests: net: getsockopt_iter: cover
 rawv6, ieee802154, phonet and tls
Message-ID: <amd4ka3u1X80rQsZ@devvm7509.cco0.facebook.com>
References: <20260727-getsockopt_phase4-v3-0-e89627544639@debian.org>
 <20260727-getsockopt_phase4-v3-7-e89627544639@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727-getsockopt_phase4-v3-7-e89627544639@debian.org>

On 07/27, Breno Leitao wrote:
> Add fixtures for the newly converted getsockopt leaves:
> 
>   - rawv6:      IPV6_HDRINCL / IPV6_CHECKSUM int paths + a SOL_RAW
>                 unknown-optname case that reaches do_rawv6_getsockopt().
>   - ieee802154: WPAN_WANTACK dgram int path + non-SOL_IEEE802154 level
>                 rejection.
>   - phonet:     PNPIPE_ENCAP pep int path + non-SOL_PNPIPE level
>                 rejection.
>   - tls:        TLS_TX_ZEROCOPY_RO, the TLS_TX crypto_info round-trip at
>                 the base and full cipher sizes, the NULL-optval and short
>                 buffer EINVAL paths, and an unknown optname. It skips when
>                 the kernel lacks TLS or AES-GCM.
> 
> Each fixture pins the returned-length / errno semantics across exact,
> oversized and short buffers, an unknown optname and a bogus level. The
> semantics are unchanged by the sockopt_t conversion, so the tests pass
> both before and after the leaf conversions.
> 
> Acked-by: Rémi Denis-Courmont <remi@remlab.net>
> Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
