From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 19 Apr 2019 17:13:19 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190419200059.r2f7i7jtlsza4eun@brauner.io>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <20190419200059.r2f7i7jtlsza4eun@brauner.io>
Message-ID: <20190419211319.GA44851@google.com>

On Fri, Apr 19, 2019 at 10:01:00PM +0200, Christian Brauner wrote:
> On Fri, Apr 19, 2019 at 03:49:02PM -0400, Joel Fernandes wrote:
> > On Fri, Apr 19, 2019 at 09:18:59PM +0200, Christian Brauner wrote:
> > > On Fri, Apr 19, 2019 at 03:02:47PM -0400, Joel Fernandes wrote:
> > > > On Thu, Apr 18, 2019 at 07:26:44PM +0200, Christian Brauner wrote:
> > > > > On April 18, 2019 7:23:38 PM GMT+02:00, Jann Horn <jannh at google.com> wrote:
> > > > > >On Wed, Apr 17, 2019 at 3:09 PM Oleg Nesterov <oleg at redhat.com> wrote:
> > > > > >> On 04/16, Joel Fernandes wrote:
> > > > > >> > On Tue, Apr 16, 2019 at 02:04:31PM +0200, Oleg Nesterov wrote:
> > > > > >> > >
> > > > > >> > > Could you explain when it should return POLLIN? When the whole
> > > > > >process exits?
> > > > > >> >
> > > > > >> > It returns POLLIN when the task is dead or doesn't exist anymore,
> > > > > >or when it
> > > > > >> > is in a zombie state and there's no other thread in the thread
> > > > > >group.
> > > > > >>
> > > > > >> IOW, when the whole thread group exits, so it can't be used to
> > > > > >monitor sub-threads.
> > > > > >>
> > > > > >> just in case... speaking of this patch it doesn't modify
> > > > > >proc_tid_base_operations,
> > > > > >> so you can't poll("/proc/sub-thread-tid") anyway, but iiuc you are
> > > > > >going to use
> > > > > >> the anonymous file returned by CLONE_PIDFD ?
> > > > > >
> > > > > >I don't think procfs works that way. /proc/sub-thread-tid has
> > > > > >proc_tgid_base_operations despite not being a thread group leader.
> > > > > >(Yes, that's kinda weird.) AFAICS the WARN_ON_ONCE() in this code can
> > > > > >be hit trivially, and then the code will misbehave.
> > > > > >
> > > > > >@Joel: I think you'll have to either rewrite this to explicitly bail
> > > > > >out if you're dealing with a thread group leader, or make the code
> > > > > >work for threads, too.
> > > > > 
> > > > > The latter case probably being preferred if this API is supposed to be
> > > > > useable for thread management in userspace.
> > > > 
> > > > At the moment, we are not planning to use this for sub-thread management. I
> > > > am reworking this patch to only work on clone(2) pidfds which makes the above
> > > 
> > > Indeed and agreed.
> > > 
> > > > discussion about /proc a bit unnecessary I think. Per the latest CLONE_PIDFD
> > > > patches, CLONE_THREAD with pidfd is not supported.
> > > 
> > > Yes. We have no one asking for it right now and we can easily add this
> > > later.
> > > 
> > > Admittedly I haven't gotten around to reviewing the patches here yet
> > > completely. But one thing about using POLLIN. FreeBSD is using POLLHUP
> > > on process exit which I think is nice as well. How about returning
> > > POLLIN | POLLHUP on process exit?
> > > We already do things like this. For example, when you proxy between
> > > ttys. If the process that you're reading data from has exited and closed
> > > it's end you still can't usually simply exit because it might have still
> > > buffered data that you want to read.  The way one can deal with this
> > > from  userspace is that you can observe a (POLLHUP | POLLIN) event and
> > > you keep on reading until you only observe a POLLHUP without a POLLIN
> > > event at which point you know you have read
> > > all data.
> > > I like the semantics for pidfds as well as it would indicate:
> > > - POLLHUP -> process has exited
> > > - POLLIN  -> information can be read
> > 
> > Actually I think a bit different about this, in my opinion the pidfd should
> > always be readable (we would store the exit status somewhere in the future
> > which would be readable, even after task_struct is dead). So I was thinking
> 
> So your idea is that you always get EPOLLIN when the process is alive,
> i.e. epoll_wait() immediately returns for a pidfd that referes to a live
> process if you specify EPOLLIN? E.g. if I specify EPOLLIN | EPOLLHUP
> then epoll_wait() would constantly return. I would then need to check
> for EPOLLHUP, see that it is not present and then go back into the
> epoll_wait() loop and play the same game again?
> What do you need this for?

The approach of this patch is we would return EPOLLIN only once the process
exits. Until then it blocks.

> And if you have a valid reason to do this would it make sense to set
> POLLPRI if the actual exit status can be read? This way one could at
> least specify POLLPRI | POLLHUP without being constantly woken.
> 
> > we always return EPOLLIN.  If process has not exited, then it blocks.
> > 
> > However, we also are returning EPOLLERR in previous patch if the task_struct
> > has been reaped (task == NULL). I could change that to EPOLLHUP.
> 
> That would be here, right?:
> 
> > +	if (!task)
> > +		poll_flags = POLLIN | POLLRDNORM | POLLHUP;
> 
> That sounds better to me that EPOLLERR.

I see. Ok I agree with you. It is not really an error, because even though
the task_struct doesn't exist, the data such as exit status would still be
readable so IMO POLLHUP is better.
