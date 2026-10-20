Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792538768;
	b=f2E22q3Sq3l5sM6XReDebAN6MsGIxVPwViVe5mQeyPdX0LsjvOnCMPbHsdnEsvS7EQtE
	 E/2V46sv6RLAl9XZJcSa1GvW3GRs7F3d0Z5mmMBNMS0sHJ7EOUdyi6zJ7u4E7BLyK0SbA
	 7Tz8JeeMndf/zCjcKyH2u4I7IXZeGlNhf/cU3QA7Jhjt6xzbDtDlRTcFF6DdHhhPXjQz7
	 dKoTY6I5fGD7VDd5xoC2roReSepXddnr9BRBBbZBNTuaD+CkfGm+Yl1qOrgkkuhJ0rYBd
	 Dp+yZE4RPXBv3lKqoxkXz6b/hjRxXX8IhPqdSGWfg7uhL+zw5EJVBHLOkLz53sw5I2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
	b=AlBuOLRYgLPXwgfUWhHS8oXb5C2BQKrp0t+iDaGDuqafnalN8lzBEVdAdcTGoJP4VAfP
	 V2egq5kyx6oPmnwr4lewHuDiTY6tueywRHd/6wZx8lFSUZsgEa291cidAq+yCDwKwGUxs
	 QfxY/zm4mpEIVCh9kAmsYFQ4oZS1zH+PG3oH9zDySaOHq76cb/ozD+CLKAeP9H1bNr3ax
	 6xwVns7+FHms+v0obLioz2dxJz+wekVDXyo0dlU3msLuz1sjfCnTzuTcFVGd2t/S7KZ2R
	 plLKX8yB9EILNyqRdAv+f4O0Qj0T2qa/vWel34pHVCPgdm3xUcnYVhS48T0aD59hpPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qM0+ADNG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE43606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 23:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE43606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qM0+ADNG
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9f6a16aedso787965ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792538768; cv=none;
        d=google.com; s=arc-20260327;
        b=h8rb5Z+KhEI+TUX4fEuJ03rjL1kf0NgrRFj6kG484K7Ygb2AxywyrmMLDMh+eUjfOG
         mTJIMM7TjTDqslFQjfeqaKIBE2YgfdFuX3wsO6Oa51l60DmIntgWt+Zsx/00KRAslBKb
         0RV9v7OkqWH5kYrBRJ3SJ94cp05TSWsAEHprEQwwO7OxEKlhPKeCB0pWJ9N6687CoFRE
         5XV86ea2hFaE/Icth/aj+jA8uJ+HBnN/QT5NqYC+9gbQSVGR5iKbLIqoFZadfbOJ0CCd
         9hrBNk7Sh5VIX5LU0ahdttuzDLPvjxMWohgoioz7l4j9n3Rq0ejxuuEp93JCVennVeiu
         4M+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
        fh=5rxbS35I/wxx/GYouJAfwMwlbM3cKGNUCan1byAIwYc=;
        b=ml/uuzy7/Dzs1fREbXcq2RE7rBHRScK9NZYztTnkBAXCtfukqtXm1TowigHUikHBFK
         QYgYsjY17dfN7EQbIiZcf2d55gCKL3fsdm7xLVvBVvvGDucrXYje2vZWoMuQAtRX/bSO
         wIv8IhdPskzZxP2g22I0lq/5Mi5E8j45xYczJ+2171+oY5spt0evDQobLyvwznOo306u
         7q0Pj/SxzxvbJPH4hwofHhSrTsoppbOvtVnTJr3tRlIWvSdJpPn0LdFwaqoWXMj67U1t
         G0XQCj/0azmHrYI0kuPz4ej/Wle2ztMN6E0dUJDmykjCuPXV05ya6wqcH8xSaDZrsR2J
         Ae/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792538768; x=1793143568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
        b=qM0+ADNGoG3hYbfcw9Hhfz1nkRSW5OE3gkA32HzVbHb6cTQfwInMWb6jgTvgikixYt
         NR1Bm1uImSOUNIt0HdWC7wk6ceUdaCMvZUneapLTvY7j66PJX+f33N9mTpZg8D0kxbmO
         JzloxsssVmu/gVxMuIGT8rTZBG+eTnSqyn3H7jwEC1ksSRizF6ANPGqEPDUFuGAiC8jV
         DIocPjtvPOwB6tYWxJWF3RcLTWJk89LvUmOqL31KmcG31QCFKJPHFyRal/wW0smxUO71
         u0Z0TRF3+xEvMZXbaW0dLZW5a9iHqrNeyLtveF8va4fa/DIvI31hhPCPbHKX9iqFZrU1
         b7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538768; x=1793143568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
        b=Skt+9ZNpp5xcFtk738E6cWyFiEEbd0kXLMoKTu4cRfgM0u5ePHrZ8/LzWgS76Fg8M8
         frggq41cXhXPyAk9X4ae/fR+ogvbUizSkligKuym9/eAfaJ7cRuO9woi2MXcUWc03CvQ
         4911oX1PZ1Uv+rUzT3BIOu6uvlVY6b9TRAXKI/kouUfRR4QBVGyV+O6ZjLYY2Q7h9vNT
         OVGP5f1ppQfhiNzuZq90HCQ0vlr0/DcRojrGjdD8k/wGFEuNGxcbpirfrzbBKiter7dS
         DL+qTLs9Ci24LyQA3JnfXO7B0ASqfLTDJx7Cc2gac4wayBOPBlBTnL5Ig7UXiSknEd04
         +K5g==
X-Forwarded-Encrypted: i=1; AKwUvBwd1XvW6D+hEebwF/3aFW5Y3vNcdMNL66EeyIf9cl/up0CBG2G2UmU0PxRskZgVOTVhlKh8nAkhiLect90DDw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnhC3jmVRp8eTwtsjnTzj11DX+Jzwel5FlmpA1uA3MRREf8mpm
	5WrBJROoUrD1PJtct7z7K0UrNpj0Dpj1euZxjucX6h9GF8sgKLWlTVhcgw0AcZztqfGST6sFnQJ
	SEH6CSquMkLgexjB/mMB++93r4peAFEM=
X-Gm-Gg: AYBFou2epqYrMRlEQTcXTJ7zqn4lS3A5HcPukeDpfwYBWQUekbzQEqsOC3E7DT6MDNW
	xNfHNRy5iCf52rXZSxl22yeSjHsQlhsNhcnhnkV8IRXvZ8BNwHLh3n6NJczJk4ng5q3lsz/Oi/9
	4wVbaB4KCWRqwPi/8p+QhyhIAnF1GgDxSv37YtFLcYzC9397BlZQOe4kxxYOblNlQfx3Jr9JP8a
	UsA/9KvtsOZi7Z2HYKzUWvdzG9rvU0Lvcq+M5AXpyw4YcYWIhUeiks6pNbUEdjwVcJYrtn9eN/N
	j7k57cShByRPJQ890KY3goEtzFsnnF6ROfL6Yls4Z9tNKPKk9YjJQ5yntONi3+up4XCKJ4LRRMr
	0f8pm1ejDILMeHE86OT3IWiuD1Nnii1wGwM2tyVawLRbsPusbb1R4
X-Received: by 2002:a17:90b:17cb:b0:3ac:a521:95e with SMTP id
 98e67ed59e1d1-3ad86f028c8mr320588a91.47.1792538767665; Tue, 20 Oct 2026
 16:26:07 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019153628.15912-1-leon.hwang@linux.dev> <20261019153628.15912-6-leon.hwang@linux.dev>
In-Reply-To: <20261019153628.15912-6-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 20 Oct 2026 16:25:55 -0700
X-Gm-Features: AclHuK9R-Pz11REH9KszPt0wQBWz-TsT_XQJqO1BNWiMHHq0gxNTu4ERDjHPk6w
Message-ID: <CAEf4Bzbr46UkiE1sbb+Zwcs0S1ejpKmtTGjNCAkWD-J6FRcPGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 5/6] libbpf: Add bpf_link_create_log API
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, Masashi Honma <masashi.honma@gmail.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Add a new API to accept the log opts, instead of extending the existing
> struct bpf_link_create_opts.
>
> Appending log_opts to struct bpf_link_create_opts would place them after
> attach-type-specific fields of varying sizes, making it difficult to
> extend the struct while preserving forward compatibility.
>
> For example, adding log_opts would prevent extending uprobe_multi
> directly with a new build_id field. Instead, a separate union would
> be needed:
>
> struct bpf_link_create_opts {
>         /* ... */
>         union {
>                 /* ... */
>                 struct {
>                         /* ... */
>                         __u32 path_fd;
>                 } uprobe_multi;
>         };
>         struct bpf_log_opts *log_opts;
>         union {
>                 struct {
>                         __u64 build_id;
>                 } uprobe_multi_ext;
>         };
>         size_t :0;
> };
>
> Without log_opts, build_id could be added directly to uprobe_multi:
>
> struct bpf_link_create_opts {
>         /* ... */
>         union {
>                 /* ... */
>                 struct {
>                         /* ... */
>                         __u32 path_fd;
>                         __u64 build_id;
>                 } uprobe_multi;
>         };
>         size_t :0;
> };
>
> Introduce bpf_link_create_log() to accept struct bpf_log_opts separately,
> preserving the forward compatibility of struct bpf_link_create_opts.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c      | 28 ++++++++++++++++++++++++----
>  tools/lib/bpf/bpf.h      |  5 +++++
>  tools/lib/bpf/libbpf.map |  2 ++
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index 9a2107d4f6d8..263a1d516a02 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -788,9 +788,10 @@ int bpf_prog_detach2(int prog_fd, int target_fd, enu=
m bpf_attach_type type)
>         return bpf_prog_detach_opts(prog_fd, target_fd, type, NULL);
>  }
>
> -int bpf_link_create(int prog_fd, int target_fd,
> -                   enum bpf_attach_type attach_type,
> -                   const struct bpf_link_create_opts *opts)
> +static int __bpf_link_create(int prog_fd, int target_fd,
> +                            enum bpf_attach_type attach_type,
> +                            const struct bpf_link_create_opts *opts,
> +                            struct bpf_log_opts *log_opts)
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, link_create)=
;
>         __u32 target_btf_id, iter_info_len, relative_id;
> @@ -965,7 +966,7 @@ int bpf_link_create(int prog_fd, int target_fd,
>                 break;
>         }
>  proceed:
> -       fd =3D sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz);
> +       fd =3D __sys_bpf_fd(&attr, attr_sz, BPF_LINK_CREATE, log_opts);
>         if (fd >=3D 0)
>                 return fd;
>         /* we'll get EINVAL if LINK_CREATE doesn't support attaching fent=
ry
> @@ -975,6 +976,10 @@ int bpf_link_create(int prog_fd, int target_fd,
>         if (err !=3D -EINVAL)
>                 return libbpf_err(err);
>
> +       /* bpf_raw_tracepoint_open() does not support log_opts */
> +       if (log_opts)
> +               return libbpf_err(err);
> +
>         /* if user used features not supported by
>          * BPF_RAW_TRACEPOINT_OPEN command, then just give up immediately
>          */
> @@ -999,6 +1004,21 @@ int bpf_link_create(int prog_fd, int target_fd,
>         }
>  }
>
> +int bpf_link_create(int prog_fd, int target_fd,
> +                   enum bpf_attach_type attach_type,
> +                   const struct bpf_link_create_opts *opts)
> +{
> +       return __bpf_link_create(prog_fd, target_fd, attach_type, opts, N=
ULL);
> +}
> +
> +int bpf_link_create_log(int prog_fd, int target_fd,
> +                       enum bpf_attach_type attach_type,
> +                       const struct bpf_link_create_opts *opts,
> +                       struct bpf_log_opts *log_opts)
> +{
> +       return __bpf_link_create(prog_fd, target_fd, attach_type, opts, l=
og_opts);
> +}
> +
>  int bpf_link_detach(int link_fd)
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, link_detach)=
;
> diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
> index 826d9cc9ab65..dedaf8086902 100644
> --- a/tools/lib/bpf/bpf.h
> +++ b/tools/lib/bpf/bpf.h
> @@ -484,6 +484,11 @@ LIBBPF_API int bpf_link_create(int prog_fd, int targ=
et_fd,
>                                enum bpf_attach_type attach_type,
>                                const struct bpf_link_create_opts *opts);
>
> +LIBBPF_API int bpf_link_create_log(int prog_fd, int target_fd,
> +                                  enum bpf_attach_type attach_type,
> +                                  const struct bpf_link_create_opts *opt=
s,
> +                                  struct bpf_log_opts *log_opts);

Leon,

how about instead of adding this new API, we try to repurpose
bpf_link_create_opts' iter_info to be used as log opts? we have this
right now:

union bpf_iter_link_info; /* defined in up-to-date linux/bpf.h */
struct bpf_link_create_opts {
        size_t sz; /* size of this struct for forward/backward compatibilit=
y */
        __u32 flags;
        union bpf_iter_link_info *iter_info;
        __u32 iter_info_len;
        __u32 target_btf_id;
        union {


that iter_info/iter_info_len is a bit of a legacy before we had
per-attach type union, what if we add iter section into the union,
wrap iter_info with union and put log_opts there, mark iter_info
deprecated or something.

I'm not sure anyone is actually using iter_info (I didn't find any
uses in Meta code base, for instance), but we can detect its use by
checking iter_info_len: if it's non-zero, then iter_info must be a
real bpf_iter_link_info. so we should be able to detect this just
fine, the only downside is that you can't use log_opts and iter_info
simultaneously, but I think that's fine: you can update your code to
use new iter.info fields instead, if you need log_opts + iter_info.

WDYT?


> +
>  LIBBPF_API int bpf_link_detach(int link_fd);
>
>  struct bpf_link_update_opts {
> diff --git a/tools/lib/bpf/libbpf.map b/tools/lib/bpf/libbpf.map
> index eeba4072a5da..f6eb57151f7d 100644
> --- a/tools/lib/bpf/libbpf.map
> +++ b/tools/lib/bpf/libbpf.map
> @@ -475,4 +475,6 @@ LIBBPF_1.8.0 {
>  } LIBBPF_1.7.0;
>
>  LIBBPF_1.9.0 {
> +       global:
> +               bpf_link_create_log;
>  } LIBBPF_1.8.0;
> --
> 2.55.0
>
