Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361214;
	b=yEgsTiVTcXSQNSEzwcMDByEP58bLQOLY/s101uLASGhIfXswDL/+S5z7LIF4U/Pteqo3
	 2SuOo2Q9upawC/0+Tk3G1PaPDRWomXN92J2884LdWl41N0fx5jj9OAaVtPWXHkphTlj1v
	 ymG71zBZzxYBRiALdwMKYFUvbIdkCw6pfIcwLYtuVkzbhSQy67a8Uo4IrVgUe5nohWhD4
	 KcaiXKf0Z/ZJ4IUeentuOHlKMF/SkESWbpsfLBizLqH6J51JnkIDSHvxsbM4MGAD8uIIy
	 K5H/ltq7TIgcB4dU1lxQS4TaW4wTx2mOKgFBJzJzVrseFnZ3HbRBX2JOYistQI8BuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UoxK9/1cELFnYp6P6sTQoajbgJH7VOzsaFPRmpU26Ms=;
	b=MrvWfiiF/CbDKeo1k8puaeg6meaYpoMQONfg2hZ62FGy+9zVCfLHDhbq9ULNxOiwHTqn
	 b0bnrv9l+FpIDgSKWTDn327CkZ5xzdAN9OAk4KrReS68xZ3agEjlNVcveEmGpokWqxTOp
	 ofUlrrfvNKAfa4BbJ1GsC6pI+Xb4K/5PUbWkmo3M2aUKtGmGSwcV3KHAukMHeepQXAm3H
	 07euQvtPPLK4UW/oWgK0vBhXachQx2wXNfjhQOGLOAFl71Gm/olxPrAwSWJF16PscTk/j
	 2zRJJ95b7O4cUxiMn2tVXFUgsjd8/cUV2PVG0ias8vKg+MIrgj0p47qW5xfRRvnqM6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kv4pJV71;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DB160A263C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DB160A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kv4pJV71
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so493809c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361213; x=1793966013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoxK9/1cELFnYp6P6sTQoajbgJH7VOzsaFPRmpU26Ms=;
        b=kv4pJV71P9w8huHCPikTg6D2/Y5g7GIosa6wvzL6nFCWp7rfHA5ZKfYnj1dJGWRWIy
         xq3oHZA+xBaWO3zh17klv1eaoRi34y1CwgH2v4uLDAhz0Xp/OJZRpNSOGx+6DIwuO9mn
         eg8ZjMEFHgQl+OWOgfUTIk0K7L95SjRq/Rydb5E2uZAtuGip0Ig+5xU4eKGeyVZWLVWC
         cC0jafJ9YCzKuULrjzxgIEVAvjZGMyng/6crdS5xV9vQia/3a5tUGOjJq4BWER0xp9eY
         /CLtbxeZZ9bUfvh6yAPkwPICo+Cvv+tYLr1OSzCyZmtXtcNTOEPzUVXbCnEqiM5eMtX9
         GW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361213; x=1793966013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoxK9/1cELFnYp6P6sTQoajbgJH7VOzsaFPRmpU26Ms=;
        b=z4CcmzIJFxJpEvaVk9LN2B2cCC9Wd6EoBhl+GmlfiBIGfdVKE76ognaTVMhNwouncA
         1Qw8NyL03fsYdoYCeb2pO60JWjC3VwnXni+ipujAPAhIwY2WJCx/vkBpiEI5OLjs3zuq
         /Or7Ozs9GoVoGvMWOkNlY/v+5asb0I+aQUjgg9lKvLCZSScuWJEBA1oZ9kbcYKMox6In
         unNbX5/fxnGfWwJQbSGFkcb+htgcJ1xP40FFARK5vG+gKrfugVTmLjKuzbUJULWdnu+i
         pp84269cMVVZ2gmkD6Q1sWDPejGFcMs27ZH5rnlUpsZKryTsxkoTRnWJ53J+h0zfZo9H
         Fg1g==
X-Forwarded-Encrypted: i=1; AKwUvByKE0o219kWB78x3/9q9FZ+TRa0Y6wBMuc7In67+hNaayIxsr/2uNf1R8bkfrqIegYKwQWSEqOrHrmek2jYem0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdTq73Wg1dpzyuUa7lzmkIlAI23qdpV3B0FQQIHPd3JR9o9lbQ
	DdPw0kgU6DxAlnBXvwKJ6OOZsnUrGR9wcFUPjSHPBEMsxW4FQnJZdorY
X-Gm-Gg: AYBFou1fzG2YkqsPMxIEe+fxXMZd8m+E8DqXfdjAmFOLQXRt1vG70W+NbOyxVlslgX9
	PVcmCNtqnJAG0kD2NwcfsTFyIHeqQiYO1CZiRhZYjVxU6xiitKYJRL5GNUv54Uj3KqyQA+cjQV6
	abEhN0Ukc0Np8V6lQ/+14tLLCWMOcuRCcI9zNZH/tbjo8NyNjiGp3JyLDjg8YFv5LfSwx8rGnl0
	VhFNnxAnRYFuWbRt8OacLHeAPbxtKfByOAh7pnilQEUsvITz5NFA9fZX9ggffrzRmhSSRhzLynj
	7yEPqs9fRC+T4BzVWoU1/z3ocJ6i8MX2FTJs19a1+9GdbG4vS+yJusaDpiMof7qwlS6Q7RqS57e
	lXGVzvNrOyvhPeMIDEql4GxD8gFSaYHVPi1cT8N8A3jnnO7dEqoe4VtGgOWY2M5WDBeGuO5HxsP
	dkkNbiTReHvlgggWUcfsO3K8E4bmbfyhimmljnjPwOZULZUsJIOpqdEXxVnEBJpMNFaF9OZ/z7s
	jGhhKpCz4ABs/tjxDkSj5f9yEUqGyg9p0K3ZIuI19dSIKmPvW1dpzMq4jzgE4TyfznQmtuq2mHQ
	YUV7GEX6IQ1maZ/x30l6jttI
X-Received: by 2002:a05:701b:4187:10b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1ac5e322fb7mr3093981c88.20.1793361213355;
        Fri, 30 Oct 2026 04:53:33 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:01 -0400
Subject: [PATCH bpf-next v2 16/22] bpf: Append the hidden subprog through
 the patch list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-16-55cd43439f7c@gmail.com>
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

add_hidden_subprog() appends the subprog for the exception callback by
patching the last instruction of the program with itself followed by
the new instructions.

It does that with bpf_patch_insn_data(), which is going away once all
passes use the patch list.

Queue that patch with bpf_patch_list_add() and commit it right away.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index f55ac904b4e78..84aaaa4632aa3 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1865,7 +1865,8 @@ int bpf_fixup_call_args(struct bpf_verifier_env *env)
 static int add_hidden_subprog(struct bpf_verifier_env *env, struct bpf_insn *patch, int len)
 {
 	struct bpf_subprog_info *info = env->subprog_info;
-	int cnt = env->subprog_cnt;
+	int err, cnt = env->subprog_cnt;
+	struct bpf_insn *last;
 	struct bpf_prog *prog;
 
 	/* We only reserve one slot for hidden subprogs in subprog_info. */
@@ -1874,13 +1875,15 @@ static int add_hidden_subprog(struct bpf_verifier_env *env, struct bpf_insn *pat
 		return -EFAULT;
 	}
 	/* We're not patching any existing instruction, just appending the new
-	 * ones for the hidden subprog. Hence all of the adjustment operations
-	 * in bpf_patch_insn_data are no-ops.
+	 * ones for the hidden subprog.
 	 */
-	prog = bpf_patch_insn_data(env, env->prog->len - 1, patch, len);
-	if (!prog)
-		return -ENOMEM;
-	env->prog = prog;
+	last = bpf_patch_list_add(env, env->prog->len - 1, patch, len);
+	if (IS_ERR(last))
+		return PTR_ERR(last);
+	err = bpf_patch_list_commit(env);
+	if (err)
+		return err;
+	prog = env->prog;
 	info[cnt + 1].start = info[cnt].start;
 	info[cnt].start = prog->len - len + 1;
 	/* The patch ends with the exit. */

-- 
2.43.0

