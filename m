From: nstange at suse.de (Nicolai Stange)
Date: Sat, 27 Apr 2019 12:06:35 +0200
Subject: [PATCH 0/4] x86/ftrace: make ftrace_int3_handler() not to skip fops
 invocation
Message-ID: <20190427100639.15074-1-nstange@suse.de>

Hi,

this series is the result of the discussion to the RFC patch found at [1].

The goal is to make x86' ftrace_int3_handler() not to simply skip over
the trapping instruction as this is problematic in the context of
the live patching consistency model. For details, c.f. the commit message
of [3/4] ("x86/ftrace: make ftrace_int3_handler() not to skip fops
invocation").

Everything is based on v5.1-rc6, please let me know in case you want me to
rebase on somehing else.

For x86_64, the live patching selftest added in [4/4] succeeds with this
series applied and fails without it. On 32 bits I only compile-tested.

checkpatch reports warnings about
- an overlong line in assembly -- I chose to ignore that
- MAINTAINERS perhaps needing updates due to the new files
  arch/x86/kernel/ftrace_int3_stubs.S and
  tools/testing/selftests/livepatch/test-livepatch-vs-ftrace.sh.
  As the existing arch/x86/kernel/ftrace_{32,64}.S haven't got an
  explicit entry either, this one is probably Ok? The selftest
  definitely is.

Changes to the RFC patch:
- s/trampoline/stub/ to avoid confusion with the ftrace_ops' trampolines,
- use a fixed size stack kept in struct thread_info for passing the
  (adjusted) ->ip values from ftrace_int3_handler() to the stubs,
- provide one stub for each of the two possible jump targets and hardcode
  those,
- add the live patching selftest.

Thanks,

Nicolai

Nicolai Stange (4):
  x86/thread_info: introduce ->ftrace_int3_stack member
  ftrace: drop 'static' qualifier from ftrace_ops_list_func()
  x86/ftrace: make ftrace_int3_handler() not to skip fops invocation
  selftests/livepatch: add "ftrace a live patched function" test

 arch/x86/include/asm/thread_info.h                 | 11 +++
 arch/x86/kernel/Makefile                           |  1 +
 arch/x86/kernel/asm-offsets.c                      |  8 +++
 arch/x86/kernel/ftrace.c                           | 79 +++++++++++++++++++---
 arch/x86/kernel/ftrace_int3_stubs.S                | 61 +++++++++++++++++
 kernel/trace/ftrace.c                              |  8 +--
 tools/testing/selftests/livepatch/Makefile         |  3 +-
 .../livepatch/test-livepatch-vs-ftrace.sh          | 44 ++++++++++++
 8 files changed, 199 insertions(+), 16 deletions(-)
 create mode 100644 arch/x86/kernel/ftrace_int3_stubs.S
 create mode 100755 tools/testing/selftests/livepatch/test-livepatch-vs-ftrace.sh

-- 
2.13.7
