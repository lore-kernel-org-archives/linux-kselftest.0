Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922456;
	b=EtUhE1VfsEMgysDP9jNWKJBss95P94k9cAtzM1l8cYlD/1qV3U0y4vAyWYFxtO3ejE7d
	 fOuaV281pA6ULjc3DcgJCdGHWpJpsNFWYoIjmBSuLltsUecgAjOLqUC4knBOnO1b99Q/i
	 P6PlYgSmMp/Bxx4XJsmuS89qfZHDp9eSnaEt2rclUw2INq8Lps8T4oBWgNshlSHBKknuB
	 +QjG4p19H6Fb54IyB9voAmv0sBOvbqHpsKO6tUUYiDyj5ks1UE5ylgIIuW7Gi8QajVFfZ
	 K3+974bN9wJTd9H0L0sXjLXr6I1OTB6h3/OyTu2FIARSGJur/B5Hj+UTC1EuumtS1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HSVxAxPHxLWJb+QPPocaz3W4kDp/YO8WZ+4Cex73wUQ=;
	b=N1tocaxSUXlrIttnswWkKbbc3geUkCl3qvuln3DbTCqJETYUjT/LmUfPCosRGke1TOyO
	 DKbrhyKytA6O/3amcw8BnVnY8HeyxuewWiRUNRCD1P35k+y1XGNpiNbGrgVt6nYt5UP0w
	 w9jH1p+a8ibxRTenzUqHUBpnkV0JcnLzf8PZw51jrXS7DMBUYALJXf+/pn2Kcmo4rybAx
	 kzbR8OVZejNIR02EqNLWW+nw0SDpgnSd9Aa3OchFwDmWqhduQFXGjBTibpyu+ZM8N6E+k
	 6wIRNiHny/NF5fCrB6FmHeGOfFs9c0tcCdXkBCFtUDeX9LbmnxERJ+peZWlRU9JjhZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="d+5tXgr/";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B9606A33D
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33B9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d+5tXgr/
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so92815a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922455; x=1794527255; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSVxAxPHxLWJb+QPPocaz3W4kDp/YO8WZ+4Cex73wUQ=;
        b=d+5tXgr/pwbnJE/4WlePeztTsJz7ADyEAjtrGCSdBBBNcbk1cX8jnol/CPK32N9rGL
         mHKkV+c4+FwDgokVCUeUitMj9A8Q1qR0+eEYu0jzMGuwuKOkSVj/HOn43j+KZVKByyDM
         ezI2J2qRtJxS16fg+TdYrf1Eph8Ba9qtuHsYq9qpW66lsWokesoowkhnc1b4Y8MY128X
         7sqhQKSAQYYQagKNje3ucoul+NnMlfOKINgjl60ScGJ30Z2iXHxZ5ruf/Jh9Vob01ffK
         NpIc7lOR0y1VFJXSJnwCGUjzqV9TGjMY38ywnZhg2OIB3H3YLqnBHzv/GP6gNDoVgQv7
         G5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922455; x=1794527255;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSVxAxPHxLWJb+QPPocaz3W4kDp/YO8WZ+4Cex73wUQ=;
        b=CGgFOMp3RujvaNEyCcIjRLCR32L4t5pbj7PZDSdjOt6npfgnRUJNlNMdjbd1p8LTZM
         RSUxQhv09N4aH/JNT8509Vbi7YdpOeTfmz628iorqDLHqygPn97/+blPg40GY6/ITEvV
         UTMLyFGyo2VUuT9RQqFgp2xqkn0HNqBU6ea174tJ4xOf460RWdKBG4eimXzJNq/kt2o4
         J2NEsGi1brM3SzIwcJ8jTG4KwQhudVmEuy3VkSS9C1suNAjmVpOxO6EeJDDtO/UoEa7b
         f3J2kVStkX8NZSNpIMW5sl+Qqp3gVlmZPOYyYaf/10kPBcz6QOSH5B7gm30FpQmNIsDZ
         0lgA==
X-Forwarded-Encrypted: i=1; AKwUvBwcZ+CfCxpyPyzprDztm6IrKlfscWLsDhVMlRgZ8KHVkjI1lSVacAcHpPGTP99EjUm1zWjvtgQLzt+FOg6Q3ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mz5e8gLWdQqlqqt2Ez8T9kDSwxDN8LPTLnXqvGCiEB5RlkdOM
	xReAjfuX6YuqEeHr6H8/Wu4Zxuwzl7u1IAWsUh04fFF0Bj2OMAUCN/AIdshOepESzExYR4Lv48a
	2xd6PPQ==
X-Received: from pgdu12.prod.google.com ([2002:a05:6a02:2f4c:b0:cdb:58e2:7cb7])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8f:b0:3a0:b312:1fbe
 with SMTP id 98e67ed59e1d1-3b0db6c99a4mr578689a91.23.1793922454815; Thu, 05
 Nov 2026 15:47:34 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:46 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=2831;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=TsmjAstaSjFYixQhUYbJbOkD7vAXJprj3EzMr2Dw2cA=; b=v+qqqNmrw6MMK/e1gCj/lL1NXgXSnN2daUTFtgMasIYlyr9pv1EkxsDPEdCOygMDueOA2GoPI
 lOq7jE2xRQNDXan3XM0CV7U61a7ubrgmr7yreT7TB9VfkU0sqfxfFEr
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
Subject: [PATCH v16 02/20] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
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
	Adrian Hunter <adrian.hunter@intel.com>, Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Isaku Yamahata <isaku.yamahata@intel.com>

Initialize the TDX S-bit and the GPA tag mask in
kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
is initialized for SEV VMs.

The TDX S-bit is used to distinguish between shared and private guest
physical addresses. Its position is determined by the guest physical
address width, which is either 48 or 52 bits for current TDX
implementations.

Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h | 14 ++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c        | 12 ++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
new file mode 100644
index 000000000000..f647e6ca6b34
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTESTS_TDX_TDX_UTIL_H
+#define SELFTESTS_TDX_TDX_UTIL_H
+
+#include <stdbool.h>
+
+#include "kvm_util.h"
+
+static inline bool is_tdx_vm(struct kvm_vm *vm)
+{
+	return vm->type == KVM_X86_TDX_VM;
+}
+
+#endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 8374afd08baf..d705e9269a41 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -11,6 +11,7 @@
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
+#include "tdx/tdx_util.h"
 #include "vmx.h"
 
 #ifndef NUM_INTERRUPTS
@@ -1337,12 +1338,19 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 
 void kvm_init_vm_address_properties(struct kvm_vm *vm)
 {
+	u32 gpa_bits = kvm_cpu_property(X86_PROPERTY_GUEST_MAX_PHY_ADDR);
+
+	vm->arch.sev_fd = -1;
+
 	if (is_sev_vm(vm)) {
 		vm->arch.sev_fd = open_sev_dev_path_or_exit();
 		vm->arch.c_bit = BIT_ULL(this_cpu_property(X86_PROPERTY_SEV_C_BIT));
 		vm->gpa_tag_mask = vm->arch.c_bit;
-	} else {
-		vm->arch.sev_fd = -1;
+	} else if (is_tdx_vm(vm)) {
+		TEST_ASSERT(gpa_bits == 48 || gpa_bits == 52,
+			    "TDX: bad X86_PROPERTY_GUEST_MAX_PHY_ADDR value: %u", gpa_bits);
+		vm->arch.s_bit = BIT_ULL(gpa_bits - 1);
+		vm->gpa_tag_mask = vm->arch.s_bit;
 	}
 }
 

-- 
2.56.0.455.g6c5a503b38-goog

