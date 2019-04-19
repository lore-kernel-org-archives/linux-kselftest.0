From: christian at brauner.io (Christian Brauner)
Date: Fri, 19 Apr 2019 23:59:48 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190419212002.GB44851@google.com>
References: <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <CAKOZueu3PzD_QgROXFRs8FvD=HTKJLsHDK9GrUdbFoMzx_7HEA@mail.gmail.com>
 <CAHrFyr4REuKFuARAXnhBC67TGzyDGmMONc7XjfUGvf+Qfm7EuQ@mail.gmail.com>
 <20190419212002.GB44851@google.com>
Message-ID: <CAHrFyr6qqj-q9nSVuNhFL5WOcuQstAFvaDu2544OpeMe6jawQw@mail.gmail.com>

On Fri, Apr 19, 2019 at 11:20 PM Joel Fernandes <joel at joelfernandes.org> wrote:
>
> On Fri, Apr 19, 2019 at 10:57:11PM +0200, Christian Brauner wrote:
> > On Fri, Apr 19, 2019 at 10:34 PM Daniel Colascione <dancol at google.com> wrote:
> > >
> > > On Fri, Apr 19, 2019 at 12:49 PM Joel Fernandes <joel at joelfernandes.org> wrote:
> > > >
> > > > On Fri, Apr 19, 2019 at 09:18:59PM +0200, Christian Brauner wrote:
> > > > > On Fri, Apr 19, 2019 at 03:02:47PM -0400, Joel Fernandes wrote:
> > > > > > On Thu, Apr 18, 2019 at 07:26:44PM +0200, Christian Brauner wrote:
> > > > > > > On April 18, 2019 7:23:38 PM GMT+02:00, Jann Horn <jannh at google.com> wrote:
> > > > > > > >On Wed, Apr 17, 2019 at 3:09 PM Oleg Nesterov <oleg at redhat.com> wrote:
> > > > > > > >> On 04/16, Joel Fernandes wrote:
> > > > > > > >> > On Tue, Apr 16, 2019 at 02:04:31PM +0200, Oleg Nesterov wrote:
> > > > > > > >> > >
> > > > > > > >> > > Could you explain when it should return POLLIN? When the whole
> > > > > > > >process exits?
> > > > > > > >> >
> > > > > > > >> > It returns POLLIN when the task is dead or doesn't exist anymore,
> > > > > > > >or when it
> > > > > > > >> > is in a zombie state and there's no other thread in the thread
> > > > > > > >group.
> > > > > > > >>
> > > > > > > >> IOW, when the whole thread group exits, so it can't be used to
> > > > > > > >monitor sub-threads.
> > > > > > > >>
> > > > > > > >> just in case... speaking of this patch it doesn't modify
> > > > > > > >proc_tid_base_operations,
> > > > > > > >> so you can't poll("/proc/sub-thread-tid") anyway, but iiuc you are
> > > > > > > >going to use
> > > > > > > >> the anonymous file returned by CLONE_PIDFD ?
> > > > > > > >
> > > > > > > >I don't think procfs works that way. /proc/sub-thread-tid has
> > > > > > > >proc_tgid_base_operations despite not being a thread group leader.
> > > > > > > >(Yes, that's kinda weird.) AFAICS the WARN_ON_ONCE() in this code can
> > > > > > > >be hit trivially, and then the code will misbehave.
> > > > > > > >
> > > > > > > >@Joel: I think you'll have to either rewrite this to explicitly bail
> > > > > > > >out if you're dealing with a thread group leader, or make the code
> > > > > > > >work for threads, too.
> > > > > > >
> > > > > > > The latter case probably being preferred if this API is supposed to be
> > > > > > > useable for thread management in userspace.
> > > > > >
> > > > > > At the moment, we are not planning to use this for sub-thread management. I
> > > > > > am reworking this patch to only work on clone(2) pidfds which makes the above
> > > > >
> > > > > Indeed and agreed.
> > > > >
> > > > > > discussion about /proc a bit unnecessary I think. Per the latest CLONE_PIDFD
> > > > > > patches, CLONE_THREAD with pidfd is not supported.
> > > > >
> > > > > Yes. We have no one asking for it right now and we can easily add this
> > > > > later.
> > > > >
> > > > > Admittedly I haven't gotten around to reviewing the patches here yet
> > > > > completely. But one thing about using POLLIN. FreeBSD is using POLLHUP
> > > > > on process exit which I think is nice as well. How about returning
> > > > > POLLIN | POLLHUP on process exit?
> > > > > We already do things like this. For example, when you proxy between
> > > > > ttys. If the process that you're reading data from has exited and closed
> > > > > it's end you still can't usually simply exit because it might have still
> > > > > buffered data that you want to read.  The way one can deal with this
> > > > > from  userspace is that you can observe a (POLLHUP | POLLIN) event and
> > > > > you keep on reading until you only observe a POLLHUP without a POLLIN
> > > > > event at which point you know you have read
> > > > > all data.
> > > > > I like the semantics for pidfds as well as it would indicate:
> > > > > - POLLHUP -> process has exited
> > > > > - POLLIN  -> information can be read
> > > >
> > > > Actually I think a bit different about this, in my opinion the pidfd should
> > > > always be readable (we would store the exit status somewhere in the future
> > > > which would be readable, even after task_struct is dead). So I was thinking
> > > > we always return EPOLLIN.  If process has not exited, then it blocks.
> > >
> > > ITYM that a pidfd polls as readable *once a task exits* and stays
> > > readable forever. Before a task exit, a poll on a pidfd should *not*
> > > yield POLLIN and reading that pidfd should *not* complete immediately.
> > > There's no way that, having observed POLLIN on a pidfd, you should
> > > ever then *not* see POLLIN on that pidfd in the future --- it's a
> > > one-way transition from not-ready-to-get-exit-status to
> > > ready-to-get-exit-status.
> >
> > What do you consider interesting state transitions? A listener on a pidfd
> > in epoll_wait() might be interested if the process execs for example.
> > That's a very valid use-case for e.g. systemd.
> > We can't use EPOLLIN for that too otherwise you'd need to to waitid(_WNOHANG)
> > to check whether an exit status can be read which is not nice and then you
> > multiplex different meanings on the same bit.
> > I would prefer if the exit status can only be read from the parent which is
> > clean and the least complicated semantics, i.e. Linus waitid() idea.
> > EPOLLIN on a pidfd could very well mean that data can be read via
> > a read() on the pidfd *other* than the exit status. The read could e.g.
> > give you a lean struct that indicates the type of state transition: NOTIFY_EXIT,
> > NOTIFY_EXEC, etc.. This way we are not bound to a specific poll event indicating
> > a specific state.
> > Though there's a case to be made that EPOLLHUP could indicate process exit
> > and EPOLLIN a state change + read().
>
> According to Linus, POLLHUP usually indicates that something is readable:
> https://lkml.org/lkml/2019/4/18/1181
> "So generally a HUP condition should mean that POLLIN and POLLOUT also
> get set. Not because there's any actual _data_ to be read, but simply
> because the read will not block."
>
> I feel the future state changes such as for NOTIFY_EXEC can easily be
> implemented on top of this patch.
>
> Just for the exit notification purposes, the states are:
> if process has exit_state == 0, block.
> if process is zombie/dead but not reaped, then return POLLIN
> if process is reaped, then return POLLIN | POLLHUP

Oleg was explicitly against EXIT_ZOMBIE/DEAD thing, no? He said so in a
prior mail. Has this been addressed?

>
> for the exec notification case, that could be implemnted along with this with
> something like:
> if process has exit_state == 0, or has not exec'd since poll was called, block.
> if process exec'd, then return POLLIN
> if process is zombie/dead but not reaped, then return POLLIN
> if process is reaped, then return POLLIN | POLLHUP
>
> Do you agree or did I miss something?

I'm not sure why a combination of flags is nicer than having a simple
read method that is more flexible but as the author you should send the
patch how you would like it to be for review. :)

Christian
