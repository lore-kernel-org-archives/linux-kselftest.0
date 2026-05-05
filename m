Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664C4A2E2E
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019352; cv=none; b=E5P8b7l09oK2QQgU9+HKDRqqHUVRjqDK6mKrKXN5qb7GIfpEFYsCLukdnGj7LquSQd5ZVYaMLPrT2DU0+yNoiPxb3Wfvl+YheXNwKPDCRExss6cIiD0hL9A8q69chyCVxAkRM+koUcVW0woqfFvE6vKb/mwBcQCeYAHtf7iQNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019352; c=relaxed/simple;
	bh=DQLsDlRg9cK3KamXiSx3uW2lS+tLFTLFL9c5dcS3gjU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ehKA5dv1GKnBAtCs0jVnC9Uzrye2Fvf2UWXx9AJrD7aFD4T44ZI4LfbLiCginBvX+7RezGEw3S1NzJAhzBKqL1FDzzrSex3rDcBC5jW4eQNTBg5aX1qDOVu0Dh5dwJgxILUbWlfVxOXEcE1HUNFTIdQl+Yw0Aah5zaCYo0+MxJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a/7ZKapQ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a/7ZKapQ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2d83e7461so107892575ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 15:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778019350; x=1778624150; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aoB9bNzq2kNeo0SI5dGif4n9lwcujzy/IuEbYoKZRSY=;
        b=a/7ZKapQt/t6sA5tjdJCLfU1mI8aGWJAgwnAsqGFFk4df9QpkhXk1GbNNbi8Zho97q
         4i/8LeEV6seulWWyDLmVtDkVNLTmK3N31TPCnLwm2jK3H9hsWPkQRqh+4bckaog7al7E
         BRnQoWZdwE7P+eIJvlFAQFBnGy2M+QELUAZhChnLiuOhB3dA8ULv1ILv4Kqfll/QsM0k
         GDuga7x7pyCjmqNFPF129TQXgUx42qZyVeDxi1oACScww+m2qkM7ehW+L6eHwT8lXofU
         mQcVZAQMLtDMSUBVZ5db++nyDuC/zCj8VklHCHF/7CoG+XEtNOh2prgyFgVs0ZnEuNV+
         7mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778019350; x=1778624150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoB9bNzq2kNeo0SI5dGif4n9lwcujzy/IuEbYoKZRSY=;
        b=P1y1+1cmC+6dk0Ko2UiN2DutzTRDxkx2cL0t+MVjW5I3xzuq/q4FPv9LqvcbojrbcB
         5etP37HLU75ztf+rRcDhlDpjyTKRG3ADjNGLJJYMKT2PNMKHc2Dl0RswgBiDTqpipjwR
         9hLLYIOtvUqem86vlRROZkRiQKILzZTsra7Xu4XNjaKJZbltBq4YfyzzhDw0RFk96ckr
         Od8PAMs/2xYg6n4gRfCopP9FGDTHQRSzNrrc7TWWFCBsW1xOHaM17fV6BZaheYPe7Co2
         uMBsFgcAEjKWRydEiqs1IY7OfaJFezkyov582sWJp1fdMauYREY9wnLfMARwGbkb+wwR
         TBtg==
X-Forwarded-Encrypted: i=1; AFNElJ+VLsL/2MBHR6H7aXnpnG3QYj6WRBkmFG27Ri/aLGqEAOA1TeVoeiFUVQCUOrFDzzbXFxTM7iczGyV8inOy7i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVp38NifRsvDEFqeHw35gJ/tRiruqX08OcaMth2AS3PLh+0cqu
	KYAzZCqfWSTnMli5zYOZrY7zsNRWOm1L58pLrNJqdb6hkdk/TqYINSuSlQd0WcmAlOiidAs76t2
	Rg5jit+876plleg==
X-Received: from pldp9.prod.google.com ([2002:a17:902:eac9:b0:2ba:f65:8ab8])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b0b:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2ba794b8457mr7527095ad.24.1778019349876;
 Tue, 05 May 2026 15:15:49 -0700 (PDT)
Date: Tue,  5 May 2026 22:14:36 +0000
In-Reply-To: <20260505221518.619123-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260505221518.619123-1-skhawaja@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260505221518.619123-3-skhawaja@google.com>
Subject: [PATCH 2/2] vfio: selftests: Add iommufd multi iommu test
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>, Aex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a test for iommufd to verify creation of multiple iommus using an
already setup iommufd and switch between them.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/vfio_iommufd_multi_iommu_test.c      | 203 ++++++++++++++++++
 2 files changed, 204 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 0684932d91bf..24bdeaad590f 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -8,6 +8,7 @@ else
 CFLAGS = $(KHDR_INCLUDES)
 TEST_GEN_PROGS += vfio_dma_mapping_test
 TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
+TEST_GEN_PROGS += vfio_iommufd_multi_iommu_test
 TEST_GEN_PROGS += vfio_iommufd_setup_test
 TEST_GEN_PROGS += vfio_pci_device_test
 TEST_GEN_PROGS += vfio_pci_device_init_perf_test
diff --git a/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c b/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
new file mode 100644
index 000000000000..7199c662637c
--- /dev/null
+++ b/tools/testing/selftests/vfio/vfio_iommufd_multi_iommu_test.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <linux/sizes.h>
+#include <linux/vfio.h>
+
+#include <libvfio.h>
+
+#include "kselftest_harness.h"
+
+static const char *device_bdf;
+
+#define IOMMU_DEFAULT 0
+#define IOMMU_WITH_PT 1
+#define IOMMU_WITHOUT_PT 2
+
+static void region_setup(struct iommu *iommu,
+			 struct iova_allocator *iova_allocator,
+			 struct dma_region *region, u64 size)
+{
+	const int flags = MAP_SHARED | MAP_ANONYMOUS;
+	const int prot = PROT_READ | PROT_WRITE;
+	void *vaddr;
+
+	vaddr = mmap(NULL, size, prot, flags, -1, 0);
+	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
+
+	region->vaddr = vaddr;
+	region->iova = iova_allocator_alloc(iova_allocator, size);
+	region->size = size;
+
+	iommu_map(iommu, region);
+}
+
+static void region_teardown(struct iommu *iommu, struct dma_region *region)
+{
+	iommu_unmap(iommu, region);
+	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
+}
+
+FIXTURE(vfio_iommufd_multi_iommu_test) {
+	struct iommu *iommu;
+	struct vfio_pci_device *device;
+	struct iova_allocator *iova_allocator;
+	struct dma_region memcpy_region;
+	void *vaddr;
+
+	u64 size;
+	void *src;
+	void *dst;
+	iova_t src_iova;
+	iova_t dst_iova;
+};
+
+FIXTURE_SETUP(vfio_iommufd_multi_iommu_test)
+{
+	struct vfio_pci_driver *driver;
+
+	self->iommu = iommu_init("iommufd");
+	self->device = vfio_pci_device_init(device_bdf, self->iommu);
+	self->iova_allocator = iova_allocator_init(self->iommu);
+
+	driver = &self->device->driver;
+
+	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_1G);
+	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
+
+	if (driver->ops)
+		vfio_pci_driver_init(self->device);
+
+	self->size = self->memcpy_region.size / 2;
+	self->src = self->memcpy_region.vaddr;
+	self->dst = self->src + self->size;
+
+	self->src_iova = to_iova(self->device, self->src);
+	self->dst_iova = to_iova(self->device, self->dst);
+}
+
+FIXTURE_TEARDOWN(vfio_iommufd_multi_iommu_test)
+{
+	struct vfio_pci_driver *driver = &self->device->driver;
+
+	if (driver->ops)
+		vfio_pci_driver_remove(self->device);
+
+	region_teardown(self->iommu, &self->memcpy_region);
+	region_teardown(self->iommu, &driver->region);
+
+	iova_allocator_cleanup(self->iova_allocator);
+	vfio_pci_device_cleanup(self->device);
+	iommu_cleanup(self->iommu);
+}
+
+FIXTURE_VARIANT(vfio_iommufd_multi_iommu_test) {
+	u32 start_iommu;
+	u32 end_iommu;
+};
+
+#define ADD_IOMMU_VARIANT(S, E) \
+	FIXTURE_VARIANT_ADD(vfio_iommufd_multi_iommu_test, S##_to_##E) { \
+		.start_iommu = IOMMU_##S, \
+		.end_iommu = IOMMU_##E \
+	};
+
+#define ADD_ALL_VARIANTS(S) \
+	ADD_IOMMU_VARIANT(S, DEFAULT) \
+	ADD_IOMMU_VARIANT(S, WITH_PT) \
+	ADD_IOMMU_VARIANT(S, WITHOUT_PT)
+
+ADD_ALL_VARIANTS(DEFAULT)
+ADD_ALL_VARIANTS(WITH_PT)
+ADD_ALL_VARIANTS(WITHOUT_PT)
+
+static struct iommu *setup_variant_iommu(struct iommu *fixture_iommu,
+					 u32 dev_id, u32 type)
+{
+	switch (type) {
+	case IOMMU_WITH_PT:
+		return iommufd_iommu_init(fixture_iommu->iommufd, dev_id,
+					  IOMMUFD_IOMMU_INIT_CREATE_PT);
+	case IOMMU_WITHOUT_PT:
+		return iommufd_iommu_init(fixture_iommu->iommufd, dev_id, 0);
+	default:
+		return fixture_iommu;
+	}
+}
+
+static void test_memcpy(struct vfio_pci_device *device, void *src, void *dst,
+			iova_t src_iova, iova_t dst_iova, u64 size, char val)
+{
+	if (!device->driver.ops)
+		return;
+
+	memset(src, val, size);
+	memset(dst, 0, size);
+
+	vfio_pci_driver_memcpy_start(device, src_iova, dst_iova, size, 100);
+	VFIO_ASSERT_EQ(vfio_pci_driver_memcpy_wait(device), 0);
+	VFIO_ASSERT_EQ(memcmp(src, dst, size), 0);
+}
+
+TEST_F(vfio_iommufd_multi_iommu_test, memcpy)
+{
+	struct dma_region memcpy_region1, driver_region1;
+	struct dma_region memcpy_region2, driver_region2;
+	struct iommu *iommu1;
+	struct iommu *iommu2;
+
+	iommu1 = setup_variant_iommu(self->iommu, self->device->dev_id,
+				     variant->start_iommu);
+	if (iommu1 != self->iommu) {
+		memcpy_region1 = self->memcpy_region;
+		driver_region1 = self->device->driver.region;
+
+		iommu_map(iommu1, &memcpy_region1);
+		iommu_map(iommu1, &driver_region1);
+
+		vfio_pci_device_attach_iommu(self->device, iommu1);
+	}
+
+	test_memcpy(self->device, self->src, self->dst, self->src_iova,
+		    self->dst_iova, self->size, 'x');
+
+	iommu2 = setup_variant_iommu(self->iommu, self->device->dev_id,
+				     variant->end_iommu);
+	if (iommu2 != self->iommu) {
+		memcpy_region2 = self->memcpy_region;
+		driver_region2 = self->device->driver.region;
+
+		iommu_map(iommu2, &memcpy_region2);
+		iommu_map(iommu2, &driver_region2);
+	}
+
+	vfio_pci_device_attach_iommu(self->device, iommu2);
+	test_memcpy(self->device, self->src, self->dst, self->src_iova,
+		    self->dst_iova, self->size, 'a');
+
+	vfio_pci_device_attach_iommu(self->device, iommu1);
+	test_memcpy(self->device, self->src, self->dst, self->src_iova,
+		    self->dst_iova, self->size, '1');
+
+	if (iommu1 != self->iommu) {
+		/* attach back to default iommu for cleanup */
+		vfio_pci_device_attach_iommu(self->device, self->iommu);
+		iommu_unmap(iommu1, &memcpy_region1);
+		iommu_unmap(iommu1, &driver_region1);
+		iommu_cleanup(iommu1);
+	}
+
+	if (iommu2 != self->iommu) {
+		iommu_unmap(iommu2, &memcpy_region2);
+		iommu_unmap(iommu2, &driver_region2);
+		iommu_cleanup(iommu2);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	device_bdf = vfio_selftests_get_bdf(&argc, argv);
+
+	return test_harness_run(argc, argv);
+}
-- 
2.54.0.545.g6539524ca2-goog

