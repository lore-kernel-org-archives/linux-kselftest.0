Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924E36CE1E;
	Mon, 18 May 2026 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116931; cv=none; b=Y+hUl60LOoo5cXiO5BmHhQoq0Jl0v+Mt4rN0FPqAlaugrB3uM2fiWGi5VnfyJWAFXJ/D7zOHyP47MRWlb0Nh8o3MR5B9YGA1+fcB0M//Xm86KM+G4pEImF9oUstFo1ciB8rgM4QHe/z1V+Wd9oKlWtDrpNCboBkiAlZthGVHIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116931; c=relaxed/simple;
	bh=tAFkrfa2Y/nfuLCUXO0TqhAEz2ryyE7xUymG4Ewvevc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHD1lvVPdEKzip0BjrVIPEOSpit6dxXjXiqk6WgcCrOXa1x8h66CAplj1JsO9iiYDU7OpegavR0EIKG0AmfL28Yd2eUv1NSo4PcADUOnVwJypWJeiUCGHR6RTAALP4/EMKtHTeTvf4WOv0nQM8GDHJO7pJlO21QYlWDmB1h0Y0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHseVqbm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHseVqbm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321FCC2BCFA;
	Mon, 18 May 2026 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116930;
	bh=tAFkrfa2Y/nfuLCUXO0TqhAEz2ryyE7xUymG4Ewvevc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HHseVqbmaVaBmurCVCWaI+yeTOgTzOahUiKpEO/ldtMJX9jQoyfdHzIkpxXJdbEqA
	 fZZAOdlCf30BdHEvW99/hMVN+78Z22UnBLsilytx6vZEfvgHAQyBy/sBZ/6HMfB/df
	 C2TkDsoFmKUt4TWolgrPUZo6xkE1XDy4Xkrr+qv3WLAO1WtX3yJ0lH9GirnXQDavRD
	 gHdQ5kBh1Jhto5JgdHtV0UbdQ0mkxLo4PNHxruAN5aTYs4UP/ZkRPljb7Gb0+Z35QF
	 yQowgWTAK29LG2lfMAZ4itJgD4x77F87kfpw0C3lEVYiHhjFmdhzxEj5SIsoDnQ3vJ
	 mzCe4K/EGNfNQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 May 2026 16:07:29 +0100
Subject: [PATCH v2 1/2] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
In-Reply-To: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8561; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tAFkrfa2Y/nfuLCUXO0TqhAEz2ryyE7xUymG4Ewvevc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqCyt9E07pPLSQFlandI9mTLhfGfi3nsteJcdHt
 FBM84QG96OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagsrfQAKCRAk1otyXVSH
 0EwSB/wPAGsdozFb4/qegeLzFBpvKcVXU7zdfZBHMXClx4wrvqVV1NCsgRc4o0ooNy4DxmUwFmm
 leXCmX0bgD6XIK0z83zCbqJfuEC6clIkAZqAochD+OZZ59AhtCWLDPjOYqGYPSmlJz25xJxYQnt
 BOFquHcGVNHYQJojvRwi1YAFvQNdtGWVlg9wHOEukVWVbHP2Bs49j8hZ2mWXynnrvVkC6nio3uP
 /3npm25DZQ1+2y80+JQkhBoesBrUWKaNS/SYIDo6pLqKgOv38CDu0JyVZmIR9sZplSCoqSJ/5r+
 GsZe3l3yK3xTu4iMTEdBrd3+DfHqJ5xEXUCZItfldPXnnM9F
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The features added by the 2025 dpISA are all straightforward instruction
only features so there is no state to manage, we can just expose hwcaps to
let userspace know they are available.

F16MM is slightly odd in that the feature is FEAT_F16MM but it is discovered
via ID_AA64FPFR0_EL1.F16MM2. We follow the feature name.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 24 ++++++++++++++++++++++++
 arch/arm64/include/uapi/asm/hwcap.h     |  8 ++++++++
 arch/arm64/kernel/cpufeature.c          | 11 +++++++++++
 arch/arm64/kernel/cpuinfo.c             |  8 ++++++++
 4 files changed, 51 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 97315ae6c0da..07ff9ea1d605 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -451,6 +451,30 @@ HWCAP3_LS64
     of CPU. User should only use ld64b/st64b on supported target (device)
     memory location, otherwise fallback to the non-atomic alternatives.
 
+HWCAP3_SVE_B16MM
+    Functionality implied by ID_AA64ZFR0_EL1.B16B16 == 0b0011
+
+HWCAP3_SVE2P3
+    Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0100
+
+HWCAP3_SME_LUT6
+    Functionality implied by ID_AA64SMFR0_EL1.LUT6 == 0b1
+
+HWCAP3_SME2P3
+    Functionality implied by ID_AA64SMFR0_EL1.SMEver == 0b0100
+
+HWCAP3_F16MM
+    Functionality implied by ID_AA64FPFR0_EL1.F16MM2 == 0b1
+
+HWCAP3_F16F32DOT
+    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0010
+
+HWCAP3_F16F32MM
+    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011
+
+HWCAP3_SVE_LUT6
+    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
+    ID_AA64PFR0_EL1.SVE == 0b0001.
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 06f83ca8de56..10272ddb4d6f 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -147,5 +147,13 @@
 #define HWCAP3_MTE_STORE_ONLY		(1UL << 1)
 #define HWCAP3_LSFE		(1UL << 2)
 #define HWCAP3_LS64		(1UL << 3)
+#define HWCAP3_SVE_B16MM	(1UL << 4)
+#define HWCAP3_SVE2P3		(1UL << 5)
+#define HWCAP3_SME_LUT6		(1UL << 6)
+#define HWCAP3_SME2P3		(1UL << 7)
+#define HWCAP3_F16MM		(1UL << 8)
+#define HWCAP3_F16F32DOT	(1UL << 9)
+#define HWCAP3_F16F32MM		(1UL << 10)
+#define HWCAP3_SVE_LUT6		(1UL << 11)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..96de16582fca 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -365,6 +365,8 @@ static const struct arm64_ftr_bits ftr_id_aa64zfr0[] = {
 static const struct arm64_ftr_bits ftr_id_aa64smfr0[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_EXACT, ID_AA64SMFR0_EL1_FA64_SHIFT, 1, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
+		       FTR_STRICT, FTR_EXACT, ID_AA64SMFR0_EL1_LUT6_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_EXACT, ID_AA64SMFR0_EL1_LUTv2_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
@@ -419,6 +421,7 @@ static const struct arm64_ftr_bits ftr_id_aa64fpfr0[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8DP2_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8MM8_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8MM4_SHIFT, 1, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F16MM2_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8E4M3_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8E5M2_SHIFT, 1, 0),
 	ARM64_FTR_END,
@@ -3284,6 +3287,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SM4),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, DP, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDDP),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDFHM),
+	HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, F16F32DOT, CAP_HWCAP, KERNEL_HWCAP_F16F32DOT),
+	HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, F16F32MM, CAP_HWCAP, KERNEL_HWCAP_F16F32MM),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM, CAP_HWCAP, KERNEL_HWCAP_FLAGM),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM2, CAP_HWCAP, KERNEL_HWCAP_FLAGM2),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, RNDR, IMP, CAP_HWCAP, KERNEL_HWCAP_RNG),
@@ -3313,7 +3318,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
 	HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
 #ifdef CONFIG_ARM64_SVE
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ISAR2_EL1, LUT, LUT6, CAP_HWCAP, KERNEL_HWCAP_SVE_LUT6),
 	HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p3, CAP_HWCAP, KERNEL_HWCAP_SVE2P3),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p2, CAP_HWCAP, KERNEL_HWCAP_SVE2P2),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
@@ -3323,6 +3330,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, BFSCALE, CAP_HWCAP, KERNEL_HWCAP_SVE_BFSCALE),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, B16MM, CAP_HWCAP, KERNEL_HWCAP_SVE_B16MM),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
@@ -3362,7 +3370,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 #ifdef CONFIG_ARM64_SME
 	HWCAP_CAP(ID_AA64PFR1_EL1, SME, IMP, CAP_HWCAP, KERNEL_HWCAP_SME),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, FA64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_FA64),
+	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, LUT6, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_LUT6),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, LUTv2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_LUTV2),
+	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2p3, CAP_HWCAP, KERNEL_HWCAP_SME2P3),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2p2, CAP_HWCAP, KERNEL_HWCAP_SME2P2),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2p1, CAP_HWCAP, KERNEL_HWCAP_SME2P1),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2, CAP_HWCAP, KERNEL_HWCAP_SME2),
@@ -3393,6 +3403,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM8),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM4),
+	HWCAP_CAP(ID_AA64FPFR0_EL1, F16MM2, IMP, CAP_HWCAP, KERNEL_HWCAP_F16MM),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
 #ifdef CONFIG_ARM64_POE
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 6149bc91251d..d50e2a9b066b 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -164,6 +164,14 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",
 	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mtestoreonly",
 	[KERNEL_HWCAP_LSFE]		= "lsfe",
+	[KERNEL_HWCAP_SVE_B16MM]	= "sveb16mm",
+	[KERNEL_HWCAP_SVE2P3]		= "sve2p3",
+	[KERNEL_HWCAP_SME_LUT6]		= "smelut6",
+	[KERNEL_HWCAP_SME2P3]		= "sme2p3",
+	[KERNEL_HWCAP_F16MM]		= "f16mm",
+	[KERNEL_HWCAP_F16F32DOT]	= "f16f32dot",
+	[KERNEL_HWCAP_F16F32MM]		= "f16f32mm",
+	[KERNEL_HWCAP_SVE_LUT6]		= "svelut6",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.47.3

