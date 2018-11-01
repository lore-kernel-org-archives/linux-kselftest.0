From: cyphar at cyphar.com (Aleksa Sarai)
Date: Thu,  1 Nov 2018 19:35:51 +1100
Subject: [PATCH v3 2/2] trace: remove kretprobed checks
In-Reply-To: <20181101083551.3805-1-cyphar@cyphar.com>
References: <20181101083551.3805-1-cyphar@cyphar.com>
Message-ID: <20181101083551.3805-3-cyphar@cyphar.com>

This is effectively a reversion of commit 76094a2cf46e ("ftrace:
distinguish kretprobe'd functions in trace logs"), as the checking of
kretprobe_trampoline *for tracing* is no longer necessary with the new
kretprobe stack trace changes.

Signed-off-by: Aleksa Sarai <cyphar at cyphar.com>
---
 kernel/trace/trace_output.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 6e6cc64faa38..951de16bd4fd 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -321,36 +321,14 @@ int trace_output_call(struct trace_iterator *iter, char *name, char *fmt, ...)
 }
 EXPORT_SYMBOL_GPL(trace_output_call);
 
-#ifdef CONFIG_KRETPROBES
-static inline const char *kretprobed(const char *name)
-{
-	static const char tramp_name[] = "kretprobe_trampoline";
-	int size = sizeof(tramp_name);
-
-	if (strncmp(tramp_name, name, size) == 0)
-		return "[unknown/kretprobe'd]";
-	return name;
-}
-#else
-static inline const char *kretprobed(const char *name)
-{
-	return name;
-}
-#endif /* CONFIG_KRETPROBES */
-
 static void
 seq_print_sym_short(struct trace_seq *s, const char *fmt, unsigned long address)
 {
 	char str[KSYM_SYMBOL_LEN];
 #ifdef CONFIG_KALLSYMS
-	const char *name;
-
 	kallsyms_lookup(address, NULL, NULL, NULL, str);
-
-	name = kretprobed(str);
-
-	if (name && strlen(name)) {
-		trace_seq_printf(s, fmt, name);
+	if (strlen(str)) {
+		trace_seq_printf(s, fmt, str);
 		return;
 	}
 #endif
@@ -364,13 +342,9 @@ seq_print_sym_offset(struct trace_seq *s, const char *fmt,
 {
 	char str[KSYM_SYMBOL_LEN];
 #ifdef CONFIG_KALLSYMS
-	const char *name;
-
 	sprint_symbol(str, address);
-	name = kretprobed(str);
-
-	if (name && strlen(name)) {
-		trace_seq_printf(s, fmt, name);
+	if (strlen(str)) {
+		trace_seq_printf(s, fmt, str);
 		return;
 	}
 #endif
-- 
2.19.1
