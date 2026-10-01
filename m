Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4C53446B
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883538; cv=none; b=dm36Jy9C0AmIv/LVP8eZ0UK/rOrTpVqa0RGJ0qwk1BeRmf/VT3fYl3be9YHAQzyMEHk5NJceK4MFFL44NKWIggyDoCAuR+ho2ZHCv4RzpnR+O9l9mJza4qSi7Zv57SNIr+KxIKIohnC/+WDb87pHibMISfcCBzI6KqIU7lzlJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883538; c=relaxed/simple;
	bh=pVh3W7IgL0tb+3VmdaT+bHcGzD3aMg5/8PYinx/HcFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q+Z5hE05Y3clQ0y+NekGnTFaym8qE06A8GKvrGkFghPMTxbV3m5gzSwP+1nLSUcOE2GrdeHdqPjBTfQIss5ltrE6c0kR2kS4Jiv0tV69+rsz3JSa4BvKJj4rZDl0cYu5gZTLYR6ZbQmWmlTmp0+YvZD/u/TsGJvqPbGzCc1NHU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3vSXTdx; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3vSXTdx"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so59494965ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883535; x=1791488335; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bZLzZb4sU4KEN1U8eHEldtPfXW3XPpsor0ue/9+Hb4=;
        b=Z3vSXTdxYVeY2tXcis+7pFpmhmhoYXVz2NiUp8EoQMJvyicdoyH7mIya8ZFTUFn/Go
         SxJjqJkGUOIl1mnv/6EJ1lTuHVizkFx+EnjHomeYAXLeDnIZMOcLi023PNE1mLk4Pof+
         AWOVaZX+kUkLzthG9KdCyeHa9bBeVu9l5OL01Sk1BLMUOFSdSQOlXWb3MVRIweToB+h+
         DK/sYiEtb2ws/AvRP7DUo6z3mut+4pWuUFLS23nVK8pLw0spUgJNoUa39fAA0dRYkNyZ
         4S3+5yNXmRMQ3gnpzPWHZDdC3zx2uVFX0GLiF0AdwiHOSoSrgo/btCiAy5TyrWyuyuCr
         PVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883535; x=1791488335;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bZLzZb4sU4KEN1U8eHEldtPfXW3XPpsor0ue/9+Hb4=;
        b=XuD0GCqe7/TCwEhmy45ZAy6vYjfpsmX21NmsC/hTcxA91I1Qx/9jSLBzyliFEOl/Gi
         icJ8rpZsBgJ6U2fMdrLdno5KqQUGGTKiLrWMiGPQymKp/SQWTxtFAevbmfvsWsu4fhv9
         nBWkyjdP/Buz8CjVslo+eWh7RqwcyYAJK12A0+zCBujcs1LMurnIYFljxEkKFPzW7u3l
         XaTXP8G9tFyNSmxOzzV5gskWq8pgXjwZWsc1yFygyIYGN3nkCu1GaOYKqntfqstcPY3Y
         c37pFVeY1D7ojpzAhHjfHtdNJNWC+hjthTmGPHpg1NCvKb0042WVXgGAd87+20nBIDmN
         kynQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf7roE/Nto/ZELLmCQA8YeSqci62dzUHOuJB7c6m+l0nVYRyh+QwlX+LA4UtrEyn9HR3oUWt7OiKLydtdKgmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUdXN5DZahjLI2jAue7OBF8XPY0yCL7lSpqaljamRkgUDzuYXB
	22KdimRP4ox42LYUfyjaMOXeBydLOcPf1N4agfFAu600n7ebGW1ARj8ffEGEyKqXEtrAEM4CZ4T
	URCT4FQ==
X-Received: from plble4.prod.google.com ([2002:a17:902:fb04:b0:2e3:3e4f:56e7])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c951:b0:2e3:1ed7:d5d3
 with SMTP id d9443c01a7336-2e49b7f27e2mr3915375ad.67.1790883534303; Thu, 01
 Oct 2026 12:38:54 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:41 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=3422;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=j/m+vrnUGb48Imqx0CMR7UIlIq8TwL0A1eGENaF91Kg=; b=DOEcCJY81kvyAGiiQ4zAi43IcAu7/xLkCVUiC3LZZ0sVAKYGxMJiKW3Wf5HTI2FuCEkLprj9h
 1lTOhqQqdkBB4NtcRKOcK1YgNRU8En3KckALp4hl0HCXLXXuBt7ibpo
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-14-7c62a5d8a992@google.com>
Subject: [PATCH v15 14/23] KVM: selftests: Expose function to allocate vCPU stack
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

Introduce kvm_allocate_vcpu_stack() to allocate a vCPU's stack
in preparation for TDX to allocate a vCPU's stack and initialize
its stack pointer.

TDX VMs' registers are protected state and cannot be initialized
using the KVM_SET_REGS ioctl() that is used for normal VMs. A TDX
vCPU's stack address will be a property of the TDX specific boot code
that initializes the vCPUs' stack pointers at boot.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  |  2 ++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 25 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 8854ee052d29..1eb380dd216c 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1212,6 +1212,8 @@ static inline void vcpu_clear_cpuid_feature(struct kvm_vcpu *vcpu,
 	vcpu_set_or_clear_cpuid_feature(vcpu, feature, false);
 }
 
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm);
+
 u64 vcpu_get_msr(struct kvm_vcpu *vcpu, u64 msr_index);
 int _vcpu_set_msr(struct kvm_vcpu *vcpu, u64 msr_index, u64 msr_value);
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index da430d4e7765..4a753fb43007 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -851,12 +851,31 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 	vcpu_regs_set(vcpu, &regs);
 }
 
-struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
 {
 	struct kvm_mp_state mp_state;
 	struct kvm_regs regs;
+	gva_t stack_gva;
 	struct kvm_vcpu *vcpu;
 
+	stack_gva = __vm_alloc(vm, DEFAULT_STACK_PGS * getpagesize(),
+			       DEFAULT_GUEST_STACK_VADDR_MIN, MEM_REGION_DATA);
+
+	stack_gva += DEFAULT_STACK_PGS * getpagesize();
+
+	/*
+	 * Align stack to match calling sequence requirements in section "The
+	 * Stack Frame" of the System V ABI AMD64 Architecture Processor
+	 * Supplement, which requires the value (%rsp + 8) to be a multiple of
+	 * 16 when control is transferred to the function entry point.
+	 *
+	 * If this code is ever used to launch a vCPU with 32-bit entry point it
+	 * may need to subtract 4 bytes instead of 8 bytes.
+	 */
+	TEST_ASSERT(IS_ALIGNED(stack_gva, PAGE_SIZE),
+		    "__vm_alloc() did not provide a page-aligned address");
+	stack_gva -= 8;
+
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 	vcpu_init_sregs(vm, vcpu);
@@ -864,8 +883,8 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
-	regs.rflags = regs.rflags | X86_EFLAGS_FIXED;
-	regs.rsp = vm_alloc_stack(vm, DEFAULT_STACK_PGS);
+	regs.rflags = regs.rflags | 0x2;
+	regs.rsp = kvm_allocate_vcpu_stack(vm);
 	vcpu_regs_set(vcpu, &regs);
 
 	/* Setup the MP state */

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

