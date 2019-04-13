From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 12 Apr 2019 20:09:41 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CALCETrV7Hw50Bh=qQX86v_6euiGqX7eNboi50_7JmfQsyVR3_A@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <CALCETrV7Hw50Bh=qQX86v_6euiGqX7eNboi50_7JmfQsyVR3_A@mail.gmail.com>
Message-ID: <20190413000941.GA53420@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413000941.U9qoplg2lcUywewCiKQi6XaU1ZJDZbGIiZb67dw0pk8@z>

Hi Andy!

On Fri, Apr 12, 2019@02:32:53PM -0700, Andy Lutomirski wrote:
> On Thu, Apr 11, 2019 at 10:51 AM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> >
> > pidfd are /proc/pid directory file descriptors referring to a task group
> > leader. Android low memory killer (LMK) needs pidfd polling support to
> > replace code that currently checks for existence of /proc/pid for
> > knowing a process that is signalled to be killed has died, which is both
> > racy and slow. The pidfd poll approach is race-free, and also allows the
> > LMK to do other things (such as by polling on other fds) while awaiting
> > the process being killed to die.
> >
> > It prevents a situation where a PID is reused between when LMK sends a
> > kill signal and checks for existence of the PID, since the wrong PID is
> > now possibly checked for existence.
> >
> > In this patch, we follow the same mechanism used uhen the parent of the
> > task group is to be notified, that is when the tasks waiting on a poll
> > of pidfd are also awakened.
> >
> > We have decided to include the waitqueue in struct pid for the following
> > reasons:
> > 1. The wait queue has to survive for the lifetime of the poll. Including
> > it in task_struct would not be option in this case because the task can
> > be reaped and destroyed before the poll returns.
> 
> Are you sure?  I admit I'm not all that familiar with the innards of
> poll() on Linux, but I thought that the waitqueue only had to survive
> long enough to kick the polling thread and did *not* have to survive
> until poll() actually returned.

I am not sure now. I thought epoll(2) was based on the wait_event APIs,
however more closely looking at the eventpoll code, it looks like there are 2
waitqueues involved, one that we pass and the other that is a part of the
eventpoll session itself, so you could be right about that. Daniel Colascione
may have some more thoughts about it since he brought up the possiblity of a
wq life-time issue. Daniel?   We were just playing it safe.

Either way the waitqueue in struct pid has the advantage mentioned below:

> > 2. By including the struct pid for the waitqueue means that during
> > de_exec, the thread doing de_thread() automatically gets the new
> > waitqueue/pid even though its task_struct is different.
> 
> I didn't follow this.  Can you clarify?

Sure. de_thread() can called when all threads of a thread group need to die
when any thread in the group does an execve. The thread doing the execve will
become the new thread leader. In this case, the thread that did the exec gets
the pid of the new leader. The semantics of wait(2) are such that the wait
should not return (unblock) in the above scenario because the group is
non-empty even though the task_struct of the group leader died. IOW, we
should not wake up any pidfd pollers in this cases.

So basically what I was trying to say in point 2 above is that because of
putting the waitqueue in struct pid, the change_pid() in de_thread()
automatically carries the waiting tasks to the new task_struct leader,
because the pid gets transferred to the new leader. If we put it in
task_struct, then that wouldn't work since the leader's task_struct would get
destroyed and we would have to handle the case in some other way. At least
that is the theory.  Anyway we specifically test for this case in patch 2/2
and also tested that not handling this case fails the test.

> Also, please don't call your new helper wake_up_pidfd_pollers().  One

I will call it wake_up_pollers() then, if that's Ok.

> of the goals of my patch was to make it generically possible for
> kernel code to wait for a task to exit.  There are other cases besides
> pidfd for which this would be useful.  Ahem, kthread.  (The kthread
> implementation currently does some seriously awful things to detect
> when kthreads die.)  Also, some hypothetical future vastly improved
> debugging API (to supercede ptrace for new applications) might want
> this.

Ah I see :-) Nice to know we can use this to improve the kthread code.

thanks,

 - Joel
