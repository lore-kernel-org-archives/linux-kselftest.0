Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1245336074D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212100; cv=pass; b=GqbmpRbA8VK3FKU/Mrf6mhJZFC9EKs2sWCiRFovzsrNy04xVz6QBGc+Dgrt35RB7t3R0AWGgG7qud+8rbN9/ri5BcVS8E4xLzUztGdUq1carxVWMSStFQfZ7Q212ZDFb+ERq3UcAvlcR1HxoPrImiAjuYl8otX5Nti+m9/767oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212100; c=relaxed/simple;
	bh=hgtMP8VUtY9P76ez7WKUM8aE1sgvg9AP+19rjG+g6HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKcMMW92lSEfB96jV7Fds29kafD+jg+zzdft937YZZTArRTP/BczCA2MLq553xqjomAoocXUwW+oTHk3gpuP2VPLdAMahxdm5/NZbhGxaPuxHCj1RfYDHmcXqzJKIRTVsLPaeemaGjnaaEIhhYpdlGsV5qyM1KzhjW5opjGTWn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PgPiHSvB; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PgPiHSvB"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389f200c26eso25857261fa.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772212097; cv=none;
        d=google.com; s=arc-20240605;
        b=a2tWxG/80WnCPZBtjiOs6DzUv0nG5GopnIqlt1/3QYg24+MaaglqVtKc7ZdAqeOEMD
         gc/htgqnh+NPbqCpgsGT469xrjLLTGGGz+C0JxmGX89W/DZuQ6lE+PlNH54z4aZ1TUhf
         vI6T7uP/otpw78hbQBeQdDcVTYrissb6WtR7AAq5yqNrY889Nbkd5ZzGTimPZ36baZAl
         vgqdOEaXhHV8USLehjR3gvljbAzT1kmgFvr++uedfdry3SkkqBx6suxrt4dhFEXjQzUb
         4uOxHFlhVi5F8af1Fvbz5wymKv1KrhaQMbwiTFekPR6VP6JE+Zbmr1yrTcbo1Bxxc5BF
         zS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y7MEfERrDZZYp0c3EO05mpNNZJ5XP1zAqLXvGoyft2Y=;
        fh=bRGS/QHSO+EB6q91v8fO1ZkpURjTsr4o+DMLNpZBZW4=;
        b=gZe45QVYUSSHrbFLVCBfIBvjg/p2va0ZxekMJFsZVLrLgbsALgBiwoBu9lv5kAwtXv
         y57a0MGw51A2SGVZfKuQIHSy0kSKqgYG1eVwm6YpXPXiFhkYGacGBM0F3bB6CMUmGNga
         wXB0sgFuXhqvuMfPUZXVsYbY+351Ng+4+RAMHmCWLAg3ZOGd18c5Gg8JDU0I2QpG6Xq0
         trz5Chm7DF45AKr33v4R7U2AsEYEzYR/BAumf6ulythkfZ3wKuc+n/3ccohWcOFYDcXb
         egXC8uZ94f+pIRTVfIa7kExyiR71bWCoav8UBVnALqt3u4MWiAPtdL1e5mqPtO7EKSTD
         Vphg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772212097; x=1772816897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7MEfERrDZZYp0c3EO05mpNNZJ5XP1zAqLXvGoyft2Y=;
        b=PgPiHSvBUI+6gG4LIWdV1P8tP+hFkKXk+TFFDvSHQY50WokDZVU56YMWiqXkadzDvF
         dmtlcfNCGrEBiqCje044yvDu+SRSRfiletzn5UHk6aDk5+045qCqDx9KZIhw/o27OQyt
         UCKQGipmAhUvcb93PWkufu6jfbdDWWfD7jV0cQTUEWeMstaBqGManjqzjqQYtybdqa4L
         pEO1bYIczqigj3PY5FSg2rMiDk5C7w1QRrnXsEnaAKPLDJTj6pp3XYC4Ydv2DCasxQxQ
         uDX642xnkksbRVZwr1quu0e2bw6oAYru6aoEG0ikwUHlNxPLSG690KLg3C8rSaGWmiey
         vDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212097; x=1772816897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y7MEfERrDZZYp0c3EO05mpNNZJ5XP1zAqLXvGoyft2Y=;
        b=hnNbfe2W1Dz6JIQL7xYv1IsSyf3b/hu3kq37xGsnLz2aECY8OuMyzRqpgsFOF+8/la
         Gqcq08vCbO+2ItIpXDPO48tSYAkLZtM/bjJg5lIimqeZTMfLXpb4XpvyBsN+4cOm97Oa
         ByBe6X95kXPhqXFR9Bl1mZcrmRlQsAmQFoCnOIY60kGGGpUGBqUODf3qlPZi0M1+z4eT
         p/UDWnaQTwA4HtWRRhoaKWQGD1J9CK9X/s9uzqJoFZJyGclUnWfvSRQ1RYdiuc+ZUXoP
         I30k0qRVHzcsNiATimK6kencilcbNS98bp4TH7Z/sjesPjePvSa+cwPgeDoxtsGoCgsV
         PA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWALJyTIO5HWfFXBguPQL6Mbtp7Qe3Ja8PIbcQrfiPux++i+n9tOIPshswuQebLWCL+9foPEp+ZIqqqFVfg9Go=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAn1P4kmbhKzVNWo3YrmsJ+mksH5yj2TK90NddhuXocjzJB/LJ
	wbXdxcRnYkKpJIfJ68WRwW641T0iJPY1guZdbhLrZvTLUEV4URQZ1SLuif+B+G3k8AwRRdLCAAH
	51k02am8U62vGZJqet6YjD0XJWvZIwtFHv4Cbgkzp
X-Gm-Gg: ATEYQzwSdrvTxWOCZfm5v+KJBtM8z/eFsbbJHqakTZ9XNoiRCSrVe7/W3z2kXv8NGi3
	QKyzhFYIV4XZPWbvRMglynaemAxbj/d43pWaX5J86gXzDicnc5/jg59qDvi64k0j7adIVPgeG3q
	gZVkIqNLKVLG5RNgd8YC7Dh96MoE8GK36k0FwUGkKQk0shfAThX2dsEfpda6QeN94PBZD3HJLeR
	yH27vi09JSNlizoSriYCkoHQHpXOWp4qUKX5jEDgx9tS16PzDA2S66z/6XtOOd1NU0AACGRF0Lp
	6VhV65TxZNl/LybhAg==
X-Received: by 2002:a05:651c:50f:b0:385:f7ce:f321 with SMTP id
 38308e7fff4ca-389ff15f271mr19911451fa.26.1772212096622; Fri, 27 Feb 2026
 09:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com> <20260227084658.3767d801@shazbot.org>
In-Reply-To: <20260227084658.3767d801@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 27 Feb 2026 09:07:48 -0800
X-Gm-Features: AaiRm519T9RurPcNiWyO80VEVhcFvT0_H9lBfATMd1KVW4QtGFBpubzCvVI4oqQ
Message-ID: <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
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
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 7:47=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Fri, 27 Feb 2026 00:51:18 +0000
> David Matlack <dmatlack@google.com> wrote:
>
> > On 2026-02-26 05:00 PM, Alex Williamson wrote:
> > > On Thu, 29 Jan 2026 21:24:57 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > > >
> > > > - vdev->reset_works =3D !ret;
> > > >   pci_save_state(pdev);
> > > >   vdev->pci_saved_state =3D pci_store_saved_state(pdev);
> > >
> > > Isn't this a problem too?  In the first kernel we store the initial,
> > > post reset state of the device, now we're storing some arbitrary stat=
e.
> > > This is the state we're restore when the device is closed.
> >
> > The previous kernel resets the device and restores it back to its
> > post reset state in vfio_pci_liveupdate_freeze() before handing off
> > control to the next kernel. So my intention here is that VFIO will
> > receive the device in that state, allowing it to call
> > pci_store_saved_state() here to capture the post reset state of the
> > device again.
> >
> > Eventually we want to drop the reset in vfio_pci_liveupdate_freeze() an=
d
> > preserve vdev->pci_saved_state across the Live Update. But I was hoping
> > to add that in a follow up series to avoid this one getting too long.
>
> I appreciate reviewing this in smaller chunks, but how does userspace
> know whether the kernel contains a stub implementation of liveupdate or
> behaves according to the end goal?

Would a new VFIO_DEVICE_INFO_CAP be a good way to communicate this
information to userspace?

> Also, didn't we violate our own contract in this patch by adding the
> reset_works field to the serialization data without updating the
> compatibility string?  Thanks,

Yes, I will fix that in v3.
