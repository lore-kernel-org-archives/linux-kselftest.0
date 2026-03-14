Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D0346765;
	Sat, 14 Mar 2026 04:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773464350; cv=none; b=qjiNgCfWR6DgekuB1N1PaG9moHEoyD0fjXR5PftCx3s4ACdrK2S+aRgYzRt6G5Ulxpc0Z8RHTuvToG6qA2NXwXyJSf6ofGudKMubEKjwxlJmuFAiUZxlhyuCQIi1OANYSXoTX7S/lX7L6Q1+UoRnu9qWK7fMkZ1jad9yM4JOhmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773464350; c=relaxed/simple;
	bh=sknc5QTnUGkqfR2Q3ZabAqgL993nQCozw+E2Br4+KcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaV/+oi3138ov9Cc+qAJ4M8Jgl65Ro1JYs8eoBTDiQLQ+QbCl5Fxhoef6pVBlC/dslqwIV/aDnwdvB0ATKlM4OihEIVvd3aijkelz1PmmdCSnTnapi6mFs11BnvKzXfe7ndrr4KWOvMYIn5xYZTD0078CLQjsru4W/SuFltY8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=XDHri6XH; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="XDHri6XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1773464346; bh=8vp+v5pd4DcOz73mp+rNiITmztp1JQwQbumasiqAMM8=;
	h=From:Message-ID:From;
	b=XDHri6XH0MnRDFIaHEJ5XHWJ1HXnoEFiTjjyAF5zvYHH+UVN4VpxnCWGuch1SLaOn
	 A1xRKgglK8WmgIF4qO4pTY0AIdsWmIgZn+OG1CeS2J6rpZzisWTZALyYYQCSsVLDGx
	 pFy2bTQoJsY3qmN+Kp2WcAbqY0oblR5m2mWMhweM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A156BC0AC5;
	Sat, 14 Mar 2026 05:59:06 +0100 (CET)
Date: Sat, 14 Mar 2026 05:59:06 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/nolibc: add support for
 program_invocation_{,short_}name
Message-ID: <abTrGufSlaVqbl18@1wt.eu>
References: <20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net>
 <20260313-nolibc-err-h-v2-1-f4481053b07a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313-nolibc-err-h-v2-1-f4481053b07a@weissschuh.net>

Hi Thomas,

On Fri, Mar 13, 2026 at 09:26:28PM +0100, Thomas Weiﬂschuh wrote:
> Add support for the GNU extensions 'program_invocation_name' and
> 'program_invocation_short_name'. These are useful to print error
> messages, which by convention include the program name.
> 
> As these are global variables which take up memory even if not used,
> similar to 'errno', gate them behind NOLIBC_IGNORE_ERRNO.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  tools/include/nolibc/crt.h                   | 26 ++++++++++++++++++++++
>  tools/include/nolibc/errno.h                 |  2 ++
>  tools/testing/selftests/nolibc/nolibc-test.c | 33 ++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+)
> 
> diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
> index d9262998dae9..842f86e41f2f 100644
> --- a/tools/include/nolibc/crt.h
> +++ b/tools/include/nolibc/crt.h
> @@ -17,6 +17,7 @@ const unsigned long *_auxv __attribute__((weak));
>  void _start(void);
>  static void __stack_chk_init(void);
>  static void exit(int);
> +static char *strrchr(const char *s, int c);
>  
>  extern void (*const __preinit_array_start[])(int, char **, char**) __attribute__((weak));
>  extern void (*const __preinit_array_end[])(int, char **, char**) __attribute__((weak));
> @@ -27,6 +28,24 @@ extern void (*const __init_array_end[])(int, char **, char**) __attribute__((wea
>  extern void (*const __fini_array_start[])(void) __attribute__((weak));
>  extern void (*const __fini_array_end[])(void) __attribute__((weak));
>  
> +extern char *program_invocation_name __attribute__((weak));
> +extern char *program_invocation_short_name __attribute__((weak));
> +
> +static __inline__
> +char *__nolibc_program_invocation_short_name(char *long_name)
> +{
> +	char *short_name;
> +
> +	if (!long_name)
> +		return NULL;
> +
> +	short_name = strrchr(long_name, '/');
> +	if (!short_name || !short_name[0])
> +		return NULL;

Here it should return long_name, not NULL, since you want a valid name
to use later. I'm seeing it passed to strcmp() for example.

Also because of this, I'm wondering for the first test about !long_name.
Either we consider that it's not possible to have a NULL long_name and
we don't need to test for it, or we consider it is valid, and we should
return a non-null string (e.g. "") so that the rest of the program
survives it. Both approaches are fine to me, but IMHO testing for NULL
to return a NULL that will crash the program later instead of just now
is not very useful. Maybe returning the empty string is still slightly
better because it allows well-designed programs that check their argc
before using argv[0] to survive.

Cheers,
Willy
