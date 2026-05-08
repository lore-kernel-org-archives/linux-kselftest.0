Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6EF221DB3
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271255; cv=none; b=CUilvK4MwnjrmLeXEPYe0XLl5HfYJcWL+1o3Cts7eCkkouc+VrZXwhk3v0uNAubaHvr4pVmX5N5oyy/PrOxPwaEx9Vq0T3bUfYpSvSIx3vTtJV3GaK7J/9qeZIOsHoiREAZXN4JlffLYgaaKqJxQHqPUebscFej92nLXWFR23so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271255; c=relaxed/simple;
	bh=RS45nGaa2xfpxH8/SkFIMEiC/EompSfjijdiBnxEf+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj1qAjr73ZOVtcxfT4UzlFgNCV/apHSy50nuwoyQthsneA//75sDaIWv9ddGgsd9RL0wrpAzqzKlRJaDkUEVc6PfdYSMs5ZTgplJwRaRseKrSZfOpTrV8qXfbAOIN+ikPoLmI8JS9jbokfAjl/W3QtRGARn3AnVNZlM3QuhPXXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CVJPwjkN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CVJPwjkN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b458ca2296so16470645ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778271253; x=1778876053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwE6EAn1RnwC3qP85ag91J2sbQhIq4l6SOE5wwfoP3s=;
        b=CVJPwjkN4+GrlFbHL+265ZQ0BVhHmk1PEQlH8Lk1fslR2X2yVQ/myd1qJRATMFCxsZ
         hVHWNM9U5dEXOLefcPdPBA3m9WYvi4sSoA1gZpy2Q7AlNtDxFoIjHXUt2fvBnEkWKiMW
         Pgi55NNDNtyH4EjQf2Q6bfN47vyej7QOPDFb4hoPfVzqYFAVjanGpZHEQ0yA7HEsLbGc
         VdL3uFqkScK6xZ3iIgjZFEj/+ReNFM3fHWjc6RNKrZg/FHg1p/Ik44YFamQ2inOCNEFv
         rsGXxAnsOVGzDIDKBd9PmpIfA7qj+pu2YXM68QXbHvpU4Oj+vu3/6jVEnYNsVdgsy/XN
         5tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271253; x=1778876053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwE6EAn1RnwC3qP85ag91J2sbQhIq4l6SOE5wwfoP3s=;
        b=qPwCJ4sXePH3DeJS8pD67O/HRXTF090yHEh11cteNgQRc/31RxZdD2wn6i+geB3zeQ
         VASrPHl9tHXnS4pssqzOZPrReLn0fs/J4wNABU/ncv3O4HQ2sP3ZboR+HzUz/lrvm5ZF
         eNkSoJwbQaSWcnXP+cH3ujG1N/XRPd7LNn7Xfo/MIcjgd6eXaPNGEQV9aUzlNBIEuKC0
         Xsiq3QLe7yiEPcjp1ooknAz17fDHfoTOpaWAkp4QAnLTu3vP2v58cOdZcDaziWatzY7J
         drQIQ1k91Bg+nO4vdaPBVvMRnsP0B/ybP7MG2piQRokdV5Q/fqj46bnEV9THrtua89wZ
         Uhmg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZlZ3ywRnhhr5YLNtTU/b9pB7O6ABdh5YqV2R7X/eRF9Sw4jXCvmbl8ku6tUndyQa5POG1dTK+1YPMihncwlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhqM1ZJjwIJRmpJzpRh2iXlpU9/yAHBCrNPnGzxGcJjtgc6+fh
	FYcOll4w+qowazV49TWlifutkkitteDvHSc7zIee1jiTvngoC++978ZuWKgL5dD1tg==
X-Gm-Gg: Acq92OFas1Va082GAKGbbVvVo1Yj7oq1JYM6FFnOeUQB4h6N+A2iEiK355ipqSPAu7V
	U/v/k4MfFHVAbeY8fINH9e05hz5ROehau/GDEg5i+QCSbjGJ1MZxryLB2OYt3rIjVw3Y6QhvY0q
	Tc47cxe3TbIoElU84GJBGsxeVhmlG35LBSY26b8L9oPox02YDjpl1QFLL6yGQ0OOdF59ZpSgpcB
	yflmCv+R3JRzwRpoXIm/Ecf90YHPn41I0HmBL1/9VYSRwFtswRmjT8c9t6WaQTHTBU4RmhRAEH8
	z9+uJLSaxOiIf/N5lDc8zJHV5mw0hFoNLQBDliMyJC1vXB0i/W7mlSHy82X1zxi1Q98oX92Q/NR
	ED4/nJOt8tcTJwOAcIpxM1/59qguReHwLigj7BaC1C4HzMcyIaxAKUSivVu7iT8YOA2SEha3jiJ
	goE8gk06KFh9kT3lxlOysBk6DGD1dSAqihPNnVtO2RBXBDOxv1F+e8FEsKqa1YvDAhlkSNqk84D
	s3YKdjqQHQ=
X-Received: by 2002:a17:902:e549:b0:2b4:6367:7b86 with SMTP id d9443c01a7336-2baf0e5d92dmr45426795ad.37.1778271252255;
        Fri, 08 May 2026 13:14:12 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm31559395ad.1.2026.05.08.13.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:14:11 -0700 (PDT)
Date: Fri, 8 May 2026 20:14:08 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Aex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] vfio: selftests: Add iommufd multi iommu test
Message-ID: <af5EEN8PhVz4pTdE@google.com>
References: <20260505221518.619123-1-skhawaja@google.com>
 <20260505221518.619123-3-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505221518.619123-3-skhawaja@google.com>

On 2026-05-05 10:14 PM, Samiullah Khawaja wrote:
> Add a test for iommufd to verify creation of multiple iommus using an
> already setup iommufd and switch between them.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---
>  tools/testing/selftests/vfio/Makefile         |   1 +
>  .../vfio/vfio_iommufd_multi_iommu_test.c      | 203 ++++++++++++++++++
>  2 files changed, 204 insertions(+)
>  create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
> 
> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> index 0684932d91bf..24bdeaad590f 100644
> --- a/tools/testing/selftests/vfio/Makefile
> +++ b/tools/testing/selftests/vfio/Makefile
> @@ -8,6 +8,7 @@ else
>  CFLAGS = $(KHDR_INCLUDES)
>  TEST_GEN_PROGS += vfio_dma_mapping_test
>  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
> +TEST_GEN_PROGS += vfio_iommufd_multi_iommu_test
>  TEST_GEN_PROGS += vfio_iommufd_setup_test
>  TEST_GEN_PROGS += vfio_pci_device_test
>  TEST_GEN_PROGS += vfio_pci_device_init_perf_test
> diff --git a/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c b/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
> new file mode 100644
> index 000000000000..7199c662637c
> --- /dev/null
> +++ b/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +
> +#include <linux/sizes.h>
> +#include <linux/vfio.h>
> +
> +#include <libvfio.h>
> +
> +#include "kselftest_harness.h"
> +
> +static const char *device_bdf;
> +
> +#define IOMMU_DEFAULT 0
> +#define IOMMU_WITH_PT 1
> +#define IOMMU_WITHOUT_PT 2
> +
> +static void region_setup(struct iommu *iommu,
> +			 struct iova_allocator *iova_allocator,
> +			 struct dma_region *region, u64 size)
> +{
> +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
> +	const int prot = PROT_READ | PROT_WRITE;
> +	void *vaddr;
> +
> +	vaddr = mmap(NULL, size, prot, flags, -1, 0);
> +	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
> +
> +	region->vaddr = vaddr;
> +	region->iova = iova_allocator_alloc(iova_allocator, size);
> +	region->size = size;
> +
> +	iommu_map(iommu, region);
> +}
> +
> +static void region_teardown(struct iommu *iommu, struct dma_region *region)
> +{
> +	iommu_unmap(iommu, region);
> +	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
> +}

Can you create library helpers in the library to share with
vfio_pci_driver_test.c?

  dma_region_setup()
  dma_region_teardown()

> +
> +FIXTURE(vfio_iommufd_multi_iommu_test) {
> +	struct iommu *iommu;
> +	struct vfio_pci_device *device;
> +	struct iova_allocator *iova_allocator;
> +	struct dma_region memcpy_region;
> +	void *vaddr;
> +
> +	u64 size;
> +	void *src;
> +	void *dst;
> +	iova_t src_iova;
> +	iova_t dst_iova;
> +};
> +
> +FIXTURE_SETUP(vfio_iommufd_multi_iommu_test)
> +{
> +	struct vfio_pci_driver *driver;
> +
> +	self->iommu = iommu_init("iommufd");

MODE_IOMMUFD

> +	self->device = vfio_pci_device_init(device_bdf, self->iommu);
> +	self->iova_allocator = iova_allocator_init(self->iommu);
> +
> +	driver = &self->device->driver;
> +
> +	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_1G);
> +	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
> +
> +	if (driver->ops)
> +		vfio_pci_driver_init(self->device);
> +
> +	self->size = self->memcpy_region.size / 2;
> +	self->src = self->memcpy_region.vaddr;
> +	self->dst = self->src + self->size;
> +
> +	self->src_iova = to_iova(self->device, self->src);
> +	self->dst_iova = to_iova(self->device, self->dst);
> +}
> +
> +FIXTURE_TEARDOWN(vfio_iommufd_multi_iommu_test)
> +{
> +	struct vfio_pci_driver *driver = &self->device->driver;
> +
> +	if (driver->ops)
> +		vfio_pci_driver_remove(self->device);
> +
> +	region_teardown(self->iommu, &self->memcpy_region);
> +	region_teardown(self->iommu, &driver->region);
> +
> +	iova_allocator_cleanup(self->iova_allocator);
> +	vfio_pci_device_cleanup(self->device);
> +	iommu_cleanup(self->iommu);
> +}
> +
> +FIXTURE_VARIANT(vfio_iommufd_multi_iommu_test) {
> +	u32 start_iommu;
> +	u32 end_iommu;
> +};
> +
> +#define ADD_IOMMU_VARIANT(S, E) \
> +	FIXTURE_VARIANT_ADD(vfio_iommufd_multi_iommu_test, S##_to_##E) { \
> +		.start_iommu = IOMMU_##S, \
> +		.end_iommu = IOMMU_##E \
> +	};
> +
> +#define ADD_ALL_VARIANTS(S) \
> +	ADD_IOMMU_VARIANT(S, DEFAULT) \
> +	ADD_IOMMU_VARIANT(S, WITH_PT) \
> +	ADD_IOMMU_VARIANT(S, WITHOUT_PT)
> +
> +ADD_ALL_VARIANTS(DEFAULT)
> +ADD_ALL_VARIANTS(WITH_PT)
> +ADD_ALL_VARIANTS(WITHOUT_PT)
> +
> +static struct iommu *setup_variant_iommu(struct iommu *fixture_iommu,
> +					 u32 dev_id, u32 type)
> +{
> +	switch (type) {
> +	case IOMMU_WITH_PT:
> +		return iommufd_iommu_init(fixture_iommu->iommufd, dev_id,
> +					  IOMMUFD_IOMMU_INIT_CREATE_PT);
> +	case IOMMU_WITHOUT_PT:
> +		return iommufd_iommu_init(fixture_iommu->iommufd, dev_id, 0);
> +	default:
> +		return fixture_iommu;
> +	}
> +}
> +
> +static void test_memcpy(struct vfio_pci_device *device, void *src, void *dst,
> +			iova_t src_iova, iova_t dst_iova, u64 size, char val)
> +{
> +	if (!device->driver.ops)
> +		return;
> +
> +	memset(src, val, size);
> +	memset(dst, 0, size);
> +
> +	vfio_pci_driver_memcpy_start(device, src_iova, dst_iova, size, 100);

Why do 100 copies?

> +	VFIO_ASSERT_EQ(vfio_pci_driver_memcpy_wait(device), 0);
> +	VFIO_ASSERT_EQ(memcmp(src, dst, size), 0);
> +}
> +
> +TEST_F(vfio_iommufd_multi_iommu_test, memcpy)
> +{
> +	struct dma_region memcpy_region1, driver_region1;
> +	struct dma_region memcpy_region2, driver_region2;
> +	struct iommu *iommu1;
> +	struct iommu *iommu2;
> +
> +	iommu1 = setup_variant_iommu(self->iommu, self->device->dev_id,
> +				     variant->start_iommu);
> +	if (iommu1 != self->iommu) {
> +		memcpy_region1 = self->memcpy_region;
> +		driver_region1 = self->device->driver.region;
> +
> +		iommu_map(iommu1, &memcpy_region1);

Can you make a helper to copy dma_region into a new iommu? It should set
up the new struct dma_region based on the old one, re-initialize the
link field, and then call iommu_map().

> +		iommu_map(iommu1, &driver_region1);
> +
> +		vfio_pci_device_attach_iommu(self->device, iommu1);
> +	}
> +
> +	test_memcpy(self->device, self->src, self->dst, self->src_iova,
> +		    self->dst_iova, self->size, 'x');

nit: You can pass in self to avoid unpacking it in every call to
test_memcpy(). The type would be:

  struct _test_data_vfio_iommufd_multi_iommu_test *self

> +
> +	iommu2 = setup_variant_iommu(self->iommu, self->device->dev_id,
> +				     variant->end_iommu);
> +	if (iommu2 != self->iommu) {
> +		memcpy_region2 = self->memcpy_region;
> +		driver_region2 = self->device->driver.region;
> +
> +		iommu_map(iommu2, &memcpy_region2);
> +		iommu_map(iommu2, &driver_region2);
> +	}
> +
> +	vfio_pci_device_attach_iommu(self->device, iommu2);
> +	test_memcpy(self->device, self->src, self->dst, self->src_iova,
> +		    self->dst_iova, self->size, 'a');

test_memcpy() zeroes self->dst every time so do you need to use a
different character for each call?

> +
> +	vfio_pci_device_attach_iommu(self->device, iommu1);
> +	test_memcpy(self->device, self->src, self->dst, self->src_iova,
> +		    self->dst_iova, self->size, '1');
> +
> +	if (iommu1 != self->iommu) {
> +		/* attach back to default iommu for cleanup */
> +		vfio_pci_device_attach_iommu(self->device, self->iommu);
> +		iommu_unmap(iommu1, &memcpy_region1);
> +		iommu_unmap(iommu1, &driver_region1);
> +		iommu_cleanup(iommu1);
> +	}
> +
> +	if (iommu2 != self->iommu) {
> +		iommu_unmap(iommu2, &memcpy_region2);
> +		iommu_unmap(iommu2, &driver_region2);

nit: You don't need to unmap before cleanup. Is this just to exercise
that unmap works on the variant iommus?

> +		iommu_cleanup(iommu2);
> +	}
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	device_bdf = vfio_selftests_get_bdf(&argc, argv);
> +
> +	return test_harness_run(argc, argv);
> +}
> -- 
> 2.54.0.545.g6539524ca2-goog
> 
