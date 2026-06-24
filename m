Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40C3C10A4
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310602; cv=pass; b=Ot2zj0zsKERmEe0aIENIVa0+FoVeZSGx1FFkOj2V3JPlSUpzQPn2blwKOCBVkdcXJlVVCJME/uSvLTmobZ0GAQVunpERccbg1jKKPfe9E7w8cjmIrwoL0hlGDpaEI6qxe+78+YbKjvGic/DmUAGIyHP/hBzkpaUlTXcyhuqNOY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310602; c=relaxed/simple;
	bh=C+gNPHz4KywkYN7bRW5o/LIam8QAzcc06RneqyLy4Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6vWqXs40oYhTbi1rK5qFjAi40jqyPhi2TO1KrWTnH4jwWPDhXbJ1zgQe1yOjuyHbkVdxim23174DV9pkVGx6zA0YtAaELftsmNX5H9KwCPkhAt/xHzvlDKeLAFnzCCcwSBFl/+Y/HaZtqmrl+P4RH84cWgECD5SSm/RIKo8OQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mp7WPDsx; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mp7WPDsx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c0b97e268f3so155526866b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782310595; cv=none;
        d=google.com; s=arc-20240605;
        b=HoNp9cZNv/fiWo6gJ5d4KEaUDt1EvvNskJ4caLovyrgMwwHllWhXIEn1uej6pqQcTk
         WCcZgTvmeqTBzE0oQCYJyJAVvWv7eQ9OJm5ueD0Fh1CCp92ykGSlkNDaI7RHdN5rFBZP
         wlDxHYV7Xi0FbK/JdXVusX8+PsmfJP+tI66NOz9gKtQkS/oHtZwohnfqBaw/DpcFSerj
         XB9snA00LNyggQ4AEBabtMEdR0ceDMdg7m3pHOPZ8uK03qqS490YKEPhIDvEnZFmRHzb
         wGsS4lFQRZpPXBVFLE5snztuKSlY0jSpPau3nWfEBRZSl7OjfUUEC03eavH2ZB5s9Xza
         ZW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofp3hEpmgBuA2Xl9gZnye4TILLUrjr4efPci3kviMPY=;
        fh=lBkkt7x2YsKUahcu5v0Ctkgz/3mV72Va5tGsRZ0Wgxc=;
        b=cNIXqnCKysC0xUbE8MdMLAlNfoETt0m+lgYRzXg+QAwD3wMy/oRREfVzR/VEV2t7vL
         0JLsKs0gsID36saQ8iHrhdGzw+Lec3NhWeR+K7LgHUsYtIc6pQKHMsqwUJHVl2Y5yNF0
         7uc1zqDJXK3yodGx0HkLa5bryu+9kQe+MKXU9KDxl4oeuieIMAmH8LQ/l3BF0MugjRaS
         WnrTq2gY5bKmygJnvIw5Rt8Vh213HO37AKF6wsxCyFjv0DYgKVWntF5iChGj28QRPG28
         UzKFsbgS++awOYezWXlpPsVgL3tzGvveFmyV8gYl5DBfh/NsjPe5hHqUBbqRGqnT6JoJ
         Gykw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310595; x=1782915395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofp3hEpmgBuA2Xl9gZnye4TILLUrjr4efPci3kviMPY=;
        b=Mp7WPDsx9tx7+TGBJpV5bdT+0V6Bvluay+GgAv/yVjk4WJxpnu7uJ1O9gE2AVhNjNt
         /SRvJRBDTtePlHTO1CYBZ80lkuvdeLV8Ik5ZzxmQ6cXXcRN1JyEUV4KwYar2q26ZS7QN
         6IgAjj4SdBRTGQYZCYkVhdVXBBRD2gkZ3NpeF/JCjVn9927EP1XdbtwG/gjWy3OiLYzN
         2yJ9kJqbNff012wpaNVw8CBiwu6fNfbof3rkMFvXb8yO6qIsM39l5d8x9uA+PbybiA2L
         Gjxt1Gz/7d+SfdOzfkIjoQX+NQCeyfFUYNSlqeNxdGTiOvH5/tBtOSv9KMgdepqMHz7+
         R4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310595; x=1782915395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofp3hEpmgBuA2Xl9gZnye4TILLUrjr4efPci3kviMPY=;
        b=RaGuPaQLGjyFOKiRpl/cqnOGhgV+Iuzb8jdW9qxoSgcfHbM+tmwA63TLzdWwVBmiR9
         USzkclOoVUVtg+2oDCy1f/KrUVfl4q+SVDojKgoMSLpayC5ydsYUisCP5vAQdI7B4xlV
         JeT5iGcRyiO4GYxMBCpIo8K+eLQDO3VFK71sN5100MRMJ1Hc7q+ooC03QBNgvJ8GH4sv
         7aCY760m/XQp9d9aNybw6aCWb2wAWpdn5nBOEfuo9MLxLGiAA13QZrJYkfTRHqJkJLTe
         Di8Fp1anks8jDCIRImaO40g6qnpgG5Vs8uwanalSlG459W7I/2xVYVJ2FGxBPy+iq+yY
         hA7A==
X-Forwarded-Encrypted: i=1; AFNElJ+CjPNrXJzrsmSs9XH1wwGJ3zRkjO2s9Txh17yaYxyWj59ATTnHFjQes56YOpQZDg43rfOnDQfUOq6NAdCuenU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVw/EJo/fdkQ09t+4ZvGEF92jlVdHDG15tITqnhr2EN4RriSw
	SNqdaRavL8Fr+zYsBRKJhWxseRXtSVi8dtLi6epItmh8+d0bu7HP2PcAbuk88HLjn+bvLO587ec
	+iMfRt7yG1d6V5+unpD0ETpHuYRybCLE=
X-Gm-Gg: AfdE7clPif06FC01dJxqKlFQD24gR4r3ZbBnX1R3rK4JHhEnzbixRrBHHscAzZpHFrW
	yLVcjopDLgecfISCymIs/KPxW08/y94pTpCKLyAHhVSWoA9+xVS4MgGliu/1uXziOdyrtIdgqCh
	tpCv7prYvDXCitzb8wXPHkOGeMFKeDSvFWIojSgwLINGMtAXXdQ3aWSy1qAYIwSj9K38n/NqPgA
	8d1FvjxZxV7NdPanEQZjMOddP007EoLzjXbQ20z48JkHNCbZIIFlnvSs3TVwX5Z+Q6SXSCwWFBX
	horFMvLNletCVxiKKCj51H7uoQx6yItDQjxaC+jXsQ==
X-Received: by 2002:a17:907:6092:b0:c08:93fa:2a62 with SMTP id
 a640c23a62f3a-c119ce79d5bmr206413566b.2.1782310594693; Wed, 24 Jun 2026
 07:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com>
 <20260623111533.2285005-3-ptikhomirov@virtuozzo.com> <CAKEwX=OaKTfNqzwa=djLxZDeBbR1+DKdqDnxdfPfZFKB-K+ECA@mail.gmail.com>
 <c390081b-7b2e-4b83-9bca-5f93eec6a939@virtuozzo.com>
In-Reply-To: <c390081b-7b2e-4b83-9bca-5f93eec6a939@virtuozzo.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 24 Jun 2026 16:16:22 +0200
X-Gm-Features: AVVi8Cf8pFFkEx_V7HqzrhdruZGs8cQ3Zufmxz4l6Wlncf8175EfLgSWMtHkhw4
Message-ID: <CAOQ4uxhPROaeEyYceKNsL5QVwVPkTjGtbRr1P_TYXTA0fHvRoA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ovl: support cachestat() syscall on overlayfs files
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 1:45=E2=80=AFPM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
>
>
> On 6/23/26 19:12, Nhat Pham wrote:
> > On Tue, Jun 23, 2026 at 4:15=E2=80=AFAM Pavel Tikhomirov
> > <ptikhomirov@virtuozzo.com> wrote:
> >>
> >> Overlayfs forwards data I/O to the real (upper/lower) file, so the pag=
e
> >> cache lives in the real inode's mapping and cachestat() on an overlay
> >> fd returned all zeroes.
> >>
> >> Implement the ->cachestat() file operation by forwarding to the real
> >> file via vfs_cachestat(), the same way ovl_fadvise() forwards
> >> for fadvise.
> >>
> >> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> >> ---
> >>  fs/overlayfs/file.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
> >> index 27cc07738f33b..a7e252a91ea43 100644
> >> --- a/fs/overlayfs/file.c
> >> +++ b/fs/overlayfs/file.c
> >> @@ -518,6 +518,21 @@ static int ovl_fadvise(struct file *file, loff_t =
offset, loff_t len, int advice)
> >>                 return vfs_fadvise(realfile, offset, len, advice);
> >>  }
> >>
> >> +#ifdef CONFIG_CACHESTAT_SYSCALL
> >> +static int ovl_cachestat(struct file *file, struct cachestat_range *c=
sr,
> >> +                        struct cachestat *cs)
> >> +{
> >> +       struct file *realfile;
> >> +
> >> +       realfile =3D ovl_real_file(file);
> >> +       if (IS_ERR(realfile))
> >> +               return PTR_ERR(realfile);
> >
> > We're propagating the error of ovl_real_file() all the way to
> > userspace right? I think we need to handle this.
> >
> > For example, we might get -EIO here, which is unexpected and
> > undocumented from cachestat's POV.
> >
> > Maybe handle it and just return -EBADF or sth like that (with some
> > updated documentations, etc.)
> >
> > The rest LGTM, but I'll let overlayfs maintainers check the
> > overlayfs-specific bits :)
>
> Yeh, we probably can use EBADF here instead of propagating:
>
> Man cachestat(2) says:
>
>   EBADF  Invalid file descriptor.
>
> not really a bad fd here, but probably close enough not to rewrite man.

Please don't do that.

Re-read what you just wrote - it is ridiculous
Because of being lazy to update man page,
we are going to send a confusing error to user which tells them
that their fd is wrong, which it is not.

>
> I'm a bit hesitant though, since in other overlayfs operations we already
> propagate, maybe that was by design?
>

Exactly, plenty of overlayfs operations return EIO for unexpected
conditions, often accompanied with some assertion as is the case
with ovl_real_file().

Even though many man pages don't document an explicit EIO error
code, it is obvious to any experienced sys admin that if EIO is observed
they should look at the kernel logs, because an underlying subsystem
may have reported critical errors.

But in general, man pages follow development, not the other way around.

Thanks,
Amir.
