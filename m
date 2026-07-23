Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4623812ED
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784780754; cv=none; b=dpaNUdlIL6ZsoEKuZvfv642jxFPp0ZbQUJ6VowN9xjYZS0rROaU68KlKwMAPL9jdxJg47gibe5BiO8AshdDumvEbI4ucyp7j7F2hwxv30stRZxN/Lo+8svZh+YMlr4gPsgHuSa1hernylWrRikik/KrXL3TqNTePUwjCvduKwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784780754; c=relaxed/simple;
	bh=pi/QrCzTgCAy0vptzr/p+KzcvZGUM6nSMZVHIkdcc1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seV5Yim5kCFCKDYLNah+suhWvG/5+aZDMC1KNWO8qKyFm5FKmgcg1d23BlK4lgZFTs7/6VYcg70jQgCn2AgDWEkieG4Nfleue5Y0HxLuX/ukhN1LzkIJzkxwnefw8Qm5rbYcUmLKSMJtuA0wGEz2hh9hp00dJqYp/dG1Se4OkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZBLvbten; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZBLvbten"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1670dad7a8so37198366b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 21:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784780734; x=1785385534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xG0dt7hJM1Ld8rIfYFgFnlLatCT3TYzx+xyuHntcqYg=;
        b=ZBLvbtenojRr/+5dnzOACo+LRS/MbD6QSFobH/8jXjPN1/7U4Uh2tLWmV23ZxdFBPr
         LyOPwFi3kFdiPrRWIMpfIFFEf/iDeVl8lDfFzbqlHe2e064aN6yKw7BZmjtCpQdmqiLq
         i2PpodN8lu0tuxlGjqIfYMlE1TapbWq1rqjOzEduZ+sYKVt0P8oLDF3MUrVsbSE6Y/ai
         PZhkgwkF3rpwz8tt8ikut8TsANbc1L/l+3jWttwfJLaku6GRy5l6KagYYicAKcMChdlf
         FUTbsgMMR8+yuLYIvZc9XPiMl1lDS8nuJbnerUTzEWLes2jfLTtxXcLE5/IwcWuUFwWb
         XTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784780734; x=1785385534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG0dt7hJM1Ld8rIfYFgFnlLatCT3TYzx+xyuHntcqYg=;
        b=BvrRI8S9G15hR8fnW3FBgT+dVtmE9ifNzrLXuW1yC0ysSlNIsyrGEds119oToKyNq/
         LdKRv+Uafwoh8vAv3eEFTYxB+nNFiNXJtEgoH8WDEyBpYiu5b2WaL56kb6BuCXLbfUF6
         iFf+v+NhUN/JmVUYMfzoAQ0agAr5/+ADjPkrzNN/8oMNYr7lvs/7BamPXJQuMAmZjU5+
         JZ5kN1VcnYRW+r6pATABb/iQE6nx6wD/vE8xAepn3lv7Ej0IuxgCzCS2kh7XpcBxkq+m
         5+lY+zCYx02JWof1VuRZrM30Hxsmcy0J94Ssy4Oln6+VCLjLpiCN5oeJJHjYRI+WWqcw
         7pJg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8hgfhMn19llIb25NSXQ4YXbM056/WT6rzbQ8tv2UITBsX77vL8KaQkdWcXwnddEIu1pdIUoTAWZech//1EMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtT6tpLxBLZh90efXzsoCn+kZ9kg9MOGhF2XDqlaNdQuWTqL9
	9e98/zjU4XExnR1FleeNUxt1UVYWi9lc6H9v3zVddwAlL4ECsB6FoiMHTjVYh4pgwgE=
X-Gm-Gg: AR+sD12LuOozGP+uCjqdCyMtxF1PQscuMjhzcO3j/SG80vWJ+S7xSR41Ta4B0peOSH9
	xV6PZmMoMQy3/FPi81vmy9FY4fGtxVbe29ZT1w5S27V/6xwPtN0jjK0RpzMtidvCc3hkVtItOdb
	RBW9bx0XrtX1vGyayAokzJ6w0U8rui+95rkvrsr0M67NH4+KfKlNqneQfRhT8G2hCsyDXjYRsUf
	6u57ajzm9PbnHGutgJyqRGS8EaE9zdlBf/7mtj9f/9yPUe1yo61c9vSkqnNkLVcGZs+gGPXlMOX
	AV2GD31RiKEnHPh1WBvvkUgVA00QqNM4VicJcbjXhDH+1wtzfxeFa/wMJItiW05F/9S9WAozCiG
	IVXL1qHXU1sMPMAPO0Wglufslz6i3zsaqwSDTm8D+ElHcECmTNhbhOeHphl4iwOt/qy0CbcCvn7
	1mXH/Nq7Zfcwm/shYJy9f1RkZaFifPpQ==
X-Received: by 2002:a17:907:a06:b0:c16:2139:dae4 with SMTP id a640c23a62f3a-c1c5092a1demr65188566b.6.1784780733940;
        Wed, 22 Jul 2026 21:25:33 -0700 (PDT)
Received: from u94a (27-53-97-40.adsl.fetnet.net. [27.53.97.40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a884esm2063938a12.23.2026.07.22.21.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:25:32 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:25:20 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Preserve pointer state for commuted
 arithmetic
Message-ID: <amGUjFu1MN__jM4c@u94a>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
 <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>

On Wed, Jul 22, 2026 at 05:27:31AM +0000, Yiyang Chen wrote:
[...]
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -13726,11 +13726,14 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
>  	s64 smin_val = reg_smin(off_reg), smax_val = reg_smax(off_reg);
>  	u64 umin_val = reg_umin(off_reg), umax_val = reg_umax(off_reg);
>  	struct bpf_sanitize_info info = {};
> +	const struct bpf_reg_state *orig_off_reg = off_reg;
> +	bool ptr_is_dst_reg;
> 
>  	u8 opcode = BPF_OP(insn->code);
>  	u32 dst = insn->dst_reg;
>  	int ret, bounds_ret;
>  
>  	dst_reg = &regs[dst];
> +	ptr_is_dst_reg = ptr_reg == dst_reg;
>  
>  	if ((known && (smin_val != smax_val || umin_val != umax_val)) ||
>  	    smin_val > smax_val || umin_val > umax_val) {
[...]
> @@ -13813,7 +13820,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
>  		ret = sanitize_ptr_alu(env, insn, ptr_reg, off_reg, dst_reg,
>  				       &info, false);
>  		if (ret < 0)
> -			return sanitize_err(env, insn, ret, off_reg, dst_reg);
> +			return sanitize_err(env, insn, ret, orig_off_reg, dst_reg);
>  	}
>  
>  	switch (opcode) {
[...]
> @@ -13906,7 +13913,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
>  			return -EFAULT;
>  		}
>  		if (ret < 0)
> -			return sanitize_err(env, insn, ret, off_reg, dst_reg);
> +			return sanitize_err(env, insn, ret, orig_off_reg, dst_reg);
>  	}
>  
>  	return 0;

The sole purpose of having orig_off_reg seem to be for satisfying the
'off_reg == dst_reg' conditional in sanitize_err(). If that's the case,
maybe it is better to change sanitize_err to accept an ptr_is_dst_reg
argument too.

And given now that we are starting to make more use of scratch register
states, it seems better to get rid the likes of 'off_reg == dst_reg' all
together, and simply have ptr_is_dst_reg passed down by
adjust_scalar_min_max_vals().


diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 52be0a118cce..72d49f2a57a3 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -13505,13 +13505,13 @@ static int sanitize_ptr_alu(struct bpf_verifier_env *env,
 			    const struct bpf_reg_state *off_reg,
 			    struct bpf_reg_state *dst_reg,
 			    struct bpf_sanitize_info *info,
-			    const bool commit_window)
+			    const bool commit_window,
+			    const bool ptr_is_dst_reg)
 {
 	struct bpf_insn_aux_data *aux = commit_window ? cur_aux(env) : &info->aux;
 	struct bpf_verifier_state *vstate = env->cur_state;
 	bool off_is_imm = tnum_is_const(off_reg->var_off);
 	bool off_is_neg = reg_smin(off_reg) < 0;
-	bool ptr_is_dst_reg = ptr_reg == dst_reg;
 	u8 opcode = BPF_OP(insn->code);
 	u32 alu_state, alu_limit;
 	struct bpf_reg_state tmp;
@@ -13611,7 +13611,8 @@ static void sanitize_mark_insn_seen(struct bpf_verifier_env *env)
 static int sanitize_err(struct bpf_verifier_env *env,
 			const struct bpf_insn *insn, int reason,
 			const struct bpf_reg_state *off_reg,
-			const struct bpf_reg_state *dst_reg)
+			const struct bpf_reg_state *dst_reg,
+			const bool ptr_is_dst_reg)
 {
 	static const char *err = "pointer arithmetic with it prohibited for !root";
 	const char *op = BPF_OP(insn->code) == BPF_ADD ? "add" : "sub";
@@ -13620,11 +13621,11 @@ static int sanitize_err(struct bpf_verifier_env *env,
 	switch (reason) {
 	case REASON_BOUNDS:
 		verbose(env, "R%d has unknown scalar with mixed signed bounds, %s\n",
-			off_reg == dst_reg ? dst : src, err);
+			!ptr_is_dst_reg ? dst : src, err);
 		break;
 	case REASON_TYPE:
 		verbose(env, "R%d has pointer with unsupported alu operation, %s\n",
-			off_reg == dst_reg ? src : dst, err);
+			!ptr_is_dst_reg ? src : dst, err);
 		break;
 	case REASON_PATHS:
 		verbose(env, "R%d tried to %s from different maps, paths or scalars, %s\n",
@@ -13717,7 +13718,8 @@ static int sanitize_check_bounds(struct bpf_verifier_env *env,
 static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 				   struct bpf_insn *insn,
 				   const struct bpf_reg_state *ptr_reg,
-				   const struct bpf_reg_state *off_reg)
+				   const struct bpf_reg_state *off_reg,
+				   const bool ptr_is_dst_reg)
 {
 	struct bpf_verifier_state *vstate = env->cur_state;
 	struct bpf_func_state *state = vstate->frame[vstate->curframe];
@@ -13811,9 +13813,9 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 
 	if (sanitize_needed(opcode)) {
 		ret = sanitize_ptr_alu(env, insn, ptr_reg, off_reg, dst_reg,
-				       &info, false);
+				       &info, false, ptr_is_dst_reg);
 		if (ret < 0)
-			return sanitize_err(env, insn, ret, off_reg, dst_reg);
+			return sanitize_err(env, insn, ret, off_reg, dst_reg, ptr_is_dst_reg);
 	}
 
 	switch (opcode) {
@@ -13843,7 +13845,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 		}
 		break;
 	case BPF_SUB:
-		if (dst_reg == off_reg) {
+		if (!ptr_is_dst_reg) {
 			/* scalar -= pointer.  Creates an unknown scalar */
 			verbose(env, "R%d tried to subtract pointer from scalar\n",
 				dst);
@@ -13897,7 +13899,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 		return bounds_ret;
 	if (sanitize_needed(opcode)) {
 		ret = sanitize_ptr_alu(env, insn, dst_reg, off_reg, dst_reg,
-				       &info, true);
+				       &info, true, ptr_is_dst_reg);
 		if (verifier_bug_if(!can_skip_alu_sanitation(env, insn)
 				    && !env->cur_state->speculative
 				    && bounds_ret
@@ -13906,7 +13908,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 			return -EFAULT;
 		}
 		if (ret < 0)
-			return sanitize_err(env, insn, ret, off_reg, dst_reg);
+			return sanitize_err(env, insn, ret, off_reg, dst_reg, ptr_is_dst_reg);
 	}
 
 	return 0;
@@ -14658,7 +14660,7 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 	if (sanitize_needed(opcode)) {
 		ret = sanitize_val_alu(env, insn);
 		if (ret < 0)
-			return sanitize_err(env, insn, ret, NULL, NULL);
+			return sanitize_err(env, insn, ret, NULL, NULL, true /* does it matter here? */);
 	}
 
 	/* Calculate sign/unsigned bounds and tnum for alu32 and alu64 bit ops.
@@ -14862,7 +14864,7 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
 				if (err)
 					return err;
 				return adjust_ptr_min_max_vals(env, insn,
-							       src_reg, dst_reg);
+							       src_reg, dst_reg, false);
 			}
 		} else if (ptr_reg) {
 			/* pointer += scalar */
@@ -14870,7 +14872,7 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
 			if (err)
 				return err;
 			return adjust_ptr_min_max_vals(env, insn,
-						       dst_reg, src_reg);
+						       dst_reg, src_reg, true);
 		} else if (dst_reg->precise) {
 			/* if dst_reg is precise, src_reg should be precise as well */
 			err = mark_chain_precision(env, insn->src_reg);
@@ -14886,7 +14888,7 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
 		src_reg = &off_reg;
 		if (ptr_reg) /* pointer += K */
 			return adjust_ptr_min_max_vals(env, insn,
-						       ptr_reg, src_reg);
+						       ptr_reg, src_reg, true);
 	}
 
 	/* Got here implies adding two SCALAR_VALUEs */
