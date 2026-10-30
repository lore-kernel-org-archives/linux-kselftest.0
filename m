Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361236;
	b=ruY6hm37mmu1q4WDdZb5BUsWTav+i7H0f6QstNIhult2hB8MeJ01aBqcuNFEdHMRgiaQ
	 OEVv7WCfHR6toFE6bafMypTRPpGNhFe4bP3YXdLze9P78GXyONbLUdYdzVrD6TND6ROhR
	 PYSn4BSWLK6CfLqYeVqFvlCpguVo2/PkexYy9amzbozG5ESnpiiNe9gxTnkQhFum2kqDF
	 zJsRUq6w7Dh1K8jnhwSj5R/gMf9pUX7rLdlVURK4OZlFer1rO3uFQ5KBMSxetArvgp171
	 WsPcdeyZvXBxo5Q3i6Qltp0P7jB9TheTqhiYFHnjqDe1h4Au6bTlfJDMNQR8aVF3dHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iA4hjGR+jL2lqMgI5v3Edbdzi0BELoyEEm3FUVq/yMg=;
	b=TLZWghDKjtp/atKDkKTfhSA2esMrZqROafsQx6yp1bDIBakVtW2SFdS1sQ1+u5mWncrp
	 iBsQRnq6F3F5VxK45QkA6rnLjVbsLojOK6i3PnF9c6SNrFx9saiUhwqPEf+r0Eqsyz4+t
	 o+2WQ6gpFhZnRAMiQIa7cxTOIuebe1by6H/Fi7frp2rscSzFcsb0ESNMI/0yre2Dl+lbl
	 szDcrRB1sJgsMVU11MvZKkLb2+IN9dz5INxRKokyquuuEN77ZF8Q4hEwdW085vbHgd24b
	 aMwN2xaLwb3UzYukm21j1yKz13gvDNCjQFnTt3dzefo+vGenXQ5LAt+y5sHoXuIle2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXf6yeP9;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22A60A2601
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C22A60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXf6yeP9
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so45592c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361235; x=1793966035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iA4hjGR+jL2lqMgI5v3Edbdzi0BELoyEEm3FUVq/yMg=;
        b=SXf6yeP93/KhzZcfN1BM+4AbY9CQ4HWg8FAiQH152sxehb75npCE7UrPsbKYzjQmcC
         pxtdKsod2M3pWOrUPlv8tTAQieQuV0I0onNZn5EDRAMWrgiZqMULtvXZrQG1n5lWmWyH
         7QAOV0+3g6wuRNbPDbS8P0SrmPlgoFFBcpxYdVxnZB1XYTZCVqPipNf/VvjAZQXXghsJ
         Veefjc1H9Je1Y+SNd8PjJygcdeAK+m7Kq3MVRhni8faiXtyeOpA6+kJFrlK16Din3WFZ
         yx2u0nSH54F6FCmuGKL9idh8fXFNxOQVxtesCbO8jvq3FR0KOmposoHAn3w2BC5gfegu
         FMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361235; x=1793966035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4hjGR+jL2lqMgI5v3Edbdzi0BELoyEEm3FUVq/yMg=;
        b=nXiE7cY2kjfl3yQYbbs8/Ldu7xyJNKTBWEcVFqZAtrUk8NXfsbuyoq+VJLGnwcpxfX
         KVSEeoKGhVhLd/EQ97OEmOicSDcVbwEvhlbrOCNuP/T+naZ+enQkM3g7io2GMa/wxHnh
         7RqdbF1Pig5aSbC9SZ+DBvDbaTJ8AYuRC3+KnCNa2OICPwiDDdLji3YuCdDF3Y9ESXGC
         7A7AyDln8obwStnGAfUEN6ugqVxSdfK2+WYSEzRTayK/A0cOR74IzZIhDss97Yo6GzNP
         08g8VO4jcxJpMd9czRzMw+g4jmWHBwjuFeTN18wqVaq44YEcB+scaNm+LE5Zb3EbmG6w
         5ylw==
X-Forwarded-Encrypted: i=1; AKwUvByOVi07d6SdtH0EEFrErxtM6OBm5DI1D1QTKpAfpr1J87bfsM8ksMQt9lsa4liGzZj1Wm+XqMBF5HBDdiKQkl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ/4fKPVzABLL07AuigKMtIx2DT+F6DEjjz+O1L+zj+jgr41EH
	Z1tgQprIJYZ+LW/Ned4gCi6ZuPM/yUYbD/4l7IgJUqcIN64Lq7GZBNvg
X-Gm-Gg: AYBFou2eiLK5oGlYoyPxKKikP7DRg1hEPzWG0vqEUPbswFXZgtBxeef5zTdazomKtgc
	c4zzcJWVb6jNDmhSn4IcNTuPzMJ+lnveUQjYoGy20mynqWLiSqfUnkvcz6PIDQygHNFSPkwoRqN
	NQvhhKrJtrLSqIurBjiR4la1+dqfhKq7Ty/uFCElAHme3rOCetGGukJF25wFC1oMb2rrgCTJzvf
	ENlhLcELpcVnkTKobr3I3cx2PkcCaKQ99ktMWpbS8nz5T8Q7OmRsrabjK7vVFRcUz78VCo7vmoe
	H4anHyqVJ70Ec6tmnHv2bN6pLYkTdfLR0r2k89jswIx/VTLzxFU90NiX3aRhNywO43bz2Dag3Ov
	ix/w7iPDCoskpZZWn/D9vcaMzFHXefOd5wpfzcfybgUIzQeIUMCFJmjojwFiCAtT81XpqgP0RX4
	v8eq0MrpmnTITgcP3O0oCKwHQ8Db+DwYJ2PRZiU2/9WLm0B9uaImPF1WvvYP6SEONUPKATQ1GhB
	AgS+FK7BY6ZDDN13s+kXBoWgpUoR7JU6Zf7Ww0uHfXm1+0jMG/BGN7mplz8HhEaqot1JNPlZOcV
	pZNGMAO2a5juroJfdz84BSw1FQ==
X-Received: by 2002:a05:7022:108c:b0:163:c5eb:d42f with SMTP id a92af1059eb24-1ac574551afmr2732413c88.5.1793361234777;
        Fri, 30 Oct 2026 04:53:54 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:54 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:05 -0400
Subject: [PATCH bpf-next v2 20/22] bpf: Remove the old instruction patching
 code
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-20-55cd43439f7c@gmail.com>
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

bpf_patch_insn_data() and bpf_patch_insn_single() patch the program
right away, with helpers that adjust the branches, line info, aux data,
subprogs, function pointers and instruction arrays after each patch.
bpf_remove_insns() and the helpers that adjust function pointers and
instruction arrays do the same for removed instructions.

Every pass goes through the patch list now, so none of this code has
any users left.

Remove bpf_patch_insn_data(), bpf_patch_insn_single(),
bpf_remove_insns() and their helpers, and update the comment of
bpf_rewrite_must_abort(), whose callers only queue patches now.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h          |   2 -
 include/linux/bpf_verifier.h |   2 -
 include/linux/filter.h       |  16 ----
 kernel/bpf/bpf_insn_array.c  |  34 --------
 kernel/bpf/core.c            | 193 ------------------------------------------
 kernel/bpf/fixups.c          | 194 +++----------------------------------------
 kernel/bpf/verifier.c        |  45 ----------
 7 files changed, 13 insertions(+), 473 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index bc8db33ceac32..63f86e2eec8b7 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -4376,8 +4376,6 @@ struct bpf_prog *bpf_prog_find_from_stack(void);
 int bpf_insn_array_init(struct bpf_map *map, const struct bpf_prog *prog);
 int bpf_insn_array_ready(struct bpf_map *map);
 void bpf_insn_array_release(struct bpf_map *map);
-void bpf_insn_array_adjust(struct bpf_map *map, u32 first, u32 len);
-void bpf_insn_array_adjust_after_remove(struct bpf_map *map, u32 off, u32 len);
 void bpf_insn_array_remap(struct bpf_map *map, const u32 *new_off, const u32 *new_tgt,
 			  u32 cnt, s32 grow);
 
diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index cf93d473e4f0c..9c9397dcdf15e 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1591,8 +1591,6 @@ struct bpf_func_ptr *bpf_map_func_ptrs(struct bpf_verifier_env *env,
 struct bpf_func_ptr *bpf_map_range_func_ptrs(struct bpf_verifier_env *env,
 					     const struct bpf_map *map,
 					     u64 off, u64 size, u32 *cnt);
-void bpf_adjust_func_ptrs(struct bpf_verifier_env *env, u32 off, u32 len);
-void bpf_adjust_func_ptrs_after_remove(struct bpf_verifier_env *env, u32 off, u32 len);
 int bpf_map_direct_read(struct bpf_map *map, int off, int size, u64 *val,
 			bool is_ldsx);
 
diff --git a/include/linux/filter.h b/include/linux/filter.h
index e0218e677a1dc..75545657b5c62 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -1339,22 +1339,6 @@ static inline bool bpf_dump_raw_ok(const struct cred *cred)
 	return kallsyms_show_value(cred);
 }
 
-struct bpf_prog *bpf_patch_insn_single(struct bpf_prog *prog, u32 off,
-				       const struct bpf_insn *patch, u32 len);
-
-#ifdef CONFIG_BPF_SYSCALL
-struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
-				     const struct bpf_insn *patch, u32 len);
-#else
-static inline struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
-						   const struct bpf_insn *patch, u32 len)
-{
-	return ERR_PTR(-ENOTSUPP);
-}
-#endif /* CONFIG_BPF_SYSCALL */
-
-int bpf_remove_insns(struct bpf_prog *prog, u32 off, u32 cnt);
-
 static inline bool xdp_return_frame_no_direct(void)
 {
 	struct bpf_redirect_info *ri = bpf_net_ctx_get_ri();
diff --git a/kernel/bpf/bpf_insn_array.c b/kernel/bpf/bpf_insn_array.c
index cf67315be0359..5e5fe574f460e 100644
--- a/kernel/bpf/bpf_insn_array.c
+++ b/kernel/bpf/bpf_insn_array.c
@@ -236,23 +236,6 @@ void bpf_insn_array_release(struct bpf_map *map)
 	atomic_set_release(&insn_array->used, 0);
 }
 
-void bpf_insn_array_adjust(struct bpf_map *map, u32 first, u32 len)
-{
-	struct bpf_insn_array *insn_array = cast_insn_array(map);
-	int i;
-
-	if (len <= 1)
-		return;
-
-	for (i = 0; i < map->max_entries; i++) {
-		if (insn_array->values[i].xlated_off < first)
-			continue;
-		if (insn_array->values[i].xlated_off == INSN_DELETED)
-			continue;
-		insn_array->values[i].xlated_off += len - 1;
-	}
-}
-
 /*
  * Move each offset to new_tgt[offset], new_off[] and new_tgt[] cover [0, cnt].
  * An insn is removed when new_off[] maps it to the same offset as the next
@@ -276,23 +259,6 @@ void bpf_insn_array_remap(struct bpf_map *map, const u32 *new_off, const u32 *ne
 	}
 }
 
-void bpf_insn_array_adjust_after_remove(struct bpf_map *map, u32 off, u32 len)
-{
-	struct bpf_insn_array *insn_array = cast_insn_array(map);
-	int i;
-
-	for (i = 0; i < map->max_entries; i++) {
-		if (insn_array->values[i].xlated_off < off)
-			continue;
-		if (insn_array->values[i].xlated_off == INSN_DELETED)
-			continue;
-		if (insn_array->values[i].xlated_off < off + len)
-			insn_array->values[i].xlated_off = INSN_DELETED;
-		else
-			insn_array->values[i].xlated_off -= len;
-	}
-}
-
 /*
  * This function is called by JITs. The image is the real program
  * image, the offsets array set up the xlated -> jitted mapping.
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 7d58c47b73f07..c787f8c4154c7 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -338,199 +338,6 @@ int bpf_prog_calc_tag(struct bpf_prog *fp)
 	return 0;
 }
 
-static int bpf_adj_delta_to_imm(struct bpf_insn *insn, u32 pos, s32 end_old,
-				s32 end_new, s32 curr, const bool probe_pass)
-{
-	const s64 imm_min = S32_MIN, imm_max = S32_MAX;
-	s32 delta = end_new - end_old;
-	s64 imm = insn->imm;
-
-	if (curr < pos && curr + imm + 1 >= end_old)
-		imm += delta;
-	else if (curr >= end_new && curr + imm + 1 < end_new)
-		imm -= delta;
-	if (imm < imm_min || imm > imm_max)
-		return -ERANGE;
-	if (!probe_pass)
-		insn->imm = imm;
-	return 0;
-}
-
-static int bpf_adj_delta_to_off(struct bpf_insn *insn, u32 pos, s32 end_old,
-				s32 end_new, s32 curr, const bool probe_pass)
-{
-	s64 off_min, off_max, off;
-	s32 delta = end_new - end_old;
-
-	if (insn->code == (BPF_JMP32 | BPF_JA)) {
-		off = insn->imm;
-		off_min = S32_MIN;
-		off_max = S32_MAX;
-	} else {
-		off = insn->off;
-		off_min = S16_MIN;
-		off_max = S16_MAX;
-	}
-
-	if (curr < pos && curr + off + 1 >= end_old)
-		off += delta;
-	else if (curr >= end_new && curr + off + 1 < end_new)
-		off -= delta;
-	if (off < off_min || off > off_max)
-		return -ERANGE;
-	if (!probe_pass) {
-		if (insn->code == (BPF_JMP32 | BPF_JA))
-			insn->imm = off;
-		else
-			insn->off = off;
-	}
-	return 0;
-}
-
-static int bpf_adj_branches(struct bpf_prog *prog, u32 pos, s32 end_old,
-			    s32 end_new, const bool probe_pass)
-{
-	u32 i, insn_cnt = prog->len + (probe_pass ? end_new - end_old : 0);
-	struct bpf_insn *insn = prog->insnsi;
-	int ret = 0;
-
-	for (i = 0; i < insn_cnt; i++, insn++) {
-		u8 code;
-
-		/* In the probing pass we still operate on the original,
-		 * unpatched image in order to check overflows before we
-		 * do any other adjustments. Therefore skip the patchlet.
-		 */
-		if (probe_pass && i == pos) {
-			i = end_new;
-			insn = prog->insnsi + end_old;
-		}
-		if (bpf_pseudo_func(insn)) {
-			ret = bpf_adj_delta_to_imm(insn, pos, end_old,
-						   end_new, i, probe_pass);
-			if (ret)
-				return ret;
-			continue;
-		}
-		code = insn->code;
-		if ((BPF_CLASS(code) != BPF_JMP &&
-		     BPF_CLASS(code) != BPF_JMP32) ||
-		    BPF_OP(code) == BPF_EXIT)
-			continue;
-		/* Adjust offset of jmps if we cross patch boundaries. */
-		if (BPF_OP(code) == BPF_CALL) {
-			if (insn->src_reg != BPF_PSEUDO_CALL)
-				continue;
-			ret = bpf_adj_delta_to_imm(insn, pos, end_old,
-						   end_new, i, probe_pass);
-		} else {
-			ret = bpf_adj_delta_to_off(insn, pos, end_old,
-						   end_new, i, probe_pass);
-		}
-		if (ret)
-			break;
-	}
-
-	return ret;
-}
-
-static void bpf_adj_linfo(struct bpf_prog *prog, u32 off, u32 delta)
-{
-	struct bpf_line_info *linfo;
-	u32 i, nr_linfo;
-
-	nr_linfo = prog->aux->nr_linfo;
-	if (!nr_linfo || !delta)
-		return;
-
-	linfo = prog->aux->linfo;
-
-	for (i = 0; i < nr_linfo; i++)
-		if (off < linfo[i].insn_off)
-			break;
-
-	/* Push all off < linfo[i].insn_off by delta */
-	for (; i < nr_linfo; i++)
-		linfo[i].insn_off += delta;
-}
-
-struct bpf_prog *bpf_patch_insn_single(struct bpf_prog *prog, u32 off,
-				       const struct bpf_insn *patch, u32 len)
-{
-	u32 insn_adj_cnt, insn_rest, insn_delta = len - 1;
-	const u32 cnt_max = S16_MAX;
-	struct bpf_prog *prog_adj;
-	int err;
-
-	/* Since our patchlet doesn't expand the image, we're done. */
-	if (insn_delta == 0) {
-		memcpy(prog->insnsi + off, patch, sizeof(*patch));
-		return prog;
-	}
-
-	insn_adj_cnt = prog->len + insn_delta;
-
-	/* Reject anything that would potentially let the insn->off
-	 * target overflow when we have excessive program expansions.
-	 * We need to probe here before we do any reallocation where
-	 * we afterwards may not fail anymore.
-	 */
-	if (insn_adj_cnt > cnt_max &&
-	    (err = bpf_adj_branches(prog, off, off + 1, off + len, true)))
-		return ERR_PTR(err);
-
-	/* Several new instructions need to be inserted. Make room
-	 * for them. Likely, there's no need for a new allocation as
-	 * last page could have large enough tailroom.
-	 */
-	prog_adj = bpf_prog_realloc(prog, bpf_prog_size(insn_adj_cnt),
-				    GFP_USER);
-	if (!prog_adj)
-		return ERR_PTR(-ENOMEM);
-
-	prog_adj->len = insn_adj_cnt;
-
-	/* Patching happens in 3 steps:
-	 *
-	 * 1) Move over tail of insnsi from next instruction onwards,
-	 *    so we can patch the single target insn with one or more
-	 *    new ones (patching is always from 1 to n insns, n > 0).
-	 * 2) Inject new instructions at the target location.
-	 * 3) Adjust branch offsets if necessary.
-	 */
-	insn_rest = insn_adj_cnt - off - len;
-
-	memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
-		sizeof(*patch) * insn_rest);
-	memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
-
-	/* We are guaranteed to not fail at this point, otherwise
-	 * the ship has sailed to reverse to the original state. An
-	 * overflow cannot happen at this point.
-	 */
-	BUG_ON(bpf_adj_branches(prog_adj, off, off + 1, off + len, false));
-
-	bpf_adj_linfo(prog_adj, off, insn_delta);
-
-	return prog_adj;
-}
-
-int bpf_remove_insns(struct bpf_prog *prog, u32 off, u32 cnt)
-{
-	int err;
-
-	/* Branch offsets can't overflow when program is shrinking, no need
-	 * to call bpf_adj_branches(..., true) here
-	 */
-	memmove(prog->insnsi + off, prog->insnsi + off + cnt,
-		sizeof(struct bpf_insn) * (prog->len - off - cnt));
-	prog->len -= cnt;
-
-	err = bpf_adj_branches(prog, off, off + cnt, off, false);
-	WARN_ON_ONCE(err);
-	return err;
-}
-
 static int patch_list_reserve_patch(struct bpf_patch_list *pl)
 {
 	struct bpf_insn_patch *p;
diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 217771aca0161..a442188647bc7 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -190,132 +190,10 @@ static int get_callee_stack_depth(struct bpf_verifier_env *env,
 }
 #endif
 
-enum bpf_patch_mode {
-	BPF_PATCH_KEEP_TARGET,	/* targets of 'off' keep naming 'off', the first new insn */
-	BPF_PATCH_MOVE_TARGET,	/* targets of 'off' follow the original insn to 'off + len - 1' */
-};
-
-/* single env->prog->insni[off] instruction was replaced with the range
- * insni[off, off + cnt).  Adjust corresponding insn_aux_data by copying
- * [0, off) and [off, end) to new locations, so the patched range stays zero
- */
-static void adjust_insn_aux_data(struct bpf_verifier_env *env,
-				 struct bpf_prog *new_prog, u32 off, u32 cnt,
-				 struct bpf_insn *original_insn,
-				 enum bpf_patch_mode mode)
-{
-	struct bpf_insn_aux_data *data = env->insn_aux_data;
-	struct bpf_insn *insn = new_prog->insnsi;
-	u32 old_seen = data[off].seen;
-	u32 prog_len;
-	int i;
-
-	/* aux info at OFF always needs adjustment, no matter fast path
-	 * (cnt == 1) is taken or not. There is no guarantee INSN at OFF is the
-	 * original insn at old prog.
-	 */
-	data[off].zext_dst = bpf_insn_def32(new_prog, insn + off + cnt - 1) >= 0;
-
-	if (cnt == 1) {
-		/*
-		 * A non-memory accessing insn could have been replaced by a
-		 * memory accessing insn, systematically mark it for non-stack
-		 * access
-		 */
-		data[off].non_stack_access = bpf_is_mem_insn(insn + off);
-		return;
-	}
-	prog_len = new_prog->len;
-	env->insn_aux_data_len = prog_len;
-
-	memmove(data + off + cnt - 1, data + off,
-		sizeof(struct bpf_insn_aux_data) * (prog_len - off - cnt + 1));
-	memset(data + off, 0, sizeof(struct bpf_insn_aux_data) * (cnt - 1));
-	for (i = off; i < off + cnt - 1; i++) {
-		/* Expand insni[off]'s seen count to the patched range. */
-		data[i].seen = old_seen;
-		data[i].zext_dst = bpf_insn_def32(new_prog, insn + i) >= 0;
-		/*
-		 * In BPF_PATCH_MOVE_TARGET mode the original insn is the last
-		 * slot by construction.
-		 */
-		if (mode == BPF_PATCH_KEEP_TARGET &&
-		    !memcmp(insn + i, original_insn, sizeof(struct bpf_insn))) {
-			data[i].non_stack_access =
-				data[off + cnt - 1].non_stack_access;
-			data[off + cnt - 1].non_stack_access = false;
-		} else if (bpf_is_mem_insn(insn + i)) {
-			data[i].non_stack_access = true;
-		}
-	}
-
-	/*
-	 * Last slot instruction could be a newly generated
-	 * BPF_ST/BPF_LDX/BPF_STX, systematically mark it for non-stack access
-	 * if it is not the original instruction, otherwise keep the
-	 * original marking
-	 */
-	if (bpf_is_mem_insn(insn + off + cnt - 1) &&
-	    memcmp(insn + off + cnt - 1, original_insn, sizeof(struct bpf_insn)))
-		data[off + cnt - 1].non_stack_access = true;
-
-	/*
-	 * The indirect_target flag of the original instruction was moved to the last of the
-	 * new instructions by the above memmove and memset, but the indirect jump target is
-	 * actually the first instruction, so move it back. This also matches with the behavior
-	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to the first new
-	 * instruction. For BPF_PATCH_MOVE_TARGET the original instruction is the last one,
-	 * so the flag already sits where needed.
-	 */
-	if (mode == BPF_PATCH_KEEP_TARGET && data[off + cnt - 1].indirect_target) {
-		data[off].indirect_target = 1;
-		data[off + cnt - 1].indirect_target = 0;
-	}
-}
-
-static void adjust_subprog_starts(struct bpf_verifier_env *env, u32 off, u32 len)
-{
-	int i;
-
-	if (len == 1)
-		return;
-	/* NOTE: fake 'exit' subprog should be updated as well. */
-	for (i = 0; i <= env->subprog_cnt; i++) {
-		if (env->subprog_info[i].start <= off)
-			continue;
-		env->subprog_info[i].start += len - 1;
-	}
-}
-
-static void adjust_insn_arrays(struct bpf_verifier_env *env, u32 first, u32 len)
-{
-	int i;
-
-	if (len == 1)
-		return;
-
-	for (i = 0; i < env->insn_array_map_cnt; i++)
-		bpf_insn_array_adjust(env->insn_array_maps[i], first, len);
-}
-
-static void adjust_poke_descs(struct bpf_prog *prog, u32 first, u32 len)
-{
-	struct bpf_jit_poke_descriptor *tab = prog->aux->poke_tab;
-	int i, sz = prog->aux->size_poke_tab;
-	struct bpf_jit_poke_descriptor *desc;
-
-	for (i = 0; i < sz; i++) {
-		desc = &tab[i];
-		if (desc->insn_idx < first)
-			continue;
-		desc->insn_idx += len - 1;
-	}
-}
-
 /*
- * Some post-verification instruction rewriting passes require an
- * O(prog->len) operation per instruction. Keep their shared primitives
- * killable and preemptible.
+ * A post-verification rewriting pass can queue a patch for each instruction
+ * of a large program. Keep the primitives that queue them killable and
+ * preemptible.
  */
 static bool bpf_rewrite_must_abort(void)
 {
@@ -325,53 +203,6 @@ static bool bpf_rewrite_must_abort(void)
 	return false;
 }
 
-static struct bpf_prog *__bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
-					      const struct bpf_insn *patch, u32 len,
-					      enum bpf_patch_mode mode)
-{
-	struct bpf_prog *new_prog;
-	struct bpf_insn_aux_data *new_data = NULL;
-	/* The first slot whose targets move. */
-	u32 first = mode == BPF_PATCH_MOVE_TARGET ? off : off + 1;
-	struct bpf_insn original_insn;
-
-	if (bpf_rewrite_must_abort())
-		return NULL;
-
-	if (len > 1) {
-		new_data = vrealloc(env->insn_aux_data,
-				    array_size(env->prog->len + len - 1,
-					       sizeof(struct bpf_insn_aux_data)),
-				    GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-		if (!new_data)
-			return NULL;
-
-		env->insn_aux_data = new_data;
-	}
-
-	memcpy(&original_insn, env->prog->insnsi + off, sizeof(struct bpf_insn));
-	new_prog = bpf_patch_insn_single(env->prog, off, patch, len);
-	if (IS_ERR(new_prog)) {
-		if (PTR_ERR(new_prog) == -ERANGE)
-			verbose(env,
-				"insn %d cannot be patched due to 16-bit range\n",
-				env->insn_aux_data[off].orig_idx);
-		return NULL;
-	}
-	adjust_insn_aux_data(env, new_prog, off, len, &original_insn, mode);
-	adjust_subprog_starts(env, off, len);
-	adjust_insn_arrays(env, first, len);
-	bpf_adjust_func_ptrs(env, off, len);
-	adjust_poke_descs(new_prog, first, len);
-	return new_prog;
-}
-
-struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
-				     const struct bpf_insn *patch, u32 len)
-{
-	return __bpf_patch_insn_data(env, off, patch, len, BPF_PATCH_KEEP_TARGET);
-}
-
 /*
  * Queue the replacement of insn 'off' by 'patch[0..len)' until
  * bpf_patch_list_commit(), see __bpf_patch_list_add(). Replacing one insn by
@@ -392,10 +223,13 @@ struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 		return ERR_PTR(-EFAULT);
 
 	if (len == 1 && (!p || off != p->off)) {
-		env->prog->insnsi[off] = *patch;
-		adjust_insn_aux_data(env, env->prog, off, 1, NULL,
-				     BPF_PATCH_KEEP_TARGET);
-		return &env->prog->insnsi[off];
+		struct bpf_insn *insn = &env->prog->insnsi[off];
+
+		*insn = *patch;
+		env->insn_aux_data[off].zext_dst = bpf_insn_def32(env->prog, insn) >= 0;
+		/* a new insn may access memory, systematically mark it non-stack */
+		env->insn_aux_data[off].non_stack_access = bpf_is_mem_insn(insn);
+		return insn;
 	}
 
 	return __bpf_patch_list_add(pl, env->prog, off, patch, len);
@@ -447,8 +281,7 @@ void bpf_patch_list_free(struct bpf_verifier_env *env)
 
 /*
  * Fill the aux data of the 'p->len' insns at 'slot' from the aux data 'old'
- * of the insn they replace, the same way as adjust_insn_aux_data() does.
- * The insns in front of p->target were inserted, as with BPF_PATCH_MOVE_TARGET.
+ * of the insn they replace. The insns in front of p->target were inserted.
  */
 static void patch_list_adj_aux(struct bpf_prog *prog, struct bpf_insn_patch *p,
 			       struct bpf_insn *patch,
@@ -558,8 +391,7 @@ static void patch_list_del_subprogs(struct bpf_verifier_env *env,
  * Apply all queued patches and removals in one go. Everything that names an
  * insn of the old image follows it to the new one. A patched insn is named by
  * the first insn of its patch, or the insn itself if insns were inserted in
- * front of it, a removed insn by the next insn that stays, like with
- * bpf_patch_insn_data().
+ * front of it, a removed insn by the next insn that stays.
  */
 int bpf_patch_list_commit(struct bpf_verifier_env *env)
 {
@@ -2275,7 +2107,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			 * We are *skipping* first half of ld_imm64 insn
 			 * with 'i++;', patching over second half of it
 			 * with that same half + mov64_percpu_reg insn.
-			 * All because bpf_patch_insn_data() can only
+			 * All because a patch can only
 			 * replace one 8-byte insn, which does not work
 			 * well for ld_imm64 insn.
 			 */
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index b6b120bf5433c..86d853fde37a8 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -6421,51 +6421,6 @@ struct bpf_func_ptr *bpf_map_func_ptrs(struct bpf_verifier_env *env,
 	return bpf_map_range_func_ptrs(env, map, 0, (u64)map->value_size, cnt);
 }
 
-/* instructions [off, off + len) replaced the instruction at 'off' */
-void bpf_adjust_func_ptrs(struct bpf_verifier_env *env, u32 off, u32 len)
-{
-	struct bpf_func_ptr *p;
-	u32 i;
-
-	if (len <= 1)
-		return;
-
-	for (i = 0; i < env->func_ptr_cnt; i++) {
-		p = &env->func_ptrs[i];
-		if (p->xlated_off <= off || p->xlated_off == BPF_FUNC_PTR_DELETED)
-			continue;
-		p->xlated_off += len - 1;
-	}
-}
-
-/*
- * Instructions [off, off + len) are about to be removed. It's called before
- * the starts of subprogs are adjusted. A subprog is gone when all of its
- * instructions are. Otherwise, e.g. when its first instruction is a nop,
- * it starts where the removed instructions did.
- */
-void bpf_adjust_func_ptrs_after_remove(struct bpf_verifier_env *env, u32 off, u32 len)
-{
-	struct bpf_func_ptr *p;
-	int subprog;
-	u32 i;
-
-	for (i = 0; i < env->func_ptr_cnt; i++) {
-		p = &env->func_ptrs[i];
-		if (p->xlated_off < off || p->xlated_off == BPF_FUNC_PTR_DELETED)
-			continue;
-		if (p->xlated_off >= off + len) {
-			p->xlated_off -= len;
-			continue;
-		}
-		subprog = bpf_find_subprog(env, p->xlated_off);
-		if (subprog > 0 && env->subprog_info[subprog + 1].start > off + len)
-			p->xlated_off = off;
-		else
-			p->xlated_off = BPF_FUNC_PTR_DELETED;
-	}
-}
-
 #define BTF_TYPE_SAFE_RCU(__type)  __PASTE(__type, __safe_rcu)
 #define BTF_TYPE_SAFE_RCU_OR_NULL(__type)  __PASTE(__type, __safe_rcu_or_null)
 #define BTF_TYPE_SAFE_TRUSTED(__type)  __PASTE(__type, __safe_trusted)

-- 
2.43.0

