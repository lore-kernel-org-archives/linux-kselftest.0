Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA73C553F
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568228; cv=none; b=hLq67LrL/ZWp+bCPOIFBTySjbIdJWSa3Z9kZye0NnkcQVAFFSpMK9K3hMBsJhd//Tk7UI4zJIHYAHPi58s9flBH85N2eJ7YqcVp6d+8DvFGp20eFzySz47ZhUQPrF1bXFKvuNZkWF/A71Ed37pFrfGki09boHS7ZwV52nFw84fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568228; c=relaxed/simple;
	bh=OAGK8d2apSftt05QmnnszQRJgC1kXAx/T7wydwlu+UE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qmjdV+1QXVJRvYpY8Lhgu2COgQdSsIa8iPQbmIcgu5s4WDJubozYfh81nnbkABnplV500mAG/QI/j46RmAG1nrQTzJCynx87qfpn7XLJRGRgWqgBsDA5eJteG6S+vtrkRNA0cIcRDrOs0duduB8+NIf/xDbiwNDs4cljjxwC6Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ha5zpS1y; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ha5zpS1y"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82c6dd66f6dso2683914b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774568226; x=1775173026; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNb2uR0lRZazBe4OJVZFjtnQRAuzu3Ihzf0aacyDPTQ=;
        b=ha5zpS1yHh2vIpo8F0w4K/+cQCQENDDLWL4kR8AsbM/2KYRs8eVuScadjbZEoLeJmY
         dfJRScZXdlgnCMiXq6amZZfh2T1P5YRAtj4ki+EL6ddK1CArdKq9kFTzg6T13WPk3Fim
         VxCUAean5ca6vunMXM2Yi648Pgj/k2upiyq8Acx2otf3uIoq2Yo6/W+0InUufMQkaByC
         PYrPVukdjpKm7ucFakLU0NVTPop9yjuZnrUU3S7xcpQWoOdHJp4OB16KdIEua57WIu56
         Y9I03bXvdkhOkhaYfRSJvaExva2zaIhrxD/v/alnVnkz+miG/GQwR2IqJe05Rv5Xxpy5
         bLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774568226; x=1775173026;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNb2uR0lRZazBe4OJVZFjtnQRAuzu3Ihzf0aacyDPTQ=;
        b=q1XtIzS62ac998mJfM4t2GIjB1VPCBS3smf4sb/x1FDz6KyxbcPo/YtkGFMHRHRFq7
         CBeA6zgnd9cuexQk7fuCwpzv+GPantia/+cN/kgQ+sCwCi+MGZkW21K8gyg0yC2ve6Fr
         E2f2rkAUoL3sA2F37mN5+rAQ5HjcF663TPqrLMZXGr1rqKXGIFndehNjkzqOV+XtXBB0
         yqgG5L/fc3j6xLPrDEfDeJ0wTz/9ChHcTTbnYwLd8Q3WrwLFKcoNUMJII5MA9DTfbfn1
         IkFlesaRWlUsPA9UixLiN+Rx75OItrrvbx2O9TLbIUlEm6eWP0BcF/Dlb3jZ2j8rd2tb
         DVQw==
X-Forwarded-Encrypted: i=1; AJvYcCUhTlELwXx/KiVMMd7xpXSoYmm2FTv+3nRKkYSvgKQzet3NZX1X+ECy9SJQRg0A2M0z+WgF/TNUDZ+Ek0apU7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbroAbXjxlZn881mDeE97nK10+F5m6RKNvX3ZDT2a9ccrR03n
	aGYBvChNY9E4qC4yMj5O4Ioy0z4Kvn80Sec5cafP+UppdUVH3ME91VcOsErgD+bfJQ1iEvPuweH
	fGwX1PUsTtQBMwUS1EZbFymporA==
X-Received: from pfbmy7-n2.prod.google.com ([2002:a05:6a00:6d47:20b0:822:4e8c:2c9e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:430c:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82c95d32c02mr282953b3a.23.1774568225809;
 Thu, 26 Mar 2026 16:37:05 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:36:42 -0700
In-Reply-To: <cover.1774568083.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com> <cover.1774568083.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <a52f7c79f45b3e411fe221793d7cba6f4540766f.1774568083.git.ackerleytng@google.com>
Subject: [POC PATCH 4/6] KVM: selftests: Allow specifying CoCo-privateness
 while mapping a page
From: Ackerley Tng <ackerleytng@google.com>
To: ackerleytng@google.com
Cc: aik@amd.com, akpm@linux-foundation.org, andrew.jones@linux.dev, 
	aneesh.kumar@kernel.org, axelrasmussen@google.com, baohua@kernel.org, 
	bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, chrisl@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, forkloop@google.com, 
	hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, jmattson@google.com, 
	jroedel@suse.de, jthoughton@google.com, kasong@tencent.com, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, rostedt@goodmis.org, 
	seanjc@google.com, shikemeng@huaweicloud.com, shivankg@amd.com, 
	shuah@kernel.org, skhan@linuxfoundation.org, steven.price@arm.com, 
	suzuki.poulose@arm.com, tabba@google.com, tglx@kernel.org, 
	vannapurve@google.com, vbabka@kernel.org, weixugc@google.com, 
	willy@infradead.org, wyihan@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h |  2 ++
 tools/testing/selftests/kvm/lib/x86/processor.c     | 13 ++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 469a221221575..64870968ee47a 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1499,6 +1499,8 @@ enum pg_level {
 void tdp_mmu_init(struct kvm_vm *vm, int pgtable_levels,
 		  struct pte_masks *pte_masks);
 
+void ___virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
+		    uint64_t paddr, int level, bool private);
 void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 		   uint64_t paddr,  int level);
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 23a44941e2837..fcdc4ae40b167 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -254,8 +254,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 	return pte;
 }
 
-void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
-		   uint64_t paddr, int level)
+void ___virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
+		    uint64_t paddr, int level, bool private)
 {
 	const uint64_t pg_size = PG_LEVEL_SIZE(level);
 	uint64_t *pte = &mmu->pgd;
@@ -307,12 +307,19 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 	 * Neither SEV nor TDX supports shared page tables, so only the final
 	 * leaf PTE needs manually set the C/S-bit.
 	 */
-	if (vm_is_gpa_protected(vm, paddr))
+	if (private)
 		*pte |= PTE_C_BIT_MASK(mmu);
 	else
 		*pte |= PTE_S_BIT_MASK(mmu);
 }
 
+void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
+		   uint64_t paddr, int level)
+{
+	___virt_pg_map(vm, mmu, vaddr, paddr, level,
+		       vm_is_gpa_protected(vm, paddr));
+}
+
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
 {
 	__virt_pg_map(vm, &vm->mmu, vaddr, paddr, PG_LEVEL_4K);
-- 
2.53.0.1018.g2bb0e51243-goog

