Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361220;
	b=gJTT7/iQLEpDC/b0B6klyG9l40Q3/+iq2P733b6dyJOZGT2JpGHJCtsNffffu5IAnnr9
	 p5L68FM+l8sK8QoDP3Fk1jJoa1o9Si0vpqJPupWN8j8G0zpX63OGaLXF2Sn04p1zno6JA
	 YHwB5WP5Bat2yO+ZUTALGUIaHOfSDWiGc4mpOEmq6VmlDZzuOJhZ5GaUBlQ2/hVJhelWU
	 Uxhq/PsEVKWnOR++7bn+xMgDyfUrw7FU9ZRZNjg1d1M91hUf2InZdxFYD8bqvn+fUhGTa
	 vNq+o7slEZdmrwr7iFsMazTuG4P4UmYoMtYggDkTkdQFSE6iU232MoW2J1fOwDTsgsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TKWZuZG+bW7642rYW3zpPqTbn0tZZWfVUvRwG7l2gZQ=;
	b=pitBZzxkSGpw014SrZxid6Z1ne3JhAEwf80fMFirV2BeTBQW2nA/WnUSziUxK9dJSbG6
	 k5887cCKAYla8K3hjfiTCGWB2rPdzC3KYY3gI939BtpTcOtio9jokysn5/A3ZnP8iZsBV
	 67Nqqkq3BXu2chuasasKUrJWYyCXj200YfiCSZkiFv4w6h3HbmdwwvNSJT9vOPHwPTvk+
	 ZFv8hMAnj0p/MX4JZaTWk2+IrEE3RfeADFrKiyYDMP9qI0gSQOPpAPajdG/uTvYEUAdT3
	 n/on7U9W7r8J348cnY4T/xWrJxAk9gzq1C2aX1inOdDgnv4x6sh8UOYA5Ma7q37kNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CQFo/ONj";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E51606A337
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E51606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQFo/ONj
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so719749c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361219; x=1793966019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKWZuZG+bW7642rYW3zpPqTbn0tZZWfVUvRwG7l2gZQ=;
        b=CQFo/ONjIW7wqxbYDitPhH8+58GSQlnQ4RcQlLnwhJbh/RFvK34C9PPFX2MUuV06AU
         234Kz++dk8rMS/BNohsLznOh99O9pkjP0a/kWno3kvjGVfxc+MjUdWskfH76WOroozFU
         oxArs1yu0GWvsfmLal8FR/45YJ/3aqo5qdoCYwhMEPrr9hTTXFvqlIX9kG25LTRi9blh
         ZceuIbFbA9mwP2kY8v5YulFL0XxR0qC7A3fp40gGG9RmaqgWdDsSrwqChqFcvIbktN65
         3a/uksYlJ26XniTjcB4zJqS54iF99DAFhsuItMaESqzWaZwRSiQFro3mKFrT4rFlBxUK
         QamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361219; x=1793966019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKWZuZG+bW7642rYW3zpPqTbn0tZZWfVUvRwG7l2gZQ=;
        b=h2PE3uVu6ZO+RktZ04Abukhx8BmrnkyRwz5Ok+JJ9Q/quhT1B+F0S8GwVO73hwG01G
         2ucU/MMYWB+6oKMtGLh9GtGS2BBJwkNc3OtLjIqJph9OoCSaIuRbMMA7X709oF1NDLw1
         LMfZD72pzMWbFxbaZ+e/caSSUXkAoQoTCQbnuhDf4ebsCoIhtamMaUEy3eTsS23OFjEL
         dFQ7L2XA0wsJcgcl52/yTtUQfXAiViTu3eoQc59bpnHRtloy46RFpsVzcvSIr51IGrsm
         G9QU3PJv1z0gZgrgR54TVA2pUnR2DLmzlii7pNc73diE13Jlgry8RiCoodkt3tf2PeFp
         7JYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwgHpAtgNnJmOgpLhIfTVopJcXbNY1bmqcJYEgrNc2AhWLKFJbOszVhgc/MIJOFLyPMER+S29y0eX3tf6AmBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjlakmrPsJneSJHntsA2wsV/bTTqGIgTP1QzZFtOExP8YX22kf
	TSLiCekmGPnFDrj9GfLAxmnDTWY/wyZqEDvgQz/2J+IrwjL9IwKxIVJd
X-Gm-Gg: AYBFou3yXg0Ft5cCZuIjwxv6CeiQhBxUdWqFqdHPTEr3RYw+r4jqGr5BOjWK7MuvBTo
	oQPR9jJcgUotYGLysDex693kDBBhT9lBUUbeZYJyjvz8Hyrsx37BrRjK6PrTuTD5V3s5acCAwDA
	+GIgaA3Nqp5FKnmphidZsungZNV97UJ/76P7ftp+wciH9xhtweXFVOr9+VZdW71nkOeplmVeAV6
	eLf09kRS8R03lwRMcbnr/0tySHE25qYalvJ01YnqH1PryDfi/Usasj7xAPc/x+nQd/Rc1xIliEP
	aqrt28bxAYH91odASlQnFAsOdZ0yDQyO4OFWLjhToz/s2fIMMVrCkOC79Ed0hoj9arq3djvfpk7
	KL0SJpC+qQ0FMwpzRpZqIoO5i3ceKF+joDb/EXeEaPMUkN1l8Jv8XPT0VgNI33naMsZIDNrLRFF
	ZssR3K9bvMW4i4fFwiZ3AzDzHMZG4BnVGuou/7/A6hNm1Jaqns3YW/JvoWRqKvVnvpX8kk+JmoG
	ochOfQNJrJ3WOnVtEnodi7YT0cVhLK3ha0+q8A62SuPZ63FFIOrvTJeB9lTh8NmBnmV9eLOMJ3F
	ZRVc1uVbGN/pSsy7ft9othCj
X-Received: by 2002:a05:701b:4213:10b0:1a4:fac9:aeee with SMTP id a92af1059eb24-1ac56d95c0amr2878019c88.4.1793361218584;
        Fri, 30 Oct 2026 04:53:38 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:38 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:02 -0400
Subject: [PATCH bpf-next v2 17/22] bpf: Inline bpf_loop() calls through the
 patch list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-17-55cd43439f7c@gmail.com>
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

bpf_optimize_bpf_loop() patches the program for every bpf_loop() call
that it inlines, then points the call in the patch to the callback with
the start of the callback subprog after patching.

Each inlining costs O(prog->len), and the call can't be pointed to the
callback before the patch is applied.

Queue the patches and commit them once. Set the call relative to the
patch placed at the bpf_loop() call in the unpatched program, adding
the growth of the patch itself for a callback behind it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 62 +++++++++++++++++++++--------------------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 84aaaa4632aa3..217771aca0161 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2845,11 +2845,8 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 	return 0;
 }
 
-static struct bpf_prog *inline_bpf_loop(struct bpf_verifier_env *env,
-					int position,
-					s32 stack_base,
-					u32 callback_subprogno,
-					u32 *total_cnt)
+static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
+			   s32 stack_base, u32 callback_subprogno)
 {
 	s32 r6_offset = stack_base + 0 * BPF_REG_SIZE;
 	s32 r7_offset = stack_base + 1 * BPF_REG_SIZE;
@@ -2859,9 +2856,8 @@ static struct bpf_prog *inline_bpf_loop(struct bpf_verifier_env *env,
 	int reg_loop_ctx = BPF_REG_8;
 
 	struct bpf_insn *insn_buf = env->insn_buf;
-	struct bpf_prog *new_prog;
 	u32 callback_start;
-	u32 call_insn_offset;
+	struct bpf_insn *last;
 	s32 callback_offset;
 	u32 cnt = 0;
 
@@ -2887,9 +2883,7 @@ static struct bpf_prog *inline_bpf_loop(struct bpf_verifier_env *env,
 	 * if reg_loop_cnt >= reg_loop_max skip the loop body
 	 */
 	insn_buf[cnt++] = BPF_JMP_REG(BPF_JGE, reg_loop_cnt, reg_loop_max, 5);
-	/* callback call,
-	 * correct callback offset would be set after patching
-	 */
+	/* callback call, the offset is set below */
 	insn_buf[cnt++] = BPF_MOV64_REG(BPF_REG_1, reg_loop_cnt);
 	insn_buf[cnt++] = BPF_MOV64_REG(BPF_REG_2, reg_loop_ctx);
 	insn_buf[cnt++] = BPF_CALL_REL(0);
@@ -2906,19 +2900,19 @@ static struct bpf_prog *inline_bpf_loop(struct bpf_verifier_env *env,
 	insn_buf[cnt++] = BPF_LDX_MEM(BPF_DW, BPF_REG_7, BPF_REG_10, r7_offset);
 	insn_buf[cnt++] = BPF_LDX_MEM(BPF_DW, BPF_REG_8, BPF_REG_10, r8_offset);
 
-	*total_cnt = cnt;
-	new_prog = bpf_patch_insn_data(env, position, insn_buf, cnt);
-	if (!new_prog)
-		return new_prog;
-
-	/* callback start is known only after patching */
+	/*
+	 * Note: insn_buf[12] is the BPF_CALL_REL instruction. Jumps out of a
+	 * patch are relative to it in place, which takes the place of 'cnt'
+	 * insns behind 'position'.
+	 */
 	callback_start = env->subprog_info[callback_subprogno].start;
-	/* Note: insn_buf[12] is an offset of BPF_CALL_REL instruction */
-	call_insn_offset = position + 12;
-	callback_offset = callback_start - call_insn_offset - 1;
-	new_prog->insnsi[call_insn_offset].imm = callback_offset;
+	callback_offset = callback_start - position;
+	if (callback_start > position)
+		callback_offset += cnt - 1;
+	insn_buf[12].imm = callback_offset - 12 - 1;
 
-	return new_prog;
+	last = bpf_patch_list_add(env, position, insn_buf, cnt);
+	return PTR_ERR_OR_ZERO(last);
 }
 
 static bool is_bpf_loop_call(struct bpf_insn *insn)
@@ -2940,7 +2934,7 @@ static bool is_bpf_loop_call(struct bpf_insn *insn)
 int bpf_optimize_bpf_loop(struct bpf_verifier_env *env)
 {
 	struct bpf_subprog_info *subprogs = env->subprog_info;
-	int i, cur_subprog = 0, cnt, delta = 0;
+	int i, cur_subprog = 0, err;
 	struct bpf_insn *insn = env->prog->insnsi;
 	int insn_cnt = env->prog->len;
 	u16 stack_depth = subprogs[cur_subprog].stack_depth;
@@ -2949,26 +2943,18 @@ int bpf_optimize_bpf_loop(struct bpf_verifier_env *env)
 
 	for (i = 0; i < insn_cnt; i++, insn++) {
 		struct bpf_loop_inline_state *inline_state =
-			&env->insn_aux_data[i + delta].loop_inline_state;
+			&env->insn_aux_data[i].loop_inline_state;
 
 		if (is_bpf_loop_call(insn) && inline_state->fit_for_inline) {
-			struct bpf_prog *new_prog;
-
 			stack_depth_extra = BPF_REG_SIZE * 3 + stack_depth_roundup;
-			new_prog = inline_bpf_loop(env,
-						   i + delta,
-						   -(stack_depth + stack_depth_extra),
-						   inline_state->callback_subprogno,
-						   &cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta     += cnt - 1;
-			env->prog  = new_prog;
-			insn       = new_prog->insnsi + i + delta;
+			err = inline_bpf_loop(env, i,
+					      -(stack_depth + stack_depth_extra),
+					      inline_state->callback_subprogno);
+			if (err)
+				return err;
 		}
 
-		if (subprogs[cur_subprog + 1].start == i + delta + 1) {
+		if (subprogs[cur_subprog + 1].start == i + 1) {
 			subprogs[cur_subprog].stack_depth += stack_depth_extra;
 			cur_subprog++;
 			stack_depth = subprogs[cur_subprog].stack_depth;
@@ -2979,7 +2965,7 @@ int bpf_optimize_bpf_loop(struct bpf_verifier_env *env)
 
 	env->prog->aux->stack_depth = env->subprog_info[0].stack_depth;
 
-	return 0;
+	return bpf_patch_list_commit(env);
 }
 
 /* Remove unnecessary spill/fill pairs, members of fastcall pattern,

-- 
2.43.0

