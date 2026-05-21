Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7814636729D
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405455; cv=none; b=OaoGXyXQKu/XCCaPTqT8+baub1z4yV5+40+l5bXKeU3D/1ij+srCJglSnABsFAuolMXZNL4ea2ojaZxCbQKJXCzP0+Wb1w3FagbZqNYwZiclbSrLzUoC89xHvkfJlljx/xEBZeRnZ5dvQ3GObovR2HlIt5RXXR3eIfqjM2QcjY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405455; c=relaxed/simple;
	bh=Twi6LbeJb/qWz0kw5rs4LmRND6hdRFCsRXfOjFCgReU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WUXZStEglKJQljZAYTXT+Lq6Wy7cABJLZJZ5nhk0BEKw1iEwV8BtUAj3GW6Fxp+AekZR23DdPsAJfOXHNIM9OEtWpeAFiorQVl7k0v7lUyWxDPFn68ShwHj9cx+vMg0lWoN0S/tdd7cuT81m6DVTbnBXhgN0VOKjHTJiveIeTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/vOMnoG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/vOMnoG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso13573553a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405451; x=1780010251; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=inUMdvUCNu2M2y+Grbjs2dQB2rkNDqtn35hXxq+mv+8=;
        b=v/vOMnoGKrW3OxjCaKp107IRkAfhta7i8KVbPusETRl4ei7R/KWOY8uPzdzRLQhQis
         YLe7g0COw3tG//35D7LJsbIfl2qxUAhyVETRLI68PPT0zfe4OKQQ8RvjBrm3f7uTvnZl
         CKx8lJDi/gv/GbL42lUL9BMQTbY2yOBc/KNmS2pY6GsLVK8P/FhJzviSu0yepjVbui0o
         hDv7BjfYlluHwBfrMG3C5TZKZtjtqRbTWgK5jrwR6iTSC6tQysoyAxJZXL4xYFYdUnPs
         U+DHsPvUeLasBriSIXXz4GA327vpBfWzmzNmrmkDRQ1OkFvcvPfcwTwRVg0jtOCoJxCJ
         rE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405451; x=1780010251;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inUMdvUCNu2M2y+Grbjs2dQB2rkNDqtn35hXxq+mv+8=;
        b=m1IlFcKAmCc4EdcMz3/2kbLTEkqX1HaXcj7YDDkX91D08rsKVQJoJjYiPOWntiLeh3
         eGlJKhrnHZmh56a+D2eTK5tmZzY1yLmeR83fefDV9rhxwgRRvsmlnJVnzmttaIVL2Wfh
         3HAAXeNaZnFou3lqr7rBWqtn6gYQ6yD7CJdqcIWoiyi33Ewn8H+MWXfYsR9OFHh6SFGK
         GfvyxADMLK9nde6mxygvH1NQ2tvMdq5fpuPMtjwrzCIxkgXb4JKKrCClk741nqed1+sp
         uSvyyLlFnzlW/1eefrD6bEGosSqXUzBvYEXnXwBHcTvshwx8TM7mDTu1hl8iPflrDCIG
         RoRA==
X-Forwarded-Encrypted: i=1; AFNElJ8fSbbfEHon1lDb0/fAVKXTWa84z5K26suPJpvUc8PS2dEzFveBMwAhPVaDcIVv+eK3tMCVrPX8trquDFK+yW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Un8RN0t5A+tOxcSewHza43oRfoTx+Xr4xMPIiRkcwND/9FVC
	iquyAXBGnX1LmexXeYtjWLHQGSGnKx7wnXZXHeCgfYI6eeMhfpCL96H5c7KhrqkbTNN5cZHrQ7o
	P9I2Uqg==
X-Received: from pjbbk4.prod.google.com ([2002:a17:90b:804:b0:369:1a1a:82d5])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5284:b0:35f:b7f5:9b3
 with SMTP id 98e67ed59e1d1-36a67420e95mr1028347a91.3.1779405450507; Thu, 21
 May 2026 16:17:30 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:50 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=3213;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=YzcxNqD8InBoCzxGDzSUndemb08iklf9U0GqXNz3VQU=; b=20surOhD4fpUaOe9xSIctRm4Vjy3SYL4qB3WReCuRwhQNngpwUjkFV2A5i/tb/E9LKw8ys4fX
 L0TpMBGzsGeAzf1supT64zNI/9GaDxF6tC0cHq/KV43fM7x0SO3wAi4
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-9-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 09/22] KVM: selftests: Expose functions to get default
 sregs values
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
default values of certain sregs used by TDX VMs so they can be set
manually.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  | 33 ++++++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 18 ++++--------
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 0aa6eecfcbde..1ebf161ec5d0 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -29,6 +29,10 @@ extern u64 guest_tsc_khz;
 #define MAX_NR_CPUID_ENTRIES 100
 #endif
 
+#ifndef NUM_INTERRUPTS
+#define NUM_INTERRUPTS 256
+#endif
+
 #define NONCANONICAL 0xaaaaaaaaaaaaaaaaull
 
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
@@ -1562,4 +1566,33 @@ u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
 
 bool sys_clocksource_is_based_on_tsc(void);
 
+static inline u16 kvm_get_default_idt_limit(void)
+{
+	return NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+}
+
+static inline u16 kvm_get_default_gdt_limit(void)
+{
+	return getpagesize() - 1;
+}
+
+static inline u64 kvm_get_default_cr0(void)
+{
+	return X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
+}
+
+static inline u64 kvm_get_default_cr4(void)
+{
+	u64 cr4 = X86_CR4_PAE | X86_CR4_OSFXSR;
+
+	if (kvm_cpu_has(X86_FEATURE_XSAVE))
+		cr4 |= X86_CR4_OSXSAVE;
+	return cr4;
+}
+
+static inline u64 kvm_get_default_efer(void)
+{
+	return EFER_LME | EFER_LMA | EFER_NX;
+}
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 62abfe27fe3a..5027411665bf 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -15,10 +15,6 @@
 #include "tdx/tdx_util.h"
 #include "vmx.h"
 
-#ifndef NUM_INTERRUPTS
-#define NUM_INTERRUPTS 256
-#endif
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;
@@ -647,16 +643,12 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_sregs_get(vcpu, &sregs);
 
 	sregs.idt.base = vm->arch.idt;
-	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+	sregs.idt.limit = kvm_get_default_idt_limit();
 	sregs.gdt.base = vm->arch.gdt;
-	sregs.gdt.limit = getpagesize() - 1;
-
-	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
-	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
-	if (kvm_cpu_has(X86_FEATURE_XSAVE))
-		sregs.cr4 |= X86_CR4_OSXSAVE;
-	if (vm->mmu.pgtable_levels == 5)
-		sregs.cr4 |= X86_CR4_LA57;
+	sregs.gdt.limit = kvm_get_default_gdt_limit();
+
+	sregs.cr0 = kvm_get_default_cr0();
+	sregs.cr4 |= kvm_get_default_cr4();
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);

-- 
2.54.0.746.g67dd491aae-goog

