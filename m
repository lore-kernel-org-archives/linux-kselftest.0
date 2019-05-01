From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Wed, 1 May 2019 11:59:05 -0700
Subject: [RFC][PATCH v3] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <20190501145200.6c095d7f@oasis.local.home>
References: <20190501113238.0ab3f9dd@gandalf.local.home>
 <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
 <20190501145200.6c095d7f@oasis.local.home>
Message-ID: <CAHk-=wgMZJeMCW5MA25WFJZeYYWCOWr0nGaHhJ7kg+zsu5FY_A@mail.gmail.com>

On Wed, May 1, 2019 at 11:52 AM Steven Rostedt <rostedt at goodmis.org> wrote:
>
> I got Peter's patch working. Here it is. What do you think?

I can tell from just looking at it for five seconds that at least the
32-bit case is buggy.

You can't look at CS(%rsp) without first also checking that you're not
coming from vm86 mode.

But other than that I guess it does end up being pretty simple.

             Linus
