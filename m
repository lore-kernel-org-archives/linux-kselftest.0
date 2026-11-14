Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668625;
	b=LMOE3/VZ3GTJM1/agcQE2TsUDWbLaqhy1s69eqVD4/Nz0FG5+Tt8yBC8FuKESiOh+mga
	 n0oXlMbjQstalK+YVOMD1VjKkUNkhu/Rhz9qpy3ozqPGw/notF2+XDqCzF2r01zemE7+o
	 62YwI4jftp3pqG31vFCnotbToM+iwfitCM+8QOEHNHrJdPBvUvo5ofKMGHO98j8MZvaXs
	 D22EXmbIv2SWsHF7TyRX75KwtQooocBDncDBzduE6AyXTlYsTobcIWyfJXrdGe+W8UyXm
	 LQ/nEysDVsct3HsKUPmTK+4T7Ojotrqj7v0qe7JCE0q8eWJ+VEfI3Spk98R8GrWpfKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668625;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hh7Tmj+7wtfiFBjHelQ2UvSn+gcooH/Lwr3HEhzqsCU=;
	b=IJnRbD3Wfsrw87rqF3PPSHgO0reGqgHIkWXoGjsB1FteuSqjEIO8e+QQxWT29/Lx67uD
	 TdpOq8UjZ/JXyOUwkV6iGw5nMCSxgZrsGcMNcp9mSHrEycBycaV0lg1BDAD0jt5rLoEIZ
	 npjDCTRkrgjyjAVKnEvgZmQuqab3pWW8iID+NcEKuHHLsNjX3S+JwglfVkXRUZeKXxj3F
	 VAKLOJKXqlqjvwv6eK6l881EuGJ5NYp29/idDj0qgWdvyeC7DpoDLZmTxXdXBdrSGz2hK
	 ancSvoKrCo0ZxKaupWjhnf2H50cmOD8XVgiYJsLCnHdNeZGJhDKg9dW4B+Vz/6+9E0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYhJgm0o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8500606A899
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYhJgm0o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674DE1F000CC
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668625;
	bh=hh7Tmj+7wtfiFBjHelQ2UvSn+gcooH/Lwr3HEhzqsCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KYhJgm0obisKupqQNiHauId/42AMWlCGEqJphTc3JiTFL2kh0ZE5XhfEnVGOw9bZj
	 +8hT1DPFT9+giHsQoXofizxUN5bdqdYzCBceevrIGTQKwg5MgJnhR9go5MgqGqsq4z
	 pCSRX1DkWedUkAIhBTt9goTbrP2EYfrtYAqP0fU1SpeHccyIZYS23tj/45XosPej37
	 eouWv214hBXq4DDZYl11J/8kJN7uvY3VrT/VyNfvCY8ST9dMt/kJPGeK1WBnmC39Q3
	 AyjCOQsyc5/NTf9kFEbt7Zt62aazjRyFJO9qUp7Hrqnv+HqhhvsjzpybdyyyXrYrwX
	 zS/+fs6Ypihrw==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ada4644f8so176579eaf.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 07:03:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH2sSMGdGg1nfENYTNsvHxTvfKoCp/3WSaOG5/0qPEY8tuluRpXQbj67v0fTW7vhOrYaq19FLwVEZH1szSKKH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r3Z2FUKzQRoeWSAqQeWEpa5/MqovmKhxsy9hK1zcE++18N4P3
	XQMyJESfawrBAbQ/cu3GG5SPkm2H0ot8ew4fzVgnB977BikJFDs0DteqFIhGgptRcY2vWAHps8d
	47Afk98poQsZpVVAow/sg91Z1fM2QYVo=
X-Received: by 2002:a05:6820:1c98:b0:71a:17b:11e0 with SMTP id
 006d021491bc7-71ab4f7665emr3241378eaf.42.1794668624737; Sat, 14 Nov 2026
 07:03:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
 <20261111174704.24312-3-juanagusnicco@gmail.com> <avgNulWmQTaUHD3N@google.com>
In-Reply-To: <avgNulWmQTaUHD3N@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:03:32 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiopthf-PMYo_aGtLFARZP9JoWaPhyLgmM9Gjxoxuecc8Q@mail.gmail.com>
X-Gm-Features: AclHuK-x0Ka5JcDAkURekV7rulICYcTzUyMM-cIsdmfnvDB3BskfcZXuL8sI0EQ
Message-ID: <CAL4Wiiopthf-PMYo_aGtLFARZP9JoWaPhyLgmM9Gjxoxuecc8Q@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: Add SO_REUSEPORT bind cache
 test to bind_wildcard.c
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Juan Agustin Niccolini <juanagusnicco@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 08:29, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> On Wed, 11 Nov 2026 12:47:04 -0500, Juan Agustin Niccolini wrote:
> > Add a test for the bug fixed by "tcp: Fix the SO_REUSEPORT bind cache
> > admitting a conflicting socket". With a 0.0.0.0 listener on the port, a
> > v6only [::] SO_REUSEPORT socket fills the bind cache, and a dual-stack
> > [::] SO_REUSEPORT socket must then fail to bind with EADDRINUSE.
> >
> > Without the fix:
> >
> >   #  RUN           global.reuseport_v6only_cache ...
> >   # bind_wildcard.c:860:reuseport_v6only_cache:Expected ret (0) =3D=3D =
-1 (-1)
> >   # reuseport_v6only_cache: Test terminated by assertion
> >   #          FAIL  global.reuseport_v6only_cache
> >   not ok 1 global.reuseport_v6only_cache
> >
> > With it:
> >
> >   #  RUN           global.reuseport_v6only_cache ...
> >   #            OK  global.reuseport_v6only_cache
> >   ok 1 global.reuseport_v6only_cache
> >
> > Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
