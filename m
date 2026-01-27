Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A94E2DB7B4
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481828; cv=pass; b=qJCqYZx4TFiF3me8VNRFfkpWe3FS+BQVEnsYEKEFvZ2booqrgMglSRZiK7mUUh8Cf0CVrHA/vnqHsN1bAAZbs99FzLjUuRJyow79u3PxgqfJhw3r0+LpWXYAKe98GZpv15GQShbl+9xKFDLEXAUyR3qXJOBdt1Ntq8bSwOZzm6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481828; c=relaxed/simple;
	bh=BvbEr7o+FAIoZ+8+sAFL5GGnCQGVrASlVNUsngs9qy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqPEyGm0Nd/G9BQh0spHuFlIwe3oqE92U+Laom+s8nwNz5h48dp7vCWSkGC2nLITDf5/aNsV/1Fm8iWE7Hb98eO5u+69Sdu0oKLp2FVP9zLmxuDwEbhD+jRtNCAKp2bx4Y1Dzruu+gpxukyS0vgQ59oL1SL6d7K1QY0y3PiADgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmYFXohr; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmYFXohr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435903c4040so3122886f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 18:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769481825; cv=none;
        d=google.com; s=arc-20240605;
        b=jeXKTE4r2TBPrxcBpGXL2bX4RnlH4q5OhsG/TpjVPDdUjSFCwjR6WrCaHge9Ac1+Yh
         9iHNt+fpunY/kbBaCNMQVYaIL9E/rPPQnb/ByLN/814Mwq9LqHDZGg+RBA488nMniTEb
         MXfqVdUvDhl8F6ZXBwIAd6lpO/uANvCqe8cBnls90TkgA4Z+vDTaGaucIS4SxSTI1/iF
         9f5BE09SpbtmPe/0InkFq10xXFcoEkkRVJWGDaCcJNasIIsFQDL3q+55MHYn8mLrsHEw
         yGIM8Jvg6BA6uYsYz+MQVpbUSP1zSYKcr3N/Bdo/hseNT6LoEB4aV3SwWngzVG9H6+9N
         XMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sNWYftb3y5oZnnbsPB6EKKeLAdQS5y4v0pCFC0lgynQ=;
        fh=Oo7KutoAFzhuUZMcXmIZyGQ1LdcAr0vfZmsxloiiB2A=;
        b=Fki6nFuitGH2mRFkWF8EcNaakhuI2EioPIh55X05t+Jxl6rC9anoFPHwLhbbzbkKFQ
         5EKu+81+QU9EZCbB/nHtIQ6Pppf27Ntfx/2olyn8JjAB7sS1zCB4ijZj4X9GjZT88yh1
         Ty7eljb4CgOLL6FGgB4Ul2svJmyokk+gqpy18XWOC+w2BKPFRChMyoGpvpX7/C7qLFwC
         v1lGQ/T3KSD0SzPbbzwpOG4WfwzZEVP0yzPD1pxLnr8/ToMNcIeOcNxZZwdtf3x04VdF
         NMzy1NQG8tow6NrwD+PMSgel9FOhUdbPnPg7G2qV4CZbsK3hfdmChOqFnnnnLSegp4zm
         bykQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769481825; x=1770086625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNWYftb3y5oZnnbsPB6EKKeLAdQS5y4v0pCFC0lgynQ=;
        b=mmYFXohrl4Wb8lb3KVBWlYEjhtkt6DQAYXgiZEeYsgQb8Q7d5KKbgZnL0b5dids1hh
         HcF6B5chDd1sgwqXinDQGS22V24TpJNDauCMwztWln3V9ad6UJD+KUaZjT9aAqrlkMd4
         OA1yQ+IBK58EAaVFs8IiR1hVqbjDU5kf+om+Udkd/CYiYuIFzTfN8BcefAfzfQmmQiJL
         vhWJjO9tQnu9sXnrCBD4GnR4dyeki0Te2Qyojyan2s9qHXmDqa4GES234LPRTLcHm6gp
         eZGdf42XjAMSa3osUk5fDNzzlZwH9mI8gAGZDagbVfSQc3faP0mJ8o33dKr6ApXMcUCu
         pYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481825; x=1770086625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNWYftb3y5oZnnbsPB6EKKeLAdQS5y4v0pCFC0lgynQ=;
        b=xTioEZi0LL9PJiM7OMdQCMx9YCJn1h/G/xe9UpxHg1VefBNreykfkGZlrSSkzdnl86
         hZ+DXaXeG/tt28G+iiPhODTCXpsx29t9wkRHgZ4LgoXXfZWAr3GKiZoc/jX6rd/+oS4p
         26HhwS602uDWs1aqdb+YkH7EB9yb653GFWOBD93sHdjLiBOxikDHyShod7XHBn4kbb8L
         l95JqP3Jbyiyd5DmG1hF9SdSnGRWOlvPFMqF+Kvg7kV0piZrjzLZeBZucprYRt2cR2xU
         40JJsFggzw8inZPVFpBMjtOPUry2LVWQZ3Jl39V2P1rqLHBnSLOjO2PU0/l6v+avc5U1
         yoUw==
X-Forwarded-Encrypted: i=1; AJvYcCXFtIrqJ97hgDZ0MGd673Jt+f2X2y8+Fn8SvaydSOJD8nii+2OTEhrpoATrOkcijx7YPEW5MGUzzud+M9dP2kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjg1CNeASmTmrDI5iUlw7SnZGVSl9rz722pLZADbJFc6MePUn4
	+L0CIVQ7vifLR25dTdXu5s2eeD8cYCttpkkXOMMQEOForvUSgvad+hevuBwXRxq/IFYBatbwSmp
	L59W/ixsr00qI+5GI+MaZU4N09G3Yao4=
X-Gm-Gg: AZuq6aLIbE1O5ai/qHU/X+6mAqFs/O6e/EGDJ7dg0oNBgHGzY9osOexiELiU4e9MwiK
	oCO5HzWcgxF7zEnO84t4CyMzFop8On9QIygazSiA6L2KQwBlIAYAhUoxhM+tI+SlutxOFbiyy5c
	n2FmIrFaCmPKAwrOPG0Y5DoKnQ0dJvj3SV3j8cLfFNkf32ObL7Ne9TBpxp1/RND7Xtl2q3XNQci
	14M2rYVi7x98KTcNFrMJSPvRaq/+37E09h+tZRxvSDfb3KOKoBIuX5+a1/QEUto2HpFglC2jbTq
	xPpX4W0D5b2wLyCuD+MltnnVPMocr0hgdcgDMfA2I/vJTQjYXPSiGcujvys3foxyI1jx0ao6Yfd
	UVOF/YTCeoZ95XiZ48MXNDKcN
X-Received: by 2002:a05:6000:a8c:b0:435:bbd7:185f with SMTP id
 ffacd0b85a97d-435dd029a52mr105023f8f.9.1769481824811; Mon, 26 Jan 2026
 18:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126151409.52072-1-leon.hwang@linux.dev> <20260126151409.52072-5-leon.hwang@linux.dev>
In-Reply-To: <20260126151409.52072-5-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 26 Jan 2026 18:43:33 -0800
X-Gm-Features: AZwV_Qjob0hpI61E7bKlmlYJJVAtwCwP_z812BtK6il96WSFPg5NoRPUSzKlj9k
Message-ID: <CAADnVQ+PDCV=YrFhxG3gXPC3jDPdbTmsaAOKBsFceKgEware0Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 4/9] bpf: Add syscall common attributes
 support for prog_load
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, LKML <linux-kernel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

,


On Mon, Jan 26, 2026 at 7:15=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> The log buffer of common attributes would be confusing with the one in
> 'union bpf_attr' for BPF_PROG_LOAD.
>
> In order to clarify the usage of these two log buffers, they both can be
> used for logging if:
>
> * They are same, including 'log_buf', 'log_level' and 'log_size'.
> * One of them is missing, then another one will be used for logging.
>
> If they both have 'log_buf' but they are not same totally, return -EINVAL=
.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf_verifier.h |  4 +++-
>  kernel/bpf/log.c             | 29 ++++++++++++++++++++++++++---
>  kernel/bpf/syscall.c         |  9 ++++++---
>  3 files changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 4a0c5ef296b9..7eb024e83d2d 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -637,9 +637,11 @@ struct bpf_log_attr {
>         u32 log_level;
>         struct bpf_attrs *attrs;
>         u32 offsetof_log_true_size;
> +       struct bpf_attrs *attrs_common;
>  };
>
> -int bpf_prog_load_log_attr_init(struct bpf_log_attr *log_attr, struct bp=
f_attrs *attrs);
> +int bpf_prog_load_log_attr_init(struct bpf_log_attr *log_attr, struct bp=
f_attrs *attrs,
> +                               struct bpf_attrs *attrs_common);
>  int bpf_log_attr_finalize(struct bpf_log_attr *log_attr, struct bpf_veri=
fier_log *log);
>
>  #define BPF_MAX_SUBPROGS 256
> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> index 457b724c4176..c0b816e84384 100644
> --- a/kernel/bpf/log.c
> +++ b/kernel/bpf/log.c
> @@ -865,23 +865,41 @@ void print_insn_state(struct bpf_verifier_env *env,=
 const struct bpf_verifier_st
>  }
>
>  static int bpf_log_attr_init(struct bpf_log_attr *log_attr, struct bpf_a=
ttrs *attrs, u64 log_buf,
> -                            u32 log_size, u32 log_level, int offsetof_lo=
g_true_size)
> +                            u32 log_size, u32 log_level, int offsetof_lo=
g_true_size,
> +                            struct bpf_attrs *attrs_common)
>  {
> +       const struct bpf_common_attr *common =3D attrs_common ? attrs_com=
mon->attr : NULL;
> +

It seems the only point of struct bpf_attrs is to pass the attrs
here and remember them in bpf_log_attr.
It looks unnecessary. Also the cast to void and back to actual
type doesn't look pretty.
It seems all of it is to do two copy_to_bpfptr_offset() of log_true_size
in different places,
but libbpf will use only one, so let's do only one
copy_to_bpfptr_offset() and simply the whole thing.
struct bpf_log_attr only needs
  u32 offsetof_true_size;
  bpfptr_t uattr;

No need to introduce bpf_attrs and bpf_attrs_init() either.
When bpf_log_attr is inited make the choice of uattr and offset.
uattr will point at either new bpf_common_attr or old bpf_attr,
and offsetof_true_size will have 3 possible offsets.

pw-bot: cr
