From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Wed, 1 May 2019 11:01:07 -0700
Subject: [RFC][PATCH v3] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <20190501113238.0ab3f9dd@gandalf.local.home>
References: <20190501113238.0ab3f9dd@gandalf.local.home>
Message-ID: <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>

This looks sane to me, although I'm surprised that we didn't already
have an annotation for the nonstandard stack frame for asm files. That
probably would be cleaner in a separate commit, but I guess it doesn't
matter.

Anyway, I'm willing to consider the entry code version if it looks a
_lot_ simpler than this (so I'd like to see them side-by-side), but
it's not like this looks all that complicated to me either.

               Linus
