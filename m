Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AC243951
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256160; cv=none; b=UpSBc+s6igLoSFj5NLsv+VrMd15D1t7LBDgkKP9Y7bhVP4scrbWB/bRJsLuHztoS7Io/SXEOHWuGlBrJFNZ/b0rw8ltrJ+GBNLivtSd3QJUuJXZXDoY7lB2SkG3E/iXvgP7LirMdDrp66a/D/zZwLC8ZLunGLU7EB0U6NJni5wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256160; c=relaxed/simple;
	bh=7ZM6BCAUVkVsxBMUZ1vWJzjEVoeJvUd1SrWlf7ltii0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4HFNehO/AIkvkUl5wZssCFBBcvZZpTAwm/erKqvhtdaLGBxZJaubnD804Ps9nc7kLmbp2CR5L9QY/yd59Tnept6jSAtNY6NrnHPdhOicpIsNeG3oTtRHDg2Hx4tQ/yua7sxrf0zEUGUmS+aNEx/hhN8utkIMi6/bV2gHALnbBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fVCRWic5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fVCRWic5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so1911017a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775256158; x=1775860958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fhqBHGlP0V+l2Xf8GBfn2hcTyMMuTtQrTC4g0f8ops=;
        b=fVCRWic5g3EEpETGmrUpHQ4/1c/9GZMel2oMB3pMsGCSzt7SdtoQBZSMgbuswJumFi
         OpedADtsnqIrE8TAIFV5tre8QbELsy/bPqgp3qSZMl1CtlVpUGsowRdIO8piU5yIP5VI
         00CVUcSPmBaB8gLZmExkXamFKji/hFu6BIUWRoWqkVeldm3Ix5Ln4voucS5TlzAoCFJV
         GAD4CvEF2T7iWCyYwvOingcG8q5yi4Z9lcGI5eFX4h5t6jzOyLZDPN3Qh+vl+SKTrGwZ
         ZM0xYTD0FfXFKRubxp+fEBVu4lbANN9nHUtVDTYgBT9WP+Z9fESsC04+hlxzwY0ppnOe
         m6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256158; x=1775860958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fhqBHGlP0V+l2Xf8GBfn2hcTyMMuTtQrTC4g0f8ops=;
        b=CWEYVWeq5Hx+meaycr7gbsA5KqZkaCC9XB5TsEzOAPxPIK56y63rAqDNkd+F6OpTMM
         YL+QCvBrdqRtx8orFWDoWnls4EkWLON0aptgIGV2o7HVJZskwMU0Vx+B2JPmKMhsrNPb
         Szr2qpyIoFsVCy0OuaNgGnPjMtI4z3AAvX5617cXtsMhyQA+6M2SRATgZHjck4ncHIVf
         WPiVYgRxsPG4VwSccqUk1vZBs5c/538Gs80mnDYmH2If+PYpbJDixeXsUFoKNLNJWkHG
         N9cGMbzMk++3QuZA6VdgR28DHfN1VPUSiPC8Jln4Vu22l7jiIc+0qrPW+4/eShq/WD8e
         a1pw==
X-Forwarded-Encrypted: i=1; AJvYcCWDUzp4TBwZBmwDa9HSDfEEmWEn0+HfL5QL9SUjgAZvph327HmrkVL+tMz3zTi+gDFbXsyCyED4fs1spwvSDbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNbxCR+TeDt24ZF9mcKejQIaI1FVi+wQDhxTWWVJR1rb5Z6xP
	HKN883/fw/CVsCeyXIQzEIJHM09x6BC4kufZRCbP7TanQkETfiYDyL+gloGBwW1vPg==
X-Gm-Gg: AeBDieseKTK278E/iniNvK6O1YH1hyVcao7730D6BaGglcYVSGbWn4wsH82CuhyJyaV
	XODpWPRUP7MO0HbH+il8T08MV8VY6xzabV+bp4utec6zUyR0jTA6Z8bEHJjQ/0bEB1ImXFrwn40
	PQtTTCKpfhxwk+hcj8iMCgDPV/7aJcOsJT3/TUpRzfoYlpdbGw1c05k1YpmM9uoxq/B39yjiyNi
	v0TvehDjawlnbcK0+Jei+kYY7Q1sypsuNu1SjChNzIuZNnlLGaUgAer38v0SjX/GimQYGDNsa7u
	jdC2+dZPKtxBhpI++4LtKLCdvAAxZNor4FuAlD9J2rZnzBVGtGMeNnrigoX1Jy280+yUlDZaDiG
	h2n9WarnT/kGyFMbdZ5vdgvn5Kl0ywiiAHaGTNfa6/umUgfxgwrPXeAAQORFxJa3Vhubg3SUHld
	8U3moj7hNQWCdso4kNVNBurCM0RxCb47hsQ8UIpbW/TUMhRoRsdxviahVAgjte0g==
X-Received: by 2002:a17:90b:2ec7:b0:356:1db4:8fe5 with SMTP id 98e67ed59e1d1-35de6956919mr3975992a91.29.1775256157821;
        Fri, 03 Apr 2026 15:42:37 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe977031sm11676979a91.17.2026.04.03.15.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:42:37 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:42:32 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/3] selftests/vfio: Add memcpy chunking and PCI
 command helpers
Message-ID: <adBCWCXl42YJ0FRZ@google.com>
References: <20260331172241.50456-1-rubind@nvidia.com>
 <20260331172241.50456-2-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331172241.50456-2-rubind@nvidia.com>

On 2026-03-31 10:22 AM, Rubin Du wrote:

> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -122,4 +122,14 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
>  
>  const char *vfio_pci_get_cdev_path(const char *bdf);
>  
> +#define vfio_pci_cmd_set(_device, _bits) do {				\
> +	u16 __cmd = vfio_pci_config_readw((_device), PCI_COMMAND);	\
> +	vfio_pci_config_writew((_device), PCI_COMMAND, __cmd | (_bits));\
> +} while (0)
> +
> +#define vfio_pci_cmd_clear(_device, _bits) do {				\
> +	u16 __cmd = vfio_pci_config_readw((_device), PCI_COMMAND);	\
> +	vfio_pci_config_writew((_device), PCI_COMMAND, __cmd & ~(_bits));\
> +} while (0)

Please add these in their own commit, and also put them up next to the
other vfio_pci_config_*() routines.

> @@ -221,13 +221,15 @@ TEST_F_TIMEOUT(vfio_pci_driver_test, memcpy_storm, 60)
>  	 * will take too long.
>  	 */
>  	total_size = 250UL * SZ_1G;
> -	count = min(total_size / self->size, driver->max_memcpy_count);
> +	count = min(total_size / driver->max_memcpy_size,
> +		    driver->max_memcpy_count);
>  
> -	printf("Kicking off %lu memcpys of size 0x%lx\n", count, self->size);
> +	printf("Kicking off %lu memcpys of size 0x%lx\n", count,
> +	       driver->max_memcpy_size);
>  	vfio_pci_driver_memcpy_start(self->device,
>  				     self->src_iova,
>  				     self->dst_iova,
> -				     self->size, count);
> +				     driver->max_memcpy_size, count);

The memcpy size needs to capped at self->memcpy_region.size / 2 (here
and in the calculation above for count).
