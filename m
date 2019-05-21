From: christian at brauner.io (Christian Brauner)
Date: Tue, 21 May 2019 15:04:39 +0200
Subject: [PATCH 1/2] open: add close_range()
In-Reply-To: <87tvdoau12.fsf@oldenburg2.str.redhat.com>
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
Message-ID: <20190521130438.q3u4wvve7p6md6cm@brauner.io>

On Tue, May 21, 2019 at 02:09:29PM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> > +/**
> > + * __close_range() - Close all file descriptors in a given range.
> > + *
> > + * @fd:     starting file descriptor to close
> > + * @max_fd: last file descriptor to close
> > + *
> > + * This closes a range of file descriptors. All file descriptors
> > + * from @fd up to and including @max_fd are closed.
> > + */
> > +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> > +{
> > +	unsigned int cur_max;
> > +
> > +	if (fd > max_fd)
> > +		return -EINVAL;
> > +
> > +	rcu_read_lock();
> > +	cur_max = files_fdtable(files)->max_fds;
> > +	rcu_read_unlock();
> > +
> > +	/* cap to last valid index into fdtable */
> > +	if (max_fd >= cur_max)
> > +		max_fd = cur_max - 1;
> > +
> > +	while (fd <= max_fd)
> > +		__close_fd(files, fd++);
> > +
> > +	return 0;
> > +}
> 
> This seems rather drastic.  How long does this block in kernel mode?
> Maybe it's okay as long as the maximum possible value for cur_max stays
> around 4 million or so.

That's probably valid concern when you reach very high numbers though I
wonder how relevant this is in practice.
Also, you would only be blocking yourself I imagine, i.e. you can't DOS
another task with this unless your multi-threaded.

> 
> Solaris has an fdwalk function:
> 
>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
> 
> So a different way to implement this would expose a nextfd system call

Meh. If nextfd() then I would like it to be able to:
- get the nextfd(fd) >= fd
- get highest open fd e.g. nextfd(-1)

But then I wonder if nextfd() needs to be a syscall and isn't just
either:
fcntl(fd, F_GET_NEXT)?
or
prctl(PR_GET_NEXT)?

Technically, one could also do:

fd_range(unsigned fd, unsigend end_fd, unsigned flags);

fd_range(3, 50, FD_RANGE_CLOSE);

/* return highest fd within the range [3, 50] */
fd_range(3, 50, FD_RANGE_NEXT);

/* return highest fd */
fd_range(3, UINT_MAX, FD_RANGE_NEXT);

This syscall could also reasonably be extended.

> to userspace, so that we can use that to implement both fdwalk and
> closefrom.  But maybe fdwalk is just too obscure, given the existence of
> /proc.

Yeah we probably don't need fdwalk.

> 
> I'll happily implement closefrom on top of close_range in glibc (plus
> fallback for older kernels based on /proc—with an abort in case that
> doesn't work because the RLIMIT_NOFILE hack is unreliable
> unfortunately).
> 
> Thanks,
> Florian
