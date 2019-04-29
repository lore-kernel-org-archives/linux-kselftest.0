From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Mon, 29 Apr 2019 11:27:54 -0400
Subject: [PATCH for 5.2 03/12] rseq/selftests: Introduce __rseq_cs_ptr_array,
 rename __rseq_table to __rseq_cs
In-Reply-To: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
References: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
Message-ID: <20190429152803.7719-4-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429152754.DXX5-ZiCXH6NYkNbev0hi_3jNGAhrKjgLCiVie2EVDk@z>

The entries within __rseq_table are aligned on 32 bytes due to
linux/rseq.h struct rseq_cs uapi requirements, but the start of the
__rseq_table section is not guaranteed to be 32-byte aligned. It can
cause padding to be added at the start of the section, which makes it
hard to use as an array of items by debuggers.

Considering that __rseq_table does not really consist of a table due to
the presence of padding, rename this section to __rseq_cs.

Create a new __rseq_cs_ptr_array section which contains 64-bit packed
pointers to entries within the __rseq_cs section.

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
 tools/testing/selftests/rseq/rseq-arm.h   | 32 +++++++++++++++++--------------
 tools/testing/selftests/rseq/rseq-arm64.h |  9 ++++++---
 tools/testing/selftests/rseq/rseq-mips.h  | 32 +++++++++++++++++--------------
 tools/testing/selftests/rseq/rseq-ppc.h   | 22 +++++++++++++--------
 tools/testing/selftests/rseq/rseq-s390.h  | 18 +++++++++++------
 tools/testing/selftests/rseq/rseq-x86.h   | 19 ++++++++++++------
 6 files changed, 81 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-arm.h b/tools/testing/selftests/rseq/rseq-arm.h
index 17e8d231943a..5f262c54364f 100644
--- a/tools/testing/selftests/rseq/rseq-arm.h
+++ b/tools/testing/selftests/rseq/rseq-arm.h
@@ -30,24 +30,28 @@ do {									\
 #include "rseq-skip.h"
 #else /* !RSEQ_SKIP_FASTPATH */
 
-#define __RSEQ_ASM_DEFINE_TABLE(version, flags,	start_ip,		\
+#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip,	\
 				post_commit_offset, abort_ip)		\
-		".pushsection __rseq_table, \"aw\"\n\t"			\
+		".pushsection __rseq_cs, \"aw\"\n\t"			\
 		".balign 32\n\t"					\
+		__rseq_str(label) ":\n\t"					\
 		".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".word " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) ", 0x0\n\t" \
+		".popsection\n\t"					\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"		\
+		".word " __rseq_str(label) "b, 0x0\n\t"			\
 		".popsection\n\t"
 
-#define RSEQ_ASM_DEFINE_TABLE(start_ip, post_commit_ip, abort_ip)	\
-	__RSEQ_ASM_DEFINE_TABLE(0x0, 0x0, start_ip,			\
+#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
+	__RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,		\
 				(post_commit_ip - start_ip), abort_ip)
 
 /*
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
@@ -99,7 +103,7 @@ int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -166,7 +170,7 @@ int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -237,7 +241,7 @@ int rseq_addv(intptr_t *v, intptr_t count, int cpu)
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
 #endif
@@ -292,7 +296,7 @@ int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -367,7 +371,7 @@ int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -443,7 +447,7 @@ int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -527,7 +531,7 @@ int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -651,7 +655,7 @@ int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
diff --git a/tools/testing/selftests/rseq/rseq-arm64.h b/tools/testing/selftests/rseq/rseq-arm64.h
index 2079f71e0ca2..b41a2a48e965 100644
--- a/tools/testing/selftests/rseq/rseq-arm64.h
+++ b/tools/testing/selftests/rseq/rseq-arm64.h
@@ -82,13 +82,16 @@ do {										\
 
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip,		\
 				post_commit_offset, abort_ip)			\
-	"	.pushsection	__rseq_table, \"aw\"\n"				\
+	"	.pushsection	__rseq_cs, \"aw\"\n"				\
 	"	.balign	32\n"							\
 	__rseq_str(label) ":\n"							\
 	"	.long	" __rseq_str(version) ", " __rseq_str(flags) "\n"	\
 	"	.quad	" __rseq_str(start_ip) ", "				\
 			  __rseq_str(post_commit_offset) ", "			\
 			  __rseq_str(abort_ip) "\n"				\
+	"	.popsection\n\t"						\
+	"	.pushsection __rseq_cs_ptr_array, \"aw\"\n"				\
+	"	.quad " __rseq_str(label) "b\n"					\
 	"	.popsection\n"
 
 #define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip)	\
@@ -99,8 +102,8 @@ do {										\
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)				\
diff --git a/tools/testing/selftests/rseq/rseq-mips.h b/tools/testing/selftests/rseq/rseq-mips.h
index 25d10ff54769..fe3eabcdcbe5 100644
--- a/tools/testing/selftests/rseq/rseq-mips.h
+++ b/tools/testing/selftests/rseq/rseq-mips.h
@@ -54,26 +54,30 @@ do {									\
 # error unsupported _MIPS_SZLONG
 #endif
 
-#define __RSEQ_ASM_DEFINE_TABLE(version, flags,	start_ip, \
+#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip, \
 				post_commit_offset, abort_ip) \
-		".pushsection __rseq_table, \"aw\"\n\t" \
+		".pushsection __rseq_cs, \"aw\"\n\t" \
 		".balign 32\n\t" \
+		__rseq_str(label) ":\n\t"					\
 		".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		LONG " " U32_U64_PAD(__rseq_str(start_ip)) "\n\t" \
 		LONG " " U32_U64_PAD(__rseq_str(post_commit_offset)) "\n\t" \
 		LONG " " U32_U64_PAD(__rseq_str(abort_ip)) "\n\t" \
+		".popsection\n\t" \
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t" \
+		LONG " " U32_U64_PAD(__rseq_str(label) "b") "\n\t" \
 		".popsection\n\t"
 
-#define RSEQ_ASM_DEFINE_TABLE(start_ip, post_commit_ip, abort_ip) \
-	__RSEQ_ASM_DEFINE_TABLE(0x0, 0x0, start_ip, \
+#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
+	__RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip, \
 				(post_commit_ip - start_ip), abort_ip)
 
 /*
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip) \
@@ -127,7 +131,7 @@ int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -192,7 +196,7 @@ int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -261,7 +265,7 @@ int rseq_addv(intptr_t *v, intptr_t count, int cpu)
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
 #endif
@@ -316,7 +320,7 @@ int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -389,7 +393,7 @@ int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -463,7 +467,7 @@ int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -543,7 +547,7 @@ int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
@@ -664,7 +668,7 @@ int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
 
 	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(1f, 2f, 4f) /* start, commit, abort */
+		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
 #ifdef RSEQ_COMPARE_TWICE
 		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
diff --git a/tools/testing/selftests/rseq/rseq-ppc.h b/tools/testing/selftests/rseq/rseq-ppc.h
index 24f95649d71e..9df18487fa9f 100644
--- a/tools/testing/selftests/rseq/rseq-ppc.h
+++ b/tools/testing/selftests/rseq/rseq-ppc.h
@@ -33,8 +33,8 @@ do {									\
 #else /* !RSEQ_SKIP_FASTPATH */
 
 /*
- * The __rseq_table section can be used by debuggers to better handle
- * single-stepping through the restartable critical sections.
+ * The __rseq_cs_ptr_array and __rseq_cs sections can be used by debuggers to
+ * better handle single-stepping through the restartable critical sections.
  */
 
 #ifdef __PPC64__
@@ -46,11 +46,14 @@ do {									\
 
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,				\
 			start_ip, post_commit_offset, abort_ip)			\
-		".pushsection __rseq_table, \"aw\"\n\t"				\
+		".pushsection __rseq_cs, \"aw\"\n\t"				\
 		".balign 32\n\t"						\
 		__rseq_str(label) ":\n\t"					\
 		".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t"	\
 		".quad " __rseq_str(start_ip) ", " __rseq_str(post_commit_offset) ", " __rseq_str(abort_ip) "\n\t" \
+		".popsection\n\t"						\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"			\
+		".quad " __rseq_str(label) "b\n\t"				\
 		".popsection\n\t"
 
 #define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs)			\
@@ -67,8 +70,8 @@ do {									\
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
@@ -85,20 +88,23 @@ do {									\
 
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,				\
 			start_ip, post_commit_offset, abort_ip)			\
-		".pushsection __rseq_table, \"aw\"\n\t"				\
+		".pushsection __rseq_cs, \"aw\"\n\t"				\
 		".balign 32\n\t"						\
 		__rseq_str(label) ":\n\t"					\
 		".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t"	\
 		/* 32-bit only supported on BE */				\
 		".long 0x0, " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) "\n\t" \
+		".popsection\n\t"					\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"		\
+		".long 0x0, " __rseq_str(label) "b\n\t"			\
 		".popsection\n\t"
 
 /*
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)				\
diff --git a/tools/testing/selftests/rseq/rseq-s390.h b/tools/testing/selftests/rseq/rseq-s390.h
index b8b5b6f900af..fbb97815d71c 100644
--- a/tools/testing/selftests/rseq/rseq-s390.h
+++ b/tools/testing/selftests/rseq/rseq-s390.h
@@ -37,19 +37,22 @@ do {									\
 
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,			\
 				start_ip, post_commit_offset, abort_ip)	\
-		".pushsection __rseq_table, \"aw\"\n\t"			\
+		".pushsection __rseq_cs, \"aw\"\n\t"			\
 		".balign 32\n\t"					\
 		__rseq_str(label) ":\n\t"				\
 		".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".quad " __rseq_str(start_ip) ", " __rseq_str(post_commit_offset) ", " __rseq_str(abort_ip) "\n\t" \
+		".popsection\n\t"					\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"		\
+		".quad " __rseq_str(label) "b\n\t"			\
 		".popsection\n\t"
 
 /*
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
@@ -61,19 +64,22 @@ do {									\
 
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,			\
 				start_ip, post_commit_offset, abort_ip)	\
-		".pushsection __rseq_table, \"aw\"\n\t"			\
+		".pushsection __rseq_cs, \"aw\"\n\t"			\
 		".balign 32\n\t"					\
 		__rseq_str(label) ":\n\t"				\
 		".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".long 0x0, " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) "\n\t" \
+		".popsection\n\t"					\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"		\
+		".long 0x0, " __rseq_str(label) "b\n\t"			\
 		".popsection\n\t"
 
 /*
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
diff --git a/tools/testing/selftests/rseq/rseq-x86.h b/tools/testing/selftests/rseq/rseq-x86.h
index 0668608d3674..03095236f6fa 100644
--- a/tools/testing/selftests/rseq/rseq-x86.h
+++ b/tools/testing/selftests/rseq/rseq-x86.h
@@ -47,13 +47,17 @@ do {									\
 
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,			\
 				start_ip, post_commit_offset, abort_ip)	\
-		".pushsection __rseq_table, \"aw\"\n\t"			\
+		".pushsection __rseq_cs, \"aw\"\n\t"			\
 		".balign 32\n\t"					\
 		__rseq_str(label) ":\n\t"				\
 		".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".quad " __rseq_str(start_ip) ", " __rseq_str(post_commit_offset) ", " __rseq_str(abort_ip) "\n\t" \
+		".popsection\n\t"					\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"		\
+		".quad " __rseq_str(label) "b\n\t"			\
 		".popsection\n\t"
 
+
 #define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
 	__RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,		\
 				(post_commit_ip - start_ip), abort_ip)
@@ -62,8 +66,8 @@ do {									\
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
@@ -566,11 +570,14 @@ do {									\
  */
 #define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,			\
 				start_ip, post_commit_offset, abort_ip)	\
-		".pushsection __rseq_table, \"aw\"\n\t"			\
+		".pushsection __rseq_cs, \"aw\"\n\t"			\
 		".balign 32\n\t"					\
 		__rseq_str(label) ":\n\t"				\
 		".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".long " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) ", 0x0\n\t" \
+		".popsection\n\t"					\
+		".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"		\
+		".long " __rseq_str(label) "b, 0x0\n\t"			\
 		".popsection\n\t"
 
 #define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
@@ -581,8 +588,8 @@ do {									\
  * Exit points of a rseq critical section consist of all instructions outside
  * of the critical section where a critical section can either branch to or
  * reach through the normal course of its execution. The abort IP and the
- * post-commit IP are already part of the __rseq_table section and should not
- * be explicitly defined as additional exit points. Knowing all exit points is
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
  * useful to assist debuggers stepping over the critical section.
  */
 #define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
-- 
2.11.0
