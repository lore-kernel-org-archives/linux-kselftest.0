Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314A37B41A;
	Thu, 26 Mar 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518272; cv=none; b=V4AYxx/E8uIOFUMvl6NW29uRClxa/aaXPtbGWBAWr8o/Hb941yVMdjJDr9Zwz6G8z8m2/DZuzPz1hHWPCgFsNXagpYenr8h8bawdoQ9816cTcN6uO7D5ZW4BDy40y+3seRFsjKjDiOwHQxm8JztHVYHE8KSIi1j/Hpcw4/U2Q20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518272; c=relaxed/simple;
	bh=Xu6Szgn9q1oTaH2XbIihAcDWLQrstunVF90Bi7lhRPM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Pxn/92W1AuiNVWHTRei7nnIpojx1ToV88rhwKakDAresMp0rIQbl7FD16ggJSehwHxifLfBhRzu+Ww8Czl2p5mPwDAD7Ru26jxLcnJc5CfdBXhQPsR4rfEa5R43+izaGxfxy+buAHQCBdb2U/XkugBCbLndmKkeFxustwmRO4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfHNmAoT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfHNmAoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774518270; x=1806054270;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xu6Szgn9q1oTaH2XbIihAcDWLQrstunVF90Bi7lhRPM=;
  b=CfHNmAoTd8ohLxoesyaCmUT/JK0X81DI4aCRHEW5WmvEwSwpWGYqvFSJ
   VOl91S8bmuEuKRpvSnbelolV6HzHTUAu1toFNIkPnBq2V658smZYG4VtE
   BSqtHlLRX/ynIgS3jmfoA+oWmiVcDEBrwOBOhRKBaD1icoifq9ptmYu7J
   fmGeVGoacDwBRKDAXsiY4TiN2xJAekH0eTh8aVoRGKRbg9nCK79hLJxwL
   eT5H+euN2RQQLGGlD8+PVnjnYWYVfNM72EZTc2g8EmcaWdiP05d0PZvzb
   /0nJNzhRxJhQsz7eV6KbmKcCRnTxdBelY0hnM2ErJusCHyd/aipTh5HMt
   g==;
X-CSE-ConnectionGUID: +kd6729ySVCsr6F8UN8amw==
X-CSE-MsgGUID: jGUxio2iT/2we69rSSMqnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74752999"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="74752999"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 02:44:29 -0700
X-CSE-ConnectionGUID: /ExwPgE5RieyDbB8bW6PCA==
X-CSE-MsgGUID: Pjwe+8yzTWyvT/Q8Meo46A==
X-ExtLoop1: 1
Received: from ly-workstation.sh.intel.com ([10.239.182.64])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2026 02:44:26 -0700
From: Yi Lai <yi1.lai@intel.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xin Li <xin@zytor.com>,
	x86@kernel.org,
	hpa@zytor.com,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yi1.lai@linux.intel.com,
	yi1.lai@intel.com
Subject: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Date: Thu, 26 Mar 2026 17:44:23 +0800
Message-ID: <20260326094423.711724-1-yi1.lai@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
regs->flags'. This check relies on the behavior of the SYSCALL
instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.

However, on systems with FRED (Flexible Return and Event Delivery)
enabled, instead of using registers, all state is saved onto the stack.
Consequently, 'R11' retains its userspace value, causing the assertion
to fail.

Fix this by detecting if FRED is enabled and skipping the register
assertion in that case. The detection is done by checking if the RPL
bits of the GS selector are preserved after a hardware exception.
IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (via
ERETU) preserves them.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Yi Lai <yi1.lai@intel.com>
---
v3:
- Move is_fred_enabled() to helpers.h for other x86 selftests to use.
  Rename empty_handler to fred_handler to avoid symbol conflicts.

v2:
- Replaced CPUID check with a runtime probe using INT3 and GS RPL
  preservation to robustly detect active FRED usage (Suggested by
  Andrew Cooper).

 tools/testing/selftests/x86/helpers.h    | 34 ++++++++++++++++++++++++
 tools/testing/selftests/x86/sysret_rip.c | 12 ++++++---
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/x86/helpers.h b/tools/testing/selftests/x86/helpers.h
index 4c747a1278d9..4d09ed97aaac 100644
--- a/tools/testing/selftests/x86/helpers.h
+++ b/tools/testing/selftests/x86/helpers.h
@@ -4,6 +4,7 @@
 
 #include <signal.h>
 #include <string.h>
+#include <stdbool.h>
 
 #include <asm/processor-flags.h>
 
@@ -50,4 +51,37 @@ static inline void clearhandler(int sig)
 		ksft_exit_fail_msg("sigaction failed");
 }
 
+static inline void fred_handler(int sig, siginfo_t *info, void *ctx_void)
+{
+}
+
+static inline bool is_fred_enabled(void)
+{
+	unsigned short gs_val;
+
+	sethandler(SIGTRAP, fred_handler, 0);
+
+	/*
+	 * Distinguish IDT and FRED mode by loading GS with a non-zero RPL and
+	 * triggering an exception:
+	 * IDT (IRET) clears RPL bits of NULL selectors.
+	 * FRED (ERETU) preserves them.
+	 *
+	 * If GS is loaded with 3 (Index=0, RPL=3), trigger an exception:
+	 * IDT should restore GS as 0.
+	 * FRED should preserve GS as 3.
+	 */
+	asm volatile (
+		"mov %[rpl3], %%gs\n\t"
+		"int3\n\t"
+		"mov %%gs, %[res]"
+		: [res] "=r" (gs_val)
+		: [rpl3] "r" (3)
+	);
+
+	clearhandler(SIGTRAP);
+
+	return gs_val == 3;
+}
+
 #endif /* __SELFTESTS_X86_HELPERS_H */
diff --git a/tools/testing/selftests/x86/sysret_rip.c b/tools/testing/selftests/x86/sysret_rip.c
index 2e423a335e1c..30b195266779 100644
--- a/tools/testing/selftests/x86/sysret_rip.c
+++ b/tools/testing/selftests/x86/sysret_rip.c
@@ -64,9 +64,15 @@ static void sigusr1(int sig, siginfo_t *info, void *ctx_void)
 	ctx->uc_mcontext.gregs[REG_RIP] = rip;
 	ctx->uc_mcontext.gregs[REG_RCX] = rip;
 
-	/* R11 and EFLAGS should already match. */
-	assert(ctx->uc_mcontext.gregs[REG_EFL] ==
-	       ctx->uc_mcontext.gregs[REG_R11]);
+	/*
+	 * SYSCALL works differently on FRED, it does not save RIP and RFLAGS
+	 * to RCX and R11.
+	 */
+	if (!is_fred_enabled()) {
+		/* R11 and EFLAGS should already match. */
+		assert(ctx->uc_mcontext.gregs[REG_EFL] ==
+		       ctx->uc_mcontext.gregs[REG_R11]);
+	}
 
 	sethandler(SIGSEGV, sigsegv_for_sigreturn_test, SA_RESETHAND);
 }
-- 
2.43.0

