Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459C83672A8
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 23:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405454; cv=none; b=eNq+kx0kLAulULBDemocStwkObUafsj7IPH82DOlVdPE7v7TqPLkjAsFMkuzj6KPfSwxnfKvgCZkUMlHhILKd4cbXI8LQhLGijFCLkTiPVQqWAV10RVcxrF6HNeg1A5eXlqH/BWKulrM4sycCFD9/ur4sMlvKp/kzi6hcJ8kKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405454; c=relaxed/simple;
	bh=K4hwKCmpJ4zUb3ehxRvkub2xtnkhXDMvgH5jB/vsl1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PtdjZ35OPyN2cZ86SSw6yRVCgVpkIqP89O1M38AuK/ebA5IfGqg1C830RXq16G/QUWFWzPLhRByD0o7m66YRwCtphc5hljcmEQt/qdi9q9zknn2fow6GEVhplm9aR+B/Dt+hW48Df5okDkfVSrWmVKqPhCFJ4IjHB5JFxR05fB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DleJw9WL; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DleJw9WL"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so110783865ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405452; x=1780010252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Mb2Ccx0ioc20txfzoV9w8p95E3FoUg+tKOAAuRRnXo=;
        b=DleJw9WLRq168ab2EQ5KOwirVq97j2bfUQIsiafFxrSAYMbGXC/3GDX3o6W6R0naRs
         Fn2RABciHrgnaJCTXIvaTSMeHSnOpf1bYGSMeFtzWTQI78C2TvidTc7GucezyBrtg+bu
         eparxOus0DAHmvd2kKG/6E94P01LiflHytLWGZ4yW6UdEjpZzk62XceE0yTEqdImp92M
         vp4mbrsyEua3fsCsAHMZ8K9uG175xps46y1yVk25ZrfZ5YShKMOT11/Lwufnr3aSS3GX
         ik3U48amWGt+46IYRsekiSJpyqE/Yrf0VBRRC26/LwHrhfqWkbDC3/nORD0Kc326q1ng
         lKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405452; x=1780010252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Mb2Ccx0ioc20txfzoV9w8p95E3FoUg+tKOAAuRRnXo=;
        b=J4Jp3k58HXz4MF6ad9p22JjkSY0CBHpVwis6EAh9AdqR3NdNiMf7NOxk4Wtv29DtLk
         2QVceuW0512dKYHsV2tlgLHdDHhbKlRsywQzZWHslqmqytmbTkO75b4Ghre7auKSrLQ5
         SMZEBNlYZ6l83LG+oaoqBYQztCiV7I+Q+Mj6Uq2LRELj+aRc34oSWW/VqY4uRKrLQii2
         UlccZ3Tt7VUAgqYWTUMEJLu3Dmm6mlSEgy+Rql68yql3dBZhU2qQuK5P7y90PSdGld8Z
         TyaLmYHebwGfGfYOZBdvaiOaaCleZshqmEMKsvlYeY2y7CS33NsNqjk4x3JbTKbSPgUk
         GZSw==
X-Forwarded-Encrypted: i=1; AFNElJ+/Xtyuv23oytjUJwR7fxElOO50Y1gVWS6ld7zGc8eo5+e6KSgsnJquGHRvdfTMo/XXMymByE9v+loyuukdkkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza35o6zUA7yYOxfTcyFY5UAKRIDA7B696TBrXW5qd8E0vFs1fm
	8ZRV6zbz04kdcht1h7LzJBsbN5n/3x571HsC+ZXYR0D1U+/SSjLtLoP9z27Y0X5g236b/L4VN8M
	G6QkkZQ==
X-Received: from plcc12.prod.google.com ([2002:a17:902:c1cc:b0:2b2:a715:a848])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2bce:b0:2b0:5923:5194
 with SMTP id d9443c01a7336-2beb0681ddbmr9498715ad.27.1779405451416; Thu, 21
 May 2026 16:17:31 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:51 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=5151;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=b9tZ2eI2lRz0fRhaZB+tVbmNYmqq3B0jyqSz9uqzwwI=; b=z5L6sCi2HJBAV+Spu447OzHYRIjWLjEJD2HklaJC01nxBnhf+hah3PbRgGzSwbN33qQH0Xh2V
 LQfkboQYzSuAD2WIgc90UcDKqWeY/nNbYuni672CV/gpOI26Jv3MKpj
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-10-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 10/22] KVM: selftests: Set up TDX boot code region
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

Add memory for TDX boot code in a separate memslot.

Use virt_map() to get identity map in this memory region to allow for
seamless transition from paging disabled to paging enabled code.

Copy the boot code into the memory region and set up the reset vector
at this point. While it's possible to separate the memory allocation and
boot code initialization into separate functions, having all the
calculations for memory size and offsets in one place simplifies the
code and avoids duplications.

Handcode the reset vector as suggested by Sean Christopherson.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c    |  4 +-
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 47 ++++++++++++++++++++++
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 929965ca4b75..a651a876c522 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -31,6 +31,7 @@ LIBKVM_x86 += lib/x86/sev.c
 LIBKVM_x86 += lib/x86/svm.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
+LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/tdx/td_boot.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 48d4bd36c35b..d66ea7bc85f9 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -40,5 +40,6 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 })
 
 void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
+void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 5027411665bf..dfabdfd17976 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -791,8 +791,10 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 		vm_sev_ioctl(vm, KVM_SEV_INIT2, &init);
 	}
 
-	if (is_tdx_vm(vm))
+	if (is_tdx_vm(vm)) {
 		tdx_init_vm(vm, 0);
+		tdx_vm_setup_boot_code_region(vm);
+	}
 
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
 	TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC frequency.");
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index e5c998874a0d..bbfaa9af9c60 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -2,8 +2,55 @@
 
 #include "kvm_util.h"
 #include "processor.h"
+#include "tdx/td_boot.h"
 #include "tdx/tdx_util.h"
 
+/* Arbitrarily selected to avoid overlaps with anything else */
+#define TD_BOOT_CODE_SLOT	20
+
+#define X86_RESET_VECTOR	0xfffffff0ul
+#define X86_RESET_VECTOR_SIZE	16
+
+void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
+{
+	size_t total_code_size = TD_BOOT_CODE_SIZE + X86_RESET_VECTOR_SIZE;
+	gpa_t boot_code_gpa = X86_RESET_VECTOR - TD_BOOT_CODE_SIZE;
+	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
+	size_t nr_pages = DIV_ROUND_UP(total_code_size, PAGE_SIZE);
+	gpa_t gpa;
+	u8 *hva;
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    alloc_gpa,
+				    TD_BOOT_CODE_SLOT, nr_pages,
+				    KVM_MEM_GUEST_MEMFD);
+
+	gpa = vm_phy_pages_alloc(vm, nr_pages, alloc_gpa, TD_BOOT_CODE_SLOT);
+	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc\n");
+
+	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
+	hva = addr_gpa2hva(vm, boot_code_gpa);
+	memcpy(hva, td_boot, TD_BOOT_CODE_SIZE);
+
+	hva += TD_BOOT_CODE_SIZE;
+	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
+		    "Expected RESET vector at hva 0x%lx, got %lx",
+		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
+
+	/*
+	 * Handcode "JMP rel8" at the RESET vector to jump back to the TD boot
+	 * code, as there are only 16 bytes at the RESET vector before RIP will
+	 * wrap back to zero.  Insert a trailing int3 so that the vCPU crashes
+	 * in case the JMP somehow falls through.  Note!  The target address is
+	 * relative to the end of the instruction!
+	 */
+	TEST_ASSERT(TD_BOOT_CODE_SIZE + 2 <= 128,
+		    "TD boot code not addressable by 'JMP rel8'");
+	hva[0] = 0xeb;
+	hva[1] = 256 - 2 - TD_BOOT_CODE_SIZE;
+	hva[2] = 0xcc;
+}
+
 static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	struct kvm_tdx_capabilities *tdx_cap = NULL;

-- 
2.54.0.746.g67dd491aae-goog

