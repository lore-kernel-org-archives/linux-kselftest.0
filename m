Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021340;
	b=PBC3j/OrRoyRtRhRSujHsL5oUzKDwPsyL0eDrG8xKxF2K8P1oMNdpIcWW53wTnv+CkOy
	 BBdrD+hZAEMpHJSNx4+jHUx4L8SjENwXK6hJXX5qV4jko66pzXmYpzpLT3aUcQUL13u7P
	 CT5eAO71uS/oOfmcFF2h/Td8lfVjSrFL8oaxaDyjNUbyNLQrwpzQwa6hPzVuKZK3+xk2d
	 beslMO/c67m0D9WmgZX/0cM9/KgWWAILIyAE7iCEsXK37rZLoAjeuxl+RIWJgr1x6Eu7h
	 2zWgW46YovNpmYsx/IKx2Hju2Eof++p+YZmhPU+gzSi7Wj4TL2bKlvlt7HGU/cr7kqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021340;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=04ULgjusWlSg32LjKqce99PoYE98Nn7GHteRBpuo00o=;
	b=oDJe5k9I+CYCE2Twm6HNj18Zf5S7g2zZhxXaioZx3ZzvKJvL2tj+86+6vT6GNnFJUjwt
	 otCzE2yygpue6rkyy5T6r/UoIUD/ZsflCRsgGSB/pGrHChd2A6VVGrwcOjrflnaOYV3y7
	 Lb8qZj1MS9UAjDMfUWWeAXoI29wBxQMVBSZYFeeHmdIVEcSt0wg5K949GSwXwoIAfG3TR
	 0XIOVe0HcsS/UHHNE8fMIQCSkfnSqvZt7Fp+UxBzO/N8zYujlfUBxNtFwz1Bswb170AVy
	 EqM8MfJZuakRUacEcK2ipMLhhwVvt93NnfV5+hpQBTDLHH5QtCaUKUWkAmgWYP2KEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMnAFsYT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85319606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMnAFsYT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5D31F031E8
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793021339;
	bh=04ULgjusWlSg32LjKqce99PoYE98Nn7GHteRBpuo00o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kMnAFsYTdeRlFlai4nhvqWF9NBW4YEJ6tnFv7BHj8vOhHyZHx8nm0zfckOofb/EHe
	 sA4kA8Yhyp5kwQg3lCKaHqbVjc5os9XfGijBFc4v+74SH/u10UrLDcbwASf73DX5Qa
	 L5Df3QZUZnywZIXm8py9ROWJGl67ZBsokPP1gpgERoNwf4BhqAs2qez7RtWiUhBGAy
	 wTpLAH6EgUXF2cU7QSSkIzbyv8/pI3qPp9AZN7iSTUi3xo6mang8Og+ObyTczfVPcI
	 7IZCNAuxk+txSpxzOBmU6KhVeKr/yW7kQ3EjbhDMGZw8+ZBl/2F8kUvW6dne22qjz5
	 iyF9xWG3kQW2A==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49ddddefadbso1310323fac.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 06:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8pN6mLLiJ6d8ZAzmPDol/tczYgxAr54n9AkSU2B3NxjeNlQ1R86hUo04ARu6c+hi82OVFw39HHlPHxoHHrcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVfJVnPaq9NCkCYp3lmBpqqF356MGa3bVEhhs5jRDgTboDkw4q
	ym6uut6z58OywQY0oOqqNvl9P9uReeav2KGQ4JZ+IOEoGtqhbA2rk7fUbLhM5glBcAmqwUrhshI
	eOpXqR7SAOpn9GZvolCF4suIdAyFLvRM=
X-Received: by 2002:a05:6870:3c89:b0:4a2:4c6c:c9bc with SMTP id
 586e51a60fabf-4a83f4eb527mr4042375fac.19.1793021338390; Mon, 26 Oct 2026
 06:28:58 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
In-Reply-To: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 26 Oct 2026 14:28:47 +0100
X-Gmail-Original-Message-ID: <CAL4WiirsfX-j2uP0HWq4dSPGK15N9GqjY6yz+fMFKreo=1MR7Q@mail.gmail.com>
X-Gm-Features: AclHuK_7Y8Msockoq5cYfVUJitRoh-SWV4M7WKxBOBmiLFfT1caFqcdtwGCa_Us
Message-ID: <CAL4WiirsfX-j2uP0HWq4dSPGK15N9GqjY6yz+fMFKreo=1MR7Q@mail.gmail.com>
Subject: Re: [PATCH net 0/2] Revert advertising the TCP MSS from the
 configured MTU
To: echoowall@gmail.com
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 26 oct. 2026 =C3=A0 08:23, Esko Mobius via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> a =C3=A9crit :
>
> Commit 2640e6419594 ("net: advertise TCP MSS from the configured MTU,
> not the learned PMTU") breaks TCP for clients behind networks that
> filter inbound ICMP, when the server reaches them through a hop with a
> smaller MTU: the handshake completes, then the connection stalls as
> soon as the client sends full-size segments. This was reported in [1]
> and confirmed on 7.3-rc7; reverting the commit on top of 7.3-rc7 fixes
> it. Details and numbers are in patch 2.
>
> The asymmetric (DSR-style) case that commit targets can still be served
> by the existing per-route advmss metric, which overrides the default
> after the revert; patch 2 includes a test of that as well. If you would
> rather keep the new behaviour as an explicit opt-in some other way, I
> am happy to test or rework this.
>
> Patch 1 removes the packetdrill tests that assert the reverted
> behaviour, patch 2 is the revert itself.
>
> [1] https://lore.kernel.org/regressions/4F0FAEB6-A13B-47F3-BFF1-C706686C6=
F64@gmail.com/

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Even if the reverted behavior was closer to RFC 2923 / RFC 1122, it
was a long-standing
user visible behavior and should not have been tagged for stable.

Relays should really clamp MSS (nft "tcp option maxseg size set rt mtu"),
but a revert is the right call for net and stable trees.

If needed, the asymmetric/DSR case can be revisited in net-next as an opt-i=
n.
