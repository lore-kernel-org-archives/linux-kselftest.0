Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912143890E5
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783664589; cv=none; b=M5KyxnaEUdQ6v54segt5AJzlhNaG+5Rf09EnXBGyXES24hksN59qlyCvw4HLF6Yb4olUWTC52YheZ1ATf6Em3TqAf29TtI3d3ZOne0NgGiGgEIOiUHthFH/BJHMFVhwF9PlWZbqVv9OD1YIJ6DtKSrqaPciK83+n4O8WgWPyFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783664589; c=relaxed/simple;
	bh=PVv2MCpFxt2nbQ3TmkpbKr8KYkb16+WqF2Z6hSpHJU0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wc2uK6cbE2FT/vQvJPlNCb/9aBHBURXfj+i15A/Q/8pZswdhitJdgDiA7Zis/TpHYeIDe5GYy4/wx412at7qs3d4m4LU0m9UKOFhf2EIlYMl5+qVV4Y46Sumvbe32sO/GWlCWGpNJif+w0IGraPjFKHcoXbohK9v33pPwQu7Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVcxYCC6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVcxYCC6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485ef63b68so516988b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783664588; x=1784269388; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PVv2MCpFxt2nbQ3TmkpbKr8KYkb16+WqF2Z6hSpHJU0=;
        b=oVcxYCC6UfcO5GpsYhyGPl73/E0VLWOI/fSKouSFUmKhFxXOHWoiBi/84X9pfsSBe3
         qv/0CACClL9NiEeefu2J1cTc5S/5bQcuDs7DiL3xg+YserrTTnhz26O7IaoeOe9yRR5m
         Z6y7tNUnC4aPTk0qFYDzs4lOgTj4+EjPf7KiNFVD8u0mbWX3MfRHdPNets8vW1fiTcsk
         ZsW3LLrvXqT9ok55jHkUNvrI4/blJ05fy4vCKoIicatUr37ghiBR0WyLMrtZ6Zoc0muL
         t1NgAS6ZkU+C7f2G7WA7oc2uy8T9WH4pqi1nv3G7AH3qm0ViCg9IfARizlSjM9SFI7a1
         gd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783664588; x=1784269388;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVv2MCpFxt2nbQ3TmkpbKr8KYkb16+WqF2Z6hSpHJU0=;
        b=T4ULObXZoTuLtXYTsIqY0k/WR+ZEfbWf18PkEuWm1mbwhaj1qL//NSjLvx6HdPHaCv
         GrGySRjFEz15miP4et6D+sAe+hiudduxpPMasTcJ96zBMMbaxTsUqjQfrsH2rpdy+Rej
         h4U8wzfQujQKFWvSWbwGOmSbgrWpAz68wHFh5OwCMzbCnNkHDdvJe9ewok19l4hL3aAn
         cYkck47fKgztrCDyOu4ShbZpKVbCJ74dtQocetJhC7ShdlGJlmCuvbyyxoOPxBl2W4Bj
         WxtLOE3QDP+CTdZb3fXSFFQHRePPkfaqo1M1p1Ml3ocqy9A/e+FzWfVyNL04vlbzTOI9
         l/NA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8uI1d0W49xqCDMPL4GzyLjglcSyJNC4zE4JAX8IZB0jXBOfBqEZ7pYv0cZcZzLyCTWOpda8Dqiu7j1x7GGUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8sAyX4aPp8FfVXWfUTo4LvpOPXsFJZZsPGc/ZjjOR7DdRSbR
	PFgZ5D/K5dIQjlJau2S7ugvS9D8ohhWr9Otgi+iY3M4Rj2OEUToyPRYu
X-Gm-Gg: AfdE7cnN9sA/IqxnF31NsgjQ1FrcsjlWFzcrnzasmGlHgjAUqV5ECawfuM3WDIakJXA
	2C6zoy+IcybKK1V1I9hGQEpMHldeMITZ9VXTWb6B4kEpzTErNKYR1lXHMNia7KULyiWvOJf69ki
	z56n0iGBmnk3YmO3OrRG9fJrHjI7+C9i0UibBpaY4w47qISPA2RjVOGVMoidqiJa+/3MwsnRSv4
	ixZNKfh5XGQSSBW83u+S3ehqo6EdExN5026w2qHKuD71ZF5LKjO8hJ5k5fR5xrpxbd0mPzBKCdu
	ZFUO3IR551QGLAr4CTBVUvEpqAlmaRcoUt58TMvKqk6UGMPwNvyIEBH35md0YzuM4eQPvKZpx/F
	WIw61LqqSolYBTId03kIDo6DIL6/CDfYcPHzbuSpBz4UzdpUQ+IclQPHHbFakh7DrESVoD2lHPn
	jj7upDc/wWwzzNfea90W38pGjFi/sHG6wOIcqL3d8J
X-Received: by 2002:a05:6a00:2e08:b0:848:7475:29bd with SMTP id d2e1a72fcca58-84874753fbcmr1656412b3a.7.1783664587901;
        Thu, 09 Jul 2026 23:23:07 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848414a34f7sm3768820b3a.44.2026.07.09.23.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:23:07 -0700 (PDT)
Message-ID: <4349d987d34f9426bdbb09a5d02de61da8f3e746.camel@gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for
 buffer pointers
From: Eduard Zingerman <eddyz87@gmail.com>
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org,
 ast@kernel.org, 	daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, 	memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, 	jolsa@kernel.org,
 emil@etsalapatis.com, shuah@kernel.org, mmullins@fb.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 09 Jul 2026 23:23:04 -0700
In-Reply-To: <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
	 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
	 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
	 <ak8XSRiLKx5WcIQw@u94a>
	 <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
	 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-07-10 at 13:52 +0800, sun jian wrote:

[...]

> There is an observable effect on the target bpf base. I tested it with a
> temporary raw_tp writable test_run reproducer, not part of the series. It
> attaches a raw_tp writable program to bpf_test_finish and triggers it
> through BPF_PROG_TEST_RUN. The program does:
>=20
> r6 =3D *(u64 *)(r1 + 0)
> r6 +=3D -8
> *(u64 *)(r6 + 0) =3D 0
>
> With KASAN enabled and the BPF JIT disabled, on the bpf base without the
> verifier fix, the program loads, attaches, executes, and KASAN reports:

Could you please identify why the behaviour differs between bpf and bpf-nex=
t?

[...]
