Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996421;
	b=nVWnxdg2n4wphVSyE9q3IEdvFUHCVWcNV5U71lYXulQ2Myd39Y7PM51uF5OkDG4AA01v
	 fUU0SJk0qAixYVyrfrp/KpS6ddoZXMxbBfQoAmUz2vi9fKypxqmrR/U7HPyCMGSsBu8dT
	 h4hT44A04zijINsHTFRdbNSP+VaPmk3ONxJcyxqnnPKMYryWPl+zCSUsVtUlxTcIFa0Eq
	 RSiyAfzsyIQ7nErLrKTV8uPCdPvXEOI5wbSpr7nCPQyXMceFjzjV4Pb4F+eiq99PfNQH7
	 5l/tHcellGR1yYA9B4KS4W9lp8+eRT4qiRKX1lk74bYGp7pVh4DXFaTuQ4HXx1vnUOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1hzY0cw9BMWvTkyeBTub5Gg24VJsRlhF2Jm/5qSvDcw=;
	b=LFuJ1kRmkVAFl4+AvX/w80WQm74deZeuET10PcUk1MJgMA8s+9BE7Kb3qoTRoqzotaJL
	 2v/VJUj8JutELHpY1Whn+PdJ9TkaqkiFiKFPW46Z/By8NNa9mVxJwJnI3dLsE4L22cJDR
	 UHFTKxwI/6hFzFtZyUBgUe+aHYMg/g3TNgAo4Wyr5/xtWduKrgpt1nm3tsG3VFzyZP9JG
	 RVDn2OlEwKos67o6D8/KazIAKM6QndCUGpbzcoMgrWkT5XFzLa/7+X7XYD7z1dzEx0ICU
	 Lps5zhb7DDs6EIWVkfRwlGzwBP0gQ9sgzeFYeM++CwTDx9Pzo+i1meBb/xwqet0qBYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S50j6rFO;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF351606D80D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 20:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF351606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S50j6rFO
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb155f3229so641887a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793996415; x=1794601215; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hzY0cw9BMWvTkyeBTub5Gg24VJsRlhF2Jm/5qSvDcw=;
        b=S50j6rFOKABKg8QjzJdY4Fcjzg2u7eml9qDESED1kumnHCljRSAKM0ss/dEBhbtzhN
         A/H5roAo4TuUumBVUSwv/ZLF/j9UDTe/HpQ9fGXzV24LGXFLlaNH28MAFnd6kMykdWs9
         G05A9wG1O2Jv93d5s25kMNhPozLXu4Q4M9MCkluqUrLP7NXXHpZy5JdH+3bjHM4nHX3b
         Cu+ZF+OmytePj9bJ4XnIMrJjqe2zA4XGT5CBfELCsqMZXzdn+YV9UHBesvo/0xg5KuO4
         1VZBoYHMXAEeF4wreQwQWy1vhjHq7FHl6M/PT58BKA3nIovh5XuBlTBHFxIr1GSWNoHA
         cYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996415; x=1794601215;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hzY0cw9BMWvTkyeBTub5Gg24VJsRlhF2Jm/5qSvDcw=;
        b=kpOW3sKY3Ip+A9gWXRNwBFGPyPeAQxnA/imDcXasuRkPYphNPHLQNIlv7x4lx7iFQ3
         rVmkCp3ujSJzOCyIJ1WtmhlYW7EVVzZaXXGUkm5rQ3VEwvYA2qBv60JsTJ72UPVtW6zb
         +KnPZCVxBUWf7YkQ0T7rwO3eHJFPNp7Wp+vOvT9lGItEyFqtN+ifO5wmE451/CIy2afN
         poBnXb7gTo8EKbMuzEL9XoV3j3iRDbcLnBtBvbs40WB+rIQqc5J6oD/+nA6smvDuniW8
         FYBzvywWBrgj83jvHDMXndpGFPaB7J/P62aBry1MwoesPQppCeajCCFTJWVcISm5723Q
         WopA==
X-Forwarded-Encrypted: i=1; AL+hErG4RveGgwKiqEONjeMfH6Z2oDQb+dTj1Gj3dZn6+KblqprJ6PhHBj5Y3ljIbwpiUAYZ2IKZgyO3miCHrEVZu4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w9WlXNYLZO1gqJmpnC2P3mGSCn3uTFK/jit75Gm/90ouuYH/x
	o4nzWhF8YbUN/xSFD1vM4n8w9SLItnMDBnykq9zHXEvhklTyw84itpDSzuEX+fxkUfMgU+TqGmd
	y2jTj9ox1kK6f0z4kWg==
X-Received: from pjbse12.prod.google.com ([2002:a17:90b:518c:b0:3ac:3bb4:e960])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d4d:b0:3ad:50ef:f5ff with SMTP id 98e67ed59e1d1-3b0db6fdec5mr3753116a91.37.1793996414768;
 Fri, 06 Nov 2026 12:20:14 -0800 (PST)
Date: Fri, 06 Nov 2026 20:19:50 +0000
In-Reply-To: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261106-lskel-struct-ops-v1-3-a4486ffc79cb@google.com>
Subject: [PATCH RFC bpf-next 3/7] libbpf: Support BPF_MAP_TYPE_STRUCT_OPS in bpf_gen__map_create()
From: Siddharth Nayyar <sidnayyar@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, "=?utf-8?q?Thi=C3=A9baud_Weksteen?=" <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>, Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="utf-8"

Handle BPF_MAP_TYPE_STRUCT_OPS in bpf_gen__map_create() when generating
a light skeleton:
- Extend map_create_attr size to include value_type_btf_obj_fd.
- Populate attr.btf_fd from the loader stack when
  btf_vmlinux_value_type_id is set.
- Populate attr.value_size and attr.btf_vmlinux_value_type_id from the
  runtime-resolved values in the loader data blob.
- If the struct_ops type resides in a kernel module (btf_obj_fd > 0),
  populate attr.value_type_btf_obj_fd, set BPF_F_VTYPE_BTF_OBJ_FD in
  attr.map_flags, and close value_type_btf_obj_fd after BPF_MAP_CREATE.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 tools/lib/bpf/gen_loader.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 09713c39f71e..6027a2762c35 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -508,7 +508,7 @@ void bpf_gen__map_create(struct bpf_gen *gen,
 			 __u32 key_size, __u32 value_size, __u32 max_entries,
 			 struct bpf_map_create_opts *map_attr, int map_idx)
 {
-	int attr_size = offsetofend(union bpf_attr, map_extra);
+	int attr_size = offsetofend(union bpf_attr, value_type_btf_obj_fd);
 	bool close_inner_map_fd = false;
 	int map_create_attr, idx;
 	union bpf_attr attr;
@@ -532,7 +532,7 @@ void bpf_gen__map_create(struct bpf_gen *gen,
 		 map_name, map_idx, map_type, map_attr->btf_value_type_id,
 		 map_create_attr, attr_size);
 
-	if (map_attr->btf_value_type_id)
+	if (map_attr->btf_value_type_id || map_attr->btf_vmlinux_value_type_id)
 		/* populate union bpf_attr with btf_fd saved in the stack earlier */
 		move_stack2blob(gen, attr_field(map_create_attr, btf_fd), 4,
 				stack_off(btf_fd));
@@ -543,6 +543,27 @@ void bpf_gen__map_create(struct bpf_gen *gen,
 				stack_off(inner_map_fd));
 		close_inner_map_fd = true;
 		break;
+	case BPF_MAP_TYPE_STRUCT_OPS:
+		move_blob2blob(gen, attr_field(map_create_attr, value_size), 4,
+			       value_size);
+		emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_1, BPF_PSEUDO_MAP_IDX_VALUE,
+						 0, 0, 0, map_attr->btf_vmlinux_value_type_id));
+		emit(gen, BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, 0));
+		emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_1, BPF_PSEUDO_MAP_IDX_VALUE,
+						 0, 0, 0, map_create_attr));
+		emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+				      offsetof(union bpf_attr, btf_vmlinux_value_type_id)));
+		emit(gen, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+		emit(gen, BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 4));
+		emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+				      offsetof(union bpf_attr, value_type_btf_obj_fd)));
+		emit(gen, BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+				      offsetof(union bpf_attr, map_flags)));
+		emit(gen, BPF_ALU32_IMM(BPF_OR, BPF_REG_0,
+					tgt_endian(BPF_F_VTYPE_BTF_OBJ_FD)));
+		emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_0,
+				      offsetof(union bpf_attr, map_flags)));
+		break;
 	default:
 		break;
 	}
@@ -568,6 +589,9 @@ void bpf_gen__map_create(struct bpf_gen *gen,
 	debug_ret(gen, "map_create %s idx %d type %d value_size %d value_btf_id %d",
 		  map_name, map_idx, map_type, value_size,
 		  map_attr->btf_value_type_id);
+	if (map_type == BPF_MAP_TYPE_STRUCT_OPS)
+		emit_sys_close_blob(gen,
+				    attr_field(map_create_attr, value_type_btf_obj_fd));
 	emit_check_err(gen);
 	/* remember map_fd in the stack, if successful */
 	if (map_idx < 0) {

-- 
2.56.0.455.g6c5a503b38-goog

