From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 19:07:08 -0400
Subject: [PATCH v2 12/32] selftests/ftrace: Improve kprobe on module
 testcase to load/unload module
In-Reply-To: <153443729154.23257.15704810148795897178.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443729154.23257.15704810148795897178.stgit@devbox>
Message-ID: <20180824190708.3c170cc6@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824230708.GPLkg6_vQUSLeceVpZhIj9YHfJL3jZpmg1lyzkRl3-Q@z>

On Fri, 17 Aug 2018 01:34:51 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Improve kprobe events on module testcase to check module
> load/unload with disabled/enabled events. This also change
> the target module to trace_printk.ko, so it depends on
> CONFIG_SAMPLE_TRACE_PRINTK=m.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  tools/testing/selftests/ftrace/config              |    4 ++
>  .../ftrace/test.d/kprobe/kprobe_module.tc          |   35 ++++++++++++++++++--
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
> index 07db5ab09cc7..32cf61b6bb54 100644
> --- a/tools/testing/selftests/ftrace/config
> +++ b/tools/testing/selftests/ftrace/config
> @@ -7,3 +7,7 @@ CONFIG_HIST_TRIGGERS=y
>  CONFIG_PREEMPT_TRACER=y
>  CONFIG_IRQSOFF_TRACER=y
>  CONFIG_PREEMPTIRQ_DELAY_TEST=m
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_SAMPLES=y
> +CONFIG_SAMPLE_TRACE_PRINTK=m
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> index ec6c5fffef1e..1efe9e616bc4 100644
> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> @@ -4,11 +4,18 @@
>  
>  [ -f kprobe_events ] || exit_unsupported # this is configurable
>  
> +rmmod trace-printk ||:
> +if ! modprobe trace-printk.ko ; then

"modprobe trace-printk.ko" dosen't work. You need to drop the .ko

> +  echo "No trace-printk sample module - please make CONFIG_SAMPLE_TRACE_PRINTK=
> +m"
> +  exit_unresolved;
> +fi
> +
> +MOD=trace_printk
> +FUNC=trace_printk_irq_work
> +
>  :;: "Add an event on a module function without specifying event name" ;:
>  
> -MOD=`lsmod | head -n 2 | tail -n 1 | cut -f1 -d" "`
> -FUNC=`grep -m 1 ".* t .*\\[$MOD\\]" /proc/kallsyms | xargs | cut -f3 -d" "`
> -[ "x" != "x$MOD" -a "y" != "y$FUNC" ] || exit_unresolved
>  echo "p $MOD:$FUNC" > kprobe_events
>  PROBE_NAME=`echo $MOD:$FUNC | tr ".:" "_"`
>  test -d events/kprobes/p_${PROBE_NAME}_0 || exit_failure
> @@ -22,3 +29,25 @@ test -d events/kprobes/event1 || exit_failure
>  
>  echo "p:kprobes1/event1 $MOD:$FUNC" > kprobe_events
>  test -d events/kprobes1/event1 || exit_failure
> +
> +:;: "Remove target module, but event still be there" ;:
> +if ! rmmod trace-printk ; then
> +  echo "Failed to unload module - please enable CONFIG_MODULE_UNLOAD"
> +  exit_unresolved;
> +fi
> +test -d events/kprobes1/event1
> +
> +:;: "Check posibility to defining events on unloaded module";:
> +echo "p:event2 $MOD:$FUNC" >> kprobe_events
> +
> +:;: "Target is gone, but we can prepare for next time";:
> +echo 1 > events/kprobes1/event1/enable
> +
> +:;: "Load module again, which means the event1 should be recorded";:
> +modprobe trace-printk.ko

Same here.

-- Steve

> +grep "event1:" trace
> +
> +:;: "Remove the module again and check the event is not locked"
> +rmmod trace-printk
> +echo 0 > events/kprobes1/event1/enable
> +echo "-:kprobes1/event1" >> kprobe_events
