Received: from mail-108-mta118.mxroute.com (mail-108-mta118.mxroute.com [136.175.108.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1F1C84A6
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685621; cv=none; b=P/Z0+WkKO983eGq1vvrmrlhNHX4fGXonLwInjrtx9g4EtRS1B02nnRDHldKQbPn/YFfhCW/FjsWyPZs4nVC5hxYn5ONG/MVpnGUetP5uAY6HdEQSIPx+4hzHiqHUSRe4GXHRQAbEHkc3IaclvQrTvqaEPe5LRJ76gF5SDjrWm0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685621; c=relaxed/simple;
	bh=3mYBSwPm2HNzbZQx6T/QDwCg0Hi1eJoSiWrbJcT/GQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFeVsslmoYN1O7zPu14jWoetvO1dP6QPtoNrbp8uBRI+AB/QKNF5UfiP4XftLwlQ46gZjxKoqTCSnm+fULiIEBlKMk7VtZOp6WiF6OrEis81pqQipaMxanv2zmtT/i/IAgrDjQfpzw7WSl5N4J+5BkyCYiqnzEHgDAFRhIrpWzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=dI1wX2vX; arc=none smtp.client-ip=136.175.108.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="dI1wX2vX"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta118.mxroute.com (ZoneMTA) with ESMTPSA id 19e991d738f00067f7.00f
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 18:48:24 +0000
X-Zone-Loop: d194f6147c240024550dfca9e346e809efaff17193c2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=B+Wl9Myy0ESgVPp15bKDoA4p/EMRfvxhxgVs0DeRndM=; b=dI1wX2vX+bpLSCQhuv1si7NznO
	ytc+BpziZqVuYYirVZD9a44yIKUXdxWF1bsV0I2a4Nv1YB7I77d1TSDtiJ9hYcKmd5to/DA9BzppH
	6GT8jgOuGIJqkXziMSazdN+1bk47mJ9o0ET6Fwz3CZTtrKVZkXF9RlL0ipDcU8HFojq1P4J8M4yKE
	gfgwNcVO6wSSY03BPAVi6cgj5yk+/OF3ny5C4B9IZ+BMeibdRKk5q2Ln8XS+ouHR3afJuz2q8eel2
	U18sejcQQECgcc1+2Zqn6y0IXBvzVWzdrEF7zulu010xnBoUpGWCPpWXuT4Glp+pFhB7Z03zyhNn+
	SbXpbvcg==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	David Laight <david.laight.linux@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Weimer <fweimer@redhat.com>,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH v2 1/5] x86: add userspace IBT config option
Date: Fri,  5 Jun 2026 18:47:12 +0000
Message-ID: <20260605184715.3383415-3-ripatel@wii.dev>
In-Reply-To: <20260605184715.3383415-2-ripatel@wii.dev>
References: <20260605184715.3383415-2-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

Adds a X86_USER_IBT Kconfig option and "nouseribt" command-line
option. Default disabled for now.

These prepare for userspace support for IBT (forward-edge control
flow integrity protection).

User IBT works even if kernel IBT is disabled. However, ibt=off
also disables user IBT.

Depends on usermode shadow stack, which enables XSAVES for the
IA32_U_CET MSR, containing both SHSTK and IBT state.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/Kconfig                         | 18 ++++++++++++++++++
 arch/x86/include/asm/cpufeatures.h       |  1 +
 arch/x86/kernel/cet.c                    |  3 ++-
 arch/x86/kernel/cpu/common.c             | 14 ++++++++++++--
 tools/arch/x86/include/asm/cpufeatures.h |  1 +
 5 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..90d5d14fd407 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1901,6 +1901,24 @@ config X86_USER_SHADOW_STACK
 
 	  If unsure, say N.
 
+config X86_USER_IBT
+	bool "X86 userspace indirect branch tracking"
+	depends on X86_64
+	depends on X86_USER_SHADOW_STACK
+	select X86_CET
+	help
+	  Support Indirect Branch Tracking protection for userspace
+	  applications. IBT is a hardware-supported coarse-grained
+	  forward-edge Control Flow Integrity protection feature.
+	  It enforces that all indirect calls must land on an ENDBR
+	  instruction. Applications must be enabled to use it, and old
+	  userspace does not get protection "for free". Enables the
+	  PR_CFI_BRANCH_LANDING_PADS prctl CFI option.
+
+	  CPUs supporting IBT were first released in 2021.
+
+	  If unsure, say N.
+
 config INTEL_TDX_HOST
 	bool "Intel Trust Domain Extensions (TDX) host support"
 	depends on CPU_SUP_INTEL
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 1d506e5d6f46..1825cbf864c0 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -516,6 +516,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_USER_IBT		(21*32+21) /* Indirect Branch Tracking for user mode applications */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
index 99444409c026..3ccf47e82da1 100644
--- a/arch/x86/kernel/cet.c
+++ b/arch/x86/kernel/cet.c
@@ -149,7 +149,8 @@ __setup("ibt=", ibt_setup);
 DEFINE_IDTENTRY_ERRORCODE(exc_control_protection)
 {
 	if (user_mode(regs)) {
-		if (cpu_feature_enabled(X86_FEATURE_USER_SHSTK))
+		if (cpu_feature_enabled(X86_FEATURE_USER_SHSTK) ||
+		    cpu_feature_enabled(X86_FEATURE_USER_IBT))
 			do_user_cp_fault(regs, error_code);
 		else
 			do_unexpected_cp(regs, error_code);
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a4268c47f2bc..2839edd92331 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -634,7 +634,7 @@ __noendbr void ibt_restore(u64 save)
 
 static __always_inline void setup_cet(struct cpuinfo_x86 *c)
 {
-	bool user_shstk, kernel_ibt;
+	bool user_shstk, kernel_ibt, user_ibt;
 
 	if (!IS_ENABLED(CONFIG_X86_CET))
 		return;
@@ -642,13 +642,19 @@ static __always_inline void setup_cet(struct cpuinfo_x86 *c)
 	kernel_ibt = HAS_KERNEL_IBT && cpu_feature_enabled(X86_FEATURE_IBT);
 	user_shstk = cpu_feature_enabled(X86_FEATURE_SHSTK) &&
 		     IS_ENABLED(CONFIG_X86_USER_SHADOW_STACK);
+	/* User IBT only needs hardware IBT, not kernel-enabled IBT. */
+	user_ibt = cpu_has(c, X86_FEATURE_IBT) &&
+		   IS_ENABLED(CONFIG_X86_USER_IBT);
 
-	if (!kernel_ibt && !user_shstk)
+	if (!kernel_ibt && !user_shstk && !user_ibt)
 		return;
 
 	if (user_shstk)
 		set_cpu_cap(c, X86_FEATURE_USER_SHSTK);
 
+	if (user_ibt)
+		set_cpu_cap(c, X86_FEATURE_USER_IBT);
+
 	if (kernel_ibt)
 		wrmsrq(MSR_IA32_S_CET, CET_ENDBR_EN);
 	else
@@ -666,6 +672,7 @@ static __always_inline void setup_cet(struct cpuinfo_x86 *c)
 __noendbr void cet_disable(void)
 {
 	if (!(cpu_feature_enabled(X86_FEATURE_IBT) ||
+	      cpu_feature_enabled(X86_FEATURE_USER_IBT) ||
 	      cpu_feature_enabled(X86_FEATURE_SHSTK)))
 		return;
 
@@ -1760,6 +1767,9 @@ static void __init cpu_parse_early_param(void)
 	if (cmdline_find_option_bool(boot_command_line, "nousershstk"))
 		setup_clear_cpu_cap(X86_FEATURE_USER_SHSTK);
 
+	if (cmdline_find_option_bool(boot_command_line, "nouseribt"))
+		setup_clear_cpu_cap(X86_FEATURE_USER_IBT);
+
 	/* Minimize the gap between FRED is available and available but disabled. */
 	arglen = cmdline_find_option(boot_command_line, "fred", arg, sizeof(arg));
 	if (arglen == 3 && !strncmp(arg, "off", 3))
diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
index 86d17b195e79..1cf22d27c7a1 100644
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@ -515,6 +515,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_USER_IBT		(21*32+21) /* Indirect Branch Tracking for user mode applications */
 
 /*
  * BUG word(s)
-- 
2.47.3

