Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950035;
	b=d4DuqQRakf9UtwW8Ywc1S+uQGnhdkyhU9YiBfhQLd6Q1Z06G2wfpK7CrSaW5yr8nru5u
	 iO5hmy3wBbIbCJIjApiaV8IuP/eM+d5iGlD+Ji/mWUNllc5wSrG/mWJbP1ra/VeOzioS3
	 NbTdheOYJ7XXOW1b4y+muds5THZIz21sT4ENwZQFLt4q+DvHseOzXdhjzaMG4UazmW/Zt
	 wX2/viNJdQJljrUsuN2Cjz1YmiiBJIuC4rVuxJwpVHCDMJbt43k3kpsMI0+x+oaTyRC/Y
	 BDHN5OkO1abvEmWLsHPrd6obWzHGSoetvgj3O/VWkKe5Xp2y3lkorfovukDqmAhSeNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6x1S3ZqdbkxHt3USof+znmMvAt7VbtHwbOPxHgeUp/E=;
	b=g7SjeqtwdtRSwFUPFZupTUUrEe5RRUPK7BfQeOv0M7proYLlAfsAENZzh3b/eSuFsjxV
	 Mt9Ph+xrxkz8WopUzCsKrzvBauCrBsZBHrGZcKgsOmJr6fnwyX+ZIrXXC7j9A0j4mjz8N
	 nmwxEEyj+3nzrnTIdwTmQrEPF+vgJI/Q9hoSp9wRnNAiWuYzxJfbHaIBAVGwF1mIzIHfb
	 KQrvZGjR3r+z76ZladjQfLvJtSQkNghMHl+CzAt+6EscswO/pGJVXdawgkVML7hLIa+WC
	 rjR3Uvtdt2++ij4442yNOgreTr3gGFX2nYtecnsZ/b+AwZvItbYyvr/6NZuCfQWI9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=N3W6rewO;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B26606A31F
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 17:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B26606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=N3W6rewO
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so1831960e0c.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950024; x=1793554824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6x1S3ZqdbkxHt3USof+znmMvAt7VbtHwbOPxHgeUp/E=;
        b=N3W6rewOtEnCKlu0xpAwJvTOFp1/AE72NHOhKW0WInhEZ2eoJ2PpyxANhJLc96Wkl7
         qotmYvxnHLdqJT6MbYH6Yl02zRKS7TV8jR9j/blSAHWvyqU7qDD2kKnRikH/1bWYi7ZN
         zdMa9mnVUIJRkVNZohG/f8xIUM2njCBdpBbO/9Qz7PIK52cBvURt0PrA8QVJ/vK01n35
         EEeRSNC0ZFoZeeLekOJwqqCDHoQ8H5JtMLj101ThUw4mUrneCAvFxyKqDhuQHn+wzcSt
         gFpjgVGwJ/5aZaDpb1jgWtP4uqv+IdI70IKCEAyxkVkKKivgWolfllqdOZYhBE6Kf4Oo
         lV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950024; x=1793554824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6x1S3ZqdbkxHt3USof+znmMvAt7VbtHwbOPxHgeUp/E=;
        b=rgHpMFQXYqkbLu7F0MVliO4BXhJiwo2yTck+SiFB/Q1XvL8PH3dd29i7uPjjM2YAzl
         GY6cZhXMxivh6z2LF/lonWew16P9mSozxzhF1tnSlycng1W0qGk+QAQhlWvj8bBXrl+G
         u8r4OEczAiueFZvoLkLViWzzsmLP7Vv11QQHvFrkWm3m35/ZO3kIVWj+0h1uELew+Y2o
         CwHb69nI2qmGMB2+kpqfeoKZrYbUhIB52iClDmNkgRZGPDZx904eBQDuvmfWdMo1IxQf
         A9UlwplmQWVzAduFjxQKtVFFYEcUk8DqcmBRoRxQKN5wtHPkH89MDhFGDenycBJ2RvL9
         SiWQ==
X-Gm-Message-State: AFq9FYLGGFbeDXKkWCNs+o37DJ47z+eV/ARjOZghaXu3gcDJnKGT1TNm
	/UU2n+/W3bQv/I60VrNaYjvj+B/tObH6aVA0topUJ6Z9HNFPfEaxW3t6qhBLosw7HyNwh8/h4LD
	KhP4s
X-Gm-Gg: AYBFou0D/5LzcwsjzSoA9mBMe/KybhppBFWeXWpUBRrFJpeOZVmZCk+LEbTOz2YbmxO
	Y9838e2oipm9DDaHLHlRNx7DwXowUGpedWgOLRp8JEhgAl/AASgS8DTS78rq2WzJWxdWHa0xQQA
	UPVSkfVSfjzIuyZRQv7jO+/1mbUBlzIteTtTh3W/WZSA2OdXhLOvrAa9J0MadgYCZXXLvI2J/0M
	c4ORaZTwZDHJxxGUcUplC5E//D2K7o6VUthJmJ9XX7Qd0/tgj0m+w9XY0hU0NtjGTs1t3Kx/mm9
	vtAYasAOuTN/u8I4K9X51EN7Ry+Ijzllvv2P/P4a7CR8IpOHiu8Euu2e0WWKqEBZlLmZYvl0Sfx
	Bzvwg1fG8alZhz6AX+BOPGIxZXjszaxnPFVFyWOj46cK2tDCyiXWtB8oyGUTmOx7KL7EXGAiBGj
	DWKUlOsa2LJa7vxVayQJN4ay21km7+cKs2stvcH6M5k4dxZMrdExlLRh9RF67GWuLpXDVJcL2MJ
	joPtKj/EgFwzKnyI9xiDncsp4yXDyPeGgK4EN84776Y7EGxjpcakGfft63oQJHuAYiIdj6JUhfT
	aK/LgZaNxYTTM9Ls595+zzXtWhHpJEskiP0Y9ndGSzcGvI3CIY6z9mijN3bNVTsBRsQ8XaAuJss
	5vuDqi6UtJgBnLcL+uXbB4Y0=
X-Received: by 2002:a05:6122:21a9:b0:5ea:d5ff:3bc5 with SMTP id 71dfb90a1353d-5ec2309e769mr1605074e0c.2.1792950024405;
        Sun, 25 Oct 2026 10:40:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:24 -0700 (PDT)
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
Subject: [PATCH v2 3/9] kho: validate preservation metadata in kho_restore_vmalloc()
Date: Sun, 25 Oct 2026 13:40:10 -0400
Message-ID: <20261025174017.3870481-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

kho_restore_vmalloc() currently dereferences preservation before
checking for NULL, does not reject unknown KHO vmalloc flags, and does
not validate preservation->first.phys, preservation->total_pages, or
preservation->order before allocating the pages array and shifting by
order.

Move kho_flags_to_vmalloc() to kexec_handover_common.c and introduce
kho_vmalloc_validate() and kho_vmalloc_walk() so both regular KHO and
the upcoming read-only KHO mode can share vmalloc header validation and
chunk-list traversal. Converting kho_restore_vmalloc() to
kho_vmalloc_walk() also restores each chunk page before reading its
contents and rejects non-terminal chunks that are not completely full.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c          | 99 ++++++++++-----------
 kernel/liveupdate/kexec_handover_common.c   | 87 ++++++++++++++++++
 kernel/liveupdate/kexec_handover_internal.h | 14 +++
 3 files changed, 150 insertions(+), 50 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index c24f25bfc96a..67efbdd39439 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1204,10 +1204,6 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_pages);
 /* vmalloc flags KHO supports */
 #define KHO_VMALLOC_SUPPORTED_FLAGS	(VM_ALLOC | VM_ALLOW_HUGE_VMAP)
 
-/* KHO internal flags for vmalloc preservations */
-#define KHO_VMALLOC_ALLOC	0x0001
-#define KHO_VMALLOC_HUGE_VMAP	0x0002
-
 static unsigned short vmalloc_flags_to_kho(unsigned int vm_flags)
 {
 	unsigned short kho_flags = 0;
@@ -1220,18 +1216,6 @@ static unsigned short vmalloc_flags_to_kho(unsigned int vm_flags)
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
@@ -1357,6 +1341,45 @@ void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation)
 }
 EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
 
+struct kho_vmalloc_restore_ctx {
+	struct page **pages;
+	unsigned long contig_pages;
+	unsigned long idx;
+};
+
+static const struct kho_vmalloc_chunk *kho_get_chunk(phys_addr_t pa)
+{
+	struct page *page = kho_restore_pages(pa, 1);
+
+	return page ? page_to_virt(page) : NULL;
+}
+
+static void kho_put_chunk(const struct kho_vmalloc_chunk *chunk)
+{
+	free_page((unsigned long)chunk);
+}
+
+static int kho_vmalloc_restore_entry(phys_addr_t pa, void *priv)
+{
+	struct kho_vmalloc_restore_ctx *ctx = priv;
+	struct page *page;
+
+	page = kho_restore_pages(pa, ctx->contig_pages);
+	if (!page)
+		return -EINVAL;
+
+	for (unsigned long j = 0; j < ctx->contig_pages; j++)
+		ctx->pages[ctx->idx++] = page + j;
+
+	return 0;
+}
+
+static const struct kho_vmalloc_walk_ops kho_vmalloc_restore_ops = {
+	.get_chunk = kho_get_chunk,
+	.put_chunk = kho_put_chunk,
+	.entry = kho_vmalloc_restore_entry,
+};
+
 /**
  * kho_restore_vmalloc - recreates and populates an area in vmalloc address
  * space from the preserved memory.
@@ -1369,18 +1392,16 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
  */
 void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
 {
-	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
 	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_PROT_NORMAL;
-	unsigned int align, order, shift, vm_flags;
-	unsigned long total_pages, contig_pages;
+	struct kho_vmalloc_restore_ctx ctx;
+	unsigned long total_pages, align;
+	unsigned int order, shift, vm_flags;
 	unsigned long addr, size;
 	struct vm_struct *area;
 	struct page **pages;
-	unsigned int idx = 0;
 	int err;
 
-	vm_flags = kho_flags_to_vmalloc(preservation->flags);
-	if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
+	if (!kho_vmalloc_validate(preservation, &vm_flags))
 		return NULL;
 
 	total_pages = preservation->total_pages;
@@ -1388,37 +1409,15 @@ void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
 	if (!pages)
 		return NULL;
 	order = preservation->order;
-	contig_pages = (1 << order);
 	shift = PAGE_SHIFT + order;
-	align = 1 << shift;
-
-	while (chunk) {
-		struct page *page;
+	align = 1UL << shift;
 
-		for (int i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
-			phys_addr_t phys = chunk->phys[i];
-
-			if (idx + contig_pages > total_pages)
-				goto err_free_pages_array;
-
-			page = kho_restore_pages(phys, contig_pages);
-			if (!page)
-				goto err_free_pages_array;
-
-			for (int j = 0; j < contig_pages; j++)
-				pages[idx++] = page + j;
-
-			phys += contig_pages * PAGE_SIZE;
-		}
-
-		page = kho_restore_pages(virt_to_phys(chunk), 1);
-		if (!page)
-			goto err_free_pages_array;
-		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
-		__free_page(page);
-	}
+	ctx = (struct kho_vmalloc_restore_ctx){
+		.pages = pages,
+		.contig_pages = 1UL << order,
+	};
 
-	if (idx != total_pages)
+	if (kho_vmalloc_walk(preservation, &kho_vmalloc_restore_ops, &ctx))
 		goto err_free_pages_array;
 
 	area = __get_vm_area_node(total_pages * PAGE_SIZE, align, shift,
diff --git a/kernel/liveupdate/kexec_handover_common.c b/kernel/liveupdate/kexec_handover_common.c
index f2784f5c523c..dc25cb4c08af 100644
--- a/kernel/liveupdate/kexec_handover_common.c
+++ b/kernel/liveupdate/kexec_handover_common.c
@@ -19,9 +19,96 @@
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
+#include <linux/vmalloc.h>
 
 #include "kexec_handover_internal.h"
 
+static unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
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
+bool kho_vmalloc_validate(const struct kho_vmalloc *preservation,
+			  unsigned int *vm_flags)
+{
+	if (!preservation || !preservation->first.phys ||
+	    !PAGE_ALIGNED(preservation->first.phys) ||
+	    !preservation->total_pages)
+		return false;
+
+	if (preservation->order >= BITS_PER_LONG - PAGE_SHIFT ||
+	    (1UL << preservation->order) > preservation->total_pages ||
+	    !IS_ALIGNED(preservation->total_pages, 1UL << preservation->order))
+		return false;
+
+	if (preservation->flags & ~(KHO_VMALLOC_ALLOC | KHO_VMALLOC_HUGE_VMAP))
+		return false;
+
+	*vm_flags = kho_flags_to_vmalloc(preservation->flags);
+	return true;
+}
+
+/**
+ * kho_vmalloc_walk - Walk the chunk list of a preserved vmalloc region.
+ * @preservation: Validated KHO vmalloc preservation metadata.
+ * @ops:          Callbacks to acquire/release chunks and process each entry.
+ * @priv:         Caller context passed to @ops->entry.
+ *
+ * Traverses the linked list of struct kho_vmalloc_chunk pages starting from
+ * @preservation->first.phys, invoking @ops->entry for each contiguous physical
+ * range and verifying that non-terminal chunks are full and that the total
+ * number of pages matches @preservation->total_pages.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int kho_vmalloc_walk(const struct kho_vmalloc *preservation,
+		     const struct kho_vmalloc_walk_ops *ops, void *priv)
+{
+	unsigned long contig_pages = 1UL << preservation->order;
+	unsigned long total_pages = preservation->total_pages;
+	unsigned long nr_pages = 0;
+	phys_addr_t chunk_pa;
+
+	for (chunk_pa = preservation->first.phys; chunk_pa; ) {
+		const struct kho_vmalloc_chunk *chunk;
+		phys_addr_t next_pa;
+		unsigned int i;
+
+		chunk = ops->get_chunk(chunk_pa);
+		if (!chunk)
+			return -EINVAL;
+
+		for (i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
+			if (nr_pages + contig_pages > total_pages ||
+			    ops->entry(chunk->phys[i], priv))
+				goto err_put_chunk;
+
+			nr_pages += contig_pages;
+		}
+
+		next_pa = chunk->hdr.next.phys;
+		if (next_pa && i < ARRAY_SIZE(chunk->phys))
+			goto err_put_chunk;
+
+		ops->put_chunk(chunk);
+		chunk_pa = next_pa;
+		continue;
+
+err_put_chunk:
+		ops->put_chunk(chunk);
+		return -EINVAL;
+	}
+
+	return nr_pages == total_pages ? 0 : -EINVAL;
+}
+
 /**
  * kho_encode_radix_key - Encodes a physical address and order into a radix key.
  * @phys: The physical address of the page.
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e73a2e310917..dd79e5006562 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -8,7 +8,21 @@
 #include <linux/list.h>
 #include <linux/types.h>
 
+/* KHO internal flags for vmalloc preservations */
+#define KHO_VMALLOC_ALLOC	0x0001
+#define KHO_VMALLOC_HUGE_VMAP	0x0002
+
+struct kho_vmalloc_walk_ops {
+	const struct kho_vmalloc_chunk *(*get_chunk)(phys_addr_t pa);
+	void (*put_chunk)(const struct kho_vmalloc_chunk *chunk);
+	int (*entry)(phys_addr_t pa, void *priv);
+};
+
 const void *kho_get_fdt(void);
+bool kho_vmalloc_validate(const struct kho_vmalloc *preservation,
+			  unsigned int *vm_flags);
+int kho_vmalloc_walk(const struct kho_vmalloc *preservation,
+		     const struct kho_vmalloc_walk_ops *ops, void *priv);
 unsigned long kho_encode_radix_key(phys_addr_t phys, unsigned int order);
 phys_addr_t kho_decode_radix_key(unsigned long key, unsigned int *order);
 unsigned long kho_radix_get_bitmap_index(unsigned long key);
-- 
2.56.0.307.g5fe7bd680c-goog

