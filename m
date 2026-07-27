Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFAA420485;
	Mon, 27 Jul 2026 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169144; cv=none; b=OnizXZt78XCTNSlPeEAMgsrQHSN0oAVJ7Oi7H5uFgf6xNkEt48T82iPEENuRJeC2Wm3oKWVJnEEh8F6M2I8gEZBlSCUPRqb2GxTvipa3tsk8qXiSG6hfPXfMe/lEjVJ5l+kCtTcpDvcSrLPdT58TXvrW4T1vMxp5CLdt/gIWmlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169144; c=relaxed/simple;
	bh=6Q4jwNn1LOHlBZI7/D5AN5RRj5v/9NYTPdMcVm6lBvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFmHwwgdZTgQrMGrSW5AAWEV3YVnqpk7f61hvlMSggyaLAO8cKspkiREStiQNAV04NALLlnTnk5z/jFzccn/HKC6HeBX4tRGE0FwxgV6LjKIpuqKg+tSebiQdWpUf/dk5UybbePdcDN89PS3Rk1yJ6aZQEae1RJA/gsKItijPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=g8SpdwKf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="g8SpdwKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785169140;
	bh=6Q4jwNn1LOHlBZI7/D5AN5RRj5v/9NYTPdMcVm6lBvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8SpdwKfTgONWMc++Ihnhg9SfdsLfSGZ9/UO1IhREqOSSQfAIGN9rZFPYPhHrg4jf
	 ip7tbctVsvnkwkspNbfnvvCvfGVux0ud/KvoXxs+av0pkB7YRmPCXP2Nji6MHipEny
	 8WxetrahEUqoh9LZlTb5xq0fgI3BgjYVUjly06Rs=
Date: Mon, 27 Jul 2026 18:18:59 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before
 the arch macros
Message-ID: <6a6c1738-bdbf-4beb-9abc-e9c38434b8ac@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com>
 <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
 <ambQ4715PGeb6uFq@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ambQ4715PGeb6uFq@1wt.eu>

On 2026-07-27 05:30:43+0200, Willy Tarreau wrote:
> On Sun, Jul 26, 2026 at 10:16:42PM +0200, Thomas Weißschuh wrote:
> > On 2026-07-26 17:13:02+0700, Ammar Faizi wrote:
> > (...)
> > 
> > > +#define __nolibc_syscall_eval6(_n, _a1, _a2, _a3, _a4, _a5, _a6)	\
> > > +({									\
> > > +	__auto_type __sc_n = (_n);					\
> > > +	__auto_type __sc_a1 = (_a1);					\
> > > +	__auto_type __sc_a2 = (_a2);					\
> > > +	__auto_type __sc_a3 = (_a3);					\
> > > +	__auto_type __sc_a4 = (_a4);					\
> > > +	__auto_type __sc_a5 = (_a5);					\
> > > +	__auto_type __sc_a6 = (_a6);					\
> > 
> > __auto_type is only supported from GCC 4.9. I think this is old enough,
> > but it should be mentioned at least.
> 
> Well, at other places we already have typeof(arg) which is exactly the
> same, more explicit, and doesn't come with such restrictions, so I'd
> rather suggest we use it instead.

Agreed.

> > We really should have a documented policy for that.
> 
> We could indeed. Till now the principle has been not to break support for
> older compilers without a really good reason (i.e. something that would
> become too complicated or impossible to do). At least we should add a
> README in the directory indicating what is oldest supported version, as
> it really doesn't cost anything to preserve support for that for a long
> time.

Also agreed. I don't want to intentionally break older compilers.
But if we know where the baseline is today we don't have to have
discussions about changes which would *not* violate said baseline
anyways.

Also as mentioned by you before, we should not tie ourselves to the
general kernel baseline. nolibc is much simpler and doesn't have
the same requirements.

> > > +	__nolibc_syscall6(__sc_n, __sc_a1, __sc_a2, __sc_a3, __sc_a4,	\
> > > +			  __sc_a5, __sc_a6);				\
> > > +})
> > > +
> > >  #define ___nolibc_syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
> > >  #define __nolibc_syscall_narg(...) ___nolibc_syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
> > > -#define __nolibc_syscall(N, ...) __nolibc_syscall##N(__VA_ARGS__)
> > > +#define __nolibc_syscall(N, ...) __nolibc_syscall_eval##N(__VA_ARGS__)
> > 
> > I'd like to apply the same thing to the __nolibc_syscallN()
> > usage within nolibc itself. While today we seem not to have any
> > problematic cases, at least I was not aware of the issue and breakage
> > might creep in accidentally. We can problably rename the
> > architecture-specific macros to __nolibc_syscall_archN()
> > and make __nolibc_syscall() the properly evaluating wrapper.
> 
> Yes, I wasn't aware of that either. Also I'd like to recheck that
> MIPS continues to work fine because I seem to remember that its
> constraints tend to be harder to respect in syscall6() and it took
> us a few times to get it right. But maybe this could have helped
> instead.

Ack.


Thomas
