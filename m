Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F593939CA
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641980; cv=pass; b=nfmYosCdgnAeOsuTzJWZXxn8vpERjkTebq2Mo0453HAsx7J3U1HJhRnHcP2NSQWWyUztLlhOZgaWe61Xl2xSj/8k3PIKq5jYJCtn1RcJU/PYBqRmNDaQo+DeMoLVig3fZolxKr3M5PzXoNdzxF8GK3uw0BS/cs0I81Zutzclrv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641980; c=relaxed/simple;
	bh=DiOBvzXn2k6n9a145LIoiJCW3EofsmMXmzFBBf+tvgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuCcvJAf/4U2EdZMN+0Sbl0LDMP9GwdJ5S7nvcxhYLv6bIg+lqFUhRwyLl9lST0XUWoJuH8PZQnUl5SWyKPbk7RSFrWRuoABzZricojusa+Kpke0x0NZgDUmWRNe6vXVd9wxaaQBk0U283zwjbcSdkcGXeRxlZxDcuFxUTdOkZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzqYpXWZ; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzqYpXWZ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82cf976ecacso2413334b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 02:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775641971; cv=none;
        d=google.com; s=arc-20240605;
        b=bWTXJN7gB9RiXsdd1o7REpgnrZUnqQm343jAd8D2jiEywACa9eYTgX3b3Al/9HMT7o
         xHN9csWV2kDYynuacAEWiYM/dgCNq8vjAzmrw4PT/5felG+tfQ3GXD81RhUxHgjXob1E
         M3mf3zErZ/x7DjXRtjW9/gptWeXxTvq0GRFv5XTEk5+jPNhwWw8pVGIZQ/0AVATg8BOR
         hnpFPc8YMbPCY1afgKwe4TehJd12Za5TXERFIzzRFh26OFOWP0MYmwX7rgQRQJVNYU9W
         GaNkCc+PcyM2Wc+FsBfFY+nB1/WlGcEaY37sIdu6NBqweM62/dwnBJ0YwOeW7oumNkvl
         pbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fIcu+EE0T1FiQ924DbTOnU3rPRa0Ol5aKhZEtawreQ=;
        fh=/Gz2d1L2YkHEot9UsB2kD/ZRb3fCMbJEnr0znuckFqs=;
        b=YZpqwSLg97QppcdDnGUlITlUDSXR6i2exJ1KO7Vr+9RrRmNRJkdiQaJ9e7+sH3/8nC
         l8mbxW1Q76wPFdE9Yhkw3aiGaWw04g2wLgPjGuK+s3XELcn21FMVc1U45fh2yAvA5lkN
         VTKqv26Q8wFlbqlFgxXCl3DXf8kzGL8eXW8Ioqw60vKBFQnf9YzoDHvLEJUon/GKezih
         IO6kjxys4iKyt16j50xG3B4aMHIF10BKLENsrKAUynUXfTQuN2JHdlSmxp5F5Dycz69h
         5VvpL/5JNFiKu0EUtVZYgFTq8i6VGYM0M/VpzRQw5A2128wD/iyjvWRduUXExDqUdUjn
         U9SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775641971; x=1776246771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fIcu+EE0T1FiQ924DbTOnU3rPRa0Ol5aKhZEtawreQ=;
        b=jzqYpXWZxD6ZIgregSuQpLcuyyA4irvM684KINoELf03kc1UQKp2uxzdo366bGyM0c
         R28yiZjD6ErBf/6RqVkLHqe9d6YpOAopKPXMvWU64NmIBS1piWMx1AHCOLCtSfcDHNSb
         ieLI/QLOwpyz4grdauhCkJyJ675El7g3SlysM4IuHuIcPEm3RXRKRxczX+VFy+qHQWKB
         +Jq+4rIQLFXoka1zAfIpsPpKA8OrS/v9BNMGOmQGWqOvZch/REXiWdTzby4vM8UDvKnW
         WBeb4pMasuOf96q3vQxuBtdeZRLmXFZkRj+Ep5auYWJtEf5zyu6lTJM8A2KwYAP+Z/LE
         csmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641971; x=1776246771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fIcu+EE0T1FiQ924DbTOnU3rPRa0Ol5aKhZEtawreQ=;
        b=C4eUVU83B6T49Fnkq28KVy8w6kG7cYYOPMldTyclIQjLNc/PAzP7MWNBbdeA2BXkd2
         rKh5T9a11qghVJRLQ/CyMgvy8qsjgPy3x9AvPp+9S+mJCHJoHyCQQLXvt+vBhex0YBpS
         AjVoXd3uKLCip73vjGTmi37zLfcGJbawq1BjAm2VBdAiFo8wze2RnUIPgmU3F/Ttoayw
         3s53txpH5HOCThUj9YrgtGWOl8N9A3l7GnV8Lvw8HJQ4iQEoxxgyxxecxt7bo5hp66M+
         UXxQTF602gkDS/hg2KzVlGc/XujVbA5sttZqxGCXqVo181P3HLKwk7KZKn9KJF4pSQzF
         wS3A==
X-Forwarded-Encrypted: i=1; AJvYcCV2tff2Z/B+MN5LbrjCmTg8Mhvn1G0LuL02SCW2WgviSOaf9eM95ysOSXun2yzWZ9iz3zv6DD9p+6I4AQUs/aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1z2rbuJvZw3DzxuQT0n2LiSUspn7IKFJLncious++tlAQlApa
	073AXDLgpdLs2mvP48zfAXW72l1uH3NMjkdvPV4bBqnhlV5gGuzOxsupeE2MgJUFoppViiMZ5ue
	NnuYpUpriXMaBSvkeOKru7iVkEfcVLN4=
X-Gm-Gg: AeBDievhdfq1Jor+hbnNQXisPbG8DZkMK9WC/YBFjCwLhfWOvxirNEAzkMcrbH/Jsg7
	5jvtSfLzC9YiTOkp5QoUD3jMl0j0NSh5eAKyucA+bh09ZTg7XPT1XCdLLXUDIY6WBxoXKHx+cn6
	coZT1S01yhuLGyZhkhutr/6IEHaeLtc8gBVWyvX8i/adfhpig98tMJt3rHbwsgP4PzDSNmzN6kP
	up7fnyjpB/wGum+ThppaXUKj8uerWfN8y5zjWGScY+/cNjBHCX4GUkKYY5cWAYg4A7gLlWgP4Q2
	c0svvEvUy23XMJlU
X-Received: by 2002:a05:6a00:22c4:b0:82c:9897:70ef with SMTP id
 d2e1a72fcca58-82d0db50dd2mr22552204b3a.27.1775641971270; Wed, 08 Apr 2026
 02:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408031416.266229-1-dongml2@chinatelecom.cn> <20260408031416.266229-2-dongml2@chinatelecom.cn>
In-Reply-To: <20260408031416.266229-2-dongml2@chinatelecom.cn>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Wed, 8 Apr 2026 17:52:39 +0800
X-Gm-Features: AQROBzBWrwE0tidToGSaPJyd1qaAblMjT1eQpeAJuW6o7uECXoh1pYXrsJLBqT4
Message-ID: <CAAWJmAbhbD68JmFFwL5HLPMVaJyGi1w7hK6t84+DL-snQ+ASmQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/3] bpf: add missing fsession to the verifier log
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	emil@etsalapatis.com, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 11:16=E2=80=AFAM Menglong Dong <menglong8.dong@gmail=
.com> wrote:
>
> The fsession attach type is missed in the verifier log in
> check_get_func_ip(), bpf_check_attach_target() and check_attach_btf_id().
> Update them to make the verifier log proper. Meanwhile, update the
> corresponding selftests.
>
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> ---
>  kernel/bpf/verifier.c                               | 8 ++++----
>  tools/testing/selftests/bpf/prog_tests/exceptions.c | 8 ++++----
>  tools/testing/selftests/bpf/verifier/sleepable.c    | 2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 594260c1f382..707eaf262307 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

Some comments in bpf_check_attach_target still need to be added or updated.

Reviewed-by: Kaitao Cheng <chengkaitao@kylinos.cn>

> @@ -11757,7 +11757,7 @@ static int check_get_func_ip(struct bpf_verifier_=
env *env)
>
>         if (type =3D=3D BPF_PROG_TYPE_TRACING) {
>                 if (!bpf_prog_has_trampoline(env->prog)) {
> -                       verbose(env, "func %s#%d supported only for fentr=
y/fexit/fmod_ret programs\n",
> +                       verbose(env, "func %s#%d supported only for fentr=
y/fexit/fsession/fmod_ret programs\n",
>                                 func_id_name(func_id), func_id);
>                         return -ENOTSUPP;
>                 }
> @@ -25561,7 +25561,7 @@ int bpf_check_attach_target(struct bpf_verifier_l=
og *log,
>         btf =3D tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
>         if (!btf) {
>                 bpf_log(log,
> -                       "FENTRY/FEXIT program can only be attached to ano=
ther program annotated with BTF\n");
> +                       "FENTRY/FEXIT/FSESSION program can only be attach=
ed to another program annotated with BTF\n");
>                 return -EINVAL;
>         }
>         t =3D btf_type_by_id(btf, btf_id);
> @@ -25686,7 +25686,7 @@ int bpf_check_attach_target(struct bpf_verifier_l=
og *log,
>         case BPF_TRACE_RAW_TP:
>                 if (tgt_prog) {
>                         bpf_log(log,
> -                               "Only FENTRY/FEXIT progs are attachable t=
o another BPF prog\n");
> +                               "Only FENTRY/FEXIT/FSESSION progs are att=
achable to another BPF prog\n");
>                         return -EINVAL;
>                 }
>                 if (!btf_type_is_typedef(t)) {
> @@ -25952,7 +25952,7 @@ static int check_attach_btf_id(struct bpf_verifie=
r_env *env)
>         }
>
>         if (prog->sleepable && !can_be_sleepable(prog)) {
> -               verbose(env, "Only fentry/fexit/fmod_ret, lsm, iter, upro=
be, and struct_ops programs can be sleepable\n");
> +               verbose(env, "Only fentry/fexit/fsession/fmod_ret, lsm, i=
ter, uprobe, and struct_ops programs can be sleepable\n");
>                 return -EINVAL;
>         }
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/=
testing/selftests/bpf/prog_tests/exceptions.c
> index 84ab73e08b0e..94a62fcd4543 100644
> --- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
> +++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
> @@ -128,7 +128,7 @@ static void test_exceptions_success(void)
>                                        bpf_program__fd(skel->progs.except=
ion_ext_mod_cb_runtime),
>                                        "exception_cb_mod"), "set_attach_t=
arget"))
>                                 goto done;
> -               }), "FENTRY/FEXIT programs cannot attach to exception cal=
lback", 0);
> +               }), "FENTRY/FEXIT/FSESSION programs cannot attach to exce=
ption callback", 0);
>
>         if (test__start_subtest("throwing fentry -> exception_cb"))
>                 RUN_EXT(-EINVAL, true, ({
> @@ -138,7 +138,7 @@ static void test_exceptions_success(void)
>                                        bpf_program__fd(skel->progs.except=
ion_ext_mod_cb_runtime),
>                                        "exception_cb_mod"), "set_attach_t=
arget"))
>                                 goto done;
> -               }), "FENTRY/FEXIT programs cannot attach to exception cal=
lback", 0);
> +               }), "FENTRY/FEXIT/FSESSION programs cannot attach to exce=
ption callback", 0);
>
>         if (test__start_subtest("non-throwing fexit -> exception_cb"))
>                 RUN_EXT(-EINVAL, true, ({
> @@ -148,7 +148,7 @@ static void test_exceptions_success(void)
>                                        bpf_program__fd(skel->progs.except=
ion_ext_mod_cb_runtime),
>                                        "exception_cb_mod"), "set_attach_t=
arget"))
>                                 goto done;
> -               }), "FENTRY/FEXIT programs cannot attach to exception cal=
lback", 0);
> +               }), "FENTRY/FEXIT/FSESSION programs cannot attach to exce=
ption callback", 0);
>
>         if (test__start_subtest("throwing fexit -> exception_cb"))
>                 RUN_EXT(-EINVAL, true, ({
> @@ -158,7 +158,7 @@ static void test_exceptions_success(void)
>                                        bpf_program__fd(skel->progs.except=
ion_ext_mod_cb_runtime),
>                                        "exception_cb_mod"), "set_attach_t=
arget"))
>                                 goto done;
> -               }), "FENTRY/FEXIT programs cannot attach to exception cal=
lback", 0);
> +               }), "FENTRY/FEXIT/FSESSION programs cannot attach to exce=
ption callback", 0);
>
>         if (test__start_subtest("throwing extension (with custom cb) -> e=
xception_cb"))
>                 RUN_EXT(-EINVAL, true, ({
> diff --git a/tools/testing/selftests/bpf/verifier/sleepable.c b/tools/tes=
ting/selftests/bpf/verifier/sleepable.c
> index 1f0d2bdc673f..c2b7f5ebf168 100644
> --- a/tools/testing/selftests/bpf/verifier/sleepable.c
> +++ b/tools/testing/selftests/bpf/verifier/sleepable.c
> @@ -85,7 +85,7 @@
>         .expected_attach_type =3D BPF_TRACE_RAW_TP,
>         .kfunc =3D "sched_switch",
>         .result =3D REJECT,
> -       .errstr =3D "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and s=
truct_ops programs can be sleepable",
> +       .errstr =3D "Only fentry/fexit/fsession/fmod_ret, lsm, iter, upro=
be, and struct_ops programs can be sleepable",
>         .flags =3D BPF_F_SLEEPABLE,
>         .runs =3D -1,
>  },
> --
> 2.53.0
>
>


--=20
Yours,
Chengkaitao
