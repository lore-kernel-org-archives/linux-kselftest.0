Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1134F46D
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375888; cv=none; b=tz6hAwGouqVGyag5jJgtJqsM0i01VVoCvXTwzUb9MmNd3UoIIFnuy/xDg/9pC+iuE3yH0CIBeRQoeAbUomqMKSiHKCorjDFKrzXqHFuFX/BSbNFQ29QTISQlAfVtDyMFCD8wX2EJ5YGJCcF/GEWYzd+xhVzOeC/TfJ88I/+PAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375888; c=relaxed/simple;
	bh=axf0FM892AaEMkSyb6ikipbuNQSim3KRcfZZeEEkI40=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfbA6dQuJVnJUyzD5ZJ47ytJjIO3pdwZIe1ipXw9PsiKM4bPOOsKtqk9mfuo2Yx9fnYCKRqwwjooiyabJOm2PLnaoKomc2MsadKkxwc7RWPmJJUBJy4s4RqjYNf/qRZc0SKL/u9f2YLOIH3kv2jNt04INww7lvKqQj9vl6iXLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eU8iYIXr; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eU8iYIXr"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1045154137.2
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375885; x=1792980685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o+nrhNDuMNDIXcN5ka0CBGl7Y6gPG5XpskqSI0he2Xg=;
        b=eU8iYIXr0PA0zBC6bzqe4C46PAroRwVDjZc6b76t26WtOZfvcUHtLNA+VkOCMfkyCW
         Vu5pv6Amki7tP9+882WFfaDJoOpxRnK4ngU5/vnqSq9gr5v3GOHK4+vKW38t8GbaUo56
         k1PEnZuLpfPW24splZFSCBpNhLacunNKbpy9R9vH7OYZqZU0igczrUifzNFtYJkgbPXY
         cLA8KHOXHK+u56pjVi/V5jjXOhshBIU82luoXRwHjrNh3xtq3WbAqgjLfhcj3snNEgqZ
         0HV6bI4EkTAlehg2f6HBKWqo8+JOC9RWYwot8wsgkX2j0GUR+aRjTqCSrr8uo3c0qJey
         4+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375885; x=1792980685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o+nrhNDuMNDIXcN5ka0CBGl7Y6gPG5XpskqSI0he2Xg=;
        b=mPh4hSwv2aey2NkctEx/QytMOF8TMIPeHT0QSEaA7v3WSltgUpzkj2oe9kSIuFWkw0
         SaRkiTl1GYEV3QT96RzR/2arbM1jWXKykBeLDNgsliBU6mgdBdJZSIQFoFd09I0LXoT7
         hqcZDpLnZs/43myg3Bx5b/Gugr88tbOmf4NwzfK1xRQsGEmou8Q1JwTizaGqP46kIqOa
         v0Y3IUbLUhJMRv2BRU26B9LFZ7bczxKjsdIEocJbKEcSe9k1Rz46wwSTrNyx1HfJUZyG
         f3hoK60eyG2Z646ohSjobyONwdKAmrbSJ2MIGTp/i9me0HcIOoLg3n/jXJL+lZSDb0iY
         JdOA==
X-Gm-Message-State: AFq9FYKbPioD5WtsrHlHDZH1R63rNWMExBA10ax3NXy2LADJGRsX/9Su
	ZVE9WUHwnL4qhw3Q6T5pv4Ml1n5i5CsW9GY9IYIUM9DJpUsR4dQd+uKy718ux8du3nScXODp7Po
	5Rves
X-Gm-Gg: AYBFou3ZFu1jcpPIh/Ru+GXQ5f4xCzN+UWcZi7gpzSd6bYMqV6tEmbsAGZhjRR7UXmJ
	pv99QvgFeRRQUXLYFlL9ziL5DJj1G3JuPIvIITfg+n1K3EmxpFyTXH0tXX8+BGAMv41TtC9WU2p
	Aq59MHXkdPc4DYtMTJo4fc/DPs4Z4C5pIdtlYbXcYUSOuJa8xe55VJ+xUFtLrRPswsxh1wUoxzb
	FhJq9DJWzWsfd3Y8pTnpoH58XcJXar9wCN3ilDI0C4oMyXsnGoUcBcV2dqtLTvZarVNU5hoeg6k
	WTkMVRf6cJX9PzcmLAz0ZLzauFj5gV9IRjvRkzZi0tPuDKzo7lwFteNh+u0/rGgToPxDLSH3A+9
	vnth3qCPo5fjjZ+9dhfbyCGXFpv+LHmmfduo1eOcftNF6OHbwcEvcPMERSj2xOwOKYZBJ/8ZiCF
	xL8MUagrjCm1GbwOHeZFxZnFCToCRyxf1T9kzzjVn0V3i2G6TU9/2Aetut1ICZw+LLjUqgjLAZw
	nmtec3A+QclTkiYW7+dHxsuSY9jANQYSsXCsyJFEbhXj3WYs+3NF3HW3CQlYV+qXbE4rISHGULJ
	Ry4r/Lk2O3A/xpsn3pY=
X-Received: by 2002:a05:6102:5127:b0:7b3:4199:2dd4 with SMTP id ada2fe7eead31-7cc369eba74mr1881622137.20.1792375884813;
        Sun, 18 Oct 2026 19:11:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:24 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 5/8] kho: add read-only Kexec Handover mode
Date: Sun, 18 Oct 2026 22:11:08 -0400
Message-ID: <20261019021111.990394-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CONFIG_KEXEC_HANDOVER_READONLY and the 'kho_ro=<pa>' kernel
command-line parameter to support traversing a preserved KHO tree in
read-only mode without taking ownership of or modifying KHO metadata or
reclaiming preserved pages into the page allocator.

When booted with 'kho_ro=<pa>', preserved KHO metadata (FDT, radix-tree
nodes, and vmalloc chunks) lies outside the kernel's direct map and is
mapped read-only (PAGE_KERNEL_RO), with the FDT and radix-tree nodes
mapped lazily on first visit and kept cached. This allows
kho_retrieve_subtree(), kho_restore_vmalloc(), and
kho_ro_lookup_folio_order() to inspect the preserved KHO state while
leaving it intact.

Also export kho_ro_map_folio() and kho_ro_unmap() so callers (such as
kho_block, LUO, and file handlers) can map preserved folios verified
against the KHO radix tree with the desired page protections.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../admin-guide/kernel-parameters.txt         |   6 +
 include/linux/kexec_handover.h                |  53 ++-
 kernel/liveupdate/Kconfig                     |  16 +
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kexec_handover_ro.c         | 378 ++++++++++++++++++
 5 files changed, 441 insertions(+), 13 deletions(-)
 create mode 100644 kernel/liveupdate/kexec_handover_ro.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3b89b54db550..594d0b468f32 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3051,6 +3051,12 @@ Kernel parameters
 			bootmem areas.  The form "nn%" defines scale factor
 			(in percents) of memory that was used during boot.
 
+	kho_ro=		[KEXEC,EARLY]
+			Format: <phys_addr>
+			Enables read-only Kexec HandOver mode, pointing to the
+			page-aligned physical address of a preserved KHO FDT
+			blob. Requires CONFIG_KEXEC_HANDOVER_READONLY.
+
 	kmac=		[MIPS] Korina ethernet MAC address.
 			Configure the RouterBoard 532 series on-chip
 			Ethernet adapter MAC address.
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index ef2b188c8ed0..1f75c2f94be5 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -13,6 +13,46 @@ struct kho_vmalloc;
 struct folio;
 struct page;
 
+#if defined(CONFIG_KEXEC_HANDOVER) || defined(CONFIG_KEXEC_HANDOVER_READONLY)
+void *kho_restore_vmalloc(const struct kho_vmalloc *preservation);
+int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size);
+#else
+static inline void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
+{
+	return NULL;
+}
+
+static inline int kho_retrieve_subtree(const char *name, phys_addr_t *phys,
+				       size_t *size)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_KEXEC_HANDOVER || CONFIG_KEXEC_HANDOVER_READONLY */
+
+#ifdef CONFIG_KEXEC_HANDOVER_READONLY
+bool kho_is_ro(void);
+int kho_ro_lookup_folio_order(phys_addr_t pa);
+void *kho_ro_map_folio(phys_addr_t pa, pgprot_t prot);
+void kho_ro_unmap(const void *addr);
+#else
+static inline bool kho_is_ro(void)
+{
+	return false;
+}
+
+static inline int kho_ro_lookup_folio_order(phys_addr_t pa)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void *kho_ro_map_folio(phys_addr_t pa, pgprot_t prot)
+{
+	return NULL;
+}
+
+static inline void kho_ro_unmap(const void *addr) { }
+#endif /* CONFIG_KEXEC_HANDOVER_READONLY */
+
 #ifdef CONFIG_KEXEC_HANDOVER
 bool kho_is_enabled(void);
 bool is_kho_boot(void);
@@ -28,10 +68,8 @@ void kho_unpreserve_free(void *mem);
 void kho_restore_free(void *mem);
 struct folio *kho_restore_folio(phys_addr_t phys);
 struct page *kho_restore_pages(phys_addr_t phys, unsigned long nr_pages);
-void *kho_restore_vmalloc(const struct kho_vmalloc *preservation);
 int kho_add_subtree(const char *name, void *blob, size_t size);
 void kho_remove_subtree(void *blob);
-int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size);
 
 void kho_memory_init(void);
 void kho_memory_init_early(void);
@@ -100,11 +138,6 @@ static inline struct page *kho_restore_pages(phys_addr_t phys,
 	return NULL;
 }
 
-static inline void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
-{
-	return NULL;
-}
-
 static inline int kho_add_subtree(const char *name, void *blob, size_t size)
 {
 	return -EOPNOTSUPP;
@@ -112,12 +145,6 @@ static inline int kho_add_subtree(const char *name, void *blob, size_t size)
 
 static inline void kho_remove_subtree(void *blob) { }
 
-static inline int kho_retrieve_subtree(const char *name, phys_addr_t *phys,
-				       size_t *size)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline void kho_memory_init(void) { }
 
 static inline void kho_memory_init_early(void) { }
diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index f50daee8eff0..362b7a3e2629 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -48,6 +48,22 @@ config KEXEC_HANDOVER_ENABLE_DEFAULT
 	  The default behavior can still be overridden at boot time by
 	  passing 'kho=off'.
 
+config KEXEC_HANDOVER_READONLY
+	bool "Read-only kexec handover"
+	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && !KEXEC_HANDOVER
+	select LIBFDT
+	help
+	  Enable read-only Kexec Handover ('kho_ro=<pa>'). This allows a
+	  kernel to traverse preserved KHO subtrees, radix trees, and
+	  metadata in read-only mode without taking ownership of or
+	  modifying the KHO metadata.
+
+	  Pages outside of KHO metadata can still be modified; for example,
+	  a preserved file descriptor can be retrieved while remaining in
+	  frozen mode (disallowing resize, hole punch, or faulting in new
+	  memory), while the memory content of the file can still be
+	  modified.
+
 config LIVEUPDATE
 	bool "Live Update Orchestrator"
 	depends on KEXEC_HANDOVER
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index d9f469462556..f8b09e04bea2 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -8,6 +8,7 @@ luo-y :=								\
 		luo_session.o
 
 obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
+obj-$(CONFIG_KEXEC_HANDOVER_READONLY)	+= kexec_handover_ro.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
diff --git a/kernel/liveupdate/kexec_handover_ro.c b/kernel/liveupdate/kexec_handover_ro.c
new file mode 100644
index 000000000000..f5d5e9495778
--- /dev/null
+++ b/kernel/liveupdate/kexec_handover_ro.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * kexec_handover_ro.c - Read-Only Kexec Handover backend
+ *
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Implements the read-only KHO backend (kho_ro=<pa>). In read-only mode, KHO
+ * is not enabled for outgoing or incoming page ownership transfer and makes no
+ * changes to boot or struct page initialization. Instead, when subsystems
+ * retrieve preserved state, this backend traverses the KHO FDT, radix tree,
+ * and preserved metadata by mapping physical pages read-only (PAGE_KERNEL_RO)
+ * without modifying or freeing the KHO metadata or reclaiming the preserved
+ * pages. The KHO FDT and radix-tree page tables are mapped read-only lazily on
+ * first access and remain mapped for the lifetime of the kernel.
+ *
+ * Pages outside of KHO metadata can still be modified. For example, a
+ * preserved file descriptor can be retrieved while remaining in frozen mode:
+ * its layout cannot be changed (no resize, hole punch, or faulting in new
+ * memory), but the memory content of the file can still be modified. If a
+ * caller in LUO or a file handler needs read-write access to preserved pages,
+ * it can map them with PAGE_KERNEL via kho_ro_map_folio().
+ */
+
+#define pr_fmt(fmt) "KHO-RO: " fmt
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kexec_handover.h>
+#include <linux/kho/abi/kexec_handover.h>
+#include <linux/libfdt.h>
+#include <linux/minmax.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include "kexec_handover_internal.h"
+
+struct kho_ro_radix_node {
+	const struct kho_radix_node *phys_node;
+	void *children[1 << KHO_TABLE_SIZE_LOG2];
+};
+
+static bool kho_ro __ro_after_init;
+static phys_addr_t kho_ro_fdt_phys __ro_after_init;
+static DEFINE_MUTEX(kho_ro_lock);
+static const void *kho_ro_fdt;
+static struct kho_ro_radix_node *kho_ro_radix_root;
+
+/**
+ * kho_is_ro - Check if KHO is operating in read-only mode.
+ *
+ * Return: true if read-only KHO mode is active, false otherwise.
+ */
+bool kho_is_ro(void)
+{
+	return kho_ro;
+}
+EXPORT_SYMBOL_GPL(kho_is_ro);
+
+static int __init kho_parse_ro(char *p)
+{
+	unsigned long long pa;
+	int err;
+
+	if (!p)
+		return -EINVAL;
+
+	err = kstrtoull(p, 0, &pa);
+	if (err || !pa || !PAGE_ALIGNED(pa)) {
+		pr_err("Invalid kho_ro address '%s'\n", p);
+		return -EINVAL;
+	}
+
+	kho_ro_fdt_phys = pa;
+	kho_ro = true;
+	pr_info("Read-only mode enabled with FDT at 0x%llx\n", pa);
+	return 0;
+}
+early_param("kho_ro", kho_parse_ro);
+
+static void *kho_ro_map(phys_addr_t pa, size_t size, pgprot_t prot)
+{
+	struct vm_struct *area;
+	unsigned long vaddr;
+
+	if (!kho_ro || !pa || !size || !PAGE_ALIGNED(pa | size))
+		return NULL;
+
+	if (pa + size - 1 < pa)
+		return NULL;
+
+	if (region_intersects(pa, size, IORESOURCE_SYSTEM_RAM,
+			      IORES_DESC_NONE) != REGION_DISJOINT) {
+		pr_warn_once("Cannot map System RAM at %pa (size 0x%zx)\n",
+			     &pa, size);
+		return NULL;
+	}
+
+	area = get_vm_area_caller(size, VM_IOREMAP, __builtin_return_address(0));
+	if (!area)
+		return NULL;
+
+	vaddr = (unsigned long)area->addr;
+	area->phys_addr = pa;
+
+	if (ioremap_page_range(vaddr, vaddr + size, pa, prot)) {
+		free_vm_area(area);
+		return NULL;
+	}
+
+	return area->addr;
+}
+
+/**
+ * kho_ro_unmap - Unmap a KHO read-only mode virtual mapping.
+ * @addr: Virtual address previously returned by kho_ro_map_folio().
+ */
+void kho_ro_unmap(const void *addr)
+{
+	if (addr)
+		vunmap(addr);
+}
+EXPORT_SYMBOL_GPL(kho_ro_unmap);
+
+static const void *kho_ro_get_fdt(void)
+{
+	const void *fdt;
+
+	if (!kho_ro || !kho_ro_fdt_phys)
+		return NULL;
+
+	guard(mutex)(&kho_ro_lock);
+	if (kho_ro_fdt)
+		return kho_ro_fdt;
+
+	fdt = kho_ro_map(kho_ro_fdt_phys, PAGE_SIZE, PAGE_KERNEL_RO);
+	if (!fdt) {
+		pr_err_once("Failed to map FDT at 0x%llx\n",
+			    (unsigned long long)kho_ro_fdt_phys);
+		return NULL;
+	}
+
+	if (!fdt_check_header(fdt) && fdt_totalsize(fdt) > PAGE_SIZE) {
+		pr_warn("handover FDT (0x%llx) totalsize %u exceeds PAGE_SIZE\n",
+			(unsigned long long)kho_ro_fdt_phys, fdt_totalsize(fdt));
+		kho_ro_unmap(fdt);
+		return NULL;
+	}
+
+	if (kho_check_fdt(fdt, kho_ro_fdt_phys)) {
+		kho_ro_unmap(fdt);
+		return NULL;
+	}
+
+	kho_ro_fdt = fdt;
+	return fdt;
+}
+
+static struct kho_ro_radix_node *kho_ro_alloc_radix_node(phys_addr_t pa)
+{
+	const struct kho_radix_node *phys_node;
+	struct kho_ro_radix_node *node;
+
+	phys_node = kho_ro_map(pa, PAGE_SIZE, PAGE_KERNEL_RO);
+	if (!phys_node)
+		return NULL;
+
+	node = kzalloc_obj(*node);
+	if (!node) {
+		kho_ro_unmap(phys_node);
+		return NULL;
+	}
+
+	node->phys_node = phys_node;
+	return node;
+}
+
+static bool kho_ro_radix_key_exists(struct kho_ro_radix_node *root,
+				    unsigned long key)
+{
+	struct kho_ro_radix_node *node = root;
+	const struct kho_radix_leaf *leaf;
+	unsigned int i, idx;
+
+	if (!node || unlikely(fls64(key) > KHO_RADIX_KEY_WIDTH))
+		return false;
+
+	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+		idx = kho_radix_get_table_index(key, i);
+		if (!node->children[idx]) {
+			phys_addr_t next_pa = node->phys_node->table[idx];
+
+			if (i == 1)
+				node->children[idx] = kho_ro_map(next_pa, PAGE_SIZE,
+								 PAGE_KERNEL_RO);
+			else
+				node->children[idx] = kho_ro_alloc_radix_node(next_pa);
+			if (!node->children[idx])
+				return false;
+		}
+
+		if (i == 1) {
+			leaf = node->children[idx];
+			return test_bit(kho_radix_get_bitmap_index(key),
+					leaf->bitmap);
+		}
+
+		node = node->children[idx];
+	}
+
+	return false;
+}
+
+/**
+ * kho_retrieve_subtree - Retrieve a preserved sub-blob by name from KHO root FDT.
+ * @name: Name of the subnode in the KHO root FDT.
+ * @phys: Output pointer for the physical address of the preserved sub-blob.
+ * @size: Optional output pointer for the size in bytes of the sub-blob.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size)
+{
+	return __kho_retrieve_subtree(kho_ro_get_fdt(), name, phys, size);
+}
+EXPORT_SYMBOL_GPL(kho_retrieve_subtree);
+
+/**
+ * kho_ro_lookup_folio_order - Look up the preserved order of a physical page in KHO.
+ * @pa: Page-aligned physical address of the preserved folio.
+ *
+ * Queries the preserved KHO memory radix tree in read-only mode to determine
+ * the order at which @pa was preserved.
+ *
+ * Return: Non-negative page order on success, -ENOENT if @pa is not preserved,
+ * or -EOPNOTSUPP if read-only KHO is not active.
+ */
+int kho_ro_lookup_folio_order(phys_addr_t pa)
+{
+	unsigned int order, max_order;
+	const void *fdt;
+
+	if (!kho_ro)
+		return -EOPNOTSUPP;
+	if (!pa || !PAGE_ALIGNED(pa))
+		return -ENOENT;
+
+	fdt = kho_ro_get_fdt();
+	if (!fdt)
+		return -ENOENT;
+
+	guard(mutex)(&kho_ro_lock);
+	if (!kho_ro_radix_root) {
+		kho_ro_radix_root = kho_ro_alloc_radix_node(kho_get_mem_map_phys(fdt));
+		if (!kho_ro_radix_root)
+			return -ENOENT;
+	}
+
+	max_order = min3((unsigned int)__ffs64(pa >> PAGE_SHIFT),
+			 (unsigned int)(BITS_PER_LONG - PAGE_SHIFT - 1),
+			 (unsigned int)(KHO_RADIX_KEY_WIDTH - 2));
+
+	for (order = 0; order <= max_order; order++) {
+		unsigned long key = kho_encode_radix_key(pa, order);
+
+		if (kho_ro_radix_key_exists(kho_ro_radix_root, key))
+			return (int)order;
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(kho_ro_lookup_folio_order);
+
+/**
+ * kho_ro_map_folio - Map a preserved KHO folio into kernel virtual address space.
+ * @pa:   Page-aligned physical address of the preserved folio.
+ * @prot: Page protection flags for the mapping (e.g. PAGE_KERNEL_RO or PAGE_KERNEL).
+ *
+ * Looks up @pa in the preserved KHO radix tree to determine its folio order
+ * and maps the entire folio (PAGE_SIZE << order) into kernel virtual address
+ * space with @prot permissions. Pair with kho_ro_unmap().
+ *
+ * Return: Virtual pointer to the mapped folio on success, or NULL on failure.
+ */
+void *kho_ro_map_folio(phys_addr_t pa, pgprot_t prot)
+{
+	int order = kho_ro_lookup_folio_order(pa);
+
+	if (order < 0)
+		return NULL;
+
+	return kho_ro_map(pa, PAGE_SIZE << order, prot);
+}
+EXPORT_SYMBOL_GPL(kho_ro_map_folio);
+
+/**
+ * kho_restore_vmalloc - Reconstruct a preserved vmalloc region in read-only mode.
+ * @preservation: Pointer to the KHO vmalloc preservation metadata.
+ *
+ * Allocates a new vmalloc buffer and copies the preserved physical pages into
+ * it via temporary read-only mappings so that the caller can inspect and later
+ * vfree() the buffer without modifying or reclaiming the underlying preserved
+ * KHO pages.
+ *
+ * Return: Virtual pointer to the newly allocated copy on success, or NULL on
+ * failure.
+ */
+void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
+{
+	size_t total_size, contig_size, copied = 0;
+	const struct kho_vmalloc_chunk *chunk;
+	unsigned int order, vm_flags;
+	phys_addr_t chunk_pa;
+	void *buf;
+
+	if (!kho_ro || !kho_vmalloc_validate(preservation, &vm_flags))
+		return NULL;
+
+	order = preservation->order;
+	contig_size = PAGE_SIZE << order;
+	total_size = preservation->total_pages * PAGE_SIZE;
+
+	buf = vmalloc(total_size);
+	if (!buf)
+		return NULL;
+
+	for (chunk_pa = preservation->first.phys; chunk_pa; ) {
+		unsigned int i;
+
+		if (kho_ro_lookup_folio_order(chunk_pa) != 0)
+			goto err_free;
+
+		chunk = kho_ro_map(chunk_pa, PAGE_SIZE, PAGE_KERNEL_RO);
+		if (!chunk)
+			goto err_free;
+
+		for (i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
+			phys_addr_t phys = chunk->phys[i];
+			const void *src;
+
+			if (copied + contig_size > total_size ||
+			    kho_ro_lookup_folio_order(phys) != order)
+				goto err_unmap;
+
+			src = kho_ro_map(phys, contig_size, PAGE_KERNEL_RO);
+			if (!src)
+				goto err_unmap;
+
+			memcpy(buf + copied, src, contig_size);
+			kho_ro_unmap(src);
+			copied += contig_size;
+		}
+
+		chunk_pa = chunk->hdr.next.phys;
+		if (chunk_pa && i < ARRAY_SIZE(chunk->phys))
+			goto err_unmap;
+
+		kho_ro_unmap(chunk);
+	}
+
+	if (copied != total_size)
+		goto err_free;
+
+	return buf;
+
+err_unmap:
+	kho_ro_unmap(chunk);
+err_free:
+	vfree(buf);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(kho_restore_vmalloc);
-- 
2.56.0.176.g3575e65682-goog

