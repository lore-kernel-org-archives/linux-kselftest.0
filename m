Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D99332623
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328029; cv=pass; b=Llvr5IZLTPEsNqi75nBOQUF4pdCDPQCDaCBswH9gIynzsFk6UIKxy4aOri7oE1IJasgIBl5R+hkcbPXWy2xd5MMIUwB2Us7VODOj4MwsycCVLggr//tEAYVCVH6mWW3xkOTM7XV98vnMw17ay2g63BFNDeDaoGYl1Qtu7x4eQoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328029; c=relaxed/simple;
	bh=dTdPVfrtLsMlTfHUl6+zlBoUHaF6Mspj1nijccsc8Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LU3UXbnf2mcmFh5ETw3mhmz8Zbd8JI312Uz7N++zLltCESa4EcWZSyQotkiG7BpSMu8zMG+d9n9Um+w0ZYrug7W5fx8oT9w2kL0SS9RSURF+Fb6OLcIXkq/ViywlgLM6lhWb2FCq4EDELKDPiHMUZvQ0WQP5eXPplpbcp/yBGSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVhCoB3l; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVhCoB3l"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b613a17bso13768795e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 12:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782328026; cv=none;
        d=google.com; s=arc-20240605;
        b=N1GqVRrqqe6iozoq0hztkki+R6OCfwjClTfvH8wTNwwOFynqS9kqngJ8iS83ZU4Dg0
         pHG2vwkfVFUeytpIn3fPztDpWxQV8uX05B5zD0lS3cgwsJSy0kr9EoNv4kBLGqOSv1SH
         QcTf7lPPa8tqbL5mvSUzs3K7hxTUmlLWF8ulMxxV/ZiM16qLWlgELuLLiZvb0oozqBa7
         HA8G/1mYk/1ImZEAd0hkFmxVsYk1zwVEgNFpSbhHPxKElDkQnGasltJuXtAdL7Cn6Vun
         3lq4jWgxfs1qUob0CQ4hBNxfjaaUAh1+JZuFqIaFCPEuIJbgTOzjUp3Lr4uITRSIeoCE
         4GXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62RtAAMdOG7011x74VLOvyQrp7SFTtUxM8XkYksByVQ=;
        fh=eV/9pwEcaQYYcAqy6vFYaaz0hpe5vf+hP/awra4ko0U=;
        b=cCHAWeSTVOFt2II/fpWsIAMy31SvxXAVGz38zPA9c+KpP4wyhZx6Hiqmnfo/PDhQmQ
         UuV5sXHTwQq42LuSd98ylLV69au12p0E5llz5Z7wVlYr2Ft3PFfJy7g1Q/aOul1uBwcd
         GSKJqjdesMQuqUuy6TeF9ILuBRhw2kTG3jzzfVk18BmOgUu1mRu6s+hDCw4/yntYWj9I
         YerGa7gzX3eY09dEfCrgEdJimOg70zMYAzH6IaA7qcMfIgcMgsg/I316U/PklZdz1FY0
         SDBo3jfkNAwdnj+WaMAgjnXqKKx+S6rB4Bc0OdZqgO8rRqY4OX10KM1sslm7oYDYfnaI
         7pAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782328026; x=1782932826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62RtAAMdOG7011x74VLOvyQrp7SFTtUxM8XkYksByVQ=;
        b=gVhCoB3lm1MXPO9T55GjGx0+DaVj/lztLpmUk96iRIeTyOxyNlRu2tJETAv7R13wSk
         r+j3Dw7Omo3mMf9A8MDADHQei3+hgkzIhpwYsvgk48YSz2L6dKgHdDsrQ6IfCJx4bZiH
         mMmPztehOn1YQOIMOcw70qOjm/bIbTZqTCPkVar5laaV7DVoNFJurlcm9yos0lnMeSZ7
         rEz6ZohElOLpqEc88Dw/E7nXetz66Q24Mau9jFa6JteFAGFVWqpc7eFNy7ipzxGQFiAr
         PEuZAxv2qDZtb2oB6NVt8iAmtNO9oZuxlxrCwln9/dbP9tA9yDuUvbUgTgWYLX71U8Ad
         rC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328026; x=1782932826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62RtAAMdOG7011x74VLOvyQrp7SFTtUxM8XkYksByVQ=;
        b=ZEPxFDxqy+R0eSqScuboJlz+jnm/+xUNb8qw5B3EQCsaGWDVB8XKiQ7HW7yV+37iw8
         VQHSMgeMralgwmQeIKeT2es4McEy/+qPv71mlRDBEVNUMm9Cr2rcB+RFmB5ka+GlcycL
         BGBAVwkuqi1OS5oRtsnQYQM/PxChFlUYVGB8mVMLpyc8rmHEU5Evrj/VdPS751Hr9M3/
         KUTPo2ecVEGCToH8ATsp+tu+bZVASqF2yNzV0hqUJKmK4cUns+yTNJm0vQU91o+7rKji
         3s+dku69w7fRc6y3zfNRXHiyASS1shAeA+HA1qoPfBlBxGI7qORNZgsTAlBuL1XJY8vA
         RQpQ==
X-Forwarded-Encrypted: i=1; AFNElJ94BznnSZp8Tcm4LvZhFVB1jdX2/RdhoiKuKpT6RrXh4ilBWnuGOa/8HgFpQ9rJxhEpUOjeiThYHndKtJyfXwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Q006WFE4zC7MwVCyTmiVN8BnsSKuFFJu9COa+Vi0bdhkd558
	yCir07jKSPm0HKj7dL60oISOnZ+kTIuJr0f0i9sfP8794QtZh3Z9q+JPRZPiL++JLoISA1J9Aic
	BdTzwtZF3/QJMzTbLbMsdCuEGbKv0qOA=
X-Gm-Gg: AfdE7cm3sCavICzUTZGtf/VuvKYOXaPqboPsWy9+CHWvv749sr2P5C7z2/5b4gZ6Xhs
	lEwrZhBzgSAQZzyyQwCivwOe2Lds/0p3NhEWB/z2In/KdbTEJQNSuxyNEtlGlERvYoG5PADLYvX
	CtNwg8h01ezj//WOrReLRBzwrFiiEiVBADTcu/GQB5S5msg5t0Te9+e8tnhQScQnuw4+mggSBDs
	xovphNZjIlStCujfPhVgIR/jjZSIfpN/nwYr2DUnPVQa6O6MejMH03m2CXPjQVaxPRaMBlCnGXH
	PGXZDQTZb+ZF3DFvderi4fp9vry6YHj1A2eWt4A=
X-Received: by 2002:a05:600c:a51:b0:492:379c:32ee with SMTP id
 5b1f17b1804b1-49249083c09mr358068975e9.6.1782328025896; Wed, 24 Jun 2026
 12:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com>
 <20260623111533.2285005-3-ptikhomirov@virtuozzo.com> <CAKEwX=OaKTfNqzwa=djLxZDeBbR1+DKdqDnxdfPfZFKB-K+ECA@mail.gmail.com>
 <c390081b-7b2e-4b83-9bca-5f93eec6a939@virtuozzo.com> <CAOQ4uxhPROaeEyYceKNsL5QVwVPkTjGtbRr1P_TYXTA0fHvRoA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhPROaeEyYceKNsL5QVwVPkTjGtbRr1P_TYXTA0fHvRoA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 24 Jun 2026 12:06:54 -0700
X-Gm-Features: AVVi8Cef9aZmI2zHP0TU9bg-9tvoxUc7Rq0PSUmFsfd-hngauFECj4f6N_uHz4Q
Message-ID: <CAKEwX=MedyK8aDM=oe=Hbzo77mJOEp0Pmo0u8N4HhvikosVbSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] ovl: support cachestat() syscall on overlayfs files
To: Amir Goldstein <amir73il@gmail.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 7:16=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, Jun 24, 2026 at 1:45=E2=80=AFPM Pavel Tikhomirov
> <ptikhomirov@virtuozzo.com> wrote:
> >
> >
> >
> > On 6/23/26 19:12, Nhat Pham wrote:
> > > On Tue, Jun 23, 2026 at 4:15=E2=80=AFAM Pavel Tikhomirov
> > > <ptikhomirov@virtuozzo.com> wrote:
> > >>
> > >> Overlayfs forwards data I/O to the real (upper/lower) file, so the p=
age
> > >> cache lives in the real inode's mapping and cachestat() on an overla=
y
> > >> fd returned all zeroes.
> > >>
> > >> Implement the ->cachestat() file operation by forwarding to the real
> > >> file via vfs_cachestat(), the same way ovl_fadvise() forwards
> > >> for fadvise.
> > >>
> > >> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> > >> ---
> > >>  fs/overlayfs/file.c | 18 ++++++++++++++++++
> > >>  1 file changed, 18 insertions(+)
> > >>
> > >> diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
> > >> index 27cc07738f33b..a7e252a91ea43 100644
> > >> --- a/fs/overlayfs/file.c
> > >> +++ b/fs/overlayfs/file.c
> > >> @@ -518,6 +518,21 @@ static int ovl_fadvise(struct file *file, loff_=
t offset, loff_t len, int advice)
> > >>                 return vfs_fadvise(realfile, offset, len, advice);
> > >>  }
> > >>
> > >> +#ifdef CONFIG_CACHESTAT_SYSCALL
> > >> +static int ovl_cachestat(struct file *file, struct cachestat_range =
*csr,
> > >> +                        struct cachestat *cs)
> > >> +{
> > >> +       struct file *realfile;
> > >> +
> > >> +       realfile =3D ovl_real_file(file);
> > >> +       if (IS_ERR(realfile))
> > >> +               return PTR_ERR(realfile);
> > >
> > > We're propagating the error of ovl_real_file() all the way to
> > > userspace right? I think we need to handle this.
> > >
> > > For example, we might get -EIO here, which is unexpected and
> > > undocumented from cachestat's POV.
> > >
> > > Maybe handle it and just return -EBADF or sth like that (with some
> > > updated documentations, etc.)
> > >
> > > The rest LGTM, but I'll let overlayfs maintainers check the
> > > overlayfs-specific bits :)
> >
> > Yeh, we probably can use EBADF here instead of propagating:
> >
> > Man cachestat(2) says:
> >
> >   EBADF  Invalid file descriptor.
> >
> > not really a bad fd here, but probably close enough not to rewrite man.
>
> Please don't do that.
>
> Re-read what you just wrote - it is ridiculous
> Because of being lazy to update man page,
> we are going to send a confusing error to user which tells them
> that their fd is wrong, which it is not.

I don't think we're being lazy here. It's technically more work to
handle errors and updating documentations :)

I'm more concerned with undocumented/unexpected behavior (error type
in this case). -EIO was an example that I saw in ovl_real_file()
itself, but I'm not familiar enough with overlayfs to know if that's
the extent of it.

But I'm OK with just updating the documentation with a simple note
that other error maybe propagated from the underlying fs, if no one
else thinks it's a problem :)

>
> >
> > I'm a bit hesitant though, since in other overlayfs operations we alrea=
dy
> > propagate, maybe that was by design?
> >
>
> Exactly, plenty of overlayfs operations return EIO for unexpected
> conditions, often accompanied with some assertion as is the case
> with ovl_real_file().
>
> Even though many man pages don't document an explicit EIO error
> code, it is obvious to any experienced sys admin that if EIO is observed
> they should look at the kernel logs, because an underlying subsystem
> may have reported critical errors.
>
> But in general, man pages follow development, not the other way around.

Fair point.

>
> Thanks,
> Amir.
