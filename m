Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F436F40E
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941068; cv=pass; b=eC3IqpqxWrkI0fix8epRsLIDivOPfXAeAx55Xfy/6z7lKE5wdlq6cZwRagvLq6rIgCXoWpM4OQ3tszDxej7l2lIHbyYJC88m2am/vSIQHPEajyKwyQBAEfSbe64UARLisSJ23mDXNrhq5+p1ydzrlDJvcbTZEGYRao/ddjReg8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941068; c=relaxed/simple;
	bh=PnRXQ5r536tu9dvMTvBl5NRPrIFr2RFjQXbYpbnAzLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoCtr9t3PD/GNw3Lfskl4pv+aHYIDFuFfjN5GYlGb9YfT1KQIQ9X/yAEmmrmwjcgrnuWKOZzdn1RjqcSoOqkwtP1o5b25EG3QjhgOCExii2hu2modMK2iai2ACGCgttvvWnz5rc8GMf7/JQgrfgqnbTBGq5AzmriNqtBP4niL1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sB5di3FR; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sB5di3FR"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so1322571e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 10:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773941065; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/nGUVIvH66WP7+w0jgls16cnvtomwHAKNzjdtZwj/SRxOqhBrgivDmCOietcMTO8f
         SrF5g86jUFfWiT2TMJnAxMmzN9Kg8kL17tQfzudDxHg9wJ0adIu5c6JQ3mbxVt7xcxSA
         o2NHNXhS/YtFIr2OcnR87WcMXsi6Eu9zo0etSbR117lPu84W++44Ir5TZ18Kdmw93ndT
         WlTlR92eUjeySsXP9q3SKCBx6mmVEledC5EarfB6bQfj7xYd4gH868x0HPZC9oKbYMGv
         XW6Ik8yGheTtEM+4z3hnYUhW9/ytoJmtJhaaOzQvU1t/Tf/JhhO7tdLHoyaG9wnjA10k
         LeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWL7Mvz3ZFb3DsvrD6klOpnMDDqkJa/pdjIb2Ow02uU=;
        fh=hoQPMa70+MvAn+RZ9beqPk9CLJ8lKeENfCLHDi4eSSk=;
        b=dVcyRTDY4Ysp9ZdTPD2Y4LkHCMk3QKR/G6KSHtV8kLSK9qgfw2OBGuinDqmuzyaaEy
         KzZKr/CdVyW+MY+CJban5j6+BzQJLU2GumcvOjQd791JnZzTCY1mt7ofZr3l4g54oZzt
         ib1fpfGY9SLJZfHn9zS8xKZATrE5/RJ5ftKOyg+fCfxM+TC6a2nIyVVCD/zQ9qFaI0Z2
         CLlns3PN551M1lnv5sdGhqPY+PKC9ctv9E9URZcnuinWRR+j1ZTVQIOHoP2WCEhv2Kzn
         2bGC7DJQ83mQ+Rk31OmkWE6NT3Ov2kgN8HERJQRoQa2wZD5F9nW0Gn/vjfJbY4HCJfbC
         9eeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773941065; x=1774545865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWL7Mvz3ZFb3DsvrD6klOpnMDDqkJa/pdjIb2Ow02uU=;
        b=sB5di3FRgJ9AXnlpTkOtdsmLaYjKyf8sZRsiZOwR5HpmHxIGL2jjU8LyMmZQnHAleu
         ODrpsSSqH5k4tpjlbe1BqR4g0C/xT16CzNerIj6obCQ+CsbtCFO2qqBtRS0Mv+q8lt1P
         d8PpNaiyi+hZcdIs9ovvDvAzKiuqUN4fZ5Grl5FnScr9r8uwFk1TkI6z+oS6rWvWWxMj
         uFIiRzqoc+tCdOawOx8cT2HfgpCa7ryPk8VhHaTK1CX8oWB5nrKOomORqAQskIZerm++
         jGKnE3uIgXTlIkpLLemWDbo/z685KXLGIkfyr0L87hpdUKENvZWhFpPXFsxm6eticyrl
         TSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941065; x=1774545865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWL7Mvz3ZFb3DsvrD6klOpnMDDqkJa/pdjIb2Ow02uU=;
        b=WGmEmkJdPEwIXP12iOm/DNJQp40Y63dsD0cfCfZkCXmeku03BTLfj0Ee5Sq/q6r4v4
         /78xeGaigE3fz23zyKt6W68akgf8HZeJHDNNEPrriRQ8kzotTUR+iXUvtUt2qGq1nodY
         J3u0+jRF6PdRVgr7OCGbOBq8tQBbrzGlmU3TRkruuutuSK/T/8EGdvBWGA956OqYRkqD
         De/nUUW4KiY99WQKejSxdDMEe1vQJhlqm9+WtRDbCsO4FTv7qkfRkwKxtFyzZ2y57A26
         400qb5SVIxzsCB4T0IvSwv1c6VsIss0TNp9hhpGTegpdNN690yFyC2Hz3hphpemEnbPI
         ojyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoGFHaM2g1/ZWVRK+3Nzzs34hOmX8mNJ0e/uo8Jb/HnPjKjDgEei8w2bDnn1eT9peXSV77jnUWLM5vHdm/IMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFFnxEmw1kvcT9CT5eYdUr8tSYXGB92iF5DGuBy3+5VHUjRZLf
	tF3CmSOMvuGlO+3x/4ifPEPHWECuxSIOYdrX7NEWQPuJwtFGn1SmsBn2nfziVq79JPFW04y4SqY
	DHTG9GNJr0izQo81ITIBhQ3EeAM157dsPWDyjnjRq
X-Gm-Gg: ATEYQzwrylBs15jBMRe5nOOmdmcERL4SKYq7XnHSgcoKaTe4hGCcGk6OD/SDgC2sPXW
	BA+gDn6M4k9Cp+d/xP67PRQo2XkaoGy7uJ19UHOvRZMUfM3/GyE1CKW9Quguu2QuG7DU+Uch+8R
	Myi8CjumSp+XS4ZdGlgdeRiOQv+VpFmjpdJP3zQCzckLhVIeSWWjj3Fks4yOcx4i6jzHMfDcJcm
	QSQ7mWrQ3W/hN1L2CDjtCDdIlH7uE4cd1Qewsc69X/PqLOIq7U5GVTGmI3G6eMqSNDqwrvKIeOI
	V+0bkl63
X-Received: by 2002:a05:6512:4016:b0:5a2:7e5b:5a48 with SMTP id
 2adb3069b0e04-5a27e5b5b70mr1566015e87.26.1773941064245; Thu, 19 Mar 2026
 10:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org> <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org> <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
 <abNOwcOTXqxCxNzt@google.com> <20260313083918.00005731@linux.microsoft.com>
 <CALzav=eGLpo5nrsHq5L8bUTC=FWZ-SgrTE1FoScrWB4p+NDgnA@mail.gmail.com> <20260319093932.000078c2@linux.microsoft.com>
In-Reply-To: <20260319093932.000078c2@linux.microsoft.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Mar 2026 10:23:56 -0700
X-Gm-Features: AaiRm53rqLDO8igOEPnPEHv7Le9OPlkg99gzLBiOllDBuZj0inzOHo1IukO9vNo
Message-ID: <CALzav=fvG+s6MYNzxhuHFmQkmTRJJASXAGs=zQWWSnSv3Y=J9A@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 9:39=E2=80=AFAM Jacob Pan <jacob.pan@linux.microsof=
t.com> wrote:
>
> Hi David,
>
> On Mon, 16 Mar 2026 11:11:20 -0700
> David Matlack <dmatlack@google.com> wrote:
>
> > On Fri, Mar 13, 2026 at 8:39=E2=80=AFAM Jacob Pan
> > <jacob.pan@linux.microsoft.com> wrote:
> > > On Thu, 12 Mar 2026 23:39:45 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> >
> > > > +config VFIO_PCI_LIVEUPDATE
> > > > +       bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > > > +       depends on LIVEUPDATE && VFIO_PCI
> > > > +       help
> > > > +         Support for preserving devices bound to vfio-pci across
> > > > a Live
> > > > +         Update. The eventual goal is that preserved devices can
> > > > run
> > > > +         uninterrupted during a Live Update, including DMA to
> > > > preserved
> > > > +         memory buffers and P2P. However there are many steps
> > > > still needed to
> > > > +         achieve this, including:
> > > > +
> > > > +          - Preservation of iommufd files
> > > > +          - Preservation of IOMMU driver state
> > > In the interim, what do you think about moving forward with noiommu
> > > mode without preserving IOMMU driver state?
> >
> > I haven't gotten a chance to look at your noiommu patches yet, but I
> > do think noiommu will probably be a good way to develop the VFIO and
> > PCI support for Live Update without blocking on IOMMU driver support.
> >
> > > I=E2=80=99ve tested your
> > > vfio_pci_liveupdate_kexec_test with the noiommu cdev, and it works
> > > as expected.
> >
> > Would you be able to send patches to add noiommu support to VFIO
> > selftests? That would be very helpful toward allowing us to develop
> > and test Live Update support with noiommu.
>
> It is included in the noiommu patchset; the only difference is that the
> VFIO cdev name is prefixed with noiommu, which is not strictly required
> and is done out of caution.
>
> /dev/vfio/
> |-- devices
> |   `-- noiommu-vfio0
>
> https://lore.kernel.org/linux-iommu/20260312155637.376854-10-jacob.pan@li=
nux.microsoft.com/

This one flew under my radar. I will take a look and respond there, thanks!
