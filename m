From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:29:39 +0900
Subject: [PATCH v2 01/32] tracing: Allow gcov profiling on only ftrace
 subsystem
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443697980.23257.9233992547183322108.stgit@devbox>

Add GCOV_PROFILE_FTRACE to allow gcov profiling
on only files in ftrace subsystem. This kconfig
flag will be used for checking kselftest/ftrace
coverage.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 kernel/trace/Kconfig  |   13 +++++++++++++
 kernel/trace/Makefile |    5 +++++
 2 files changed, 18 insertions(+)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index fd6754b88f87..8decf6d8553a 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -774,6 +774,19 @@ config TRACING_EVENTS_GPIO
 	help
 	  Enable tracing events for gpio subsystem
 
+config GCOV_PROFILE_FTRACE
+	bool "Enable GCOV profiling on ftrace subsystem"
+	depends on GCOV_KERNEL
+	help
+	  Enable GCOV profiling on ftrace subsystem for checking
+	  which functions/lines are tested.
+
+	  If unsure, say N.
+
+	  Note that on a kernel compiled with this flags, ftrace will be
+	  significantly run slower. So do not enable it for production
+	  kernel.
+
 endif # FTRACE
 
 endif # TRACING_SUPPORT
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 98d53b39a8ee..f81dadbc7c4a 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -23,6 +23,11 @@ ifdef CONFIG_TRACING_BRANCHES
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 endif
 
+# for GCOV coverage profiling
+ifdef CONFIG_GCOV_PROFILE_FTRACE
+GCOV_PROFILE := y
+endif
+
 CFLAGS_trace_benchmark.o := -I$(src)
 CFLAGS_trace_events_filter.o := -I$(src)
 
