From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Tue, 21 Nov 2017 09:18:54 -0500
Subject: [Linux-kselftest-mirror] [RFC PATCH for 4.15 16/22] rseq:
	selftests: arm: workaround gcc asm size guess
In-Reply-To: <20171121141900.18471-1-mathieu.desnoyers@efficios.com>
References: <20171121141900.18471-1-mathieu.desnoyers@efficios.com>
Message-ID: <20171121141900.18471-17-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171121141854.ivnOBQai27XncGmkY1zXhlpmXNq5sHmYWKlmYBqJrPo@z>

Fixes assembler errors:
/tmp/cceKwI9a.s: Assembler messages:
/tmp/cceKwI9a.s:849: Error: co-processor offset out of range

with gcc prior to gcc-7. This can trigger if multiple rseq inline asm
are used within the same function.

My best guess on the cause of this issue is that gcc has a hard
time figuring out the actual size of the inline asm, and therefore
does not compute the offsets at which literal values can be
placed from the program counter accurately.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
CC: "Paul E. McKenney" <paulmck at linux.vnet.ibm.com>
CC: Peter Zijlstra <peterz at infradead.org>
CC: Paul Turner <pjt at google.com>
CC: Thomas Gleixner <tglx at linutronix.de>
CC: Andrew Hunter <ahh at google.com>
CC: Andy Lutomirski <luto at amacapital.net>
CC: Andi Kleen <andi at firstfloor.org>
CC: Dave Watson <davejwatson at fb.com>
CC: Chris Lameter <cl at linux.com>
CC: Ingo Molnar <mingo at redhat.com>
CC: "H. Peter Anvin" <hpa at zytor.com>
CC: Ben Maurer <bmaurer at fb.com>
CC: Steven Rostedt <rostedt at goodmis.org>
CC: Josh Triplett <josh at joshtriplett.org>
CC: Linus Torvalds <torvalds at linux-foundation.org>
CC: Andrew Morton <akpm at linux-foundation.org>
CC: Russell King <linux at arm.linux.org.uk>
CC: Catalin Marinas <catalin.marinas at arm.com>
CC: Will Deacon <will.deacon at arm.com>
CC: Michael Kerrisk <mtk.manpages at gmail.com>
CC: Boqun Feng <boqun.feng at gmail.com>
CC: Florian Weimer <fweimer at redhat.com>
CC: Shuah Khan <shuah at kernel.org>
CC: linux-kselftest at vger.kernel.org
CC: linux-api at vger.kernel.org
---
 tools/testing/selftests/rseq/rseq-arm.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/testing/selftests/rseq/rseq-arm.h b/tools/testing/selftests/rseq/rseq-arm.h
index 47953c0cef4f..6d3fda276f4d 100644
--- a/tools/testing/selftests/rseq/rseq-arm.h
+++ b/tools/testing/selftests/rseq/rseq-arm.h
@@ -79,12 +79,15 @@ do {									\
 		teardown						\
 		"b %l[" __rseq_str(cmpfail_label) "]\n\t"
 
+#define rseq_workaround_gcc_asm_size_guess()	__asm__ __volatile__("")
+
 static inline __attribute__((always_inline))
 int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv,
 		int cpu)
 {
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
@@ -115,11 +118,14 @@ int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
 
@@ -129,6 +135,7 @@ int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
 {
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
@@ -164,11 +171,14 @@ int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
 
@@ -177,6 +187,7 @@ int rseq_addv(intptr_t *v, intptr_t count, int cpu)
 {
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
@@ -203,8 +214,10 @@ int rseq_addv(intptr_t *v, intptr_t count, int cpu)
 		  RSEQ_INJECT_CLOBBER
 		: abort
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 }
@@ -216,6 +229,7 @@ int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
 {
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
@@ -253,11 +267,14 @@ int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
 
@@ -268,6 +285,7 @@ int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
 {
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
@@ -306,11 +324,14 @@ int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
 
@@ -321,6 +342,7 @@ int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
 {
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
@@ -359,11 +381,14 @@ int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
 
@@ -376,6 +401,7 @@ int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
 
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		"str %[src], %[rseq_scratch0]\n\t"
@@ -442,11 +468,14 @@ int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
 
@@ -459,6 +488,7 @@ int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
 
 	RSEQ_INJECT_C(9)
 
+	rseq_workaround_gcc_asm_size_guess();
 	__asm__ __volatile__ goto (
 		RSEQ_ASM_DEFINE_TABLE(__rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
 		"str %[src], %[rseq_scratch0]\n\t"
@@ -526,10 +556,13 @@ int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
 		  RSEQ_INJECT_CLOBBER
 		: abort, cmpfail
 	);
+	rseq_workaround_gcc_asm_size_guess();
 	return 0;
 abort:
+	rseq_workaround_gcc_asm_size_guess();
 	RSEQ_INJECT_FAILED
 	return -1;
 cmpfail:
+	rseq_workaround_gcc_asm_size_guess();
 	return 1;
 }
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
