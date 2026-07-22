Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF545D5D0
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762075; cv=none; b=F21j0hXz3FAm7C0DCtrEOvc/jrdAEv1DCFf8QNGgYbg7QaASmnwUCFhM+tQWRPMaCK9SPseq6G3egjsmC57qKe5dVRaM7hRKFQzwJtapGBod9oMlRErff+fx5raeyEvdwU+Ijp87iwnW+nKSD4sSPep2IRzI1BR178MfcsKln28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762075; c=relaxed/simple;
	bh=RSswLO4sPBgFvowrW2cB2ZwYWDNA3GkGtc6qyyhOGRE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AzM3weQ30tZozJkF5v57j4LR+BHEbv0F41SVLzCeaUJNlwTlhWosVs8WSfV/MNIJJqMXGEqWRnA45TJdBtoVTgMwVJl9g1IZxOGN7w0IuGDb2AZbiY9OqatikEE3b0CKs+J2Ud4/8ZguPsIsra7BfxZ6qXHqJE65YcxPq8vxTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksZ3rwdD; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksZ3rwdD"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso80869a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762072; x=1785366872; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwqV7gcRQG0nFUaQrTilJBRN8gkgEZ+YbIjfOqZXofI=;
        b=ksZ3rwdD+A6r1aVl+jEKuJx0zTs/E161KCsJwGNDnsKpAXJOmTwjnaL8bKoRLb3a0q
         UIAkgO7QPZyYkOW7ADEW8QTRgPlOC49X1InS4F7y2HWA7Rrf1fVy09KqvtcbJQBjqnrI
         Ub3Rlw4Jy6OiTvyLuVT/AAqM2dC8hyzHfMutGAHtgcT6Qo0epJj7x3NiVTKywdFJ2wKX
         Y32lIMnkBKcWpBoPmxlAs3hLUsDUB/tVutz1vvyRn+EmFn5pMeyGkLVl+e/2SyPWJ8CS
         kxyYh1FnESz3RBHnyAK6jDfQ/rUCC+Yr6SSkS4CLP1rk+E9YwsI+m6Evkt4x0Pk75Zgh
         8t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762072; x=1785366872;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwqV7gcRQG0nFUaQrTilJBRN8gkgEZ+YbIjfOqZXofI=;
        b=hSbODqsAntt1A+SvY1Yd8pyleOlX+7BwiQnGEDSt4UV+tCazXjus8f0Aio1BRADWDY
         lya/0QA/SgE94vXfzHrM8RUL4LFZkbyOdKbD/enXyiMGRl5czwl1JeO9rO10V0oTQ7TD
         S1uvVsdKbs9fq41T/opi1aBAJJ1Yrw35IDj1Bj/cpVP7lzx9CfgIuw4Z/fMFGnmww2iE
         4lVVqb7AUwJe2uFhRxRxSeX0sx4pJWVVq++2WIUs9Qx6dW3wl5ba5OStBDdEKql0/qEV
         NB4Yw1bnHMpXcR1qJgUBGUVDgLa/X1z6/8bYoKeoa9ukO0YNtb6d8vBBxrXkrwimHief
         G8Rg==
X-Forwarded-Encrypted: i=1; AHgh+RrfeuBDcl2CLwv2uBWBdX/j/hzXA6sl2q0fwSDE+IU2lseM+glEFJjLMNjr0DOyxR987BhUR22H8A9lvodLpYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeS3iEY/RQhYcMPC1WllydSpLuYQBy5sgm9pdemKGSSFG1hJ4W
	yDcjnwf5dwE0SYjyopi7Yc2K3qpjGCNjbnGoZNPim+s7ZV8Z6KZ0brjjdQhceCeGwWg8IhRC/b2
	jMcfrrA==
X-Received: from pgr15.prod.google.com ([2002:a63:114f:0:b0:c96:4c5b:dcb8])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a0:b0:3b5:4fff:fa0f
 with SMTP id adf61e73a8af0-3c44afb58dbmr533802637.14.1784762071639; Wed, 22
 Jul 2026 16:14:31 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:19 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3023;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=rHXAM3z5iBMuIUFttYkcIVu3B5Hjw4iTtMgyHIwbXEU=; b=620Ll51aNeaTFs40pgGcJMM6v44aJCfl+IG/XbXAFX+HpW8LoMl5/r7FljDHnt5RWx9ADE6zE
 Pxy7Ld/XSGrD5r0tZuuzzywD4RXSEEQkLna8RP4etzM0nq25p37vQud
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-14-15ad654a50db@google.com>
Subject: [PATCH v14 14/22] KVM: selftests: Expose function to allocate vCPU stack
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
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Introduce kvm_allocate_vcpu_stack() to allocate a vCPU's stack
in preparation for TDX to allocate a vCPU's stack and initialize
its stack pointer.

TDX VMs' registers are protected state and cannot be initialized
using the KVM_SET_REGS ioctl() that is used for normal VMs. A TDX
vCPU's stack address will be a property of the TDX specific boot code
that initializes the vCPUs' stack pointers at boot.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h |  2 ++
 tools/testing/selftests/kvm/lib/x86/processor.c     | 16 +++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 7e00c9414595..ff3219edab44 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1144,6 +1144,8 @@ static inline void vcpu_clear_cpuid_feature(struct kvm_vcpu *vcpu,
 	vcpu_set_or_clear_cpuid_feature(vcpu, feature, false);
 }
 
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm);
+
 u64 vcpu_get_msr(struct kvm_vcpu *vcpu, u64 msr_index);
 int _vcpu_set_msr(struct kvm_vcpu *vcpu, u64 msr_index, u64 msr_value);
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 748c6041f8bf..8f8bb90fec35 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -813,12 +813,9 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 	vcpu_regs_set(vcpu, &regs);
 }
 
-struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
 {
-	struct kvm_mp_state mp_state;
-	struct kvm_regs regs;
 	gva_t stack_gva;
-	struct kvm_vcpu *vcpu;
 
 	stack_gva = __vm_alloc(vm, DEFAULT_STACK_PGS * getpagesize(),
 			       DEFAULT_GUEST_STACK_VADDR_MIN, MEM_REGION_DATA);
@@ -838,6 +835,15 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 		    "__vm_alloc() did not provide a page-aligned address");
 	stack_gva -= 8;
 
+	return stack_gva;
+}
+
+struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
+{
+	struct kvm_mp_state mp_state;
+	struct kvm_vcpu *vcpu;
+	struct kvm_regs regs;
+
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 	vcpu_init_sregs(vm, vcpu);
@@ -846,7 +852,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
 	regs.rflags = regs.rflags | 0x2;
-	regs.rsp = stack_gva;
+	regs.rsp = kvm_allocate_vcpu_stack(vm);
 	vcpu_regs_set(vcpu, &regs);
 
 	/* Setup the MP state */

-- 
2.55.0.229.g6434b31f56-goog

