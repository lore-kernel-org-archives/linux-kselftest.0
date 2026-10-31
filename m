Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424586;
	b=ufOUzpIlJpPujHLe2AeM1525wr/0mFyONMqg944VZ7Wf5HSbIVnC2rEilrOPJ1uPt7DM
	 0AKzbO1w89r/xp0/rrwm5H4p3qDqPKPVu7Km3LuIJxQ4lsvmtLuId0SCb3ZULwbqrskGB
	 63zvGPui8AAVP50QgjOUJJHHbh8+PmIPiZ0B9k+ppgiDJqrtpjli+Y1xuFo+m1aKMJY0z
	 oI2hB9W7OJyNKHHid2VDjyctqS7HENgRSHpcgQSDG3DSePU6MDxIKzXYIZONCbyUizo0e
	 c2CyM/mPKQFKHTz92wvZESJmXeW3+orAL0G+4JtlHNbEnZmPtmLmMZJFWbodx0Bt3+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=pPCYtQzMZtajXWmvtb2q+ThOcxjNXkaUo5PJHZCV/CM=;
	b=5jORFSpHTEnsspoqDieVAtxk+nk+DDTyB/UU6zeTroYLB+8X1uii42kRLj1d/D7BcPQE
	 APG7yxJoCLnObN+CIkqPLbQNrPFIgWU79VaxnTINk4p/1UqT+2LvCnB/6FSD25H9xalE1
	 M6p+RKEZVCnDgNcvxL+2NICQ+BysPJzaS2ATxBjhxajiiwjysWHC+YK2+4tHvgBHtrxf0
	 nDZ04/PICRuWr/wk/udu/U89Zo6891YQrl+dxUW+CU/lW770mdXA51iG9LVjCfjlYjstd
	 PqeraJhhf9n7L/4hB5fHMH0iq5ddLaJAaMvz6djZsXC4RjQzeXMnOEdzo2rmTCkFvHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocmjj6TV;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75B8606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 05:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocmjj6TV
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso747957a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 22:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793424585; x=1794029385; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPCYtQzMZtajXWmvtb2q+ThOcxjNXkaUo5PJHZCV/CM=;
        b=ocmjj6TVIvlHNqe4suqwOILLkAWxwzL2+oK3CrsX4xlSxWKBbGvRQxBURZ6Hoa1vkQ
         /MCoc2qsnAJwrym5ldC7tWZaik4xJgiRUwuGDrM013ukasqiZTX7EOjTDpKU2W+nv+Lp
         +r4Oyojn0AcdY6tZI32VcYdlKIM6FZXMEnakR+WWXid2sLZbpKB2/DlSyHH1X9/6NOvn
         sKT/Ve5Yr5wO+HcxxcwNV1VEsFPg2aUVDlSq1Hl+Ab8rnBHiM+OkVbJMzkyM1SxoME+8
         HoDqGtybBm/6JHnUlk2lhcLE9k8UlOQpBE8/nCzMyQPYtUIaTIHzDPiMp9qXS6OCoOaS
         BOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793424585; x=1794029385;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPCYtQzMZtajXWmvtb2q+ThOcxjNXkaUo5PJHZCV/CM=;
        b=T1OiwI/91h6w8//ouR5bjZMae+FrjTtRFH0oB1IGhwKUU8jkFKAsTmKzM4AaR+UJHl
         TZjm3rdkqAkptukMWCnrVQbvGG8vci8GW1VlqJiYhiZMvbHocLXNrawegqrTFDkJI921
         J/qlhUph7+U4rOS+UFCNzRYXXxVgpMdJTdyYCWktzs8k7ZWokgWR1fsHhGcleeUqsg4A
         2bHmRpqWIdg1CABLPg9osPG/SZ0FQSoFHxaYRZIAiM+3Nhma7yfLNM28YafMuWqgY0Wx
         pBax6ZQRvV7tqG9cuc+hNSgCY109IBNNOVnf0DVv+b9Ka5TeyV2lB5UiRNtPnXCP7dzK
         oa3w==
X-Forwarded-Encrypted: i=1; AKwUvBzYC281CoWuI0lJMOHI0o7HzxaeRzFURdhK/AzimN7Pn0bw9EgsueDAzVrKX0Po3TPuF2799FF0u2NYhkDrWzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYITkNqnpaTcPquSGD15GM2C7zUC1aaDHWnoJZwW9cMeej+7ZzXT
	PxUgM3wTvbZBGqCIMCzwSQYUAPn0JfLUYoF8Toaqp3rvUgIUS2Zbgrp8
X-Gm-Gg: AYBFou0ejsBZmSDsV85Pk5hg/UN9v1q30YUTzlC29Xq5awGqHyIdRsNKj7alh/23t8Y
	Uqgq9RneyOMaQ8tPcttloq09QHr1Du4Frxea26Rbgoviid4RxVPiaVdQL8l/cJ//DO9CusmgvD/
	Zwyw199y/b39LCU/yB/rLbvLDWFT8Nq1JoqGSyXrjvU9M7Kd+/bhXD+nsqnzZkuwxktQupU3B/u
	V9bT5Wi5J1Jo3clN8vNZvw+q3IlsswhqVJDCaBz+D/JmynDBEJ6wVkcypTB5gvkFWa0bIlPqq9X
	ZYCiu6M/0Kl2Ik1+h3thUgCDQwX5PoV4eyiTRKPtQ4QlcjlQOHgp0SvNYCCHjfwPU/aiE0VDL+N
	5BqUb+ojjD4ORO8PNtJ+e3mLz+ZjMOudD37J6v4jzOUpPKFD/OV87EuehwNtUO1ll8obBkAZGVX
	WkfiN3SH4D9FoC4oXaa436N4xRlUqwjVK5NYMATgcj7Cvyvf3dL0aq7rBxdqA6nvtxrhGnj6LWN
	i/p2RUGckpD+UbwjzF0JEtXYmRNmh/gFa1qqx0EKyh/MU1Qylf4Dhv5NPBD267KK7OdAap/2zmA
	EHx5NgfRD70bpf6hvoqqDDrDr9I176u1UCmJVxTKoaEcrjysjgsGz6cLR7zBj2L+mKP75sAtnPd
	hzMhmNGcNLwctAIGuOYWxHIse6kHQpm3wgFY=
X-Received: by 2002:a17:90b:4c4c:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3ae8972b662mr2341161a91.19.1793424584986;
        Fri, 30 Oct 2026 22:29:44 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm2582771a91.4.2026.10.30.22.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 22:29:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 05:29:43 +0000
Message-Id: <DMIRYFU9YEX1.14HBEXD0UQR7H@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 07/22] bpf: Let the patch list remove
 instructions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-7-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com> <20261030-bpf-verifier-patch-batch-v2-7-55cd43439f7c@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 04:51 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:
>  	bpf_patch_image_install(prog, &img);
[...]
> +	/* before subprogs are removed, since it looks at them */
>  	for (i = 0; i < env->func_ptr_cnt; i++) {
>  		struct bpf_func_ptr *fp = &env->func_ptrs[i];
> +		int subprog;
>
>  		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
>  			continue;
> +		if (bpf_patch_image_deleted(&img, fp->xlated_off)) {
> +			subprog = bpf_find_subprog(env, fp->xlated_off);
> +			if (subprog <= 0 ||

Sashiko is right. It's real, and it crashes the kernel.

bpf_patch_image_install() already set prog->len to the new length.
bpf_find_subprog() gets an old offset and compares it with prog->len.
When the prog shrinks enough it doesn't find a live function.
The func ptr is marked as deleted and the slot in .rodata becomes NULL.

It needs two things:
- the first insn of the function goes away as a nop
- this commit removes at least (end of prog - start of function) insns

Plain C hits it:

  #include <linux/bpf.h>
  #include <bpf/bpf_helpers.h>

  struct st { int a; } g = { .a = 10 };

  #define OP(name, expr)					\
  static __noinline int name(struct st *s)		\
  {							\
  	if (!s)						\
  		return bpf_get_prandom_u32();		\
  	return expr;					\
  }
  OP(op_a, s->a + 2) OP(op_b, s->a + 3) OP(op_c, s->a + 4) OP(op_d, s->a + 5)
  OP(op_e, s->a + 6) OP(op_f, s->a + 7) OP(op_g, s->a + 8) OP(op_h, s->a + 9)

  static int (* const volatile ops[])(struct st *) = {
  	op_a, op_b, op_c, op_d, op_e, op_f, op_g, op_h
  };

  SEC("socket")
  int vt_all(struct __sk_buff *skb)
  {
  	int i, sum = 0;

  	for (i = 0; i < 8; i++)
  		sum += ops[i](&g);
  	return sum;
  }
  char _license[] SEC("license") = "GPL";

The verifier knows that &g is not NULL, so every op starts with a nop.

  bpf-next:     Return value: 124
  this series:  BUG: kernel NULL pointer dereference, address: 0000000000000000
                RIP: 0010:0x0

That's the shape of any table of ops.

The minimal fix is to do the lookup before the install.
On top of the whole series:

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index a442188647bc..de758ce7afac 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -451,6 +451,28 @@ int bpf_patch_list_commit(struct bpf_verifier_env *env)
 		}
 	}
 
+	/*
+	 * Before the new image is installed and subprogs are removed:
+	 * bpf_find_subprog() looks at prog->len and at the subprogs.
+	 */
+	for (i = 0; i < env->func_ptr_cnt; i++) {
+		struct bpf_func_ptr *fp = &env->func_ptrs[i];
+		int subprog;
+
+		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
+			continue;
+		if (bpf_patch_image_deleted(&img, fp->xlated_off)) {
+			subprog = bpf_find_subprog(env, fp->xlated_off);
+			if (subprog <= 0 ||
+			    img.new_off[env->subprog_info[subprog].start] ==
+			    img.new_off[env->subprog_info[subprog + 1].start]) {
+				fp->xlated_off = BPF_FUNC_PTR_DELETED;
+				continue;
+			}
+		}
+		fp->xlated_off = bpf_patch_image_remap(&img, img.new_off, fp->xlated_off);
+	}
+
 	bpf_patch_image_install(prog, &img);
 
 	for (i = 0, k = 0; i < img.cnt; i = end) {
@@ -474,25 +496,6 @@ int bpf_patch_list_commit(struct bpf_verifier_env *env)
 	env->insn_aux_data_len = img.new_cnt;
 	data = NULL;
 
-	/* before subprogs are removed, since it looks at them */
-	for (i = 0; i < env->func_ptr_cnt; i++) {
-		struct bpf_func_ptr *fp = &env->func_ptrs[i];
-		int subprog;
-
-		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
-			continue;
-		if (bpf_patch_image_deleted(&img, fp->xlated_off)) {
-			subprog = bpf_find_subprog(env, fp->xlated_off);
-			if (subprog <= 0 ||
-			    img.new_off[env->subprog_info[subprog].start] ==
-			    img.new_off[env->subprog_info[subprog + 1].start]) {
-				fp->xlated_off = BPF_FUNC_PTR_DELETED;
-				continue;
-			}
-		}
-		fp->xlated_off = bpf_patch_image_remap(&img, img.new_off, fp->xlated_off);
-	}
-
 	if (img.del)
 		patch_list_del_subprogs(env, img.new_off);
 

With it the prog above returns 124.

But that fixes one instance.
The commit changes prog->len, aux data, func ptrs, subprogs, line info and
insn arrays one after another, and helpers read env and prog in between.
So the order of the steps is load-bearing, and nothing says so.
Make each table a function of (old value, new_off[]), with no helper that
looks at env or prog, and install the image as the last step.
Then this class of bugs cannot happen.

Please add a selftest for it: callx through a pointer in .rodata, the callee
starts with a nop, and main loses more insns than the callee has.
All tests in patches 21 and 22 pass on bpf-next without the series,
so they don't tell whether a remap rule of the commit is wrong.

Also patches 4 and 6 don't apply anymore, since arena_scalar is gone.

Other than that the patches look great.

pw-bot: cr
