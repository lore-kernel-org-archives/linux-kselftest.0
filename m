From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:17:10 +0900
Subject: [PATCH v3 10/28] selftests/ftrace: Use loopback address instead of
 localhost
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563862993.29700.6436770573173736555.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830141710.wNTWt9PSnkQFZrtySnCpgKC6FlujU1MlYXbLuDouHmI@z>

Use raw loopback address instead of localhost, because
"localhost" can depend on nsswitch and in some case
we can not resolve the localhost.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
 - Use $LOCALHOST variable instead of raw loopback address
 - Move yield common function into test.d/functions.
---
 .../selftests/ftrace/test.d/event/event-enable.tc  |    4 ----
 .../selftests/ftrace/test.d/event/event-pid.tc     |    4 ----
 .../ftrace/test.d/event/subsystem-enable.tc        |    4 ----
 .../ftrace/test.d/event/toplevel-enable.tc         |    4 ----
 .../ftrace/test.d/ftrace/func-filter-pid.tc        |    4 ----
 tools/testing/selftests/ftrace/test.d/functions    |    6 ++++++
 .../inter-event/trigger-field-variable-support.tc  |    2 +-
 .../trigger-inter-event-combined-hist.tc           |    2 +-
 .../inter-event/trigger-onmatch-action-hist.tc     |    3 ++-
 .../trigger-onmatch-onmax-action-hist.tc           |    3 ++-
 .../inter-event/trigger-onmax-action-hist.tc       |    3 ++-
 11 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/event/event-enable.tc b/tools/testing/selftests/ftrace/test.d/event/event-enable.tc
index 386dbddbdc11..dfb0d5122f7b 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-enable.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-enable.tc
@@ -13,10 +13,6 @@ fail() { #msg
     exit_fail
 }
 
-yield() {
-    ping localhost -c 1 || sleep .001 || usleep 1 || sleep 1
-}
-
 if [ ! -f set_event -o ! -d events/sched ]; then
     echo "event tracing is not supported"
     exit_unsupported
diff --git a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
index 6dbf67544fde..e28897738500 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
@@ -16,10 +16,6 @@ fail() { #msg
     exit_fail
 }
 
-yield() {
-    ping localhost -c 1 || sleep .001 || usleep 1 || sleep 1
-}
-
 if [ ! -f set_event -o ! -d events/sched ]; then
     echo "event tracing is not supported"
     exit_unsupported
diff --git a/tools/testing/selftests/ftrace/test.d/event/subsystem-enable.tc b/tools/testing/selftests/ftrace/test.d/event/subsystem-enable.tc
index 10eb17f161b7..83a8c571e93a 100644
--- a/tools/testing/selftests/ftrace/test.d/event/subsystem-enable.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/subsystem-enable.tc
@@ -13,10 +13,6 @@ fail() { #msg
     exit_fail
 }
 
-yield() {
-    ping localhost -c 1 || sleep .001 || usleep 1 || sleep 1
-}
-
 if [ ! -f set_event -o ! -d events/sched ]; then
     echo "event tracing is not supported"
     exit_unsupported
diff --git a/tools/testing/selftests/ftrace/test.d/event/toplevel-enable.tc b/tools/testing/selftests/ftrace/test.d/event/toplevel-enable.tc
index 8d55a233c1a4..84d7bda08d2a 100644
--- a/tools/testing/selftests/ftrace/test.d/event/toplevel-enable.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/toplevel-enable.tc
@@ -12,10 +12,6 @@ fail() { #msg
     exit_fail
 }
 
-yield() {
-    ping localhost -c 1 || sleep .001 || usleep 1 || sleep 1
-}
-
 if [ ! -f available_events -o ! -f set_event -o ! -d events ]; then
     echo "event tracing is not supported"
     exit_unsupported
diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
index 970903cb7834..64cfcc75e3c1 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
@@ -48,10 +48,6 @@ fail() { # msg
     exit_fail
 }
 
-yield() {
-    ping localhost -c 1 || sleep .001 || usleep 1 || sleep 1
-}
-
 do_test() {
     disable_tracing
 
diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index b2bfa4dd43f7..7b96e80e6b8a 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -103,3 +103,9 @@ initialize_ftrace() { # Reset ftrace to initial-state
     clear_trace
     enable_tracing
 }
+
+LOCALHOST=127.0.0.1
+
+yield() {
+    ping $LOCALHOST -c 1 || sleep .001 || usleep 1 || sleep 1
+}
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-field-variable-support.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-field-variable-support.tc
index 575af23df04e..f59b2a9a1f22 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-field-variable-support.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-field-variable-support.tc
@@ -23,7 +23,7 @@ echo 'hist:keys=comm:ts0=common_timestamp.usecs if comm=="ping"' > events/sched/
 echo 'hist:keys=next_comm:wakeup_lat=common_timestamp.usecs-$ts0:onmatch(sched.sched_waking).wakeup_latency($wakeup_lat,next_pid,sched.sched_waking.prio,next_comm) if next_comm=="ping"' > events/sched/sched_switch/trigger
 echo 'hist:keys=pid,prio,comm:vals=lat:sort=pid,prio' > events/synthetic/wakeup_latency/trigger
 
-ping localhost -c 3
+ping $LOCALHOST -c 3
 if ! grep -q "ping" events/synthetic/wakeup_latency/hist; then
     fail "Failed to create inter-event histogram"
 fi
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-inter-event-combined-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-inter-event-combined-hist.tc
index 92aef26e2631..524d9ce361e2 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-inter-event-combined-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-inter-event-combined-hist.tc
@@ -37,7 +37,7 @@ echo 'waking+wakeup_latency u64 lat; pid_t pid' >> synthetic_events
 echo 'hist:keys=pid,lat:sort=pid,lat:ww_lat=$waking_lat+$wakeup_lat:onmatch(synthetic.wakeup_latency).waking+wakeup_latency($ww_lat,pid)' >> events/synthetic/wakeup_latency/trigger
 echo 'hist:keys=pid,lat:sort=pid,lat' >> events/synthetic/waking+wakeup_latency/trigger
 
-ping localhost -c 3
+ping $LOCALHOST -c 3
 if ! grep -q "pid:" events/synthetic/waking+wakeup_latency/hist; then
     fail "Failed to create combined histogram"
 fi
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-action-hist.tc
index 1ef5dd4521f0..39fb65b0cd9f 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-action-hist.tc
@@ -29,7 +29,8 @@ echo "Test histogram variables,simple expression support and onmatch action"
 echo 'hist:keys=pid:ts0=common_timestamp.usecs if comm=="ping"' > events/sched/sched_wakeup/trigger
 echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0:onmatch(sched.sched_wakeup).wakeup_latency($wakeup_lat,next_pid,next_comm) if next_comm=="ping"' > events/sched/sched_switch/trigger
 echo 'hist:keys=comm,pid,lat:wakeup_lat=lat:sort=lat' > events/synthetic/wakeup_latency/trigger
-ping localhost -c 5
+
+ping $LOCALHOST -c 5
 if ! grep -q "ping" events/synthetic/wakeup_latency/hist; then
     fail "Failed to create onmatch action inter-event histogram"
 fi
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc
index 7234683ee5e5..81ab3939c96a 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc
@@ -29,7 +29,8 @@ echo "Test histogram variables,simple expression support and onmatch-onmax actio
 echo 'hist:keys=pid:ts0=common_timestamp.usecs if comm=="ping"' > events/sched/sched_wakeup/trigger
 echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0:onmatch(sched.sched_wakeup).wakeup_latency($wakeup_lat,next_pid,next_comm):onmax($wakeup_lat).save(next_comm,prev_pid,prev_prio,prev_comm) if next_comm=="ping"' >> events/sched/sched_switch/trigger
 echo 'hist:keys=comm,pid,lat:wakeup_lat=lat:sort=lat' > events/synthetic/wakeup_latency/trigger
-ping localhost -c 5
+
+ping $LOCALHOST -c 5
 if [ ! grep -q "ping" events/synthetic/wakeup_latency/hist -o ! grep -q "max:" events/sched/sched_switch/hist]; then
     fail "Failed to create onmatch-onmax action inter-event histogram"
 fi
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmax-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmax-action-hist.tc
index 55b9630a1d70..1180ab5f0845 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmax-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmax-action-hist.tc
@@ -27,7 +27,8 @@ echo "Test onmax action"
 
 echo 'hist:keys=pid:ts0=common_timestamp.usecs if comm=="ping"' >> events/sched/sched_waking/trigger
 echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0:onmax($wakeup_lat).save(next_comm,prev_pid,prev_prio,prev_comm) if next_comm=="ping"' >> events/sched/sched_switch/trigger
-ping localhost -c 3
+
+ping $LOCALHOST -c 3
 if ! grep -q "max:" events/sched/sched_switch/hist; then
     fail "Failed to create onmax action inter-event histogram"
 fi
