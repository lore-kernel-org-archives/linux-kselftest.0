Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996334;
	b=dBIVXnvJUmRMwxDqinYDfXyWYUxZeH6xBdYfMHxV+Teqf450vnZDpFLwfLYTQolpceGP
	 HUPFbB90F3LusfK9kjazg84TdAVd+4gWSfMJ/QpO/3d6rWnhw71n8OOGjBV0yRNph++St
	 QYqCTvAqxg/n4B0G0Ug4coQPQo3oNljVJcvh1A6Yyh08zt1At9BMvNYwgtc7rcM015uJD
	 s2H7hDpyC3QyK/58oCQ+LzVKBjfo6Jmqj7FkKvqraOQcNwaazZfxhM3Jz+dsvojQvYqho
	 TTyPAkmtUa8/Km9qfC4UZGXBSCOdsPw9bs8HnabRNoIex2G/rOZ8jN6N4of0Wov310w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996334;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yTakoTBQpzpd8vPUGIJSVkaGOs54M8jR7qM+MgY7c40=;
	b=436rJHxxR1TRo7tWFD1q5MmJ9oh8ugaBbUfunk62dpQR7p6oBZ4bXxi63mv3PBY6Giuf
	 FfjzUUq0xd/NlG1NLY+UBsd3RStkammwWTLdohlcGn/63Yc9n5gv+qRTKoFEPwI+CIjLT
	 X2xeFD7DJghaq9fGdU8PGHPitmiSZwyC1Ks4onDlcs0AFhv0VhmlrzgOwQo+t/6p9ixAi
	 w2hJ5UCFuhjjfIkixEWQ25xy26q8yJIbUkIrqa/p4Okby/cAYC+rPdG2wcwZ/s8Ay/Rf/
	 6J8QTb9AOHDZtQfWgQizdMa7DKQ4FEMqaBnakIv7Hls4HC/DuAuxui1X35gEOT0rYSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv99oAGl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786C606A334
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv99oAGl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A85D1F000CA
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996334;
	bh=yTakoTBQpzpd8vPUGIJSVkaGOs54M8jR7qM+MgY7c40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tv99oAGlz1yttm+xb9Y3LzNYdyMOTBOW2gbWd8+u9RzXg4slRpQ4T3l0q2TngfMYu
	 VfVqLVfCpwj4RAYzIDtE3mHHQHPKB6NI5pUVo6dZGi/RbaPXUDLHcNPt9fuYG+BHTR
	 I5AWT6CpfRwf0kMpsPF2zAkLp5GNJAjaO9E2HoW3RhIFABy1E2jRYu0HekyyvxAomw
	 tqfqzE+sRjko8Walj5sJrKgJ34wLYfpYssruxoFVg91O/TNWQcMqUctQt2LctOswm/
	 S5xB1BQM1Sg3z4H89li4HCSq9+7iS7suaATHVy2zygk5oOtfw0ZaYB6mi3NZtRSx20
	 tbkRBBFqkLoWQ==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de2f213b7aso357951eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 02:05:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFPPvZRc0objrY9skFqS8QumwJek3JBvgVRMxDGE6XIcLjTZGRx1WL4wa7W3IFSnMH4E/jPi+u3x15w6pxF45c=@vger.kernel.org
X-Gm-Message-State: APuU4Z//3o4B4hKsQ65qoD43dbtuvNf7jv5ylA56Z7A3rxFxx7OjwAsO
	h7YZBT29Zpvw/ic4PCLN4U7LLWGsek308uWJcImkdJ/EkdIKj2ww1h9n6n8cgGMTcoDr53CuFot
	S3WnZGNoze34sjb+MqeH3rAxyTBwm6As=
X-Received: by 2002:a05:6820:f029:b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-71b18592d82mr1370427eaf.58.1794996333573; Wed, 18 Nov 2026
 02:05:33 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118022813.9778-1-zhiqizhangg@gmail.com> <20261118022813.9778-3-zhiqizhangg@gmail.com>
In-Reply-To: <20261118022813.9778-3-zhiqizhangg@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 11:05:22 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq4s=7odXcU3WxyuqjYw47Z8GUO6Tg5DMfaVJ+43fUD=Q@mail.gmail.com>
X-Gm-Features: AclHuK8K9tF4TVw7j3RjckE1HLq3h2lEhDOm2ORPcutWmaCCc-IEEsyMxD7ounc
Message-ID: <CAL4Wiiq4s=7odXcU3WxyuqjYw47Z8GUO6Tg5DMfaVJ+43fUD=Q@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: add ROCCET RTO test
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Tim Fuechsel <t.fuechsel@gmx.de>, Lukas Prause <lukas.prause@ikt.uni-hannover.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 03:28, Zhiqi Zhang <zhiqizhangg@gmail.com> a =
=C3=A9crit :
>
> Add a packetdrill test for the ROCCET idle restart on RTO.  TLP is
> enabled, so the first RTO is affected; the test asserts that
> tp->snd_ssthresh stays at the prior cwnd (20) across the first and
> second RTOs.
>
> The test fails at the first RTO without the preceding fix
> (snd_ssthresh =3D=3D 10) and passes with it.  A variant with
> tcp_early_retrans=3D0 (no TLP) fails at the second RTO only.
>
> CONFIG_TCP_CONG_ADVANCED and CONFIG_TCP_CONG_ROCCET are added to the
> packetdrill config; ROCCET is only visible when advanced congestion
> control is enabled.
>
> Test written by Eric Dumazet.
>
> Suggested-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
