From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 22 Feb 2018 16:45:01 +0900
Subject: [BUGFIX PATCH v2.1] tracing: probeevent: Fix to support minus offset
 from symbol
In-Reply-To: <20180221205341.3fd69b35@gandalf.local.home>
References: <20180221205341.3fd69b35@gandalf.local.home>
Message-ID: <151928550073.16058.5161938919130863384.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180222074501.nnurMEMKx7NX9ymL31XjAfigSDo99HuAGFwzQU73lnE@z>

In Documentation/trace/kprobetrace.txt, it says

 @SYM[+|-offs] : Fetch memory at SYM +|- offs (SYM should be a data symbol)

However, the parser doesn't parse minus offset correctly, since
commit 2fba0c8867af ("tracing/kprobes: Fix probe offset to be
unsigned") drops minus ("-") offset support for kprobe probe
address usage.

This fixes the traceprobe_split_symbol_offset() to parse minus
offset again with checking the offset range, and add a minus
offset check in kprobe probe address usage.

Fixes: 2fba0c8867af ("tracing/kprobes: Fix probe offset to be unsigned")
Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v2.1:
  - Fix to ensure the offset value is less than LONG_MAX.
  - Fail if the offset is minus when traceprobe_split_symbol_offset()
    is used for the probe address.
  - Add Fixes tag.
---
 kernel/trace/trace_kprobe.c |    4 ++--
 kernel/trace/trace_probe.c  |   15 ++++++++++-----
 kernel/trace/trace_probe.h  |    2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 5ce9b8cf7be3..b5b1d8aa47d6 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -667,7 +667,7 @@ static int create_trace_kprobe(int argc, char **argv)
 	char *symbol = NULL, *event = NULL, *group = NULL;
 	int maxactive = 0;
 	char *arg;
-	unsigned long offset = 0;
+	long offset = 0;
 	void *addr = NULL;
 	char buf[MAX_EVENT_NAME_LEN];
 
@@ -755,7 +755,7 @@ static int create_trace_kprobe(int argc, char **argv)
 		symbol = argv[1];
 		/* TODO: support .init module functions */
 		ret = traceprobe_split_symbol_offset(symbol, &offset);
-		if (ret) {
+		if (ret || offset < 0) {
 			pr_info("Failed to parse either an address or a symbol.\n");
 			return ret;
 		}
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index d59357308677..ec3856147fdd 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -320,21 +320,26 @@ static fetch_func_t get_fetch_size_function(const struct fetch_type *type,
 }
 
 /* Split symbol and offset. */
-int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset)
+int traceprobe_split_symbol_offset(char *symbol, long *offset)
 {
+	unsigned long ul;
 	char *tmp;
 	int ret;
 
 	if (!offset)
 		return -EINVAL;
 
-	tmp = strchr(symbol, '+');
+	tmp = strpbrk(symbol, "+-");
 	if (tmp) {
-		/* skip sign because kstrtoul doesn't accept '+' */
-		ret = kstrtoul(tmp + 1, 0, offset);
+		ret = kstrtoul(tmp + 1, 0, &ul);
 		if (ret)
 			return ret;
-
+		if (ul > LONG_MAX)
+			return -E2BIG;
+		if (*tmp == '-')
+			*offset = -ul;
+		else
+			*offset = ul;
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
