From: dancol@google.com (Daniel Colascione)
Date: Fri, 12 Apr 2019 17:56:00 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAKOZuetX4jMPDtDqAvGgSNo4BHf9BOnu79ufEiULfM5X5nDyyQ@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <CALCETrV7Hw50Bh=qQX86v_6euiGqX7eNboi50_7JmfQsyVR3_A@mail.gmail.com>
 <20190413000941.GA53420@google.com>
 <CAKOZuetX4jMPDtDqAvGgSNo4BHf9BOnu79ufEiULfM5X5nDyyQ@mail.gmail.com>
Message-ID:
 <CAKOZuesgRPabwrx9pjf3p0S-7nsqeXoUVxeykOOmHokAL=5wqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413005600.u_EAu33C3QfaApPhMfP9T0BNGKi_TklEXCtvu67sLdE@z>

[Resending due to accidental HTML. I need to take Joel's advice and
switch to a real email client]

On Fri, Apr 12, 2019@5:54 PM Daniel Colascione <dancol@google.com> wrote:
>
> On Fri, Apr 12, 2019@5:09 PM Joel Fernandes <joel@joelfernandes.org> wrote:
>>
>> Hi Andy!
>>
>> On Fri, Apr 12, 2019@02:32:53PM -0700, Andy Lutomirski wrote:
>> > On Thu, Apr 11, 2019 at 10:51 AM Joel Fernandes (Google)
>> > <joel@joelfernandes.org> wrote:
>> > >
>> > > pidfd are /proc/pid directory file descriptors referring to a task group
>> > > leader. Android low memory killer (LMK) needs pidfd polling support to
>> > > replace code that currently checks for existence of /proc/pid for
>> > > knowing a process that is signalled to be killed has died, which is both
>> > > racy and slow. The pidfd poll approach is race-free, and also allows the
>> > > LMK to do other things (such as by polling on other fds) while awaiting
>> > > the process being killed to die.
>> > >
>> > > It prevents a situation where a PID is reused between when LMK sends a
>> > > kill signal and checks for existence of the PID, since the wrong PID is
>> > > now possibly checked for existence.
>> > >
>> > > In this patch, we follow the same mechanism used uhen the parent of the
>> > > task group is to be notified, that is when the tasks waiting on a poll
>> > > of pidfd are also awakened.
>> > >
>> > > We have decided to include the waitqueue in struct pid for the following
>> > > reasons:
>> > > 1. The wait queue has to survive for the lifetime of the poll. Including
>> > > it in task_struct would not be option in this case because the task can
>> > > be reaped and destroyed before the poll returns.
>> >
>> > Are you sure?  I admit I'm not all that familiar with the innards of
>> > poll() on Linux, but I thought that the waitqueue only had to survive
>> > long enough to kick the polling thread and did *not* have to survive
>> > until poll() actually returned.
>>
>> I am not sure now. I thought epoll(2) was based on the wait_event APIs,
>> however more closely looking at the eventpoll code, it looks like there are 2
>> waitqueues involved, one that we pass and the other that is a part of the
>> eventpoll session itself, so you could be right about that. Daniel Colascione
>> may have some more thoughts about it since he brought up the possiblity of a
>> wq life-time issue. Daniel?   We were just playing it safe.

I think you (Joel) and Andy are talking about different meanings of
poll(). Joel is talking about the VFS method; Andy is talking about
the system call. ISTM that the lifetime of wait queue we give to
poll_wait needs to last through the poll. Normally the wait queue gets
pinned by the struct file that we give to poll_wait (which takes a
reference on the struct file), but the pidfd struct file doesn't pin
the struct task, so we can't use a wait queue in struct task.
(remove_wait_queue, which poll implementations call to undo wait queue
additions, takes the wait queue head we pass to poll_wait, and we
don't want to pass a dangling pointer to remove_wait_queue.) If the
lifetime requirements for the queue aren't this strict, I don't see it
documented anywhere. Besides: if we don't actually need to pin the
waitqueue lifetime for the duration of the poll, why bother taking a
reference on the polled struct file?
