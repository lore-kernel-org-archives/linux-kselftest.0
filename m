Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2173AA1BC
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 19:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771960648; cv=pass; b=ENJJg7S8d20TIJLRrMj8u1YnOG7RtdfmMS/NA7MORZMzy03ssWjjcBwvf0T/UFoTW945JaKGgz889sbh8eVmkx7gSTU3XpL+gYuvgDDQ+ye0tUMqREk4OMIGGe5feu4OFkFxKWo3DR/f/h6Kt76dxFXwmqvfmrOd6RkLXnYuzDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771960648; c=relaxed/simple;
	bh=2a4zbszLImV50LYJlWzhpafrcVDLmcGNsmNOQqAvaHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pd4DuDOPfqI3IJ1tvkTkDDt8DPgeHUd1wpbH/37Fp4ZNzyoyEufQUJcEIhsd5StoGxXdFMtOkj4NPP0bcCING+yFlxgV6nWYjO8pN2dHB4KOyK7e/cwJN6woMoxakrie4n1DtGUXQS5G4GrR0KLMSicMnXyI4bi7JG9PPu1P1IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yW6aa2Cu; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yW6aa2Cu"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38710d7d8baso47844771fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 11:17:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771960645; cv=none;
        d=google.com; s=arc-20240605;
        b=S+heoVRcacxTeYhMDHe98hxRecKJdxaQbUGYmNJURsXwL/b6ME7eXvMbwTwLpZLswO
         yuXAt4vg5Cre3ZZHVODRxephiWuq17tkGOYvnirG2X1oK4MXI0w4RXYV1CXZR3nU7CfV
         JLrq1jm3o/MLhCEgnfBK3P8Etn0oiZeeZNhTBVffIUktg1TWFlBF6yZaIs3ezlnnN/Vc
         nRvBw3CbT76JOx8veY5O2R/Dw47A5medHeSMvnjRJiiVCzgMlmlno8dIU2LAcZ0lPDHb
         bckbZzYgDie7ZD2BJvGsICX4fxRZzr9vb8Rud2EhU394V6YEuWgAlWNNHBDv0Pw837x+
         DZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z8YRbhMW1jrVERHtyC2DuVPZZxUiR82Iag5u5UTa32g=;
        fh=uGtbf4e17lC+UrVD+xRCpwVQBOsdgxfpEsyweUSZ9es=;
        b=ItPfKRgjOyu1ZGHXToYLePz6rt73E7ToIb8p1hzNDTuzajEAiqHCxv/FnL5QCHVxne
         v2h7GhsZhDSNvFqeAiKOKJO63ZB/+g560LvzIMZgKEo0wDdQuzGPhrRFz35SG+AeRvZa
         E2LxZRFD4yKGICQ1cRm54GRtCZN/u3NM6cXxGa/hpnJCBRkP3VCfnm4kBquxT3xTK/UM
         7ZaQxOKbRvSPo0AVR/HGKcB/t0RAsBjaWYWYcX+yZvb/rJZg2LpHfa6JDM4elKPEj75I
         Q70GKHOFvMdBfvfe6XcjVPn8vtbXRQQpYKT0jeuT811R5zRy9RCJIPb0FA5cr5suIqdS
         aKcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771960645; x=1772565445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8YRbhMW1jrVERHtyC2DuVPZZxUiR82Iag5u5UTa32g=;
        b=yW6aa2CuPZF42UeSQUqShl6k4YAqFr99jv22mDOSrPq1GwWsVX2S/9LWQ2s7KQAzwp
         ErFxjiJX1Mkg12RTmTum/cdK2k4BqW6f0vVD9gqrMAkim6WzP4Di4DozeGWIJdWCJt9O
         J8pwUQxRzStDRfEZYDB7Pesee1QGjOy40Vi1Sy5H+n+3t0JIMN2oXKG1wvLjRetmXdvl
         rIalclYR1qLILW2HrUhvWaaRytfmTeRzmmZb+VQBFFtbH7epubGXsyDi/+YQzZ1q6HOq
         r2Gjek3DxIWVeLfL/h4MRPQKfuJJfbCtevhapSplj5Ae4LIDMLSWI8aeEXqMo6yJDpRP
         j+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771960645; x=1772565445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z8YRbhMW1jrVERHtyC2DuVPZZxUiR82Iag5u5UTa32g=;
        b=mqixlRlPTDMVjfHniWjN9UnT1ZqhFq3kE4MV8/XCELR1/PSsY46r0G5UzhXa4Rq+GN
         8iAgBtj6sxJJwx/s10YCIKKo3Zn4sxR8ENdtQBYuRcCHCbACeEZa11jGT68SEA4PlF5S
         akezJFzCOpk61SjaWvKspM038KBK52JFeLbuNMKSaYcl5HUi4aGWrpPYD8iiAbeA787Q
         ilYzagEdCORFm9/1jp09yENwnXVqolMCktzYBD7eRffghZJq+drBrfkU/vtSRs+p976c
         HZgI+J7Wwa/q4zI4BgNLJOHvhhQSa4ztRbqPDAByZ3QCf4fzPlWBnjf0mGxnTsWKiLbj
         LELw==
X-Forwarded-Encrypted: i=1; AJvYcCW4ole8fPkdb6Oi23AchmTH0jKBGUbWZsGuPO1Ap2b9TwKYL0QvCu1V+m6w2mTihbr04XzkRse2Q8GY2I0rQbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwUJX8GGiO84xjCk3CHCMyQWKejQsZI9q1+HKRkubPyXPAQjqk
	LVln+fwJpoTw/f6hvBknZnWSIlpomIfPHc2BVykJ3GDC0+PCRtMzrvfnFiydOvjnRwTRmg3Jg/i
	yFGFBboLAHDBoe3wMvM9t0ITzyRyDUBsIg9kNTz+s
X-Gm-Gg: ATEYQzxppSYRyXuhp4YG+qc9KQb94LB5HNBl1H5udvW/OY/ovRzhbfuiXh9B1dvoO3v
	U/scQiPEq7Bmnof1XrcsxFJwGEmMsdyeJ+XvtKZYpDGcvdH6+orb2eCbCWbXDevMEAUlVQF8mq9
	8LiQQ+wtVUAbUHzkHsmyCiKcOz29uPz6tmNccVokYD6rmf/y/+3UC3HLm79zQL1lVcr0I68rkU0
	pd4bUlKb9SByxlQbxR/AymF+rY23oE2hUY0x5sid+sy5EWbdBMybR/iOzyFt007leNWEfIcj8Di
	LzSLgJw=
X-Received: by 2002:a2e:be8b:0:b0:386:e7a5:e26d with SMTP id
 38308e7fff4ca-389a5d5146bmr47895731fa.2.1771960644178; Tue, 24 Feb 2026
 11:17:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-6-dmatlack@google.com>
 <aZ3wBpYSF7mQv_GZ@google.com>
In-Reply-To: <aZ3wBpYSF7mQv_GZ@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Feb 2026 11:16:55 -0800
X-Gm-Features: AaiRm51YtBXd00PzQGhlvFr4r1F_UzQj5UbNk9Nur9O6pTAPmY6O7yFJgVZNGgc
Message-ID: <CALzav=cabKYFs3yhBEWOS9qseOY7rSh7F_Q40fu4spnYpmZMtQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] vfio/pci: Preserve vfio-pci device files across
 Live Update
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

On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Pranjal Shrivastava <praan@google.=
com> wrote:
> On Thu, Jan 29, 2026 at 09:24:52PM +0000, David Matlack wrote:

> > +     /*
> > +      * Reset the device and restore it back to its original state bef=
ore
> > +      * handing it to the next kernel.
> > +      *
> > +      * Eventually both of these should be dropped and the device shou=
ld be
> > +      * kept running with its current state across the Live Update.
> > +      */
> > +     if (vdev->reset_works)
> > +             ret =3D __pci_reset_function_locked(pdev);
>
> I see the 'Eventually both of these should be dropped' comment,
> which acknowledges that a reset is a v1 crutch. However, I wanted to
> clarify the fallback strategy here.
>
> If vdev->reset_works is false, we skip the reset but still jump into the
> new kernel. For devices that don't support FLR, are we comfortable jumpin=
g
> with the device potentially still hot?

That situation is already possible today. Simply use a VFIO device
that does not support reset, close it, and then kexec into a new
kernel. vfio_pci_core_disable() (which runs when the last reference to
the VFIO device file is dropped) also skips the reset, and kexec does
not reset devices.

Note that we still restore the state, which at least will reset the
device's configuration back to a sane default, including disabling bus
mastering.

> > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > index e90859956514..9aa1587fea19 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -81,6 +81,34 @@ struct vfio_device {
> >  #endif
> >  };
> >
> > +struct vfio_device_file {
> > +     struct vfio_device *device;
> > +     struct vfio_group *group;
> > +
> > +     u8 access_granted;
> > +     u32 devid; /* only valid when iommufd is valid */
> > +     spinlock_t kvm_ref_lock; /* protect kvm field */
> > +     struct kvm *kvm;
> > +     struct iommufd_ctx *iommufd; /* protected by struct vfio_device_s=
et::lock */
> > +};
> > +
> > +extern const struct file_operations vfio_device_fops;
> > +
>
> There seem to be two extern declarations for vfio_device_fops in both
> vfio_pci_priv.h and include/linux/vfio.h. Could we consolidate these?

Sure I can clean those up.

> > +static inline struct vfio_device_file *to_vfio_device_file(struct file=
 *file)
> > +{
> > +     if (file->f_op !=3D &vfio_device_fops)
> > +             return NULL;
> > +
> > +     return file->private_data;
> > +}
> > +
> > +static inline struct vfio_device *vfio_device_from_file(struct file *f=
ile)
> > +{
> > +     struct vfio_device_file *df =3D to_vfio_device_file(file);
> > +
> > +     return df ? df->device : NULL;
> > +}
> > +
>
> I'm a little uncomfortable with this part. Why is it necessary to expose
> the internal vfio_device_file structure to drivers? If this is only to
> support vfio_device_from_file(), could we not keep the structure private
> and just export the helper function instead?

Yeah, no problem.

> Exposing internal state into the public API introduces some maintenance
> constraints for e.g. if vfio_main.c ever changes how it tracks
> file-to-device mappings or its internal security state (like
> access_granted), it now has to worry about breaking external drivers.
>
> I believe we expose the struct just to power these static inline helper
> (mainly vfio_device_from_file) ? Instead, could we treat
> `vfio_device_file` as an opaque type in the public header (like struct
> iommu_group) and move the implementation of vfio_device_from_file() into
> vfio_main.c as an exported symbol? This gives drivers the vfio_device
> pointer they need without leaking the core's private internals.

Good points.
