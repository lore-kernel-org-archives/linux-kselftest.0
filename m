Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC43DB31E;
	Mon, 27 Jul 2026 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168940; cv=none; b=QEifwPiJCiQXaCjV6NcUbAsloJRh13SjacfOpr3oBpWUiI7yB/Hz6uQhMajzypxKEkyrFua11QCa5yNKCsyST+xp9Z8d7d99fhHhlUVXgGuDpi2FxB/xRlAcx0tAEU2h83TRu9fPLVPP7b175mfL+4cnucrQ6e98ADYY3uJyOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168940; c=relaxed/simple;
	bh=NxxZ99Oj5DsxwuBF38XVNWX78XfvpXXGUpKV9Xgegsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBnGOKOgLLwl4/QJRQtjLgSdjeqqRuf+yh+GnVNtLH4+9Nw5+VVczoXbviLfmoPA266ZaVmVqe2FSU/ZjKTHk9ZE6WwM0X/pCiKYeOaC4B3feg6kaM+PAiBRjxPXifctzSOK90i28JjxEhcZrNXh+2IepDHE9fFRonYs7zAdPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bObXfsQ7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bObXfsQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785168936;
	bh=NxxZ99Oj5DsxwuBF38XVNWX78XfvpXXGUpKV9Xgegsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bObXfsQ7J0crl1cM0Ro6rafkdtFpiX5Z/lQjdq+B5hI2lwTCXPBZ2nyV///3OhOva
	 6xDDFMPjmFnRp6NTyTvmJhbduoTVa06TVllJ0XvRpONggHLxtEqqLsXfbQ6UXigASj
	 Ef6oOWJcJM0wvfjxYKxYYorYAr+pTZfdiMtzYLgI=
Date: Mon, 27 Jul 2026 18:15:34 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Laight <david.laight.linux@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Ammar Faizi <ammarfaizi2@openresty.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs()
 and friends
Message-ID: <62fe78c2-d389-4f2e-bfa4-f58fcb4ba7c4@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-3-ammarfaizi2@openresty.com>
 <20260726151334.4c1ec6f1@pumpkin>
 <amYvRyLKZzEsFyq9@1wt.eu>
 <20260727083212.223cb1ae@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727083212.223cb1ae@pumpkin>

On 2026-07-27 08:32:12+0100, David Laight wrote:
> On Sun, 26 Jul 2026 18:01:11 +0200
> Willy Tarreau <w@1wt.eu> wrote:
> > On Sun, Jul 26, 2026 at 03:13:34PM +0100, David Laight wrote:
> > > On Sun, 26 Jul 2026 17:13:03 +0700
> > > Ammar Faizi <ammarfaizi2@openresty.com> wrote:

(...)

> > but ~(j - 1) would work, just like
> > (~j + 1). However here the benefit of the casts in Ammar's
> > version is that it's obvious that it's only playing with same
> > size casts with no extra operation.
> 
> They only work for 2s compliment.
> While that is normal (and required for the next? C version)
> it isn't actually required by C.
> (Not that gcc supports '1s compliment' or 'sign overpunch'.)

nolibc only supports Linux, which in turn only supports 2s
complement. We already have code in nolibc which relies on this.


Thomas
