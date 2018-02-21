From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Wed, 21 Feb 2018 23:54:37 +0900
Subject: [PATCH v2 01/17] tracing: probeevent: Fix to support minus offset
 from symbol
In-Reply-To: <151922484560.6217.1143686155616343906.stgit@devbox>
References: <151922484560.6217.1143686155616343906.stgit@devbox>
Message-ID: <151922487738.6217.16114601174401123273.stgit@devbox>

In Documentation/trace/kprobetrace.txt, it says

 @SYM[+|-offs] : Fetch memory at SYM +|- offs (SYM should be a data symbol)

However, the parser doesn't parse minus offset correctly.
This fixes the parser to get minus offset correctly.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 kernel/trace/trace_kprobe.c |    2 +-
 kernel/trace/trace_probe.c  |   10 +++++-----
 kernel/trace/trace_probe.h  |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 5ce9b8cf7be3..dab4a5b54269 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -754,7 +754,7 @@ static int create_trace_kprobe(int argc, char **argv)
 		/* a symbol specified */
 		symbol = argv[1];
 		/* TODO: support .init module functions */
-		ret = traceprobe_split_symbol_offset(symbol, &offset);
+		ret = traceprobe_split_symbol_offset(symbol, (long *)&offset);
 		if (ret) {
 			pr_info("Failed to parse either an address or a symbol.\n");
 			return ret;
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index d59357308677..3e291a754862 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -320,7 +320,7 @@ static fetch_func_t get_fetch_size_function(const struct fetch_type *type,
 }
 
 /* Split symbol and offset. */
-int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset)
+int traceprobe_split_symbol_offset(char *symbol, long *offset)
 {
 	char *tmp;
 	int ret;
@@ -328,13 +328,13 @@ int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset)
 	if (!offset)
 		return -EINVAL;
 
-	tmp = strchr(symbol, '+');
+	tmp = strpbrk(symbol, "+-");
 	if (tmp) {
-		/* skip sign because kstrtoul doesn't accept '+' */
-		ret = kstrtoul(tmp + 1, 0, offset);
+		ret = kstrtoul(tmp + 1, 0, (unsigned long *)offset);
 		if (ret)
 			return ret;
-
+		if (*tmp == '-')
+			*offset = -(*offset);
 		*tmp = '\0';
 	} else
 		*offset = 0;
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index 0745f895f780..75daff22ccea 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -365,7 +365,7 @@ extern int traceprobe_conflict_field_name(const char *name,
 extern void traceprobe_update_arg(struct probe_arg *arg);
 extern void traceprobe_free_probe_arg(struct probe_arg *arg);
 
-extern int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset);
+extern int traceprobe_split_symbol_offset(char *symbol, long *offset);
 
 /* Sum up total data length for dynamic arraies (strings) */
 static nokprobe_inline int

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
