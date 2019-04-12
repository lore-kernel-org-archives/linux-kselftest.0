From: luto@kernel.org (Andy Lutomirski)
Date: Fri, 12 Apr 2019 14:32:53 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190411175043.31207-1-joel@joelfernandes.org>
References: <20190411175043.31207-1-joel@joelfernandes.org>
Message-ID:
 <CALCETrV7Hw50Bh=qQX86v_6euiGqX7eNboi50_7JmfQsyVR3_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412213253.ML-sX6ObWg9cCa13zc-78ZvNqJViG2kQ1DfGVvF0NXI@z>

On Thu, Apr 11, 2019 at 10:51 AM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> pidfd are /proc/pid directory file descriptors referring to a task group
> leader. Android low memory killer (LMK) needs pidfd polling support to
> replace code that currently checks for existence of /proc/pid for
> knowing a process that is signalled to be killed has died, which is both
> racy and slow. The pidfd poll approach is race-free, and also allows the
> LMK to do other things (such as by polling on other fds) while awaiting
> the process being killed to die.
>
> It prevents a situation where a PID is reused between when LMK sends a
> kill signal and checks for existence of the PID, since the wrong PID is
> now possibly checked for existence.
>
> In this patch, we follow the same mechanism used uhen the parent of the
> task group is to be notified, that is when the tasks waiting on a poll
> of pidfd are also awakened.
>
> We have decided to include the waitqueue in struct pid for the following
> reasons:
> 1. The wait queue has to survive for the lifetime of the poll. Including
> it in task_struct would not be option in this case because the task can
> be reaped and destroyed before the poll returns.

Are you sure?  I admit I'm not all that familiar with the innards of
poll() on Linux, but I thought that the waitqueue only had to survive
long enough to kick the polling thread and did *not* have to survive
until poll() actually returned.

>
> 2. By including the struct pid for the waitqueue means that during
> de_exec, the thread doing de_thread() automatically gets the new
> waitqueue/pid even though its task_struct is different.

I didn't follow this.  Can you clarify?

Also, please don't call your new helper wake_up_pidfd_pollers().  One
of the goals of my patch was to make it generically possible for
kernel code to wait for a task to exit.  There are other cases besides
pidfd for which this would be useful.  Ahem, kthread.  (The kthread
implementation currently does some seriously awful things to detect
when kthreads die.)  Also, some hypothetical future vastly improved
debugging API (to supercede ptrace for new applications) might want
this.

--Andy
