From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 19 Apr 2019 20:46:58 -0400
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHk-=wiiYUuk7LrkNaggvzZqB63Efu5sChV5hAOdn1ZfunUw6Q@mail.gmail.com>
References: <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <CAKOZueu3PzD_QgROXFRs8FvD=HTKJLsHDK9GrUdbFoMzx_7HEA@mail.gmail.com>
 <CAHrFyr4REuKFuARAXnhBC67TGzyDGmMONc7XjfUGvf+Qfm7EuQ@mail.gmail.com>
 <20190419212002.GB44851@google.com>
 <CAHk-=wiiYUuk7LrkNaggvzZqB63Efu5sChV5hAOdn1ZfunUw6Q@mail.gmail.com>
Message-ID: <20190420004658.GG251571@google.com>

On Fri, Apr 19, 2019 at 04:11:37PM -0700, Linus Torvalds wrote:
> On Fri, Apr 19, 2019 at 2:20 PM Joel Fernandes <joel at joelfernandes.org> wrote:
> >
> > According to Linus, POLLHUP usually indicates that something is readable:
> 
> Note that if you use the legacy interfaces (ie "select()"), then even
> just a plain POLLHUP will always just show as "readable".
> 
> So for a lot of applications, it won't even matter. Returning POLLHUP
> will mean it's readable whether POLLIN is set or not (and EPOLLERR
> will automatically mean that it's marked both readable and writable).
> 
> In fact, I'd argue that not a lot of people care about the more
> esoteric bits at all. If your poll function does POLLIN and POLLOUT,
> it's fine. Anything else is specialized enough that most people simply
> won't care. Don't overdesign things too much. You need to have a major
> reason to care about the other POLL bits.
> 
> It's also worth noting that POLLERR/POLLHUP/POLLNVAL cannot be masked
> for "poll()". Even if you only ask for POLLIN/POLLOUT, you will always
> get POLLERR/POLLHUP notification. That is again historical behavior,
> and it's kind of a "you can't poll a hung up fd". But it once again
> means that you should consider POLLHUP to be something *exceptional*
> and final, where no further or other state changes can happen or are
> relevant.
> 
> That may well work fine for pidfd when the task is gone, but it's
> really worth noting that any *normal* state should be about
> POLLIN/POLLOUT. People should not think that "POLLHUP sounds like the
> appropriate name", they should realize that POLLHUP is basically a
> terminal error condition, not a "input is available".
> 
> So just keep that in mind.

Got it, thanks a lot for the detailed explanation of the flags. So then I
feel I should not return POLLHUP or POLLERR because the task_struct getting
reaped is not an error condition. I will simplify the patch and repost it. It
seems that would be the best thing to do to serve the usecase. We just want
to know when the task exited and a reaped task also counts as one that
exited.

thanks,

 - Joel
