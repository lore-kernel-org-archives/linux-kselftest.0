From: christian@brauner.io (Christian Brauner)
Date: Tue, 21 May 2019 18:41:42 +0200
Subject: [PATCH 1/2] open: add close_range()
In-Reply-To: <28114.1558456227@warthog.procyon.org.uk>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
Message-ID: <20190521164141.rbehqnghiej3gfua@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190521164142.yEYDnuOmqIeAhzpNWl5UjVmXmc_Sk6WS4qquZPecb5U@z>

On Tue, May 21, 2019@05:30:27PM +0100, David Howells wrote:
> Al Viro <viro@zeniv.linux.org.uk> wrote:
> 
> > Umm...  That's going to be very painful if you dup2() something to MAX_INT and
> > then run that; roughly 2G iterations of bouncing ->file_lock up and down,
> > without anything that would yield CPU in process.
> > 
> > If anything, I would suggest something like
> > 
> > 	fd = *start_fd;
> > 	grab the lock
> >         fdt = files_fdtable(files);
> > more:
> > 	look for the next eviction candidate in ->open_fds, starting at fd
> > 	if there's none up to max_fd
> > 		drop the lock
> > 		return NULL
> > 	*start_fd = fd + 1;
> > 	if the fscker is really opened and not just reserved
> > 		rcu_assign_pointer(fdt->fd[fd], NULL);
> > 		__put_unused_fd(files, fd);
> > 		drop the lock
> > 		return the file we'd got
> > 	if (unlikely(need_resched()))
> > 		drop lock
> > 		cond_resched();
> > 		grab lock
> > 		fdt = files_fdtable(files);
> > 	goto more;
> > 
> > with the main loop being basically
> > 	while ((file = pick_next(files, &start_fd, max_fd)) != NULL)
> > 		filp_close(file, files);
> 
> If we can live with close_from(int first) rather than close_range(), then this
> can perhaps be done a lot more efficiently by:

Yeah, you mentioned this before. I do like being able to specify an
upper bound to have the ability to place fds strategically after said
upper bound.
I have used this quite a few times where I know that given task may have
inherited up to m fds and I want to inherit a specific pipe who's fd I
know. Then I'd dup2(pipe_fd, <upper_bound + 1>) and then close all
other fds. Is that too much of a corner case?

Christian
