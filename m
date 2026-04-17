Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADED938F64A
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438690; cv=none; b=PzvQGCqZYiUgpH3drRp0wDpcINPqrviVYmCrBeCLJ+SjIW4pHUGFQ87w1ksna7nhj+zMa9B8NDqW6R0b83/PelpNXPZk2PAKk7Bl1sPLmDrdLJ6PjI39GQ0Nk23w8HFALj1ZSKbS1sSxl19w6roL7MkVpV8wBw7SRqNr2wv1LjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438690; c=relaxed/simple;
	bh=xxec1yHgJbPl8i5bLrRlB9bA5QiiLXD6oseWcH7kBdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D75SDNj6Sy8Yi6DCdBO1rGNEqPXc+1k7R8yWmbwZ79BQm7epC/OkRiyLCxF0Z7ABgE4QMAtNYdwd+8jCYc7gtRp2cCqQuO1+W/htBNkOQ0sUa+FDX7J2LDRrNIoJiH7az8v5gaBYZjVWUT86eQuM5JHjOxBELKQwxyujpZov6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YvPrmU8Z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YvPrmU8Z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48896199cbaso8585295e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776438687; x=1777043487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKQfwAZAy6UM0COAZ8ddWWHLIY/D6XGoxFUGJBdu8NE=;
        b=YvPrmU8Z8bNbPYNfgy+iMOwre+gGjTLzAEGFkdkKgeMpd0q6BDDsDgmTaUVGQF9znO
         o1iGGrOdthMZ06Tgev8NMO+ccbWRa0kkZt2D3l5hjMpmO19TkUOeBpHcKuKXCbfenN+v
         4yD1ZQGFSQbngDj72BqF6cwTO6yUKKOUuF0jObnF2yTNAElP5Lq92DRulyLfSsYlPL7C
         ySgxfy2BhGz7CahL+ZHWMBrHXwqXTYiDqpfSNjg+wYeC3tDamAD34lU554clKYfiLBy2
         d3/EZ/vpqxqJGRERE53Tkjn5tI1YAvtYC7Pu83lrZvHZyR55VP0tfpisFSGKDha7IcLz
         wCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438687; x=1777043487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKQfwAZAy6UM0COAZ8ddWWHLIY/D6XGoxFUGJBdu8NE=;
        b=SyBv2Ntiuz00gT6REGmp8u8z5JzeAXOFwgGs3yboX5+20+Jv/dMrQv7SDiU/P1Iumr
         9tOyb9Ci58ew/VBHI09aqHKbAeCF4pZV5A7x+K9rJCIBJykqQH4PwIihaWbhSu6Y+FpK
         a6OH6YqzBHh0bEJbSipqBQbxrYvMfxccdJrnmF8/MRGv5Z6F1xFJVJDH7TKV2c+MHP7/
         fZ8qlI42TCm5msd/cOGbreKEnSShmKSLkwjj75Bs4sZjKHs8uFVes2UL0n22kwoeo0Pp
         Ov/M9y3GjJrs3nGi2Sggdh1mZV6iPlRjIQNkn0/tTO3xyguYfoJfIJQ8bCKe6fCjgdcX
         WNDg==
X-Forwarded-Encrypted: i=1; AFNElJ802E9ATL8NvDaVnmcIQHynB7GwcROVrNZ/xChTDOybvx+4ksqmP3RQBnnPwbQ7OgLiaKR/d+I05y+gmHCfl7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfossdjnxH86PUdYSIR4MszgV5CtbAsoWJlumuGs18lWjiSzj+
	75zhlFjOR8DS4hf+PI8Sn0qEEx1BsTBRaR6Ok6iXK/c4bXQDpdwWTnQszI2USRSXnsg=
X-Gm-Gg: AeBDietcb71YD6PmIpc4penYNzs7KZGyV5aoZztNjCDibm7Vf8f/M99m/CVuUTKJ/aT
	pdQzjqhvOs1SRBYKNoUfqMeASMMT+K7wvqI7G72+r3HFib63NBp3CdcPdS1B4q9B24TJnx+hsMr
	+z8rn6qatKoFoP0PKB4TmpeDykMcYQc6yNKtyjnQDV88u4XbekqcQH7jIOOqveaFNu3JMdQ9u/T
	V/U5me9f4AG2y687W9qFQz75Q/1wtpf5Z0EZVMZTFyHMi2iAiA1bQm/p11DFWEbjVPF75WgTGsi
	twAqYt8Mc3uTlWxq13x6Mfah+3FJuO1bss5OcLgcvXaiqZFvIfErN8K+A0HKvSepdKOganh8G33
	CF+xpOw5+dY2WFK5oVUNhb8pP6yEqdk8Q0VnWckljKhld3jfbo890fBpuW6FCpEYF4gielIEXEi
	xMFufao5RjDC5BclhQNPYCV+LqSb3oVplA9Ww5KlaXTFjNUKc=
X-Received: by 2002:a05:600c:c090:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-488fb74e130mr34312005e9.8.1776438687044;
        Fri, 17 Apr 2026 08:11:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb794d2esm31681085e9.6.2026.04.17.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:11:26 -0700 (PDT)
Date: Fri, 17 Apr 2026 17:11:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] selftests: livepatch: Check for
 ARCH_HAS_SYSCALL_WRAPPER config
Message-ID: <aeJNnFqLEdMgnHKh@pathway.suse.cz>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
 <20260413-lp-tests-old-fixes-v2-1-367c7cb5006f@suse.com>
 <alpine.LSU.2.21.2604151154330.1967@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2604151154330.1967@pobox.suse.cz>

On Wed 2026-04-15 11:58:50, Miroslav Benes wrote:
> On Mon, 13 Apr 2026, Marcos Paulo de Souza wrote:
> 
> > Older kernels that lack CONFIG_ARCH_HAS_SYSCALL_WRAPPER config don't
> > have any prefixes for their syscalls. The same applies to current
> > powerpc and loongarch, covering all currently supported architectures
> > that support livepatch.
> > 
> > The other supported architectures have specific prefixes, so error out
> > when a new architecture adds livepatch support with wrappes but didn't
> > update the test to include it.
> > 
> > --- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > @@ -12,15 +12,26 @@
> >  #include <linux/slab.h>
> >  #include <linux/livepatch.h>
> >  
> > -#if defined(__x86_64__)
> > +/*
> > + * Before CONFIG_ARCH_HAS_SYSCALL_WRAPPER was introduced there were no
> > + * prefixes for system calls.
> > + * Both ppc and loongarch does not set prefixes for their system calls either.
> > + */
> > +#if !defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER) ||  defined(__powerpc__) || \
> > +	defined(__loongarch__)
> > +#define FN_PREFIX
> > +#elif defined(__x86_64__)
> >  #define FN_PREFIX __x64_
> >  #elif defined(__s390x__)
> >  #define FN_PREFIX __s390x_
> >  #elif defined(__aarch64__)
> >  #define FN_PREFIX __arm64_
> > -#else
> > -/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
> > +#elif defined(__powerpc__)
> > +#define FN_PREFIX
> > +#elif defined(__loongarch__)
> >  #define FN_PREFIX
> > +#else
> > +#error "Missing syscall wrapper for the given architecture."
> >  #endif
> 
> I know that Sashiko commented on that already but even with that I wonder 
> if it was cleaner to structure it differently...
> 
> #if defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER)
>   #if define(__x86_64__)
>   ...
>   #elif define(__powerpc__)
>     #define FN_PREFIX
>   #else
>     #error
>   #endif
> #elif
>   #define FN_PREFIX
> #endif

Yeah, this looks better.

Best Regards,
Petr
