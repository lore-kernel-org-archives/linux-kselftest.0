Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32C535C69E
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375886; cv=none; b=sqNgV/L+OvO7bmMTveJjTrwLUwTNDvCiCubUeDvlJ08XrY0suuixvvbdZ+dw1NCumPynf8QzyyXIIw7sJQLus5rN9YEymFIxtm/x25KCfWp0g5dL0Uq1S7UYH6ETvITMne9vvf+xvhxct5ku2beudbuz+/G69EXtwie8zMYU9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375886; c=relaxed/simple;
	bh=6llEtz4c18R9SgByx+0WwEdms6eMF3dZUu1W9SzanR0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4GNUvVDHqY/3fLaHnG1Vn1Pnas/7gXZR5WsiWeoBeFuO6nFnsD3HEt2dZZT3HOLTRNWluwRNotvkDwFk3T5dhIh95ouVxHn0zvWa1tLIaiKc6+qTqBE3YF3vswKYo8kJr0lZh4WY4XL4mGZdWirDDiT5xQT9pqskWz4CdgnwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SdSURiFZ; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SdSURiFZ"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso1086761e0c.1
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375882; x=1792980682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Puhhw/KYQlkth6JZ8nHBxXQPEXoRo970byZVNnmTOX0=;
        b=SdSURiFZA8958Js7j/BDXnThZw3hNYYJkvsYpSfqnY/ccBO7urgb2sgk24WpPGpvP+
         HDgxXFchCQA852sO/ABuphnPzznTklBBCE+quYs3YqhlQwrJO5XUKnwW2niOOKexhGoi
         1i5l2+clqROId+0/DnCPw+w29YUC/9N7+m8FMMCM5JbNORfGNiNkjVLpyjvTtJtRWWa7
         RI476AswFpIW16wQkv9/G8rta3YQU/RiaQqU5UC7UoZKrzk3g7dTcZRLG6ra2Iyr6oE9
         P0nsBeCi35wsROrzU5ncS8oFVYFYOaD/77FPNyTjqs7ypHuVTwoZO4UVGv6EvwS6C9jW
         h59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375882; x=1792980682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Puhhw/KYQlkth6JZ8nHBxXQPEXoRo970byZVNnmTOX0=;
        b=B2ZUyQon+zDn1CcrsAZU30IiESgpUfG+PL8GOUcxCg6ugakoKmTsVQdG5k6SGPAHfQ
         Z9/GF5b81X1l0BRJSbDyQRBCgAqncjfoV/99eurjfx2v8HExueHOvBvRHpZMELfFueA6
         VFxQBAN3kQVMHKF3P+G413JMgvH7KYQkMTdGVr2v74BgXEjOhb1kElfEAmMcmpyFKjva
         qQfYhwY+SZrzTDXm0LmqD20XL2cHu9dRs6hHjAsih14D6VYH3A/0VYcDg3fFxdAsK3Hy
         PinYyLY0aJSvhGJWEBcLsTdDFeLQXlk9eXyBNN3focnrJ5Pgwz/kq1WTUmBH1NzPGluN
         ofpg==
X-Gm-Message-State: AFq9FYLKUFpZsLxQLfnRFrhZTDzxKAQckW70UHYGk/tSZB10S4eAyFNd
	+7iEsjSiJ6iL56RRXu2OH6zXH9pPTFc5NTinR/8RK7vUyYzsjgRgWYHiol1sSeZU/E1Xx0m1LFi
	91kDs
X-Gm-Gg: AYBFou0TFOVNHn/Zh5TTzttegLAJoV7C5/1+/0Y1cgEs0a+I4DTMeGtHlBce5DUJWss
	1BJlro7GXXJYkj/PoZ9pUC7LkGxuNtK5aE52i1QZ9B5KI5Ffi4iJbEha21g09ulDkExpZsp0tP2
	RjFLSs2LXyJPGgesH0+gohcb6IGuKszjI4ADvlDMSUT+kwm1na2TfEPHjscLwmNS4nuyL4DBMMG
	vAmAVh7f6viZW+nOsp8/eNg0rqJzFQ0d2LXUdoYLorH3hNG0hCboWAFiqysx/Qvn/kJ80xutGr6
	UcKdOENnLv5H8R6wICY276BpJsRR4gZ119OHu5bF4BQXfhKzk8UdNccavFKU6vEXSYR11Uh5C4Z
	+V2jBxyiaWE3EFxrsIGkWn0FzWnIq15/YtXjo9V+5DmiS8diGz8ZzNmVu03sT7d3EGo/bwWVcOS
	tuF1F2O7m3IFRxUOB7JiMXwP36/js+woO/2IUBST/bPjwmfFyELs2Y/4fhrm6qKQ62W8MsY6B1S
	j5dnEj3Bzz6pONOqEn+Bfkw6gRH9OIqAn77vC5Z/swbtG09BAgdB1howuU+BAcFgSXF1cLkruAm
	K6XBHE0P4KDG8JOeEnc=
X-Received: by 2002:a05:6122:d19:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5eac90dd9bfmr480991e0c.13.1792375881262;
        Sun, 18 Oct 2026 19:11:21 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:20 -0700 (PDT)
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
Subject: [PATCH v1 3/8] kho: validate preservation metadata in kho_restore_vmalloc()
Date: Sun, 18 Oct 2026 22:11:06 -0400
Message-ID: <20261019021111.990394-4-pasha.tatashin@soleen.com>
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

kho_restore_vmalloc() currently dereferences preservation before
checking for NULL, does not reject unknown KHO vmalloc flags in
kho_flags_to_vmalloc(), and does not validate preservation->first.phys,
preservation->total_pages, preservation->order, or potential size
overflow before allocating the pages array and shifting by order.

Introduce kho_vmalloc_validate() in kexec_handover_internal.h to
validate the struct kho_vmalloc header and convert its flags before
restoring the vmalloc area.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c          | 17 ++++++------
 kernel/liveupdate/kexec_handover_internal.h | 30 +++++++++++++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index f427cdd9a969..a9c52d998855 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1384,28 +1384,27 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
  */
 void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
 {
-	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
 	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_PROT_NORMAL;
-	unsigned int align, order, shift, vm_flags;
-	unsigned long total_pages, contig_pages;
+	unsigned long total_pages, contig_pages, align, idx = 0;
+	unsigned int order, shift, vm_flags;
+	struct kho_vmalloc_chunk *chunk;
 	unsigned long addr, size;
 	struct vm_struct *area;
 	struct page **pages;
-	unsigned int idx = 0;
 	int err;
 
-	vm_flags = kho_flags_to_vmalloc(preservation->flags);
-	if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
+	if (!kho_vmalloc_validate(preservation, &vm_flags))
 		return NULL;
 
+	chunk = KHOSER_LOAD_PTR(preservation->first);
 	total_pages = preservation->total_pages;
 	pages = kvmalloc_objs(*pages, total_pages);
 	if (!pages)
 		return NULL;
 	order = preservation->order;
-	contig_pages = (1 << order);
+	contig_pages = 1UL << order;
 	shift = PAGE_SHIFT + order;
-	align = 1 << shift;
+	align = 1UL << shift;
 
 	while (chunk) {
 		struct page *page;
@@ -1420,7 +1419,7 @@ void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
 			if (!page)
 				goto err_free_pages_array;
 
-			for (int j = 0; j < contig_pages; j++)
+			for (unsigned long j = 0; j < contig_pages; j++)
 				pages[idx++] = page + j;
 
 			phys += contig_pages * PAGE_SIZE;
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index 094b4917a0f1..878e21bd8b00 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -7,6 +7,7 @@
 #include <linux/libfdt.h>
 #include <linux/list.h>
 #include <linux/mm.h>
+#include <linux/overflow.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -23,6 +24,9 @@ static inline unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
 {
 	unsigned int vm_flags = 0;
 
+	if (kho_flags & ~(KHO_VMALLOC_ALLOC | KHO_VMALLOC_HUGE_VMAP))
+		return ~KHO_VMALLOC_SUPPORTED_FLAGS;
+
 	if (kho_flags & KHO_VMALLOC_ALLOC)
 		vm_flags |= VM_ALLOC;
 	if (kho_flags & KHO_VMALLOC_HUGE_VMAP)
@@ -31,6 +35,32 @@ static inline unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
 	return vm_flags;
 }
 
+static inline bool kho_vmalloc_validate(const struct kho_vmalloc *preservation,
+					unsigned int *vm_flags)
+{
+	size_t alloc_size;
+
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
+	if (check_mul_overflow((size_t)preservation->total_pages, PAGE_SIZE,
+			       &alloc_size))
+		return false;
+
+	*vm_flags = kho_flags_to_vmalloc(preservation->flags);
+	if (*vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
+		return false;
+
+	return true;
+}
+
 /**
  * kho_encode_radix_key - Encodes a physical address and order into a radix key.
  * @phys: The physical address of the page.
-- 
2.56.0.176.g3575e65682-goog

