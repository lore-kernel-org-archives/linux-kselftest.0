Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A6B28FFF6;
	Sun,  2 Aug 2026 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785656145; cv=none; b=MJpS8+9NV+W5FTLVPEsFmvebWlcFdJRvJKMMNcVMXwUUkVTVr+2dImvUgYEHlgZQJFkyGB+auTwVRC7VSA4UeS1A2MKnQo9FzLVVVIGGAmliCJ5KCQFjyl6dk237wDILx9coW77xjx1Q04+QVGB7p1Imsk7eHi1m7KAmAj4OErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785656145; c=relaxed/simple;
	bh=jzoG35uz+3GEOl7eYxXfbiq148R8sNqFySWMDuZNu7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDn8nrFdG9WIptIdmKBJwQbU3X5YR1NflTp7cHhyFEn5Yr+pAyI5C6/lUWudXnmxDhOVS43hpSmdCWLO0lXxLSNhfvs+Hvsi5yqRq9JwzX92ck/I4WrRxh2qfDCQM/fdTpOiwpTf3FThIHqOtzrorLEpMESwgO3pWnvR8iqRIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aP1xTx4E; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aP1xTx4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785656134;
	bh=jzoG35uz+3GEOl7eYxXfbiq148R8sNqFySWMDuZNu7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP1xTx4EVvU5Gg49lEslrC2nEYXgEpWWMId6hdNhxZz9bnblKNf33yaQlh5X5HKIC
	 RjUyNcuJp0fB1A549BxTLl8/IySyWj7Nqs6IZVjSP0tgL8GSKQ7ILdV4z4jSkKdxb0
	 7X1LkzgwU9jrvFAVxvOrX/hLDCHBVY9KseX2uUPI=
Date: Sun, 2 Aug 2026 09:35:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2] tools/nolibc: add support for Alpha
Message-ID: <d46a3915-1ab5-40ad-9311-711d60c12d5e@t-8ch.de>
References: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
 <CA+=Fv5QROOqTtQL7y7x8FDfL2ejJY+P5mCfDR1khJBDEGFCDOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5QROOqTtQL7y7x8FDfL2ejJY+P5mCfDR1khJBDEGFCDOg@mail.gmail.com>

On 2026-08-02 09:06:59+0200, Magnus Lindholm wrote:
> On Wed, Jul 22, 2026 at 3:28 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> 
> > + * Syscalls for Alpha:
> > + *   - registers are 64-bit
> > + *   - syscall number is passed in $0/v0
> > + *   - the system call is performed by calling callsys
> > + *   - syscall return comes in $0/v0, error flag in $19/a4
> 
> typo in comment ? should be:
>  syscall return comes in $0/v0, error flag in $19/a3

Ack.

> > + *   - arguments are passed in $16/a0 to $21/a5
> > + *   - GCC does not support symbol register names
> > + */
> 
> > +#define __nolibc_syscall5(num, arg1, arg2, arg3, arg4, arg5)                  \
> > +({                                                                            \
> > +       register long _num __asm__ ("$0") = (num);                            \
> > +       register long _err __asm__ ("$19");                                   \
> > +       register long _arg1 __asm__ ("$16") = (long)(arg1);                   \
> > +       register long _arg2 __asm__ ("$17") = (long)(arg2);                   \
> > +       register long _arg3 __asm__ ("$18") = (long)(arg3);                   \
> > +       register long _arg4 __asm__ ("$19") = (long)(arg4);                   \
> > +       register long _arg5 __asm__ ("$20") = (long)(arg5);                   \
> > +                                                                              \
> > +       __asm__ volatile (                                                    \
> > +               "callsys"                                                     \
> > +               : "+r"(_num), "=r"(_err)                                      \
> > +               : "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5)  \
> > +               : _NOLIBC_SYSCALL_CLOBBERLIST, "$21"                          \
> > +       );                                                                    \
> > +       _err ? -_num : _num;                                                  \
> > +})
> 
> One observation, although I am not an expert on GCC inline-assembly constraints:
> in the four- through six-argument wrappers, $19/a3 contains the fourth
> argument on
> entry and the error indicator on return. Would using a single read/write operand
> for $19, similar to the handling of $0, make that transition clearer?

Good catch. We had miscompilations from clang in this case before.
So I'll fix this up to be on the safe side.

> Michael’s successful testing on both XP1000 and ES45 also shows that the current
> implementation works correctly on real hardware, so I do not consider
> changing the
> operand representation a requirement for v3. From my side, addressing the $19/a4
> comment typo, together with the "TASK_SIZEi" typo already noted by Willy,
> would be sufficient.
> 
> Michael’s testing should be sufficient, but I also have access to Alpha hardware
> and would be happy to assist with any additional testing if useful.

Thanks for the offer. For me Michael's Tested-by would be sufficient.


Thomas
