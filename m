Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40FE45D5F5
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762067; cv=none; b=sFGKlBwOsr6ugK849PrmXSvvxT5Yr79cCVLqBxw7M5ta2okZJaLp5eGF8WiE08AkQTDizvJ7ZHRzVX4bOiYmohSSNUarRBVEq2BUX321VCY9csiUsQHpVCxAm2+uwe/18Tph13jZJa7ln58J/UHgooCgKwYKPSsdrZEAHWvqZdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762067; c=relaxed/simple;
	bh=2nZtselLGRQA+iGH9lWqBntxKtAC+MyMjj+0gP5igAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YDsmD7m6rfDVyOiWGtziCIVA+y6z7yd9qJhxX9NnvedKStYwfkBqZfodrU2akrfWdFSxq7/G81BkNXGFfTH2dCbtkWHXFpxbP8i3hZIfWoWsw2+YJCBbwR5SbUIBGU2iqY0ft6PvgvhmthA4Ab4++XoL/UW4/XDVOwU/A1p7J50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kPJq7J+s; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kPJq7J+s"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso568245ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762064; x=1785366864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHjIow7FRD/o8g9hVMX5NwnfmgyNmUnSSABYjO98n7Y=;
        b=kPJq7J+sxIMSOzmcu7SgGsNP1k+B6WrpwIme1+k1C7ercWnma2ugL7Ggl6aqOu6OAC
         Oxkh42+sXEzqC5eQKau9pirjlTYsLwEnbRlpcwwQAS9LeQjqVRTSOtlHYg5T4Kn/iVOE
         Q1IheUY7ed7RZGtVZ1TzOHuxF3gzRY4XYZg8hdBfzEQidGMtU/EAUwYwcDdSYBMqnetE
         bc+S/+vcKBTaBnDJ8eXHLPXPPqZsECVX2bp7uPMkpbp3JL2ETtaxnNzDIz+5wqW7c6xS
         FBnDYKiyAGq6SH9aDVJDPZHlKfGUqSqEpl/SZjmHwrvc7qRCvljQ6qbRtS+My/MPG+pk
         RdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762064; x=1785366864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHjIow7FRD/o8g9hVMX5NwnfmgyNmUnSSABYjO98n7Y=;
        b=mEkJ04oh+EXJ28oGfchuxkV70InWWsHB1Z6Xvro2DQA9SlzHyUjewAnlIJZKkRHjDk
         dcBeoCdAvU2naT33h72JqHrJ98Was6fG63DiU5ZN3MVYAGj8fKmXiCrdZ9ed6QYCS5gC
         YZLnsSal9DmGen8kFKKNEjjB29SvCvu9TGth7YGR26onqLpw0pg4lP3jK4IjMukS3oem
         daW1uMTl1DBO2ihrY4pW/rICOS7c5zW6Y1RDge/H/tjY3gD10yLTKSQx/6m81XP9OMPN
         kGRShc9gykKdDJl97H09zr65QFxFBKlIsT8o5P9EaQkBgxG9xLvbdoqQwxD8hSrDEbZu
         cw4g==
X-Forwarded-Encrypted: i=1; AHgh+Rospl9H7y72au5idajKgx0VAY0rz969mTMR4Zbo/1pwqhddK/tL3VIgWRF53rZ+b2pJYEyCC8fXwAaX4dQ080g=@vger.kernel.org
X-Gm-Message-State: AOJu0YynClMKQer49hZgecKUSNqLinfxRt+CcFn+KcmEMqZeDvxPp4G5
	r7UQ8qAo8TqJluCgC7a0MId2tc40YNN5xYuhhHO9W71R2OKq93mu9nMKvdSVMML5frWMNY+XW6q
	KAoAOMg==
X-Received: from plpo3.prod.google.com ([2002:a17:903:3e03:b0:2ca:b8f5:2d26])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f681:b0:2c9:cf5d:d9bc
 with SMTP id d9443c01a7336-2cfa74b13famr9003555ad.35.1784762064085; Wed, 22
 Jul 2026 16:14:24 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:13 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=4661;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=nkYYec/Kj5J9dGXmWp9KVDsgzg3Lhpo8ptfotZieFvo=; b=9nFbAkjgrBrpCjn1Htarcq44COVIT6r0M3Rh5Jfk4tBIFtZ1wfV4g+2qidhFCsL4BlNEev3HK
 Api70IZ2v1/C4QZZOUqpmTSCmkTjRWxdeF7Q51i0ohVbAV/vVczBAXO
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-8-15ad654a50db@google.com>
Subject: [PATCH v14 08/22] KVM: selftests: Add TDX boot code
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

Add code to boot a TDX test VM. Since TDX registers are inaccessible to
KVM, the boot code loads the relevant values from memory into the
registers before jumping to the guest code.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../selftests/kvm/include/x86/tdx/td_boot.h        | 22 ++++++--
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  | 61 ++++++++++++++++++++++
 3 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 397afebbb34b..645d9aac61db 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -32,6 +32,7 @@ LIBKVM_x86 += lib/x86/svm.c
 LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
+LIBKVM_x86 += lib/x86/tdx/td_boot.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
index bf2282931d49..89cf6c3485be 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -2,9 +2,6 @@
 #ifndef SELFTEST_TDX_TD_BOOT_H
 #define SELFTEST_TDX_TD_BOOT_H
 
-#include <linux/compiler.h>
-#include <linux/types.h>
-
 /*
  * Layout for boot section (not to scale)
  *
@@ -24,7 +21,19 @@
  * |                           |
  * |                           |
  * |___________________________|____ 0x0_ffff_0000: TD_BOOT_PARAMETERS_GPA
+ *
+ * TD_BOOT_PARAMETERS_GPA is arbitrarily chosen to
+ *
+ * + be within the 4GB address space
+ * + provide enough contiguous memory for the struct td_boot_parameters such
+ *   that there is one struct td_per_vcpu_parameters for KVM_MAX_VCPUS
  */
+#define TD_BOOT_PARAMETERS_GPA 0xffff0000
+
+#if !defined(__ASSEMBLY__) && !defined(__ASSEMBLER__)
+
+#include <linux/compiler.h>
+#include <linux/types.h>
 
 /*
  * The exact memory layout for LGDT or LIDT instructions.
@@ -63,4 +72,11 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
+void td_boot(void);
+void td_boot_code_end(void);
+
+#define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
+
+#endif /* !defined(__ASSEMBLY__) && !defined(__ASSEMBLER__) */
+
 #endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
new file mode 100644
index 000000000000..bca9a4c3d8f8
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include "tdx/td_boot.h"
+#include "tdx/td_boot_offsets.h"
+#include "processor_asm.h"
+
+.code32
+
+.globl td_boot
+td_boot:
+	/*
+	 * In this procedure, edi is used as a temporary register.
+	 * Paging is turned off.
+	 */
+	cli
+
+	movl $TD_BOOT_PARAMETERS_GPA, %ebx
+
+	/*
+	 * Find the address of struct td_per_vcpu_parameters for this
+	 * vCPU based on esi (TDX spec: initialized with vCPU id). Put
+	 * struct address into register for indirect addressing.
+	 */
+	movl $SIZEOF_TD_PER_VCPU_PARAMETERS, %eax
+	mul %esi
+	leal TD_BOOT_PARAMETERS_PER_VCPU(%ebx), %edi
+	addl %edi, %eax
+
+	/* Setup stack. */
+	movl TD_PER_VCPU_PARAMETERS_ESP_GVA(%eax), %esp
+
+	/* Setup GDT. */
+	leal TD_BOOT_PARAMETERS_GDT(%ebx), %edi
+	lgdt (%edi)
+
+	/* Setup IDT. */
+	leal TD_BOOT_PARAMETERS_IDT(%ebx), %edi
+	lidt (%edi)
+
+	/*
+	 * Set up control registers (There are no instructions to mov from
+	 * memory to control registers, hence use edi as a scratch register).
+	 */
+	movl TD_BOOT_PARAMETERS_CR4(%ebx), %edi
+	movl %edi, %cr4
+	movl TD_BOOT_PARAMETERS_CR3(%ebx), %edi
+	movl %edi, %cr3
+	movl TD_BOOT_PARAMETERS_CR0(%ebx), %edi
+	movl %edi, %cr0
+
+	/* Switching to 64bit mode after ljmp and then jump to guest code */
+	ljmp $(KERNEL_CS),$1f
+1:
+	jmp *TD_PER_VCPU_PARAMETERS_GUEST_CODE(%eax)
+
+/* Leave marker so size of td_boot code can be computed. */
+.globl td_boot_code_end
+td_boot_code_end:
+
+/* Disable executable stack. */
+.section .note.GNU-stack,"",%progbits

-- 
2.55.0.229.g6434b31f56-goog

