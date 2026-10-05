Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73204AC17E
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211070; cv=none; b=hCi8scYe/Sduj54Wgr2VVDb0G4L5lxZ9vgDcAa96FoD5RakNcS/V6saSLr/b7K9DKyHGxBMRuR944SlQjX9mn4ZevqDe+MvDIEBphDMcS6xyBsqhnJo8X+nhyokbRfMbuqX8QZNWsg5bkIFoawAUTMSV3bKLrPQcDeZDI9oqwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211070; c=relaxed/simple;
	bh=XMLrGbedguO2MBiVSIISwnSja9N+qK6r3eVRTxmWl6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3hjqTPpvSlABa0lm0NiO3YRF5JUnHrHigscNWiZZS8rv89lbZcxltbVsTyZf0WTFZXU6qn9rVBQ0MPELx7OC1YNS5TSOwiwemQwT45A1wsizzQ3L5/wKY3PB0Rng1QLd9DC1M6m5EEqn6UcUmRP7+bpDqZ9Fy9HU+vimGtU7cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLTLz8uq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLTLz8uq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so19583325e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211062; x=1791815862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiX4TTvsWBCxTAoZ5BYlS69N5ifB0LlN73jBhn7IiHk=;
        b=LLTLz8uqkaMPbd5XLEcKvuKC6VY/c4WLmE0VDO8sr+aOK5rJraTJa83bwR7iFi9zQh
         mA+4iZf7iVoCW8b+HCk73jAR+o+FYbWzdkQ3yJrMMucVkN0Hv0qC1uVMyqf3QmE3NfuH
         B8iSWOMIfqOeJJOPGm8AIp6bTrFOd+K//Tu5dQkqVSygDqJdAbiiJ0e4gTJgRhgwCZsJ
         92Cp58EyVp2tX9NoNppTKOz5O+A9gfe8lB4yPY8B3qech/hgO3M4KFbtfyBFxAijBz8R
         c+xs0AcY/kIUxy8rBqvwO3BGD4JOFMzuBYPuqUbdB/rlR4LqwVzFrp1RMNR/vXlA9Qxz
         Ajcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211062; x=1791815862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiX4TTvsWBCxTAoZ5BYlS69N5ifB0LlN73jBhn7IiHk=;
        b=ct8O1KXHlc8f7U0LBklkpsLMgcoNRZUZ4W0gL2PkfEt984iaxzHuflQgrGEm7OqqPu
         WzydhlRawqmrE50O2p1Z9iOodsoX0yOWzy0ytsLe4cHLM6TFS7tpA52qt/WW04c2IiXT
         uulXxi/j5F+uYib1fRhx+vjONgqmDc96QBVFSzpBmaIOLW+KjavRbGqvYOdN3aLcqB24
         4uG8C7Ww4vTITaFFq3rgSR02MLAQJlRgfD1ynR2pB8OB+Z5BZqcsRibtkYgeVf8flbx9
         gwJBj8DTSFXXw8bKfZ3HAZ8e6MtWGUOKHXRBZtz4kM2ra8XamNkThRPuV56/uaLoc17q
         +CBg==
X-Forwarded-Encrypted: i=1; AKwUvBz+S6qV1EKybA/LyG4NqxVuGSPopiSiQIvYHTdzwz6fD20ZLMNmeDI9Jt7F8/M4mth/XPBEEXkI8BeoRStrmx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mAePD8voMK0/+eP1mEI1bCIYaq3uMSMI2w5uQMTz5393QFUnKJ
	U9q1HpUIr4WxnhJ+dT4uOSlvkhuiXRD9SavPKBYVPspSbLvIIkaViXOZbcjWnZVumJM=
X-Gm-Gg: AYBFou1+CV3umXAL9MdA0pwUq/bObiouZHfq8z2izgLq0UDuz6s7a0Kq9I1EX9O/pGb
	nRX8oB6C0J06nIclRfhHDZaKVxSedGQI2VnqsnCPDcXKovMu/xz60dMLy+lZC/es70Dx/lVIykt
	ij0GG2bVX9Ex5CJxL+h9Hl9NPEvocIdwrCDt/09bMkISkkxbWNEAItYi5GGMlSKeGHWq1fFdCEV
	jfS9TYFoVMa40pxARBS30HcoAuzC7qeGhloVKfUBfYlpcfXnmDESoT0akS04vIhIklBsmPpRpyh
	kbCupy0LLvQvb7sZ4nSvt7D3jWd6jUzRKMIQOd0O2BPHCcquLfbORrkCGSBu24xBoKS4CAWC6KY
	uglTVtmN5vaBrds52jI21opGnycrYhqwG+xtbLKiIvvUCKenpybxt/SJy6lllt8EwwmIlFn+C3i
	6RkQSNQEmPZ/lEWIPVfOPqjqUHyyjKXevqX+YkfFmoU19gyR6MkjRxyTeQJOOg3KvadX2ZOYGC1
	BZtICbPFqjSYbR/VLN9EEJ1d5RRFD43UF5pnlBL/rfB+A0e
X-Received: by 2002:a05:600c:37c9:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a1680f4309mr117560825e9.29.1791211062322;
        Mon, 05 Oct 2026 07:37:42 -0700 (PDT)
Received: from andreayoga.localdomain ([80.188.242.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm348555785e9.3.2026.10.05.07.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:37:41 -0700 (PDT)
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
Subject: [PATCH 0/2] iommufd: Keep dmabuf MMIO attributes in domains added later
Date: Mon,  5 Oct 2026 16:37:34 +0200
Message-ID: <20261005143737.2915-1-parri.andrea@gmail.com>
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
IOMMU_MMIO. With patch 1 the dmabuf tests pass.

Not tested on hardware that uses the memory type bits (ARM SMMUv3, AMD
with SME, RISC-V).

Andrea Parri (2):
  iommufd: Keep dmabuf PFNs MMIO when filling another domain
  iommufd/selftest: Check dmabuf MMIO mappings filled from another domain

 drivers/iommu/iommufd/iommufd_test.h          |  5 ++
 drivers/iommu/iommufd/pages.c                 | 13 ++-
 drivers/iommu/iommufd/selftest.c              | 90 +++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 51 +++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h | 13 +++
 5 files changed, 168 insertions(+), 4 deletions(-)

-- 
2.53.0

