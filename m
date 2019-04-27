From: nstange at suse.de (Nicolai Stange)
Date: Sat, 27 Apr 2019 12:06:37 +0200
Subject: [PATCH 2/4] ftrace: drop 'static' qualifier from
 ftrace_ops_list_func()
In-Reply-To: <20190427100639.15074-1-nstange@suse.de>
References: <20190427100639.15074-1-nstange@suse.de>
Message-ID: <20190427100639.15074-3-nstange@suse.de>

With an upcoming patch improving x86' ftrace_int3_handler() not to simply
skip over the insn being updated, ftrace_ops_list_func() will have to get
referenced from arch/x86 code. Drop its 'static' qualifier.

Signed-off-by: Nicolai Stange <nstange at suse.de>
---
 kernel/trace/ftrace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index b920358dd8f7..ed3c20811d9a 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -125,8 +125,8 @@ ftrace_func_t ftrace_trace_function __read_mostly = ftrace_stub;
 struct ftrace_ops global_ops;
 
 #if ARCH_SUPPORTS_FTRACE_OPS
-static void ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
-				 struct ftrace_ops *op, struct pt_regs *regs);
+void ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
+			  struct ftrace_ops *op, struct pt_regs *regs);
 #else
 /* See comment below, where ftrace_ops_list_func is defined */
 static void ftrace_ops_no_ops(unsigned long ip, unsigned long parent_ip);
@@ -6302,8 +6302,8 @@ __ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
  * set the ARCH_SUPPORTS_FTRACE_OPS.
  */
 #if ARCH_SUPPORTS_FTRACE_OPS
-static void ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
-				 struct ftrace_ops *op, struct pt_regs *regs)
+void ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
+			  struct ftrace_ops *op, struct pt_regs *regs)
 {
 	__ftrace_ops_list_func(ip, parent_ip, NULL, regs);
 }
-- 
2.13.7
