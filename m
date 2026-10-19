Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9513603EE
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375884; cv=none; b=R1DETLaAHQM75q3r/iG5yzWUeHeNWlV+iOUqLM7wtSgcgMJu2nnvReGmHFiwj5lbXA3BY15rUuoN6zvfS7DJ2n8lPzPwFxdhTpmW7OZfYE1Xp7WsThx4COV6zU2zhlya+Kkv/9EIq71vKTRHfS6Leomy04USNTRosOrDYuabBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375884; c=relaxed/simple;
	bh=G+rxqRoYHDZpAabOCoPNGLYVfYbnr3Z0F+bjlcO/IjA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd8RXmSVxv9jBpHJhdf2s1RhbLCdSMIXW7+Thgesm/Gvd5hSzR1K1nvmHcUOASlCB0g35pV9dAtvMYZHAsnWkg4womFoCVUmQiCf083M5zOUs40bR1SNVlWy+fWfggBfuFCn5efN3BJd1ylTUwuX+l3SgHCpDjsrLAgqFsm1UjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TXb/2YlW; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TXb/2YlW"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1320550241.3
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375880; x=1792980680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ti3YkcfnTEBL5joWie6hwuLUXl2KXMMFurkAbb61S4=;
        b=TXb/2YlW7eDY1yl+OyZwDHSlmS+up4cWAmYl+hcOePNv890tLSeshV/5PyYTrZ8T0Z
         GPoCW3LoAMjr1iw0DDxjEScgC1arNam0Fi1oKCo2N3suBrl0l24xwW6+Ph2s7w0P+hAR
         uFKSKiamZrNsO3EGMOnkRL3JfmUMEjSVEoqNEv047WhuqLifNheZj3PCMhU6DKjW+tXo
         AS0XiFFafxJ3puR7oNcBPbw6eN5LodqCkAqD9RlONGC4l3Ax+esrLiZtpBs3qZE47a3b
         PcBLq6cQk8AxCxy3OOiPOWseH6PbP4jwrwjkcgwGTXC9ZNoiFxSAv78ywmzMgzi63Ihf
         PxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375880; x=1792980680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ti3YkcfnTEBL5joWie6hwuLUXl2KXMMFurkAbb61S4=;
        b=XwiBfBM3+nO0IWwRlyESRMDzGOXAiyoHFwa+SA41CtEfdkIWw0maesqD+qfoo30rMT
         neQdEWXvWnbwLL8mgLCScJyD/rgyYCcmBET1F977mVx1OZVF8AqyVTn58ZLuOHoyYOq4
         1OSjzIUlShtuh5rrS3zjgIruWa52qkyLme/rWl1Hz8J4LTwrz+aIicSKwOlnxocvEV/I
         pCj/RezVKtwfOAKJcJ2xFDpMamsi7RIFnwgHRt/5StMUeOjvCO74XFRRR1YHbK5XpJqF
         NqXOakTZPNZFdbDY61pD6Ch0qrW53nwhCUhz97g1Tyu8flELjLf11q7hY1/D1IjeKkKy
         0Exw==
X-Gm-Message-State: AFq9FYKk1lJi4cjA/Pzg2FizVgIR18xTw+/V42QQNak4FI8YB/sIq2Bq
	ffk496Vl9dtCrQP0II/rBeYnyGolv9/sc5/ET0V8e2bxTt/bsfd2URF1OJXwGpHap0xl0tZ799D
	sXhOV
X-Gm-Gg: AYBFou29+4BwIiHJwVSFtAujB2sw28GTbsVl5wr8ROc33xlVKJ47v8WisF1jl2PKMSp
	VW4S0c46fSf/UXixlFCR2gGojzJKXoOUuK6CogePK/xaDExtPWXOMTZs4cNBi9Tw27d1InTPoYf
	ukZsXoaTCjox6ol2r8JmYv5XHWOvXe928kC2Wmm+GjJNjKCY3B3wZM5LTqCJrEROUZ34Q3cxfLV
	V4V2nSaB69M64HuBRXTUQMFXIhSO4Rm1tQ9X6OVfE7M3gOiLDo/43+x0NxXiwEflSqPM+Kgg/u0
	+7FBlC8iQ/BsIh+VgPRmIKAcd6iyDmG/LT7FLAyid3wNcMAW8h6qU192ppwErXPRwogsQ3ip6sG
	eV/nf0ovb5CZ27jtSL30gFPepHaOhLH2OM9UGm8tTMdEr39V+Rnwfg5Ghs853L4bupP0o98qd7N
	1x4pwuTyyx2BjbWKF6s6ZUqzCGoPtJlkY4aum/jtggiwSzMjnfR6RdLVsADa3OkU4l14tjx7WNC
	3xRLdJVfksIqP6grmbiZCDPjGCYx81qfVAigbEG54z5Npt4nj6TqbZA0diP8z3sTjNuE3kDRsTf
	47mng4lJu8rZjS8OCyU=
X-Received: by 2002:a05:6102:26d0:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7cc36905d1emr2154033137.12.1792375880231;
        Sun, 18 Oct 2026 19:11:20 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:19 -0700 (PDT)
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
Subject: [PATCH v1 2/8] kho: move radix tree, vmalloc, and FDT helpers to internal header
Date: Sun, 18 Oct 2026 22:11:05 -0400
Message-ID: <20261019021111.990394-3-pasha.tatashin@soleen.com>
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

Move the shared KHO radix tree key encoding and indexing helpers,
vmalloc flag conversion helpers, and FDT validation and lookup helpers
from kexec_handover.c into kexec_handover_internal.h as static inline
functions.

The radix tree and vmalloc flag helpers are small bit-manipulation
routines, and the FDT helpers are small wrappers with a single call site
per translation unit, so it is natural to inline them in the internal
header.

This is going to be used by the upcoming KHO read-only mode to walk
preserved KHO radix trees, vmalloc preservation chains, and FDT
subtrees without duplicating the implementation.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c          | 115 +----------------
 kernel/liveupdate/kexec_handover_internal.h | 134 ++++++++++++++++++++
 2 files changed, 136 insertions(+), 113 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index ce5983abf181..f427cdd9a969 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -113,29 +113,6 @@ static const void *kho_get_fdt(void)
 	return kho_in.fdt_phys ? phys_to_virt(kho_in.fdt_phys) : NULL;
 }
 
-/**
- * kho_encode_radix_key - Encodes a physical address and order into a radix key.
- * @phys: The physical address of the page.
- * @order: The order of the page.
- *
- * This function combines a page's physical address and its order into a
- * single unsigned long, which is used as a key for all radix tree
- * operations.
- *
- * Return: The encoded unsigned long radix key.
- */
-static unsigned long kho_encode_radix_key(phys_addr_t phys, unsigned int order)
-{
-	/* The physical address is encoded by shifting the PFN by its order. */
-	unsigned long shift = PAGE_SHIFT + order;
-	/* Order bit goes right before the shifted PFN. */
-	unsigned long h = 1UL << (64 - shift);
-	/* Shifted PFN. */
-	unsigned long l = phys >> shift;
-
-	return h | l;
-}
-
 /**
  * kho_decode_radix_key - Decodes a radix key back into a physical address and order.
  * @key: The unsigned long key to decode.
@@ -161,20 +138,6 @@ static phys_addr_t kho_decode_radix_key(unsigned long key, unsigned int *order)
 	return phys;
 }
 
-static unsigned long kho_radix_get_bitmap_index(unsigned long key)
-{
-	return key % (1 << KHO_BITMAP_SIZE_LOG2);
-}
-
-static unsigned long kho_radix_get_table_index(unsigned long key,
-					       unsigned int level)
-{
-	int s;
-
-	s = ((level - 1) * KHO_TABLE_SIZE_LOG2) + KHO_BITMAP_SIZE_LOG2;
-	return (key >> s) % (1 << KHO_TABLE_SIZE_LOG2);
-}
-
 static void __ref *kho_radix_alloc_node(void)
 {
 	struct kho_radix_node *node;
@@ -634,21 +597,6 @@ static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
 	return 0;
 }
 
-/* Returns physical address of the preserved memory map from FDT */
-static phys_addr_t __init kho_get_mem_map_phys(const void *fdt)
-{
-	const void *mem_ptr;
-	int len;
-
-	mem_ptr = fdt_getprop(fdt, 0, KHO_FDT_MEMORY_MAP_PROP_NAME, &len);
-	if (!mem_ptr || len != sizeof(u64)) {
-		pr_err("failed to get preserved memory map\n");
-		return 0;
-	}
-
-	return get_unaligned((const u64 *)mem_ptr);
-}
-
 static void __init *kho_get_mem_map(const void *fdt)
 {
 	phys_addr_t phys = kho_get_mem_map_phys(fdt);
@@ -1287,13 +1235,6 @@ void kho_unpreserve_pages(struct page *page, unsigned long nr_pages)
 }
 EXPORT_SYMBOL_GPL(kho_unpreserve_pages);
 
-/* vmalloc flags KHO supports */
-#define KHO_VMALLOC_SUPPORTED_FLAGS	(VM_ALLOC | VM_ALLOW_HUGE_VMAP)
-
-/* KHO internal flags for vmalloc preservations */
-#define KHO_VMALLOC_ALLOC	0x0001
-#define KHO_VMALLOC_HUGE_VMAP	0x0002
-
 static unsigned short vmalloc_flags_to_kho(unsigned int vm_flags)
 {
 	unsigned short kho_flags = 0;
@@ -1306,18 +1247,6 @@ static unsigned short vmalloc_flags_to_kho(unsigned int vm_flags)
 	return kho_flags;
 }
 
-static unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
-{
-	unsigned int vm_flags = 0;
-
-	if (kho_flags & KHO_VMALLOC_ALLOC)
-		vm_flags |= VM_ALLOC;
-	if (kho_flags & KHO_VMALLOC_HUGE_VMAP)
-		vm_flags |= VM_ALLOW_HUGE_VMAP;
-
-	return vm_flags;
-}
-
 static struct kho_vmalloc_chunk *new_vmalloc_chunk(struct kho_vmalloc_chunk *cur)
 {
 	struct kho_vmalloc_chunk *chunk;
@@ -1660,37 +1589,7 @@ EXPORT_SYMBOL_GPL(is_kho_boot);
  */
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size)
 {
-	const void *fdt = kho_get_fdt();
-	const u64 *val;
-	int offset, len;
-
-	if (!fdt)
-		return -ENOENT;
-
-	if (!phys)
-		return -EINVAL;
-
-	offset = fdt_subnode_offset(fdt, 0, name);
-	if (offset < 0)
-		return -ENOENT;
-
-	val = fdt_getprop(fdt, offset, KHO_SUB_TREE_PROP_NAME, &len);
-	if (!val || len != sizeof(*val))
-		return -EINVAL;
-
-	*phys = (phys_addr_t)*val;
-
-	val = fdt_getprop(fdt, offset, KHO_SUB_TREE_SIZE_PROP_NAME, &len);
-	if (!val || len != sizeof(*val)) {
-		pr_warn("broken KHO subnode '%s': missing or invalid blob-size property\n",
-			name);
-		return -EINVAL;
-	}
-
-	if (size)
-		*size = (size_t)*val;
-
-	return 0;
+	return __kho_retrieve_subtree(kho_get_fdt(), name, phys, size);
 }
 EXPORT_SYMBOL_GPL(kho_retrieve_subtree);
 
@@ -1981,18 +1880,8 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 		pr_warn("setup: failed to memremap FDT (0x%llx)\n", fdt_phys);
 		goto report;
 	}
-	err = fdt_check_header(fdt);
-	if (err) {
-		pr_warn("setup: handover FDT (0x%llx) is invalid: %d\n",
-			fdt_phys, err);
+	if (kho_check_fdt(fdt, fdt_phys))
 		goto unmap_fdt;
-	}
-	err = fdt_node_check_compatible(fdt, 0, KHO_FDT_COMPATIBLE);
-	if (err) {
-		pr_warn("setup: handover FDT (0x%llx) is incompatible with '%s': %d\n",
-			fdt_phys, KHO_FDT_COMPATIBLE, err);
-		goto unmap_fdt;
-	}
 
 	mem_map_phys = kho_get_mem_map_phys(fdt);
 	if (!mem_map_phys)
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index 38181076f603..094b4917a0f1 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -3,8 +3,142 @@
 #define LINUX_KEXEC_HANDOVER_INTERNAL_H
 
 #include <linux/kexec_handover.h>
+#include <linux/kho/abi/kexec_handover.h>
+#include <linux/libfdt.h>
 #include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/printk.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/vmalloc.h>
+
+/* vmalloc flags KHO supports */
+#define KHO_VMALLOC_SUPPORTED_FLAGS	(VM_ALLOC | VM_ALLOW_HUGE_VMAP)
+
+/* KHO internal flags for vmalloc preservations */
+#define KHO_VMALLOC_ALLOC	0x0001
+#define KHO_VMALLOC_HUGE_VMAP	0x0002
+
+static inline unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
+{
+	unsigned int vm_flags = 0;
+
+	if (kho_flags & KHO_VMALLOC_ALLOC)
+		vm_flags |= VM_ALLOC;
+	if (kho_flags & KHO_VMALLOC_HUGE_VMAP)
+		vm_flags |= VM_ALLOW_HUGE_VMAP;
+
+	return vm_flags;
+}
+
+/**
+ * kho_encode_radix_key - Encodes a physical address and order into a radix key.
+ * @phys: The physical address of the page.
+ * @order: The order of the page.
+ *
+ * This function combines a page's physical address and its order into a
+ * single unsigned long, which is used as a key for all radix tree
+ * operations.
+ *
+ * Return: The encoded unsigned long radix key.
+ */
+static inline unsigned long kho_encode_radix_key(phys_addr_t phys,
+						 unsigned int order)
+{
+	/* The physical address is encoded by shifting the PFN by its order. */
+	unsigned long shift = PAGE_SHIFT + order;
+	/* Order bit goes right before the shifted PFN. */
+	unsigned long h = 1UL << (64 - shift);
+	/* Shifted PFN. */
+	unsigned long l = phys >> shift;
+
+	return h | l;
+}
+
+static inline unsigned long kho_radix_get_bitmap_index(unsigned long key)
+{
+	return key % (1 << KHO_BITMAP_SIZE_LOG2);
+}
+
+static inline unsigned long kho_radix_get_table_index(unsigned long key,
+						      unsigned int level)
+{
+	int s;
+
+	s = ((level - 1) * KHO_TABLE_SIZE_LOG2) + KHO_BITMAP_SIZE_LOG2;
+	return (key >> s) % (1 << KHO_TABLE_SIZE_LOG2);
+}
+
+static inline int kho_check_fdt(const void *fdt, phys_addr_t fdt_phys)
+{
+	int err;
+
+	err = fdt_check_header(fdt);
+	if (err) {
+		pr_warn("handover FDT (0x%llx) is invalid: %d\n",
+			(unsigned long long)fdt_phys, err);
+		return err;
+	}
+
+	err = fdt_node_check_compatible(fdt, 0, KHO_FDT_COMPATIBLE);
+	if (err) {
+		pr_warn("handover FDT (0x%llx) is incompatible with '%s': %d\n",
+			(unsigned long long)fdt_phys, KHO_FDT_COMPATIBLE, err);
+		return err;
+	}
+
+	return 0;
+}
+
+/* Returns physical address of the preserved memory map from FDT */
+static inline phys_addr_t kho_get_mem_map_phys(const void *fdt)
+{
+	const void *mem_ptr;
+	int len;
+
+	mem_ptr = fdt_getprop(fdt, 0, KHO_FDT_MEMORY_MAP_PROP_NAME, &len);
+	if (!mem_ptr || len != sizeof(u64)) {
+		pr_err("failed to get preserved memory map\n");
+		return 0;
+	}
+
+	return get_unaligned((const u64 *)mem_ptr);
+}
+
+static inline int __kho_retrieve_subtree(const void *fdt, const char *name,
+					 phys_addr_t *phys, size_t *size)
+{
+	const u64 *val;
+	int offset, len;
+
+	if (!fdt)
+		return -ENOENT;
+
+	if (!phys)
+		return -EINVAL;
+
+	offset = fdt_subnode_offset(fdt, 0, name);
+	if (offset < 0)
+		return -ENOENT;
+
+	val = fdt_getprop(fdt, offset, KHO_SUB_TREE_PROP_NAME, &len);
+	if (!val || len != sizeof(*val))
+		return -EINVAL;
+
+	*phys = (phys_addr_t)get_unaligned(val);
+
+	val = fdt_getprop(fdt, offset, KHO_SUB_TREE_SIZE_PROP_NAME, &len);
+	if (!val || len != sizeof(*val)) {
+		pr_warn("broken KHO subnode '%s': missing or invalid blob-size property\n",
+			name);
+		return -EINVAL;
+	}
+
+	if (size)
+		*size = (size_t)get_unaligned(val);
+
+	return 0;
+}
 
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
 #include <linux/debugfs.h>
-- 
2.56.0.176.g3575e65682-goog

