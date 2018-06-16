From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Sat, 16 Jun 2018 15:44:55 -0400
Subject: [RFC PATCH for 4.18 1/2] rseq/selftests: run_param_test.sh should be
 executable
In-Reply-To: <20180616194456.26159-1-mathieu.desnoyers@efficios.com>
References: <20180616194456.26159-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180616194456.26159-2-mathieu.desnoyers@efficios.com>

The executable bit of the run_param_test.sh script got lost in
the merge.

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
 tools/testing/selftests/rseq/run_param_test.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tools/testing/selftests/rseq/run_param_test.sh

diff --git a/tools/testing/selftests/rseq/run_param_test.sh b/tools/testing/selftests/rseq/run_param_test.sh
old mode 100644
new mode 100755
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
