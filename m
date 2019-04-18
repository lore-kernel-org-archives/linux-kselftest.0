From: bl0pbl33p@gmail.com (Jonathan Kowalski)
Date: Thu, 18 Apr 2019 19:44:33 +0100
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190416192051.GA184889@google.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com> <20190416192051.GA184889@google.com>
Message-ID:
 <CAGLj2rELsr0PUgu41uZX_TKCpT-Q00X+cvgBhJ-U7RU3EBo5tA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418184433.vbMAydqYec2wUYGjaYSPhSwBJuhwegrMIPLRwfZMNkE@z>

On Tue, Apr 16, 2019@8:21 PM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Tue, Apr 16, 2019@02:04:31PM +0200, Oleg Nesterov wrote:
> > On 04/11, Joel Fernandes (Google) wrote:
> > >
> > > +static unsigned int proc_tgid_base_poll(struct file *file, struct poll_table_struct *pts)
> > > +{
> > > +   int poll_flags = 0;
> > > +   struct task_struct *task;
> > > +   struct pid *pid;
> > > +
> > > +   task = get_proc_task(file->f_path.dentry->d_inode);
> > > +
> > > +   WARN_ON_ONCE(task && !thread_group_leader(task));
> > > +
> > > +   /*
> > > +    * tasklist_lock must be held because to avoid racing with
> > > +    * changes in exit_state and wake up. Basically to avoid:
> > > +    *
> > > +    * P0: read exit_state = 0
> > > +    * P1: write exit_state = EXIT_DEAD
> > > +    * P1: Do a wake up - wq is empty, so do nothing
> > > +    * P0: Queue for polling - wait forever.
> > > +    */
> > > +   read_lock(&tasklist_lock);
> > > +   if (!task)
> > > +           poll_flags = POLLIN | POLLRDNORM | POLLERR;
> > > +   else if (task->exit_state == EXIT_DEAD)
> > > +           poll_flags = POLLIN | POLLRDNORM;
> > > +   else if (task->exit_state == EXIT_ZOMBIE && thread_group_empty(task))
> > > +           poll_flags = POLLIN | POLLRDNORM;
> > > +
> > > +   if (!poll_flags) {
> > > +           pid = proc_pid(file->f_path.dentry->d_inode);
> > > +           poll_wait(file, &pid->wait_pidfd, pts);
> > > +   }
> >
> > can't understand...
> >
> > Could you explain when it should return POLLIN? When the whole process exits?
>
> It returns POLLIN when the task is dead or doesn't exist anymore, or when it
> is in a zombie state and there's no other thread in the thread group.
>

Would using something other than POLLIN be an option (maybe POLLPRI)?
The convention is to use it to indicate readability on the descriptor,
and also possibly POLLHUP instead of POLLERR (the latter is less of a
problem, but FreeBSD also does the same, so it'd help with some
consistency for libraries wanting to use this, which aren't interested
in other sub states).

>
>  - Joel
>
