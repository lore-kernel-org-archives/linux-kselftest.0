Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660689;
	b=GYPftPztdW6vAOSgsyWRMgkNk/5GgoPeD1Ig+nJvuA/Y5qmEDENz/2AKwOzs+wQ1iWTm
	 E0EpV8B5qxfwmBctW4ITRguskL33Cz5NyzBEDVX9DZ0SenGJQEXSPtLujb0AfYeiTLH2c
	 vwLH2INQqYkFBX0D4+AXa6wvKiBlOG/bN7qIB8G86uCMLDXiIK5I7a8PBGZ6js4IL5V4U
	 drYByG8LFwstAwvV9A8fCG+QGAtezLImJdTIo5sFsN20OxsOzw6C3z2dp2/J7J04zDvPw
	 RXe8ITCywL9T+kbz6NA0PTHuvk9HUbaBgYV/iLeVm6xee+4BQ+G9X5+8+walbKL/zcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YEj4kYhe5ADuzN5GqpYHAgSBQBoLaCXMFrV0usEUmHU=;
	b=aJoDlsCW9XkwtwTcq8b2DIbTPfx3DyHcYKN1uREQ68L4YXWkDhiL7Lw109gmNK0ETRlE
	 SMSD/JPfP323MGAXqf8gmkPe8EdwFe9Cv9NPN3Em673y8fOyPPHFtyHkaUM0LHnp45KQj
	 gdbHGPMfIzyTVg93ZWMhzoRPKHtn+M+ZpoCezsZSGTNOyduijM0TEcJaZXPmolHOm+aIJ
	 GRvudIgwhJb6z/fhJtEnB9PDh2j1MTb3vIRzHSkTAINQC4eBXVqJk4EuRnNcZbYa3QMWw
	 ptD5TapV8EUn2ekk3XzD+VWWPxk9sleiOPu98pHZ8Cyy7WstXOfT8X9r2z4dZm+H8iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K0Abb189;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019D606D80D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9019D606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K0Abb189
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so15176946eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793660689; x=1794265489; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEj4kYhe5ADuzN5GqpYHAgSBQBoLaCXMFrV0usEUmHU=;
        b=K0Abb189ppFffgoGnuneXRGnZ68fHem23RbG7kAjxtqZucoC6I9vJr/gcBEvcz7yyY
         a1qsWmEwh/jImUHYE6oV3FaJsYrNOqqPot4EFVCF8iXYeQml3gLjlld/kHLP6EdSt7tw
         wcfZ0bNcBUhp9jKAfWuam50lS5TUMtqcdBUe+eswQ34WljgGK6F16Pksv2Hgs50/ro6F
         REe3cmOSSBx0NHDt8gxtvx1PGFjU98e/B9Y6JoLJbH4jpn1fQfksOgBz2hOK0GYotbPW
         w2QlpmIZUtJ2CKY9MeuKVOi85LFdLHyg9YYXs5O+4jvCinZOOPJRPo69cVeIDkc8eA4x
         JCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660689; x=1794265489;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEj4kYhe5ADuzN5GqpYHAgSBQBoLaCXMFrV0usEUmHU=;
        b=s0YmTXTTk+lmNbllsCMwbDJjwP3BWSPhWtTM16qyVMepkZ3a0fIugsQgiGklFhpeii
         tY/koVlUzOH3B5mIYsQ3kV1MQNSo5u+7SZLIv5AFKzVvU4w5y81T8JvyVfv4bDyiZP+3
         ICmnBLzQ7vtG7VXTm4IkPYHt4tXuTCJd9pjmTuaOMkAv60zMWUmnKh08AkhYGy2YX/4v
         9VO6BdiVOo3eZ2kkHZ3liKINHRkP8V83+3uVOfNDRu8T2OdV2KUdJUZUcpPscAW6ik6D
         JHNQxPH8YSRxHPHpiva7jRoyspeZKT3VnjLyO97crzrHqjbDymJnSUXUSglKWESsW/a3
         Bc/A==
X-Forwarded-Encrypted: i=1; AKwUvBzcPzhZKjdO/pOshiZwrzrq9A8z3DxvNRk4xHxbBKsIW4AGVd0RM8K8Veb+P/FmW4qcVNsvuvGge12KnHRkfdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ttFOFNLS7lBXimXEQQIOhydqjCq/XlMsrAljT5I5VXCXUapJt
	vURm5sdo0C6QlYFcoREqiocEr6SfskH/XfpgxuEncGJUvp14fL73XpQ/lTxvxBxZP1WBFOetFN4
	TYDJPS7WH+tE2oZ4NSJ+nTtXpxg==
X-Received: from dyaz26-n2.prod.google.com ([2002:a05:693c:639a:20b0:36a:1d37:273b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr18700867eec.34.1793660688520;
 Mon, 02 Nov 2026 15:04:48 -0800 (PST)
Date: Mon,  2 Nov 2026 23:04:44 +0000
In-Reply-To: <20261102230445.3993629-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102230445.3993629-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102230445.3993629-3-almasrymina@google.com>
Subject: [PATCH v3 2/3] vfio: selftests: Add vfio_pci_find_mem_bar() helper
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	Matt Evans <matt@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
a BAR) of at least min_size bytes that behaves like ordinary memory and
can be safely read and written without device-specific side effects.

Detection is backed by a table of known devices, starting with QEMU's
pci-testdev (1b36:0005) BAR 2 when configured with membar=<size> and
membar-backed=on.

Suggested-by: David Matlack <dmatlack@google.com>
Cc: David Matlack <dmatlack@google.com>
Cc: Matt Evans <matt@ozlabs.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     | 10 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 67 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 007adc322c1e..19d458adba1a 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -15,6 +15,13 @@ struct vfio_pci_bar {
 	void *vaddr;
 };
 
+struct vfio_pci_mem_bar {
+	struct vfio_pci_bar *bar;
+	void *vaddr;
+	u64 offset;
+	u64 size;
+};
+
 struct vfio_pci_device {
 	const char *bdf;
 	int fd;
@@ -162,6 +169,9 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 		(device_id == vfio_pci_config_readw(device, PCI_DEVICE_ID));
 }
 
+bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
+			   struct vfio_pci_mem_bar *mem_bar);
+
 const char *vfio_pci_get_cdev_path(const char *bdf);
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..d5308fe61490 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -19,6 +19,7 @@
 #include <linux/log2.h>
 #include <linux/mman.h>
 #include <linux/overflow.h>
+#include <linux/pci_ids.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 #include <linux/vfio.h>
@@ -245,6 +246,72 @@ static void vfio_pci_bar_unmap_all(struct vfio_pci_device *device)
 	}
 }
 
+#define PCI_DEVICE_ID_REDHAT_TEST	0x0005
+
+struct vfio_pci_mem_bar_desc {
+	u16 vendor_id;
+	u16 device_id;
+	u8 bar_index;
+	u64 offset;
+	u64 size;
+};
+
+static const struct vfio_pci_mem_bar_desc mem_bar_descs[] = {
+	/* QEMU pci-testdev with membar=<size>,membar-backed=on */
+	{
+		.vendor_id = PCI_VENDOR_ID_REDHAT,
+		.device_id = PCI_DEVICE_ID_REDHAT_TEST,
+		.bar_index = 2,
+	},
+};
+
+bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
+			   struct vfio_pci_mem_bar *mem_bar)
+{
+	const u32 rw_mmap_flags = VFIO_REGION_INFO_FLAG_MMAP |
+				  VFIO_REGION_INFO_FLAG_READ |
+				  VFIO_REGION_INFO_FLAG_WRITE;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(mem_bar_descs); i++) {
+		const struct vfio_pci_mem_bar_desc *desc = &mem_bar_descs[i];
+		struct vfio_pci_bar *bar;
+		u64 size;
+
+		if (!vfio_pci_device_match(device, desc->vendor_id,
+					   desc->device_id))
+			continue;
+
+		VFIO_ASSERT_LT(desc->bar_index, PCI_STD_NUM_BARS);
+		bar = &device->bars[desc->bar_index];
+
+		if ((bar->info.flags & rw_mmap_flags) != rw_mmap_flags)
+			continue;
+
+		VFIO_ASSERT_NOT_NULL(bar->vaddr);
+
+		if (bar->info.size <= desc->offset)
+			continue;
+
+		size = bar->info.size - desc->offset;
+		if (desc->size)
+			size = min(size, desc->size);
+
+		if (size < min_size)
+			continue;
+
+		*mem_bar = (struct vfio_pci_mem_bar){
+			.bar = bar,
+			.vaddr = bar->vaddr + desc->offset,
+			.offset = desc->offset,
+			.size = size,
+		};
+		return true;
+	}
+
+	return false;
+}
+
 void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 			    size_t config, size_t size, void *data)
 {
-- 
2.56.0.385.gac671c819a-goog

