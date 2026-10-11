Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4921A457;
	Sun, 11 Oct 2026 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740322; cv=none; b=AreTF+BvfabpRmjkfX/9zFhdYdx9iDnamNTWJPVTbwTJqTTSkpWdMab/2gz0Mp4L0VEkewDw9cgDYEVEBBxKL98wuZ6+NH0U929TIj5M6nWoY1NWgSJfZYWes5Qc0B2xnSu0twAH+vg6hND67aCXsXifQHLwwRTKsLgKp3Xf1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740322; c=relaxed/simple;
	bh=yO7TYUdsNEouy+r8LNXK9jTl+YP+UbRG2kou+F9S2Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o72yJhDa2Rrq60jg0cOXEjm/AvQ5VUHVySwW9t8rHEYPi2JgdQJEjfuqCIypYoMRepayKDvZ/hdhxwhIWZ/V+RLJXYja/Tl0IKo4cJTEvY7V24eN7UCzpIFYLNC0NFe7nO8qGNYuYVCB5KDjkRalCAfZ2b7nkP39PM9WsGxwKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=lsJd3Mgp; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="lsJd3Mgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1791740310; bh=s9SvmzBmiwivVauLGFTbFp3qv/QIUAQiXVjv0kh1bWE=;
	h=From:Message-ID:From;
	b=lsJd3MgpzqlNQwkq4cvLnFsSkXJRgiIuLDYHh+mZX6iNnyXTP0C4eRHn3suNHLVNk
	 OpNeO/ugLo+uUkXJ6zZkXEARp78wDjvk380s4WDwQP59vZl17ZYrdCx4Hsa4xFyCFl
	 tlEvJnUpUGPc8y3eUIGXEQb7AiMTzCOKdr8FapYM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 7FD9FC0920;
	Sun, 11 Oct 2026 19:38:30 +0200 (CEST)
Date: Sun, 11 Oct 2026 19:38:29 +0200
From: Willy Tarreau <w@1wt.eu>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Tancred <alex@narraduct.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Tomas Glozar <tglozar@kernel.org>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
Message-ID: <asvJlVyfxMVqw2E2@1wt.eu>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
 <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
 <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
 <20261011171946.gMv8V9Ck@breakpoint.cc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011171946.gMv8V9Ck@breakpoint.cc>

On Sun, Oct 11, 2026 at 07:19:46PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-09 20:13:55 [-0600], Tancred wrote:
> > 
> > 
> > On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
> > > where certain workloads widely
> > > move to x32 and use it exclusively. In the meantime Debian introduced a
> > > patch to disable x32 by default (so it has to be enabled at boot time on
> > > the command line) because they are afraid of the increased attack
> > > surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
> > > rpm in rawhide).
> > > 
> > > Since there is practically no real use for x32
> > 
> > I only recently discovered x32 and built a Desktop (with all daemons and
> > utilities running 10-30% smaller and some a bit faster, with 64 bit
> > libraries for eg. Firefox.) My experiment should definitely not decide
> > anything, but how much real-world use would be sufficient to justify
> > continued presence (more complex compat code)?
> 
> "a bit faster" needs actual numbers to justify. One examples was quicker
> gcc but I don't see a x32 compile farm leveraging this benefit.

FWIW I do build my ARM cross-compilers in a32 because they're generally
~10-15% faster than in a64. I wouldn't be surprised if that was the same
on x86 because tools such as compilers very likely use pointers a lot. In
a build farm it certainly makes a difference, possibly not sufficient to
justify keeping a kernel port, but it's just to illustrate one valid use
case.

Willy
