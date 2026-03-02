Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E8B2E1722;
	Mon,  2 Mar 2026 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492377; cv=none; b=GURLgaxACD+0c5adG2OCTsxlLm9QJx74NZ2pgXUngRRgXrMblyFjm/JIgh72XAT+paZwh6sD2JUTsTz5kwoHVMZxph6QucmP8fVnOL/k6H6E0opzjH5ogfNcTLHj5ONfcNlP6IVfwhMnQ2oM7CyKIQfOH+y4bexYXRhobonWSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492377; c=relaxed/simple;
	bh=Yklx4zEo9cXGREGB2xC+IAAlfxMNB8VGv2zZDAGKwno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKotLLtMdgWxYmOjBk4N7+YG+YWAtLvmnuGPVdwd2D01uQisOXB8l9y7Z5tQ/hyTViLbSPgUFCtOTWMKRN7bFDz26Nc9k99AeHmU8a6l2hX4eBe02DJq+JJjHsEUt+bni4Atd1B3urcwzFKApO8eEts/498q5GnqWowoP1UbZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOUkhSVG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOUkhSVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94264C2BC9E;
	Mon,  2 Mar 2026 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492377;
	bh=Yklx4zEo9cXGREGB2xC+IAAlfxMNB8VGv2zZDAGKwno=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GOUkhSVGhp7WkkZoniEyCCz5f7v8CexC5qsFUUYzjDDGEAWS7vF1ij/hsC9i1F+Y4
	 ezDqyL4I0m/kfyEas44iM4OGuI3vTf9d77lHsqZ221oE/mQbfhnS+If6C036C101UH
	 HLhxo7Rv6qPrBQT5AISpAW1R4qkAlnGsjY/IKVRbgtKZ8ecKEsfjdYL75db+PVCaz6
	 yBLf/Wo0n2De4maZfvu/bmyMRAl0BpbI4HqfUDu5gY++7nDZMBeowFIZImBsDpbqK+
	 Q6wTSG3IBRUU6iMefcHsUWfsAwTYJmw0CzbT/QI6oZ3HsvreOP13ft3AMELSvSH8n7
	 9dJfzY7SZGlqQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:16 +0000
Subject: [PATCH 1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions
 for the hwcaps
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-1-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9808; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Yklx4zEo9cXGREGB2xC+IAAlfxMNB8VGv2zZDAGKwno=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZPqxeGaYiC9IZG1hRWASmJi6jcQJvsfbk6S
 1s1VlSeRNiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWTwAKCRAk1otyXVSH
 0D+qB/9FksFK8vWAamBu1Xg0yzT23NllAD1NsQF9cS61ka8QUj0cCPNPDH8LMVq0r5rFf8J++7h
 phJzbDfiAT5XFJs9JhBfBqDZODX+20lJ80rUZrTGgz568RDireVWBFm73MM1853dj/IWgMmqdi6
 yQItwOj0FNzD3QeDmZPblBLGLDfF5Duk71KMd+JX0pXFQwgXaoTF4cgnw4xAi2rFKBnTmGI69I/
 zmCegdnIFB7h8mxllmFlyiN4iO98N7r0ib89JaGMb8uGubcRdxxclGMeLiZ1RbQI1HHWwW01JJl
 Y4mNoVnKm6vhbYj5JCXFBBYE3CoovKQMJsWBSQ7NQFJGdsku
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently for each hwcap we define both the HWCAPn_NAME definition which is
exposed to userspace and a kernel internal KERNEL_HWCAP_NAME definition
which we use internally. This is tedious and repetitive, instead use a
script to generate the KERNEL_HWCAP_ definitions from the UAPI definitions.

No functional changes intended.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/hwcap.h        | 120 +---------------------------------
 arch/arm64/tools/Makefile             |   8 ++-
 arch/arm64/tools/gen-kernel-hwcaps.sh |  23 +++++++
 3 files changed, 32 insertions(+), 119 deletions(-)

diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 72ea4bda79f3..abe8218b2325 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -60,126 +60,10 @@
  * of KERNEL_HWCAP_{feature}.
  */
 #define __khwcap_feature(x)		const_ilog2(HWCAP_ ## x)
-#define KERNEL_HWCAP_FP			__khwcap_feature(FP)
-#define KERNEL_HWCAP_ASIMD		__khwcap_feature(ASIMD)
-#define KERNEL_HWCAP_EVTSTRM		__khwcap_feature(EVTSTRM)
-#define KERNEL_HWCAP_AES		__khwcap_feature(AES)
-#define KERNEL_HWCAP_PMULL		__khwcap_feature(PMULL)
-#define KERNEL_HWCAP_SHA1		__khwcap_feature(SHA1)
-#define KERNEL_HWCAP_SHA2		__khwcap_feature(SHA2)
-#define KERNEL_HWCAP_CRC32		__khwcap_feature(CRC32)
-#define KERNEL_HWCAP_ATOMICS		__khwcap_feature(ATOMICS)
-#define KERNEL_HWCAP_FPHP		__khwcap_feature(FPHP)
-#define KERNEL_HWCAP_ASIMDHP		__khwcap_feature(ASIMDHP)
-#define KERNEL_HWCAP_CPUID		__khwcap_feature(CPUID)
-#define KERNEL_HWCAP_ASIMDRDM		__khwcap_feature(ASIMDRDM)
-#define KERNEL_HWCAP_JSCVT		__khwcap_feature(JSCVT)
-#define KERNEL_HWCAP_FCMA		__khwcap_feature(FCMA)
-#define KERNEL_HWCAP_LRCPC		__khwcap_feature(LRCPC)
-#define KERNEL_HWCAP_DCPOP		__khwcap_feature(DCPOP)
-#define KERNEL_HWCAP_SHA3		__khwcap_feature(SHA3)
-#define KERNEL_HWCAP_SM3		__khwcap_feature(SM3)
-#define KERNEL_HWCAP_SM4		__khwcap_feature(SM4)
-#define KERNEL_HWCAP_ASIMDDP		__khwcap_feature(ASIMDDP)
-#define KERNEL_HWCAP_SHA512		__khwcap_feature(SHA512)
-#define KERNEL_HWCAP_SVE		__khwcap_feature(SVE)
-#define KERNEL_HWCAP_ASIMDFHM		__khwcap_feature(ASIMDFHM)
-#define KERNEL_HWCAP_DIT		__khwcap_feature(DIT)
-#define KERNEL_HWCAP_USCAT		__khwcap_feature(USCAT)
-#define KERNEL_HWCAP_ILRCPC		__khwcap_feature(ILRCPC)
-#define KERNEL_HWCAP_FLAGM		__khwcap_feature(FLAGM)
-#define KERNEL_HWCAP_SSBS		__khwcap_feature(SSBS)
-#define KERNEL_HWCAP_SB			__khwcap_feature(SB)
-#define KERNEL_HWCAP_PACA		__khwcap_feature(PACA)
-#define KERNEL_HWCAP_PACG		__khwcap_feature(PACG)
-#define KERNEL_HWCAP_GCS		__khwcap_feature(GCS)
-#define KERNEL_HWCAP_CMPBR		__khwcap_feature(CMPBR)
-#define KERNEL_HWCAP_FPRCVT		__khwcap_feature(FPRCVT)
-#define KERNEL_HWCAP_F8MM8		__khwcap_feature(F8MM8)
-#define KERNEL_HWCAP_F8MM4		__khwcap_feature(F8MM4)
-#define KERNEL_HWCAP_SVE_F16MM		__khwcap_feature(SVE_F16MM)
-#define KERNEL_HWCAP_SVE_ELTPERM	__khwcap_feature(SVE_ELTPERM)
-#define KERNEL_HWCAP_SVE_AES2		__khwcap_feature(SVE_AES2)
-#define KERNEL_HWCAP_SVE_BFSCALE	__khwcap_feature(SVE_BFSCALE)
-#define KERNEL_HWCAP_SVE2P2		__khwcap_feature(SVE2P2)
-#define KERNEL_HWCAP_SME2P2		__khwcap_feature(SME2P2)
-#define KERNEL_HWCAP_SME_SBITPERM	__khwcap_feature(SME_SBITPERM)
-#define KERNEL_HWCAP_SME_AES		__khwcap_feature(SME_AES)
-#define KERNEL_HWCAP_SME_SFEXPA		__khwcap_feature(SME_SFEXPA)
-#define KERNEL_HWCAP_SME_STMOP		__khwcap_feature(SME_STMOP)
-#define KERNEL_HWCAP_SME_SMOP4		__khwcap_feature(SME_SMOP4)
-
 #define __khwcap2_feature(x)		(const_ilog2(HWCAP2_ ## x) + 64)
-#define KERNEL_HWCAP_DCPODP		__khwcap2_feature(DCPODP)
-#define KERNEL_HWCAP_SVE2		__khwcap2_feature(SVE2)
-#define KERNEL_HWCAP_SVEAES		__khwcap2_feature(SVEAES)
-#define KERNEL_HWCAP_SVEPMULL		__khwcap2_feature(SVEPMULL)
-#define KERNEL_HWCAP_SVEBITPERM		__khwcap2_feature(SVEBITPERM)
-#define KERNEL_HWCAP_SVESHA3		__khwcap2_feature(SVESHA3)
-#define KERNEL_HWCAP_SVESM4		__khwcap2_feature(SVESM4)
-#define KERNEL_HWCAP_FLAGM2		__khwcap2_feature(FLAGM2)
-#define KERNEL_HWCAP_FRINT		__khwcap2_feature(FRINT)
-#define KERNEL_HWCAP_SVEI8MM		__khwcap2_feature(SVEI8MM)
-#define KERNEL_HWCAP_SVEF32MM		__khwcap2_feature(SVEF32MM)
-#define KERNEL_HWCAP_SVEF64MM		__khwcap2_feature(SVEF64MM)
-#define KERNEL_HWCAP_SVEBF16		__khwcap2_feature(SVEBF16)
-#define KERNEL_HWCAP_I8MM		__khwcap2_feature(I8MM)
-#define KERNEL_HWCAP_BF16		__khwcap2_feature(BF16)
-#define KERNEL_HWCAP_DGH		__khwcap2_feature(DGH)
-#define KERNEL_HWCAP_RNG		__khwcap2_feature(RNG)
-#define KERNEL_HWCAP_BTI		__khwcap2_feature(BTI)
-#define KERNEL_HWCAP_MTE		__khwcap2_feature(MTE)
-#define KERNEL_HWCAP_ECV		__khwcap2_feature(ECV)
-#define KERNEL_HWCAP_AFP		__khwcap2_feature(AFP)
-#define KERNEL_HWCAP_RPRES		__khwcap2_feature(RPRES)
-#define KERNEL_HWCAP_MTE3		__khwcap2_feature(MTE3)
-#define KERNEL_HWCAP_SME		__khwcap2_feature(SME)
-#define KERNEL_HWCAP_SME_I16I64		__khwcap2_feature(SME_I16I64)
-#define KERNEL_HWCAP_SME_F64F64		__khwcap2_feature(SME_F64F64)
-#define KERNEL_HWCAP_SME_I8I32		__khwcap2_feature(SME_I8I32)
-#define KERNEL_HWCAP_SME_F16F32		__khwcap2_feature(SME_F16F32)
-#define KERNEL_HWCAP_SME_B16F32		__khwcap2_feature(SME_B16F32)
-#define KERNEL_HWCAP_SME_F32F32		__khwcap2_feature(SME_F32F32)
-#define KERNEL_HWCAP_SME_FA64		__khwcap2_feature(SME_FA64)
-#define KERNEL_HWCAP_WFXT		__khwcap2_feature(WFXT)
-#define KERNEL_HWCAP_EBF16		__khwcap2_feature(EBF16)
-#define KERNEL_HWCAP_SVE_EBF16		__khwcap2_feature(SVE_EBF16)
-#define KERNEL_HWCAP_CSSC		__khwcap2_feature(CSSC)
-#define KERNEL_HWCAP_RPRFM		__khwcap2_feature(RPRFM)
-#define KERNEL_HWCAP_SVE2P1		__khwcap2_feature(SVE2P1)
-#define KERNEL_HWCAP_SME2		__khwcap2_feature(SME2)
-#define KERNEL_HWCAP_SME2P1		__khwcap2_feature(SME2P1)
-#define KERNEL_HWCAP_SME_I16I32		__khwcap2_feature(SME_I16I32)
-#define KERNEL_HWCAP_SME_BI32I32	__khwcap2_feature(SME_BI32I32)
-#define KERNEL_HWCAP_SME_B16B16		__khwcap2_feature(SME_B16B16)
-#define KERNEL_HWCAP_SME_F16F16		__khwcap2_feature(SME_F16F16)
-#define KERNEL_HWCAP_MOPS		__khwcap2_feature(MOPS)
-#define KERNEL_HWCAP_HBC		__khwcap2_feature(HBC)
-#define KERNEL_HWCAP_SVE_B16B16		__khwcap2_feature(SVE_B16B16)
-#define KERNEL_HWCAP_LRCPC3		__khwcap2_feature(LRCPC3)
-#define KERNEL_HWCAP_LSE128		__khwcap2_feature(LSE128)
-#define KERNEL_HWCAP_FPMR		__khwcap2_feature(FPMR)
-#define KERNEL_HWCAP_LUT		__khwcap2_feature(LUT)
-#define KERNEL_HWCAP_FAMINMAX		__khwcap2_feature(FAMINMAX)
-#define KERNEL_HWCAP_F8CVT		__khwcap2_feature(F8CVT)
-#define KERNEL_HWCAP_F8FMA		__khwcap2_feature(F8FMA)
-#define KERNEL_HWCAP_F8DP4		__khwcap2_feature(F8DP4)
-#define KERNEL_HWCAP_F8DP2		__khwcap2_feature(F8DP2)
-#define KERNEL_HWCAP_F8E4M3		__khwcap2_feature(F8E4M3)
-#define KERNEL_HWCAP_F8E5M2		__khwcap2_feature(F8E5M2)
-#define KERNEL_HWCAP_SME_LUTV2		__khwcap2_feature(SME_LUTV2)
-#define KERNEL_HWCAP_SME_F8F16		__khwcap2_feature(SME_F8F16)
-#define KERNEL_HWCAP_SME_F8F32		__khwcap2_feature(SME_F8F32)
-#define KERNEL_HWCAP_SME_SF8FMA		__khwcap2_feature(SME_SF8FMA)
-#define KERNEL_HWCAP_SME_SF8DP4		__khwcap2_feature(SME_SF8DP4)
-#define KERNEL_HWCAP_SME_SF8DP2		__khwcap2_feature(SME_SF8DP2)
-#define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
-
 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
-#define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
-#define KERNEL_HWCAP_MTE_STORE_ONLY	__khwcap3_feature(MTE_STORE_ONLY)
-#define KERNEL_HWCAP_LSFE		__khwcap3_feature(LSFE)
-#define KERNEL_HWCAP_LS64		__khwcap3_feature(LS64)
+
+#include "asm/kernel-hwcap.h"
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/tools/Makefile b/arch/arm64/tools/Makefile
index c2b34e761006..a94b3d9caad6 100644
--- a/arch/arm64/tools/Makefile
+++ b/arch/arm64/tools/Makefile
@@ -3,7 +3,7 @@
 gen := arch/$(ARCH)/include/generated
 kapi := $(gen)/asm
 
-kapisyshdr-y := cpucap-defs.h sysreg-defs.h
+kapisyshdr-y := cpucap-defs.h kernel-hwcap.h sysreg-defs.h
 
 kapi-hdrs-y := $(addprefix $(kapi)/, $(kapisyshdr-y))
 
@@ -18,11 +18,17 @@ kapi:   $(kapi-hdrs-y)
 quiet_cmd_gen_cpucaps = GEN     $@
       cmd_gen_cpucaps = mkdir -p $(dir $@); $(AWK) -f $(real-prereqs) > $@
 
+quiet_cmd_gen_kernel_hwcap = GEN     $@
+      cmd_gen_kernel_hwcap = mkdir -p $(dir $@); /bin/sh -e $(real-prereqs) > $@
+
 quiet_cmd_gen_sysreg = GEN     $@
       cmd_gen_sysreg = mkdir -p $(dir $@); $(AWK) -f $(real-prereqs) > $@
 
 $(kapi)/cpucap-defs.h: $(src)/gen-cpucaps.awk $(src)/cpucaps FORCE
 	$(call if_changed,gen_cpucaps)
 
+$(kapi)/kernel-hwcap.h: $(src)/gen-kernel-hwcaps.sh $(srctree)/arch/arm64/include/uapi/asm/hwcap.h FORCE
+	$(call if_changed,gen_kernel_hwcap)
+
 $(kapi)/sysreg-defs.h: $(src)/gen-sysreg.awk $(src)/sysreg FORCE
 	$(call if_changed,gen_sysreg)
diff --git a/arch/arm64/tools/gen-kernel-hwcaps.sh b/arch/arm64/tools/gen-kernel-hwcaps.sh
new file mode 100644
index 000000000000..e7cdcf428d91
--- /dev/null
+++ b/arch/arm64/tools/gen-kernel-hwcaps.sh
@@ -0,0 +1,23 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+#
+# gen-kernel-hwcap.sh - Generate kernel internal hwcap.h definitions
+#
+# Copyright 2026 Arm, Ltd.
+
+if [ "$1" = "" ]; then
+	echo "$0: no filename specified"
+	exit 1
+fi
+
+echo "#ifndef __ASM_KERNEL_HWCAPS_H"
+echo "#define __ASM_KERNEL_HWCAPS_H"
+echo ""
+echo "/* Generated file - do not edit */"
+echo ""
+
+grep -E '^#define HWCAP[0-9]*_[A-Z0-9_]+' $1 | \
+	sed 's/.*HWCAP\([0-9]*\)_\([A-Z0-9_]\+\).*/#define KERNEL_HWCAP_\2\t__khwcap\1_feature(\2)/'
+
+echo ""
+echo "#endif /* __ASM_KERNEL_HWCAPS_H */"

-- 
2.47.3

