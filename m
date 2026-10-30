Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361174;
	b=iwun11or75ibIr/bv3WXXmMAhQoyfa20a3zSASA+rpaG5TOOnVhHlHW3+SoseqsNPPP6
	 qYKpxgvWw+MSmwU0FnMJYY9GGGcMHlqE3wUn0s4MeWE8l0xDS36kWm2Wjv4Jy25mTOwX/
	 NU9XNZCIzt9VkT+HHeVbI3z0rGNZvR/CtiSu6sOEJhEONNmVlt8vjF0WUIrPwvJXDEHz8
	 XzHq9wbz8thT7JPbI5hQz8xDvgGXSi8LiUI4DYJCd/T9gk6kGPuo7LgZeIKV8fI8vyxwx
	 NbqZCLg4dQgE0PddKv77V1pShu/T14vvJtCnFlWorscevF7Guzx6ZbGFGwJb43xqyHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D25azTNyiIXfYBfQtWHSChfm+RG7wZ+rEc2MJkCnUUE=;
	b=qKa7JHIZ8Ys12sOkvxe/0YqQPOTs9aUyUdNmpHkZ0h8/d3OZB2bxuOqVS0cAOCUUeDvh
	 91AxQepWvzPWi2FNpjBccP/b2MP2yuamnSMLDKFXyL90dw8A4CzCuUZ5aw+dmmxANVMQE
	 Jje53TP33LTTXMIVhHXl8pUIzMQ7CVfUqrMyg4NF2+5G3pNCVPmvYyKCZNedXziTOGHOF
	 MsADaY6YtmceR0SLHZClFZAx+BdHC8RmrTVEU9GNXbYMsvZTTHnAsWJ0yNkF7BH87zDXA
	 KtZcjR7DQfy76I/q7GeHCW0EM/WO8X/AshXlwVqgweHm03P+n4YbLkGvg4q2JjOfZ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsYsf8+2;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3A606A322
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F3A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsYsf8+2
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9b69so28990c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361173; x=1793965973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D25azTNyiIXfYBfQtWHSChfm+RG7wZ+rEc2MJkCnUUE=;
        b=LsYsf8+2GWbDTfS5zRQm6kyTfcXZRBqA4gxEEQGhZvp+8T6tiyEsqKQX4fEmqMJPJv
         D9+nYhX3374EUFS1KBt8fYee83T1JSYNj2My3AO+K6tTuaaZQJqxmt9ppZSmYZcS+ngy
         /EVhK0F1M+uo1Zw3fg9/0PRzQiIM7uyu+/41IEYMTEHKlgzUiYVabUokuuygQ2QnjhvM
         Z/GFiqICqCf7+Lzjj/fXZ0STCU3gYCMkdvI8VXP8NNq5v7eiXsUZRoTp+k7nHkyj3aVd
         MP7Hc+yO9zfqXgNcni4qfir2m9YXjwGCWbbdeP2pcmYJ/qL2GEDu8P8aoGY5H8dAnBlu
         dlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361173; x=1793965973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D25azTNyiIXfYBfQtWHSChfm+RG7wZ+rEc2MJkCnUUE=;
        b=TDIJ5gg113POyEaUF/pcSixBF6SZclsl/fXWehHDRSkedprPEivSqwtPMhXwoS9Qmy
         I4U/6kVNpi5G9i5RgohEfpfrzOg0TskcsXBd3Uc/h7/ta4QG4RzxzzrZf6PBNikWNwHp
         JkXJcGJxYIUiRcQP3tena2zJozUa+sSwF95vofWjciyedRmsqyweTm9klGJ2L+fhQ+66
         Xp7Vi7LKP5zjeAHrxrhHbkbRPA1tdtu4OqTj2jkj1NAM7+gHJUQY3FbvQ30guJMny8lC
         DH/7FwJVgX0JMWsAi5LUmls8hEkRm+NRXTJlEmy4a8YuZ3GZq8PiW4WW69JMtw/QrA3L
         eMGw==
X-Forwarded-Encrypted: i=1; AKwUvBxEYi8QsJ7DayHKoLyWDreeykWBBwE6YbPpR10g2Ustrv0zXH8yw6+WNmgRLefHYLQooPR5fmPqC4pLvd/8I2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNOZTZM76/FN1yJtirre+I32bqsDOFgiq9FG+bSPaCLc9GASXQ
	zSuopDUgskzA/nlq/cB+kAdUQhAp0ccr4dYFhnBC8DzZs6cxcRZqlPR90VyJznco
X-Gm-Gg: AYBFou0VOXI/r9xaUtmGhLhKFtu6Av3aVad0DP3SyHMWtwMoYEJsoRPCDOdMr68YEJu
	L24jD+aaea5wyqr+Dos1arZrrnR5CMdwXQLi98XzcNoccG9rMNtuN5f2XRbhEFT33Q6cZf8Yp7r
	By/TWsn6UkE8mlORo6xVDK87ISkroKeVXFyPfI9gQXawX9uTRHfd9l1c+WCYT91Fd8lQ8ZNaeGi
	1Xv3yzj9j4e3RkpBUKMx81mORP1Qom/feKYASGOwtucavbjatJ4WSdKIfLCR5q1h+8lpUY/536U
	vHmLwKy1MpkDbKlDRUWm1chNk4jGcHxjZBlxsgOZbFVJ0hPKa8jMUhCVGi0gi5EdTdI1jkDBe5R
	o7cEv9jXzC06Mr9HZI37L2+Rkg+nZEGrXikXkwdzVW1k3zaF3ZCmsZJi2z9d9m9BcRsSf7M+hNZ
	dM/RQHN2wqUYeWONWKs/9glldwv7HjDbaD2nVPOkSznD/H4On5mX9kqHTcIbU1Q6t/yHa+AjRiS
	vKe3TEo9uxEPfp+fUcegCs8dLvAiB3YNihGSDuXf8pg/2CeEN/mqhiJN1Q1qUqrmw/1xudCMvjn
	SGSDuylwBaEngfOTTyphsBGM
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr3327498c88.36.1793361172984;
        Fri, 30 Oct 2026 04:52:52 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:52 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:54 -0400
Subject: [PATCH bpf-next v2 09/22] bpf: Strip nops through the patch list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-9-55cd43439f7c@gmail.com>
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

bpf_opt_remove_nops() removes every "ja 0" and "may_goto +0" with
verifier_remove_insns(). After removing may_goto +0, it looks at the
instruction in front of it again, since a may_goto +1 there has turned
into another may_goto +0.

Each removal moves the tail of the program and walks all of it, so
loading 131072 "ja 0" takes about 53 seconds.

Mark the nops in a bitmap first, queue their removal with
bpf_patch_list_del() and commit them once. Take a forward jump over
removed instructions as one of +0, and keep looking back from a
removed may_goto as long as that turns another one into a nop.
verifier_remove_insns() and its static helpers have no users left,
remove them.

Time of BPF_PROG_LOAD of n "ja 0" followed by "r0 = 0; exit", average
of three runs, x86_64 VM with 32 vCPUs, before and after this patch:

              before     after
  n = 32768    3.207 s   0.203 s
  n = 131072  52.940 s   0.766 s

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 236 +++++++++++-----------------------------------------
 1 file changed, 47 insertions(+), 189 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 95f4fe5d607e6..7c7c38eb9f0c2 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -298,14 +298,6 @@ static void adjust_insn_arrays(struct bpf_verifier_env *env, u32 first, u32 len)
 		bpf_insn_array_adjust(env->insn_array_maps[i], first, len);
 }
 
-static void adjust_insn_arrays_after_remove(struct bpf_verifier_env *env, u32 off, u32 len)
-{
-	int i;
-
-	for (i = 0; i < env->insn_array_map_cnt; i++)
-		bpf_insn_array_adjust_after_remove(env->insn_array_maps[i], off, len);
-}
-
 static void adjust_poke_descs(struct bpf_prog *prog, u32 first, u32 len)
 {
 	struct bpf_jit_poke_descriptor *tab = prog->aux->poke_tab;
@@ -743,133 +735,6 @@ static int adjust_jmp_off(struct bpf_prog *prog, u32 tgt_idx, u32 delta)
 	return 0;
 }
 
-static int adjust_subprog_starts_after_remove(struct bpf_verifier_env *env,
-					      u32 off, u32 cnt)
-{
-	int i, j;
-
-	/* find first prog starting at or after off (first to remove) */
-	for (i = 0; i < env->subprog_cnt; i++)
-		if (env->subprog_info[i].start >= off)
-			break;
-	/* find first prog starting at or after off + cnt (first to stay) */
-	for (j = i; j < env->subprog_cnt; j++)
-		if (env->subprog_info[j].start >= off + cnt)
-			break;
-	/* if j doesn't start exactly at off + cnt, we are just removing
-	 * the front of previous prog
-	 */
-	if (env->subprog_info[j].start != off + cnt)
-		j--;
-
-	if (j > i) {
-		struct bpf_prog_aux *aux = env->prog->aux;
-		int move;
-
-		/* move fake 'exit' subprog as well */
-		move = env->subprog_cnt + 1 - j;
-
-		memmove(env->subprog_info + i,
-			env->subprog_info + j,
-			sizeof(*env->subprog_info) * move);
-		env->subprog_cnt -= j - i;
-
-		/* remove func_info and its aux */
-		if (aux->func_info) {
-			move = aux->func_info_cnt - j;
-
-			memmove(aux->func_info + i,
-				aux->func_info + j,
-				sizeof(*aux->func_info) * move);
-			if (aux->func_info_aux)
-				memmove(aux->func_info_aux + i,
-					aux->func_info_aux + j,
-					sizeof(*aux->func_info_aux) * move);
-			aux->func_info_cnt -= j - i;
-			/* func_info->insn_off is set after all code rewrites,
-			 * in adjust_btf_func() - no need to adjust
-			 */
-		}
-		/* The exception callback is live, so it cannot sit inside the removed range. */
-		if (env->exception_callback_subprog >= j)
-			env->exception_callback_subprog -= j - i;
-	} else {
-		/* convert i from "first prog to remove" to "first to adjust" */
-		if (env->subprog_info[i].start == off)
-			i++;
-	}
-
-	/* update fake 'exit' subprog as well */
-	for (; i <= env->subprog_cnt; i++)
-		env->subprog_info[i].start -= cnt;
-
-	return 0;
-}
-
-static int bpf_adj_linfo_after_remove(struct bpf_verifier_env *env, u32 off,
-				      u32 cnt)
-{
-	struct bpf_prog *prog = env->prog;
-	u32 i, l_off, l_cnt, nr_linfo;
-	struct bpf_line_info *linfo;
-
-	nr_linfo = prog->aux->nr_linfo;
-	if (!nr_linfo)
-		return 0;
-
-	linfo = prog->aux->linfo;
-
-	/* find first line info to remove, count lines to be removed */
-	for (i = 0; i < nr_linfo; i++)
-		if (linfo[i].insn_off >= off)
-			break;
-
-	l_off = i;
-	l_cnt = 0;
-	for (; i < nr_linfo; i++)
-		if (linfo[i].insn_off < off + cnt)
-			l_cnt++;
-		else
-			break;
-
-	/* First live insn doesn't match first live linfo, it needs to "inherit"
-	 * last removed linfo.  prog is already modified, so prog->len == off
-	 * means no live instructions after (tail of the program was removed).
-	 */
-	if (prog->len != off && l_cnt &&
-	    (i == nr_linfo || linfo[i].insn_off != off + cnt)) {
-		l_cnt--;
-		linfo[--i].insn_off = off + cnt;
-	}
-
-	/* remove the line info which refer to the removed instructions */
-	if (l_cnt) {
-		memmove(linfo + l_off, linfo + i,
-			sizeof(*linfo) * (nr_linfo - i));
-
-		prog->aux->nr_linfo -= l_cnt;
-		nr_linfo = prog->aux->nr_linfo;
-	}
-
-	/* pull all linfo[i].insn_off >= off + cnt in by cnt */
-	for (i = l_off; i < nr_linfo; i++)
-		linfo[i].insn_off -= cnt;
-
-	/* fix up all subprogs (incl. 'exit') which start >= off */
-	for (i = 0; i <= env->subprog_cnt; i++)
-		if (env->subprog_info[i].linfo_idx > l_off) {
-			/* program may have started in the removed region but
-			 * may not be fully removed
-			 */
-			if (env->subprog_info[i].linfo_idx >= l_off + l_cnt)
-				env->subprog_info[i].linfo_idx -= l_cnt;
-			else
-				env->subprog_info[i].linfo_idx = l_off;
-		}
-
-	return 0;
-}
-
 /* Clean up dynamically allocated fields of aux data for instructions [start, ...] */
 void bpf_clear_insn_aux_data(struct bpf_verifier_env *env, int start, int len)
 {
@@ -886,44 +751,6 @@ void bpf_clear_insn_aux_data(struct bpf_verifier_env *env, int start, int len)
 	}
 }
 
-static int verifier_remove_insns(struct bpf_verifier_env *env, u32 off, u32 cnt)
-{
-	struct bpf_insn_aux_data *aux_data = env->insn_aux_data;
-	unsigned int orig_prog_len = env->prog->len;
-	int err;
-
-	if (bpf_rewrite_must_abort())
-		return -EINTR;
-
-	if (bpf_prog_is_offloaded(env->prog->aux))
-		bpf_prog_offload_remove_insns(env, off, cnt);
-
-	bpf_clear_insn_aux_data(env, off, cnt);
-
-	err = bpf_remove_insns(env->prog, off, cnt);
-	if (err)
-		return err;
-
-	/* before subprogs are adjusted, since it looks at them */
-	bpf_adjust_func_ptrs_after_remove(env, off, cnt);
-
-	err = adjust_subprog_starts_after_remove(env, off, cnt);
-	if (err)
-		return err;
-
-	err = bpf_adj_linfo_after_remove(env, off, cnt);
-	if (err)
-		return err;
-
-	adjust_insn_arrays_after_remove(env, off, cnt);
-
-	memmove(aux_data + off,	aux_data + off + cnt,
-		sizeof(*aux_data) * (orig_prog_len - off - cnt));
-	env->insn_aux_data_len -= cnt;
-
-	return 0;
-}
-
 static const struct bpf_insn NOP = BPF_JMP_IMM(BPF_JA, 0, 0, 0);
 static const struct bpf_insn MAY_GOTO_0 = BPF_RAW_INSN(BPF_JMP | BPF_JCOND, 0, 0, 0, 0);
 
@@ -1028,32 +855,63 @@ int bpf_opt_remove_dead_code(struct bpf_verifier_env *env)
 	return bpf_patch_list_commit(env);
 }
 
+/*
+ * Whether insn i is a nop once the insns in 'removed' are gone. Only forward
+ * jumps over removed insns can turn into one.
+ */
+static bool insn_is_nop(struct bpf_verifier_env *env, int i,
+			const unsigned long *removed)
+{
+	struct bpf_insn insn = env->prog->insnsi[i];
+	int t = i + 1 + insn.off;
+
+	if (env->insn_aux_data[i].indirect_target)
+		return false;
+	if (insn.code != NOP.code && insn.code != MAY_GOTO_0.code)
+		return false;
+	if (insn.off > 0 && find_next_zero_bit(removed, t, i + 1) == t)
+		insn.off = 0;
+
+	return !memcmp(&insn, &NOP, sizeof(NOP)) ||
+	       !memcmp(&insn, &MAY_GOTO_0, sizeof(MAY_GOTO_0));
+}
+
 int bpf_opt_remove_nops(struct bpf_verifier_env *env)
 {
-	struct bpf_insn_aux_data *aux = env->insn_aux_data;
-	struct bpf_insn *insn = env->prog->insnsi;
 	int insn_cnt = env->prog->len;
-	bool is_may_goto_0, is_ja;
-	int i, err;
+	unsigned long *removed;
+	int i, j, err = 0;
 
-	for (i = 0; i < insn_cnt; i++) {
-		is_may_goto_0 = !memcmp(&insn[i], &MAY_GOTO_0, sizeof(MAY_GOTO_0));
-		is_ja = !memcmp(&insn[i], &NOP, sizeof(NOP));
+	removed = bitmap_zalloc(insn_cnt, GFP_KERNEL_ACCOUNT);
+	if (!removed)
+		return -ENOMEM;
 
-		if (!is_may_goto_0 && !is_ja)
-			continue;
-		if (aux[i].indirect_target)
+	for (i = 0; i < insn_cnt; i++) {
+		if (!insn_is_nop(env, i, removed))
 			continue;
+		/*
+		 * Removing may_goto +0 can turn the may_goto +1 in front of it
+		 * into another one, look back as long as it does.
+		 */
+		for (j = i; ; ) {
+			__set_bit(j, removed);
+			if (env->prog->insnsi[j].code != MAY_GOTO_0.code)
+				break;
+			while (--j >= 0 && test_bit(j, removed))
+				;
+			if (j < 0 || !insn_is_nop(env, j, removed))
+				break;
+		}
+	}
 
-		err = verifier_remove_insns(env, i, 1);
+	for_each_set_bit(i, removed, insn_cnt) {
+		err = bpf_patch_list_del(env, i);
 		if (err)
-			return err;
-		insn_cnt--;
-		/* Go back one insn to catch may_goto +1; may_goto +0 sequence */
-		i -= (is_may_goto_0 && i > 0) ? 2 : 1;
+			break;
 	}
+	bitmap_free(removed);
 
-	return 0;
+	return err ?: bpf_patch_list_commit(env);
 }
 
 int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_verifier_env *env,

-- 
2.43.0

