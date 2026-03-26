Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6C1AB6F1
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538219; cv=pass; b=RZ3CTSz/gOpaG5S6Y4HUPGtpKisbrHBWZJh7pjqQW01Lzzg1TxgRuZbr0pnPpN98hCgTPltviyqbOWaZhBJPdwrY04wI3r6sY7vT06NIsgFrhz4M4d5lYx3oQ2LL0RxbaDiQRFgQhJqwiogW4cYDVfeBtavr9sJ2qu6gXCprMH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538219; c=relaxed/simple;
	bh=kBIkENh+yCdRAT+xHQAGR0WyvUAydVph9hYnwckxJzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niFcssmjyc80yHDpMb8i06iBD/gkcln9/s+9ltmWad1ovkjgDMHx1qvqcdRrNdYU1k9960XejOAuSvJA8Uxwj922tzBN5QnC94TN4BzmacBXles5hNpES9Q7iPMZocDd9bPfP54lybjFZjZkWupp34pqA2yF5Di4NhEMquhSsWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=P46C7T8o; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="P46C7T8o"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6674cba2c50so3385230a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 08:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774538216; cv=none;
        d=google.com; s=arc-20240605;
        b=OQ24Mrt1CWxgZ/hq0Hz8BmGC7xFXZWaKbyHYwmsW5y11DJcfbSN3KBD9AZizxf9wMv
         nI6MkU+EOoXGO4dM+jydOO6esasd3IsVq0bqaNoB91XTXeviMrhKlbe2E8bXuV+ElWR3
         W6jxbNDq7c2t9ZUHV7fek1MMMV87Wg+T+b7fKw2T0ugviRc+jk+I21y+VPT8mFI8wY4h
         11ZdC3RdYYaqwXOT9UIEZ4ND8obzMPPzEWxZ74dd8n5Xym96L4ZadEGr9Cpc79YUG24s
         n38pg/AsH2KmV3pYqcYxjIZWomMSVKHPc5VQ4wgIkbnS38OF3FHpoLBvUtSC3FQJINJp
         Uuvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SQdnRxJuJ5yHGcAApglVRt5YekVdD3xOtgzSydlym/0=;
        fh=jaHACeQC4fF6YsHwm4/SOWf+0aLMfKRm2w9G77ynKTY=;
        b=Ny0CLRND6VjlPd7tioXz4pjGzcLOAgd27Y+pjEAz8U+0OrirgCtFi8lw+HCe7Bsn9y
         tUDG4G2wOmKiWjOFu3lk0vtXv9VzRkE4YGDml64n9BA7bRtpP+bTtI1oL5OZM8J4a8WG
         h0eRn6yyoOjTbjJ0ApM9nve4G7R6XXmnZ1vk8qJwkQNBmu+v1StUCjUzw86Ia0keTXt3
         iQ73TtFlyAQE/m2nS/FSvRHZoOLuiH/zZYazreFv9SALFAOXeSuWBw3w4O5azcQjfksI
         pp7XO1+HO8ty+qz/sPVcRXpniCOfjnRcl9T7hPbEGXfWSfeIjkIvfQbBudzpN5IqblLr
         Pjrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774538216; x=1775143016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQdnRxJuJ5yHGcAApglVRt5YekVdD3xOtgzSydlym/0=;
        b=P46C7T8oNzjA1ocY8qzqiUrbdx3SuOI14LQUVJQNHkkc0vEllzFX2ZOKv2Gyz+CVnX
         yKq6GRkRoYGJB2UFzER2aBe5bkRL591Dt1m1jmgx9E8gHLSfGaEvDDWuTi63JfDi2k4e
         RVWGm1z/R5fMZtjyp8qpp0iQER5wtAMJG5W2e+Nah1SLpxHn5i66qb4jWsLuBpMzL7ZH
         OvypjSUNYc22bpbBof/5SSlZ/46ZHTfHXl6rTiMC2R4829+qJf3dAtQ7tUFM7Y+e3IWU
         rUsRZckf5M04YIK/mvHzBVH5mhgRx7CQUW+SSVA7FwF2K02CHlsDopmPfat/itWJuCXx
         YoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538216; x=1775143016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQdnRxJuJ5yHGcAApglVRt5YekVdD3xOtgzSydlym/0=;
        b=A4+ZanB9zw9GJirH2AWtg6ugOdVHuXL8m9UKVpS56eEpE4JZ5VEBGrM9RFzvaHcPbG
         T5EJjN8WaN5al5lqK1vpsbfTA/S1hL19FU2n/w88r2wDrxY936gfJ0cMeegxW2pN/mo3
         3zNchUAyEScvymz0GlRN16ZEGw5G1fTHib7w9lOetkWF7gr6scn534LI8wD3t8twkH7B
         CuTLYN5HdimeEFO3CAjJ/80D6aiU536nXoe2cYgpc2DeiAEiGcULiX6dKCsfov1cy1Ga
         JJY7hFXM6SYCOCxdxUmD8CwvvI/WSm42XGmOsOfqI62Fj/w+oTqsPrhQpgXdphoVHZgt
         Jk4g==
X-Forwarded-Encrypted: i=1; AJvYcCXVGHw7lsjorFK978+QWzxZ5W1wL6JgwflJaiU8U49Ifzr5X1uaLhCIKSLYcJAbpMYWGm7ltxRie+Hs9EPQqY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1oO9UBR9Apdjlm0mW3uuA/wvfKfT41EIc1Wz2VV6sWZGolBj
	HkjojCn6UE9q8r8FQEo9J30X05RY5w0OMPI6la4rtPUb7OIyCZbN+Wm46njHMOtMCK5Clgm7uTi
	eHJub8N2yGvQ8ACD4DMArNjwXyBsULSr7cZ9K9L6k1A==
X-Gm-Gg: ATEYQzy8E6gbkZ7hiHCJC2NCL0SucuKvuEluK24friifBDudmeMu25QigKi/RmZTHvG
	uK4uhCsPaQmzxpuMvImrEAlhM8YVVAxK+qSlWVsLi25qnLbVVwwltyAOItxZRWmYuBaF7FWkiRf
	eDbaYB1SMsdxjp3wRpum9qdchdTi9xpTjlTl5BW/AOMBvDRjU44GNk0Sgmky6ATNiYwlI0JvIF4
	eQ+yccz2A7UZq1IutEv4vdMXjaiWh0dWTD0tF4vMULTXc/VhXQQjgTbRAyKFXU4JYceTpQMDWeE
	qtipW0EUKZZV9Zx3lN/dwD24s9F1QTwjuzNfeg==
X-Received: by 2002:a17:907:1c1e:b0:b96:f02b:3d5a with SMTP id
 a640c23a62f3a-b9b2e9b5216mr156822466b.16.1774538215766; Thu, 26 Mar 2026
 08:16:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
 <20260325182026.467307-2-pasha.tatashin@soleen.com> <2vxzikajacgc.fsf@kernel.org>
 <CALzav=eybgJwMQEtvSi2bUv8u7cic6d45r4wFZdZiKFFrrLJfQ@mail.gmail.com>
 <CA+CK2bBpa8ZnxPdsPCRCAiPeHUbqQ3TNjHTGU2eN_BGqqX2Y1Q@mail.gmail.com> <acT2lYJKdyXXzNPZ@kernel.org>
In-Reply-To: <acT2lYJKdyXXzNPZ@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 26 Mar 2026 11:16:18 -0400
X-Gm-Features: AQROBzAaQwWi1mw7VLq4yJOSwB5PsmUGIPySwFNBSoNSp2gOncmmJQuI5qB8fRQ
Message-ID: <CA+CK2bA7=XBFVy1iS6y50v_TUxQPFbL182DgprkxeAh4JHZRoQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
To: Mike Rapoport <rppt@kernel.org>
Cc: David Matlack <dmatlack@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 5:04=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Wed, Mar 25, 2026 at 05:08:57PM -0400, Pasha Tatashin wrote:
> > On Wed, Mar 25, 2026 at 4:34=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > On Wed, Mar 25, 2026 at 1:20=E2=80=AFPM Pratyush Yadav <pratyush@kern=
el.org> wrote:
> > >
> > > > For memfd and hugetlb at least, we serialize the _inode_ not the fi=
le.
> > > > The inode has the contents that we care to preserve.
> > > >
> > > > So if two FDs point to the same inode, this will break. You can do =
this
> > > > by first creating a memfd and then by opening "/proc/self/fd/<fd>".=
 Then
> > > > you would be able to trigger the preservation twice, causing all so=
rts
> > > > of problems. Same on the retrieve side.
> >
> > Hm.
> >
> > >
> > > > So unless I am missing something, I don't think this approach will =
work.
> > > > As much as I hate to suggest it, I think we need to move this check=
 to
> > > > each caller so they can find out the object they need to serialize =
and
> > > > check if it already is.
> > >
> > > I think LUO can still enforce that the file is not preserved twice.
> > > HugeTLB and memfd's preserve() functions just need to also check that
> > > the associated inode has not already been preserved?
> >
> > For memfd/hugetlbs the true state is in inode
> > For vfio/kvm the shared anonymous inode is just a dummy wrapper, and
> > the true state is in file->private_data.
> >
> > I wonder if we could use the XArray to track inodes for standard
> > files, but track the struct file itself for anonymous files (we would
> > need a new function from FS that allows us to determine if "struct
> > file" has anonymous inode or not).
>
> Don't all files we preserve use anon inodes?

No for memfd_create(), the inode allocation path depends on the
presence of the MFD_HUGETLB flag:

1. Regular memfd (shmem):
memfd_alloc_file() calls shmem_file_setup(), which leads to:
shmem_get_inode() -> __shmem_get_inode() -> new_inode().
The allocated inode is a struct shmem_inode_info.

2. HugeTLB memfd (hugetlbfs):
memfd_alloc_file() calls hugetlb_file_setup(), which leads to:
hugetlbfs_get_inode() -> new_inode().
The allocated inode is a struct hugetlbfs_inode_info.

> How about we extend the fh->ops with a method that will return "unique"
> object?

Yeap, this is exactly what I am proposing. Adding an optional
get_id(struct file *file) to fh->ops allows each handler to define
what constitutes a "unique" identity for its supported file types.

luo_file.c will have a helper like this:

static inline unsigned long luo_get_id(struct liveupdate_file_handler
*fh, struct file *file)
{
     return (fh->ops->get_id) ? fh->ops->get_id(file) : (unsigned long)file=
;
}

For memfd, the get_id implementation will return the inode pointer.

Pasha


>
>         list_private_for_each_entry(fh, &luo_file_handler_list, list) {
>                 if (fh->ops->can_preserve(fh, file)) {
>                         unique_handle =3D fh->ops->unique_handle(fh, file=
);
>                         err =3D 0;
>                         break;
>                 }
>         }
>
>         xa_insert(&luo_preserved_objects, unique_handle,
>                   (unsigned long)unique_handle, GFP_KERNEL);
>
> > Pasha
>
> --
> Sincerely yours,
> Mike.
>
