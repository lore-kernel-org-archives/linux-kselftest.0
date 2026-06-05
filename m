Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D53019C3
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630384; cv=none; b=CWONIdnzuPMtK0JHwRygVGMLdIG1tITcB5+aFLuLSwqjecdJed4Z5caneOxrWHYh1YZpDUGXJLbtSbO6M/GxjPly+Rx/fB0PopHLrYhKKRVbRkNwo/pUF632+HfBuFLq/BCuhCq2Rh9D277/d/1vUvI6VtIUgwOTn0l8Mk5krw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630384; c=relaxed/simple;
	bh=rOeFjgPk4CSLdGSn9QYgjdyrytAmThRn/Tq/NmxTwLk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuFp86h8hoSMHiTp6D7E1Qvlsu/lU3oqr9+4rCoIsxCDmZElAFMkA6sS60KX3q/XvWocjsO8l3txG5I5a6x8L1slDGJEOOt8kD93vFa2Z5xhgBhkh4qEVXcB7KXBw6fi/qQmWv1df8NWkCTWmLi+92XlpPrJEg8i5eLxkJEDd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=H54a2VnC; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="H54a2VnC"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9157b949fc7so188282485a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630381; x=1781235181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGemO6oM+fzlXtG0xc8ivWmdV7Y8sG7GsOK7Le1P9V4=;
        b=H54a2VnCcll/IkIjcldyF/LfJ0ciFsYvFXJ4yLzXqyyvWG42jhtx/FjFIz3UeO0d7b
         1BcfRUs1JWWayUPW0PbbofKXK+ecm0mjlfQUqO0eU3fgAv+faCBCfW/3tgidIKJ7xcNq
         WJcJCSVMxrTdom7EgbaR2NnafZ2396p/AefXsTu9SHvcZaikuOdcQSJrr4QVYBWTuxZA
         hneDTQDjFRAUGDy2KRHzGfTCGmus1F8bdqzMAwq7vf2ze2fSNUIm62URkcXAo2UdVkuw
         2UHj70IkQ4BhDxIJrYrviFtMWMQ6FvvoLZf/wxgp+FWjrcV0AWiIJ8qK1rIynXupBDuY
         1byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630381; x=1781235181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CGemO6oM+fzlXtG0xc8ivWmdV7Y8sG7GsOK7Le1P9V4=;
        b=QYKrd5uQPLfD2JRUw5FGlOPKDs/dr26YHbOHrBE0+j8Ee8XuqS9WcODG1W5NVcBdt1
         bgtu4W89wtnAcNV1errdAZv6a+fQorN4iWLF/viB9GlMl1FPXAB0WZnPA+t29V2Xb92q
         jaGsGntH8d24UvgLUMmwHi3dg6wNO9hthagzCZJUW57EnI8W/BtXvac1EFPB+sAUngtw
         msHGAqYGS9Tyr/Y+z/3ImhaqQdJHXPc9qoRlG1Ti2XUryMpqFafqyl3/dIViM8Fh1bKy
         Hk3NuGu4+cnw1iKyU1XddRVGF1Ab8cNimTSB0XWSqrWS7pqbzMsVFxvpjFxB5cvfYpe3
         iJ/g==
X-Gm-Message-State: AOJu0YzbGo6Zlmjkoi8lN7vslLWv+cMewDbudt1IZt5ql4bLyKzQlDbD
	4uf289m1HpU+MdoN7OaPUb22rSEmycZvFgxwlFHxCax40SUNe7WQ49+qrfHEdwBbLo939rZU57v
	Y7cko
X-Gm-Gg: Acq92OH2RVTub+OZVibkovPjRmqhZGFnkozSwdGLErr8E7wlryFAvGBx12aJBIJo/ll
	DG5Q6bmC8zMWqXY7qIhFEn3u1GRq9ZKRRqxgyHldoSDfqvXmMSuwsjAX2Wvzv7nm0QUx6mONDnY
	JW1QmvFUTQ26qr+3SwI/MLOEI2GVxTRAQQRhCPf5pHdoNOtIvrXPKl9sFnPPDbhLVaYHMBUGGJ1
	zqD+0AGh3qhNvLtZxOjtDq2VN2OdlCjl8EzQ/6rRNHD4/e9DN2dOa1dum466d7G7/TkH5nMfw4V
	vvwW3Ipol274X5Aax8axc7tl5lXKTtMXhOoFMdBJlKAkXVl/S2HGD6chRV6JCcmAsoqzqBPjYy1
	3kdBUf2PA39ieiYdMb9iFBZrq5Si+CaDDv6wUKcvW6CY3Gs1kUrz46+xchTIzuPR5pNDe6R25rp
	qRT8mhn2fjB3kg6YJ94jypRsdnkt7p3SCm6hseMXXJMAVEBeXTDMXfUNr/33ELng==
X-Received: by 2002:a05:620a:1709:b0:914:cc9d:e29 with SMTP id af79cd13be357-915a9cadf6fmr346442685a.21.1780630380676;
        Thu, 04 Jun 2026 20:33:00 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm70807166d6.14.2026.06.04.20.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:00 -0700 (PDT)
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
Subject: [RFC v1 2/9] kho: split radix tree headers out of kexec_handover.h
Date: Fri,  5 Jun 2026 03:32:28 +0000
Message-ID: <20260605033235.717351-3-pasha.tatashin@soleen.com>
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

Split the radix tree tracker-related ABI definitions and header
declarations out of the monolithic kexec_handover.h header into a
dedicated header file (radix_tree.h).

Additionally, rename kho_radix_tree.h to kho/radix_tree.h, organizing it
within the existing kho directory structure as more KHO data structures
are introduced.

This is a pure code movement patch; no logic or functional changes are
introduced.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/abi.rst            |   3 +-
 Documentation/core-api/kho/index.rst          |   2 +-
 include/linux/kho/abi/kexec_handover.h        | 114 ---------------
 include/linux/kho/abi/radix_tree.h            | 131 ++++++++++++++++++
 .../{kho_radix_tree.h => kho/radix_tree.h}    |   5 +-
 kernel/liveupdate/kexec_handover.c            |   2 +-
 kernel/liveupdate/kho_radix.c                 |   2 +-
 7 files changed, 137 insertions(+), 122 deletions(-)
 create mode 100644 include/linux/kho/abi/radix_tree.h
 rename include/linux/{kho_radix_tree.h => kho/radix_tree.h} (96%)

diff --git a/Documentation/core-api/kho/abi.rst b/Documentation/core-api/kho/abi.rst
index edeb5b311963..da5c6636bb17 100644
--- a/Documentation/core-api/kho/abi.rst
+++ b/Documentation/core-api/kho/abi.rst
@@ -25,8 +25,7 @@ memblock preservation ABI
 KHO persistent memory tracker ABI
 =================================
 
-.. kernel-doc:: include/linux/kho/abi/kexec_handover.h
-  :doc: KHO persistent memory tracker
+.. kernel-doc:: include/linux/kho/abi/radix_tree.h
 
 KHO serialization block ABI
 ===========================
diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index a9892c671ec3..f69367d217cf 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -74,7 +74,7 @@ the next KHO, because kexec can overwrite even the original kernel.
 Kexec Handover Radix Tree
 =========================
 
-.. kernel-doc:: include/linux/kho_radix_tree.h
+.. kernel-doc:: include/linux/kho/radix_tree.h
   :doc: Kexec Handover Radix Tree
 
 Public API
diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index 5e2eb8519bda..99e4a53d4e35 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -4,15 +4,10 @@
  * Copyright (C) 2023 Alexander Graf <graf@amazon.com>
  * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
  * Copyright (C) 2025 Google LLC, Changyuan Lyu <changyuanl@google.com>
- * Copyright (C) 2025 Google LLC, Jason Miu <jasonmiu@google.com>
  */
 
 #ifndef _LINUX_KHO_ABI_KEXEC_HANDOVER_H
 #define _LINUX_KHO_ABI_KEXEC_HANDOVER_H
-
-#include <linux/bits.h>
-#include <linux/log2.h>
-#include <linux/math.h>
 #include <linux/types.h>
 
 #include <asm/page.h>
@@ -177,113 +172,4 @@ struct kho_vmalloc {
 	unsigned short order;
 };
 
-/**
- * DOC: KHO persistent memory tracker
- *
- * KHO tracks preserved memory using a radix tree data structure. Each node of
- * the tree is exactly a single page. The leaf nodes are bitmaps where each set
- * bit is a preserved page of any order. The intermediate nodes are tables of
- * physical addresses that point to a lower level node.
- *
- * The tree hierarchy is shown below::
- *
- *   root
- *   +-------------------+
- *   |     Level 5       | (struct kho_radix_node)
- *   +-------------------+
- *     |
- *     v
- *   +-------------------+
- *   |     Level 4       | (struct kho_radix_node)
- *   +-------------------+
- *     |
- *     | ... (intermediate levels)
- *     |
- *     v
- *   +-------------------+
- *   |      Level 0      | (struct kho_radix_leaf)
- *   +-------------------+
- *
- * The tree is traversed using a key that encodes the page's physical address
- * (pa) and its order into a single unsigned long value. The encoded key value
- * is composed of two parts: the 'order bit' in the upper part and the
- * 'shifted physical address' in the lower part.::
- *
- *   +------------+-----------------------------+--------------------------+
- *   | Page Order | Order Bit                   | Shifted Physical Address |
- *   +------------+-----------------------------+--------------------------+
- *   | 0          | ...000100 ... (at bit 52)   | pa >> (PAGE_SHIFT + 0)   |
- *   | 1          | ...000010 ... (at bit 51)   | pa >> (PAGE_SHIFT + 1)   |
- *   | 2          | ...000001 ... (at bit 50)   | pa >> (PAGE_SHIFT + 2)   |
- *   | ...        | ...                         | ...                      |
- *   +------------+-----------------------------+--------------------------+
- *
- * Shifted Physical Address:
- * The 'shifted physical address' is the physical address normalized for its
- * order. It effectively represents the PFN shifted right by the order.
- *
- * Order Bit:
- * The 'order bit' encodes the page order by setting a single bit at a
- * specific position. The position of this bit itself represents the order.
- *
- * For instance, on a 64-bit system with 4KB pages (PAGE_SHIFT = 12), the
- * maximum range for the shifted physical address (for order 0) is 52 bits
- * (64 - 12). This address occupies bits [0-51]. For order 0, the order bit is
- * set at position 52.
- *
- * The following diagram illustrates how the encoded key value is split into
- * indices for the tree levels, with PAGE_SIZE of 4KB::
- *
- *        63:60   59:51    50:42    41:33    32:24    23:15         14:0
- *   +---------+--------+--------+--------+--------+--------+-----------------+
- *   |    0    |  Lv 5  |  Lv 4  |  Lv 3  |  Lv 2  |  Lv 1  |  Lv 0 (bitmap)  |
- *   +---------+--------+--------+--------+--------+--------+-----------------+
- *
- * The radix tree stores pages of all orders in a single 6-level hierarchy. It
- * efficiently shares higher tree levels, especially due to common zero top
- * address bits, allowing a single, efficient algorithm to manage all
- * pages. This bitmap approach also offers memory efficiency; for example, a
- * 512KB bitmap can cover a 16GB memory range for 0-order pages with PAGE_SIZE =
- * 4KB.
- *
- * The data structures defined here are part of the KHO ABI. Any modification
- * to these structures that breaks backward compatibility must be accompanied by
- * an update to the "compatible" string. This ensures that a newer kernel can
- * correctly interpret the data passed by an older kernel.
- */
-
-/*
- * Defines constants for the KHO radix tree structure, used to track preserved
- * memory. These constants govern the indexing, sizing, and depth of the tree.
- */
-enum kho_radix_consts {
-	/*
-	 * The bit position of the order bit (and also the length of the
-	 * shifted physical address) for an order-0 page.
-	 */
-	KHO_ORDER_0_LOG2 = 64 - PAGE_SHIFT,
-
-	/* Size of the table in kho_radix_node, in log2 */
-	KHO_TABLE_SIZE_LOG2 = const_ilog2(PAGE_SIZE / sizeof(phys_addr_t)),
-
-	/* Number of bits in the kho_radix_leaf bitmap, in log2 */
-	KHO_BITMAP_SIZE_LOG2 = PAGE_SHIFT + const_ilog2(BITS_PER_BYTE),
-
-	/*
-	 * The total tree depth is the number of intermediate levels
-	 * and 1 bitmap level.
-	 */
-	KHO_TREE_MAX_DEPTH =
-		DIV_ROUND_UP(KHO_ORDER_0_LOG2 - KHO_BITMAP_SIZE_LOG2 + 1,
-			     KHO_TABLE_SIZE_LOG2) + 1,
-};
-
-struct kho_radix_node {
-	u64 table[1 << KHO_TABLE_SIZE_LOG2];
-};
-
-struct kho_radix_leaf {
-	DECLARE_BITMAP(bitmap, 1 << KHO_BITMAP_SIZE_LOG2);
-};
-
 #endif	/* _LINUX_KHO_ABI_KEXEC_HANDOVER_H */
diff --git a/include/linux/kho/abi/radix_tree.h b/include/linux/kho/abi/radix_tree.h
new file mode 100644
index 000000000000..f4cc5c02f37a
--- /dev/null
+++ b/include/linux/kho/abi/radix_tree.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Google LLC, Jason Miu <jasonmiu@google.com>
+ * Copyright (C) 2026 Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#ifndef _LINUX_KHO_ABI_RADIX_TREE_H
+#define _LINUX_KHO_ABI_RADIX_TREE_H
+
+#include <linux/types.h>
+#include <asm/page.h>
+
+/**
+ * DOC: KHO persistent memory tracker
+ *
+ * Subsystems using the KHO persistent memory tracker rely on the stable
+ * Application Binary Interface defined below to pass serialized state from a
+ * pre-update kernel to a post-update kernel.
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
+ * KHO tracks preserved memory using a radix tree data structure. Each node of
+ * the tree is exactly a single page. The leaf nodes are bitmaps where each set
+ * bit is a preserved page of any order. The intermediate nodes are tables of
+ * physical addresses that point to a lower level node.
+ *
+ * The tree hierarchy is shown below::
+ *
+ *   root
+ *   +-------------------+
+ *   |     Level 5       | (struct kho_radix_node)
+ *   +-------------------+
+ *     |
+ *     v
+ *   +-------------------+
+ *   |     Level 4       | (struct kho_radix_node)
+ *   +-------------------+
+ *     |
+ *     | ... (intermediate levels)
+ *     |
+ *     v
+ *   +-------------------+
+ *   |      Level 0      | (struct kho_radix_leaf)
+ *   +-------------------+
+ *
+ * The tree is traversed using a key that encodes the page's physical address
+ * (pa) and its order into a single unsigned long value. The encoded key value
+ * is composed of two parts: the 'order bit' in the upper part and the
+ * 'shifted physical address' in the lower part.::
+ *
+ *   +------------+-----------------------------+--------------------------+
+ *   | Page Order | Order Bit                   | Shifted Physical Address |
+ *   +------------+-----------------------------+--------------------------+
+ *   | 0          | ...000100 ... (at bit 52)   | pa >> (PAGE_SHIFT + 0)   |
+ *   | 1          | ...000010 ... (at bit 51)   | pa >> (PAGE_SHIFT + 1)   |
+ *   | 2          | ...000001 ... (at bit 50)   | pa >> (PAGE_SHIFT + 2)   |
+ *   | ...        | ...                         | ...                      |
+ *   +------------+-----------------------------+--------------------------+
+ *
+ * Shifted Physical Address:
+ * The 'shifted physical address' is the physical address normalized for its
+ * order. It effectively represents the PFN shifted right by the order.
+ *
+ * Order Bit:
+ * The 'order bit' encodes the page order by setting a single bit at a
+ * specific position. The position of this bit itself represents the order.
+ *
+ * For instance, on a 64-bit system with 4KB pages (PAGE_SHIFT = 12), the
+ * maximum range for the shifted physical address (for order 0) is 52 bits
+ * (64 - 12). This address occupies bits [0-51]. For order 0, the order bit is
+ * set at position 52.
+ *
+ * The following diagram illustrates how the encoded key value is split into
+ * indices for the tree levels, with PAGE_SIZE of 4KB::
+ *
+ *        63:60   59:51    50:42    41:33    32:24    23:15         14:0
+ *   +---------+--------+--------+--------+--------+--------+-----------------+
+ *   |    0    |  Lv 5  |  Lv 4  |  Lv 3  |  Lv 2  |  Lv 1  |  Lv 0 (bitmap)  |
+ *   +---------+--------+--------+--------+--------+--------+-----------------+
+ *
+ * The radix tree stores pages of all orders in a single 6-level hierarchy. It
+ * efficiently shares higher tree levels, especially due to common zero top
+ * address bits, allowing a single, efficient algorithm to manage all
+ * pages. This bitmap approach also offers memory efficiency; for example, a
+ * 512KB bitmap can cover a 16GB memory range for 0-order pages with PAGE_SIZE =
+ * 4KB.
+ */
+
+/*
+ * Defines constants for the KHO radix tree structure, used to track preserved
+ * memory. These constants govern the indexing, sizing, and depth of the tree.
+ */
+enum kho_radix_consts {
+	/*
+	 * The bit position of the order bit (and also the length of the
+	 * shifted physical address) for an order-0 page.
+	 */
+	KHO_ORDER_0_LOG2 = 64 - PAGE_SHIFT,
+
+	/* Size of the table in kho_radix_node, in log2 */
+	KHO_TABLE_SIZE_LOG2 = const_ilog2(PAGE_SIZE / sizeof(phys_addr_t)),
+
+	/* Number of bits in the kho_radix_leaf bitmap, in log2 */
+	KHO_BITMAP_SIZE_LOG2 = PAGE_SHIFT + const_ilog2(BITS_PER_BYTE),
+
+	/*
+	 * The total tree depth is the number of intermediate levels
+	 * and 1 bitmap level.
+	 */
+	KHO_TREE_MAX_DEPTH =
+		DIV_ROUND_UP(KHO_ORDER_0_LOG2 - KHO_BITMAP_SIZE_LOG2 + 1,
+			     KHO_TABLE_SIZE_LOG2) + 1,
+};
+
+struct kho_radix_node {
+	u64 table[1 << KHO_TABLE_SIZE_LOG2];
+};
+
+struct kho_radix_leaf {
+	DECLARE_BITMAP(bitmap, 1 << KHO_BITMAP_SIZE_LOG2);
+};
+
+#endif /* _LINUX_KHO_ABI_RADIX_TREE_H */
diff --git a/include/linux/kho_radix_tree.h b/include/linux/kho/radix_tree.h
similarity index 96%
rename from include/linux/kho_radix_tree.h
rename to include/linux/kho/radix_tree.h
index 84e918b96e53..1e337e73deba 100644
--- a/include/linux/kho_radix_tree.h
+++ b/include/linux/kho/radix_tree.h
@@ -5,6 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/kho/abi/radix_tree.h>
 #include <linux/mutex_types.h>
 #include <linux/types.h>
 
@@ -24,11 +25,9 @@
  * Client code is responsible for allocating the root node of the tree,
  * initializing the mutex lock, and managing its lifecycle. It must use the
  * tree data structures defined in the KHO ABI,
- * `include/linux/kho/abi/kexec_handover.h`.
+ * `include/linux/kho/abi/radix_tree.h`.
  */
 
-struct kho_radix_node;
-
 struct kho_radix_tree {
 	struct kho_radix_node *root;
 	struct mutex lock; /* protects the tree's structure and root pointer */
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 041efff7ca11..4a3d6a54a17f 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -16,7 +16,7 @@
 #include <linux/kasan.h>
 #include <linux/kexec.h>
 #include <linux/kexec_handover.h>
-#include <linux/kho_radix_tree.h>
+#include <linux/kho/radix_tree.h>
 #include <linux/utsname.h>
 #include <linux/kho/abi/kexec_handover.h>
 #include <linux/kho/abi/kexec_metadata.h>
diff --git a/kernel/liveupdate/kho_radix.c b/kernel/liveupdate/kho_radix.c
index c836783a1376..f48088847264 100644
--- a/kernel/liveupdate/kho_radix.c
+++ b/kernel/liveupdate/kho_radix.c
@@ -11,7 +11,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kho/abi/kexec_handover.h>
-#include <linux/kho_radix_tree.h>
+#include <linux/kho/radix_tree.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
-- 
2.53.0

