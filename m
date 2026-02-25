Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60431CA4A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772008695; cv=none; b=IIjwoErqs9KP4mlXXEpr4oZzDaQ4rmBDP7yBItgK8EYU7/yiYHCbHCNhvKBKnD8wvtnDPGqg/Sf3helnuAMweFA/F7esuO5J22ArwbtgexPp9O09Wu+Ax9UbbFYbfU6gXn5of9B7HW17S8sRDQ2gJFKIQL0yK9NBJLdLVtEnrRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772008695; c=relaxed/simple;
	bh=uun3Vk7JQyHZ6aF3HcHlMyo2Xah/fKCgQ3PDPCYVA6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4NRvyMy76s1xVR+nuapdTsGAzM8SGYlNrYKUHMDwbf+EIl7DJvN/zV+PGnXiVuQBgrbPwr5qpF1EgRYK0REKUwymc8l/a+hEZSVRQch2ufpHrIUrBI+aNL3TKrt/OgMpCYacHSo7Mfm7pCQP+9dF9hRS7hwOIZr86mGO44hdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0d5FCoRU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0d5FCoRU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a964077671so74325ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 00:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772008694; x=1772613494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=euz76pxATmJYev+UEaMjSj8YYGXQ5aYbA3uegrgN/Es=;
        b=0d5FCoRUjPdyGC+3ksFgWishHadW5IYorl8tK66VBPAKn65KnWAsC3NPOrquJQkA81
         AmYi7hY9aounpoXHRaBlwCPDfCmKfSaSVVsvYPqD2UDk9Q+f2FOEHEXhw/y3C7NgDpZT
         ehjNGj2mO+fmCkRyjd2uwFq5vMDmzU5taYk/yEsG6Rm6insqmfMw/LdXhnjnPNzSipRh
         8iATFyj2niKIRoRNz3lBjsw9KddROojWASSL8+sqsolFSBw4Y/Z/eEZya8Jv38nrKDLD
         sOTnLmK/Mn5mIH1XKu40CWQDRiNqtV983z8rMk1QkMKeeTMamQCIW7hOlr+QqWYsz0Qz
         zp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772008694; x=1772613494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euz76pxATmJYev+UEaMjSj8YYGXQ5aYbA3uegrgN/Es=;
        b=REqDWomKInd/1nV8P8H+aTxREl6uGlgMyaabjFeBhnnSNyovgJs/iPOnkndl6NH/fT
         DGFU+TGxw/dzO5TpBUR0GOqXWRFDVimDUIQAO57sF9eqpwzacWQKFZPu1ppIHJ9hLnCf
         C2u2MvyFBR7Q1XnBOf01JhAbf4k6X7ZltmxZUsEcoXrE7NE+L/FEmOhKkp7f53CuC/fS
         BXNlojYoOGElbnqhlY0t+zP5xbdnvgPr6faB5j1wcGLGRzErOx/9nCRVt1uv8ooOFNqB
         +ipw5/V1ZDJOP1ilvv0hZS5zipyDL90gMiJ6CFMG6N7HnMOrwvCBkQz7Ff/lzYhVXvdJ
         9jMg==
X-Forwarded-Encrypted: i=1; AJvYcCVbmUPTxVY+9OUixdvdcJt8nw8W+LNWJHdqMGQaHa1XRNuVbbhJPejs1OB5ixa1OZ4eOyGikXP7UgolfTxVp4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpCATUkB3JQS8iGMULhgZk0PIq+G0O36fHhqQSX/UqV5w+mHir
	vo410+FDOxMhZalj/KwbBOe6qyFQBJ3x/076iUSE2XvsEj/WuaNin+i4sLHE4M2Adw==
X-Gm-Gg: ATEYQzxPqdNaG4vdiL/4KFvv25PkBzdjlw3OtfyDKCZXLfUFLQk7fsrBgm0Cqt9QQpN
	hj2b90b/LmvN8d5xgY4HRP4dhAsjPDDEz6GhILDX3Dybdp02DUX3zY4c7+1tTGngJupaUjhMaKZ
	F/TBNdm++vkgecRlVWCWSm4sJeQdl2gTInysiAWUDgABJEDZXOoLOor8bvrM5Xxli4ZXqNcSfpq
	eiAS5VGOgewIBNqMZSNMRpdixIN2L78+1g61U1MmMkLXMWouPn+giDEfCo2FkaW79kC+FmWNhpZ
	v3edSGvTtik15SqUpZeVSzgljRU+E/E3z8u9hOnTNpjBkA84UyxFTEQyLBDt20waQx0lQFo7Cdz
	iBPJ6enabaAg/8I4LYGzVMbWRjeG+ZIy7yyW/rW7+E2an/15RuaSSA09PdVG509aehw0sblOypi
	rKDl2gYFHjpKMFReYhP2Xdtm0bllL59Yl7O1Sbl1/ptPiZjz3nvbq7YN9+v25g
X-Received: by 2002:a17:902:ea02:b0:291:6858:ee60 with SMTP id d9443c01a7336-2adca6c8a9fmr1402215ad.4.1772008693092;
        Wed, 25 Feb 2026 00:38:13 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd6c30dfsm13034861b3a.27.2026.02.25.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:38:12 -0800 (PST)
Date: Wed, 25 Feb 2026 08:38:02 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
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
Subject: Re: [PATCH v2 09/22] vfio/pci: Store incoming Live Update state in
 struct vfio_pci_core_device
Message-ID: <aZ606sDJxtfNF6qW@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-10-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-10-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:56PM +0000, David Matlack wrote:
> Stash a pointer to a device's incoming Live Updated state in struct
> vfio_pci_core_device. This will enable subsequent commits to use the
> preserved state when initializing the device.
> 
> To enable VFIO to safely access this pointer during device enablement,
> require that the device is fully enabled before returning true from
> can_finish(). This is synchronized by vfio_pci_core.c setting
> vdev->liveupdate_incoming_state to NULL under dev_set lock once it's
> done using it.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c       |  2 +-
>  drivers/vfio/pci/vfio_pci_liveupdate.c | 17 ++++++++++++++++-
>  include/linux/vfio_pci_core.h          |  1 +
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 3a11e6f450f7..b01b94d81e28 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -569,7 +569,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
>  	if (!vfio_vga_disabled() && vfio_pci_is_vga(pdev))
>  		vdev->has_vga = true;
>  
> -
> +	vdev->liveupdate_incoming_state = NULL;
>  	return 0;
>  
>  out_free_zdev:
> diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> index ad915352303f..1ad7379c70c4 100644
> --- a/drivers/vfio/pci/vfio_pci_liveupdate.c
> +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> @@ -131,6 +131,7 @@ static int match_device(struct device *dev, const void *arg)
>  static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
>  {
>  	struct vfio_pci_core_device_ser *ser;
> +	struct vfio_pci_core_device *vdev;
>  	struct vfio_device *device;
>  	struct file *file;
>  	int ret;
> @@ -160,6 +161,9 @@ static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
>  		goto out;
>  	}
>  
> +	vdev = container_of(device, struct vfio_pci_core_device, vdev);
> +	vdev->liveupdate_incoming_state = ser;
> +
>  	args->file = file;
>  
>  out:
> @@ -171,7 +175,18 @@ static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
>  
>  static bool vfio_pci_liveupdate_can_finish(struct liveupdate_file_op_args *args)
>  {
> -	return args->retrieved;
> +	struct vfio_pci_core_device *vdev;
> +	struct vfio_device *device;
> +
> +	if (!args->retrieved)
> +		return false;
> +
> +	device = vfio_device_from_file(args->file);
> +	vdev = container_of(device, struct vfio_pci_core_device, vdev);
> +
> +	/* Check that vdev->liveupdate_incoming_state is no longer in use. */
> +	guard(mutex)(&device->dev_set->lock);
> +	return !vdev->liveupdate_incoming_state;

Since we set this to NULL in the success path of vfio_pci_core_enable()
I'm wondering if a failure in vfio_pci_core_enable could cause a
resource leak? Because vfio_pci_liveupdate_can_finish() returns false
as long as that pointer is valid, a single device failure will 
perpetually block the LIVEUPDATE_SESSION_FINISH IOCTL for the entire 
session preventing the LUO from reclaiming KHO memory.

Shall we also set vdev->liveupdate_incoming_state = NULL on the error
paths of vfio_pci_core_enable() ?

Thanks,
Praan
