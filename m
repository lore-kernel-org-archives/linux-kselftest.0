Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCA742848A
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234544; cv=pass; b=EjWCNqQwNWX4cWMJJZV/wGemqS2RJKC0ndoze29pTvjOssECANDINYWxyGvdxTkt2saAPCT+CWR97whfWQa9IEdWcfhDqx5JzEm1je7mTeCjIL8Aezey80E5NhDaKIRGa1YvurQWh8X0eTaaehCGBKHxVdU8iF9r9kwH8F/dVX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234544; c=relaxed/simple;
	bh=P4RccTdALVk7KXo5G3kL+D6XbgyLZgvTIID4CJSA/Zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgVuc2HUZ69elvvz+2JQEl0TzQ/lheOCH4vbN2ci0tjkKffCYWNQHucAtoA5ZKOdQmJF/0260tzYUlmrcHqoULYYyuyDKoDpp+V6faieAnZ+4M/ZbWb+Fm0hXIE+rE2bNI01yxG7RxEHYCqGNZrYOLGZZ0J1iQHWUORANmRYuiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHBjjc7i; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHBjjc7i"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d67f1877so1200615ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 11:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770234543; cv=none;
        d=google.com; s=arc-20240605;
        b=jWBbHk33LPt0RBy9q8dRB45usQPOAFO7mn/73bggUFgH7lkhiSWDRXoSrAdc35hUAx
         NCcUSN6LBbIRQmUz2Vy6VYkwcenQn+n8Gm4EDhLOjuf092pNxfSD/oJ1uk+okI3291pH
         3gg9ZjOWj7w8FPW25RELfUm1C2/NF4kwW9b2y+byeT4elm1/QhEcSWMGy698eLUeZdtP
         mEQA2pgWElZQskEyCU+633jXg2ncK4l/cmVpqUL2Y8Iii1tlV4+ws2cvwSj47+7cO7vh
         4BR/j9xVqD9ezgae8zfsfqf3LvtIoA05bPj4yHbkmndmgkKIuYpo0F8vVYon/yid9Wrj
         Z/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h+M8Htr9ti73Lf5CZxUjPKlAeSUlxTCFeqOWZih+5WY=;
        fh=p0lurabcO78c7qOxJLupbNv3y+GASd1IlqUoERcxtQk=;
        b=BCj80wA+vae1TJQbOYd0plQeMmF71/oCTkIgS6JkAqAvEPgE2sBsr/4LZkf1HwFn7s
         +p6aNt1tNO6pxVP26y64xAVovcValjZNnIG6JQJGna60luNUT886Cy89KTutkIyNiHkS
         4b2DOJBTFPl5YLCR9w/GmMG3NXB68Ekjy0Nist6YlztXfQ5rSsckMdlOJmGVamBWyfOQ
         +MLOau7V0Sk8qPCrnnzRRCItVQts4WXWiP1lSp89fljag7fz4c8sZRWspJRY4V4RL1p4
         cwo7R8D89G3Cew71W6lpIK2BGkOWKfAkGWFoMypPdDAotLLd+SI0L+djWz3+h4DZ8x/n
         V0GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770234543; x=1770839343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+M8Htr9ti73Lf5CZxUjPKlAeSUlxTCFeqOWZih+5WY=;
        b=cHBjjc7iLYz5ndTbkY8fkF0/MP5ECbbQnxbQkJFDBaodpp7nubmlOhd1roRx4JfggI
         LYeEo3jTuisOAmtfVhP+h/cLQirxjv/XE0aWSXUm0B/6IzFeGJ3uqwbxB7thJxEBsT7T
         V2PnsMVf/p9zg1Cb893QKi6hHGCLIaARhuyi6f2/WR64mJY63H+6/6uP7rfAmB4bgj9q
         BpmFgM4YhZvcMBQ2wrcUUz6H5gaxv6aj0y6zd0SDro63l5nmVxIiIpdxuWt//XvQqLEQ
         TvtjQqHY0iq8DTNqaa0DfLGIChMAXL1RUGbjPMOFAy1u4N82ig9WFLlFQSzmRAJh5kdz
         +Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234543; x=1770839343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h+M8Htr9ti73Lf5CZxUjPKlAeSUlxTCFeqOWZih+5WY=;
        b=E6F/BUHJlDR+r3pQM2UUl9Yn2GToc/hZ1xZa0BVpnx7sy+6rDZOrP29bN1lxzdHIpW
         5QfuTru+U4pfPg8dPb0M6MCODxpAxtsGyqglxvO3aL+ti3UDUgX3F2sTtzndasp5f6Lw
         /SQ1OzxCvWs9i0ZzqoKawPDT5hE1Oq9O55IDcYm6HM8YvGJFUPH/LnGyproEa0gFWhUK
         g8CZfhcBqHHgZZcSivVw9xjfG6hKK4A0/ySZhlzFmahvV+cOVCvGTELSJdS1PyuVNxqm
         GEj3Nyog8YNka22zGRvOmMabY6A+U6rBXbyUWzbLwOOx2Z7xLCuHi3rgfJgXtqDiwr9T
         UZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCV3l5QcoIndWUmogaVNCExHNafHlI/mrwONtTPBzHjueacl3qhkQvQGmRMVtg9TB1Rvt7AV0V7AlGgCSXQ3bDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QLF9Io1eD5MmEUvmKa0PD7z/tcPfg3wpPX9jA+oCaPDwXYGd
	/1Er+bqqLGXRcZJH1huElMG76oY2aydIyMkhYuapvHJdyndaFca8x70CaUOXLy3jRjxJZx8PFA4
	8MHc49C5QAW5Ynkjpuf+qPYzZwuzFXhM=
X-Gm-Gg: AZuq6aIJ7s8HzW4TEQaaMfp87v7Jw6RX1qxXENgWnk0xr9ljX4dPkdyOnXIUAyL2xJ8
	/RFwrSCvyFgZbpcIECDnF8qSyx/9pgVODei4zYnjW+XUDOlpb6JXVF7q5KxGmWf6gcLaD8qRJLS
	GS7kS3UNs0uZ6FSYBhtsjfqSPv7+rInaBwkJPZGYNXY5ieFYSKCY8Uo88MIyh1wWlMHwv0J/t5O
	2G/9uYRNbwk75DBhRhqkfdTB7Bsldm1b5jNCpS39Rr7P3Nco4WvDTnL1pKzm6y3ogt8ZvApqpO2
	JCy1Wf5Irwc=
X-Received: by 2002:a17:902:e88d:b0:295:560a:e499 with SMTP id
 d9443c01a7336-2a933bc9b8amr48387865ad.5.1770234543336; Wed, 04 Feb 2026
 11:49:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144046.30651-1-leon.hwang@linux.dev> <20260202144046.30651-5-leon.hwang@linux.dev>
In-Reply-To: <20260202144046.30651-5-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Feb 2026 11:48:48 -0800
X-Gm-Features: AZwV_QjUlT_cWqgjztt8E7bGlgaHJ3gG7CwUG4HZmCNdazdNONiDcafxsvfD97M
Message-ID: <CAEf4Bza-PM9ExqJS=Q_oj7Cqc5dvmbN_Zv9-4UnJNtsZU28FoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 4/9] bpf: Add syscall common attributes
 support for prog_load
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
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
	Rong Tao <rongtao@cestc.cn>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:42=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> BPF_PROG_LOAD can now provide log parameters through both union bpf_attr
> and struct bpf_common_attr. Define clear conflict and precedence rules:
>
> - if both are provided and log_buf/log_size/log_level match, use them;
> - if only one side provides a log buffer, use that one;
> - if both provide log buffers but differ, return -EINVAL.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf_verifier.h |  3 ++-
>  kernel/bpf/log.c             | 24 ++++++++++++++++++++++--
>  kernel/bpf/syscall.c         |  3 ++-
>  3 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index c805b85b6f7a..0d106fddbbc5 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -638,7 +638,8 @@ struct bpf_log_attr {
>  };
>
>  int bpf_prog_load_log_attr_init(struct bpf_log_attr *attr_log, union bpf=
_attr *attr,
> -                               bpfptr_t uattr, u32 size);
> +                               bpfptr_t uattr, u32 size, struct bpf_comm=
on_attr *attr_common,
> +                               bpfptr_t uattr_common, u32 size_common);
>  int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct bpf_verifier=
_log *log);
>
>  #define BPF_MAX_SUBPROGS 256
> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> index ff579fcba36f..345005ba98dd 100644
> --- a/kernel/bpf/log.c
> +++ b/kernel/bpf/log.c
> @@ -873,10 +873,30 @@ static void bpf_log_attr_init(struct bpf_log_attr *=
attr_log, int offsetof_true_s
>         attr_log->uattr =3D uattr;
>  }
>
> +static bool bpf_log_attrs_diff(struct bpf_common_attr *common, u64 log_b=
uf, u32 log_size,
> +                              u32 log_level)
> +{
> +       return log_buf && common->log_buf && (log_buf !=3D common->log_bu=
f ||
> +                                             log_size !=3D common->log_s=
ize ||
> +                                             log_level !=3D common->log_=
level);

let's validate (unless we do this somewhere else) that if log_buf is
set, then log_size and log_level (? not sure, maybe zero is fine) are
set, or all three are not set. Same for common->log* fields...


> +}
> +
>  int bpf_prog_load_log_attr_init(struct bpf_log_attr *attr_log, union bpf=
_attr *attr,
> -                               bpfptr_t uattr, u32 size)
> +                               bpfptr_t uattr, u32 size, struct bpf_comm=
on_attr *attr_common,
> +                               bpfptr_t uattr_common, u32 size_common)
>  {
> -       bpf_log_attr_init(attr_log, offsetof(union bpf_attr, log_true_siz=
e), uattr, size);
> +       if (bpf_log_attrs_diff(attr_common, attr->log_buf, attr->log_size=
, attr->log_level))
> +               return -EINVAL;
> +
> +       if (!attr->log_buf && attr_common->log_buf) {
> +               attr->log_buf =3D attr_common->log_buf;
> +               attr->log_size =3D attr_common->log_size;
> +               attr->log_level =3D attr_common->log_level;

why are we setting this? Do we still have code that can access
attr->log_buf even though we pass attr_log everywhere? If yes, should
we still have that "split brain" code?

If we don't have this assignment, then I think we don't need to have
bpf_prog_load-specific and btf_load-specific log_attr_init() helpers.
They can be unified into generic log_attr_init, where for
bpf_prog_load you'll pass offsetof(log_true_size) +
attr->log_{buf,size,level}, and for btf_load you'll pass different
offset of and btf-specific attr->btf_log*

This helper will just be making decision whether to use common_attr's
log fields or passed directly command-specific ones.

Or what am I missing?


> +               bpf_log_attr_init(attr_log, offsetof(struct bpf_common_at=
tr, log_true_size),
> +                                 uattr_common, size_common);
> +       } else {
> +               bpf_log_attr_init(attr_log, offsetof(union bpf_attr, log_=
true_size), uattr, size);
> +       }
>         return 0;
>  }
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index e81199361241..7125ea445c6c 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -6232,7 +6232,8 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uat=
tr, unsigned int size,
>                 err =3D map_freeze(&attr);
>                 break;
>         case BPF_PROG_LOAD:
> -               err =3D bpf_prog_load_log_attr_init(&attr_log, &attr, uat=
tr, size);
> +               err =3D bpf_prog_load_log_attr_init(&attr_log, &attr, uat=
tr, size, &attr_common,
> +                                                 uattr_common, size_comm=
on);
>                 err =3D err ?: bpf_prog_load(&attr, uattr, &attr_log);
>                 break;
>         case BPF_OBJ_PIN:
> --
> 2.52.0
>
