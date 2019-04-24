From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 11:17:15 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAKOZuesw9JK6DLhFTxN74rH5PDqGn7qbCQT4aaP1qtahSoRZ8w@mail.gmail.com>
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
 <CAKOZuetiqFx0qW9rdCVWsKQxwaYK2Vis8EXsDba6=F5dp=da6Q@mail.gmail.com>
 <CAHrFyr6FntUgsCRw2b1B9+pjLQ2+pJMTULywRC1woNW4PvtyiQ@mail.gmail.com>
 <CAKOZuesw9JK6DLhFTxN74rH5PDqGn7qbCQT4aaP1qtahSoRZ8w@mail.gmail.com>
Message-ID: <322efe1d-4acd-8ca5-1a76-51b90819ef44@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424091715.v3Schh1pERUGBelw0aNoF9bfJnNls92ObOIaoxHnSg4@z>

On 20.04.19 01:29, Daniel Colascione wrote:

> The point I'm making, to be> very clear, is *NOT* that process monitoring is "not worth>
considering", but that process monitoring is subtle and complicated>
enough that it ought to be considered as a standalone project,>
independent of pidfds proper and of the very simple and effective> pidfd
system that Joel has proposed in his patch series.

At that point I'm wondering: what pidfd is actually meant for,
if not process monitoring ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
