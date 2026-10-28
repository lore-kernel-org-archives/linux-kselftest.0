Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793159864;
	b=fMKMjQ6sNMBTbr3OdawIszsK6sBCxsnY498ee/d9JiXoaN3gAgDTGL83btlKoNrxe/II
	 OLGHYTdGT8v2yD/858hKjxINASZx/hFcgIneWLtCH3ii2Y8cErSeQT8wRJ7s1k+gjXuGc
	 nu+wnF1RxQRU8IOdI+P7gjOSDYIq4PWeiJb54u5I2HebLTmT4GCENq7JQqrhW+LBWJnBT
	 lR2Y2tbyo0QybqmD26nZp6vp4YM9C/W4nzmJmsXDvj3CoO7hssGNjOF+ZpklJwGMlhPhx
	 h0U50LT5/BIRlxVluZCwqWlwcT1eXM6TIESGgdBxXfaE5tJO6ism7cP7AJSZ6oTUstg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NMXrGQL+HMAYYOepT9QRjy9INGR/r2c4dPSHBgR+Ovg=;
	b=a8Fn/dndzq0KaVnNT4MZw4LHES/DGaIwW/xyKB5lLOVCxwchcdP31wd7RCifhFEhUNF6
	 DHHSSormGXoQCqOEkoQq4yli7KyJNYwy+9qt9Doj4+kNVp40PfNg7wNDV9hdZZUnT1KbB
	 KxnpAygWt9eapzEMHaPrZXNMGiGcTFUAi1U7DQT4zOy+1cK+iMb7w3oKsaTgCWsMBv00+
	 ezfX91eMkTZeNTcDPZCNYCGGgvglYkWTsmBQrpwSNfSrlZqzu0uiAHRXVr4+Xcfn6OiUO
	 RPT2PbBlYbjnTAGgzh1/Se+ksfu56yxZ1BX4mKW7Uqm0idk4fmT8MzHsnablTX6fLpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="gaw+DbF/";
	arc=fail smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454C606A337
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 03:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E454C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gaw+DbF/
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso699067e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 20:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793159862; cv=none;
        d=google.com; s=arc-20260327;
        b=BbrHZkEn9AoTM9GBKKTnNqHbnYAKxG/fCLIVmRFRmMfg9U0+ngyBeYO/uAZtzYpHuc
         h64bzEFQGs8NScN7IXuIr0v+EA/tJWX75SBZCL2rF4ITTX4WEumAYiqgRiAcApFxMZSC
         Ainros8DKByPuBxJBKzi08GP48vaMiWg2pixtMrO8JGQKvAEv5RlJXfPtgWH3feUnbu8
         oCylnglWw9Cg5znIZtYUJeMsMaF++fqrSfksJutN8OwGa45hnPY9Llk3plhMQV5p4K7K
         p8wdvAgmC/jLfdEr5zSmcRyWk0FX3ypBJ/WXAxNyjcN283uLihp8OcKS2pgD6ov13h7G
         jhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMXrGQL+HMAYYOepT9QRjy9INGR/r2c4dPSHBgR+Ovg=;
        fh=KsZj+01Li9WhvHea3mzbAZHCeuXdBda6yg46L525Ta8=;
        b=YsvZ24wt8vncc7qqCVFmHTvIW/lk2qKlxPi/MnQWYKgS8Hv0AdUqSHWxCn5ibMqqcz
         c1ygup0sRG+X4+4DN+nwRWhZiDtEbDVqTBt/6ggFGZ5hGk7Lsbxd6SxS/IROW+u7LDwg
         YU/g8UsZZGqueZ5aiVBOn5jxT4aYzZ1IEllJFlRT6cX1WhY5fVH9YzBpUQfCDs3Pio0e
         rPqvCNd+xJHaxwaERjPuaegwurirsr/S1BjuGsib+Y5kFi0HQS//O/IJfFovgS2vvq8f
         oMbDkPAXS+ia7VeEPvd66BPK+KjOgE1PlFQ2gxj5tVZjaMq2XyoNFuQWVs9MDivgKqu4
         hc+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793159862; x=1793764662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMXrGQL+HMAYYOepT9QRjy9INGR/r2c4dPSHBgR+Ovg=;
        b=gaw+DbF/nmUl3kDK8zxqfHwK29AhYno3poVrvFH+EON0nOKHPGtXEaQesZpl7p8ajG
         rkw2MBoTDlVJnO4hjaG3tIMKVF54uRl+Xz7QQn7JMuY1VBhMdKJ7mibQ4552uDCP/oGP
         JeFeUyzddTGiWDdLWwCE5G94LI1vdM747u+BzTfDchR41u8JzfXm/7h04TVnIyj4mIXF
         u1/+E3queoRBnMH0CPGHAK9YTOywC0B3ujvaPAuaIqqwuPGJ4qG/P7s0H5G7gQ8JfYu8
         /fnyjHcpNRJeD8oX7PgoslrLmdSDr9Q/7hgYIxQ24YorJuyT/zXhUfP/YyOFF8f6zopi
         /xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159862; x=1793764662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMXrGQL+HMAYYOepT9QRjy9INGR/r2c4dPSHBgR+Ovg=;
        b=mTs1GgsgXPQ7bcccyiGsLNzw7Qi9QZj7zRm/zYz67T2JNo3eYxJ7FSS/ccREjq5HZB
         H08LPTjYM48DzfkX+xdCSajBbfNo3tUGMvCrTcLjKfykMFU2bRiPf3p9Q2tWsgDn3YlT
         Qw/A4L1JmbumZ3dkMPm/bCCdv71VHaUtH2Tmxs9gyZQ0Xix1Tvbtml6LOIT8FDDbMjUk
         SxnXe6MxdgMXRlFZNKsGO5+/hJsOqk5pKsSO1kp0PmuIPosYeYru55gQeR2wxWMcU21Q
         QdhJ/L4dd/WJVbc1CgL1ncG2mzTwWcSVJMVYd78n/fvs11Jk/07tM/Xgle5N7BZilS6O
         7mpw==
X-Forwarded-Encrypted: i=1; AKwUvBw7u8M5jWXEG5cZPVw8R68L7NFHpK8sUmU9tZ9+UN69K+04TRKm/2znc2pE+obDdFc0mGOS/Xx5rXwGQ0iGoAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbKTN6PKzu7p3Z240NWD6Q2ij5eoc4XbfWuaHLYHpcnFaoWjRA
	E9kB84vpBY4LBUIdGSx5a03vRBnkT5eWjYtSYcGEW1OLf3D4C8GBRJbTnGrofw6af26sumX9Wrb
	0LyXdwxj0oIKMNWIe8qemQEdU56Q5d1Jq7qvSesZ6
X-Gm-Gg: AYBFou0+nDTcbOCBqDINyjbHxpjwdRFOfRW2DfKwulXIHk9bUDr8uTxmI1ikMhrCbrV
	z5xR9t83qfE9SQseGlZZxnzLHZrVjKFs8lkoPgSNUHnbfCB/SfJLwR8e9P4ACGwTgwzYlt83/Be
	wT1XI9yWw/0kIudpVxk3UYNd4VhJejgCB4c/VnOktIHrxTnc6f1MQ6awWOTpDAO32uVk8PcsfoH
	2PWVq3LqUUIIIWHA7kEweYRhRP1rS9JFQB1GfXsp5JVjVNeWtR/4Eq9XEoBcXG9TxGRAHDJIsIP
	EEIkRmQvm2RtTb4M5LntN18rdf8Qcg2+3+cu3LqHjArd4ZpHSb5PM6hgeJ1WnRpbCNyuEuurIVw
	n6gfyu1lOBg2yBlPptejJRSr/+mGEajuFhA==
X-Received: by 2002:a05:6512:39cd:b0:5bf:c619:b088 with SMTP id
 2adb3069b0e04-5bfcad172c1mr381529e87.20.1793159861277; Tue, 27 Oct 2026
 20:57:41 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com> <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
 <auEksxfAi9lHFXmT@google.com>
In-Reply-To: <auEksxfAi9lHFXmT@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 27 Oct 2026 20:57:29 -0700
X-Gm-Features: AclHuK-ukwGAOGBSGCB4Bz_ycZfHCvtj9w2gkhhBJhRypC_kHO1bNXVuIJcmKsM
Message-ID: <CALCETrXDY2e8x2kdr-FQvFLs-Y7FwNozXGDvqqM6yvVA7QLV3g@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:55=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
>
> On Mon, Oct 26, 2026 at 03:46:34PM -0700, Andy Lutomirski wrote:
> >On Mon, Oct 26, 2026 at 3:06=E2=80=AFPM Samiullah Khawaja <skhawaja@goog=
le.com> wrote:
> >>
> >> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that preven=
ts
> >> holes from being punched into a shmem or hugetlbfs memfd while leaving
> >> the file fully writable.
> >>
> >> Background
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
> >> memfd_pin_folios() to pin the folios backing a memfd and hand them to =
a
> >> device for DMA. Pinning keeps those folios allocated, but it does not
> >> keep them in the file. If userspace later calls
> >> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
> >> the folios are dropped from the page cache while the device continues
> >> to use them. The pin holder is never notified, and from that point on
> >> the device and the file silently diverge.
> >>
> >> The existing seals only partially address this. F_SEAL_SHRINK prevents
> >> pages from being dropped by truncation, which is why udmabuf requires
> >> it. Hole punching, however, is only blocked by F_SEAL_WRITE and
> >> F_SEAL_FUTURE_WRITE, and both of those also forbid writes. That makes
> >> them unusable for memory that must stay writable, such as guest RAM or
> >> DMA buffers, and udmabuf explicitly rejects memfds that carry them.
> >>
> >> Proposal
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> F_SEAL_PUNCH_HOLE fills this gap. Once it is set,
> >> fallocate(FALLOC_FL_PUNCH_HOLE) and madvise(MADV_REMOVE) fail with
> >> -EPERM, while reads, writes and resizing are unaffected. Combined with
> >> F_SEAL_SHRINK, it guarantees that userspace cannot remove pages from
> >> the memfd while the memfd remains writable.
> >
> >How does this solve the problem?  F_SEAL is about a userspace
> >contract, and if there are existing users of the APIs in question, it
> >makes very little sense to start making those users fail because they
> >haven't taken the appropriate seal.
>
> It doesn't change any existing behaviour, nothing starts failing for
> users that don't set the seal, and drivers wouldn't require it. It's
> opt-in. Userspace that wants the guarantee seals the memfd, and a kernel
> user that pins it can check for the seal and rely on the pages staying
> in the file. For example, the iommufd live update path could skip
> verifying the pinned pages at preserve time when the seal is present,
> and do the full check otherwise.

Can you clarify the API you're proposing and the issue?  It seems to
me like the user is expected to preserve HWPT state by creating a
memfd, then using some new API to tell the driver to "persist" its
state into the memfd (possibly by binding its existing state as folios
into the memfd)?  And userspace is supposed to seal the memfd against
growing and shrinking but not against writes?

What if the user writes to the file?  What if the user populates
pages/folios into the file before using it to preserve HWPT?  What if
the user mmaps the file?

Have I understood this correctly at all?  Why does memfd make sense?
If the goal is to attach a bunch of pre-existing pages to a file so
that the page preservation machinery can preserve them, wouldn't it
make more sense to have a handoverfd mechanism where the kernel can
make a handoverfd that stores its purpose and logically represents
some pages but does *not* allow read or write or fallocate or any
other user operation that actually acts on the data or its memory
layout?

>
> https://lore.kernel.org/all/arVYa_90j0oN1hnu@google.com/
> >
> >Would it make more sense for the drivers in question to set some flag
> >(refcount?) on the file to block hole punching?  Or perhaps to have
> >the hole punch code notice that it's trying to punch out a folio that
> >is pinned or otherwise referenced and to refuse to do it?
>
> The pins already keep the memory alive while it's used for DMA; the
> problem is only that the page silently stops being part of the file.
> Refusing to punch pinned folios on every file would change behaviour for
> existing users: fallocate() would start failing whenever a page is
> pinned, even briefly by O_DIRECT. A flag set on the file by long-term
> pinners would avoid the short-term case, but it would still make punches
> start failing for existing users of those drivers, which is why I went
> for an opt-in seal.

Wait a moment here.  Given my comments above, I'm not sure this is
relevant to this patchset, but...

As far as I know, right now, a program can open a file, register some
of its pages with io_uring or RDMA, and then use io_uring or RDMA to
write to those pages later.

And another program can open that same file and use fallocate to punch a ho=
le.

And then the first program thinks it's reading into the file, and it
ends up not reading into the file.  Which makes the hole punch
operation rather different from the write-zeros operation that it's
supposed to be a fancy version of.

Now this doesn't sound like a security problem per se, since the
offending hole-puncher needed write access (admittedly that write
access is only needed at hole punch time, not in the indefinite future
when weird behavior happens).  But this whole sequence seems highly
suspect to me.

Are you *sure* it wouldn't make sense for a GUP'd or similar reference
(whether pinned or not) to *actually preserve that folio's status as
part of the file*?  Or maybe for there to be an extra pin bit to do
this?  Because the current behavior is pretty strange.  And I'm not at
all convinced that anyone would really object if the kernel prevents
hole-punching a range with an active GUP, especially if this behavior
is restricted to writable GUPs.

I admit that truncate seems slightly different in the sense that it
seems more likely that someone would be annoyed by an inability to
truncate a file.  But still, truncate does have the same issue.  Maybe
extending a file could notice that there is still a folio covering the
newly extended range and stick that back into the file?  Seems messy.


--=20
Andy Lutomirski
AMA Capital Management, LLC
