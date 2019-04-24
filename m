From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Wed, 24 Apr 2019 11:25:00 -0400
Subject: [RFC PATCH for 5.2 08/10] rseq/selftests: aarch64 code signature:
 handle big-endian environment
In-Reply-To: <20190424152502.14246-1-mathieu.desnoyers@efficios.com>
References: <20190424152502.14246-1-mathieu.desnoyers@efficios.com>
Message-ID: <20190424152502.14246-9-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424152500.8AO_jP9F902xxvDa7_SlwJ68o8DQCBkvTVTCCceu4x4@z>

Handle compiling with -mbig-endian on aarch64, which generates binaries
with mixed code vs data endianness (little endian code, big endian
data).

Else mismatch between code endianness for the generated signatures and
data endianness for the RSEQ_SIG parameter passed to the rseq
registration will trigger application segmentation faults when the
kernel try to abort rseq critical sections.

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
 tools/testing/selftests/rseq/rseq-arm64.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-arm64.h b/tools/testing/selftests/rseq/rseq-arm64.h
index b41a2a48e965..200dae9e4208 100644
--- a/tools/testing/selftests/rseq/rseq-arm64.h
+++ b/tools/testing/selftests/rseq/rseq-arm64.h
@@ -6,7 +6,20 @@
  * (C) Copyright 2018 - Will Deacon <will.deacon at arm.com>
  */
 
-#define RSEQ_SIG	0xd428bc00	/* BRK #0x45E0 */
+/*
+ * aarch64 -mbig-endian generates mixed endianness code vs data:
+ * little-endian code and big-endian data. Ensure the RSEQ_SIG signature
+ * matches code endianness.
+ */
+#define RSEQ_SIG_CODE	0xd428bc00	/* BRK #0x45E0.  */
+
+#ifdef __AARCH64EB__
+#define RSEQ_SIG_DATA	0x00bc28d4	/* BRK #0x45E0.  */
+#else
+#define RSEQ_SIG_DATA	RSEQ_SIG_CODE
+#endif
+
+#define RSEQ_SIG	RSEQ_SIG_DATA
 
 #define rseq_smp_mb()	__asm__ __volatile__ ("dmb ish" ::: "memory")
 #define rseq_smp_rmb()	__asm__ __volatile__ ("dmb ishld" ::: "memory")
@@ -121,7 +134,7 @@ do {										\
 
 #define RSEQ_ASM_DEFINE_ABORT(label, abort_label)				\
 	"	b	222f\n"							\
-	"	.inst 	"	__rseq_str(RSEQ_SIG) "\n"			\
+	"	.inst 	"	__rseq_str(RSEQ_SIG_CODE) "\n"			\
 	__rseq_str(label) ":\n"							\
 	"	b	%l[" __rseq_str(abort_label) "]\n"			\
 	"222:\n"
-- 
2.11.0
