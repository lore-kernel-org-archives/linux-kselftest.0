From: oleg@redhat.com (Oleg Nesterov)
Date: Wed, 15 May 2019 16:38:58 +0200
Subject: [PATCH 1/2] pid: add pidfd_open()
In-Reply-To: <20190515100400.3450-1-christian@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
Message-ID: <20190515143857.GB18892@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190515143858.D8LzwUubAgFl0XR687gke_31vVzM1UjWh31yEmg0sv0@z>

On 05/15, Christian Brauner wrote:
>
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
> +	rcu_read_lock();
> +	tsk = pid_task(p, PIDTYPE_PID);

You do not need find_get_pid() before rcu_lock and put_pid() at the end.
You can just do find_vpid() under rcu_read_lock().

> +	if (!tsk)
> +		ret = -ESRCH;
> +	else if (unlikely(!thread_group_leader(tsk)))
> +		ret = -EINVAL;

it seems that you can do a single check

	tsk = pid_task(p, PIDTYPE_TGID);
	if (!tsk)
		ret = -ESRCH;

this even looks more correct if we race with exec changing the leader.

Oleg.
