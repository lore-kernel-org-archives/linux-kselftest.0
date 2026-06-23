Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0623A6B8F
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246918; cv=pass; b=iFGmdSvzH76k+XosR67JqKs1Lcn8JgyWqZfmekkEkVQkwdc3GSE83R+W33axBw7xx1Az7vEztLCumGj3Ay0Pn1c52CY07+FvtbFAlyEn9sMO3Tm97QhovWeTFa/w/FOly63a9zmMGbioI2yk37zfhHIr2ii/z0N1DvheRMvKmMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246918; c=relaxed/simple;
	bh=1u1zjusxjkl7u4PKGa1cGLQbRmP20DgSwXktq2yu5B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emiDH+xAcpf1WoP8pGA8f6eeD8Hx4Cm6nE5lsHmQWxBt6RS5PhTwfDy75I8YKAqKGH0fyJu79t159iBf+978ioLOgfPrC33ud4EST5eKpbgkPYxJBjxsdhEXms4JvAGA+Q99gzwchYPSu2at5tbrR3EIIcj5eX4ir/fIbmG1h6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbAMVJKC; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbAMVJKC"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4865b9e16d4so159065b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 13:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782246916; cv=none;
        d=google.com; s=arc-20240605;
        b=e99viA8RmtyqXV2VuTrGSdq/aE1ana9mTFOp7YMgbYymxxPwxWlN1vkj/yIxSiBHYL
         FhLex1Y+BhFLvqHFXaRX0R1pTU5xvtM8EGv9SZnIl9yCNvMaCSmqYk5bPNtqpbWUQKuk
         qdb21ygmLhtuqsH5lnVJW5VENRA7Q7WBwNz4YzWKMiQ/X19eOUce6XFeOLr1qJcs8WzC
         caTIQcm+8vG0R64f94GKC3WiAlvNpU9h2sOBDvGL1XCquCZwa7Rn1Jb77nSgtHRhF80t
         muGeRW16EB7sCtGegkj2HwFkYJRWfNp9ltR0nl84Bd1yjFN/2NwMY1fCTaakl1AoLr7Z
         REJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jn7ncJBrXK948Ro9HzPmcDhz0jzCr17fg/cQrz5PFQ=;
        fh=QEOjxzKBFfD6K3ShqIARD6rcOyrxaW9zhbmTwEkyaP8=;
        b=UBp+oDbPqv6nXIpjlv66nYGJ+QqMHrWF44TwXF5u0TZieE20GXtMx9xjDGn6mEf6j3
         ik0xqjgycTwgz9sht10K5E8IUST3A77u4kSNDPHsZ4Js7dJJR82ThrVTMNVzorLUsYEu
         MWnjtSJZB+Oh/0FYDkIH8Fk5qgaOBIIIuC2uNSWBbIldSfzn+MfMmv6uXiqTwA1vjr/5
         M535MFyjGTxoDcPRczpSm16MsPnp8FNiKSjsuYikN3LBgbnO+7Qj0t0eCN2XF2mgaqkB
         AxysRBatnw8/2FqVq5Tj9BTIBAOTj4JQ7OvwSsBSuU2vJEqClhfmoHqFDUKcHHsLoKbe
         /NxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246916; x=1782851716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jn7ncJBrXK948Ro9HzPmcDhz0jzCr17fg/cQrz5PFQ=;
        b=cbAMVJKC0PWsgVd3yli7zB6KSnLdDgAqV3OC2mXGK6KAmFlh9xJfG6xG3Z5Oag9qWn
         RjH2SpB72hKH3TQJPPg2Wnk0KgnVqDhRILOWmd4O8tUJWbPm23JPGIIDy00DXG/W6gph
         cxgqGTpdvfk5MDMuuA8AVMoiksNaeEfMeJOxskrJ1QRyYOWEFbh17CRpWC/Mlqe38uRY
         bSb0liTKibG7riL1DVJ282MPX2W4cHvPJYz2GjoVvwV/BTsrLPevRqYVZy6OsOuLCNPm
         Ar8hRfIDqBQKhP/Z/AwpNIdOiQmWn4kiVnOs3r9Lww0M5rJkarZtQRunxL2qwIo32yug
         yb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246916; x=1782851716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jn7ncJBrXK948Ro9HzPmcDhz0jzCr17fg/cQrz5PFQ=;
        b=o7DxVdkxwgR9EjN2ehWkqEK3hzzffQeLUeOb5E/Ih2+S6LZREBCZfteemgAiKoN6lL
         +XpVFMNwcYzdL9TX7FFr7rYxHQ8wwfwZdqDzQhjGIJiYEcLVPBstRYC9KppdpNjB044d
         ufmj5jZa7x/9mzpzW+GQDJtIVFJ44OtBmyB7PzwaC1Dao9jGlLvbLAK97DF6N6kQtM3F
         h5TDh8kDC0Un/lc0A3SJfcZ5KrHHkzmWtTKijHS8n9razDi6yfUZesCJaEfn/P6xAnKP
         JUTsxNSYnzSXVSUGsmBpJNg0++KTLc2rqAnmfApH+/smvqllqLa8PWTy9e5PGlFmNn6Q
         nUMw==
X-Forwarded-Encrypted: i=1; AFNElJ/eVRpgq+4K4RkOtM+b3A0S4BRk6eUvfgFNUStY0c2cHe97l3cuUmONJ1GjP6daVt17DxYTSOIwEa31RvCc1NA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1f56sAtcRpiGLSZseYKUvA0u7tFiALAg4i6aAF9Bexp3FQn1
	WV+jSGeP/VppjKcnAIFZOgd7RBBpAsSytJOZEos+CB3MKu2TKYloM0Kd3zK46tn0wEETVSfegmN
	aUtpgziCIzf1vtThdaYnXqA0mdtU6QN0=
X-Gm-Gg: AfdE7cnpjnMPIvD06hCln8GkcoGnePCpa2HyVhWizfdp+Gmdb2A71xI+CvRNYnPvEvE
	kK5ev+FaSj2DWEfGOtepGNpMGTZU8pHWyabuQ/aRhZh2Zm/VbR0s4HFLxj6Ej6UnUWQt0zHpfMM
	Oe+qoFmeVL3TOJQGvLKcsSf9dAGugl8Ik9Wgs19pNES/Wvdxrm1t3yRxshBUgmsEDa0wISCD8zX
	FZIKy0dI/pGW2NJnwLqUZVGqh1zTtF04VYflR49qZyXF0aOTVR40DtDv+Dz41qNiFJzVpU0Y9WR
	RlbUeqdTsmESmiZHvg0ueOgmGjt12eS2xYN47tvM
X-Received: by 2002:a05:6808:c185:b0:48a:aaf2:5b67 with SMTP id
 5614622812f47-49079496167mr265841b6e.31.1782246915981; Tue, 23 Jun 2026
 13:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
 <20260622043934.179879-2-farid.m.zakaria@gmail.com> <202606231236.325C882A78@keescook>
In-Reply-To: <202606231236.325C882A78@keescook>
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Tue, 23 Jun 2026 13:35:04 -0700
X-Gm-Features: AVVi8Cc6baAOrvpg7bti2txnm7y_PAHygqiZFWgpLTsnuazHS3APcFuR3dcSQas
Message-ID: <CACCo2jmyExCoWyWy7VKvm9nVpKi1Oet6jGaSsNs0Wddr3Hu+hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs: support $ORIGIN in ELF interpreter paths
To: Kees Cook <kees@kernel.org>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	shuah@kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for all the improvement suggestions.
Yes, I leveraged an LLM to generate the initial code (open & honest)
but I'm willing to keep refining it to whatever state upstream
requires.
Thank you for not dismissing it outright right away.
(FWIW, the initial code was even worse so this is the product of me
intervening and editing it, despite my lack of C expertise).

A few more attempts at convincing :)
* musl also supports $ORIGIN
[https://elixir.bootlin.com/musl/v1.2.5/source/ldso/dynlink.c#L911] so
there seems to be strong convergence on the concept beyond glibc
* ideologically, everything about a program should be portable easily
from one environment to another (the goal of systems such as Nix).
Userland has allowed this support in nearly ever-space and the
DT_INTERP / shebang path from the kernel seems to be a missing gap.

We also have the shebang patch ready (CC @alan.urman@gmail.com ) but
we wanted to see the reception to this first.

I will wait to update the patch based on your feedback and Sashiko's,
if you are convinced just to avoid spamming us with more patch files
:)

Farid Zakaria

On Tue, Jun 23, 2026 at 1:14=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Sun, Jun 21, 2026 at 09:39:33PM -0700, Farid Zakaria wrote:
> > Currently, standard ELF and ELF FDPIC loaders expect a fixed path to th=
e
> > dynamic linker/interpreter (PT_INTERP). However, for systems utilizing
> > relocatable dynamic interpreters (such as Nix/store-based environments)=
,
> > hardcoding this path is inflexible and breaks binary portability.
> >
> > Introduce support for resolving the $ORIGIN placeholder in the ELF
> > interpreter path. This maps the dynamic linker relative to the path
> > of the binary being executed, matching user-space origin resolution.
> >
> > To avoid code duplication, implement a shared 'resolve_elf_interpreter(=
)'
> > helper in the VFS exec layer. For safety, limit detection strictly to
> > the prefix string "$ORIGIN" to prevent complex parsing exploits.
>
> Does any other OS that implements ELF support also support $ORIGIN in
> the loader? $ORIGIN isn't even part of the ELF spec at all and is a
> glibc extension, IIUC.
>
> I'm not excited about path-based string manipulations as they end up
> being racy, and mucking with loader path seems like we're inviting
> trouble (since the _binary_ specifies setuid-ness), and we've seen
> issues with $ORIGIN before, even strictly outside of the kernel:
> https://seclists.org/fulldisclosure/2010/Oct/257
>
> > [...]
> > diff --git a/fs/exec.c b/fs/exec.c
> > index b92fe7db1..0978ae613 100644
> > --- a/fs/exec.c
> > +++ b/fs/exec.c
> > @@ -2024,6 +2024,48 @@ static int __init init_fs_exec_sysctls(void)
> >  fs_initcall(init_fs_exec_sysctls);
> >  #endif /* CONFIG_SYSCTL */
> >
> > +char *resolve_elf_interpreter(struct linux_binprm *bprm, const char *e=
lf_interpreter)
> > +{
> > +     char *pathbuf, *path, *slash, *resolved;
> > +
> > +     if (strncmp(elf_interpreter, "$ORIGIN", 7) !=3D 0) {
> > +             char *ret =3D kstrdup(elf_interpreter, GFP_KERNEL);
> > +
> > +             return ret ? ret : ERR_PTR(-ENOMEM);
> > +     }
>
> But even if we did take this, I really don't want to incur a universal
> penalty on exec for it. This is doing a kmalloc+dup (and later kfree)
> for all non-$ORIGIN execs. So even if this gets added, it needs to be
> handled differently.
>
> I would probably say this helper should return a struct file * instead
> and have a fast-path for the common case. I think a check for leading
> '$' (if strncmp doesn't get inlined) would be okay here as far as
> "incurring common performance cost"; that string is almost certainly
> cache-hot.
>
> > +     pathbuf =3D kmalloc(PATH_MAX, GFP_KERNEL);
> > +     if (!pathbuf)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     path =3D file_path(bprm->file, pathbuf, PATH_MAX);
> > +     if (IS_ERR(path)) {
> > +             kfree(pathbuf);
> > +             return (char *)path;
> > +     }
>
> This still just _feels_ like an info leak or a race condition to me. I
> can't give a credible example, though. But it creeps me out. :)
> (I note the blog post also says "and the shabang" and I get even more
> creeped out about seeing that patch.)
>
> > +
> > +     slash =3D strrchr(path, '/');
> > +     if (slash) {
> > +             if (slash =3D=3D path)
> > +                     *(slash + 1) =3D '\0';
>
> This is not idiomatic string manipulation.
>
> > +             else
> > +                     *slash =3D '\0';
>
> More readable, IMO, as:
>
>         if (slash)
>                 slash[1] =3D '\0';
>         else
>                 path =3D "";
>
> But does this match the glibc resolution logic? i.e. should it be:
>
>         if (strncmp(elf_interpreter, "$ORIGIN/", 8) !=3D 0)
>         ...
>         if (!slash)
>                 slash =3D path;
>         *slash =3D '\0';
>         ...
>         resolved =3D kasprintf(GFP_KERNEL, "%s/%s", path, elf_interpreter=
 + 8);
>
> (requires the trailing /)
>
> > +     } else {
> > +             kfree(pathbuf);
> > +             char *ret =3D kstrdup(elf_interpreter, GFP_KERNEL);
> > +
> > +             return ret ? ret : ERR_PTR(-ENOMEM);
>
> This is the same as the logic top of the function. This repetition smells
> of the LLM. :)
>
> > +     }
> > +
> > +     resolved =3D kasprintf(GFP_KERNEL, "%s%s", path, elf_interpreter =
+ 7);
> > +     kfree(pathbuf);
> > +     if (!resolved)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     return resolved;
> > +}
> > +EXPORT_SYMBOL(resolve_elf_interpreter);
> > +
> >  #ifdef CONFIG_EXEC_KUNIT_TEST
> >  #include "tests/exec_kunit.c"
> >  #endif
> > diff --git a/include/linux/binfmts.h b/include/linux/binfmts.h
> > index 2c77e383e..17419cd3d 100644
> > --- a/include/linux/binfmts.h
> > +++ b/include/linux/binfmts.h
> > @@ -150,4 +150,6 @@ extern ssize_t read_code(struct file *, unsigned lo=
ng, loff_t, size_t);
> >  int kernel_execve(const char *filename,
> >                 const char *const *argv, const char *const *envp);
> >
> > +char *resolve_elf_interpreter(struct linux_binprm *bprm, const char *e=
lf_interpreter);
> > +
> >  #endif /* _LINUX_BINFMTS_H */
> > --
> > 2.51.2
> >
>
> So, I guess, I'd like more convincing, but I'm very happy to see a KUnit
> test included!
>
> -Kees
>
> --
> Kees Cook
