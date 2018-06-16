From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Sat, 16 Jun 2018 15:44:56 -0400
Subject: [RFC PATCH for 4.18 2/2] rseq/selftests: arm: align struct rseq_cs on
 32 bytes
In-Reply-To: <20180616194456.26159-1-mathieu.desnoyers@efficios.com>
References: <20180616194456.26159-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180616194456.26159-3-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180616194456.mhaEvU5W-_Dq962ohuQWm8XcbDIrHUiLMg42RJsAHoA@z>

uapi/linux/rseq.h aligns struct rseq_cs on 32 bytes. Satisfy this
alignment requirement in its definition within the rseq-arm.h
inline assembly.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Joel Fernandes <joelaf at google.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Dave Watson <davejwatson at fb.com>
Cc: Will Deacon <will.deacon at arm.com>
Cc: Shuah Khan <shuahkh at osg.samsung.com>
Cc: Andi Kleen <andi at firstfloor.org>
Cc: linux-kselftest at vger.kernel.org
Cc: "H . Peter Anvin" <hpa at zytor.com>
Cc: Chris Lameter <cl at linux.com>
Cc: Russell King <linux at arm.linux.org.uk>
Cc: Andrew Hunter <ahh at google.com>
Cc: Michael Kerrisk <mtk.manpages at gmail.com>
Cc: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>
Cc: Paul Turner <pjt at google.com>
Cc: Boqun Feng <boqun.feng at gmail.com>
Cc: Josh Triplett <josh at joshtriplett.org>
Cc: Steven Rostedt <rostedt at goodmis.org>
Cc: Ben Maurer <bmaurer at fb.com>
Cc: linux-api at vger.kernel.org
Cc: Andy Lutomirski <luto at amacapital.net>
Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
---
 tools/testing/selftests/rseq/rseq-arm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/rseq/rseq-arm.h b/tools/testing/selftests/rseq/rseq-arm.h
index 3b055f9aeaab..3cea19877227 100644
--- a/tools/testing/selftests/rseq/rseq-arm.h
+++ b/tools/testing/selftests/rseq/rseq-arm.h
@@ -57,6 +57,7 @@ do {									\
 #define __RSEQ_ASM_DEFINE_ABORT(table_label, label, teardown,		\
 				abort_label, version, flags,		\
 				start_ip, post_commit_offset, abort_ip)	\
+		".balign 32\n\t"					\
 		__rseq_str(table_label) ":\n\t"				\
 		".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
 		".word " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) ", 0x0\n\t" \
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
