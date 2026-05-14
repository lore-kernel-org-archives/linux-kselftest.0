Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9393D1CD0
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797602; cv=none; b=H28dvLxHzLc2cUuxXcjV3+FT+0/0uslK7AXKCzvuY0FY6iB+klQdbhg7zhPoNh6uEdb4fu6aXZZTaih0gr6KON2A99PczkGauZkEfN62k3ozHoVUrjb5gib7d8LzfXCrtQ65JqQIIXEsAu2+WtlMJgRdSfs7s/fKTDuIonNhhi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797602; c=relaxed/simple;
	bh=5xLPUOejBaIrD+BvtyUrgcJ1vD6f9+MCOnpYJ7y9CvY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbV101pIaAdnAM28Rz/TlGCR/giO/h/s1lM5KO6Fv20YUZCwXZ9A0cERFevIGPCVHK6l2ak9Ad27TtQknI3/PQyJT+SkHwzmZCrilo7mowYkYXZcI3AHJIztaJMwA6AZKWadpzE+wE0vtJBIysjS7VmYpTLGk6mlFHz7xj1qxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=HEo7CE9G; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="HEo7CE9G"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b74b460d77so84427526d6.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797599; x=1779402399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNqqwGdiG18Z/AQkO2ZGChCHZOKJcrPhRyXZH73Csio=;
        b=HEo7CE9Gow7jMXuOG/OW8Eqqtw8JlE5EiPIE1X4uQFEue6bldOgXqkxf3dhkYk4tRj
         Mjn+rDxG0w+GuG28v6NEBBKthLYuFQsZhou1mAbiVYeZhc6Srt5/NvWMihHtGn4waUI9
         D9lk7lvBH9A126YEp0mXTar3CZaN1WNuYFPYmG5IsUubAw8U6eayWHGqSxtApy3CLB+v
         zV37EEt8fRZ0U1p3Pfou+Y1Juyx4Df7bjks89vwks5C0zsrFgvKExCo7LZt3Xovlvr71
         amWwuwCg2hicFSGckYRE+ZG97tTvyB5za9lMIaKDnzBo3KDdGGAW082/4JwhbO8CKfgz
         DKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797599; x=1779402399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNqqwGdiG18Z/AQkO2ZGChCHZOKJcrPhRyXZH73Csio=;
        b=XXYJ8E3ROI8i7gI6eDRfK9fpd3f1idIA5t1NKJIU/hmZBA1zg7whFHoQzfWuYbKXZc
         wYzhiBA8XmTBp6e6o6fmtNqCkls50unC2W5qmJjNOrAWMtTqWcthSLour1tBsTX1T1S1
         MhJed08jzYXJPV6gzhRMs2YdMIRL70UYz+n9ccf8prqIucWGHOPzDgbqpYHQOXptRis2
         Cxukc3qbTsGl089WX+JGlbCsZkO1VxMEA7WgruR/tNQ16n4w1NEXT8Df31tCpZ3VIPir
         XvTLyTn/3tUEnZshmbYtKUF4OlaiSS3GNRCZoVZ8cW1uIfcHE1gXDQtrp41iAzqPME3L
         0qdA==
X-Gm-Message-State: AOJu0YxGr6r55fjWPpVVlb2svxOQh0AxGdZa7WVA/4FievVKrlRy07Z3
	/1ZfrGSrGNKs1Sgnt8nPachQPP4SFs2UwSbS8H1rfJFkMv+vKVUbmGRXJ46MHnLd+yN0wDSbG8J
	IPKoj0M0=
X-Gm-Gg: Acq92OE4svOPi/pe+7+GQTCUuwQ5FMXmgb5D69DsIEoeJoIWCNFqv6CgUqzXDes+2/d
	8vSa07yoQjtu9LMypficGuFAdu3czRlIrrxC/1EDol2AHvNm0jS3cyDU/mDF3rtGDS82IykOAn/
	Z2TQF2drD5r6/rw59zpE9Xr4gjjhRODYrtJzmuoW5cUpGE3ZBbUZTJHxnfSYykMl7NR2r43XIzi
	kZqctplGXZzL2/rblH7L9+DmnztgE7umrgXOPfRGM1+ki7tQRF2pA/BMT8+E1I+HXDcoAQZRMph
	xMsQbiEUVpWXcPhz7Xlup4Mi86qSLJHyNhPtmSYKyOdXzqCXroXD/bSjzC+bZlfBi4hFCZLpix0
	G0n/bltFSiMyvuj4Uq5R/Km0KbbkfuKzdMnNDLP3WfunQmbWt/OO3umN+rE2mttd460NU/voyGB
	dpo7DzVZwaehyiWeldxBpxD19mhCbioTE63Mw9eDod4pu2naPoi4c=
X-Received: by 2002:a05:622a:13cb:b0:509:348f:bc1a with SMTP id d75a77b69052e-5165a07eed4mr19793671cf.26.1778797598409;
        Thu, 14 May 2026 15:26:38 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:37 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v2 04/10] liveupdate: add support for linked-block serialization
Date: Thu, 14 May 2026 22:26:22 +0000
Message-ID: <20260514222628.931312-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a linked-block serialization mechanism for LUO state.

Previously, LUO used contiguous memory blocks for serializing sessions
and files, which imposed limits on the total number of items that could
be preserved across a live update.

This commit adds the infrastructure for a more flexible, block-based
approach where serialized data is stored in a chain of linked blocks.
This is a preparatory step to allow an unlimited number of
luo_sessions and luo_files to be preserved.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/liveupdate.rst |   8 +
 include/linux/kho/abi/luo.h           |  22 ++
 kernel/liveupdate/Makefile            |   1 +
 kernel/liveupdate/luo_block.c         | 388 ++++++++++++++++++++++++++
 kernel/liveupdate/luo_internal.h      |  57 ++++
 5 files changed, 476 insertions(+)
 create mode 100644 kernel/liveupdate/luo_block.c

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index 5a292d0f3706..978beb02292f 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -23,6 +23,11 @@ LUO File Lifecycle Bound Global Data
 .. kernel-doc:: kernel/liveupdate/luo_flb.c
    :doc: LUO File Lifecycle Bound Global Data
 
+LUO Serialization Blocks
+========================
+.. kernel-doc:: kernel/liveupdate/luo_block.c
+   :doc: LUO Serialization Blocks
+
 Live Update Orchestrator ABI
 ============================
 .. kernel-doc:: include/linux/kho/abi/luo.h
@@ -65,6 +70,9 @@ Internal API
 .. kernel-doc:: kernel/liveupdate/luo_file.c
    :internal:
 
+.. kernel-doc:: kernel/liveupdate/luo_block.c
+   :internal:
+
 See Also
 ========
 
diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 1b2f865a771a..2ba447c0c1ba 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -49,6 +49,11 @@
  *     The central ABI structure that contains the overall state of the LUO.
  *     It includes the liveupdate-number and pointers to sessions and FLBs.
  *
+ *   - struct luo_block_header_ser:
+ *     Header for the session or file data block. Contains the physical address
+ *     of the next data block and the number of entries that follow this
+ *     header in the current block.
+ *
  *   - struct luo_session_header_ser:
  *     Header for the session array. Contains the total page count of the
  *     preserved memory block and the number of `struct luo_session_ser`
@@ -105,6 +110,23 @@ struct luo_ser {
 
 #define LIVEUPDATE_HNDL_COMPAT_LENGTH	48
 
+/**
+ * struct luo_block_header_ser - Header for the serialized data block.
+ * @next:  Physical address of the next struct luo_block_header_ser.
+ * @count: The number of entries that immediately follow this header in the
+ *         memory block.
+ *
+ * This structure is located at the beginning of a block of
+ * physical memory preserved across the kexec. It provides the necessary
+ * metadata to interpret the array of entries that follow.
+ *
+ * If this structure is modified, `LUO_FDT_COMPATIBLE` must be updated.
+ */
+struct luo_block_header_ser {
+	u64 next;
+	u64 count;
+} __packed;
+
 /**
  * struct luo_file_ser - Represents the serialized preserves files.
  * @compatible:  File handler compatible string.
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index d2f779cbe279..9f8f6fb1b8e5 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 luo-y :=								\
+		luo_block.o						\
 		luo_core.o						\
 		luo_file.o						\
 		luo_flb.o						\
diff --git a/kernel/liveupdate/luo_block.c b/kernel/liveupdate/luo_block.c
new file mode 100644
index 000000000000..0be0669b5cac
--- /dev/null
+++ b/kernel/liveupdate/luo_block.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO Serialization Blocks
+ *
+ * LUO provides a mechanism to preserve stateful data across a kexec-based live
+ * update by serializing it into contiguous memory blocks. This file provides
+ * the common infrastructure for managing these blocks.
+ *
+ * Each block consists of a header (struct luo_block_header_ser) followed by an
+ * array of serialized entries. Multiple blocks are linked together via a
+ * physical pointer in the header, forming a linked list that can be easily
+ * traversed in both the current and the next kernel.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/kexec_handover.h>
+#include <linux/slab.h>
+#include "luo_internal.h"
+
+/* 2 4K pages, give space for 170 sessions or 127 files per block */
+#define LUO_BLOCK_PGCNT		2ul
+#define LUO_BLOCK_SIZE		(LUO_BLOCK_PGCNT << PAGE_SHIFT)
+
+/*
+ * Safeguard limit for the number of serialization blocks. This is used to
+ * prevent infinite loops and excessive memory allocation in case of memory
+ * corruption in the preserved state.
+ *
+ * This limit allows for 1.7 million sessions and 1.27 million files per
+ * session, which is more than enough for all realistic use cases.
+ */
+#define LUO_MAX_BLOCKS 10000
+
+/**
+ * luo_block_set_init - Initialize a block set.
+ * @bs:   The block set to initialize.
+ * @entry_size: The size of each entry in the blocks.
+ */
+void luo_block_set_init(struct luo_block_set *bs, size_t entry_size)
+{
+	*bs = (struct luo_block_set)LUO_BLOCK_SET_INIT(*bs, entry_size);
+}
+
+static inline u64 luo_block_count_per_block(struct luo_block_set *bs)
+{
+	if (unlikely(!bs->count_per_block)) {
+		bs->count_per_block = (LUO_BLOCK_SIZE -
+				       sizeof(struct luo_block_header_ser)) /
+				      bs->entry_size;
+		WARN_ON(!bs->count_per_block);
+	}
+	return bs->count_per_block;
+}
+
+/* Free serialzied data */
+static void luo_block_free_ser(struct luo_block_set *bs,
+			       struct luo_block_header_ser *ser)
+{
+	if (bs->incoming)
+		kho_restore_free(ser);
+	else
+		kho_unpreserve_free(ser);
+}
+
+static struct luo_block_header_ser *luo_block_alloc_ser(struct luo_block_set *bs)
+{
+	WARN_ON(bs->incoming);
+	return kho_alloc_preserve(LUO_BLOCK_SIZE);
+}
+
+static int luo_block_add(struct luo_block_set *bs,
+			 struct luo_block_header_ser *ser)
+{
+	struct luo_block *block, *last;
+
+	if (bs->nblocks >= LUO_MAX_BLOCKS)
+		return -ENOSPC;
+
+	block = kzalloc_obj(*block);
+	if (!block)
+		return -ENOMEM;
+
+	block->ser = ser;
+	last = list_last_entry_or_null(&bs->blocks, struct luo_block, list);
+	list_add_tail(&block->list, &bs->blocks);
+	bs->nblocks++;
+
+	if (last)
+		last->ser->next = virt_to_phys(ser);
+	else
+		bs->head_pa = virt_to_phys(ser);
+
+	return 0;
+}
+
+/**
+ * luo_block_grow - Create a new block if the current capacity is reached.
+ * @bs:    The block set.
+ * @count: The current number of entries.
+ *
+ * This function handles the dynamic expansion of a block set. It allocates
+ * and links a new serialization block if the provided entry count matches
+ * the current total capacity of the set.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int luo_block_grow(struct luo_block_set *bs, u64 count)
+{
+	struct luo_block_header_ser *ser;
+	int err;
+
+	if (WARN_ON(bs->incoming))
+		return -EINVAL;
+
+	if (count != bs->nblocks * luo_block_count_per_block(bs))
+		return 0;
+
+	ser = luo_block_alloc_ser(bs);
+	if (IS_ERR(ser))
+		return PTR_ERR(ser);
+
+	err = luo_block_add(bs, ser);
+	if (err) {
+		luo_block_free_ser(bs, ser);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * luo_block_shrink - Conditionally destroy the last block in a block set.
+ * @bs:              The block set.
+ * @count:           The current number of entries across all blocks.
+ *
+ * This function checks if the last block in the set is redundant based on the
+ * total entry count and the capacity of the preceding blocks. If the entry
+ * count can be accommodated by the blocks that come before the last one, the
+ * last block is destroyed and removed from the set.
+ */
+void luo_block_shrink(struct luo_block_set *bs, u64 count)
+{
+	struct luo_block *last, *new_last;
+
+	if (count > (bs->nblocks - 1) * luo_block_count_per_block(bs))
+		return;
+
+	if (list_empty(&bs->blocks))
+		return;
+
+	last = list_last_entry(&bs->blocks, struct luo_block, list);
+	list_del(&last->list);
+	bs->nblocks--;
+	luo_block_free_ser(bs, last->ser);
+	kfree(last);
+
+	new_last = list_last_entry_or_null(&bs->blocks, struct luo_block, list);
+	if (new_last)
+		new_last->ser->next = 0;
+	else
+		bs->head_pa = 0;
+}
+
+/*
+ * luo_cyclic_blocks_check - Check for cycles in a linked list of blocks.
+ * Uses Floyd's cycle-finding algorithm to ensure sanity of the incoming list.
+ */
+static bool luo_cyclic_blocks_check(struct luo_block_set *bs)
+{
+	struct luo_block_header_ser *fast;
+	struct luo_block_header_ser *slow;
+	int count = 0;
+
+	fast = phys_to_virt(bs->head_pa);
+	slow = fast;
+
+	while (fast) {
+		if (count++ >= LUO_MAX_BLOCKS) {
+			pr_err("Linked list too long\n");
+			return false;
+		}
+
+		if (!fast->next)
+			break;
+
+		fast = phys_to_virt(fast->next);
+		if (!fast->next)
+			break;
+
+		fast = phys_to_virt(fast->next);
+		slow = phys_to_virt(slow->next);
+
+		if (slow == fast) {
+			pr_err("Cyclic list detected\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
+/**
+ * luo_block_restore - Restore a block set from a physical address.
+ * @bs:      The block set to restore.
+ * @head_pa: Physical address of the first block header.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int luo_block_restore(struct luo_block_set *bs, u64 head_pa)
+{
+	struct luo_block_header_ser *ser;
+	u64 next_pa = head_pa;
+	int err;
+
+	/* Restored block sets use size from the previous kernel */
+	bs->incoming = true;
+	if (!head_pa)
+		return 0;
+
+	bs->head_pa = head_pa;
+	if (!luo_cyclic_blocks_check(bs))
+		return -EINVAL;
+
+	while (next_pa) {
+		ser = phys_to_virt(next_pa);
+		if (ser->count > luo_block_count_per_block(bs)) {
+			pr_warn("Block contains too many entries: %llu\n",
+				ser->count);
+			err = -EINVAL;
+			goto err_destroy;
+		}
+		err = luo_block_add(bs, ser);
+		if (err)
+			goto err_destroy;
+		next_pa = ser->next;
+	}
+
+	return 0;
+
+err_destroy:
+	luo_block_destroy(bs);
+	return err;
+}
+
+/**
+ * luo_block_destroy - Destroy all blocks in a block set.
+ * @bs:          The block set.
+ */
+void luo_block_destroy(struct luo_block_set *bs)
+{
+	u64 head_pa = bs->head_pa;
+	struct luo_block *block;
+
+	while (!list_empty(&bs->blocks)) {
+		block = list_first_entry(&bs->blocks, struct luo_block, list);
+		list_del(&block->list);
+		kfree(block);
+	}
+	bs->nblocks = 0;
+	bs->head_pa = 0;
+
+	while (head_pa) {
+		struct luo_block_header_ser *ser = phys_to_virt(head_pa);
+
+		head_pa = ser->next;
+		luo_block_free_ser(bs, ser);
+	}
+}
+
+/**
+ * luo_block_set_clear - Clear all serialized data in a block set.
+ * @bs: The block set to clear.
+ */
+void luo_block_set_clear(struct luo_block_set *bs)
+{
+	struct luo_block *block;
+
+	list_for_each_entry(block, &bs->blocks, list) {
+		block->ser->count = 0;
+		memset(block->ser + 1, 0, LUO_BLOCK_SIZE - sizeof(*block->ser));
+	}
+}
+
+/**
+ * luo_block_it_init - Initialize a block set iterator.
+ * @it:         The iterator to initialize.
+ * @bs:         The block set to iterate over.
+ */
+void luo_block_it_init(struct luo_block_it *it, struct luo_block_set *bs)
+{
+	it->bs = bs;
+	it->block = list_first_entry_or_null(&bs->blocks, struct luo_block, list);
+	it->i = 0;
+}
+
+/**
+ * luo_block_it_next - Return the next entry slot in the block set.
+ * @it: The block iterator.
+ *
+ * If the current block is full, it automatically advances to the next block
+ * in the set.
+ *
+ * Return: A pointer to the next entry slot, or NULL if no more slots are
+ * available.
+ */
+void *luo_block_it_next(struct luo_block_it *it)
+{
+	if (!it->block)
+		return NULL;
+
+	if (it->i == luo_block_count_per_block(it->bs)) {
+		it->block->ser->count = it->i;
+		if (list_is_last(&it->block->list, &it->bs->blocks))
+			return NULL;
+		it->block = list_next_entry(it->block, list);
+		it->i = 0;
+	}
+
+	return (void *)(it->block->ser + 1) + (it->i++ * it->bs->entry_size);
+}
+
+/**
+ * luo_block_it_read - Return the next entry slot for reading.
+ * @it: The block iterator.
+ *
+ * This function iterates through entries that were previously serialized,
+ * respecting the count stored in each block's header.
+ *
+ * Return: A pointer to the next entry slot, or NULL if no more entries are
+ * available.
+ */
+void *luo_block_it_read(struct luo_block_it *it)
+{
+	if (!it->block)
+		return NULL;
+
+	while (it->i == it->block->ser->count) {
+		if (list_is_last(&it->block->list, &it->bs->blocks))
+			return NULL;
+		it->block = list_next_entry(it->block, list);
+		it->i = 0;
+	}
+
+	return (void *)(it->block->ser + 1) + (it->i++ * it->bs->entry_size);
+}
+
+/**
+ * luo_block_it_prev - Return the previous entry slot in the block set.
+ * @it: The block iterator.
+ *
+ * If the current index is at the start of a block, it automatically moves to
+ * the end of the previous block.
+ *
+ * Return: A pointer to the previous entry slot, or NULL if at the very
+ * beginning of the block set.
+ */
+void *luo_block_it_prev(struct luo_block_it *it)
+{
+	if (!it->block)
+		return NULL;
+
+	if (it->i == 0) {
+		if (list_is_first(&it->block->list, &it->bs->blocks))
+			return NULL;
+		it->block = list_prev_entry(it->block, list);
+		it->i = luo_block_count_per_block(it->bs);
+	}
+
+	return (void *)(it->block->ser + 1) + (--it->i * it->bs->entry_size);
+}
+
+/**
+ * luo_block_it_finalize - Finalize the current block by setting its entry count.
+ * @it: The block iterator.
+ */
+void luo_block_it_finalize(struct luo_block_it *it)
+{
+	if (it->block)
+		it->block->ser->count = it->i;
+}
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 4b6c18348d9b..04f31319ccdf 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -40,6 +40,51 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
  */
 #define luo_restore_fail(__fmt, ...) panic(__fmt, ##__VA_ARGS__)
 
+/**
+ * struct luo_block - Internal representation of a serialization block.
+ * @list: List head for linking blocks in memory.
+ * @ser:  Pointer to the serialized header in preserved memory.
+ */
+struct luo_block {
+	struct list_head list;
+	struct luo_block_header_ser *ser;
+};
+
+/**
+ * struct luo_block_set - A set of blocks that belong to the same object.
+ * @blocks:          The list of serialization blocks (struct luo_block).
+ * @nblocks:         The number of allocated serialization blocks.
+ * @head_pa:         Physical address of the first block header.
+ * @entry_size:      The size of each entry in the blocks.
+ * @count_per_block: The maximum number of entries each block can hold.
+ * @incoming:        True if this block set was restored from the previous kernel.
+ */
+struct luo_block_set {
+	struct list_head blocks;
+	long nblocks;
+	u64 head_pa;
+	size_t entry_size;
+	u64 count_per_block;
+	bool incoming;
+};
+
+/**
+ * struct luo_block_it - Iterator for serializing entries into blocks.
+ * @bs:         The block set being iterated.
+ * @block:      The current block.
+ * @i:          The current entry index within @block.
+ */
+struct luo_block_it {
+	struct luo_block_set *bs;
+	struct luo_block *block;
+	u64 i;
+};
+
+#define LUO_BLOCK_SET_INIT(name, _entry_size) {				\
+	.blocks = LIST_HEAD_INIT((name).blocks),			\
+	.entry_size = _entry_size,					\
+}
+
 /**
  * struct luo_file_set - A set of files that belong to the same sessions.
  * @files_list: An ordered list of files associated with this session, it is
@@ -100,6 +145,18 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 void luo_file_set_init(struct luo_file_set *file_set);
 void luo_file_set_destroy(struct luo_file_set *file_set);
 
+void luo_block_set_init(struct luo_block_set *bs, size_t entry_size);
+int luo_block_grow(struct luo_block_set *bs, u64 count);
+void luo_block_shrink(struct luo_block_set *bs, u64 count);
+int luo_block_restore(struct luo_block_set *bs, u64 head_pa);
+void luo_block_destroy(struct luo_block_set *bs);
+void luo_block_set_clear(struct luo_block_set *bs);
+void luo_block_it_init(struct luo_block_it *it, struct luo_block_set *bs);
+void *luo_block_it_next(struct luo_block_it *it);
+void *luo_block_it_read(struct luo_block_it *it);
+void *luo_block_it_prev(struct luo_block_it *it);
+void luo_block_it_finalize(struct luo_block_it *it);
+
 int luo_flb_file_preserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_finish(struct liveupdate_file_handler *fh);
-- 
2.53.0

