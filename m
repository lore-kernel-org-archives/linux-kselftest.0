Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9232429CD1
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 20:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784062683; cv=none; b=g9eVy28scKgAAXghPfRatar8xb41v1UBAihly4FTxNW2mqiyK8GNyhN9KBV12BB2cxi1b3WauvRg9RjZofnNp4Nvz5Bz8d62qdiOZOMKZIhiOaz+ZWLJDbDttNJYMyRoygQohxhbY2IUNEYkuuV1Jve3JtfZnH8alIucJFkIOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784062683; c=relaxed/simple;
	bh=SJ1i5F2eLSuRjPtOfSXVPY3ukUM+JQb5/61IPaf32Ok=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FifckMsVswl8F92AAIle0Vj6e6hSIxu8u0gVVe7gnfXQ3GcqHW7ztATkE0r8CFCXfUwOfRoRQV8F6xTbK2qvfTza1os6o0hb54MVe+AFO57HReKw5XVUybZRzr8iGvNk/Q24l29QodLNwTV0kQMzboONHYiCu9KzfdTQ5uGmyr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X9WNdbO7; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X9WNdbO7"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso1650805b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 13:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784062681; x=1784667481; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgPkCBkCeDE4EwbZmiHiKF+rs1u66XeX2T6rpoovqS8=;
        b=X9WNdbO7uECtSMqaFUqa/IP9l4VWLv4Rcbp2joHmetCJ3nG1icnPLJQPMdKI9A01EJ
         vsb11bGYXTi2fMhXhk9OLuOwYwj6zcpPfkMgC/qUgtpScpI697oUc+S8zNV8vOMruDRl
         oqRnRUzPm0rti9nSF4uLuEZRFhhaM/z2/xhOC9PK4Sa2r7Kx4vnlJ3mBM0lX4L8weyYz
         xGzmybSMXLfA2SGKVOwZGJcb09RxVXrfqJDVP96Hv28rSf1F4FdHQQ6wQVT1/mhJcNcx
         7D0tvQQjv1Lh01qAqbIZWNf/ZWVPjmdB1ktyZTehBT1opJENA07fD4BcT3/7/6+QbdI6
         AUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784062681; x=1784667481;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgPkCBkCeDE4EwbZmiHiKF+rs1u66XeX2T6rpoovqS8=;
        b=Adrt9KngA7Z5Oxnrx5ei+8mS2z+vFqYravH+SEzXJ3u9mob3Nncd2Tb6IzWFJxPN7R
         5T4N3rVNfx2/vDwBPENLbtyPIu05zQn3lWGYNUhgUKd+68cS7BANBa/q72/o6j/CeWxM
         S69L6qkxc6gU5YPVBhPN+9PieA+lUZ08hEz6Kk6rY5WMZE11xCVvQ9pli5rJISvycox9
         3TxTUFO5Qi+EmNs5Qz9qtXz09ay7O5M1u/f5H4v+w0uYHsk5HnhtKjugSdAjtX9prJZ4
         pJST1WcGB2JusMwIsltRSG5bC5LSBk53PPh/zwYGZK7enAYFjDbOpO8NfY/0NMna4PIQ
         Vj4A==
X-Forwarded-Encrypted: i=1; AHgh+RqHGkaF4dEv9ApnBoAdgPZyTNEPXG6FOtgVTNDEJ7vjm38dYuiEISRcVNcrgvvBOEVJNOU9TpS0UW/E152H9L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0axqpNEHUx9tWrYoM98hS3xXu8jzKPFeo4YmndfwoWDiBHgw
	soXOMxPxeB3PL0eHgu4eGh6UAUByQ+B4ULNw8PB2KxTm8/xLuZOTh76dejdHbwx97eDkWl0TCg1
	6L58ICsfM
X-Received: from pfbkr17.prod.google.com ([2002:a05:6a00:4b51:b0:845:e40f:d7aa])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94d5:b0:847:968d:b0ff
 with SMTP id d2e1a72fcca58-848898118dbmr15090455b3a.55.1784062681070; Tue, 14
 Jul 2026 13:58:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:57:40 +0000
In-Reply-To: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784062676; l=4049;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=/lLaGljEuOKMpK+aNQEO0vdHU/W41rwggv0DTAy4g6E=; b=X6NM/idQzVlSVpc5Dxl7yUhpFi0vUk3lOH2IRMb/wDqGsafAbhhbsool3gfpu8SAV6+4T2VHI
 6mFyZf6TZZIAYUBl3rWT/sA3NyXGn5rsxNrI5Im1uHsfgt36sc1tTqB
X-Mailer: b4 0.14.3
Message-ID: <20260714-igb_v3_b4-v5-4-91503eddb98b@google.com>
Subject: [PATCH v5 4/5] vfio: selftests: igb: Factor hardware programming into igb_hw_init()
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

From: Alex Williamson <alex.williamson@nvidia.com>

Split the device register programming out of igb_init() into a new
igb_hw_init() helper so that the same sequence can be re-run after a
VFIO_DEVICE_RESET to restore the registers that CTRL.RST clears.  No
functional change for the initial path.

igb_init() now performs the one-shot setup: region size assertion, BAR
mapping, CTRL.RST + IMC mask-all to put the device into a known state,
and vfio_pci_msix_enable() to set up the kernel-side IRQ trigger.
igb_hw_init() does the rest: ring pointer setup and IOVA calc,
CTRL_EXT, PCI bus master, GCR, PHY loopback, descriptor rings, RCTL,
TCTL, GPIE/EIAC/EIAM/EIMS/IVAR, and driver-state initialization.

vfio_pci_msix_enable() moves from after RCTL/TCTL to before all
device-side programming.  Its only side effects are the VFIO kernel
IRQ trigger setup and the PCI MSI-X capability bits in config space;
neither has any ordering dependency on the 82576 device register
writes performed in igb_hw_init().  Performing it once in igb_init()
keeps igb_hw_init() reusable from the reset recovery path (which uses
vfio_pci_irq_reenable() to re-arm the existing trigger).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
Reviewed-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 41 ++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index 2b444be4bdfe..8eaf120330dc 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -202,7 +202,13 @@ static void igb_reset(struct igb *igb)
 	igb_write32(igb, E1000_IMC, 0xFFFFFFFF);
 }
 
-static void igb_init(struct vfio_pci_device *device)
+/*
+ * Program the device into a usable state.  Split out of igb_init() so it
+ * can be reused after a device reset to re-program the registers that
+ * CTRL.RST clears.  Expects bar0 to be mapped and MSI-X already enabled
+ * via VFIO.
+ */
+static void igb_hw_init(struct vfio_pci_device *device)
 {
 	struct igb *igb = to_igb_state(device);
 	u64 iova_tx, iova_rx;
@@ -210,15 +216,10 @@ static void igb_init(struct vfio_pci_device *device)
 	u16 cmd_reg;
 	int retries;
 
-	VFIO_ASSERT_GE(device->driver.region.size, sizeof(struct igb));
-
-	/* Set up rings and calculate IOVAs */
-	igb->bar0 = device->bars[0].vaddr;
-
 	iova_tx = to_iova(device, igb->tx_ring);
 	iova_rx = to_iova(device, igb->rx_ring);
 
-	igb_reset(igb);
+
 
 	/* Signal that the driver is loaded */
 	ctrl = igb_read32(igb, E1000_CTRL_EXT);
@@ -312,9 +313,6 @@ static void igb_init(struct vfio_pci_device *device)
 	igb_write32(igb, E1000_RCTL, rctl);
 	igb_write32(igb, E1000_TCTL, E1000_TCTL_EN);
 
-	/* Enable MSI-X with 1 vector for the test */
-	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
-
 	/*
 	 * Program MSI-X interrupt routing per 82576 datasheet:
 	 *
@@ -354,6 +352,29 @@ static void igb_init(struct vfio_pci_device *device)
 	device->driver.msi = MSIX_VECTOR;
 }
 
+static void igb_init(struct vfio_pci_device *device)
+{
+	struct igb *igb = to_igb_state(device);
+
+	VFIO_ASSERT_GE(device->driver.region.size, sizeof(struct igb));
+
+	igb->bar0 = device->bars[0].vaddr;
+
+	igb_reset(igb);
+
+	/*
+	 * Enable MSI-X via VFIO before device-side register programming.
+	 * vfio_pci_msix_enable() only touches the VFIO IRQ machinery and the
+	 * PCI MSI-X capability via config space; it has no ordering
+	 * dependency on the device-side writes performed by igb_hw_init().
+	 * Placing it here keeps igb_hw_init() reusable from the reset
+	 * recovery path (which calls vfio_pci_irq_reenable() instead).
+	 */
+	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
+
+	igb_hw_init(device);
+}
+
 static void igb_remove(struct vfio_pci_device *device)
 {
 	struct igb *igb = to_igb_state(device);

-- 
2.55.0.141.g00534a21ce-goog

