Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650446;
	b=CapMTgII44C4fSGT5+QYAqevi3z03gnQtjfAtGBAFQ88psgOXOv9Kzy+GvGYvQvL4A7Q
	 Yzf+rhIV2UcudNhZd51l2l3OhFluYiXDDFDiB2M3hXNBkHe4Bhi/Ub1zBJsq8vJ1aJhhm
	 IWzu8MM9mdzxSAZlCDajxdLWHCezC0jmBQnCxjWWwybMg4kHTg61gWDXuieKsKVYnzxVI
	 2ErHktq8LSFSVhiZ4vbZg2LUNyBq8Q+sF4eV1TQOrICnfZtcCgw4JrrDvGZkbwEf2cX7u
	 5ZzR3Pq2KSiNhu6R+QwSL6EY0H6cogiMtDDu/hQ/ay/TOQL1TX+vgCjlM1U+zwvXdsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpB8+CQBXkjbs7fgG+qom3QzkI74HttnULs4D1eQfjE=;
	b=bbBmDYcpZodPFB/IHzNFPeRMaPvToJ4M+dOnqNKjK9Gnbolc3XNWsdzI853RiIhwmCGH
	 gdDQVo8ZUkmGMIO+0c2IH5o21suNWlIlMQYnSKdgggmvGKKHz/5/CBQduRoHrqKOEelF/
	 rddrgvO14zEvBvkOQhE05CC2BeV6mIjWjBDDL1U9Fd0GUq06+0eD4PXPIC5GGwF2lnyuT
	 xTekzJ8ahzOOoeFhxLr3+kdtvJ/cvoYvnYQOsRcGN7Pj42pfpze8D3Hzi2mOejd6sDp+q
	 qpYpcFHaHwU6Lp+SYV10w/W2a4p+TMgrE44oHjHd6FOj1FyryFVQZFSb0UFRASLqrUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xz/7OcJX";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97EF606D803
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97EF606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xz/7OcJX
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e04773687so1035060f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650444; x=1794255244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpB8+CQBXkjbs7fgG+qom3QzkI74HttnULs4D1eQfjE=;
        b=Xz/7OcJXv3n4ZVkfvZLqVkQ49KduMxBQGkYn2pPkc5XmTFjdVb8jW68KmFqWHjVvhM
         bVP7+zxxszE5Jq0hpZ1cfeHu3LKdYOZ5La/U72fIgb1837PvJpLSbJqiXlzjH/nVzADQ
         ujlp2H7p2Flopqfz3PPnapZqcm1jCt4YlNEoSlls9F1sE40tm4RKcBFhKT8OPONcdcXg
         wfQuyk1m+oMdQoANoIsa7IJ5noDwQu8YK/jV6dTzicRcC5vH2SyHGknIQcDa/AzihZiZ
         zN/CnlEkM8hhgq1md5JRT4UXVhW66MsoNd+mTaWPmbOqNPxMTH3tXik7z6aOZ4RpC0yP
         95BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650444; x=1794255244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpB8+CQBXkjbs7fgG+qom3QzkI74HttnULs4D1eQfjE=;
        b=g2AQXAJRxtaK5qk6levrDi+EKzlzhYDiTkBXTwGJqSMv/qxX2i//3os09VlLU+BdMG
         53HM7Shc1LF+tYahXrQwfQVaBJXde0TDFUiyGQ7DwFqjuUXf4pLuUuNOirTI83m3h3fN
         S5UrvENe9CS0GdVBluFJHvRxshmTcLwtvwWe+N5PeT2W8mgh+kp3FXCglHTjZqEWujZr
         sQDTsQLsmxcTHsPPIEPWtkf61eX4BUs9tWefJPV8KxtAkMzI9ZeKogMRKGAq2ZG8W24U
         MVLmMlNkhNUkujqiLFMygF7BvfzNFcim8hm4nqXS+YWH7quqpJ4bcpwyaZHMjMwGdNjG
         H56Q==
X-Forwarded-Encrypted: i=1; AKwUvByMdwQqBoO1Qm/j2j9oArxfLnx05dOLoanTnb9RD+EGA/YiK2L/B73z4HtVrUuVo1nc25wMuLdLOKNGMduSRq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4h5zuy6ZbX0LAmzpVMypRSuyrpBh3aPCtIwV9HvbduTK/VzW2
	Tai3P5jOxtSHAw4qlZKqxjYremefVfH87st/vtN7HN8NeATDLlE8Uq7r
X-Gm-Gg: AYBFou2n5TTFUtoOX+UUzkTHOh0vetXSaJtPU+aZfUuc8qAK4m3ByOpj5MB10Uv0gmm
	5HrjnBPyU8TiRIwXtcn75uO2Ak0wo7rOmRu0dkIvqUARhAkmxTInWPKlvK8z7skgR67WjV1Bi+A
	glGtr3Nt9TgTHOjunpEKVAiNtz3a64mrHEtRVXUt0xRa/AEdxnV8zOgxYgK3WKHHizV8U3glu40
	uVL5JR4IsOUgr009DUsr8GglPvQzmvRLgJ16r9jH5XOHKt1q4Uv1k/na1ORU37R/wKufA0yn7Yi
	UXOrSdXcMED3p9+b7WdWuz1zb4B63PolX9fnnKNqbPvzmkmiNi99q/nIwe5lBJtYWNxswJkQcak
	rJ4E9MKqdYiIgDOGL8ll94cjweR+dwxpxtJVTlPcqQZ6VOSAclV15XwddowQ8Bh0+ndXdlYEygy
	C9LYqx9/eHtlvqXeIXKr043KfW1iRXcZQoGNF/kNb4eErslyHuMkUVbNHcj7/uQjg5KFn1LwyOd
	buAI64T0/9kQMihU9/KqHXc1ccY4bvVzRuMY+mp6/XzZwNGUh3XOcYiJ9EMElwLCVDZDlfjOSyH
	6m4auQBCLz1unYDfkGfHwIIierzDPgzwwTnLwV1ttfhUUi5nHL2pDgccMm8HNzA3L7nhVTJz7g6
	N
X-Received: by 2002:a05:6000:4919:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-48e7b21f3c1mr15888370f8f.46.1793650443909;
        Mon, 02 Nov 2026 12:14:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm21471805f8f.43.2026.11.02.12.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:14:03 -0800 (PST)
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
Subject: [PATCH bpf-next v3 2/5] libbpf: Track generated loader link FDs
Date: Mon,  2 Nov 2026 20:13:53 +0000
Message-ID: <20261102201356.5798-3-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102201356.5798-1-mahe.tardy@gmail.com>
References: <20261102201356.5798-1-mahe.tardy@gmail.com>
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

