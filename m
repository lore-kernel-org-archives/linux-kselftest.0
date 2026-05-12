Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98749256C6C
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621369; cv=none; b=r8SpAOf8xNcCoTL+wO0WQo/ozl1EOAH7/8nX5SmV0/MeTq8ExoFw2B+oyki5vJ9IXLBiIWh93hdKaCCgRLM/pTXrYjgZJnRsVYT77P/AEYZnSNIW1OK1KphdfGOuQR9TBs/nxy7jGF09mbvSITks1FhiR+cx5jnu2t0d+BBGZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621369; c=relaxed/simple;
	bh=PVEZ6lDsqfrkheYFwj2coqzGfYHxktZ0uXkER3yjEWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG87i3ZdSHmdDoos+N4lBgAT62HqoRXEh5qWs6m6X8h4jPRqmloBNsG62uq09whaU8T0k++oqcw8kat4jAo21GDwUymiQuuH11RxUzu9J1lKWYUOamlkxusr1QNjRCT2Jw4qBo/ltnWwliTBHbSfp9wyOHBlxV+GGa1k5eMhbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2TqEeYx; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2TqEeYx"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c8d0945b3so38c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778621366; x=1779226166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9as17r1aSDL1/IjkeK3rxFdLzhg/o+IZ2HDHZMfPp0s=;
        b=O2TqEeYxQ++uEzCuAjSrp9S4rZXfnp3qCMLVHPDxioCo48GoTxdEgkrstQufcqRGl2
         5ugnERzU6ErV4dQjNB2XQbZVFCBoI62CIUqgsheQA3GuF8LNEuQIQHObJ48N1rW5bxBn
         p1VUyj9oN/kW8j7kutMQ2q/PtDM1bSRSErzS5XBXPs/J3JALkHzf7dFwE59NTSfuZQZ8
         BvDqmSJMaPdZ7+EqH+kSF0Q/I5Yuuc3X8tw4JhqU9w5umF1bPiJC8sq+Yxs10c8zEm/j
         2HzL7yJ/A4DOrx2RS3k1dt1nwUg6KaO9RE10N46u7bVIHJmPnql+qBD8hqmRPrOBP8ZW
         WHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778621366; x=1779226166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9as17r1aSDL1/IjkeK3rxFdLzhg/o+IZ2HDHZMfPp0s=;
        b=fpgFw0E10PgWDIdPZODWIhmyoWEC6QWxrntXX2IHCiGphRO86gbCJObVeXYUoR9EXU
         OvhZOvEqET4fu7wvmnUdHxh5zcTDSIooL8KnQDuOQ18sO8oUoD/hNz2IBUY/LZbQdbk7
         CnFjzBn9eJvl0PXgzogUlM/Sbnnd82/Jb2pNzJyAoSwRNVFGLMs0fthE1u73Rdy2T3xE
         cA4K3HSZovupEQgB1MagcqhaqXjG+WYRSdtGe8vnDQxNNLzhOnHgyjRlU3i5QP9ROcao
         P5qZkvLPiNBCgSFxtnpr8Ru6JeSAtuKRftAOu28EXFpYCf5GA6I3xvTAJOqQZXxVuYTx
         aeug==
X-Forwarded-Encrypted: i=1; AFNElJ/9FN7d0GldLIJiM3pfs7D7X37recMbK3SQvfe0gO8K1L2yrtbJ/Q+AE4+F9AsfckQIgN4cH3zF//g9Rrzwx70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAkWw2ivaAG3MyhpwK2Eny85VilUhzjiJtJnDUjJac2c1ZuA7
	ocIZE7VVfkTTPZX1inbM0ue5+WVwQO/U8RDihzROC5lBbLAH2mog/DCynnI0K2q7hQ==
X-Gm-Gg: Acq92OFbdl3DF8EIzBF4g4N9wAg9rJWLIV1dVEWeu4oTDXLX4R/Z3lmZvr624VtvfgT
	505HfJiQt2DKdDWSnUk+yVTvaWvd0MnaQdqJr38VWWON42VmBl+KmHb7iZdF5twVVMq30Z7lIYt
	PbFHMQEbaxKUNLDCjC8F1ciilPHA1QkbeE17L0anJ/HJDdkk3AD3aMYw9ylVv5YQZUXupvKEorH
	hggk3j0CwkOVJBb0y7pLrrIQMHAw4WHp97IdDUaVI/wiAw1N5vObm4wN51V/G2GfxpbFr+7LTDX
	k83rxhPvPFRtQABjexYyczoaCd5KJc9M3w2ohuSXGe9zRjKUbRvdJgl0DIPKraCFX5uyAZg3pEl
	6uNQ4Va6xUyDmutE4++LsqmC1ogRYNcSD9R6YRy32NF1Fgz6QNopFRri4PGGmThC8uWvpV57QaT
	wHghwm6FaQfXTtasJYJqFD60RycT04thUAZx1NuIb0wzkdtfUWn+5GD95DeGdnjkwroGYFNiqK
X-Received: by 2002:a05:7022:699a:b0:132:1e01:2d6d with SMTP id a92af1059eb24-13401ba684emr108868c88.2.1778621364956;
        Tue, 12 May 2026 14:29:24 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fc59sm23087120c88.7.2026.05.12.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:29:24 -0700 (PDT)
Date: Tue, 12 May 2026 14:29:19 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, 
	ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, 
	apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, 
	lukas@wunner.de, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v4 02/16] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <20260512211412.GA2819150.vipinsh@google.com>
References: <20260511234802.2280368-1-vipinsh@google.com>
 <20260511234802.2280368-3-vipinsh@google.com>
 <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>

On Tue, May 12, 2026 at 01:59:51PM -0700, David Matlack wrote:
> On Mon, May 11, 2026 at 4:48 PM Vipin Sharma <vipinsh@google.com> wrote:
> 
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index c12d614fc6c4..019de053f116 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -45,13 +45,15 @@ config VFIO_PCI_IGD
> >
> >  config VFIO_PCI_LIVEUPDATE
> >         bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > -       depends on PCI_LIVEUPDATE
> > +       depends on PCI_LIVEUPDATE && VFIO_DEVICE_CDEV
> >         help
> >           Support for preserving devices bound to vfio-pci across a Live
> >           Update. This option should only be enabled by developers working on
> >           implementing this support. Once enough support has landed in the
> >           kernel, this option will no longer be marked EXPERIMENTAL.
> >
> > +         Enabling this will disable support for VFIO PCI DMA buffer.
> > +
> >           If you don't know what to do here, say N.
> >
> >  endif
> > @@ -68,7 +70,7 @@ config VFIO_PCI_ZDEV_KVM
> >           To enable s390x KVM vfio-pci extensions, say Y.
> >
> >  config VFIO_PCI_DMABUF
> > -       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> > +       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER && !VFIO_PCI_LIVEUPDATE
> 
> Why does enabling VFIO_PCI_LIVEUPDATE require disabling
> VFIO_PCI_DMABUF? I saw the cover letter says "to keep things simple",
> but what specific problem does this solve or simplify?

I should have provided more details there.

When device is getting reset in vfio_pci_liveupdate_freeze(), we are
zapping userspace mapped bars, we also need to use
vfio_pci_dma_buf_move() to revoke dma buffer access or
vfio_pci_dma_buf_cleanup() combination. Cleanup takes the memory lock
which freeze already takes, and there are some refcounts which are
managed in both of these APIs. This was causing complexities with code
flow based on result of pci_load_saved_state(). All this was adding more
refactoring than I wanted in the series.

I decided to just drop the change and disable the support of DMA Buffer for
now to keep number of patches less in the series. This will go away once
we remove reset condition in freeze.
