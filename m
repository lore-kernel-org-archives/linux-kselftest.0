Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FDA3612ED;
	Mon, 11 May 2026 23:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543971; cv=none; b=eD9uZ8VxhWWf8k3svko35IBD8CP7dcQulMQ2DscK4JfdBvnd86gTXyxyyVPvNtxOImY61l5RVb+cQCgb9FV5Z7ZmPZ36Sgzgj1a28Cnl0AlA7+tDDkoWMnvIeuWtGyMoYhP4YNn9CY5jZgEQ2hx0Zdzd+AQEHk+O7lcE/4aiLHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543971; c=relaxed/simple;
	bh=OOezJdOY2CaICsn492imL9pnwELutNX20BeZitAgQiI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jx1dcypiqcymiHD/nX7vz6//eioi29uDdtFc/AqEvFp0xAs51T8oTgfOYcWmX8c3feywVwNrS/gsUuRa81UM3I7HadhBWbx2oOgTJi6TJo4oNwTG+NRQlrY22Oofjsv3ONZehc1FMeLkGW+KwZ2ryrAsw8r/IcYiEMHrouFs6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQHND40Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQHND40Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09714C2BCB0;
	Mon, 11 May 2026 23:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543971;
	bh=OOezJdOY2CaICsn492imL9pnwELutNX20BeZitAgQiI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EQHND40ZiFWaqBVBpzKZg8hhRxoeA8e7pv9gtIVHIamMk8JoJLZGfPMNFfCXRRhgn
	 WE0BbYOyLUcAYpKzKoyruoVyHx64HJO+z0d0WVvq5u+qm1cQ0krL3K8+dEwyp8LF3d
	 t8UjF3HbllDqLDBPGpUc8AOG2KaqcNFWOqXqrapfnLHda/6jRGR7mezS1F9e6C8TS5
	 ezJswPsl3sGWzU2xcQzE6rfOvuDTlFqMmltTHZh7yoiPMLLOPQhZWVAoZSkg2GvQNe
	 Tg7AdD/UPlwHUpdOwYW3ZqyepX232dfEAOvFnTN6b1B9c4tlFJqmYSuvxveDqGMgfr
	 M6MVmdQr/Vqcg==
Date: Mon, 11 May 2026 16:59:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?w43DsWlnbw==?= Huguet <ihuguet@redhat.com>
Cc: =?UTF-8?B?w43DsWlnbw==?= Huguet <ihuguet@riseup.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, Filip Pokryvka
 <fpokryvk@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] netdevsim: get link via ethtool, set via
 sysfs
Message-ID: <20260511165930.14c7b6b9@kernel.org>
In-Reply-To: <CACT4oucitAa05V11KD0d2mQYc7h1L36zDGumnRYXn6+6XUa=QA@mail.gmail.com>
References: <20260510164337.7611-1-ihuguet@riseup.net>
	<20260510095246.5c8f6d0b@kernel.org>
	<CACT4oucitAa05V11KD0d2mQYc7h1L36zDGumnRYXn6+6XUa=QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 May 2026 11:50:32 +0200 =C3=8D=C3=B1igo Huguet wrote:
> On Sun, May 10, 2026 at 6:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > Could you please explain your motivation? Feels quite trivial,
> > so it's not immediately obvious why we need tests.
> > =20
>=20
> We use netdevsim for some userspace CI testing here at Red Hat. Specifica=
lly,
> There are some tests that require reacting to carrier changes on a device
> matched by permanent MAC address from userspace. As veths don't have a
> permanent MAC address, we need netdevsim for this test case.
>=20
> As you say, it's pretty trivial, but IMHO there's nothing against it, as =
it
> will help to resemble better a typical Ethernet device.
>=20
> Note: we know that there's no guarantee regarding netdevsim's uAPI and we=
're
> ready to adapt for any change, but the truth is that there's no reasonable
> replacement of netdevsim for these kinds of cases where veth is not enoug=
h.

All code require maintenance. I'm trying to push back on netdevsim use
across the board. It was essentially a workaround for us not having any
real HW CI upstream. But that's no longer the case. Well, we still don't
have any crypto-capable HW :/ I think you'd be better off implementing
whatever you need in a small OOT module instead adding fake tests
upstream.
