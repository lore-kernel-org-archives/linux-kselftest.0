From: christian@brauner.io (Christian Brauner)
Date: Sat, 20 Apr 2019 01:20:01 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHk-=wiiYUuk7LrkNaggvzZqB63Efu5sChV5hAOdn1ZfunUw6Q@mail.gmail.com>
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
Message-ID:
 <CAHrFyr6rA7w6H_N5bV_9EY26Jxza1TLp6=rLL7=grK6_tp6cHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190419232001.btEEh1dk8YY_EHKUHqtnB11W_qKKxi5L0DEILwzOnBA@z>

On Sat, Apr 20, 2019 at 1:11 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Apr 19, 2019@2:20 PM Joel Fernandes <joel@joelfernandes.org> wrote:
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

Which kind of makes sense for process exit. So the historical behavior
here is in our favor and having POLLIN | POLLHUP rather fitting.
It just seems right that POLLHUP indicates "there can be
no more state transitions".

Christian
