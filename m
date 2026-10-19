Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593235E1AC
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375890; cv=none; b=YSmLBsM+RxSUSbD6u/zOtP5n28rJIubiUqQsNm7BCBKUY2W7I+5Rhgip3tpuNkW55ormV/WRvYaFx8gMyB+A0dUj0lUIiG3hbRkF2Yc/j+3bhNipLQTeXLQ9/OTsP/YYzknt4i3LNXph4PMZzeO94v4/dlW90mYdClrTcdnRwRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375890; c=relaxed/simple;
	bh=rtOkMMPCIFi6fzUI2M5IaMOseZq7THOMtUSKvHJvjP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCobF2SyfX32csNiGNxrx9L3r9jOTfubQT5PEqEQgdGz3e6ltkLVsReURViV+j5VAB1PJSWPEqx4blnRY2ODWz842B3uCNyjFySY73PHgzWLEkpL8xsHkWhpPgvgMLN47EWk9SEdVaNSEI2U8AK989etgR4mYeLmvGJJuP5J78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WAB2tqDV; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WAB2tqDV"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e3e525cf4bso1561010e0c.1
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375887; x=1792980687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+N9EQwOcSjySxMS4O9eOeYmAxXFE2sVJ9Vy3mk5tWu4=;
        b=WAB2tqDVv7A+PBfSDIV0EnBqmTIbQdSH8XfctxV+96Hhe9px9cc5kVaxM8vdm/LcKk
         1D2PKWanxVynzIF1PgK7LxmN9pHAs7T1oNYlZwodrg4BqJiqTqaIgYifLUd/uPpOUGdD
         nszExN/cUixb/e9Xjwx08pKu5rcKaUJwZPaQ498scLf0r/VXIHZUfqGEOmaQEoq1tBLU
         iuH7HIZ3+iCp5ScOj3gGs6hk1LeyJV0VGfP5yl4brNYv8T+ShtLdRMMherIt/+zpdHaA
         +cP5RYBFryRzFEURsQuHvonyO67f5MMS3VoiJX4RilP1OZ2+IiDzfnH5L2R0Y1aVrhRi
         LQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375887; x=1792980687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+N9EQwOcSjySxMS4O9eOeYmAxXFE2sVJ9Vy3mk5tWu4=;
        b=ias3B/jYKNi2ZDBwAjpaAqdiVe5tuw3Lr5WHDdhokEUkzGqF+T0lBhD5sZU56SVJll
         dr8LCOQdm96TLwbjYT403N/OEj4QOwerFWsRIwJCJiNL2nXQU24Ih1nirF5lCYkgy0WV
         eYMb4MJisa/Pe3EIZxVLG8IghofSSeSnpgNJWTgkvhTPk2luInZFqExklQm71VBGeFuv
         Yj8pOFchEt/LJebnODuTI6ecJMPUOx/SWKzvz/9ubwFkhOaCYsw6oxruXL75R6PiX/EF
         v+8CbtN25nSLTgOyOmAsdHIXvz0lIEn0Q1Ik+kYGdQmF+6qHnMU/l2E2N78ryqqRP7h8
         i9+w==
X-Gm-Message-State: AFq9FYJ+gRFE6MrMEaRlt8aNuHh/peRX+joVe3wRSNejxS2oLg4ulirk
	n8J76IxlbTKwLULoF4ProIK+KpJq/mfcn0xXww64TBRpawhgqAse0vGhCFvwfYmsdP+UN7+toeq
	vabsF
X-Gm-Gg: AYBFou1y9VaJzISqGARzhPomL5YoZ+plyTXspRph4ZTJ2DqhJ0TMGj/49RyKFg5w3sU
	ZhVE4osHFoV6QGCTkJJA/X9qD7/lywZP6Xp9dW5ahHx+2poxFtA5o4TbxYXkZ85aXrROLjDxZnx
	GqEdRJtJc07VKx9IjvwqU0FnLDOqJNo3fl/3qQcD7GKabiaGmUFiA6uNvd2XCfN0x7qioEshoER
	9l82qvph7+kap9M++BKmzqCD2nuiCR7nYt1Neu+CesPKMEmBXTITOQh9X4Pq5yEdcokuvcxvmjK
	d20KwOyz5qmIBn1H4pGCTt3amm9/U5fiGdkdIVpu1wTWnJJZhcCBhCgn4THUB8mBm4VV2+KQeis
	qmwujfZosp1kd/wMqj3mL2WVSsSY5CeuFdF7Mc/LV2ab6VabSL2oyMqPq/OC5ExUAcvf0CS8M1e
	oyUMhMa+RJ90gm9HOxX+UTTnnoO8kHhS0tFeM1c30fAkKQ/yqDpc8LT6XZVSHoVb8R3WXPWQ+jp
	5y1KUWAFZmJr0X152AabrQsF5cqeWhGPQmTQEFwKUGAPQ2U0BD1OwruApHpezcDmuVixkNk7+oS
	9UmRmLc8CJlpTOVyKoQ=
X-Received: by 2002:a05:6122:3115:b0:5ea:a749:d33c with SMTP id 71dfb90a1353d-5eaaa66d4eamr2218681e0c.9.1792375887405;
        Sun, 18 Oct 2026 19:11:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:26 -0700 (PDT)
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
Subject: [PATCH v1 6/8] kho: support read-only KHO mode in kho_block
Date: Sun, 18 Oct 2026 22:11:09 -0400
Message-ID: <20261019021111.990394-7-pasha.tatashin@soleen.com>
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

In read-only KHO mode, incoming serialized kho_block chains lie outside
the kernel's direct map and must not be modified or freed back into the
page allocator.

Map incoming serialized blocks read-only via kho_ro_map_folio(...,
PAGE_KERNEL_RO) during cycle detection and restoration, and unmap them
via kho_ro_unmap() instead of calling kho_restore_free() when destroying
or shrinking a block set in read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/Makefile    |  5 +--
 kernel/liveupdate/kho_block.c | 76 ++++++++++++++++++++++++++---------
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index f8b09e04bea2..d3587048e619 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -1,14 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
 luo-y :=								\
-		kho_block.o						\
 		luo_core.o						\
 		luo_file.o						\
 		luo_flb.o						\
 		luo_session.o
 
-obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
-obj-$(CONFIG_KEXEC_HANDOVER_READONLY)	+= kexec_handover_ro.o
+obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o kho_block.o
+obj-$(CONFIG_KEXEC_HANDOVER_READONLY)	+= kexec_handover_ro.o kho_block.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index a4e945f28fad..a3cf5b964b26 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -60,10 +60,32 @@ static void *kho_block_entry(struct kho_block_set_it *it, u64 index)
 	return kho_block_entries(it->block) + (index * it->bs->entry_size);
 }
 
+static struct kho_block_header_ser *kho_block_map_ser(phys_addr_t pa)
+{
+	if (!pa)
+		return NULL;
+
+	if (kho_is_ro())
+		return kho_ro_map_folio(pa, PAGE_KERNEL_RO);
+
+	return phys_to_virt(pa);
+}
+
+static void kho_block_unmap_ser(struct kho_block_header_ser *ser)
+{
+	if (kho_is_ro())
+		kho_ro_unmap(ser);
+}
+
 /* Free serialized data */
 static void kho_block_free_ser(struct kho_block_set *bs,
 			       struct kho_block_header_ser *ser)
 {
+	if (kho_is_ro()) {
+		kho_block_unmap_ser(ser);
+		return;
+	}
+
 	if (bs->incoming)
 		kho_restore_free(ser);
 	else
@@ -197,6 +219,20 @@ void kho_block_set_shrink(struct kho_block_set *bs, u64 count)
 		kho_block_set_shrink_one(bs);
 }
 
+static bool kho_block_step_pa(phys_addr_t pa, phys_addr_t *next_pa)
+{
+	struct kho_block_header_ser *ser;
+
+	ser = kho_block_map_ser(pa);
+	if (!ser)
+		return false;
+
+	*next_pa = ser->next;
+	kho_block_unmap_ser(ser);
+
+	return true;
+}
+
 /*
  * kho_block_set_is_cyclic - Check for cycles in a linked list of blocks.
  * Uses Floyd's cycle-finding algorithm to ensure sanity of the incoming list.
@@ -205,30 +241,26 @@ void kho_block_set_shrink(struct kho_block_set *bs, u64 count)
  */
 static bool kho_block_set_is_cyclic(struct kho_block_set *bs)
 {
-	struct kho_block_header_ser *fast;
-	struct kho_block_header_ser *slow;
+	phys_addr_t fast_pa = bs->head_pa;
+	phys_addr_t slow_pa = bs->head_pa;
 	int count = 0;
 
-	fast = phys_to_virt(bs->head_pa);
-	slow = fast;
-
-	while (fast) {
+	while (fast_pa) {
 		if (count++ >= KHO_MAX_BLOCKS) {
 			pr_err("Block set is corrupted\n");
 			return true;
 		}
 
-		if (!fast->next)
-			break;
-
-		fast = phys_to_virt(fast->next);
-		if (!fast->next)
+		if (!kho_block_step_pa(fast_pa, &fast_pa))
+			return true;
+		if (!fast_pa)
 			break;
 
-		fast = phys_to_virt(fast->next);
-		slow = phys_to_virt(slow->next);
+		if (!kho_block_step_pa(fast_pa, &fast_pa) ||
+		    !kho_block_step_pa(slow_pa, &slow_pa))
+			return true;
 
-		if (slow == fast) {
+		if (slow_pa == fast_pa) {
 			pr_err("Block set is corrupted\n");
 			return true;
 		}
@@ -266,16 +298,23 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
 	}
 
 	while (next_pa) {
-		ser = phys_to_virt(next_pa);
+		ser = kho_block_map_ser(next_pa);
+		if (!ser) {
+			err = -ENOMEM;
+			goto err_destroy;
+		}
 		if (!ser->count || ser->count > bs->count_per_block) {
 			pr_warn("Block contains invalid entry count: %llu\n",
 				ser->count);
+			kho_block_unmap_ser(ser);
 			err = -EINVAL;
 			goto err_destroy;
 		}
 		err = kho_block_add(bs, ser);
-		if (err)
+		if (err) {
+			kho_block_unmap_ser(ser);
 			goto err_destroy;
+		}
 		next_pa = ser->next;
 	}
 
@@ -285,9 +324,10 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
 	kho_block_set_destroy(bs);
 
 	/* Free the remaining un-restored blocks in the physical chain */
-	while (next_pa) {
-		struct kho_block_header_ser *next_ser = phys_to_virt(next_pa);
+	while (!kho_is_ro() && next_pa) {
+		struct kho_block_header_ser *next_ser;
 
+		next_ser = phys_to_virt(next_pa);
 		next_pa = next_ser->next;
 		kho_block_free_ser(bs, next_ser);
 	}
-- 
2.56.0.176.g3575e65682-goog

