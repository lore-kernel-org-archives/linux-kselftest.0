Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623054;
	b=baKc9G7PGKPK76w24gq8sHU5jkK8g4SV1m7W2BmX2yuJXvTBx+JsSbz9d84Li1fbt1fv
	 i20LzaGeaLJeooJ2ILD6gBCmOWiGp7kVtUeheTjNCxJ/UDzHsVUv5kdA+CCVhDNXSHZl6
	 TAwn+FJho1HWY56jdXavPIHez0hRxiqFDO7fh1De/9a28MnkjkWs3XKEs7U3eCtt8OcS5
	 YWNbW/WHCz+5985B4FilclXqEV4z3EahDPVohkTeX/fMCaxvVorUxLd8zmZxqllb2MByj
	 uBT4gKggF18KqP6TC9hUNQtEaZMNlL5DC03Q0+NEJpPeIEM54JeE27sF/I1VQV6I7XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UJnsc6rPzhRrohHVm6N1G/brkkNL5aN56fn34HSgfWU=;
	b=Ft5aCC0ZrTz2Br/KjQq0PGfQFbVvEFUKJhfOJBczGw/f5tTgQyhi5bM5TJhLtQs3xXRZ
	 16KDFQmFPlsqekfn/coBou04AA4C9Y4Pdcf4Ue3l2BC94CaFK1OhZ0j+JxB4w5ReHJ+7y
	 xqW2xxO6FjUaeMRQnrmC8ZpYa9LG9mBFAWFdlwvPcQ9mkANkbRJxvVzumx14zFcAVvr2b
	 eJouk0uD74+hQXmtiMah9l9MhLkilotIRCPsTotan4c7CHo3yr/cbJSd6HwjHKphq6zK2
	 cl9H8ejfiQIbYzdeBLpC+ZuVM0oamXvcGfewNkPLuv5YSPPGk/WQkgbavsIjVNmS8WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I+iB/xDh";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097F60A260A
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8097F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+iB/xDh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso5202835eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623054; x=1794227854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJnsc6rPzhRrohHVm6N1G/brkkNL5aN56fn34HSgfWU=;
        b=I+iB/xDhOLEUFnfAxghqnoWsj2cnfBUPzJ4P/6rflkIGlsnJiibyRWCx5skLYgX2ai
         0tCVXdwrHAVqMmbqTSs1YMv2aLQIBmPIzxAGvnlftxsTGBo6SXHDI+PZ3PgKW96D6YgX
         Q/ZpsHH0SXYQd7gODeYqLgPcRH03uO/DA3G+ew7XpMshOGjQohxzjbBuQj6lUTyx/qYf
         eSKUJ/Mh9VIxzIZb0SliQzlYzB1DhM9M1D/qLSHlCDc0nzc9vDgLc/EvpvDzxXKcSx01
         I39ZhHIQQZISagWDZhnAPMAQ5FLTiSVIhuM6mbO+I+eZJK12ThlMlVyy6KQPKL/9cHU0
         Q6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623054; x=1794227854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJnsc6rPzhRrohHVm6N1G/brkkNL5aN56fn34HSgfWU=;
        b=OrdkftiXqAHF8JzgJ8KBcuwgvjyJEPlPoNezhq86Gj7nQLJYLZxr2JMEnCydUZdt7S
         oEkhVP6AJDCgBt/SgajvbvIR6CihSz+C1zyGJUnG+CphiNWVPwtxk68PqQFrlG4pCxJN
         CgCfC+rKPTzQZlcPpSO0CTBWE4rbDPenP72mQ3vk+Q0MbLGUJvv3bnbcV3IZhNnl56n7
         4zNFsbWpXkhaLkvx2/fBsg5R1KwZRr00F19ncPVmm2JYp/BH/lltDPptPYC3cndiurnY
         RPSI2yQVt53nDJmDxW16Ph1+Pn3D67Cq+2xrrChdtW4XWZR+jLewRz19j1khHHRgaORS
         YRkw==
X-Forwarded-Encrypted: i=1; AKwUvBxRdxRtQnadasYwp5+FV4ITHQ9i11EqFgxm1r3zrA7ow7xZfWfuGKvsVGviZgSb/BdYxMr+ACMPSYZXmaBXcvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B8JREX88cGV+JOj4OVjLF92Xw9bxVuXsUqS8VKvTCPociyl2E
	QuL52LEOdn7pyJ2hZAFQtR9vJITyWEq6N3gO9HvDvdjMER/rxWHav22Z
X-Gm-Gg: AYBFou37eBUK7tFXVeSiENx5ebI0nbIQ85445oP9SBKe60+wacDg3SXntUKugbpIIa7
	4ElumCNGfqO/NgHXxBvXrToFJgzE5+0j9PZZikQYEWmBsCasTJJwfJPF28kepYQtD07rn3KQeBQ
	8en1c5yTU+AzWJks6mJUTi4fuvajn7miFOuk1rpWJI96Q1uJGT88jfEVY2mb3NP65oh7Rw13xXQ
	oCoyhm+Y2Jigmsn+306P+gEEnLkNJnG5RSQOPb1vNAbAaaePufxR1cQoF8VE1UsmrNS3/BVfIxJ
	tjOKj1SFgTYBc8HdwFOodtto2FlZSZAITA7TPC8fXmZiAK3sq6LzUluyIVJZe7CeknCyNnLgRl0
	v2ZY6fDte9CwMWuqNKtGMA7sQeMbr99Y1L1RU81EOqvI+2XyN8GTzK0okjqBU+ErJItl+qhz3ER
	fc7KJnIF0olina5k5uFQGrehUCRQ6gSwAtJsXhiaFlrML4kp1DUNaGCFV8p68bKnTlYjZ4qQBrn
	R40Dye63LItTtVIp4nEBcZBtlsA1XMYpmxWEVI/OBuenpG3dQnXOWv93R9PylIeRIzcJ7g1D1qs
	6VrV7zIzwtshzvFMeCfJl/23
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17231783eec.12.1793623053582;
        Mon, 02 Nov 2026 04:37:33 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:33 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:05 -0500
Subject: [PATCH bpf-next 5/5] selftests/bpf: Test log_true_size with an
 error from blinding
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bpf-blind-nops-fixes-v1-5-844300e42cdb@gmail.com>
References: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
In-Reply-To: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

A prog of one function gets its constants blinded when its runtime is
selected, which can log an error.

No test checks that log_true_size counts such an error.

Load a prog whose jump goes over 11000 constants with bpf_jit_harden=2.
Blinding pushes the jump out of its 16-bit range, and the message must
be in the log and in log_true_size.

Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../selftests/bpf/prog_tests/blinding_log.c        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/blinding_log.c b/tools/testing/selftests/bpf/prog_tests/blinding_log.c
new file mode 100644
index 0000000000000..658a8494dae5b
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/blinding_log.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/* The verifier log of a prog whose constants are blinded */
+
+#include <test_progs.h>
+#include <linux/filter.h>
+#include "sysctl_helpers.h"
+
+#define NR_CONSTS 11000
+#define LOG_SIZE 65536
+
+/*
+ * A prog of one function gets its constants blinded when its runtime is
+ * selected. Each 'r0 += 1' becomes 3 insns, which pushes the jump over them
+ * out of its 16-bit range. Serial, because it sets bpf_jit_harden.
+ */
+void serial_test_blinding_log(void)
+{
+	const char *harden = "/proc/sys/net/core/bpf_jit_harden";
+	LIBBPF_OPTS(bpf_prog_load_opts, opts);
+	struct bpf_insn *insns;
+	char old[16] = {}, *log;
+	int i, cnt = 0, fd;
+
+	if (!is_jit_enabled()) {
+		printf("%s:SKIP:JIT is disabled\n", __func__);
+		test__skip();
+		return;
+	}
+
+	insns = calloc(NR_CONSTS + 3, sizeof(*insns));
+	log = calloc(1, LOG_SIZE);
+	if (!ASSERT_OK_PTR(insns, "insns") || !ASSERT_OK_PTR(log, "log"))
+		goto out;
+
+	insns[cnt++] = BPF_EMIT_CALL(BPF_FUNC_get_prandom_u32);
+	insns[cnt++] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, NR_CONSTS);
+	for (i = 0; i < NR_CONSTS; i++)
+		insns[cnt++] = BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 1);
+	insns[cnt++] = BPF_EXIT_INSN();
+
+	opts.log_buf = log;
+	opts.log_size = LOG_SIZE;
+	/* log stats only: level 1 logs each insn, which wraps the buffer */
+	opts.log_level = 4;
+	if (sysctl_set_or_fail(harden, old, "2"))
+		goto out;
+	fd = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", insns, cnt, &opts);
+	sysctl_set_or_fail(harden, NULL, old);
+	/* don't mind whether the interpreter takes the prog or the load fails */
+	if (fd >= 0)
+		close(fd);
+
+	/* expect the message about the jump in the log and in log_true_size */
+	ASSERT_HAS_SUBSTR(log, "cannot be patched due to 16-bit range", "log");
+	ASSERT_EQ(opts.log_true_size, strlen(log) + 1, "log_true_size");
+out:
+	free(insns);
+	free(log);
+}

-- 
2.43.0

