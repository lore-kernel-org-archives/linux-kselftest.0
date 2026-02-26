Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C80301012
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772148710; cv=none; b=IOdDqOsPt66e4EGmh+hbLtvpWuQIxap7w7O+r01LJvTRo1SuwzvVZy8X++xbXyAz8WGEXfzLwMC68zCSoEiuIgXFsKfysfYt9XCiTaxGBg1f3e5Va+nGf4cmqfAQd4PWQox7SczAO4YC1s7WC+gZKSWHwXOPelMQK7dRNOpfZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772148710; c=relaxed/simple;
	bh=AAF7fByBTFvHIdoynRYlkawoyRHswdrvQIY2msLKBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3M5Iv9P6jDG6QyjUHDCPo/wYDe5L/VRLDakRokk9A/pENIxjX7NJHsGgTCxxS+0Lzcf09Hy0Vt/rjJYtXp/gvnZKqbEXet6AbKgn93TlRpmLDfTvFOp/ggzC6hSrTQMVAya7T3MurTDKOEI2PZcVqi7UmyZNwZTUiHNr5e9ex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fdeHi2ng; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fdeHi2ng"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae239bd19eso2279305ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 15:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772148708; x=1772753508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ19nP7LWyVtbwlYCJ4KZaeb2FLacueUWULaQoURJXE=;
        b=fdeHi2ngbLtudCw29sk0ANC/rvY74LDswMpIo85pe4L3DkXLDhoUtfu8d+zS8xmVaE
         oRn+nKfDrOM3MM2ecdwfWBeSB6fMIevw/Q7E9Fx8bMXF87+Z9BT6bi+VFc7uxKsao7kU
         lXcbvqou7XO441ypiWEiPy/vA9UUU8lnXEaFDQUAXIxAkRUl0MaNOrr5/c0A8HAezZVi
         G+lFe5WWH9dSPNva19h3f5d1xpGnEy2QvV/3sUK1b5Wteov/d1Kw8QfEz45XEjcFv/64
         Is6AsNwWAXfLHYr/rVy4zp5U0hvwu2bk6MxXt2B9lIaPCfGz7PeJ+dzb1npIRYp9tSrU
         6q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772148708; x=1772753508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQ19nP7LWyVtbwlYCJ4KZaeb2FLacueUWULaQoURJXE=;
        b=BzOt+5qiidv44K6XBUW3dA8k8cccTk8dYnG0SWbGU9LiMNFXkoY9hT53FC8hloBfN7
         uimXKsaqWM+DVyJAygLfqsBvD2nXRQ88ZAeMlqWdUOPYnIhtv5BOqyy5RZEU77veUSCb
         5Z/CtZBrcdWkHESrFiRCZBgGbIyNQDJQhNa0bPhmMl9FCLHE/kIXzzdzwyezkTtJNfxd
         dHpnvREEnkCvOIMZmAx8gjj1w70YD3s0b37gxRJC+yRUUyOB+trNX6Vi/7Tc2tBcC7ai
         WHXLCoKOLLeuvFpNhX9vy92NDNCngDNfcnnlMw/Qsrn0bfNViR1pCVs2AJ5GCRi8A9tc
         MWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuqa7C1GzVNSIyJZypdILlJsQBcPU3znK7qMF2iFir27J9cpomFvYoDRlkzTMfyoSNuPiu+aVsnV67VO9RzC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcmnp4O9AsV3syIK0Af4NbhAZXguzAogsF2kM2qv6zMcyPwlr
	wzK8E5Vki6HS/18Y1mKKG8+to2mQhz9ZpDVPZm/+9/AYEjToxcEZNEysr0GLRSmy8Q==
X-Gm-Gg: ATEYQzwwIhb7Kj0m+5ukQv1r6mJHIzgbGaAHa3Il6/Wl3A6DCp2VAUSc/f98rwejVPY
	Lxu1FrndqKlKj3SAF9osrTPtY7M55Lu7dq3+d1Ki147UeTkQTeYlRyzGnZ6SLTe7SC6fTjIOuLA
	N6sVPOI1W2briYjpGXerg+Q7hnSRT7zaxP+Ag4XPbxeuwQjqUPKkus/MxLVSPBfvHcv+RKtez7U
	gLJ/6kRfuPEIH/VD2QoJrAYSXyAK9xieNWDTL54LJlQxfY2rnDjQZQrkcRWNP23tr/qNYyXoRgI
	kO3yKy8G6iZ9fQL92fyIjOAnyvaG67EimFBqMwh3hjs4Y+WKIZAs8F5i5urhLxG/bqKqJhwkupn
	Gx4HFg0oIQa65t0jGRBUl0BCtwhJVK8DmjWtxrCnTvrBMvxcADeRr541NLFJRvwz8HMhsrPaS0I
	AfCLKNBSTIjKQpk9cEp216KnUX7GxYl6qhjGO3fks9fFNUveaZjgpB7KDaTKTgew==
X-Received: by 2002:a17:902:dacb:b0:2a7:919c:34c6 with SMTP id d9443c01a7336-2ae2e4cd74bmr5371545ad.38.1772148707814;
        Thu, 26 Feb 2026 15:31:47 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm53850525ad.52.2026.02.26.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:31:46 -0800 (PST)
Date: Thu, 26 Feb 2026 23:31:43 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
Message-ID: <aaDX34yT_3dwUi4I@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-8-dmatlack@google.com>
 <20260226160353.6f3371bc@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226160353.6f3371bc@shazbot.org>

On 2026-02-26 04:03 PM, Alex Williamson wrote:
> On Thu, 29 Jan 2026 21:24:54 +0000 David Matlack <dmatlack@google.com> wrote:

> > diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > index 7f4117181fd0..ad915352303f 100644
> > --- a/drivers/vfio/pci/vfio_pci_liveupdate.c
> > +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > @@ -53,6 +53,8 @@ static int vfio_pci_liveupdate_preserve(struct liveupdate_file_op_args *args)
> >  	if (IS_ERR(ser))
> >  		return PTR_ERR(ser);
> >  
> > +	pci_liveupdate_outgoing_preserve(pdev);
> 
> Why do we get to ignore the return value here?

Ugh, we do not. This is a bug, thanks for catching.

> > @@ -203,5 +225,6 @@ void vfio_pci_liveupdate_cleanup(void)
> >  	if (!liveupdate_enabled())
> >  		return;
> >  
> > +	WARN_ON_ONCE(pci_liveupdate_unregister_fh(&vfio_pci_liveupdate_fh));
> 
> This is propagation of a poor API choice in liveupdate, the unregister
> should return void, it shouldn't be allowed to fail, IMO.  Thanks,

Ack. I'll make pci_liveupdate_unregister_fh() unable to fail and follow
up with the maintainers of LUO about liveupdate_unregister_flb().
