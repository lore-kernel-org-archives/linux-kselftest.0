Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCF37DEB7;
	Tue, 28 Jul 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256313; cv=none; b=ihClO17nixHDLN7B98KmSeHFjwYIiRogRvcjqdda32N5ZN69Sv86JpSGgTBP155NL4EtzD+wJbn08tbvAfRapm28okDrKpllgSRc/PJwseZ4KbfdKrcIreGo/iGBpjalaWMFVmLZcJ+lIDngmFRrX4bTBb19N3sKCIT+afnCJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256313; c=relaxed/simple;
	bh=EYVAKldWzbJPs+rxQw+J02pZgjC6oGfT10fB4D5wNSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5YkCMIbI7az+pEFmVTEPvmNa8WvWe9qMl9duSIQne8mex5YZ4oU7sJ1Bsukr47jME2Q5zo0WXeKN2uPyouwsQKv2NRcrQvdanUp4TW4iU6e/6NMYeDQ1R5RULWKRpaIyUXh5ouPKiPiB6nxHYYQIymtpq8oSxA4xOf0zzvRcJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=uefLFyf6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="uefLFyf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785256309;
	bh=EYVAKldWzbJPs+rxQw+J02pZgjC6oGfT10fB4D5wNSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uefLFyf6Dopv2AS4fpUOfRzAQooieT+h7ELOzbgn6zsNSWLk1Dci2/N4Dtykb+/EG
	 pHowGhAUNqQ8W2WpomEg+Vg+vmPbJ2kwjEZDdvu75rZIv4qICoALYMj4PiG0kA+vRJ
	 zyyyy9bgx0Gj9mTt0MxkDeTkVbwHkJkU7FELJP/o=
Date: Tue, 28 Jul 2026 18:31:48 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>, Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs()
 and friends
Message-ID: <700de276-8949-4587-a853-935dc7c6433f@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-3-ammarfaizi2@openresty.com>
 <20260728094626.0fb1a467@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728094626.0fb1a467@pumpkin>

On 2026-07-28 09:46:25+0100, David Laight wrote:
> On Sun, 26 Jul 2026 17:13:03 +0700
> Ammar Faizi <ammarfaizi2@openresty.com> wrote:
> 
> > Negating the smallest negative value of a signed type overflows, which
> > is undefined behavior. The selftests are built with:
> > 
> >     -fsanitize=undefined -fsanitize-trap=all
> > 
> > so a caller passing INT_MIN does not merely get an unspecified answer,
> > it dies (on both x86-64 and i386):
> 
> Thinking more, that is probably the correct thing to do.
> 'Undefined behaviour' means exactly that.
> It tends to be used for things that might cause traps on some architectures.
> But I believe 'undefined behaviour' is exactly that, erasing your hard disk
> (or starting a nuclear war) are both valid.

That's a good point. Calling these functions with those inputs is UB as
per the standard(s). By trapping it under -fsanitize=undefined the users
get what they ask for.

So I think we should keep the functions as they are.

If any users require different semantics, they can use a local function
easily.


Thomas
