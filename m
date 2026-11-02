Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648516;
	b=q4su8hGp98fWzMrz/qU3TXME43TtHxNxk7/4e06bRP2nszcojugqsh8A03uF8YV5oal6
	 oQ6h1Sft8f7Xj8WXW01RcPFET5Qn23OptvE4wWBviiWHCqHmjcxe8seFQXNpnY6gH2oz+
	 jXSjddSCoekuM9yMnjictxH9BfAt8cQQt4cfPN8Ekdu4j7xtpGOtCg/YNEm2C4govRG8n
	 frghIgJUZFMRH1jn90lEyX9qy8U6ZJGSA0HQquqN/pudovvZE0PIy8bzRzfwmT+1O/kLi
	 rFLieBI0XPrBWTSPpk7Kl49wdw7+FPgJjeSgowPBDU9tpf4j+h5G/G9jmLsplY8xj6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aG1zfF54TjAWIM+Fb11Hl4krYr3k+Q4kK3YH4SnRIgI=;
	b=o6QbZcZilaommZEm6Q5aw7dY3vra8oacqXMkb79QuCeDGvNctM2UpXWAlOudDu7U7dwx
	 CW8z7HTj/yvvJ1oqluFk4y5qVMBRzCjFRTNR1qi7PNpAijO+TlbT/ViBZxHORpzigBnjj
	 oRhUEsOAAwOMFADTV3JvFQYXoP23QSsGqqRBBVLQsbcfhPecxKRmoEPUYqYDFHMesvN/z
	 5OmRx+u3nbWbdkSYpRNmz0MwSmK57mB+7V+Igaqsqy6PBsEmcVXvR9pByE4V4E8SWYt2s
	 BcUqRh14O3u0SP1zjJ0ESGZ7K7HrrHpnaRqo+OJAhiNhKXzVU9jO4hbBeXHT7cDrkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQ34mpdH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902E606D82B
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A902E606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQ34mpdH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so30656355e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648514; x=1794253314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG1zfF54TjAWIM+Fb11Hl4krYr3k+Q4kK3YH4SnRIgI=;
        b=PQ34mpdHTOjtgBAsnJ1/mIrJuOZWv+xGi7hZlI3AmRdBC8tkLjF4RASWSnlN5KCNCN
         2YV9YwtyIqmXgv2wCSjRAWB42Kb0bQ2H+5aC1QptXX3uK2xZmi12mVYKQ2HNz9k+aBB2
         4UgrPkCo0/IueEHJzTOGLpRckcacZ5+lgDkztAbi7v94ujvnY2zZ/3V22sG8DY4k2+pq
         4pyXS73Ez57gFtQffEn8aBIDwTCebWoVVgXvHJfP5apxvIe4u8/SyPW5Cd0rytnfRXRF
         s4J+N0rRTRw1ncmuc8G5V+k2nFA3ITjwDH0B45+Ie/GHCCPZ3cu04H7y1zNzYB9O9aZq
         DUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648514; x=1794253314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG1zfF54TjAWIM+Fb11Hl4krYr3k+Q4kK3YH4SnRIgI=;
        b=2BzknTk1PV/1fzp0FZnNBDTK5TI8/0g5gP6RhHupQI6PTsf70VyAmugRxSbq2nvoB8
         aiRunO7XOKFcFAYl9upY3VFTezMKTSFEDJmjDgml8RR0UFTowXsysONbihP59O2VnhXb
         lco9VHjs20iWB+sXK5I9pHYgCc6zXZsw5DtFYIN3HYAZyvcLvtFHDT+VmhdKs9GY3T2o
         r/zRIn6xkE6OwTpC9fouj+BLm298FPm4Ui4vFDvQ3ZQBlmbuHFGXgDuGTmMu4ZR+o3ee
         a14RTgKQ07Gbef1gjdfIqzTj+4QRQWi5qciG3jzHGCir7XcHRCvoITiv4QWZ2ubj+sNx
         VDfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ3tQDqHi0PKHHGC6m9tsZxpSx684zBks0cxidHtCQ9Ocp/cljX59FDfPc05N7Pcot5ltKUoC9Xamz6Lskn+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYhHKF/EeMrHrPf3PhF7Ny7CkA4Vy1zfMg/j5+L0nBM+EZZ5yV
	AmpkcQwn51eE3HJt0eqlsqwUs1lE2CR3+dbsVgkbjLUP4WW1IEC/p67P
X-Gm-Gg: AYBFou00+3X8WT8Mahb6vb2jmSzaq0ULuN7AoNltuwEqNQBh2ndQEVgTMdvEVKCro4u
	Vqo87Clcb6/fr/jDeAzblKFeNiL2YHAuvGUAUnxDAwHjBGK3Kyk9A3RC5eZZZ6o5O8QYi3C4Ysf
	LwyCpAflNbww5QqMjXipxaNToT9CxErVOKJQ6ZqovTtulwfq8W78q7nqwRCCWpq1UJA6hxWIcMk
	oaUbS/ksyb5tcU+c6MiacBbMG9iDRoGpchFqMxy2sL/19LUBI8XfUK3DQButuzbugMuiQElfGll
	W+yFppRps0g/WiAIwjdg6oh3DpU3fnE8gjtjdLnCrhU8VLNT8PpHz5bUc3oPJHsw3Z0Q+oxLfLO
	9f0CWQQzfcz0EWCBQmpdj2nU5kKMjsyF5MN3nMmUgURjLc+fP22jaW/WoSIOTBf0SVHNK5Y5TPj
	yRYNgqRP6XD2+rxD3e9xmX4qaXCGjV1ssKHvuIUlCHog6kFJm4EQ8K1EC31VkcxUJqVtxOyFlyD
	FD8p77rGJN8d7zVlKzEDDAkr1UHrzvt4Rg+VZ/g11Hb7ptwc1DnaLdu6mglQpMVn8Q171IFb0rf
	mE3iPFt5G/kBOeLqWElWEnRjAfjuiFc5Mqek3je3KjHDXWEe4lhzIv4ccj04DyqZTCvD95i+QXI
	e
X-Received: by 2002:a05:600c:1c23:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ac180f2addmr293120095e9.32.1793648514037;
        Mon, 02 Nov 2026 11:41:54 -0800 (PST)
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
Subject: [PATCH bpf-next v2 3/5] libbpf: Emit BPF_LINK_CREATE calls in generated loaders
Date: Mon,  2 Nov 2026 19:41:42 +0000
Message-ID: <20261102194145.620210-4-mahe.tardy@gmail.com>
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

Introduce bpf_gen__link_create() which builds the attachment attributes
from the loaded program FD, emits the helper call then save the returned
link FD in its data buffer slot for context output or failure cleanup.

Generate the attachment instruction after program and map init and
before loader finalization. Keep a mapping from dense loaded-program
slots to context output slots so disabled programs do not shift the
returned program FDs relative to their link descriptors.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/bpf_gen_internal.h |  5 ++++
 tools/lib/bpf/gen_loader.c       | 24 +++++++++++++++--
 tools/lib/bpf/libbpf.c           | 44 ++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/bpf_gen_internal.h b/tools/lib/bpf/bpf_gen_internal.h
index b601269abe45..1332094bfd4b 100644
--- a/tools/lib/bpf/bpf_gen_internal.h
+++ b/tools/lib/bpf/bpf_gen_internal.h
@@ -6,6 +6,8 @@
 #include "bpf.h"
 #include "libbpf_internal.h"

+#define MAX_USED_PROGS 32
+
 struct ksym_relo_desc {
 	const char *name;
 	int kind;
@@ -41,6 +43,7 @@ struct bpf_gen {
 	__u32 nr_maps;
 	int link_fds;
 	__u32 nr_link_slots;
+	int prog_output_idx[MAX_USED_PROGS];
 	int log_level;
 	int error;
 	struct ksym_relo_desc *relos;
@@ -75,6 +78,8 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
 			enum bpf_prog_type prog_type, const char *prog_name,
 			const char *license, struct bpf_insn *insns, size_t insn_cnt,
 			struct bpf_prog_load_opts *load_attr, int prog_idx);
+void bpf_gen__link_create(struct bpf_gen *gen, int prog_idx, int link_idx,
+			  enum bpf_attach_type attach_type);
 void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *value, __u32 value_size,
 			      __u64 flags);
 void bpf_gen__map_freeze(struct bpf_gen *gen, int map_idx);
diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 7f41b5a517fe..06d056a326f0 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -16,7 +16,6 @@
 #include "skel_internal.h"

 #define MAX_USED_MAPS	64
-#define MAX_USED_PROGS	32
 #define MAX_KFUNC_DESCS 256
 #define MAX_FD_ARRAY_SZ (MAX_USED_MAPS + MAX_KFUNC_DESCS)

@@ -412,7 +411,8 @@ int bpf_gen__finish(struct bpf_gen *gen, int nr_progs, int nr_maps)
 		move_stack2ctx(gen,
 			       sizeof(struct bpf_loader_ctx) +
 			       sizeof(struct bpf_map_desc) * gen->nr_maps +
-			       sizeof(struct bpf_prog_desc) * i +
+			       sizeof(struct bpf_prog_desc) *
+			       (gen->nr_link_slots ? gen->prog_output_idx[i] : i) +
 			       offsetof(struct bpf_prog_desc, prog_fd), 4,
 			       stack_off(prog_fd[i]));
 	for (i = 0; i < gen->nr_maps; i++)
@@ -1030,6 +1030,26 @@ static void info_blob_bswap(struct bpf_gen *gen, int func_info, int line_info,
 		bpf_core_relo_bswap(cr++);
 }

+void bpf_gen__link_create(struct bpf_gen *gen, int prog_idx, int link_idx,
+			  enum bpf_attach_type attach_type)
+{
+	int attr_size = offsetofend(union bpf_attr, link_create.flags);
+	union bpf_attr attr;
+	int link_create_attr;
+
+	memset(&attr, 0, attr_size);
+	attr.link_create.attach_type = tgt_endian(attach_type);
+	link_create_attr = add_data(gen, &attr, attr_size);
+	move_stack2blob(gen, attr_field(link_create_attr, link_create.prog_fd), 4,
+			stack_off(prog_fd[prog_idx]));
+	emit_sys_bpf(gen, BPF_LINK_CREATE, link_create_attr, attr_size);
+	debug_ret(gen, "link_create prog_idx %d attach_type %u", prog_idx, attach_type);
+	emit_check_err(gen);
+	emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_0, BPF_PSEUDO_MAP_IDX_VALUE,
+					 0, 0, 0, gen->link_fds + link_idx * sizeof(int)));
+	emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_0, BPF_REG_7, 0));
+}
+
 void bpf_gen__prog_load(struct bpf_gen *gen,
 			enum bpf_prog_type prog_type, const char *prog_name,
 			const char *license, struct bpf_insn *insns, size_t insn_cnt,
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index a7cbe7204043..32f041e999c5 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9784,6 +9784,47 @@ static int bpf_object_prepare(struct bpf_object *obj, const char *target_btf_pat
 	return 0;
 }

+static bool bpf_program_supports_gen_attach(const struct bpf_program *prog)
+{
+	switch (prog->type) {
+	case BPF_PROG_TYPE_LSM:
+		return prog->expected_attach_type == BPF_LSM_MAC;
+	case BPF_PROG_TYPE_TRACING:
+		return prog->expected_attach_type == BPF_TRACE_FENTRY ||
+		       prog->expected_attach_type == BPF_TRACE_FEXIT ||
+		       prog->expected_attach_type == BPF_MODIFY_RETURN ||
+		       prog->expected_attach_type == BPF_TRACE_RAW_TP;
+	default:
+		return false;
+	}
+}
+
+static int bpf_object_gen_links(struct bpf_object *obj)
+{
+	struct bpf_program *prog;
+	int prog_idx = -1, link_idx = -1;
+
+	bpf_object__for_each_program(prog, obj) {
+		link_idx++;
+		if (prog->load_strategy != BPF_PROG_LOAD_STRATEGY_AUTO)
+			continue;
+		prog_idx++;
+		obj->gen_loader->prog_output_idx[prog_idx] = link_idx;
+		if (!prog->autoattach)
+			continue;
+		if (!bpf_program_supports_gen_attach(prog)) {
+			pr_warn("prog '%s': loader attachment is not supported for section '%s'\n",
+				prog->name, prog->sec_name);
+			return -EOPNOTSUPP;
+		}
+		bpf_gen__link_create(obj->gen_loader, prog_idx, link_idx,
+				     prog->expected_attach_type);
+		if (obj->gen_loader->error)
+			return obj->gen_loader->error;
+	}
+	return 0;
+}
+
 static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const char *target_btf_path)
 {
 	int err;
@@ -9843,6 +9884,9 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 		/* reset FDs */
 		if (obj->btf)
 			btf__set_fd(obj->btf, -1);
+		if (!err && !obj->gen_loader->error &&
+		    OPTS_GET(obj->gen_loader->opts, gen_attach, false))
+			err = bpf_object_gen_links(obj);
 		if (!err)
 			err = bpf_gen__finish(obj->gen_loader, obj->nr_programs, obj->nr_maps);
 	}
--
2.43.0

