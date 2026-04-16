Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01803B38B0
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340751; cv=pass; b=e4xtpMaM1umohKoFLKQ6TddibwFtJPAecKxInTD0zzYFEZO24DtzGNEyYwImhqCqXfl4Vg0Iso+l3KHVl/np9uLOwKXsH/t8IlNk6um1e/YvJEhBihR6IWicliQs7zrJj1HqUZgpXzuYEvzyzHIEmlmgztMiUA2GogMvhZ8A2Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340751; c=relaxed/simple;
	bh=Bw7/eU46XNMmEAY5yaZoewjP327xtGOJwYlC+oEFeMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWe3e+VDVJDTfm01QPUqXAs7RVyzqW+lKVaRY/Hf/eV6PNWMTWHvBIhm4oxhKnhvr7C8aP/c2ztSlCqltxtmu7bBvPxmsMaMhkcZncDB8MS58aR+eU39bajdJGyFuLaIo1oUp2BenMYwt80lce675DzYbudD9o+SoZ8NbQyDYto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yv/iJipA; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yv/iJipA"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so4738486241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 04:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776340749; cv=none;
        d=google.com; s=arc-20240605;
        b=a2crv8jB1qg0cXSJ4d1wQvTsE+rc7tXKLX0dt9FQHSpdx9Bu8XyRhDHMFOiFks9yxW
         0h98RC1ll5/Kh7Ijqu4SDXOsMggTgRnooLUCePALgQTyBL54ULkRBiZjqR8IQ7/4x+xo
         l/baCA/W8lEqGlMZmsK1TEiDJg2+zUO1t8A6ZNnIxEu2XbsbV2FelJlce1X61S51eEAH
         0gPa2HnYufzxhmd9bLngVOQh5Yo08mg7ajKIpuFE0lD5ueslNE6fAChCZbNCsnzJjY98
         k5pspSv0eNYw5FlFa22mNGt/M+3yTc7LIXer75AeNYh7jkVyzWBm451rg5ZIBKaFYbUN
         Budw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqYJ8R4iGWahwud4pP2JmsmCHvSHhoaPalUrCsDrudA=;
        fh=DPWEXvZ4KJJkTbNXCvyY+zT7rLq5LbkKfkbhZM2eAug=;
        b=kh91Cw2WIeFu5woCSAFYemOqHv2lbhPY57bugykhHVteNpEvlZ02lNWm/PHKmUHyKR
         cxYwLbEmYUJUkuoTePdPig7FKlCxg1Lr49ejgIETFcBJABa6H1CAb2D8Oh+Qa7RQ5qBH
         0r7ignDZuIogx6j0MkhJSmqloy9cJN9KJLbSQ06b1Ia1pL7zwKYsQn9OFnZnCbX3H29N
         zyJDcXncLyPv/wnIHe3DLOfgAXmwRLcq4NBIbSFHZuPr9tqcV5n+dcbNOI8FtXmxZfSP
         e++xa1Cs4JBoBpWyyRSqVYB2rufi+4rhoyU2ChPbxzMN4eLkRUW2UG0OVDivt2yMhbbd
         3CUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776340749; x=1776945549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqYJ8R4iGWahwud4pP2JmsmCHvSHhoaPalUrCsDrudA=;
        b=Yv/iJipAA+nhsL4hM00ueWwDagedY8BECDRzHx12spLwNgoS8ZakY4zrK2dkiR6l2J
         mQ3pEXXlrCi9kMRBkZi2YHE6qORxLcsWe+D8l+wjDn8HWOrCtWjKCgf5gVQmenh2NByp
         MCPNQ/tGjC/7AKKVlE3P3sIa6vn80p3d3lTSYo8ONK1oz6WoMzmPVNtYluTYxoNlq/gl
         23amyKa5o+u6+Qji1591D7SZNcgKyeEHjHsrOnz+jlamox/cVrUC1NkqUB4QzAKYFrCI
         XYiMktKmpNaISctvSp/Zchtq++MLrF/hVgPWAelzahh5Lq/eJ/sH7+6gxH0vD3vgUtNt
         7D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340749; x=1776945549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqYJ8R4iGWahwud4pP2JmsmCHvSHhoaPalUrCsDrudA=;
        b=oFb1+nAeyZRmFvWy7soUIOLJPN/PVtmH5uqF2oi7XjmDj6jayKhh0X3mhxsioddG9e
         nbAIc5xUHP4TbBYSmW2yGGYXJ7OLBoST06KD1DkCcdjYuESbNTBTtNe/rgPqf8l5VkJF
         DMLwsutQ/32G+9HiIS4Gg3DNgTR1Ty4ANNusyMKYjr5KQH4tiBn+lGtJYxe6uUYSB6n3
         IUCHkLsPGNIFdsc6hEToX8BKzTWJjNUwrbzU1/OpMhRw+hcyUOKkgbal4nXEe/8rB0qn
         tZ1gvszvGiGtCWDH25KxZSpTbdHmCXrs3Nu2NM4dSJf0ghpaCVq/KxkIPIWgYoEdPo0F
         1Z0A==
X-Forwarded-Encrypted: i=1; AFNElJ8ImvVsM/V4pMW+UtuS39hWjbz24I0BPCqCEC2CGhCE/Nkq0nuz1IM75gqlBjK96+gbDL9pvxeQGqG/jJIzvDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkX16OhevAEcVgCT1xgk8fUmscFiuk1ItCKMeSvkdbOXDNael
	R5gdb2r3ZBpCEdVBbRcxgP9GB8auAsrIfb+XXeI7g1u9cc4QCeDUgchcTclyoYDpJ7I83QlAU72
	5+zr/DMQtOFyYlaehvtfDHmBf/ioNeac=
X-Gm-Gg: AeBDiess71ANEDy6Nfn5QtBnwZHgrEOW51UCCHDhoSrWzmc9ALrAyECKJtYdl/cMqaB
	uqDiyhuh6MfyCE6lc9jiaF0GdtdObCP+cLlY9czl8a6gq2LLMqXj5MyKMxndl2cc6okUbHmeEUJ
	36r/F+y6D8gy3vizTrJtJY39RESzr5B55LzPvve+ubxzGL0SUWkCaQtBA7R2ZccQqphwSKym8sB
	dWFyR6r1ZWPDh/vuG1VWK8+adD1Iq6Q6GqytDGI1J+z6WXtZqDMLjwtO+z75lqVXRn1sdF11KC9
	6to0+Cm9B3tJeHo5Lc4tmqCSULx3yCPx7GLe5JWPTA==
X-Received: by 2002:a05:6102:6a94:b0:607:a3cb:4573 with SMTP id
 ada2fe7eead31-60a00c36c76mr12126981137.26.1776340748680; Thu, 16 Apr 2026
 04:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328172314.45807-1-dorjoychy111@gmail.com>
 <20260328172314.45807-2-dorjoychy111@gmail.com> <2026-04-16-selfless-milky-wasps-shin-p6liRL@cyphar.com>
In-Reply-To: <2026-04-16-selfless-milky-wasps-shin-p6liRL@cyphar.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Thu, 16 Apr 2026 17:58:57 +0600
X-Gm-Features: AQROBzAEjiDzwaGAEKhFLRhObmxO2qMMzryZZhbLCURVPls0DvUuWHW8g_k7mMU
Message-ID: <CAFfO_h5kWCYszymaY=tPAbpU=PjLFxsND+CWSYtypN4iuW+qPw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] openat2: new OPENAT2_REGULAR flag support
To: Aleksa Sarai <cyphar@cyphar.com>, jlayton@kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, chuck.lever@oracle.com, alex.aring@gmail.com, arnd@arndb.de, 
	adilger@dilger.ca, mjguzik@gmail.com, smfrench@gmail.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, davem@davemloft.net, andreas@gaisler.com, idryomov@gmail.com, 
	amarkuze@redhat.com, slava@dubeyko.com, agruenba@redhat.com, 
	trondmy@kernel.org, anna@kernel.org, sfrench@samba.org, pc@manguebit.org, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com, 
	bharathsm@microsoft.com, shuah@kernel.org, miklos@szeredi.hu, 
	hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 5:41=E2=80=AFPM Aleksa Sarai <cyphar@cyphar.com> wr=
ote:
>
> On 2026-03-28, Dorjoy Chowdhury <dorjoychy111@gmail.com> wrote:
> > This flag indicates the path should be opened if it's a regular file.
> > This is useful to write secure programs that want to avoid being
> > tricked into opening device nodes with special semantics while thinking
> > they operate on regular files. This is a requested feature from the
> > uapi-group[1].
> >
> > A corresponding error code EFTYPE has been introduced. For example, if
> > openat2 is called on path /dev/null with OPENAT2_REGULAR in the flag
> > param, it will return -EFTYPE. EFTYPE is already used in BSD systems
> > like FreeBSD, macOS.
> >
> > When used in combination with O_CREAT, either the regular file is
> > created, or if the path already exists, it is opened if it's a regular
> > file. Otherwise, -EFTYPE is returned.
> >
> > When OPENAT2_REGULAR is combined with O_DIRECTORY, -EINVAL is returned
> > as it doesn't make sense to open a path that is both a directory and a
> > regular file.
> >
> > [1]: https://uapi-group.org/kernel-features/#ability-to-only-open-regul=
ar-files
> >
> > Signed-off-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>
> > ---
>
> Aside from the nit below, feel free to take a
>
> Reviewed-by: Aleksa Sarai <aleksa@amutable.com>
>

Thanks for reviewing!

> > diff --git a/fs/open.c b/fs/open.c
> > index 681d405bc61e..a6f445f72181 100644
> > --- a/fs/open.c
> > +++ b/fs/open.c
> > @@ -960,7 +960,7 @@ static int do_dentry_open(struct file *f,
> >       if (f->f_mapping->a_ops && f->f_mapping->a_ops->direct_IO)
> >               f->f_mode |=3D FMODE_CAN_ODIRECT;
> >
> > -     f->f_flags &=3D ~(O_CREAT | O_EXCL | O_NOCTTY | O_TRUNC);
> > +     f->f_flags &=3D ~(O_CREAT | O_EXCL | O_NOCTTY | O_TRUNC | OPENAT2=
_REGULAR);
>
> It's not clear to me why you dropped this, I didn't see a review
> mentioning it either. (General note: Ideally the cover letter changelog
> would mention who suggested a change in brackets after the changelog
> line so it's easier to track where a change might've come from.)
>

Thanks for the general note. I will keep that in mind.

The review was from Jeff Layton in v5
https://lore.kernel.org/linux-fsdevel/5fcc2a6e6d92dae0601c6b3b8faa8b2f83981=
afb.camel@kernel.org/
" 1. OPENAT2_REGULAR leaks into f_flags - do_dentry_open() strips
open-time-only flags (O_CREAT|O_EXCL|O_NOCTTY|O_TRUNC)
  but does not strip OPENAT2_REGULAR. When a regular file is
successfully opened via openat2() with this flag, the bit
  persists in file->f_flags and will be returned by fcntl(fd, F_GETFL)."

I think it makes sense to strip off as OPENAT2_REGULAR is an open time
only flag (like O_CREAT and the others already), right?

Regards,
Dorjoy
