Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D827FB37
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954442; cv=pass; b=aLFnO8UmGYQwvyjtoS7rCbj1R3UENI+HAsTDAlxRMRW4v1T0tjnpBH9YtR857sLIF5ruj79uOjhl+pon7FrCIzKCiRcxUypMlvc07Cg+MwNqCFO1OGCiicBlW5c5TtK9S/JjFXCuw8ZFNAI85nGVnOtvrNZ8rF2PY/iD512M1d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954442; c=relaxed/simple;
	bh=cCuihnC83rVuxNh9g4clqD2+2gMDD3M/m5qB3+opnzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DouTtrRrMG7ZyoBG6liWtmBAuRiE25SAy6UV/+V7E6JJl4/uzbVU3OweAX6YGYC9u1xTlQaDVbFu5xkmDTOU5H177f8yhA4zlM0njW3zs9AhvdA0vWwJKXvEJZPAk32V2QV2yERR9MB1gENrkIqwfAuSeysCJF+VCsf6q0eTBGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jolJbCoX; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jolJbCoX"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fa3f2b8f7dso34924137.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 09:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954438; cv=none;
        d=google.com; s=arc-20240605;
        b=gI+1vBfq/64tMvRRXVPs011MEYyGe/BSD93XUUp7EATxIKaq5dBl2TCJyG3Pei7cbY
         XYFnyru5T6uO6XfB08oG8mxgSkrFvE8f4g6V2sr0SEo77fhI48kIFSv3vI0HpdylQjVO
         OxNAeHPjITrsH+boPMBZzFiuu//1Z+4bv0rhBTtR7vKZJrWaBOXOi0fFYUzpAndG3jtW
         BOlZGN9OEZ/TnMFprWPLN4Tkae4mnXjU18Aj7bivt3oRW1ZIWT9MeTU4U3lRsg9SkCCk
         dSdYrV+SiIzHCnE9P57E0uO9Ree+5OAX3kIozAqK+eOPDyP3tsJlnk+4BrHi1vb5LHFs
         jq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifttwnYsIrEN6pRSBIiuqj7H8s+5kPdjKC4U9v3r5Ew=;
        fh=NungvgVIDbOu5fQ7yFpJG02BOoyjnG/lXgIM/3QGOug=;
        b=NASeVohLRPG+9mjLQbCoT2/Di8kZ4S93FzdtOzVb++eRndeSyii5PX3Md6YSMveJrG
         89vAxHx9Ua8L6cHL3nSL1uzwzyS39jHntpM+sTKIyGHDiy0Bxgp5dOz2fe+OKxhlvpda
         kvSZrq9nCuthuQ7VIvtqau+daAg8ByLtGnSQmK9Fee0pM97zBPjyaWH96U+W7OzzT7nX
         8LL9H+OBIJ/4Pg3/nVzVnkI+MLVoHeRcQ5HjPVV6Zmcgkic63KVNupGjmnpgUs44UkNB
         AbTqvV6aESqBbVIZvhSbSltXw001zgjAzwV9bcghJx4J7BvgqmpKE9v9hEcdbaXGvelH
         Zpeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771954438; x=1772559238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifttwnYsIrEN6pRSBIiuqj7H8s+5kPdjKC4U9v3r5Ew=;
        b=jolJbCoXdMN41Sl54UH1EhIF9lYgMnUAkv31VR7d6YHVfXhNEMI/oWJeEqnwMX6hHl
         TXbMLy906AtVogBxlEiPhmHP2/az0SGQhOe2Wk8iSROqBd1ZVWZ9FQu0biRx/10+7W9v
         9vsTLLwtCZvluGsn7DRIhKOr8fJpk8xV1sg2pmfX1MMyoJLgm9bu/Z55W4/uMZ6ejAWA
         oPZ2xKSlt3hnT73Wi2swQS2owsGclHr3lFH+SjxmRPrb7Jq0rrgaNsZRKBKURZCiUdZe
         fV6uj9DlFicm9uEimVZ1LpRi55AsLMi9t/kE7ornmeU7Z08w94OggX7daje69SKh6xP4
         ICfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954438; x=1772559238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ifttwnYsIrEN6pRSBIiuqj7H8s+5kPdjKC4U9v3r5Ew=;
        b=vjQNMsN6mE7oquZxv78dlk7RcN3k+BJIcLitSgajtQopLhuLYuww5+5s6Rm3nBSB5K
         ITfN7xn06DEZ3QZ0ENM84iKEDnQW7md1w+AcpJsPvvaK/tjz6C0ORgUS8kj1hOZ6K6tF
         Efe9SXYWuJLOAUUYFrDvOKUWVPAB3bGSrJge9IB1QW5SwyTsP7DLdCWjiRcjKGgE9LJ6
         6Y+GANeidAPQjZXm/Q28ptM+MJkH9Wp21x9Tty6v3PCydwt5RsRbmdFMVTrvMZNqUN1F
         0gxjVCwNpzjYt9tveemGGL2ZV4BFcbcbDmjMHWH0duBpKcL9bxHo9rRAusupMDVcdmLv
         r57A==
X-Forwarded-Encrypted: i=1; AJvYcCUxHkvJJYBS6n8LUPCX3SWBnxm9Gjii1beExLdj8YUpPh8N7YLGWDnP4DdkqCrFHHsQFEuo/Lk9to/T9mbRRk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+ZdTQA/wmW3OYxVO32X2/iKDuKrPejouAKD4+Tu3pNDPXHxu
	QKL2XkMAOGTl2vuzlfzENr0SEr1jJYclbay03kkdyvFe9SCexKi2r3bvFs0Hi/e86up+tQo4Inl
	MJNMV/7HSRVjAWNHrY6vJtUbHWeVeg/D8rczuljow
X-Gm-Gg: ATEYQzykgQ/YLjV7XzIx1P3M/rjI0JqgDbn3iEg+Udb334ke52x1WWEye9X/ixbP2MF
	/XRUmLyKARYNAguWtv/28eWx8KZsYk+urPS07g7VIiKsBX+VmtJUj1sCqtss7xfCSW+Y/EdH4uv
	rodZi/FXFWGZvK5V1w0P1Q1tKNh2ykgjed/zuMunuI1CqyFlmZ6YiuQRQfTpRM2UFLFqQaydoyG
	S0m6SNcurX0M6CuSEVZggBNKi2vnziK/y2wRZdN2lidl9icscY1uq1TX2GpjSNVV6TKCYDMacHu
	XFBijfA=
X-Received: by 2002:a05:6102:e0a:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5feffd8e046mr571923137.5.1771954437826; Tue, 24 Feb 2026
 09:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-3-dmatlack@google.com>
 <aZ1svGur9IxQ7Td2@google.com>
In-Reply-To: <aZ1svGur9IxQ7Td2@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Feb 2026 09:33:28 -0800
X-Gm-Features: AaiRm50ftzuk34ivxDcB4SNiM7gs91UDwPlTbTMB1CMe8djixeonPg3t_5VqAYg
Message-ID: <CALzav=fSpd6H5pQNtJoFHdNtWVO11vffhWQFsMFkM+osGuE0wQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 1:18=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
> On Thu, Jan 29, 2026 at 09:24:49PM +0000, David Matlack wrote:
> > + * Copyright (c) 2025, Google LLC.
>
> Nit: Should these be 2026 now?

Yes! Thanks for catching that.

> > +int pci_liveupdate_outgoing_preserve(struct pci_dev *dev)
> > +{
> > +     struct pci_dev_ser new =3D INIT_PCI_DEV_SER(dev);
> > +     struct pci_ser *ser;
> > +     int i, ret;
> > +
> > +     /* Preserving VFs is not supported yet. */
> > +     if (dev->is_virtfn)
> > +             return -EINVAL;
> > +
> > +     guard(mutex)(&pci_flb_outgoing_lock);
> > +
> > +     if (dev->liveupdate_outgoing)
> > +             return -EBUSY;
> > +
> > +     ret =3D liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **=
)&ser);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (ser->nr_devices =3D=3D ser->max_nr_devices)
> > +             return -E2BIG;
>
> I'm wondering how (or if) this handles hot-plugged devices?
> max_nr_devices is calculated based on for_each_pci_dev at the time of
> the first preservation.. what happens if a device is hotplugged after
> the first device is preserved but before the second one is, does
> max_nr_devices become stale? Since ser->max_nr_devices will not reflect
> the actual possible device count, potentially leading to an unnecessary
> -E2BIG failure?

Yes, it's possible to run out space to preserve devices if devices are
hot-plugged and then preserved. But I think it's better to defer
handling such a use-case exists (unless you see an obvious simple
solution). So far I am not seeing preserving hot-plugged devices
across Live Update as a high priority use-case to support.

> > +u32 pci_liveupdate_incoming_nr_devices(void)
> > +{
> > +     struct pci_ser *ser;
> > +     int ret;
> > +
> > +     ret =3D liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **=
)&ser);
> > +     if (ret)
> > +             return 0;
>
> Masking this error looks troubled, in the following patch, I see that
> the retval 0 is treated as a fresh boot, but the IOMMU mappings for that
> BDF might still be preserved? Which could lead to DMA aliasing issues,
> without a hint of what happened since we don't even log anything.

All fo the non-0 errors indicate there are 0 incoming devices at the
time of the call, so I think returning 0 is appropriate.

 - EOPNOTSUPP: Live Update is not enabled.
 - ENODATA: Live Update is finished (all incoming devices have been restore=
d).
 - ENOTENT: No PCI data was preserved across the Live Update.

None of these cover the case where an IOMMU mapping for BDF X is
preserved, but device X is not preserved. This is a case we should
handle in some way... but here is not that place.

>
> Maybe we could have something like the following:
>
> int pci_liveupdate_incoming_nr_devices(void)
> {
>         struct pci_ser *ser;
>         int ret;
>
>         ret =3D liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **=
)&ser);
>         if (ret) {
>                 if (ret !=3D -ENOENT)
>                         pr_warn("PCI: Failed to retrieve preservation lis=
t: %d\n", ret);

This would cause this warning to get printed if Live Update was
disabled, or if no PCI devices were preserved. But both of those are
not error scenarios.

> > +void pci_liveupdate_setup_device(struct pci_dev *dev)
> > +{
> > +     struct pci_ser *ser;
> > +     int ret;
> > +
> > +     ret =3D liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **=
)&ser);
> > +     if (ret)
> > +             return;
>
> We should log something here either at info / debug level since the
> error isn't bubbled up and the luo_core doesn't scream about it either.

Any error from liveupdate_flb_get_incoming() simply means there are no
incoming devices. So I don't think there's any error to report in
dmesg.

> > +     dev->liveupdate_incoming =3D !!pci_ser_find(ser, dev);
>
> This feels a little hacky, shall we go for something like:
>
> dev->liveupdate_incoming =3D (pci_ser_find(ser, dev) !=3D NULL); ?

In my experience in the kernel (mostly from KVM), explicity comparison
to NULL is less preferred to treating a pointer as a boolean. But I'm
ok with following whatever is the locally preferred style for this
kind of check.

> > @@ -582,6 +583,10 @@ struct pci_dev {
> >       u8              tph_mode;       /* TPH mode */
> >       u8              tph_req_type;   /* TPH requester type */
> >  #endif
> > +#ifdef CONFIG_LIVEUPDATE
> > +     unsigned int    liveupdate_incoming:1;  /* Preserved by previous =
kernel */
> > +     unsigned int    liveupdate_outgoing:1;  /* Preserved for next ker=
nel */
> > +#endif
> >  };
>
> This would start another anon bitfield container, should we move this
> above within the existing bitfield? If we've run pahole and found this
> to be better, then this should be fine.

Yeah I simply appended these new fields to the very end of the struct.
If we care about optimizing the packing of struct pci_dev I can find a
better place to put it.
