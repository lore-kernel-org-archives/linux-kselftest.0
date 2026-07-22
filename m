Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93947125B
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762078; cv=none; b=ABWTR5BX+VXv5yo4Wr1Plky3+BgVCdTwQ2xeKJS4QNdQ/NVo3z3mDpmcQHOuDzxf1ygLvGYbfXfKLusnhY+EO4MTyR5aSM9mYNIc+jlGLlfflVrAtOBsi8RUXZ5ho3uBwasyOgLOH0zob8Z9SjSXPoFb3EQVJvbehFkWTD/jGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762078; c=relaxed/simple;
	bh=85nJ9/hYOiJ96H11w7YE6HgvAK/atu2QWkFdBC4kTTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W5D/jM28rdHbJQpwVJTLYKpWTrpjYVetv2F1/rMQqb4W9fWy6/BWmRHQh2NrHxAjpZky9lddVf2Jlfj8+HKraJEq9ARkg1pLCMrXf0EcOHIxmi3+pJJTriJ6ZqDyLi/Cnsz41tXcav1/C6AWzV/7W8yLjHQluVoi608EIVfay18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fUikNk5G; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fUikNk5G"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so569095ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762075; x=1785366875; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZLWKI1tlBYiW8AamRHdf/1OfHZxF/vT4pGO9bOW1EQ=;
        b=fUikNk5GOF0UnrLfl+XuaRoEc2cPX0pasK0iBnT6XRtTZ0O3c0zJiP/3RtlFRvdW0S
         p6h51UXPbVknPLykw0MdPgPcFslGs2k9XZvoOQVn4i3XhnmvHvrltsdv4kp38aLOnT8b
         ouNb9Q46+hV/x7w1PNgPsH1gqUXHwQtjzOzQ8yNHg6fcToKEyAUkxpT/ICmYfA9xgyJy
         46uVjxRCYdClBE8Ru5Pxgq6+GAEvclL0Z5tUNhc+q5bHAWxqqalbxS/DCQ5K7vEl/sZ3
         wjksmNQqzV94tsR///h+PXdVNsMXESkYv4uNB9E4KH3U/Weq3NWAeykofB2f79xc85XA
         jYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762075; x=1785366875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZLWKI1tlBYiW8AamRHdf/1OfHZxF/vT4pGO9bOW1EQ=;
        b=AY2U9NyOMKUuZifxADKl8oZwnzHwwbE37gpE/pQaqaenvEBUU0+yW/5qOQ1hkgpmWG
         KvMXSaszZsicATG8WU4ayVvih8iods+0w+bNsU9MFYWfb8SW+3UHIuBCQg/OjM9PK9Mn
         Pn13MJfKSqewBEttXOKb3JGRm2qdyBl566Jffd0g/J+DDS/JwWhBs0sSlV3pkXePGlRC
         gno5I3TergeIr09bJ8d6Uv971Ulm/9R2dZ/yLBHc/h4ZFH7v8URpM6jReTC5T1HlgF9W
         SB7S7bm6cgRJFeZIK87o0hRKskgF8MtLRz4hqX5jkTlt9LG3rLNBaR6Lw1JPNtrvKafP
         Iwww==
X-Forwarded-Encrypted: i=1; AHgh+RqetW/jVS84FODTxQ26gaw1s3y2hdflJOjXQy6EzekFrBioxtCi1aFI5I5h8TU3/jb85jnQJ015l3cxFjITgiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbliC2UoEgUaiYDjRhaPADBAmZOFQKfbWITBF7y70dLgdz9Wu8
	wutfm079THIrgtexZDCdVrZrpX1HUSh5otOXWFXtUCK9pEEvK2Nhn32HlMAHZSGOUwQudJJqIYh
	HGQAY5w==
X-Received: from plbku3.prod.google.com ([2002:a17:903:2883:b0:2bf:8db:4516])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecd0:b0:2c6:9f6a:9f6f
 with SMTP id d9443c01a7336-2cfa6c66734mr9553835ad.28.1784762072595; Wed, 22
 Jul 2026 16:14:32 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:20 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3521;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=xqpuRNldDHsQw4caqxUrdj/Q5OmHfnukgRI/kPmbKvA=; b=lro9gw6spAzyLdUzV3VuSRQIK+ZItJCg11HfLCf1lzHdMGraZlgSyxEOVHfijLoItxsnTtGLy
 nqcpK0M8FOyAze6f36y/Zonp0LYbMf4Ht+uI3WjVyWGfhWGCj7xCKum
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-15-15ad654a50db@google.com>
Subject: [PATCH v14 15/22] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
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

TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
vcpu creation.

Since the cpuids for TD are managed by the TDX module, read the values
virtualized for the TD using KVM_TDX_GET_CPUID and set them in kvm using
KVM_SET_CPUID2 so that kvm has an accurate view of the VM cpuid values.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       | 21 ++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 33 ++++++++++++++++------
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f5003cbaa106..07e7f5c90329 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -44,6 +44,27 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 	}								\
 })
 
+#define __tdx_vcpu_ioctl(vcpu, cmd, _flags, arg)			\
+({									\
+	union {								\
+		struct kvm_tdx_cmd c;					\
+		unsigned long raw;					\
+	} tdx_cmd = { .c = {						\
+		.id = (cmd),						\
+		.flags = (u32)(_flags),					\
+		.data = (u64)(arg),					\
+	} };								\
+									\
+	__vcpu_ioctl(vcpu, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
+})
+
+#define tdx_vcpu_ioctl(vcpu, cmd, flags, arg)				\
+({									\
+	int ret = __tdx_vcpu_ioctl(vcpu, cmd, flags, arg);		\
+	TEST_ASSERT(!ret, "%s failed, errno: %d (%s)",			\
+		     #cmd, errno, strerror(errno));			\
+})
+
 void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 8f8bb90fec35..f6a2aa6b86a4 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -838,6 +838,17 @@ gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
 	return stack_gva;
 }
 
+static void tdx_vcpu_init(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpuid2 *cpuid;
+
+	cpuid = allocate_kvm_cpuid2(MAX_NR_CPUID_ENTRIES);
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_GET_CPUID, 0, cpuid);
+	vcpu_init_cpuid(vcpu, cpuid);
+	free(cpuid);
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
+}
+
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 {
 	struct kvm_mp_state mp_state;
@@ -845,15 +856,21 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	struct kvm_regs regs;
 
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
-	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
-	vcpu_init_sregs(vm, vcpu);
-	vcpu_init_xcrs(vm, vcpu);
 
-	/* Setup guest general purpose registers */
-	vcpu_regs_get(vcpu, &regs);
-	regs.rflags = regs.rflags | 0x2;
-	regs.rsp = kvm_allocate_vcpu_stack(vm);
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vm)) {
+		tdx_vcpu_init(vm, vcpu);
+	} else {
+		vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
+
+		vcpu_init_sregs(vm, vcpu);
+		vcpu_init_xcrs(vm, vcpu);
+
+		/* Setup guest general purpose registers */
+		vcpu_regs_get(vcpu, &regs);
+		regs.rflags = regs.rflags | 0x2;
+		regs.rsp = kvm_allocate_vcpu_stack(vm);
+		vcpu_regs_set(vcpu, &regs);
+	}
 
 	/* Setup the MP state */
 	mp_state.mp_state = 0;

-- 
2.55.0.229.g6434b31f56-goog

