Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF242D8762
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 22:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254743; cv=pass; b=jh5hioyRaMonDUxsVfOzocssemV+ISJbMktaNgHWk1jSi7oQ8gUgeyj1ftkM56nxV5mxUYflzn65dYJPRZGGys5jQM670qYfH/VcQveq1Rf0sRayyXw/8TT9ff0GJIFIFBnJOqruXlfMeISfQp79N9Mke/fSFoYqgYBx14osfLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254743; c=relaxed/simple;
	bh=EcQz2tTRCt0BX6S5kgMK111zSXuRsybPVvE3xOCbydU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Le1/n+fjQBIaoOrsWbLcbXmFQ/uxfDAuEX+Fo/GcFQjqzf/E848Y2Xav5gC737FSX6sm4tdf5LQoO4EJHXNteLmxOAoZtQKVeeerhnTApEfFA6w1tjNQRYp5TGhOGnXsagu345GtPADJJpbT4034p0n7t/pKSDigUeJI0wYwxGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwxSi0+K; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwxSi0+K"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7d329fe93so2000855ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 15:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782254741; cv=none;
        d=google.com; s=arc-20240605;
        b=SxKr3h+QN2y6fOhVTUwWNvVRWbLieDYnDweKOGldxlAyzRoxpYUgqXbfeiiNHXfeaP
         86D7DdMLZXMyn+B0y7iJpHfl2Im994Bt9y1vpIy522PrSKjD7pU0WRbTuviRL2qPYbuP
         r8NinG3KA6A++aUNlEnmcwxAtx3j6n7bpCAhH9DfWIMz0Uj+UdLyxqvUhM3Z9bkvavBz
         PR/KlJbt1Tms57QwDB5NCojILPfPoLAU3FmgFz/MRiyQD96E18ijFa4yr2tHjSIbMITj
         ERxuTtXtE35iiCPYZSkYgevRuXLLnpHM5pWHHqcBQ8NmgqIE7PxT1LaOHBFz27TiGlx4
         1GdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CxaZisx38WO5ky73juK3oEqNc5IIVKneXBsSZc4DwHI=;
        fh=/vEKkzpjO0nXWpFmPT5RFwnlx8NoUMxI2DkUrnJlGQY=;
        b=ObfrcjifQ6Oaq8nqUANKMAGG2sDN3pb7YCZRgY+pghSTUc9m9NTUqBL4U2h2ShsLhT
         6/qqD7TF3Zc9FXwMYmHvx0X66qNDR2nC+WVUI+aX+PgG+e6fTHO0ATJ0PaIIBfaYEftA
         4LUa68oCEEnRrjUx6Ij5dIstDfawkjOL48LxSWtKHpbpB7IihWndKmVjsfq0pX9Qspew
         RtLh9T2ZOdHnN+o/sDv34Y7JlVEdN21yeXQQ1WvhLg0VmUpsQsEqV8gUMmv5+nVvlYtb
         F0SCPQfYSGM1KM5XbcxVDnvhWwuEFYvV6EfRYgmJCJ9N9pTLu927j2S/HypdHUO9Kisx
         HeYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782254741; x=1782859541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxaZisx38WO5ky73juK3oEqNc5IIVKneXBsSZc4DwHI=;
        b=jwxSi0+Kx68zD5k0YOo3gAHdYc8NNsQyQILJwYZbL7O1ZnID7bjkLjtl2E7CdzNfpL
         RO4TuINhfdlFlsmFL97TZEGkpueIwXDq5EB3s3aaoE7xP/BsJ0XHCrOVAz+PEC8BoOkT
         6+fW1j/M2yzh0Xf/6zWf0OQ7RsTB21yalmE3oFVe8eqEsJ3LLG6THcPXsoVNc7RWBK9Z
         usKyBykCsXCtNg2jLijkc8NFbfiqXrpqlgEeleTYjN1XBjqgt/43NTxTkANnzZ61KccF
         wGRW+S4XJt798koudXYI++RX6p4T+VbKHnBWM57eptIjyACCcCGiDBPnusHMKeGYBbtU
         tGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254741; x=1782859541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CxaZisx38WO5ky73juK3oEqNc5IIVKneXBsSZc4DwHI=;
        b=dQtt4N5wC5fN9GRMWhOiBK2PTDgxVynsIvmuq3m2fA92xO1I6lojU6Ttmb1KmUf1zR
         4Abt+nhGrY8JnX6z0VBvo+bjGI03rtMvTvRTpqpjVIhlLbZvikpEWxu9+JRzHZMIlIUz
         Kcb5tYFkA+D21e/0mVeG3XYWs10KBPw05ZtdBElO8l9Mg4ez1LP9UwuFRz7A0XIcpZ02
         SkuIZObkvlIRMW77YaVnoiRDbAgdnDiR3ZV+/ScIooKe+utmm2i77Uo7126R6RKt/UHC
         sOkOaEzfWyk+Q8d5ytcNGAQ7/u191f/+Pgi+t/XvKj8jB5+gCzBrVzf7NkN1xO5rjeIx
         8jOw==
X-Forwarded-Encrypted: i=1; AHgh+RqhnCtraqx+HEtEFwJW01R4vIpIP4rXmGnBuFFIFUyYb4QrTmSvnRykjlhpZVn9yA4BFvtSrsgw4zASLmS5kME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZQlI4CkaFEN3VgTa0PjwkAw6LKs/94HuzmZHcqSgIXI5GZU8
	QFF4r7Cq4nllTdL5Yt1GDfTZ+KgBkoaYwqx6JosUBB5BXfuF8oaPZ8rF2sUdKzjx7xBoTQRaH+v
	2+gUh1SfQrCVAlMl5M42mJnTcdEspxWM=
X-Gm-Gg: AfdE7ckF/PziqagIT1wttoLg07ynZQ0gBH9N1wBc79VcsMK3xaUrdqOMPXqvzpW01N1
	Id8QshwzD6oPA5957DPBuNdKEd2r5DoXuJLk4yXKnTB1YFM3DP6uWDBwJrH7duZhG92Klq9rhU7
	oPS9KyOkJwBiyCSKEsWv6hRUuOI6UDBEK0coeP0xCG1DAnRddGiFIRK3b+RNe/15J3zovohdDve
	WG1MzmypSJi/5DuWUgolRlsrnmK9JalYnbkN4MKmoF2fSZffAxbeu+qk8JG9Y/CPsKBZED5B0En
	MtHUgNWa/JIAsfV+WUd8kGKBWBX9XJD1q07qQ/nYocDJWQW5kMQMtpo26AdCRFyJhwTsYg==
X-Received: by 2002:a17:902:f712:b0:2be:22cc:e227 with SMTP id
 d9443c01a7336-2c7e13c0197mr8634395ad.4.1782254741178; Tue, 23 Jun 2026
 15:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-6-leon.hwang@linux.dev>
In-Reply-To: <20260622143557.22955-6-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 15:45:22 -0700
X-Gm-Features: AVVi8CfTg_P5yy6rFlXP2Y75Gi68t--pXmgrpEK_h8GYkYYP5jkqdB9wKTC9KFE
Message-ID: <CAEf4BzZ+1Zc4QerMGVeS0MJ_gkk14VVKCKS0PfOUJ5P_Q_92WA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 05/11] libbpf: Probe percpu data feature
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
> libbpf needs a reliable way to distinguish kernels that can support
> global percpu data from those that cannot.
>
> Add a dedicated feature probe, so libbpf can make capability decisions
> early and fail predictably when global percpu data is unavailable.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/features.c        | 35 +++++++++++++++++++++++++++++++++
>  tools/lib/bpf/libbpf_internal.h |  2 ++
>  2 files changed, 37 insertions(+)
>

lgtm

Acked-by: Andrii Nakryiko <andrii@kernel.org>


> diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
> index b7e388f99d0b..ef9581c11303 100644
> --- a/tools/lib/bpf/features.c
> +++ b/tools/lib/bpf/features.c
> @@ -620,6 +620,38 @@ static int probe_bpf_syscall_common_attrs(int token_=
fd)
>         return probe_sys_bpf_ext();
>  }
>
> +static int probe_kern_percpu_data(int token_fd)
> +{
> +       struct bpf_insn insns[] =3D {
> +               BPF_LD_MAP_VALUE(BPF_REG_1, 0, 0),
> +               BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, 0),
> +               BPF_EXIT_INSN(),
> +       };
> +       LIBBPF_OPTS(bpf_map_create_opts, map_opts,
> +               .token_fd =3D token_fd,
> +               .map_flags =3D token_fd ? BPF_F_TOKEN_FD : 0,
> +       );
> +       LIBBPF_OPTS(bpf_prog_load_opts, prog_opts,
> +               .token_fd =3D token_fd,
> +               .prog_flags =3D token_fd ? BPF_F_TOKEN_FD : 0,
> +       );
> +       int ret, map, insn_cnt =3D ARRAY_SIZE(insns);
> +
> +       map =3D bpf_map_create(BPF_MAP_TYPE_PERCPU_ARRAY, "libbpf_percpu"=
, sizeof(int), 8, 1,
> +                            &map_opts);
> +       if (map < 0) {
> +               pr_warn("Error in %s(): %s. Couldn't create simple percpu=
_array map.\n",
> +                       __func__, errstr(map));
> +               return map;
> +       }
> +
> +       insns[0].imm =3D map;
> +
> +       ret =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", i=
nsns, insn_cnt, &prog_opts);
> +       close(map);
> +       return probe_fd(ret);
> +}
> +
>  typedef int (*feature_probe_fn)(int /* token_fd */);
>
>  static struct kern_feature_cache feature_cache;
> @@ -707,6 +739,9 @@ static struct kern_feature_desc {
>         [FEAT_BPF_SYSCALL_COMMON_ATTRS] =3D {
>                 "BPF syscall common attributes support", probe_bpf_syscal=
l_common_attrs,
>         },
> +       [FEAT_PERCPU_DATA] =3D {
> +               "kernel supports percpu data", probe_kern_percpu_data,
> +       },
>  };
>
>  bool feat_supported(struct kern_feature_cache *cache, enum kern_feature_=
id feat_id)
> diff --git a/tools/lib/bpf/libbpf_internal.h b/tools/lib/bpf/libbpf_inter=
nal.h
> index 04cd303fb5a8..47ae39125f68 100644
> --- a/tools/lib/bpf/libbpf_internal.h
> +++ b/tools/lib/bpf/libbpf_internal.h
> @@ -401,6 +401,8 @@ enum kern_feature_id {
>         FEAT_BTF_LAYOUT,
>         /* Kernel supports BPF syscall common attributes */
>         FEAT_BPF_SYSCALL_COMMON_ATTRS,
> +       /* Kernel supports percpu data */
> +       FEAT_PERCPU_DATA,
>         __FEAT_CNT,
>  };
>
> --
> 2.54.0
>
