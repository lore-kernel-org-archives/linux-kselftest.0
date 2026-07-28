Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B047ACC7
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 23:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281091; cv=none; b=tLJGS0/wNgmrlYat3vOavDZe8HefTZx4Dr8XL1QVZIVfAvntdK0+Z/VBBhaWwT6eYaqD6sHYfuCtjT9t2xGVLFanUxDER9vAglkDRk2xXzEzm2dUfZfFBZWsRRnHz+EUs7/irljdy06r2kI46yjx8Fns+Wo1F3fsMvdCDX27UOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281091; c=relaxed/simple;
	bh=+H+xofDRqIFShub2GPPtV2SVmX/mEl7KHugg/loHMVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I73kBwbP9ghSA1XtQGHXfd7f3QBvYCL3JBt1pGiSKZbK5v+CP7kjtgXNrLfziw1IvfkwBXOWK5wTBMNhA4IHa0KJgsE06XBKZb8UG+/hkLp9k9MTbHf3IZM0i8soqIxEwfyTpHtywDIr6yG33mBny6kCCXwxCXjbj14i5SWyHhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSB1AEqO; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSB1AEqO"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so7182295ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785281089; x=1785885889; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFuZ5kJldVKRtJXGpfZgwazlZjjXkfpKt7BX5LFxO6E=;
        b=YSB1AEqOHbB5FHNv6FZMWyrSNPjs/qZCG0twyrNWhrgrxtn60SgHUF/M6TKqwb/Q1b
         a6EJkqTnuom0Q4tVg+5aRIpdcSUDML1Y2KBhfQJMhnLUpFzn6Lszk3EF2LZlBKZWifbo
         YX+ZcCHXP7KjEe7tiGwcwtiAlEI8osO0W49jFU8L9Xnhd0SSTCMqJPGId/lN8+yNnNut
         wL/REODdSC25NfAHamVxcuV3ZiFL0ZRZwcdsMMMysU6psEse/k77PisQKubzwdMMtm4I
         Sdj+KgMF3qJVokSTIdAx9jHfa5XoJN4pbUS6JnfV9wVxmLkMajP5XuN8oEpQpgYMw9ev
         Yziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785281089; x=1785885889;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFuZ5kJldVKRtJXGpfZgwazlZjjXkfpKt7BX5LFxO6E=;
        b=SPTQSN+YQtZ7EnIu3yA0S9moVEE8hSe8UYndBh86Uszbfi+0UT/OAXO7F2K/9+fL08
         hL7sa+W1KzleZH7pVyj2uWVsltyjtennwJjxc5h6Okga2xGf+vFcZnsXryeWMW/ya6jY
         yOB3IAM+0QgEDGIpAQVA3P86ZEzDxsnAQltrr7bujbUqr1f32n8cvLF5A5sOC6E/r8LS
         X/V7OqGhnH8IrEyL49vBCMhY0IhzdTu07HKPEFze8RUoDldgZG8AN72WtJURrpErxGnR
         EGRHa2fFgk/2NRX46mu0LJKQwt/h4INQ/Hx0NvLQASfFjtrDO0y7Jd/l7HKvfRVFABn5
         dfuw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7+Vw3wsgkihH48ED7GQzWC1JcaUrGjN4berIk7D3voDGBuC07LfijRW35BCGnA9z/YlI9gGa9SegsV3QnYWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyl8OJUe4D5HJO3KksD+63xEd2B4ExV6JVVJ582H/qwbkuzgTd
	TpkfgSkrAIHmS2+QLWvMrJv0zHpPrCX+OV1+I1UvOxm+sx+901/Z9dbqbIU/wx8kHm6wegBcwfA
	A21vNUD3i
X-Received: from plxj11.prod.google.com ([2002:a17:902:da8b:b0:2ca:7533:319f])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b48:b0:2ca:2753:f3cc
 with SMTP id d9443c01a7336-2d015d5773bmr46358835ad.33.1785281088572; Tue, 28
 Jul 2026 16:24:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 23:24:28 +0000
In-Reply-To: <20260728-igb_v3_b4-v7-0-4616c3745796@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-igb_v3_b4-v7-0-4616c3745796@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785281084; l=4367;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=RXPtup52nSInX+4AWyv3Qq7oSE3mIpKL0gcCi8S+VsU=; b=u4ts1T5c9L+g/6eDOCKVRU3NWY2v3KWqpKOYY7OZkqYooeHUL6BlSeuNURPumnTVl0uiDUoXM
 Uh0lVu7OnBKCghBW+SeD+EVMaX6k3osv30zPnsKMv2u59uvlh53odac
X-Mailer: b4 0.14.3
Message-ID: <20260728-igb_v3_b4-v7-3-4616c3745796@google.com>
Subject: [PATCH v7 3/6] vfio: selftests: Add helpers to re-enable interrupts
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>, Alex Williamson <alex.williamson@nvidia.com>
Content-Type: text/plain; charset="utf-8"

From: Alex Williamson <alex.williamson@nvidia.com>

Selftest drivers that recover from a fault by issuing VFIO_DEVICE_RESET
need to re-arm device interrupts afterwards.  VFIO_DEVICE_RESET tears
down the kernel-side IRQ trigger so a subsequent VFIO_DEVICE_SET_IRQS
is required, but the user-side eventfds (and any fd cached in a test
fixture) are still valid and must be preserved.

vfio_pci_irq_enable() refuses to be called for vectors that already
have an eventfd (VFIO_ASSERT_LT), and vfio_pci_irq_disable() closes
all eventfds before resetting the trigger, so neither is suitable.

Add vfio_pci_irq_reenable(device, index, vector, count) which asserts
that the requested range has existing eventfds and re-issues
VFIO_DEVICE_SET_IRQS using them.  Signature mirrors vfio_pci_irq_enable().

Add vfio_pci_msi{,x}_reenable() wrappers around vfio_pci_irq_reenable()
for additional ease of use and readability.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
---
 .../vfio/lib/include/libvfio/vfio_pci_device.h     | 14 ++++++++++++++
 tools/testing/selftests/vfio/lib/vfio_pci_device.c | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 2858885a89bb..2e67afc0d580 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -68,6 +68,8 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
 			 u32 vector, int count);
 void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
+void vfio_pci_irq_reenable(struct vfio_pci_device *device, u32 index,
+			   u32 vector, int count);
 void vfio_pci_irq_trigger(struct vfio_pci_device *device, u32 index, u32 vector);
 
 static inline void fcntl_set_nonblock(int fd)
@@ -92,6 +94,12 @@ static inline void vfio_pci_msi_disable(struct vfio_pci_device *device)
 	vfio_pci_irq_disable(device, VFIO_PCI_MSI_IRQ_INDEX);
 }
 
+static inline void vfio_pci_msi_reenable(struct vfio_pci_device *device,
+					 u32 vector, int count)
+{
+	vfio_pci_irq_reenable(device, VFIO_PCI_MSI_IRQ_INDEX, vector, count);
+}
+
 static inline void vfio_pci_msix_enable(struct vfio_pci_device *device,
 					u32 vector, int count)
 {
@@ -103,6 +111,12 @@ static inline void vfio_pci_msix_disable(struct vfio_pci_device *device)
 	vfio_pci_irq_disable(device, VFIO_PCI_MSIX_IRQ_INDEX);
 }
 
+static inline void vfio_pci_msix_reenable(struct vfio_pci_device *device,
+					  u32 vector, int count)
+{
+	vfio_pci_irq_reenable(device, VFIO_PCI_MSIX_IRQ_INDEX, vector, count);
+}
+
 static inline int __to_iova(struct vfio_pci_device *device, void *vaddr, iova_t *iova)
 {
 	return __iommu_hva2iova(device->iommu, vaddr, iova);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index fc75e04ef010..7b8394d0ac50 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -106,6 +106,28 @@ void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index)
 	vfio_pci_irq_set(device, index, 0, 0, NULL);
 }
 
+/*
+ * Re-issue VFIO_DEVICE_SET_IRQS for an already-enabled vector range using
+ * the existing eventfds.  Intended for drivers that need to re-arm device
+ * interrupts after a VFIO_DEVICE_RESET, which tears down the kernel-side
+ * IRQ trigger but leaves user-side eventfds intact.  Recreating the
+ * eventfds would invalidate any test-fixture cache of the fd, so this
+ * helper deliberately preserves them.
+ */
+void vfio_pci_irq_reenable(struct vfio_pci_device *device, u32 index,
+			   u32 vector, int count)
+{
+	int i;
+
+	check_supported_irq_index(index);
+
+	for (i = vector; i < vector + count; i++)
+		VFIO_ASSERT_GE(device->msi_eventfds[i], 0,
+			       "vector %d eventfd not allocated\n", i);
+
+	vfio_pci_irq_set(device, index, vector, count, device->msi_eventfds + vector);
+}
+
 static void vfio_pci_irq_get(struct vfio_pci_device *device, u32 index,
 			     struct vfio_irq_info *irq_info)
 {

-- 
2.55.0.487.gaf234c4eb3-goog

