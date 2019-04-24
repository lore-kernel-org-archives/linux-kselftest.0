From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 10:56:49 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHrFyr6f_CUP__818e1u6TaHd-XpWY6NOxri4yzzR6rNY5rk_w@mail.gmail.com>
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
 <CAHrFyr6f_CUP__818e1u6TaHd-XpWY6NOxri4yzzR6rNY5rk_w@mail.gmail.com>
Message-ID: <1772079b-6e84-35e3-62b8-92034c29759d@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424085649._YubHGiLyeaqMwrJuCi_PJUKkeI-bD2ehAzVCJpw7t8@z>

On 19.04.19 23:48, Christian Brauner wrote:

> So is Android and we're not designing an interface for Android but for
> all of userspace.
> I hope this is clear. Service managers are quite important and systemd
> is the largest one
> and they can make good use of this feature.

Maybe just talk about talking about service managers and not even
mentioning systemd ;-)

> That whole pargraph is about dismissing a range of valid use-cases based on
> assumptions such as "way more common" and
> even argues that service managers are special cases and therefore not
> really worth considering. I would like to be more open to other use cases.

ACK. Things like pidfd can make life for service managers a lot easier,
and even allow whole new scenarios.

For example, the monitoring part doesn't need to be the spawning
process  anymore. The spawner could send the pidfd to the monitor,
eg. via unix socket. If we had plan9-like srv filesystem (something
I've got on my todo list) we could even make the pidfd's available in
the fs and so replace the old pidfiles (pidfile now would be really a
process handle instead of just a scratchpad for writing down the pid).

>> Joel indicated that he believes poll(2)
>> shouldn't be supported on procfs pidfds. Is that your thinking as
>> well? If that's the case, then we're in a state where non-parents
> 
> Yes, it is.

Why so ?

IMHO, it would be much more useful, if another process can get the
same process handle via procfs. This also would allow the scenario
described above w/o srvfs: pidfiles could just be symlinks to the
corresponding /proc files.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
