Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774063DA7EC
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721224; cv=none; b=JqARjqqbgHYzK2qoON2tNT/1JYP/EhDtKWGIajpFw4hSFkltL1Xm7Lqn+m1pDLcx0w085+/pXdFLwNAlcYvx2u1bGi5oM8aLTkYt5W/kqeu0HDeJyKZzDvhFSCDxbFf0uqsUStHrJ0L/V7mXs06f638WiDq1I2EEAFs0etZAPoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721224; c=relaxed/simple;
	bh=5XZ+blBPN7UkWKijZIA5svjbA/3Bw9cDBIfFFagMloE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lObvZbzLkls2eMiDSLHE4W2YjbY19tyjZ+cxK6AjixKSLnS8I8cqz3agKgHvXMF6/8WIQh0btfR51qsiFsPTG0YN9kMhDnLNHjnJq0YrRkF2EokkMHlHSP8FlKZM+Ys9QHj2II6mxDWz8/VbAOwSO6FpAilAhA06erJJvibPDKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ismA6EZo; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ismA6EZo"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c9667280edeso1959465a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783721217; x=1784326017; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTfqEjSO/zvcn0XSIJP07HCV2qOV7Xme/M8SMmLWtWU=;
        b=ismA6EZo+36Pzra+U/CSReHoymZEa69h2HNtTZvSvUpv/Wdyd+vEnSHbFLgXmeq1X3
         dvMBvA1nr7FTwdzjlYtixyikLJUPLeObDDjA7Pkgto7+re57DGpGlJW2V4zpaUQbCZax
         u6HQrh7keJgEoG04lRBPMWDvyJR48b8vELSD/dMxEFE7l+QsQ2HKk/SZFpHGCKo3Rs/n
         cnBB02kcStX/bxXtj6yM/2YiDjWdbcpumqypVLrsHd/0CfIS/FWreV3rjvjZPGLqRv7I
         69yqDknZL823FqCfJgd1cUU2oVYLQGi4T+FRW29tTck8/DOj080s+1t8xTZVvu97acow
         Sesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721217; x=1784326017;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTfqEjSO/zvcn0XSIJP07HCV2qOV7Xme/M8SMmLWtWU=;
        b=AoNAfb71p4uMD9QUebLlpHxHrWz6OShqG3/PjFEIFuOyFGDESW2Qk/+8mmg0yk0M5D
         RFKlJv4q3X7/T5NCPukSD+s6n6weSnzGgicpo6ezI4xi1F82MV4XXYOUYnViI7LQp1Zf
         jf71m6hcwpOAD/BNA56mLwAnIWSepcSze2LggeH8pSzkAu+lkL5rZKAw0lsvhBKTqCL6
         g84VpcWwGaebQhlkKHTskx08FluJ9IHqFRWxvy8b2pf4bdIj7NgkeLz3VUBeQf9rKHdf
         Y+TW0G2ikattqRHg16ezOvK7/qn0DXM+qSLJpkGPdyMPHc04vVpxXTUM4nbTaaYALII+
         /LEA==
X-Forwarded-Encrypted: i=1; AHgh+RpLEV3AsrAFkpIwIK7ZsxuoAGMBnj3Pb4ZywHuNW1AfXaJOa5iQbNfy7SjXyvOlHDXC2l4fti5TOIn4xwaP2Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YynuAwupelUcH/6zqNbPNzokiKCpwB9EiO4MEN83gF4Ke9/IkXZ
	Kf+OeWKevzZQHUee6dnz+L99Bu4BgFWk8O0buwXC8DRoWqeEEQUcCCbZ79I29Tw8zy4C7CnQa5C
	lWcbfxbAG
X-Received: from pgmj9.prod.google.com ([2002:a63:5949:0:b0:c8b:2b50:846b])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a10e:b0:3bf:b705:4b9d
 with SMTP id adf61e73a8af0-3c110a7a105mr768481637.28.1783721216316; Fri, 10
 Jul 2026 15:06:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:06:52 +0000
In-Reply-To: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721208; l=4909;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=l2upaY11NNXoOWkPHwt4VKr5HfO5SZwlcbFOEbuFak4=; b=3IOSypgsWvEENQB/lo0rbusjaVmdMbswoFfQGcOyxCC9iq79Vifre6hBXVPA81sWTAPyVATut
 p5VJdJcNqHqAVnyhU42Nn4C19Q3bLYAnPLGoEc9BvYF/ZBmBpM6QW6p
X-Mailer: b4 0.14.3
Message-ID: <20260710-igb_v3_b4-v4-8-56e7e2576cc1@google.com>
Subject: [PATCH v4 8/9] vfio: selftests: igb: Factor hardware programming into igb_hw_init()
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
 tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 61 ++++++++++++++--------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index ac116834bbf6..23d924b791d3 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -188,7 +188,13 @@ static int igb_probe(struct vfio_pci_device *device)
 	return 0;
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
@@ -196,26 +202,9 @@ static void igb_init(struct vfio_pci_device *device)
 	u16 cmd_reg;
 	int retries;
 
-	VFIO_ASSERT_GE(device->driver.region.size, sizeof(struct igb));
-
-	/* Set up rings and calculate IOVAs */
-	igb->bar0 = device->bars[0].vaddr;
-
 	iova_tx = to_iova(device, igb->tx_ring);
 	iova_rx = to_iova(device, igb->rx_ring);
 
-	/* Reset device and disable all interrupts */
-	igb_write32(igb, E1000_CTRL, igb_read32(igb, E1000_CTRL) | E1000_CTRL_RST);
-	/*
-	 * Must wait at least 1 millisecond after setting the reset bit before
-	 * checking if this device is ready to be used (82576 datasheet section
-	 * 4.2.1.6.1).
-	 */
-	usleep(1000);
-	while (igb_read32(igb, E1000_CTRL) & E1000_CTRL_RST)
-		usleep(10);
-	igb_write32(igb, E1000_IMC, 0xFFFFFFFF);
-
 	/* Signal that the driver is loaded */
 	ctrl = igb_read32(igb, E1000_CTRL_EXT);
 	ctrl |= E1000_CTRL_EXT_DRV_LOAD;
@@ -305,9 +294,6 @@ static void igb_init(struct vfio_pci_device *device)
 	igb_write32(igb, E1000_RCTL, rctl);
 	igb_write32(igb, E1000_TCTL, E1000_TCTL_EN);
 
-	/* Enable MSI-X with 1 vector for the test */
-	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
-
 	/*
 	 * Program MSI-X interrupt routing per 82576 datasheet:
 	 *
@@ -347,6 +333,39 @@ static void igb_init(struct vfio_pci_device *device)
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
+	/* Reset device and disable all interrupts. */
+	igb_write32(igb, E1000_CTRL, igb_read32(igb, E1000_CTRL) | E1000_CTRL_RST);
+	/*
+	 * Must wait at least 1 millisecond after setting the reset bit before
+	 * checking if this device is ready to be used (82576 datasheet section
+	 * 4.2.1.6.1).
+	 */
+	usleep(1000);
+	while (igb_read32(igb, E1000_CTRL) & E1000_CTRL_RST)
+		usleep(10);
+	igb_write32(igb, E1000_IMC, 0xFFFFFFFF);
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
2.55.0.795.g602f6c329a-goog

