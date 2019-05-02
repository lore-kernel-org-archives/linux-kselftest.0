From: christian at brauner.io (Christian Brauner)
Date: Thu, 2 May 2019 17:13:21 +0200
Subject: [PATCH v2 1/2] Add polling support to pidfd
In-Reply-To: <20190501151312.GA30235@redhat.com>
References: <20190430162154.61314-1-joel@joelfernandes.org>
 <20190501151312.GA30235@redhat.com>
Message-ID: <20190502151320.cvc6uc3b4bmww23k@brauner.io>

On Wed, May 01, 2019 at 05:13:12PM +0200, Oleg Nesterov wrote:
> On 04/30, Joel Fernandes (Google) wrote:
> >
> > +static unsigned int pidfd_poll(struct file *file, struct poll_table_struct *pts)
> > +{
> > +	struct task_struct *task;
> > +	struct pid *pid = file->private_data;
> > +	int poll_flags = 0;
> > +
> > +	poll_wait(file, &pid->wait_pidfd, pts);
> > +
> > +	rcu_read_lock();
> > +	task = pid_task(pid, PIDTYPE_PID);
> > +	WARN_ON_ONCE(task && !thread_group_leader(task));
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Ah, this is not right, we can race with de_thread() which changes the leader,
> in particular it does leader->exit_signal = -1 to indicate that this thread is
> no longer a group leader, but pid_task() can return the old leader.
> 
> We are going to check thread_group_empty() below, it won't be true in this case,
> so this race should not make any harm.
> 
> Just remove this WARN_ON(). We can't use has_group_leader_pid(), it can return
> false if pid_task() returns the new leader.
> 
> Otherwise I see no problems.

I'll remove the WARN_ON() check when applying this. Can I get your
Acked/Review, Oleg?

Christian
