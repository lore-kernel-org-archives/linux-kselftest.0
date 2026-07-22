Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3AB45D5F2
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762080; cv=none; b=jULWk3q6GpvlD8CLcKHr3nOxD87Aei1V3wuUhv8V89vAYZ0q+SSRAWZBApqQi3Wl9BkDFu8MT4vdF+g5SbhhK9tyXtbhJnpOAkbgCqmNOChbaxi4ExfZ+vZ/pZOZWvifuTI1NPNJjCfSl+KUfWo3s2iLRFMACOEz4SrCzquEggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762080; c=relaxed/simple;
	bh=J2jP33MsvXzcPyd71zMa34BP+SHntkFHO92tJSH/otQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzikJ29ZJ10mIa0pH0hxCdK0Ylv0H0lVRYk5Wp5HI/PMs8iUvL3mpYW3ih3lM28u1LiSz9lAeuEQGBNlGnMq3hN5NVfZEYAU/CgvkXVQxu5TsN9vw3HnNbIrDrAk5W/SwdfpGNlp0E+vYS9QiwD8p20fLa/xb9MsZqf7331ytSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=foecDQCp; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="foecDQCp"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso136397a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762078; x=1785366878; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OE9BObxgnpVBtB0susWSfoNAQmdWjz8VkVFbMsNsCVk=;
        b=foecDQCpaALgNr1xMmroZEUQ6VJH5GJFriLyTDXMHEI6REry4HNYgTYQdn3fRW+Gvi
         IGQ1Q99am0//xJVarzpihKuWw1IDMwhRllTtifL60FWKd9eBxydyoyl3L7OvWpZ28ouA
         /S3MAGUx0jp80A46JUhOXKvJzfnn+kcGDWsLgeF1ykxhhHB2ITAQfzo0A7fCZGxivUio
         +pPe6E0hE+9Ai5NV0gY1LpVcP51N8dw+bFQ8bkyF6MNkvKehpcevoCPSfT85gVQlJUJe
         XwViD+AvMmLSFm6edvBrlpp2amdWZMdrgjhmXNwPYSIhtGhMtIBRaN3FiVKh6e5o2aa6
         hP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762078; x=1785366878;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE9BObxgnpVBtB0susWSfoNAQmdWjz8VkVFbMsNsCVk=;
        b=KotkUFESaPo39MOnk6tM3BiJTZlQ4E1EPhjWhhPs2wBSub6taCa4bPHwbJkcYUZgtc
         pF8NskrVKqSlK4b7iRXyxYiqJ4jrx32SFobnkOjawwJzUgr4bHUAputuPXj9lVAZmcBL
         bUJHmxLku9IJWZYJX51JEvUFB7njzNm1v5gp9JmVLu3nC3Ae7jUytrCGit4/cAhCgDyS
         ExNihdz+4asy3RxI7bcjaS0TW1u6Zlf8iLM+BLojImXaM4S9In2IGas1BwSvTYfTcVOt
         uN3urod8Qi/D7E4/Q30mgzGRriYn/fyeatCuX96P7nmOdOrX9ezpUIOT9wQ7y9oXEzIR
         v6TA==
X-Forwarded-Encrypted: i=1; AHgh+RrpkdMOG2pq3E34i091Welp0/76qJFK+Lr02ijog3MPogKMZJn3Bez1V5bTS64bPHh6PcHdETrZE6417Kh3f/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnkn5UTi6NuRmZkXROEcp5C+ckq5E8ZBGA29NET7YO6PHeYYQ
	//79TSHvgkimK1L62lFrc/NHWbPfyv0e4TgGe2g8FpIVHGb8yLwA1yQMDXTZaVPzVBAY1xKUT/c
	YjVUzww==
X-Received: from pggh14.prod.google.com ([2002:a63:c00e:0:b0:c9e:142c:425e])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:748a:b0:3c3:bb13:438
 with SMTP id adf61e73a8af0-3c44b0504bcmr554799637.32.1784762077746; Wed, 22
 Jul 2026 16:14:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:25 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3161;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=LhPITB0/P3+C8fkpUXhj3CMOp+sdIRyRL+NpJnysUVU=; b=KwG/mq0dqAwUImRbDSEcbPFdl15WaqHL4VOTMgbqjf6a4Ej+o01Emqg1/da9WwWbbYyH6qqAZ
 KDHbmghfo96Bij8EdsXBK7NyAbD5HONradFoDKSUxowWKqebJozW8wK
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-20-15ad654a50db@google.com>
Subject: [PATCH v14 20/22] KVM: selftests: Implement MMIO WRITE for the TDX VM
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

From: Erdem Aktas <erdemaktas@google.com>

Implement the tdx_mmio_write() to allow TDX VMs to request MMIO
emulation.

Follow the Intel Guest-Hypervisor Communication Interface (GHCI) spec
to the minimum extent that a spec-abiding TDX module will pass the
request to KVM. Skip implementing the #VE handler as described in the
GHCI spec to reduce selftests dependency.

To perform emulated I/O, VMs use the TDG.VP.VMCALL instruction to
request MMIO.

Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm          |  1 +
 tools/testing/selftests/kvm/include/x86/tdx/tdx.h | 17 +++++++++++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx.S     | 37 +++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 645d9aac61db..28b33ed8c2e6 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -33,6 +33,7 @@ LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
 LIBKVM_x86 += lib/x86/tdx/td_boot.S
+LIBKVM_x86 += lib/x86/tdx/tdx.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
new file mode 100644
index 000000000000..6355a30bb47f
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_TDX_TDX_H
+#define SELFTEST_KVM_TDX_TDX_H
+
+#include <linux/types.h>
+
+#define TDG_VP_VMCALL_VE_REQUEST_MMIO    48
+#define TDVMCALL_MMIO_WRITE		  1
+
+u64 __tdcall(u64 leaf, u64 r12, u64 r13, u64 r14, u64 r15);
+
+static inline u64 tdx_mmio_write(u64 address, u32 size, u64 data_in)
+{
+	return __tdcall(TDG_VP_VMCALL_VE_REQUEST_MMIO, size,
+			TDVMCALL_MMIO_WRITE, address, data_in);
+}
+#endif /* SELFTEST_KVM_TDX_TDX_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
new file mode 100644
index 000000000000..dff48a3624a1
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+.globl __tdcall
+/*
+ * u64 __tdcall(u64 leaf, u64 r12, u64 r13, u64 r14, u64 r15)
+ */
+__tdcall:
+	push %r12
+	push %r13
+	push %r14
+	push %r15
+
+	/* Map C ABI fast arguments to TDX GHCI payload registers */
+	/* RDI=leaf, RSI=r12, RDX=r13, RCX=r14, R8=r15 */
+
+	mov %rdi, %r11
+	mov %rsi, %r12
+	mov %rdx, %r13
+	mov %rcx, %r14
+	mov %r8,  %r15
+
+	/* TDCALL boilerplate */
+	mov $0, %rax
+	mov $0xFC00, %rcx	/* Expose R10-R15 */
+	mov $0, %r10
+
+	/* tdcall instruction */
+	.byte 0x66, 0x0f, 0x01, 0xcc
+
+	/* Extract status */
+	mov %r10, %rax
+
+	pop %r15
+	pop %r14
+	pop %r13
+	pop %r12
+	ret

-- 
2.55.0.229.g6434b31f56-goog

