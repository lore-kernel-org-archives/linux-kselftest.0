Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000D356747
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630407; cv=none; b=ZocVyOurchcu/12TxhgVnJHUxhMx02rVDUiJ7P6ic/2UUCLQrr7iB7hnTDzi5pFSNNPS/6wpd0NdccDpy28qFCflow20G2lTRiskCWD3hSj7ZSvV/tkz4aGK0i0Et+1tqjWjC35I7PjnoRL6vcauTLn8Dv2IPwA/c0RN4KxKzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630407; c=relaxed/simple;
	bh=4VnGiJfrZQCqXxaU6ZsqSy06u9XeMGJXWufGnIgPPj8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EufbqRywYeZC+V6SoCC2IMrbxjrdu/V2u3AP107DCi9SoZy6x4sfXa7/feh+TeKtBJO7VQwku9Ml91uYf5EbBwKQcHKt2+NO7OILGaWXxo3G/KC9HnQnaqaebDKjWhRCZA9BWhPvey73X/g1jUerZKheeUxK4bn7Dw8lSoGLLYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=IG7dbthv; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="IG7dbthv"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so13876156d6.2
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630404; x=1781235204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=burVgKt+U0bNdZ+S4i+8PCamSBgPUcyGmVaC5AfN7II=;
        b=IG7dbthvtwOgTcsbdpqQD5BzOVj/s4prSAq675YXZ6lx4ZNX8+9F93OHKf/RmcQrs2
         MZuodwKBSXSLYTphbsRsx6hesWi2uf55VDfYQBCvX9FDydGCs4aR3DOqwwuRfyEWnA57
         4wWbdW/AwhoykqZw8Fv7egOO8vjfSdkPF1ajQysCo27tzUHAUaiiIXgQZUr15oM1bucE
         LxvF8i8bRnUlc6QWOpvX3K4bjkY7jOPOlNash4ykwm28Y0ISGnS6Yxv8AVRrSn4c75wM
         04DahOvYN7QHiSgWHF5flM9kSHDzElbvhDXfQCuh5YbQvoIjVIykizUMNrgrQVIRhJcB
         ebDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630404; x=1781235204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=burVgKt+U0bNdZ+S4i+8PCamSBgPUcyGmVaC5AfN7II=;
        b=FpMVSuj1AF2RBjVpF4XnI04cmuqyAnf/WN6QJm8/FTZv1UcPnir345+1+QhBmQy7jX
         fPjbzXdjMa2ytAUaUApNFbP0eNVzaV5+8sAyEe+EUfDePX/0R4HalZMpjjAaqSPBMjl/
         JLhq7hb/HYY2A58t1XACMaOWcARDFsRB54ct79funX8MAwlHPBhcSsC1H6WSSvzYqIlp
         k6V6uoYjG3rdRlhPUhmRB6YCVx/jZcyFyur2eH6ZQ1SFbsd5KyMa7iVjDTSAEil+r8WF
         xjc1oONin3Ah9GmvMG9PpjVCOTmmzzkT6A4vVlgYKlMMSJfCvaDE7Mo1lS3rBfecMNda
         jzWA==
X-Gm-Message-State: AOJu0Yzth1R9DzrTZzXjuNM/gkm/XV30AWQxzsSPupewgbhOh2wcqR7j
	Rhtwa2P9mENLd98xvgbK32k1HBtNxAtdvYW2i5zDYj6hTZJJYajHgVJ5SEtx0hMwUPX2rYRQwoT
	iXi/6
X-Gm-Gg: Acq92OF5Y2K/Q/79u13bsbQKi7CeMr8j5K93/ETRUENlnc2usumqD1lLCGvrP0mCzco
	FB/l0UbnEND2TUTCzJswa+hnOoxsLGdeIgCQI8x7ViAEauYhn1pCUuwp0ketVqhybB0o1Ho4+E5
	1qaWPgH/UUmZzcJo3str0o/DIi+dNlFvSzYmChYn1kbiypaeQnD6Y8S9/8t0crZbdGjRPnyyo79
	H3ZYRdQJCeZ1ncLCYEDCv/aufB/kNMbT9ppxddF6Tkf/tAhhQHCqlptFjOabmXtVc1obm8oLZ9r
	Hc99tgxbmqjCEGeWD+CMknQmo58aRG+w2NJOK5NtIiUE+EDOKkucMkT4ABISkpz48rmlmu/IK2X
	ffk2kCCEfJyOPppmvD8vtTgwMMaKGyuTNYbzMHH34MFBVwrWHmnOY1ekoIzfJ9IBQ66dIT5CAio
	8Pgaj7CoULFFbSPK0fmhimIw1gjVdzEFoJPqZQRreMKOgRPv8n24BBvtemi7Yd7bjnBV8tW4Wa
X-Received: by 2002:a05:6214:2d07:b0:8cc:f882:2562 with SMTP id 6a1803df08f44-8cee61497cdmr30262576d6.39.1780630404187;
        Thu, 04 Jun 2026 20:33:24 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd263003sm71383816d6.42.2026.06.04.20.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:23 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 4/9] kho: split vmalloc headers out of kexec_handover.h
Date: Fri,  5 Jun 2026 03:32:30 +0000
Message-ID: <20260605033235.717351-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the vmalloc-related ABI definitions and header declarations out
of the monolithic kexec_handover.h header into a dedicated header
file (vmalloc.h).

This is a pure code movement patch; no logic or functional changes are
introduced.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/abi.rst     |  3 +-
 include/linux/kexec_handover.h         | 18 -----
 include/linux/kho/abi/kexec_handover.h | 77 +-------------------
 include/linux/kho/abi/memfd.h          |  3 +-
 include/linux/kho/abi/vmalloc.h        | 99 ++++++++++++++++++++++++++
 include/linux/kho/vmalloc.h            | 34 +++++++++
 6 files changed, 137 insertions(+), 97 deletions(-)
 create mode 100644 include/linux/kho/abi/vmalloc.h
 create mode 100644 include/linux/kho/vmalloc.h

diff --git a/Documentation/core-api/kho/abi.rst b/Documentation/core-api/kho/abi.rst
index da5c6636bb17..b61363679829 100644
--- a/Documentation/core-api/kho/abi.rst
+++ b/Documentation/core-api/kho/abi.rst
@@ -13,8 +13,7 @@ Core Kexec Handover ABI
 vmalloc preservation ABI
 ========================
 
-.. kernel-doc:: include/linux/kho/abi/kexec_handover.h
-   :doc: Kexec Handover ABI for vmalloc Preservation
+.. kernel-doc:: include/linux/kho/abi/vmalloc.h
 
 memblock preservation ABI
 =========================
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 8968c56d2d73..518fdab2a4d1 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -11,8 +11,6 @@ struct kho_scratch {
 	phys_addr_t size;
 };
 
-struct kho_vmalloc;
-
 struct folio;
 struct page;
 
@@ -24,14 +22,11 @@ int kho_preserve_folio(struct folio *folio);
 void kho_unpreserve_folio(struct folio *folio);
 int kho_preserve_pages(struct page *page, unsigned long nr_pages);
 void kho_unpreserve_pages(struct page *page, unsigned long nr_pages);
-int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation);
-void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation);
 void *kho_alloc_preserve(size_t size);
 void kho_unpreserve_free(void *mem);
 void kho_restore_free(void *mem);
 struct folio *kho_restore_folio(phys_addr_t phys);
 struct page *kho_restore_pages(phys_addr_t phys, unsigned long nr_pages);
-void *kho_restore_vmalloc(const struct kho_vmalloc *preservation);
 int kho_add_subtree(const char *name, void *blob, size_t size);
 void kho_remove_subtree(void *blob);
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size);
@@ -65,14 +60,6 @@ static inline int kho_preserve_pages(struct page *page, unsigned int nr_pages)
 
 static inline void kho_unpreserve_pages(struct page *page, unsigned int nr_pages) { }
 
-static inline int kho_preserve_vmalloc(void *ptr,
-				       struct kho_vmalloc *preservation)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation) { }
-
 static inline void *kho_alloc_preserve(size_t size)
 {
 	return ERR_PTR(-EOPNOTSUPP);
@@ -92,11 +79,6 @@ static inline struct page *kho_restore_pages(phys_addr_t phys,
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
diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index 99e4a53d4e35..c893b5045078 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -96,80 +96,5 @@
 /* The FDT property for the size of preserved data blobs. */
 #define KHO_SUB_TREE_SIZE_PROP_NAME "blob-size"
 
-/**
- * DOC: Kexec Handover ABI for vmalloc Preservation
- *
- * The Kexec Handover ABI for preserving vmalloc'ed memory is defined by
- * a set of structures and helper macros. The layout of these structures is a
- * stable contract between kernels and is versioned by the KHO_FDT_COMPATIBLE
- * string.
- *
- * The preservation is managed through a main descriptor &struct kho_vmalloc,
- * which points to a linked list of &struct kho_vmalloc_chunk structures. These
- * chunks contain the physical addresses of the preserved pages, allowing the
- * next kernel to reconstruct the vmalloc area with the same content and layout.
- * Helper macros are also defined for storing and loading pointers within
- * these structures.
- */
-
-/* Helper macro to define a union for a serializable pointer. */
-#define DECLARE_KHOSER_PTR(name, type)	\
-	union {                        \
-		u64 phys;              \
-		type ptr;              \
-	} name
-
-/* Stores the physical address of a serializable pointer. */
-#define KHOSER_STORE_PTR(dest, val)               \
-	({                                        \
-		typeof(val) v = val;              \
-		typecheck(typeof((dest).ptr), v); \
-		(dest).phys = virt_to_phys(v);    \
-	})
-
-/* Loads the stored physical address back to a pointer. */
-#define KHOSER_LOAD_PTR(src)						\
-	({                                                                   \
-		typeof(src) s = src;                                         \
-		(typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NULL); \
-	})
-
-/*
- * This header is embedded at the beginning of each `kho_vmalloc_chunk`
- * and contains a pointer to the next chunk in the linked list,
- * stored as a physical address for handover.
- */
-struct kho_vmalloc_hdr {
-	DECLARE_KHOSER_PTR(next, struct kho_vmalloc_chunk *);
-};
-
-#define KHO_VMALLOC_SIZE				\
-	((PAGE_SIZE - sizeof(struct kho_vmalloc_hdr)) / \
-	 sizeof(u64))
-
-/*
- * Each chunk is a single page and is part of a linked list that describes
- * a preserved vmalloc area. It contains the header with the link to the next
- * chunk and a zero terminated array of physical addresses of the pages that
- * make up the preserved vmalloc area.
- */
-struct kho_vmalloc_chunk {
-	struct kho_vmalloc_hdr hdr;
-	u64 phys[KHO_VMALLOC_SIZE];
-};
-
-static_assert(sizeof(struct kho_vmalloc_chunk) == PAGE_SIZE);
-
-/*
- * Describes a preserved vmalloc memory area, including the
- * total number of pages, allocation flags, page order, and a pointer to the
- * first chunk of physical page addresses.
- */
-struct kho_vmalloc {
-	DECLARE_KHOSER_PTR(first, struct kho_vmalloc_chunk *);
-	unsigned int total_pages;
-	unsigned short flags;
-	unsigned short order;
-};
-
 #endif	/* _LINUX_KHO_ABI_KEXEC_HANDOVER_H */
+
diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
index 08b10fea2afc..af310c0c9fdf 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/memfd.h
@@ -11,8 +11,9 @@
 #ifndef _LINUX_KHO_ABI_MEMFD_H
 #define _LINUX_KHO_ABI_MEMFD_H
 
-#include <linux/types.h>
 #include <linux/kho/abi/kexec_handover.h>
+#include <linux/kho/abi/vmalloc.h>
+#include <linux/types.h>
 
 /**
  * DOC: memfd Live Update ABI
diff --git a/include/linux/kho/abi/vmalloc.h b/include/linux/kho/abi/vmalloc.h
new file mode 100644
index 000000000000..87650e1dd774
--- /dev/null
+++ b/include/linux/kho/abi/vmalloc.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
+ * Copyright (C) 2025 Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: Kexec Handover ABI for vmalloc Preservation
+ *
+ * The Kexec Handover ABI for preserving vmalloc'ed memory is defined by
+ * a set of structures and helper macros. The layout of these structures is a
+ * stable contract between kernels and is versioned by the KHO_FDT_COMPATIBLE
+ * string.
+ *
+ * This interface is a contract. Any modification to the structure fields,
+ * compatible strings, or the layout of the serialization structures defined
+ * here constitutes a breaking change. Such changes require incrementing the
+ * version number in the `KHO_FDT_COMPATIBLE` string to prevent a new kernel
+ * from misinterpreting data from an old kernel.
+ *
+ * Changes are allowed provided the compatibility version is incremented;
+ * however, backward/forward compatibility is only guaranteed for kernels
+ * supporting the same ABI version.
+ *
+ * The preservation is managed through a main descriptor &struct kho_vmalloc,
+ * which points to a linked list of &struct kho_vmalloc_chunk structures. These
+ * chunks contain the physical addresses of the preserved pages, allowing the
+ * next kernel to reconstruct the vmalloc area with the same content and layout.
+ * Helper macros are also defined for storing and loading pointers within
+ * these structures.
+ */
+
+#ifndef _LINUX_KHO_ABI_VMALLOC_H
+#define _LINUX_KHO_ABI_VMALLOC_H
+
+#include <linux/types.h>
+#include <asm/page.h>
+
+/* Helper macro to define a union for a serializable pointer. */
+#define DECLARE_KHOSER_PTR(name, type)	\
+	union {                        \
+		u64 phys;              \
+		type ptr;              \
+	} name
+
+/* Stores the physical address of a serializable pointer. */
+#define KHOSER_STORE_PTR(dest, val)               \
+	({                                        \
+		typeof(val) v = val;              \
+		typecheck(typeof((dest).ptr), v); \
+		(dest).phys = virt_to_phys(v);    \
+	})
+
+/* Loads the stored physical address back to a pointer. */
+#define KHOSER_LOAD_PTR(src)						\
+	({                                                                   \
+		typeof(src) s = src;                                         \
+		(typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NULL); \
+	})
+
+/*
+ * This header is embedded at the beginning of each `kho_vmalloc_chunk`
+ * and contains a pointer to the next chunk in the linked list,
+ * stored as a physical address for handover.
+ */
+struct kho_vmalloc_hdr {
+	DECLARE_KHOSER_PTR(next, struct kho_vmalloc_chunk *);
+};
+
+#define KHO_VMALLOC_SIZE				\
+	((PAGE_SIZE - sizeof(struct kho_vmalloc_hdr)) / \
+	 sizeof(u64))
+
+/*
+ * Each chunk is a single page and is part of a linked list that describes
+ * a preserved vmalloc area. It contains the header with the link to the next
+ * chunk and a zero terminated array of physical addresses of the pages that
+ * make up the preserved vmalloc area.
+ */
+struct kho_vmalloc_chunk {
+	struct kho_vmalloc_hdr hdr;
+	u64 phys[KHO_VMALLOC_SIZE];
+};
+
+static_assert(sizeof(struct kho_vmalloc_chunk) == PAGE_SIZE);
+
+/*
+ * Describes a preserved vmalloc memory area, including the
+ * total number of pages, allocation flags, page order, and a pointer to the
+ * first chunk of physical page addresses.
+ */
+struct kho_vmalloc {
+	DECLARE_KHOSER_PTR(first, struct kho_vmalloc_chunk *);
+	unsigned int total_pages;
+	unsigned short flags;
+	unsigned short order;
+};
+
+#endif /* _LINUX_KHO_ABI_VMALLOC_H */
diff --git a/include/linux/kho/vmalloc.h b/include/linux/kho/vmalloc.h
new file mode 100644
index 000000000000..2d1b5d282a93
--- /dev/null
+++ b/include/linux/kho/vmalloc.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KHO_VMALLOC_H
+#define _LINUX_KHO_VMALLOC_H
+
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kho/abi/vmalloc.h>
+
+struct page;
+
+#ifdef CONFIG_KEXEC_HANDOVER
+
+int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation);
+void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation);
+void *kho_restore_vmalloc(const struct kho_vmalloc *preservation);
+
+#else /* CONFIG_KEXEC_HANDOVER */
+
+static inline int kho_preserve_vmalloc(void *ptr,
+				       struct kho_vmalloc *preservation)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation) { }
+
+static inline void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
+{
+	return NULL;
+}
+
+#endif /* CONFIG_KEXEC_HANDOVER */
+
+#endif /* _LINUX_KHO_VMALLOC_H */
-- 
2.53.0

