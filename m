Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C77429CEC
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 20:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784062683; cv=none; b=Pj5AuscJph+u6zzB6scsZyrWwiG/AO+t+40/Imh6X6OYriGo7OWwA5Jiq1UcWq4plie/gsIUygHquJFweU95tmYtv2N74jaRYtQZFrWWc8CCgUt3ceKBpWFcSkR/2P2v8MYejZN5VqA1mbg0PEgGuy/1uCThJiuShDNkVYP2BvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784062683; c=relaxed/simple;
	bh=N2dVPNyCMIp6yXlqzRllB8lucE5bJZ22mwTYegBiRmk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KPHzZAfzBc9Z4kUj5niHr6qaWxogqM0P+kYZ1R5kMIM3WIgknN81vn88wQFOUGLMCv2sO86nsaDGa0mI3Qo07V9felhRutmqeVevm/1NjBksBZTrDv0O0dFy+S0m9mxSWfLRiJJf40XkiauHKt3yNbrTFqNuq/ATlcu7tkUHQPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDzUzU3o; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDzUzU3o"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8488ac68185so7341440b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784062680; x=1784667480; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XA+hWmheeZZq7ghSboZhFuivQOfldbBfo7WLFjZuy0Y=;
        b=qDzUzU3oSlmZOiWjSA86POdh34rXyi88ZrVvLpeYRU79P8Y/HNd2cHl1bJ++ke4pBn
         aoSnuygpXH4JzJ6K/vH2cuVVAHOVq1rooDreqb1siuumjbLgK+FQaJ7FBUPFIYiDa/MF
         sxHOn4EJ7XSOYzOOitoxQdGvPgPrV+YtPrThHFDUIz0MLJGBk6KMH/9tOqeAM3xyHqko
         IvoeSw+RVNUa6Z2S51FjdM1BachCqJyHuCOgq4jKhdSPHm9qK/nPsc9ESqJtMDEIEDWz
         Z2Z6pWRVD62icgscWUV6K2VA08aVZ7kP0OQuwVHzmEVJekh9JfklMzCCZAtZ+0f6ZhYn
         1ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784062680; x=1784667480;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA+hWmheeZZq7ghSboZhFuivQOfldbBfo7WLFjZuy0Y=;
        b=VTw7ff7uwT37bISWmug82+ZEvvTK/PSMwpGFFSeVZizJ6sCr+uCdDgL/wQ0OWhYhSC
         VVcdZKZJ577WwRiuRjhY3bn4361bJBdoV6kgQsUJYbJrJAMwEtYyxhP4TIE195Yuk2dP
         3jK+EyRVWoNV58Atqg3pft8cfxYmrbacV5XLLKatEyFymPOra5+u9Z/nQSOp7QXiYRaX
         uzFzjdb6HhjIhIOHgeNy875TvsXzPU8pAhzQFBRaxQzMQqcGtmLt2+didxozu5nF8L6d
         gFq6LjNOs3n1nbp9D3bKsyvOtCpmysH2Fi9aRRYFZuBucq+zN13/qjOb/4hdsJNqzUHC
         hBUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCEyulEBFgRQYUilhz3ySY9zCB2U/pKnPvXYhfCj4dFqtdO6roUKqvIIfDskBb4izhmizgb6HU/zJ949aoesk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPoDXrkDZ7IsV38Xw6Zfr5BmCX+Ojw5nU4Bz7f5snhBEK8b4R
	bpURqIq6Jh9DDW01ksZHbPapm1t4WL0i25/xtSDczKi5C3fh7d3shK4QJEOmEjl8bcd0kKGebku
	zef+7aWIC
X-Received: from pgeg25.prod.google.com ([2002:a63:9f19:0:b0:c92:460e:4f73])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94f6:b0:847:9aa8:d3bb
 with SMTP id d2e1a72fcca58-84a6723d5famr126852b3a.12.1784062680178; Tue, 14
 Jul 2026 13:58:00 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:57:39 +0000
In-Reply-To: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784062676; l=4367;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=Gp4TOZ3xMJA6g3pDRm0mrLCT/+fd3gxWLvX+mjLBJVA=; b=TMTFOcJrEIIBJ34VoHhomtXZJOa3haDMomRALfD+GOM+9jEx8y4ok+p6JIxSEGAcOc6hb0U3e
 9JehgZpTrGxDWN3exXoNjObZ7gSlp8KR8Ac43aG3EwExJs7P78mDhT5
X-Mailer: b4 0.14.3
Message-ID: <20260714-igb_v3_b4-v5-3-91503eddb98b@google.com>
Subject: [PATCH v5 3/5] vfio: selftests: Add helpers to re-enable interrupts
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
2.55.0.141.g00534a21ce-goog

