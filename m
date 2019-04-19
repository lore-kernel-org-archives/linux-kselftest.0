From: oleg@redhat.com (Oleg Nesterov)
Date: Fri, 19 Apr 2019 17:43:54 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
Message-ID: <20190419154354.GB12228@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190419154354.Sw3DuJvjFR2VMzHKujNXS5rvARq-_6Cg3e9BVt4_4Tc@z>

On 04/18, Jann Horn wrote:
>
> On Wed, Apr 17, 2019@3:09 PM Oleg Nesterov <oleg@redhat.com> wrote:
> > On 04/16, Joel Fernandes wrote:
> > > On Tue, Apr 16, 2019@02:04:31PM +0200, Oleg Nesterov wrote:
> > > >
> > > > Could you explain when it should return POLLIN? When the whole process exits?
> > >
> > > It returns POLLIN when the task is dead or doesn't exist anymore, or when it
> > > is in a zombie state and there's no other thread in the thread group.
> >
> > IOW, when the whole thread group exits, so it can't be used to monitor sub-threads.
> >
> > just in case... speaking of this patch it doesn't modify proc_tid_base_operations,
> > so you can't poll("/proc/sub-thread-tid") anyway, but iiuc you are going to use
> > the anonymous file returned by CLONE_PIDFD ?
>
> I don't think procfs works that way. /proc/sub-thread-tid has
> proc_tgid_base_operations despite not being a thread group leader.

Yes, sorry, I meant /proc/pid/task/sub-thread-tid.

But poll("/proc/sub-thread-tid") won't work too, we can't rely on do_notify_parent()
if the task is not a group leader.

> (Yes, that's kinda weird.) AFAICS the WARN_ON_ONCE() in this code can
> be hit trivially, and then the code will misbehave.

Heh, I didn't even notice that WARN_ON_ONCE(task && !thread_group_leader(task)) ;)

> @Joel: I think you'll have to either rewrite this to explicitly bail
> out if you're dealing with a thread group leader, or make the code
> work for threads, too.

The last version of CLONE_PIDFD doesn't allow CLONE_THREAD, so we can forget
about this problem for now.

Oleg.
