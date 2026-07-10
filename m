Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B80B3B3C18
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721212; cv=none; b=Ko9ww0Zme3aN+O+glqE1HjjE8vMC3F5ciPJr5zZS7on4ehi6hVMo/5BED/tziQRbRAKoOeAOoKU3QwTRLOODYrIJAv2RX1ghPOXGEUr6vENlHIbzNR2n2FuDNdIl234jO2TatNSauFa4JuAuNPKOpu4yB/Opwyy2KXI2aV8fPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721212; c=relaxed/simple;
	bh=eM3zNCOCoY8UF4860MpdQcp0pxMryLCCOH6H0+uY9oo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i5KD+pT1eIGcTQPiZRbebbJ8wcq9ZHSgBqzyOMbaNPZUjOOEbpN/pyQtPib7lT5a6j1BfSKTu/1QWW9UJ16iMz/0ADcHfxuWR/fBkzVFMRHhYVy22koONRtP5LXytnBqzhol1/Ng2JbJRpBnFMWgfquvSlmqY/MKLqw9eXPmwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KX6hcUaC; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KX6hcUaC"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6bbd0afffso25232805ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783721209; x=1784326009; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvCdp3+OIvvItFyYEFsSQlhE/xIt0HKNcsHjOtb7s/k=;
        b=KX6hcUaCb+lBGJswqMyCFKcgzhaIANV8O15pxUro8j4/vqxP7vw+f+TP6F5iYDmqnp
         PdlToLTiTqzYF5jAc98HlfYN37Gc1odbnjCg7ODOmP5Otnj+0S9mdMPIUWEtPrU8m/vk
         Dedj0Q4TKdrJi8nYd/GbH5wMXkJHGDS8wu0DYnHi7R1x37+S8QtSPCs+nk2MzNiNk1wD
         2gRUBfz/Tec0qqiyAd++ko/GDYvTfifubX9TCtGiK64gGjnQRkJdXMGXSMAcpVfu22cF
         T5Y7/BrLcfNujw8Ig4BO1zfb/on2HcxaWDP92SS5843h5LcgLPr1cjvt8DIXPbCliIVW
         Tr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721209; x=1784326009;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvCdp3+OIvvItFyYEFsSQlhE/xIt0HKNcsHjOtb7s/k=;
        b=gwMO81DLPxd1C+8Lfi0kv7njELtWg9wgOru7EZ8/keKlbZJDY6CtdG32eY0Eg+gm5H
         5nuMgJMTqlGOO/iiiPX6WlvFldOlzJMpeFMgCB2w8v6hpVIAtANEhA92Rc8cJRThRNJy
         fUTVq90lzaWoYzMVRb/YefLrgZ0TCk8k6rzfO44RDTCb9NXfgf9gnXB7IKwrVR9pcgyd
         vqzKKq8ljRBG6F2E/X8YLIYBVJ+SXqAa77UeHbCnxVPaiF+QvSk2VUVUGxi47tbxMehM
         FltilB4wqwJK/RkGuWTPfwy3YCgjfk+ofmKk+HwxKo9ScFsI/QkYh2W7yw4ikqM2Cuf9
         Dj+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3/sMx1KEdJ2nk+B2EuHkjAteTrlzQtXxynHfkT8wcJxl5HH49YoVGKfWrJ+xfeTtZinFESgI/9Pvh9xF75Us=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb2/z9EQMyenoYTScZMk/whebJo2UfuYzYjseDjUZUn6Aifl7m
	ipvf2jZLEIXJatuoers+7L/ZA8+jtyDqHmp2eXONR1Om7yIxkk3UvRNmm35hE4C2EffAgDe6OlO
	JlCBPnNyy
X-Received: from plbky5.prod.google.com ([2002:a17:902:f985:b0:2cc:fa10:8700])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b0c:b0:2c9:cf41:adf9
 with SMTP id d9443c01a7336-2ce9f39002cmr8239875ad.47.1783721208640; Fri, 10
 Jul 2026 15:06:48 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:06:44 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPRsUWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNz3cz0pPgy4/gkE10TS0NLk2RDE2Nz42QloPqCotS0zAqwWdGxtbU AC5jwB1sAAAA=
X-Change-Id: 20260707-igb_v3_b4-49194c14373c
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721208; l=3562;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=eM3zNCOCoY8UF4860MpdQcp0pxMryLCCOH6H0+uY9oo=; b=887vrHIEm8X+p85GtP1tQKspPCDz63I0iOkth209UUjQPIb18ZF2qjU2WItmUe+jLrsj9hJLn
 SOSbwjlnGSfCLodGmIOSGdKPmpO1bmJjsmcPuZwGhMGhT9btfrVd+hZ
X-Mailer: b4 0.14.3
Message-ID: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
Subject: [PATCH v4 0/9] vfio: selftests: Add driver for Intel Ethernet Gigabit
 Controller (IGB)
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

This v4 of a series which adds a VFIO selftest driver for the Intel
Gigabit Ethernet controller (IGB), specifically targeting the 82576
device. IGB is fully virtualized in QEMU, making it suitable for running
VFIO selftests without specialized hardware.

v3: https://lore.kernel.org/kvm/20260708-igb_v3_b4-v3-0-1272650ca614@google.com/

Changes for this version address Sashiko's legitimate and false positive
comments. See changelog.

Testing
=======
- VFIO selftests builds clean at every commit
- vfio_pci_driver_test passes using IGB driver + QEMU. Use the following
  command to run the tests:

  vng \
  --run arch/x86/boot/bzImage \
  --user root \
  --disable-microvm \
  --memory 32G \
  --cpus 8 \
  --qemu-opts="-M q35,accel=kvm,kernel-irqchip=split" \
  --qemu-opts="-device intel-iommu,intremap=on,caching-mode=on,device-iotlb=on" \
  --qemu-opts="-netdev user,id=net0 -device igb,netdev=net0,addr=09.0" \
  --append "console=ttyS0 earlyprintk=ttyS0 intel_iommu=on iommu=pt" \
  --exec "modprobe vfio-pci && \
          ./tools/testing/selftests/vfio/scripts/setup.sh 0000:00:09.0 && \
          ./tools/testing/selftests/vfio/scripts/run.sh ./tools/testing/selftests/vfio/vfio_pci_driver_test"
--------
Changelog:

v3 -> v4
- Enable MSI-X mode in GPIE (Sashiko)
- Fix hardware initilization order to avoid race conditions (Alex/Sashiko)
- Add memory barrier to prevent speculative reads (Alex/Sashiko)
- Clean up stale references in commit messages and comments (Alex/Sashiko)
- Add a comment to address software/firmware semaphore (Alex/Sashiko)

v2 -> v3
- Poll reset bit and document the required wait time (David/Sashiko)
- Fix the logic for enabling PCI_COMMAND_MEMORY (David/Sashiko)
- Fail the test if autonegotation fails (David/Sashiko)
- Handle endianness conversions (David/Sashiko)
- Use real IGB headers at the start of the series (David)
- Add E1000_TXD_CMD_IFCS to the TX descriptor command word (Sashiko)

v1 -> v2
- Removed the chunking loop in igb_memcpy_start() (David)
- Removed redundant writes to status_error and hdr_addr (David)
- Include official IGB header files (David)

Signed-off-by: Josh Hilke <jrhilke@google.com>
---
Alex Williamson (8):
      vfio: selftests: igb: Use PHY internal loopback on 82576
      vfio: selftests: igb: Use advanced TX and RX descriptors
      vfio: selftests: igb: Program MSI-X interrupt routing
      vfio: selftests: igb: Extend memcpy completion timeout for line-rate hardware
      vfio: selftests: igb: Disable PCIe completion timeout retries
      vfio: selftests: Add helpers to re-enable interrupts
      vfio: selftests: igb: Factor hardware programming into igb_hw_init()
      vfio: selftests: igb: Recover after DMA-read faults

Josh Hilke (1):
      vfio: selftests: igb: Add driver for IGB QEMU device

 .../selftests/vfio/lib/drivers/igb/e1000_82575.h   |   1 +
 .../selftests/vfio/lib/drivers/igb/e1000_defines.h |   1 +
 .../selftests/vfio/lib/drivers/igb/e1000_regs.h    |   1 +
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 554 +++++++++++++++++++++
 .../vfio/lib/include/libvfio/vfio_pci_device.h     |  14 +
 tools/testing/selftests/vfio/lib/libvfio.mk        |   1 +
 tools/testing/selftests/vfio/lib/vfio_pci_device.c |  22 +
 tools/testing/selftests/vfio/lib/vfio_pci_driver.c |   2 +
 8 files changed, 596 insertions(+)
---
base-commit: de61419bb27f985cb878b19942a55b026c9c865a
change-id: 20260707-igb_v3_b4-49194c14373c

Best regards,
-- 
Josh Hilke <jrhilke@google.com>

