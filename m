From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Sat, 17 Mar 2018 21:45:36 +0900
Subject: [PATCH v6 11/21] tracing: probeevent: Append traceprobe_ for exported
 function
In-Reply-To: <152129024033.31874.15800253385376959274.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
Message-ID: <152129073583.31874.13915599325476298821.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180317124536.cQptHdI_vv-cwDLaFSP5V1s9x-brPr2_rPTFsp2esWk@z>

Append traceprobe_ for exported function set_print_fmt() as
same as other functions.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 kernel/trace/trace_kprobe.c |    4 ++--
 kernel/trace/trace_probe.c  |    2 +-
 kernel/trace/trace_probe.h  |    2 +-
 kernel/trace/trace_uprobe.c |    4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 927299ff191c..7d48ae5f0617 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -1305,7 +1305,7 @@ static int register_kprobe_event(struct trace_kprobe *tk)
 
 	init_trace_event_call(tk, call);
 
-	if (set_print_fmt(&tk->tp, trace_kprobe_is_return(tk)) < 0)
+	if (traceprobe_set_print_fmt(&tk->tp, trace_kprobe_is_return(tk)) < 0)
 		return -ENOMEM;
 	ret = register_trace_event(&call->event);
 	if (!ret) {
@@ -1362,7 +1362,7 @@ create_local_trace_kprobe(char *func, void *addr, unsigned long offs,
 
 	init_trace_event_call(tk, &tk->tp.call);
 
-	if (set_print_fmt(&tk->tp, trace_kprobe_is_return(tk)) < 0) {
+	if (traceprobe_set_print_fmt(&tk->tp, trace_kprobe_is_return(tk)) < 0) {
 		ret = -ENOMEM;
 		goto error;
 	}
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index ed3766fb290d..fff3ccfcdbb6 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -502,7 +502,7 @@ static int __set_print_fmt(struct trace_probe *tp, char *buf, int len,
 	return pos;
 }
 
-int set_print_fmt(struct trace_probe *tp, bool is_return)
+int traceprobe_set_print_fmt(struct trace_probe *tp, bool is_return)
 {
 	int len;
 	char *print_fmt;
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index d1b8bd74bf56..3bc43c1ce628 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -266,7 +266,7 @@ extern void traceprobe_free_probe_arg(struct probe_arg *arg);
 
 extern int traceprobe_split_symbol_offset(char *symbol, long *offset);
 
-extern int set_print_fmt(struct trace_probe *tp, bool is_return);
+extern int traceprobe_set_print_fmt(struct trace_probe *tp, bool is_return);
 
 #ifdef CONFIG_PERF_EVENTS
 extern struct trace_event_call *
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index de4f91bb313a..fafd48310823 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -1314,7 +1314,7 @@ static int register_uprobe_event(struct trace_uprobe *tu)
 
 	init_trace_event_call(tu, call);
 
-	if (set_print_fmt(&tu->tp, is_ret_probe(tu)) < 0)
+	if (traceprobe_set_print_fmt(&tu->tp, is_ret_probe(tu)) < 0)
 		return -ENOMEM;
 
 	ret = register_trace_event(&call->event);
@@ -1388,7 +1388,7 @@ create_local_trace_uprobe(char *name, unsigned long offs, bool is_return)
 	tu->filename = kstrdup(name, GFP_KERNEL);
 	init_trace_event_call(tu, &tu->tp.call);
 
-	if (set_print_fmt(&tu->tp, is_ret_probe(tu)) < 0) {
+	if (traceprobe_set_print_fmt(&tu->tp, is_ret_probe(tu)) < 0) {
 		ret = -ENOMEM;
 		goto error;
 	}

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
