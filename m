Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922463;
	b=np5yXDePE1kpjvNLHmNPqEtpro/Q9z/Rj7zJY2DX2SeVDiRHArlAekySnp6G4pI0xXGe
	 j7UhXo42kn9mo1Ll67/cuC9OzgfHVF/PGMqAZWlC0YfxcikITcvXJToPvm/s3AWpjT82V
	 mQ6lNRSA0FM+AkcP2+/oEPfuUalrnLCZYUkYfZqJYMKvnzNJm712MZ/jOAruixn0OEvwi
	 ABE3g0BIICSuEsWEVwzhjDza2q+SN08qF9JDiZo/et1A5sXi0inpnKPF6wRr8b3Yftucx
	 M5tTHCV1GjieU+ck7QvvE0SuCi0I5dQL59aaPa9Xbla7WGaCCshhYx2UJAIxe0keSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=x/RKRDin2OptMojaeCsUiaSs9Kk46RnHWwkRmbHSsgw=;
	b=MtDYNloJOAoxBDY3YKBQsElPYlye/OjY/qWgbDLdbGysQmI0exE7pm8RyJRUAZ6sq5My
	 yMiZZaGMLpbPbw3+RCtQe3GjqcvAUikjKk4HRfIG1W5/Jjc0/nK/Kggk/LjOyn9+uUOJj
	 0qFWMVZILsRz9KDr7EzsLo02CA7rYchpDIn29tAKsXJv59XfTtGnljjDGlQWWJOVOQAUw
	 k02LgQe/mGW3KkGeQrN0qdvWlIJwsxfktO/7KQG+nG7PujSQQoSFqq1J0c9pBx4s77WX8
	 /yERJrY7T9iWfpRkSmYKBf5yaBFsyXFzTsl8b+jMUfgjfB1RTx/gq4O4U+B8JGlqoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L6n7bzpW;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE9606EE9A
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBE9606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L6n7bzpW
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so74513a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922462; x=1794527262; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/RKRDin2OptMojaeCsUiaSs9Kk46RnHWwkRmbHSsgw=;
        b=L6n7bzpWcfZVSFAQs0JDAT4gtSFfVu3c0zFD0jIUJdSPXjVqoe7FXPJwO6vXqiTkeo
         s7LNsuqr+YSzNvs7Njjsn7jiQx83hnNSe0e65ulqRXeXRfBynjwYZm3Oi2BxcCzWgtZo
         6cLiI+dKWwJJgYjXw7vcugiHKR0eUvKOkxojeXGu7LoS+waUQvnvHrE1B2LwoKCvbyty
         Hl8Jx1dfKSyV+awoRd04HOf3RmPzIa2Ak4Y8oMULO4IKFgvVHME97MdffKN5BaneI8Q6
         4MDW9Gupmz0q5AJDa+oEw6ro/YUqpsUTZsaRImErs2Mk+Kj7RMjQLXKrIms+8GxEMCJL
         woVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922462; x=1794527262;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/RKRDin2OptMojaeCsUiaSs9Kk46RnHWwkRmbHSsgw=;
        b=Hl+0+UyE+CRwt42l3RQhztKQFBaMcOTr/LWOTn9J8wKv6hHhSHZf4xxKdM2c97Zt3q
         J2Aw7DnaONpQ15o4c2xWk47lQRWXthcJN1CT8IShI2xTfA9FggOO40yXIqftWRds/g56
         20Z4tTEIxSgtx17VBR36T5QqMbbO4oQinnfyq4yXLl8vdNiky6Z7Niu9TI65urK5Py0M
         OqDBiGGUFNepHiPNkq5CEX19WGXuT33xE+kljOckvCAJRg9ZDI8XEx9pL0dVhhVYFgY3
         gVMafZl5SLiiZIEZEJE6T8baAx8B2F444fq/52/R7kKbNDixherpFDVBnA+C+/LZBl0X
         XkVg==
X-Forwarded-Encrypted: i=1; AKwUvBzVDDXcXtb7Bl9Njd7hZGP5bJ+8eaMNGmEwUkNC8VhmQCY7kEiN7XaA9kxmBpX/wNbu02sAsF+R70uV+RphbLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kQRzWLHi5hVsWeqp89x9rNae9MQeWgnHPUF7J3K1cpKpHW1kg
	OARCZH25OvemuIewXBBbkpbV3vCZp0Gv0RYGUj+PJGvbBH9Ea1ywnnajK+4X/TK9iYiMs0+MCHf
	+1kN+KA==
X-Received: from pgdo3-n1.prod.google.com ([2002:a05:6a02:6203:10b0:cca:c02e:bfd6])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e95:b0:3e4:b458:5239
 with SMTP id adf61e73a8af0-3ebb2a24b3dmr1114411637.45.1793922461520; Thu, 05
 Nov 2026 15:47:41 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:53 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=5511;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=fyaOP4udR9+MT2Tk1b6aFON/Dhf2LGDor7nYKiUbRYs=; b=sCJHaKCV+jtAxAEHWQg4Va9n6Zt7Kf9a3pdCEp2bZPJyYse5oeR8d9GsFM6j1ZQHO7iLG20k1
 xXviMGo4M3PDZM5M7oVekKE118j994Hb8ukewnlO8WWY6HvLirV/sCk
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
Subject: [PATCH v16 09/20] KVM: selftests: Set up TDX boot code region
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Because the reset vector is located just 16 bytes below the 4GB
boundary, there is not enough space to fit the entire TDX boot code. To
solve this, insert a small trampoline at the reset vector that jumps to
the actual boot code.

Place the boot code immediately in front of the trampoline. Because they
are contiguous, they can be copied and mapped with a single operation.

Use virt_map() to create an identity map in this memory region to allow
for seamless transition from paging-disabled to paging-enabled code.

Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../selftests/kvm/include/x86/tdx/td_boot.h        |  2 +-
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c    |  4 ++-
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  |  6 ++++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 38 ++++++++++++++++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
index 577e7b23c51c..8f47a3893f59 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -72,7 +72,7 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
-extern u8 td_boot[], td_boot_code_end[];
+extern u8 td_boot[], td_boot_code_end[], td_boot_reset_vector_trampoline[];
 
 #define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f76489ffb48d..43b4157e4a13 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -47,5 +47,6 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 })
 
 void tdx_init_vm(struct kvm_vm *vm);
+void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b8dbb16d5a28..36003cfd8d6a 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -825,8 +825,10 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 		vm_sev_ioctl(vm, KVM_SEV_INIT2, &init);
 	}
 
-	if (is_tdx_vm(vm))
+	if (is_tdx_vm(vm)) {
 		tdx_init_vm(vm);
+		tdx_vm_setup_boot_code_region(vm);
+	}
 
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
 	TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC frequency.");
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
index 726ec51e040e..a04011b91ae4 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -56,6 +56,12 @@ td_boot:
 	ljmp $(KERNEL_CS),$1f
 1:
 	jmp *TD_PER_VCPU_PARAMETERS_GUEST_CODE(%eax)
+	int3
+
+.globl td_boot_reset_vector_trampoline
+td_boot_reset_vector_trampoline:
+	jmp td_boot
+	int3
 
 /* Leave marker so size of td_boot code can be computed. */
 .globl td_boot_code_end
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 564144c40f0a..b4a7089b3636 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -1,8 +1,46 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/sizes.h>
+
 #include "processor.h"
+#include "tdx/td_boot.h"
 #include "tdx/tdx_util.h"
 
+/* Arbitrarily selected to avoid overlaps with anything else */
+#define TD_BOOT_CODE_SLOT	20
+
+#define X86_RESET_VECTOR	0xfffffff0ul
+
+void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
+{
+	const size_t total_size = TD_BOOT_CODE_SIZE;
+	const size_t boot_code_size = td_boot_reset_vector_trampoline - td_boot;
+	const gpa_t boot_code_gpa = X86_RESET_VECTOR - boot_code_size;
+	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
+	size_t nr_pages = (SZ_4G - alloc_gpa) / PAGE_SIZE;
+	u64 gmem_flags = 0;
+	gpa_t gpa;
+	u8 *hva;
+
+	if (kvm_has_gmem_attributes)
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
+	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
+		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
+
+	gpa = ____vm_phy_pages_alloc(vm, nr_pages, alloc_gpa,
+				     TD_BOOT_CODE_SLOT, true, false);
+	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc");
+
+	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
+	hva = addr_gpa2hva(vm, boot_code_gpa);
+	memcpy(hva, td_boot, total_size);
+
+	hva += boot_code_size;
+	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
+		    "Expected RESET vector at hva 0x%lx, got %lx",
+		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.455.g6c5a503b38-goog

