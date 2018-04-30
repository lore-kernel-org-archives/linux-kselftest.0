From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Mon, 30 Apr 2018 18:44:28 -0400
Subject: [PATCH 09/14] selftests: lib.mk: Introduce OVERRIDE_TARGETS
In-Reply-To: <20180430224433.17407-1-mathieu.desnoyers@efficios.com>
References: <20180430224433.17407-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180430224433.17407-10-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180430224428.A1xxb8Cft4yJhfC2f9b0E30sz6j18PbERMB_yXgV9xs@z>

Introduce OVERRIDE_TARGETS to allow tests to express dependencies on
header files and .so, which require to override the selftests lib.mk
targets.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
Acked-by: Shuah Khan <shuahkh at osg.samsung.com>
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
 tools/testing/selftests/lib.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 195e9d4739a9..9fd57efae439 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -106,6 +106,9 @@ COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
 LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
 endif
 
+# Selftest makefiles can override those targets by setting
+# OVERRIDE_TARGETS = 1.
+ifeq ($(OVERRIDE_TARGETS),)
 $(OUTPUT)/%:%.c
 	$(LINK.c) $^ $(LDLIBS) -o $@
 
@@ -114,5 +117,6 @@ $(OUTPUT)/%.o:%.S
 
 $(OUTPUT)/%:%.S
 	$(LINK.S) $^ $(LDLIBS) -o $@
+endif
 
 .PHONY: run_tests all clean install emit_tests
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
