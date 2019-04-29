From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Mon, 29 Apr 2019 11:27:56 -0400
Subject: [PATCH for 5.2 05/12] rseq/selftests: s390: use jg instruction for
 jumps outside of the asm
In-Reply-To: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
References: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
Message-ID: <20190429152803.7719-6-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429152756.0de9wjdxETfOMGhkNQwbwrKnpR8d-4iRXzOfPaIR7MU@z>

The branch target range of the "j" instruction is 64K, which is not
enough for the general case.

Suggested-by: Martin Schwidefsky <schwidefsky at de.ibm.com>
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
CC: Thomas Gleixner <tglx at linutronix.de>
CC: Joel Fernandes <joelaf at google.com>
CC: Peter Zijlstra <peterz at infradead.org>
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
 tools/testing/selftests/rseq/rseq-s390.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-s390.h b/tools/testing/selftests/rseq/rseq-s390.h
index fbb97815d71c..7c4f3a70b6c7 100644
--- a/tools/testing/selftests/rseq/rseq-s390.h
+++ b/tools/testing/selftests/rseq/rseq-s390.h
@@ -117,14 +117,14 @@ do {									\
 		".long " __rseq_str(RSEQ_SIG) "\n\t"			\
 		__rseq_str(label) ":\n\t"				\
 		teardown						\
-		"j %l[" __rseq_str(abort_label) "]\n\t"			\
+		"jg %l[" __rseq_str(abort_label) "]\n\t"		\
 		".popsection\n\t"
 
 #define RSEQ_ASM_DEFINE_CMPFAIL(label, teardown, cmpfail_label)		\
 		".pushsection __rseq_failure, \"ax\"\n\t"		\
 		__rseq_str(label) ":\n\t"				\
 		teardown						\
-		"j %l[" __rseq_str(cmpfail_label) "]\n\t"		\
+		"jg %l[" __rseq_str(cmpfail_label) "]\n\t"		\
 		".popsection\n\t"
 
 static inline __attribute__((always_inline))
-- 
2.11.0
