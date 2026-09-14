Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F949CF5C
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417462; cv=none; b=m1dJ9nbfOXwXBbQp+LhsSnohVmPbWitm83EgO9tTiq1+MUFfmV3KpSZ7+NlnxtMFKV9CSSNxXaUDcQ/VOlG4nX5W6Jzm6WX2iz06L6GywWRRrHv9IyCbEDn6NyMh/TICfkKl/jzCnofp3mF6/3aVlGjc82VWimXwxIxBn6KMmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417462; c=relaxed/simple;
	bh=WK0q1l3H1KJTu4dD6ybH59grBktww0sexuUOeNOEpOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdAr6GqVPeWrQInDxgOdvWrBOnLhf8s2jRjpjKWEZCBWf74kQMTAwaJM3G/cv/WbFI0LQL6V7f+BlLNFZXsqNmaN+Ah4zJSe/hSVCC2N7ttsy7GsHAJripPB9XyfMytm5WtLbcGSXpMhSUy3x1D6RNaK6EtaF7eQNLLzMSXuDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eW1kzfNe; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eW1kzfNe"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5bf9506704fso1127807e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417458; x=1790022258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oakn8qxLip+m26kgiqtIpS/fNC1BBRey/OW7it8+tVg=;
        b=gl/Rsc+OgwMAnwkKM/ccZu5s5mcv2TIsQWZT0VWb8mUNWuO8Lct4DBrQG7o5TEYlWq
         hn4RZ+uJi+CsZbRLaizv+bnuTfHLpijUHrT/Pw7Sn6c3kz4tGbm5+bGhYmlMO2Yvp51R
         c2PsZzoFmSnw+XRJpHk0YUZKaouI/Gi53KTdJ04vAlDECoNyu+MRMVN9kGJXhykbKwj5
         WYg31Ljkz+feuz9OLaF6lYZYUVZFfGDAGvHefv8qPSfKlnWLr9Z/Mij3rEhpemt68PjQ
         Adx8RJN7S1mvqZqqX7F4wvQ7J1lOFa87MRkwEWfclycaoEe4r4M8hHl5dIomu0FL6v4k
         eAlw==
X-Forwarded-Encrypted: i=1; AKwUvByPW9wLtrpXDGKY6byPBQS/kmR76LV7K/Zv31pv9tq1zz9Ok1fJndww/zcgw8LJN9qz6nPRhPZPgjolepqcqj8=@vger.kernel.org
X-Gm-Message-State: AFuF++noHii+pheClmFA17HFW925i/+UFMbejwWVH6uuFYdgVP3tvgs1
	shc57bL6YcQh/cd796TNGsP6sUbBc2kOJUEWmEczfDzoRQ/o/8zgiPSz+PCNy9m2wWSWbCRPN7r
	S0Q+J4k/0gs51LtEP8pmg4fQu0HxdQ1PYecXuHmGF1FcTHjbRTM2JAFavurHgv8P5ML13mkV6j3
	4yT2ipGMvMZlCGLDKgjwXyNsaz/e38CNi9FWpMclPL0dIrZ85dJXx7n6rQAyaPsjd0kKSltW2UX
	mMxcXNCuo4jZAU++2Ic5VF06A==
X-Gm-Gg: AYBFou22GbkHqEoNYsyeBfEDwpgmr5vMLdfJ4XhCB6T+cYuVrY7S8dkhmrmQAjCB/e3
	RC8HG70KBMxJ2zCGSJYd74qj8FQLJRWAiyyxo0ZAAFQ/mZ6RkEFZWr8nVpseytvdiHGSRkptCSW
	kNa4udnQjnxZKzmhEhiFCgm+8i7LepeO0QyLkKCs9rTijDdg7DEYsMa6xADZDksgUBu09/Tv1wu
	Y0N/pHv1tU24WXWt9tW5+qj3+IEZSjJOsLYwfbU8t4yXIJOuzIwj+2DB60GhkhKYOJ8itqZ7Nwn
	7GxSR0K4o+Fn521B2bcqiSr0z4aagQ/3R/YINazmf7DMXWO1l+GUvv5PQ98kJT8trmmSWTPeNUK
	MPMGkydPlFzafqh3Wp3kAEr5R6dom2poZVFfsBSKaRRWqCQUE4ilGl8wO8rv6nN0cbIj4pEGvz8
	Rub34PEfaUDqRG41Hnc1yus4htyG/EEFSh+r8WfQ==
X-Received: by 2002:a05:6122:d21:b0:5c8:2dc9:f8d2 with SMTP id 71dfb90a1353d-5c981898b18mr6394302e0c.0.1789417458451;
        Mon, 14 Sep 2026 13:24:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c8470b6394sm4512748e0c.3.2026.09.14.13.24.17
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c153bab4c3so3628601eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417457; x=1790022257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oakn8qxLip+m26kgiqtIpS/fNC1BBRey/OW7it8+tVg=;
        b=eW1kzfNeUC3oOJFfDQd6bRj3VkdKfoKcFjKH7cnq+xMdPmAWynjPkH3dj4qnwykDQP
         usELQmYb+83OdKY75fhSlyq8iR5L0RMMeY8559FQe0yaHWOjU1CVkHTmJOxDCvml3Vq+
         e3dFNQdYIaxBhSkSZSqzJX+0R3U4J2RTMTSIk=
X-Forwarded-Encrypted: i=1; AKwUvByCKS8M9xfty2FtarbIsmAryAzFCaSYSsHyT/UaR5ttfDxyEmEdQxcdwNxFksp3ytyz6/MQdrbyTcyEjzzfD7c=@vger.kernel.org
X-Received: by 2002:a05:6820:1527:b0:6bd:d2ad:55a1 with SMTP id 006d021491bc7-6c53fe7e170mr2451160eaf.9.1789417456981;
        Mon, 14 Sep 2026 13:24:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1527:b0:6bd:d2ad:55a1 with SMTP id 006d021491bc7-6c53fe7e170mr2451131eaf.9.1789417456300;
        Mon, 14 Sep 2026 13:24:16 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 2/4] misc: vmw_zerocopy: Add VMware zero-copy buffer sharing driver
Date: Mon, 14 Sep 2026 13:22:07 -0700
Message-ID: <9318be9d4da2392586d4ce72428592a3e5a02b99.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add drivers/misc/vmw_zerocopy_core.c: the misc character device
  /dev/vmw_zc, its single ioctl, page pinning and PFN collection
- Add drivers/misc/vmw_zerocopy_vmci.c: the VMCI datagram transport backend
- Add drivers/misc/vmw_zerocopy_priv.h: the wire-format message structs and
  the struct vmw_zc_transport_ops interface that joins the two
- Add include/uapi/linux/vmw_zerocopy.h: struct vmw_zc_guest_message and
  VMW_ZC_IOCTL_MSG
- Register ioctl magic 0xDC in
  Documentation/userspace-api/ioctl/ioctl-number.rst
- Add the VMW_ZC Kconfig symbol and a MAINTAINERS entry

This driver implements a misc character device (/dev/vmw_zc) that pins
guest userspace pages and transmits their physical frame numbers (PFNs) to
a VMware hypervisor-side peer.

The payload itself is never transferred. What crosses to the hypervisor is
a list of guest physical frame numbers for pages pinned in place, so the
hypervisor reads the buffer directly out of guest memory. vsock and virtio
are copying transports: both move the bytes through a ring or a socket
buffer, which is precisely the copy this interface exists to avoid. The
VMCI datagram carries only the PFN descriptor and never the data, which is
why an existing standard transport cannot serve this purpose.

The destination is deliberately not part of the UAPI. It is a VMCI resource
id in the hypervisor context, and that namespace belongs to the platform:
the low ids are the hypervisor's own control entry points, and
vmci_datagram_send() dispatches from an in-kernel sender, so the check that
stops userspace from addressing the hypervisor does not apply here. A
device node that unprivileged userspace can open must therefore not let
userspace name a destination, or it becomes an unfiltered writer onto the
hypervisor's control namespace. Fixing the destination in the driver
removes that reachability by construction rather than by validation.

Delivery is abstracted behind a small transport interface so that VMCI, the
only backend today, is not depended on directly by the ioctl path.

The metadata buffer is released with unpin_user_pages_dirty_lock(...,
true). The hypervisor stores its result through the physical frame, so
neither the guest page table nor the folio records the write and the result
can be lost to writeback or reclaim; this is the same fix as commit
779055842da5 ("xen/gntdev.c: Mark pages as dirty") and the pattern used by
drivers/xen/privcmd.c. The read-only data buffer keeps the plain path.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  10 +
 drivers/misc/Kconfig                          |  23 ++
 drivers/misc/Makefile                         |   2 +
 drivers/misc/vmw_zerocopy_core.c              | 267 ++++++++++++++++++
 drivers/misc/vmw_zerocopy_priv.h              |  66 +++++
 drivers/misc/vmw_zerocopy_vmci.c              | 132 +++++++++
 include/uapi/linux/vmw_zerocopy.h             |  67 +++++
 8 files changed, 568 insertions(+)
 create mode 100644 drivers/misc/vmw_zerocopy_core.c
 create mode 100644 drivers/misc/vmw_zerocopy_priv.h
 create mode 100644 drivers/misc/vmw_zerocopy_vmci.c
 create mode 100644 include/uapi/linux/vmw_zerocopy.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..f55998d5e270 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -396,6 +396,7 @@ Code  Seq#    Include File                                             Comments
 0xCD  01     linux/reiserfs_fs.h                                       Dead since 6.13
 0xCE  01-02  uapi/linux/cxl_mem.h                                      Compute Express Link Memory Devices
 0xCF  02     fs/smb/client/cifs_ioctl.h
+0xDC  01     uapi/linux/vmw_zerocopy.h                                 VMware zero-copy buffer sharing
 0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
                                                                        <mailto:aherrman@de.ibm.com>
 0xE5  00-3F  linux/fuse.h
diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..d683336b30d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29228,6 +29228,16 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	net/vmw_vsock/vmci_transport*
 
+VMWARE ZEROCOPY DRIVER
+M:	Rishi Chhibber <rishi.chhibber@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-kernel@vger.kernel.org
+S:	Supported
+F:	Documentation/misc-devices/vmw_zerocopy.rst
+F:	drivers/misc/vmw_zerocopy*
+F:	include/uapi/linux/vmw_zerocopy.h
+F:	tools/testing/selftests/drivers/misc/vmw_zerocopy/
+
 VOCORE VOCORE2 BOARD
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mips@vger.kernel.org
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 7364931dad3a..cf48c29db35e 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -359,6 +359,29 @@ config VMWARE_BALLOON
 	  To compile this driver as a module, choose M here: the
 	  module will be called vmw_balloon.
 
+config VMW_ZC
+	tristate "VMware zero-copy buffer sharing device"
+	depends on VMWARE_VMCI && HYPERVISOR_GUEST && !X86_MEM_ENCRYPT
+	help
+	  This driver implements a character device (/dev/vmw_zc) that
+	  allows guest userspace applications to share pinned memory
+	  buffers with a VMware hypervisor-side peer using the VMCI
+	  datagram interface.
+
+	  Applications submit buffers via ioctl(). The driver pins the
+	  user pages and transmits their physical page frame numbers to
+	  the peer, enabling zero-copy data transfer between the guest
+	  and the hypervisor without an intermediate copy.
+
+	  This driver is not compatible with guests that use memory
+	  encryption (AMD SEV-SNP or Intel TDX), as the hypervisor
+	  cannot read encrypted guest physical memory.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called vmw_zerocopy.
+
 config PCH_PHUB
 	tristate "Intel EG20T PCH/LAPIS Semicon IOH(ML7213/ML7223/ML7831) PHUB"
 	select GENERIC_NET_UTILS
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index e8d8d5d88c0d..eda927fd68dd 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -62,6 +62,8 @@ obj-$(CONFIG_TMR_MANAGER)      += xilinx_tmr_manager.o
 obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
+obj-$(CONFIG_VMW_ZC)		+= vmw_zerocopy.o
+vmw_zerocopy-y			:= vmw_zerocopy_core.o vmw_zerocopy_vmci.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
 lan966x-pci-objs		:= lan966x_pci.o
diff --git a/drivers/misc/vmw_zerocopy_core.c b/drivers/misc/vmw_zerocopy_core.c
new file mode 100644
index 000000000000..bf5ab20ff1a0
--- /dev/null
+++ b/drivers/misc/vmw_zerocopy_core.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+
+#include "vmw_zerocopy_priv.h"
+
+/* Compile-time transport selection; a second backend swaps this pointer. */
+static const struct vmw_zc_transport_ops *vmw_zc_transport = &vmw_zc_vmci_transport;
+
+static long vmw_zc_ioctl(struct file *file, unsigned int cmd,
+			 unsigned long arg);
+
+static const struct file_operations vmw_zc_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = vmw_zc_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+/*
+ * 0644: any local user may open this device, but that only lets them
+ * pin their own memory and reach VMCI_VMWZC_DST_RID, a destination
+ * fixed by the driver.
+ */
+static struct miscdevice vmw_zc_misc = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = VMW_ZC_DEVICE_NAME,
+	.fops = &vmw_zc_fops,
+	.mode = 0644,
+};
+
+/*
+ * @make_dirty must be true for any buffer the peer wrote into: it stores
+ * through the physical frame, so nothing marks the page dirty and the result
+ * would be lost to writeback or reclaim.
+ */
+static void vmw_zc_unpin_user_pages(struct page **pages, int num_pages,
+				    bool make_dirty)
+{
+	if (num_pages <= 0)
+		return;
+
+	unpin_user_pages_dirty_lock(pages, num_pages, make_dirty);
+}
+
+/* @pages must have room for VMW_ZC_MAX_PAGES entries. */
+static int vmw_zc_pin_user_pages(void __user *user_buf, size_t size,
+				 struct page **pages, int *num_pages,
+				 bool writable)
+{
+	unsigned long start_addr = (unsigned long)user_buf;
+	unsigned int gup_flags = writable ? FOLL_WRITE : 0;
+	int nr_pages;
+	int ret;
+
+	if (!access_ok(user_buf, size)) {
+		dev_dbg(vmw_zc_misc.this_device,
+			"buffer not in user address space: 0x%lx + %zu\n",
+			start_addr, size);
+		return -EFAULT;
+	}
+
+	nr_pages = DIV_ROUND_UP(offset_in_page(user_buf) + size, PAGE_SIZE);
+
+	if ((unsigned long)nr_pages > VMW_ZC_MAX_PAGES) {
+		dev_dbg(vmw_zc_misc.this_device,
+			"buffer spans too many pages: %d > %lu\n",
+			nr_pages, VMW_ZC_MAX_PAGES);
+		return -EINVAL;
+	}
+
+	ret = pin_user_pages_fast(start_addr & PAGE_MASK, nr_pages, gup_flags,
+				  pages);
+	if (ret < 0)
+		return ret;
+
+	if (ret != nr_pages) {
+		/* Nothing was sent to the peer yet, so nothing was written. */
+		vmw_zc_unpin_user_pages(pages, ret, false);
+		return -EFAULT;
+	}
+
+	*num_pages = nr_pages;
+	return 0;
+}
+
+/*
+ * Pin @buffer and optional @metadata and send PFN layout to the peer.
+ * Either buffer or metadata must exist.
+ */
+static int vmw_zc_send_user_buffer_msg(void __user *buffer, u32 buffer_len,
+				       void __user *metadata, u32 metadata_len)
+{
+	int ret;
+	int i;
+	struct vmw_zc_host_message msg = { };
+	struct page *buffer_pages[VMW_ZC_MAX_PAGES];
+	struct page *metadata_pages[VMW_ZC_MAX_PAGES];
+	int num_buffer_pages = 0;
+	int num_metadata_pages = 0;
+
+	if (!buffer && !metadata) {
+		dev_dbg(vmw_zc_misc.this_device,
+			"neither buffer nor metadata provided\n");
+		return -EINVAL;
+	}
+
+	if (buffer) {
+		if (buffer_len == 0 || buffer_len > VMW_ZC_MAX_BUFFER_SIZE) {
+			dev_dbg(vmw_zc_misc.this_device,
+				"invalid buffer size: %u (expected between 1-%u)\n",
+				buffer_len, VMW_ZC_MAX_BUFFER_SIZE);
+			return -EINVAL;
+		}
+		ret = vmw_zc_pin_user_pages(buffer, buffer_len, buffer_pages,
+					    &num_buffer_pages, false);
+		if (ret)
+			return ret;
+	}
+
+	if (metadata) {
+		if (metadata_len == 0 ||
+		    metadata_len > VMW_ZC_MAX_BUFFER_SIZE) {
+			dev_dbg(vmw_zc_misc.this_device,
+				"invalid metadata size: %u (expected between 1-%u)\n",
+				metadata_len, VMW_ZC_MAX_BUFFER_SIZE);
+			ret = -EINVAL;
+			goto out_unpin;
+		}
+		ret = vmw_zc_pin_user_pages(metadata, metadata_len,
+					    metadata_pages,
+					    &num_metadata_pages, true);
+		if (ret)
+			goto out_unpin;
+	}
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+
+	if (buffer) {
+		msg.body.user_buf.data.offset = offset_in_page(buffer);
+		msg.body.user_buf.data.length = buffer_len;
+		msg.body.user_buf.data.num_pages = num_buffer_pages;
+		for (i = 0; i < num_buffer_pages; i++) {
+			msg.body.user_buf.data.page_pfns[i] =
+				page_to_pfn(buffer_pages[i]);
+		}
+	}
+
+	if (metadata) {
+		msg.body.user_buf.metadata.offset = offset_in_page(metadata);
+		msg.body.user_buf.metadata.length = metadata_len;
+		msg.body.user_buf.metadata.num_pages = num_metadata_pages;
+		for (i = 0; i < num_metadata_pages; i++) {
+			msg.body.user_buf.metadata.page_pfns[i] =
+				page_to_pfn(metadata_pages[i]);
+		}
+	}
+
+	ret = vmw_zc_transport->send(&msg);
+
+out_unpin:
+	/* Metadata is written by the peer; the data buffer is read-only. */
+	vmw_zc_unpin_user_pages(metadata_pages, num_metadata_pages, true);
+	vmw_zc_unpin_user_pages(buffer_pages, num_buffer_pages, false);
+	return ret;
+}
+
+static int vmw_zc_send_raw_msg(const u8 *raw, u32 raw_len)
+{
+	struct vmw_zc_host_message msg = { };
+
+	if (raw_len == 0 || raw_len > VMW_ZC_MAX_RAW_BUFFER_LEN) {
+		dev_dbg(vmw_zc_misc.this_device,
+			"invalid raw size: %u (max %u)\n",
+			raw_len, VMW_ZC_MAX_RAW_BUFFER_LEN);
+		return -EINVAL;
+	}
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	memcpy(msg.body.raw.raw, raw, raw_len);
+
+	return vmw_zc_transport->send(&msg);
+}
+
+static long vmw_zc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	int ret = 0;
+	void __user *buf, *meta;
+	u32 buf_len, meta_len;
+	struct vmw_zc_guest_message guest_msg;
+
+	if (cmd != VMW_ZC_IOCTL_MSG)
+		return -ENOTTY;
+
+	if (copy_from_user(&guest_msg, (void __user *)arg, sizeof(guest_msg)))
+		return -EFAULT;
+
+	if (guest_msg.reserved) {
+		dev_dbg(vmw_zc_misc.this_device,
+			"reserved field must be zero: %u\n",
+			guest_msg.reserved);
+		return -EINVAL;
+	}
+
+	switch (guest_msg.message_type) {
+	case VMW_ZC_MSG_USER_BUFFER:
+		buf = u64_to_user_ptr(guest_msg.u.data.buffer);
+		buf_len = guest_msg.u.data.buffer_length;
+		meta = u64_to_user_ptr(guest_msg.u.data.metadata);
+		meta_len = guest_msg.u.data.metadata_length;
+		ret = vmw_zc_send_user_buffer_msg(buf, buf_len, meta, meta_len);
+		break;
+
+	case VMW_ZC_MSG_RAW:
+		ret = vmw_zc_send_raw_msg(guest_msg.u.raw_buffer.raw_buffer,
+					  guest_msg.u.raw_buffer.raw_len);
+		break;
+
+	default:
+		dev_dbg(vmw_zc_misc.this_device,
+			"unknown message type: %u\n",
+			guest_msg.message_type);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int __init vmw_zc_init(void)
+{
+	int ret;
+
+	ret = vmw_zc_transport->init();
+	if (ret)
+		return ret;
+
+	ret = misc_register(&vmw_zc_misc);
+	if (ret) {
+		pr_err("failed to register misc device: %d\n", ret);
+		vmw_zc_transport->exit();
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit vmw_zc_exit(void)
+{
+	misc_deregister(&vmw_zc_misc);
+	vmw_zc_transport->exit();
+}
+
+module_init(vmw_zc_init);
+module_exit(vmw_zc_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Broadcom Corporation");
+MODULE_DESCRIPTION("Broadcom VMware zero-copy sync buffer sharing");
diff --git a/drivers/misc/vmw_zerocopy_priv.h b/drivers/misc/vmw_zerocopy_priv.h
new file mode 100644
index 000000000000..f2de3ce9391a
--- /dev/null
+++ b/drivers/misc/vmw_zerocopy_priv.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ */
+
+#ifndef _VMW_ZEROCOPY_PRIV_H_
+#define _VMW_ZEROCOPY_PRIV_H_
+
+#include <linux/math.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vmw_zerocopy.h>
+#include <asm/page.h>
+
+#define VMW_ZC_MAX_BUFFER_SIZE   SZ_64K
+
+/*
+ * Worst-case pages spanned by a max-size buffer: the +1 covers a buffer whose
+ * start is not page aligned and therefore straddles one additional page.
+ */
+#define VMW_ZC_MAX_PAGES (DIV_ROUND_UP(VMW_ZC_MAX_BUFFER_SIZE, PAGE_SIZE) + 1)
+
+/* Wire-format messages sent to the peer over the transport (driver private). */
+struct vmw_zc_msg_unit {
+	u32 offset;
+	u32 length;
+	u32 num_pages;
+	u32 pad;
+	u64 page_pfns[VMW_ZC_MAX_PAGES];
+};
+
+struct vmw_zc_user_buffer_pair {
+	struct vmw_zc_msg_unit data;
+	struct vmw_zc_msg_unit metadata;
+};
+
+struct vmw_zc_host_raw {
+	u8 raw[VMW_ZC_MAX_RAW_BUFFER_LEN];
+};
+
+union vmw_zc_host_body {
+	struct vmw_zc_user_buffer_pair user_buf;
+	struct vmw_zc_host_raw raw;
+};
+
+struct vmw_zc_host_message {
+	u32 message_type;
+	u32 pad;
+	union vmw_zc_host_body body;
+};
+
+/*
+ * A transport delivers a filled-in message to its peer. The destination is
+ * owned entirely by the transport backend: userspace supplies no address and
+ * cannot influence where a message is sent.
+ */
+struct vmw_zc_transport_ops {
+	int (*init)(void);
+	void (*exit)(void);
+	int (*send)(const struct vmw_zc_host_message *msg);
+};
+
+extern const struct vmw_zc_transport_ops vmw_zc_vmci_transport;
+
+#endif /* _VMW_ZEROCOPY_PRIV_H_ */
diff --git a/drivers/misc/vmw_zerocopy_vmci.c b/drivers/misc/vmw_zerocopy_vmci.c
new file mode 100644
index 000000000000..39aadc1afaad
--- /dev/null
+++ b/drivers/misc/vmw_zerocopy_vmci.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/build_bug.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/vmw_vmci_api.h>
+
+#include "vmw_zerocopy_priv.h"
+
+/*
+ * On-wire layout: a VMCI datagram header immediately followed by our payload.
+ * Built on the stack per send, so the send path holds no shared state and
+ * needs no lock. Must not be const: vmci_route() may rewrite src.context.
+ */
+struct vmw_zc_vmci_wire {
+	struct vmci_datagram hdr;
+	struct vmw_zc_host_message payload;
+};
+
+static struct vmci_handle vmw_zc_vmci_src_hdl;
+
+/* Driver is send-only; responses from the hypervisor are not expected. */
+static int vmw_zc_vmci_dgram_cb(void *cookie __always_unused,
+				struct vmci_datagram *dg __always_unused)
+{
+	return 0;
+}
+
+/*
+ * Map a VMCI send failure to an errno, modelled on
+ * vmci_transport_error_to_vsock_error(). Distinguishing these matters most for
+ * the unreachable cases: they are what a guest sees when the hypervisor has no
+ * listener on VMCI_VMWZC_DST_RID, which must not look like a transient failure.
+ */
+static int vmw_zc_vmci_errno(int vmci_error)
+{
+	switch (vmci_error) {
+	case VMCI_ERROR_INVALID_RESOURCE:
+	case VMCI_ERROR_NO_HANDLE:
+	case VMCI_ERROR_DST_UNREACHABLE:
+		return -EHOSTUNREACH;
+	case VMCI_ERROR_NO_MEM:
+		return -ENOMEM;
+	case VMCI_ERROR_NO_RESOURCES:
+		return -ENOBUFS;
+	case VMCI_ERROR_PAYLOAD_TOO_LARGE:
+		return -EMSGSIZE;
+	case VMCI_ERROR_NO_ACCESS:
+	case VMCI_ERROR_INVALID_PRIV:
+		return -EPERM;
+	case VMCI_ERROR_INVALID_ARGS:
+		return -EINVAL;
+	default:
+		return -EIO;
+	}
+}
+
+static int vmw_zc_vmci_send(const struct vmw_zc_host_message *msg)
+{
+	struct vmw_zc_vmci_wire wire = { };
+	int ret;
+
+	BUILD_BUG_ON(offsetof(struct vmw_zc_vmci_wire, payload) !=
+		     VMCI_DG_HEADERSIZE);
+	BUILD_BUG_ON(sizeof(wire) > VMCI_MAX_DG_SIZE);
+
+	/*
+	 * The destination is fixed by the host ABI (VMCI_VMWZC_DST_RID in
+	 * VMCI's reserved hypervisor datagram range); userspace never selects
+	 * it. @message_type in the payload distinguishes operations.
+	 */
+	wire.hdr.dst.context = VMCI_HYPERVISOR_CONTEXT_ID;
+	wire.hdr.dst.resource = VMCI_VMWZC_DST_RID;
+	wire.hdr.src = vmw_zc_vmci_src_hdl;
+	wire.hdr.payload_size = sizeof(wire.payload);
+
+	/*
+	 * memcpy, not struct assignment: the payload's union leaves its
+	 * inactive tail bytes unspecified, and kernel stacks are recycled.
+	 */
+	memcpy(&wire.payload, msg, sizeof(wire.payload));
+
+	ret = vmci_datagram_send(&wire.hdr);
+	if (ret < 0) {
+		pr_err_ratelimited("failed to send VMCI datagram: %d\n", ret);
+		return vmw_zc_vmci_errno(ret);
+	}
+	return 0;
+}
+
+static int vmw_zc_vmci_init(void)
+{
+	int ret;
+
+	vmw_zc_vmci_src_hdl = VMCI_INVALID_HANDLE;
+
+	ret = vmci_datagram_create_handle(VMCI_INVALID_ID, 0,
+					  vmw_zc_vmci_dgram_cb, NULL,
+					  &vmw_zc_vmci_src_hdl);
+	if (ret != VMCI_SUCCESS) {
+		pr_err("failed to create VMCI datagram handle: %d\n", ret);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void vmw_zc_vmci_exit(void)
+{
+	int ret;
+
+	if (!vmci_handle_is_invalid(vmw_zc_vmci_src_hdl)) {
+		ret = vmci_datagram_destroy_handle(vmw_zc_vmci_src_hdl);
+		if (ret != VMCI_SUCCESS) {
+			pr_err("failed to destroy VMCI datagram handle: %d\n",
+			       ret);
+		}
+	}
+	vmw_zc_vmci_src_hdl = VMCI_INVALID_HANDLE;
+}
+
+const struct vmw_zc_transport_ops vmw_zc_vmci_transport = {
+	.init = vmw_zc_vmci_init,
+	.exit = vmw_zc_vmci_exit,
+	.send = vmw_zc_vmci_send,
+};
diff --git a/include/uapi/linux/vmw_zerocopy.h b/include/uapi/linux/vmw_zerocopy.h
new file mode 100644
index 000000000000..0fa263870df1
--- /dev/null
+++ b/include/uapi/linux/vmw_zerocopy.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ */
+
+#ifndef _UAPI_LINUX_VMW_ZEROCOPY_H_
+#define _UAPI_LINUX_VMW_ZEROCOPY_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define VMW_ZC_DEVICE_NAME		"vmw_zc"
+#define VMW_ZC_IOCTL_MAGIC		0xDC
+/*
+ * Largest inline payload that keeps sizeof(struct vmw_zc_guest_message)
+ * at 48 bytes
+ */
+#define VMW_ZC_MAX_RAW_BUFFER_LEN	36
+
+/*
+ * Used for sending user buffer.
+ *
+ * Pointers are __u64 so the struct layout is identical on 32-bit and 64-bit
+ * userspace. The ioctl argument pointer itself is converted by
+ * compat_ptr_ioctl(); the driver uses u64_to_user_ptr() on these fields.
+ *
+ * Set buffer or metadata to 0 to indicate absence.
+ * At least one must be non-zero.
+ */
+struct vmw_zc_guest_data {
+	__u64 buffer;
+	__u64 metadata;
+	__u32 buffer_length;
+	__u32 metadata_length;
+};
+
+struct vmw_zc_guest_raw_buffer {
+	__u8 raw_buffer[VMW_ZC_MAX_RAW_BUFFER_LEN];
+	__u32 raw_len;
+};
+
+/*
+ * @message_type: numeric values (see below). User-buffer transfer uses
+ * @u.data; small inline payload uses @u.raw_buffer.
+ * @reserved: must be zero. The destination is fixed by the driver and cannot
+ * be selected by userspace.
+ */
+#define VMW_ZC_MSG_USER_BUFFER		1
+#define VMW_ZC_MSG_RAW			2
+
+struct vmw_zc_guest_message {
+	__u32 message_type;
+	__u32 reserved;
+	union {
+		struct vmw_zc_guest_data data;
+		struct vmw_zc_guest_raw_buffer raw_buffer;
+	} u;
+};
+
+#define VMW_ZC_IOCTL_NR_MSG		0x01
+
+#define VMW_ZC_IOCTL_MSG \
+	_IOW(VMW_ZC_IOCTL_MAGIC, VMW_ZC_IOCTL_NR_MSG, struct vmw_zc_guest_message)
+
+#endif /* _UAPI_LINUX_VMW_ZEROCOPY_H_ */
-- 
2.52.0

