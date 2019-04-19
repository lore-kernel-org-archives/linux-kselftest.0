From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 19 Apr 2019 14:12:58 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190417130940.GC32622@redhat.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
Message-ID: <20190419181258.GA251571@google.com>

Just returned to work today dealing with "life" issues, apologies for the
delays in replying. :)

On Wed, Apr 17, 2019 at 03:09:41PM +0200, Oleg Nesterov wrote:
> On 04/16, Joel Fernandes wrote:
> >
> > On Tue, Apr 16, 2019 at 02:04:31PM +0200, Oleg Nesterov wrote:
> > >
> > > Could you explain when it should return POLLIN? When the whole process exits?
> >
> > It returns POLLIN when the task is dead or doesn't exist anymore, or when it
> > is in a zombie state and there's no other thread in the thread group.
> 
> IOW, when the whole thread group exits, so it can't be used to monitor sub-threads.
> 
> just in case... speaking of this patch it doesn't modify proc_tid_base_operations,
> so you can't poll("/proc/sub-thread-tid") anyway, but iiuc you are going to use
> the anonymous file returned by CLONE_PIDFD ?

Yes, I am going to be converting to non-proc file returned by CLONE_PIDFD,
yes. (But I am still catching up with all threads and will read the latest on
whether we are still consider proc pidfds, last I understand - we are not).

> > > Then all you need is
> > >
> > > 	!task || task->exit_state && thread_group_empty(task)
> >
> > Yes this works as well, all the tests pass with your suggestion so I'll
> > change it to that. Although I will the be giving up returing EPOLLERR if the
> > task_struct doesn't exit. We don't need that, but I thought it was cool to
> > return it anyway.
> 
> OK, task == NULL means that it was already reaped by parent, pid_nr is free,
> probably useful....

Ok I will add that semantic as well then.

> > > Please do not use EXIT_DEAD/EXIT_ZOMBIE. And ->wait_pidfd should probably
> > > live in task->signal_struct.
> >
> > About wait_pidfd living in signal_struct, that wont work since the waitqueue
> > has to survive for the duration of the poll system call.
> 
> That is why I said this will need the additional cleanup in free_signal_struct().
> But I was wrong, somehow I forgot that free_poll_entry() needs wq_head->lock ;)
> so this will need much more complications, lets forget it...

Ok np :)

> > Also the waitqueue living in struct pid solves the de_thread() issue I
> > mentioned later in the following thread and in the commit message:
> > https://lore.kernel.org/patchwork/comment/1257175/
> 
> Hmm...
> 
> 	2. By including the struct pid for the waitqueue means that during
> 	de_exec, the thread doing de_thread() automatically gets the new
> 	waitqueue/pid even though its task_struct is different.
> 
> this one?
> 
> this is not true, or I do not understand...
> 
> it gets the _same_ (old, not new) PIDTYPE_TGID pid even if it changes task_struct.
> But probably this is what you actually meant, because this is what your patch wants
> or I am totally confused.

Yes, that's what I meant, sorry.

> And note that exec/de_thread doesn't change ->signal_struct, so I do not understand
> you anyway. Nevermind.

Yes right, but the signal_struct would suffer from the waitqueue lifetime
issue anyway so we can't use it. The current patch works well for everything.

thanks,

- Joel
