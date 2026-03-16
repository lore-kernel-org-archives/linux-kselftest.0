Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE543CF682
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680978; cv=pass; b=rhU0xMvP3FX21q/yMgevdjN3+ddfrS71A97Zm4rpM1j3D5epyBUbDGKKqdW5Y0BrGr+gJxYIgNj9tELAVcNn+iOjeBgWK3qN5xK6f3XRVBuNvBSvjf0X9w21jGkx+/1LeLOndsWmsk1Ph9EABbq1Isb6ldyJxDlGmtN+HYDopdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680978; c=relaxed/simple;
	bh=NNTfBBJ92pV51Q9pBimiCqTRiAqNEv5Iq9TZRM69uyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnV7wvOiYqz+hkkt7LR7mpeigTT3V68XKuFL/WcN1ANLXcBkX3XANMT7dSX0laI15dqIRGSzoQJ97woA7xbnK89qEDEEMRl2EYc4UMa0gRqZCukBiJBvq9DCP6KCxBw+R8wuj4wUuDBA+e/DjvTn3XLQ41rkGakA67XBZRCPNUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4J/xobT; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4J/xobT"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a133b686f7so4348777e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 10:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773680976; cv=none;
        d=google.com; s=arc-20240605;
        b=KpJutpHAxQWpMCL7DQwoIsL6BD0EynVul6uHOoav16FewteWscTqhubfpl1EiZvfb/
         D2bDYyToe/l5VjTr0jIvC3P5oO/IgAztKstQFyfBkAjcUrVkcwGHXugGH2dEj/cRcDe9
         lWLOTaOoW/9+kVtgUPuQROzIAUw83uMYkean0k2JnjJ+AdXiSSCxdzcvKBigQXrssWrY
         Y8azuUI4InPHFqH/00gjn6t3argQ7yaNQdwhWmcsoXIlQXJwN8coNBHuDoUkK5yzCq0H
         CspSRr55Uy88kguE5IpqY3nSsFIYeFEK5yPebBZLSD+V2Ez6jAmMWeOWLOgQlLvwXCDO
         O8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+JmK53GRb51WN1NqYAYXjEI124SxFiHPFttdlfjYpg=;
        fh=KCpdxMQPUHGs4aBUh+UTwnQNNDZqr4Bsf5RM1L0mmXE=;
        b=XtoPztPkq/BH+Lwl3Nskxc0sFzt/V46j5ORGaP2OvllllnJn0XF4lvXNpVvBcPNv1/
         3VTJKrucJBiN0nYzAeo3lXi1iItpAPyVPHEm2ohhVri50iMbWeHCCYSG4QVLsAxy6ZPG
         /E8OjSZeK+lpLKqYtPOA4aUSBAPQtCSrVJxv9JGerTiXvl84J2XUCng313nG3ljyf6es
         Icd5UqJs0qBHWQwAkH/j/dRCIcjqVC44YArIKhWMlv2abTcu8MqMCL4/7//ipZ5c2sD8
         TSx9HqPLEUpcnAdfUYvl99snQtex1A7PF6BA4DFGKMrsLs8sy+ACcjYmoc794ejegNld
         w8sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773680976; x=1774285776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+JmK53GRb51WN1NqYAYXjEI124SxFiHPFttdlfjYpg=;
        b=o4J/xobTqd61lsctsq1Mp5DIFrv6bPcSemwW0YkargjsE1WDYYBUULHlKBMCDgKPtj
         5fhMwNYHxYqciVnh8PL2wMKPEoV96+hIy8NDYDzoZl+GhXvBaH/QuNo/rcXK2s/Ayfbv
         PKomlm9ztOHqo123bsT3x7R2n3tg29nr6V7XHLhbLlHHTpmNcCqu8sdyA+7OFaPD0BUf
         cFbnfgnrEHYKTjk575MTqX76oiNSSki8NSgASzqPoYMRwxGt0I7bZayK2J5a8eiU411c
         VBPbrjTqsBo1uDOIE2Uyl/MB2SLTYmlNXZiCXfEbLpMh9ZB6OaWxgNkwvT9frHFEwRkb
         67PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773680976; x=1774285776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9+JmK53GRb51WN1NqYAYXjEI124SxFiHPFttdlfjYpg=;
        b=UCYpxUzIg6qfkcE07FGPVWJaceK3km7zwXFVspmUcEyMwa9EcVGr/LamVoI8PBx+Z2
         5+jQdXgqtaptB25YYpqPxVKdh0CJeHJFUB3OYo2acTPkzP9usI7GoMpmDNgEyvu3ObsQ
         D9ERAntZVUbeU4K8RncTc3+j2eYI96wQkeT16YqC6CeGbej5+rldPkqIvZ5Zz2X0uriF
         oiTg0moq+QmPlcIcd8/oMNd0xqVZ//ju82e7k3MyK90YiEC7rk/Q89jTA7DSfzwVdLQR
         I9v9KT3XRr8gtZrqPCJ5UU+dA3G4CN2j/fMxcjoT1kuz+eD6A+VIw0ywMlaegu1cYlX2
         OTlg==
X-Forwarded-Encrypted: i=1; AJvYcCVJocoPrTfj62wTUsyyWzwi0GtNqY03UUP9kNHmUf+iULMCaIZAcPUw+FAeEaf6rZVv/Z5i7J+CTSQjjCXIMzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Yxm2mCCPIwEgQY5RfCLL7MsaLIDVMwQBfr6rEKDp1+lFiVC8
	C3dQaihPOyCivDTU2D4vT1L8Fl+mRHVgllcr5/37la+V2TxFUEI5nsYW20+ifrGyRPgdNDC88Y4
	o+lGX+5EkuPs6To6mNJDMUGdEuHiTC/0PMEiglHSC
X-Gm-Gg: ATEYQzzF/SvzwojFJ6aEHoKb2KItAKQQgfdc3IZ2dZk9n9ynwJ5DZlyTyZJPaSMgVOj
	tXt5jsmoPeqLThkubcasGrQzacURDjsETwkcNAVduTVSMXD6wIMVrqRfoByhuwLsyMrQmuLSdWp
	+d8WB/fb/fVSLWWT5a5SzwRs0CAHP9rWLSEbXBxSEP2Fnceu9Zr2FuwSI8t5puGh5u4/9KXCxTQ
	0ctBcCEiUHdtOsiAS/L6l+8BeY9SqnYVbRe/beMzSQkf0DJ1T1uV/T7nX8npo9bJC2Zxo7Xl+nC
	JPx1Q7+8
X-Received: by 2002:a05:6512:64e2:b0:59f:6a2e:49e4 with SMTP id
 2adb3069b0e04-5a1626fb8abmr3594350e87.7.1773680975067; Mon, 16 Mar 2026
 10:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-8-dmatlack@google.com>
 <20260314061747.GD4177610.vipinsh@google.com>
In-Reply-To: <20260314061747.GD4177610.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 10:09:07 -0700
X-Gm-Features: AaiRm52NY6sLPHJr9Fl_13O_4mOB8Cua734qhyhURDdG8FlJ-PNRJ5f7ttW8G5g
Message-ID: <CALzav=cQQny8AXzewtSe2pM-Z20+K9UbTcNBiy6SC4PUzR3sng@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
To: Vipin Sharma <vipinsh@google.com>
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 9:03=E2=80=AFAM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Jan 29, 2026 at 09:24:54PM +0000, David Matlack wrote:
> > diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/=
vfio_pci_liveupdate.c
> > @@ -192,10 +200,24 @@ static struct liveupdate_file_handler vfio_pci_li=
veupdate_fh =3D {
> >
> >  int __init vfio_pci_liveupdate_init(void)
> >  {
> > +     int ret;
> > +
> >       if (!liveupdate_enabled())
> >               return 0;
> >
> > -     return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> > +     ret =3D liveupdate_register_file_handler(&vfio_pci_liveupdate_fh)=
;
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D pci_liveupdate_register_fh(&vfio_pci_liveupdate_fh);
>
> May be we should rename pci_liveupdate_register_fh() to something like
> pci_register_to_liveupdate_flb(). In the current way, it is confusing to
> why same handler is getting registered at two places.
>
> Above name will also make it similar to IOMMU series as well
>   https://lore.kernel.org/kvm/20260203220948.2176157-2-skhawaja@google.co=
m/

Will do.
