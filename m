Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A1433045
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 22:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192991; cv=pass; b=Mv7lrbJ9yb5bQ2qFUEEPBwIS5rdahKJPJOZ+e5k2v8e+FD1R13Xyxt979+yGIUwwPxPSZORw8OR+DWJu6of8Q78cWnUoGW8DHSGLEUnLzJCfV8ojk1J7Dwh/FbfOLfS44PhNF79c0uJslFFhI77aB6ofdX6MAUDlJewcXfxtFlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192991; c=relaxed/simple;
	bh=lDRePanPTV11K2Z+08yVQKWAXDh2XC33OhI+xhcEdeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQe0Gjn8rZeq2Mb9FmiyrwikZ7aNR4pEUiN1wNvIZAae8oKkRHTotrWB4KoKkfC+uJQbLU8XAN8CBjfTZ7GWkOzIAiF8dmPjp8Kjl0X1OTDl94KWVYf06lUuvvqqeyZGr2Ne3ShJVqK15uBPZ/lyhAjr6FBRKTcrmk6mwfsocYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWzFOut3; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWzFOut3"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84830c774a0so3363019b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 15:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785192989; cv=none;
        d=google.com; s=arc-20260327;
        b=Pl9HaeVet7D0CxnM0+szbRdpLZ6CNUf4EIXXvDWpfO+tp/w3P6uBvu5qkNmc0If9Cq
         9r+CoQCXdq/dP+Uoe+qsIXuztYXuC0pEBmhjIaypjlwUKSs/Q5pDOpoOl/NButRgk+YW
         xrqNVOHbxtvwHuJ1xg7Q9hQmW7QjCWeU9aQUD9x1NH0ZZkQKC9FZ2FrKGuWDuJySrWJs
         YEgu5ftPfhUFpfeZseNUfcHSvymtPJocEVlYNiowx4i92iw+aEpZE3O/jetcOe0BKmLf
         hq9ukdr0WABA50zcCnj1R1XEO/VUov1eNu470UmcL5xp8Mpte6dsbqLIqg0IScARoBNw
         M2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DarHj0Bq3F3tMYkSeAITMeTVDj8Ip/fyH2VQU4C//Eo=;
        fh=+99eweAc18l04gp+KeQsQUri2IVWiw2s9CKrBtP4aaE=;
        b=JtukiXUV64Mbgw5U+5a/DTfCxMZMd3vvpGagvTZ2i3HUfgJwQZu78VE4T0Z4soWhS1
         3j0SlmlJfAiiUjjWsGfgY3cjNjYrjY/LdeW5P5bej0VcNzkRDEHRfnj4E6Oh0eqeW64z
         073HhZd/RamsgVmnGTnYJBMoIWZEjNkU94yHlLQ7JEFN/KIa5LCCHdBFQ8jPLXMDJBXn
         hdnbdo4t1M34S4QDtHPb7PTlhD8uz+a3982QhFq8Xe9penLAEF9nUOjTBMExIYzGQVix
         yYCKensaLHVOH7LGGz4zaaZcV21v9LtCdmLM5mdXTYxWvJ1UMpFQYJNRY+lMsYOUZ5/s
         cruA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785192989; x=1785797789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DarHj0Bq3F3tMYkSeAITMeTVDj8Ip/fyH2VQU4C//Eo=;
        b=WWzFOut3bR3SRz/JTAfq+oP5iFC8LAkfchzKfCjfGWkPttuwb6h0mMKnzuIrkbV7D4
         Nit+Vpa8iLr0BIQw1tbt71VY5WUPQAen3SgCZbiGBpkTAIgORMsHaTqrFkAKtthGLqkP
         0q69bfN5G3jk8vY0w2WPdwURZPUivk/VrkjtI2UloPq1zR92JoEPzA4HS2LDGoeyQFUF
         LZtGsW4IrzSVe6ruaJxaOB3Gew8ok9Tc+gw2ZZelCQmmV4suCZB8p/6wZWpZQ2Uh3Y42
         GMo2cKyeq/NXslwp5kH4DsiKPci20rrhEm4ITbfCRwiHOFvfyRfQ9n01aqawyZOC2tt4
         /4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192989; x=1785797789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DarHj0Bq3F3tMYkSeAITMeTVDj8Ip/fyH2VQU4C//Eo=;
        b=NoHcqgA3Wu4/22reKN+OQwJSrtY1FrBAYQ4r1jze0a8Ul9fejlv4rHMtdem7NZBMrD
         URSeZaeARyFhuTYWrdqfTpGCNI+bQvK0pMNKKqu5oXuUnxlvRV4uwRUPtO0Vsn1muY1E
         0vR95gX6YNblky4UJ9n2BXz61I1Bk6gjtITu0YfpP4J2QqgeyipW3agYzqTscC3f2hU5
         vBHiJ47bMv/PDfZLkVY7++jAMLwUoRPHVmuSAuNsOtSwwIBoA7ZnHS8c5vMaVtOMNWQ/
         mLPc4GNdOP6RRoXjqDjNLYNimmvT61ib68KCXtUrXFarCxY/hNPtZQ+t/ZRqp6JrXmLm
         E6bA==
X-Forwarded-Encrypted: i=1; AHgh+RpT4TuJ7x73DTH5czk93uJbfKRak4yeUwnnfkDaIi6lKA6EpK8VJKFwQ/gqQL1D9s+ygS6H0nek/1jmMoRq82k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UE/IEQbBovBJ4PDHU5zLZb9irWFuiyn/43x75baKy1Y0SyNO
	uyxaGUJF8vp3XMgH33hlqhn0cYpTL94htha7gQS8ryok9n7+Ij25ZkGrJp/YYq4VrSz7TJ6p32u
	tIvLIirL+eq3j/CnU2MH3sTVyRq8uQiw=
X-Gm-Gg: AR+sD13VDOn/y44niItb80jxZa70KgoAgdW9j9/zXt1rtmHU6QD+d3qVgI/CEdPNbrV
	5UxJ4SjEH8LZAQ/iIWFovajqrTNkYAfpfAxPv7bnPrjHaXw0sHRoxUCgsz7HCDiiwMxSa3M7gsr
	dWvd3UzxR5G9O953GqdbV/yz9pM41UcWVEXw0SozV5CCFye9QFsGbUuP59KsSHi/yU7D+VbLaKV
	2+7GuE/OKTgwMwMuI5veAl9e8wChZSr/hs5uDZHwqiSGWj9+lfZ8JDQZzYTNSEQmlBv86zgr0Sm
	QzHIY1yRZBco4lkdKzd3d+GkQka41WNUq/JxG4FMwUmRzEkBdyQyddPffA==
X-Received: by 2002:a05:6a00:2d83:b0:848:425a:4e31 with SMTP id
 d2e1a72fcca58-84e92a39d47mr15615b3a.24.1785192989485; Mon, 27 Jul 2026
 15:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784695085.git.rtoax@foxmail.com> <tencent_60882E4BE4F247C5F6D564F41BF1C3004805@qq.com>
In-Reply-To: <tencent_60882E4BE4F247C5F6D564F41BF1C3004805@qq.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 27 Jul 2026 15:56:15 -0700
X-Gm-Features: AUfX_mxYUepXWJlS78C05FXNW-P_pl-3XLjjvKMCSviOnGTmJiXcgwwhBLFYn6k
Message-ID: <CAEf4BzbRvjT3X=Ds+YqLiZt=A0ujk1t2GCDcmbdT3+QX+DsQDQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/2] bpf: add bpf_strcat,bpf_strncat kfunc
To: Rong Tao <rtoax@foxmail.com>
Cc: vmalik@redhat.com, andrii@kernel.org, ast@kernel.org, rongtao@cestc.cn, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>, 
	"open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)" <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 9:42=E2=80=AFPM Rong Tao <rtoax@foxmail.com> wrote:
>
> From: Rong Tao <rongtao@cestc.cn>
>
> Add string concatenation kfuncs, prototype:
>
>   int bpf_strcat(char *dst, u32 dst__sz, const char *src);
>   int bpf_strncat(char *dst, u32 dst__sz, const char *src, u32 len);
>
> This differs from the glibc library functions strcat and strncat, which,
> for safety reasons, require the size of the target string's memory space
> as a parameter.
>
> The src parameter cannot directly pass a string constant, such as "XYZ",
> otherwise it will throw an error "write into map forbidden".
>
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> ---
>  kernel/bpf/helpers.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index c18f1e16edee..85afff60365c 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -4195,6 +4195,79 @@ __bpf_kfunc int bpf_strncasestr(const char *s1__ig=
n, const char *s2__ign,
>         return __bpf_strnstr(s1__ign, s2__ign, len, true);
>  }
>
> +static int __bpf_strncat(char *dst, u32 dsz, const char *src, u32 sz)
> +{
> +       int dlen =3D 0, slen, space, copied;
> +
> +       if (sz =3D=3D 0 || dsz =3D=3D 0)
> +               return -EINVAL;
> +
> +       while (dlen < dsz && dst[dlen] !=3D '\0')
> +               dlen++;
> +
> +       if (dlen >=3D dsz)
> +               return -E2BIG;
> +
> +       space =3D dsz - dlen;
> +
> +       slen =3D bpf_strnlen(src, sz);
> +       if (space <=3D slen)
> +               return -E2BIG;
> +
> +       copied =3D strncpy_from_kernel_nofault(dst + dlen, src, sz);

I'm not sure strncpy_from_kernel_nofault() is designed to work
correctly if dst can be modified concurrently. Which in BPF case, even
though we validate that memory is correct, it still can be modified
concurrently in such a way as to cause strncpy_from_kernel_nofault's
inner dst[-1] based loop logic to go beyond the boundaries of target
buffer.

i.e., I don't believe current implementation is concurrency safe

pw-bot: cr


> +       if (copied < 0)
> +               return copied;
> +       else if (copied =3D=3D 0 || copied =3D=3D 1)
> +               return dlen;
> +
> +       /* The copied character count includes '\0'. */
> +       return dlen + copied - 1;
> +}
> +
> +/**
> + * bpf_strcat - Append non-null bytes from a source string, and null-ter=
minate
> + *              the result
> + * @dst: Destination string.
> + * @dst__sz: Maximum bytes of @dst__ign, includes the trailing NUL.
> + * @src: Source string.
> + *
> + * Return:
> + * * >=3D0      - Length of the concatenated string.
> + *
> + * * %-EINVAL - String @dst__ign is invalid.
> + * * %-EFAULT - Cannot read or write one of the strings.
> + * * %-E2BIG  - String @src__ign is too large or the remaining space in
> + *              @dst__ign is too small.
> + * * %-ERANGE - One of the strings is outside of kernel address space
> + */
> +__bpf_kfunc int bpf_strcat(char *dst, u32 dst__sz, const char *src)
> +{
> +       return __bpf_strncat(dst, dst__sz, src, dst__sz);
> +}
> +
> +/**
> + * bpf_strncat - Append non-null bytes from a source string, and null-te=
rminate
> + *               the result
> + * @dst: Destination string.
> + * @dst__sz: Maximum bytes of @dst__ign, includes the trailing NUL.
> + * @src: Source string.
> + * @len: the maximum number of characters to concatenate, the null termi=
nator
> + *       \0 of the target string @dst will also be included.
> + *
> + * Return:
> + * * >=3D0      - Length of the concatenated string.
> + *
> + * * %-EINVAL - String @dst__ign is invalid.
> + * * %-EFAULT - Cannot read or write one of the strings.
> + * * %-E2BIG  - String @src__ign is too large or the remaining space in
> + *              @dst__ign is too small.
> + * * %-ERANGE - One of the strings is outside of kernel address space
> + */
> +__bpf_kfunc int bpf_strncat(char *dst, u32 dst__sz, const char *src, u32=
 len)
> +{
> +       return __bpf_strncat(dst, dst__sz, src, len);
> +}
> +
>  #ifdef CONFIG_KEYS
>  /**
>   * bpf_lookup_user_key - lookup a key by its serial
> @@ -4958,6 +5031,8 @@ BTF_ID_FLAGS(func, bpf_strstr);
>  BTF_ID_FLAGS(func, bpf_strcasestr);
>  BTF_ID_FLAGS(func, bpf_strnstr);
>  BTF_ID_FLAGS(func, bpf_strncasestr);
> +BTF_ID_FLAGS(func, bpf_strcat);
> +BTF_ID_FLAGS(func, bpf_strncat);
>  #if defined(CONFIG_BPF_LSM) && defined(CONFIG_CGROUPS)
>  BTF_ID_FLAGS(func, bpf_cgroup_read_xattr, KF_RCU)
>  #endif
> --
> 2.55.0
>
