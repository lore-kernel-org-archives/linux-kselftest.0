Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7017D6
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067139; cv=pass; b=sg+B62PvsAl5bDktGrF+nDf6cAYRhWCnk2NEZqEJITLfsgxP/uPx262OdKLQR8CZfOGacuWpso8RmKImD2bw7wtpuHcFT/pSnSL1aBCs703UY7IUUqm90bRyLsKzR5SF6oOoRH9rx5kQvN0NGGsE/ilZOz3nL2vVSbFXPfcZotQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067139; c=relaxed/simple;
	bh=5UM3OPrEzy38BQ/z8lTr67s9jTiNGfLCQhFUKKuIZuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ne8t0KZphlUtf2bX56nEN0Khvkp3SLwctyWJSqMISbd+DpMH2rlLr6kUMNYoYCI30HTFAPCFvh2wFQmZL4Xtej4sL8u2qyk1PEEQ4F0VxZ5SOL+GYeLzQJFz2JwihfrO5neCNFXrYZu4N2TtXz8pp0Jh7iuNwf7bQUnPFltzTyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Isym9Zp4; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Isym9Zp4"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5688b639a19so153011e0c.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 16:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772067137; cv=none;
        d=google.com; s=arc-20240605;
        b=Lc74awhWKIMR33OdWPhokoZSlFIUri3gcy4NOfAI/eRaHPTPeKcJ26ZlA5Yb1NXAv6
         8Ev5huKEl7BMuQ4j96JkbOrsz5W3yN4c61PMWIxLhqOC1p83s2sxiDwYkn9xrf/vmWw/
         S9aaQK2Z3jkzcFvpMI3TIywOprhtE8mr9KUhm+mPbxuONG3deVudbJFI30uNCAT5Fsb/
         661rUx4eDtnSimNXt0FS9kSXH5y+CS1SLab5c47BvT8ii68hGu6cNVicFyG4s0glM8qv
         A9LqFo/kb/nowHinHJzgkXPUBDi5G97cfJnqOami3b2YqpWJqSqTVAmOQgIvNO40tdQb
         h3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tit/ZfajxqvE3xISUpVUeXJRv5DgJC6ZdqyR1I2SKAc=;
        fh=l8GOa6KHi4bfLeSTg+X9UULpq6HWj4ID3S6bx1JkAZc=;
        b=d5NIS/Y8rYTAT5DkwOnX1OcbCmncXajAnd937ZD3000fGiwTG+7wbGYWYTwd6pp1Zu
         JujqIWdJ6ymYYOFODe35nDk52SIxWSlJXVUyeJX/pC8FekpSQKBScPi+b/2VOmKIqq33
         sXuT8/DIKaTK/6Mpb5kdYhxLWOIbiWkIKInI92bBzxOKTih2uay5x4ToRhq2qndHSh2d
         v9540bcgZjRcP1kh5KyE03fP+H4GWmKPPUFLiZJ3NAMHXIAkBGKU9cOS9smsiqnzNglU
         KVoqjhKRwchgV2fHmfFrXN7HfNWyBXnfxTzOfXIEpCjaJZNGXt9t4b6Ezjw5X/gROuyO
         +mCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772067137; x=1772671937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tit/ZfajxqvE3xISUpVUeXJRv5DgJC6ZdqyR1I2SKAc=;
        b=Isym9Zp4jjzR+PC3c/BniSDPSxJbrLU8884r+rart9fG1ueJm/2EFzUZ54EEDwayeH
         4TElbvJ6sEuwu2Q91jPlhwmiNC15kR69yqOPhVJPvW2wHKUiI3ZQuEvDaubPPR5D993m
         Hnp/o4nbcJCA4D1/8p1P4oraDX5owxN0FTeHHx1eObgCadot88UiLgxyonvldRh4c++g
         zxEIpMNtWGmkw4Kjsp4F1Pk6APFcQZ8azzng1d+4eZdwvQfMelhgLDii/TcG/monS+0f
         1Zte2TRT8ls6qpt0pJKTAa4dnhta0PRjvHW754pcnzj+v1EdXGsgPbefOu4Ncl8P2vbY
         cZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772067137; x=1772671937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tit/ZfajxqvE3xISUpVUeXJRv5DgJC6ZdqyR1I2SKAc=;
        b=RhlrJD6Pt2mq7XQpgc+Uobpd5mO2PTc1iLbVFmW/NmGU8l1syq9GUhPi64YbOt+ZQb
         ZwS/+k2/UiTswjhbw7RoGv1LdL3555YnVLtPbWo2OdpIpWTjLb2JKZ4fofqVpAIlRjw3
         WqwiQklOgkUveZHCm/KQSaxUU+t5L0cUrddJgjyVdFOQ1i9M1MXL8a49Llu06icGjHwx
         GGgyrzoktbnepoUGW9ew9iMtTkX9xLc5fqJdOIC3Q9qyxWlP0fYqJ+4sepzHmWlZkBAl
         tooymMFHGayzicAYTdQWf6DwTezh+Ghb2uyln+eX1uDD6VdD6vN+UgVYnhWEApq/oITP
         Ewug==
X-Forwarded-Encrypted: i=1; AJvYcCUY3PPzQvP7bp8mziM2wkZa06tggr2IaP7cJ6z2x7ASFOAiuOdSBciRrKzUzle2ZxrwM6W0iXPZXKZROYB3o1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKp2cl3PzxjVuaH+ep0ROHtgJeBf7xPtLXmh53+LPpLH6QgKd
	94u46zToXEomjb7nc8hbCYJ1IulHIoREfZviBKBYCJlssuBu4iM11TSYWoWujXfGIFcLmqs+OtH
	CQglPk0jxZpp3nlzc5tnKx/75Y+qNIonkbit9ZyHa
X-Gm-Gg: ATEYQzx5rC6ryWkVMXlXX1h0ue6/eJy20yO/6ctta4Ix62oV8KCEZFhgDub2MYhVc2G
	KawaUm6c+bJwTS1s96W5KGMHZVmFg9bI+QKyFmJefN+aSu2L+RpEUYwDS764B84UMivZEG/KxP6
	dKNIuS1MwjTfeTsGwl0+DRwyf0jHbTNDwNtGFOfbc3Xx7bjJVlI7/Shp9p8Iyu355t7i3PwacvF
	DggVspp3vKKpx324KuuvQ5Tgthb2ArLB0HpH0WLei4nTElok7DF9ZjEOTizowMkw5ZOO4XCHyLb
	8DiuRqA=
X-Received: by 2002:a05:6102:3f0d:b0:5ed:f13:e58a with SMTP id
 ada2fe7eead31-5ff1419f7b6mr1037473137.37.1772067136513; Wed, 25 Feb 2026
 16:52:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-10-dmatlack@google.com>
 <aZ606sDJxtfNF6qW@google.com>
In-Reply-To: <aZ606sDJxtfNF6qW@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Feb 2026 16:51:47 -0800
X-Gm-Features: AaiRm51I1tTdJRO5CbbBFYwdOmR4S6VSPvkujC59eyupuwvOv4iLZLnGYRmW3DQ
Message-ID: <CALzav=cH0-qqQJTOjDD7pHzsFeZOir5DoC3f1hhDg=jqK7vdgw@mail.gmail.com>
Subject: Re: [PATCH v2 09/22] vfio/pci: Store incoming Live Update state in
 struct vfio_pci_core_device
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

On Wed, Feb 25, 2026 at 12:38=E2=80=AFAM Pranjal Shrivastava <praan@google.=
com> wrote:
> On Thu, Jan 29, 2026 at 09:24:56PM +0000, David Matlack wrote:

> >  static bool vfio_pci_liveupdate_can_finish(struct liveupdate_file_op_a=
rgs *args)
> >  {
> > -     return args->retrieved;
> > +     struct vfio_pci_core_device *vdev;
> > +     struct vfio_device *device;
> > +
> > +     if (!args->retrieved)
> > +             return false;
> > +
> > +     device =3D vfio_device_from_file(args->file);
> > +     vdev =3D container_of(device, struct vfio_pci_core_device, vdev);
> > +
> > +     /* Check that vdev->liveupdate_incoming_state is no longer in use=
. */
> > +     guard(mutex)(&device->dev_set->lock);
> > +     return !vdev->liveupdate_incoming_state;
>
> Since we set this to NULL in the success path of vfio_pci_core_enable()
> I'm wondering if a failure in vfio_pci_core_enable could cause a
> resource leak? Because vfio_pci_liveupdate_can_finish() returns false
> as long as that pointer is valid, a single device failure will
> perpetually block the LIVEUPDATE_SESSION_FINISH IOCTL for the entire
> session preventing the LUO from reclaiming KHO memory.
>
> Shall we also set vdev->liveupdate_incoming_state =3D NULL on the error
> paths of vfio_pci_core_enable() ?

LIVEUPDATE_SESSION_FINISH will also perpetually fail if userspace
never calls ioctl(VFIO_DEVICE_BIND_IOMMUFD) (which is what triggers
vfio_pci_core_enable()). Or if that ioctl fails before it gets to
vfio_pci_core_enable().

It's not a great situation to be in, but this is why can_finish()
exists as a callback. Userspace must properly and correctly restore
all of the state in the session before the session can be cleaned up.
And the kernel is not going to handle every possible edge case (some
files in a session are restored but some are not), at least not
initially. If userspace gets stuck and cannot recover a resource then
userspace will have to reboot the host to get back to a healthy state.
