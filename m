Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0318E463B6D;
	Thu, 13 Aug 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619294; cv=none; b=bJzNSx6yk2tyFSRszVkekAzgAATakNNFAka+o+N42JFr+nKzdff7abBXH8q57P5E6cLXceoAxc76bL79JAdiYhuG6pOuF6pYCKTCdgkFAm9CCgv5I2o0v8zWGYc5W0TXbBaaBFNfffHt8YUXxbFBuAUfKpXOjuafydEF4rCZ/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619294; c=relaxed/simple;
	bh=QfkJLfI+C4ALvocBZgs4CA7lgi0AD7WgC0I8o4mr9LM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eL6CgzbTclbZuT4Fd6NHoWv+c68Eb+ps5c1Q7EbjrMtNbltB3GtgiBLO9B35qeCqQxrVhnpJXLKWuaUPeJmYVaTl0aTIKD6lPwYVn2Nyd2xbQk6cy4/St34E9YgUJ7PTHJAxySwOaWkjxdqjlgg1+wpzbnMX/mGUohYXrYTJxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=QEDWaHyo; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="QEDWaHyo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=i/lLLrd7c6mmSw045i9nlZZI9OFmeGta46SfjEYT0ZA=; t=1786619287;
	x=1787224087; b=QEDWaHyo7t+D/VT6/h6VelccQGii6WBkEOh57pj6EYpSh6SNM3tuipntBzZj2
	4iIabjeddsXsRy9Gyc+QxPuoJlCHMosEOMWKCgGPst9XmqSjcVGiP2Rmqn6JSPwFbBlMwisqq01E0
	BiC/7fvxVmFc0iM54oRUCKspRw6FxksC3jmuC8aaVDEHBFCwWR3qu5K4ZdYm+95X9zwPqzM2MSLPG
	z0F+T+qsmgNjMlyfcA8MBhBznxrT8YzFn2LEr3D47byHmnZBjBVrvZtMCgaQTZ9G8jU17uF2i5731
	XiVJvDu4Mla5EZwKS25+9+081qInmyjBUAONgKRZAxkry9bcbA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wuTHu-00000000DuC-40Zi; Thu, 13 Aug 2026 13:07:54 +0200
Received: from p5dc558fe.dip0.t-ipconnect.de ([93.197.88.254] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wuTHu-00000000IxK-2meF; Thu, 13 Aug 2026 13:07:54 +0200
Message-ID: <53d827d6481818bf0ba1fbf0b29aa5e750243b7b.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 2/2] x86: Start removing X86_X32_ABI
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>,  Bill Wendling <morbo@google.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,  Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Justin Stitt
 <justinstitt@google.com>,  Nathan Chancellor	 <nathan@kernel.org>, Neal
 Gompa <neal@gompa.dev>, Nick Desaulniers	 <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,  Sam James
 <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>, Willy Tarreau	
 <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Date: Thu, 13 Aug 2026 13:07:53 +0200
In-Reply-To: <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
	 <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
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

On Thu, 2026-08-13 at 13:04 +0200, Sebastian Andrzej Siewior wrote:
> Since there is practically no real use for x32, start removing it by
> removing the symbol first, not allowing to enable it. Should nothing
> happening by the end of the year, it will removed after the last LTS
> kernel this year.

Wouldn't that mean that x32 won't be usable in the upcoming LTS kernel
then? Why not do it the same way it was done for ia64, wait for the next
LTS release, then remove it.

Anyone still wishing to use it could just install that particular LTS
kernel.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
