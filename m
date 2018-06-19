From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Tue, 19 Jun 2018 09:32:30 -0400
Subject: [PATCH for 4.18 3/3] rseq: cleanup: no need to abort rseq c.s. in
 child on fork
In-Reply-To: <20180619133230.4087-1-mathieu.desnoyers@efficios.com>
References: <20180619133230.4087-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180619133230.4087-4-mathieu.desnoyers@efficios.com>

Considering that we explicitly forbid system calls in rseq critical
sections, it is not valid to issue a fork or clone system call within a
rseq critical section, so rseq_fork() is not required to restart an
active rseq c.s. in the child process.

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
 include/linux/sched.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 87bf02d93a27..c1882643d455 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1831,9 +1831,7 @@ static inline void rseq_migrate(struct task_struct *t)
 
 /*
  * If parent process has a registered restartable sequences area, the
- * child inherits. Only applies when forking a process, not a thread. In
- * case a parent fork() in the middle of a restartable sequence, set the
- * resume notifier to force the child to retry.
+ * child inherits. Only applies when forking a process, not a thread.
  */
 static inline void rseq_fork(struct task_struct *t, unsigned long clone_flags)
 {
@@ -1847,7 +1845,6 @@ static inline void rseq_fork(struct task_struct *t, unsigned long clone_flags)
 		t->rseq_len = current->rseq_len;
 		t->rseq_sig = current->rseq_sig;
 		t->rseq_event_mask = current->rseq_event_mask;
-		rseq_preempt(t);
 	}
 }
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
