Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE536604D
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 22:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059861; cv=pass; b=E/G6FdzH/EYpFdZfbgGhoYgNZwGahR4u2ckzaUt7RAnKLeDHaS2sE3W2Qs7gePvf83SZXH+x3HQcu/91C8d5B98Tk6AiU8dNEfqoWlKvo2dko7V5O1uKznPKzQTCloMdvG+74XOTo8fTzACEuMPK3klzXBkeEB75jjGZ6tuwK2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059861; c=relaxed/simple;
	bh=7OqNOR2pf3cTOCHBcFY4ktMJJpHonFJgCAwij4qDwtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vk+LDlTxkhCEzNuOCu3FFQgNmfAtAj5Q4ViJ0hTmbwMGZLjEl/6QFQ43PFglt4dFIZ2fsTQ/jVypRwOpMryKTz5lT+npT72GLGOBgZdSbd9ctWecTdlQfMuzjopXFNkxnB7aNF8JL1Tos1a98M3wDv4CmVsabP835MCI/0sLf3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WVRV/1XX; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WVRV/1XX"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5033b64256dso193351cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 14:51:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772059859; cv=none;
        d=google.com; s=arc-20240605;
        b=IE/oB/aF2RgNj0s3Y9CodZuksfPNtkgKC2p35hPmJg+o6wPg7UAmuKwZ/+rZWv5xCY
         3Ac1nF0UY+mY4S0Auxqk3AIL6HcudcC/fs4gWbaCoJnnDExYe5tP1lNGa1w2UljO4yIx
         y0yowmk0ETkLQY4KtwowKQGoczZlb/WaKeiHGZzkehMsUHhhg9B+nUh3j4BLq4siDreV
         lNnvW5NOu3+xmMA+yArbCA4E8U0BjZx/xycuRFWZ7wPSNruKLT510hUy6Br46bc9lprD
         N61M/Wn4NSioqK2Q+NSIg9xuHFeZNK9CgEkRa5WpBRR1LHKrbrnGJzjUkTviagCAzfKj
         4bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsOXiL/6Qn9m7Yd1SU2mFbssuofZOBkFUGv1WIDmPB0=;
        fh=hRGO6b+5qBFOB8mL+Q6RqPi7tQ8M0FKFzVpXle+I+HA=;
        b=HlL/5d/QiQgzH1bJhnGfEnvlCmERJFOo01hD0o0bxukxDzOz+c0SJCPUsk7/3OLuSP
         Qe10MJAKEGEUlNuAj/ypVaMk+KTCbTo1QJ1HP5Q3C5QGCelLo8qALWUdH/h6yn5RE2DC
         pQz4GUmt3sjemo4YUwUqXZYsVQJqtHOZBB69F7SageZpwFPuDIAjYKS2p/ItQkxLoUK1
         47aMYk9mGjBYRFm1XpL4cubAfXBkZrwAunuqRlCoV67V1S0pteuBjRXbJDhkcXJS5wJ0
         4ltojeCVTMmGCtCLhs1N5Chze2aWHUrLb2UGWrcg+XYaxklvOF32aeZT1X6vj5wE2RFi
         PkFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772059859; x=1772664659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsOXiL/6Qn9m7Yd1SU2mFbssuofZOBkFUGv1WIDmPB0=;
        b=WVRV/1XXo2nnw8gzHzdS8IksP9JKJvN3r6Llnl75OoENUwU5YDeA9MYBGEFJ9nBAd9
         J2IyxpI+5I8/f8KlhHspyQxqjMQqFVdGuyY15FT88FsCEbh0Gnrx3OQwF8uAVf+Y/wXH
         udcDYJpAudc8TDhtI10nVAMJgFuFYzKKqOotF1h3fiM5+i+rswqgvv605CkgnyXgjh22
         2P/0AfOQoYmBaoOiaIPsQAcgXxM7WW3G21sByw1cq3WvPBd/UgRbG0bRapKQlaDnnpxF
         1/N3w/nSBohJrJPVpdytsvq1ReNEffews0/3EuPaAR4TVp4MH1SO5aTam8noYyp7wwfb
         Nc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059859; x=1772664659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MsOXiL/6Qn9m7Yd1SU2mFbssuofZOBkFUGv1WIDmPB0=;
        b=a5UtCJ+m4ImbTUl37+fKm0gwkvMWgrlFKEHUnDE9ktGrHhaXRvIaJ3NpRxoY4d84sU
         9RbZC15U74OPBv9zrHy8t+adzKaDLSXHcmqcC4OTzxs90lYzdgnkfDt05dqnkaGdjsUJ
         1JGMeOMn0+fXzIER8zs9LYTVVFpVTDDtl8QUVLjFeMEcaAr9xxlATdO+Sn+kavvKlRm1
         1zX9YRkQFnxuhYOIsF8qXA/9XtWWO+Apczv0QGk/tB9oHBTikWeeUizCzjrd+a3+W2rM
         pGEMzuLIvWAbe5UiMAlBU4iEBBPImSWdE1AOvHzoDTi1M4FaMUe9Gh2LGEUGIS50cTAl
         2WXg==
X-Forwarded-Encrypted: i=1; AJvYcCW1RYRREdkXAOyGGMdpcc5tMtW10dS+LzJ/sca57wv5rkBtlyDrmgjXJn1Qaw1O03lRIh+o334j1Re00WpDGUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75/gjcE6zNXOiQGkjtCHfr5RFGD2Lj3Occ8DD50Uusy6+qB/L
	Vi/+Wq2uQXfw+ALgSA9YgbRqNhSWI0mSP/Lr9q6RvGm0ibOCyQkEtCPCnif4Dnzlct3YBeZH4oz
	FImhkps1HMjlNyf+m7j/BhZRRAQCw2ssflU1H0S1r
X-Gm-Gg: ATEYQzwZbT0IU+nDMv7YDAnLqHFn/dwR1OKUz3mHeCtdP4cQZW7z96pJVOK6w05NmJD
	BkjaXYtb25/fKVvEKeIl4s8rNu3mP3MXWFI3W8Ky6oqplndS+BVHugYOmT4OwNm7FyhojCA0KZC
	0h0xNAdvxqqiQizPcECRy7lLHXYTzd+2rpI/OmjklHlWLXz7+RuggR9WzzvJb0fLtEEiisno2kA
	RO2uSK+B4o3n/hqGaV7QVKGxDhbJ3ZH02vc1lKHb4ZIQYq02UkKbEJGuU94KvwbDcfMDrj8Ag4f
	ZM4kHVfFBq4oCyTw1w3yI3ef+Z3A0n7H/WdmDoxIzQNhoocVIM+r
X-Received: by 2002:a05:622a:10c:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-507441cb73fmr3920551cf.8.1772059858971; Wed, 25 Feb 2026
 14:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-5-dmatlack@google.com>
 <20260225143328.35be89f6@shazbot.org> <aZ9yWlcqs2b6FLxy@google.com> <aZ931bYILhhkhW-Y@google.com>
In-Reply-To: <aZ931bYILhhkhW-Y@google.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Wed, 25 Feb 2026 14:50:47 -0800
X-Gm-Features: AaiRm51aoTymXymwCHLQ9gcq3ldQPi6BvUrjqTLQO_zSuAjigNCnBqzqKSIxD-4
Message-ID: <CAAywjhShWTQbkwhDYB=9a_PZjGHnJ-=HTLAzDBvnDsmtvP=Auw@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
To: Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
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
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 2:29=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Feb 25, 2026 at 10:06:18PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Feb 25, 2026 at 02:33:28PM -0700, Alex Williamson wrote:
> > > On Thu, 29 Jan 2026 21:24:51 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > > > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pc=
i.c
> > > > index 0c771064c0b8..19e88322af2c 100644
> > > > --- a/drivers/vfio/pci/vfio_pci.c
> > > > +++ b/drivers/vfio/pci/vfio_pci.c
> > > > @@ -258,6 +258,10 @@ static int __init vfio_pci_init(void)
> > > >   int ret;
> > > >   bool is_disable_vga =3D true;
> > > >
> > > > + ret =3D vfio_pci_liveupdate_init();
> > > > + if (ret)
> > > > +         return ret;
> > > > +
> > > >  #ifdef CONFIG_VFIO_PCI_VGA
> > > >   is_disable_vga =3D disable_vga;
> > > >  #endif
> > > > @@ -266,8 +270,10 @@ static int __init vfio_pci_init(void)
> > > >
> > > >   /* Register and scan for devices */
> > > >   ret =3D pci_register_driver(&vfio_pci_driver);
> > > > - if (ret)
> > > > + if (ret) {
> > > > +         vfio_pci_liveupdate_cleanup();
> > > >           return ret;
> > > > + }
> > > >
> > > >   vfio_pci_fill_ids();
> > > >
> > > > @@ -281,6 +287,7 @@ module_init(vfio_pci_init);
> > > >  static void __exit vfio_pci_cleanup(void)
> > > >  {
> > > >   pci_unregister_driver(&vfio_pci_driver);
> > > > + vfio_pci_liveupdate_cleanup();
> > > >  }
> > > >  module_exit(vfio_pci_cleanup);
> > > >
> > > > diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/=
pci/vfio_pci_liveupdate.c
> > > > new file mode 100644
> > > > index 000000000000..b84e63c0357b
> > > > --- /dev/null
> > > > +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > > > @@ -0,0 +1,69 @@
> > > ...
> > > > +static const struct liveupdate_file_ops vfio_pci_liveupdate_file_o=
ps =3D {
> > > > + .can_preserve =3D vfio_pci_liveupdate_can_preserve,
> > > > + .preserve =3D vfio_pci_liveupdate_preserve,
> > > > + .unpreserve =3D vfio_pci_liveupdate_unpreserve,
> > > > + .retrieve =3D vfio_pci_liveupdate_retrieve,
> > > > + .finish =3D vfio_pci_liveupdate_finish,
> > > > + .owner =3D THIS_MODULE,
> > > > +};
> > > > +
> > > > +static struct liveupdate_file_handler vfio_pci_liveupdate_fh =3D {
> > > > + .ops =3D &vfio_pci_liveupdate_file_ops,
> > > > + .compatible =3D VFIO_PCI_LUO_FH_COMPATIBLE,
> > > > +};
> > > > +
> > > > +int __init vfio_pci_liveupdate_init(void)
> > > > +{
> > > > + if (!liveupdate_enabled())
> > > > +         return 0;
> > > > +
> > > > + return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> > > > +}
> > >
> > > liveupdate_register_file_handler() "pins" vfio-pci with a
> > > try_module_get().  Since this is done in our module_init function and
> > > unregister occurs in our module_exit function, rather than relative
> > > to any actual device binding or usage, this means vfio-pci CANNOT be
> > > unloaded.  That seems bad.  Thanks,
> >
> > Hmm... IIUC the concern here is about liveupdate policy if the user
> > wants to unload a module which was previously marked for preservation?
> >
> > AFAICT, In such a case, the user is expected to close the LUO session F=
D,
> > which "unpreserves" the FD. Finally, when rmmod is executed, the __exit
> > (vfio_pci_cleanup) calls vfio_pci_liveupdate_cleanup() which ends up
> > calling liveupdate_unregister_file_handler(), thereby dropping the ref
> > held by the liveupdate orchestrator which allows the module to be
> > unloaded.
> >
>
> Ohh wait, You're right, Alex. I just realized the __exit won't even be
> reached because of the internal pin. The current implementation creates
> a catch-22 where the module pins itself during init and can't reach the
> unregister call in exit. I believe we should drop the ref when the user
> closes the session FD? Additionally, should we move try_module_get out of
> the global liveupdate_register_file_handler() and instead take the ref
> only when a file is actually marked for preservation?

If we don't do try_module_get during registration, the registered file
handler can go away on module unload while LUO is using the handler
during FD preservation. This makes it racy. Maybe register/unregister
need to move outside the module_init/exit.
>
> Thanks,
> Praan
>
> > I think we should document this policy somewhere or have a dev_warn to
> > scream at the users when they try unloading the module without closing
> > the session FD.
> >
> > Thanks,
> > Praan
> >
> > >
> > > Alex
> > >
> > > > +
> > > > +void vfio_pci_liveupdate_cleanup(void)
> > > > +{
> > > > + if (!liveupdate_enabled())
> > > > +         return;
> > > > +
> > > > + liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
> > > > +}
