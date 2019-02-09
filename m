From: brendanhiggins at google.com (Brendan Higgins)
Date: Fri, 8 Feb 2019 16:40:08 -0800
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <34f9e9f3-6bca-f11f-097c-c6e0cb779b61@cambridgegreys.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
 <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>
 <20181204204701.GT28501@garbanzo.do-not-panic.com>
 <f8722f4a-44c8-24c2-c433-5178f9f40b82@ideasonboard.com>
 <20181206153718.GD24603@bombadil.infradead.org>
 <20181211140926.7wzd5jh6klcfsfgz@pathway.suse.cz>
 <20181211094140.2a928fe7@gandalf.local.home>
 <34f9e9f3-6bca-f11f-097c-c6e0cb779b61@cambridgegreys.com>
Message-ID: <CAFd5g46kQ=x0PA+04qSm4At23cNvYTUszPb-6eadJ9N04POFUQ@mail.gmail.com>

On Tue, Dec 11, 2018 at 9:02 AM Anton Ivanov
<anton.ivanov at cambridgegreys.com> wrote:
>
>
> On 12/11/18 2:41 PM, Steven Rostedt wrote:
> > On Tue, 11 Dec 2018 15:09:26 +0100
> > Petr Mladek <pmladek at suse.com> wrote:
> >
> >>> We have liburcu already, which is good.  The main sticking points are:
> >>>
> >>>   - printk has started adding a lot of %pX enhancements which printf
> >>>     obviously doesn't know about.
> >> I wonder how big problem it is and if it is worth using another
> >> approach.
> > No, please do not change the %pX approach.
> >
> >> An alternative would be to replace them with helper functions
> >> the would produce the same string. The meaning would be easier
> >> to understand. But concatenating with the surrounding text
> >> would be less elegant. People might start using pr_cont()
> >> that is problematic (mixed lines).
> >>
> >> Also the %pX formats are mostly used to print context of some
> >> structures. Even the helper functions would need some maintenance
> >> to keep them compatible.
> >>
> >> BTW: The printk() feature has been introduced 10 years ago by
> >> the commit 4d8a743cdd2690c0bc8 ("vsprintf: add infrastructure
> >> support for extended '%p' specifiers").
> > trace-cmd and perf know about most of the %pX data and how to read it.
> > Perhaps we can extend the libtraceevent library to export a generic way
> > to read data from printk() output for other tools to use.
>
> Going back for a second to using UML for this. UML console at present is
> interrupt driven - it emulates serial IO using several different
> back-ends (file descriptors, xterm or actual tty/ptys). Epoll events on
> the host side are used to trigger the UML interrupts - both read and write.
>
> This works OK for normal use, but may result in all kinds of interesting
> false positives/false negatives when UML is used to run unit tests
> against a change which changes interrupt behavior.
>
> IMO it may be useful to consider some alternatives specifically for unit
> test coverage purposes where printk and/or the whole console output
> altogether bypass some of the IRQ driven semantics.

Whoops, sorry, didn't see your comment before I went on vacation.

I completely agree. It is also annoying when trying to test other
really low level parts of the kernel. I would really like to get KUnit
to the point where it does not have any dependencies on anything in
the kernel, but that is very challenging for many reasons. This
loosely relates to what Luis, myself, and others have talked about in
other threads about having a stricter notion of code dependencies in
the kernel. Thinking about it now, I suspect it might be easier to
limit KUnit's dependency on kernel infrastructure first; that could
kind of motivate the later work.
