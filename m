Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966F393DC8
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234540; cv=pass; b=Zxbvf7tXwVhv+k3cPlZJoOWV/W+SqsLHnQ2zDkfXTI0nzpoBkTIMgwH1B0KOvNChQmueA+e32Ub+l5sxx4Q+Gs4rwY+6MrIH/CU1pndyLY7+SEoRXOIO9CO325PPiF8LVFfQDbNC0VqZWMBpTMR9NnpfzO116A0fHez5pZZZj8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234540; c=relaxed/simple;
	bh=B3y43fdvkCJvjh5Z6KJwL8Qv+EAMqv2LGtVQzZKKa94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeb2zUEo9IIjRVIdYBv3VRZ1HBc8GA0Xd/8mmxY1XGiG+GtLaeIapsKUzz63g2tSrDktGSIcC2Od5LQc9eaD55xHxLGlIm3laSEUtJAfqKxRkZEUuq0m8Xc7cAPF43rlqRkpQZbqfrti2dj0WSnYfpXkruZayktdNf6pCIfFRic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+DkgA+a; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+DkgA+a"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso49947a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 11:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770234540; cv=none;
        d=google.com; s=arc-20240605;
        b=FQgGTGRn7c76TV/PljYcr8lfThZQCQmjeVgytNxrJYTAsoek8w0aKml9L6DnIjVCN4
         E7cqSWhmYuNxic/l5zpSjGkuahdTQf3VpczQv5qv+0D3pYEKiY/9ViqYj7KB+uEkvvX+
         KBK6LGCUDtH4w5qOQsmO+M9xBi92O90PnnDMXs/SrTGSK9t6Ao1bpy78b+BSzCSrIvjU
         /hlnGe2p3+h3PDQFaFCcFneI0z2u52oXVXMe8lh8jwQbD5iaQoYCfdwLz2H7ha2VD7e0
         OGnvsB5EPmfUjSpySWBOV6EvYYkgn0clApIqU5xTx1/9HuWMh0l6dXU9jp8/b+CldAtq
         4Lbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ou3bUaOU6pyPsxirJGD47BajZ+kCq3l+P77vnFSOEKM=;
        fh=wsvyMoM78nyGNZ0ILOyf1MJ9I4/jg2DSckqAFGi2y3k=;
        b=Bwht6WrUaWYsfBOYgO9VoR7vlcimQVTsYGSic/pzj9mxEfFuHqDTxytVQ0QlbRN7PI
         Wfjyk8N6DYkii19gGOITlzNfcPrf2b4OA54KQjXGwCrwc/1WcyFcu1h1vAyPXfjLsUW9
         AZkh6ffa8BhbJOSsaI8DhLhLCZgPCSTHZDTa9w3+bevLGPGrVw0fBVUOp2zFjYK6wUCV
         zZkIVCyrSF8MWOkhDGAKBwnJl+fJr52rPSLT3mCqE8u3p6qTpqGrqzdGturHnM28shSg
         XPrimOh6rKH7d+wxHW1qJTg7cg/C1Yk+7g6DWU7ZNt9/AbAfJPrVpOIYTEaAjePXnCh5
         AI5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770234540; x=1770839340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ou3bUaOU6pyPsxirJGD47BajZ+kCq3l+P77vnFSOEKM=;
        b=Y+DkgA+aINdjpTwfL4D9odDSkqgXwawF9kQcOARx3c9RvxscRiza7UdtNemb3S0W0x
         IOcShVmT3D+XKC8GwvNRBTojGU4xDupCX6Om5xv0NRME6GBsoft7/eA/eApWZV85xDjm
         8SRFX2NIkeDb0BhHskW/XbrGTcs04Xl3Kl97RXd3kkWhtRITGXQx0lxhB5VhOhIQYOtm
         I+Bp312iaQwUFUgYkHiiBlCmhbnr+6HZlbn70t0DnJ7NTZDHXecb3RMyM2AccrxLatVq
         TvKUv+4WU4a0VFlxqQl9tbRCRgxRaEv95LI4tsLdjHjpKr1+zp0y+AjUbfrVXoldvWZi
         75iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234540; x=1770839340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ou3bUaOU6pyPsxirJGD47BajZ+kCq3l+P77vnFSOEKM=;
        b=bqdPFFcc0aVB5xYe5PVDfzpF1YALTfaShoB1K3udB8Fo0g+yoOcssRrgivirNAapYG
         ApnrERTOxWP8YrI3aWHLQl+DQGQloIxOOnYMBoYviLh/k+f/NrvqQZTKTwIO8JxjuJuh
         EaKM4teRypiUwA4wHLcMDkGRjHk7htz8I8E207O387WJIMHd7dQxfoQFLdWf+MCEvnDr
         Mchc9/xPm6huONwAE+RJbFp8r6oh8+6egilYxoWy08uvZ1o5ZnWEnz5TIhw77YSPm+2+
         IIr0NvM9rax/agF+Q6zjBKDaJXLv6WG/CBO0nrTqEIQpNR5UDi12Nom373qN0gXRYcUR
         6HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcx7UxKHNcMKmtV+xOdlk/t2Tkge4eUWhzedL823tZyee6c1g57MJJTVv4i32r+eJGgjewfhGuhqwHK1h4H/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2aD9EdcDXsf0Rm9+M1I/RP3e3RgRGrPC2ti2xh1bdmxg9gXge
	dyc7xHNvnYfp8+sljucHD4TK2WGZYk4WFkf5jG8s8PeyyigPr9r1/4bgwoVb8CVVUbruycBtDvX
	2T6jkRwEnA7P0AgidtGJUlidg/fucU0s=
X-Gm-Gg: AZuq6aLFZwMUOUCuc6XYB3smeWKGRMujQvxeTHjlDTeNN2hBfrECtLpG3t6epIxgk7Q
	vXjcbukbwZuR2mY2hZVZDTDsSAQU/xwMo+AW3Id31khlz5dr07pou4CqCiAwhn0e398/ofhh1bB
	wEBYHP6o2CU7wU8m5Nz9kZigwUbLLm1nbvm79JQfSgT23mVHCD7IANGnMYb6zCE4y+0R/3duhfr
	W2NmTidUBj96CpsFoXn7c53dPzUcsY1IuSal26hyiiDsqvaGSUOv7NQEEUa3DtnBB/zIS7pq4xN
	NJsRKLzgwlQ=
X-Received: by 2002:a17:90b:35c8:b0:340:b86b:39c7 with SMTP id
 98e67ed59e1d1-354870e4f05mr3605002a91.11.1770234540184; Wed, 04 Feb 2026
 11:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144046.30651-1-leon.hwang@linux.dev> <20260202144046.30651-4-leon.hwang@linux.dev>
In-Reply-To: <20260202144046.30651-4-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Feb 2026 11:48:43 -0800
X-Gm-Features: AZwV_QgJ7Bm5-XV_jmFavQ2YE0pj8PhX0zAxJIGqH2A1WMmMepCAC4lZG3IYaek
Message-ID: <CAEf4Bza+n2-tq0cGvAit23OduWbqO6teF211iPnOfp0s_ZwEPw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 3/9] bpf: Refactor reporting log_true_size for prog_load
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
> The next commit will add support for reporting logs via extended common
> attributes, including 'log_true_size'.
>
> To prepare for that, refactor the 'log_true_size' reporting logic by
> introducing a new struct bpf_log_attr to encapsulate log-related behavior=
:
>
>  * bpf_prog_load_log_attr_init(): initialize the log fields, which will
>    support extended common attributes in the next commit.
>  * bpf_log_attr_finalize(): handle log finalization and write back
>    'log_true_size' to userspace.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf.h          |  4 +++-
>  include/linux/bpf_verifier.h | 10 ++++++++++
>  kernel/bpf/log.c             | 35 +++++++++++++++++++++++++++++++++++
>  kernel/bpf/syscall.c         |  8 +++++---
>  kernel/bpf/verifier.c        | 13 +++----------
>  5 files changed, 56 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index cd9b96434904..d4dbcc7ad156 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -2913,7 +2913,9 @@ int bpf_check_uarg_tail_zero(bpfptr_t uaddr, size_t=
 expected_size,
>                              size_t actual_size);
>
>  /* verify correctness of eBPF program */
> -int bpf_check(struct bpf_prog **fp, union bpf_attr *attr, bpfptr_t uattr=
, u32 uattr_size);
> +struct bpf_log_attr;
> +int bpf_check(struct bpf_prog **fp, union bpf_attr *attr, bpfptr_t uattr=
,
> +             struct bpf_log_attr *attr_log);
>
>  #ifndef CONFIG_BPF_JIT_ALWAYS_ON
>  void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth);
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 8355b585cd18..c805b85b6f7a 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -631,6 +631,16 @@ static inline bool bpf_verifier_log_needed(const str=
uct bpf_verifier_log *log)
>         return log && log->level;
>  }
>
> +struct bpf_log_attr {
> +       u32 offsetof_true_size;
> +       u32 uattr_size;
> +       bpfptr_t uattr;
> +};
> +
> +int bpf_prog_load_log_attr_init(struct bpf_log_attr *attr_log, union bpf=
_attr *attr,
> +                               bpfptr_t uattr, u32 size);
> +int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct bpf_verifier=
_log *log);
> +
>  #define BPF_MAX_SUBPROGS 256
>
>  struct bpf_subprog_arg_info {
> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> index a0c3b35de2ce..ff579fcba36f 100644
> --- a/kernel/bpf/log.c
> +++ b/kernel/bpf/log.c
> @@ -863,3 +863,38 @@ void print_insn_state(struct bpf_verifier_env *env, =
const struct bpf_verifier_st
>         }
>         print_verifier_state(env, vstate, frameno, false);
>  }
> +
> +static void bpf_log_attr_init(struct bpf_log_attr *attr_log, int offseto=
f_true_size, bpfptr_t uattr,
> +                             u32 uattr_size)
> +{
> +       memset(attr_log, 0, sizeof(*attr_log));
> +       attr_log->offsetof_true_size =3D offsetof_true_size;
> +       attr_log->uattr_size =3D uattr_size;
> +       attr_log->uattr =3D uattr;
> +}
> +
> +int bpf_prog_load_log_attr_init(struct bpf_log_attr *attr_log, union bpf=
_attr *attr,
> +                               bpfptr_t uattr, u32 size)
> +{
> +       bpf_log_attr_init(attr_log, offsetof(union bpf_attr, log_true_siz=
e), uattr, size);
> +       return 0;
> +}
> +
> +int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct bpf_verifier=
_log *log)
> +{
> +       u32 log_true_size;
> +       size_t size;
> +       int err;
> +
> +       if (!log)
> +               return 0;

can this ever happen? why guard against this?

> +
> +       err =3D bpf_vlog_finalize(log, &log_true_size);
> +
> +       size =3D sizeof(log_true_size);
> +       if (attr->uattr_size >=3D attr->offsetof_true_size + size &&
> +           copy_to_bpfptr_offset(attr->uattr, attr->offsetof_true_size, =
&log_true_size, size))
> +               err =3D -EFAULT;

minor nit: return -EFAULT;

> +
> +       return err;
> +}

[...]
