Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A554144F568
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883529; cv=none; b=W9HhBejf1rvvj1XLo/LCn4XDWOdYMw2zIcQ162XJWFFEWnv2Z0drs3s+N8y4rGUZzTHXtySlMC+hNQ4J+ILF35m6C+z5gURql6vMOb3LIgggM6Z6bh22Q5G3PS8Csyi/g9nCCiMdY4B+zLfz4AW9AeYLFjDve9lK7WWAKYf/15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883529; c=relaxed/simple;
	bh=zp0fCXEEXhwkdiJK13QWS3aC86M9pq8mXqRQKAIXcDw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WatuxANAx0TRkZOB/sOsW1Pg+HeWeWBKLt5IPDSnXxlhhc1ChiPvGFwObsoLCxzRfaisp8TUEpdckXr5PFJsu3g7pRChmmcHaAhtMzB4oe8AI8KXUPS0mX+cDn0hZHUgwUWXrUwTRZl8coQfYFm5lS5dD2uYxIw+Zy+/hkMkZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bra8MQFO; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bra8MQFO"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so7321847a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883526; x=1791488326; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/NoryhY8HfDhtfJWA4MzZfEK4rb7jcSVHQTgNWX/UM=;
        b=Bra8MQFO/FiTdmxFqkuw5u8AADlCNejLpXq/GO+MJWswmeuw0yqMCrgDdmQ2fukw7P
         N3dualua0bqpPNS9/yHcy3caXR7YdVK+StMYAJ+XRCTwcNzM9sSs8rSfUVbNJyTAMbeS
         pO6Dw3cspXZB5V8XKO22qbDta8Taiz/1B22875HN3CpYZjmgTMywu4aULpGE2D1+5WmT
         LNqOUEwyIUbloWso0Eh/QjkkE4TmrTJkgTvfalbZx75nC3M9S+uDvmjsfNFriSx2sC1Y
         CP4z3OkJ6PKRj0qJ/QNTLSOc50euKIHWy/xbPzDHxhu3177ARUNEcASSfKlz7S6C9yoI
         DOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883526; x=1791488326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/NoryhY8HfDhtfJWA4MzZfEK4rb7jcSVHQTgNWX/UM=;
        b=Jys5X2HmbQqlhDQ3mi+ToncNERqcnL7Vjdkgi/SSAlJ1xQXZLwAo/zbipKG5oIJ0kr
         jtGujP1CDAn3BzrCETEfVdLC7Io24Vb+S/H8ElaPRIfs/c8PhxlH5K4e7mSOzHlMnSZx
         1C01oQZQNqCTJNoy1jn7/zTPEEWiWnOmFkL19SjzWJdbgVRXTxerFaCCHdeQ8+ABmCHj
         46nF8xdmJ/jBo+6/KFfngyWNXqyoFducN4i83xKy5cqg2pWpyOdLNMSQeVhLvRNqkY/U
         Ptvn9H/yx1nh4h7cv6Pr5cCI00h06mD+jLINW76fkCFJkUOcqjZyYgohUyPYVj74+ACm
         xbJg==
X-Forwarded-Encrypted: i=1; AKwUvBwvNRiVPQmi6EoeyY4TX+hKKBX23DAVfXppBkAddWpK60jHsIwhKFFTM5iaKDTVp1OCc05Y+yCm7DQILX5ELZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw6GZT144pBXbpZ7wYWtcTpzeC18sL4uCDmLQzu3Qwb0vaBrSE
	OddJtpQruC12oZ1D80Ztb1QClGdG/T+tQAt+ia9Gs5NnqKCCNindHm8CQ2dKmp4OvVcBItL/Btm
	vqiDs7Q==
X-Received: from pjnq4.prod.google.com ([2002:a17:90a:8704:b0:3a6:c7ae:6dd9])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44c:b0:3a4:e013:8768
 with SMTP id 98e67ed59e1d1-3a6ceb1b22dmr485911a91.45.1790883525538; Thu, 01
 Oct 2026 12:38:45 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:31 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=1878;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=JAF4AonfKOce2MPkEm+6H47o5hzM1UYJCFnc5WFeYP8=; b=DztLG+OxqhK/sRaaOkaqQqgPibtyctWSl8J8kXdEMwYHg5RjZIo9FjVbn/6aPjylEB/+7+w3w
 kBaLg6DuipIDI6IBKsYm1AdVsAInVjZDqMT90f8ik2KB++RcTL156uM
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-4-7c62a5d8a992@google.com>
Subject: [PATCH v15 04/23] KVM: selftests: Expose segment definitions to
 assembly files
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

Extract kernel segment definitions into a separate header for assembly
files.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
new file mode 100644
index 000000000000..713b6bc0aeb7
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Used for storing defines used by both c and assembly code.
+ */
+#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
+#define SELFTEST_KVM_PROCESSOR_ASM_H
+
+#define KERNEL_CS	0x8
+#define KERNEL_DS	0x10
+#define KERNEL_TSS	0x18
+
+#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b87ba7d8538b..1944eb2489d8 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -8,6 +8,7 @@
 #include "kvm_util.h"
 #include "pmu.h"
 #include "processor.h"
+#include "processor_asm.h"
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
@@ -18,10 +19,6 @@
 #define NUM_INTERRUPTS 256
 #endif
 
-#define KERNEL_CS	0x8
-#define KERNEL_DS	0x10
-#define KERNEL_TSS	0x18
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

