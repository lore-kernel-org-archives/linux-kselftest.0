Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B447044B
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762077; cv=none; b=l8xhuUXQTt6J5Nv1NnXCaHfwm1jogqbGlQ/R7oztC/q9V1YFkLAfxgIYvrOG/WnjCc3/3xRTkVvlg7G7M4zwzwJaBqbmIi4ejzSfFFiZFKoqd+is0akVr6NWxLza+bzBXaTCayG39OU+TcSK7do+ATXhjubqDEA7wuHyV+soCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762077; c=relaxed/simple;
	bh=jpR9xtsvpa/RjBQ8wnCwKk/x2/b0KiCTZGNnNI5CsfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ipQJLEQ59IIDCqae1bg2LZlVpFOEf2AVP+lyeiIoTAApe0FOIUK327MfIs+f/08O/VkfoQP+KivPOnpomjsRCRK1K48bTpZQvrtoGyEtH96/o32ZnHvnBs8SiVoeUZIQ/Z7dLSFnCryiRsYgv2UrWqKg+y3vEoSC4Lg/cBwHjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FX5wpN7q; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FX5wpN7q"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so410525ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762075; x=1785366875; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/BhsDx/NrVOxcO3ExGYsFuYgkeOvxYZ93mj2rERXwA=;
        b=FX5wpN7qSx8elaEA+k+VNVj4w5kvDoadNktUrPGyr8g4D7NijNpXWJrpf0n37ZSVyx
         m9hWuiJJwped6ZHACOj2WqfzXMW05w3//0ofURqFVXL6rvA+2qpWXC0R3iYFG+YE8NIa
         XYVASsZZ/ODweVf3kYyt2cV7Wa1cdnV3uVmM629FnoJF61jdLt9o7klZlrPPL1HIGGUY
         mfjjG6VVzUOqHXuodj7Lszbao7bwfZeVc9ULW0JFDQNzyuEIErCrGFt8O3lbcxHLY2Dz
         OCUQ/K2pCnvXOEoaRkgtis2jHP1tcxsJwCamB+t8Z6n3eEF0UDQZkYs9KJZNAz25xNFS
         RLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762075; x=1785366875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/BhsDx/NrVOxcO3ExGYsFuYgkeOvxYZ93mj2rERXwA=;
        b=XkLQ6VPaH9Z9pN/KXfH0TIz4YksQzp+x32zUCiG4XQQhn8mGe/FMbNYdEMmTySEupZ
         F+txQed/Zo/ytEcx3QpqHchA4kz1bkoR9ERozWadPJIo7MjyndYXkt/c/LE1FQr7jTWC
         nNJGXvbCtAv+aDE4cNplNlu+9aSZWBrDfJc8O9et4JhETUcJLY39d8WwFEkn0qYs4q9r
         LAjxOkluwWcoBCE8O1rPjcP3VaAQdzMJWN3xHGPggOgrCzvhpaLIzBMFh+qRmwTNTdxW
         vNKwM7lmwfRYRUVX69tB/SLCN6fbT+kzz7yf5G0D0YvzZJ9+UReRJYHDV88cAFePqcS6
         c7Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rouv03zm8oG0ZdfG+RZK0ZxQ8ah7S09BSjXGeHZMqx0ky67AQr60rsAnCtp0DBoC5dbpl3HEQz5K5MvXAovbnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqs/R/HtQ/h2Fx2y1KOwcpRpT0jfA+U8Vr2YQWv343aCsrTgr4
	9Sb+hwaYi4jIWpaW7ARZciQ8Mls43Oz0DW/czivm8gWUzTJo3AFgedE9o7cBpwZc0wX7GizBIHF
	pEbk1vQ==
X-Received: from plcl21.prod.google.com ([2002:a17:902:e2d5:b0:2ca:5d68:247c])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e544:b0:2cf:8131:75f3
 with SMTP id d9443c01a7336-2cfa6a558e5mr9703405ad.7.1784762074619; Wed, 22
 Jul 2026 16:14:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:22 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3002;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=/f3t5qAAcjcel6oyHhPMCidPw1Nejh4ZBp7/fc5KqHM=; b=NQPWIjycJ+6xb4w0LTnFIA7Ko3LQ1ujfT5ISJno2PAeSTeWTXp/i4m3eMhUFBPNaSX7sc4prV
 AvAdTcIn6trCzFRLDIDTpJu/5gKDNMpvrzmGRQqT0HaRbKzLREq3ekg
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-17-15ad654a50db@google.com>
Subject: [PATCH v14 17/22] KVM: selftests: Set entry point for TDX guest code
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

Since the rip register is inaccessible for TDX VMs, we need a different
way to set the guest entry point for TDX VMs. This is done by writing
the guest code address to a predefined location in the guest memory and
loading it into rip as part of the TDX boot code.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        | 10 +++++++---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 93ce6e1ad2c8..307e2c0bc9c9 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -70,5 +70,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 5e415c6577b8..4b97a9a1bb5e 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -808,9 +808,13 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 {
 	struct kvm_regs regs;
 
-	vcpu_regs_get(vcpu, &regs);
-	regs.rip = (unsigned long) guest_code;
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vcpu->vm)) {
+		tdx_vcpu_set_entry_point(vcpu, guest_code);
+	} else {
+		vcpu_regs_get(vcpu, &regs);
+		regs.rip = (unsigned long)guest_code;
+		vcpu_regs_set(vcpu, &regs);
+	}
 }
 
 gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 3c3ac6c7ce40..be63d8652a02 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -114,6 +114,16 @@ void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
 }
 
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->guest_code = (u64)guest_code;
+}
+
 static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.55.0.229.g6434b31f56-goog

