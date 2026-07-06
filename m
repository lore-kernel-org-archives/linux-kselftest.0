Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0080436BCA
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377696; cv=none; b=MtRYb6jIE3blU+XfzMUBbEPbT9Kgi3D3SQFMZlTrWindA997ocOMaptmUsUhRWjm/IfldAdFDRTbwOM1oFsEQc9ElkCS6T5scw89wtOvzJKOUAXy806Lu95bV4iLyxcBRJ2ow0EM5SnlApM4u7Efa1GmvuA66cDXxd9I/RyTpLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377696; c=relaxed/simple;
	bh=45nfGieBXiTGbZYJXCoRRCYNwWHoqa+j46bUmhCRL9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcPyAaHcACAJLA3f0lcsJNlTWusJeaVA8/NE+pIutgbDepC9A2lRc0pqCsbJ70RConhyi0okakmwPJLncBBGZ9lyIUaZWLsTVK7hGpBRo7xvbGy7o40GdN9jg7t+K9bY/qW/sjNjQVKOfItay4j9sdGGyQCQWTHXz7Rc63BcwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8cGmXB6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8cGmXB6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847e6f03df8so4333375b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783377694; x=1783982494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qTg55dnZXdFTJzS3uDV68WOtrA9P27OxaKfXATaxmk=;
        b=H8cGmXB6JRc93ppdZeSD9xrAhrAfWAtyzo349zDygb5+V/bcUsGDB78HwTligcvQrk
         Cp6yx+ZAiauRwxmEfbJ9P7iNeqcQzc36OxwEi/yToKCpklXBd4vUsr5pOmJuxLjzTzad
         +JUPWcU6kq7XZK0u8aQXGyGV1q5WMGC9uE740fcq4yIJlI3L0Ztw5KXseA7TZ20/KIWh
         k08Yy3lmXZ9QoxldgrwcS3/rb7WYsDjF1Qvep3PK9om8aUYW7KwuNzW5fovz6hNuVBfS
         2U3ZaMM0nIEs3FL0dIdhrrMxnb85R1oMMx6/zzmevcK0f5swMSTJbpf+TrZyncGH5iHo
         cAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377694; x=1783982494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qTg55dnZXdFTJzS3uDV68WOtrA9P27OxaKfXATaxmk=;
        b=sN9cxKTrRrOqGnzQr4lGBF3smtw2HPGiqj9sGbpf6rbXwi9Sj1UEgjIC4syzGofjAG
         8z75LnY1/AgNYdWpR/utJNH/OsqB02mqL1KHfQdP3AWKokc8V8aIAxYdzBrWv3vloXlF
         AtKsjtuIt4Grs7lKCLJ869jUm/MWvur1IGyIxyWfHPzZwkFqOaoZgKBIdR6BTuQ9DUwc
         jc3QoTG+SfSaQH/mDRLHjawZvFWxhPaVv67ArcH34bd3gcPo7dBkorkAvJq5/y7ERNAC
         BKRDgkOShW+vaWjH1bv0DbGxqrWAvO632H+48G0Exg2LidCXjQh+CR3z7cvopwbXwFOG
         cCYw==
X-Forwarded-Encrypted: i=1; AHgh+RqVNNm76fXdHfDebI0a6ZLZgEuta9qqy9KKbh2lSNfNykFEqJI+xGMjcUwblhOmcW2HDKPNhx5fIXpHAjiUcJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySMV8mOO0W/qf/Kni9x5M0SNZHyURGcFozSKnSKreXPAg85vJT
	bEOFiCr4gLMdt4UELJ0cCJRWHJSkxQiXrgXdv7OgKo0iwGDBkFqULCmTI1mq2Usnow==
X-Gm-Gg: AfdE7cnknMWwKm1QIJ9kQkxS4UGRTAPw83LWrsPdm6CZjk1Xe664qjK5AufGACI+ziR
	bNTBWcuUbo7I29pJ3egbnsGopcyoj2K90NEj54bfUYiZio0QLRrGwQprhgykjl/bBT80/AnpTKY
	6p5vIgTEHTHJgTlEzgGdza0r3E32uwl4K8lnQe8Kr9rdaqyp/SZHMAKjUufI8wVOt6uhUIorU49
	YLOkapJG9B3fw0xCq28LPEbs0AahUOL3lqlLwKs4u+6+lkvNYDGmVKP6EiLZ6+wfJbAJfbYF8bz
	6V5PkwA5IEuYC7r9ls6+rZjPhKfkO6hMrNbH3k6+Ywq2IhhNhZD/hQLBdTGdl3g/OZcLOyNKXai
	vFLK2toiUAPTAb51FZNSfotlN2IewBKYFsC2F8iPtISC25XWT4OexRcPWmOS5kgDqi+RmaJHj21
	lEhVeTZ0F0jiiCMj1b+9QrP9hrvPgbSjcU64DhXa9ETnzXI5sUKe8=
X-Received: by 2002:a05:6a00:3a03:b0:845:cf86:9469 with SMTP id d2e1a72fcca58-84826db094amr2376156b3a.29.1783377693654;
        Mon, 06 Jul 2026 15:41:33 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbfd41sm4469470b3a.57.2026.07.06.15.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:41:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:41:29 +0000
From: David Matlack <dmatlack@google.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: alex@shazbot.org, shuah@kernel.org, amastro@fb.com, rananta@google.com,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
	sbhat@linux.ibm.com, harshpb@linux.ibm.com
Subject: Re: [RFC PATCH 4/6] selftests/vfio: Exercise sPAPR DDW path for
 hugepage DMA mappings
Message-ID: <akwvGT04JHkjcKVQ@google.com>
References: <20260703032806.40946-1-nnmlinux@linux.ibm.com>
 <20260703032806.40946-5-nnmlinux@linux.ibm.com>
 <akwtI2ixuRBHYCyy@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akwtI2ixuRBHYCyy@google.com>

On 2026-07-06 10:33 PM, David Matlack wrote:
> On 2026-07-02 11:28 PM, Narayana Murty N wrote:
> > Prepare the DMA window before IOVA allocation in the DMA mapping tests.
> > 
> > Anonymous mappings use the default sPAPR DMA window. HugeTLB mappings force
> > a DDW with the requested page size, allowing the test to exercise DDW
> > creation, mapping, unmapping, and cleanup.
> > 
> > Skip gracefully when hugepage allocation fails or when the platform does
> > not support the requested DDW characteristics. Also skip unmap-all when
> > the backend cannot pair it with the sPAPR memory unregister flow.
> > 
> > Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> > ---
> >  .../selftests/vfio/vfio_dma_mapping_test.c    | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> > index 7d0de8c79de1..4411fdbd56da 100644
> > --- a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> > +++ b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  #include <stdio.h>
> > +#include <string.h>
> >  #include <sys/mman.h>
> >  #include <unistd.h>
> >  
> > @@ -119,8 +120,19 @@ FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(anonymous_hugetlb_1gb, SZ_1G, MAP_HUGETLB |
> >  
> >  FIXTURE_SETUP(vfio_dma_mapping_test)
> >  {
> > +	const u64 page_size = variant->size ?: getpagesize();
> > +	const bool force_dynamic = !!variant->size;
> 
> This is kind of arbitrary right? Should we add explicit variants for
> dynamic/default windows (see below). But we need some way to skip the dynamic
> window tests on non-spapr iommus...

Maybe the flow can be something like this:

  iommu = iommu_init(); /* sets up default window */

  if (variant->dynamic_window) {
          ret = iommu_dma_window_create(...); /* always fails on non-sapr iommus */
          if (ret)
                  SKIP(...);
  }

Then I think you also want to add some call to gracefully skip tests if
the current window does not support the desired mapping. e.g.

  if (!iommu_dma_window_fits(region)) /* always succeeds on non-spapr iommus */
          SKIP(...);

> 
> diff --git a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> index cd2d3276a46c..b54c529ebedb 100644
> --- a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> +++ b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> @@ -103,15 +103,21 @@ FIXTURE_VARIANT(vfio_dma_mapping_test) {
>         const char *iommu_mode;
>         u64 size;
>         int mmap_flags;
> +       bool dynamic_window;
>  };
> 
> -#define FIXTURE_VARIANT_ADD_IOMMU_MODE(_iommu_mode, _name, _size, _mmap_flags) \
> -FIXTURE_VARIANT_ADD(vfio_dma_mapping_test, _iommu_mode ## _ ## _name) {               \
> -       .iommu_mode = #_iommu_mode,                                            \
> -       .size = (_size),                                                       \
> -       .mmap_flags = MAP_ANONYMOUS | MAP_PRIVATE | (_mmap_flags),             \
> +#define __FIXTURE_VARIANT_ADD_IOMMU_MODE(_iommu_mode, _name, _size, _mmap_flags, _dynamic_window) \
> +FIXTURE_VARIANT_ADD(vfio_dma_mapping_test,_iommu_mode ## _ ## _name) {   \
> +       .iommu_mode = #_iommu_mode,                                                               \
> +       .size = (_size),                                                                          \
> +       .mmap_flags = MAP_ANONYMOUS | MAP_PRIVATE | (_mmap_flags),                                \
> +       .dynamic_window = _dynamic_window,                                                        \
>  }
> 
> +#define FIXTURE_VARIANT_ADD_IOMMU_MODE(_iommu_mode, _name, _size, _mmap_flags)  \
> +__FIXTURE_VARIANT_ADD_IOMMU_MODE(_iommu_mode, _name, _size, _mmap_flags, false); \
> +__FIXTURE_VARIANT_ADD_IOMMU_MODE(_iommu_mode, _name ## _dynamic_window, _size, _mmap_flags, true) \
> +
>  FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(anonymous, 0, 0);
>  FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(anonymous_hugetlb_2mb, SZ_2M, MAP_HUGETLB | MAP_HUGE_2MB);
>  FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(anonymous_hugetlb_1gb, SZ_1G, MAP_HUGETLB | MAP_HUGE_1GB);
> @@ -121,14 +127,13 @@ FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(anonymous_hugetlb_1gb, SZ_1G, MAP_HUGETLB |
>  FIXTURE_SETUP(vfio_dma_mapping_test)
>  {
>         const u64 page_size = variant->size ?: getpagesize();
> -       const bool force_dynamic = !!variant->size;
>         int ret;
> 
>         self->iommu = iommu_init(variant->iommu_mode);
>         self->device = vfio_pci_device_init(device_bdf, self->iommu);
> 
>         ret = iommu_prepare_dma_window(self->iommu, page_size, page_size,
> -                                      force_dynamic);
> +                                      variant->dynamic_window);
>         if (ret)
>                 SKIP(return, "DMA window unavailable: %s (%d)\n",
>                      strerror(-ret), -ret);
> 
> > +	int ret;
> > +
> >  	self->iommu = iommu_init(variant->iommu_mode);
> >  	self->device = vfio_pci_device_init(device_bdf, self->iommu);
> > +
> > +	ret = iommu_prepare_dma_window(self->iommu, page_size, page_size,
> > +				       force_dynamic);
> > +	if (ret)
> > +		SKIP(return, "DMA window unavailable: %s (%d)\n",
> > +		     strerror(-ret), -ret);
> > +
> >  	self->iova_allocator = iova_allocator_init(self->iommu);
> >  }
> >  
> > @@ -227,6 +239,7 @@ FIXTURE_SETUP(vfio_dma_map_limit_test)
> >  	u64 region_size = getpagesize();
> >  	iova_t last_iova;
> >  	u32 nranges;
> > +	int ret;
> >  
> >  	/*
> >  	 * Over-allocate mmap by double the size to provide enough backing vaddr
> > @@ -236,6 +249,13 @@ FIXTURE_SETUP(vfio_dma_map_limit_test)
> >  
> >  	self->iommu = iommu_init(variant->iommu_mode);
> >  	self->device = vfio_pci_device_init(device_bdf, self->iommu);
> > +
> > +	ret = iommu_prepare_dma_window(self->iommu, region_size, region_size,
> > +				       false);
> > +	if (ret)
> > +		SKIP(return, "DMA window unavailable: %s (%d)\n",
> > +		     strerror(-ret), -ret);
> > +
> >  	region->vaddr = mmap(NULL, self->mmap_size, PROT_READ | PROT_WRITE,
> >  			     MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> >  	ASSERT_NE(region->vaddr, MAP_FAILED);
> > @@ -277,6 +297,8 @@ TEST_F(vfio_dma_map_limit_test, unmap_all)
> >  	u64 unmapped;
> >  	int rc;
> >  
> > +	if (!iommu_supports_unmap_all(self->iommu))
> > +		SKIP(return, "IOMMU backend does not support unmap-all\n");
> >  	iommu_map(self->iommu, region);
> >  	ASSERT_EQ(region->iova, to_iova(self->device, region->vaddr));
> >  
> > -- 
> > 2.51.1
> > 
