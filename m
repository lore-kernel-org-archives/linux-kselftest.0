From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Mon, 27 Aug 2018 21:16:01 +0900
Subject: [PATCH v2 30/32] selftests/ftrace: Add ftrace cpumask testcase
In-Reply-To: <20180824221822.3e0092c9@vmware.local.home>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443780039.23257.5243924038958174104.stgit@devbox>
 <20180824221822.3e0092c9@vmware.local.home>
Message-ID: <20180827211601.555949d3a754b76169a7c8d4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180827121601.Xi7s6EWtVlvVS_sdI3A9i_ZyVxFCfR4vihlRNqlbdW0@z>

On Fri, 24 Aug 2018 22:18:22 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 17 Aug 2018 01:43:20 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Add a testcase for tracing_cpumask with function tracer.
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> > ---
> >  .../selftests/ftrace/test.d/ftrace/func_cpumask.tc |   34 ++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
> > 
> > diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
> > new file mode 100644
> > index 000000000000..37420e355445
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
> > @@ -0,0 +1,34 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL2.0
> > +# description: ftrace - function trace with cpumask
> > +
> > +NP=`grep "^processor" /proc/cpuinfo | wc -l`
> 
> A better way to find the number of CPUs is to either use "nproc" or
> just look at /sys/devices/system/cpu/cpu[0-9]*. Because what I learned
> from experience is that searching for strings in /proc/cpuinfo is not
> cross arch compatible. For example, other archs don't use "processor"
> in the stings and would come up with a box with 0 CPUs. Something we've
> been working on for some time ;-)

OK, I'll use nproc. 

> 
> -- Steve
> 
> > +
> > +if [ $NP -eq 1 ] ;then
> > +  echo "We can not test cpumask on UP environment"
> > +  exit_unresolved
> > +fi
> > +
> > +do_reset() {
> > +  echo ffff > tracing_cpumask
> 
> Why ffff? Should we save what was in tracing_cpumask first and just
> reuse it?

OK, it also works. I just took a margin :) 

Thanks!

> 
> -- Steve
> 
> 
> > +}
> > +
> > +echo 0 > tracing_on
> > +echo > trace
> > +: "Bitmask only record on CPU1"
> > +echo 2 > tracing_cpumask
> > +MASK=0x`cat tracing_cpumask`
> > +test `printf "%d" $MASK` -eq 2 || do_reset
> > +
> > +echo function > current_tracer
> > +echo 1 > tracing_on
> > +(echo "forked")
> > +echo 0 > tracing_on
> > +
> > +: "Check CPU1 events are recorded"
> > +grep -q -e "\[001\]" trace || do_reset
> > +
> > +: "There should be No other cpu events"
> > +! grep -qv -e "\[001\]" -e "^#" trace || do_reset
> > +
> > +do_reset
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
