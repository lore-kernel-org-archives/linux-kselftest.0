From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Mon, 29 Apr 2019 11:27:57 -0400
Subject: [PATCH for 5.2 06/12] rseq/selftests: x86: use ud1 instruction as
 RSEQ_SIG opcode
In-Reply-To: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
References: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
Message-ID: <20190429152803.7719-7-mathieu.desnoyers@efficios.com>

Use ud1 as the guard instruction for the restartable sequence abort
handler. Its benefit compared to nopl is to trap execution if the
program ends up trying to execute it by mistake, which makes debugging
easier.

The 4-byte signature per se is unchanged (it is the instruction
operand). Only the opcode is changed from nopl to ud1.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Suggested-by: Peter Zijlstra <peterz at infradead.org>
CC: Peter Zijlstra <peterz at infradead.org>
CC: Thomas Gleixner <tglx at linutronix.de>
CC: Joel Fernandes <joelaf at google.com>
CC: Catalin Marinas <catalin.marinas at arm.com>
CC: Dave Watson <davejwatson at fb.com>
CC: Will Deacon <will.deacon at arm.com>
CC: Shuah Khan <shuah at kernel.org>
CC: Andi Kleen <andi at firstfloor.org>
CC: linux-kselftest at vger.kernel.org
CC: "H . Peter Anvin" <hpa at zytor.com>
CC: Chris Lameter <cl at linux.com>
CC: Russell King <linux at arm.linux.org.uk>
CC: Michael Kerrisk <mtk.manpages at gmail.com>
CC: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>
CC: Paul Turner <pjt at google.com>
CC: Boqun Feng <boqun.feng at gmail.com>
CC: Josh Triplett <josh at joshtriplett.org>
CC: Steven Rostedt <rostedt at goodmis.org>
CC: Ben Maurer <bmaurer at fb.com>
CC: linux-api at vger.kernel.org
CC: Andy Lutomirski <luto at amacapital.net>
CC: Andrew Morton <akpm at linux-foundation.org>
CC: Linus Torvalds <torvalds at linux-foundation.org>
---
 tools/testing/selftests/rseq/rseq-x86.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-x86.h b/tools/testing/selftests/rseq/rseq-x86.h
index 03095236f6fa..b2da6004fe30 100644
--- a/tools/testing/selftests/rseq/rseq-x86.h
+++ b/tools/testing/selftests/rseq/rseq-x86.h
@@ -7,6 +7,13 @@
 
 #include <stdint.h>
 
+/*
+ * RSEQ_SIG is used with the following reserved undefined instructions, which
+ * trap in user-space:
+ *
+ * x86-32:    0f b9 3d 53 30 05 53      ud1    0x53053053,%edi
+ * x86-64:    0f b9 3d 53 30 05 53      ud1    0x53053053(%rip),%edi
+ */
 #define RSEQ_SIG	0x53053053
 
 /*
@@ -88,8 +95,8 @@ do {									\
 
 #define RSEQ_ASM_DEFINE_ABORT(label, teardown, abort_label)		\
 		".pushsection __rseq_failure, \"ax\"\n\t"		\
-		/* Disassembler-friendly signature: nopl <sig>(%rip). */\
-		".byte 0x0f, 0x1f, 0x05\n\t"				\
+		/* Disassembler-friendly signature: ud1 <sig>(%rip),%edi. */ \
+		".byte 0x0f, 0xb9, 0x3d\n\t"				\
 		".long " __rseq_str(RSEQ_SIG) "\n\t"			\
 		__rseq_str(label) ":\n\t"				\
 		teardown						\
@@ -609,8 +616,8 @@ do {									\
 
 #define RSEQ_ASM_DEFINE_ABORT(label, teardown, abort_label)		\
 		".pushsection __rseq_failure, \"ax\"\n\t"		\
-		/* Disassembler-friendly signature: nopl <sig>. */	\
-		".byte 0x0f, 0x1f, 0x05\n\t"				\
+		/* Disassembler-friendly signature: ud1 <sig>,%edi. */	\
+		".byte 0x0f, 0xb9, 0x3d\n\t"				\
 		".long " __rseq_str(RSEQ_SIG) "\n\t"			\
 		__rseq_str(label) ":\n\t"				\
 		teardown						\
-- 
2.11.0
