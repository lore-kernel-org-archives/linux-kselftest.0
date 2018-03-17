From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Sat, 17 Mar 2018 23:06:56 +0900
Subject: [PATCH v6 00/21] tracing: probeevent: Improve fetcharg features
In-Reply-To: <152129024033.31874.15800253385376959274.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
Message-ID: <20180317230656.00e6a95729ab211c8fc91f2a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180317140656.2--bIXkjMaFK2tTXxwwjp3JBj0FztLNgFdDfK2OD__0@z>

On Sat, 17 Mar 2018 21:37:21 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi,
> 
> This is the 6th version of the fetch-arg improvement series.
> This includes variable changes on fetcharg framework like,
> 
> - Add fetcharg testcases (syntax, argN, symbol, string and array)
>   and probepoint testcase.
> - Rewrite fetcharg framework with fetch_insn, switch-case based
>   instead of function pointer.
> - Add "symbol" type support, which shows symbol+offset instead of
>   address value.
> - Add "$argN" fetcharg, which fetches function parameters.
>   (currently only for x86-64)
> - Add array type support (including string arrary :) ) ,
>   which enables to get fixed length array from probe-events.
> - Add array type support for perf-probe, so that user can
>   dump partial array entries.
> 
> V5 is here:
>  https://lkml.org/lkml/2018/3/12/558

No, this is another series, v5 is here.

https://lkml.org/lkml/2018/3/8/562

Thanks,

> 
> Changes from the v5 is here:
> 
>  - [16/21] Fix README to add backslash escapes to "[]"
>  - [20/21] Add a bugfix patch for perf-probe.
>  - [21/21] Add array type support for perf-probe.
> 
> Note that [20/21] is same as https://lkml.org/lkml/2018/3/16/108
> I have to add this because the last patch depends on it.
> Anyway, [20/21] and [21/21] is only for showing how perf-probe
> will enhanced by this series. So those are extra work.
> I will resend thodr again after [01/21]-[19/21] are merged.
> 
> Here are examples:
> 
> o 'symbol' type
> 
>  # echo 'p vfs_read $stack0:symbol' > kprobe_events 
>  # echo 1 > events/kprobes/p_vfs_read_0/enable 
>  # tail -n 3 trace
>               sh-729   [007] ...2   105.753637: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=SyS_read+0x42/0x90
>             tail-736   [000] ...2   105.754904: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=kernel_read+0x2c/0x40
>             tail-736   [000] ...2   105.754929: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=kernel_read+0x2c/0x40
> 
> 
> o $argN 
> 
>  # echo 'p vfs_read $arg0 $arg1 $arg2' > kprobe_events
>  # echo 1 > events/kprobes/p_vfs_read_0/enable 
>  # tail -n 3 trace
>               sh-726   [007] ...2   134.288973: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=0xffff88001d98ec00 arg2=0x7ffeb4330f79 arg3=0x1
>             tail-731   [000] ...2   134.289987: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=0xffff88001d9dd200 arg2=0xffff88001d8a0a00 arg3=0x80
>             tail-731   [000] ...2   134.290016: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=0xffff88001d9dd200 arg2=0xffff88001faf4a00 arg3=0x150
> 
> 
> o Array type
> 
>  # echo 'p vfs_read +0($stack):x64 +0($stack):x8[8]' > kprobe_events 
>  # echo 1 > events/kprobes/p_vfs_read_0/enable 
>  # tail -n 3 trace
>               sh-729   [007] ...2    91.701664: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=0xffffffff811b1252 arg2={0x52,0x12,0x1b,0x81,0xff,0xff,0xff,0xff}
>             tail-734   [000] ...2    91.702366: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=0xffffffff811b0dec arg2={0xec,0xd,0x1b,0x81,0xff,0xff,0xff,0xff}
>             tail-734   [000] ...2    91.702386: p_vfs_read_0: (vfs_read+0x0/0x130) arg1=0xffffffff811b0dec arg2={0xec,0xd,0x1b,0x81,0xff,0xff,0xff,0xff}
>  #
>  # cat events/kprobes/p_vfs_read_0/format 
> name: p_vfs_read_0
> ID: 1069
> format:
> 	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
> 	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
> 	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
> 	field:int common_pid;	offset:4;	size:4;	signed:1;
> 
> 	field:unsigned long __probe_ip;	offset:8;	size:8;	signed:0;
> 	field:u64 arg1;	offset:16;	size:0;	signed:0;
> 	field:u8 arg2[8];	offset:24;	size:8;	signed:0;
> 
> print fmt: "(%lx) arg1=0x%Lx arg2={0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x}", REC->__probe_ip, REC->arg1, REC->arg2[0], REC->arg2[1], REC->arg2[2], REC->arg2[3], REC->arg2[4], REC->arg2[5], REC->arg2[6], REC->arg2[7]
> 
> o String Array type
> 
>  # echo "p create_trace_kprobe arg1=+0(%si):string[3]" > kprobe_events 
>  # echo test1 test2 test3 >> kprobe_events 
> sh: write error: Invalid argument
>  # echo 'p vfs_read $stack' >> kprobe_events 
>  # tail -n 2 trace 
>               sh-744   [007] ...1   183.382407: p_create_trace_kprobe_0: (create_trace_kprobe+0x0/0x890) arg1={"test1","test2","test3"}
>               sh-744   [007] ...1   230.487809: p_create_trace_kprobe_0: (create_trace_kprobe+0x0/0x890) arg1={"p","vfs_read","$stack"}
> 
> 
> Thank you,
> 
> ---
> 
> Masami Hiramatsu (21):
>       [BUGFIX] tracing: probeevent: Fix to support minus offset from symbol
>       selftests: ftrace: Add probe event argument syntax testcase
>       selftests: ftrace: Add a testcase for string type with kprobe_event
>       selftests: ftrace: Add a testcase for probepoint
>       tracing: probeevent: Cleanup print argument functions
>       tracing: probeevent: Cleanup argument field definition
>       tracing: probeevent: Remove NOKPROBE_SYMBOL from print functions
>       tracing: probeevent: Introduce new argument fetching code
>       tracing: probeevent: Unify fetch type tables
>       tracing: probeevent: Return consumed bytes of dynamic area
>       tracing: probeevent: Append traceprobe_ for exported function
>       tracing: probeevent: Unify fetch_insn processing common part
>       tracing: probeevent: Add symbol type
>       x86: ptrace: Add function argument access API
>       tracing: probeevent: Add $argN for accessing function args
>       tracing: probeevent: Add array type support
>       selftests: ftrace: Add a testcase for symbol type
>       selftests: ftrace: Add a testcase for $argN with kprobe_event
>       selftests: ftrace: Add a testcase for array type with kprobe_event
>       [RESEND] perf-probe: Fix to convert array type collectly
>       perf-probe: Add array argument support
> 
> 
>  Documentation/trace/kprobetrace.txt                |   26 +
>  arch/Kconfig                                       |    7 
>  arch/x86/Kconfig                                   |    1 
>  arch/x86/include/asm/ptrace.h                      |   38 +
>  kernel/trace/trace.c                               |    9 
>  kernel/trace/trace_kprobe.c                        |  366 ++++--------
>  kernel/trace/trace_probe.c                         |  628 +++++++++-----------
>  kernel/trace/trace_probe.h                         |  284 +++------
>  kernel/trace/trace_probe_tmpl.h                    |  214 +++++++
>  kernel/trace/trace_uprobe.c                        |  168 ++---
>  tools/perf/Documentation/perf-probe.txt            |    2 
>  tools/perf/util/probe-event.c                      |   20 +
>  tools/perf/util/probe-event.h                      |    2 
>  tools/perf/util/probe-file.c                       |    5 
>  tools/perf/util/probe-file.h                       |    1 
>  tools/perf/util/probe-finder.c                     |  108 ++-
>  .../ftrace/test.d/kprobe/kprobe_args_argN.tc       |   25 +
>  .../ftrace/test.d/kprobe/kprobe_args_array.tc      |   92 +++
>  .../ftrace/test.d/kprobe/kprobe_args_string.tc     |   46 +
>  .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   77 ++
>  .../ftrace/test.d/kprobe/kprobe_args_syntax.tc     |   97 +++
>  .../selftests/ftrace/test.d/kprobe/probepoint.tc   |   43 +
>  22 files changed, 1319 insertions(+), 940 deletions(-)
>  create mode 100644 kernel/trace/trace_probe_tmpl.h
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_array.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/probepoint.tc
> 
> --
> Masami Hiramatsu (Linaro) <mhiramat at kernel.org>


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
