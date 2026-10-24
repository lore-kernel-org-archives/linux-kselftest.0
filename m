Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823015;
	b=nL7SRhmULFZQ6IZvXK6X/NgcF8IVJJupCpsBO9k1kHEVzLEMS7DNkvNmtoZJgkieu38m
	 JonqgWB/LdI0mF6tTIOov91m4x5xE0GgG0hVcxeKcfomzdob5bEAH1XRC89gQ90E1DF2D
	 6lit57fVF/oIIDn13yBGhBIcJ4XPLNpxN2XB+7Xe8bKzBv6n+mDBKfNtYeL7avCrQjaCd
	 +Okh0xSPPipMX9n1ECOqWh9w+DYBOFOnvusFaaDIic++hPTz1ng3JFzTFSfywb7JXL0Nb
	 jMqxvnB9n/1hwWeqLiaXiNAo9TTgSL1SM40bWoo0p55InhObHptqngKxkeDgI/YiO+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8F8HFsYfAHizugxAtruo/TQMfMkYFk3uqtVD3fXKtyA=;
	b=xNhg2ud+RtgAIQ3GFPBBc30SboZsDgDiddkVBzbsFytVbQDGsaLI9uQOsIwKpe2mi4Q4
	 FMlwhr8KAxB+Kmyuc5+Dcz+T/03Lsbd0Mnl9U5EYu6P5UOps+nrf3Nrv0+eFJ/7740Og/
	 rp5JmxQa743x8e/DXst6fBjM4jKg2k5w6DLaPIVy0HTRR0n8HL1ny+bJOY5q5NhYE8jAK
	 NnMESfNq7BmT5SiYuqfWjUcG7rk9VjzJdx8Pc/NuHzhTETJIoqHK17aAjAlr4P9n1rJo9
	 yaGFC76M1Hvhnslb8bxHO6HjY/z7gPWQqCyATZyB6UTwnqo1BaEmgeLkHiJtODgBIKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jK09oEFw;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B4606A31B
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 06:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jK09oEFw
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1159473e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 23:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823013; x=1793427813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8F8HFsYfAHizugxAtruo/TQMfMkYFk3uqtVD3fXKtyA=;
        b=jK09oEFwLGaCaAW5UOad/IBCAAJTRhsjViMJ55Kkx72oPWMJadURHpLlS8jXIlWy3p
         3u9j8RFClSGCR5+Kp6QGXy43JY1poEwYMOmDynAtR55Z//KP4oi2pbPmJUUoRxAe+e6S
         DvMCEheSKTAzVycfFkNhB5XqLDUvSQ1S19Fh1flsatGFejJvyro4u2R+TGmJgWspk5Dl
         HO8mwg47pmNO+yo3iUP/Zhm/3QuUTxrWMdwE7mbJdRIqD1MuPk39klBB5Qg+tHCOPypk
         zm7+Xj0tV59XI6/g9vJQK9xhN0dqKYh9UC4oTKbzO1kbm6d2VNXXD+2gaDkV4zpMLJRw
         JQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823013; x=1793427813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8F8HFsYfAHizugxAtruo/TQMfMkYFk3uqtVD3fXKtyA=;
        b=VaRkFMsN7YZQXqlrT5lqhUF3CIq1cKGxt7C3e4eAK5mKcM5AVHJNXBGEKRksssBA/s
         XlRBi+NBrwfdxDIfwAzVM3KGkoyf43ydjQOjx/w1kvijJeiQgfPZIJSWS0zLjgC8xGJf
         62Cj/31AVmCXlTXvP3aEzfKyedy5ykTjjdixddrSRZQJ7vcJEw3o+2C4jRc4T0VZSJH1
         VfCKMDegiML/dUgISrKeKe7lahwBu1wIlKSzimSvvVNwR4GCbhx1cbq6S0nSgrZA3kOV
         E9tjqQHD14x4IoSffL39Lknl/QFAz/EbacCEqxn+IBhgbxE4U8x/k48TuWe6QiTmaCFI
         j1zg==
X-Forwarded-Encrypted: i=1; AKwUvByJKffhoDx/wDq5u9R8BO2WBotS4cDgE8KHZhrHR77lGb8yu++k8BbR262iiWdlTI2UCwPPsQgpT6r0fKHL2yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvG6OgJpxxnNwlsKllbJlGbuJiL+wn/bSp1rdKzPsB6jG+XVrC
	Df/vkrwMKnVEnQ7fCR9xBWKrXEi3q21E7IT2cXhkMpbaL60Zfzg2w0b+
X-Gm-Gg: AYBFou1J2Cc8jVm7duCdYAbpt11tL89TLkiR1YTbEvoyrNnLaOlEnpNwCBAkgDwbCsq
	lZ3/bKzwLKtAVT4/xcodnEQok4WWJBrBZV8NTm1Lqlggbk3L/fmtIs210zPHU+RwFhW929/09fA
	gN+3WK4J4DO6XNnVY41B0izIJP7iH1pJ8i1LRcY8t8U5KQ53bod8DJKcHdLH17HLeAwOLKMBZnE
	lmgQGtr3ENUAsA9lDsQ/4ryFYDH2dSzfVgfaRFqZh4oxLy4Doc9uztRd/rbrcn3PF54PhazJbyd
	f2CVfkt/MvQgzWJVzEYTL+USlei16qyxwLDLoAzo8lytikz5uJ1DJbwABzF7v9iNxwY+HNC+hVP
	0r9PC8KNcdZJ+fFE9ZiiCEWws+Z9gvI7Rk10+V1YxHSX0hfUNW/FckmoPD8+OD01EasOosY7mOP
	oHaIck7YKJp2ugi1px9VVsSQu9n5ZW25vxsUE/bxRxpP9qwRI7UqoWHHkoxDWp2IqJvEufmphTq
	xW98kvV25wXbb/4HtWMubs16g8LwSzeX+a86SVnIrcbhDR6DYmKPYK/a19RdlWQC5vsdJSzlbr6
	jsdRdyWo3D9kUmtuHpnamsWU3/CJAm9clg0=
X-Received: by 2002:a05:6512:10c9:b0:5bf:b22f:19b3 with SMTP id 2adb3069b0e04-5bfb71b7e83mr399244e87.27.1792823012464;
        Fri, 23 Oct 2026 23:23:32 -0700 (PDT)
Received: from localhost ([196.240.54.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a75e0bsm211262e87.41.2026.10.23.23.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:23:31 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] bpftool: fix line info in multi-function CFG dumps
Date: Sat, 24 Oct 2026 08:23:29 +0200
Message-ID: <20261024062329.264086-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CFG dumper computes BTF line-info offsets relative to each function, but bpf_prog_linfo__lfind() expects offsets from the start of the whole program. As a result, line annotations in later functions can resolve to source lines from the first function.

Pass the program instruction base to the graph dumper and use the global instruction offset for line-info lookup and display. Keep function-info matching relative to the function as before.

Add a selftest with a BPF-to-BPF call that checks the second function source line in visual output.

Link: https://github.com/libbpf/bpftool/issues/178
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 tools/bpf/bpftool/cfg.c                       | 19 +++++----
 tools/bpf/bpftool/xlated_dumper.c             | 10 +++--
 tools/bpf/bpftool/xlated_dumper.h             |  3 +-
 .../selftests/bpf/prog_tests/bpftool_cfg.c    | 41 +++++++++++++++++++
 .../testing/selftests/bpf/progs/bpftool_cfg.c | 16 ++++++++
 5 files changed, 75 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_cfg.c

diff --git a/tools/bpf/bpftool/cfg.c b/tools/bpf/bpftool/cfg.c
index e3785f9a6..65ec45469 100644
--- a/tools/bpf/bpftool/cfg.c
+++ b/tools/bpf/bpftool/cfg.c
@@ -383,7 +383,7 @@ static void cfg_destroy(struct cfg *cfg)
 
 static void
 draw_bb_node(struct func_node *func, struct bb_node *bb, struct dump_data *dd,
-	     bool opcodes, bool linum)
+	     struct bpf_insn *prog_start, bool opcodes, bool linum)
 {
 	const char *shape;
 
@@ -400,11 +400,11 @@ draw_bb_node(struct func_node *func, struct bb_node *bb, struct dump_data *dd,
 	} else if (bb->idx == EXIT_BLOCK_INDEX) {
 		printf("EXIT");
 	} else {
-		unsigned int start_idx;
+		unsigned int start_idx = bb->head - func->start;
+
 		printf("{\\\n");
-		start_idx = bb->head - func->start;
 		dump_xlated_for_graph(dd, bb->head, bb->tail, start_idx,
-				      opcodes, linum);
+				      prog_start, opcodes, linum);
 		printf("}");
 	}
 
@@ -432,12 +432,12 @@ static void draw_bb_succ_edges(struct func_node *func, struct bb_node *bb)
 
 static void
 func_output_bb_def(struct func_node *func, struct dump_data *dd,
-		   bool opcodes, bool linum)
+		   struct bpf_insn *prog_start, bool opcodes, bool linum)
 {
 	struct bb_node *bb;
 
 	list_for_each_entry(bb, &func->bbs, l) {
-		draw_bb_node(func, bb, dd, opcodes, linum);
+		draw_bb_node(func, bb, dd, prog_start, opcodes, linum);
 	}
 }
 
@@ -458,7 +458,8 @@ static void func_output_edges(struct func_node *func)
 }
 
 static void
-cfg_dump(struct cfg *cfg, struct dump_data *dd, bool opcodes, bool linum)
+cfg_dump(struct cfg *cfg, struct dump_data *dd, struct bpf_insn *prog_start,
+	 bool opcodes, bool linum)
 {
 	struct func_node *func;
 
@@ -466,7 +467,7 @@ cfg_dump(struct cfg *cfg, struct dump_data *dd, bool opcodes, bool linum)
 	list_for_each_entry(func, &cfg->funcs, l) {
 		printf("subgraph \"cluster_%d\" {\n\tstyle=\"dashed\";\n\tcolor=\"black\";\n\tlabel=\"func_%d ()\";\n",
 		       func->idx, func->idx);
-		func_output_bb_def(func, dd, opcodes, linum);
+		func_output_bb_def(func, dd, prog_start, opcodes, linum);
 		func_output_edges(func);
 		printf("}\n");
 	}
@@ -483,7 +484,7 @@ void dump_xlated_cfg(struct dump_data *dd, void *buf, unsigned int len,
 	if (cfg_build(&cfg, insn, len))
 		return;
 
-	cfg_dump(&cfg, dd, opcodes, linum);
+	cfg_dump(&cfg, dd, insn, opcodes, linum);
 
 	cfg_destroy(&cfg);
 }
diff --git a/tools/bpf/bpftool/xlated_dumper.c b/tools/bpf/bpftool/xlated_dumper.c
index 5579173a6..847241bbe 100644
--- a/tools/bpf/bpftool/xlated_dumper.c
+++ b/tools/bpf/bpftool/xlated_dumper.c
@@ -353,7 +353,7 @@ void dump_xlated_plain(struct dump_data *dd, void *buf, unsigned int len,
 }
 
 void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
-			   unsigned int start_idx,
+			   unsigned int start_idx, struct bpf_insn *prog_start,
 			   bool opcodes, bool linum)
 {
 	const struct bpf_insn_cbs cbs = {
@@ -374,6 +374,7 @@ void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
 
 	for (; cur <= insn_end; cur++) {
 		unsigned int insn_off;
+		unsigned int linfo_offset;
 
 		if (double_insn) {
 			double_insn = false;
@@ -381,7 +382,8 @@ void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
 		}
 		double_insn = cur->code == (BPF_LD | BPF_IMM | BPF_DW);
 
-		insn_off = (unsigned int)(cur - insn_start + start_idx);
+		insn_off = (unsigned int)(cur - insn_start) + start_idx;
+		linfo_offset = (unsigned int)(cur - prog_start);
 		if (btf && record) {
 			if (record->insn_off == insn_off) {
 				btf_dumper_type_only(btf, record->type_id,
@@ -396,14 +398,14 @@ void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
 		if (prog_linfo) {
 			const struct bpf_line_info *linfo;
 
-			linfo = bpf_prog_linfo__lfind(prog_linfo, insn_off, 0);
+			linfo = bpf_prog_linfo__lfind(prog_linfo, linfo_offset, 0);
 			if (linfo && linfo != last_linfo) {
 				btf_dump_linfo_dotlabel(btf, linfo, linum);
 				last_linfo = linfo;
 			}
 		}
 
-		printf("%u: ", insn_off);
+		printf("%u: ", linfo_offset);
 		print_bpf_insn(&cbs, cur, true);
 		printf("\\l\\\n");
 
diff --git a/tools/bpf/bpftool/xlated_dumper.h b/tools/bpf/bpftool/xlated_dumper.h
index db3ba0671..d2af7bd10 100644
--- a/tools/bpf/bpftool/xlated_dumper.h
+++ b/tools/bpf/bpftool/xlated_dumper.h
@@ -8,6 +8,7 @@
 #define MODULE_MAX_NAME	64
 
 struct bpf_prog_linfo;
+struct bpf_insn;
 
 struct kernel_sym {
 	unsigned long address;
@@ -36,7 +37,7 @@ void dump_xlated_json(struct dump_data *dd, void *buf, unsigned int len,
 void dump_xlated_plain(struct dump_data *dd, void *buf, unsigned int len,
 		       bool opcodes, bool linum);
 void dump_xlated_for_graph(struct dump_data *dd, void *buf, void *buf_end,
-			   unsigned int start_index,
+			   unsigned int start_idx, struct bpf_insn *prog_start,
 			   bool opcodes, bool linum);
 
 #endif
diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c b/tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c
new file mode 100644
index 000000000..7d5b80927
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <bpftool_helpers.h>
+#include <test_progs.h>
+#include <linux/bpf.h>
+#include "bpftool_cfg.skel.h"
+
+#define MAX_BPFTOOL_OUTPUT_LEN (64 * 1024)
+
+void test_bpftool_cfg(void)
+{
+	struct bpftool_cfg *skel = NULL;
+	struct bpf_prog_info info = {};
+	__u32 info_len = sizeof(info);
+	char output[MAX_BPFTOOL_OUTPUT_LEN];
+	char cmd[MAX_BPFTOOL_CMD_LEN];
+	const char *expected = "return\\ bpf_ktime_get_ns()\\ ?\\ skb->len\\ :\\ 0;";
+	int err;
+
+	skel = bpftool_cfg__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "bpftool_cfg__open_and_load"))
+		return;
+
+	err = bpf_obj_get_info_by_fd(bpf_program__fd(skel->progs.bpftool_cfg),
+				     &info, &info_len);
+	if (!ASSERT_OK(err, "bpf_obj_get_info_by_fd"))
+		goto cleanup;
+
+	err = snprintf(cmd, sizeof(cmd), "prog dump xlated id %u visual linum",
+		       info.id);
+	if (!ASSERT_GT(err, 0, "format bpftool command"))
+		goto cleanup;
+
+	err = get_bpftool_command_output(cmd, output, sizeof(output));
+	if (ASSERT_OK(err, "dump program CFG")) {
+		ASSERT_HAS_SUBSTR(output, "cluster_1", "second function in CFG");
+		ASSERT_HAS_SUBSTR(output, expected, "second function line info");
+	}
+
+cleanup:
+	bpftool_cfg__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/bpftool_cfg.c b/tools/testing/selftests/bpf/progs/bpftool_cfg.c
new file mode 100644
index 000000000..db01f20c8
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/bpftool_cfg.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+static __noinline int helper(struct __sk_buff *skb)
+{
+	return bpf_ktime_get_ns() ? skb->len : 0;
+}
+
+SEC("socket")
+int bpftool_cfg(struct __sk_buff *skb)
+{
+	return helper(skb);
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.55.0

