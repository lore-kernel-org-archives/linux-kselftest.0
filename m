Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641447;
	b=HFhyuhkcI8k6q8RVnkpxFZhScjVt7BgXfbsGpjHGtVBzYcQQpt9DkbG5NJvYIrwMKvn7
	 5NKhtjwL5nXtzid8zHrML8JNQk/inYxAnog+WmDmhI8UAIkWIySWcWLFOpK6Y4isNZq9H
	 bHqNg+bw5kETRKuH5U7ZzMcK+JTyScHJ684xfHU7+AmYhc4HzU0U5TUa0k5N643YDygdi
	 KKB/83y3s6UUnXa56vJutB+tmhCxwScbftnTzAfpHLY3BYgVXUvj2qzu68dPZBU7QSsIr
	 99m8+zLWLuo+BwdbskE8UbV/41aQJmiHeaMX2qppVUnO1V6XXKIGXgTMwMMMbioINlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5rxxH7+cQ5HkS7MFH2Qr+YBYSCyX6MWrvnTbu9hTqUE=;
	b=tc9zViJrJU9GeUmPIiTtoWFtNGoPVDYA8jnHZByWshdmfj7zmTmlcfkLX/3y8QTyn7yY
	 Z7EXuHocvUCwB1XmEgp+c5pqVkHhdkR6vX0YxCLYjKohziI4Q6cjKbS+xHWQkK1g1vPqP
	 5HZIvdShU4FGhnO7SXtPQb51ilYToOIe5Ly1LssZoQ05xnHa+/VyPtW5rQI4wagvbkkSM
	 qk+sHCp/dSzF77xXB/7ak1pbge6Waqwm8IqVleHOGIHdpTXlkrznaBM9Gy5GZllQXMBem
	 b9bzcmyb6F0XwYYv3HyN3FgnW8KhauecsZJZkDS1fD16yxQUL094fSYNDoe9nCaonLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MGzIJ/Eb";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB07D606B1EB
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 17:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB07D606B1EB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGzIJ/Eb
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so34627355e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641445; x=1794246245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rxxH7+cQ5HkS7MFH2Qr+YBYSCyX6MWrvnTbu9hTqUE=;
        b=MGzIJ/EbOe+kRpHMDpywg4y7B2rWkRIpe8S1IhQj2/0WHiS6lgmunAxnZFXXk7pSVk
         lJhbfYHlHUzjSWJ9Fx7oSuZ5LzgU/oecIL5G9Q91d7Z95DeN1bT/lp81f6/ylGxx5/UE
         Y/Tz20FP7lM7mYu7C26jBGEkrCjqpt4nWg5vfLIB0qlRhvja3DIL6pu0k+QXmDBTMKyV
         HF6lDwED6dkSdjMvaumTRH0471R0GFpxlv+VAxqDRIcIp4lFS+eSZ1ovchw4E1A9UK9T
         Yve1pIoF4S5QpS4IFqYtarRumP/pFVINLRWWLSwxIFpMvATdb7tOzWWq1io2XE6Vf/YC
         UiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641445; x=1794246245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rxxH7+cQ5HkS7MFH2Qr+YBYSCyX6MWrvnTbu9hTqUE=;
        b=RByPwUJrrXmQLHKPdMGnZPnI5tdtLp5HSDwAxV9711NJftWDwaY5eutZus1rvql/E8
         rKnJipTWmx0ukSLk3M9Ds4ctakHdLeS3AwknwHsebbQXAXExigJYXrhJyvMI/8JslVJE
         d4eVFLjHxP3sjApZklLq9dL4UVsdjVZm3xPENUBzgvcF94lAl04BjggpXD/XsNavFUeF
         wPtUOQaVZoLYPHpONq2WPF5z3zoxoQgGa/12ZdVmMR1dTwc0i6Oy1eijyKjjuKKYWc/A
         KA101ex/54feImwyo8/Xgc79EdSUdIrrOia3svZCFOnua/gMXvs2koSdwr1cP84gIjPZ
         FXmA==
X-Forwarded-Encrypted: i=1; AKwUvBzR6lfyQJ1G9jtT19n84seV6i+aah8Ah1+mOQoHc5YC57NBy7bqPgjulIwEtBZHhLuZyMeg6njcyXeIA/nRZJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6sLm4pfI5Ua9iWuBeiM637uLTpE/SioUHBhDDfx+EWOcdib6o
	PBUp8vOg441oDZGx7NrQz6+C5Tt3RKn7i4DUQAhhNDTmVMboJPfNOuMk
X-Gm-Gg: AYBFou39OWL6hCkr86TcvP5DEhrs9jKYWo0fozgbi4Rk13fMVuJ+ZOV7qp/5+edq88g
	M0EdUdEbOuFN5mc2J7sWgMEwJScqMz+tHVrTChSWuJx8c3KD9xB0Uab/27vI+ehFBWtf6dzxbRU
	o5pPscZf6fgfRjhtZHeSd63VFCnBc+UF15XLwGl01GFbdaLFyFQc7yTpXuSia2l1sDL0grLyXEX
	HYkAcq9oVVVV4VkXGGN4fTWNUrYt3KTWLPUFLsov7j5/kZqTMN0UbNjdY+HXL647aVMhqd7Pnrk
	WcrcLEMbJ53MmPsEu487qaEHjzoDawstlNCq5IAhnJt8Lepl97sURY4aQE3pNKAjAnxKRPyBT04
	pIMO9m+ULJ48XwRmgmDvq2ojfs/WaJK+aXKvqkAZR/4xeeENYmXtGKUbISlBJe0LGnjMIQ84PI+
	v1yy/yn4l0x3IGWjBD9yqsDOAgomSYhWQz8tOmvQjoVuZ1ordAa98VPW+RsKd6augv9uCExdF41
	HjJoEZ4WUKt/M+H8XyZcyvqjRHo28RhcrrWVN0c85K0QPBTdTq8UPhCOngXuPWxcABAIcVeY1Yt
	Ulicux+5FOajihXvdYYZD6EdQ5RTn5YXA5YWi4hq4HhPf1s/FiD2xrBpI4us6tfDDITxjzKbBkh
	CCA==
X-Received: by 2002:a05:600c:c48e:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ac16bc47f8mr249490135e9.11.1793641445310;
        Mon, 02 Nov 2026 09:44:05 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm196311865e9.1.2026.11.02.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:04 -0800 (PST)
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
Subject: [PATCH bpf-next 2/5] libbpf: Track generated loader link FDs
Date: Mon,  2 Nov 2026 17:43:47 +0000
Message-ID: <20261102174350.472592-3-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102174350.472592-1-mahe.tardy@gmail.com>
References: <20261102174350.472592-1-mahe.tardy@gmail.com>
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
index 80a6b5306183..17690cbd299b 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -127,6 +127,10 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 		gen->error = -E2BIG;
 		return;
 	}
+	if (OPTS_GET(gen->opts, gen_attach, false)) {
+		gen->link_fds = add_data(gen, NULL, nr_progs * sizeof(int));
+		gen->nr_link_slots = nr_progs;
+	}
 	if (nr_maps + max_func_ptr_maps > MAX_USED_MAPS) {
 		pr_warn("Total maps exceeds %d\n", MAX_USED_MAPS);
 		gen->error = -E2BIG;
@@ -153,10 +157,14 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
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
@@ -416,6 +424,13 @@ int bpf_gen__finish(struct bpf_gen *gen, int nr_progs, int nr_maps)
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
index 03f794f4adb0..f7759cc15a54 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -1953,9 +1953,10 @@ struct gen_loader_opts {
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

