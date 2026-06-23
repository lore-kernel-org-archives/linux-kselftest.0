Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180362580F2
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254728; cv=pass; b=O2lVjavXcEBkFIyBkKp+kcLrjFi52X2dPPz8lOHx1yXYNznMlQbWRJ0mnwSFs4omGOJ/rjxJCjyEDfxeFvBacmpm3ExhpMJnR2rfRyyrzI7c/mkvPY/in6pLuXuISTqmUu3y4lclhjtYZdMLG5N7ed67gHUl1JSgVKqIZRONgKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254728; c=relaxed/simple;
	bh=LGD3xPl8+3E8efhfIb47wFuRS4vHkc4WTgX0GgWHECw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESI7GxAVun0Z0SvrLe8BLNWmXZb7Y9y4JVhNZoOmZp/c921JStSAoSVqqE/6hCo+/bs13FtDBTQZPEg3/Du0j3gJffPeuHEYkQ1ykBMBgxj1U25iaOmj7EGPrrjFZHa6IikxWQ3esp4vJ0xQhPqiT64ygb+KPr8OeycpcGlF1Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SV/DL5Jv; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SV/DL5Jv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf22d29dabso1695485ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 15:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782254726; cv=none;
        d=google.com; s=arc-20240605;
        b=f3O6p0MNyKZRCTiEtcqPHEsne3561jTT2TmloLlFyuNENRfv3jJMkxEEy3tXhRmbZZ
         zpFHJGgVkVAVy3avpam0gW9X5Rs5BTbLH8HK/TrZVWdggFMI7JaBBJDO+ww0qmHE9IAy
         2jeInkWa9rRIDsBChj9M1movkS3tNwKOwjA80UbdRIh7nB/qNW3+s1HDz7PTiRdo2BiA
         04KWDmHBw53TpfxDkbjNQ7uhbxmL3afZBZu+DgMlptsOQAI3gUTH3rNRdqIBh+mGmUVQ
         8YAedixec1/k9G658IHk+mIKWoIYVJUWAMigYdyBU2Ty14vkG7KAkS0CN6n+zPLYjEHe
         gdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7mEjHYXmjDXroNGYVpTIt6qxLgh9zdJjaDbvnTecPAo=;
        fh=7rJveTyCb5D3u4ebBaWEvF5gkCoZK99bbUogunpx5rw=;
        b=DsWfnt5RPSWieK3SJGqso9fHMZMepSqHFQGk7zj5Lc6+UaXSlh9gz7qPCLi1Q+twtz
         5iJJl4LDjokgOR6pjgALkjuXy6cDCtrJZsBGX4MKASVczwcUFVNjQQj3pwow9zXZDw9f
         /drUGW5PHvKoADnaQzKEKWFJuE6w7TuTbkWVRCqUc4b7a7xEIYl04+E1ymwwxD851njS
         12V4ORAuAgMUKWtGAvw2tCIGCaf0WmYDanWWvYO9UVpnzYuGkEmnLgAdliDcShv5+m3j
         w/5EeG8JIl4vSlcg+jgMcW1TTcWFlRFfXfWJWnK9QraaiXQBKaMn6NDGPhsG71FZvwO2
         DybA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782254726; x=1782859526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mEjHYXmjDXroNGYVpTIt6qxLgh9zdJjaDbvnTecPAo=;
        b=SV/DL5JvInw71gIGsmUGsVNi+hnXolR3aBudhkMiD4VcHg2lOfdqmaQP78GG9H4k8v
         0ZtgYmdOZLTZ6DeHnB5yTnam6mW+2DVGpTYR3ieGBVB6fNjGgUdjHCw5SerJoACP3j9J
         sAOzvp+hKGQX7zoxob2zKJIJs/Uh+/PGOjhmoBcwwTvFSg1sHyvljZK8XRjqpDPTRu0W
         4/l7dpN8hmmioRzX+GjP+zqruDxC2GPw949P1Uk7id1UmWlZPQ1lixHOaQUtQqYMiXqY
         HhZbptdanPqqI7Ix7+z7bkJo4Wn3ZRTAr0tbHMwq6qmz8VrQNqQDOuHUYN+L0sPdMQFW
         kmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254726; x=1782859526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mEjHYXmjDXroNGYVpTIt6qxLgh9zdJjaDbvnTecPAo=;
        b=VpaOHKTH4yjo3Sr1XIXfi+8OCB1hYhbX2j80tOnWbjvGIEgkHcFeimPQEjJAfnj70j
         DqAF99ONGzMvttfDrdvQGF0CO6G2kPDuLDKgHnDiW6mGoKFFo1VIZDlwyL+GI28YzHUC
         qE9k5NvuhvHsRR4WTzh59FuHn0AM7e447oBBrQmnRPez0xqxP+q7i/SYz7lbCxrgw+A9
         xIRzLIVJXXnFV/7f8fVYMaRuZQVugPGu/N4MA+3cjwskjDXAYlX7k0iav2nqgJVcyr6H
         eWlK94FSrGkWxmJLBoiM/goh7whktIekna10M6xLHM1oF2btyb4jL3WcWTlL5b8o81A4
         iBWA==
X-Forwarded-Encrypted: i=1; AHgh+RoWhcpQdH55ia/Rvc5ihZ5cuTvEyYqUgRQCT8tMQnHxdHQCkBd1vrhCFMsV81/Vbx0Mx5K38woyxmbV/GHqqMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPFdjGYFQGtPW6swwblN/lwob6R39smbPI2u63qWj8mZKTY7A
	KOfpmah3YZWNOVzYK54sEsB6AfdPj/HOu+CKJxSoCzGDVyUUQNbtMMYJs43sAO15iPAPWdRMdi1
	dOKCysrDSsfGya3dC4R+Jmtu6kjcxwVo=
X-Gm-Gg: AfdE7cmp8galLbM39QuETF9KBAbQKq3Kpy/0E9ZWyJot9Nv8sWmm2aHXX+aGei5YQjX
	JeDJdC4xngW5Q4KTYysQ9XeLmRUQr++ctn7jH+UkNFSMrFywsUCxkp/qrTrmo3A8p9FJ9qIeN1C
	SHNNCMBOUAiS/MiE5ouHG0XZ6sgQ5ozrpVBKTvyA+pRKq67InFvE4rWnlv9gLCxrnLTZNVtBco0
	UHWBvXgJwTnx7Usvc/9TXNQqgqVf6b3Oeu0E7z0tsVzluYcW1ApZ218YqcrvEDLmrjdTZ4tygR2
	/G/tc5tLRlLsc1pwYGiRPYe+yRGzpHK7eIO4G4IaUCWwzFmHW8EqtI11wOzn2ccJgJ+E3aDytUb
	0Kgf0
X-Received: by 2002:a17:902:db08:b0:2c0:b5c1:8e22 with SMTP id
 d9443c01a7336-2c7425cae26mr174343105ad.12.1782254726243; Tue, 23 Jun 2026
 15:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-3-leon.hwang@linux.dev>
In-Reply-To: <20260622143557.22955-3-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 15:45:07 -0700
X-Gm-Features: AVVi8Cfrddz_H5TXjjUkIYgYR3GXOiBk8OG9TWZVN7_Qjb0DR56O-SDqCq1vbJE
Message-ID: <CAEf4Bzbx5xB9sA5vpe0Y37DXeJLRYsbSHpvHTca6uw5Tj7jBAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 02/11] bpf: Disallow interpreter fallback for
 user BPF_ADDR_SPACE_CAST insn
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 7:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Since interpreter is unable to handle the 'insn_is_cast_user()' insn,
> require JIT in __bpf_prog_select_runtime() when the prog has the insn.
>
> Fixes: 142fd4d2dcf5 ("bpf: Add x86-64 JIT support for bpf_addr_space_cast=
 instruction.")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf.h | 1 +
>  kernel/bpf/core.c   | 1 +
>  kernel/bpf/fixups.c | 2 ++
>  3 files changed, 4 insertions(+)
>

apologies if this was discussed before, but this seems unrelated to
the main patch set, why not send it as its own fix separately? same
for the next patch, no?



> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 7719f6528445..5e1843d2859e 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1781,6 +1781,7 @@ struct bpf_prog_aux {
>         bool changes_pkt_data;
>         bool might_sleep;
>         bool kprobe_write_ctx;
> +       bool has_addr_space_cast_insn;
>         struct {
>                 s32 keyring_serial;
>                 u8 keyring_type;
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 649cce41e13f..49398b5bd172 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -2620,6 +2620,7 @@ struct bpf_prog *__bpf_prog_select_runtime(struct b=
pf_verifier_env *env, struct
>                 goto finalize;
>
>         if (IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON) ||
> +           fp->aux->has_addr_space_cast_insn ||
>             bpf_prog_has_kfunc_call(fp))
>                 jit_needed =3D true;
>
> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> index 3cf2cc6e3ab6..2d5958774b61 100644
> --- a/kernel/bpf/fixups.c
> +++ b/kernel/bpf/fixups.c
> @@ -1523,6 +1523,8 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env=
)
>                                 insn->off =3D 0;
>                                 insn->imm =3D 0;
>                         } /* cast from as(0) to as(1) should be handled b=
y JIT */
> +                       if (insn_is_cast_user(insn))
> +                               prog->aux->has_addr_space_cast_insn =3D t=
rue;
>                         goto next_insn;
>                 }
>
> --
> 2.54.0
>
