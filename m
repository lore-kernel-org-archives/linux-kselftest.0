Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A33D9046;
	Tue, 24 Mar 2026 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342271; cv=none; b=EAV0eMNUidQNEN5Bx402D0jMr7FmaEKcngtUio/SmrS18sqeX6k8QEqhyxXhNI5Fhw3Jj2GWg9LaqVNjLSxxD9UgiUVefggXA9uabFlP2u21VjSpgSsBDbQyWQd/tVt7FhpXhfcL3wfhchmCmwOQJ+hkRZvVjSy4Gp418V5pcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342271; c=relaxed/simple;
	bh=cpnXr1xT1qpyoOjVdZqnOpbXCUGoRLavKreAY1nLko0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Qx5oZowV//Is+HTq81sadU1yRPfmKxL5nK7uA4lXbscesi1/PDTkNJzdTIAcSMne8REH9TWkVvEVisxgAitGz7bsp4eVhreHEfnF5oSZY3RKbhX1xTLP1TowqyPy6y8pzc2d5YzUYuU128fwYa3mR/7MRPs9aHwLAGk5Cr2zNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7weq0Og; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7weq0Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774342269; x=1805878269;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cpnXr1xT1qpyoOjVdZqnOpbXCUGoRLavKreAY1nLko0=;
  b=f7weq0Og6onn+dkhkkip6RLuzoxF7b49Ei3SNDRMx24Kxg+wenWYTeFC
   jaTiTomgnKlGwPLV6zqPC4ugnDruu7kN0DYaJbYxlbjQTGUSg9r1ZyrRU
   CtxyWFMeAs/R0wswImyVSNGgx9m7u6hile1DlTn3pWMlCP7xLWKx9ZAqQ
   Xb4Gt/KDqWjtyaxMlKpU0jyPCiKem0vjcgirTp6fVoaBO4HsQoui00XxX
   3TUfqw0fiOqCvR4w2t2xBMgLHdoCkTqwU2sWJsKbByVo48Erxk55t/5Hb
   vQRGu9Y1pXAMrPsrHirWEe2M/wFy3piakWjPb77+FgaCozm5owdggNkt+
   Q==;
X-CSE-ConnectionGUID: fVyqDOm+R7uEwRbRMMe49w==
X-CSE-MsgGUID: JFuecWdbQ6yiIQ7pgriR2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78949258"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78949258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:51:09 -0700
X-CSE-ConnectionGUID: NHitNXdCTYSkQtT43fP6qA==
X-CSE-MsgGUID: Of/yQm1NQqWoL5zt6g2eXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262209436"
Received: from ly-workstation.sh.intel.com ([10.239.182.64])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2026 01:51:05 -0700
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
Subject: [PATCH v2] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Date: Tue, 24 Mar 2026 16:51:02 +0800
Message-ID: <20260324085102.688490-1-yi1.lai@intel.com>
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
Signed-off-by: Yi Lai <yi1.lai@intel.com>
---
v2:
 - Replaced CPUID check with a runtime probe using INT3 and GS RPL
   preservation to robustly detect active FRED usage (Suggested by
   Andrew Cooper).

 tools/testing/selftests/x86/sysret_rip.c | 45 ++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/x86/sysret_rip.c b/tools/testing/selftests/x86/sysret_rip.c
index 2e423a335e1c..af63b04eccbe 100644
--- a/tools/testing/selftests/x86/sysret_rip.c
+++ b/tools/testing/selftests/x86/sysret_rip.c
@@ -33,6 +33,39 @@ extern const char test_page[];
 
 static const void *current_test_page_addr = test_page;
 
+static void empty_handler(int sig, siginfo_t *info, void *ctx_void)
+{
+}
+
+static bool is_fred_enabled(void)
+{
+	unsigned short gs_val;
+
+	sethandler(SIGTRAP, empty_handler, 0);
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
 /* State used by our signal handlers. */
 static gregset_t initial_regs;
 
@@ -64,9 +97,15 @@ static void sigusr1(int sig, siginfo_t *info, void *ctx_void)
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

