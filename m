Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336338;
	b=A6/z8k4SS81jrRET+EFgA8OKRqlIC5pb7+/PGCvzaQXfVkc/2UDII5XUb/VM/QMkQ2i7
	 mawWWtzLllDmXcFheyZwQW60EEShphzCziJJ6IdIWm6AfllEVWWIOCsHGNPyUGImaaJXy
	 WQigVnTWm9yVafO4lCi23OxRaozvOysorpQtSeChY+BCBy0RStX3MPM/kgKA5Z2nlZEwz
	 M7pcBn3ctKmrmqsm5xzgFjy0n2bClZGpuNz/mRrGnZ8yRXhjh8x1OJp7j1OdACa69Wyl3
	 JAellM9+6U4Mn+K2X+tgXYIq50nQktqaVvz8/jHBQodEbf/kRibD2eEvblwSRwEwRow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
	b=Lt/SMIZmOWAHfixs5V6OaRhBsEjGHiQuGuCEWfEugsTxt+1WrBj45TAetVcF5/+VVRwW
	 cLlHH2nOtpiC5BeSdQV15wGmgp2Wd/6Rf2zXcKBuzTXZZltUDTabHDu/edzE2GbxXV6tU
	 sCcGh6oqnV3wcWJ5deBJr8MRYCeI9HMG+WOKDnpI9H/KfOL91lBd+1OhQxE1RYAVZ2auZ
	 ZFON6s8ziwOM3gxyBn65ZLViEuEXyBAJcXPCRK0WYRt7XmSzomhRe4+cINHOnjNfaUSg8
	 Ibnak5zH+NDEUhQDybhdCD0p4elUW+TRFAFzEMG33Fe9KCiJV+3gB3MoQ0hdMWhRFJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fqYza+qT;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BC6606A32E
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 18:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BC6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fqYza+qT
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so4825ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794336338; x=1794941138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
        b=fqYza+qTmu263ZJR6IQbgcfkkw9jmBae56WVI+o3f6yE+Kb1eAns8SLyCefyix05sI
         yNFEQKraXZrzlgeP0EDS4+8DlSYhhDPuNHBvo9HtQkvkE80biYpP/AWmMZMb4N/avCqc
         tiBIiao8l8HKCuoG0Mts/I6lvZxkuP9qJfXB7Cyhx7J46AAPju6wNkwpIXeVimtsE/cG
         GqmB+KwHAwkczSt+6neTbRmWUTaNZHyZbOq/lWaPoci+yXV25lxstqc4zN1oce/Vkxwn
         mLCQsVZ9HPbXapT6AxcKUs02u2n1Y2y/FccJnECWdMdOU1ViJg38CiOwYx0X1JHRx/0Z
         HWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336338; x=1794941138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
        b=xj16d9eeL9oPkfK0m5EiaNbtFZMyxxEzuU7uYmF//V3dOz8ShJJOAjDBgvJs8zzpB6
         jMsOuo8AHUtFbQTVBNsJvWjEx473BP8vBItTYPK7bt9CKXxTaae/BdvbyA88JRU/cBjj
         W4YbQdlFavFZLprMyct/LfyqbVBNC429+U8ypclmTtEmHYK5eAxVPRLpTpam5rfo2FZh
         B9PSghrfceSkC+ToTDyRw8IajhJBNhV69JawM++SvvUbof6f2N+Tcmofwx3kHFn2I41n
         YLdc2msm3kGKebIF31ovvipDhJhJrStNd1R2GloAI7vFScfAO8FCn06ok8LpqO4C84+U
         5z0w==
X-Forwarded-Encrypted: i=1; AL+hErHN87Qld/2ylTxaJOCtV8Gcge4facBS92iczKcngeBs8hfbJpePVyKt3XbSw/2o6UzCE20XjKbGRzHph0tMAnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V9V6aFQg6OlVeyI09mORGYI+bjvSJHPzTY+i1H3SKbv4AtOZg
	Ng9J7kLKhMZuhdtn7IoQ2XMWPAcuxIny0vCEQXfSOCisD+U5n8o0qGZzgYrwxsWz6g==
X-Gm-Gg: AYBFou2RMXUwr5Xaw1BwnhwM+KAy85q31psgc4wJ9MNXz5POF6gC+zz4famZTnOZGFm
	80wo5dbzQAx05Oz04xjFjy19iROE/n+HUOqBe50L/qc5ycfDyppVqsW4aMFpCteovp5d9oQCF6e
	Yo+Uy0ukkQ9+hv+6ed9jBknJ5+jNihpu9arQadtaxtmBL2OvLrxa34aJ7AZfXulMZXSJ9mHkApB
	fb1kg24fucLVfdPpX7oy0MRHpNls0nx2VSgVjp1ZXrrbMUZ1++NvL1K17G59KVLyIr8mv1dZo0u
	9Ei/xMAr5sRib+0ZEaGf9wWY4PSs/39NBZtb2o0VqNcRCKIpSEqyBT/wlNxQ79EBtd4HKpg5BJg
	3SmTwHEjoTcov95+v75TyYdJGhwY2Or6IQce//95wNSAzX+ViGWqM0Rv4zriVjZGqads6hLe8i5
	I7CXXicD1lVZFzwAi8CYs9Ucjm58UyU34UCgHUWFcsL0fM1Ve/pglMrDqQ4zLuugxYeUavuGeJi
	qjz+Y+ifG4/lA/UTc36w0Bx+zQji0/eG8Czz9rZIRUL32jao2XGzRbbgCeuasAhf/OiIf0y2IYm
	0OZXgrMGrjxvEARZ0BS1thAJGrzyeeWDIlbNf8L82Q9cCtY6bsSgoqzvxrFli3z6
X-Received: by 2002:a17:903:2a86:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2edd7110fa8mr255665ad.2.1794336337416;
        Tue, 10 Nov 2026 10:45:37 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1317128b3a.21.2026.11.10.10.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:45:36 -0800 (PST)
Date: Tue, 10 Nov 2026 10:45:32 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 00/27] VFIO PCI Live Update (noiommu mode)
Message-ID: <20261110184339.GB519525.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>

On Fri, Nov 06, 2026 at 10:20:10PM +0000, David Matlack wrote:
> On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
> 
> > David Matlack (4):
> >   vfio: Enforce preserved devices are retrieved via
> >     LIVEUPDATE_SESSION_RETRIEVE_FD
> >   docs: liveupdate: Add documentation for VFIO PCI
> >   vfio: selftests: Add vfio_pci_liveupdate_uapi_test
> >   vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
> >
> > Vipin Sharma (23):
> >   vfio/pci: Factor out the reset logic in VFIO PCI device close path
> >   vfio: Export various helpers from VFIO
> >   liveupdate: Export symbols needed by modules
> >   vfio/pci: Register a file handler with Live Update Orchestrator
> >   PCI: liveupdate: Add helpers to preserve struct pci_saved_state
> >   vfio: Add helpers to identify device files that can be preserved
> >   vfio/pci: Preserve vfio-pci device files across Live Update
> >   vfio: Introduce vfio_find_device() helper
> >   vfio: Refactor vfio_device_fops_cdev_open()
> >   vfio: Add API to open cdev device for Live Update restore
> >   vfio/pci: Retrieve preserved device files after Live Update
> >   vfio/pci: Protect incoming preserved devices until they finish Live
> >     Update
> >   vfio/pci: Take over preserved devices without resetting them
> >   vfio: selftests: Build liveupdate library in VFIO selftests
> >   vfio: selftests: Initialize vfio_pci_device using a VFIO cdev FD
> >   vfio: selftests: Add iommufd noiommu mode
> >   vfio: selftests: Add helpers to map DMA memory at IOVA == PA in
> >     noiommu mode
> >   vfio: selftests: Add helpers for Live Update DMA memory and sysfs
> >     state
> >   vfio: selftests: Add an attach() driver op
> >   vfio: selftests: Test preserving noiommu devices in
> >     vfio_pci_liveupdate_uapi_test
> >   vfio: selftests: Add vfio_pci_liveupdate_kexec_test
> >   vfio: selftests: Verify that opening VFIO device fails during Live
> >     Update
> >   vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test
> 
> This series is getting quite long. I would consider splitting out the
> selftests into its own series and we can iterate on each separately.

I think it is a good idea. In next version, v7,  I will send two series,
kernel and selftests patches.

