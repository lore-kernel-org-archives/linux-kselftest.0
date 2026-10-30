Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361154;
	b=ZqpMN1WTfmoQPCHvKS1TAKM+Xx3096VKuhqhqLVIxin23Q55+EQ4UFz/wqubMY9je5EL
	 3PaEHGuuRQ4Wob+bSqKdNpcxvtriq2Yp9ox9VjPMS/ObKGoukcZ3Gzhu/AsWZz9rhW69e
	 jdouXGITaNUu9Pr+H063AAamaZ8FltLwONOG8dpkdg/Ua+mySR+eXNnccgGGQewioXEIv
	 m5WlrUvm5F/vSJpIyG8vychjWD/EQAxnjDevgX2VnpMSdupM+mZzwP9DEAdytTuaeXC9D
	 AaEeTNTttK40D7LwOG4L/NdyoOUZIBoatt+ldiIuXsaaNqqQbueBeQJhbltFQqI3jqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xY5ZkndmFMf2LbZXpMfL+ygtVk5Y69eKvZZIjY4DZNo=;
	b=U/Cq8Zwxy+/FXwxqKogLH2p0QBCEZSrJFf9r3roEPGXM1xXVr0YE8+4Cw4EGAp0gYzLe
	 /cRRgPXyAk0r6h1vJrXnhDcpP8Ks/qwUU8xyqcpiF34Uc9bwwm9t9LFV3T9VSvfIs1yD2
	 AhSp/Gf+KFnoinEF7wykCVXUyZsSxjcgoG+/y64KPduDzjjfYFr6XeeZoIFJau1ZwFzVA
	 vWccoe9p1LgBAkZM6ORy6pX9R4ckVYblqj9Q8Rhms4GoDu5RYcGpoXNfM9JQ+PtQu7n8a
	 uDvE/WkCZ8+MXw5BUU1mrZXRbpak9JO3E6TiS5a0qaNCXbutbCr48GPGwyBtdTR+u/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq8RwB6j;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B486606A321
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B486606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq8RwB6j
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-18cdcfc05ffso750388c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361153; x=1793965953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xY5ZkndmFMf2LbZXpMfL+ygtVk5Y69eKvZZIjY4DZNo=;
        b=xq8RwB6jiSpXRmhtYpKXXXCRixxgLlIarUYiUq6Q18fNn+PtVojK2aVJtCVeKntG8m
         nxlMz+UP0+XDFuEgEHHioqrwNdhoEgcSBOtazo6Xt2PTqOilfONZCDXF8+ekSvjW1/V4
         BiEu2ExR3sIZwCt6g6eIzEnNal/hkMcPix7o1fwYFPaSyItK/f5VJJsvPLsfPDygrZQ3
         PtJrbNFEEwvkpzXw3yPQkBrgN0HqHmX/cSPlhvY9Pz272XXbwMEAavwpHjtX0H5MeyfJ
         P3GIHsceguiBn2fGD27ADFpKd6ZUr2xjuAgdnVrrP1wTV8Kgjw/LGUNGZw47Ynk1c4mj
         r7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361153; x=1793965953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY5ZkndmFMf2LbZXpMfL+ygtVk5Y69eKvZZIjY4DZNo=;
        b=K797bCx6a0xIIABgsdWvqxcd4bdgKPujGIrjTgWL9vbAoXO7c0oSCvoZ9e64V5Lt0y
         U9EyxpG5MhN+Jt1fzJmdQwgWNr/QL6JoPwG2lK9lK1qMju8StY7ffYcnzTUfnaIN0jbQ
         0OK93H8pGkILUb01osQJurT1d92Y1rVvLYR458abmnYJCZtwLeBGfdcCuQHYzSf4Slng
         C6C9aqbwytll1qfe+R5Uzbz8rBdSPqZKO88i+fJhg8U1tx0yHjk/sEDsHgmt6Rjw8OTz
         K+0G2/z5xfZ9jL4NpUIfPmJFYWxF1HiDEPXNsDOcsUX52yN4sPk4DIKQ7qWuN7BZY6O6
         j0yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUYkwNUuxEJc37w6eMyKRtArJdqBDDE3ufMS/b9yFvTbeAhVw1OmlpvyW9s3czQ3+YPEeM8FuVyixEvwTLBmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO74wv83JLSmg0HRA9SprD8j1gMPG6ZqpmoA3Yp2qtmkPuVZ5+
	7aZVVdDDLMnQ8wgBXajJ5u8zZcdVC+94JpwWbUjm4NQzm8Rj9jszVk40
X-Gm-Gg: AYBFou3xDnt9CQUQo90XqpgqlgPjPiWkJKzN9KSCW+Bv/85RSUKcMmu7ShYfOqDT5Rg
	Bs0dc8db49655TcVWzyFccgMA2VSZyzbIwQRHJmAWgQ903kPf6mnMHKKxUSXJ4wB6q5U389WYF5
	fTuc6qZTf/42nvnjUOqylu35Qrm/AhwbbqYKBMh/gD1m7IUGp58cX/LX8njL1tfmv4s1UZcbsKB
	MdmlwrF+DThMsSt99KhneW7F3Xt0g3J/5khXS+IufXONbGPyn/OORUGGZDAhDVc6o5m8uEHCpdI
	/lXrMU6U5tuSSvrt/cunIFlmZ4DWbbnmwF/U17f9GTOfXeZ+BkQGoPyyig61mJauf49kkQNRhpD
	gGPv7d+a/RMWBoSdgFxPizIe57vzMJWLwxbuSJVAjMfA+5cy4/B1XU9O8JcE6zjj48tiopB6ppr
	6KAt64VLPM0jYDz/QGEmGbyebG0m/Bxr8xp5AVyhJQq3RzvZQVOCc1EXVEEX/YZg5z4Y0YgILhT
	6u1NnE8LHWtrLysqh0UNW1Z6LtizQrAJyycxjd1wYrzmyNa0bOhzH033yguyHjYttRMUk9gShnO
	Y3AHSH292wpFeryIu8sPAYdX
X-Received: by 2002:a05:701b:2091:20b0:148:bc4a:8356 with SMTP id a92af1059eb24-1ac5d5aae1fmr2848969c88.28.1793361153022;
        Fri, 30 Oct 2026 04:52:33 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:51 -0400
Subject: [PATCH bpf-next v2 06/22] bpf: Drop the constant delta from
 bpf_do_misc_fixups()
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-6-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_do_misc_fixups() counts in delta how far the patches moved the
instruction that it handles, and indexes instructions and aux data
with i + delta.

Nothing changes the program while the loop walks it anymore, so delta
is always 0.

Remove delta and index by i alone.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 76 ++++++++++++++++++++++++++---------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 1d281428acbb3..940265cb80ebf 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2025,7 +2025,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 	struct bpf_insn *insn_buf = env->insn_buf;
 	struct bpf_prog *new_prog;
 	struct bpf_map *map_ptr;
-	int i, ret, cnt, delta = 0, cur_subprog = 0;
+	int i, ret, cnt, cur_subprog = 0;
 	struct bpf_subprog_info *subprogs = env->subprog_info;
 	u16 stack_depth = subprogs[cur_subprog].stack_depth;
 	u16 stack_depth_extra = 0;
@@ -2057,14 +2057,14 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			goto next_insn;
 		}
 
-		if (env->insn_aux_data[i + delta].needs_zext)
+		if (env->insn_aux_data[i].needs_zext)
 			/* Convert BPF_CLASS(insn->code) == BPF_ALU64 to 32-bit ALU */
 			insn->code = BPF_ALU | BPF_OP(insn->code) | BPF_SRC(insn->code);
 
-		if (env->insn_aux_data[i + delta].arena_scalar) {
+		if (env->insn_aux_data[i].arena_scalar) {
 			cnt = arena_scalar_access(insn, insn_buf);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2089,7 +2089,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 
 			cnt = patch - insn_buf;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2176,7 +2176,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = patch - insn_buf;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2202,7 +2202,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			*patch++ = BPF_MOV64_IMM(insn->dst_reg, 0);
 
 			cnt = patch - insn_buf;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2218,7 +2218,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				return -EFAULT;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2233,7 +2233,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			bool issrc, isneg, isimm;
 			u32 off_reg;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (!aux->alu_state ||
 			    aux->alu_state == BPF_ALU_NON_POINTER)
 				goto next_insn;
@@ -2267,7 +2267,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 			cnt = patch - insn_buf;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2304,10 +2304,10 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			 */
 			stack_depth_extra = 16;
 			cnt = may_goto_expand(insn_buf, insn->off,
-					      may_goto_off(env, insn, i + delta),
+					      may_goto_off(env, insn, i),
 					      stack_off_cnt, tail, ARRAY_SIZE(tail));
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2320,10 +2320,10 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 
 			stack_depth_extra = 8;
 			cnt = may_goto_expand(insn_buf, insn->off,
-					      may_goto_off(env, insn, i + delta),
+					      may_goto_off(env, insn, i),
 					      stack_off, tail, ARRAY_SIZE(tail));
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2335,7 +2335,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		     insn->src_reg == BPF_PSEUDO_MAP_IDX_VALUE)) {
 			struct bpf_map *map;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			map = env->used_maps[aux->map_index];
 			if (map->map_type != BPF_MAP_TYPE_PERCPU_ARRAY)
 				goto next_insn;
@@ -2356,7 +2356,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = 2;
 
 			i++;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2367,13 +2367,13 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		if (insn->src_reg == BPF_PSEUDO_CALL)
 			goto next_insn;
 		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
-			ret = bpf_fixup_kfunc_call(env, insn, insn_buf, i + delta, &cnt);
+			ret = bpf_fixup_kfunc_call(env, insn, insn_buf, i, &cnt);
 			if (ret)
 				return ret;
 			if (cnt == 0)
 				goto next_insn;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2414,7 +2414,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn->imm = 0;
 			insn->code = BPF_JMP | BPF_TAIL_CALL;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (env->bpf_capable && !prog->blinding_requested &&
 			    prog->jit_requested &&
 			    !bpf_map_key_poisoned(aux) &&
@@ -2424,7 +2424,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 					.reason = BPF_POKE_REASON_TAIL_CALL,
 					.tail_call.map = aux->map_ptr_state.map_ptr,
 					.tail_call.key = bpf_map_key_immediate(aux),
-					.insn_idx = i + delta,
+					.insn_idx = i,
 				};
 
 				ret = bpf_jit_add_poke_descriptor(prog, &desc);
@@ -2460,13 +2460,13 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 								 map)->index_mask);
 			insn_buf[2] = *insn;
 			cnt = 3;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
-		aux = &env->insn_aux_data[i + delta];
+		aux = &env->insn_aux_data[i];
 		if (aux->arg_prog) {
 			/* The verifier will process callback_fn as many times as necessary
 			 * with different maps and the register states prepared by
@@ -2490,14 +2490,14 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = *insn;
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto patch_call_imm;
 		}
 
 		/* bpf_per_cpu_ptr() and bpf_this_cpu_ptr() */
-		if (env->insn_aux_data[i + delta].call_with_percpu_alloc_ptr) {
+		if (env->insn_aux_data[i].call_with_percpu_alloc_ptr) {
 			/* patch with 'r1 = *(u64 *)(r1 + 0)' since for percpu data,
 			 * bpf_mem_alloc() returns a ptr to the percpu data ptr.
 			 */
@@ -2505,7 +2505,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = *insn;
 			cnt = 2;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto patch_call_imm;
@@ -2525,7 +2525,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		     insn->imm == BPF_FUNC_redirect_map    ||
 		     insn->imm == BPF_FUNC_for_each_map_elem ||
 		     insn->imm == BPF_FUNC_map_lookup_percpu_elem)) {
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (bpf_map_ptr_poisoned(aux))
 				goto patch_call_imm;
 
@@ -2544,7 +2544,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				if (bpf_map_is_percpu_map(map_ptr->map_type))
 					prog->jit_required = true;
 
-				insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+				insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 				if (IS_ERR(insn))
 					return PTR_ERR(insn);
 				goto next_insn;
@@ -2622,7 +2622,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 						  BPF_REG_0, 0);
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2647,7 +2647,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[0] = BPF_ALU32_REG(BPF_XOR, BPF_REG_0, BPF_REG_0);
 			cnt = 1;
 #endif
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2662,7 +2662,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_0, 0);
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2692,7 +2692,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[cnt++] = BPF_JMP_A(1);
 			insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -EINVAL);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2720,7 +2720,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 1;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2742,7 +2742,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 2;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2754,7 +2754,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			/* Load IP address from ctx - 16 */
 			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -16);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, 1);
+			insn = bpf_patch_list_add(env, i, insn_buf, 1);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2806,7 +2806,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[10] = BPF_MOV64_IMM(BPF_REG_0, -ENOENT);
 			cnt = 11;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2820,7 +2820,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = BPF_ATOMIC_OP(BPF_DW, BPF_XCHG, BPF_REG_1, BPF_REG_0, 0);
 			cnt = 2;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2838,7 +2838,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		}
 		insn->imm = BPF_CALL_IMM(fn->func);
 next_insn:
-		if (subprogs[cur_subprog + 1].start == i + delta + 1) {
+		if (subprogs[cur_subprog + 1].start == i + 1) {
 			subprogs[cur_subprog].stack_depth += stack_depth_extra;
 			subprogs[cur_subprog].stack_extra = stack_depth_extra;
 
@@ -2853,7 +2853,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			stack_depth_extra = 0;
 		}
 		i++;
-		insn = &prog->insnsi[i + delta];
+		insn = &prog->insnsi[i];
 	}
 
 	ret = bpf_patch_list_commit(env);

-- 
2.43.0

