Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B23546EA;
	Mon, 27 Jul 2026 03:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123049; cv=none; b=cjKXa2rzvUyO7Yqp0yJ0UThVKskJC3kVQQ8MiXVvUFoYa3IQvyGvWFtR3muhmcE1s8Ies54dEkb6wWQ4nJBzt0GU4tCFbATGBhlwb+rRr+bC8D6+q3+Smnefc1kst6kL5Fw45eg2h5di65E13yOlo+h1eaSsu3hqS7TG4Yze/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123049; c=relaxed/simple;
	bh=2Ycg6ink1MaIpaf4D/69QeuqWAQxtCWWaNC5j8n5b3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0ppGv1Rs010W/BTKq//y5vQEVYHTchaTDGfX65VPQd0BAJxHh8KrWmZEdmFzZM9Ki7kVzaEsW3//nYJOoS9Qk7wndcvQ8lthjaoxk9+Z8HfhHho0J3jypKUIeAOJ7a+ycQ1AMYXkre5yn7chCPh43C9F5n6lRS3SO7OU1cK/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=T41kn0Ir; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="T41kn0Ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785123044; bh=WGKn6QhZ4rvQnzMBTwg5k1gzG7lv+E92XHwgrK6gYi0=;
	h=From:Message-ID:From;
	b=T41kn0Ir7Crybp6VlVy75QVVp1QHGQYAgE5JmKDaDUUO+aaZ+Br5oyL98zlF0Ppf0
	 WRogrtlWXh9OkFyElLopiYuSMvLERCrTQu79gkEm4x3SuI4g6bO1/RJI0lljgKxa3D
	 b5h+dOpZ8tqvdX6rzpXyEhX1QmCIZsCC2JnKy53Y=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A4954C0A6E;
	Mon, 27 Jul 2026 05:30:44 +0200 (CEST)
Date: Mon, 27 Jul 2026 05:30:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
        LLVM Mailing List <llvm@lists.linux.dev>,
        Yichun Zhang <yichun@openresty.com>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before
 the arch macros
Message-ID: <ambQ4715PGeb6uFq@1wt.eu>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com>
 <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>

Hi Thomas, hi Ammar,

On Sun, Jul 26, 2026 at 10:16:42PM +0200, Thomas Weißschuh wrote:
> Thanks!
> 
> On 2026-07-26 17:13:02+0700, Ammar Faizi wrote:
> (...)
> 
> > +#define __nolibc_syscall_eval6(_n, _a1, _a2, _a3, _a4, _a5, _a6)	\
> > +({									\
> > +	__auto_type __sc_n = (_n);					\
> > +	__auto_type __sc_a1 = (_a1);					\
> > +	__auto_type __sc_a2 = (_a2);					\
> > +	__auto_type __sc_a3 = (_a3);					\
> > +	__auto_type __sc_a4 = (_a4);					\
> > +	__auto_type __sc_a5 = (_a5);					\
> > +	__auto_type __sc_a6 = (_a6);					\
> 
> __auto_type is only supported from GCC 4.9. I think this is old enough,
> but it should be mentioned at least.

Well, at other places we already have typeof(arg) which is exactly the
same, more explicit, and doesn't come with such restrictions, so I'd
rather suggest we use it instead.

> We really should have a documented policy for that.

We could indeed. Till now the principle has been not to break support for
older compilers without a really good reason (i.e. something that would
become too complicated or impossible to do). At least we should add a
README in the directory indicating what is oldest supported version, as
it really doesn't cost anything to preserve support for that for a long
time.

> > +	__nolibc_syscall6(__sc_n, __sc_a1, __sc_a2, __sc_a3, __sc_a4,	\
> > +			  __sc_a5, __sc_a6);				\
> > +})
> > +
> >  #define ___nolibc_syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
> >  #define __nolibc_syscall_narg(...) ___nolibc_syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
> > -#define __nolibc_syscall(N, ...) __nolibc_syscall##N(__VA_ARGS__)
> > +#define __nolibc_syscall(N, ...) __nolibc_syscall_eval##N(__VA_ARGS__)
> 
> I'd like to apply the same thing to the __nolibc_syscallN()
> usage within nolibc itself. While today we seem not to have any
> problematic cases, at least I was not aware of the issue and breakage
> might creep in accidentally. We can problably rename the
> architecture-specific macros to __nolibc_syscall_archN()
> and make __nolibc_syscall() the properly evaluating wrapper.

Yes, I wasn't aware of that either. Also I'd like to recheck that
MIPS continues to work fine because I seem to remember that its
constraints tend to be harder to respect in syscall6() and it took
us a few times to get it right. But maybe this could have helped
instead.

willy
