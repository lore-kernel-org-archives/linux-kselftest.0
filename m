From: nstange@suse.de (Nicolai Stange)
Date: Sat, 27 Apr 2019 12:06:39 +0200
Subject: [PATCH 4/4] selftests/livepatch: add "ftrace a live patched function"
 test
In-Reply-To: <20190427100639.15074-1-nstange@suse.de>
References: <20190427100639.15074-1-nstange@suse.de>
Message-ID: <20190427100639.15074-5-nstange@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190427100639.Xj1aWn0PziUkSy-jars2PpBSwTPxw-lKdcMq8FbGYdQ@z>

There had been an issue with interactions between tracing and live patching
due to how x86' CONFIG_DYNAMIC_FTRACE used to handle the breakpoints at the
updated instructions from its ftrace_int3_handler().

More specifically, starting to trace a live patched function caused a short
period in time where the live patching redirection became ineffective. In
particular, the guarantees from the consistency model couldn't be held up
in this situation.

Implement a testcase for verifying that a function's live patch replacement
is kept effective when enabling tracing on it.

Reuse the existing 'test_klp_livepatch' live patch module which patches
cmdline_proc_show(), the handler for /proc/cmdline.

Let the testcase in a loop
- apply this live patch,
- launch a background shell job enabling tracing on that function
- while continuously verifying that the contents of /proc/cmdline still
  match what would be expected when the live patch is applied.

Signed-off-by: Nicolai Stange <nstange at suse.de>
---
 tools/testing/selftests/livepatch/Makefile         |  3 +-
 .../livepatch/test-livepatch-vs-ftrace.sh          | 44 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/livepatch/test-livepatch-vs-ftrace.sh

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index af4aee79bebb..bfa5353f6d17 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -3,6 +3,7 @@
 TEST_GEN_PROGS := \
 	test-livepatch.sh \
 	test-callbacks.sh \
-	test-shadow-vars.sh
+	test-shadow-vars.sh \
+	test-livepatch-vs-ftrace.sh
 
 include ../lib.mk
diff --git a/tools/testing/selftests/livepatch/test-livepatch-vs-ftrace.sh b/tools/testing/selftests/livepatch/test-livepatch-vs-ftrace.sh
new file mode 100755
index 000000000000..5c982ec56373
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-livepatch-vs-ftrace.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2019 SUSE Linux GmbH
+
+. $(dirname $0)/functions.sh
+
+set -e
+
+MOD_LIVEPATCH=test_klp_livepatch
+
+# TEST: ftrace a live patched function
+# - load a livepatch that modifies the output from /proc/cmdline
+# - install a function tracer at the live patched function
+# - verify that the function is still patched by reading /proc/cmdline
+# - unload the livepatch and make sure the patch was removed
+
+echo -n "TEST: ftrace a live patched function ... "
+dmesg -C
+
+for i in $(seq 1 3); do
+	load_lp $MOD_LIVEPATCH
+
+	( echo cmdline_proc_show > /sys/kernel/debug/tracing/set_ftrace_filter;
+	  echo function > /sys/kernel/debug/tracing/current_tracer ) &
+
+	for j in $(seq 1 200); do
+		if [[ "$(cat /proc/cmdline)" !=				\
+			"$MOD_LIVEPATCH: this has been live patched" ]] ; then
+			echo -e "FAIL\n\n"
+			die "livepatch kselftest(s) failed"
+		fi
+	done
+
+	wait %1
+
+	echo nop > /sys/kernel/debug/tracing/current_tracer
+	echo > /sys/kernel/debug/tracing/set_ftrace_filter
+
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
+done
+
+echo "ok"
+exit 0
-- 
2.13.7
