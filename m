Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258517;
	b=t1ExSx2kOWvDbZuOY6TTZL2d5K/OiVgnMgyef0sDKammec4ZPGVGR0fHel2ar2mryNCe
	 es06o4AJ8u9YZ7x7yNLRiVJaCW+mVNFBABqiQ8MEl4og/sdbp85LcE+325BvlOiSPhGq6
	 xiHZ3/iSQh0MPyi6tr+Ju6w5m4uXUfuXgIwcyYBVgu5au6teaK1YyMVNyrne7niECgpAg
	 6M3FxYZ8mchjCgrCJE7qsXgiU3pjGDbjs6xlFS2S7VkczOqXTbiq1pvQEu1Doh9DOk9ad
	 oCxPdrKlniXCLLmspB50Gxy+JRcBNHT8UZuI9xlLyd7AWrpI9gioVhVM+CI91XRHu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ahY0zk75k+Xqzv9YF081KZ5JjY//iPjMlN2/9pUwCgg=;
	b=KJQRCAipNSoapAnRgZZ8kXn1LfJ2dRbXlObfwrghSwZwYsj7wiXbE1Ec14HvpRYWgbR4
	 FWME44biEFI8q1vU/Nqtp+Ys4rTdnFa7ENBGzUL5BKqUQJ1VQEG0VZidZ6M5cmppkBOae
	 gIEoiJEms35g+8gJXpQ4w7eAHvnpvRZK6x6S4rjZx1HZaj90a8Bi25AOWMB+57Jdue5K3
	 Vb0bnR5FPlE5DJxfTcVd2T1aYUDcPV1kBY6TwvP4MpP2btCglbYLkJYD9J508/p6H9OPx
	 25lhKfty2ZJq5IHo0c9GSx2V1mVPj0oRCRJoHBUQzV59ZQkIJXsmT2sS/y+hiogRV4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GrLbB9Ar;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83060A260D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 21:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C83060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GrLbB9Ar
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso1511883b6e.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 13:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258515; x=1794863315; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahY0zk75k+Xqzv9YF081KZ5JjY//iPjMlN2/9pUwCgg=;
        b=GrLbB9ArR4V1+UQGHPJC2beVu3ILzIYyOmjrzl2yo1PcvG1fW+7rZzGxsj86TNOORZ
         Lh22v2MmDB/+z3Et369oZ3Np7P769niHsMZpzowLFPObqZy/xC3OpMk2oxPI33QmT3mW
         /aTAVEeUbBf4Tdiq0+BaatnlKGWQ9rv3BJtxQZBO5kJyyW82prH3oD5+ewV2Elo/qxww
         YOippjGqKzKqTGxJq8YxJerPNtMgn+3BpM1bzxypGN/frtdyWjTHklyC9HLXoF64OmF7
         Sn/POsp+gmXB19EFwjQmXCx1XcbsHcrkBhmNa8jYDh37t/3tSQgNam4DYCGpAHBojQXT
         u/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258515; x=1794863315;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahY0zk75k+Xqzv9YF081KZ5JjY//iPjMlN2/9pUwCgg=;
        b=LVei2twgsXv/VxGWoZ9GNF3iRY1z0FF9wXtVYQlxM0jMFXmtvCrAoq0qU1fe7S83Lx
         3zfjksILvA3DTEA9qQ0c4dggcyCd3pVAmD5eLR/9No/MtzwjIz9n+WUDwpEuaEMXQZDQ
         atjhKI7snIdAM95vFOEoiwG0pGizWdHwprsnHRviwZl1rN7FKU3T6YuVE9cc0YLBd7E2
         C6goNUs0OcNDpMJwMwZOoUjgmF8aKzlgOul5zLtUz3aDJEKlJ18jvKtjA0Zslidsy9ht
         sfK1Bqm4hYv/ZdXffi0+zBJo/AextRiOzHyXqIwHImgRCLAZWRo/gKwe2yqVmbFuBWQi
         PHaA==
X-Forwarded-Encrypted: i=1; AL+hErEZ1z8Cl8gIgK9/vhjP0QKZHyDStOrHGdrcg3mGItCAEmPR9OQ2KawSePj8xUiEbz0Qjs0udGRaaQmJ9H60R3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pc2OTS4nheKfVmviKKjSazEB1fDGO+ficV1e5TmQpMZBU2Yk2
	1jkN2nrzlO3u1bwOCnGhH9vEJbJF4m/xMsxLnK5qj2GE+vxPE7BbYszYVYWksYpFKR0Du+pt18/
	kuwXLtG6aBB9ydA==
X-Received: from jalv33.prod.google.com ([2002:a05:6638:35a1:b0:620:1cc4:5d6f])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1381:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5683cdc8174mr673052b6e.56.1794258515156;
 Mon, 09 Nov 2026 13:08:35 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:28 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109210833.1250548-1-dmatlack@google.com>
Subject: [PATCH v3 0/5] vfio: selftests: Automatically detect the IOMMU mode
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

This series makes the VFIO selftests library automatically detect which
IOMMU mode to use, rather than hardcoding iommufd as the default, and
makes tests skip, rather than fail, when the IOMMU mode they need is not
available. This was suggested by Sean while reviewing the KVM selftest
irq_test [1].

iommufd is an optional feature, and VFIO's iommufd support additionally
requires CONFIG_VFIO_DEVICE_CDEV. On otherwise functional kernels that
only support the legacy VFIO container, the VFIO selftests currently
fail with an unhelpful assert:

  tools/testing/selftests/vfio/lib/iommu.c:448: Assertion Failure

  Expression: iommu->iommufd > 0
  Observed: 0xffffffffffffffff > 0
  [errno: 2 - No such file or directory]

irq_test avoids this by probing for the IOMMU mode itself, but its probe
picks iommufd whenever /dev/iommu exists, even if VFIO device cdevs are
not available.

Patch 1 makes iommu_init(NULL) pick the most preferred IOMMU mode that
is available on the current system, and drops the global
default_iommu_mode.

Patch 2 adds iommu_mode_is_available(), iommu_mode_unavailable_msg(),
and SKIP_IF_IOMMU_MODE_UNAVAILABLE(), and uses them to skip tests when
the IOMMU mode they need is not available.

Patch 3 makes the VFIO selftests library print the names of all known
IOMMU modes when passed an unrecognized mode, and the names of the
available modes when a test skips because the mode it requested is not
available. It also adds iommu_mode_names_all() and
iommu_mode_names_available() so that tests can print both lists.

Patch 4 converts irq_test to use the VFIO selftests library to pick the
IOMMU mode, and drops its probe_iommu_type().

Patch 5 lists the known and available IOMMU modes in irq_test's help
output.

This series is based on vfio/next (vfio-v7.4-rc1).

Testing
-------

Tested in a QEMU VM with an emulated igb device behind an emulated Intel
IOMMU, bound to vfio-pci, on a kernel with CONFIG_IOMMUFD=y,
CONFIG_VFIO_DEVICE_CDEV=y, and CONFIG_VFIO_CONTAINER=y. To simulate
kernels with fewer IOMMU modes available, /dev/iommu and /dev/vfio/vfio
were deleted in the VM:

 - All IOMMU modes available: All VFIO selftests pass. irq_test -d
   passes using iommufd. irq_test -h lists all five IOMMU modes as
   available, and irq_test -d -t bogus fails and lists the known modes.

 - Only the legacy VFIO container available (/dev/iommu deleted): All
   VFIO selftests pass. The iommufd and iommufd_compat variants and
   vfio_iommufd_setup_test skip instead of failing. irq_test -d passes
   using vfio_type1v2_iommu. irq_test -d -t iommufd skips and lists the
   available modes, as does irq_test -h.

 - No IOMMU mode available (/dev/iommu and /dev/vfio/vfio deleted): All
   VFIO selftests and irq_test -d skip with a message explaining why,
   and with well-formed TAP output. irq_test -h lists no available
   modes.

Also tested with CONFIG_VFIO_GROUP=n (cdev-only VFIO):

 - All VFIO selftests pass, with the iommufd variants running and the
   vfio_type1* and iommufd_compat variants skipped. Without the VFIO
   group check added in v3, the iommufd_compat variants fail instead.
   irq_test -d passes using iommufd, and irq_test -h lists only iommufd
   as available.

Changelog
---------

v3:
 - Require VFIO group support (CONFIG_VFIO_GROUP) for container modes,
   including the iommufd_compat modes (patch 1) [Sashiko [2]]
 - List the available IOMMU modes in irq_test's help output, alongside
   all known modes, and when the requested mode is not available
   (patches 3 and 5) [Sean]
 - Simplify the -t help text in irq_test (patch 5) [Sean]
 - Make the unrecognized IOMMU mode error easier to read (patch 3)
   [Sean]
 - Rename iommu_type to iommu_mode in irq_test (patches 4 and 5) [Sean]
 - Skip vfio_iommufd_setup_test when iommufd is not available (patch 2)

v2: https://lore.kernel.org/kvm/20261103002205.3348519-1-dmatlack@google.com/
v1: https://lore.kernel.org/kvm/20261029221710.1871112-1-dmatlack@google.com/

[1] https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
[2] https://lore.kernel.org/kvm/sashiko-outbox-194380@kernel.org/

David Matlack (5):
  vfio: selftests: Automatically detect the IOMMU mode in iommu_init()
  vfio: selftests: Skip tests when the IOMMU mode is not available
  vfio: selftests: Print the IOMMU modes when a requested mode can't be
    used
  KVM: selftests: Use VFIO selftests library to pick IOMMU mode in
    irq_test
  KVM: selftests: List the IOMMU modes in irq_test's help output

 tools/testing/selftests/kvm/irq_test.c        |  32 ++--
 .../vfio/lib/include/libvfio/iommu.h          |  43 +++++-
 tools/testing/selftests/vfio/lib/iommu.c      | 139 ++++++++++++++++--
 .../vfio/vfio_dma_mapping_mmio_test.c         |   2 +
 .../selftests/vfio/vfio_dma_mapping_test.c    |   4 +
 .../selftests/vfio/vfio_iommufd_setup_test.c  |   2 +
 .../vfio/vfio_pci_device_init_perf_test.c     |   2 +
 .../selftests/vfio/vfio_pci_device_test.c     |   8 +-
 .../selftests/vfio/vfio_pci_driver_test.c     |   9 +-
 .../selftests/vfio/vfio_pci_sriov_uapi_test.c |   4 +
 10 files changed, 205 insertions(+), 40 deletions(-)


base-commit: 076d7e989cb69f6ded7d60f2a080eb909930061b
-- 
2.56.0.506.g506a7eabc5-goog

