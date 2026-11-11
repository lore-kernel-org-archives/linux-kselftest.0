Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425058;
	b=TehSpyi+9pOSOh/kWyWN4sYwJlBBGyizqvmm2wur3habNsQz9OzUTcneDjewp6Yq9aOA
	 znlhZSqDim71q6ny6RsH5zQkHwBVa4tr09AB1xPbeF4/MZR2BfyKMrhUC12Uj5cwvPVwh
	 0F0kfejpSO5NIKJsMIefINP3Mw3u8bnD4SALNSlDKLj2/PJJaprGJATGzjhiSHdr4BYeN
	 mu6KNOF3CYhDE/9bxmI6HEk/rVpd8VrqFHdA20SfD6RCV4pBJSvBZwY+ilQgSS05XAWOA
	 xqo1e3DxZhA88m6KLu6iX4NqTJtIzc+iXYFTZERBoKLmulkOdsZ+2leb5shNONwAasg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
	b=ETxRK1p3Ps6Yzc6ICUromYUO/3USTHSMaY1xS6qUCniSVrg69/l52RiMexzGhvkBAynm
	 vFZPoKBaY8qD8O2212mKTg3iKhv4x3wdi3L3u5jtNc0kTvetWA9rDPkTHdKffrRd9WmiF
	 mstQHuWbblWPy3F2tlKu9Q8kenQsr1WJwrYqgcAsJuutb6y3Ka7kHvw6QjrhbmmjNVZZj
	 UdUAlg5PEp4mIHw/C5/g5Ihm53yr1ic2Qca21titrePw+sTqITFgjFPwh6vq2WCsMVeVm
	 EW6+0Wm5tO2LPOg8Nvh1rv4t6wbqEE1ilhQUREN/88Y7wKDs2I9VckAJNDZnxHtHHkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KqDGXT6s;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25835606A8BD
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 19:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25835606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KqDGXT6s
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so2486652b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 11:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425057; x=1795029857; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
        b=KqDGXT6sHwxeuWqo8YplC2Ceb9xg+9zSmZThwIsQvt2GedE/QEV6pbzsu3tpPxAEbt
         fqrdrqCJioAudnnhcPnpgu0LgJI1yN61YRZkFlgh4B3aZFjxfmiidRDIVL7fvLq1UVOq
         MvK9Ou3hPvxDpyg1iPrWSuO1kPKdk0MItTwB21eYhGOAu83p8l1FwjdL7G2xpl4EsPRv
         oNbOIZ5tZGO8pwExlshG31m5aRc7+6TLjfnGqIU9fzQQDPhc4iNA6o2m803h4jOHtL40
         QrV/hM01WPvp0ygNA8B2ZzQdG4Z+6lH1t9q3hekvBRIuhrUpss2kHVS6P250crF7pp9M
         vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425057; x=1795029857;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
        b=KeOotAQT8/0pAIOBDfLsWYMOC6Jw318E1sY401xPGLXjiPoVWhGUmq6Bb8fxLQliGf
         1P8DjYhvj3HPGnlB1AKmEMWnTbBVJ6vb4GLTP+ZoUdkhsTQ1PBgNaJXinD4p4WHcuYbR
         ai0qBT/kCBzS4yG/ZcFtDhxWUkn4DHmBmwXbfbh2n1jpZeURfuFw4dPkmreQXg96nhW4
         Bhdov+NWA0HOiq7E4LkVv9j2u5QPGXfHA06b31Ylq6UrA5qnL09twVBEqvEmK+li529Z
         ewe9DC3IA158YTMhDLRUf5ZXYsS/rk8TaAvf0BGEnN6SB0+Bd8ThfbcLA/WMAzEI/g6l
         0npg==
X-Forwarded-Encrypted: i=1; AL+hErH5P3r3VCvJKvwoqoUYCTtV3f1iOdJYKP4IFdCli5Y0wpBcCI7aON/vo/2idTPy3eawf1l/7EqQkzUM+ICLQr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hf1pMhkd6u9Zn2o0mPW0Uyg11iot1s46udqbVPdkuJfkphqF1
	lXrfBoIoX9ovzAlwkw+xj2K61+FdtFiju53gxI8DQUM8R9aK/PSs6hd2NBC6zfa39/5eMDnQDWD
	/3PYeFb4amafptQ==
X-Received: from ilbdx27-n1.prod.google.com ([2002:a05:6e02:421b:10b0:53d:3ab5:58fa])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1382:b0:567:f784:f939 with SMTP id 5614622812f47-56b9791019amr2605655b6e.51.1794425056843;
 Wed, 11 Nov 2026 11:24:16 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:05 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-2-dmatlack@google.com>
Subject: [RFC PATCH 1/7] vfio: selftests: Add vfio_pci_find_mem_bar() helper
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Mina Almasry <almasrymina@google.com>

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

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
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
2.56.0.567.gdb80ae8cd5-goog

