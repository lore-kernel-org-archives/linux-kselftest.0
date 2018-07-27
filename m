From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:10:25 +0900
Subject: [PATCH 01/25] tracing: Allow gcov profiling on only ftrace subsystem
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269342571.3084.3307543750811437921.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121025.SlmQrLjjP0RhtrAOSdxCzrgdemLeeeWagfCNX68uPlM@z>

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
index a47f77d27673..a628e8cbc1ef 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -722,6 +722,19 @@ config TRACING_EVENTS_GPIO
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
index e2538c7638d4..443d53392f61 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -18,6 +18,11 @@ ifdef CONFIG_TRACING_BRANCHES
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 endif
 
+# for GCOV coverage profiling
+ifdef CONFIG_GCOV_PROFILE_FTRACE
+GCOV_PROFILE := y
+endif
+
 CFLAGS_trace_benchmark.o := -I$(src)
 CFLAGS_trace_events_filter.o := -I$(src)
 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
