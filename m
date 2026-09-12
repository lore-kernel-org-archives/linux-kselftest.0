Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB433A9F3
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239754; cv=none; b=JnSpqNCANML+qJJzq3Qm4SQHIEl9o4A5Hi8+NfHRVvIewyTQ+uOgF4gW/DWpMPH24EFXOnsH9tDdKoM/FkB/0naO4ogIdM8dYEyJCm7df54wIzCr2bsJFooD8X7WvrwrGLyFm+DS+O782aTLk6tpnDApHvhfsibWmcpJBWocmCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239754; c=relaxed/simple;
	bh=AbNN817+yuaC+BzzgKrfL2gQ21t93Sb1UgSXxdqY7ow=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=WBWqZU+xEZzYc+8FVJ1RLVDpkbUSTv3Xc8SPpITdt8t5q7QRYboLb1xwO/wzM9W58FP/ySPd5oowKxe+NimiD/TJGn7TxMS9Umo8HZOgJlC1vSyGIe1WZeRvvmPExyaqBJ8egAXYJeapbypFSe4Y3TR2IRoi5o+unmF6pJbMh70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipBZIOyC; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipBZIOyC"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-804e42309a5so185948a34.2
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239752; x=1789844552; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ka8L1Rv1PUyLBtiS267m6t/G+O4eiU0e+/Fx1513ee8=;
        b=ipBZIOyCBRLkIZjNvmE97/0LziWsI6a6Ybo9DcuyPSB/iCH73DaCKJZyPUmsZCFpc0
         8xu8TgSg8aQlSKg9+QG9A3FMvknUTkyNbAkzgGoHcfDFTI7kqW/LPIoNxNVi267eXAnn
         x6sZYkIojr3AaKp8vCQReL5i6HiOcHWVU908vG28666wtfNiCLHKkhJIjCfX6xt77nUu
         AbL6j/I6aTMJU0+YvNqZHbxs/k03+g9lUBge5RgLHUQQBM+CsfwcGcZ+542AC77VOw34
         jQxNdKhfxwrFYbsIO9cbAKRcnLngEYAR9sogpRspHPFxLjzKHxQ4gCo0pi3/PMY4LcUE
         jshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239752; x=1789844552;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ka8L1Rv1PUyLBtiS267m6t/G+O4eiU0e+/Fx1513ee8=;
        b=k28XFIyQx69WwueMUkLkFhcHJddeF8eqOFVzLaPflt7KAfpm4O64gyTGj7HKPYFglS
         VF5cjXknX+Xn/OClSadVJ0mHDhLb4nhNyz1G/bhSkzn1F+Hj4IdLeGGN0qxIk6YVOZWU
         M3JmZP5eRJI1kxPO4kYV62z39GouoKmPr6h7dQ4U8Ntym1ukfAh1qV6AXyXX1VmU4wl2
         V5YBzAz7T3yIVZSpUm/u5+Zf7LbMq7ACkZtJxMBoaxHWGzcYeKgrHcz/bzQXq8R+YnXs
         Uo3YKjFkyl/XS7olGFpgnk+06zzyG2v6+5vG1mze3m346Zl0tpHZFwXqLKm/nLe36Dmu
         XX3g==
X-Forwarded-Encrypted: i=1; AKwUvByT+UoQ2inid7uwJ4vL9EcCkcz39kHjiX9Un4qDEjijHst5Dz5N52estcD4zhHRYCVVT9SvVFiLzAzlb+fQ4tI=@vger.kernel.org
X-Gm-Message-State: AFuF++kfDkWcd1WOoDQcB983Wxtuv4q9JmoJYciq6Sn6h4UPwRVIyMNy
	8z6Nj+yAMR1o3RSWU5VXL3HmVHLs8yEcRJBUj2aY9VQZdNKL8GvyqBbC
X-Gm-Gg: AYBFou1dov+vo8lqWEyHpsqcEVZN8jWwvCa9fNov02n9arqJ2ky/iTSfpZ5BQ8qJAIu
	9auGdENmacBQBMuFCqXBy3VRvegAwszwJnOy51o4zQ3Nr+VmxgigmR4jGONfC+TNR0mmkty0o6W
	pKmfnMCzga3G/jO4vttylOjqtTo1htGsDQae/3oPHBAGHhevjD7fQMJ+6xKnWsdsD6xLG7xe1ly
	qPMquJN8jwEH4pcAfuGZVUA28P6KIS+JiNsPVSSyS157Q90mHfWO20bHQ5telV+4roNzFV894rP
	xKc/GL5fApcCqDweDGVr/HzR/BeNqp6HggGJX9BZdfYP3xRE+FOfa1ggYJtbSUOCEKIsbTQeiaO
	i0GwWc2StEKaCEjcHOJWP41V+gyEUNMdleW5MIy5JGbP5erFETi83muR5nL/3lajUv/HZJEA+2b
	QPirripOajtwrfNzsnVHyRd94/NJ/Nd4Nd1QOfV3iGA6XMQOHCPLGDF5pGvI+O9T93tN+ysfHXd
	OAbWTBFbYPE3ZbEHK9XUbbTl6xTc09jPuNhs04wGS7MnJcjPawg0hHBla8nx6AhUQ==
X-Received: by 2002:a05:6830:b87:b0:7fa:5c68:d04c with SMTP id 46e09a7af769-805a0502ca8mr2108995a34.22.1789239751843;
        Sat, 12 Sep 2026 12:02:31 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:14::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm6922575a34.15.2026.09.12.12.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 12:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 12:02:29 -0700
Message-Id: <DLDKK1NH3BO1.SZN02MHQTX00@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 05/13] bpf: keep the range across a sign
 extension that cannot change it
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-6-vineet.gupta@linux.dev>
In-Reply-To: <20260910164635.459558-6-vineet.gupta@linux.dev>

On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
> coerce_reg_to_size_sx() decides whether a sign extension is lossless by
> comparing the bits above the field in smin and smax:
>
> 	top_smax_value =3D ((u64)reg_smax(reg) >> num_bits) << num_bits;
> 	top_smin_value =3D ((u64)reg_smin(reg) >> num_bits) << num_bits;
> 	if (top_smax_value !=3D top_smin_value)
> 		goto out;
>
> Equal high bits do imply the truncation is lossless, but the converse doe=
s
> not hold. Whenever the range straddles zero the high bits necessarily
> differ -- smin sign-extends to all ones, smax to all zeroes -- even when
> every value in the range fits the field and (sN)v =3D=3D v throughout. Th=
e
> second gate, "both of s64_max/s64_min positive or negative", rejects the
> same shape again for the same reason.
>
> So a register holding an errno-or-zero value, [-4095, 0], comes out of r0
> =3D (s32)r0 as the full [S32_MIN, S32_MAX] even though the instruction is=
 a
> no-op on it. The no_sext test at the call site does not help: it is an
> unsigned check, so it only covers non-negative values that fit.
>
> Test the range against the field directly and return early when it fits.
> Sign extension is then the identity, so nothing needs updating -- which
> also preserves var_off, where the existing path would have replaced known
> bits with a coarse tnum_range().
>
> This only tightens: the early return fires exactly where the value is
> provably unchanged, and the cases the current tests do accept still take
> the same path and produce the same bounds.
>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
> v2: new. coerce_reg_to_size_sx() is fixed rather than special-cased,
> which is what was asked on RFC 5/6; it removes the RFC's
> call-then-overwrite at the mov site.
>
>  kernel/bpf/verifier.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 58e788f53ae5..eb093194e2a3 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5754,6 +5754,7 @@ static void set_sext64_default_val(struct bpf_reg_s=
tate *reg, int size)
>  static void coerce_reg_to_size_sx(struct bpf_reg_state *reg, int size)
>  {
>  	s64 init_s64_max, init_s64_min, s64_max, s64_min, u64_cval;
> +	s64 field_smin, field_smax;
>  	u64 top_smax_value, top_smin_value;
>  	u64 num_bits =3D size * 8;
> =20
> @@ -5773,6 +5774,27 @@ static void coerce_reg_to_size_sx(struct bpf_reg_s=
tate *reg, int size)
>  		return;
>  	}
> =20
> +	if (size =3D=3D 1) {
> +		field_smin =3D S8_MIN;
> +		field_smax =3D S8_MAX;
> +	} else if (size =3D=3D 2) {
> +		field_smin =3D S16_MIN;
> +		field_smax =3D S16_MAX;
> +	} else {
> +		/* size =3D=3D 4 */
> +		field_smin =3D S32_MIN;
> +		field_smax =3D S32_MAX;
> +	}
> +
> +	/*
> +	 * The range already fits the field, so (sN)v =3D=3D v for every value =
the
> +	 * register can hold and the sign extension changes nothing. The tests
> +	 * below cannot reach this case once smin is negative: a negative smin
> +	 * and a non-negative smax never share their high bits.
> +	 */
> +	if (reg_smin(reg) >=3D field_smin && reg_smax(reg) <=3D field_smax)
> +		return;
> +

This patch can be a patch 1, since it looks unrelated to the rest?
Would be good to test it individually. veristat run before/after.

