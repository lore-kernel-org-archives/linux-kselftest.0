Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D536285CBC;
	Sun, 26 Jul 2026 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097006; cv=none; b=PMtmLnO4OqNUPpb84MHURn9ydrEwn9qSSCYR0TLs5jpieMw1G8V6XyDSk17Vr8ZbvtGKZeNWxFbzVTLQ2RIgxyWr3ugRWrGdZWVoKreDQfc+Qc6BC/Duprf22r217c6OaCsz+ucTurReiBARyQwxpHRkov9uCxYtvJeFBWC7L28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097006; c=relaxed/simple;
	bh=7x6DPoKsRFIyt31fR9JZdxF3EJ9wq3aDUR0nnxR2a/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVioWaY8Ce1eduQSZHE2oWKXkK6lBjpryuNvUpYhPYSN/SNHIhIeHt26ptpUzO1p2OS4JcGn4UD0xOC77vglZ1WbeEsgF1XlIA0jhAzUx8LYg3crsAZs9gJq8/H+EvLXzevA2HJl6gzsoNc3UtufqnDOL/KUH1D5bPx0Bd9lajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UG8+x1XR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UG8+x1XR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785097003;
	bh=7x6DPoKsRFIyt31fR9JZdxF3EJ9wq3aDUR0nnxR2a/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UG8+x1XRP8KIGaCQ/FtynfdpoGQyIQzd6M4YUBxJfD45WTS9Lg2lXl9WQE7Ce61vw
	 oedGg3/0Dr2udfHnpP9Ch4JjOXZJ9GJMi7AzxL/yfhRmuxAMR2r4HJRWNjhjbindti
	 9Z6m+sZncynI6gPFc2wGlxGebpM8blcjdwQFWRF8=
Date: Sun, 26 Jul 2026 22:16:42 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before
 the arch macros
Message-ID: <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726101306.3772237-2-ammarfaizi2@openresty.com>

Thanks!

On 2026-07-26 17:13:02+0700, Ammar Faizi wrote:
(...)

> +#define __nolibc_syscall_eval6(_n, _a1, _a2, _a3, _a4, _a5, _a6)	\
> +({									\
> +	__auto_type __sc_n = (_n);					\
> +	__auto_type __sc_a1 = (_a1);					\
> +	__auto_type __sc_a2 = (_a2);					\
> +	__auto_type __sc_a3 = (_a3);					\
> +	__auto_type __sc_a4 = (_a4);					\
> +	__auto_type __sc_a5 = (_a5);					\
> +	__auto_type __sc_a6 = (_a6);					\

__auto_type is only supported from GCC 4.9. I think this is old enough,
but it should be mentioned at least.
We really should have a documented policy for that.

> +	__nolibc_syscall6(__sc_n, __sc_a1, __sc_a2, __sc_a3, __sc_a4,	\
> +			  __sc_a5, __sc_a6);				\
> +})
> +
>  #define ___nolibc_syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
>  #define __nolibc_syscall_narg(...) ___nolibc_syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
> -#define __nolibc_syscall(N, ...) __nolibc_syscall##N(__VA_ARGS__)
> +#define __nolibc_syscall(N, ...) __nolibc_syscall_eval##N(__VA_ARGS__)

I'd like to apply the same thing to the __nolibc_syscallN()
usage within nolibc itself. While today we seem not to have any
problematic cases, at least I was not aware of the issue and breakage
might creep in accidentally. We can problably rename the
architecture-specific macros to __nolibc_syscall_archN()
and make __nolibc_syscall() the properly evaluating wrapper.

>  #define __nolibc_syscall_n(N, ...) __nolibc_syscall(N, __VA_ARGS__)
>  #define _syscall(...) __nolibc_syscall_n(__nolibc_syscall_narg(__VA_ARGS__), ##__VA_ARGS__)
>  #define syscall(...) __sysret(_syscall(__VA_ARGS__))


Thomas
