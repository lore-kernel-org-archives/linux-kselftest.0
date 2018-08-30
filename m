From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 16:12:18 +0900
Subject: [PATCH v2 22/32] selftests/ftrace: Add ringbuffer size changing
 testcase
In-Reply-To: <20180824191836.305ad740@gandalf.local.home>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443757416.23257.9284862385646039929.stgit@devbox>
 <20180824191836.305ad740@gandalf.local.home>
Message-ID: <20180830161218.e46affa5a84abd47c9cf2a39@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830071218.QIhw4MuaovWAYCTead9V1k-NVHV9Y-rcQ3B5bRBL4_k@z>

On Fri, 24 Aug 2018 19:18:36 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 17 Aug 2018 01:39:34 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Add a testcase for changing ringbuffer size. This tests
> > not only ringbuffer size but also tests the imbalance
> > per-cpu buffer size change too.
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> 
> I'm fine with this, but one day I need to port over some of my other
> tests. I have a test that stresses the ring buffer size (basically
> checks to see if it can cause an oom). I need to port that to
> selftests. But for now...

Hmm, such stress test is not good for kselftest, since it can cause
oom and kill some test process. Maybe we should have such stresstest
framework (which allows test to crash kernel)

> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> 
> But, one more thing..
> 
> > ---
> >  .../ftrace/test.d/00basic/ringbuffer_size.tc       |   21 ++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
> > 
> > diff --git a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
> > new file mode 100644
> > index 000000000000..9224f33b3194
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
> > @@ -0,0 +1,21 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# description: Change the ringbuffer size
> 
> Should add:
> 
>  # flags: instance

OK, I'll add it.

Thank you!

> 
> As this works for instances as well.
> 
> -- Steve
> 
> > +
> > +rb_size_test() {
> > +ORIG=`cat buffer_size_kb`
> > +
> > +expr $ORIG / 2 > buffer_size_kb
> > +
> > +expr $ORIG \* 2 > buffer_size_kb
> > +
> > +echo $ORIG > buffer_size_kb
> > +}
> > +
> > +rb_size_test
> > +
> > +: "If per-cpu buffer is supported, imbalance it"
> > +if [ -d per_cpu/cpu0 ]; then
> > +  cd per_cpu/cpu0
> > +  rb_size_test
> > +fi
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
