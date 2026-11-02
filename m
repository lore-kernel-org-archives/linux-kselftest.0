Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648515;
	b=wolF2l+on08jJwdBixw9lOL3berfWCsbwBIkh6j1dhSYvbZKbRPMrFYIMqZ0sSLXmeOf
	 oDhzh1n28hzZ/iuZbRy+lwAvGWbGKAMmI4BWvJYvxamymAp287MXyIBtpq19YVhgVh3mf
	 Gw6gcx258G/XnrdBM6A45nyhymLgXCdhJXHJRImRKibGyNYyjvVKNX03e+bX928gRul/9
	 O+L30fxqLg3yob+ORKCISAYiPMgTRG6CrzXAi5TisP2gBK3glOj8ia5jN9Pk8fUAP0+Ho
	 XJlyPPyksceqV2eUkIKPLZUgKXLJL3AxjQQ+vuhBl/x6BAPYUIugAKW99Q7Wm1pBYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpB8+CQBXkjbs7fgG+qom3QzkI74HttnULs4D1eQfjE=;
	b=idp6UiAY79nY2s/LZIFsnlyoNapdtgs7M3aiMokR4ybOJYo96lbAUxlW6OpPffcFnK7a
	 cCjeHgfoqH7aHlEH7m7tRd96cBb4i5YEfObPQUqtjTHm91aX96jmffvjetEvF8VfhUhEE
	 sMAuiPDWaQDbGPBbLir5WYsJ1fIx+xolfQXZBl3GtYoFgn6ILOhHAUJQ0XDZYUQ2/Qz1b
	 nf88aIg1DmqKjLZEfqiHjwEPTmcYdUAltXTpPWhWPGKIZXX/oXMKw4+BWHVXyxUUv5ZNl
	 S7vaifPUASDteX6Z1QcQnz93fUFxDf/cuwYlkZ29JJXbQG6/+FNcja+sEMmKoQO42JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GtziaFNk;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6D606A33C
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB6D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GtziaFNk
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so28581805e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648513; x=1794253313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpB8+CQBXkjbs7fgG+qom3QzkI74HttnULs4D1eQfjE=;
        b=GtziaFNk7i2iMppP9Qcz+i8RcKdgwHDsyTAT934sJr/OaTBtb3h2dV5qniSRazAapp
         SUmrDaGzlrYlNg89YGnCT4Mf0eqOr18dHSkyOsRIQIADiu9aBs9ESliC+dwl7FwmCznf
         nrKGLS3s2SXxKzVbc6rw1XISBr8HI5awkFV3U4/xNg+C56qymnJLf0AipwEAx5z2r7no
         13EVVHzDcta2f2NGD0XUIYLViGjxozUYAIPs5FRAceTjVog7ywHy6xeKvBlUJRSUlzca
         aylDB3rDbVguUDXteFKsWzGmcZYfChkkVaRqpIZROnhOwNjsjs12B2cM2pS1PXfY2o/C
         KmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648513; x=1794253313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpB8+CQBXkjbs7fgG+qom3QzkI74HttnULs4D1eQfjE=;
        b=Jen3OFK5ydukhSIbwdRx8Grs11NqrAHsObpNT3ByzPtl0Cvrj1DWk09TMRTeGoODt8
         VbfJCz5mTScmUpoyJqMbriwn36bKdPZbEjyg029etmld2v7YNiHCepjoFTt/cgwRUCiL
         zn9kwfNiNVi4RyMKA3ooM9uHFziBrSSPx2tKdXA0dItjPS81OQd4h1X6ZZCbB/aoGuZP
         OMm7if8YMBo6D0yje6xZii+kxN+50JCKq45Ba17Y7NB/SIgPw1M6/di3WVHBtIO32way
         a7hcZ5Le1E5AdzqhTswPi3Ddky+xarxpLLK1xYSO25xSX2CC060dD3MPTIRnqVFeZsuh
         G+Cw==
X-Forwarded-Encrypted: i=1; AKwUvBx9jx7xaUvqWRC+59Ldx+rQoerWI6N96Hlssjis6/1rJbESCvZJ9JMZ7DjAfbMmD735qWSh1FJzpqTn6qLIi3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf43tVG1FYdDSrSXtTPXJRLH8IdCYTvMbLdmP4VEXPsHRwX4jt
	u3K1wFH9bB+xAB5RoomqSnkxr2pLj0CLZPoZCyNbVKCkwDL9FjMQs4wy
X-Gm-Gg: AYBFou1P9fG4Yu2L/dndvsMFojlQklCy2NieD7fP9jvMlZkt/lKMjurKgR6/dx1lFpF
	WyUrZ8ZiQaadDsIyYb8lF84vkqPu8fy9JLkTKh1PzxaNyZsgzPZm2XXXwHUsCeE8a694aq4QCzD
	Edyr47P6k1AfoRCtQ0VvsgsTqEtDl/S3HtKfbTm53tQcjFwVtTzMApC2Nl6M4iA2gzBYfhCo5xi
	HZtPv+EToS1rHdyZNfHrmvskVpknsjgzX+9V0i37XJA4D1P6sldx7Lfq2fcQPpycCo293N0MY/w
	hZ/f99xjl9VWb8FnzF95TIr3xtc9FBAmWJKh5Wq0GvvBaHKEYoGLaBIlK3HcdqzoDnY7Tajoh24
	s2ZVdJhehoskMtPTsSXNK4chIcelwRvpBkiqJveChiuA/4JpLVKnlrmz+Qs0j2wE5KOA9qWZnvv
	T9Uzxnn355b2C2/h4b78bjJLIO+mqWxHvu6Hu1zLEaLU93AQ5xOotvEgLY+xxezAJmrydE/cX26
	wnZfG/9vAQCntRL1MUWe6lXP797QcabG/QRbWOoRNl2SRYpSkccdo9cn7UB3yy0j1JAmFhpj5B2
	FvEXBSAk2PpDFqSvrA9cFfNsbh6nh/A24Fv5/KCpgxyoY4MVaFg9Vq3hz8oYuw5T6SSba7F97iI
	N
X-Received: by 2002:a05:600c:6215:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ac17a366c0mr264076435e9.17.1793648513483;
        Mon, 02 Nov 2026 11:41:53 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm231386345e9.4.2026.11.02.11.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:41:53 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 2/5] libbpf: Track generated loader link FDs
Date: Mon,  2 Nov 2026 19:41:41 +0000
Message-ID: <20261102194145.620210-3-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102194145.620210-1-mahe.tardy@gmail.com>
References: <20261102194145.620210-1-mahe.tardy@gmail.com>
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

Introduce gen_attach field to emit program attachment instructions in
generated SYSCALL loaders.

Generate failure cleanup that closes any created links before releasing
programs and maps reusing emit_sys_close_blob(). Store the link fds in
the data buffer similarly to map fds.

Append bpf_link_desc outputs after the program descriptors and copy the
link FDs to the loader context on success.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/bpf_gen_internal.h |  2 ++
 tools/lib/bpf/gen_loader.c       | 17 ++++++++++++++++-
 tools/lib/bpf/libbpf.h           |  3 ++-
 tools/lib/bpf/skel_internal.h    |  4 ++++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/bpf_gen_internal.h b/tools/lib/bpf/bpf_gen_internal.h
index 206adf28793d..b601269abe45 100644
--- a/tools/lib/bpf/bpf_gen_internal.h
+++ b/tools/lib/bpf/bpf_gen_internal.h
@@ -39,6 +39,8 @@ struct bpf_gen {
 	ssize_t cleanup_label;
 	__u32 nr_progs;
 	__u32 nr_maps;
+	int link_fds;
+	__u32 nr_link_slots;
 	int log_level;
 	int error;
 	struct ksym_relo_desc *relos;
diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 555d4757a898..7f41b5a517fe 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -122,6 +122,10 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 	gen->log_level = log_level;
 	gen->nr_obj_maps = nr_maps;
 	gen->max_func_ptr_maps = max_func_ptr_maps;
+	if (OPTS_GET(gen->opts, gen_attach, false)) {
+		gen->link_fds = add_data(gen, NULL, nr_progs * sizeof(int));
+		gen->nr_link_slots = nr_progs;
+	}
 	if (nr_maps + max_func_ptr_maps > MAX_USED_MAPS) {
 		pr_warn("Total maps exceeds %d\n", MAX_USED_MAPS);
 		gen->error = -E2BIG;
@@ -150,10 +154,14 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 			      /* 6 insns for emit_sys_close_blob,
 			       * 6 insns for debug_regs in emit_sys_close_blob
 			       */
-			      nr_maps * (6 + (gen->log_level ? 6 : 0))));
+			      (nr_maps + gen->nr_link_slots) *
+			      (6 + (gen->log_level ? 6 : 0))));

 	/* remember the label where all error branches will jump to */
 	gen->cleanup_label = gen->insn_cur - gen->insn_start;
+	/* Detach any programs activated before a later operation failed. */
+	for (i = 0; i < gen->nr_link_slots; i++)
+		emit_sys_close_blob(gen, gen->link_fds + i * sizeof(int));
 	/* emit cleanup code: close all temp FDs */
 	for (i = 0; i < nr_progs_sz; i += 4) {
 		emit(gen, BPF_LDX_MEM(BPF_W, BPF_REG_1, BPF_REG_10, -stack_sz + i));
@@ -413,6 +421,13 @@ int bpf_gen__finish(struct bpf_gen *gen, int nr_progs, int nr_maps)
 			      sizeof(struct bpf_map_desc) * i +
 			      offsetof(struct bpf_map_desc, map_fd), 4,
 			      blob_fd_array_off(gen, i));
+	for (i = 0; i < gen->nr_link_slots; i++)
+		move_blob2ctx(gen,
+			      sizeof(struct bpf_loader_ctx) +
+			      sizeof(struct bpf_map_desc) * gen->nr_maps +
+			      sizeof(struct bpf_prog_desc) * gen->nr_link_slots +
+			      sizeof(struct bpf_link_desc) * i, 4,
+			      gen->link_fds + i * sizeof(int));
 	emit(gen, BPF_MOV64_IMM(BPF_REG_0, 0));
 	emit(gen, BPF_EXIT_INSN());
 	if (!gen->error) {
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 22204a544b23..a2ee239c114d 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -1990,9 +1990,10 @@ struct gen_loader_opts {
 	__u32 data_sz;
 	__u32 insns_sz;
 	bool gen_hash;
+	bool gen_attach;
 };

-#define gen_loader_opts__last_field gen_hash
+#define gen_loader_opts__last_field gen_attach
 LIBBPF_API int bpf_object__gen_loader(struct bpf_object *obj,
 				      struct gen_loader_opts *opts);

diff --git a/tools/lib/bpf/skel_internal.h b/tools/lib/bpf/skel_internal.h
index 9e16b8e8cb7c..cac7b1d2abfb 100644
--- a/tools/lib/bpf/skel_internal.h
+++ b/tools/lib/bpf/skel_internal.h
@@ -47,6 +47,10 @@ struct bpf_prog_desc {
 	int prog_fd;
 };

+struct bpf_link_desc {
+	int link_fd;
+};
+
 enum {
 	BPF_SKEL_KERNEL = (1ULL << 0),
 };
--
2.43.0

