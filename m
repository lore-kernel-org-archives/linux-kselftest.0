Received: from smtp-1.orcon.net.nz (smtp-1.orcon.net.nz [60.234.4.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C374A388E4D;
	Sat,  1 Aug 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619211; cv=none; b=KHbO/GUGizsszVlh1UoktRmS7JDD/SbmOjt5surYJS5GvnIaNNoewiphsEiMRZp111Da5VVR6YRc99WuGlNwxQXW+A5Ugzp6MVtMIndRuKaCnmh+Vxf42fz9kiZoJw++bdI/+kRvQ0eWtOYYmFdyFG4xczec+JyzGZWg7+D1DRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619211; c=relaxed/simple;
	bh=qexUHF92cXHnG8dgDTjIzZ788n68PLsQqzXZyT0m+I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6Bc4ERTXUb523ZhAv6HdP0xq0wRRSvrt1G3Q9C+I0mn1x3xdZbh8Hl1IYqbctr9vRF31XVahIqDAh+W7vRCqWyMiHvG+RbDjAfR+94RnVpC9an5p2MoQb3t2XWA7hX8KYzJrJlLPGjd2xHxLUWiB243hWgkIDpDjPp6HGUvvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=TkRoszJb; arc=none smtp.client-ip=60.234.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b="TkRoszJb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bMaHB05759hUWh6s2Px/OGZgY5ofdAGTdnYrSFn6HcI=; b=TkRoszJb6BIYbotjw620M8fz/r
	Nh++5aIWSKPg2L+1k4/s0RWxfnHO6DRJ2ZYlcYQmLRK0gOErfuAoCqbJ+/oASY1Z+2NKWqG8fRRu4
	6KbeglZrHbTcc0IKZKN/qxaUqrUSsbNGd04ogLM5VPKcEDp9+wkNfoLCQzQ3Hs4OpVeR0hTLRlgnI
	G/HwD4NxIy6KlsVDd9FzckymInDKbyc4oRltVEC4Z3Ruejvk9NMvWmhpVr+o+3jSD1GUcQ/5vfWVM
	TyzFTkm0n29H2VnTXy84xt5ibXqiVrazteUxqETOQbIBJOqW6Lk8DtRd1+RWmmM2eD+UeWtSPpvQj
	Bi+dyjOQ==;
Received: from [121.99.247.178] (port=11869 helo=creeky)
	by smtp-1.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1wqGVo-0003cd-2y; Sun, 02 Aug 2026 08:40:52 +1200
Date: Sun, 2 Aug 2026 08:40:46 +1200
From: Michael Cree <mcree@orcon.net.nz>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Magnus Lindholm <linmag7@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] tools/nolibc: add support for Alpha
Message-ID: <am5ZzoODKbVJ8q_t@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Magnus Lindholm <linmag7@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
References: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
 <am5HA7UbmUEEChZc@1wt.eu>
 <3218c2afc2c99394c43a6380b175185af659078e.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3218c2afc2c99394c43a6380b175185af659078e.camel@physik.fu-berlin.de>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Sat, Aug 01, 2026 at 10:14:38PM +0200, John Paul Adrian Glaubitz wrote:
> On Sat, 2026-08-01 at 21:20 +0200, Willy Tarreau wrote:
> > On Wed, Jul 22, 2026 at 12:07:05AM +0200, Thomas Weiﬂschuh wrote:
> > > A straightforward new architecture.
> > > 
> > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > > ---
> > > Only tested on QEMU so far.
> > > Testing on real hardware would be very welcome.
> > 
> > I'd love to, but last year I could fix my serial port (replaced the chip
> > on the motherboard) and the new one died a few minutes later :-(  I'm
> > starting to seriously suspect a flaky PSU that doesn't regulate its 12V
> > output well and that is progressively killing the mobo.
> 
> Magnus (CC'ed) should be able to test the patch on real hardware.

I had tested it on XP1000 and ES45 with no test suite failures shown,
but hadn't got around to reporting that fact.

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers,
Michael.
