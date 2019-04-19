From: dancol at google.com (Daniel Colascione)
Date: Fri, 19 Apr 2019 16:36:24 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHk-=wh8DmfsOFY4OrqRjLYCYi+2Ej7uLbidmiPg+BhBOGZVcA@mail.gmail.com>
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
 <CAHk-=wiiYUuk7LrkNaggvzZqB63Efu5sChV5hAOdn1ZfunUw6Q@mail.gmail.com>
 <CAHrFyr6rA7w6H_N5bV_9EY26Jxza1TLp6=rLL7=grK6_tp6cHw@mail.gmail.com>
 <CAHk-=wh8DmfsOFY4OrqRjLYCYi+2Ej7uLbidmiPg+BhBOGZVcA@mail.gmail.com>
Message-ID: <CAKOZuesaWK1Y7c85jNv71LNx7sKoGgn_eLzQVPnoi6e4eUx4aQ@mail.gmail.com>

On Fri, Apr 19, 2019 at 4:33 PM Linus Torvalds
<torvalds at linux-foundation.org> wrote:
>
> On Fri, Apr 19, 2019 at 4:20 PM Christian Brauner <christian at brauner.io> wrote:
> >
> > On Sat, Apr 20, 2019 at 1:11 AM Linus Torvalds
> > <torvalds at linux-foundation.org> wrote:
> > >
> > > It's also worth noting that POLLERR/POLLHUP/POLLNVAL cannot be masked
> > > for "poll()". Even if you only ask for POLLIN/POLLOUT, you will always
> > > get POLLERR/POLLHUP notification. That is again historical behavior,
> > > and it's kind of a "you can't poll a hung up fd". But it once again
> > > means that you should consider POLLHUP to be something *exceptional*
> > > and final, where no further or other state changes can happen or are
> > > relevant.
> >
> > Which kind of makes sense for process exit. So the historical behavior
> > here is in our favor and having POLLIN | POLLHUP rather fitting.
> > It just seems right that POLLHUP indicates "there can be
> > no more state transitions".
>
> Note that that is *not* true of process exit.
>
> The final state transition isn't "exit", it is actually "process has
> been reaped".  That's the point where data no longer exists.

FWIW, I think the exit status should be available via pidfd even after
process reaping. A non-parent holder of a pidfd has no ability to
control when the parent reaps the child, or even if reaping is
necessary at all --- the parent could make SIGCHLD SIG_IGN. Someone
trying to read exit status via a pidfd shouldn't fail to get that exit
status just because he lost the race with a concurrent waitpid().
