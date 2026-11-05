Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922461;
	b=rvbtND6cWaB2H60shBGsnuDrvwDI2te/3eSluYaXI2IcPPdPSRvBqU3is8VkinIv/nz9
	 7yNk0Wg/i8JCZlFSMQC38rV9PiPeIC5vW7JAduRR2XNS0WFv+SsJ8EmHLOUZXQ5mEqpN5
	 dconfNYHwkI85N+NPGBf8eGnwpixynUhHkZNhTRs8AwRTXn4edDm+ec5zcReqUh6rsRhh
	 11dzFQoJT3Jba0xLxlIZvoY76X648QabW+7JwMp0IU9pyCUNFspYoOhtJLbj9OORvV1LM
	 Frh6wShi4E20PA7BEH/HOwxJvwuThvCVKQCf9HgAjqLXa3uCTJ9jJSKUc+TCxsd6/HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fA7YOiI+4VTK/ln8Jo7W7IKbpceDBsmk5RUVcqkWWVw=;
	b=Ej9bWAph2PEDJ06aAM/6/oKlYNmOXjmrvx5stcGeWY+vzlg3SBTMiZjv6Vn9EC1b+kvd
	 1lVfwuxYSW02ymiQEDXNpW58MVO66Ukt+IC/m0MG2zrU6ywes9V6v+swP55FN0COqUTcb
	 CcnPJ9n2q58w5GHF/MkwhTS5B5oZ9+R5Qcu2RwpwGZL+ws8P69bwwjcQ6CXSLNdfRN7QX
	 71tKHBPmomPD0fjIVQaOnuGuWZTidIRwiIAoorDeWEossCJqY6bDLTEmWeTXOPo3B5FYr
	 3oeseBpJB8qoZpjcSyTfaQfXnpB+ER7kV6WgGWDzU+JLZBT2mu1oJIycsUGMr3X0wmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kKxyFnzU;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB58606EE8B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB58606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kKxyFnzU
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so92854a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922461; x=1794527261; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fA7YOiI+4VTK/ln8Jo7W7IKbpceDBsmk5RUVcqkWWVw=;
        b=kKxyFnzUu7aYCGQiRykGugZrQQUTDmazGgXci+Tl76Byl8oz3j4lWsgJciIPay+Rzi
         2x4Ms20x87WGJJBKT1CXB+VZF33FPDcSfDICeLu+iykOQvipVFel8J6HjtZGfQERFjV6
         ZPtu1Y2UhTAlNzeE7Ww/tyyuVzWRco+GeHUtJ3SRg29athapPCRMHhz6APLUWK00gU9/
         vK7NEPvvWIq/2N1WHLGeCsIrITGREXCQverGlEi8/ff1qNpMzvuS3vV4b8FLv527SESl
         skkXRwEbD3l7yWWEiWxe7noRJ7PHVnfyQaa1Q/7zQtoetp6/vYfZDNKlrUAd6PZQesVj
         jKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922461; x=1794527261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fA7YOiI+4VTK/ln8Jo7W7IKbpceDBsmk5RUVcqkWWVw=;
        b=A7ky+Rd2Sud6yaiP65EUlSECkR+GM1tco3rrbJtiBpcdblCQOZmT8GCX1jdS7SUPA9
         NAaR6+VxizmTlsV561H1x5W9XLJyKFdZ+fNrkNYpI2sOnvQnQdnNLhgcCVtGPptdOZXW
         PZPHnun9cDa0SN6ACs7qTzVimCSVfyFGyG/BZ+T3zLfDr5FoTJUdSmo+pbt4hHXLDNax
         PbMyXISTGvKPecdPZCEIiP1Rwvg52yYtIJdrGuczH5Xdrw4+a1tgrfZ8qSH0ZWV+Wn8n
         EAoTiV+VqsXOKVEg6VWyg23YsLhkpbPVDDNI3CAgAmtlwUeS76BRf2NtR6vZahK1hWRX
         ywCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzardlce+TKH1hj/0JHJkC7y8hCppx+sGBBUcrg69xOskSlX9rR7yckU3cNKcNpmWZIx+GdMxQQJqMLCm5hrR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E2e329xWRolfJaQUvNISYNeImewt3hWF+UG8z9jb15dD45SEH
	FQR4jaNJpyeSi4fjos4GpR6+nklttEI0H7HchQpom9fwe8DpOGjlI3lm7wNRuP43yC1nhrp3s+L
	gLRsRYQ==
X-Received: from pjwx3.prod.google.com ([2002:a17:90a:c2c3:b0:3ab:d09d:a37a])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e48:b0:3aa:548f:eb77
 with SMTP id 98e67ed59e1d1-3b0db71207fmr631441a91.56.1793922460672; Thu, 05
 Nov 2026 15:47:40 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:52 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3444;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=mELo8AzMSh1rybV6Mt3cH30O8DVQu/DZjo7vhHkr0U8=; b=4kvvCDxfGONBikL1MthdGJfAiBfxAkmmY2JRnbb5k65T+aYbMZiKb4ZTLNkVN72rv9gLq4oyt
 nUUXa2MfG0zDBNaXBIyC/vJ0zEEjf+APKZa6zJ4Bv2cFsHu3WXQZdZ7
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
Subject: [PATCH v16 08/20] KVM: selftests: Expose functions to get default
 sregs values
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
default values of certain sregs used by TDX VMs so they can be set
manually.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  | 35 ++++++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 20 ++++---------
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index e62ca763135e..4db0c7009876 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -32,6 +32,10 @@ extern struct kvm_mmu guest_mmu;
 #define MAX_NR_CPUID_ENTRIES 100
 #endif
 
+#ifndef NUM_INTERRUPTS
+#define NUM_INTERRUPTS 256
+#endif
+
 #define NONCANONICAL 0xaaaaaaaaaaaaaaaaull
 
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
@@ -1672,4 +1676,35 @@ u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
 
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
+static inline u64 kvm_get_default_cr4(int pgtable_levels)
+{
+	u64 cr4 = X86_CR4_PAE | X86_CR4_OSFXSR;
+
+	if (kvm_cpu_has(X86_FEATURE_XSAVE))
+		cr4 |= X86_CR4_OSXSAVE;
+	if (pgtable_levels == 5)
+		cr4 |= X86_CR4_LA57;
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
index fe56df0c7aa4..b8dbb16d5a28 100644
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
@@ -655,17 +651,13 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
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
-	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
+	sregs.gdt.limit = kvm_get_default_gdt_limit();
+
+	sregs.cr0 = kvm_get_default_cr0();
+	sregs.cr4 |= kvm_get_default_cr4(vm->mmu.pgtable_levels);
+	sregs.efer |= kvm_get_default_efer();
 
 	kvm_seg_set_unusable(&sregs.ldt);
 	kvm_seg_set_kernel_code_64bit(&sregs.cs);

-- 
2.56.0.455.g6c5a503b38-goog

