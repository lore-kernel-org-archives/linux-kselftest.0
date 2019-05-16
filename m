From: oleg@redhat.com (Oleg Nesterov)
Date: Thu, 16 May 2019 16:27:00 +0200
Subject: [PATCH v1 1/2] pid: add pidfd_open()
In-Reply-To: <20190516135944.7205-1-christian@brauner.io>
References: <20190516135944.7205-1-christian@brauner.io>
Message-ID: <20190516142659.GB22564@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516142700.0vIF33oalLWDvC1q9NyUt3ueeFLIPO-FWZd8omNQgQk@z>

On 05/16, Christian Brauner wrote:
>
> With the introduction of pidfds through CLONE_PIDFD it is possible to
> created pidfds at process creation time.

Now I am wondering why do we need CLONE_PIDFD, you can just do

	pid = fork();
	pidfd_open(pid);

> +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> +{
> +	int fd, ret;
> +	struct pid *p;
> +	struct task_struct *tsk;
> +
> +	if (flags)
> +		return -EINVAL;
> +
> +	if (pid <= 0)
> +		return -EINVAL;
> +
> +	p = find_get_pid(pid);
> +	if (!p)
> +		return -ESRCH;
> +
> +	ret = 0;
> +	rcu_read_lock();
> +	/*
> +	 * If this returns non-NULL the pid was used as a thread-group
> +	 * leader. Note, we race with exec here: If it changes the
> +	 * thread-group leader we might return the old leader.
> +	 */
> +	tsk = pid_task(p, PIDTYPE_TGID);
> +	if (!tsk)
> +		ret = -ESRCH;
> +	rcu_read_unlock();
> +
> +	fd = ret ?: pidfd_create(p);
> +	put_pid(p);
> +	return fd;
> +}

Looks correct, feel free to add Reviewed-by: Oleg Nesterov <oleg at redhat.com>

But why do we need task_struct *tsk?

	rcu_read_lock();
	if (!pid_task(PIDTYPE_TGID))
		ret = -ESRCH;
	rcu_read_unlock();

and in fact we do not even need rcu_read_lock(), we could do

	// shut up rcu_dereference_check()
	rcu_lock_acquire(&rcu_lock_map);
	if (!pid_task(PIDTYPE_TGID))
		ret = -ESRCH;
	rcu_lock_release(&rcu_lock_map);

Well... I won't insist, but the comment about the race with exec looks a bit
confusing to me. It is true, but we do not care at all, we are not going to
use the task_struct returned by pid_task().

Oleg.
