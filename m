Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922477;
	b=sBA4Fwy0Z58fRr6plBWFEpmdngZxPJIcMkLsrN/05o0VYDS2BcC6vAk+SIkd/ccJqZMI
	 W3YnxCF7IFxyaz2kgnL9czX1C0TI6fyDZ81/8LZNWHuZqc6xb3HvhaQ8Z6pr6sTai7qbU
	 /Nf/T13OaiCrEbvyQR3QD4gN9/dYAx4E8EjOkFnH96ae64wVouEUXiC63J0/rAEStBHlH
	 zKw7du+nSTUswr1UVnxoAO96oMENhmpIKBoULI6uDnypmwQiuRQZYe/fsKyyqIc8D7dDH
	 A2NYbuL0cclExcJ1ur57/LV6LkE3WYLY7NQeOK9bjikffEWSFJqEfZUJ3CQhSAGiqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LEEA2Tm4kPEuiFuwPm6vN9ZoPvkNTxKJCKru87/Ki1Y=;
	b=g+vPt2JafBDiP5wqULBGuPpNWNBDF2k4xCedjt/5U8NDR/uoBV6XDUiRpTFIu8xmEQpg
	 4KYjn8EYD2ZRQbIP+OaaJGKOZgpgnAgHQ2oVqjOZ9MZpr6UNkhW7Dtih7w0qpgCwsMhRz
	 AA524bR4SCUrJf8Jq3PQT/pQ8wX/crlY02z/eKFhCY5qTHyil1CGVrP2hU44h3vyauBqa
	 F3ZNiFfMI/44lkRNoaJxFFsFbAIXnDgmb5Y/E3dDJBvD37Dek02UBkvrfkqwxFAS0sGkB
	 D9hQbBa2n2Goty/y+7R8SvLaeDt3rMFFel9il2q88DvYNBOurVa0k3IvXHMr3ijw18w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mkBDJPnB;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4E606D839
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF4E606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mkBDJPnB
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adad90c894so108203a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922477; x=1794527277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEEA2Tm4kPEuiFuwPm6vN9ZoPvkNTxKJCKru87/Ki1Y=;
        b=mkBDJPnBpOJI7ZDHZ/cokPtxysCsyUsPC+CEi3TMzsQdSEL3aY8+epwkW5mNfiSki1
         e3qpVaCtWJc0QwQelZ69DrbxtExBsz+i33uiLdGM8zHOjj7ce4LOTXTEhB4W8dD0OU8q
         Nj1sslqEzmpMWJ0W91ReP7ac2RPN8f8oikM8NJjSD/4ZAB0HpxX7dQ9/rrVSm2xIIJsm
         PkBhERn3pkBdd04ux5FfZ+t474l/kX6amyalyQenAKxTRK0zE03eALcjjcvVhEGh3VBX
         Zjhwyz1SSlAGmfw2FXrfhI+T0VhvTXwkHev7Ne6Zfa+ETw1IdLwX22mBAlkO0RFsDSHu
         Xupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922477; x=1794527277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEEA2Tm4kPEuiFuwPm6vN9ZoPvkNTxKJCKru87/Ki1Y=;
        b=0q9yVXRWoHgtY551BQZ43YxMMPdeESGz9+MwYzxLIPzTt2AiK9K0k93O5U3CPCeWAE
         hhHmqg06KxyFengzfQxBUxJia/xq9hxmCEsIhjpQMZruP3/zq5FX/fcDxYgngX91rNc0
         k2NmPUqO4+3eQVbtLM4OLNIb5p3noeiCVCG3nmqhTp/9/0Oalf1d1jTK6SiuU+IXE4XJ
         s/lz8Li1IGUFSXlvHia4kq5+JRyPFxrk5bh7Mm/7Q8l1BZctd8/Hqm1t01t9bwEo/FTy
         6O0Awz255Osxx2fD5CQDT82EOCCJjhzR3cuu0QaEyf+Qvv2EyhXPdczUUeQRnD0X0HP1
         MMsw==
X-Forwarded-Encrypted: i=1; AKwUvBwWv2pEIBFGMuUG2WhLF8bYFUOpeD87Xb6XSJ//kky1Kf8IZWzvUbhCfGmsJCQv40+TIwnwGeGdywejLMGv1gY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0aW3r4zvbRCfDeAUc4+mgJ7DkaY6OyQv+n4ux0hT0z0CEC11e
	4Q69ECVV8WkTLzMjcDnuTBjBVg186eQS3vJSPKKkM6UI505j2dVO0Malsj6nCV0msOa9f0R+V3T
	lKLKgzA==
X-Received: from pjbkl7.prod.google.com ([2002:a17:90b:4987:b0:3b0:98dd:7ee1])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a10:b0:3b0:a38a:6715
 with SMTP id 98e67ed59e1d1-3b0db7109dfmr651139a91.59.1793922476377; Thu, 05
 Nov 2026 15:47:56 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:59 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=4183;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=1fvLyz4z13NOla+r1Hs/PHs9uu0rmBs1fjzBUkzz5ls=; b=URFC8RL1z2/ZNFCgOd5qDDtoX2nyoFhNLaevMBRotwPmJ5vC3rmXdQQwK9H2ZBcga0vYT5Ufu
 8WbXpQfFQ8iAhgNsNuFnDerSLmV+oaqLomuf/g5u2c9ub0IXp/b6CX+
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-15-2024e8fa517a@google.com>
Subject: [PATCH v16 15/20] KVM: selftests: Add helpers to init TDX memory and
 finalize VM
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

From: Ackerley Tng <ackerleytng@google.com>

TDX protected memory needs to be measured and encrypted before it can be
used by the guest. Introduce tdx_load_private_memory() to traverse the
VM's memory regions and initialize all protected ranges by calling
KVM_TDX_INIT_MEM_REGION.

Once all initial private memory is initialized, the VM can be finalized
by calling tdx_vm_finalize(), which invokes KVM_TDX_FINALIZE_VM.

Co-developed-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  3 ++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 61 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 1cc876891589..67e717521409 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -74,4 +74,7 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_init(struct kvm_vcpu *vcpu);
 void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
+void tdx_load_private_memory(struct kvm_vm *vm);
+void tdx_vm_finalize(struct kvm_vm *vm);
+
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 324f3c41aa61..ea40bd51530d 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/align.h>
 #include <linux/sizes.h>
 
 #include "processor.h"
@@ -237,3 +238,63 @@ void tdx_init_vm(struct kvm_vm *vm)
 
 	free(init_vm);
 }
+
+static void tdx_init_mem_region(struct kvm_vm *vm, void *source_pages,
+				u64 gpa, u64 size)
+{
+	u32 flags = KVM_TDX_MEASURE_MEMORY_REGION;
+	struct kvm_tdx_init_mem_region mem_region = {
+		.source_addr = (u64)source_pages,
+		.gpa = gpa,
+		.nr_pages = size / PAGE_SIZE,
+	};
+	struct kvm_vcpu *vcpu;
+
+	vcpu = list_first_entry_or_null(&vm->vcpus, struct kvm_vcpu, list);
+
+	TEST_ASSERT(size && IS_ALIGNED(size, PAGE_SIZE),
+		    "Cannot add partial pages to the guest memory.");
+	TEST_ASSERT(IS_ALIGNED((u64)source_pages, PAGE_SIZE),
+		    "Source memory buffer is not page aligned");
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_MEM_REGION, flags, &mem_region);
+}
+
+void tdx_load_private_memory(struct kvm_vm *vm)
+{
+	struct userspace_mem_region *region;
+	int ctr;
+
+	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node) {
+		const struct sparsebit *protected_pages = region->protected_phy_pages;
+		const gpa_t gpa_base = region->region.guest_phys_addr;
+		const u64 hva_base = region->region.userspace_addr;
+		const sparsebit_idx_t lowest_page_in_region = gpa_base >> vm->page_shift;
+		void *source_pages = NULL;
+		sparsebit_idx_t i, j;
+
+		if (!sparsebit_any_set(protected_pages))
+			continue;
+
+		TEST_ASSERT(region->region.guest_memfd != -1,
+			    "TD private memory must be backed by guest_memfd");
+
+		sparsebit_for_each_set_range(protected_pages, i, j) {
+			const u64 size_to_load = (j - i + 1) * vm->page_size;
+			const u64 offset =
+				(i - lowest_page_in_region) * vm->page_size;
+			const u64 hva = hva_base + offset;
+			const u64 gpa = gpa_base + offset;
+
+			if (!kvm_has_gmem_attributes)
+				source_pages = (void *)hva;
+
+			vm_mem_set_private(vm, gpa, size_to_load);
+			tdx_init_mem_region(vm, source_pages, gpa, size_to_load);
+		}
+	}
+}
+
+void tdx_vm_finalize(struct kvm_vm *vm)
+{
+	tdx_vm_ioctl(vm, KVM_TDX_FINALIZE_VM, 0, NULL);
+}

-- 
2.56.0.455.g6c5a503b38-goog

