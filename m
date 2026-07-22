Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F4546A5FB
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762091; cv=none; b=sM8qihRQrGD40Q8TPzVjJiosIvJXNTLVbgvwCyXnjomc4MekbJUD5zplZnF+HYTqbkEjfFZt6mAhZeW5Pmka8b5Q0OMMlwH9dsCIyerfAZfzb2USKbaZzlja3gUczIuIPF9ty1daptdVjKK900f/uOFJzvxo2qT/Bacm5H3piV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762091; c=relaxed/simple;
	bh=dEFJJlMq+M70+N1PCE1cFxw7PDw8XLhakHATo+3TVD4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fq5u92PaDMVmE05+0JDRGJAu4GMXZTqi9jkjGwAoZVNCc1TbFe9xVRcp+c6jtVaY7CjqkN4yFwJS5nMe5NGZIGyohgH7VLB2UCC6TpkcQqixqFCAmp9xtWoOtb1Y9iy4a2x8BbzI1HBFEmumAseioPghGLppKWCMFHK8bnhWO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BDM+xns0; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BDM+xns0"
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4488f192768so14237454fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762088; x=1785366888; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQL53tF2PapsukUeczmauxGQFHV9sfmXX8XsuAYj+nY=;
        b=BDM+xns09XlhOIiDpiVU99Ew3G9y2Xu7TxUoaXH3ICVyxs0bkkNfx9VBMPL0yHk4vm
         CY3sAwfZcqkkbz+yaAJREYSxtjSbxT/TKqz6uffuAXAoez7Ee/kmNra2QhiyhKzN7MZS
         +8eTRe3J6E5wIqqzAMSelJo2SKZKMXfVyz0a3ATD+HaXkeIuGL2rE5Ae8WbU4CHP9xIg
         c7jfXLLbYJduz+XY4zma/TmnV9MThw4LeSFRbp24SSFSPw6MWgqPgdVQCtrdZeLa5KXA
         Au6zZ5Dcb+jYOOnyDtqLPj6o8qbBb1GwvIYr1MslW2eQq6ut2WJgQbx0LaD/CNB1yCFS
         njTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762088; x=1785366888;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQL53tF2PapsukUeczmauxGQFHV9sfmXX8XsuAYj+nY=;
        b=ObOX6t8AZ5HsQA2e+m61ZA79ab6nIBTSaR9SWwW8HgdZ1kmpHz3uK2fjymZIe7t0ih
         Hjp5Cd9GqjH1ybvAK83l0omQgLR6B1wP+gnQZueWdtJqm5cYNAva2q+1XJ78klK38lCY
         BYG7C+IdVApflwvJFWywakqruV88im39o6Q4IoHQMlYsGDznrYB7SlrJ02Cn7YPubL6B
         BemnGoQpkYwgTmt9Ifwj539NnXcuIYFDNE9q87/yWRofBxpgML4XMMuTpA9klXEWaAW4
         cQAsX+nNKvTiTdPNtCKrC/JDif6oh4uhFqv7PUDdGTPKqHMFFTDCK8yolJhKERVoIywH
         Q/7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoCvo+mG6IEw0P+jAhDJUwGLCGLa1d7ZhIVXRz6zVBqgB9Un0m1+FJ0oPZegZZ88uC0R3OcGcQ5F3odgPDf0XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhpiHE92JzAevGlSBocv3KsXf2nfvEtIYnLPdkgIEOW2Y+JMbf
	j4gLJhwlTDSPux7+XXdfSgkiglnTE+J8/gg1PotQkKLm+jsTu7DibewIREMykCxzZrMXCFDz6FB
	O0KTxZQ==
X-Received: from oadc16.prod.google.com ([2002:a05:6870:c090:b0:451:da82:f574])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e129:b0:452:213:bd4d
 with SMTP id 586e51a60fabf-457a0cae0d4mr345206fac.17.1784762088069; Wed, 22
 Jul 2026 16:14:48 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:27 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3221;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=EDghQmLRkXXdCFENRMd8Fjd6yIqXJ+ept626JTAjPb8=; b=Brj1pdenntimF95GU4mIRWuTYeHMRRoYGeKJxcMpZ6boC0+6awN7/2Vsf/FqnHss7Z8hMG5fA
 HmeqPWiE68mAKapW6mMKn64bx1KpJnalTsQNc5ntdpavRgpYtzUGPLb
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-22-15ad654a50db@google.com>
Subject: [PATCH v14 22/22] KVM: selftests: Add TDX lifecycle test
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

Adding a test to verify TDX lifecycle by creating a simple TDX VM.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../testing/selftests/kvm/include/x86/processor.h  |  1 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  5 ++++
 tools/testing/selftests/kvm/x86/tdx_vm_test.c      | 33 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 28b33ed8c2e6..3561f9284e6f 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -167,6 +167,7 @@ TEST_GEN_PROGS_x86 += rseq_test
 TEST_GEN_PROGS_x86 += steal_time
 TEST_GEN_PROGS_x86 += system_counter_offset_test
 TEST_GEN_PROGS_x86 += pre_fault_memory_test
+TEST_GEN_PROGS_x86 += x86/tdx_vm_test
 
 # Compiled outputs used by test targets
 TEST_GEN_PROGS_EXTENDED_x86 += x86/nx_huge_pages_test
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index ff3219edab44..fa112a1c1c84 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -372,6 +372,7 @@ static inline unsigned int x86_model(unsigned int eax)
 #define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
 #define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
 #define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+#define VM_SHAPE_TDX		VM_TYPE(KVM_X86_TDX_VM)
 
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 35f0b2b7ac40..9a882644a48d 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -11,6 +11,11 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 	return vm->type == KVM_X86_TDX_VM;
 }
 
+static inline bool is_tdx_supported(void)
+{
+	return !!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_TDX_VM));
+}
+
 /*
  * TDX ioctls
  * Use underscores to avoid collisions with struct member names.
diff --git a/tools/testing/selftests/kvm/x86/tdx_vm_test.c b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
new file mode 100644
index 000000000000..7cdcaf33b585
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "processor.h"
+#include "kvm_util.h"
+#include "tdx/tdx_util.h"
+#include "ucall_common.h"
+#include "kselftest_harness.h"
+
+static void guest_code_lifecycle(void)
+{
+	GUEST_DONE();
+}
+
+TEST(verify_td_lifecycle)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+
+	vm = vm_create_shape_with_one_vcpu(VM_SHAPE_TDX, &vcpu,
+					   guest_code_lifecycle);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_DONE);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char **argv)
+{
+	TEST_REQUIRE(is_tdx_supported());
+	return test_harness_run(argc, argv);
+}

-- 
2.55.0.229.g6434b31f56-goog

