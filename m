From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 07 May 2019 21:55:59 -0400
Subject: [PATCH 0/3] x86_64/ftrace: Emulate calls from int3 when patching
 functions
Message-ID: <20190508015559.767152678@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508015559.2ZOHHfFpYihMc9bM3UOA7XDlXvZ4trQ-tsLCp6mZXzM@z>


[
  This is the non-RFC version.

  It went through and passed all my tests. If there's no objections
  I'm going to include this in my pull request. I still have patches
  in my INBOX that may still be included, so I need to run those through
  my tests as well, so a pull request wont be immediate.
]

Nicolai Stange discovered that Live Kernel Patching can have unforseen
consequences if tracing is enabled when there are functions that are
patched. The reason being, is that Live Kernel patching is built on top
of ftrace, which will have the patched functions call the live kernel
trampoline directly, and that trampoline will modify the regs->ip address
to return to the patched function.

But in the transition between changing the call to the customized
trampoline, the tracing code is needed to have its handler called
an well, so the function fentry location must be changed from calling
the live kernel patching trampoline, to the ftrace_reg_caller trampoline
which will iterate through all the registered ftrace handlers for
that function.

During this transition, a break point is added to do the live code
modifications. But if that break point is hit, it just skips calling
any handler, and makes the call site act as a nop. For tracing, the
worse that can happen is that you miss a function being traced, but
for live kernel patching the affects are more severe, as the old buggy
function is now called.

To solve this, an int3_emulate_call() is created for x86_64 to allow
ftrace on x86_64 to emulate the call to ftrace_regs_caller() which will
make sure all the registered handlers to that function are still called.
And this keeps live kernel patching happy!

To mimimize the changes, and to avoid controversial patches, this
only changes x86_64. Due to the way x86_32 implements the regs->sp
the complexity of emulating calls on that platform is too much for
stable patches, and live kernel patching does not support x86_32 anyway.


Josh Poimboeuf (1):
      x86_64: Add gap to int3 to allow for call emulation

Peter Zijlstra (2):
      x86_64: Allow breakpoints to emulate call instructions
      ftrace/x86_64: Emulate call function while updating in breakpoint handler

----
 arch/x86/entry/entry_64.S            | 18 ++++++++++++++++--
 arch/x86/include/asm/text-patching.h | 28 ++++++++++++++++++++++++++++
 arch/x86/kernel/ftrace.c             | 32 +++++++++++++++++++++++++++-----
 3 files changed, 71 insertions(+), 7 deletions(-)
