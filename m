From: dancol@google.com (Daniel Colascione)
Date: Thu, 18 Apr 2019 10:53:33 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com> <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
Message-ID:
 <CAKOZues8mnjvUUopNoeXcDezXKscQLNAgCgodqUno_Z39kV7Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418175333.MtBCisJUpadZTVuaNHi5FyBGRoNvGT9gQNkRedSO53k@z>

On Thu, Apr 18, 2019@10:26 AM Christian Brauner <christian@brauner.io> wrote:
>
> On April 18, 2019 7:23:38 PM GMT+02:00, Jann Horn <jannh@google.com> wrote:
> >On Wed, Apr 17, 2019@3:09 PM Oleg Nesterov <oleg@redhat.com> wrote:
> >> On 04/16, Joel Fernandes wrote:
> >> > On Tue, Apr 16, 2019@02:04:31PM +0200, Oleg Nesterov wrote:
> >> > >
> >> > > Could you explain when it should return POLLIN? When the whole
> >process exits?
> >> >
> >> > It returns POLLIN when the task is dead or doesn't exist anymore,
> >or when it
> >> > is in a zombie state and there's no other thread in the thread
> >group.
> >>
> >> IOW, when the whole thread group exits, so it can't be used to
> >monitor sub-threads.
> >>
> >> just in case... speaking of this patch it doesn't modify
> >proc_tid_base_operations,
> >> so you can't poll("/proc/sub-thread-tid") anyway, but iiuc you are
> >going to use
> >> the anonymous file returned by CLONE_PIDFD ?
> >
> >I don't think procfs works that way. /proc/sub-thread-tid has
> >proc_tgid_base_operations despite not being a thread group leader.

Huh. That seems very weird. Is that too late to change now? It feels like a bug.

> >(Yes, that's kinda weird.) AFAICS the WARN_ON_ONCE() in this code can
> >be hit trivially, and then the code will misbehave.
> >
> >@Joel: I think you'll have to either rewrite this to explicitly bail
> >out if you're dealing with a thread group leader

If you're _not_ dealing with a leader, right?

> , or make the code
> >work for threads, too.
> The latter case probably being preferred if this API is supposed to be useable for thread management in userspace.

IMHO, focusing on the thread group case for now might be best. We can
always support thread management in future work.

Besides: I'm not sure that we need kernel support for thread
monitoring. Can't libc provide a pollable FD for a thread internally?
libc can always run code just before thread exit, and it can wake a
signalfd at that point. Directly terminating individual threads
without going through userland is something that breaks the process
anyway: it's legal and normal to SIGKILL a process a whole, but if an
individual thread terminates without going through libc, the process
is likely going to be fatally broken anyway. (What if it's holding the
heap lock?)

I know that in some tools want to wait for termination of individual
threads in an external monitored process, but couldn't these tools
cooperate with libc to get these per-thread eventfds?

Is there a use case I'm missing?
