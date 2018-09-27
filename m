From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Thu, 27 Sep 2018 14:39:19 -0400
Subject: [PATCH v2] rseq/selftests: fix parametrized test with -fpie
Message-ID: <20180927183919.7461-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180927183919.CZiSQivr4ui5_hzoIhbEoqREw0cakuiKs68tadvNZqg@z>

On x86-64, the parametrized selftest code for rseq crashes with a
segmentation fault when compiled with -fpie. This happens when the
param_test binary is loaded at an address beyond 32-bit on x86-64.

The issue is caused by use of a 32-bit register to hold the address
of the loop counter variable.

Fix this by using a 64-bit register to calculate the address of the
loop counter variables as an offset from rip.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Acked-by: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>
Cc: <stable at vger.kernel.org> # v4.18
Cc: Shuah Khan <shuah at kernel.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Joel Fernandes <joelaf at google.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Dave Watson <davejwatson at fb.com>
Cc: Will Deacon <will.deacon at arm.com>
Cc: Andi Kleen <andi at firstfloor.org>
Cc: linux-kselftest at vger.kernel.org
Cc: "H . Peter Anvin" <hpa at zytor.com>
Cc: Chris Lameter <cl at linux.com>
Cc: Russell King <linux at arm.linux.org.uk>
Cc: Michael Kerrisk <mtk.manpages at gmail.com>
Cc: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>
Cc: Paul Turner <pjt at google.com>
Cc: Boqun Feng <boqun.feng at gmail.com>
Cc: Josh Triplett <josh at joshtriplett.org>
Cc: Steven Rostedt <rostedt at goodmis.org>
Cc: Ben Maurer <bmaurer at fb.com>
Cc: Andy Lutomirski <luto at amacapital.net>
Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
---
Changes since v1:
- Update email address for Shuah Khan based on updated MAINTAINERS
  email address,
- Rebase on v4.19-rc5.
---
 tools/testing/selftests/rseq/param_test.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
index 642d4e12abea..eec2663261f2 100644
--- a/tools/testing/selftests/rseq/param_test.c
+++ b/tools/testing/selftests/rseq/param_test.c
@@ -56,15 +56,13 @@ unsigned int yield_mod_cnt, nr_abort;
 			printf(fmt, ## __VA_ARGS__);	\
 	} while (0)
 
-#if defined(__x86_64__) || defined(__i386__)
+#ifdef __i386__
 
 #define INJECT_ASM_REG	"eax"
 
 #define RSEQ_INJECT_CLOBBER \
 	, INJECT_ASM_REG
 
-#ifdef __i386__
-
 #define RSEQ_INJECT_ASM(n) \
 	"mov asm_loop_cnt_" #n ", %%" INJECT_ASM_REG "\n\t" \
 	"test %%" INJECT_ASM_REG ",%%" INJECT_ASM_REG "\n\t" \
@@ -76,9 +74,16 @@ unsigned int yield_mod_cnt, nr_abort;
 
 #elif defined(__x86_64__)
 
+#define INJECT_ASM_REG_P	"rax"
+#define INJECT_ASM_REG		"eax"
+
+#define RSEQ_INJECT_CLOBBER \
+	, INJECT_ASM_REG_P \
+	, INJECT_ASM_REG
+
 #define RSEQ_INJECT_ASM(n) \
-	"lea asm_loop_cnt_" #n "(%%rip), %%" INJECT_ASM_REG "\n\t" \
-	"mov (%%" INJECT_ASM_REG "), %%" INJECT_ASM_REG "\n\t" \
+	"lea asm_loop_cnt_" #n "(%%rip), %%" INJECT_ASM_REG_P "\n\t" \
+	"mov (%%" INJECT_ASM_REG_P "), %%" INJECT_ASM_REG "\n\t" \
 	"test %%" INJECT_ASM_REG ",%%" INJECT_ASM_REG "\n\t" \
 	"jz 333f\n\t" \
 	"222:\n\t" \
@@ -86,10 +91,6 @@ unsigned int yield_mod_cnt, nr_abort;
 	"jnz 222b\n\t" \
 	"333:\n\t"
 
-#else
-#error "Unsupported architecture"
-#endif
-
 #elif defined(__s390__)
 
 #define RSEQ_INJECT_INPUT \
-- 
2.17.1
