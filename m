Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377152;
	b=pwLs9wPrTO8lFNWIJ0xKVQYl32TXBD6E8h6hMtDQ9vHddiU2UTmb2Ge/4p4ECXyurE0t
	 mHky71tcmIQzHnBs19r7/Vu4z+sbaymBXIs5J0JXS0OxfXubC3btgN+NXCuB0ijHDlJNY
	 JtQf7TrdCShlfMk3USW7p0UJIOKqh/I68FHvHO6kyIQURNSEdQulDXI0CKTVF466l9IC+
	 8MnDQGBi+rE1vP7pLEDzPLW4/sHDr3M50ztdNAtKqHiXVr38UOSC4LRcZro+o1mWbk0wZ
	 C+ARDlTNn7bHdR/yqvjyV98zSHafNCJbhxyAiIb99tMUJQsCFwlwoGLcFr9YwRf++Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377152;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Xinb0q2RhrG3aZtWkosSNECDDlqXXXklCJemB2uKTO0=;
	b=GcfPyVqW1ZLM4XBkOqp9eWbm3VY4kMxooNjkdjT4pjDGJKzc91u2R9NAa5izPnfiXsqo
	 odedlYIplPAS0F5OWfIF8A26c3NdTMx6R52uuC6FQ+vX0uREj4cZm+FMJQ9E+OUKfG1Ay
	 BvUu+UVjikC3CvbdeJIwcLs8Ss9X1upukr0zz8D5/+m3mrVZja735y/CeHanSoulG0GKt
	 YPALxebTzBn39M/cnDX2wXWNIz9nKwUM5h+KxuLiyyKawTwYzcwrX7MYzUJY5nqs+Hnu9
	 9jdcoFighsN85fZPz4r49uv8RetNMVJdFNLrw2QhkIod3EG6L37Gxt5fVbcNYuZqTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g3hUDDNg;
	arc=none smtp.remote-ip=209.85.210.99
Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5C606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g3hUDDNg
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-85d363fb73cso1578656a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377151; x=1794981951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xinb0q2RhrG3aZtWkosSNECDDlqXXXklCJemB2uKTO0=;
        b=RnhsbMNhaA8mn0IXqRby/VdnqcOSLkMDiKkjs6HOgjsXii1mGQNOsxpqL+vpu5F/nn
         73rzHRI+8Ey+js1K3OODf/8mzx2sgocA+l4gX83b91cleNhi6jGyzcp8g5s7NGM+gchp
         uh/l1TZAcQeyacv8W10oGtQAWA6A11HWBwkidSLft1x6rENw0j6z1e4v8t2G7HywP1MO
         +NcZaepHNWx5873VBSLrKGuAhHKWd+FdlBPkbnkvTbXAvrKzsHb83uU4xfEimD0vXWd0
         Sr9hU+S0HC8iq5EVXk3dGiOKokFlzv5Cssgq9/JKRYIgPDAOtMq3hbm0jBEC3dQ+AHqa
         dLRw==
X-Forwarded-Encrypted: i=1; AL+hErHhRuf0bi/gccRX8gL4K2xZm8rqrdNLCgb/Ih+DQrED/XVzlCsNzLIVoza5J+TH8dj/xgR84KYdd9rnra6ckzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tdzpy/lFDxt65cD9gdKrdlQVZWjeHSTA1kiHqkk4EHY/MHoA4
	mF9zSdhu0aMksyjuAK7mmtHiMnclQ471+ZpMla4Aajm5+vt9JcaMQF+hm2lITNipt/JoIrSaqK1
	aeRYiDq8pngll5I2oD93MXabF7FE38bl+hdsgt2hiJGVvjVgAkv5E0tSknVLX8DP9uUbaalJaZv
	tzqk/pTtrYJyoy4UNwf3w/p9oYuO7vW6GpNRpg9isxjFD1bNXkvxBk+wd4Zn5ulKeMAYAs+alhD
	03uE9kjU1EqAibBBo+U
X-Gm-Gg: AYBFou0l/4Ynz9xqiJOUgQH/zIsx1O4MVkax747uPRh+QBDk+li6KvoSMoZea6lFzfp
	dHP+6YCwZ0G9rNIhShkJ0vt57XlCFisk8IBF1LbBYTGFq9KHZdbVZEz/eIqbgHtJMjx+CccyGkM
	SXLOjzXT0WsZIJt88Lm8Q9KjOwh/AJbKnsGcpz/YwMzXGWy/3pxr6BLQA9kWguDFtkO6Wp4Z2tE
	0uG63fF/Ym2I/cNfV5JLRHcwQaBPiEPRL4HSy7TTs0yT7VoIAjSU1hqQ58u0eVxRvBPO1OGRJD3
	mIZBZVtrFPPkLUw11oJodtrKBtR4dLPI8fu8h9A0haiuUb4hKlYBMkErOLw8K0/tJNDt/l5qMk4
	7GjHPyikMWUec001ibW94uis+/hPDPyczRR3nN33AZNgxPRtWCk6Gm6uiibMZk67vfIYX3nxzrV
	gowpG0IkJkS9nz4QAWkbSkr8FoVxaH4Aop
X-Received: by 2002:a05:6820:6784:b0:70e:1dd8:6695 with SMTP id 006d021491bc7-71917837987mr747130eaf.37.1794377150924;
        Tue, 10 Nov 2026 22:05:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-718a3bd5cb2sm39311eaf.0.2026.11.10.22.05.49
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:05:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso3399303b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377149; x=1794981949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xinb0q2RhrG3aZtWkosSNECDDlqXXXklCJemB2uKTO0=;
        b=g3hUDDNgz2NeT9/QW8ABxjn2VqquUzlG+/VR8Hfb2d3BHAkvR/X/JCaqoXz+FY0rU7
         KB+/woDPIve1kccRhxOAOwsNktNstx/nefQETFo3mceoy5Q1gmjQPbkufg567r9Hji4f
         kFFgBW1T/Cm2Cq2Qx+uwVX69An7NSLmToHcOA=
X-Forwarded-Encrypted: i=1; AL+hErGKB2OZJjmiagroRJHsNYtz94f9TPT69RUkYFkyZK12KFqqwlI6oIida338dk89EGMDm7E9f3aL5OeVoG5QRYQ=@vger.kernel.org
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr202727885a.59.1794376836551;
        Tue, 10 Nov 2026 22:00:36 -0800 (PST)
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr202720285a.59.1794376836004;
        Tue, 10 Nov 2026 22:00:36 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:30 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 08/12] KVM: selftests: Add helpers to run x86 guest code in user mode
Date: Wed, 11 Nov 2026 00:59:57 -0500
Message-ID: <e2a6f09d80b30aa2ab14f013f5b344156a7f89cb.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add vm_init_user_mode() and vcpu_enter_user_mode().  The former installs
flat 64-bit user code and data segments, makes the guest memory mapped
so far accessible to user mode, and gives the TSS a kernel stack and no
I/O permission bitmap; the latter switches a vCPU to CPL3.

The selftest infrastructure only sets up CPL0, but testing the VMware
backdoor requires guest code at CPL3, where the I/O permission checks
and CR4.PCE apply.  Provide the setup once instead of open coding it in
each test.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 .../selftests/kvm/include/x86/processor.h     |  7 ++
 .../testing/selftests/kvm/lib/x86/processor.c | 87 +++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 3e4351ccb359..f7fd4aafccae 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1310,6 +1310,13 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 
 gva_t vm_alloc_stack(struct kvm_vm *vm, int nr_pages);
 
+/* Flat 64-bit code and data segments for user mode, see vm_init_user_mode(). */
+#define USER_CS_SELECTOR	0x28
+#define USER_DS_SELECTOR	0x30
+
+void vm_init_user_mode(struct kvm_vm *vm);
+void vcpu_enter_user_mode(struct kvm_vcpu *vcpu);
+
 /*
  * Exception fixup morphs #DE to an arbitrary magic vector so that '0' can be
  * used to signal "no expcetion".
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ee8a1715d844..6099d386abe9 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -768,6 +768,93 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 	handlers[vector] = (gva_t)handler;
 }
 
+struct tss64 {
+	u32 reserved0;
+	u64 rsp0;
+	u64 rsp1;
+	u64 rsp2;
+	u64 reserved1;
+	u64 ist[7];
+	u64 reserved2;
+	u16 reserved3;
+	u16 iomap_base;
+} __packed;
+
+static void kvm_seg_set_user_code_64bit(struct kvm_segment *segp)
+{
+	kvm_seg_set_kernel_code_64bit(segp);
+	segp->selector = USER_CS_SELECTOR | 3;
+	segp->dpl = 3;
+}
+
+static void kvm_seg_set_user_data_64bit(struct kvm_segment *segp)
+{
+	kvm_seg_set_kernel_data_64bit(segp);
+	segp->selector = USER_DS_SELECTOR | 3;
+	segp->dpl = 3;
+}
+
+static void virt_set_user_pte(struct kvm_vm *vm, gva_t gva)
+{
+	struct kvm_mmu *mmu = &vm->mmu;
+	u64 *pte = &mmu->pgd;
+	int level;
+
+	for (level = mmu->pgtable_levels; level >= PG_LEVEL_4K; level--) {
+		pte = virt_get_pte(vm, mmu, pte, gva, level);
+		TEST_ASSERT(is_present_pte(mmu, pte),
+			    "PTE not PRESENT at level %d for gva: 0x%lx",
+			    level, gva);
+		*pte |= PTE_USER_MASK(mmu);
+		if (is_huge_pte(mmu, pte))
+			break;
+	}
+}
+
+/*
+ * Prepare @vm for running guest code at CPL3: install flat user-mode code and
+ * data segments, make all memory that is currently mapped accessible to user
+ * mode, and give the TSS a kernel stack so that exceptions from user mode can
+ * be delivered.  The TSS has no I/O permission bitmap, i.e. user mode can't
+ * access I/O ports unless IOPL allows it.  Call this after allocating all
+ * memory, vCPUs included, that user mode needs.  All vCPUs share the kernel
+ * stack.
+ */
+void vm_init_user_mode(struct kvm_vm *vm)
+{
+	struct tss64 *tss = addr_gva2hva(vm, vm->arch.tss);
+	sparsebit_idx_t begin, end, page;
+	struct kvm_segment seg;
+
+	kvm_seg_set_user_code_64bit(&seg);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
+	kvm_seg_set_user_data_64bit(&seg);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
+
+	tss->rsp0 = vm_alloc_stack(vm, 1);
+	tss->iomap_base = sizeof(*tss);
+
+	sparsebit_for_each_set_range(vm->vpages_mapped, begin, end) {
+		for (page = begin; page <= end; page++)
+			virt_set_user_pte(vm, page << vm->page_shift);
+	}
+}
+
+/* Run @vcpu at CPL3 using the segments installed by vm_init_user_mode(). */
+void vcpu_enter_user_mode(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sregs sregs;
+
+	vcpu_sregs_get(vcpu, &sregs);
+	kvm_seg_set_user_code_64bit(&sregs.cs);
+	kvm_seg_set_user_data_64bit(&sregs.ds);
+	sregs.es = sregs.ds;
+	sregs.fs = sregs.ds;
+	sregs.gs = sregs.ds;
+	sregs.ss = sregs.ds;
+	vcpu_sregs_set(vcpu, &sregs);
+}
+
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
-- 
2.53.0

