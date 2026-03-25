Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840202857C7
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455394; cv=pass; b=iKuUsSVuvDzMDZzoY39Oie5b75DzuVWNRyb1b7Wm3KiJSB6ZELzY30ZsgMNAkNKZ3VGZxGq80pZPrp6hzAxvEzbXfcghpxYz26J1ykfznDmvjKDnc3B91GTFIaFxlrUFPY4JhyafUWpDJNeitODUKi/2NsvmY94cV6e4W6xrKmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455394; c=relaxed/simple;
	bh=wHNG0ESeFqvIu5cGwMjzGl9YxEqZ3iPQokpTV9TBF1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cowi2MM9eHTycu/aZzushCztOnhgsXGYBaFiJyI0AQPfZlAkAtbykeKbTDT/GZpX3u9Um0vcp7TDbkdrOHicFqRWW5TWeBQcsUcaeHleRVeOWp2jzpSVlf8eaB5YSQYsIiVB+s2n2UrQILBE4lIL0C3bgeJjwHpShDZGy79/r24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UnDMT9Gp; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UnDMT9Gp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66a5d76d9e2so2978949a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774455391; cv=none;
        d=google.com; s=arc-20240605;
        b=U8fGWXgzE56jBGmSUimC6Sa2vvZmVe/6ysyI/cEUlhhZAikpws6K//Fm0IIywCAJ1d
         sz7XsKz2Xrp76qwpXncv3NYcqd/NoPW7YX+RZ39U0k2W46hOFn+xj0GbSsuaKg7Opirp
         1dK5tynxYcqSzu8IvNgYuBNHahoQylDEcp6d0x3/T+zjV3XPI5QR50DLyQ2GeBaGbpK5
         rqsSH54wfnvX63lyVSqobhBeyBHn6TCEEb2SaypnxauvVQnkCAhjYvA0WjqF0oIRzN4E
         pqGHDrQASKmHRdZvufYTVAD18U4DKxLVX1kMKjdTI8iSatwxFAmtmXldr6CrbwogeA4s
         NGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gdesG3FCbAJVDCjzINb0WPV8HWIuE46VHkVQSk+5ZBs=;
        fh=xXOwGKuEyJtioCToH/rzizR2MwKworOOMe001GhYGhE=;
        b=CHlK4NpAyFLgEWVlyMxixXPdjcrQIrgFU/KarNGb92yXXKbdQlEm6t6vJKiPMdW+WA
         KwrzFuRSv8ShuaxBj4fjtLrOcfLGKdYDkCoc/jyEHIgYqQzVKaWaUznJVkNuI1ZZr+/t
         sLBv3dY1mIKd+QSVuwtngqcGEHzzODlZAvESelcNOpxUgscK2ZR3/LSzw7lRSi+NBjf5
         PJrNSrageaN9LkoSy3zwpDa40b2DSIf+6pEGarOeAna8JjqrQ+bVynEeVTV2G8pBeDum
         Eh8v7pxECTiGyW1Gi3hov7ec5Nf9G5/5BxxaRTZnBbT8xOT/T+ry/UhB+zLZHCEGDeZv
         sqwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774455391; x=1775060191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdesG3FCbAJVDCjzINb0WPV8HWIuE46VHkVQSk+5ZBs=;
        b=UnDMT9Gp31zaHuQjcg71eKayqI3yEEHtKN25Q0tykoo0K9gQN9XVduz/YUzefKXj84
         yC+3QJqIYqyVmU7Q4XSCd/kNx62jYexpw+oblRh4k2EUQy3pav7PzKR+avfhx+kjtv5O
         U4AXNXJcw//3QHaP3ZrxaQPBvb/YwvCRtrirxzZsJ+mHVh1yxgs8Z/Bn0g8oau+/81C3
         Y99+3qMZFxcrPvYMRQfCqYE8D94PznZjk1lANfPeL2+InHsfNRTnFXa/NU8XRXX1ddt2
         8SSHBR7BYVgrQtpsG/Abk3FW3A4eUX/nB7Vl2ZlA6hBg39wXzUSRoTboPgp1cLyI836E
         OP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455391; x=1775060191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gdesG3FCbAJVDCjzINb0WPV8HWIuE46VHkVQSk+5ZBs=;
        b=UQmd25qjgykGfipRy4jx7gDfdffzp4tBXekB3f5nziXQjPzGYp2BucAg3Tid1lHvCr
         9vi2ArJ8MHB1TQtc2ZbrM+aRsdqdloWu1/ayWO54nvSoW9uZas1tGuMac+jOj+5R4VAf
         X/TZtXgFC2MozxMX/FaZlK2CMrt5F6/P1Niof9tE69rDvY8vtAbdCfFGndyLddo1/Vo/
         L+OImQjrsD82gyBceOpCWLi9glYBKZNTMF4qiWrALAfzFld9eTXJpVmCmnbRG3Dt1501
         rBkOYYigUOTFhciG2pgtpu5+KdYfB7Mg2TJpCLuOdSi0UVPPJROZmtf1Q9aYZJv1nGAC
         xsGQ==
X-Gm-Message-State: AOJu0YyQMgPcSJW7zU5FfRLxh4pNSspUI3NWstGJYgDUnDGNDzP0t5dE
	qwATjPaS+jHLWRmybfV7otuNjt21yaG0vulphFMigRHrk1Ke3k36fZzZwQ6KZjFcC2zSYZTflYO
	ou13o7wXv9h7+ZUasUjF6JHXdLgq1h4UuPmyc3Dzjyw==
X-Gm-Gg: ATEYQzyScg4sY5NzyBuSL8nnutGluPlLUTozvqfSw1MX6SCC4iy3zX8awE2l5gbXaB9
	9/wxlmFB7F8PP1m0/sGIiEHmu4S+1+LBzhzebo0TTYiGqUrLiwyI7VWEG5+8jyYAUyxz0P+U/O4
	MkGMyPPo33lIBz0xXAupBgBmb9E+IyGNWd9wiuqpBAlfMmOZD6qDIbqTQwHAjvu0n4OlrTANEPy
	h3Uw+bX5Xo2pIZcU5LUatLBYQbHD1YJFfCfl6YZTDN7V91KbVgtPtyqd0L75lbXYaSfu8ut5hs1
	DGIbKISxhTIpuTVp7SM86YlkHth64Iw/HzFOiQ==
X-Received: by 2002:a05:6402:458d:b0:668:57f8:cb86 with SMTP id
 4fb4d7f45d1cf-66a82672c4dmr2605591a12.22.1774455390316; Wed, 25 Mar 2026
 09:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
 <20260323203145.148057-2-pasha.tatashin@soleen.com> <acP_6wY_HVMyTLHk@kernel.org>
In-Reply-To: <acP_6wY_HVMyTLHk@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 25 Mar 2026 12:15:53 -0400
X-Gm-Features: AQROBzBAMaBv6yy_H3sc1rFwDSbkGqaJ8neT4FLiAwZOaJsWHcMPguK5VNMeOp8
Message-ID: <CA+CK2bDNu4+eR1FPOeaN+rZf1GWkiFHCaHwvS8wCKUPJkmWKOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] liveupdate: prevent double management of files
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, pratyush@kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 11:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Mon, Mar 23, 2026 at 08:31:44PM +0000, Pasha Tatashin wrote:
> > Currently, LUO does not prevent the same file from being managed twice
> > across different active sessions.
> >
> > Use a global xarray `luo_preserved_files_xa` to keep track of file
>
> Do we really need _xa suffix?

I liked it, because `luo_preserved_files` is a little too plain, and
not self-descriptive. Anyways, I can change it.

Pasha

>
> > pointers being preserved by LUO. Update luo_preserve_file() to check an=
d
> > insert the file pointer into this xarray when it is preserved, and
> > erase it in luo_file_unpreserve_files() when it is released.
> >
> > This ensures that the same file (struct file) cannot be managed by
> > multiple sessions. If another session attempts to preserve an already
> > managed file, it will now fail with -EBUSY.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  kernel/liveupdate/luo_file.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.=
c
> > index a38ea4975824..5f48c3c8c561 100644
> > --- a/kernel/liveupdate/luo_file.c
> > +++ b/kernel/liveupdate/luo_file.c
> > @@ -110,11 +110,15 @@
> >  #include <linux/sizes.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> > +#include <linux/xarray.h>
> >  #include "luo_internal.h"
> >
> >  static DECLARE_RWSEM(luo_file_handler_lock);
> >  static LIST_HEAD(luo_file_handler_list);
> >
> > +/* Keep track of files being preserved by LUO */
> > +static DEFINE_XARRAY(luo_preserved_files_xa);
> > +
> >  /* 2 4K pages, give space for 128 files per file_set */
> >  #define LUO_FILE_PGCNT               2ul
> >  #define LUO_FILE_MAX                                                 \
> > @@ -249,6 +253,7 @@ static bool luo_token_is_used(struct luo_file_set *=
file_set, u64 token)
> >   * Context: Can be called from an ioctl handler during normal system o=
peration.
> >   * Return: 0 on success. Returns a negative errno on failure:
> >   *         -EEXIST if the token is already used.
> > + *         -EBUSY if the file descriptor is already preserved by anoth=
er session.
> >   *         -EBADF if the file descriptor is invalid.
> >   *         -ENOSPC if the file_set is full.
> >   *         -ENOENT if no compatible handler is found.
> > @@ -277,6 +282,11 @@ int luo_preserve_file(struct luo_file_set *file_se=
t, u64 token, int fd)
> >       if (err)
> >               goto  err_fput;
> >
> > +     err =3D xa_insert(&luo_preserved_files_xa, (unsigned long)file,
> > +                     file, GFP_KERNEL);
> > +     if (err)
> > +             goto err_free_files_mem;
> > +
> >       err =3D -ENOENT;
> >       scoped_guard(rwsem_read, &luo_file_handler_lock) {
> >               list_private_for_each_entry(fh, &luo_file_handler_list, l=
ist) {
> > @@ -289,11 +299,11 @@ int luo_preserve_file(struct luo_file_set *file_s=
et, u64 token, int fd)
> >
> >       /* err is still -ENOENT if no handler was found */
> >       if (err)
> > -             goto err_free_files_mem;
> > +             goto err_erase_xa;
> >
> >       err =3D luo_flb_file_preserve(fh);
> >       if (err)
> > -             goto err_free_files_mem;
> > +             goto err_erase_xa;
> >
> >       luo_file =3D kzalloc_obj(*luo_file);
> >       if (!luo_file) {
> > @@ -323,6 +333,8 @@ int luo_preserve_file(struct luo_file_set *file_set=
, u64 token, int fd)
> >       kfree(luo_file);
> >  err_flb_unpreserve:
> >       luo_flb_file_unpreserve(fh);
> > +err_erase_xa:
> > +     xa_erase(&luo_preserved_files_xa, (unsigned long)file);
> >  err_free_files_mem:
> >       luo_free_files_mem(file_set);
> >  err_fput:
> > @@ -366,6 +378,7 @@ void luo_file_unpreserve_files(struct luo_file_set =
*file_set)
> >               luo_file->fh->ops->unpreserve(&args);
> >               luo_flb_file_unpreserve(luo_file->fh);
> >
> > +             xa_erase(&luo_preserved_files_xa, (unsigned long)luo_file=
->file);
> >               list_del(&luo_file->list);
> >               file_set->count--;
> >
> > --
> > 2.43.0
> >
>
> --
> Sincerely yours,
> Mike.
