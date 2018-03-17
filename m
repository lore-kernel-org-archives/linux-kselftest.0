From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Sat, 17 Mar 2018 21:41:55 +0900
Subject: [PATCH v6 06/21] tracing: probeevent: Cleanup argument field
 definition
In-Reply-To: <152129024033.31874.15800253385376959274.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
Message-ID: <152129051562.31874.14164494878447631336.stgit@devbox>

Cleanup event argument definition code in one place for
maintenancability.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 kernel/trace/trace_kprobe.c |   32 ++++----------------------------
 kernel/trace/trace_probe.c  |   21 +++++++++++++++++++++
 kernel/trace/trace_probe.h  |    2 ++
 kernel/trace/trace_uprobe.c |   15 ++-------------
 4 files changed, 29 insertions(+), 41 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 81e2eb5a1566..a8f8cce066a9 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -1146,49 +1146,25 @@ print_kretprobe_event(struct trace_iterator *iter, int flags,
 
 static int kprobe_event_define_fields(struct trace_event_call *event_call)
 {
-	int ret, i;
+	int ret;
 	struct kprobe_trace_entry_head field;
 	struct trace_kprobe *tk = (struct trace_kprobe *)event_call->data;
 
 	DEFINE_FIELD(unsigned long, ip, FIELD_STRING_IP, 0);
-	/* Set argument names as fields */
-	for (i = 0; i < tk->tp.nr_args; i++) {
-		struct probe_arg *parg = &tk->tp.args[i];
 
-		ret = trace_define_field(event_call, parg->type->fmttype,
-					 parg->name,
-					 sizeof(field) + parg->offset,
-					 parg->type->size,
-					 parg->type->is_signed,
-					 FILTER_OTHER);
-		if (ret)
-			return ret;
-	}
-	return 0;
+	return traceprobe_define_arg_fields(event_call, sizeof(field), &tk->tp);
 }
 
 static int kretprobe_event_define_fields(struct trace_event_call *event_call)
 {
-	int ret, i;
+	int ret;
 	struct kretprobe_trace_entry_head field;
 	struct trace_kprobe *tk = (struct trace_kprobe *)event_call->data;
 
 	DEFINE_FIELD(unsigned long, func, FIELD_STRING_FUNC, 0);
 	DEFINE_FIELD(unsigned long, ret_ip, FIELD_STRING_RETIP, 0);
-	/* Set argument names as fields */
-	for (i = 0; i < tk->tp.nr_args; i++) {
-		struct probe_arg *parg = &tk->tp.args[i];
 
-		ret = trace_define_field(event_call, parg->type->fmttype,
-					 parg->name,
-					 sizeof(field) + parg->offset,
-					 parg->type->size,
-					 parg->type->is_signed,
-					 FILTER_OTHER);
-		if (ret)
-			return ret;
-	}
-	return 0;
+	return traceprobe_define_arg_fields(event_call, sizeof(field), &tk->tp);
 }
 
 #ifdef CONFIG_PERF_EVENTS
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index 8894b81e29b0..049e8531fdf8 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -680,3 +680,24 @@ int set_print_fmt(struct trace_probe *tp, bool is_return)
 
 	return 0;
 }
+
+int traceprobe_define_arg_fields(struct trace_event_call *event_call,
+				 size_t offset, struct trace_probe *tp)
+{
+	int ret, i;
+
+	/* Set argument names as fields */
+	for (i = 0; i < tp->nr_args; i++) {
+		struct probe_arg *parg = &tp->args[i];
+
+		ret = trace_define_field(event_call, parg->type->fmttype,
+					 parg->name,
+					 offset + parg->offset,
+					 parg->type->size,
+					 parg->type->is_signed,
+					 FILTER_OTHER);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index 0c8e66f9c855..de928052926b 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -440,3 +440,5 @@ extern struct trace_event_call *
 create_local_trace_uprobe(char *name, unsigned long offs, bool is_return);
 extern void destroy_local_trace_uprobe(struct trace_event_call *event_call);
 #endif
+extern int traceprobe_define_arg_fields(struct trace_event_call *event_call,
+					size_t offset, struct trace_probe *tp);
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 4c006a693663..887da2bb63aa 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -982,7 +982,7 @@ probe_event_disable(struct trace_uprobe *tu, struct trace_event_file *file)
 
 static int uprobe_event_define_fields(struct trace_event_call *event_call)
 {
-	int ret, i, size;
+	int ret, size;
 	struct uprobe_trace_entry_head field;
 	struct trace_uprobe *tu = event_call->data;
 
@@ -994,19 +994,8 @@ static int uprobe_event_define_fields(struct trace_event_call *event_call)
 		DEFINE_FIELD(unsigned long, vaddr[0], FIELD_STRING_IP, 0);
 		size = SIZEOF_TRACE_ENTRY(false);
 	}
-	/* Set argument names as fields */
-	for (i = 0; i < tu->tp.nr_args; i++) {
-		struct probe_arg *parg = &tu->tp.args[i];
-
-		ret = trace_define_field(event_call, parg->type->fmttype,
-					 parg->name, size + parg->offset,
-					 parg->type->size, parg->type->is_signed,
-					 FILTER_OTHER);
 
-		if (ret)
-			return ret;
-	}
-	return 0;
+	return traceprobe_define_arg_fields(event_call, size, &tu->tp);
 }
 
 #ifdef CONFIG_PERF_EVENTS

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
