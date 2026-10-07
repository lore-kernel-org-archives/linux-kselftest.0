Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0943F0B9
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791411868; cv=pass; b=Y1aZlQSj91UZ8RgzVHKAKgwkG1xXNRnOUvgbGk1JjRjykmWhgU5EydV1yaoBHjGTRhxDq2FjlqVhTIbyIKI/+zD3UGUNTw2mw8vwbY00qT37HWQ1LY9M7ul9KSwewfBHNfBrQNZUdHbQg/csPsvyx/ulh1SEq55c8VaJkqefluM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791411868; c=relaxed/simple;
	bh=j1hldUczhaCmA9pPT03tsjvi/psIdM+Fkc0aCRQs3iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3kYX0ZpDj7iwbYTJCRO29F3x6HdCtpfFcnLgWjmN6vT8HmSRHeblDv5mZRHFzgKVwCAc2ChFU84ZuPrp9a/37ZjBjN+3u+bm/O9pjtzl/EVHFghKphSGZSugO9HKjTyH6Ac2bFhPi3Bhz7lDWiPRMF+xf3Phy4WEjFIDbXIrCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/dl1cB6; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/dl1cB6"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8245021651dso1837675a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 15:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791411865; cv=none;
        d=google.com; s=arc-20260327;
        b=OyOkxQGza9Dufqv9S/lcI2QCXTPAVCjm/rOcqj02XtgqORqFvBhFDJRK5l8b+MWCWQ
         arhqYy9a9J62IIks6cTsGhE/TK5nyPtaU4KnaShitMb8ytb3u0ckljiR765TY26+HByK
         G6wpM+I2kpJ2KClytrwUILErzNyUTC4lt/NMdl7w53qfZ8CDGZL9l2+FXLaNtgTcMCah
         Vi/CqIyudeEb8BGzOE+ntkmTleLin1GGWixmj/t7OlrvTIm+6VxF0KdAfBKpeOxNOEKL
         1a+66SjYVCjWjBg28oPqgtp+l8p42DxyqhOZF+J89lND+HSlZVxBumKqy7vphJbW2Xsk
         35Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S2K8HbBhL2mL5g4N2SG5IxowUfPkOB88+AD/Ddc3DyM=;
        fh=sTjj58hxCgKCSyYtlyJrSs2HjiASnpACi+MvasFVgxU=;
        b=fHmMSa73Pu9XRrA6BrgK+n0I3L6RftIta087DMLXx+jehdKjun33daJ8rNGbBkvIsT
         3OtHC1WTbvSCd2XquYPxVuEs8/lq23aaB6U9UMt/UD54yPKbcrub3lMVz/Z4AmJIgy4t
         JGRGDnou2xpefkhNLFRekGuSlrz5XRfRcCo4FA76tLdd1ChS/sZFUZfaUSXEnkHhTugB
         JcJSpe2dgfEAzrlmm8jA5ZY8OG1LQf8XWkBoEoosMf3hWmuNBDZROTYCAz3tFM2V9831
         i8Jq+/WjeKg/a1DDCbGQI6tjyAPZz7/HeIeHFtNqqLnOHX0eeq2FU/Rc9Ojtpmn82/M5
         55Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791411865; x=1792016665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S2K8HbBhL2mL5g4N2SG5IxowUfPkOB88+AD/Ddc3DyM=;
        b=m/dl1cB6TDZfYKeGU5JcD6RqTzO6S/5Dj4fECxD8A8ae5TgjwrK4OPDt1Eruhh063a
         HWjqNvgBoYFSxGrE0p5SdHm5IPKitus9iZeKz0A3uB9qOFRDn5fJB+2sxXwQ9OxlbKvr
         KcBDRMjvt1CZ6DLtEalQltXc9Ubk2SKa87agg/slsfkzS586CvJKQR1vFM1m7gXkll7c
         UuQiAPrHx+uZ58E25DxFaU61Bxe8CVp2DgtQpDpCfrgxnsBx7BNwO4rzftkP533KhGmU
         V+GDgX6JbZepzmCa7zq6a4hvB468N/lcxA3YKJ5fP7bvubXUe85PQogt4QGUMRSzwwNH
         eg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791411865; x=1792016665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2K8HbBhL2mL5g4N2SG5IxowUfPkOB88+AD/Ddc3DyM=;
        b=xkPmOsAfQsDxhA99iZ64a+tibWC+M6FTEIyAGiHtma8N0mme1s2LCBj1WNUFYDU2R9
         f7/K1RpOyO/KHDsc7T/3b7Z/Lp/7rV0b3n172+qYfeYvizIAZX8WozylkyxksxJJcGXN
         6Tr4PfWWN+u3j3RiC0EnVMEmGLGkQpP+FE3yofJb1MrCyTZXEMykArfdWqHuNKNR3+D6
         +MrPUHkkxSrOo4PkhtBf9Ya/AyTXS/SbIf7/dgKvqw3tYPm5vU3u0uNfLripjfVC7gBy
         jZ3Swdb2Nd6//IXZHQO5fURpWwvu//mtItLiexFCGgOwYYpKV97BfZh9hV510xbYuSFg
         Bg/A==
X-Forwarded-Encrypted: i=1; AKwUvBxXeBKUWJQ9+ltJVgSZH7nOFwCvaHP3umqPnikxs9LMxS0RahQ8O9qCvhGst9IBvBdflpybs6Mj0JHIG9GlTkY=@vger.kernel.org
X-Gm-Message-State: AFuF++kmZONjJAmZuzpuj98dR4DNoiYW3fiKxjB4HcdG8/6LMFErxAXm
	KMpuI+yjhruzipbdKUcgBuE436EM9MwfHmb3GYtwYbFA+vqBtrT2dU/fzKTdLO9WP3VdazuQDoK
	jVal7NQr6BYyHHsbFkBk56Xusygf1x5I=
X-Gm-Gg: AYBFou2gL+t9P7oOyhxOmXkobNEmea+OSVQQWRQlpOBbtP93CxJ8dwARtHr2rq7SVkO
	AYS+XqPPDE77frwU4sFzf8Un+TdoqBnYPxSi0MHJI9kAQkrOupjGI0tArP1lrhJEaHlYWrjiRib
	/6bV5Wko1iWX7YsQTv3jQzv0drEFfJ8vqZfmge0MtnnnR/HeBLCYk36JFdY2JTzYYFhFOREIIg1
	RSDjyQDLw8fLORjuiSXcwVKJpGjbFcN/czTlAXtU5QeUzMXgs9EpOrGiaAFQqVgy1PRUp25i5Ll
	sUifR70IoWsG7UgFKPwyRhl9lC1akuDq9GpA0QyiVJ14nrQU1PX1K5T0nep8Queq6A==
X-Received: by 2002:a05:6808:c18f:b0:4f6:1336:cdf9 with SMTP id
 5614622812f47-4fc4677cbffmr3710852b6e.35.1791411864709; Wed, 07 Oct 2026
 15:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-a3-arg-trusted-v4-v4-0-253ef3a1a69a@mails.tsinghua.edu.cn>
 <20261007-a3-arg-trusted-v4-v4-2-253ef3a1a69a@mails.tsinghua.edu.cn>
In-Reply-To: <20261007-a3-arg-trusted-v4-v4-2-253ef3a1a69a@mails.tsinghua.edu.cn>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 7 Oct 2026 15:24:13 -0700
X-Gm-Features: AclHuK9gTsp7jsRrpHs1cx8Ph74rNFmBjbvSX0u-AULTjQs9ENLQ5IRNn8neVso
Message-ID: <CAMB2axPoPSJen57E2Suc1hFcwhHJjjEruC+8tthRA+-JhDA6Og@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: Cover trusted BTF ID
 argument provenance
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Brahmajit Das <listout@listout.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 9:25=E2=80=AFAM Yiyang Chen
<chenyy23@mails.tsinghua.edu.cn> wrote:
>
> Extend verifier_global_ptr_args.c with calls that pass bare and
> RCU-protected task pointers to a global __arg_trusted parameter. Both
> calls must be rejected because neither pointer is referenced or trusted.
>
> Add paired test-module kfuncs that return and accept a nullable trusted
> task pointer. Passing the return value directly must succeed, covering
> PTR_TRUSTED | PTR_MAYBE_NULL handling in the common argument checker.
>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

Reviewed-by: Amery Hung <ameryhung@gmail.com>

> ---
>  tools/testing/selftests/bpf/progs/iters_testmod.c  | 11 +++++++
>  .../selftests/bpf/progs/verifier_global_ptr_args.c | 35 ++++++++++++++++=
++++++
>  .../testing/selftests/bpf/test_kmods/bpf_testmod.c | 11 +++++++
>  .../selftests/bpf/test_kmods/bpf_testmod_kfunc.h   |  2 ++
>  4 files changed, 59 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/iters_testmod.c b/tools/te=
sting/selftests/bpf/progs/iters_testmod.c
> index f65cc9766633e..145750bb64ef8 100644
> --- a/tools/testing/selftests/bpf/progs/iters_testmod.c
> +++ b/tools/testing/selftests/bpf/progs/iters_testmod.c
> @@ -46,6 +46,17 @@ int iter_next_trusted_or_null(const void *ctx)
>         return 0;
>  }
>
> +SEC("syscall")
> +__success
> +int trusted_nullable_kfunc(const void *ctx)
> +{
> +       struct task_struct *task;
> +
> +       task =3D bpf_kfunc_trusted_null_test();
> +       bpf_kfunc_trusted_nullable_test(task);
> +       return 0;
> +}
> +

nit: tools/testing/selftests/bpf/progs/test_kfunc_param_nullable.c
feels like a better place than iters_testmod.c for the test.
