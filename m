Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75057381C4;
	Sat, 10 Oct 2026 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617614; cv=none; b=igVaEJdKmy3jHzoSMCqziU/WAuri2L+ifnVwpgh//oLItiqjTuslczf7k2llwpDSDV9eVrN7RqeeTi1W5SXie3fwGE2gHm+WZDQzXWbiIJH20sHfwTdL7eigsntcGXROEveYIRLf5jzLON4ABBFxkG+nSDKNQvqJeO3MWti6vHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617614; c=relaxed/simple;
	bh=GKPQLYHgPhr0xMzDC5riZ8+OBSue8Yjv7P3BvUk1Cjg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvzw5octAWAXR6/uUUcE2ojfdDT20OKVWdqeIn1ZLi8kI96QoPdbIjZJhsOdNpd/dTvLzomAaGChM5VCvR/WKQAqFmYqAKNWSs098m1EnacTWWo3SDGHAKtWRiHG0ubZwdE8I10hzy2ldArXLfoESuwEEGqnd0F4n+vdEwhko6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=XsgnrXt4; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="XsgnrXt4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=teqaia83Ord3oLShXQ9VqNIYfVBNpiZYGph0SbHqQqQ=; t=1791617611;
	x=1792222411; b=XsgnrXt4zDNSR9nXDPEy5XovRcq4yVyf/msM7n5wngSHSy3YfnvM7sblqs0WX
	j9Lweb3/ZFtzxjJEBWmdLBlsPuBS+0YO24MXPsCI0vpmnyw1UL0Iq+WIgF0u+xnmoyTYDykaOMoXV
	SGntPFdNpEz7ZTAMgJQhR5GXeLPjyMKnZlAf54UGmPiT85CPspQV1RpwOmSUoztjB+/lSMlpjYDz3
	t2Ne82See02y0nv+rfnkp8rdyUZ/CC9N2qGr5+JqMSKR6ZUaHp0iHz9W2ZQuBaAar6sO+mDyYO9mv
	PxeFnndJ9LMi36H3COfARJ5pjEDp3Q2Ylt0ucIoAeDZchbbTCw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xFRVQ-00000002eEW-2cO9; Sat, 10 Oct 2026 09:28:32 +0200
Received: from dynamic-077-183-246-238.77.183.pool.telefonica.de ([77.183.246.238] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xFRVQ-00000002Hil-1T1n; Sat, 10 Oct 2026 09:28:32 +0200
Message-ID: <6ab95ddaaa19f224b07a2001e03ec002ca2938e2.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "H. Peter Anvin" <hpa@zytor.com>, Tancred <alex@narraduct.com>, 
 Sebastian Andrzej Siewior
	 <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Maciej W. Rozycki"
	 <macro@orcam.me.uk>, Bill Wendling <morbo@google.com>, Borislav Petkov	
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar	
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Justin Stitt	
 <justinstitt@google.com>, Nathan Chancellor <nathan@kernel.org>, Neal Gompa
	 <neal@gompa.dev>, Nick Desaulniers <ndesaulniers@google.com>, Richard
 Purdie	 <richard.purdie@linuxfoundation.org>, Sam James <sam@gentoo.org>,
 Shuah Khan	 <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Tomas Glozar
 <tglozar@kernel.org>, Willy Tarreau	 <w@1wt.eu>, x86@kernel.org, Arnd
 Bergmann <arnd@arndb.de>
Date: Sat, 10 Oct 2026 09:28:30 +0200
In-Reply-To: <AEFD8F3A-0692-4090-B3F7-A6AD34A24819@zytor.com>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
	 <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
	 <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
	 <AEFD8F3A-0692-4090-B3F7-A6AD34A24819@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Sat, 2026-10-10 at 08:51 +0200, H. Peter Anvin wrote:
> On October 10, 2026 4:13:55 AM GMT+02:00, Tancred <alex@narraduct.com> wr=
ote:
> >=20
> >=20
> > On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
> > > where certain workloads widely
> > > move to x32 and use it exclusively. In the meantime Debian introduced=
 a
> > > patch to disable x32 by default (so it has to be enabled at boot time=
 on
> > > the command line) because they are afraid of the increased attack
> > > surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
> > > rpm in rawhide).
> > >=20
> > > Since there is practically no real use for x32
> >=20
> > I only recently discovered x32 and built a Desktop (with all daemons an=
d utilities running 10-30% smaller and some a bit faster, with 64 bit libra=
ries for eg. Firefox.) My experiment should definitely not decide anything,=
 but how much real-world use would be sufficient to justify continued prese=
nce (more complex compat code)?
> >=20
> > If left behind a flag like Debian (like the 2014 proposal https://lore.=
kernel.org/lkml/1415245982.3398.53.camel@decadent.org.uk/), there are no se=
curity risks so I understand the benefit is reduced code complexity and mai=
ntenance burden. Older threads critiqued the implementation. What's the sma=
llest kernel support which would keep 32-bit pointers possible? Could a sma=
ll design (eg. just 32-bit pointers on x86-64 with i386's type layout, so n=
o 3rd compat case (cf. MIPS n32 and o32)) work?
> >=20
> > - Alex Alejandre
>=20
> The thing is, we don't actually know. Therefore, if we are to keep x32, w=
e need ***real users*** to speak up ***now*** and explain why they are usin=
g it and what the benefit to them is. With actual performance numbers.

Real users usually aren't subscribed to Linux kernel mailing lists. If you =
want
to figure out whether anyone is using a certain kernel feature, you have to=
 ask
within the communities.

In any case, we're still building Debian unstable for x32:

https://buildd.debian.org/status/architecture.php?a=3Dx32&suite=3Dsid

> Otherwise it is not worth maintaining, partly because it apparently inter=
feres with the convergence of the 32-bit ABIs, and the handful of x32-speci=
fic pieces of code do represent an additional attack surface.

Aren't the attack surfaces disabled when x32 ABI support is turned off?

> The desktop distros generally chafe under the 4 GB process limit, which m=
eans that an all-x32 desktop distro isn't very useful; having both x32 and =
x64 libraries defeats much of the x32 benefit, so the real use case is embe=
dded or self-managed code bases.

Well, you can also run x32 code inside a chroot or containers, can't you?

> We are not going to go back in 2026 and redoing the *in retrospect* rathe=
r unfortunate choices made due to "Hinc Dictat Linus" early on (the origina=
l plan was to simply provide a fast way to access 32-bit syscalls from 64-b=
it mode and let the evolution of the compat ABI deal with things like time_=
t, but Linus objected to introducing a new ABI with 32-bit time_t, and at t=
he time the time64_t interfaces were not yet there, so it ended up being an=
 ad hoc implementation.)

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
