Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82956350D7D;
	Sun, 11 Oct 2026 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739192; cv=none; b=HhqdNoMyelxlUEs03CT3SA91h1Clu33qNLe8bB9h2jisXNcp2IZtXJA7235dN6zcJL5isO+TWkfS5Wib1E2iDJE1XDYqpig7JkNf1T5qZoEDhtUpvYgRLrGVuCgVyxwD4xizBb9/t+cbrX5BlsYGCxp5C3IB5Bb5/mj5gjCXccc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739192; c=relaxed/simple;
	bh=gqr2tumKSyyGkeLdoQR/Bp+tAeD1XIm8cOw2UXkOUtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvD4XYDRxQtHx9TWxOG+NVudXYwJDBCrXoOusTH7fZx4Y+HvZ/nNcRAbTtQIZG9HWNsoih+UxgwB5jY6nAzqJ5ifbB8n1fl5Ew5KirusgJ9MRBVc/x3ky+Y4JSZdsgDBtG8vADbaPgI2tEJxie1gJfAohnGzRp1o48xppl73kQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=breakpoint.cc; spf=pass smtp.mailfrom=breakpoint.cc; dkim=pass (2048-bit key) header.d=breakpoint.cc header.i=@breakpoint.cc header.b=QpSxh78H; dkim=permerror (0-bit key) header.d=breakpoint.cc header.i=@breakpoint.cc header.b=NyqWSSXW; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=breakpoint.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=breakpoint.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=breakpoint.cc header.i=@breakpoint.cc header.b="QpSxh78H";
	dkim=permerror (0-bit key) header.d=breakpoint.cc header.i=@breakpoint.cc header.b="NyqWSSXW"
Date: Sun, 11 Oct 2026 19:19:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791739188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5AooH89o4zvMM8E/DDzL3ZcJekm5O9ctFQKreTMER80=;
	b=QpSxh78Hv/lVsY3m0r6ZUcuPmEtFOkC68rytMTFDY/s4PhV4DMLYK/urXl4jSBYEHjHLPY
	HfA3IAoNGxLC2xEUiFlFOcXZzBeqPlEE+ROF4TjdXDA+fsq9JoVIhCyjo877ZqyPY1NMWN
	bhB33gVM51DIpNEOWmRWWAQjuUsDwIHUmCSWMQHbt7Aug7dCo+Wb5iI9cvWiMKBFvfV0wc
	diFYO5Lt5Ze6FTmoQqeGK7DUA/iIOo8FPK8pX1LeQBTzIplsnyZObu6sBo+ozuE2lEEV5q
	Wr/0rRFKdRnsswHDu3k+Jfm0X24IN75pOlmHTASiPA0lQsubRL4BfkMLx/y2qQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791739188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5AooH89o4zvMM8E/DDzL3ZcJekm5O9ctFQKreTMER80=;
	b=NyqWSSXWDQTGD1LnP3fNbboCSn14CnpV3uEk6zQNmQDBI2C1FIe7PJ2KFDhRQdWQSnnWxp
	NYlnlpAzhc7E70CQ==
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Tancred <alex@narraduct.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
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
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
Message-ID: <20261011171946.gMv8V9Ck@breakpoint.cc>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
 <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
 <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>

On 2026-10-09 20:13:55 [-0600], Tancred wrote:
> 
> 
> On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
> > where certain workloads widely
> > move to x32 and use it exclusively. In the meantime Debian introduced a
> > patch to disable x32 by default (so it has to be enabled at boot time on
> > the command line) because they are afraid of the increased attack
> > surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
> > rpm in rawhide).
> > 
> > Since there is practically no real use for x32
> 
> I only recently discovered x32 and built a Desktop (with all daemons and
> utilities running 10-30% smaller and some a bit faster, with 64 bit
> libraries for eg. Firefox.) My experiment should definitely not decide
> anything, but how much real-world use would be sufficient to justify
> continued presence (more complex compat code)?

"a bit faster" needs actual numbers to justify. One examples was quicker
gcc but I don't see a x32 compile farm leveraging this benefit.
Smaller binaries sounds like a benefit from storage point of view but
then if you need also 64bit binaries (and libs) for things like firefox
then the advantage is probably more than gone.
Also, Adrian keeps pointing out that Debian has a Debian port of x32.
Without an official release (and installer) there will not be security
updates of packages. Without security updates for a "stable release" one
is stuck with Sid which has "latest" of all packages. That is usually
not something for non-developers.

> - Alex Alejandre

Sebastian
