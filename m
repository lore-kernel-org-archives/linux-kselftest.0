From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 22 Feb 2019 10:26:57 +0900
Subject: [PATCH selftests 1/2] selftests/ftrace: Make a script checkbashisms
 clean
In-Reply-To: <155079878723.5157.12433171255092403676.stgit@devbox>
References: <155079878723.5157.12433171255092403676.stgit@devbox>
Message-ID: <155079881689.5157.10494170079333363559.stgit@devbox>

Make kprobe_ftrace.tc checkbashisms clean. Since
"grep function available_tracers" causes an error
on checkbashisms, fix it by explicitly escaping
with double-quotations.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_ftrace.tc          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_ftrace.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_ftrace.tc
index 492426e95e09..7650a82db3f5 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_ftrace.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_ftrace.tc
@@ -3,7 +3,7 @@
 # description: Kprobe dynamic event with function tracer
 
 [ -f kprobe_events ] || exit_unsupported # this is configurable
-grep function available_tracers || exit_unsupported # this is configurable
+grep "function" available_tracers || exit_unsupported # this is configurable
 
 # prepare
 echo nop > current_tracer
