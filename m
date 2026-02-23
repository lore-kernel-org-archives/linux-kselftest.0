Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C2A37D125
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771888130; cv=pass; b=OLzvQ6u7fBcjgMayWN1Q4+y0LB1Q+kZRVQLxOwelIXdy0G4MeRQokBRIKnlS0oIt/TgFjWy4trtELB2bsOGiTVUDyegsF5c8Y5g7B+C+AjW1bE0JBXE1U1S2Oz4HXOUQbZxMM2HBzupfkgsYu++A6Xn2MZoUAdSsJAU/58kEIAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771888130; c=relaxed/simple;
	bh=Ydbc6rbyk4KLWrkHSXSI7j05eAvfIq7SG6ROABriCE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfDqdAK8XFjClXEnGOJKspNWbfl8Gx1ZeEDyDwzyDZEOzMEewzfrcndIS6nfYoWMbmiWRF1odjQYF6fdQNSTqNX1nxdNfitf1ZDTw2r7rsvEPvkVhi46MclzVpapqCRs0a2WPrs1AlQhtDAFNcrIbDOD+1uh/NgYAA8xzbRQyys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2jOm9V3; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2jOm9V3"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385c23b88e8so40566561fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 15:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771888128; cv=none;
        d=google.com; s=arc-20240605;
        b=KMkPJUb7ssK95ys+AY+90O2LexbUKslganW9RtLPPP+IPtlHOROSmsQZBVrm1UCi5r
         5zrtxdhZ3tW5YVS096vxlW9se/60JHygn3ekrnIm/XTucfkJcBTCdMoIVY9PPD4i+Xzc
         SmDz5MhiaWr8w8bJv0OHq06WVehdQT55z2c++JVFmaESMS4NItUrYMunLxrUpt8NikAs
         PbGth6ekYnFJkcFaH7RJ90QF2pgEY/lIw9bbDbfFWfF3vo5J7zHyAehMPPPe3uacgLxe
         Y6lqaY3qXyLNoyXySHrGHGxWmxTBAdxeB7QhU+GnJ2kr0z4XElfaonLecFPMKsxpi5iZ
         vzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c4ne1Ls/uKmuDNTWcMVVG01PBoi2SfFbs/naiop9R80=;
        fh=iIFJhUca5B5AzncFP/BLXaf3j4V/3yc0wvbJtRNODPc=;
        b=KD3+11hlqFryFlB9Ulpg5WpdAWthE4yfE9yZ3urHznt0OCh2M3gxr0oqaGrLY4R+HJ
         6KTSuF/hsW1ywl04Qk9TIZEVJH4kAEgZsi2/tmOOGzpcc5a1hJvOJKRCSWBMT0nolQOQ
         x0r+fQvuXGGeTLq6x2TlckJdLLKsqDDMgr+WZudLvzJAloLf9yudB28SZlB6jb1nZqC9
         d29qWpLhtTG7nYa+3IzFwZv6/OqEmrDFNIA+oaz7kf/FVI02xUt+f9t3hgf+xqKY08Dh
         xllt1E6FxtqTPk3LVQKS/z8teKsNBHV2MOSeKeRJwONiqskcSm6MpKS3NqLE6jq1bNto
         3+hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771888128; x=1772492928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4ne1Ls/uKmuDNTWcMVVG01PBoi2SfFbs/naiop9R80=;
        b=d2jOm9V3cdZfFgFgtcOR6roP0zV6o54zg6vrHNIGDgRJKHwNbJiF1oKLByePDLu+RZ
         RvMt3et4QhS2OXYEZLCppfk879ITR1XE3hdUPE0ThGM4C5mKeUT1c6Dnw3A0lQECdVkl
         MLoG2wBeARg8OaPUQOIlRAOfeFOFaPvyTTni1e89jNXDRH3Y9eV5MY26WNXGwo94WMnt
         BXxRYZWJ2B8+cz37pMBIO8DoV8yI9noiFuHZhCyj7m7o3+hGADuNCMWgfkYrPxRDSG8F
         BiW+Yp8TW7QxilchJG8UantylCuotfQo/2+FVQfg77AktnxQ2HvZ5eoU2Dy5tsafT9wJ
         KNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771888128; x=1772492928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4ne1Ls/uKmuDNTWcMVVG01PBoi2SfFbs/naiop9R80=;
        b=mW74rW+bbRIvuTEIZC525PyJzzQHcuF4PbA5ngwuUVy/SYCI1oJZhKVRJgjDQdklHa
         GHyQGi/a5sHXlyWuJUo53tNjqjuxq638kCShvJMrf5TIzKXlLIg7BvEWnQZQjSy3v/QI
         B8/RFTU+uekSQz42XfoLobMOr/Az7N1sA/xQEeZFSP8tWU35zgoLDLj51dCN2ZwtwCFt
         htAOFBAQs26xXXZZ1E4r6XlmWNLdAZZudIQGP4ICvGkzbE9yD3QE0zexirKWcPxcpoMg
         9qDLSMZyxoiMdVRXCEMNgb9Qwmn8Uo0rLFpyjFtPXroq6JO4RWQpmzGtrNdKqP1Qmlti
         k+WA==
X-Forwarded-Encrypted: i=1; AJvYcCV6FRewpgZO5zyLNiGh0fzOoxSG7PWw/bosSw8Gdhs1aOvEjlbUGvdt9a5DJElJTxENwp88bsLzoAzby/+gzyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrIGwdIBcQucZxXXWlMNOueQY1iNuzCJHdEn/N1/coXmJR0CJc
	VgwKddN9ylf40GasE+yAR8CtoJilY+Kqplj1vvE9qDBpmjTkEINS6/BabmazdQyeAt4sZZpaG6V
	Q+DPHwJqDYxoGnLCarW+CkfNHbYGz5a83wxe+CRDv
X-Gm-Gg: ATEYQzwnyQH37cBCK28SCovAftgWooRDfYYw4gXBLIzdLLnC3ied+gbcoXiQLBuOLai
	Y4ZzAHCskgS4vtavnZQre8jbaNNu+4FVfFgEDwG3Si6BV+B+sgj8EhQBKjpTG06ntnls3II9Jph
	V3A1m314Zp675yu0/Teiaqlau2yavh8BBcRbxdGfC/TRfGmR28NFmbf/AqYyXXLi0gzVVJMcZ+k
	mzuRWIeMNqd/6PdVJmunduNQMH/rGvDVjYItl3VZyokCVLhNGhQHbu6Vr1XHmyyYYUsI9abOeZZ
	AMHe29E=
X-Received: by 2002:a05:6512:3b9c:b0:59f:8546:1899 with SMTP id
 2adb3069b0e04-5a0ed87de41mr2986457e87.11.1771888127316; Mon, 23 Feb 2026
 15:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-3-dmatlack@google.com>
 <4mbhcmimhin2ulz57mbzpe5p5dkhfziiyep5k3vgls4zmom3sb@g6jlouyvmpuz>
In-Reply-To: <4mbhcmimhin2ulz57mbzpe5p5dkhfziiyep5k3vgls4zmom3sb@g6jlouyvmpuz>
From: David Matlack <dmatlack@google.com>
Date: Mon, 23 Feb 2026 15:08:19 -0800
X-Gm-Features: AaiRm50_OD8BarR0N1ju3iFQZFALazFmYS4w16LFHF58C19D7VPNrgpsKvMORCE
Message-ID: <CALzav=eXY=ZBshmpi9axt+_0SxaAm0Xbo7w==nCWJwKK3xcThw@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Samiullah Khawaja <skhawaja@google.com>
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
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 2:04=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
> On Thu, Jan 29, 2026 at 09:24:49PM +0000, David Matlack wrote:

> >Drivers can notify the PCI subsystem whenever a device is preserved and
> >unpreserved with the following APIs:
> >
> >  pci_liveupdate_outgoing_preserve(pci_dev)
> >  pci_liveupdate_outgoing_unpreserve(pci_dev)
>
> nit: Preserve and Unpreserve can only be done from outgoing kernel, maybe
> remove the "outgoing" from the function name.

That's reasonable, I can make that change in v3.

> >+static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
> >+{
> >+      struct pci_dev *dev =3D NULL;
> >+      int max_nr_devices =3D 0;
> >+      struct pci_ser *ser;
> >+      unsigned long size;
> >+
> >+      for_each_pci_dev(dev)
> >+              max_nr_devices++;
>
> This will not work for SRIOV as new devices will be registered when
> sriov is enabled and the max will increase. As we are not handling VFs
> with this patch series, this can be fine?

That's right. Since this series does not support VFs
(pci_liveupdate_outgoing_preserve(VF) will return -EINVAL), I dropped
the logic from v1 that included the maximum possible number of VFs in
max_nr_devices.

Once we add support for preserving VFs, we can update this logic.

Another way that pci_liveupdate_outgoing_preserve() could fail due to
running out of room is if hot-plugged devices are preserved. But I
don't think that's an important problem to solve right now.
