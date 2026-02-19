Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A634D912
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523419; cv=pass; b=Lh73GdTL+FfNuENoXNtmuA0yRxihI54tdR9F7GvFmfjzlrxHpUqi1/BLHzuHxRKAJFC4uMsiy0VaFZ8PyvnAwcarimlzN9t5N5dFsafHbxYCkwKe6+8+iZzgfqkCr0+mVOw5Vy9QSNAR4Jqeeq6nk0EvIT54YcIpeUsPg3WgsKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523419; c=relaxed/simple;
	bh=gHUWgff7WmvTx55hmvJ5HXD9obcxHan7DBI288vZwm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeiplBrm5YZLxmvHsOCds8kiM0Q0pbGVeJxztd8teYWsirAdsq6/smjud9gNKrij/YPFiJ6X/NLejFWR6tkeY72ypY35hSPb8eGVfN1EAspp3RAaR5zaoCDfMHQGuAUkuuHB8yHrBetA6JLJ6C6AjMQasQOIlsxl2RfeHc/so4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsnIqC/U; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsnIqC/U"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43767807da6so960040f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 09:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771523417; cv=none;
        d=google.com; s=arc-20240605;
        b=h1otea/eC4syAkZOWDT27fVBVqKpxbybJHGf450+tBF7rQz6nNrvCxEXLrlsQkTYrT
         YX9neWQqGxPBX3aIyN9P8XFYo+wJvgLc6uNkWzbx/M8nV9DD1e03NusnC0l8izhBbX0k
         O6ya6tOgqaKJnmdhXdKAssYlVVBg9rqWHo0/8XjvGsRRM0FqDOYdBEgjiy4fTPH7lSIS
         PdU6aZGTCcZM+uY55tx+Oq6NBMm4XSTGGbg31GxLG3z/e/NAJZG1UF6IbXxir2pg8MCj
         iVV5kCMyhDjadS9BjcYFd4Q+pSBqnvud/CGVEPGOS6DYvTeIyx7L2elNUbeXWzAduZ5h
         Z1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=;
        fh=GHvp8AAu8WLNNTJGX2ez+DwJGNY83ssSeKp4iXUjTJk=;
        b=daHT2chhCYi9waauVOMzszoQAO7sbDXbSxf4DRIZAuqULY2wZsmTHqDQBMsVTKewdf
         il67SR595J6ohb1XKzGbgbBBuuX+YEdMommbbi8Ju2G7sAOuit2gRmRI9TI5iLjhTDj1
         AFy5tt8jsGf4pglkaJsQ5n+XFjtJKHDMDI3b6w7OAWYhMNq4pUhw20Uyx2hECcX14+Y2
         fe+T3jCBQEPHxI8L7QLpOQploZPNX3etyX/ITuFJVgohBjSP36st+7CR6zC6fTqXYp0T
         YulZDdA/OXV/erd5NA4ivjursH753B9q0jhE5I7uPQgN7YDAAL58CABIBQJUw2k3xfNd
         +lTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771523417; x=1772128217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=;
        b=gsnIqC/UE6uQ1p+IPN/UgnXIpnNKwwU79bKqZrHB18g8etnqKiV/lGcnAM2yjkRTfM
         P95Ec4CENYQWOw2lcasFOWipi6xWZ6+OEVVh90/cY80PzH57NuWM+C+7S/27bFEv0Mt0
         NEK6bdOdJwec6jyGWSR1NYrTEPX+tmbWzkBz1E/mdID/G9MLEciaQxiJRxgpOSxkWG01
         qLzT9hGI4SqiERnHy+v0WvHnCTYlnIkSybvX2WXIttkiChuGDqCcuG17H7u/C/nSr42T
         bqBw7DHZZ2IlPEz0Mrp598eq+G+A3V81jNfmwjZwxr9hrsJzJqLuu65vYwdoO2P2KLan
         T2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771523417; x=1772128217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=;
        b=Z7cnupj5L/opVIhMr/JjGulrnqroTqxILFSt5avVt+3w+WQBN6c5ud37gMQZqXAaK7
         fDP09sidtOGbFxwvVausvlS9IgdZgZRVh1p/rL58OuTU8GItq4IjnsFRCS/O5iBn0uov
         yG67PPBQYb+sRSp2v1zdM2w7tXEPuDylDg6Y2EBfyCao9+bZNBpYxbHiGPqzzPgIcdbk
         Q6HaNHcFbfvkkZ8MOdn/ImCp+qaTAXvn7SzC5vsHuIRHwU21clFPl54qx7RwkpJJSRDS
         jvFpulnEVJw3H22K2NwiNciQtOXwsA4xa4jkOzvLVB25WPjw+zygIw0wPYhrpUj2JbvF
         8RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgTPxT9xcgNwjTlxnR2YZeRlTTT1uL8w7bHiv/tEEBTI+DP+HU4YvnHlcwI186mdxdjwLY7tEMEZKpO9Q42kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3cGXOzgf7pyrSsGgPgxMBiTSvyqg3yaN7QEP9JxQ7dy5QZsDw
	aoSVy9TQZw27LAZ5yJWudL0sC2NN92sxo+OCkOnsx3oxEbwFJPlsm0NUpIlPhnqX6qy514czJe9
	hIYSB7vgEdraQ8/n2Spt8p1CmJ794pjk=
X-Gm-Gg: AZuq6aIqiIJr3Cy/CegVyBPeQIo60p0zrTXZWA0RaiqawVEbEMJKRH3DCnHK4sQKK8L
	7cVCj2/lcv14Kj1Tt7u8aiey2+GRRee0mlhpq4sym40l9WNRbGSgoytETlFrIXPnkkrCKnpB9Mu
	HdzDCDqtToUF5zAmn6iHiHKED7nyPw+46/hCcLT9a6AFfBWOLgayClo7h30amSuO6agzDLZ9zqx
	dsdviykL4pyoDF0gJo+wPQz8z5vr5m8q71UANEDAEe6GAESQivcMQ+o6ynGtxWBbLpg2e0TgHx/
	TLTnMw/lPa2vjIB8y8wU6pa8G7yJzZPyX9uPzHOw3SsYUZ4RfeFAWla7L2X1pFBTvDkJlR8mdbe
	q66EEAVF4
X-Received: by 2002:a05:6000:40db:b0:436:cea:6165 with SMTP id
 ffacd0b85a97d-43958df4415mr9935730f8f.6.1771523416533; Thu, 19 Feb 2026
 09:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-2-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-2-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 19 Feb 2026 09:50:05 -0800
X-Gm-Features: AaiRm52i-YIC0PVoZrigOcdI1PlDGl9FQnJThWLdjntzeSoTM5oZkoYI1MwTO7Q
Message-ID: <CAADnVQK=5Gb3w_QG4Vq32EfvpqAK_DPwCHtzzt7DzRkJ5_h6JQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
> +static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func=
_id, u32 flags)
> +{
> +       if (!(flags & KF_FASTCALL))
> +               return false;
> +
> +       if (!env->prog->jit_requested)
> +               return true;
> +
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_clz64])
> +               return bpf_jit_inlines_kfunc_call(bpf_clz64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_ctz64])
> +               return bpf_jit_inlines_kfunc_call(bpf_ctz64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_ffs64])
> +               return bpf_jit_inlines_kfunc_call(bpf_ffs64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_fls64])
> +               return bpf_jit_inlines_kfunc_call(bpf_fls64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_bitrev64])
> +               return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_popcnt64])
> +               return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_rol64])
> +               return bpf_jit_inlines_kfunc_call(bpf_rol64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_ror64])
> +               return bpf_jit_inlines_kfunc_call(bpf_ror64);

This is too ugly. Find a way to do it differently.
