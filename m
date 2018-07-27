From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:16:33 +0900
Subject: [PATCH 14/25] selftests/ftrace: Test kprobe-event argument with
 various bitsize
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269379362.3084.6493537345417100466.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121633.zqCyR6XpviPtS-QQ7jhE57Wtjh_eocd3mIPmthUnDbc@z>

Improve the kprobe-event with argument types testcase
to test it with various bitsize.
kprobe-event argument can be recorded in given types with
various bitsize (8, 16, 32, 64), thus the type testcase
should test the different bitsize too.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_type.tc       |   48 +++++++++++++-------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_type.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_type.tc
index 37443dd23d15..1bcb67dcae26 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_type.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_type.tc
@@ -6,29 +6,45 @@
 
 grep "x8/16/32/64" README > /dev/null || exit_unsupported # version issue
 
-echo 'p:testprobe _do_fork $stack0:s32 $stack0:u32 $stack0:x32 $stack0:b8 at 4/32' > kprobe_events
-grep testprobe kprobe_events
-test -d events/kprobes/testprobe
-
-echo 1 > events/kprobes/testprobe/enable
-( echo "forked")
-echo 0 > events/kprobes/testprobe/enable
-ARGS=`tail -n 1 trace | sed -e 's/.* arg1=\(.*\) arg2=\(.*\) arg3=\(.*\) arg4=\(.*\)/\1 \2 \3 \4/'`
+gen_event() { # Bitsize
+  echo "p:testprobe _do_fork \$stack0:s$1 \$stack0:u$1 \$stack0:x$1 \$stack0:b4 at 4/$1"
+}
 
-check_types() {
-  X1=`printf "%x" $1 | tail -c 8`
+check_types() { # s-type u-type x-type bf-type width
+  test $# -eq 5
+  CW=$5
+  CW=$((CW / 4))
+  X1=`printf "%x" $1 | tail -c ${CW}`
   X2=`printf "%x" $2`
   X3=`printf "%x" $3`
   test $X1 = $X2
   test $X2 = $X3
   test 0x$X3 = $3
 
-  B4=`printf "%02x" $4`
-  B3=`echo -n $X3 | tail -c 3 | head -c 2`
+  B4=`printf "%1x" $4`
+  B3=`printf "%03x" 0x$X3 | tail -c 2 | head -c 1`
   test $B3 = $B4
 }
-check_types $ARGS
 
-echo "-:testprobe" >> kprobe_events
-clear_trace
-test -d events/kprobes/testprobe && exit_fail || exit_pass
+for width in 64 32 16 8; do
+  : "Add new event with basic types"
+  gen_event $width > kprobe_events
+  grep testprobe kprobe_events
+  test -d events/kprobes/testprobe
+
+  : "Trace the event"
+  echo 1 > events/kprobes/testprobe/enable
+  ( echo "forked")
+  echo 0 > events/kprobes/testprobe/enable
+
+  : "Confirm the arguments is recorded in given types correctly"
+  ARGS=`grep "testprobe" trace | sed -e 's/.* arg1=\(.*\) arg2=\(.*\) arg3=\(.*\) arg4=\(.*\)/\1 \2 \3 \4/'`
+  check_types $ARGS $width
+
+  : "Clear event for next loop"
+  echo "-:testprobe" >> kprobe_events
+  clear_trace
+
+done
+
+exit_pass

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
