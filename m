Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA94D8D8F
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534857; cv=none; b=I/cLEiSC1M9rqvxu8jGtWAZzILHyONbGU8X/OYhqQ5k0MjbHcmlyRrKoKhlzK2KEgpb3I92LdWxtXY9XgYh5ufSERLOV+oW4XP9iDHCL5FAdxQmUQPeM4Beqo+yWQvKh/Y3BQZ+PvmJUBaxZWj53V3STba2MCDdvU4ScuDNWvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534857; c=relaxed/simple;
	bh=GAm3NIG1k+FRmev2iUc3LqoU40KKqJ8zgvi3GQiHRYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3T4DMxNq2tmFK2rBat+91NM/4DYTwbmnUGS2X4X1YsB/uMYuGESoWcJS+5y3xLndbICeWYOAYpmruZb6tmYPgvAls8klZbZ9uyywskDB8ObjDRz6V9CMS5UfEmQ+qCs+KBGbJafnQFI39ZjcXn7Rde6murhiOzgztVK7sie/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kCT4Z6az; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kCT4Z6az"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b46da8c48eso765ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778534855; x=1779139655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GCpB/qlE6YAZPSqlDCGlZlFTz7sxmMbGZ3iIDSDH7o=;
        b=kCT4Z6azvLwoQ62kG8307YcWx1lxA7RQ3qqY8o6W222Q8+p9mSvStFbeGZTpKrS8Qu
         HPC1BmdeKPHD+6trN10EHfaqhWX62aEklsmzWftjqRTkPWL1Y3XOQB8ttw4t5nEcVN8A
         hbKlv69/rXdQxp2EWyOdafXwhpP1VkuTqAa0TqkvtQCNnqp0fn4tcY2Ezr2S2fNDv1Q6
         bz/B7LqxWlGjPRpKNtR4lIE/Kkk4TqH1dZdXq21g1b96YVZKs5OMK6dp+w9xtddOLF0F
         Ogap4MsUEuoBcYE9AuOdzqbGExTg65IomvRkVCsPFz5raoSXIGikGDuNqubeJGqo35CD
         7mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778534855; x=1779139655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GCpB/qlE6YAZPSqlDCGlZlFTz7sxmMbGZ3iIDSDH7o=;
        b=qWry7RMdFXxM+dvzZnz+I7t4GXKyVrWo70e4JDxhXC5yq5yLQSYz2LxhmNI1UaMzts
         1QAeac3jdmS4Tx1ShzE9dOs6/NpvS6DPHg5PbMj86/ycMx0HoB8k7CaqDjjfyWw32uIC
         Eddmh40HehdNmvEU9QneH3D+AHYVLLxiF99TfdnS6xI1ajbTJSMMPJZKw3AvH6k4g4u7
         TRL++o77Nt9XkrzPO2iZ4EXYkPVKf9RHFn+94vT/gpJzQ6r+5WkhVLTsbLrynAnQUPzM
         2dGArk+BdCGp+KyJz8h3bza607TNjdTYA6Ehg1D0obg/aQ4c7DqrGN0I6hxdDanOfxVI
         ee/g==
X-Forwarded-Encrypted: i=1; AFNElJ/3W60OudwHhsGxGLYss9E7PgoyqyA1tq/nV5p8sVTiHnJrcsNdRcu/4Pt3iAe5TBXqND8NBnEC2imN1R9bOwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNUniKN4X8RW3vmetilnweCo1d0b4a1jIWaxBKKKG+hYkcLxm
	ZPw9kD2A2pu3q3e6XwB1tC6w5F4VfR/BDPONAEO5K2jxF5EiEGL3VANOaVb882m8Ig==
X-Gm-Gg: Acq92OEUmK8ffASvH32ueJOiCOpaVLLJ8RTEfzKTKly7PAhHqvglJAB7fNzFtu1DR+t
	qYP5NejjUsWSKjw2KgB7naLvUU19OJkoP0YpuAUzVNoMA+NrliffFSlagmzIJK6EWnFNMIaqelx
	WgF4OJbfxJFrZ/Y0zt8D8kg/PgHYDmTcVESYA/7MyMMOr6FDVecFvcTfKPYiQgG3Tv+TVxYsEN5
	sptQKHiP/eaqS0NaMLld3i+MzinVJwU3/s0PzTr948IQrGd9n6bwrWrTpF6qpd5oAYfic/vOErc
	//koU0mMyLU4gJJKR7fGTP5qlddIhqTwcaB6KT+pfhivzJxSKhDoOVtTJ7d9JeoGlKRtFw1aABF
	y8MaA6846Pd3Hva6PvNUSxAlXCaGNfczhgT+wdntRRCw8bgCr1At0ML3qOGEOukx7SoRK6bFfi2
	647ArFjy0JGVfQxChHQrUUtSn8mb226Muu/KoNz4UohhpWAiVDy0WhwTuGOgRderfmyrOVEtxep
	8SSlguI
X-Received: by 2002:a17:903:32c4:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2bcfe66d59bmr1559405ad.8.1778534854688;
        Mon, 11 May 2026 14:27:34 -0700 (PDT)
Received: from google.com (153.46.83.34.bc.googleusercontent.com. [34.83.46.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35494sm111136225ad.49.2026.05.11.14.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 14:27:34 -0700 (PDT)
Date: Mon, 11 May 2026 21:27:31 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Aex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] vfio: selftests: Add iommufd multi iommu test
Message-ID: <agJJbeg4VlA5kSLB@google.com>
References: <20260505221518.619123-1-skhawaja@google.com>
 <20260505221518.619123-3-skhawaja@google.com>
 <af5EEN8PhVz4pTdE@google.com>
 <agI6peKFWDdn939Z@google.com>
 <agJF0gY_V-ZWaNK8@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <agJF0gY_V-ZWaNK8@google.com>

On Mon, May 11, 2026 at 09:10:42PM +0000, David Matlack wrote:
>On 2026-05-11 08:53 PM, Samiullah Khawaja wrote:
>> On Fri, May 08, 2026 at 08:14:08PM +0000, David Matlack wrote:
>> > On 2026-05-05 10:14 PM, Samiullah Khawaja wrote:
>> > > Add a test for iommufd to verify creation of multiple iommus using an
>> > > already setup iommufd and switch between them.
>> > >
>> > > Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>> > > ---
>> > >  tools/testing/selftests/vfio/Makefile         |   1 +
>> > >  .../vfio/vfio_iommufd_multi_iommu_test.c      | 203 ++++++++++++++++++
>> > >  2 files changed, 204 insertions(+)
>> > >  create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
>> > >
>> > > diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
>> > > index 0684932d91bf..24bdeaad590f 100644
>> > > --- a/tools/testing/selftests/vfio/Makefile
>> > > +++ b/tools/testing/selftests/vfio/Makefile
>> > > @@ -8,6 +8,7 @@ else
>> > >  CFLAGS = $(KHDR_INCLUDES)
>> > >  TEST_GEN_PROGS += vfio_dma_mapping_test
>> > >  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
>> > > +TEST_GEN_PROGS += vfio_iommufd_multi_iommu_test
>> > >  TEST_GEN_PROGS += vfio_iommufd_setup_test
>> > >  TEST_GEN_PROGS += vfio_pci_device_test
>> > >  TEST_GEN_PROGS += vfio_pci_device_init_perf_test
>> > > diff --git a/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c b/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
>> > > new file mode 100644
>> > > index 000000000000..7199c662637c
>> > > --- /dev/null
>> > > +++ b/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
>> > > @@ -0,0 +1,203 @@
>> > > +// SPDX-License-Identifier: GPL-2.0-only
>> > > +#include <sys/ioctl.h>
>> > > +#include <sys/mman.h>
>> > > +
>> > > +#include <linux/sizes.h>
>> > > +#include <linux/vfio.h>
>> > > +
>> > > +#include <libvfio.h>
>> > > +
>> > > +#include "kselftest_harness.h"
>> > > +
>> > > +static const char *device_bdf;
>> > > +
>> > > +#define IOMMU_DEFAULT 0
>> > > +#define IOMMU_WITH_PT 1
>> > > +#define IOMMU_WITHOUT_PT 2
>> > > +
>> > > +static void region_setup(struct iommu *iommu,
>> > > +			 struct iova_allocator *iova_allocator,
>> > > +			 struct dma_region *region, u64 size)
>> > > +{
>> > > +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
>> > > +	const int prot = PROT_READ | PROT_WRITE;
>> > > +	void *vaddr;
>> > > +
>> > > +	vaddr = mmap(NULL, size, prot, flags, -1, 0);
>> > > +	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
>> > > +
>> > > +	region->vaddr = vaddr;
>> > > +	region->iova = iova_allocator_alloc(iova_allocator, size);
>> > > +	region->size = size;
>> > > +
>> > > +	iommu_map(iommu, region);
>> > > +}
>> > > +
>> > > +static void region_teardown(struct iommu *iommu, struct dma_region *region)
>> > > +{
>> > > +	iommu_unmap(iommu, region);
>> > > +	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
>> > > +}
>> >
>> > Can you create library helpers in the library to share with
>> > vfio_pci_driver_test.c?
>> >
>> >  dma_region_setup()
>> >  dma_region_teardown()
>>
>> I thought it is ok to duplicate this as each test (in future) might have
>> different mapping requirements? we might have memfd, guest_memfd,
>> dma_buf with various mapping strategies for different usecases?
>>
>> Or you are thinking of a basic helper that can be used by tests if they
>> are not doing anything fancy?
>
>We have 2 tests now that need the same code to setup their regions so we
>might as well share it. As new and more complex use-cases arise we can
>figure out how to support them (per-test logic or fancier library
>support).

Ok I will add this as a separate patch.
>
>> > > +TEST_F(vfio_iommufd_multi_iommu_test, memcpy)
>> > > +{
>> > > +	struct dma_region memcpy_region1, driver_region1;
>> > > +	struct dma_region memcpy_region2, driver_region2;
>> > > +	struct iommu *iommu1;
>> > > +	struct iommu *iommu2;
>> > > +
>> > > +	iommu1 = setup_variant_iommu(self->iommu, self->device->dev_id,
>> > > +				     variant->start_iommu);
>> > > +	if (iommu1 != self->iommu) {
>> > > +		memcpy_region1 = self->memcpy_region;
>> > > +		driver_region1 = self->device->driver.region;
>> > > +
>> > > +		iommu_map(iommu1, &memcpy_region1);
>> >
>> > Can you make a helper to copy dma_region into a new iommu? It should set
>> > up the new struct dma_region based on the old one, re-initialize the
>> > link field, and then call iommu_map().
>>
>> Can you please clarify, I didn't get it completely. so basically
>> something that can be called like following?
>>
>> setup_copy_dma_regions(self, iommu1, &memcpy_region1, &driver_region1);
>
>I was thinking something like this exposed by lib/iommu.c:
>
>void iommu_copy_mapping(struct iommu *iommu,
>			struct dma_region *new_region,
>			struct dma_region *existing_region)
>{
>	*new_region = *existing_region;
>	INIT_LIST_HEAD(&new_region->link);
>	iommu_map(iommu, new_region);
>}
>
>And then in the test you just do:
>
>if (iommu1 != self->iommu)
>	iommu_copy_mapping(iommu1, memcpy_region1, self->memcpy_region);

Yeah that makes sense. I will update this in next revision.
