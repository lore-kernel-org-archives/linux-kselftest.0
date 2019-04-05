From: mmullins at fb.com (Matt Mullins)
Date: Fri, 5 Apr 2019 16:55:06 -0700
Subject: [PATCH bpf-next v2 5/5] selftests: bpf: test writable buffers in raw
 tps
In-Reply-To: <20190405235506.29236-1-mmullins@fb.com>
References: <20190405235506.29236-1-mmullins@fb.com>
Message-ID: <20190405235506.29236-6-mmullins@fb.com>

This tests that:
  * a BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE cannot be attached if it
    uses either:
    * a variable offset to the tracepoint buffer, or
    * an offset beyond the size of the tracepoint buffer
  * a tracer can modify the buffer provided when attached to a writable
    tracepoint in bpf_prog_test_run

Signed-off-by: Matt Mullins <mmullins at fb.com>
---
 include/trace/events/bpf_test_run.h           | 50 ++++++++++++
 net/bpf/test_run.c                            |  4 +
 .../raw_tp_writable_reject_nbd_invalid.c      | 40 ++++++++++
 .../bpf/prog_tests/raw_tp_writable_test_run.c | 80 +++++++++++++++++++
 .../selftests/bpf/verifier/raw_tp_writable.c  | 34 ++++++++
 5 files changed, 208 insertions(+)
 create mode 100644 include/trace/events/bpf_test_run.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/raw_tp_writable_test_run.c
 create mode 100644 tools/testing/selftests/bpf/verifier/raw_tp_writable.c

diff --git a/include/trace/events/bpf_test_run.h b/include/trace/events/bpf_test_run.h
new file mode 100644
index 000000000000..abf466839ea4
--- /dev/null
+++ b/include/trace/events/bpf_test_run.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM bpf_test_run
+
+#if !defined(_TRACE_NBD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_BPF_TEST_RUN_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(bpf_test_finish,
+
+	TP_PROTO(int *err),
+
+	TP_ARGS(err),
+
+	TP_STRUCT__entry(
+		__field(int, err)
+	),
+
+	TP_fast_assign(
+		__entry->err = *err;
+	),
+
+	TP_printk("bpf_test_finish with err=%d", __entry->err)
+);
+
+#ifdef DEFINE_EVENT_WRITABLE
+#undef BPF_TEST_RUN_DEFINE_EVENT
+#define BPF_TEST_RUN_DEFINE_EVENT(template, call, proto, args, size)	\
+	DEFINE_EVENT_WRITABLE(template, call, PARAMS(proto),		\
+			      PARAMS(args), size)
+#else
+#undef BPF_TEST_RUN_DEFINE_EVENT
+#define BPF_TEST_RUN_DEFINE_EVENT(template, call, proto, args, size)	\
+	DEFINE_EVENT(template, call, PARAMS(proto), PARAMS(args))
+#endif
+
+BPF_TEST_RUN_DEFINE_EVENT(bpf_test_finish, bpf_test_finish,
+
+	TP_PROTO(int *err),
+
+	TP_ARGS(err),
+
+	sizeof(int)
+);
+
+#endif
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index fab142b796ef..25e757102595 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -13,6 +13,9 @@
 #include <net/sock.h>
 #include <net/tcp.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/bpf_test_run.h>
+
 static int bpf_test_run(struct bpf_prog *prog, void *ctx, u32 repeat,
 			u32 *retval, u32 *time)
 {
@@ -100,6 +103,7 @@ static int bpf_test_finish(const union bpf_attr *kattr,
 	if (err != -ENOSPC)
 		err = 0;
 out:
+	trace_bpf_test_finish(&err);
 	return err;
 }
 
diff --git a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
new file mode 100644
index 000000000000..328d5c4b084b
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <test_progs.h>
+#include <linux/nbd.h>
+
+void test_raw_tp_writable_reject_nbd_invalid(void)
+{
+	__u32 duration = 0;
+	char error[4096];
+	int bpf_fd = -1, tp_fd = -1;
+
+	const struct bpf_insn program[] = {
+		/* r6 is our tp buffer */
+		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
+		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_6, 128),
+		BPF_EXIT_INSN(),
+	};
+
+	struct bpf_load_program_attr load_attr = {
+		.prog_type = BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE,
+		.license = "GPL v2",
+		.insns = program,
+		.insns_cnt = sizeof(program) / sizeof(struct bpf_insn),
+		.log_level = 2,
+	};
+
+	bpf_fd = bpf_load_program_xattr(&load_attr, error, sizeof(error));
+	if (CHECK(bpf_fd < 0, "bpf_raw_tracepoint_writable loaded",
+		  "failed: %d errno %d\n", bpf_fd, errno))
+		return;
+
+	tp_fd = bpf_raw_tracepoint_open("nbd_send_request", bpf_fd);
+	if (CHECK(tp_fd >= 0, "bpf_raw_tracepoint_writable opened",
+		  "erroneously succeeded\n"))
+		goto out_bpffd;
+
+	close(tp_fd);
+out_bpffd:
+	close(bpf_fd);
+}
diff --git a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_test_run.c b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_test_run.c
new file mode 100644
index 000000000000..4145925f9cab
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_test_run.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <test_progs.h>
+#include <linux/nbd.h>
+
+void test_raw_tp_writable_test_run(void)
+{
+	__u32 duration = 0;
+	char error[4096];
+
+	const struct bpf_insn trace_program[] = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_6, 0),
+		BPF_LD_IMM64(BPF_REG_0, 42),
+		BPF_STX_MEM(BPF_W, BPF_REG_6, BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+
+	struct bpf_load_program_attr load_attr = {
+		.prog_type = BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE,
+		.license = "GPL v2",
+		.insns = trace_program,
+		.insns_cnt = sizeof(trace_program) / sizeof(struct bpf_insn),
+		.log_level = 2,
+	};
+
+	int bpf_fd = bpf_load_program_xattr(&load_attr, error, sizeof(error));
+	if (CHECK(bpf_fd < 0, "bpf_raw_tracepoint_writable loaded",
+		  "failed: %d errno %d\n", bpf_fd, errno))
+		return;
+
+	const struct bpf_insn skb_program[] = {
+		BPF_LD_IMM64(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+
+	struct bpf_load_program_attr skb_load_attr = {
+		.prog_type = BPF_PROG_TYPE_SOCKET_FILTER,
+		.license = "GPL v2",
+		.insns = skb_program,
+		.insns_cnt = sizeof(skb_program) / sizeof(struct bpf_insn),
+	};
+
+	int filter_fd =
+		bpf_load_program_xattr(&skb_load_attr, error, sizeof(error));
+	if (CHECK(filter_fd < 0, "test_program_loaded", "failed: %d errno %d\n",
+		  filter_fd, errno))
+		goto out_bpffd;
+
+	int tp_fd = bpf_raw_tracepoint_open("bpf_test_finish", bpf_fd);
+	if (CHECK(tp_fd < 0, "bpf_raw_tracepoint_writable opened",
+		  "failed: %d errno %d\n", tp_fd, errno))
+		goto out_filterfd;
+
+	char test_skb[128] = {
+		0,
+	};
+
+	__u32 prog_ret;
+	int err = bpf_prog_test_run(filter_fd, 1, test_skb, sizeof(test_skb), 0,
+				    0, &prog_ret, 0);
+	CHECK(err != 42, "test_run",
+	      "tracepoint did not modify return value\n");
+	CHECK(prog_ret != 0, "test_run_ret",
+	      "socket_filter did not return 0\n");
+
+	close(tp_fd);
+
+	err = bpf_prog_test_run(filter_fd, 1, test_skb, sizeof(test_skb), 0, 0,
+				&prog_ret, 0);
+	CHECK(err != 0, "test_run_notrace",
+	      "test_run failed with %d errno %d\n", err, errno);
+	CHECK(prog_ret != 0, "test_run_ret_notrace",
+	      "socket_filter did not return 0\n");
+
+out_filterfd:
+	close(filter_fd);
+out_bpffd:
+	close(bpf_fd);
+}
diff --git a/tools/testing/selftests/bpf/verifier/raw_tp_writable.c b/tools/testing/selftests/bpf/verifier/raw_tp_writable.c
new file mode 100644
index 000000000000..95b5d70a1dc1
--- /dev/null
+++ b/tools/testing/selftests/bpf/verifier/raw_tp_writable.c
@@ -0,0 +1,34 @@
+{
+	"raw_tracepoint_writable: reject variable offset",
+	.insns = {
+		/* r6 is our tp buffer */
+		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
+
+		BPF_LD_MAP_FD(BPF_REG_1, 0),
+		/* move the key (== 0) to r10-8 */
+		BPF_MOV32_IMM(BPF_REG_0, 0),
+		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
+		BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
+		BPF_STX_MEM(BPF_DW, BPF_REG_2, BPF_REG_0, 0),
+		/* lookup in the map */
+		BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
+			     BPF_FUNC_map_lookup_elem),
+
+		/* exit clean if null */
+		BPF_JMP_IMM(BPF_JNE, BPF_REG_0, 0, 1),
+		BPF_EXIT_INSN(),
+
+		/* shift the buffer pointer to a variable location */
+		BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_0, 0),
+		BPF_ALU64_REG(BPF_ADD, BPF_REG_6, BPF_REG_0),
+		/* clobber whatever's there */
+		BPF_MOV64_IMM(BPF_REG_7, 4242),
+		BPF_STX_MEM(BPF_DW, BPF_REG_6, BPF_REG_7, 0),
+
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	},
+	.fixup_map_hash_8b = { 1, },
+	.prog_type = BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE,
+	.errstr = "R6 invalid variable buffer offset: off=0, var_off=(0x0; 0xffffffff)",
+},
-- 
2.17.1
