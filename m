Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD7377006
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786739572; cv=pass; b=gQtjBJeQdjQKVSulkX3Lmx31jTBt9O1hLb0SI7coYOhGfXzhzuFf1VfPUi4XYy2yRxtl+NCgPJ59HEA9IJMmJesSIAFvbOgg0cg/vMkQt8f7V1BTVRV+McldoGJo2KMEjVaEEMn7fvcubPWgF5WV/o1fI7SXqNRZ0FyQ6SCNGl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786739572; c=relaxed/simple;
	bh=5auGWzuy3H74mXm3K/cxbQ35Wk+k637VrdgTw99cmXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jt2/vAtwpJqTrDljg2UlSnv8rG+HHPy88ZRWH8+8NEGWmZdRtMQKTjzq4tGpyFtXPOgH2esIvd+2LRRqGvxy4nf1avOfsf4kjvjOKrUQDgMfADHGKfGPKoej9/OD3KfmG+uMx+At3XH7+PbGPGzn6b8fdLIdaArUab7b8XMcHnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU6KhZSa; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU6KhZSa"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1177603b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 13:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786739571; cv=none;
        d=google.com; s=arc-20260327;
        b=MUQuo6B+pTt12VJjmpbfKgB4yTXf5+3MLaTv7y1y9eWq4OgdSZzC/pXHOlT7uImB6A
         dDGxAYfrYm5V6XYoQVqYZoa3ZreE2Sn2YFnH+TaSMMyaooWx6F7j4vIrC8+DeNIDZwH9
         jfbXepBmAOAT1B56tI4FsglZWWupqd3gkAM7MRs/VTia9IvE+Cxag8rmwq8DxuLB2Lw3
         YZRl3yHU30TFX8C8/e4eMLWBF92irwm0uaq3jnlubdK6TA1/18pxzBgyd5OkfN5wFYQ5
         G/AvJo+vcw9Qdn1xy2gZzFsPyKJmmGJL272UohbaB5mP6dpJjRrH++9uZChXHICAyCQz
         6E0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mqvFprfHSRhKgldEIyrM1DXPu8/aXrHT7U/ON/4vjG4=;
        fh=sJ1W5wrBRdRu3x7S35d3Upy/ikLT6NxCeeLYvrVurSI=;
        b=Tg7ygMox1lFQSZjrx3tNomqmoDqqtUz5+zSTPuuWWcfiL/bM8sKke9eqVetDUqmoGv
         +uPJCvA3TFM4x3cNTkfgH7bhowhZ6o3AIS1E4aRC2e21rQvXWznZClk1Z5aAj/rkgwLE
         u+xnB9R/qFc6orfNwZpS75HxzxYhYuF9rrjfY3MUQBXSpo+WLeaE7pOc8xoaJL+bfpEJ
         0LtuxtF6jQUkRdIeYCb+1/QFEEOISkNvjVzFbcGPDRXlksQB9q8+deg7AHYMZ97zQsFd
         Yww96+9XMuTzcy7+hiswhay3NuXa+5z5LUVlplgtFgCROW0GxWe8R6cttij6Rlm/34SN
         uujw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786739571; x=1787344371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mqvFprfHSRhKgldEIyrM1DXPu8/aXrHT7U/ON/4vjG4=;
        b=AU6KhZSa+xEQ5mtj0yJQkqNkcqspmTovQ/qjNqQHsf3eXSAxmwT+qdaDZL3uDkL5u6
         IpLQRBUwf6GjQ/Kfof5CJy6Pz71+t2mE5Yva6hJO5TS8DnBbuGG6C/H/r5UBeXUGhCwa
         SOgbQhKGShNZohY3uVP6I29N3nhLf8fHVP0Jc/aZ15kYSDsCAltfGYMlo4mtE4FyUz1T
         Bcomkz8JAvkRsn8V3BkbzsBE8utVJ9bmQ9MDn8UxaNqpqCLX0dusorVdVZ5Q3EbFQish
         Qy7AIHvx62nwlkLEXHmBI12nCTCXB/KobgjNcGswWc4kdGXZMsCZAMn48jvptH7tl8T/
         kS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786739571; x=1787344371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqvFprfHSRhKgldEIyrM1DXPu8/aXrHT7U/ON/4vjG4=;
        b=sM63f59Ai3jjTDVIYmdYMovlAz7o/fO9pEWJioXGwSMPQSByIvP+a5GylH6oUyhd0W
         uM3McM8fs8GPkI2X6TrAIVmSm6tZ/oUc/m+YBaswH4sFtiUMJWsanzlHX9JygFxwDj/W
         VciYVxIStjThbqxzSBhGiLGCDkMRkXp8bzNnXtWWvn0bwP93zDvCQIyLgSf6FiqIdmNx
         gwNpxZ366NY8f94JdQKbauJLMn894nbJahmAC3cJNJdFqMu9TXunKTWRvd94Pu5a0FF6
         ONUmmrqfcNqCrEV8sqAGHVEQytsoFRxlcskAYeCzeaT/3KnSNZwRNCMKBFErkNDTxgz5
         ajyA==
X-Forwarded-Encrypted: i=1; AHgh+RrOZbGf2B6wP8h4dyyhktVnYI3URNIttWoO7A0JxHedXbq+5S8bBJMtWHCiDkfRPIhBoTHIKTFtsWLH5W9Grj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi42MaOlFvXGXJ5XejB6qJiX+Wyj0dFQt4zbK5SnjfLpoEDebT
	teIj9C65nYyUQ9isJ/dnY+n5KsD8zHRdM7MSwGo8zkBrGBVGKQYKzxcLGg5wLW/spcUBzleNCJY
	GvCvF1+37QF4EY5To+e9JVs3Ghm1wUZY=
X-Gm-Gg: AR+sD138MniRmOzDdJM3TS0aq4XPpQZNkln+BCr8LdsrkTpWAVZyxHxt7Ey0rukWLuS
	W44dJbugzUQLp2nJ7HOJ5rzTYHU3N/Rff6iDTt23KgIPXXKyhvUbDD8qPDR/Fy6ezefMW1mkbQj
	id759JZMtJN5enqQRjyFHjDzQDlmrivUGhJZLmPpQ3qIM6KqWE/vp67c+U0ytQ/tN5lZo94X7wD
	bpv1EGeDXRaM+PrORk6Lpc1OzzF8Mtk+AUovGRP85mHSZ5EirOuliw8QNu1qdW7QqiFq3W2xXQd
	HdacI8KAJTB3IVNmrl+BRlWHLoGzyf8TEnGxzOLgn/YmSE/PQxAW6N/bl+H+CkWXGrQjAlodO+y
	c6ou5ilSmRLlmDgJPXK9FWGwgrA==
X-Received: by 2002:a05:6a00:a21b:b0:848:417a:d1a6 with SMTP id
 d2e1a72fcca58-84fddfec0e9mr9121060b3a.15.1786739570651; Fri, 14 Aug 2026
 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814173206.93082-1-leon.hwang@linux.dev> <20260814173206.93082-4-leon.hwang@linux.dev>
In-Reply-To: <20260814173206.93082-4-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 13:32:38 -0700
X-Gm-Features: AUfX_mxFBcL9JIQ3h-wVS6FoHUfCG6SKj77DXXw_Yp0V8tjDPaYTtOnuqLNlwD8
Message-ID: <CAEf4BzajJQobFoSUE9JxyieKupF5_j7q3jxWMHC8ZqAUcHY0yw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/5] bpftool: Update comments about skel data maps
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:32=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> Since is_skel_data() includes the non-memory-mapped percpu_array map, the
> "memory-mapped maps" in comments are incorrect for percpu data.
>
> Update "memory-mapped internal maps" to "skel data maps" for better
> explanation.

What is a "skel data map"? "memory-mapped internal map" is fine as is,
leave it be


>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/bpf/bpftool/gen.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
> index a50540ef6521..e5e82255af24 100644
> --- a/tools/bpf/bpftool/gen.c
> +++ b/tools/bpf/bpftool/gen.c
> @@ -303,7 +303,7 @@ static int codegen_datasecs(struct bpf_object *obj, c=
onst char *obj_name)
>                 return -errno;
>
>         bpf_object__for_each_map(map, obj) {
> -               /* only generate definitions for memory-mapped internal m=
aps */
> +               /* only generate definitions for skel data maps */
>                 if (!is_skel_data(map, map_ident, sizeof(map_ident)))
>                         continue;
>
> @@ -510,7 +510,7 @@ static size_t bpf_map_mmap_sz(const struct bpf_map *m=
ap)
>         return map_sz;
>  }
>
> -/* Emit type size asserts for all top-level fields in memory-mapped inte=
rnal maps. */
> +/* Emit type size asserts for all top-level fields in skel data maps. */
>  static void codegen_asserts(struct bpf_object *obj, const char *obj_name=
)
>  {
>         struct btf *btf =3D bpf_object__btf(obj);
> --
> 2.55.0
>
