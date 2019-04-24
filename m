From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 11:11:18 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHrFyr6FntUgsCRw2b1B9+pjLQ2+pJMTULywRC1woNW4PvtyiQ@mail.gmail.com>
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
Message-ID: <c833c78b-445d-93d9-e59f-6bc62376c111@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424091118.q78x6pZ-hl8j1O-v2XtPe8zgPyf4P895QP-ng3g4vZU@z>

On 20.04.19 01:02, Christian Brauner wrote:

> I'm sorry, who has agreed that a non-parent should be able to wait for
> process death?
> I know you proposed that but has anyone ever substantially supported this?

I actually support this.

One practical usecase I have in mind for some upcoming projects is
monitoring processes in a container from the outside.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
