Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDD3B71B7;
	Thu, 13 Aug 2026 13:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628849; cv=none; b=GYYiqcSXafo7UvH30e+M75uh5Pr6McEDusf811z7GKqN6lUE7VoxLxdnElCEM/EP1NGrB5cHk2a7Z5281P9dYbYDChvEFf3gpdu4rSnNt2Gz1pEe9980nB2hcjV1LOeW+mZ4lws5UFLfkbHg5AY4qnzwq3C5OFD5l7zN0Fm4WMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628849; c=relaxed/simple;
	bh=8NuVREnRHeOwBXNd9T/15gy+SP7kzgNDM0y/JPCc5Jk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mKEKtpIC29c+FtiCNxPnVccOC97lgSC1hIWIn5dNSTr2uZ1o38g24khGZhs9LamTC/uMC+C+9iO9zKbl2T64LQuK19VAAlNc9DxFWKDN0bw1/vhyA69tKZuC0mdQ1P9DwyD9CzJnnBP9AWd93xUis9bgfAssQZZVMdnJx4uS0U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=J/H7lPfT; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="J/H7lPfT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=PYRyKvjbN5jPvVONMXhk1Xql7tqHFvMynKSmR8tg0/A=; t=1786628846;
	x=1787233646; b=J/H7lPfTRpocm/roaykoZnG2mXP3ulXzgnotz045AwdXu8WeL1vLpr01TzGT5
	gRIKk1v5UGW5sjx4+eM0EVZq8h1iZ9zWN+fCdV8biZZ1pHrGtEHDyy5H2SJmMkWdr/+C9R6Cq9d7X
	+LIjusGIaHiQUQDbZEkUkxK8slz1lf0v/tRsW9fhXdCzygCoSIMuI+ICfZa4be9979WSPAWDDIagT
	t1PegY0aIPD+1QoVPeeMk2VPByIFK+83bIh4Bh026hkdlCwVg0rr6u7764nRxyf5Qsdlwfv4NA8W6
	sM7QaqIJamJ+U6GRPeRDgmNdusnQkrcUrxfrYnId1zfrqMNFHQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wuVmE-00000001Nb5-1tcq; Thu, 13 Aug 2026 15:47:22 +0200
Received: from p5dc558fe.dip0.t-ipconnect.de ([93.197.88.254] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wuVmE-00000000mfj-0kAs; Thu, 13 Aug 2026 15:47:22 +0200
Message-ID: <8af1dc8eba9c8a01dd33deda02e9c5d47adf4b11.camel@physik.fu-berlin.de>
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
Date: Thu, 13 Aug 2026 15:47:20 +0200
In-Reply-To: <20260813134121.2vaFywr3@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
	 <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
	 <53d827d6481818bf0ba1fbf0b29aa5e750243b7b.camel@physik.fu-berlin.de>
	 <20260813121111.bVf9xHsk@linutronix.de>
	 <f5f5e9a6eed1955f4ad8f01b810562979290bcc4.camel@physik.fu-berlin.de>
	 <20260813134121.2vaFywr3@linutronix.de>
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

On Thu, 2026-08-13 at 15:41 +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-13 14:24:39 [+0200], John Paul Adrian Glaubitz wrote:
> > Hi Sebastian,
> Hi Adrian,
>=20
> > > The idea is to revert the (two) commit(s).
> >=20
> > But that imply that anyone concerned would have to respond in a timely =
manner
> > which is not really something I would expect.
>=20
> What do you mean by respond in a timely manner?

Well, the problem of many kernel maintainers is that they somehow assume th=
at 99%
of the Linux users are present on the Linux kernel mailing list and reading=
 what's
happening there.

Then a kernel developers send a patch introducing a major breaking change, =
ask for
feedback and then just implement the change because they didn't get any fee=
dback.

However, most users are not reading the LKML, so introducing such breaking =
changes
in steps hoping for feedback will not work.

My recommendation is therefore to keep everything in a working state until =
the next
LTS release, then drop everything at once. This way users know that they ca=
n stick
for the latest LTS release for the time being to continue to use such a maj=
or feature.

> > My suggestion would be to leave the complete x32 support fully intact u=
ntil
> > the next LTS release so that anyone using that LTS release will know th=
at x32
> > will be fully working.
>=20
> Given the media covered it well, it might work.

Most users probably don't even read the media coverage and only realize tha=
t a feature
is gone when they try to upgrade their machines and realize the feature has=
 suddenly
vanished.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
