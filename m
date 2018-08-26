From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Sun, 26 Aug 2018 20:20:04 +0900
Subject: [PATCH v2 23/32] selftests/ftrace: Add function profiling stat
 testcase
In-Reply-To: <20180824192018.40b9b015@gandalf.local.home>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443760252.23257.5752638886588410084.stgit@devbox>
 <20180824192018.40b9b015@gandalf.local.home>
Message-ID: <20180826202004.dffa0d77a634feafc772854a@kernel.org>

On Fri, 24 Aug 2018 19:20:18 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Fri, 17 Aug 2018 01:40:02 +0900
> Masami Hiramatsu <mhiramat at kernel.org> wrote:
> 
> > Add a testcase for function profiling per-cpu statistics
> > interface. There is already func_profile.tc, but that is
> > mainly focusing on the combination of function-profiler
> > and function tracer. This testcase ensures trace_stat
> > per-cpu function statistics is correctly updated.
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> > ---
> >  .../ftrace/test.d/ftrace/func_profile_stat.tc      |   23 ++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
> > 
> > diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
> > new file mode 100644
> > index 000000000000..1d2440d80ec3
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
> > @@ -0,0 +1,23 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# description: ftrace - function profiling
> > +
> > +[ ! -f function_profile_enabled ] && exit_unsupported
> > +
> > +: "Enable function profile"
> > +echo 1 > function_profile_enabled
> > +
> > +: "Profile must be updated"
> > +cp trace_stat/function0 $TMPDIR/
> > +( echo "forked"; sleep 1 )
> > +: "diff returns 0 if there is no difference"
> > +! diff trace_stat/function0 $TMPDIR/function0
> > +
> > +echo 0 > function_profile_enabled
> > +
> > +: "Profile must NOT be updated"
> > +cp trace_stat/function0 $TMPDIR/
> > +( echo "forked"; sleep 1 )
> > +: "diff returns 0 if there is no difference"
> > +diff trace_stat/function0 $TMPDIR/function0
> 
> > +
> 
> Can remove the last empty line from the file.

Yes, thank you for pointing it out.

> 
> Other than that...
> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

Thanks!

> 
> -- Steve
> 
> -- Steve


-- 
Masami Hiramatsu <mhiramat at kernel.org>
