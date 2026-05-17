Received: from mail-108-mta63.mxroute.com (mail-108-mta63.mxroute.com [136.175.108.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823A83B52E2
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042948; cv=none; b=TQ18hCgliSa9qi2XonmF/Aex835Zqc5k1sh1rgN6beWg7SiVdafEc+7aEA9iED1O+Vq2AtrLGCZ8axWXhE7BAUibRWpYe0nTup/eunxsxVGEg50d3WD4IoIUrhIi+SZOaqXThQUY0aFoSw25drNA9VT4vYhoC2r3PQs1rEEzBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042948; c=relaxed/simple;
	bh=/j8aHXrfZYMx5ZkyWVQrUIv7sxmv3gJCEOG1gnjvaMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwrjiC7Avn+lXzVAb3I/ZASJHJziKZbbEwf27wxBp5HdhzsqKE7fvC0TSpwLf3+WsgHlxNI2nyX4G7MQiHkrazJB1cKlzbDzOxzGjXjHJh8dPlqAB/cPQoB/U6VxTSef+lkD07r/JeKUYYPyaNO4b5dx2zAELPb1oJ7mnb3IKLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=dziNSDjz reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="dziNSDjz"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta63.mxroute.com (ZoneMTA) with ESMTPSA id 19e37344fe000067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:35 +0000
X-Zone-Loop: 27c3efb95432d0ff0d7d963d8869963d79c786107306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hISvt7Q9/uti1qoO6ln4lOuHlFanj3DiUngmVUOuBcY=; b=dziNSDjz41/AdrBj/yE9flyiUO
	yykFzAxBi8uCE3S4cnoVxWsc3vwNVe2SzgS23wpIbOfdX+6LOua2MfGLMiTePOninSyM9aT6YtFHE
	eOGwiE2e4AYsTMdLpHCPr+JDJv7RLnd+Cc5EakY7ImtMFeFZNNMQckObAK3ljfnwhW0DVfF41TR2I
	raP4xpRb7+Do3443fHWpLcRnoOuep29VacKD3sxiUjKwt1KQSehVojkcg3buUH7C7kUQJ8zBsufz7
	+xbRCMmo7X4HeXK7iuSxtHtHtyZ4R97k936L//Tq+lSulFSlP0rUP1M69lb+dJgxT7mO9NmIQW3YD
	nFwhGRdg==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] x86: add userspace IBT config option
Date: Sun, 17 May 2026 13:30:18 -0500
Message-ID: <20260517183024.16292-2-ripatel@wii.dev>
In-Reply-To: <20260517183024.16292-1-ripatel@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
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

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/Kconfig                         | 17 +++++++++++++++++
 arch/x86/include/asm/cpufeatures.h       |  1 +
 arch/x86/kernel/cet.c                    |  3 ++-
 arch/x86/kernel/cpu/common.c             | 14 ++++++++++++--
 tools/arch/x86/include/asm/cpufeatures.h |  1 +
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..12cc944b63c7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1901,6 +1901,23 @@ config X86_USER_SHADOW_STACK
 
 	  If unsure, say N.
 
+config X86_USER_IBT
+	bool "X86 userspace indirect branch tracking"
+	depends on X86_64
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

