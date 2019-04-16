From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 16 Apr 2019 15:32:59 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190416192051.GA184889@google.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com>
Message-ID: <20190416193259.GA206245@google.com>

On Tue, Apr 16, 2019 at 03:20:51PM -0400, Joel Fernandes wrote:
> On Tue, Apr 16, 2019 at 02:04:31PM +0200, Oleg Nesterov wrote:
> > On 04/11, Joel Fernandes (Google) wrote:
> > >
> > > +static unsigned int proc_tgid_base_poll(struct file *file, struct poll_table_struct *pts)
> > > +{
> > > +	int poll_flags = 0;
> > > +	struct task_struct *task;
> > > +	struct pid *pid;
> > > +
> > > +	task = get_proc_task(file->f_path.dentry->d_inode);
> > > +
> > > +	WARN_ON_ONCE(task && !thread_group_leader(task));
> > > +
> > > +	/*
> > > +	 * tasklist_lock must be held because to avoid racing with
> > > +	 * changes in exit_state and wake up. Basically to avoid:
> > > +	 *
> > > +	 * P0: read exit_state = 0
> > > +	 * P1: write exit_state = EXIT_DEAD
> > > +	 * P1: Do a wake up - wq is empty, so do nothing
> > > +	 * P0: Queue for polling - wait forever.
> > > +	 */
> > > +	read_lock(&tasklist_lock);
> > > +	if (!task)
> > > +		poll_flags = POLLIN | POLLRDNORM | POLLERR;
> > > +	else if (task->exit_state == EXIT_DEAD)
> > > +		poll_flags = POLLIN | POLLRDNORM;
> > > +	else if (task->exit_state == EXIT_ZOMBIE && thread_group_empty(task))
> > > +		poll_flags = POLLIN | POLLRDNORM;
> > > +
> > > +	if (!poll_flags) {
> > > +		pid = proc_pid(file->f_path.dentry->d_inode);
> > > +		poll_wait(file, &pid->wait_pidfd, pts);
> > > +	}
> > 
> > can't understand...
> > 
> > Could you explain when it should return POLLIN? When the whole process exits?
> 
> It returns POLLIN when the task is dead or doesn't exist anymore, or when it
> is in a zombie state and there's no other thread in the thread group.
> 
> > Then all you need is
> > 
> > 	!task || task->exit_state && thread_group_empty(task)
> 
> Yes this works as well, all the tests pass with your suggestion so I'll
> change it to that. Although I will the be giving up returing EPOLLERR if the
> task_struct doesn't exit. We don't need that, but I thought it was cool to
> return it anyway.

Here I actually meant "task_struct doesn't exist" , sorry.

thanks,

 - Joel
 
