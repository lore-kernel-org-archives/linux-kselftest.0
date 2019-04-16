From: oleg@redhat.com (Oleg Nesterov)
Date: Tue, 16 Apr 2019 14:04:31 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190411175043.31207-1-joel@joelfernandes.org>
References: <20190411175043.31207-1-joel@joelfernandes.org>
Message-ID: <20190416120430.GA15437@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416120431.tQlPtJ8dhLVtfD4ztPvjEVOgr153klDe2kaFe4SbytY@z>

On 04/11, Joel Fernandes (Google) wrote:
>
> +static unsigned int proc_tgid_base_poll(struct file *file, struct poll_table_struct *pts)
> +{
> +	int poll_flags = 0;
> +	struct task_struct *task;
> +	struct pid *pid;
> +
> +	task = get_proc_task(file->f_path.dentry->d_inode);
> +
> +	WARN_ON_ONCE(task && !thread_group_leader(task));
> +
> +	/*
> +	 * tasklist_lock must be held because to avoid racing with
> +	 * changes in exit_state and wake up. Basically to avoid:
> +	 *
> +	 * P0: read exit_state = 0
> +	 * P1: write exit_state = EXIT_DEAD
> +	 * P1: Do a wake up - wq is empty, so do nothing
> +	 * P0: Queue for polling - wait forever.
> +	 */
> +	read_lock(&tasklist_lock);
> +	if (!task)
> +		poll_flags = POLLIN | POLLRDNORM | POLLERR;
> +	else if (task->exit_state == EXIT_DEAD)
> +		poll_flags = POLLIN | POLLRDNORM;
> +	else if (task->exit_state == EXIT_ZOMBIE && thread_group_empty(task))
> +		poll_flags = POLLIN | POLLRDNORM;
> +
> +	if (!poll_flags) {
> +		pid = proc_pid(file->f_path.dentry->d_inode);
> +		poll_wait(file, &pid->wait_pidfd, pts);
> +	}

can't understand...

Could you explain when it should return POLLIN? When the whole process exits?

Then all you need is

	!task || task->exit_state && thread_group_empty(task)

Please do not use EXIT_DEAD/EXIT_ZOMBIE. And ->wait_pidfd should probably
live in task->signal_struct.

Oleg.
