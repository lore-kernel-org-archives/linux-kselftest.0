From: cyphar@cyphar.com (Aleksa Sarai)
Date: Thu,  1 Nov 2018 02:25:41 +1100
Subject: [PATCH v2 0/2] kretprobe: produce sane stack traces
Message-ID: <20181031152543.12138-1-cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181031152541.IvK_e0XeCBdmTGa8xZEaJ519mVHz5S_YqKCgpUSek84@z>

Historically, kretprobe has always produced unusable stack traces
(kretprobe_trampoline is the only entry in most cases, because of the
funky stack pointer overwriting). This has caused quite a few annoyances
when using tracing to debug problems[1] -- since return values are only
available with kretprobes but stack traces were only usable for kprobes,
users had to probe both and then manually associate them.

This patch series stores the stack trace within kretprobe_instance on
the kprobe entry used to set up the kretprobe. This allows for
DTrace-style stack aggregation between function entry and exit with
tools like BPFtrace -- which would not really be doable if the stack
unwinder understood kretprobe_trampoline.

We also revert commit 76094a2cf46e ("ftrace: distinguish kretprobe'd
functions in trace logs") and any follow-up changes because that code is
no longer necessary now that stack traces are sane. *However* this patch
might be a bit contentious since the original usecase (that ftrace
returns shouldn't show kretprobe_trampoline) is arguably still an
issue. Feel free to drop it if you think it is wrong.

Patch changelog:
 v2:
   * documentation: mention kretprobe stack-stashing
   * ftrace: add self-test for fixed kretprobe stacktraces
   * ftrace: remove [unknown/kretprobe'd] handling
   * kprobe: remove needless EXPORT statements
   * kprobe: minor corrections to current_kretprobe_instance (switch
     away from hlist_for_each_entry_safe)
   * kprobe: make maximum stack size 127, which is the ftrace default

(I forgot to Cc the BPF folks in v1, I've added them now.)

Aleksa Sarai (2):
  kretprobe: produce sane stack traces
  trace: remove kretprobed checks

 Documentation/kprobes.txt                     |   6 +-
 include/linux/kprobes.h                       |  15 +++
 kernel/events/callchain.c                     |   8 +-
 kernel/kprobes.c                              | 101 +++++++++++++++++-
 kernel/trace/trace.c                          |  11 +-
 kernel/trace/trace_output.c                   |  34 +-----
 .../test.d/kprobe/kretprobe_stacktrace.tc     |  25 +++++
 7 files changed, 165 insertions(+), 35 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_stacktrace.tc

-- 
2.19.1
