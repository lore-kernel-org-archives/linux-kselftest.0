Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479172;
	b=z3tFe0OATy77QMyRSN0Rx0zBL+6s05A9p2DL0t9mBtDSKVy64wDCsIem2tqYMTaivNgK
	 bqZQq24I7VfQocGF1XL+XNqedxHKVsZ/4+FmkR2OrVWcGaxajmOxOvNhB50yepXsI3DLC
	 4rtVNAipC+VEga5BqjlQeFcPdwMQNrAbB1l5j4OR8HYTkweGuOGYosT7p3x3klpvkNS6Q
	 KVV4uGIB1vzFOTRqTdNYyuP9OuBjmxW2jQmvg2/ZEq5IdS3TFpMCtbvcojBa57NIwJfnC
	 5yPNnef5wFpADi0yiFdbXD4C945Ze2w0SX7AT1uecmXhYceuU14MFfFhpsb2L6no8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
	b=UdYeBuRse2jIhJ8wr9TK4PCRSzOho2jGyO0JvCggfv2d6miROMivKeBKcKi3CMWBOocg
	 8X3A18jQWcK02h5BDppccUKwBNis7hEKl/qHENXp2CYLch+He8uO7BOcYgobpjOtR+bv4
	 /+Qc597025oBmY0obIkaW17s+PPCG1XwE9X7KXwZ9dmcx3+QmafDz9P0nbkuS6tQcc6EC
	 UETOc2lsqP1VysaAQrJnPiH+w9MYw9SnaYNM5QdE0acOnqR8RDQMwoNUfR6x+RezAvWSh
	 oxxQqDik8tx7D0nfMbBn07m1W9sAduv/oVe6oixSvoJ5T/WgMKq+JeSVotFmmueCVoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvzGf6z3;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D25606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 00:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvzGf6z3
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a07078200fso1951415b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 16:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479171; x=1796083971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
        b=EvzGf6z3rhg+QVwRCNjiqtCEZQCgcOG6ShYMP0kcI8BIeTc+i+i1MBX1jcLv86gWPK
         nyHsqBHq/6w7+m9DsSBPB+vW2wMewdPpAMBY2hX/Uls7uEq7FEl0qbsUwWhAxBAwrC+W
         +S5cCZa8peiG/UWSsGfsCamGsA2WW+N0Ng8wgEG/f8tHfVjaETAJGRpi4zoOJVmSk2Fk
         yMKdj6HtQbbkDpc8+pkb4cP7A8uDYL+GEkEZIYMBDAuTLKWDOZC5Yh+kvlrf0QrZ3MgU
         xHDFWEv+uQAg/q+KqS+6yXIIvnoFUGR0Y1VT7IFBmxqe7g1OrYn/zB5z2DbJlOn0IIOF
         B+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479171; x=1796083971;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
        b=Y29A/XFcy+MHMQ7LqdzEPXz3llckrHcnRfKiXe3QRicpv+1T3j5A2BH0upYG5w7iEh
         UfkWtmVl2fwlg8AwMWBq/JIetbm4dYxWoPUSdG3Fz1GmkiSZhw5HR8O+19CNBwwxr6V7
         h+Tk21atht9YiTFQTsVZYLHKZHtRZfmVH9vR8FN9fDWbOXifZ2GjzHuFdg+VHlUWe63+
         wO9Xgs8xliPOeoNUUu9Kn0t5Mb9hJ6c7PL4LsdwAMi2LNBTa050+AMX9Lqnvz3yKjlKj
         EMJ2+NqzGIBA/REmYsoRO/6vcfg44vKmT5StMxouXk7Tz/Sx4qaqVo3l867JMEHmCtF/
         zteQ==
X-Forwarded-Encrypted: i=1; AL+hErEzd85bGOx0tzmFhP9OHPKsIYrvSgu+oJgPh0PIcRa6SVn/LNU+J324+Hm//J5ZYZYz0doj5A8e2XwRTmHIqOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oZJ9RxESl3ye9Uuaz22HA0BAC8nHkS4mGaeG32Ewt0JmqNOAV
	CMS7I2ASjBix70scBCOc71Jsre5Q0Q76YzWZ9IFiC7xxn6JqiAmVKH7k
X-Gm-Gg: AZFdTZfH9jHM24QCCJElAHO3cZjUG7lmM07l81Adm8skQ44xo6DFTqnqdHHhCKNovcT
	0YVxgo5suq8ECw/uMuDVwv0KgjJOcZtDkzKbLAzW6ydn8Swrpfatt2HpsTgN/MBJkclTmcUOmXu
	FWetLKql4PP7ujnmBrGW7oZA0hJw5bzLrrkYjPgJnW9tNBLyLCCJFM8e7UgQk84Dbr/UTkvX4Kz
	QWSxl1PSW4YnRSgI8EeUlMXjaJuJwCz3aYkV2MByaw9/ute5eHarEU+f3mM21305d6Ks+vQP5CA
	rBNmTbwx/PHZgGPMMv9z8v8/rXRxGmGDDHq7jbuuZslhC3V4ecdNYPWpFZzxr2xbvT+XL54Fdsv
	7dhjqODqC74hhkg89YI5r26+2NHChL+hgMQLeztbrhmISS+ahKV+3xPsxej9P2eYO788Az/Vs/b
	lgCf2s9sox3baYCbedMNaEBiXZb3LFaOqWJjRioF2/EtfDs95OYvtHAlrTtpiCYiVjvSKGndWTq
	iQolPJsXqnaxOh9NcfajFsefsQtuhzWEpB9V9tmCux/IZhl54gjg/22bc5kaWuTomQj+AI3eBLd
	YWQFphY4pbj1df+tz2JiMLcSlyIUN/uC1bop9K742hMDwAIO0mg9WV5/3XZ4lm5cUneocDiP5tx
	c4aqHJe4X2jWbirkKMQFrDgh6Gk+Rg6Yd6A==
X-Received: by 2002:a05:6a00:368b:b0:89e:b12e:7eda with SMTP id d2e1a72fcca58-8c8792c36afmr11522943b3a.7.1795479170548;
        Mon, 23 Nov 2026 16:12:50 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b278f0sm6298093b3a.51.2026.11.23.16.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:12:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 00:12:47 +0000
Message-Id: <DN308UHY5QHQ.8CJOFGAHVVTR@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "KP Singh"
 <kpsingh@kernel.org>, "Matt Bobrowski" <matt@bobrowski.net>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/9] bpf: Add log support for tracing
 link_create
In-Reply-To: <20261123152743.19629-1-leon.hwang@linux.dev>
References: <20261123152743.19629-1-leon.hwang@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 07:27 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>  .../selftests/bpf/prog_tests/cgroup_link.c    | 324 ++++++++
>  .../selftests/bpf/prog_tests/iter_link.c      | 156 ++++
>  .../selftests/bpf/prog_tests/tracing_link.c   | 741 ++++++++++++++++++
>  .../selftests/bpf/progs/tracing_link_ctx.c    |  17 +
>  .../selftests/bpf/progs/tracing_link_multi.c  |  36 +
>  .../selftests/bpf/test_kmods/bpf_testmod.c    |   5 +

1279 lines of selftests for log messages ?
This is way too much.

pw-bot: cr

One row per attach path is enough. It checks that the log gets there.
The base kernel leaves the log empty, so all four rows fail on it.
Something like this:

diff --git a/tools/testing/selftests/bpf/prog_tests/link_log.c b/tools/testing/selftests/bpf/prog_tests/link_log.c
new file mode 100644
index 0000000..4f7e71a
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/link_log.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+
+/* One row per attach path. It checks that the log gets there. */
+static const struct {
+	const char *name;
+	enum bpf_prog_type type;
+	enum bpf_attach_type attach_type;
+	const char *func;
+	struct bpf_link_create_opts opts;
+	int err;
+	const char *msg;
+} tests[] = {
+	{ "tracing", BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, "bpf_fentry_test1",
+	  { .target_btf_id = 1 }, -EINVAL, "target_btf_id" },
+#ifdef __x86_64__
+	{ "tracing_multi", BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY_MULTI, NULL,
+	  { .tracing_multi = { .ids = (const __u32[]){ ~0U }, .cnt = 1 } },
+	  -EINVAL, "4294967295" },
+#endif
+	{ "iter", BPF_PROG_TYPE_TRACING, BPF_TRACE_ITER, "bpf_map",
+	  { .iter.len = 4 }, -EINVAL, "iter_info_len" },
+	{ "cgroup", BPF_PROG_TYPE_CGROUP_SKB, BPF_CGROUP_INET_EGRESS, NULL,
+	  { .cgroup.expected_revision = 2 }, -ESTALE, "revision" },
+};
+
+static void run_test(int i, int cg)
+{
+	const struct bpf_insn insns[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+	struct bpf_link_create_opts opts = tests[i].opts;
+	char buf[128] = {};
+	LIBBPF_OPTS(bpf_log_opts, log_opts, .buf = buf, .size = sizeof(buf), .level = 1);
+	LIBBPF_OPTS(bpf_prog_load_opts, load_opts,
+		    .expected_attach_type = tests[i].attach_type);
+	int prog_fd, fd;
+
+	if (tests[i].func)
+		load_opts.attach_btf_id =
+			libbpf_find_vmlinux_btf_id(tests[i].func, tests[i].attach_type);
+	prog_fd = bpf_prog_load(tests[i].type, NULL, "GPL", insns, ARRAY_SIZE(insns),
+				&load_opts);
+	if (!ASSERT_OK_FD(prog_fd, "bpf_prog_load"))
+		return;
+
+	opts.sz = sizeof(opts);
+	opts.log_opts = &log_opts;
+	fd = bpf_link_create(prog_fd, tests[i].type == BPF_PROG_TYPE_CGROUP_SKB ? cg : 0,
+			     tests[i].attach_type, &opts);
+	if (fd >= 0)
+		close(fd);
+	ASSERT_EQ(fd, tests[i].err, "err");
+	ASSERT_HAS_SUBSTR(buf, tests[i].msg, "log");
+	ASSERT_EQ(log_opts.true_size, strlen(buf) + 1, "true_size");
+	close(prog_fd);
+}
+
+void test_link_log(void)
+{
+	int i, cg;
+
+	cg = test__join_cgroup("/link_log");
+	if (!ASSERT_OK_FD(cg, "join_cgroup"))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++)
+		if (test__start_subtest(tests[i].name))
+			run_test(i, cg);
+	close(cg);
+}
