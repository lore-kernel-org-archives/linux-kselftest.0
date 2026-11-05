Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922462;
	b=Q2ZPRCr7+rDIIiAznlkWwjljBZMPgMHBBd7XRbmms8FyzkvnSX6jTsTgDBRpiNqb4h0G
	 1l7xGbwm4DrX3ziZitJIniNQJQ8DRAZA/lsopf8sAB19TS5ZM09Q3grQG1++8462ojr/5
	 LBqrCqr1fvtwBY23uT4KGvFYweKR0t+4ymmtnkkkT8m3rQXB3ovy0q90kdTua7h48WAkF
	 tc+vFI3A5tS67MTbXPWPgaDXhCq5LaxjNYffzGrFQ3n8WM7ADw+DxnPswekvDI+JbtVIN
	 MYpqQ8FcK/KpteS2EczE48jYxsSMMAeQFI+0DIYjFycCAZmA9KXbcjRZopzJqCz1wRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6mP5qxC8uhKvDY4FQhzOkitkbuzunlSFIQMHp8zclb8=;
	b=c2YQ4jDJV7xXSbRZi+iqKcC+guzeQv55eaLMLuBmMHrEV5Kf/uahr3MJdK2n/FiVqCDi
	 Tp5ijliyz4Yy4DGn3/GfZ2UdirBl7XPeX0NECt6FZW+DWytF9EJTDyyOO6/1UfJucESW9
	 O41Bmmr8wSXuohGkKRlIDQObsgpL5uZVo0FFiyDXA6pErCLjKbN+uNlQnZxWFRjV8YZis
	 8OGi++gY+2+5oVwtNlsOvKrmnKA1i/dvjov0YS9FoPBcx8k1Qa+dDb3bmg7EPdFDWApos
	 lDJllHpEHiGpb5mNiy4vVVi5AxHNS8MQgr0Qfr0tqPLEEJCeU6hujmwaVq7coCJJuPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lA+pDSZ2;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B680606A338
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B680606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lA+pDSZ2
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so45891a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922456; x=1794527256; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mP5qxC8uhKvDY4FQhzOkitkbuzunlSFIQMHp8zclb8=;
        b=lA+pDSZ2nt2jejQkzmaaNFAkYzQY+hhXOmpUSYJ3lNH8J0vOu2bpkGWzl9ggeyi123
         jjMhDyqXGtIVu/wGAelSDlUlZXpXRKr+DuhPvSzzUpz7oiKEkQzV7xLqrTCqns5u2tC4
         b8IqyHNSvqDLc716gH6WTY9lKonmbtEwXebVMcm2S0hj5ubpJCz18A6Fo78Suf/NusJh
         neIvEsSy3h6vIdmaZHg0+TG/9Hgr+k8XgTFKZi/CklYFi0grgi8Xwjzmit2XurzDzjM7
         xeYopw+rVFRA5xUjyWc13eAvy8tjMNjwFmZ5heCY1BeHH3KCQKTdMW1K/bdAJ8yJ7V20
         4sHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922456; x=1794527256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mP5qxC8uhKvDY4FQhzOkitkbuzunlSFIQMHp8zclb8=;
        b=nceFz6OVsC/tFfSlfBLwhmTVmszgz2KZWmT8DNOQsCdF4yGhzzZ6dOSoRoCLiGZD/y
         5Y0tZk1iHf5+Jpwq+W14EgBz1/X6GDuPr/+LDiG4gBRQ9151+DcZhwz2H7ENsfv9DK8v
         42TegSkIm7BbPbih4ikgGdS995kkZqRLOfvwfIXNTqYdDrm94eclj6Q2Cv6sMaATNuEj
         lXpEqTwS5Kko23ExqJ2p2Svutk0E0OnRvdh6WyHDci06hPGU3jeCThSsCvEKfPHrJ7nc
         cpPg222mx6sZDZEZc+Cbpra+mhqvgg0z/LOPDvr/0gMFDq+qIZx2DUTm0xq8AvdM3mdc
         R7qA==
X-Forwarded-Encrypted: i=1; AKwUvBxxu5nFGo8k/njvffo5KVgEf/9SoIn4K9Mwkk5rQexbsH5k9mPbAO5ieyPRoLrQseIk4+z7w+2rysHrgUT0Rcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gmxVcwOISwHrhKYn/8Lpp8LQIIkv6ZSlxfED/ZRBlK1+pvHle
	+kzqCK/NN8emP+ZHfOo+tj0YRZ3CpdIndI+AhQFIqetVj9bNh1KP1drPOmV3Qyz6aTghSs8JFXz
	7MIteWA==
X-Received: from pjqa15.prod.google.com ([2002:a17:90a:a50f:b0:3a8:cbf9:5e52])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2792:b0:3ac:c98e:345e
 with SMTP id 98e67ed59e1d1-3b0db712642mr460539a91.45.1793922455703; Thu, 05
 Nov 2026 15:47:35 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:47 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=9290;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=Ja+++PneZjkD9+OWe4AVdEX1gliuCF94SFmA8dzMeUo=; b=A9SXYyMV+R7UYi0xe5uzFzEg8ic8e19oo65qxFmGx9A1WymgpAnM1nR+3ceDWQlfZE3nAToSC
 MgDzw7DD7MSByDCuWihfrV0fW64qbJY3bU+EAbxXjxSORL/q/Uf+JEj
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
Subject: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
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

Add tdx_init_vm() to handle the mandatory VM-level initialization
sequence required for Intel TDX.

For TDX, the VM's CPUID configuration must be "sealed" during
KVM_TDX_INIT_VM before any vCPUs are created. This is necessary because
the TDX module does not allow the host to create and initialize any
vCPUs before the VM's CPUID configuration is accepted and sealed into
the TDCS.

Additionally, to satisfy the strict requirements of the TDH.MNG.INIT
SEAMCALL, the helper masks the KVM-supported CPUID
(kvm_get_supported_cpuid()) against the "directly configurable" bits
reported by KVM_TDX_CAPABILITIES.

Co-developed-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 .../testing/selftests/kvm/include/x86/processor.h  |   2 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  37 +++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    |  21 +++-
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 114 +++++++++++++++++++++
 5 files changed, 171 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 17a4256e9081..e6e81f979bc8 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -27,6 +27,7 @@ LIBKVM_x86 += lib/x86/pmu.c
 LIBKVM_x86 += lib/x86/processor.c
 LIBKVM_x86 += lib/x86/sev.c
 LIBKVM_x86 += lib/x86/svm.c
+LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
 
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 3e88a413fb1e..e62ca763135e 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1033,6 +1033,8 @@ static inline void vcpu_xcrs_set(struct kvm_vcpu *vcpu, struct kvm_xcrs *xcrs)
 	vcpu_ioctl(vcpu, KVM_SET_XCRS, xcrs);
 }
 
+const struct kvm_cpuid_entry2 *__get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
+						 u32 function, u32 index);
 const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
 					       u32 function, u32 index);
 const struct kvm_cpuid2 *kvm_get_supported_cpuid(void);
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f647e6ca6b34..f76489ffb48d 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -2,6 +2,7 @@
 #ifndef SELFTESTS_TDX_TDX_UTIL_H
 #define SELFTESTS_TDX_TDX_UTIL_H
 
+#include <inttypes.h>
 #include <stdbool.h>
 
 #include "kvm_util.h"
@@ -11,4 +12,40 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 	return vm->type == KVM_X86_TDX_VM;
 }
 
+/*
+ * TDX ioctls
+ * Use underscores to avoid collisions with struct member names.
+ */
+#define __tdx_vm_ioctl(vm, cmd, _flags, arg, hw_err)			\
+({									\
+	u64 *__hw_err = (hw_err);					\
+	int r;								\
+									\
+	union {								\
+		struct kvm_tdx_cmd c;					\
+		unsigned long raw;					\
+	} tdx_cmd = { .c = {						\
+		.id = (cmd),						\
+		.flags = (u32)(_flags),					\
+		.data = (u64)(arg),					\
+	} };								\
+									\
+	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
+	if (__hw_err)							\
+		*__hw_err = tdx_cmd.c.hw_error;				\
+	r;								\
+})
+
+#define tdx_vm_ioctl(vm, cmd, flags, arg)				\
+({									\
+	u64 hw_error;							\
+	int ret = __tdx_vm_ioctl(vm, cmd, flags, arg, &hw_error);	\
+									\
+	TEST_ASSERT(!ret,						\
+		    "%s failed, rc: %d errno: %i (%s) hw_error: 0x%" PRIx64, \
+		    #cmd, ret, errno, strerror(errno), hw_error);	\
+})
+
+void tdx_init_vm(struct kvm_vm *vm);
+
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index d705e9269a41..7bbc0df49a18 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -836,6 +836,9 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 		vm_sev_ioctl(vm, KVM_SEV_INIT2, &init);
 	}
 
+	if (is_tdx_vm(vm))
+		tdx_init_vm(vm);
+
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
 	TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC frequency.");
 	guest_tsc_khz = r;
@@ -1354,8 +1357,8 @@ void kvm_init_vm_address_properties(struct kvm_vm *vm)
 	}
 }
 
-const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
-					       u32 function, u32 index)
+const struct kvm_cpuid_entry2 *__get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
+						 u32 function, u32 index)
 {
 	int i;
 
@@ -1365,11 +1368,21 @@ const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
 			return &cpuid->entries[i];
 	}
 
-	TEST_FAIL("CPUID function 0x%x index 0x%x not found ", function, index);
-
 	return NULL;
 }
 
+const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
+					       u32 function, u32 index)
+{
+	const struct kvm_cpuid_entry2 *entry;
+
+	entry = __get_cpuid_entry(cpuid, function, index);
+	if (!entry)
+		TEST_FAIL("CPUID function 0x%x index 0x%x not found ", function, index);
+
+	return entry;
+}
+
 #define X86_HYPERCALL(inputs...)					\
 ({									\
 	u64 r;							\
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
new file mode 100644
index 000000000000..564144c40f0a
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "processor.h"
+#include "tdx/tdx_util.h"
+
+static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
+{
+	static struct kvm_tdx_capabilities *tdx_cap;
+	int nr_cpuid_configs = 4;
+	int rc = -1;
+	int i;
+
+	if (tdx_cap)
+		return tdx_cap;
+
+	do {
+		nr_cpuid_configs *= 2;
+
+		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
+					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
+		TEST_ASSERT(tdx_cap,
+			    "Could not allocate memory for tdx capability nr_cpuid_configs %d",
+			    nr_cpuid_configs);
+
+		tdx_cap->cpuid.nent = nr_cpuid_configs;
+		rc = __tdx_vm_ioctl(vm, KVM_TDX_CAPABILITIES, 0, tdx_cap, NULL);
+	} while (rc < 0 && errno == E2BIG);
+
+	TEST_ASSERT(rc == 0, "KVM_TDX_CAPABILITIES failed: %d %d",
+		    rc, errno);
+
+	pr_debug("tdx_cap: supported_attrs: 0x%016llx\n"
+		 "tdx_cap: supported_xfam 0x%016llx\n",
+		 tdx_cap->supported_attrs, tdx_cap->supported_xfam);
+
+	for (i = 0; i < tdx_cap->cpuid.nent; i++) {
+		const struct kvm_cpuid_entry2 *config = &tdx_cap->cpuid.entries[i];
+
+		pr_debug("cpuid config[%d]: leaf 0x%x sub_leaf 0x%x eax 0x%08x ebx 0x%08x ecx 0x%08x edx 0x%08x\n",
+			 i, config->function, config->index,
+			 config->eax, config->ebx, config->ecx, config->edx);
+	}
+
+	return tdx_cap;
+}
+
+/*
+ * For each CPUID leaf in @cpuid_data, filter out unsupported bits based on the
+ * capabilities reported by KVM.
+ */
+static void tdx_filter_cpuid(struct kvm_vm *vm,
+			     struct kvm_cpuid2 *cpuid_data)
+{
+	const struct kvm_tdx_capabilities *tdx_cap;
+	const struct kvm_cpuid_entry2 *config;
+	struct kvm_cpuid_entry2 *e;
+	int i;
+
+	tdx_cap = tdx_read_capabilities(vm);
+
+	i = 0;
+	while (i < cpuid_data->nent) {
+		e = cpuid_data->entries + i;
+		config = __get_cpuid_entry(&tdx_cap->cpuid, e->function, e->index);
+
+		if (!config) {
+			int left = cpuid_data->nent - i - 1;
+
+			if (left > 0)
+				memmove(cpuid_data->entries + i,
+					cpuid_data->entries + i + 1,
+					sizeof(*cpuid_data->entries) * left);
+			cpuid_data->nent--;
+			continue;
+		}
+
+		e->eax &= config->eax;
+		e->ebx &= config->ebx;
+		e->ecx &= config->ecx;
+		e->edx &= config->edx;
+
+		i++;
+	}
+}
+
+void tdx_init_vm(struct kvm_vm *vm)
+{
+	struct kvm_tdx_init_vm *init_vm;
+	const struct kvm_cpuid2 *tmp;
+
+	tmp = kvm_get_supported_cpuid();
+
+	init_vm = calloc(1, sizeof(*init_vm) +
+			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);
+	TEST_ASSERT(init_vm, "init_vm allocation failed");
+
+	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
+	init_vm->cpuid.padding = 0;
+	tdx_filter_cpuid(vm, &init_vm->cpuid);
+
+	/*
+	 * Set attributes and xfam to 0 to use KVM's baseline config, as KVM
+	 * automatically ORs in the mandatory fixed-1 bits during
+	 * KVM_TDX_INIT_VM.  Note, TDX_TD_ATTR_SEPT_VE_DISABLE is not required
+	 * because all initial private memory is pre-mapped before running the
+	 * TD.
+	 */
+	init_vm->attributes = 0;
+	init_vm->xfam = 0;
+
+	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);
+
+	free(init_vm);
+}

-- 
2.56.0.455.g6c5a503b38-goog

