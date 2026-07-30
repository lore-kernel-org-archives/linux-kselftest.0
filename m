Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F647887B
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 23:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454303; cv=none; b=RPKooONcrUAkfLXOiUcDvXbhCEZAQ1St7QAg1awgClS7ZtdpPMv3gRlaINmn3D5zRLKHgI4MJ4jatzZZyQqGGIPsJiClp2mRrZhEoVq9FlvxyzX2t/yeq1QJ7LxryUKvoFUU/IdT4FwYvwRJHHPSnIZ4k481iQp/IGag7Lu6JOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454303; c=relaxed/simple;
	bh=dBWa5pDaRdl9sXO74wnsmv0OTj5A9gntgPn/RvI67mg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kxh6Vb72smTQG2hnbFStRsZnbFDBFgANL8hr/jZKIiKusDJCEH57Hg8rQdxUbJQcGgoflrFiGZYBqMo7Dkq5VhuJrYyKKtCQWTsh2k9tZRyWcJTtESSIuVJcektQ+C6vuXFu8A0v9fnQ25kADCcwmuXFAuFcrhSFoCS+/7SQ9Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiQSSf7B; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NiQSSf7B"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso562668a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 16:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785454299; x=1786059099; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYxQJUxtZ9obOQjkadKZ1JtBtvxvYJt9ysaeZYz4JvE=;
        b=NiQSSf7BzLIk/qIYx1PMUuOpvwl95eBEqx23RmCg5SGi5MYx3maoDjR48MRq3eyj9+
         aXVL42m+kT7+dJ1EXue8AB/2PY6/p2xD7T743yyjmmiQ4ZdLJI73V4i8YCvP9vGTT2QE
         ElNoVkpCDMhnBko1qBXisxqKfpSmKSNkIYxjbdJ4cA3nv8AFXq62tKe/ZjEWOhP66QAV
         66lqsuhxEkF4Idr2AuF2CMtGBeEOXxpMwYYy3eFVPj3XjFXnox8K8cNTmsW8dG7dd4NE
         uX31USQhUmjh++BWPpItDXCnIjR/AFVT1ZY6nBnEpcnLSrON7WxWs8GPUIlml7nodMtC
         4juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454299; x=1786059099;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYxQJUxtZ9obOQjkadKZ1JtBtvxvYJt9ysaeZYz4JvE=;
        b=FNlm21zEsJJE2fa5jLsK+A+rfo8ghpOCXc8W6FSYDbTPzIcOOELAMW3RKZW3CPUA0Y
         JxUvLS42xv8WX4qkynUHgWi+hHn8lNOIaiDD5kKqxi6E00z0/aX441EIltB+5N0YjcwW
         +kqR9Ps6uXnHjXxfDPx26MWuEtcMdh+ac+2SajvQo7wGIdK2iAKxgYl4ScHAovWWkX+e
         VDC+8Hx9+KBzll2f2hOVd81GMT2F10VkIzPcAbWFeyxaD56P9Jnou9BAX2np+vaytdeV
         3Wu2zzCtCGC7NlQ+RRl4lQdgG9uzga7UoXrN0iC5oQULAVLklxzY8qg49VxpDLSh2HKf
         42SA==
X-Forwarded-Encrypted: i=1; AHgh+RqyDg8ZaGUkX0TcbtjP/7kjKcW3679b9VxMHvZDtmPJVibUPWGD7Jmo0i92WNJ5YVuhEDwqErtlKmuBnz7xvXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUM914tlp5pNZaSDuiM6pX0c3U4mOU/QREVc+/HCBv6PyocoT
	G/U9zxq0XlK8SZPFV4fei8yPMyeTIpHVt+zg6U37/A9bL4JKmbXeb0hLYASstURhLv2xi7beyQK
	YdDgXnlXK
X-Received: from pgcc20.prod.google.com ([2002:a63:1c14:0:b0:c9a:2800:5ce6])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:be8f:b0:3c3:8129:a492
 with SMTP id adf61e73a8af0-3c90066d9bbmr4610273637.38.1785454298605; Thu, 30
 Jul 2026 16:31:38 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:31:31 +0000
In-Reply-To: <20260730-igb_v3_b4-v9-0-9e4d8682437e@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260730-igb_v3_b4-v9-0-9e4d8682437e@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785454295; l=4066;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=gPoSiBhL7zU/ZaGrhDuwLd8ipuisoeXwNZeQcmFAzOw=; b=X9SNqsINa218MT3bIkZGeK3znm0Mi9we7drZUSAmoti7wCAN60vDpKB1XrRb7Btr7sPSGJKyT
 Ryjr6vN/vWEAw8ceV4Y5RpMhacWw18q/mIcF1YpFOZqzi9YHHnntjEc
X-Mailer: b4 0.14.3
Message-ID: <20260730-igb_v3_b4-v9-3-9e4d8682437e@google.com>
Subject: [PATCH v9 3/5] vfio: selftests: igb: Factor hardware programming into igb_hw_init()
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
index 2f7e5cb26271..ac7b52d89757 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -224,7 +224,13 @@ static void igb_reset(struct igb *igb)
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
@@ -232,15 +238,10 @@ static void igb_init(struct vfio_pci_device *device)
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
@@ -334,9 +335,6 @@ static void igb_init(struct vfio_pci_device *device)
 	igb_write32(igb, E1000_RCTL, rctl);
 	igb_write32(igb, E1000_TCTL, E1000_TCTL_EN | E1000_TCTL_PSP);
 
-	/* Enable MSI-X with 1 vector for the test */
-	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
-
 	/*
 	 * Program MSI-X interrupt routing per 82576 datasheet:
 	 *
@@ -374,6 +372,29 @@ static void igb_init(struct vfio_pci_device *device)
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
2.55.0.508.g3f0d502094-goog

