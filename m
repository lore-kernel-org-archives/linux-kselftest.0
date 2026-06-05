Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7E3F44D7
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630373; cv=none; b=IHQ68JMekbJDTXmlnDk650maJlMNjhOKM96WNxyUxOQBiuPBA0xnUCDvBwr8SAG6HeJx6tagsurjIUDKynt+2VwY6NeTStDwujDFjNd1oIEqF1S9HV5a17JwCqoqx67vQZvf+Us+CjeLmV0uBjZ2i7PiV8XAb6aQ72pk02ioYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630373; c=relaxed/simple;
	bh=ft+wyW4GqM/deZoY1vJq5/OZpWt7HwaEkyGNLoOUcic=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIJ5OrBHreB8n2abE1viVQ48MsfhXEGcTunL2eQrWDzq2ubS04GCkT/GBqKqXJeNY8IvwBNWiI5KzI+pfwu3eeRKGDhF4LO9s7kl6HGzZWaHFYHOosYSGZDSbAF3MS1V1w1fwCwLMbVsPzAwINWRzQB31lhHozLXtKBGsW3rYh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EpYEa1eU; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EpYEa1eU"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso12636516d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630369; x=1781235169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDO8BVEQ+LamNUz1+nh7qBThLycTY6eROvRfwZKn/hY=;
        b=EpYEa1eUvroW4xdOjlSWqVDzgMV3BttJaPzEaExgr3yPuFWJMrkee90zRMF7d+1Fj9
         spipmIgJ7BpFrQQa1DzapHZwMhwVnSMT35dH9eGPQYTE5T/QkmIbyH+4w1jhu+sjxT5w
         Mh6oek5VgHk37jbnnlANI4m2lSO9emv+Kxf/+Z+hXLkmBxWBZ4yWP6xSFu7yxOqU247c
         UyxZuJljgql4CVL5ZXG9IMzxHpOvfzSVKUxyyqsPcJYSqA/kOYJ8lkZ6kY1fVkkg+TVL
         1bzQ7jV3fx8Heo5sDkpnC9ozOQ1WKbcaTAY2fxmmiG+OkliMVJ2G5dXTjvtFGo6HnIaO
         Ix9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630369; x=1781235169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nDO8BVEQ+LamNUz1+nh7qBThLycTY6eROvRfwZKn/hY=;
        b=b45o+IpVNEkANJNVXAUH+tDW5G2Et/94j3i7eoJ7FIH2WUEA5ZPHTOwcAikFW2t7v9
         pbAaQ3Z7198IvP+WpjkRBAOl5knz2/TWEbAtyK7t5zMCTQwl6Zp5cGebYCIHAbPnEYBL
         89CdQJdEG79lpkDyNccHixnWdCMjPZVmw36jUEjemwdG8UpeCNbDYZLfw3YQ/VOc2lWx
         KV1Flj0BWVlGITnAG0Lc1cac6E/zXX1Ol4/Brm5oio1x4c8+Ch6cqYyWXPXwKrRgwdeb
         jthGWK+f/Oc6niRr5yQSf5JkMlngBBMbSnqUnSZO4hlrPyohZNaAZm4M168eroMZNce5
         4PcA==
X-Gm-Message-State: AOJu0YxzczoQuoSRV5hgrL/rvhWiSUcHkX5dWeR5Hkg7TPmKLCWHAm3w
	VkrOQUUVRY+QS6u9T2nsxL5arKdAWF4ZP3rFGPt/TWUc2dob/mQHbjbCHzn7SLEt0vOBKQzG49i
	yC1f0
X-Gm-Gg: Acq92OEf9bEYRcezrhLLlHWpDuluSTLTd7G7t7BdKkEBgekr7/nKcORwnsqWs+kRfAm
	euWeGR0d+kcYMi2m/DJVyUqhT2t1cJjLR72soJLopo8HGc6LKOne9mnRdvmWPRlnVi79AqAOScI
	bP+X+n2TB4sjpvvNv87fD5TfBKd/kwTzzcGm6CDNZI7aY4/7DxplaM8fKPG+qaUr0tczORqMyBB
	IMrZz/bl+3seEX4MvqLctFpjmFz0iyR8h+WKjRy3rRYssepXVPbJNX/k7Y27rcRVFPPBLQpfrsV
	nEyJZuO0DK2zqinKgpXTughU44Gd6chTMU21tespPOetgwuMcR0IRoewFD9jUtSMgvtqoFYqT4t
	XPgbQx2Lo/ouIiUTsaMlrhsLb/qus4+kIjO5EVzzTD1ch8k5+Wb445ysCd126cxiqUu7enHGcMF
	dlFhPMbg6Lnl/cgAvmi4uIOtJQoh+bLIFd+n17VdKfxFvHRvYwY7xHLafo6qB2Hg==
X-Received: by 2002:a05:6214:6017:b0:8cc:cf1e:1fde with SMTP id 6a1803df08f44-8cee611fb96mr32665706d6.26.1780630369028;
        Thu, 04 Jun 2026 20:32:49 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb9fc0sm70805926d6.17.2026.06.04.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:32:48 -0700 (PDT)
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
Subject: [RFC v1 1/9] kho: split out radix tree tracker into kho_radix.c
Date: Fri,  5 Jun 2026 03:32:27 +0000
Message-ID: <20260605033235.717351-2-pasha.tatashin@soleen.com>
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

Move the radix tree tracker implementation from the core KHO code
into its own dedicated file (kho_radix.c).

This is a pure code movement patch; no logic or functional changes are
introduced.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/index.rst |   3 +
 kernel/liveupdate/Makefile           |   6 +-
 kernel/liveupdate/kexec_handover.c   | 273 -------------------------
 kernel/liveupdate/kho_radix.c        | 290 +++++++++++++++++++++++++++
 4 files changed, 298 insertions(+), 274 deletions(-)
 create mode 100644 kernel/liveupdate/kho_radix.c

diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index 320914a42178..a9892c671ec3 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -83,6 +83,9 @@ Public API
 .. kernel-doc:: kernel/liveupdate/kexec_handover.c
   :export:
 
+.. kernel-doc:: kernel/liveupdate/kho_radix.c
+  :export:
+
 KHO Serialization Blocks API
 ============================
 
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index eec9d3ae07eb..a3ee8a5c27a2 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -7,7 +7,11 @@ luo-y :=								\
 		luo_flb.o						\
 		luo_session.o
 
-obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
+kho-y :=								\
+		kexec_handover.o					\
+		kho_radix.o
+
+obj-$(CONFIG_KEXEC_HANDOVER)		+= kho.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUG)	+= kexec_handover_debug.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 4834a809985a..041efff7ca11 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
  * Copyright (C) 2025 Google LLC, Changyuan Lyu <changyuanl@google.com>
  * Copyright (C) 2025 Pasha Tatashin <pasha.tatashin@soleen.com>
- * Copyright (C) 2026 Google LLC, Jason Miu <jasonmiu@google.com>
  */
 
 #define pr_fmt(fmt) "KHO: " fmt
@@ -84,278 +83,6 @@ static struct kho_out kho_out = {
 	},
 };
 
-/**
- * kho_radix_encode_key - Encodes a physical address and order into a radix key.
- * @phys: The physical address of the page.
- * @order: The order of the page.
- *
- * This function combines a page's physical address and its order into a
- * single unsigned long, which is used as a key for all radix tree
- * operations.
- *
- * Return: The encoded unsigned long radix key.
- */
-static unsigned long kho_radix_encode_key(phys_addr_t phys, unsigned int order)
-{
-	/* Order bits part */
-	unsigned long h = 1UL << (KHO_ORDER_0_LOG2 - order);
-	/* Shifted physical address part */
-	unsigned long l = phys >> (PAGE_SHIFT + order);
-
-	return h | l;
-}
-
-/**
- * kho_radix_decode_key - Decodes a radix key back into a physical address and order.
- * @key: The unsigned long key to decode.
- * @order: An output parameter, a pointer to an unsigned int where the decoded
- *         page order will be stored.
- *
- * This function reverses the encoding performed by kho_radix_encode_key(),
- * extracting the original physical address and page order from a given key.
- *
- * Return: The decoded physical address.
- */
-static phys_addr_t kho_radix_decode_key(unsigned long key, unsigned int *order)
-{
-	unsigned int order_bit = fls64(key);
-	phys_addr_t phys;
-
-	/* order_bit is numbered starting at 1 from fls64 */
-	*order = KHO_ORDER_0_LOG2 - order_bit + 1;
-	/* The order is discarded by the shift */
-	phys = key << (PAGE_SHIFT + *order);
-
-	return phys;
-}
-
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
-/**
- * kho_radix_add_page - Marks a page as preserved in the radix tree.
- * @tree: The KHO radix tree.
- * @pfn: The page frame number of the page to preserve.
- * @order: The order of the page.
- *
- * This function traverses the radix tree based on the key derived from @pfn
- * and @order. It sets the corresponding bit in the leaf bitmap to mark the
- * page for preservation. If intermediate nodes do not exist along the path,
- * they are allocated and added to the tree.
- *
- * Return: 0 on success, or a negative error code on failure.
- */
-int kho_radix_add_page(struct kho_radix_tree *tree,
-		       unsigned long pfn, unsigned int order)
-{
-	/* Newly allocated nodes for error cleanup */
-	struct kho_radix_node *intermediate_nodes[KHO_TREE_MAX_DEPTH] = { 0 };
-	unsigned long key = kho_radix_encode_key(PFN_PHYS(pfn), order);
-	struct kho_radix_node *anchor_node = NULL;
-	struct kho_radix_node *node = tree->root;
-	struct kho_radix_node *new_node;
-	unsigned int i, idx, anchor_idx;
-	struct kho_radix_leaf *leaf;
-	int err = 0;
-
-	if (WARN_ON_ONCE(!tree->root))
-		return -EINVAL;
-
-	might_sleep();
-
-	guard(mutex)(&tree->lock);
-
-	/* Go from high levels to low levels */
-	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
-		idx = kho_radix_get_table_index(key, i);
-
-		if (node->table[idx]) {
-			node = phys_to_virt(node->table[idx]);
-			continue;
-		}
-
-		/* Next node is empty, create a new node for it */
-		new_node = (struct kho_radix_node *)get_zeroed_page(GFP_KERNEL);
-		if (!new_node) {
-			err = -ENOMEM;
-			goto err_free_nodes;
-		}
-
-		node->table[idx] = virt_to_phys(new_node);
-
-		/*
-		 * Capture the node where the new branch starts for cleanup
-		 * if allocation fails.
-		 */
-		if (!anchor_node) {
-			anchor_node = node;
-			anchor_idx = idx;
-		}
-		intermediate_nodes[i] = new_node;
-
-		node = new_node;
-	}
-
-	/* Handle the leaf level bitmap (level 0) */
-	idx = kho_radix_get_bitmap_index(key);
-	leaf = (struct kho_radix_leaf *)node;
-	__set_bit(idx, leaf->bitmap);
-
-	return 0;
-
-err_free_nodes:
-	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
-		if (intermediate_nodes[i])
-			free_page((unsigned long)intermediate_nodes[i]);
-	}
-	if (anchor_node)
-		anchor_node->table[anchor_idx] = 0;
-
-	return err;
-}
-EXPORT_SYMBOL_GPL(kho_radix_add_page);
-
-/**
- * kho_radix_del_page - Removes a page's preservation status from the radix tree.
- * @tree: The KHO radix tree.
- * @pfn: The page frame number of the page to unpreserve.
- * @order: The order of the page.
- *
- * This function traverses the radix tree and clears the bit corresponding to
- * the page, effectively removing its "preserved" status. It does not free
- * the tree's intermediate nodes, even if they become empty.
- */
-void kho_radix_del_page(struct kho_radix_tree *tree, unsigned long pfn,
-			unsigned int order)
-{
-	unsigned long key = kho_radix_encode_key(PFN_PHYS(pfn), order);
-	struct kho_radix_node *node = tree->root;
-	struct kho_radix_leaf *leaf;
-	unsigned int i, idx;
-
-	if (WARN_ON_ONCE(!tree->root))
-		return;
-
-	might_sleep();
-
-	guard(mutex)(&tree->lock);
-
-	/* Go from high levels to low levels */
-	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
-		idx = kho_radix_get_table_index(key, i);
-
-		/*
-		 * Attempting to delete a page that has not been preserved,
-		 * return with a warning.
-		 */
-		if (WARN_ON(!node->table[idx]))
-			return;
-
-		node = phys_to_virt(node->table[idx]);
-	}
-
-	/* Handle the leaf level bitmap (level 0) */
-	leaf = (struct kho_radix_leaf *)node;
-	idx = kho_radix_get_bitmap_index(key);
-	__clear_bit(idx, leaf->bitmap);
-}
-EXPORT_SYMBOL_GPL(kho_radix_del_page);
-
-static int kho_radix_walk_leaf(struct kho_radix_leaf *leaf,
-			       unsigned long key,
-			       kho_radix_tree_walk_callback_t cb)
-{
-	unsigned long *bitmap = (unsigned long *)leaf;
-	unsigned int order;
-	phys_addr_t phys;
-	unsigned int i;
-	int err;
-
-	for_each_set_bit(i, bitmap, PAGE_SIZE * BITS_PER_BYTE) {
-		phys = kho_radix_decode_key(key | i, &order);
-		err = cb(phys, order);
-		if (err)
-			return err;
-	}
-
-	return 0;
-}
-
-static int __kho_radix_walk_tree(struct kho_radix_node *root,
-				 unsigned int level, unsigned long start,
-				 kho_radix_tree_walk_callback_t cb)
-{
-	struct kho_radix_node *node;
-	struct kho_radix_leaf *leaf;
-	unsigned long key, i;
-	unsigned int shift;
-	int err;
-
-	for (i = 0; i < PAGE_SIZE / sizeof(phys_addr_t); i++) {
-		if (!root->table[i])
-			continue;
-
-		shift = ((level - 1) * KHO_TABLE_SIZE_LOG2) +
-			KHO_BITMAP_SIZE_LOG2;
-		key = start | (i << shift);
-
-		node = phys_to_virt(root->table[i]);
-
-		if (level == 1) {
-			/*
-			 * we are at level 1,
-			 * node is pointing to the level 0 bitmap.
-			 */
-			leaf = (struct kho_radix_leaf *)node;
-			err = kho_radix_walk_leaf(leaf, key, cb);
-		} else {
-			err  = __kho_radix_walk_tree(node, level - 1,
-						     key, cb);
-		}
-
-		if (err)
-			return err;
-	}
-
-	return 0;
-}
-
-/**
- * kho_radix_walk_tree - Traverses the radix tree and calls a callback for each preserved page.
- * @tree: A pointer to the KHO radix tree to walk.
- * @cb: A callback function of type kho_radix_tree_walk_callback_t that will be
- *      invoked for each preserved page found in the tree. The callback receives
- *      the physical address and order of the preserved page.
- *
- * This function walks the radix tree, searching from the specified top level
- * down to the lowest level (level 0). For each preserved page found, it invokes
- * the provided callback, passing the page's physical address and order.
- *
- * Return: 0 if the walk completed the specified tree, or the non-zero return
- *         value from the callback that stopped the walk.
- */
-int kho_radix_walk_tree(struct kho_radix_tree *tree,
-			kho_radix_tree_walk_callback_t cb)
-{
-	if (WARN_ON_ONCE(!tree->root))
-		return -EINVAL;
-
-	guard(mutex)(&tree->lock);
-
-	return __kho_radix_walk_tree(tree->root, KHO_TREE_MAX_DEPTH - 1, 0, cb);
-}
-EXPORT_SYMBOL_GPL(kho_radix_walk_tree);
 
 /* For physically contiguous 0-order pages. */
 static void kho_init_pages(struct page *page, unsigned long nr_pages)
diff --git a/kernel/liveupdate/kho_radix.c b/kernel/liveupdate/kho_radix.c
new file mode 100644
index 000000000000..c836783a1376
--- /dev/null
+++ b/kernel/liveupdate/kho_radix.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * kho_radix.c - KHO radix tree tracker for preserved memory pages
+ * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
+ * Copyright (C) 2025 Pasha Tatashin <pasha.tatashin@soleen.com>
+ * Copyright (C) 2026 Google LLC, Jason Miu <jasonmiu@google.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/gfp.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/kho/abi/kexec_handover.h>
+#include <linux/kho_radix_tree.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/**
+ * kho_radix_encode_key - Encodes a physical address and order into a radix key.
+ * @phys: The physical address of the page.
+ * @order: The order of the page.
+ *
+ * This function combines a page's physical address and its order into a
+ * single unsigned long, which is used as a key for all radix tree
+ * operations.
+ *
+ * Return: The encoded unsigned long radix key.
+ */
+static unsigned long kho_radix_encode_key(phys_addr_t phys, unsigned int order)
+{
+	/* Order bits part */
+	unsigned long h = 1UL << (KHO_ORDER_0_LOG2 - order);
+	/* Shifted physical address part */
+	unsigned long l = phys >> (PAGE_SHIFT + order);
+
+	return h | l;
+}
+
+/**
+ * kho_radix_decode_key - Decodes a radix key back into a physical address and order.
+ * @key: The unsigned long key to decode.
+ * @order: An output parameter, a pointer to an unsigned int where the decoded
+ *         page order will be stored.
+ *
+ * This function reverses the encoding performed by kho_radix_encode_key(),
+ * extracting the original physical address and page order from a given key.
+ *
+ * Return: The decoded physical address.
+ */
+static phys_addr_t kho_radix_decode_key(unsigned long key, unsigned int *order)
+{
+	unsigned int order_bit = fls64(key);
+	phys_addr_t phys;
+
+	/* order_bit is numbered starting at 1 from fls64 */
+	*order = KHO_ORDER_0_LOG2 - order_bit + 1;
+	/* The order is discarded by the shift */
+	phys = key << (PAGE_SHIFT + *order);
+
+	return phys;
+}
+
+static unsigned long kho_radix_get_bitmap_index(unsigned long key)
+{
+	return key % (1 << KHO_BITMAP_SIZE_LOG2);
+}
+
+static unsigned long kho_radix_get_table_index(unsigned long key,
+					       unsigned int level)
+{
+	int s;
+
+	s = ((level - 1) * KHO_TABLE_SIZE_LOG2) + KHO_BITMAP_SIZE_LOG2;
+	return (key >> s) % (1 << KHO_TABLE_SIZE_LOG2);
+}
+
+/**
+ * kho_radix_add_page - Marks a page as preserved in the radix tree.
+ * @tree: The KHO radix tree.
+ * @pfn: The page frame number of the page to preserve.
+ * @order: The order of the page.
+ *
+ * This function traverses the radix tree based on the key derived from @pfn
+ * and @order. It sets the corresponding bit in the leaf bitmap to mark the
+ * page for preservation. If intermediate nodes do not exist along the path,
+ * they are allocated and added to the tree.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int kho_radix_add_page(struct kho_radix_tree *tree,
+		       unsigned long pfn, unsigned int order)
+{
+	/* Newly allocated nodes for error cleanup */
+	struct kho_radix_node *intermediate_nodes[KHO_TREE_MAX_DEPTH] = { 0 };
+	unsigned long key = kho_radix_encode_key(PFN_PHYS(pfn), order);
+	struct kho_radix_node *anchor_node = NULL;
+	struct kho_radix_node *node = tree->root;
+	struct kho_radix_node *new_node;
+	unsigned int i, idx, anchor_idx;
+	struct kho_radix_leaf *leaf;
+	int err = 0;
+
+	if (WARN_ON_ONCE(!tree->root))
+		return -EINVAL;
+
+	might_sleep();
+
+	guard(mutex)(&tree->lock);
+
+	/* Go from high levels to low levels */
+	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+		idx = kho_radix_get_table_index(key, i);
+
+		if (node->table[idx]) {
+			node = phys_to_virt(node->table[idx]);
+			continue;
+		}
+
+		/* Next node is empty, create a new node for it */
+		new_node = (struct kho_radix_node *)get_zeroed_page(GFP_KERNEL);
+		if (!new_node) {
+			err = -ENOMEM;
+			goto err_free_nodes;
+		}
+
+		node->table[idx] = virt_to_phys(new_node);
+
+		/*
+		 * Capture the node where the new branch starts for cleanup
+		 * if allocation fails.
+		 */
+		if (!anchor_node) {
+			anchor_node = node;
+			anchor_idx = idx;
+		}
+		intermediate_nodes[i] = new_node;
+
+		node = new_node;
+	}
+
+	/* Handle the leaf level bitmap (level 0) */
+	idx = kho_radix_get_bitmap_index(key);
+	leaf = (struct kho_radix_leaf *)node;
+	__set_bit(idx, leaf->bitmap);
+
+	return 0;
+
+err_free_nodes:
+	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+		if (intermediate_nodes[i])
+			free_page((unsigned long)intermediate_nodes[i]);
+	}
+	if (anchor_node)
+		anchor_node->table[anchor_idx] = 0;
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_radix_add_page);
+
+/**
+ * kho_radix_del_page - Removes a page's preservation status from the radix tree.
+ * @tree: The KHO radix tree.
+ * @pfn: The page frame number of the page to unpreserve.
+ * @order: The order of the page.
+ *
+ * This function traverses the radix tree and clears the bit corresponding to
+ * the page, effectively removing its "preserved" status. It does not free
+ * the tree's intermediate nodes, even if they become empty.
+ */
+void kho_radix_del_page(struct kho_radix_tree *tree, unsigned long pfn,
+			unsigned int order)
+{
+	unsigned long key = kho_radix_encode_key(PFN_PHYS(pfn), order);
+	struct kho_radix_node *node = tree->root;
+	struct kho_radix_leaf *leaf;
+	unsigned int i, idx;
+
+	if (WARN_ON_ONCE(!tree->root))
+		return;
+
+	might_sleep();
+
+	guard(mutex)(&tree->lock);
+
+	/* Go from high levels to low levels */
+	for (i = KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+		idx = kho_radix_get_table_index(key, i);
+
+		/*
+		 * Attempting to delete a page that has not been preserved,
+		 * return with a warning.
+		 */
+		if (WARN_ON(!node->table[idx]))
+			return;
+
+		node = phys_to_virt(node->table[idx]);
+	}
+
+	/* Handle the leaf level bitmap (level 0) */
+	leaf = (struct kho_radix_leaf *)node;
+	idx = kho_radix_get_bitmap_index(key);
+	__clear_bit(idx, leaf->bitmap);
+}
+EXPORT_SYMBOL_GPL(kho_radix_del_page);
+
+static int kho_radix_walk_leaf(struct kho_radix_leaf *leaf,
+			       unsigned long key,
+			       kho_radix_tree_walk_callback_t cb)
+{
+	unsigned long *bitmap = (unsigned long *)leaf;
+	unsigned int order;
+	phys_addr_t phys;
+	unsigned int i;
+	int err;
+
+	for_each_set_bit(i, bitmap, PAGE_SIZE * BITS_PER_BYTE) {
+		phys = kho_radix_decode_key(key | i, &order);
+		err = cb(phys, order);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int __kho_radix_walk_tree(struct kho_radix_node *root,
+				 unsigned int level, unsigned long start,
+				 kho_radix_tree_walk_callback_t cb)
+{
+	struct kho_radix_node *node;
+	struct kho_radix_leaf *leaf;
+	unsigned long key, i;
+	unsigned int shift;
+	int err;
+
+	for (i = 0; i < PAGE_SIZE / sizeof(phys_addr_t); i++) {
+		if (!root->table[i])
+			continue;
+
+		shift = ((level - 1) * KHO_TABLE_SIZE_LOG2) +
+			KHO_BITMAP_SIZE_LOG2;
+		key = start | (i << shift);
+
+		node = phys_to_virt(root->table[i]);
+
+		if (level == 1) {
+			/*
+			 * we are at level 1,
+			 * node is pointing to the level 0 bitmap.
+			 */
+			leaf = (struct kho_radix_leaf *)node;
+			err = kho_radix_walk_leaf(leaf, key, cb);
+		} else {
+			err  = __kho_radix_walk_tree(node, level - 1,
+						     key, cb);
+		}
+
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * kho_radix_walk_tree - Traverses the radix tree and calls a callback for each preserved page.
+ * @tree: A pointer to the KHO radix tree to walk.
+ * @cb: A callback function of type kho_radix_tree_walk_callback_t that will be
+ *      invoked for each preserved page found in the tree. The callback receives
+ *      the physical address and order of the preserved page.
+ *
+ * This function walks the radix tree, searching from the specified top level
+ * down to the lowest level (level 0). For each preserved page found, it invokes
+ * the provided callback, passing the page's physical address and order.
+ *
+ * Return: 0 if the walk completed the specified tree, or the non-zero return
+ *         value from the callback that stopped the walk.
+ */
+int kho_radix_walk_tree(struct kho_radix_tree *tree,
+			kho_radix_tree_walk_callback_t cb)
+{
+	if (WARN_ON_ONCE(!tree->root))
+		return -EINVAL;
+
+	guard(mutex)(&tree->lock);
+
+	return __kho_radix_walk_tree(tree->root, KHO_TREE_MAX_DEPTH - 1, 0, cb);
+}
+EXPORT_SYMBOL_GPL(kho_radix_walk_tree);
-- 
2.53.0

