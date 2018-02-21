From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 22 Feb 2018 00:00:31 +0900
Subject: [PATCH v2 13/17] tracing: probeevent: Add $argN for accessing
 function args
In-Reply-To: <151922484560.6217.1143686155616343906.stgit@devbox>
References: <151922484560.6217.1143686155616343906.stgit@devbox>
Message-ID: <151922523111.6217.7322527088489438614.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221150031.hdG8FGbXTFlHaatLgupVuAsVBaByvUmY8H6Rjaj70As@z>

Add $argN special fetch variable for accessing function
arguments. This allows user to trace the Nth argument easily
at the function entry.

Note that this returns most probably assignment of registers
and stacks. In some case, it may not work well. If you need
to access correct registers or stacks you should use perf-probe.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v2:
  - Add $argN in README file
  - Make N start from 1 as same as auto-generate event argument
    names.
---
 Documentation/trace/kprobetrace.txt |   10 ++++++----
 kernel/trace/trace.c                |    2 +-
 kernel/trace/trace_kprobe.c         |   18 +++++++++++++-----
 kernel/trace/trace_probe.c          |   36 ++++++++++++++++++++++-------------
 kernel/trace/trace_probe.h          |    9 ++++++++-
 kernel/trace/trace_uprobe.c         |    2 +-
 6 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/Documentation/trace/kprobetrace.txt b/Documentation/trace/kprobetrace.txt
index d49381f2e411..1d082f8ffeee 100644
--- a/Documentation/trace/kprobetrace.txt
+++ b/Documentation/trace/kprobetrace.txt
@@ -43,16 +43,18 @@ Synopsis of kprobe_events
   @SYM[+|-offs]	: Fetch memory at SYM +|- offs (SYM should be a data symbol)
   $stackN	: Fetch Nth entry of stack (N >= 0)
   $stack	: Fetch stack address.
-  $retval	: Fetch return value.(*)
+  $argN		: Fetch the Nth function argument. (N >= 1) (*1)
+  $retval	: Fetch return value.(*2)
   $comm		: Fetch current task comm.
-  +|-offs(FETCHARG) : Fetch memory at FETCHARG +|- offs address.(**)
+  +|-offs(FETCHARG) : Fetch memory at FETCHARG +|- offs address.(*3)
   NAME=FETCHARG : Set NAME as the argument name of FETCHARG.
   FETCHARG:TYPE : Set TYPE as the type of FETCHARG. Currently, basic types
 		  (u8/u16/u32/u64/s8/s16/s32/s64), hexadecimal types
 		  (x8/x16/x32/x64), "string" and bitfield are supported.
 
-  (*) only for return probe.
-  (**) this is useful for fetching a field of data structures.
+  (*1) only for the probe on function entry (offs == 0).
+  (*2) only for return probe.
+  (*3) this is useful for fetching a field of data structures.
 
 Types
 -----
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8f08811d15b8..94423529b986 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4608,7 +4608,7 @@ static const char readme_msg[] =
 #endif
 	"\t     args: <name>=fetcharg[:type]\n"
 	"\t fetcharg: %<register>, @<address>, @<symbol>[+|-<offset>],\n"
-	"\t           $stack<index>, $stack, $retval, $comm\n"
+	"\t           $stack<index>, $stack, $retval, $comm, $arg<N>\n"
 	"\t     type: s8/16/32/64, u8/16/32/64, x8/16/32/64, string, symbol,\n"
 	"\t           b<bit-width>@<bit-offset>/<container-size>\n"
 #endif
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 5025907e0c99..df39c7d5dd4c 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -490,13 +490,15 @@ static int create_trace_kprobe(int argc, char **argv)
 	unsigned long offset = 0;
 	void *addr = NULL;
 	char buf[MAX_EVENT_NAME_LEN];
+	unsigned int flags = TPARG_FL_KERNEL;
 
 	/* argc must be >= 1 */
 	if (argv[0][0] == 'p')
 		is_return = false;
-	else if (argv[0][0] == 'r')
+	else if (argv[0][0] == 'r') {
 		is_return = true;
-	else if (argv[0][0] == '-')
+		flags |= TPARG_FL_RETURN;
+	} else if (argv[0][0] == '-')
 		is_delete = true;
 	else {
 		pr_info("Probe definition must be started with 'p', 'r' or"
@@ -579,8 +581,9 @@ static int create_trace_kprobe(int argc, char **argv)
 			pr_info("Failed to parse either an address or a symbol.\n");
 			return ret;
 		}
-		if (offset && is_return &&
-		    !kprobe_on_func_entry(NULL, symbol, offset)) {
+		if (kprobe_on_func_entry(NULL, symbol, offset))
+			flags |= TPARG_FL_FENTRY;
+		if (offset && is_return && !(flags & TPARG_FL_FENTRY)) {
 			pr_info("Given offset is not valid for return probe.\n");
 			return -EINVAL;
 		}
@@ -650,7 +653,7 @@ static int create_trace_kprobe(int argc, char **argv)
 
 		/* Parse fetch argument */
 		ret = traceprobe_parse_probe_arg(arg, &tk->tp.size, parg,
-						 is_return, true);
+						 flags);
 		if (ret) {
 			pr_info("Parse error at argument[%d]. (%d)\n", i, ret);
 			goto error;
@@ -890,6 +893,11 @@ process_fetch_insn(struct fetch_insn *code, struct pt_regs *regs, void *dest,
 	case FETCH_OP_COMM:
 		val = (unsigned long)current->comm;
 		break;
+#ifdef CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
+	case FETCH_OP_ARG:
+		val = regs_get_kernel_argument(regs, code->param);
+		break;
+#endif
 	default:
 		return -EILSEQ;
 	}
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index f41a2989130c..f4b83927d6c0 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -171,14 +171,13 @@ int traceprobe_split_symbol_offset(char *symbol, long *offset)
 #define PARAM_MAX_STACK (THREAD_SIZE / sizeof(unsigned long))
 
 static int parse_probe_vars(char *arg, const struct fetch_type *t,
-			    struct fetch_insn *code, bool is_return,
-			    bool is_kprobe)
+			    struct fetch_insn *code, unsigned int flags)
 {
 	int ret = 0;
 	unsigned long param;
 
 	if (strcmp(arg, "retval") == 0) {
-		if (is_return)
+		if (flags & TPARG_FL_RETURN)
 			code->op = FETCH_OP_RETVAL;
 		else
 			ret = -EINVAL;
@@ -187,7 +186,8 @@ static int parse_probe_vars(char *arg, const struct fetch_type *t,
 			code->op = FETCH_OP_STACKP;
 		} else if (isdigit(arg[5])) {
 			ret = kstrtoul(arg + 5, 10, &param);
-			if (ret || (is_kprobe && param > PARAM_MAX_STACK))
+			if (ret || ((flags & TPARG_FL_KERNEL) &&
+				    param > PARAM_MAX_STACK))
 				ret = -EINVAL;
 			else {
 				code->op = FETCH_OP_STACK;
@@ -197,6 +197,18 @@ static int parse_probe_vars(char *arg, const struct fetch_type *t,
 			ret = -EINVAL;
 	} else if (strcmp(arg, "comm") == 0) {
 		code->op = FETCH_OP_COMM;
+#ifdef CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
+	} else if (((flags & TPARG_FL_MASK) ==
+		    (TPARG_FL_KERNEL | TPARG_FL_FENTRY)) &&
+		   strncmp(arg, "arg", 3) == 0) {
+		if (!isdigit(arg[3]))
+			return -EINVAL;
+		ret = kstrtoul(arg + 3, 10, &param);
+		if (ret || !param || param > PARAM_MAX_STACK)
+			return -EINVAL;
+		code->op = FETCH_OP_ARG;
+		code->param = (unsigned int)param - 1;
+#endif
 	} else
 		ret = -EINVAL;
 
@@ -207,7 +219,7 @@ static int parse_probe_vars(char *arg, const struct fetch_type *t,
 static int
 parse_probe_arg(char *arg, const struct fetch_type *type,
 		struct fetch_insn **pcode, struct fetch_insn *end,
-		bool is_return, bool is_kprobe)
+		unsigned int flags)
 {
 	struct fetch_insn *code = *pcode;
 	unsigned long param;
@@ -217,8 +229,7 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 
 	switch (arg[0]) {
 	case '$':
-		ret = parse_probe_vars(arg + 1, type, code,
-					is_return, is_kprobe);
+		ret = parse_probe_vars(arg + 1, type, code, flags);
 		break;
 
 	case '%':	/* named register */
@@ -240,7 +251,7 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 			code->immediate = param;
 		} else if (arg[1] == '+') {
 			/* kprobes don't support file offsets */
-			if (is_kprobe)
+			if (flags & TPARG_FL_KERNEL)
 				return -EINVAL;
 
 			ret = kstrtol(arg + 2, 0, &offset);
@@ -251,7 +262,7 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 			code->immediate = (unsigned long)offset;  // imm64?
 		} else {
 			/* uprobes don't support symbols */
-			if (!is_kprobe)
+			if (!(flags & TPARG_FL_KERNEL))
 				return -EINVAL;
 
 			ret = traceprobe_split_symbol_offset(arg + 1, &offset);
@@ -292,8 +303,7 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 			const struct fetch_type *t2 = find_fetch_type(NULL);
 
 			*tmp = '\0';
-			ret = parse_probe_arg(arg, t2, &code, end, is_return,
-					      is_kprobe);
+			ret = parse_probe_arg(arg, t2, &code, end, flags);
 			if (ret)
 				break;
 			if (code->op == FETCH_OP_COMM)
@@ -353,7 +363,7 @@ static int __parse_bitfield_probe_arg(const char *bf,
 
 /* String length checking wrapper */
 int traceprobe_parse_probe_arg(char *arg, ssize_t *size,
-		struct probe_arg *parg, bool is_return, bool is_kprobe)
+		struct probe_arg *parg, unsigned int flags)
 {
 	struct fetch_insn *code, *tmp = NULL;
 	const char *t;
@@ -393,7 +403,7 @@ int traceprobe_parse_probe_arg(char *arg, ssize_t *size,
 	code[FETCH_INSN_MAX - 1].op = FETCH_OP_END;
 
 	ret = parse_probe_arg(arg, parg->type, &code, &code[FETCH_INSN_MAX - 1],
-			      is_return, is_kprobe);
+			      flags);
 	if (ret)
 		goto fail;
 
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index ef477bd8468a..ff91faf70887 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -35,6 +35,7 @@
 #include <linux/stringify.h>
 #include <linux/limits.h>
 #include <linux/uaccess.h>
+#include <linux/bitops.h>
 #include <asm/bitsperlong.h>
 
 #include "trace.h"
@@ -89,6 +90,7 @@ enum fetch_op {
 	FETCH_OP_RETVAL,	/* Return value */
 	FETCH_OP_IMM,		/* Immediate : .immediate */
 	FETCH_OP_COMM,		/* Current comm */
+	FETCH_OP_ARG,		/* Function argument : .param */
 	FETCH_OP_FOFFS,		/* File offset: .immediate */
 	// Stage 2 (dereference) op
 	FETCH_OP_DEREF,		/* Dereference: .offset */
@@ -261,8 +263,13 @@ find_event_file_link(struct trace_probe *tp, struct trace_event_file *file)
 	return NULL;
 }
 
+#define TPARG_FL_RETURN BIT(0)
+#define TPARG_FL_KERNEL BIT(1)
+#define TPARG_FL_FENTRY BIT(2)
+#define TPARG_FL_MASK	GENMASK(2, 0)
+
 extern int traceprobe_parse_probe_arg(char *arg, ssize_t *size,
-		   struct probe_arg *parg, bool is_return, bool is_kprobe);
+		   struct probe_arg *parg, unsigned int flags);
 
 extern int traceprobe_conflict_field_name(const char *name,
 			       struct probe_arg *args, int narg);
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 64c1fbe087a1..e15da2281855 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -519,7 +519,7 @@ static int create_trace_uprobe(int argc, char **argv)
 
 		/* Parse fetch argument */
 		ret = traceprobe_parse_probe_arg(arg, &tu->tp.size, parg,
-						 is_return, false);
+					is_return ? TPARG_FL_RETURN : 0);
 		if (ret) {
 			pr_info("Parse error at argument[%d]. (%d)\n", i, ret);
 			goto error;

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
