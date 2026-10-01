Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC35C4E9C26
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847359; cv=none; b=m+gIC9f4fwNHlCc7bwRGzpD8bQJDo3tAM/EXD+HFJu/oIGExc/uk8/b4oLWjSX/eSiY7kWCToEm/ALhkDO3UmKu6swaJgNjLCvwnnd41QrtKWxu7yXrGst+1qHjEwh52pH5pEsVszCzDrjD5Uk7NmEdrdwtmYaybVy1J33gLjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847359; c=relaxed/simple;
	bh=Kgy8mjKaQwsaLujgR626qRQVqr7rjp6+Bxs20ilUXdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNoJHfhj6FiqOkBhqRYjA26rkomUYBq5sTFlcC4nF5CImZc1hknwGVfpmcesFFwhU36jvnJxwpkMsqnYtAfdWujkBECe+SITGFdf7Jh5TilN/8Ah2wfPnSsvraug7sklb+/ISTPeyEMfUu/N8Owqc5rx4n/o12L7tkYgTI5ejDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPIU5PEP; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPIU5PEP"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so6304116eec.2
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 02:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847355; x=1791452155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrImkYUeX3h8KJrt+U79wLuw4N7shpSrBf/SdU/W3+w=;
        b=jPIU5PEPD+uo28QbY2H59eAS8yqtQZfyR6trytSGGMWvrKe2DAheDpYcg4HK1Dg4hO
         JhZ1uyodHEm3JNhpp6E5F98b0E2U0g7v/7I8OzBDw4zjNzfmwB9YRsJEivHKaELW3wbM
         RHN5M4BhVut4XcoJKGo7dLHAo1Z6ZDrGKn7sSW2DVUdmW28MlhuH9Az0SnlJIui8XD1q
         nAzAvaayoXSK9HqIQ4s+zIOxmqxMQCwCM28CBhnhiffgB1w2ZyB6xpfv5mCkUDBHC11k
         QjiLrgxXcLHMLXbrJwBuPBr1qeRKgFpEDIWHWm2u+YL0h8XahYmMQ/O57+b7AZ8VYmH0
         EEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847355; x=1791452155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrImkYUeX3h8KJrt+U79wLuw4N7shpSrBf/SdU/W3+w=;
        b=ndn5ReR40+jjbyZavpjP7oMOL5g0OVpnndkhHMJBZCWuUocNQws4MjbKDUMEgS33hZ
         4sraaHJoRl95gA2NfnSKoEnPgAxn/U36Ci87GEAtFRPVBVPxTsZI2viwq1ZOH6KRduEX
         vscdj3qYmP5fPctd1YQK1iIZTkH+CpIbHwjyrI4P8n5vyeYpROT6Hp9nngrtXaxHzbUN
         U8rbgoUc8jdyxqd5XDY7Oix1m5jvFZ/62zUg6O2wDd5HbbbJG3/oYZxLUO7XYAj0VERc
         836qM6t8sjiCRIxcUxlGDahtqOQcv+aKuFh6/Jahow9RX1xI1oUFFeTc52/8WaZj56HU
         A48Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiAmICHzRnEp8W4rFsXdnFXs7jUg0QNmdWhQHbXgu8IwH0vqL3bcnOfzupuKF6zLA/d0qXMYi0fhLoC2Jk+1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF8RESr+YGmxJKkp51JXVZpTLXJBZ/q9tgfnvQPqex4CSL9cH+
	aDoKvZqYP5KSeuIv4hYeERInSFRpDDXkUMK1B4/5WSoo7mD5tBMaEyCQ
X-Gm-Gg: AYBFou0omxLAG/px1dJl/3rfedjZAseLxE6UilxWJNtIAc7Iki2LhX1mz9lUHKHHBLa
	BW5d5I8Oi5wGxcfwJpXgETZv7xZYWWJs+LiMAkKNbXqKYhcAV5r12teUPNV2xpdsGo4RAyMRITF
	+MSnENEQShXYCI+r2pHdxa4B6MNPCoaHPQDfVf/623kffw4oRhBBVOvoye60NweGgqZyJLjkQdG
	iJOlu32cC3ndDcDVSfBCWbhEq3wj0dur24b2AGhejJ66EzZxX0twPiAhmb+KXeo5R9MrGBO79aM
	ZTeyH3znw/pZi8NZQzaU0DsEleNQhpqR+jhbcppScmfOnUWm+NFN0wCzH2VjVZexaQrMOom/Ekl
	nh4IzgQWsoeK8IpUP/8tPTOgQH0cIYmFz9ffvb3fCEoeGSgNo5Ydb57J+iboyP3uf20p91Hwug8
	c4+vERDIj25J8ZjqGTLO2k+QrYMiNISWeIpYlsHo/8gq+lSzsyAfGdVid8LiOQMn699w==
X-Received: by 2002:a05:7300:fb17:b0:34b:564d:ea1f with SMTP id 5a478bee46e88-34cdbada3d9mr4212907eec.18.1790847355133;
        Thu, 01 Oct 2026 02:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db37507a7sm6003982eec.13.2026.10.01.02.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:54 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 17:35:34 +0800
Subject: [PATCH bpf-next 3/4] bpf: Drop the constant delta from
 bpf_do_misc_fixups()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bpf-verifier-patch-batch-v1-3-a12df8a09160@gmail.com>
References: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
In-Reply-To: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
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

Nothing changes the program while bpf_do_misc_fixups() walks it anymore,
so delta is always 0 in the loop. Index instructions and aux data by i
alone.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 68 ++++++++++++++++++++++++++---------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 4b96f4ee9b3d8..0e8c61ede9a5b 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2044,7 +2044,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 	struct bpf_insn *insn_buf = env->insn_buf;
 	struct bpf_prog *new_prog;
 	struct bpf_map *map_ptr;
-	int i, ret, cnt, delta = 0, cur_subprog = 0;
+	int i, ret, cnt, cur_subprog = 0;
 	struct bpf_subprog_info *subprogs = env->subprog_info;
 	u16 stack_depth = subprogs[cur_subprog].stack_depth;
 	u16 stack_depth_extra = 0;
@@ -2076,7 +2076,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			goto next_insn;
 		}
 
-		if (env->insn_aux_data[i + delta].needs_zext)
+		if (env->insn_aux_data[i].needs_zext)
 			/* Convert BPF_CLASS(insn->code) == BPF_ALU64 to 32-bit ALU */
 			insn->code = BPF_ALU | BPF_OP(insn->code) | BPF_SRC(insn->code);
 
@@ -2099,7 +2099,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 
 			cnt = patch - insn_buf;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2186,7 +2186,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = patch - insn_buf;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2212,7 +2212,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			*patch++ = BPF_MOV64_IMM(insn->dst_reg, 0);
 
 			cnt = patch - insn_buf;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2228,7 +2228,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				return -EFAULT;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2243,7 +2243,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			bool issrc, isneg, isimm;
 			u32 off_reg;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (!aux->alu_state ||
 			    aux->alu_state == BPF_ALU_NON_POINTER)
 				goto next_insn;
@@ -2277,7 +2277,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 			cnt = patch - insn_buf;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2316,7 +2316,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = may_goto_expand(insn_buf, insn->off, stack_off_cnt,
 					      tail, ARRAY_SIZE(tail));
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2331,7 +2331,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = may_goto_expand(insn_buf, insn->off, stack_off,
 					      tail, ARRAY_SIZE(tail));
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2343,7 +2343,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		     insn->src_reg == BPF_PSEUDO_MAP_IDX_VALUE)) {
 			struct bpf_map *map;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			map = env->used_maps[aux->map_index];
 			if (map->map_type != BPF_MAP_TYPE_PERCPU_ARRAY)
 				goto next_insn;
@@ -2364,7 +2364,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = 2;
 
 			i++;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2375,13 +2375,13 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
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
@@ -2418,7 +2418,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn->imm = 0;
 			insn->code = BPF_JMP | BPF_TAIL_CALL;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (env->bpf_capable && !prog->blinding_requested &&
 			    prog->jit_requested &&
 			    !bpf_map_key_poisoned(aux) &&
@@ -2428,7 +2428,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 					.reason = BPF_POKE_REASON_TAIL_CALL,
 					.tail_call.map = aux->map_ptr_state.map_ptr,
 					.tail_call.key = bpf_map_key_immediate(aux),
-					.insn_idx = i + delta,
+					.insn_idx = i,
 				};
 
 				ret = bpf_jit_add_poke_descriptor(prog, &desc);
@@ -2464,13 +2464,13 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
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
@@ -2494,14 +2494,14 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
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
@@ -2509,7 +2509,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = *insn;
 			cnt = 2;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto patch_call_imm;
@@ -2529,7 +2529,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		     insn->imm == BPF_FUNC_redirect_map    ||
 		     insn->imm == BPF_FUNC_for_each_map_elem ||
 		     insn->imm == BPF_FUNC_map_lookup_percpu_elem)) {
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (bpf_map_ptr_poisoned(aux))
 				goto patch_call_imm;
 
@@ -2548,7 +2548,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				if (bpf_map_is_percpu_map(map_ptr->map_type))
 					prog->jit_required = true;
 
-				insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+				insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 				if (IS_ERR(insn))
 					return PTR_ERR(insn);
 				goto next_insn;
@@ -2626,7 +2626,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 						  BPF_REG_0, 0);
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2651,7 +2651,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[0] = BPF_ALU32_REG(BPF_XOR, BPF_REG_0, BPF_REG_0);
 			cnt = 1;
 #endif
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2666,7 +2666,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_0, 0);
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2696,7 +2696,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[cnt++] = BPF_JMP_A(1);
 			insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -EINVAL);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2724,7 +2724,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 1;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2746,7 +2746,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 2;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2758,7 +2758,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			/* Load IP address from ctx - 16 */
 			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -16);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, 1);
+			insn = bpf_patch_list_add(env, i, insn_buf, 1);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2810,7 +2810,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[10] = BPF_MOV64_IMM(BPF_REG_0, -ENOENT);
 			cnt = 11;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2824,7 +2824,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = BPF_ATOMIC_OP(BPF_DW, BPF_XCHG, BPF_REG_1, BPF_REG_0, 0);
 			cnt = 2;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2842,7 +2842,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		}
 		insn->imm = BPF_CALL_IMM(fn->func);
 next_insn:
-		if (subprogs[cur_subprog + 1].start == i + delta + 1) {
+		if (subprogs[cur_subprog + 1].start == i + 1) {
 			subprogs[cur_subprog].stack_depth += stack_depth_extra;
 			subprogs[cur_subprog].stack_extra = stack_depth_extra;
 
@@ -2857,7 +2857,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			stack_depth_extra = 0;
 		}
 		i++;
-		insn = &prog->insnsi[i + delta];
+		insn = &prog->insnsi[i];
 	}
 
 	ret = bpf_patch_list_commit(env);

-- 
2.43.0

