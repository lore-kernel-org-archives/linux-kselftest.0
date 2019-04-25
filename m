From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Thu, 25 Apr 2019 15:00:09 -0400
Subject: [PATCH v1 1/2] Add polling support to pidfd
Message-ID: <20190425190010.46489-1-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190425190009.noVdOwAWOyuZxe5y4YleNTdlGf13PkbjbmkGVFHoqqs@z>

pidfd are file descriptors referring to a process created with the
CLONE_PIDFD clone(2) flag. Android low memory killer (LMK) needs pidfd
polling support to replace code that currently checks for existence of
/proc/pid for knowing that a process that is signalled to be killed has
died, which is both racy and slow. The pidfd poll approach is race-free,
and also allows the LMK to do other things (such as by polling on other
fds) while awaiting the process being killed to die.

It prevents a situation where a PID is reused between when LMK sends a
kill signal and checks for existence of the PID, since the wrong PID is
now possibly checked for existence.

In this patch, we follow the same existing mechanism in the kernel used
when the parent of the task group is to be notified (do_notify_parent).
This is when the tasks waiting on a poll of pidfd are also awakened.

We have decided to include the waitqueue in struct pid for the following
reasons:
1. The wait queue has to survive for the lifetime of the poll. Including
it in task_struct would not be option in this case because the task can
be reaped and destroyed before the poll returns.

2. By including the struct pid for the waitqueue means that during
de_thread(), the new thread group leader automatically gets the new
waitqueue/pid even though its task_struct is different.

Appropriate test cases are added in the second patch to provide coverage
of all the cases the patch is handling.

Andy had a similar patch [1] in the past which was a good reference
however this patch tries to handle different situations properly related
to thread group existence, and how/where it notifies. And also solves
other bugs (waitqueue lifetime).  Daniel had a similar patch [2]
recently which this patch supercedes.

[1] https://lore.kernel.org/patchwork/patch/345098/
[2] https://lore.kernel.org/lkml/20181029175322.189042-1-dancol at google.com/

Cc: luto at amacapital.net
Cc: rostedt at goodmis.org
Cc: dancol at google.com
Cc: sspatil at google.com
Cc: christian at brauner.io
Cc: jannh at google.com
Cc: surenb at google.com
Cc: timmurray at google.com
Cc: Jonathan Kowalski <bl0pbl33p at gmail.com>
Cc: torvalds at linux-foundation.org
Cc: kernel-team at android.com
Co-developed-by: Daniel Colascione <dancol at google.com>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

---

RFC -> v1:
* Based on CLONE_PIDFD patches: https://lwn.net/Articles/786244/
* Updated selftests.
* Renamed poll wake function to do_notify_pidfd.
* Removed depending on EXIT flags
* Removed POLLERR flag since semantics are controversial and
  we don't have usecases for it right now (later we can add if there's
  a need for it).

 include/linux/pid.h |  3 +++
 kernel/fork.c       | 33 +++++++++++++++++++++++++++++++++
 kernel/pid.c        |  2 ++
 kernel/signal.c     | 14 ++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/include/linux/pid.h b/include/linux/pid.h
index 3c8ef5a199ca..1484db6ca8d1 100644
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@ -3,6 +3,7 @@
 #define _LINUX_PID_H
 
 #include <linux/rculist.h>
+#include <linux/wait.h>
 
 enum pid_type
 {
@@ -60,6 +61,8 @@ struct pid
 	unsigned int level;
 	/* lists of tasks that use this pid */
 	struct hlist_head tasks[PIDTYPE_MAX];
+	/* wait queue for pidfd notifications */
+	wait_queue_head_t wait_pidfd;
 	struct rcu_head rcu;
 	struct upid numbers[1];
 };
diff --git a/kernel/fork.c b/kernel/fork.c
index 5525837ed80e..fb3b614f6456 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1685,8 +1685,41 @@ static void pidfd_show_fdinfo(struct seq_file *m, struct file *f)
 }
 #endif
 
+static unsigned int pidfd_poll(struct file *file, struct poll_table_struct *pts)
+{
+	struct task_struct *task;
+	struct pid *pid;
+	int poll_flags = 0;
+
+	/*
+	 * tasklist_lock must be held because to avoid racing with
+	 * changes in exit_state and wake up. Basically to avoid:
+	 *
+	 * P0: read exit_state = 0
+	 * P1: write exit_state = EXIT_DEAD
+	 * P1: Do a wake up - wq is empty, so do nothing
+	 * P0: Queue for polling - wait forever.
+	 */
+	read_lock(&tasklist_lock);
+	pid = file->private_data;
+	task = pid_task(pid, PIDTYPE_PID);
+	WARN_ON_ONCE(task && !thread_group_leader(task));
+
+	if (!task || (task->exit_state && thread_group_empty(task)))
+		poll_flags = POLLIN | POLLRDNORM;
+
+	if (!poll_flags)
+		poll_wait(file, &pid->wait_pidfd, pts);
+
+	read_unlock(&tasklist_lock);
+
+	return poll_flags;
+}
+
+
 const struct file_operations pidfd_fops = {
 	.release = pidfd_release,
+	.poll = pidfd_poll,
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = pidfd_show_fdinfo,
 #endif
diff --git a/kernel/pid.c b/kernel/pid.c
index 20881598bdfa..5c90c239242f 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -214,6 +214,8 @@ struct pid *alloc_pid(struct pid_namespace *ns)
 	for (type = 0; type < PIDTYPE_MAX; ++type)
 		INIT_HLIST_HEAD(&pid->tasks[type]);
 
+	init_waitqueue_head(&pid->wait_pidfd);
+
 	upid = pid->numbers + ns->level;
 	spin_lock_irq(&pidmap_lock);
 	if (!(ns->pid_allocated & PIDNS_ADDING))
diff --git a/kernel/signal.c b/kernel/signal.c
index 1581140f2d99..16e7718316e5 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1800,6 +1800,17 @@ int send_sigqueue(struct sigqueue *q, struct pid *pid, enum pid_type type)
 	return ret;
 }
 
+static void do_notify_pidfd(struct task_struct *task)
+{
+	struct pid *pid;
+
+	lockdep_assert_held(&tasklist_lock);
+
+	pid = get_task_pid(task, PIDTYPE_PID);
+	wake_up_all(&pid->wait_pidfd);
+	put_pid(pid);
+}
+
 /*
  * Let a parent know about the death of a child.
  * For a stopped/continued status change, use do_notify_parent_cldstop instead.
@@ -1823,6 +1834,9 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	BUG_ON(!tsk->ptrace &&
 	       (tsk->group_leader != tsk || !thread_group_empty(tsk)));
 
+	/* Wake up all pidfd waiters */
+	do_notify_pidfd(tsk);
+
 	if (sig != SIGCHLD) {
 		/*
 		 * This is only possible if parent == real_parent.
-- 
2.21.0.593.g511ec345e18-goog
