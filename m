Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922460;
	b=s/0D+F2FtV5rKtBI6NkEZr54W5xwvy1VUfY51AMDuET5Hm45J6H177O2IjY9w+8uIcvD
	 W6isFlRUNVhrQrFIbCmQrJ4+byCKvRwqMpQ99LWWfdF4waIqr0bMvpsFgUc2602Rh3L+j
	 QoKPsFVwI4JeGR/7LBg8u0Z0nj6oS/deRldt43iedHU8L4anGWQLqYO08hmIuPZsu+ykK
	 LYt2x1PBL2J0pHoX1WIiDoj1ljrinPbEBgCRwSDZtW3sEubnBYpgMFpAcBMNMNG9669lc
	 f2TQ0Z1GSzhKXptrpokTiWMgtUQ3J+3vrfoyUyOOEcyoPg696Z5OJxUmLwyA0D4FGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BIvq2twJN7ywQe2MXD0v3BY55Do1zzPrR1ch4dMWy9w=;
	b=nFeh7n+ykpiGlN+quTcyOFi2aeBVPw+3q0TjxycTt50r7YtiSuFMGNpYV86shJGlnoDp
	 x1wctc7ToTVscIxY/0X6hTBRuCOXc5blkLPm8Di6Xpn2NeaJ12f6zL3OQUCVn9B+RRAOk
	 09AhsgpIgQy9cPfcMbJhVAETaqbuE7Qsn3qNFbdz/BK0S2MZl3afFOlbGjzg7hJkbIdwo
	 mlkhKwuVBt9dycdnfQIOgw1iNbV++n2YarML2+1UU6/VejlanZ05nd6AWKy8yjY54I2f9
	 ZVlrWHtER2Bjl9C3K3VDxDS8oJXsaGUzxt/lIM504dwQmNiu+XKRXc3PsLmaacUgbvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=owVufQMv;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8B606D836
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED8B606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=owVufQMv
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9d52f684fso549365ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922460; x=1794527260; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIvq2twJN7ywQe2MXD0v3BY55Do1zzPrR1ch4dMWy9w=;
        b=owVufQMvvvHMU90pHDkFNdyjZ/nfGZPOUorK/Sqwt6BZKD8Q1eUdu9NFGHyQZibA4C
         vvqflENo0lFoGGsaFV+q1jK+5T7IzcUZzMLmyfCSbaCNxOrNxnVRe8tUy8zIpsPix1Qj
         2bABdLbnYtQ0GMvmdO+KW/Of9BbjuISbhfTi1yUQw4CJPLPT2hNo0WEpIlmBNRBXi0bP
         TRYBILZqnkib7FWOiJxAUJ2YC/wAdWfcv+3/KlZA1yYJndOHgnoeEB4HzJRXG1Oofalw
         gBGOlwWuyKryeXTxzGxsAfrwjoSOHxTZg5jCkpbE7S+AlE06zmxpRKbn/eauirxI8wdf
         E2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922460; x=1794527260;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIvq2twJN7ywQe2MXD0v3BY55Do1zzPrR1ch4dMWy9w=;
        b=uLxtlfE8cjLbkNiCr0SY32Cptjx/y5ugsyatIQu88AK2tHHlSfybsoI4zLOGEzZ91C
         FVeL4xaX5fCQ+xTNmH4jrq3cBmZ/IA7vdUUmqUu4SUZQDU4fgm2Yq89pYFf2cVtWQqa9
         1LJId8z9+2N8s3MuEtVmMJY+rbhciQZOGAEg1lxLZzAK9SLES9a1iOjYeuPFVzIIStJF
         J8nOFf+ZgscXlXtPZ4YRif0C7yFWuJzxpfJKlJkQvGn5lN1CosAYxPfnXZkUN08PKuf2
         D6T7qnSOYhhnaUDPg1jTUrMl4a22mt44NkdmnS19OwIelmyCieL6uZobfEMGgELFXuhT
         6Fgw==
X-Forwarded-Encrypted: i=1; AKwUvBx0L2mCQxQRykBaIfMYSggIx23sNChcPVSTdphBR6K8A2Bndk8QFp9n+GXRG5TkbNnwX63xZ4tz/ZtSXoeWdGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RX6LyRgYlG7L2JTkd7qDIWkj1ZmOlSRsNRsYp8VQHKeeWTLL5
	+taSx9fFGqQBOVVslS42X3VAeC13aAz0tKFp+e9NeW+rMv1pRG7Kls0GNLpQ8HX3a0+eCGjECMA
	svvuggw==
X-Received: from pjk15.prod.google.com ([2002:a17:90b:558f:b0:3b0:af53:d7ce])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acc:b0:3b0:cc3e:68b5
 with SMTP id 98e67ed59e1d1-3b0db69fde7mr616588a91.21.1793922459423; Thu, 05
 Nov 2026 15:47:39 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:51 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=4800;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=9w4aCd0NJSPoyyt+QfxGA+enh5/AVF2bSD9/TlOuiaQ=; b=u/9rCWq7ncDRc0kMmnOkJgVvLA07LRTuPZsOwR5b1g7BldqLm7GLjbWOjCIDaWB77MhLJ7Vac
 NveXnQo43UqBB0cpeXiPF/KofVlik6em0VtUS1XoUlAATpXtCTJUv7U
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-7-2024e8fa517a@google.com>
Subject: [PATCH v16 07/20] KVM: selftests: Add TDX boot code
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

From: Erdem Aktas <erdemaktas@google.com>

Add code to boot a TDX test VM. Since TDX registers are inaccessible to
KVM, the boot code loads the relevant values from memory into the
registers before jumping to the guest code.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../selftests/kvm/include/x86/tdx/td_boot.h        | 21 ++++++-
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  | 65 ++++++++++++++++++++++
 3 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 08031ab1825b..5136f49c502b 100644
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
index bf2282931d49..577e7b23c51c 100644
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
+#ifndef __ASSEMBLER__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
 
 /*
  * The exact memory layout for LGDT or LIDT instructions.
@@ -63,4 +72,10 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
+extern u8 td_boot[], td_boot_code_end[];
+
+#define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
+
+#endif /* #ifndef __ASSEMBLER__ */
+
 #endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
new file mode 100644
index 000000000000..726ec51e040e
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -0,0 +1,65 @@
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
+	 * Paging is turned off.
+	 *
+	 * Register usage throughout td_boot:
+	 * ebx: Address of global boot parameters (Must be preserved)
+	 * eax: Address of per-vCPU parameters (Must be preserved)
+	 * edi, edx: Temporary scratch registers
+	 */
+	cli
+
+	movl $TD_BOOT_PARAMETERS_GPA, %ebx
+
+	/*
+	 * Find the address of struct td_per_vcpu_parameters for this
+	 * vCPU based on esi (TDX spec: initialized with vCPU id). Put
+	 * struct address into eax for indirect addressing.
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
+	 * Set up control registers (x86 does not support moving memory
+	 * directly to a control register).
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
2.56.0.455.g6c5a503b38-goog

