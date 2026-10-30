Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361230;
	b=UXMAVdWR7XAB/TG7BieYFADtVQJdqvtFJI6LsDvjpx5BZDf1yUCZ3ZUNPusIqTwhKVMe
	 SUkpq4vXtB7aX5ZiwCVf2jDBsH/a6ctMvt5s3sqlIUfzlRbOLWmOdWv+sNHXLhbvVWpew
	 MZljKnxQ6gCVwRU+BcnC0tyfi4nhXA1bxH0sVjCIlJcZW7IGNU1m4+uu3iYBrPYSeKH5A
	 4thKcl85Ar++JaT+A2itNdcTZshzh4uC7XlafoyJYNoXWiGe3dSpcXLwtPE4bZpeM2kgI
	 twg8BpM/E84os62aNT595lyjj7CMAWElca9N0rH5Nlyg8MTCLEvCBvcHCvocuVhBk5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JKlfwuwuFRz/L9gpMsSSJDhnP0k3n8ypsbbInT07Tx0=;
	b=WBLAV0xKVTyxsNfM1kuKWRCBuz9a6CZFiXCU1HiwQ91iIxoDJuedKW8qENTNVNvRfSDq
	 0v001wz7dV3QkY9N9/u0gHYm/mQkYFS3X4aSqhbw0E4eLS9QNBPuksgr4qItJB0eKGdGD
	 ebyF+Kj+f/SWNl0ztIKclbhNJPYjP6h01vq8zDvUkyk0I012Ni3g24ihYzURTgvVbeSrK
	 aDkfkWygTP5Vh3SXLl98abLr4Ab+4sW+35E1hKHKLe+KFpQLtwFHCZZ/bohIvLcjDcLBT
	 48it/qqlqFbOxw7/LB+TrdYe7PjFGOyntrpp3t96+HuapbR8bw/e2WcFDPRg+fSP/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzoRmg8W;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639FE6070875
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 639FE6070875
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzoRmg8W
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1557128eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361229; x=1793966029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKlfwuwuFRz/L9gpMsSSJDhnP0k3n8ypsbbInT07Tx0=;
        b=wzoRmg8WRPhHU0GIEVxkeSwpu6/9hLNx7I/5T8u3tT7fK5xCkn5rFTkLdNUBX9565u
         GzqGymMxTwSFq8qe4xKhALSIHmuru6G3SL7sLjxvukUuwDcAzifqCjbn0Yx45tcHBIY8
         bNOqt8rbUyBe3zmxzzIXbpkCqcvBblls0ZbR/J0HFpXpuWFmQ9fWf3V8iB002ocbS4Xl
         5MKUfb+HgsULvizND8+nQDFRBj5sMgNOYzDFJC16+ESey+7tKpYRZ/rEdFatBmntXhtK
         5eHJyFrDSfV/6gKlOL0vZsXZoIdxftt0X7/qqx2/tKyMNQqJTrWZ52Mur9PfZ/QBCsGP
         MMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361229; x=1793966029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKlfwuwuFRz/L9gpMsSSJDhnP0k3n8ypsbbInT07Tx0=;
        b=OPcxmT1WVvaaADFEMzZ2aDOuw9HAb3WKxx53mSOxXcm+6R2M9q8j8xaXIRQZbpznR7
         m8dg4Fciecc015PeDajVXJAof6WXjWjpfAV/yVqBY1Ps1WyeUEY2x5o3EY8qJqIVvtXZ
         grCM7YRjHHB0CRe1w+lzyNp+anyfHqNQvFr5l3LjSy78ysuYq9SIkBjpR9cqZBTNUoqE
         cmCLtgM/jfGdlphxAkl3iP/rD1UHsXrghenqy6IT+D7FrxhMJjMnr5uN5Cm+Mr0dplLG
         pdKh8dRwB2p6bADw1A0iaZ20ypVaqthoaMMoJeOKwBWk/KlYU1DVr7OGW75W7dlIvHw1
         tFbg==
X-Forwarded-Encrypted: i=1; AKwUvBzzSgU3fXlFGnn1W20XimpkyUU2J7YlqJxoOPcRnu3fEs+0Ekoax9KvXWrWYj5gsqCkVvVO8zkOkEZtr9qV8Do=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj2mvRnBukC3GEilDt7+LOoOuIwvxt1AGTmJtYYwJYQFdd3B+m
	2a1F9qeyj6rksO9YV9jg1Gwm5Ooe7/cNi4iwWwH8gw6KhhjEyVUTc5sA
X-Gm-Gg: AYBFou1xJyiYik1cajBEKkoipGjTFyNHNdqYqvyLenUVkIQHoXTjHYfz0tGdze7mSr0
	bcx9lZA8XH5TDnWazJFRFe75oYGQJmJlbFzeQIqcnCfIWuM0INdGnCuekvNZ7XWMK70+S7bSvM/
	enigND5K1rqmQA+JULnHKw9jmvk5eSZYDfdfBppaRbaxJ4H/dMKi6FMXaMa+PfAyhMxWqkHIC3+
	N6ar7S+SAN6jK3kU70roVSbHFzCP4K2TGUl2QPEc95cYM9PWbmyzw74n/U3lV/3ra8isqeleqwM
	dfqPL7bT4TW6tPGrFPURy0RXKh8lFKxFu9m56xf+iBtO0E11ctjYlX9SuRa3QS/4mXDqjuu6lyg
	urrZLEn8HPYt7PziNVCqQs9QXtGfgXaAOc1SeF54HZfjoEAzipGrMxRhiguGjTlt3Ct/K2/+Y54
	FVkrnswJ9rJ37ROdrXSLP7jJMiKDsl7e7+Z70FP0f9HyUHTNuM00+j9lBZYX6DD69Lb5JI5oeVj
	xukyi1niQon8LIwi6Zkc6EjZaAKkdQkMKBfgCJJREx7YQxFFdvjsCNK0db8592VPJ8KXWr8PCl7
	oEeOkR5FLDPF049rB9coI+eA
X-Received: by 2002:a05:7022:3b88:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1ac5c64c610mr3448364c88.19.1793361229416;
        Fri, 30 Oct 2026 04:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:48 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:04 -0400
Subject: [PATCH bpf-next v2 19/22] bpf: Blind constants through the patch
 list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-19-55cd43439f7c@gmail.com>
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

bpf_jit_blind_constants() patches the program for every instruction
whose constant it blinds, with bpf_patch_insn_data() under the verifier
and bpf_patch_insn_single() otherwise.

Each of these patches costs O(prog->len). With bpf_jit_harden=2,
loading the program of a million instructions from test_verifier's
"ld_dw: xor semi-random 64 bit imms, test 5" doesn't finish in 15
minutes.

Queue the rewrites and commit them once, through the verifier env when
there is one and with bpf_patch_list_apply() otherwise. Add stubs of
the verifier env helpers that core.c calls, for builds without the
verifier.

With bpf_jit_harden=2, perf stat -r10 -- veristat -q <obj> averaged
over two runs, and test 5 timed once, x86_64 VM with 32 vCPUs, before
and after this patch:

              before        after
  pyperf180   3.173 s       0.368 s
  pyperf600   9.793 s       0.907 s
  test 5      > 900 s       5 s

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf_verifier.h | 17 +++++++++++
 kernel/bpf/core.c            | 73 +++++++++++++++++++++++---------------------
 2 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index b133bbaf614ac..cf93d473e4f0c 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -2075,10 +2075,27 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env);
 int bpf_fixup_call_args(struct bpf_verifier_env *env);
 int bpf_do_misc_fixups(struct bpf_verifier_env *env);
 int bpf_insn_def32(struct bpf_prog *prog, struct bpf_insn *insn);
+#ifdef CONFIG_BPF_SYSCALL
 struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 				    const struct bpf_insn *patch, u32 len);
 int bpf_patch_list_commit(struct bpf_verifier_env *env);
 void bpf_patch_list_free(struct bpf_verifier_env *env);
+#else
+static inline struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
+						  const struct bpf_insn *patch, u32 len)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline int bpf_patch_list_commit(struct bpf_verifier_env *env)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void bpf_patch_list_free(struct bpf_verifier_env *env)
+{
+}
+#endif
 int bpf_patch_list_del(struct bpf_verifier_env *env, u32 off);
 int bpf_patch_list_insert(struct bpf_verifier_env *env, u32 off,
 			  const struct bpf_insn *insns, u32 cnt);
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 10d2c37f81280..7d58c47b73f07 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1949,11 +1949,11 @@ void bpf_jit_prog_release_other(struct bpf_prog *fp, struct bpf_prog *fp_other)
  */
 struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bpf_prog *prog)
 {
-	struct bpf_insn insn_buff[16], aux[2];
+	struct bpf_insn insn_buff[16], aux[2], *last;
+	struct bpf_patch_list pl = {};
 	struct bpf_prog *clone, *tmp;
-	int insn_delta, insn_cnt;
 	struct bpf_insn *insn;
-	int i, rewritten;
+	int i, insn_cnt, rewritten, err = 0;
 
 	if (WARN_ON_ONCE(env && env->prog != prog))
 		return ERR_PTR(-EINVAL);
@@ -1962,7 +1962,7 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bp
 	if (!clone)
 		return ERR_PTR(-ENOMEM);
 
-	/* make sure bpf_patch_insn_data() patches the correct prog */
+	/* make sure the patches go to the clone */
 	if (env)
 		env->prog = clone;
 
@@ -1993,41 +1993,46 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bp
 		if (!rewritten)
 			continue;
 
-		if (rewritten < 0)
-			tmp = ERR_PTR(rewritten);
-		else if (env)
-			tmp = bpf_patch_insn_data(env, i, insn_buff, rewritten);
-		else
-			tmp = bpf_patch_insn_single(clone, i, insn_buff, rewritten);
-
-		if (IS_ERR_OR_NULL(tmp)) {
-			if (env)
-				/* restore the original prog */
-				env->prog = prog;
-			/* Patching may have repointed aux->prog during
-			 * realloc from the original one, so we need to
-			 * fix it up here on error.
-			 */
-			bpf_jit_prog_release_other(prog, clone);
-			if (env && fatal_signal_pending(current))
-				return ERR_PTR(-EINTR);
-			return IS_ERR(tmp) ? tmp : ERR_PTR(-ENOMEM);
+		if (rewritten < 0) {
+			err = rewritten;
+			break;
 		}
+		last = env ? bpf_patch_list_add(env, i, insn_buff, rewritten) :
+			     __bpf_patch_list_add(&pl, clone, i, insn_buff, rewritten);
+		if (IS_ERR(last)) {
+			err = PTR_ERR(last);
+			break;
+		}
+	}
 
-		clone = tmp;
-		insn_delta = rewritten - 1;
-
-		if (env)
-			env->prog = clone;
+	if (!err && env) {
+		err = bpf_patch_list_commit(env);
+		tmp = env->prog;
+	} else if (!err) {
+		tmp = bpf_patch_list_apply(clone, &pl);
+		err = PTR_ERR_OR_ZERO(tmp);
+	}
 
-		/* Walk new program and skip insns we just inserted. */
-		insn = clone->insnsi + i + insn_delta;
-		insn_cnt += insn_delta;
-		i        += insn_delta;
+	if (err) {
+		if (env) {
+			bpf_patch_list_free(env);
+			/* restore the original prog */
+			clone = env->prog;
+			env->prog = prog;
+		}
+		bpf_patch_list_release(&pl);
+		/* Patching may have repointed aux->prog during
+		 * realloc from the original one, so we need to
+		 * fix it up here on error.
+		 */
+		bpf_jit_prog_release_other(prog, clone);
+		if (env && fatal_signal_pending(current))
+			return ERR_PTR(-EINTR);
+		return ERR_PTR(err);
 	}
 
-	clone->blinded = 1;
-	return clone;
+	tmp->blinded = 1;
+	return tmp;
 }
 
 bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struct bpf_prog *prog,

-- 
2.43.0

