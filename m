From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Fri,  3 May 2019 15:38:58 -0400
Subject: [PATCH v2 for 5.2 08/12] rseq/selftests: arm: use udf instruction for
 RSEQ_SIG
In-Reply-To: <20190429152803.7719-9-mathieu.desnoyers@efficios.com>
References: <20190429152803.7719-9-mathieu.desnoyers@efficios.com>
Message-ID: <20190503193858.9676-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503193858.sEwPH8kNZa5DG8dyZgBou7SCNTrJG0nwaiVmB4qnhP8@z>

Use udf as the guard instruction for the restartable sequence abort
handler.

Previously, the chosen signature was not a valid instruction, based
on the assumption that it could always sit in a literal pool. However,
there are compilation environments in which literal pools are not
available, for instance execute-only code. Therefore, we need to
choose a signature value that is also a valid instruction.

Handle compiling with -mbig-endian on ARMv6+, which generates binaries
with mixed code vs data endianness (little endian code, big endian
data).

Else mismatch between code endianness for the generated signatures and
data endianness for the RSEQ_SIG parameter passed to the rseq
registration will trigger application segmentation faults when the
kernel try to abort rseq critical sections.

Prior to ARMv6, -mbig-endian generates big-endian code and data, so
endianness should not be reversed in that case.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
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
Changes since v1:
- Fix checkpatch error and warning.

---
 tools/testing/selftests/rseq/rseq-arm.h | 52 +++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-arm.h b/tools/testing/selftests/rseq/rseq-arm.h
index 5f262c54364f..84f28f147fb6 100644
--- a/tools/testing/selftests/rseq/rseq-arm.h
+++ b/tools/testing/selftests/rseq/rseq-arm.h
@@ -5,7 +5,54 @@
  * (C) Copyright 2016-2018 - Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
  */
 
-#define RSEQ_SIG	0x53053053
+/*
+ * RSEQ_SIG uses the udf A32 instruction with an uncommon immediate operand
+ * value 0x5de3. This traps if user-space reaches this instruction by mistake,
+ * and the uncommon operand ensures the kernel does not move the instruction
+ * pointer to attacker-controlled code on rseq abort.
+ *
+ * The instruction pattern in the A32 instruction set is:
+ *
+ * e7f5def3    udf    #24035    ; 0x5de3
+ *
+ * This translates to the following instruction pattern in the T16 instruction
+ * set:
+ *
+ * little endian:
+ * def3        udf    #243      ; 0xf3
+ * e7f5        b.n    <7f5>
+ *
+ * pre-ARMv6 big endian code:
+ * e7f5        b.n    <7f5>
+ * def3        udf    #243      ; 0xf3
+ *
+ * ARMv6+ -mbig-endian generates mixed endianness code vs data: little-endian
+ * code and big-endian data. Ensure the RSEQ_SIG data signature matches code
+ * endianness. Prior to ARMv6, -mbig-endian generates big-endian code and data
+ * (which match), so there is no need to reverse the endianness of the data
+ * representation of the signature. However, the choice between BE32 and BE8
+ * is done by the linker, so we cannot know whether code and data endianness
+ * will be mixed before the linker is invoked.
+ */
+
+#define RSEQ_SIG_CODE	0xe7f5def3
+
+#ifndef __ASSEMBLER__
+
+#define RSEQ_SIG_DATA							\
+	({								\
+		int sig;						\
+		asm volatile ("b 2f\n\t"				\
+			      "1: .inst " __rseq_str(RSEQ_SIG_CODE) "\n\t" \
+			      "2:\n\t"					\
+			      "ldr %[sig], 1b\n\t"			\
+			      : [sig] "=r" (sig));			\
+		sig;							\
+	})
+
+#define RSEQ_SIG	RSEQ_SIG_DATA
+
+#endif
 
 #define rseq_smp_mb()	__asm__ __volatile__ ("dmb" ::: "memory", "cc")
 #define rseq_smp_rmb()	__asm__ __volatile__ ("dmb" ::: "memory", "cc")
@@ -78,7 +125,8 @@ do {									\
 		__rseq_str(table_label) ":\n\t"				\
 		".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".word " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) ", 0x0\n\t" \
-		".word " __rseq_str(RSEQ_SIG) "\n\t"			\
+		".arm\n\t"						\
+		".inst " __rseq_str(RSEQ_SIG_CODE) "\n\t"		\
 		__rseq_str(label) ":\n\t"				\
 		teardown						\
 		"b %l[" __rseq_str(abort_label) "]\n\t"
-- 
2.11.0
