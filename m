From: christian at brauner.io (Christian Brauner)
Date: Tue, 30 Apr 2019 21:07:53 +0200
Subject: [PATCH v2 1/2] Add polling support to pidfd
In-Reply-To: <20190430162154.61314-1-joel@joelfernandes.org>
References: <20190430162154.61314-1-joel@joelfernandes.org>
Message-ID: <20190430190752.vwtq4kky6wdprm2d@brauner.io>

On Tue, Apr 30, 2019 at 12:21:53PM -0400, Joel Fernandes (Google) wrote:
> Android low memory killer (LMK) needs to know when a process dies once
> it is sent the kill signal. It does so by checking for the existence of
> /proc/pid which is both racy and slow. For example, if a PID is reused
> between when LMK sends a kill signal and checks for existence of the
> PID, since the wrong PID is now possibly checked for existence.
> 
> This patch adds polling support to pidfd. Using the polling support, LMK
> will be able to get notified when a process exists in race-free and fast
> way, and allows the LMK to do other things (such as by polling on other
> fds) while awaiting the process being killed to die.
> 
> For notification to polling processes, we follow the same existing
> mechanism in the kernel used when the parent of the task group is to be
> notified of a child's death (do_notify_parent).  This is precisely when
> the tasks waiting on a poll of pidfd are also awakened in this patch.
> 
> We have decided to include the waitqueue in struct pid for the following
> reasons:
> 1. The wait queue has to survive for the lifetime of the poll. Including
> it in task_struct would not be option in this case because the task can
> be reaped and destroyed before the poll returns.
> 
> 2. By including the struct pid for the waitqueue means that during
> de_thread(), the new thread group leader automatically gets the new
> waitqueue/pid even though its task_struct is different.
> 
> Appropriate test cases are added in the second patch to provide coverage
> of all the cases the patch is handling.
> 
> Andy had a similar patch [1] in the past which was a good reference
> however this patch tries to handle different situations properly related
> to thread group existence, and how/where it notifies. And also solves
> other bugs (waitqueue lifetime).  Daniel had a similar patch [2]
> recently which this patch supercedes.
> 
> [1] https://lore.kernel.org/patchwork/patch/345098/
> [2] https://lore.kernel.org/lkml/20181029175322.189042-1-dancol at google.com/
> 
> Cc: Andy Lutomirski <luto at amacapital.net>
> Cc: Steven Rostedt <rostedt at goodmis.org>
> Cc: Daniel Colascione <dancol at google.com>
> Cc: Christian Brauner <christian at brauner.io>
> Cc: Jann Horn <jannh at google.com>
> Cc: Tim Murray <timmurray at google.com>
> Cc: Jonathan Kowalski <bl0pbl33p at gmail.com>
> Cc: Linus Torvalds <torvalds at linux-foundation.org>
> Cc: Al Viro <viro at zeniv.linux.org.uk>
> Cc: Kees Cook <keescook at chromium.org>
> Cc: David Howells <dhowells at redhat.com>
> Cc: Oleg Nesterov <oleg at redhat.com>
> Cc: kernel-team at android.com
> (Oleg improved the code by showing how to avoid tasklist_lock)
> Suggested-by: Oleg Nesterov <oleg at redhat.com>
> Co-developed-by: Daniel Colascione <dancol at google.com>
> Signed-off-by: Daniel Colascione <dancol at google.com>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

This looks good to me. Once Oleg has given his Ack/Review I'm going to
move this into pidfd for-next and as mentioned before schedule it for
5.3 after CLONE_PIDFD has been merged.

Reviewed-by: Christian Brauner <christian at brauner.io>

> 
> ---
> 
> v1 -> v2:
> * Restructure poll code to avoid tasklist_lock (Oleg)
> * use task_pid instead of get_pid_task in notify_pidfd (Oleg)
> * Added comments to code, commit message nits (Christian)
> * Test case nits/improvements (Christian)
> 
> RFC -> v1:
> * Based on CLONE_PIDFD patches: https://lwn.net/Articles/786244/
> * Updated selftests.
> * Renamed poll wake function to do_notify_pidfd.
> * Removed depending on EXIT flags
> * Removed POLLERR flag since semantics are controversial and
>   we don't have usecases for it right now (later we can add if there's
>   a need for it).
> 
>  include/linux/pid.h |  3 +++
>  kernel/fork.c       | 29 +++++++++++++++++++++++++++++
>  kernel/pid.c        |  2 ++
>  kernel/signal.c     | 11 +++++++++++
>  4 files changed, 45 insertions(+)
> 
> diff --git a/include/linux/pid.h b/include/linux/pid.h
> index 3c8ef5a199ca..1484db6ca8d1 100644
> --- a/include/linux/pid.h
> +++ b/include/linux/pid.h
> @@ -3,6 +3,7 @@
>  #define _LINUX_PID_H
>  
>  #include <linux/rculist.h>
> +#include <linux/wait.h>
>  
>  enum pid_type
>  {
> @@ -60,6 +61,8 @@ struct pid
>  	unsigned int level;
>  	/* lists of tasks that use this pid */
>  	struct hlist_head tasks[PIDTYPE_MAX];
> +	/* wait queue for pidfd notifications */
> +	wait_queue_head_t wait_pidfd;
>  	struct rcu_head rcu;
>  	struct upid numbers[1];
>  };
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5525837ed80e..721f8c9d2921 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1685,8 +1685,37 @@ static void pidfd_show_fdinfo(struct seq_file *m, struct file *f)
>  }
>  #endif
>  
> +/*
> + * Poll support for process exit notification.
> + */
> +static unsigned int pidfd_poll(struct file *file, struct poll_table_struct *pts)
> +{
> +	struct task_struct *task;
> +	struct pid *pid = file->private_data;
> +	int poll_flags = 0;
> +
> +	poll_wait(file, &pid->wait_pidfd, pts);
> +
> +	rcu_read_lock();
> +	task = pid_task(pid, PIDTYPE_PID);
> +	WARN_ON_ONCE(task && !thread_group_leader(task));
> +
> +	/*
> +	 * Inform pollers only when the whole thread group exits, if thread
> +	 * group leader exits before all other threads in the group, then
> +	 * poll(2) should block, similar to the wait(2) family.
> +	 */
> +	if (!task || (task->exit_state && thread_group_empty(task)))
> +		poll_flags = POLLIN | POLLRDNORM;
> +	rcu_read_unlock();
> +
> +	return poll_flags;
> +}
> +
> +
>  const struct file_operations pidfd_fops = {
>  	.release = pidfd_release,
> +	.poll = pidfd_poll,
>  #ifdef CONFIG_PROC_FS
>  	.show_fdinfo = pidfd_show_fdinfo,
>  #endif
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 20881598bdfa..5c90c239242f 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -214,6 +214,8 @@ struct pid *alloc_pid(struct pid_namespace *ns)
>  	for (type = 0; type < PIDTYPE_MAX; ++type)
>  		INIT_HLIST_HEAD(&pid->tasks[type]);
>  
> +	init_waitqueue_head(&pid->wait_pidfd);
> +
>  	upid = pid->numbers + ns->level;
>  	spin_lock_irq(&pidmap_lock);
>  	if (!(ns->pid_allocated & PIDNS_ADDING))
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 1581140f2d99..a17fff073c3d 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1800,6 +1800,14 @@ int send_sigqueue(struct sigqueue *q, struct pid *pid, enum pid_type type)
>  	return ret;
>  }
>  
> +static void do_notify_pidfd(struct task_struct *task)
> +{
> +	struct pid *pid;
> +
> +	pid = task_pid(task);
> +	wake_up_all(&pid->wait_pidfd);
> +}
> +
>  /*
>   * Let a parent know about the death of a child.
>   * For a stopped/continued status change, use do_notify_parent_cldstop instead.
> @@ -1823,6 +1831,9 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  	BUG_ON(!tsk->ptrace &&
>  	       (tsk->group_leader != tsk || !thread_group_empty(tsk)));
>  
> +	/* Wake up all pidfd waiters */
> +	do_notify_pidfd(tsk);
> +
>  	if (sig != SIGCHLD) {
>  		/*
>  		 * This is only possible if parent == real_parent.
> -- 
> 2.21.0.593.g511ec345e18-goog
