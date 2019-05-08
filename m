From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 08 May 2019 09:49:04 +0200
Subject: [PATCH 3/4] x86/ftrace: Add pt_regs frame annotations
References: <20190508074901.982470324@infradead.org>
Message-ID: <20190508080612.776845854@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508074904.zJ8leEz8ZDitjojpbQZXrChn_xCFlbU1hVDR9DtGRAQ@z>

When CONFIG_FRAME_POINTER, we should mark pt_regs frames.

Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
---
 arch/x86/kernel/ftrace_32.S |    6 ++++++
 arch/x86/kernel/ftrace_64.S |    3 +++
 2 files changed, 9 insertions(+)

--- a/arch/x86/kernel/ftrace_32.S
+++ b/arch/x86/kernel/ftrace_32.S
@@ -138,6 +138,12 @@ ENTRY(ftrace_regs_caller)
 #else
 	movl	0x4(%ebp), %edx			/* Load parent ip (2nd parameter) */
 #endif
+
+#ifdef CONFIG_FRAME_POINTER
+	movl	%esp, %ebp
+	andl	$0x7fffffff, %ebp
+#endif
+
 	movl	function_trace_op, %ecx		/* Save ftrace_pos in 3rd parameter */
 	pushl	%esp				/* Save pt_regs as 4th parameter */
 
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -222,6 +222,9 @@ GLOBAL(ftrace_regs_caller_op_ptr)
 	leaq MCOUNT_REG_SIZE+8*2(%rsp), %rcx
 	movq %rcx, RSP(%rsp)
 
+#ifdef CONFIG_FRAME_POINTER
+	leaq 1(%rsp), %rbp
+#endif
 	/* regs go into 4th parameter */
 	leaq (%rsp), %rcx
 
