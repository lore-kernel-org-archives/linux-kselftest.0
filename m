From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Fri, 19 Apr 2019 16:32:42 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHrFyr6rA7w6H_N5bV_9EY26Jxza1TLp6=rLL7=grK6_tp6cHw@mail.gmail.com>
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
Message-ID:
 <CAHk-=wh8DmfsOFY4OrqRjLYCYi+2Ej7uLbidmiPg+BhBOGZVcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190419233242.q0JO_G7Xr-KlRLyDUAPtJA1yD_hucj-H0UxM034sOnc@z>

On Fri, Apr 19, 2019@4:20 PM Christian Brauner <christian@brauner.io> wrote:
>
> On Sat, Apr 20, 2019 at 1:11 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > It's also worth noting that POLLERR/POLLHUP/POLLNVAL cannot be masked
> > for "poll()". Even if you only ask for POLLIN/POLLOUT, you will always
> > get POLLERR/POLLHUP notification. That is again historical behavior,
> > and it's kind of a "you can't poll a hung up fd". But it once again
> > means that you should consider POLLHUP to be something *exceptional*
> > and final, where no further or other state changes can happen or are
> > relevant.
>
> Which kind of makes sense for process exit. So the historical behavior
> here is in our favor and having POLLIN | POLLHUP rather fitting.
> It just seems right that POLLHUP indicates "there can be
> no more state transitions".

Note that that is *not* true of process exit.

The final state transition isn't "exit", it is actually "process has
been reaped".  That's the point where data no longer exists.

Arguably "exit()" just means "pidfd is now readable - you can read the
status". That sounds very much like a normal POLLIN condition to me,
since the whole *point* of read() on pidfd is presumably to read the
status.

Now, if you want to have other state transitions (ie read
execve/fork/whatever state details), then you could say that _those_
state transitions are just POLLIN, but that the exit state transition
is POLLIN | POLLHUP. But logically to me it still smells like the
process being reaped should be POLLHUP.

You could also say that the execve/fork/whatever state is out of band
data, and use EPOLLRDBAND for it.

But in fact EPOLLPRI might be better for that, because that works well
with select() (ei if you want to select for execve/fork, you use the
"ex" bitmask).

That said, if FreeBSD already has something like this, and people
actually have code that uses it, there's also simply a strong argument
for "don't be needlessly different".

                      Linus
