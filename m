From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Wed, 24 Apr 2019 10:04:27 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CAKOZuetkF4zPm-oKMjnoJtvUi4iTnY-ORzPd-JpfpseMXY4yhw@mail.gmail.com>
References: <20190416120430.GA15437@redhat.com>
 <20190416192051.GA184889@google.com> <20190417130940.GC32622@redhat.com>
 <CAG48ez2Q0t2-rZz8wmGeih=NigYL-CT3+E6NgiPT0AkOQAUPMQ@mail.gmail.com>
 <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <CAKOZueu3PzD_QgROXFRs8FvD=HTKJLsHDK9GrUdbFoMzx_7HEA@mail.gmail.com>
 <CAHrFyr4REuKFuARAXnhBC67TGzyDGmMONc7XjfUGvf+Qfm7EuQ@mail.gmail.com>
 <20190419212002.GB44851@google.com>
 <CAKOZuetkF4zPm-oKMjnoJtvUi4iTnY-ORzPd-JpfpseMXY4yhw@mail.gmail.com>
Message-ID: <34c493c3-993f-39f1-3afc-7f59d5113a30@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424080427.Ih1jFw9Ch2boBOCBiia_A8wZJOcetKN8k6i7_U2FjKk@z>

On 19.04.19 23:24, Daniel Colascione wrote:

Hi folks,

<big_snip>

I haven't followed the whole thread, so forgive me if I'm going to
write something dumb here ... but: this all feels a bit complicated
to me.

Why not just making the pidfd present a stream of events (which are
encoded as text lines) ? It would behave just like any stream, eg.
socket, chardev, ...

An `cat` on a pidfd could look like this:

<timestamp> EXIT <exitcode>
<timestamp> EXEC <cmdline>
<timestamp> SIGNAL <sigid>
...

IOW: just using POLLIN. Let the listener just read all events and
decide which ones he's actually acting on.

In the other direction we could write in commands, eg. for sending
signals.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287
