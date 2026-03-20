Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2042C159E;
	Fri, 20 Mar 2026 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988388; cv=none; b=AYAWhzBqQYv7Reyc5rAzJhWkVhH0OQLrY7+F9dlfP2FRoqSOc8O0+Hs4pQB/OKQp0N6j8Eg3J0eS8cx7K9KUTK4/YnO+nOjJ6Gt3bTADtJ7m+3tY0HteDfrliMmIZT7/D3/RCel+BK9D04ZX/wbfZ9EtGc+RAox+1Io7yHSwDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988388; c=relaxed/simple;
	bh=z9jlBI9zsqRab22cNceO1thi/Q85QnOaQcb08+AiAY0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dc5JC1d0hmzthAF01HtV8Dt21I479GjRRjB+PPOKwvNQAvNrb8bejvD0yuFKGiRD6H7RnRMl0bpPJDbmuUV662BbHm/7XF0aHfV9YuGGCjLSTxTR2cIarSGxKHuKEBn4EtCFtiWLHmWXFGahC1qt9dAJUeZYoVTxjXqjoG+OM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eShQUgML; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eShQUgML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773988387; x=1805524387;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z9jlBI9zsqRab22cNceO1thi/Q85QnOaQcb08+AiAY0=;
  b=eShQUgMLepVTmz+ZSbUU7NQ6WCSoo94ydwPJOKmgH5Wcvw/amKRLbmu3
   k0v6eZQhfLxjQqmNuxri3blKFL2KNy9R9ob+dfXYVGqRs5HgD60irLvob
   Hbbdw1CTLfF3YMEpN0C+owWktBz9iXBgVzyRtFKbqrO0AHTLXi9w0IP1D
   UXM4WOozyGy2UbdEIUlTObvhLTwY0PPHJvK+EhnMRyeaVDbniiIGWjvZz
   Mq0qAHEJxI6Zoa1M34KtdMBy+o1/a6UKjDwZ3TyFTIyUX1G2eYflT+zkc
   Z95Ufzp5RWZu5W5tsJGHFPkUpIUKFzNK/bnzbFkerVZkhUE8DAtXNB0BG
   A==;
X-CSE-ConnectionGUID: p9xNmiqqQoSBclxCMku8Hg==
X-CSE-MsgGUID: +pL08wLDQm6ALp86Y6EaaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78676068"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78676068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 23:33:06 -0700
X-CSE-ConnectionGUID: nwOt+bYrThqLVjq8n8DFqg==
X-CSE-MsgGUID: RHEopZUJT8+b/wWhp3ZiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="247360210"
Received: from ly-workstation.sh.intel.com ([10.239.182.64])
  by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2026 23:33:04 -0700
From: Yi Lai <yi1.lai@intel.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	hpa@zytor.com,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Date: Fri, 20 Mar 2026 14:33:01 +0800
Message-ID: <20260320063301.489599-1-yi1.lai@intel.com>
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

Fix this by detecting FRED support via CPUID (Leaf 0x7, Subleaf 0x1, EAX
bit 17) and skipping the register assertion if FRED is present.

Signed-off-by: Yi Lai <yi1.lai@intel.com>
---
 tools/testing/selftests/x86/sysret_rip.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/x86/sysret_rip.c b/tools/testing/selftests/x86/sysret_rip.c
index 2e423a335e1c..0228d6174d5b 100644
--- a/tools/testing/selftests/x86/sysret_rip.c
+++ b/tools/testing/selftests/x86/sysret_rip.c
@@ -21,6 +21,7 @@
 #include <sys/user.h>
 #include <sys/mman.h>
 #include <assert.h>
+#include <cpuid.h>
 
 #include "helpers.h"
 
@@ -64,9 +65,18 @@ static void sigusr1(int sig, siginfo_t *info, void *ctx_void)
 	ctx->uc_mcontext.gregs[REG_RIP] = rip;
 	ctx->uc_mcontext.gregs[REG_RCX] = rip;
 
-	/* R11 and EFLAGS should already match. */
-	assert(ctx->uc_mcontext.gregs[REG_EFL] ==
-	       ctx->uc_mcontext.gregs[REG_R11]);
+	/*
+	 * SYSCALL works differently on FRED, it does not save RIP and RFLAGS
+	 * to RCX and R11.
+	 */
+	unsigned int eax, ebx, ecx, edx;
+
+	__cpuid_count(0x7, 0x1, eax, ebx, ecx, edx);
+	if (!(eax & (1 << 17))) {
+		/* R11 and EFLAGS should already match. */
+		assert(ctx->uc_mcontext.gregs[REG_EFL] ==
+		       ctx->uc_mcontext.gregs[REG_R11]);
+	}
 
 	sethandler(SIGSEGV, sigsegv_for_sigreturn_test, SA_RESETHAND);
 }
-- 
2.43.0

