Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854861;
	b=DsrhKIrjDMYQxeUyzb+cWR4vsAwu4DEMy8Z9ergWjebW+BkV4dJ2nLKyPPAAHRK3hyZJ
	 NFF87ncO4IxlrtRWqtNgZsFpPKg0AFwvNHUn2RuB00IuBkoKbBz2802nzLvXHzWiTvD9A
	 wZldm/zfht6gEUS2X8uUdzRuQh9jCVKDxY4kEKxmTxLoQi3txGVFg30Tp/gAcB+V7Qh4G
	 /oyOh1nbuOBWp1WSe6Bb+AwNlDnHnNa8syUonICxPEp1XOhqRsnyfY0OCavgnaovbYwTu
	 /JxaySSjGiQez7Fy4tQ0eyKTR+X5vYTfAxmMK583wN/VL7i+j8mfIvMUyGbQVAVJk1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QR7+RzYUX4/ytxM/0jS+GRtrp88N8Eh0P5U9HMcYULs=;
	b=PFYBybUdFoH65f9NsbkaxS9/mSGSJgbbvKq+mx9PO+xTXW2qt3CIGxKcQXN1MqjO8JrN
	 61SUqHkJ6PXoK2PoKWQ+nqCNPYDp34zklPuHsFLy/bkL3piuROcohxnnMaeSO54WDXPN/
	 R9b+qGxTawSuCghY5dXKa5qbmlRjYE+ecqgkNMgAtAjB8HVeBAfli/aIlWxvXjJWHnX45
	 GqkvQ1hGAVOtfO+hHsFqzmKTrhT084879+r1K324rDaAMRWAs8ivbNFfHx2jF2b5R/6bU
	 PY0m4ohm/PTqCxMcHbBZLsw9L7gbLgE4C3kzwoEA8gObM66VVgqDurbg+ktFdNEj5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=LZnZwqIP;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C62606D804
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C62606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=LZnZwqIP
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso509125e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854860; x=1794459660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QR7+RzYUX4/ytxM/0jS+GRtrp88N8Eh0P5U9HMcYULs=;
        b=LZnZwqIPLNiW/LkeN+Xi5RGlvG+O4sAM7NnpKwL43FPimrkLcrBwL15K68PJZsh8KC
         o7LvxQEIcVJ0rscn6F+EryafDWE39Kg5wzMSPY24vZE+ZxqF6yThDoU6udh0EEhhSsf+
         6ICXJDAduAmldpglFRuXAGGei4Ius2MUJgCtEIs+HzWK+UFwGMhMNNvr3FRHV0rVoanv
         m/k0Z95n81kNu3xoGNd9ZuHZTZUSAd6Cvx1lQ854/+sZmlStb47InAO7egF3oY4pfddl
         tgRo3Kg4OQJZ8HWbKWvdGCD++TYNYbbraU+9Nj2Cj69/c2OOof0ApKY6vPs5idualmlG
         okcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854860; x=1794459660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QR7+RzYUX4/ytxM/0jS+GRtrp88N8Eh0P5U9HMcYULs=;
        b=bOyKRhjxO8DdAk6nmrknthGywTeeSq0bTChuVrpPEB/R27VhL9jYIjc7WNcuI5dXA+
         6wp78LORvjHPlBQOgjmPg6NFkOqA8unLvD5kR/41+k0kueTPoHb7QICr12Tf1M3M9mqt
         nvAaeoVl1q9MNUU1K4np50aJCczOajro/4nMh2xhTo6YcLvSE0KCJQ3+0M0aTioBMAcN
         hiDx4DpvAUJITX15SL9A2kOYVOJ8vvsT9mOtNhqgh54QW+99e97Pey7qxWyN1d3cl/R/
         dcyN/RaYV7J5pmKKPLd8NlKuoC7rJrG/w9zZl0QO6lT1tgUS0CKJUPQf/j9nV2+BTP/L
         5L1A==
X-Gm-Message-State: APuU4Z9tVInQ8Zw8QjDqL7VCLwGRzDXP5+PV1cgl1W1pcozwG9oo+9Cj
	/4CI2H7j26CGL+8CqsnXzjT8FvmR2SXc31vN3F+GCTs9GwhVylHV3QykEDXaHJo9UKxS2PrgFDW
	4MCAB
X-Gm-Gg: AYBFou1VmnHow4mF5vaun6Ctxgu9rZvcA6wl2CkN3M+shFKBXzgq43quzHbHp6zrxZD
	4/sLyr+OjZh9Vky6AKh/GYlljCaAg2lOHK2sV584Di3P8+EmA9CZJ79dpVnZNFVbQdrMgw/zmEY
	uKjkaB/gFPtHzTEeQIFB752kui5zJG7eV4e2DR7kJSKOHeWU2bUFSr00AQD9U2X3p4YXfoli/4P
	DSi9Lm7vaW/4VwOJ6XaCMjciO8rQvankpx1c2xvaiyKo1mKJw45Glb3ZSleVeajp7RmmBeUxlpl
	2EenG7Lsj2hupLRnlBB9ZUZVXsTkU2OdLQrJ8cB2T9Do3SdKUlXLYZHuXIOOkeBudFAF7DqXa1h
	tKNEvvCO0XTQ/kyU4pxzoMVbsAL6355BoUaW1Ej2CWwqSMq7ngtMme8Jb7+KUFvHpdhdYLhoOKg
	KttomZrYCDg73oSnShXIBns9ftece7uT7v57BECRBlHCyWF2tu6bs/NV5pgqAngCaCMLdWNQ3I2
	S6scfLd/MRn1JgbDR2WQs48piu4KnlRlT1cjV2UKA0j1jCR1PVwmWDEE1KV4WftrZNqzXzv7Npx
	U61s1vc4ZePANM4EoSv0g3Me2U6PaTSvi7aJQNONt8cYvfyCIxoSNXy1gA8v3yBkaWb27DW5N+a
	SG65b8eDdDdYuRmeKmFelgfbpzLA2xXiI5vaRmtBdNPCJY8wKNw==
X-Received: by 2002:a05:6122:512:b0:5da:9b81:1aa4 with SMTP id 71dfb90a1353d-5ec6870c946mr7158777e0c.5.1793854860291;
        Wed, 04 Nov 2026 21:01:00 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:00:59 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 2/6] kho: support incremental entry publication in kho_block
Date: Thu,  5 Nov 2026 00:00:48 -0500
Message-ID: <20261105050053.3063001-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To allow LUO sessions to be frozen and committed into the outgoing KHO
subtree from userspace ahead of reboot, kho_block needs to support
publishing entries one by one into a live serialized block chain while
new blocks may still be preallocated or shrunk for uncommitted sessions.

Currently, kho_block assumes outgoing block sets are populated in a
single batch during reboot() before the chain is exposed: preallocated
blocks are linked onto the chain immediately even while empty
(ser->count == 0), and reserving a slot increments ser->count before the
entry is populated.

Address this by keeping preallocated outgoing blocks unlinked in
kho_block_add(), linking blocks lazily only as entries are written. Add
kho_block_set_it_append() to copy each entry into its slot before
publishing the updated ser->count and next-block link via
smp_store_release(), paired with smp_load_acquire() in
kho_block_set_it_read_entry().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho_block.h     |  1 +
 kernel/liveupdate/kho_block.c | 86 +++++++++++++++++++++++++++++++----
 2 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
index 93a7cc2be5f5..a9e696ef3e08 100644
--- a/include/linux/kho_block.h
+++ b/include/linux/kho_block.h
@@ -100,6 +100,7 @@ static inline bool kho_block_set_is_empty(struct kho_block_set *bs)
 
 void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_block_set *bs);
 void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it);
+void *kho_block_set_it_append(struct kho_block_set_it *it, const void *src);
 void *kho_block_set_it_read_entry(struct kho_block_set_it *it);
 void *kho_block_set_it_prev(struct kho_block_set_it *it);
 
diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..2813c6fd593c 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -16,6 +16,12 @@
  * array of serialized entries. Multiple blocks are linked together via a
  * physical pointer in the header, forming a linked list that can be easily
  * traversed in both the current and the next kernel.
+ *
+ * Outgoing blocks preallocated via kho_block_set_grow() remain unlinked until
+ * entries are written into them. Callers publishing entries incrementally into
+ * a live KHO subtree can use kho_block_set_it_append(), which populates each
+ * entry before exposing the updated block count or next-block link via
+ * release-store ordering.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -93,9 +99,7 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
+	if (!last)
 		bs->head_pa = virt_to_phys(ser);
 
 	return 0;
@@ -129,14 +133,15 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	last = list_last_entry(&bs->blocks, struct kho_block, list);
 	list_del(&last->list);
 	bs->nblocks--;
-	kho_block_free_ser(bs, last->ser);
-	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
 	if (new_last)
-		new_last->ser->next = 0;
+		WRITE_ONCE(new_last->ser->next, 0);
 	else
 		bs->head_pa = 0;
+
+	kho_block_free_ser(bs, last->ser);
+	kfree(last);
 }
 
 /**
@@ -144,9 +149,9 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
  * @bs:    The block set.
  * @count: The target number of valid entries to accommodate.
  *
- * Dynamically preallocates and links preserved memory blocks if the target
- * entry count exceeds the current total capacity of the set, ensuring they
- * are available during serialization/deserialization.
+ * Dynamically preallocates preserved memory blocks if the target entry count
+ * exceeds the current total capacity of the set, ensuring they are available
+ * during serialization/deserialization.
  *
  * Context: Caller must hold a lock protecting the block set.
  * Return: 0 on success, or a negative errno on failure.
@@ -318,6 +323,7 @@ void kho_block_set_clear(struct kho_block_set *bs)
 	struct kho_block *block;
 
 	list_for_each_entry(block, &bs->blocks, list) {
+		block->ser->next = 0;
 		block->ser->count = 0;
 		memset(block->ser + 1, 0, KHO_BLOCK_SIZE - sizeof(*block->ser));
 	}
@@ -348,6 +354,7 @@ void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_block_set *bs
  */
 void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
 {
+	struct kho_block *prev = NULL;
 	void *entry;
 
 	if (!it->block)
@@ -356,15 +363,73 @@ void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
 	if (it->i == it->bs->count_per_block) {
 		if (list_is_last(&it->block->list, &it->bs->blocks))
 			return NULL;
+		prev = it->block;
 		it->block = list_next_entry(it->block, list);
 		it->i = 0;
 	}
 
+	if (!it->i)
+		it->block->ser->next = 0;
+
 	entry = kho_block_entry(it, it->i++);
 	it->block->ser->count = it->i;
+	if (prev)
+		prev->ser->next = virt_to_phys(it->block->ser);
+
 	return entry;
 }
 
+/**
+ * kho_block_set_it_append - Write and publish an entry at the next slot.
+ * @it:  The block iterator.
+ * @src: Entry data of size @it->bs->entry_size to copy into the slot.
+ *
+ * Copies @src into the next available slot before updating the block's entry
+ * count or linking a newly occupied block to the previous block, so concurrent
+ * readers never observe an uninitialized slot or an empty block.
+ *
+ * Return: A pointer to the written entry slot, or NULL if the block set's
+ * capacity is fully exhausted.
+ */
+void *kho_block_set_it_append(struct kho_block_set_it *it, const void *src)
+{
+	struct kho_block *prev = NULL;
+	void *dst;
+
+	if (!it->block)
+		return NULL;
+
+	if (it->i == it->bs->count_per_block) {
+		if (list_is_last(&it->block->list, &it->bs->blocks))
+			return NULL;
+		prev = it->block;
+		it->block = list_next_entry(it->block, list);
+		it->i = 0;
+	}
+
+	if (!it->i)
+		WRITE_ONCE(it->block->ser->next, 0);
+
+	dst = kho_block_entry(it, it->i++);
+	memcpy(dst, src, it->bs->entry_size);
+
+	/*
+	 * Ensure the serialized entry is visible before exposing the
+	 * incremented count to concurrent readers.
+	 */
+	smp_store_release(&it->block->ser->count, it->i);
+	if (prev) {
+		/*
+		 * Ensure the new block's first entry and header are visible
+		 * before linking prev->ser->next for concurrent readers.
+		 */
+		smp_store_release(&prev->ser->next,
+				  virt_to_phys(it->block->ser));
+	}
+
+	return dst;
+}
+
 /**
  * kho_block_set_it_read_entry - Read the next serialized entry from the block set.
  * @it: The block iterator.
@@ -380,7 +445,8 @@ void *kho_block_set_it_read_entry(struct kho_block_set_it *it)
 	if (!it->block)
 		return NULL;
 
-	if (it->i == it->block->ser->count) {
+	/* Pairs with smp_store_release() in kho_block_set_it_append(). */
+	while (it->i >= smp_load_acquire(&it->block->ser->count)) {
 		if (list_is_last(&it->block->list, &it->bs->blocks))
 			return NULL;
 		it->block = list_next_entry(it->block, list);
-- 
2.56.0.398.g882cbad275-goog

