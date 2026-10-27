Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117851;
	b=IE8IlETrz65AG+acPA7+BXm21oXrNrIaGwIVdV83XiOn1hhi+wD46ja13fz4Iy8oMKno
	 mVx54it1prwb0yeEjCh32MI5oOqHBewBn1lZ8RTLLRdR/QBkkh9z5wLSWbxsuRbcZYyVt
	 07T5kzOUyrkAwW+l2Z2B+ShQPuBJ4bwdMe2VIvYezw9NK3oXG748ezDaGsvtM5Lk3Bv0j
	 JOzHIFRkUyCOdbqVULUiNxsKlGZQT0UUqKuQzD4KmgSHO079EiaoNRizBE7pOdb/7YFpW
	 BYj5ZQimYTYUnMC0du74laN8QP9/e3/oVCnBUjUJc35pjf43qsg6HyGJa1Ja1Ou2JjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117851;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4+5GjA9xcyojbBFlKgNz6N+IXdxCy/xs/OXr6GA6okg=;
	b=Qtnu1heXNyZqrXt0yXXXDV3ANjazUrnUjyzU4UO+eFmI3p/KxFhb1PUwxYKFGICPs2kx
	 Bvz/zpl9t0nuzmnm2D0mQL4FODmGZWu+f2c4T2y7T10+l62EJvktehd+58szfomi+6Ez6
	 PDWh2q4IXwfD340RdhL3bFOrN0H24Ggt4uN7k5KrgiQ0EWj3iJULekXd0S5AStjP5DpBA
	 CFgUCen5SIGdcHM+NGI2lMhuHUh2k1MR7yczgFbMGRZO04n2CYflVxBWjf6v41tBmrk8G
	 OxvBhzLua+S5dYBUJmJuAWJxh+dhAgRCqMq6EzYocoToZK/TMZo20WrgXFEAYx5KdCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YKQjrsVJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B51606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YKQjrsVJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55E61F01825
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117850;
	bh=4+5GjA9xcyojbBFlKgNz6N+IXdxCy/xs/OXr6GA6okg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YKQjrsVJMOkTMVqbR0ZtC/1j9AQxIjawdY/VHCViS6+cWLYYtciat/HvrXwXHS/OX
	 OaJ85fQsJzARtCpYmpPSykEMUI+W0keFd7lzkHMAfQPWviGlEN7Il+w/xuyskh1rpH
	 D357fuaEJrhJUV5r2eqviJWIOUQxnoM/U14o/cxXdrvPQS1/PIFns3kOoY60/YXtTB
	 k0n2cjt3qvtJvEsAYda5zTC4ZzdBXIzn6+kO3Qa00by0M34KoJIkhyeHehbGcICCO7
	 7DLs+QQxMPysQtpxaM0zFqFo5RqUI7O9+MvFpZH2enDkLzop78C1BvISm1cf3jucUo
	 /KCt9znlG6B8Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso77921e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:17:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwn5ALD+cSeWRdfzsWBtR2XynPY0t0iTPIj9s70rJJvbRaQ36io229X9oN1b9E6Im7pfILuou75kNkdy8TMbLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv0v/uoabUufgYzHxNtF3Eg4r0wmNsuzg7a+Fh69s/YhLRgyl5
	IxfTaaTDSCsqCt4T7/Yt3L9KaVuYeSvewRkUue90S8gOUC1xRNE7bDunNuTcpduZjuuZ/1kJZro
	KrYKSmc5WpcztKhn1uaT23A7Be3JvbAs=
X-Received: by 2002:a05:6512:33c7:b0:5be:54ec:67bc with SMTP id
 2adb3069b0e04-5bfb716df84mr3863890e87.1.1793117849540; Tue, 27 Oct 2026
 09:17:29 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com> <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
In-Reply-To: <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 17:17:16 +0100
X-Gmail-Original-Message-ID: <CAL4Wiio4tt8aCP7u55nusQBO25=nWkysVA-Qy3woPuByE0=pug@mail.gmail.com>
X-Gm-Features: AclHuK8Cngv15UoUB5IJUWV2oDcpXFoB6P2PPN_P-Gvk6dnv9iQE6eKqsWbk1us
Message-ID: <CAL4Wiio4tt8aCP7u55nusQBO25=nWkysVA-Qy3woPuByE0=pug@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] netlink: check sk_rcvbuf before charging the
 dump skb
To: jhonata.poma@gmail.com
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 oct. 2026 =C3=A0 15:04, Jhonata Poma-Hansen via B4 Relay
<devnull+jhonata.poma.gmail.com@kernel.org> a =C3=A9crit :
>
> From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
>
> Since commit ae8f160e7eb2 ("netlink: Fix wraparounds of
> sk->sk_rmem_alloc."), netlink_dump() charges the dump skb first and
> queues it only if sk_rmem_alloc is still below sk_rcvbuf. Commit
> a215b5723922 ("netlink: make sure we allow at least one dump skb")
> added an exception for an empty socket.
>
> A dump that starts while something else is still charged to a socket
> with a small receive buffer fails with ENOBUFS and stays running.
> Every recvmsg() retries it, fails again and sets sk_err, so a reader
> that peeks before reading, as libnl does, gets ENOBUFS on the read
> after each peek, never consumes the message at the head of the queue
> and spins forever.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
