Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2763AB47B
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784325170; cv=none; b=KUH8Ve9fRa1QYZBIXeRShpmChKQp3dHHowP5ZTnoOqqb9VyJ4Whdwv1TCPfZaP3XBP3BADkq+fjHuy2HuDb+RjB1+V8QxXM5x3j9Fw36GeRcjnG6ZbIu4IJc4j+720cMklIAaQIA1FDLsGpwTfJIkd7e/vtcWTEZ6ty26Y41VbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784325170; c=relaxed/simple;
	bh=zc7D/9EwQRgTjJcnICDGen34BP8M4e+uP9KTBbq2Gmg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=gl2YOo89mIvhY4vGQT7MozldJIYSEHQk6/rHVWWrRcYhGicSgrnSPnXxWTQMfDYoh7sBpWjhK13ZgDBbrUWVj//uDX4ull2lFx+HHKjcSJotuHNcQYxDwbseJEauWSo/m5CUejCoBPcywPFbky8f4nIWV5Wyv6ER7QcqbfwCUxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=WFJfe5tv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="WFJfe5tv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-384c94c9414so4232782a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784325158; x=1784929958; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZRpkQ2cyJn8DEz8vKvVjafNoUUwgLSz9vl4mrpr70F0=;
        b=WFJfe5tv5GXpTFQB+Nl+/juMQ9Rm6EB/gSsoE0uimt30/V+dV5cWOcr0Rl4EjvnNgl
         8KS1Y1DvFb9Jh6GV0Tu2wQdI/U/TI4EdAqRmX7HorCoout3o70Vfl1uT08Mw7fnCn+rb
         aF5FGJF/TpYSSuoON8bpvH475u/ozdQrCByJ3WHy8kCwCcuHv767jbaPxwN1rZU+/syH
         JdUoMOUKXR7G+e38oMZ+nSNom22ayZMbOUm4rEYvXWP0oWQT7R1dwHnw6B2AHhX4/JSd
         i4cgIuCfeMp+RsX3XpegPdEIJfEGfXIk6GCwEn4csBPOZUCdjMgK3Brz+0x02SwITUw4
         M33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784325158; x=1784929958;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRpkQ2cyJn8DEz8vKvVjafNoUUwgLSz9vl4mrpr70F0=;
        b=bVaiE1knmODFz9zoPC9ic+MsYNM4Yd/fFwEDV4L10XbMTIS2+JM8l0vqif/uqNa3y+
         20cisliD8NTjZr4w/Qf9AQm6NpirRzZQOSTZrA23aB87mvsl4gzirxtlNnAFYCc10akO
         gJ37UqhvXdZlBY7q1gT1fVSP0I6GamCbYgLCbS7k8ZrIu99sEUvlCb7rPOqTjzQMtrkJ
         +AcLm48kMuvy0X+uJXU+i+SsV/w6Z0qpjsSs8jLaFpXNC7pfN39t1e3sEKM081m2d6pJ
         hcnQZjtJHyFvyFmzInq+ml1hrR8c6GUkuTWBJ38o199N/Mk3nRqm6Ws7aS641jI37gJl
         jgfg==
X-Forwarded-Encrypted: i=1; AHgh+RrGd5ELuw52FD5lqG5DgOvN1n+ZoCxL/jdPj+dQdyzhKUZCoyeG53ubk3FJnGCJnfcAghvHTxNJcLmeJiRfPK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KyITIm9Ei40FKqmmxO69GXy1cCQcrtmEFruC5RKSMpJ5/ye2
	49enWB1kc0mGWbawhPoeNJAklK7eHsqXUrfZDrqcAnbqkiMbOdDyf1GhBU4RzMmnyQ0=
X-Gm-Gg: AfdE7cmpS1nj7JWIdKhjme3ogG3viNrjUQGF6npzXY2S1VPSuSbbsJgq9yZWCRPXTO3
	JKwsh9ozytXN1Dfm7oOM2NLSflGQ0vAvAcNUknG8Ajouvke0WTtWbJZTuI6zqqFq2qJmKZsgp69
	QSVXtHmQ8wZdXeOwUPQSOlNSUxgdGaGTE2z+qdjybvFseTvlUnnL5Bl971/mjZ4NjXso9aidEzR
	cACN3Uq4S6+zWY5vkyJZB7fdctIu25c+t8jmhRlhX2ZoZAWjfjm1MDtV7dqhZqRo6h4sXejifrw
	cmchFMLpwfAOWNZM24SlMkcIWKs7oKRgRVix8hcL0EpBnXeNiKVwT+/FwCjIkcgQVfHs+iFhAfZ
	kO8W1FOizjhxswSGcwt1r3u/iF7hrzYXGRg9PmUOjv7G6Q9w3eyI70ah0fNjy+Vs9My+SBCejrT
	UnTw==
X-Received: by 2002:a17:90a:e7c1:b0:37f:9ce1:735f with SMTP id 98e67ed59e1d1-38e4b537cf4mr3919621a91.32.1784325157799;
        Fri, 17 Jul 2026 14:52:37 -0700 (PDT)
Received: from localhost ([163.114.132.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm11278963eec.14.2026.07.17.14.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 14:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 17:52:34 -0400
Message-Id: <DK16H7ZKMSYD.2K0J4O6YBMWF1@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Quentin Monnet"
 <qmo@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>
Subject: Re: [PATCH bpf-next v10 3/9] libbpf: Probe percpu data feature
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-4-leon.hwang@linux.dev>
In-Reply-To: <20260715153254.92010-4-leon.hwang@linux.dev>

On Wed Jul 15, 2026 at 11:32 AM EDT, Leon Hwang wrote:
> libbpf needs a reliable way to distinguish kernels that can support
> global percpu data from those that cannot.
>
> Add a dedicated feature probe, so libbpf can make capability decisions
> early and fail predictably when global percpu data is unavailable.
>
> Acked-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/lib/bpf/features.c        | 35 +++++++++++++++++++++++++++++++++
>  tools/lib/bpf/libbpf_internal.h |  2 ++
>  2 files changed, 37 insertions(+)
>
> diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
> index b7e388f99d0b..ef9581c11303 100644
> --- a/tools/lib/bpf/features.c
> +++ b/tools/lib/bpf/features.c
> @@ -620,6 +620,38 @@ static int probe_bpf_syscall_common_attrs(int token_=
fd)
>  	return probe_sys_bpf_ext();
>  }
> =20
> +static int probe_kern_percpu_data(int token_fd)
> +{
> +	struct bpf_insn insns[] =3D {
> +		BPF_LD_MAP_VALUE(BPF_REG_1, 0, 0),
> +		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, 0),
> +		BPF_EXIT_INSN(),
> +	};
> +	LIBBPF_OPTS(bpf_map_create_opts, map_opts,
> +		.token_fd =3D token_fd,
> +		.map_flags =3D token_fd ? BPF_F_TOKEN_FD : 0,
> +	);
> +	LIBBPF_OPTS(bpf_prog_load_opts, prog_opts,
> +		.token_fd =3D token_fd,
> +		.prog_flags =3D token_fd ? BPF_F_TOKEN_FD : 0,
> +	);
> +	int ret, map, insn_cnt =3D ARRAY_SIZE(insns);
> +
> +	map =3D bpf_map_create(BPF_MAP_TYPE_PERCPU_ARRAY, "libbpf_percpu", size=
of(int), 8, 1,
> +			     &map_opts);
> +	if (map < 0) {
> +		pr_warn("Error in %s(): %s. Couldn't create simple percpu_array map.\n=
",
> +			__func__, errstr(map));
> +		return map;
> +	}
> +
> +	insns[0].imm =3D map;
> +
> +	ret =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", insns, =
insn_cnt, &prog_opts);
> +	close(map);
> +	return probe_fd(ret);
> +}
> +
>  typedef int (*feature_probe_fn)(int /* token_fd */);
> =20
>  static struct kern_feature_cache feature_cache;
> @@ -707,6 +739,9 @@ static struct kern_feature_desc {
>  	[FEAT_BPF_SYSCALL_COMMON_ATTRS] =3D {
>  		"BPF syscall common attributes support", probe_bpf_syscall_common_attr=
s,
>  	},
> +	[FEAT_PERCPU_DATA] =3D {
> +		"kernel supports percpu data", probe_kern_percpu_data,
> +	},
>  };
> =20
>  bool feat_supported(struct kern_feature_cache *cache, enum kern_feature_=
id feat_id)
> diff --git a/tools/lib/bpf/libbpf_internal.h b/tools/lib/bpf/libbpf_inter=
nal.h
> index d5b7db703b3f..b786f1a35567 100644
> --- a/tools/lib/bpf/libbpf_internal.h
> +++ b/tools/lib/bpf/libbpf_internal.h
> @@ -401,6 +401,8 @@ enum kern_feature_id {
>  	FEAT_BTF_LAYOUT,
>  	/* Kernel supports BPF syscall common attributes */
>  	FEAT_BPF_SYSCALL_COMMON_ATTRS,
> +	/* Kernel supports percpu data */
> +	FEAT_PERCPU_DATA,
>  	__FEAT_CNT,
>  };
> =20

