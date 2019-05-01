From: oleg@redhat.com (Oleg Nesterov)
Date: Wed, 1 May 2019 17:13:12 +0200
Subject: [PATCH v2 1/2] Add polling support to pidfd
In-Reply-To: <20190430162154.61314-1-joel@joelfernandes.org>
References: <20190430162154.61314-1-joel@joelfernandes.org>
Message-ID: <20190501151312.GA30235@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501151312.lIAR9QBBgpetFlnK4UUDrJvfHIlvUIGyI7Mdu8EO8W0@z>

On 04/30, Joel Fernandes (Google) wrote:
>
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
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^

Ah, this is not right, we can race with de_thread() which changes the leader,
in particular it does leader->exit_signal = -1 to indicate that this thread is
no longer a group leader, but pid_task() can return the old leader.

We are going to check thread_group_empty() below, it won't be true in this case,
so this race should not make any harm.

Just remove this WARN_ON(). We can't use has_group_leader_pid(), it can return
false if pid_task() returns the new leader.

Otherwise I see no problems.

Oleg.
