Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B41FF7C5
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376253; cv=none; b=QFRCSOmeGw+7KFiDS5Qm5pLINJMzXLe5RwrnTlu6W2VGC7PFfaMUQJKkkT3Xacrak+38bRZ2EgtRbkpQk8TbaO3BwTaz7LKEwa1/ej5LI/K+yfFAkuku4gBrylEq9E4Gm1kO8dfAFL/NXil9We81CKj6oM5TULzrDHJo46O3ZTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376253; c=relaxed/simple;
	bh=f/IzoqOGi8PXMVs3HV6Y8YSAbtT1tQuyf/8xkJVy/Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9gySvQmMB2sUoVpCtZ8n5THg6IFg6bmMr/jKvSlV+StYA9ci8rbPr0V6/jMfaUMbUfSaeuTInMeg1+5gcVhBJeQykPZ06NC5PF8GmJDOw82nMHjZ+lqxgdrw3giDnUpenyiy/krF9rpb4Tady3BQ8x1pI7PDc4b7/N27Vlu9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbCuAbGt; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbCuAbGt"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc73e322dbso20496235ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783376252; x=1783981052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn2c1bB5Wb+AF5xB66Al/MOSv4OIpwYv11LYrtxLyVs=;
        b=JbCuAbGt720jBCSemdVJMHn6/i1B1zvRUgmkbtCvaPnlu3Fa58TD8u1VZM0nkLwoul
         qdXLfrT4P67SU48v7ekvtg6gKE0DjJJvZi8jq/0118U25aB8jA7OSxcUcbnXesiINn0B
         Fm6s9sjy002/NXiP7lHpvQ08ldYzt2PH7jghffzq/aSKyLU4l2dOOBZc8fxZca0dW3S+
         /Ol5FEQhsHYbE1vQ678w+MyMElgu0hIviqQPEDvF5zZ9KP7vyaC6u2dSec6idsuVN8TH
         gPqblKph48B8Gh+1a69HbRNV/UGaSdjVQlfxNY6NApteTp3AIi1Um9g583IJqCx5K2XY
         tD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376252; x=1783981052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn2c1bB5Wb+AF5xB66Al/MOSv4OIpwYv11LYrtxLyVs=;
        b=hmH7Ho7PYzvxoiGm84dA/HhGM/rxpSGPPgAaoOVtCMX4I0UDbAFatwHk4OmfhPcKaN
         Gs2U2d9g7/XqQgfdrWm+cd65XrAAtH3rds9P/qKH7B9P8yP8Uyi0IqZsJ43PBwm+uBPH
         eILF65BKd0fRBEjhtiPjo6mXqEHI2dxQZl3dMtIllXjBFZrT2UhNolVLMjo9JAtvXVvi
         iTBHyUTi+vKr4bHm3qpXXvmsKlWMzD9GO9VAtj0TIY8xTz5PfboT53hCNP6XKghYyYpb
         KJUGKi8B84HLkoV8YYyKurY79jm/0S3tIMKNL5iA4yMuqLvp7mmYByHtW0zsSozOG3Yy
         bhXA==
X-Forwarded-Encrypted: i=1; AHgh+RqnVgOpFUXZoGuXMisQ8wdnVVxnfWooyPFJKaklJGNpZqnWmWLTNXcG8sWJTY6VdzEVCfmuHU5rn1cW8Kf3mOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuT/qo6yd4nIHHxRlkoXfhoCaTX/SvfzwRIkSi5W7BwAcE8Kk
	s5ClyCppJSwnqe8ELkh7CaXs8u/GcfUhMSxvZ/h+qyNmD6YtDXr3GWvN0pfqBuaEwg==
X-Gm-Gg: AfdE7clmkHO9sF1/U4vWm2n8pePJeTaIEX8jUy0crvTV+wQHHg/yCPdw5ZApN4EHulr
	OjwqL8vIfc0MHGOMtCJJVrWkuN0yzpHpGVdHro7LMpuIl3aM38Z0bSeDN4P5P447wx6/zPwt+w3
	Fy9WeXohimgAgVB5YNqA5IzR+rsRC66VTQgMRZuc6byj0tsAVJ6i+XcJxWPcaOu/DS54IoxC1wX
	sbqSMyz1EuMgZnpUUYL8/cRJMrxIKVCbbgJJDz8FEE7oDGapWniVGZGzg0ytl1Hdkz/zyBJDWop
	q+1v8af99x5Sr1vbRzbkCuHiXizWhxI5PO8MNQIyR1w/cHo4WXuAy6xYsn6kUs/wKWmh671bvie
	dzyE4uIsD795Xgl4/dxp3X0b9KhVLdoMpcg+tr9I3lXHMC8+0PbWFOiemzEz6JkXAjJCZtapnHp
	FKn3EGIgBgtX+hzQOnMPFSlzdocJjRJytLsrGJXZJxNnrDlcI1JAs=
X-Received: by 2002:a17:903:2450:b0:2ca:f44b:63be with SMTP id d9443c01a7336-2ccbe3fd125mr27385865ad.3.1783376251214;
        Mon, 06 Jul 2026 15:17:31 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm1175875ad.28.2026.07.06.15.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:17:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:17:27 +0000
From: David Matlack <dmatlack@google.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: alex@shazbot.org, shuah@kernel.org, amastro@fb.com, rananta@google.com,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
	sbhat@linux.ibm.com, harshpb@linux.ibm.com
Subject: Re: [RFC PATCH 3/6] selftests/vfio: add sPAPR TCE v2 DMA window
 helpers
Message-ID: <akwpd6TXTH_pIgKJ@google.com>
References: <20260703032806.40946-1-nnmlinux@linux.ibm.com>
 <20260703032806.40946-4-nnmlinux@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703032806.40946-4-nnmlinux@linux.ibm.com>

On 2026-07-02 11:28 PM, Narayana Murty N wrote:
> Add helper support for sPAPR TCE v2 DMA windows in the VFIO selftest
> library.
> 
> Track the platform default DMA window separately from selftest-created
> dynamic DMA windows. The default window is discovered with
> VFIO_IOMMU_SPAPR_TCE_GET_INFO and is not removed during cleanup.
> 
> Add helpers to create and remove DDWs, return the active IOVA range, and
> register/unregister memory around DMA map/unmap operations. Window
> selection is done before IOVA allocation; the map path only validates,
> registers memory, and calls VFIO_IOMMU_MAP_DMA.
> 
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

> +static int spapr_tce_read_default_window(struct iommu *iommu)

Please add vfio_iommu_*() prefix to these routines that wrap
VFIO_IOMMU_* ioctls.

e.g.

 spapr_tce_read_default_window() -> vfio_iommu_spapr_tce_get_default()
 spapr_tce_create_ddw()          -> vfio_iommu_spapr_tce_create_window()
 spapr_tce_remove_ddw()          -> vfio_iommu_spapr_tce_remove_window()
 spapr_register_memory()         -> vfio_iommu_spapr_register_memory()
 spapr_unregister_memory()       -> vfio_iommu_spapr_unregister_memory()

This helps with readability since it makes it clear these functions are
interacting with the VFIO IOMMU driver.

> +{
> +	struct vfio_iommu_spapr_tce_info info = {
> +		.argsz = sizeof(info),
> +	};
> +
> +	if (iommu->default_window.valid)
> +		return 0;
> +
> +	if (ioctl(iommu->container_fd, VFIO_IOMMU_SPAPR_TCE_GET_INFO, &info))
> +		return -errno;
> +
> +	iommu->default_window.start = info.dma32_window_start;
> +	iommu->default_window.size = info.dma32_window_size;
> +	iommu->default_window.page_shift = page_size_to_shift(getpagesize());
> +	iommu->default_window.valid = true;
> +	iommu->default_window.dynamic = false;
> +	iommu->default_window.remove_on_cleanup = false;
> +
> +	return 0;
> +}
> +
> +static int spapr_tce_create_ddw(struct iommu *iommu, u64 min_size, u32 page_shift)
> +{
> +	struct vfio_iommu_spapr_tce_create create = {
> +		.argsz = sizeof(create),
> +		.page_shift = page_shift,
> +		.levels = 1,
> +		.window_size = min_size,
> +	};
> +
> +	if (ioctl(iommu->container_fd, VFIO_IOMMU_SPAPR_TCE_CREATE, &create))
> +		return -errno;
> +
> +	iommu->ddw_window.start = create.start_addr;
> +	iommu->ddw_window.size = create.window_size;
> +	iommu->ddw_window.page_shift = page_shift;
> +	iommu->ddw_window.valid = true;
> +	iommu->ddw_window.dynamic = true;
> +	iommu->ddw_window.remove_on_cleanup = true;
> +
> +	return 0;
> +}
> +
> +static int spapr_tce_remove_window(struct iommu *iommu, struct spapr_tce_window *window)
> +{
> +	struct vfio_iommu_spapr_tce_remove remove = {
> +		.argsz = sizeof(remove),
> +		.start_addr = window->start,
> +	};
> +
> +	if (!window->valid || !window->remove_on_cleanup)
> +		return 0;
> +
> +	if (ioctl(iommu->container_fd, VFIO_IOMMU_SPAPR_TCE_REMOVE, &remove))
> +		return -errno;
> +
> +	window->valid = false;
> +	return 0;
> +}
