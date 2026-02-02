Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A638E13B
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071441; cv=none; b=fLO8OKoLFUN0hWQFd8qMA/LyPsyvdOXvlePFKgUxzaWIOJlGbySZBQSEGXdDOJRMISaaiD888c9tqqf6z2iGG0g80znhnIqxs2jvnwPbJUcn+DdTv1FBAymMaJ/IU8kOv8d8q4+hEvxKx13NN2iZWrTGwJj9XQdGMbik7Etlw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071441; c=relaxed/simple;
	bh=tFfY7VxjWkSUd6Jmad8JfAmMwCp6JndcHwBrKSgr1rY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oaxdyZYR/FIMosgmTdjua+2oRbhdi+LgMKDyIFigiN3tBSyuiBvQIm48/9LSSHVpLb3nvoQfZQwyfgZA1nMtzCaN+P+xS1LVEBZKx4gKQST+IrdEnt/rTo8J14S5JcE4wu07LCf0SN3T1aFmT8+enr3NuLtouZbDf4vvLuyBC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X6nFw107; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X6nFw107"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-352c7f19acaso3934145a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071439; x=1770676239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BE4daa5nHLf/W7WnPK3owx5g9H3yB7xbYigFlzRc16s=;
        b=X6nFw107mmQm5pGvWJBeTHCDEjgdXtIO2vG4oQHxzHYiUuNlF/Ur10dCIq7FtbA486
         IxDAx6IgxoNNCGXw2pm3AjvR3VM2U7iLJLNEreIK6umQoSCwrVoX8w/2kC3dV/Rsx4oI
         lsUKmhBBGJm4jDjtRmo99/hDvwOyXZeQ923G/iCRS/ts3Aaxg4GSLsCYfdM0YHoG3NTW
         e66yuu+v1GaPjzUgz+7jdVTgxD3Sc8EkJRyWIPOMkVEBAKPtdNWBrcerQ09QlkyG7ywl
         QdtcwbZJABlkfn6Fr5lUGiDQDH2a42hr7jtHMkthN9zEeMYFL6azCARlKPGUPsG8hXX/
         IEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071439; x=1770676239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BE4daa5nHLf/W7WnPK3owx5g9H3yB7xbYigFlzRc16s=;
        b=HQtxNwGMp6vIvh8X8cqAmt4k1Cb4ZZXvR18YkL9aHPpVIQmuQyVkvFZGXZwQLDI2GU
         jHzr6NbXbxZ9CJWOys27mHLF00xXRYK1jOfxN5XBIVO/occ3ksif2AQrXg9K1v5n5jPG
         O/CVTV8+xG+BKwtP0ODTBAREirgbN+dsRRVSQ4QeYas8WYfw6KDPrG/FNfAzn0Dbh6Li
         1eRZq9nO2IC9P/VtonTNbGwsUs2t+oqzOKuLgPA+5RIDkKzNZMTR1QeMmT/0mIzCbkg1
         /EkV/zXfNrr3thQVa2DGBZ77XcbUumc3+GJL8BKB4IyLABQZzx6MD/IQ22vpNATOrl/A
         x8Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Xta1a8JegYYsZr1eBOCWhK64DLxr38YAZHbuBwUZTCQ4vQHeSZ0hBXOlHjdG3nZKEOkTnl73c6ZtpHimkok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRhiQNtNbWnFpojvljaqTji8ZP1wUbI8GyRirKBUSSWT86G3gq
	fYDMBIQgK8BH3xI3LEzlYxB5COgaWZF4CRn2Nu1qRbYVX9CXeGJ29keTE9owxWH21+dKI1mbH/6
	d53GYNp9uHlPGSRO64v7Xjfzjag==
X-Received: from pjqi3.prod.google.com ([2002:a17:90a:a903:b0:354:3742:4ba7])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e41:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-3543b34fcbcmr12798795a91.15.1770071439110;
 Mon, 02 Feb 2026 14:30:39 -0800 (PST)
Date: Mon,  2 Feb 2026 14:29:48 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <3bf1fe4959858adfc2bd9138a2b850e9c837ab9c.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 10/37] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

When checking if a guest_memfd folio is safe for conversion, its refcount
is examined. A folio may be present in a per-CPU lru_add fbatch, which
temporarily increases its refcount. This can lead to a false positive,
incorrectly indicating that the folio is in use and preventing the
conversion, even if it is otherwise safe. The conversion process might not
be on the same CPU that holds the folio in its fbatch, making a simple
per-CPU check insufficient.

To address this, drain all CPUs' lru_add fbatches if an unexpectedly high
refcount is encountered during the safety check. This is performed at most
once per conversion request.

guest_memfd folios are unevictable, so they can only reside in the lru_add
fbatch. If the folio's refcount is still unsafe after draining, then the
conversion is truly deemed unsafe.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 virt/kvm/guest_memfd.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 1cd8024cdb39..a9d12abfacb5 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -8,6 +8,7 @@
 #include <linux/mempolicy.h>
 #include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
+#include <linux/swap.h>
 
 #include "kvm_mm.h"
 
@@ -571,25 +572,34 @@ unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_gmem_get_memory_attributes);
 
-static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
-					    size_t nr_pages, pgoff_t *err_index)
+static bool kvm_gmem_is_safe_for_conversion(struct inode *inode,
+					    pgoff_t start, size_t nr_pages,
+					    pgoff_t *err_index)
 {
 	struct address_space *mapping = inode->i_mapping;
 	const int filemap_get_folios_refcount = 1;
 	pgoff_t last = start + nr_pages - 1;
 	struct folio_batch fbatch;
+	bool lru_drained = false;
 	bool safe = true;
 	int i;
 
 	folio_batch_init(&fbatch);
 	while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
 
-		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
+		for (i = 0; i < folio_batch_count(&fbatch);) {
 			struct folio *folio = fbatch.folios[i];
 
-			if (folio_ref_count(folio) !=
-			    folio_nr_pages(folio) + filemap_get_folios_refcount) {
-				safe = false;
+			safe = (folio_ref_count(folio) ==
+				folio_nr_pages(folio) +
+				filemap_get_folios_refcount);
+
+			if (safe) {
+				++i;
+			} else if (!lru_drained) {
+				lru_add_drain_all();
+				lru_drained = true;
+			} else {
 				*err_index = folio->index;
 				break;
 			}
-- 
2.53.0.rc1.225.gd81095ad13-goog

