Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792890731;
	b=SW9nMoZ1cqIudmNSLJzrioQq8mgaQ6841sLyjkbgsdEFqhcHf9BzHmyDq2/bmq7Z7M7t
	 QE43jyFyJfzCSZoPHak+fqP2hgqSnXm5ZCTL2Y0B8H5QXscEIqTo9YYOqyjNjWfEFrtR5
	 8+Q3BfT0rx5C2ai9V28JEpV2kv3NMe7yh8MJIiIbfRp5a/T71vWBTx7UyVVhRnQUukskZ
	 B+Sg4KSOfbdKhWN7ezRCVqOohvoT2Z60NYZl4KnZMMsCF3PuAFj+LxnaZUqCU+lFSdP9P
	 6hwe0UgTEAIgE75RpJFqZWwry2J363pSj+kiIZlvkDt9MlLtpKvbh73Alago+r/LN/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792890731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=JQp1/yEJUO+nFV/d8zf3vA+JnLRO6C01wwC42E0BIC8=;
	b=T+lbPU2DHHyK9GCmjIWIEa8KzcW1TfWxwLYHWwR52z22VLVFgJ7Mmm+AgOkdiyl03i+s
	 7KTHKKNqkQUgd2U0giZnbtkt2MGYZpXj+ilE6Ul8t9Ljxm3/c08vc+xRLWEkEWlFrxt5e
	 ouNbtbH5WTf1eTBKUpTwOXNIJwxJ9HpVTghapmzfLPY8q1N7eydJWR+ft1zjsmiyHqrpw
	 qAirbQfKOHN8L/dYVqAzqmv+oiHgdmRNBdOstjTJEPx88x5jyPhqs34tF7pvoKo5LQkSe
	 N2P72i8uBiiwOZZCMY1GbGOssFuBZ8jJ3YFiEXvwpd3I0Tbvf3CmYMb9TNIoHmoE+BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="VGEjkK/0";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722E606A31B
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 01:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B722E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VGEjkK/0
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e812e2b31bso11319975ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 18:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792890730; x=1793495530; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JQp1/yEJUO+nFV/d8zf3vA+JnLRO6C01wwC42E0BIC8=;
        b=VGEjkK/0QJZMzIgfE/4xs00D7+feuZrEI9pKTYht1LO9lQXdYkJRbBA+rc5+3R+D3K
         S4L63spTRD1lcJ6FRV54dhJWvBEjLdW0KPIHXyl4S7G/ZWgiNP3KAKmLLkTgXW4BGh+o
         1fSlVqGiiFljiNTK11HjtDWRJ4BYgjH+Y85SOdLz0BgQPV2QM9+VTTn8xieALZ4Sf89a
         d65vCrx12Ux1P1QuMqyv9XQBqFHmeWrIkIKa6TsE6yRcc/GxbbGgsFQ+Ugt121AJfkUA
         cc13ID2vtXhwNGg2ZzOlQVzXOuPmG5R/d0PLoB4fCTYykfhyDW1t3WdWu/HwJ6p9tbto
         XRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792890730; x=1793495530;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQp1/yEJUO+nFV/d8zf3vA+JnLRO6C01wwC42E0BIC8=;
        b=xjg45cejfgTlLOomr5QsBNahJBYRmpQeksjloA/3Uf7iDLB2c++1FEI+21zzwjlvcU
         Qc/szHMZ2QYfS3XqkdLOQccU+KHBEcIq9i7Bc//ZlngIuhhaC9eeUFZdU+Meg/+Mwujd
         +IUF2cdWLZnWEh0ktDMt+lVIoSS8aN8G+1wCB3wJOjDAtkCt4QK4mW6JctUoJ/gZLMVm
         ohRAzpmrcIJoJRV6Hqy4st6r7kdYF0l1j3QNq9ku9FQOQiN+wIXfxLTySYai7RYBCDQH
         bLIvsuP7yRkL6BwHLVyCObo5gWKG3yPXZUEBeChrpSpv5cHBROkrC13jUvkENXLDmwmb
         R7bg==
X-Forwarded-Encrypted: i=1; AKwUvBz6Gl09NROvYgOHUkWgh0GlgmQUU9EOxC80OccVtQPC59eI7gkj2WOjvurYBvgi+vmGQi14WKUOJzl84+reh2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJruEj8dgcr13NMP49l4isoMadOsZUXi8YXBtMisJYLgsiBR+77
	3FtwJPm9AhMlTICrAq3hp40LDsO4bG3IuDk5/e5KTQ1v6/XnQe/HJxGTfwu8Rg==
X-Gm-Gg: AYBFou2B7JaeZJqgKx1bs6NaAicj77hUDxKzN94nha8iV8x2DiZEi2Q8mX/cyisBMvT
	vUCdK2yEmYKCp6PMNIvb4AS405vtCtbTbdefXEiSDEUXE7ndeQW/M+koFRayVD2YhkJXGo3e9l8
	jK4L7GX38rsYf9+7qaBB3lRY0L7I5UXNjfLmoC+Gr9XIWqWWFJpVCy4fS9P/OTBNGIeyrYyHJSk
	iZ4MbBJfLblzJTl6Wa9M4934TGAj6PRfQMaFJ/+8T87pkOX9egc39EjgiPtFxYO8q6mFh2zhU21
	IA8aq68vffmfjZxAUyT+rI2JEs294sG05Emjtr/vuyY4Qc3QJECgKHkbRQtJQXwpq6SGPSMehz9
	uCS6+PhfxpDgwXaSffSi5h+dxow/39ORMY6ZFsYPH91Cot/t6fkKUTv3YEzchHoxyi7xSA1gFeP
	dlBFqSkLWT5WPBuvPigxcmu8VCteGlcSldFzg+etP/29/ZHpnGHsNK2HM7kIBb632lSyrZAkYr5
	bNXzQYLei28NJDM4Zyoj282WG2pJ2neCIiWlxLqtKeQzJl70ukXXvbYLSOtR7JNROGm8EiLOxnA
	g94RQ+4YE/1ueKQ2i+OM8hPMs4Y25sMUq76tjzJ3uefR5H79b665BHZ+FWSn
X-Received: by 2002:a17:90b:2891:b0:3ac:a7ee:6761 with SMTP id 98e67ed59e1d1-3adead4466fmr2879774a91.21.1792890729981;
        Sat, 24 Oct 2026 18:12:09 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm3888643a91.2.2026.10.24.18.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 18:12:09 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 01:12:09 +0000
Message-Id: <DMDIPYF3NTY0.3SN2PAZ1PG9J2@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <co+eada64ce90ecebce@bugs.sh>, "Xiang Mei"
 <xmei5@asu.edu>
Subject: Re: [PATCH bpf v2 1/2] bpf: Validate stack arg reads against caller
 state
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261021080100.2663618-1-bestswngs@gmail.com>
In-Reply-To: <20261021080100.2663618-1-bestswngs@gmail.com>

On Wed Oct 21, 2026 at 8:00 AM UTC, Weiming Shi wrote:
> check_stack_arg_read() bounds a stack argument index with the callee's
> BTF-derived argument count, then uses the index in the caller's
> stack_arg_regs[] array. The array's actual logical length is recorded in
> caller->out_stack_arg_cnt, so the bound and indexed object can diverge.
>
> A crafted BPF_PROG_LOAD can use an argument mismatch to mark a static
> subprogram's BTF information unreliable. Later calls return from
> btf_check_subprog_call() before check_outgoing_stack_args(), while
> check_func_call() continues the static call on -EINVAL. The callee can
> then read a slot that the caller never allocated or initialized. The
> earlier commit 4286f5deee14 ("bpf: Validate outgoing stack args when
> btf_prepare_func_args fails") closed this hole for the first call, but
> not for later calls after the subprogram has been marked unreliable.
>
> Callbacks have a related problem. The verifier can make incoming stack
> arguments readable from outgoing slots at the helper call site. However,
> helpers and kfuncs invoke callbacks through an ABI that passes at most fi=
ve
> arguments, so the runtime callback receives no stack arguments. Async
> callback verification can also reach check_stack_arg_read() without a
> caller frame.
>
> On x86-64, KASAN reports the direct-call out-of-bounds copy as:
>
>   BUG: KASAN: slab-out-of-bounds in check_load_mem+0xb51/0xc60
>   Read of size 80 at addr ffff8881009af550 by task poc/131
>   Call Trace:
>    check_stack_arg_read at kernel/bpf/verifier.c:4234
>    (inlined by) check_load_mem at kernel/bpf/verifier.c:6645
>    do_check_common at kernel/bpf/verifier.c:19568
>    bpf_check at kernel/bpf/verifier.c:21318
>    bpf_prog_load at kernel/bpf/syscall.c:3134
>
> Reject callback subprograms with incoming stack arguments before their
> state is pushed. For direct calls, retrieve the slot with
> bpf_get_spilled_stack_arg(), which validates the index against the caller=
's
> out_stack_arg_cnt and rejects uninitialized slots before copying the
> register state.
>
> Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
> Reported-by: <co+eada64ce90ecebce@bugs.sh>
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>

looks good, but doesn't apply.
please rebase on top of bpf tree.

pw-bot: cr
