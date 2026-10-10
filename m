Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01E93D5C2C;
	Sat, 10 Oct 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629981; cv=none; b=hOGqvyRTogjkXZHz6oMSz2UdqidzJU9/IPFHfaS4k12D2OxRkAsUkfDvh9XJau+VobU/Oa1R2cG1WbMxAFlwVNTEaNGF9UvD5ENvuHFGyFFIeO4NBu45262R4xOErHY34hciFfMIVSEYZbbtbUGZSuZeO9bzL/MuCHLIas3Dtic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629981; c=relaxed/simple;
	bh=VQPGLKU4ZcERvBsKVfD6o4PBgMZiueaDNlV4quWb24U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IP4Y6r4zOF58M4Ki8lnszTMQyYmtYWmvZ8Fv23mkktdjqqrarlXNVp7lJbzV3xQ/EGCOmoAnzkm4KLRdKHHWgpdQbpD6V1RWm327eQTzCoVUt3BFhgG6sRmdrOXiKV1TLHws3BbRQ50+W2R/p5fNd3JIK7nfewy8T0+ISyYkLjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=hPVSAo5n; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="hPVSAo5n"
Received: from ehlo.thunderbird.net ([161.30.201.13])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69AAvKbj3525836
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 10 Oct 2026 03:57:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69AAvKbj3525836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791629861;
	bh=VQPGLKU4ZcERvBsKVfD6o4PBgMZiueaDNlV4quWb24U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hPVSAo5nYsO6bSX/dzSGKEa5wUKn7v/TfReDU3MCb1WsX8WoQgfdBsSjPsL08UUdf
	 MruQgbmAd65VfHFZWNSWM763ef3lvlBTZSPcks9Wi/iKSty1qDbyAK/1vV2myc8//a
	 i+KK//TH4zwI6r61AKKo+wIQ4B/JxmzGZbwThJXwtNpxrQdMO6/9/HI5VSB8b3aFK2
	 iWGBch5KtskJZSQ68Wp1WT2EZibVhL48NAviPICMtVHJupVoq9/HHYuK3KOyXb1Vhm
	 Tgi4ecTULCUkRrCbhNWgZpo3rI3KRqmrbNcPAJ9SknhyzkvbfxBzZrdOT4WFeq6d1d
	 HSh/TLkLIAlow==
Date: Sat, 10 Oct 2026 12:55:23 +0200
From: "H. Peter Anvin" <hpa@zytor.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tancred <alex@narraduct.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
CC: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
In-Reply-To: <6ab95ddaaa19f224b07a2001e03ec002ca2938e2.camel@physik.fu-berlin.de>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc> <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc> <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com> <AEFD8F3A-0692-4090-B3F7-A6AD34A24819@zytor.com> <6ab95ddaaa19f224b07a2001e03ec002ca2938e2.camel@physik.fu-berlin.de>
Message-ID: <62E0A358-541A-48EB-BD8A-9B61E5C26B72@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 10, 2026 9:28:30 AM GMT+02:00, John Paul Adrian Glaubitz <glaubi=
tz@physik=2Efu-berlin=2Ede> wrote:
>On Sat, 2026-10-10 at 08:51 +0200, H=2E Peter Anvin wrote:
>> On October 10, 2026 4:13:55 AM GMT+02:00, Tancred <alex@narraduct=2Ecom=
> wrote:
>> >=20
>> >=20
>> > On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
>> > > where certain workloads widely
>> > > move to x32 and use it exclusively=2E In the meantime Debian introd=
uced a
>> > > patch to disable x32 by default (so it has to be enabled at boot ti=
me on
>> > > the command line) because they are afraid of the increased attack
>> > > surface=2E Fedora as far as I tell has X32 disabled (looking at 7=
=2E0-rc5
>> > > rpm in rawhide)=2E
>> > >=20
>> > > Since there is practically no real use for x32
>> >=20
>> > I only recently discovered x32 and built a Desktop (with all daemons =
and utilities running 10-30% smaller and some a bit faster, with 64 bit lib=
raries for eg=2E Firefox=2E) My experiment should definitely not decide any=
thing, but how much real-world use would be sufficient to justify continued=
 presence (more complex compat code)?
>> >=20
>> > If left behind a flag like Debian (like the 2014 proposal https://lor=
e=2Ekernel=2Eorg/lkml/1415245982=2E3398=2E53=2Ecamel@decadent=2Eorg=2Euk/),=
 there are no security risks so I understand the benefit is reduced code co=
mplexity and maintenance burden=2E Older threads critiqued the implementati=
on=2E What's the smallest kernel support which would keep 32-bit pointers p=
ossible? Could a small design (eg=2E just 32-bit pointers on x86-64 with i3=
86's type layout, so no 3rd compat case (cf=2E MIPS n32 and o32)) work?
>> >=20
>> > - Alex Alejandre
>>=20
>> The thing is, we don't actually know=2E Therefore, if we are to keep x3=
2, we need ***real users*** to speak up ***now*** and explain why they are =
using it and what the benefit to them is=2E With actual performance numbers=
=2E
>
>Real users usually aren't subscribed to Linux kernel mailing lists=2E If =
you want
>to figure out whether anyone is using a certain kernel feature, you have =
to ask
>within the communities=2E
>
>In any case, we're still building Debian unstable for x32:
>
>https://buildd=2Edebian=2Eorg/status/architecture=2Ephp?a=3Dx32&suite=3Ds=
id
>
>> Otherwise it is not worth maintaining, partly because it apparently int=
erferes with the convergence of the 32-bit ABIs, and the handful of x32-spe=
cific pieces of code do represent an additional attack surface=2E
>
>Aren't the attack surfaces disabled when x32 ABI support is turned off?
>
>> The desktop distros generally chafe under the 4 GB process limit, which=
 means that an all-x32 desktop distro isn't very useful; having both x32 an=
d x64 libraries defeats much of the x32 benefit, so the real use case is em=
bedded or self-managed code bases=2E
>
>Well, you can also run x32 code inside a chroot or containers, can't you?
>
>> We are not going to go back in 2026 and redoing the *in retrospect* rat=
her unfortunate choices made due to "Hinc Dictat Linus" early on (the origi=
nal plan was to simply provide a fast way to access 32-bit syscalls from 64=
-bit mode and let the evolution of the compat ABI deal with things like tim=
e_t, but Linus objected to introducing a new ABI with 32-bit time_t, and at=
 the time the time64_t interfaces were not yet there, so it ended up being =
an ad hoc implementation=2E)
>
>Adrian
>

That is why I said it also needs to be in the commit message=2E That way s=
omeone can figure out why it is marked BROKEN=2E

This is a last warning=2E
