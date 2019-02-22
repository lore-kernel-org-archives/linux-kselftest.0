From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 22 Feb 2019 10:26:27 +0900
Subject: [PATCH selftests 0/2] Add checkbashisms meta-testcase
Message-ID: <155079878723.5157.12433171255092403676.stgit@devbox>

Hi,

Here are patches for making sure the ftracetest testcases
are checkbashisms clean.

This actually needs a patch from Juerg, "selftests/ftrace:
Make the coloring POSIX compliant" to complete the work.

http://lkml.kernel.org/r/20190220161333.28109-1-juergh at canonical.com
(Note that this is still under development)

So as Juerg pointed, recently ftracetest becomes not POSIX
compliant, and such kind of issues happened repeatedly.
To avoid those anymore, I decided to introduce a testcase
which runs checkbasisms on ftracetest and its testcases.
I think this can help us to find out whether it was
written in a way out of POSIX.

Thank you,

---

Masami Hiramatsu (2):
      selftests/ftrace: Make a script checkbashisms clean
      selftests/ftrace: Add checkbashisms meta-testcase


 tools/testing/selftests/ftrace/ftracetest          |    1 +
 .../ftrace/test.d/kprobe/kprobe_ftrace.tc          |    2 +-
 .../selftests/ftrace/test.d/selftest/bashisms.tc   |   21 ++++++++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/selftest/bashisms.tc

--
Masami Hiramatsu (Linaro) <mhiramat at kernel.org>
