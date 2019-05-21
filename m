From: fweimer@redhat.com (Florian Weimer)
Date: Tue, 21 May 2019 14:09:29 +0200
Subject: [PATCH 1/2] open: add close_range()
In-Reply-To: <20190521113448.20654-1-christian@brauner.io> (Christian
 Brauner's message of "Tue, 21 May 2019 13:34:47 +0200")
References: <20190521113448.20654-1-christian@brauner.io>
Message-ID: <87tvdoau12.fsf@oldenburg2.str.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190521120929.Bj2L8Wyk2Y0NOLqaywPo0PIXuiohyDjPrxA-BSCq2Io@z>

* Christian Brauner:

> +/**
> + * __close_range() - Close all file descriptors in a given range.
> + *
> + * @fd:     starting file descriptor to close
> + * @max_fd: last file descriptor to close
> + *
> + * This closes a range of file descriptors. All file descriptors
> + * from @fd up to and including @max_fd are closed.
> + */
> +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> +{
> +	unsigned int cur_max;
> +
> +	if (fd > max_fd)
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	cur_max = files_fdtable(files)->max_fds;
> +	rcu_read_unlock();
> +
> +	/* cap to last valid index into fdtable */
> +	if (max_fd >= cur_max)
> +		max_fd = cur_max - 1;
> +
> +	while (fd <= max_fd)
> +		__close_fd(files, fd++);
> +
> +	return 0;
> +}

This seems rather drastic.  How long does this block in kernel mode?
Maybe it's okay as long as the maximum possible value for cur_max stays
around 4 million or so.

Solaris has an fdwalk function:

  <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>

So a different way to implement this would expose a nextfd system call
to userspace, so that we can use that to implement both fdwalk and
closefrom.  But maybe fdwalk is just too obscure, given the existence of
/proc.

I'll happily implement closefrom on top of close_range in glibc (plus
fallback for older kernels based on /proc—with an abort in case that
doesn't work because the RLIMIT_NOFILE hack is unreliable
unfortunately).

Thanks,
Florian
