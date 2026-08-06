Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2EA40A940;
	Thu,  6 Aug 2026 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017525; cv=none; b=XGP//eb1gj+3FPIVyuRDZI4sAMdO1IEHwRSh9atKdsor6yNoIEo07UasQB+YbJkCi228nVGbeOAz+QykPB42cXN9sJ8JNqKrb0xctpzKsea7ukCDrhxOLKw39HQfDefu3bZmQtShErGxmc3KzAIj1mRH/+nizMXJQwmaxL4KFig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017525; c=relaxed/simple;
	bh=Iz+bElwmgovz6NBcmEner0w7gj5r5eUppgbit8V/urM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fm7s8qyXaXSqmtv2eRQwvQUBMl5Zj5LXaTwKgGZN9wokJOTaHMPI/UT/PIvBsPCX3jqw3i9DZYKr5vtJAAEzF28qFqBTIMLUeTvrEPjhJDkC54T8zZijQinVoCTG9NIVJDJd8b1JDOWyiOdF2LS1csUJyxV11EDUoTvmhgfvW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOJXKEpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOJXKEpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA81F000E9;
	Thu,  6 Aug 2026 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786017524;
	bh=PipOiU3WDi/ShqcfhWwddc2/xW9Ic+f6bHEQmclKRiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOJXKEpYVV95XhacNsHdG5GB19/T7i6BhFc7ZR3q1IC6p3XOB4VgOcow9bUabrHWP
	 +Zf6HUkvX1sjH/s2efi48HmNIZJ0Q7KxqeIVB6X3EFQHhkWA8Vx7WmbsfZHIz1t73x
	 H/zCocTWlmFTDzLgtIcI2HL8ETBQGs2znXSMLx6aEb/Gb2WJ7FHMMi8aHRxK6lTLN4
	 ywxkPNDqwjLo0heK02XtDD1SRqsawWLPhjXhy5ylt8WwtYTwY0MH/zvo9zmyAbY6U+
	 Ge9t+fRR7bJnW1kG1inKbdPKsd/ZQW9olH6diK1eVNuqeB+BwLVdNseyGTH0Ldu+6L
	 CdARooEV/JIZQ==
Date: Thu, 6 Aug 2026 12:58:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v3 1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
Message-ID: <d37ac12d-1e19-4711-add5-6f3cf82f48ac@sirena.org.uk>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
 <20260728021122.2640104-2-ruanjinjie@huawei.com>
 <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
 <bd1db584-ce6b-46b5-ab66-11fb7873007b@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9kq+jgVm4G0pwUVj"
Content-Disposition: inline
In-Reply-To: <bd1db584-ce6b-46b5-ab66-11fb7873007b@huawei.com>
X-Cookie: Brain fried -- Core dumped


--9kq+jgVm4G0pwUVj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 04:22:31PM +0800, Jinjie Ruan wrote:
> =E5=9C=A8 2026/8/5 23:04, Mark Brown =E5=86=99=E9=81=93:
> > On Tue, Jul 28, 2026 at 10:11:21AM +0800, Jinjie Ruan wrote:

> > The relevant definitions ought to be being picked up from here, there's
> > a copy of a current version in tools/include and has been for a while
> > (since at least v6.18) but there's no Makefile update to ensure that
> > gets picked up.

> Will add -I$(top_srcdir)/tools/include to CFLAGS for this test.

It turns out that's actually getting pulled in already - the issue is
that linux/filter.h doesn't include uapi/linux/filter.h and the
definition is in the uapi header.  I sent a fix for this yesterday.

--9kq+jgVm4G0pwUVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0du8ACgkQJNaLcl1U
h9AvDwf/fQZl+XgNBHgNp8Whb+LhD5qXRzfbnZn8Rj+a1RP0C6qrKxHB0clVOlWg
UDkOIK3qALyXI2VivsHf3CLJPVVD9vGRnqvYe3ZFH88KcHsQGvsKYjo3OB50Iw3u
4sqjREgnWhdVBWQIbUDudgV5o71l7EDuzCqEo9t7cnbYdcOwMVITaqMp1p6hzWIi
LyvcB4XiayAsGcUIFjOQctHLVpfOxleL0JAGSTeHEqMWjDLtJfuebUUqvK29hT6I
RUIdoxwdtivcwZN9hWUN56+1sJKFWFZbn+w6qY00iIy6drwLKafX78E5CgUyUcyc
qLov6Jd+xvES3sJpZ4MaV6p4X84mgQ==
=dtmO
-----END PGP SIGNATURE-----

--9kq+jgVm4G0pwUVj--
