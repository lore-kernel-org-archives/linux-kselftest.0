From: lkml at metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 11:03:40 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAKOZues-DSu=R7Oe_gsK7=wrm2PtEi5TdH6Z50igNF_B+Wvcdg@mail.gmail.com>
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
 <CAHrFyr76KrgUwHz91fZbkvHD43KzVrcXndRKUJjG9-gT4ZFZuQ@mail.gmail.com>
 <CAKOZueu_ouL_u17UKNNkDaSuP-_m_=fE8nLZGb9YAjonF=zVHg@mail.gmail.com>
 <CAHrFyr6D=41qBJGfVncN2xFhnCBKqKOQakU_2kBMFw+fywO7Hw@mail.gmail.com>
 <CAKOZues-DSu=R7Oe_gsK7=wrm2PtEi5TdH6Z50igNF_B+Wvcdg@mail.gmail.com>
Message-ID: <11c00eba-f078-9a67-97e6-bd5a74f3acaa@metux.net>

On 20.04.19 01:46, Daniel Colascione wrote:

> If you turn pidfd into an event stream, reads have to be destructive.
> If reads are destructive, you can't share pidfds instances between
> multiple readers.

Can't we find a way to duplicate them ? Someting like dup(), but
with actually duplicating the open file ? (maybe add a flag for
that to dup3 ?)

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
