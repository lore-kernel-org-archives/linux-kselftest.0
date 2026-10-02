Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880FC478E5B
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935534; cv=pass; b=VVe2nKYW5JvQGC8YYSq3rIb2Ko9XGuLg2qYpzb2wXqAdjLBD7t+z7Oc0Ic/7getU8yQgXBXZTZXeKZmJ1eZC5HkXIMBaAamQ8x5xTpGnSEzPJroCko0CAAj8leTrXEY7j6119RcOGWOf2r4BAPSykUe9hDzfpUo90HmZrITDzLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935534; c=relaxed/simple;
	bh=KpRkC7nlG1sV7SwjB4i6DmP6K82SrvV9/kz1iBtQzrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLs4LZS9DAwDHOmoBBFjK6NvU1Ey07Qu9Bl26TVAAeBOC1IebVOAw/eU72LroND5LVjbgx0qnomXxnXmMir1fPOlChpP+ZTi0TNZMmwqTwHmJsTSgNElt2212N5XN3j3swBBSTrWXKKkiQy4QVSQjqgNubPSa+EzJQB5c3jqLA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwW9ak6U; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwW9ak6U"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so71466531fa.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 03:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935530; cv=none;
        d=google.com; s=arc-20260327;
        b=Hvc4C+EjYKJxgdt3J9C3U1fbR/d91n5vw8kjxC1Iqdr3qLH0ewARlLWRzn+4laQzz3
         Djf+5wq2bLRxZY/bnMPkorqxz0Ml6Tw2nUq6XwizSvBld+CGRs0nbrydZ8r6gPv6u5U1
         pcU9yqlHII5xbnKuvJnApB2BP52g3zLw4j+kYoi4olC8HI2ZmNbHpPxOxwU3pQfbxIeV
         hhKDxLomz5ibWKN+IyWBZqMQeJ+b/7V8Uds9n3wsiqt7cqf1io6AIc3qrEqjiAiUqkd5
         wNjp2mRYnwlf/x+4659UooiSZVze9KNlln8HkppxMvqSJAVak+D0a0RORCyNFvf5fxJj
         PIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrEmBqIQ5U75wKjWXMmdbPNpi9eyodu4H+Zn5/tv004=;
        fh=ESSYJ7VfcWJYDL7qOroXeG9XL2Q5PG3FiPNq5Fu2nFQ=;
        b=Vueu8zE4kHnB/oZ/iKMR0EzOfvFVWzufGRRh7nrs9WP4l1fW4XWhkGO5jh6am68jKd
         fPKbafJSMqnkwXf/CRHAcCnNwm6Br61hT0cKQtu58kI1oZXZEk/njXYaxLUEVYugi2D0
         S9XM6l4dFD8ACjsfc5S1vzvy1NIXThOPK9xCDoEwvM4rxQMygCZuePC86eCUBfX/+bMv
         trcU4AvYQih/qVFMfB0O6VcGjY6pmnLuI+aA5RVALC8r1eFvQ4XCkW1m5grTWiYcekvC
         kPy3u8O/8x4E3SV10+s30KvvcZGaXYR+3/MBgRyjK3V4EzwlltwAcdeSWiz3INUrrpl7
         vpPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935530; x=1791540330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrEmBqIQ5U75wKjWXMmdbPNpi9eyodu4H+Zn5/tv004=;
        b=NwW9ak6UOQPxpFv/FmQerM5MLjLv+Ncp8wyBfFhNHr7Frmo3D5usdQAcvL/0rroVNY
         k8YRj8mu96jsANBiMFziP+PGFl3rkflsa2oymXeweFfVPAqQRx5ZOzgRo4FOeP433MZb
         2u8noZ13OVp2e1qYqAHlH3EOsvLAw0vGyINgYv9XzZp6b6p8cnAFA5Uqirb4MXUhrGhr
         GaZWoE0JwWsLRbsNKwi9pPN9b47YBDzXIxAhKCOeixsdJ+MgXTFgzAobrZ4MZlnbYlO/
         VsDZg5awe7FQliyPFAyZnpXLZEnmJvKNubOSTzu1ulwni3p9z9gq8GUgBqYXfu1pbv7/
         1XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935530; x=1791540330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrEmBqIQ5U75wKjWXMmdbPNpi9eyodu4H+Zn5/tv004=;
        b=egfggkL/II/ASrYgQvZPatnCpLZVP+CcLwdogi0JLEwBegnwQgVIcq9lcUyANZpoDc
         3lHNF2WTB+biiJYSYBWZ7i9MtjOWHspuvYGH5VamfXa+4QKsc4O1381tP0aB5VZnm/2p
         aWYeto2Yw/SbPXLY5s8kJdNqOo5mEU9GSlXbITd9WD9Fu+L9w/0zeNF7Cj0jZwZMYuSZ
         vpV7tnodszWGXX4LFYvLJyqgkdCrM/wZnretJ6jca1hKKwZDV3GTZvVT0k2xoNrAUxtm
         ibTH61EGjn9uvjCU6y2zI8d3c1DVsOm7gH/svCvOHWIQ7JPw4Jo4+7xsZ4l4zJI3Mehs
         RuFg==
X-Forwarded-Encrypted: i=1; AKwUvBzEVDZw8eTS0tvV8bzcLys6DK/w1dCluomN0UludDTCi76PPBmbOB5XflDyVtsj8jXSnvHmj9kKwOzCM8WeE0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLqIdJnkSNORA2okhltsMMcYDxMLzEeZDNm+00i42o7YrK2bTk
	HZOWXo2MisBGYk8UfSSRPGmZmoj+o+H/GCfvAIltRcEMWMSo8xOItM/jFkgnj+aSIOqpuZZaeXE
	B3A8vEmNc2+tm7VJ94Lsch3xs4EZe+zA=
X-Gm-Gg: AYBFou22/jcy6of7FdqVwJYarOmOpM5J5EQJaH8XSv0gviHpCvV4AHgYfkoALz5EsMq
	/L36y+hEyEfwBItLfjYbzLlQmEeWEz7/Gc7v8GxaFl7sxq7mdDS8t8AO0Kd+nYhyKSlo6M2XchI
	Mb8S0MakdICxPEEUqePMM0kuWKaILGblAx6pn62VCI6Z03Pg2RgxNQo+LxKI0zdLkBpZ5QFsDdg
	5WdIlsP+AIglL5bIHZHtzHX2i+01QNhQFmEdT1OABYUdnMHPKMeokudnvOi9ieyJqaYv3A+whdU
	1hBQ/ftxFeWm/H+59he7WeqY7y0yFe88wdtusaiV2T1MD59Tc/8uViS4gY7scxkweQPyO5LQZRq
	7n4IZxkSs17M=
X-Received: by 2002:a05:651c:1442:b0:3a3:42cf:c014 with SMTP id
 38308e7fff4ca-3a88765a8afmr6175741fa.7.1790935530006; Fri, 02 Oct 2026
 03:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-2-sigefriedhyy@gmail.com> <179089747717.434549.10025971158678601177@kernel.org>
In-Reply-To: <179089747717.434549.10025971158678601177@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:05:20 +0900
X-Gm-Features: AclHuK835RXya2QRfyWHcfAV1rz2yv5rXyfDJb6TRXTUTekf2P7RB2gM9v6I-4Y
Message-ID: <CA+7S2vK-rJ7oJ89onostQbPeNq8A7rLgsd_=_D2AZ27Bg3Dizg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] The commit "netlink: specs: rt-addr: fix the type of target-
>   netnsid" fixes a bug in one specific earlier commit, but its message=E2=
=80=A6

The Fixes tag was dropped in v4 on purpose, this is a spec fix for
net-next, not stable material.

> - [Low] This problem wasn't introduced by this patch, but after this
>   commit rt-addr.yaml still lists target-netnsid in no operation's=E2=80=
=A6

Pre-existing and unrelated to multicast dumps, can be fixed separately.
