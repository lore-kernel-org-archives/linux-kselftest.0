Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2A34D38A
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234530; cv=pass; b=qvCA9hUJx3LIcWvo51nPWIEoqI+bKy/CTbKKk0xCLXmKW3bLeEDAkdxLuVali9PcRcLwM0TW/ykpiCKkU2S0/Hpifnl1h9B33xhvJXiEDedlmYC90kw12csR7ksBsl+jFDqKP0iN1Wy08my0MpGsEGsc66nDU4RED+M+gK/zQIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234530; c=relaxed/simple;
	bh=JSaxY0XhGcOSeu31HU5l9vEV9baQLzqFjwH/9t5p01Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTm3mLLzsSjLAcZD5V14OA0N1MovQN3ZWJkcY2R7NIdVzmd5jVpLMGtOQsHQduoAhLCiHF4HMoZj/GjH91255wDJNrhqSzwmh7JUYA5tRxTiSiRXg+m/PvQMKOm4DuCeWKd5p3bsn8ACQQxgPqX1kxnDg/qQ0C+s1+ZscxwM2WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZSCuhXh; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZSCuhXh"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c635559e1c3so110167a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 11:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770234529; cv=none;
        d=google.com; s=arc-20240605;
        b=jdOiz2Z2PK5uPcsxHX8s/d8PXJVZIMJ4YVjl+5oRQaj6yy+dk2BxVqxRhp6ducEFws
         GOycEDcxAa4Z9xQoRdbTPJwi+RFwXoahejg8t7WW+o0w8LwvR4Pg1iIBApT0yITz6M04
         DqZxlVHOOskbxNFBbw1Vsvo25cP/EBjavAb3iw26gENlXbRGCH02my4IEsyxGrv3p4LU
         WITnMbIQNfxm10urjUIRYz/NboPdZ2xZfgGWtr+Bp0+bZkFXprGJBar84KOGlgc1P1J+
         vUMt3UDknHttj40ztg7eMB/azFPwSxTZHT4ojABTsNPvo4mRmMY0lagHs1yP/l4nF/sU
         oxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BqaY+jlyASjji0VRhimoxVMsJ9WH26mRw0zvhRsW3No=;
        fh=bk8eTII4eju0AobSJyBWzjFA9hPts3UkEZzDanDmbBU=;
        b=Js4CX2zUIUIBYIjDpa31tu0Xhd5foKMBlzv+P/Aiku3vblkfzkryUn+zWSkr5KSrx+
         B7BnxGJSZn6QSduo2yGTSZqs5a+CIwRVpVrjpnjvE3TwU/OsWCRCCrayD0Oj0I6Eu2Mt
         kFWk3pxM7ezLluNwSUlaACE+NzDZn31l5E+EeG256vM+K8CxpIIRLx7w6dtGxhkZNnBH
         Uon7wafvtFf6x1a7shxdK3WzEVtrghBJLZABVyVmq+jG9sPlFwIkvVJt3o2hykWI18nN
         KaozgBCsG3mSUoWJZ/fr1JwDJnhF0t5QCuVk4jwa9F8je47YSYQ2nrkzilLKFn9r3DDj
         8U1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770234529; x=1770839329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqaY+jlyASjji0VRhimoxVMsJ9WH26mRw0zvhRsW3No=;
        b=cZSCuhXhrLuGSUtbz2sXoaUexxUrdVT5NLcOZSxKfRSXz2r40fpreN8Uyr0IpV6SA4
         s0f+W3L3Spda6QeznSPfysNNysYSlHtXFyhK+RtrsPQCEgQKDz+EnqgAlp4iuYLFeLvy
         uN8nvfj9kIkn1C0RrONtWHbIeOZGRLbl/J2RDyl94fHK6K/CB5ZDz0dZQf8TDU6dTHqc
         6ksOOv8UlMzrOh/4yJN7X+zKB/0EPBMml9cjCYp0cpZMpOHxVLU3mV+MDcA9/IBxQC/0
         e2+QdyWUkeHwzoUuqFOvoy+veth0Tv5a2zLDvFgsStpVT+iN/KxCuBYvD5pjlIc7NaUA
         Kxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234529; x=1770839329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BqaY+jlyASjji0VRhimoxVMsJ9WH26mRw0zvhRsW3No=;
        b=tn47wJbQ0Lwg+JyKHndpGX8P1thuFeDZOHXq4wlWR3N/6lJY2qggjaKHQCSrvZ9INE
         fWqnyS9QUzbizY08J8mq/1BQYJWG33QcGwi5sV3sn9NQfXIPK0Tk3akFzWQJlXpFYMpP
         NTF5nAORLzr8Gu5XwDWjuoJBMYOnBn/hemjcJMYcuwclRiJdee5HttJEHcGOsL9huG2B
         Fw0R+h2KCHxHzYZNiNGrbVxv6cAGLExwsfYUq2BiY4wsSq9XTTfZqTfh4lUmufBUIJ+v
         m/2nfW1pro1EM3SR2seDMSfdDydcUgQhWmllv6CrBYp/+IhKBnsh3OqzogD8C+HVN3yA
         pLpA==
X-Forwarded-Encrypted: i=1; AJvYcCUsqWlZr2xVYPEbvGDmqqU/zEct/qxKiK/YL71Kj8GLzcolsVkmwWbZTPpUxBabqoZ6znu5uNero8A1QrOA9GM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCG0VEug6uszIEWtfAZnahNUW9Ouw3dVFUhGYA5RrK/Z63godP
	UFUY4jh62Nmr3po9U4p5/E42Lj+FMqlHfi3YSsnm8KaqdgOZ4JDsr0k1DBKJlvtxkovGOodhiRv
	S5GTuw6F20yWqZOKPWE6sBoAtf/TCwjs=
X-Gm-Gg: AZuq6aLYccAa3X8PhEzAk7QPinrzutqBvusv8Mi/btUZOYv0yd6y+jFeve+GI5WxlgC
	7lQqkwLxic3vNAKMcf9V8b6hXfACEKSPJK1H7RiEpUbH30JHxGyVYSA6OdQWujjGW8hDYftzQuf
	leNzGas2MeCJYFf0OfxtLwwFmNerkhKyGaEv7eXVTSvieYdM1uOxcEvQ6Xq+X/outiykTJkd9aU
	doqaafltFc4rNcN9H+7qGGyiQqhjCq62QRJw7nzYUz+PPSjDB/zumUfcz5xtF8ZuTB6EdRe9AlQ
	kqQci2vJh90=
X-Received: by 2002:a17:90b:2b43:b0:352:d0cf:9d18 with SMTP id
 98e67ed59e1d1-3549bafc8d5mr399008a91.5.1770234529339; Wed, 04 Feb 2026
 11:48:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144046.30651-1-leon.hwang@linux.dev> <20260202144046.30651-9-leon.hwang@linux.dev>
In-Reply-To: <20260202144046.30651-9-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Feb 2026 11:48:35 -0800
X-Gm-Features: AZwV_QgJy7fB-V7u2aIUi_WBvMRT4bLPItNSz_ncka0FXGNgBUOJOI58gJ1sfVA
Message-ID: <CAEf4Bzb=96Ja38VGBr9YGGSSjaWwhkfH_oWjMJULykA-a7jZxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 8/9] libbpf: Add syscall common attributes
 support for map_create
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

On Mon, Feb 2, 2026 at 6:43=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> With the previous commit adding common attribute support for
> BPF_MAP_CREATE, users can now retrieve detailed error messages when map
> creation fails via the log_buf field.
>
> Introduce struct bpf_log_opts with the following fields:
> log_buf, log_size, log_level, and log_true_size.
>
> Extend bpf_map_create_opts with a new field log_opts, allowing users to
> capture and inspect log messages on map creation failures.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c | 16 +++++++++++++++-
>  tools/lib/bpf/bpf.h | 17 ++++++++++++++++-
>  2 files changed, 31 insertions(+), 2 deletions(-)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index 9d8740761b7a..0c3e40844d80 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -209,6 +209,9 @@ int bpf_map_create(enum bpf_map_type map_type,
>                    const struct bpf_map_create_opts *opts)
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, excl_prog_ha=
sh_size);
> +       const size_t attr_common_sz =3D sizeof(struct bpf_common_attr);
> +       struct bpf_common_attr attr_common;
> +       struct bpf_log_opts *log_opts;
>         union bpf_attr attr;
>         int fd;
>
> @@ -242,7 +245,18 @@ int bpf_map_create(enum bpf_map_type map_type,
>         attr.excl_prog_hash =3D ptr_to_u64(OPTS_GET(opts, excl_prog_hash,=
 NULL));
>         attr.excl_prog_hash_size =3D OPTS_GET(opts, excl_prog_hash_size, =
0);
>
> -       fd =3D sys_bpf_fd(BPF_MAP_CREATE, &attr, attr_sz);
> +       log_opts =3D OPTS_GET(opts, log_opts, NULL);
> +       if (log_opts && feat_supported(NULL, FEAT_BPF_SYSCALL_COMMON_ATTR=
S)) {
> +               memset(&attr_common, 0, attr_common_sz);
> +               attr_common.log_buf =3D ptr_to_u64(OPTS_GET(log_opts, log=
_buf, NULL));
> +               attr_common.log_size =3D OPTS_GET(log_opts, log_size, 0);
> +               attr_common.log_level =3D OPTS_GET(log_opts, log_level, 0=
);
> +               fd =3D sys_bpf_ext_fd(BPF_MAP_CREATE, &attr, attr_sz, &at=
tr_common, attr_common_sz);
> +               OPTS_SET(log_opts, log_true_size, attr_common.log_true_si=
ze);
> +       } else {
> +               fd =3D sys_bpf_fd(BPF_MAP_CREATE, &attr, attr_sz);
> +               OPTS_SET(log_opts, log_true_size, 0);
> +       }
>         return libbpf_err_errno(fd);
>  }
>
> diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
> index 2c8e88ddb674..59673f094f86 100644
> --- a/tools/lib/bpf/bpf.h
> +++ b/tools/lib/bpf/bpf.h
> @@ -37,6 +37,18 @@ extern "C" {
>
>  LIBBPF_API int libbpf_set_memlock_rlim(size_t memlock_bytes);
>
> +struct bpf_log_opts {
> +       size_t sz; /* size of this struct for forward/backward compatibil=
ity */
> +
> +       char *log_buf;
> +       __u32 log_size;
> +       __u32 log_level;
> +       __u32 log_true_size;

please mention in the comment here that this is an out parameter set
by the kernel

> +
> +       size_t :0;
> +};
> +#define bpf_log_opts__last_field log_true_size
> +
>  struct bpf_map_create_opts {
>         size_t sz; /* size of this struct for forward/backward compatibil=
ity */
>
> @@ -57,9 +69,12 @@ struct bpf_map_create_opts {
>
>         const void *excl_prog_hash;
>         __u32 excl_prog_hash_size;
> +
> +       struct bpf_log_opts *log_opts;
> +
>         size_t :0;
>  };
> -#define bpf_map_create_opts__last_field excl_prog_hash_size
> +#define bpf_map_create_opts__last_field log_opts
>
>  LIBBPF_API int bpf_map_create(enum bpf_map_type map_type,
>                               const char *map_name,
> --
> 2.52.0
>
