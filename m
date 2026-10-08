Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54F47C0E9
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463943; cv=none; b=hxE4BqNQLG1hOMTqPpgwL0Dp1p8F7iAXw6lTGeTKX6IGjQHZuhzZpH4tZv5osP2wOufQSxr9FTfjk4XqyPP77DoBcbbq4PD+PgRuHL4MGTjbDUIg9gaywtburF/qEr96PTIrr6ZScnPAyfA1+VWEGhjo5Eya018Sr3jls4rCWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463943; c=relaxed/simple;
	bh=6dIlz9XXAXD7hMCFtpO+FQoMd6e7ys9QKDGE/4a3ZjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f01EcGGGQq0mi4k2x08iiOIbXUdu9CrkKZXFtBrm9FBog1lzQDvXhC7WJEMcRnLRMH70iMnyn/x96iNJwl1ju2mINZOLc6GfOx1CEvl/Pdq7W2ETdJL1mkMa6rtPPD/rYu7pk/vEv1BVRxNEVrl3FZGjLb2H6CFYmoDkTk4RdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TF0EHQyA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TF0EHQyA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b02a2359aso741215f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791463940; x=1792068740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8QWxVZoZeLawAHvciNRJOIulLw+ldBkjXIfdbSrmQ4=;
        b=TF0EHQyAG9PNAh4TfZGhVe5jmkKdbYRZ9BADEOSPz50nWw4hSzjBSwuuGsqkGxZQH0
         X61Mc24QbUEDLFJSd4EXqhE1Sy++eKJtItSBCGTiy08UA2xWrchqEfE0HQ0SHW5aRpqD
         H7GJF984MWbUbl6lvLNmh0GhwElU111R6+Cu2TFa7VJlSQkssVSkO13CyxG1yFTk+AdK
         xSowB7SV5vswI9YO2Lw7A0VUQLshlHUIT26gU12CrJZusKUTS+Gzgp3tA/t0ppmYLAuX
         gj/U90RJva80R/eNz4ZJF/sfRGEYWBTnN+us4gNa8TIMPSVEnif8Y5Eusk4/7L8W2JIL
         fGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463940; x=1792068740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8QWxVZoZeLawAHvciNRJOIulLw+ldBkjXIfdbSrmQ4=;
        b=WjFZ2ehji09NRjdEumSLMzyL6Nawx8VGpJ7MUGTFuAM9TsnGGGgj1oZ0wwfFfjDZEM
         0Cn5LqCSiJ2P2nBh0rKQwYUU0uxxUq/dSCM8TllKJaWgxcfrSqXKrgqFBpj2Ly/LhbNk
         Dc8rlLO96UNK5lOPgpfp2HBnffVAliO4q7QMrwe72NrKl9Sar6fn+zefaj53Fvz0VkGf
         t1htnTh7b/ErOlggtQhz5nP4piLF9iEkU+WOJF+X80srCiq3h3I9/b0NKEn56+7lKd+k
         NpF+6c65oMfcw9zrS5H+fcfc2soz6a7F1C8X9sldsCyvJXPCLnIKSK8wTFG5Ac8jz/74
         jZlg==
X-Forwarded-Encrypted: i=1; AKwUvBzmuMXQNqn0p2mAhbDrYQ3BcTYGqAsHBI6rHNib0nM/fRpa5ciBamS/PtXQEfZ5Q8Tz6m2y812ksztLXpY/z70=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFB4d6RqlPQYv5y7CFWLUXi7NrngxSrCh7y0WRphjgET6khI3h
	85S2kfGATm3Uf47cll8c4RaWa5dKCH1ZFs9U1pv5Xxd6qP72ZdmqlQfTrjP/a7iR
X-Gm-Gg: AYBFou3w1nZMdq1WGX9BjbPKWQUijvUG6pw8t7yHjCjXGxDuBCK1Oigrb5w855LZsZW
	qaxyIfPTm/hnHQ2L/ax9H8d72b4dKoeIFhDGdzL3J1hGQdyCP35LD/PVczrZhIKj2wb64rtsJiz
	SZNjvlppsddAH4PF1HWza+5sXcgeNYZCNNxOSGh60WlCGhzW/WDMsl1wwwXFJ7knHLZO955Bj2Z
	L+R5Tao3arQfcBH3APV0Efrmps7fMn8K1IENCrTu5KSc6maiBH6Km2KRG0rXtvgxmeM5uj3Zl1S
	UQRa/KTGRTKYZ0U8zzG4L/C01CLlzwkIPCWrVchASfKNHsq9+3a6LLakV4EkG3OzSmgB9bMDxXC
	K032g3nbMhy6w7V/Bd0NikHjHJszFHkvQcUZi4EFrL26+96LOqrKMsDv3KE6/hyFynhXQs6eDlg
	Ta+vs8OlRv8A1gWPYKTbQ+WJJAPlEE1pSP/SWhm5LCEGB0IECXiDlK2tQidkii6dyOgJJwoLo3w
	4KXYcI+MSWDoy5DrXLxcMViM8ZzOOCXgXyaf0559jUz+sgHWV34lec=
X-Received: by 2002:a5d:56ca:0:b0:48c:4f4d:4d6a with SMTP id ffacd0b85a97d-48c7f12dee4mr3518058f8f.28.1791463940003;
        Thu, 08 Oct 2026 05:52:20 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.41.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm10584338f8f.45.2026.10.08.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:52:18 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] iommufd: Keep dmabuf MMIO attributes in domains added later
Date: Thu,  8 Oct 2026 14:52:02 +0200
Message-ID: <20261008125206.11990-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A VFIO PCI dmabuf mapped into an IOAS gets IOMMU_MMIO only in the domains
that exist when it is mapped. A domain attached afterwards, or an
IOMMU_IOAS_COPY of the area, reads the PFNs back from the existing
domain and maps the BAR as cacheable CPU memory. Patch 1 always takes
dmabuf PFNs from the recorded phys range instead.

Sashiko first reported this on patch 6 of David Woodhouse's RFC "KVM:
Allow alternative providers of guest_memfd backed by PFNMAP memory",
which picks the batch kind in pfn_reader_fill_dmabuf() from the
exporter's memory type. This fix does not depend on that series and
combines with it: with both, a domain added later gets the kind the
exporter reports.

The mock page table has no memory type bits, so the existing selftests
cannot see the difference. Patch 2 makes the mock record, per domain,
the pages mapped with IOMMU_MMIO, adds IOMMU_TEST_OP_MD_CHECK_MMIO, and
checks the domain filled later in two new tests, dmabuf_mmio_new_domain
and dmabuf_mmio_copy.

Tested on x86-64 under virtme-ng with CONFIG_IOMMUFD_TEST=y. Without
patch 1 both new tests fail on the second domain in all three mock
domain variants; in dmabuf_mmio_new_domain, a temporary print in
batch_to_domain() showed that domain mapped with IOMMU_READ |
IOMMU_WRITE | IOMMU_CACHE, where the first got IOMMU_READ | IOMMU_WRITE |
IOMMU_MMIO. With patch 1 the dmabuf tests pass, and the other iommufd
selftests give the same results as on the base tree. Patch 2 also
builds for i386 with W=1.

Not tested on hardware that uses the memory type bits (ARM SMMUv3, AMD
with SME, RISC-V).

Changes in v2:
- Validate the MMIO check range before converting 64-bit ioctl inputs
  to native-width page indices. Reject range overflow and values that
  cannot be represented on 32-bit kernels. (Sashiko)
- Patch 1 is unchanged.

V1: https://lore.kernel.org/all/20261005143737.2915-1-parri.andrea@gmail.com/

Andrea Parri (2):
  iommufd: Keep dmabuf PFNs MMIO when filling another domain
  iommufd/selftest: Check dmabuf MMIO mappings filled from another
    domain

 drivers/iommu/iommufd/iommufd_test.h          |  5 +
 drivers/iommu/iommufd/pages.c                 | 13 ++-
 drivers/iommu/iommufd/selftest.c              | 92 +++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 51 ++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h | 13 +++
 5 files changed, 170 insertions(+), 4 deletions(-)

-- 
2.53.0

