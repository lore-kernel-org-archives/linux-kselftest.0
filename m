Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E404078F1
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 23:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686596; cv=none; b=GElryn93kPHhHpDawH0pAsP38kzOT5bc43gJqsht3xE6RDFoCKd+wk9UGbP96Y9jQ8ZyqvAzmgxyujOczzzbDTAQW+bDwe90rj5nvjkSykAYx9U95oW7yQFUEVyD6bXC2Z+bSqUbtTG32mWslS3ZASFI7EUkO39TkGm5YhaSCMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686596; c=relaxed/simple;
	bh=qALapTuiw4QCIJOOpOKBx6DcORu290NfVxg/ccqwXE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3uR7p78pZNx53u4sFK+ogLIU9c9k3TWXc/BcKkYlMc+kyCnzsERdjysWRu+yDvcwa3untO81UcdITcByDlJuIQdvu34ARqzmWjY1NZXAqDp8xnnRQ6ASBlrZIAfXNHUgP8Uy9gqML0m0kCD23rbFyBBgiih6n7s+Ia0wUzW3sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vzOvP8ZA; arc=none smtp.client-ip=91.218.175.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vzOvP8ZA"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qALapTuiw4QCIJOOpOKBx6DcORu290NfVxg/ccqwXE8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789686584; v=1; x=1790291384;
 b=vzOvP8ZAluKYEus63Ngh1rsH9IkimYNiPRI+ZskYjsPMefDCq23tNBEkAzuzkbASwwXM4xjh
 pKSCuox7uH0wTwnOdH30aJddPBcu8Fg5fJPjcpKup9IZn96n73l0sGGorFn4PVT8hkQrFn161zU
 MDWzimnhbbRdFIEH9XB6X0Eg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a750deb8ffe1ae15;
	Thu, 17 Sep 2026 23:09:44 +0000
X-Mizu-Trace-ID: a750deb8ffe1ae15
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Xin Li <xin@zytor.com>,
	hpa@zytor.com
Cc: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paul Gofman <pgofman@codeweavers.com>,
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 1/2] x86/fred: Reconstruct the #GP context for rejected INT instructions
Date: Thu, 17 Sep 2026 16:09:06 -0700
Message-ID: <20260917230907.2080792-2-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917230907.2080792-1-matthew.schwartz@linux.dev>
References: <20260917230907.2080792-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FRED event delivery does not use the IDT, so the gate DPL check that
rejects a user INT n falls to software (Intel FRED specification [1],
section 8.3). fred_intx() rejects the same vectors as IDT delivery, but
reports a zero error code and the IP after the INT. This breaks the
signal ABI. Wine uses the error code to recognize INT 0x2d, so the
changed context turns a handled breakpoint into an access violation in
Elden Ring.

Rewind IP using the instruction length in the augmented SS and
synthesize the IDT selector error code, (vector << 3) | 2. Set RF in the
saved flags, as the CPU does for a #GP fault. Section 5.2.1 defines the
saved vector, instruction length and RF state. The supplied length
handles prefixes without reading user memory. Limit the changes to
already-rejected software interrupts, preserving the accepted INT3, INT4
and enabled INT80 paths and hardware exceptions. With IA32 emulation
disabled, INT 0x80 now reports the same #GP as the DPL 0 gate IDT
installs there. The rewound IP also stops fixup_iopl_exception() from
inspecting the byte after the INT.

Also clear the software event flag. Section 6.2.3 specifies that ERETU
with this flag and TF set traps before executing any user instruction. A
tracer that suppresses SIGSEGV and resumes with TF set expects the next
instruction to run first, as after IRET. The sigreturn path clears the
same flag for this reason in prevent_single_step_upon_eretu().

[1] Intel Flexible Return and Event Delivery (FRED) Specification,
revision 9.0 (346446-009US), sections 5.2.1, 6.2.3 and 8.3.

Fixes: 14619d912b65 ("x86/fred: FRED entry/exit and dispatch code")
Reported-by: Paul Gofman <pgofman@codeweavers.com>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15745
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16132
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Link: https://cdrdv2.intel.com/v1/dl/getContent/678938 # [1]
---
 arch/x86/entry/entry_fred.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index fb3594ddf731..854899bfec5d 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -10,6 +10,7 @@
 #include <asm/desc.h>
 #include <asm/fred.h>
 #include <asm/idtentry.h>
+#include <asm/processor-flags.h>
 #include <asm/syscall.h>
 #include <asm/trapnr.h>
 #include <asm/traps.h>
@@ -71,7 +72,15 @@ static noinstr void fred_intx(struct pt_regs *regs)
 #endif
 
 	default:
-		return exc_general_protection(regs, 0);
+		/*
+		 * Reconstruct the #GP fault state that IDT delivery would produce.
+		 * Clear the software event flag so ERETU with TF set does not trap
+		 * before the resumed instruction. See prevent_single_step_upon_eretu().
+		 */
+		regs->ip -= regs->fred_ss.insnlen;
+		regs->flags |= X86_EFLAGS_RF;
+		regs->fred_ss.swevent = 0;
+		return exc_general_protection(regs, (regs->fred_ss.vector << 3) | 2);
 	}
 }
 
-- 
2.55.0

