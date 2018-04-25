From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Wed, 25 Apr 2018 21:19:59 +0900
Subject: [PATCH v7 08/16] tracing: probeevent: Unify fetch_insn processing
 common part
In-Reply-To: <152465856498.26224.16969986455942749517.stgit@devbox>
References: <152465856498.26224.16969986455942749517.stgit@devbox>
Message-ID: <152465879965.26224.8547240824606804815.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180425121959.WeHzDKwuEXycUZtvyiYzg8uXVO3aTfvS13trJWCbi6g@z>

Unify the fetch_insn bottom process (from stage 2: dereference
indirect data) from kprobe and uprobe events, since those are
mostly same.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 kernel/trace/trace_kprobe.c     |   47 +++++----------------------------
 kernel/trace/trace_probe_tmpl.h |   55 ++++++++++++++++++++++++++++++++++++++-
 kernel/trace/trace_uprobe.c     |   43 +-----------------------------
 3 files changed, 63 insertions(+), 82 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 4102020411c8..673d4b06edd4 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -853,13 +853,18 @@ fetch_store_string(unsigned long addr, void *dest, void *base)
 	return ret;
 }
 
+static nokprobe_inline int
+probe_mem_read(void *dest, void *src, size_t size)
+{
+	return probe_kernel_read(dest, src, size);
+}
+
 /* Note that we don't verify it, since the code does not come from user space */
 static int
 process_fetch_insn(struct fetch_insn *code, struct pt_regs *regs, void *dest,
 		   void *base)
 {
 	unsigned long val;
-	int ret = 0;
 
 	/* 1st stage: get value from context */
 	switch (code->op) {
@@ -886,45 +891,7 @@ process_fetch_insn(struct fetch_insn *code, struct pt_regs *regs, void *dest,
 	}
 	code++;
 
-	/* 2nd stage: dereference memory if needed */
-	while (code->op == FETCH_OP_DEREF) {
-		ret = probe_kernel_read(&val, (void *)val + code->offset,
-					sizeof(val));
-		if (ret)
-			return ret;
-		code++;
-	}
-
-	/* 3rd stage: store value to buffer */
-	if (unlikely(!dest)) {
-		if (code->op == FETCH_OP_ST_STRING)
-			return fetch_store_strlen(val + code->offset);
-		else
-			return -EILSEQ;
-	}
-
-	switch (code->op) {
-	case FETCH_OP_ST_RAW:
-		fetch_store_raw(val, code, dest);
-		break;
-	case FETCH_OP_ST_MEM:
-		probe_kernel_read(dest, (void *)val + code->offset, code->size);
-		break;
-	case FETCH_OP_ST_STRING:
-		ret = fetch_store_string(val + code->offset, dest, base);
-		break;
-	default:
-		return -EILSEQ;
-	}
-	code++;
-
-	/* 4th stage: modify stored value if needed */
-	if (code->op == FETCH_OP_MOD_BF) {
-		fetch_apply_bitfield(code, dest);
-		code++;
-	}
-
-	return code->op == FETCH_OP_END ? ret : -EILSEQ;
+	return process_fetch_insn_bottom(code, val, dest, base);
 }
 NOKPROBE_SYMBOL(process_fetch_insn)
 
diff --git a/kernel/trace/trace_probe_tmpl.h b/kernel/trace/trace_probe_tmpl.h
index 3b4aba6f84cc..b4075f3e3a29 100644
--- a/kernel/trace/trace_probe_tmpl.h
+++ b/kernel/trace/trace_probe_tmpl.h
@@ -49,13 +49,66 @@ fetch_apply_bitfield(struct fetch_insn *code, void *buf)
 }
 
 /*
- * This must be defined for each callsite.
+ * These functions must be defined for each callsite.
  * Return consumed dynamic data size (>= 0), or error (< 0).
  * If dest is NULL, don't store result and return required dynamic data size.
  */
 static int
 process_fetch_insn(struct fetch_insn *code, struct pt_regs *regs,
 		   void *dest, void *base);
+static nokprobe_inline int fetch_store_strlen(unsigned long addr);
+static nokprobe_inline int
+fetch_store_string(unsigned long addr, void *dest, void *base);
+static nokprobe_inline int
+probe_mem_read(void *dest, void *src, size_t size);
+
+/* From the 2nd stage, routine is same */
+static nokprobe_inline int
+process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
+			   void *dest, void *base)
+{
+	int ret = 0;
+
+	/* 2nd stage: dereference memory if needed */
+	while (code->op == FETCH_OP_DEREF) {
+		ret = probe_mem_read(&val, (void *)val + code->offset,
+					sizeof(val));
+		if (ret)
+			return ret;
+		code++;
+	}
+
+	/* 3rd stage: store value to buffer */
+	if (unlikely(!dest)) {
+		if (code->op == FETCH_OP_ST_STRING)
+			return fetch_store_strlen(val + code->offset);
+		else
+			return -EILSEQ;
+	}
+
+	switch (code->op) {
+	case FETCH_OP_ST_RAW:
+		fetch_store_raw(val, code, dest);
+		break;
+	case FETCH_OP_ST_MEM:
+		probe_mem_read(dest, (void *)val + code->offset, code->size);
+		break;
+	case FETCH_OP_ST_STRING:
+		ret = fetch_store_string(val + code->offset, dest, base);
+		break;
+	default:
+		return -EILSEQ;
+	}
+	code++;
+
+	/* 4th stage: modify stored value if needed */
+	if (code->op == FETCH_OP_MOD_BF) {
+		fetch_apply_bitfield(code, dest);
+		code++;
+	}
+
+	return code->op == FETCH_OP_END ? ret : -EILSEQ;
+}
 
 /* Sum up total data length for dynamic arraies (strings) */
 static nokprobe_inline int
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 173588ffe55a..2cf8faeb5b72 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -111,7 +111,7 @@ static unsigned long get_user_stack_nth(struct pt_regs *regs, unsigned int n)
  * Uprobes-specific fetch functions
  */
 static nokprobe_inline int
-probe_user_read(void *dest, void *src, size_t size)
+probe_mem_read(void *dest, void *src, size_t size)
 {
 	void __user *vaddr = (void __force __user *)src;
 
@@ -172,7 +172,6 @@ process_fetch_insn(struct fetch_insn *code, struct pt_regs *regs, void *dest,
 		   void *base)
 {
 	unsigned long val;
-	int ret = 0;
 
 	/* 1st stage: get value from context */
 	switch (code->op) {
@@ -199,45 +198,7 @@ process_fetch_insn(struct fetch_insn *code, struct pt_regs *regs, void *dest,
 	}
 	code++;
 
-	/* 2nd stage: dereference memory if needed */
-	while (code->op == FETCH_OP_DEREF) {
-		ret = probe_user_read(&val, (void *)val + code->offset,
-				      sizeof(val));
-		if (ret)
-			return ret;
-		code++;
-	}
-
-	/* 3rd stage: store value to buffer */
-	if (unlikely(!dest)) {
-		if (code->op == FETCH_OP_ST_STRING)
-			return fetch_store_strlen(val + code->offset);
-		else
-			return -EILSEQ;
-	}
-
-	switch (code->op) {
-	case FETCH_OP_ST_RAW:
-		fetch_store_raw(val, code, dest);
-		break;
-	case FETCH_OP_ST_MEM:
-		probe_kernel_read(dest, (void *)val + code->offset, code->size);
-		break;
-	case FETCH_OP_ST_STRING:
-		ret = fetch_store_string(val + code->offset, dest, base);
-		break;
-	default:
-		return -EILSEQ;
-	}
-	code++;
-
-	/* 4th stage: modify stored value if needed */
-	if (code->op == FETCH_OP_MOD_BF) {
-		fetch_apply_bitfield(code, dest);
-		code++;
-	}
-
-	return code->op == FETCH_OP_END ? ret : -EILSEQ;
+	return process_fetch_insn_bottom(code, val, dest, base);
 }
 NOKPROBE_SYMBOL(process_fetch_insn)
 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
