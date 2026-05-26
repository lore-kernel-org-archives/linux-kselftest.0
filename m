Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244693E2ACB
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839684; cv=none; b=OX+ZVkoGVxDHy3TyxsJ6kOPllJ5uBaELOs3j8+xY9LI+cKC5NI19M9xRvwKKNXO4AodJdCJuVssVPPRvpAEIpJe0jICK125kQyJxyiLrtAH4Qb5i4ATjQRgadAHOLPOnu4ZYnVgFxercQC6zwdG/IpL3AK7vqJZGnkeGK4ZVqFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839684; c=relaxed/simple;
	bh=9QWShLCg+biAKruenPVCu4t8KlGA/YVrnPuJYqidxP8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nlORA3jRhRopAGXCpkdsxoVBP3w4jFdZkQ9DNl2d2E8O9bWr20qXXc1MbouHmSvyR3BVWrYGlBr4EcQcSYuEPIC+QdbTBnq4VpMnv4XDYD/7jhsQgDu4UpIYz6YWjwnX/8ae6nzyK2ihtDTwAvSkhkzLom5jIaadZlEZH6ZtmaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wFAlLqpl; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wFAlLqpl"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c829366cf25so14553644a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 16:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779839671; x=1780444471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eaxrSKFqGBxNoB11ICKwv8puvUXJxfWCmED1lIq2/fE=;
        b=wFAlLqplgdO0zLjNokWOXzKRgWMq8hIhylqQTypa2t6+Khc4DRPpLMoUE/JoVjX3ut
         A3ZVitGvwRfgiENJmQ3WD9eIPpoXCYazjpcAt9DYJpI64lZWVc1gXo20ttFybZBP9fbV
         pWjK3p/STI5MOXd/4c4TiL8wtOyfrABYhrFnYzhKZ3jwiHG2QnF59hqHWD6XSSabvkC8
         RnRO60/N5Iw71NA9lUiiNYPVwSzdWBfUrFxCCeW3vwLTIK7paZjU4Sgh2ZHMR49AdENx
         22tAIp9KfDnRT+KHXIRU9a5qFJFfcf18iukpSNoPCpqOJSoc2XeE18tmoISiIt/XGG3u
         d1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779839671; x=1780444471;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaxrSKFqGBxNoB11ICKwv8puvUXJxfWCmED1lIq2/fE=;
        b=SrDBo+8HVdwwwDYAsHWtL39nfa/twneqFLUqPyHTzYM5CoabDVNdyalBp0DYCh5BYO
         fClO66UzpB1LOXQuuSt3Va0+QeT+fZtjg1jeo2TD1/0bzjrncOO55Kx2+0lL5yxcd7GE
         BhHFCQA4/5IXiWQIkPJItsLFNvQ+zSG1rYgFjHapyI23TjaLyrwenTQcR8Fyz3FNh8dg
         L/TTw20cw67a1R7RTC6nO2vYVQHuOK+59CvLzwrMew9UxG0GfPpYWhFuJmcKPAyRLi8H
         rsLTq/ZyTly7btTRj1+JglVWXxMBkej9NumZm0X9VN7QI47W3LMCn7iHl2W+UCXGQEjX
         7Xug==
X-Forwarded-Encrypted: i=1; AFNElJ9+VkUNjygaG7OXgNybPujW5bVBkpk3fxrEY19fwyrnLnUYRskD2xQ8r9N2zl+NBXW8f6SxPfkalBos5Vbz6Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGGUj/aP7RLoH94afFcAfNTEeMoqzm9l1Ggw1Nw6sbHJDR99pe
	VNIcgss0aGH8i0E1DewoeEf0OXhqiWxviLUl5YBPCSpf5wsxEh735mv9orroNUXVmCoBtgUgP5V
	hNdK2vnD9
X-Received: from pgli31.prod.google.com ([2002:a63:131f:0:b0:c82:3bf0:91df])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244c:b0:3aa:ec28:edc6
 with SMTP id adf61e73a8af0-3b328ebdb67mr22169975637.39.1779839671206; Tue, 26
 May 2026 16:54:31 -0700 (PDT)
Date: Tue, 26 May 2026 23:54:07 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526235417.2058313-1-jrhilke@google.com>
Subject: [PATCH v2 00/10] selftests/vfio: igb: Add driver for Intel
From: Josh Hilke <jrhilke@google.com>
To: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"

This is v2 of a series which adds VFIO selftest driver for the Intel
82576 Ethernet Gigabit Controller (IGB). This device is emulated in QEMU
and is also ubiquitous on many systems which makes it a good candidate
device for running VFIO selftests.

v1: https://lore.kernel.org/kvm/20260511211839.2781731-1-jrhilke@google.com/

Major changes in v2
===================
1. Patches 2 through 9 add Alex Williamson's series which adds support
for the physical device since v1 only supported the QEMU-emulated
device. 

https://lore.kernel.org/kvm/20260515220330.565792-1-alex.williamson@nvidia.com/

2. Patch 10 adds the official IGB header files to the driver, which
eliminates duplicate register definitions.

Testing
=======
- VFIO selftests builds clean at every commit
- vfio_pci_driver_test passes using IGB driver + QEMU. Use the following
  VNG command to run the tests:

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

Future work
===========
Modify QEMU's implementation of IGB loopback data transfer to be
asynchronous. Alex noted that QEMU's emulation of transmitting data in
loopback mode is synchronous, i.e by the time memcpy_start() returns,
the data is already in the Rx queue. This won't work for testing
continuous DMA (memcpy) across Live Update + kexec.

One solution is to simulate the line rate in QEMU. This would allow us
to slow down the rate of DMA, so that it continues for the duration of
Live Update.

Assistance
==========
- Claude Opus 4.7 with additional assistance from GPT 5.5 for Alex's
  patches
- Gemini 3.1 Pro Preview for my patches

--------
Changelog:

v1 -> v2
- Removed the chunking loop in igb_memcpy_start() (David)
- Removed redundant writes to status_error and hdr_addr (David)
- Include official IGB header files (David)

Alex Williamson (8):
  selftests/vfio: igb: Use PHY internal loopback on 82576
  selftests/vfio: igb: Use advanced TX and RX descriptors
  selftests/vfio: igb: Program MSI-X interrupt routing
  selftests/vfio: igb: Extend memcpy completion timeout for line-rate
    hardware
  selftests/vfio: igb: Disable PCIe completion timeout retries
  selftests/vfio: Add vfio_pci_irq_reenable() helper
  selftests/vfio: igb: Factor hardware programming into igb_hw_init()
  selftests/vfio: igb: Recover after DMA-read faults

Josh Hilke (2):
  selftests/vfio: igb: Add driver for IGB QEMU device
  selftests/vfio: igb: Use offical IGB headers in selftest driver

 .../selftests/vfio/lib/drivers/igb/igb.c      | 524 ++++++++++++++++++
 .../lib/include/libvfio/vfio_pci_device.h     |   2 +
 tools/testing/selftests/vfio/lib/libvfio.mk   |   2 +
 .../selftests/vfio/lib/vfio_pci_device.c      |  22 +
 .../selftests/vfio/lib/vfio_pci_driver.c      |   2 +
 5 files changed, 552 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/lib/drivers/igb/igb.c

-- 
2.54.0.794.g4f17f83d09-goog

