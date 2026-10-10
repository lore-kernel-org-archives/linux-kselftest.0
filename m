Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313D3CC303
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631884; cv=pass; b=FWWPQCNHYC/FabL5JoDyKLwl8fgxhNn+9VOxlMzE8RDQPYIuKD2tyPZObqQg6jsmNW2NMiq5n8t9m0rwnxKH2s1DAxDhp72gbQmFzS0BoRjrtx6FzNHA4TQSBmLaIidTaoIO7Rx3VmKG71nzN3qgr2JhVyeqIAeniLj8IxuQha4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631884; c=relaxed/simple;
	bh=gv4uWDfgFmz9WVtkNmwJAWshwTrVyFn/VfmnlB7WXT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qg3ncFJ1bWE5KsrlKI7UIyXhuIp7DdNSL04WeW5rW/DwBiRlIcS5nD4VssIAeY11EK+MW5QaIgRLE+7vxY7uJePGbQuSNWE1/8D4iKJ4TAZudcj/AarmnNObsRPJi+Vy1vRC0rpXIvBPqfYWoqi+pPI/aoiE4kmMI4+EzeSJvn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty+929uB; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty+929uB"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso821932a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 04:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791631881; cv=none;
        d=google.com; s=arc-20260327;
        b=Hqg2DGAnmFhK10tlyw1NJYGa6atgFiV2Ev+LK+C2IG3OCmt9dmI4SJdXhgrHP2wdeI
         rlAfH6e4bcZzRyiJLeQzNWHYZv9HVUNr9+is67OJcyIDdfuNJN882zH5KsgYyZmtD/Qr
         uRnzNkKyFSgb5E9DpnQ2bsHs0aXKcriHX5WwHJKdCC9GcDAq4yrqB6/Mwf5W8E+eI3MC
         QSrLFAdFzhlw+ZoHYg83E1R4Vk5v/9/7/Uf6AkoZzbNHtn3W9rM0zzX2pGDmdY2FHsDd
         YU3bO5nHKKF1MKqg/n/r6e4FNkgTFJfYpmj/6GfP6v8LWWU36oOH+mgU25lb3I4Ejgv0
         lZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        fh=rqvDzmb4Fe1SKrIwvOVcISfS9mHOj0fvGmrYizEm5D4=;
        b=o7VJU181sW2547JnbH0mEra9GZL964byY7gtPbvpv1uf2IK404zN6JfTuk4MxHgUWm
         o2tkL63y9b7Zo3dsJhNVRAENJdpcBt89GaDT/vPivd/d4rdN42DwxSsIvLSP9i+fTTt2
         zpEbuu4pYNBlx4yoFwa0Jf7DroXOgRoXCN4mgmtpSO+54+mAEOYAKjUAcuP87JKhGL1R
         5m+DaJUGq/P4f3o6f8/hoVQW2H4ObI/DohxLbR/M5z7gIxwI/wFNn7wVcBKjaa3/o8Ke
         wkLmNAnnJ3cXr2vlXvx2m3syR9mfET+5985HMZv2PnbhmW3NwzcpwP3azHXw9lzQk2Ke
         BoRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791631881; x=1792236681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        b=Ty+929uBFE6ZVVF6ZS+zXaFPyt9i69Hh1w7OmIJOIg9KnXJ7USpRZkNTAp33g1wslU
         XsPOehdqC1fk4lPlGSf32B+J6tdsKmPWxbyJ1qJUTDfNcD2gsQQV7JxWqnmywrMRbUHv
         oz2qG3y9F2lkwMQeE+E2zTqteIvOYdAaHOrTVqw+d/b6ZCVfZeOPwxTXPlXrT+qkqxVs
         j2PMuOqOhBCdcX1A/3AyeTzMwPa8GQBqUdExTRQ2E3Cp3AOaxI6pwTJ1eJvHTsoNWeyu
         h54Q7AQjhdteX1QxjQYvF6RNw1rDsY30hIAmyxWQyJHxsQlUJzcyjdwRs1G3REwT4U6m
         UHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631881; x=1792236681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        b=cNpDKOamGoEFIkckWGphK6U/P2aBOL89QHZeqh8B6J/js7SZa8pVVKIrqrq+Uhbcuc
         dVkUIVifXss5TYAcTYJXlsibQagTZNmk7AYqrkI1GFzlc5gtgBuQJrmsfg80TSC52xtP
         53wqMipHEOTpP7lNXOf44Ewg2rOaC2uUUmY5OGlMOuBuR+aIjQ9l8pESTJWjMah5GIT7
         QyHoXD08dXPOZGEzlZ4EKcPB+XmpF87J6OVosHWwq4KxKo5UFBBVNqnoEGoZujBZRUeT
         cng9zqyXAiAmAgSUYTX3zPyNX/5polkjHRfvDuE+rM8dkNVQ4SlzOtYNkXJX/oa6vvQS
         BDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhEeUKQZUNxT6gzhI9Y/zuIp0Bp8DAsKTgk+ohkKeujkQonU0WSAxDOKyrNrzo4tpT+h+jJWJPP4VxARzEILA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO6yUus06U9miGHNeAy+fXgEhn5EsBd/3UYPvw2UfsPWcCEvPu
	c7JIdvhoT8p1xWQy+4EBf2ANLgD+zsiXrRa6VOFxUmbLBGLvA9yqoaOnVbXxzaQ3kUtCQcwwAlJ
	Knvgp7wKZfL8u6ZR07cThFRWYrdVjEgE=
X-Gm-Gg: AYBFou0LqSNOvj2BvvCEQzXDeF6PtoVrJ3ihOPKA2JFd5BuQ49EmfhIoV9mHhNPfVpY
	W4w+D2mAsCoJMQ3gH2xtWR7eJw6s78m0ghbYBNIjzo6woodCjjPi2B4yNiLgRL2QAz0CPP6w1rh
	vvom1DL6BUA6bycuNplQnQt7Z1tEdeugf1Snj1E5MrsvYgnwAhTqO6VFWZwMQ4p1jsnBjCGl4kR
	I8Nf4FrbYWoCUg81UqbwGT0xTMM7y1ZNLu88jCf7ZuGus8rREru04Ghn+yrtIfjzb/FoRq1ut0f
	OJ7LLE7j2NKlvNaDFm3s7abs2zwLWFU5NIMhNlpRn4exQwRjua+TSd7Bh6dxga/oeKxhmBBsCEt
	LGhUN1Ja0WPyw6h/PBj8ApOnQk2xLTcMfRTm6HLuq8A==
X-Received: by 2002:a05:6402:501e:b0:6aa:7ff:4ebf with SMTP id
 4fb4d7f45d1cf-6b17c23d561mr4283966a12.15.1791631881629; Sat, 10 Oct 2026
 04:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009092759.968521-1-linmag7@gmail.com> <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
In-Reply-To: <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 13:31:10 +0200
X-Gm-Features: AclHuK-k44Zg3lCAgQHkrzNsPm8zibwWe2DLtPLR_2BC02_lZn9oOvK_TySUOe8
Message-ID: <CA+=Fv5QCu4W0msvg9Wx4koVtiiu6GKNWji1vJOmzveD6PX9hLg@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
To: Matt Turner <mattst88@gmail.com>
Cc: kees@kernel.org, shuah@kernel.org, wad@chromium.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:28=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026 at 11:27 AM Magnus Lindholm <linmag7@gmail.com> wrote=
:
> > Skip the pre-notification signal test when /proc/self/syscall is absent=
,
> > rather than unconditionally skipping it on Alpha.
>
> Nothing in the tree skips it on Alpha; that was only in v1.
>
> > +/* Alpha returns positive errno in r0 with the r19/a3 error flag set. =
*/
> > +# define SYSCALL_RET_SET(_regs, _val)                                \
>
> r19 is still the fourth syscall argument at an entry stop, so this
> relies on the callers also setting the syscall number to -1. Worth
> saying so in the comment.
>
> > +     if (access("/proc/self/syscall", R_OK) !=3D 0 && errno =3D=3D ENO=
ENT)
> > +             SKIP(return, "/proc/<pid>/syscall not available on this k=
ernel");
>
> Alpha selects HAVE_ARCH_TRACEHOOK, so the file is there and this never
> triggers. I guess that is why you have 12 skips now instead of 13.
> Please drop the hunk, or send it separately for UML and friends.
>
> With that:
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
>
> Build-tested only, with a cross compiler.
>

Thanks for taking the time to review this, will put out a v3 asap

> Unrelated to this patch: with the selftest setting a3 itself, do we
> still need the fixup at the end of alpha_elf_gregs_set()? As it stands a
> tracer cannot skip a syscall and have it return a small positive value;
> it comes back as an errno. The r0 =3D=3D syscall_saved_nr check in
> alpha_finish_syscall_to_user_mode() has the same kind of problem.
>

Interesting, I'll make a note on this and look into it later, you may be
on to something here.

Magnus
