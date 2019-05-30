From: vincenzo.frascino at arm.com (Vincenzo Frascino)
Date: Thu, 30 May 2019 15:15:20 +0100
Subject: [PATCH v6 08/19] arm64: compat: Generate asm offsets for signals
In-Reply-To: <20190530141531.43462-1-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
Message-ID: <20190530141531.43462-9-vincenzo.frascino@arm.com>

Update asm-offsets for arm64 to generate the correct offsets for
compat signals.

They will be useful for the implementation of the compat sigreturn
trampolines in vDSO context.

Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
---
 arch/arm64/kernel/asm-offsets.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9e4b7ccbab2f..c0d8b9f40022 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -30,6 +30,7 @@
 #include <asm/fixmap.h>
 #include <asm/thread_info.h>
 #include <asm/memory.h>
+#include <asm/signal32.h>
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
 #include <linux/kbuild.h>
@@ -77,6 +78,11 @@ int main(void)
   DEFINE(S_STACKFRAME,		offsetof(struct pt_regs, stackframe));
   DEFINE(S_FRAME_SIZE,		sizeof(struct pt_regs));
   BLANK();
+#ifdef CONFIG_COMPAT
+  DEFINE(COMPAT_SIGFRAME_REGS_OFFSET,		offsetof(struct compat_sigframe, uc.uc_mcontext.arm_r0));
+  DEFINE(COMPAT_RT_SIGFRAME_REGS_OFFSET,	offsetof(struct compat_rt_sigframe, sig.uc.uc_mcontext.arm_r0));
+  BLANK();
+#endif
   DEFINE(MM_CONTEXT_ID,		offsetof(struct mm_struct, context.id.counter));
   BLANK();
   DEFINE(VMA_VM_MM,		offsetof(struct vm_area_struct, vm_mm));
-- 
2.21.0
