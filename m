From: lkml at metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 11:05:27 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAHrFyr4akTbvZ_LDSwAsdjTCDhdi+KLY1zjZAduc1xuNawPWig@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416192051.GA184889@google.com> <20190417130940.GC32622@redhat.com>
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
 <CAHrFyr4akTbvZ_LDSwAsdjTCDhdi+KLY1zjZAduc1xuNawPWig@mail.gmail.com>
Message-ID: <92f374d0-7cc0-9cc4-80fe-f7efa39e0435@metux.net>

On 20.04.19 02:17, Christian Brauner wrote:

> It's not off the table that we can add a pidfd_open() if that becomes> a real thing.
What are the exact semantics of pidfd_open() ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
