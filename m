Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7825B09E
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368492; cv=pass; b=Bc0Dxg/2h88IpTqFKpVmN8WSvm7Q7KrLFf7uZRj4c0QN+nhuL7B+NHt9EziE0RSx3v1c3i3D7b6UCUmd0in2+mANpobYAkR6QNTnL2jx4QDE3RnO2D8dvnzBcQfGydPb3dxyAN2thXRBmr69yrUt89K51sqM410xb5i0LBmp5EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368492; c=relaxed/simple;
	bh=s/LhWOJ82A/Il7Fwfsi+/4LPTb+4kNKDQTmAaQ9VC64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4RuLhktBylq2bKZjdjHIUcB3qDh6umkUTFlOgQqtoM2gZ8VUE84gsfFWOqjkz03WccaBvIdVpRW9q+ozr9VChloUKG7jfBNzzIDMSxBAQIjMOzteCT5+T7wcyNIllugd7mGjjbQPGiUvj8xbM3EQMmuXAQjCZrsHf4H5gmyEFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S6o/rnuI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NS5JgUcy; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S6o/rnuI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NS5JgUcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779368490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
	b=S6o/rnuInVOkFSRMOiyCCq1B1ZtMg7qNupXFKPcrR1aL8DSQmUXqIg7zMM/LPedojc0Y6Z
	xDW9Um5BnWFvoeKi/qbgnKwuOBt5HDqgf90hnsx77SRv8gu+Xez/HgwUAYlG+Ca/WhWMLU
	9FFLwIa7oP9UZacV3AwDs+VWomBnavI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-f-FY31W3PT6c4jBc_wzDIA-1; Thu, 21 May 2026 09:01:28 -0400
X-MC-Unique: f-FY31W3PT6c4jBc_wzDIA-1
X-Mimecast-MFC-AGG-ID: f-FY31W3PT6c4jBc_wzDIA_1779368488
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd795b6288so92358917b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 06:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368488; cv=none;
        d=google.com; s=arc-20240605;
        b=jsTkvbGzNfSepsX8/lh3ylqOcxxJSMP9BYrBlDQ5+ZQt1ruIinjP4IjkX1gYDs0sF6
         LH0FI0K9BT2WnGPF7ZkiRJQOtudK9iLbysTcXbmpLBFXRIELvAALiXARElCulb/mFCDt
         GD2i1SbpdhhLuZKSlNzOS6FnIOajIMOdfJ/avHbwVRUrpLfmtE8Dt4POrKFPReirBKU/
         HoxbDBwBuPT/YyVEMK/zP9tJv93rZrNtEhpXyK2BOMLE2H8R3sLAFlm+XkDInURySLq6
         SEgam7sk686t+WtiVEKUwxjl0MUCwb9/8Hs0oRzmmly7zPHatdxRlMoVkVwD7ZqI6ha4
         C5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
        fh=yLDIRzKM0+GVzn7nCm10X5eiw2ZDFs7yrRx0rLV6rOQ=;
        b=GmNfIPjJ+79Ba6dAn682Q5T39ughIcoa+/U8Xx8MPk9e0jD3x8JTGaFSnNoieAykjr
         onKG7C7dCRv1Gu4YacOOmnzvVcmWfsUwAV0tIFXnGrZKDFiS9qn+DLStxStoexTEvj5L
         T4FiiqbFOTQv32Sfl/0Uod5ERmg5qyz0QHt/4eBeeQBZckkYgu+PMNKAFqETP/jLDZs2
         zszwXfdiZ1+X3rZmqDN689fZYfEGvV/c0DM3KnN/8ID76sd8IiS7QNecAAhd/+iPs9+W
         PS/DBFiRweSSgjanPURmNh/Ye8Tky/0VICLBXDvJrZPgdBCogG0om6Utibnlte40aocm
         geUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779368488; x=1779973288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
        b=NS5JgUcytKGDdl1u/PCnjvrrDt6fKwS6zPw4bOfkKea1D8GUIbrMFrNHWMs+/MjRsb
         OaZZcfag5hw0CIUD57j1+fyIgax2nJ9xz11+DnUsi4Uef6nwy+tG2DravOKTP4XI1nJf
         cHrKCeSME42sumNuHIG0H8SQwHO82DGe8uyOXxGuVHYs2GkY8Rh8FQWVQ7sFrs7oEESr
         1Ia5iTTHpcpl/HD7KM2rjxdp19pjivoBvPLm3g0tsgPy8bnwzQLkf081zCxq0qXs9/5n
         4X81ro6Z7tQpGitncmB3Z3x1IV9heg2R1cDiaqCUXJ04XaW0DmhRjvu/pAaU2ZbPEK7g
         42kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368488; x=1779973288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
        b=q9b5pcv75EhleVDxBRtL3ZJq23YPlH81UFSy1JAc4RpmLU5uafYAImkuiw4hUL/pYx
         mdeXyizY8/ZjKlgFxeibQT/Em7Sgokybsz2vfcfTH50p2wjLKsXsn9SLYpRZMMEj4BpA
         9uYbP1ebFoj002lNaQ51uujaHmdxevd7UlAXRamyS47p3F9QdQrWBq+PMs9w+sXEuJaR
         jA3GxK5UTv13cAa8dD4m876vSul1pXZv9JXqP6466+PkJHQBxwwvrcEcBMY6Za7JMxKk
         m8boR2WKCCPlrGbDnJxcw3aPtan/Xf2MufZquA5R2sjpjeoFCH+EDdy1rkfATsW3EBh0
         0YVA==
X-Forwarded-Encrypted: i=1; AFNElJ/5Rm0ZLewFVgII6xU2Kxz3Cs1r2nBR6TAyM3jeCjw+4ji8bssEqfLZLwQrXYU7tFGFP8wjlqCFME/bK13xO+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YynAkWhFI9R1BqSlh31yeQ62W7jB/T5rgkT3GeBt0PzoHFD9BF2
	zSSYPReWEriTExjwQX/fyEPM1Ud0j49/Vt084SZYOwwBtIR9mk3unbVZmPwAOlM5cgTzCbT0Kp6
	8ERd1QV/Ks1xqSk5z5ANFUS74PGtvvvJri3OC+3tXmHvMJJ0eEdJg+uQpTicxuWIYa7fU4ldkN4
	Mhm+5P9Qv3J1/hr7ndyw6nw0WFS1CoRJVvFrx2s82UMO7I
X-Gm-Gg: Acq92OGVNWEomVR1yt+75+WYVIi40rJEi30buwUrq1qHVEhLarO+CcTTmaEYQGVZcp6
	YOWDiM+Nt5hToLyYRt4LrJ11lfhtU8jat+ozcpfikhbuYhb/Ufgo6YPddyaPTJKC8H5QF+V/h2U
	gSh+YLeIP/Q/5/RoO/2JRmDQSo0ENXrSFmmGbwkUiFiCVzIhNVZo+iKNsygVhJCuiXjEQYE+bPv
	EHZRg==
X-Received: by 2002:a05:690c:2701:b0:798:5213:d90e with SMTP id 00721157ae682-7d21458c414mr20821507b3.25.1779368487435;
        Thu, 21 May 2026 06:01:27 -0700 (PDT)
X-Received: by 2002:a05:690c:2701:b0:798:5213:d90e with SMTP id
 00721157ae682-7d21458c414mr20820547b3.25.1779368486638; Thu, 21 May 2026
 06:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com> <7b662fcd-3bcd-40a2-b014-d9ce36f6425b@amd.com>
In-Reply-To: <7b662fcd-3bcd-40a2-b014-d9ce36f6425b@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 21 May 2026 15:01:15 +0200
X-Gm-Features: AVHnY4LBiwiMio4g-NMYwHAheob8lHj03QTb2KFQDfp0pjJRm1wTbuvqILl5JEg
Message-ID: <CADSE00J1+V4=qFZPOL8Cr8hYw6d=hf_XcDPezjYGkcxAwLYGyw@mail.gmail.com>
Subject: Re: [PATCH 0/2] dma-buf: add DMA_BUF_IOCTL_DERIVE for
 reduced-permission aliases
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Thu, May 21, 2026 at 2:28=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/21/26 11:10, Albert Esteve wrote:
> > When sharing a dma-buf between components of different trust levels, th=
e
> > allocator may need to hand a consumer a read-only view of a buffer it
> > holds with read-write access. An example is a camera pipeline where the
> > capture component writes frames into a buffer and needs to pass a
> > read-only handle to a downstream processing component that should not b=
e
> > able to modify the data.
> >
> > However, no such mechanism exists today. The access mode of a dma-buf
> > file descriptor is fixed at export time, and the standard POSIX
> > interfaces for duplicating or changing file descriptors (i.e., dup(2),
> > dup3(2), and fcntl(F_SETFL)) cannot alter the read/write access mode of
> > the copy.
> >
> > One natural candidate would be reopening via /proc/self/fd/<N> with
> > O_RDONLY, which works for regular files. For dma-buf this would fail
> > (that is, if we were to add a new handler for open f_op) with ENXIO
> > because the dmabuf pseudo-filesystem carries SB_NOUSER, which prevents
> > the VFS from opening its files through path-based resolution from
> > userspace.
>
> OH MY GOD! This is the like the sixth time I had to clarify that in the l=
ast few weeks, I'm really wondering where that is suddenly coming from.

Sorry! I do not know where others came from. But my interest comes
from automotive, safety, and mixed criticality scenarios. I kind of
hinted at that in the opening when referring to "different trust
levels".

>
> Creating the DMA-buf with O_RDONLY does *NOT* make the DMA-buf itself rea=
d only!
>
> That's a really common misconception. The flag only controls if mmap() ca=
n be done read/write or read-only to handle cache coherency issues.
>
> It is still perfectly possible for a device to write into a DMA-buf creat=
ed with O_RDONLY with DMA!
>
> So long story short there is not such feature as a read only DMA-buf, and=
 putting read-only pages into a DMA-buf and then expecting that nobody can =
write to them is an absolutely clear No-Go.
>
> If we would want to implement a read-only DMA-buf feature we would need t=
o go over all the different DMA-buf importers in the kernel and add securit=
y checks.

This clarifies a lot. Too bad, but it makes sense. I will abandon the
series then.

Thanks for the review and the explanation!

BR,
Albert

>
> Regards,
> Christian.
>
>
> >
> > Alternatively, exporting the buffer twice would produce two independent
> > dma_buf instances, which breaks fence synchronization.
> >
> > Therefore we add a new DMA_BUF_IOCTL_DERIVE ioctl, which produces a new
> > file descriptor for an existing dma-buf with a caller-specified subset
> > of the original permissions:
> >
> > ```
> >   struct dma_buf_derive { __u32 flags; __s32 fd; };
> >
> >   struct dma_buf_derive req =3D { .flags =3D O_RDONLY | O_CLOEXEC };
> >   ioctl(rw_fd, DMA_BUF_IOCTL_DERIVE, &req);
> >   /* req.fd is now a read-only alias of the same buffer */
> > ```
> >
> > Permission escalation is rejected with -EACCES. The new fd aliases the
> > same struct dma_buf as the original, same dma_resv, same exporter ops,
> > same underlying memory; so importers attaching to either fd see the sam=
e
> > fence timeline and operate on the same object. Access control for which
> > components may receive or pass on restricted descriptors can be layered=
 on
> > top via SELinux file:read and file:write permissions.
> >
> > A shared writable mapping (PROT_WRITE | MAP_SHARED) on the read-only fd=
 is
> > rejected with -EACCES in dma_buf_mmap_internal().
> >
> > Two small internal adjustments accompany the ioctl:
> > - __dma_buf_list_del() is moved to dma_buf_release() so it fires exactl=
y
> >   once on dentry destruction rather than on every file close.
> > - dma_buf_file_release() is updated to call dma_buf_put() only for
> >   files that are not the primary dma-buf file.
> >
> > This may not be the best approach, but after considering different
> > options and alternatives (as described above), we decided to raise the
> > discussion upstream. Thus, we welcome any alternative proposal or ideas=
.
> >
> > The series is structured as:
> > - Patch 1 adds the new ioctl implementation.
> > - Patch 2 adds selftests covering the new ioctl.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> > Albert Esteve (2):
> >       dma-buf: add DMA_BUF_IOCTL_DERIVE for reduced-permission aliases
> >       selftests: dma-buf: add DERIVE ioctl tests
> >
> >  drivers/dma-buf/dma-buf.c                          |  58 ++++++++++-
> >  include/uapi/linux/dma-buf.h                       |  28 +++++
> >  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 114 +++++++++++++=
+++++++-
> >  3 files changed, 198 insertions(+), 2 deletions(-)
> > ---
> > base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
> > change-id: 20260520-dmabuf-limit-access-73261353841a
> >
> > Best regards,
>

