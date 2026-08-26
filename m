Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E3E3BF68F
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735908; cv=none; b=r6PspoDvMQUWI6YFUrGKlvFNuBqaBS63HxXi4xrGFFZsr2GV/kfcUQWwLz7xV1W+T2SVw+/zvan0yIJII3FmtfYeInz2reocTQB74EYj/8mJEzCQArI5uDQ8iiy7dxFzNzgilLZ5pVopVFQSO/vps48wSP0+4IiK+AwpyJWfwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735908; c=relaxed/simple;
	bh=afVcG9MutWV1770JWxX+PFvgEoXu+GeAzkEgFIqy00s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uf9yaLV69eHBO05VYnVlbMe+O0kaUqSWxBkLNsjTKFWHoPKDE7DAorJdE80QIiTypOvRvRiue1G/a2WxNAOHSW/5ObosuOP8JoXNRtPwPSKSY4UDb52cc2peK3tts8dU6/D7YsNTqhqlHNPBkHUxI+2TD98Kg71DcuUUfEyg/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GTTJ//6s; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GTTJ//6s"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so11963485ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735903; x=1788340703; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSXq5ekbbkjocQyA2ly+0l1pZ1/sTajHAbm8h8os0E4=;
        b=GTTJ//6sO9JDL5FHfhG2NwSbUwC3Cd7wHY9sJsu907T9UNg3WePEGPalCNUJCmo4B9
         oiFbWg+anBwMz4zYBy3hhHgJYDDPhSrR8wny/uYLrI1yLnpZA8MuawdCuENVewKDWpjX
         TaZ+04m1y93NI5HMOjM3vTzRvKvbb+VqAi5+LPzrbhkaPZA82dqVcbf36mA63+nBHir4
         uMr8qpZDKShlUGhrKORwRqo+5TpDTRH2zmdF4bUbprEnhtj3xkiZGliyn2a9e8P/2HC0
         fWf1cwgy04JRAUzUCGsamrW4IdJqt5MbGW8TAlhIcy9BYLc4KlVBf5WHzvOFqWfpzU/2
         gdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735903; x=1788340703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSXq5ekbbkjocQyA2ly+0l1pZ1/sTajHAbm8h8os0E4=;
        b=J318UZLLaRFDMzu3dfJmUVlWzEcgoUFT59/RyJatM64YFSjDOzH6Eq3Zg2GxfXfDgc
         CCFnJdllGvCeZ4UtdgEa3CN9fmOQJlvSiVoQxeocv7Pka3or+LySqO2qRM0xWzexymmk
         dFZ0SENyjQQZckJj7TAkMWhD762wev1l+2YFZ+QHAGvWs5S50um4h1u9DRfLS5QZ1Tds
         qVzKldfizHYJ/ZI6fulwRwK5753rg7MjQLv+ZfJCiO6avnqmgE06AAG11FEcf96jGLws
         r807lTYorx1+U+Sr1737+QDCGWV50eTnqm9B8e0vX8sRpPYqSKNXtS+aZ/p046d2QMcT
         Vq4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro+/EEpmnlkAi7IhkdzIuKCieojxj3xrzxbk0cBmFobX4Fb5X9EWZAHeohPNAkVaElVl8yMinXBC8ghCgw3ceM=@vger.kernel.org
X-Gm-Message-State: AFuF++n9u0nXda1BLqNF1KawWSeiDjpreg9+KPrNbfrmXCxRArDXWgE8
	3HHO9KPSJQa5lje9bdOWlqJYLd0ZH6aaN35bpowjGPQI6RjS4dfiBOe9cxklTf5BS0e0IxB9gE7
	Fnl4Frzx0+/B7Vdo5u3IO3hXT/A==
X-Received: from plef20.prod.google.com ([2002:a17:902:f394:b0:2cc:79e2:e717])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:950:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d707c07e9cmr94715185ad.13.1787735902734;
 Wed, 26 Aug 2026 02:18:22 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:07 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=4464;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=1e6H60cQHVz8Bv0xghWxdB5aRwHV1nZY+mB88+mm2c8=; b=QZPrMa3y1le9FkvjJp/5dcixvnPW1Cxrktr1jR2BDdUqrbGMBmSkGWfgX2OA62TxPhPTRY20/
 nmfCwWRxRRGBHS3hWtg+rcWOgYmgbTgMgedq1wXxcS572my0zLrZjAF
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-9-0a15d8a799aa@google.com>
Subject: [PATCH v11 09/46] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Stub in global variable to enable in-place guest_memfd private<=>shared
memory conversion, which will eventually be exposed to userspace via a
module param, and wire up the __kvm_is_private_gfn() static call to the
guest_memfd version when in-place conversion is enabled, i.e. when gmem is
the sole authority on private vs. shared memory.

Cc: Fuad Tabba <tabba@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/kvm_host.h |  6 ++++++
 virt/kvm/guest_memfd.c   | 26 ++++++++++++++++++++++++++
 virt/kvm/kvm_main.c      | 12 +++++++++++-
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3579feb631775..b0110143d2ff8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2580,6 +2580,8 @@ static inline bool kvm_vm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
 #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
 
 #ifdef kvm_arch_has_private_mem
+extern bool gmem_in_place_conversion;
+
 typedef bool (kvm_is_private_gfn_t)(struct kvm *kvm, gfn_t gfn);
 DECLARE_STATIC_CALL(__kvm_is_private_gfn, kvm_is_private_gfn_t);
 
@@ -2588,6 +2590,8 @@ static inline bool kvm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
 	return static_call(__kvm_is_private_gfn)(kvm, gfn);
 }
 #else
+#define gmem_in_place_conversion false
+
 static inline bool kvm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
 {
 	return false;
@@ -2595,6 +2599,8 @@ static inline bool kvm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
 #endif /* kvm_arch_has_private_mem */
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
+bool kvm_gmem_is_private_gfn(struct kvm *kvm, gfn_t gfn);
+
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
 #else
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b9fee68c90311..5399ae4aae0e7 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -478,6 +478,32 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
+bool kvm_gmem_is_private_gfn(struct kvm *kvm, gfn_t gfn)
+{
+	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
+	struct inode *inode;
+
+	if (!slot)
+		return 0;
+
+	CLASS(gmem_get_file, file)(slot);
+	if (!file)
+		return 0;
+
+	inode = file_inode(file);
+
+	/*
+	 * Rely on the maple tree's internal RCU lock to ensure a stable result.
+	 * This result can become stale as soon as the lock is dropped, so the
+	 * caller _must_ protect consumption of private vs. shared either by
+	 * holding guest_memfd's invalidate lock for the entire duration, or by
+	 * checking mmu_invalidate_retry_gfn() under mmu_lock to serialize
+	 * against concurrent attribute updates.
+	 */
+	return kvm_gmem_is_private_mem(inode, kvm_gmem_get_index(slot, gfn));
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_is_private_gfn);
+
 static struct file_operations kvm_gmem_fops = {
 	.mmap		= kvm_gmem_mmap,
 	.open		= generic_file_open,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 78278730b2ae4..46d2e123448c2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -102,6 +102,10 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(halt_poll_ns_shrink);
 static bool __ro_after_init allow_unsafe_mappings;
 module_param(allow_unsafe_mappings, bool, 0444);
 
+#ifdef kvm_arch_has_private_mem
+bool __ro_after_init gmem_in_place_conversion = false;
+#endif
+
 /*
  * Ordering of locks:
  *
@@ -2423,6 +2427,9 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 static u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
 {
 #ifdef kvm_arch_has_private_mem
+	if (gmem_in_place_conversion)
+		return 0;
+
 	if (!kvm || kvm_arch_has_private_mem(kvm))
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
 #endif
@@ -2634,8 +2641,11 @@ EXPORT_STATIC_CALL_GPL(__kvm_is_private_gfn);
 
 static void kvm_init_memory_attributes(void)
 {
+	if (gmem_in_place_conversion)
+		static_call_update(__kvm_is_private_gfn, kvm_gmem_is_private_gfn);
 #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
-	static_call_update(__kvm_is_private_gfn, kvm_vm_is_private_gfn);
+	else
+		static_call_update(__kvm_is_private_gfn, kvm_vm_is_private_gfn);
 #endif
 }
 #else

-- 
2.55.0.887.g758fc8c411-goog

