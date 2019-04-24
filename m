From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 10:20:34 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAKOZueuBTwyrLtpVQaoTAgjGSgeHY7392sKv5uAYdy4XKNHKHQ@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com> <20190416192051.GA184889@google.com>
 <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <CAKOZueu3PzD_QgROXFRs8FvD=HTKJLsHDK9GrUdbFoMzx_7HEA@mail.gmail.com>
 <CAHrFyr4REuKFuARAXnhBC67TGzyDGmMONc7XjfUGvf+Qfm7EuQ@mail.gmail.com>
 <CAKOZueuBTwyrLtpVQaoTAgjGSgeHY7392sKv5uAYdy4XKNHKHQ@mail.gmail.com>
Message-ID: <f631a11b-bdaa-1b07-dda5-028bf9efbd58@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424082034.DvJY79vKd05iIVNiCWtuzoonvsv7wAdDe_QNs8k7-To@z>

On 19.04.19 23:21, Daniel Colascione wrote:

>> EPOLLIN on a pidfd could very well mean that data can be read via
>> a read() on the pidfd *other* than the exit status. The read could e.g.
>> give you a lean struct that indicates the type of state transition: NOTIFY_EXIT,
>> NOTIFY_EXEC, etc.. This way we are not bound to a specific poll event indicating
>> a specific state.
>> Though there's a case to be made that EPOLLHUP could indicate process exit
>> and EPOLLIN a state change + read().
> 
> And do you imagine making read() destructive? Does that read() then
> reset the POLLIN state? You're essentially proposing that a pidfd
> provide an "event stream" interface, delivering notifications packets
> that indicate state changes like "process exited" or "process stopped"
> or "process execed". While this sort of interface is powerful and has
> some nice properties that tools like debuggers and daemon monitors
> might want to use, I think it's too complicated and error prone for
> the overwhelmingly common case of wanting to monitor process lifetime.

I don't think it's so complicated. read() + comparing a few bits
(eg. strncmp(), if the packets are strings) really isn't a big deal.

Actually, I proposed quite the same (before I read this mail).

> I like Linus' idea of just making waitid(2) (not waitpid(2), as I
> mistakenly mentioned earlier) on a pidfd act *exactly* like a
> waitid(2) on the corresponding process and making POLLIN just mean
> "waitid will succeed". It's a nice simple model that's easy to reason
> about and that makes it easy to port existing code to pidfds.

Okay, that's probably a good starting point. We could add more
sophisticated monitoring later.


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
