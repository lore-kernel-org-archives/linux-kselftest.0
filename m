Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F43839A8
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 23:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405463; cv=none; b=aUpfUi4BWlvI97h6dvLwE0/J+6hh+CRRs2TVfLOu6qplVc1peylRD2peSlhfagnBSdZmN4ayxAJVBI48lT2khoJvEnyqIBX8mWzRTW54JtAqaId2v5USD4RAM0SrVdHSfcHjSTilFaKgLWNjKV6ec/ZWUTTUj3EVc2YoOUjXC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405463; c=relaxed/simple;
	bh=Od2lOEsB+1joQwPea9oDeM67Ytbja38l/nL7JwsRNZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YpyR/wfCr3J/CLMKqQO/7taWbR98n2LUQk4EOVc4EA/zrIt4LxiCwyLtrsJLNkJ9ej7GG4DgfWqvvcltDqSCkNEjYOakb/06I/XlGdq1Za/0imWWbXtqEzIjpM8zdq9xgKdqZt4lfT+B5/0z+6yPgzufhd/iMkrTCSFpz5CkNbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i6j9cvTl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i6j9cvTl"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bc6899bfb1so66928325ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405461; x=1780010261; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxNtZ3nKj+c0vNDjFbCr6nNPXT0j5Pj4bcLBD9UZU8U=;
        b=i6j9cvTlIpVZ75ohyqHEGGG39SuNqyLQiDcR4CnXiKGkRSQg4I/uxjirzbf4SK9LS9
         MaGv8I8eyl463pBTFgqmIT/RXHmJl5zzwYtVXIqsE9VMKR+0aQO6GPiM2ES4D8p3CHWJ
         tmSF4LjbPi3b4gZQBZAbiUWdV6HdOMzxuEVAKQUtYdSEM5P+m2GlivZ1CoZ7vMIWD6vv
         UqRPhwX6gQIPkc7ADbzKsZrquhmuzWbFhqbf8rFnsnpx9C14ywhw5ZJ8ON4PGtVjuikZ
         gs7ogebB65pldsS207YZcI/mr7cOIofCYGU7UM4qITQb4uN0d8mmg2UPo5gb/icXlHX2
         NZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405461; x=1780010261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxNtZ3nKj+c0vNDjFbCr6nNPXT0j5Pj4bcLBD9UZU8U=;
        b=FIEM3iHxztyetFDuuAmfK84i+H70QM3mGvHmuG+uZbKdvDgGHg2fv6LWoJYe2hCKUL
         PO+TZw4BF1+6h6S1r8sQ+fg5G2GdrCNqqRvuvY3z4v5Uo0YrJeCSZapB2oV0ALtIvLwJ
         3kyKeLichDWxWXo+ZHLgARFVBb5ss8GMpRX9aPOAqXLy8Fvs0Byq0/uaKftIwHWGighv
         w4+utuYPkZBowQQ0zBFgJ1un+wy2BzaTQv5dWhWdyKVbj3Qu6rAsLj8CSBxNOSgzTuey
         M6elAjXkstehH3dSRqXCI/isQnW2Z49eqyrLmtITzomMs+2ujzZUabKcy4mmZRRhoHP0
         smrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/z2JpuB0J936nESOtxPU1pqdbmBRtfmpDj3TkbForzJbPu6+2fQhjcxymCfQwC/eG7tb+ZHPl+C9kF8CjmzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMj7rv7k90uFk+hDFyT4o/B3whTWBSVouFwiLgQ2/HFpH+bI8v
	5XiHwzxuGu5zjcWV9VwiU2yY+KRn0xPCYV8etzXwiJ36IXRMyBvcVd/ba8bHTHUwqywYC2mJCmo
	Gcct2Kg==
X-Received: from plqu9.prod.google.com ([2002:a17:902:a609:b0:2b0:b92b:a3d4])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c2d:b0:2b2:42b1:adac
 with SMTP id d9443c01a7336-2beb031af0bmr8989535ad.3.1779405460627; Thu, 21
 May 2026 16:17:40 -0700 (PDT)
Date: Thu, 21 May 2026 23:17:01 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=3326;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=qKY0lUOWtUNSXm/BjfbVqcxYSXkTBg8RPVAzh6yLWOo=; b=URs8dDmehMo1VZSWbN0pSVPY7GbA8Y6Sq36hGYK3E3c4Fw+X0ABwEs/lMt9RCIeoSJ4rbvLg/
 ptdm67VksemAEuYL1YDN1BHiXI6arOr9eaQCLlRigsPiQKTFxDroQIl
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-20-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 20/22] KVM: selftests: Implement MMIO WRITE for the TDX VM
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

From: Erdem Aktas <erdemaktas@google.com>

Implement the tdx_mmio_write() to allow TDX VMs to request MMIO
emulation.

Follow the Intel Guest-Hypervisor Communication Interface (GHCI) spec
to the minimum extent that a spec-abiding TDX module will pass the
request to KVM. Skip implementing the #VE handler as described in the
GHCI spec so selftests will not take a dependency on having a working

To perform emulated I/O, VMs use the TDG.VP.VMCALL instruction to
request MMIO.

Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm          |  1 +
 tools/testing/selftests/kvm/include/x86/tdx/tdx.h | 16 ++++++++++++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx.c     | 30 +++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index a651a876c522..489324cecf83 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -33,6 +33,7 @@ LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
 LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/tdx/td_boot.S
+LIBKVM_x86 += lib/x86/tdx/tdx.c
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
new file mode 100644
index 000000000000..810ca7423c84
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTESTS_TDX_TDX_H
+#define SELFTESTS_TDX_TDX_H
+
+#include <linux/types.h>
+
+enum mmio_size {
+	MMIO_SIZE_1B = 1,
+	MMIO_SIZE_2B = 2,
+	MMIO_SIZE_4B = 4,
+	MMIO_SIZE_8B = 8
+};
+
+u64 tdx_mmio_write(u64 address, enum mmio_size size, u64 data_in);
+
+#endif // SELFTESTS_TDX_TDX_H
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.c
new file mode 100644
index 000000000000..f19be79fe11f
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "tdx/tdx.h"
+
+#define TDG_VP_VMCALL 0
+#define TDG_VP_VMCALL_VE_REQUEST_MMIO    48
+#define TDVMCALL_MMIO_WRITE		  1
+#define TDVMCALL_EXPOSE_REGS_MASK    0xFC00
+
+u64 tdx_mmio_write(u64 address, enum mmio_size size, u64 data_in)
+{
+	register u64 r10_reg asm("r10") = TDG_VP_VMCALL;
+	register u64 r11_reg asm("r11") = TDG_VP_VMCALL_VE_REQUEST_MMIO;
+	register u64 r12_reg asm("r12") = size;
+	register u64 r13_reg asm("r13") = TDVMCALL_MMIO_WRITE;
+	register u64 r14_reg asm("r14") = address;
+	register u64 r15_reg asm("r15") = data_in;
+	register u64 rax_reg asm("rax") = TDG_VP_VMCALL;
+	register u64 rcx_reg asm("rcx") = TDVMCALL_EXPOSE_REGS_MASK;
+
+	asm volatile(
+	 ".byte 0x66,0x0f,0x01,0xcc" /* tdcall */
+	 : "+r" (r10_reg), "+r" (r11_reg)
+	 : "r" (r12_reg), "r" (r13_reg), "r" (r14_reg), "r" (r15_reg),
+	   "r" (rax_reg), "r" (rcx_reg)
+	 : "cc", "memory"
+	);
+
+	return r10_reg;
+}

-- 
2.54.0.746.g67dd491aae-goog

