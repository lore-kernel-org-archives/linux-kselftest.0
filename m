Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D139361940
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 00:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785889265; cv=none; b=HTYdNp0dhj82a0b2LJT9YXZLpZ96PoHC/feQpH/WbsATwE4JqOVU6NYkaoKwwzfNnn/8pZcUmn3peuB4KsYVTw8uWtpVWZiitKEPpL1ORi+a3s5XUMxQwSKZUS9eo0o5zLlhnv4PaE3iRSPbLEk7Xx56EzD8z3Ope+EnzQCtKHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785889265; c=relaxed/simple;
	bh=sLFbKfSOzTOgEZoliwMAFgQy/seHdKaiywfAzh200YM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sL/OaaP7SDCgH9OB65ZVMZqeRLdTYJvGYL1llb8gny1paaiIflYZ6kx3ywlWKkD1251/xdzZOS9gRyi6BhKX8n3yRg4dGjkm5fnef7fYlSjP+NQoqvQ9Zpx+aWx45MfV0LnPH4MGv4c2Pv8cPS81SMjYBrMWGZuLcoDl9tNve+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=twK/V5y2; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="twK/V5y2"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so493935a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785889262; x=1786494062; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pr3cQnrTGmUiECdXxfqO/gRSt1KNbd++por5s4HYq+A=;
        b=twK/V5y2h9UpKMq2UkRBnA8uzNDlmgdjgOv+hA+YbWMh8/MYtE7iq3kEBY4XuQ3jHf
         behakTjZunPYneevbcyuw5y+nZJGXA7todR6vP8DbpHoIsKA8wZ2wfgSngvRwWg5+GLq
         VgeF9MNLcLTFqbblhFdjPSV312kvo6wjSfAVnoDuczTnO1jzKhrRqZjBTjEonu8iqHc4
         OR1ZSgv/UuVac/dqKot8X847jxN/nrRY4Nhm5QwpxBl7xTHziaxYb4OUpyLJHS6ReMeG
         y366XbysA+tZGbrEzdog/ZC4aqmg/7rVl0/uwpIzpodxG+Go6AYTu4fWF8NQF1x8CIy3
         cfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785889262; x=1786494062;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr3cQnrTGmUiECdXxfqO/gRSt1KNbd++por5s4HYq+A=;
        b=gES/xwgBD7VEWszoerWM5NHPoEm4EjIp+QDhc9zsYF/Q8nsRC1U0l9lMoa1ZCqtT2p
         xu2KDMKkPnrqSM8xXIzaQSrFHt7d50KDnCuN8Qn4JicXyBGhucYUS7ZvJjTAq1eQ+T7x
         t25M37RwYcfZNE4QZ0uj2YP9tIN5F65/doyrEHt8i0xkYFOQqTcteQ7h4lHAGkqPE8Zt
         DjsinITIOdw4V/TbDbbbXJ5MRiNiOxbs+rIsJrZ5/E8zl8i0KbEV4ctIn4954GUFo/Zo
         VyK3aSZ0tAzLoN08vSTZWkh+c+KihGpKNX0lxUK4GgaSsQ9IEtJLKSmKlVOhBAA+QyHD
         W9ow==
X-Forwarded-Encrypted: i=1; AHgh+Rp9QBlS6VAS4YkwRbrtMxX+ilbykfi1GiFEgQyNZB0yrX2T9sXg+sLMdkYBjcn4j3s8Yl3WMJNdv2FQNAWoass=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYhI8JQw3fZig/m4a1RejVqVa7c4Km2RVDXs7tZnZqwBumMm9
	+jY7kzImo4y60bJzLV2D8hGFKT0pP9f4a3xjOqDYQNPP9iFjdcGm3FaloA1FgsysQn7iHdAxUoI
	G/QP/QBm9
X-Received: from pjbgn23.prod.google.com ([2002:a17:90a:c797:b0:38d:ed16:8b30])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dca:b0:38e:9045:bac0
 with SMTP id 98e67ed59e1d1-3903c55928emr2660916a91.5.1785889262333; Tue, 04
 Aug 2026 17:21:02 -0700 (PDT)
Date: Wed, 05 Aug 2026 00:20:57 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOmBcmoC/2XQS2oDMQwG4KsEr+vih2xZXfUeoYTaVieGNi4zx
 aSEuXs9oQuHWUro+5F0EwvPhRfxcriJmVtZSr30Qqung0jn98vEsuTeEEYZr1ChLFM8NXuKIIE
 0QdJg0SbR579n/ijXe9jxrdfnsvzU+fee3WDr/qdoNaQ0kEo6z8jGoU9Jv061Tp/8nOqX2GKaG
 ymM1HVK2inLOUcKcUf9QI0Zqe9URdbZEOmQYUdxpGGk2Cl47ZNFcEh+R8NIaaSh076ssd6gicA 7SgO1D2+i7VaGHHww/eWPdF3XP/iewSjLAQAA
X-Change-Id: 20260707-igb_v3_b4-49194c14373c
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785889261; l=5064;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=sLFbKfSOzTOgEZoliwMAFgQy/seHdKaiywfAzh200YM=; b=QRSXirJpRY4w5NU9OHqeukPHuvr0rH832rQcFR2dXn3ywzrgll43a16zecLK4r/PMLpiaglvm
 xAOsW+JHxyRB3MHG4xfgc9k8OGcTNE5aJkIsriDsHbhpoz2BzW0iWDU
X-Mailer: b4 0.14.3
Message-ID: <20260805-igb_v3_b4-v10-0-9c86dc849c0d@google.com>
Subject: [PATCH v10 0/3] vfio: selftests: Add driver for Intel Ethernet
 Gigabit Controller (IGB)
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

This v10 of a series which adds a VFIO selftest driver for the Intel
Gigabit Ethernet controller (IGB), specifically targeting the 82576
device. IGB is fully virtualized in QEMU, making it suitable for running
VFIO selftests without specialized hardware.

v9: https://lore.kernel.org/kvm/20260730-igb_v3_b4-v9-0-9e4d8682437e@google.com/

Version 10 adds an assert in the IGB driver to prevent DMA transfers
smaller than 60 bytes, avoiding out-of-bounds DMA writes caused by
hardware padding on short transfers, and squashes the recovery logic
(previously Patch 5) into the main driver patch to keep the driver
self-contained. Also add some logic from Alex to correct the ordering of
Tx/Rx queue setup.

This series applies on top of linux-next, but the VFIO selftests don't
build without this patch which fixes a compile error for the test
fixture:
https://lore.kernel.org/linux-kselftest/20260630213341.1664345-1-dmatlack@google.com/

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

v9 -> v10:
- Add assert in IGB driver to prevent DMA transfers < 60 bytes (Ethernet
  minimum payload size) to avoid memory corruption from hardware padding. (Sashiko)
- Squash recovery logic into the main driver patch to make the driver self-contained. 
- Set per-queue enable bits _after_ enabling global queue bits (Alex)

v8 -> v9:
- Enable Pad Short Packets (PSP) in TCTL to support transfers < 60 bytes. (Sashiko)
- Correct misleading comment about interrupt delivery in Patch 1. (Sashiko)

v7 -> v8:
- Rebase onto linux-next branch. (Alex)
- Implement retry limit in vfio_pci_device_reset(). (Alex)
- Carry David's reviewed-by tag onto the patches that haven't been
  touched since v6.

v6 -> v7:
- Allow the driver to be used on any architecture. (Alex) 
- Fix regression in reset logic for the physical device. (Alex)

v5 -> v6:
- Retry on EAGAIN during device reset to handle transient lock contention (Sashiko).

v4 -> v5:
- Reordered igb_remove() to reset the device before disabling MSI-X (Sashiko)
- Refactored hardware reset logic into igb_reset() helper.
- Simplified reset completion check to usleep + assertion instead of retry loop (Sashiko).
- Allow arbitrary test data by enabling Multicast Promiscuous (MPE)
  and Broadcast Accept (BAM) modes (Sashiko).
- Fixed igb_send_msi() to use MSIX_VECTOR_MASK instead of magic number (Sashiko).

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
Alex Williamson (1):
      vfio: selftests: Add helpers to re-enable interrupts

Josh Hilke (2):
      vfio: selftests: igb: Add driver for Intel 82576 device
      vfio: selftests: Retry on EAGAIN during device reset

 .../selftests/vfio/lib/drivers/igb/e1000_82575.h   |   1 +
 .../selftests/vfio/lib/drivers/igb/e1000_defines.h |   1 +
 .../selftests/vfio/lib/drivers/igb/e1000_regs.h    |   1 +
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 585 +++++++++++++++++++++
 .../vfio/lib/include/libvfio/vfio_pci_device.h     |  15 +
 tools/testing/selftests/vfio/lib/libvfio.mk        |   1 +
 tools/testing/selftests/vfio/lib/vfio_pci_device.c |  42 +-
 tools/testing/selftests/vfio/lib/vfio_pci_driver.c |   3 +-
 8 files changed, 647 insertions(+), 2 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260707-igb_v3_b4-49194c14373c

Best regards,
-- 
Josh Hilke <jrhilke@google.com>

