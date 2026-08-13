Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A442442FC2;
	Thu, 13 Aug 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623889; cv=none; b=EmmrWch/KMkzNueYkw3vmt6QD61Pel1EOhSM4U2HqAJ2xEa3usPS6GjSSQ+cG0hU0Fyaone3Gsts4JCELEguQ0fzDdIQXXghx6MG8s5h/OxVsyE3wEYQxtFSuEt8e5nDtftpPvrEV42sDh1luXGKdh6FKc6aV2zSEL7rSzTulRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623889; c=relaxed/simple;
	bh=tq2KkDyi1Hfg2VIZ+QyMwBlh4u8Im7y2AmoCbDmrp0Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hEPnGzbajGQsUPjf6wSXLa5Ua/P/Yszm3MAxEy2eINtf3DskcNC/hXJpkO59QzjbH5TNa4tAGKFSleOTdU4seHOGOTTIKJ6e9oz1inOiu3Mx/VeE6jQkYUaA4cUDE8cB5fOwkfOlb46l/5p6ezNewzW6M5N3/AnR6AhKS0Yue/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=F/+2YXEQ; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="F/+2YXEQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=W2I649bESmcra41uNs5eBViEJk8ehpau83UJfS+F/0o=; t=1786623886;
	x=1787228686; b=F/+2YXEQvmPzM1U0d82GGPkbKcuUSylDBPlG4TmOFXan8t9fYVPEGZmED6m41
	L/P8Ss/zVRuRGOM8Ba8aYgqw0QQMQmw2OJHd8uOHda84phQMZ5DsO9wvHkLk2Wws+hXKSwIJPEHHb
	E12EBjRuiuu/Sw7u3lApxYUYR3jhs5uFzOYi0cTiEKM6YpPw9WOu0UxWbsmwCV3DaurXKuTX6DpkG
	yFpzUQ8BXho3bCUfl24MYHSlakWanMX7oMh9woZTlVf4+Za8Wu+tSwiHqXtFAVrxOZVZ8aiAa699d
	rjeRJoyiZ0h/DgxsnbfvcxkGlJ9hhrc34ZWJpZZD95f7n5D0HA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wuUUD-00000000eS7-14Sl; Thu, 13 Aug 2026 14:24:41 +0200
Received: from p5dc558fe.dip0.t-ipconnect.de ([93.197.88.254] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wuUUC-00000000Xot-40E1; Thu, 13 Aug 2026 14:24:41 +0200
Message-ID: <f5f5e9a6eed1955f4ad8f01b810562979290bcc4.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 2/2] x86: Start removing X86_X32_ABI
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, "H. Peter
 Anvin" <hpa@zytor.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Bill
 Wendling <morbo@google.com>,  Borislav Petkov	 <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar	 <mingo@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Justin Stitt	 <justinstitt@google.com>, Nathan
 Chancellor <nathan@kernel.org>, Neal Gompa	 <neal@gompa.dev>, Nick
 Desaulniers <ndesaulniers@google.com>, Richard Purdie	
 <richard.purdie@linuxfoundation.org>, Sam James <sam@gentoo.org>, Shuah
 Khan	 <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Tomas Glozar
 <tglozar@kernel.org>, Willy Tarreau	 <w@1wt.eu>, x86@kernel.org, Arnd
 Bergmann <arnd@arndb.de>
Date: Thu, 13 Aug 2026 14:24:39 +0200
In-Reply-To: <20260813121111.bVf9xHsk@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
	 <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
	 <53d827d6481818bf0ba1fbf0b29aa5e750243b7b.camel@physik.fu-berlin.de>
	 <20260813121111.bVf9xHsk@linutronix.de>
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

Hi Sebastian,

On Thu, 2026-08-13 at 14:11 +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-13 13:07:53 [+0200], John Paul Adrian Glaubitz wrote:
> > Hi Sebastian,
> Hi Adrian,
>=20
> > On Thu, 2026-08-13 at 13:04 +0200, Sebastian Andrzej Siewior wrote:
> > > Since there is practically no real use for x32, start removing it by
> > > removing the symbol first, not allowing to enable it. Should nothing
> > > happening by the end of the year, it will removed after the last LTS
> > > kernel this year.
> >=20
> > Wouldn't that mean that x32 won't be usable in the upcoming LTS kernel
> > then? Why not do it the same way it was done for ia64, wait for the nex=
t
> > LTS release, then remove it.
>=20
> The idea is to revert the (two) commit(s).

But that imply that anyone concerned would have to respond in a timely mann=
er
which is not really something I would expect.

My suggestion would be to leave the complete x32 support fully intact until
the next LTS release so that anyone using that LTS release will know that x=
32
will be fully working.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
