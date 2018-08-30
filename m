From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:16:13 +0900
Subject: [PATCH v3 08/28] selftests/ftrace: Fix to test kprobe $comm arg only
 if available
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563857337.29700.5631759295666790709.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830141613.XXzcmp2O79CPYsETU8d7yFyk73DKVzwvFqSlsJj-Z0o@z>

Test $comm in kprobe-event argument syntax testcase
only if it is supported on the kernel because
$comm has been introduced 4.8 kernel.
So on older stable kernel, it should be skipped.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_syntax.tc     |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
index d783a8ce0692..6f0f19953193 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
@@ -75,8 +75,11 @@ test_badarg "\$stackp" "\$stack0+10" "\$stack1-10"
 echo "r ${PROBEFUNC} \$retval" > kprobe_events
 ! echo "p ${PROBEFUNC} \$retval" > kprobe_events
 
+# $comm was introduced in 4.8, older kernels reject it.
+if grep -A1 "fetcharg:" README | grep -q '\$comm' ; then
 : "Comm access"
 test_goodarg "\$comm"
+fi
 
 : "Indirect memory access"
 test_goodarg "+0(${GOODREG})" "-0(${GOODREG})" "+10(\$stack)" \
