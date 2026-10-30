Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361134;
	b=CuZ/IQEAw00h9/JAzORJOQhgYTdfWLdyPJRBvsNc5JZ4S9DvRyBJC+gjw3/ZwCkOCijy
	 Rv7N4LKsjJ3FP7/7t1N1ua67NPcv6zbOFiQFIyINnyU3JT5wFpNUQVwnE0vQmUuLZ2kHy
	 m8sA3oTTJpV///V1ChejupUjeB1WdiFQjMlO/+2/NOhT1CxMRZPGOxc4OGec8/ZdMVHuZ
	 ufz7cgcuWFJk9GoQkcJNflG0LDh1wxqXwZyAnwunjku6u6akeqisMUXqWXdX57qw7dKi3
	 wH5oGRVCj0yybykPpT/d3yERX0PJuVcN8NaRhFyYum81T2+ViHcr7jRM91tG/v1DUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9af/XKS3Oa6ntF0hzYP7heRTeTtoyKml5lxTgNvQCXA=;
	b=ShJrkdsMRTzlNXNiFxCIa5gSFknehCwUfP98r7rIC1nZrVq1DGpKTUJNFNJeNSRTENXs
	 v9EAiloZ0EyYiNVxbz85XPxxRjyFm1+K/wAYDUgJcSKI78QwPo0HhdPVkCsH++4ubpw4l
	 /naMGIQCZ5tUElwG8GAFcf4g8FZA4sIrxcbPQxtFgp1pirWfm74o2OLAwV8tSb6+mAfjy
	 PxefAdLwdbh7BMutFMPMmJ53C9SI1q5OOO/vznMG/fvRzVIMufkrcUJdz9vDDnpEZO4df
	 Tq430EPhKjqFtLM2cReBFQJN8Yu4+5zYIQmU/CfqnVjOPSNbiW3i961qGt9hlLF3q8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IclhGUs9;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51954606A325
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51954606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IclhGUs9
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso1495872c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361133; x=1793965933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9af/XKS3Oa6ntF0hzYP7heRTeTtoyKml5lxTgNvQCXA=;
        b=IclhGUs9Lp7lwRKZN4zOJIgx1BipK2xX+DKVInSQ7zjLfKfriBQeF8tv885asTbRVM
         bG7BJfjXDEgDbqV2OoZ3Vp/DXZx3Mv1pdskfO1V/mSMKqlViObK1dcSk6zyPrPwsaGkP
         Y8JWaYkTDPuZV0Qs7LDrcG8EgNoSFY+R0ipKnTfywrTt+Ro4dTkb48YIfjHfDGFJ5tdk
         BVJ5Pd+sbn/zCoXKuTHz1+oRqFwpmQPArFCW1XGBmP0yZt8y7Dc0kYcMREWDVxs6HjSv
         FGoer1Ti+4QkzHNu0OiYbagx7CR3sOUnRMvdKNwxeIQwXFyvJX0vBJiMa8/n36gPgjge
         4j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361133; x=1793965933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9af/XKS3Oa6ntF0hzYP7heRTeTtoyKml5lxTgNvQCXA=;
        b=tLA823Dmfpg70wCKTx6ZZ50lP8wVjCuZW7t7ha9T/PxyOftudcKV8Dv2NDuQ3AaPSk
         W2bHgXZwVqKXj6MW0hn+3WZ6ycxzNtBPmVpg3sInSU+wDOerqc9igPcgoIu5XGrkgzqf
         1rf+E6K5JP81d0RqQ+weLcCRe6oXS2CTmZ7+eRGsyNTDZvKdOuWAUtTxr8GG1zosAKWN
         UukdbR6l1+ljWtbk7huMdw7iFzLZpTnaYGON+sGmmslEC4BldhY5K3vipVfXACVFnOYk
         v8r6z6AbrA1iFNGnWPuSirx2Z7TVq1+uxPbdjPTDlIZoEyPLbPMMc8fEziRJ/+rsvgT1
         ZtGA==
X-Forwarded-Encrypted: i=1; AKwUvBx5FuPsJn/Iay6opTTW9rkEG9AFBSOyL8yCtyr3cOK46ZUH/cmQLJAOOw+l/Wryoawi+8BozrU0sGY7Afc9sAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJce5bNUR81elTxyw/t+/UmzBPSXrH63CdK4M/ECDAicY8aRfOx
	sKsgYEjykR6s3uFe2pxtB4qQUfo0M1F9Yx2tlLknn4T+DG1T8pjqOrcF
X-Gm-Gg: AYBFou1b9SokdAhA0IkueoHEj5YGM4Qh1ZvSIPpAsMXY5IFJf6oadcgBH2+rXGecsqG
	3N6qeC8budZQrHceuP0ndUDG6hUUYT5JESzSJr3pkF8IHWXrSKL8A7ft8u5zJ1V1+U5RzVVqlu9
	DMaTG4NTkvSMM/U0S6IA/ULG7M8+5jHY2OLe4v4tABukMnk4Uu8aNbyBkxkI5DVrZitp/50q4k1
	LSdRNVynYfU3xg1ZmJHcZsXKKlWtPniMs7y7xTI99x5VqbUYYNWndbn7UvjYFLzdZq8pawesvnj
	phjIKGV0fzAuWSePuhle3Vhwdw5ijh/MRcYcO4ehrFAVhvv/06/Qd8DNf8Hwe0SmbbC82DM7HH4
	KKODrIfB+VfwqaWADauhCYSVw8nSN8usir9qZReDodj0Nc4wMH84lv6Uv51bfVMZcy69FVhL5MY
	mRtuGzzYF86IMZnHmlhN0isLcCTw3fIvMOobEnDiiDGYZ+fdYWRuwVvXz2jjQW1Cba8NYZbYALB
	2KRyP3nMQm+gsuXE7lDd2PaANxNzTP6vwMCRGlobQIPgeS9I4KRuUqo1hxgNzhqY64IkE/NG9uy
	X1IMhQq+toWraAlvFzvY2GLL
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr3868276c88.26.1793361133396;
        Fri, 30 Oct 2026 04:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:12 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:48 -0400
Subject: [PATCH bpf-next v2 03/22] bpf: Apply single-instruction patches of
 the verifier in place
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-3-55cd43439f7c@gmail.com>
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

bpf_patch_insn_data() replaces one instruction by one in place, and
only sets non_stack_access of its aux data from whether the new
instruction accesses memory.

bpf_patch_list_add() queues such a patch like any other, although it
moves nothing, and the commit fills in its aux data the way it does
for a longer patch, which keeps non_stack_access of the old
instruction where bpf_patch_insn_data() recomputes it.

Write a patch of a single instruction to the program right away and
adjust its aux data with adjust_insn_aux_data(), as
bpf_patch_insn_data() does.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 0697f66b1ffc1..a0dd582312d86 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -382,7 +382,8 @@ struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
 
 /*
  * Queue the replacement of insn 'off' by 'patch[0..len)' until
- * bpf_patch_list_commit(), see __bpf_patch_list_add().
+ * bpf_patch_list_commit(), see __bpf_patch_list_add(). Replacing one insn by
+ * one moves nothing and is done right away.
  */
 struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 				    const struct bpf_insn *patch, u32 len)
@@ -397,6 +398,13 @@ struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 			    env, "insn %u patched out of order", off))
 		return ERR_PTR(-EFAULT);
 
+	if (len == 1) {
+		env->prog->insnsi[off] = *patch;
+		adjust_insn_aux_data(env, env->prog, off, 1, NULL,
+				     BPF_PATCH_KEEP_TARGET);
+		return &env->prog->insnsi[off];
+	}
+
 	return __bpf_patch_list_add(pl, env->prog, off, patch, len);
 }
 

-- 
2.43.0

