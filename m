Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F53CE4B9;
	Sat, 10 Oct 2026 06:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615333; cv=none; b=PLAtLDlB8qnjsoId9jNaaBdMZ2nXKwyjKNx89kFbI1pSpdg5B+Z590NXW/aaf1cDoHs9KbvQUsQ3DUaWjHsrsHMLKqEwREQ6mglgARHw3Wpszs3OdNCaIP6h7K8RARYmX2vtZGr7M3nD9idS9uQdhEaxG663V0qVRxt2iiaXtTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615333; c=relaxed/simple;
	bh=QRlfLXqwKMg21pkB4PAazoIBZPJ/g2cJ9mKt82M6zG0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=A6XrdXy9kzLl0f82aOMHqUPN60s31dp99F7zVBl4YTtwQxXjEnNwqBMxiXv3KevgqMkHWPKcgbLDoAv/+zTcQ56BxCpSM0SnwhEh4FrmOaJV8SvdYRQmQOMzAsdsftJgZY2JchsiJ4fcwKWFm8aa4OdKYNDqbLpKhj6vqkJZ4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Zj2tk4IF; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Zj2tk4IF"
Received: from ehlo.thunderbird.net ([172.59.192.99])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69A6qhZ93096500
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 9 Oct 2026 23:52:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69A6qhZ93096500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791615170;
	bh=QRlfLXqwKMg21pkB4PAazoIBZPJ/g2cJ9mKt82M6zG0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Zj2tk4IFmQTjOmVWQuw3XeBXXrZ8B5IngUL/r+IBRIs3XcRtaFGfgRPNWziUBojWJ
	 Pe/DhUv/JS9Voh34wCpRGFy2+acB70VUCDEfmqvz7+twN3lFQH3fcNJJ4XAq7OvJ0W
	 45SC41hDXSxE493MQBcONBD+Gmh/6RJTK0mVMCvVhYsraffn8MFXbwKRLdqs+j2Kkw
	 +2IiINhVaH38IcNFmXgLfo55QDo8K/UA0Y92keWK7E7NgxJdF/SO/28jp9AURhh03H
	 ADF2Hdc8IBw3sHTVZL0c/fSq6wDUhh4Pm+vYKPST6KQdXpK6iqc48M/nGD+VaIKYhc
	 tVxyYZNh37U6A==
Date: Sat, 10 Oct 2026 08:51:44 +0200
From: "H. Peter Anvin" <hpa@zytor.com>
To: Tancred <alex@narraduct.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
CC: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Justin Stitt <justinstitt@google.com>,
        Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
        x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
User-Agent: K-9 Mail for Android
In-Reply-To: <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc> <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc> <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
Message-ID: <AEFD8F3A-0692-4090-B3F7-A6AD34A24819@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 10, 2026 4:13:55 AM GMT+02:00, Tancred <alex@narraduct=2Ecom> wr=
ote:
>
>
>On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
>> where certain workloads widely
>> move to x32 and use it exclusively=2E In the meantime Debian introduced=
 a
>> patch to disable x32 by default (so it has to be enabled at boot time o=
n
>> the command line) because they are afraid of the increased attack
>> surface=2E Fedora as far as I tell has X32 disabled (looking at 7=2E0-r=
c5
>> rpm in rawhide)=2E
>>=20
>> Since there is practically no real use for x32
>
>I only recently discovered x32 and built a Desktop (with all daemons and =
utilities running 10-30% smaller and some a bit faster, with 64 bit librari=
es for eg=2E Firefox=2E) My experiment should definitely not decide anythin=
g, but how much real-world use would be sufficient to justify continued pre=
sence (more complex compat code)?
>
>If left behind a flag like Debian (like the 2014 proposal https://lore=2E=
kernel=2Eorg/lkml/1415245982=2E3398=2E53=2Ecamel@decadent=2Eorg=2Euk/), the=
re are no security risks so I understand the benefit is reduced code comple=
xity and maintenance burden=2E Older threads critiqued the implementation=
=2E What's the smallest kernel support which would keep 32-bit pointers pos=
sible? Could a small design (eg=2E just 32-bit pointers on x86-64 with i386=
's type layout, so no 3rd compat case (cf=2E MIPS n32 and o32)) work?
>
>- Alex Alejandre

The thing is, we don't actually know=2E Therefore, if we are to keep x32, =
we need ***real users*** to speak up ***now*** and explain why they are usi=
ng it and what the benefit to them is=2E With actual performance numbers=2E

Otherwise it is not worth maintaining, partly because it apparently interf=
eres with the convergence of the 32-bit ABIs, and the handful of x32-specif=
ic pieces of code do represent an additional attack surface=2E

The desktop distros generally chafe under the 4 GB process limit, which me=
ans that an all-x32 desktop distro isn't very useful; having both x32 and x=
64 libraries defeats much of the x32 benefit, so the real use case is embed=
ded or self-managed code bases=2E

We are not going to go back in 2026 and redoing the *in retrospect* rather=
 unfortunate choices made due to "Hinc Dictat Linus" early on (the original=
 plan was to simply provide a fast way to access 32-bit syscalls from 64-bi=
t mode and let the evolution of the compat ABI deal with things like time_t=
, but Linus objected to introducing a new ABI with 32-bit time_t, and at th=
e time the time64_t interfaces were not yet there, so it ended up being an =
ad hoc implementation=2E)

