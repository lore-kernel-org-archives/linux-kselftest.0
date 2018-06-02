From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Sat,  2 Jun 2018 08:44:08 -0400
Subject: [RFC PATCH for 4.18 16/16] rseq: selftests: Provide Makefile, scripts,
 gitignore (v2)
In-Reply-To: <20180602124408.8430-1-mathieu.desnoyers@efficios.com>
References: <20180602124408.8430-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180602124408.8430-17-mathieu.desnoyers@efficios.com>

A run_param_test.sh script runs many variants of the parametrizable
tests.

Wire up the rseq Makefile, add directory entry into MAINTAINERS file.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
CC: Shuah Khan <shuahkh at osg.samsung.com>
CC: Russell King <linux at arm.linux.org.uk>
CC: Catalin Marinas <catalin.marinas at arm.com>
CC: Will Deacon <will.deacon at arm.com>
CC: Thomas Gleixner <tglx at linutronix.de>
CC: Paul Turner <pjt at google.com>
CC: Andrew Hunter <ahh at google.com>
CC: Peter Zijlstra <peterz at infradead.org>
CC: Andy Lutomirski <luto at amacapital.net>
CC: Andi Kleen <andi at firstfloor.org>
CC: Dave Watson <davejwatson at fb.com>
CC: Chris Lameter <cl at linux.com>
CC: Ingo Molnar <mingo at redhat.com>
CC: "H. Peter Anvin" <hpa at zytor.com>
CC: Ben Maurer <bmaurer at fb.com>
CC: Steven Rostedt <rostedt at goodmis.org>
CC: "Paul E. McKenney" <paulmck at linux.vnet.ibm.com>
CC: Josh Triplett <josh at joshtriplett.org>
CC: Linus Torvalds <torvalds at linux-foundation.org>
CC: Andrew Morton <akpm at linux-foundation.org>
CC: Boqun Feng <boqun.feng at gmail.com>
CC: linux-kselftest at vger.kernel.org
CC: linux-api at vger.kernel.org
---
Changes since v1:
- Use only rseq, remove use of cpu_opv.
---
 MAINTAINERS                                    |   1 +
 tools/testing/selftests/Makefile               |   1 +
 tools/testing/selftests/rseq/.gitignore        |   6 ++
 tools/testing/selftests/rseq/Makefile          |  30 ++++++
 tools/testing/selftests/rseq/run_param_test.sh | 121 +++++++++++++++++++++++++
 5 files changed, 159 insertions(+)
 create mode 100644 tools/testing/selftests/rseq/.gitignore
 create mode 100644 tools/testing/selftests/rseq/Makefile
 create mode 100755 tools/testing/selftests/rseq/run_param_test.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index be42f5bfc0c9..720b57fac5db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11982,6 +11982,7 @@ S:	Supported
 F:	kernel/rseq.c
 F:	include/uapi/linux/rseq.h
 F:	include/trace/events/rseq.h
+F:	tools/testing/selftests/rseq/
 
 RFKILL
 M:	Johannes Berg <johannes at sipsolutions.net>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 32aafa92074c..593fb44c9cd4 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -28,6 +28,7 @@ TARGETS += powerpc
 TARGETS += proc
 TARGETS += pstore
 TARGETS += ptrace
+TARGETS += rseq
 TARGETS += seccomp
 TARGETS += sigaltstack
 TARGETS += size
diff --git a/tools/testing/selftests/rseq/.gitignore b/tools/testing/selftests/rseq/.gitignore
new file mode 100644
index 000000000000..cc610da7e369
--- /dev/null
+++ b/tools/testing/selftests/rseq/.gitignore
@@ -0,0 +1,6 @@
+basic_percpu_ops_test
+basic_test
+basic_rseq_op_test
+param_test
+param_test_benchmark
+param_test_compare_twice
diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
new file mode 100644
index 000000000000..c30c52e1d0d2
--- /dev/null
+++ b/tools/testing/selftests/rseq/Makefile
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0+ OR MIT
+CFLAGS += -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=./
+LDLIBS += -lpthread
+
+# Own dependencies because we only want to build against 1st prerequisite, but
+# still track changes to header files and depend on shared object.
+OVERRIDE_TARGETS = 1
+
+TEST_GEN_PROGS = basic_test basic_percpu_ops_test param_test \
+		param_test_benchmark param_test_compare_twice
+
+TEST_GEN_PROGS_EXTENDED = librseq.so
+
+TEST_PROGS = run_param_test.sh
+
+include ../lib.mk
+
+$(OUTPUT)/librseq.so: rseq.c rseq.h rseq-*.h
+	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
+
+$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
+
+$(OUTPUT)/param_test_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+					rseq.h rseq-*.h
+	$(CC) $(CFLAGS) -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
+
+$(OUTPUT)/param_test_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+					rseq.h rseq-*.h
+	$(CC) $(CFLAGS) -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
diff --git a/tools/testing/selftests/rseq/run_param_test.sh b/tools/testing/selftests/rseq/run_param_test.sh
new file mode 100755
index 000000000000..3acd6d75ff9f
--- /dev/null
+++ b/tools/testing/selftests/rseq/run_param_test.sh
@@ -0,0 +1,121 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0+ or MIT
+
+EXTRA_ARGS=${@}
+
+OLDIFS="$IFS"
+IFS=$'\n'
+TEST_LIST=(
+	"-T s"
+	"-T l"
+	"-T b"
+	"-T b -M"
+	"-T m"
+	"-T m -M"
+	"-T i"
+)
+
+TEST_NAME=(
+	"spinlock"
+	"list"
+	"buffer"
+	"buffer with barrier"
+	"memcpy"
+	"memcpy with barrier"
+	"increment"
+)
+IFS="$OLDIFS"
+
+REPS=1000
+SLOW_REPS=100
+
+function do_tests()
+{
+	local i=0
+	while [ "$i" -lt "${#TEST_LIST[@]}" ]; do
+		echo "Running test ${TEST_NAME[$i]}"
+		./param_test ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
+		echo "Running compare-twice test ${TEST_NAME[$i]}"
+		./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
+		let "i++"
+	done
+}
+
+echo "Default parameters"
+do_tests
+
+echo "Loop injection: 10000 loops"
+
+OLDIFS="$IFS"
+IFS=$'\n'
+INJECT_LIST=(
+	"1"
+	"2"
+	"3"
+	"4"
+	"5"
+	"6"
+	"7"
+	"8"
+	"9"
+)
+IFS="$OLDIFS"
+
+NR_LOOPS=10000
+
+i=0
+while [ "$i" -lt "${#INJECT_LIST[@]}" ]; do
+	echo "Injecting at <${INJECT_LIST[$i]}>"
+	do_tests -${INJECT_LIST[i]} ${NR_LOOPS}
+	let "i++"
+done
+NR_LOOPS=
+
+function inject_blocking()
+{
+	OLDIFS="$IFS"
+	IFS=$'\n'
+	INJECT_LIST=(
+		"7"
+		"8"
+		"9"
+	)
+	IFS="$OLDIFS"
+
+	NR_LOOPS=-1
+
+	i=0
+	while [ "$i" -lt "${#INJECT_LIST[@]}" ]; do
+		echo "Injecting at <${INJECT_LIST[$i]}>"
+		do_tests -${INJECT_LIST[i]} -1 ${@}
+		let "i++"
+	done
+	NR_LOOPS=
+}
+
+echo "Yield injection (25%)"
+inject_blocking -m 4 -y
+
+echo "Yield injection (50%)"
+inject_blocking -m 2 -y
+
+echo "Yield injection (100%)"
+inject_blocking -m 1 -y
+
+echo "Kill injection (25%)"
+inject_blocking -m 4 -k
+
+echo "Kill injection (50%)"
+inject_blocking -m 2 -k
+
+echo "Kill injection (100%)"
+inject_blocking -m 1 -k
+
+echo "Sleep injection (1ms, 25%)"
+inject_blocking -m 4 -s 1
+
+echo "Sleep injection (1ms, 50%)"
+inject_blocking -m 2 -s 1
+
+echo "Sleep injection (1ms, 100%)"
+inject_blocking -m 1 -s 1
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
