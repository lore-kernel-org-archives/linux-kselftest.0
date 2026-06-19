Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A1E3C7E0B
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 21:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903625; cv=none; b=VXNl8fqIXF1mn8k+TgmXTd0IMFbp4xewNDq5+DpO/TrqD/or5cYP4t+68PduUJLuuvoasiWUkfR+nakpKET5eMZ++2b6m1KCKIwi/uf9XjTjfbr+9b62zHRLK6wILLsE61vXPgi9B5Pwmdj+FAR8C0l78ST68VtLkl0Ouh2VTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903625; c=relaxed/simple;
	bh=BGS1cKnVpnESSPNZl/4xTDNdUBGokNfeZlrzdewdYP0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IICYuRofW3zFORqWGQ/y8ZdH9OI9bOQzVjl5HqP+7dEqWJSG9wBnTmeI1pdhJO472FhAU4qYxKUMw/eaTGy1fLkLQSaZ0alkf8UarcH5WkWbcdVGuoL03YiDj2xDB86jWH+7/nhuiR3nGGJiaKoEOBdwaj5PIhPeYFmmzQXhtU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+LtbxUR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+LtbxUR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8422f395a4aso1645597b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781903623; x=1782508423; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lnxWivuqEQZ8dcpSoejNyWh6Ys/zhGqPoxY2tVIHTS8=;
        b=O+LtbxUR0ApbzTzo/JATSanrfLlTIRLdVOBOmfXM+daJv2HQzljJJgw3PSLoIWZnIS
         S5qzU4++0E0z00plii8CzYKD2Hmkl7Leq8Z3uAxywdC1g0gK9nsFldtw3MYXoV5mslOR
         2sinMxMZyi7EvFMBnHNOlCtxyQVY5sVpgqZOTbGpjZzwhDTaO0U2XaQkeuQQjpu0uYMR
         zOTIwSJ/eeIHGw4xM3Qju3LAD9ePgbMc9SIPgGvBBMivGCO1T4zLo754C3O5aMGlsf3h
         /7f8NjiBHp/xnhZ1ouMizOBIb4rHjn0HwitOlJApCLSQDj0TuD7qnP4chdwi0y7ItIKP
         4W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781903623; x=1782508423;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnxWivuqEQZ8dcpSoejNyWh6Ys/zhGqPoxY2tVIHTS8=;
        b=FBJW1w5muj2w2fjzlYTBTy6ZYdwm1PFfGjPbiagZKYb/eov6knvIw4wN75hp4gXLrW
         IAYx+5wFT4WrazF4mfw++Oc72hsHyfThA/Q8MXOMAKZ6O9FIQ+ZZvgNC7eqfFGDxjqsE
         JjmEes6gskAShuYz23wXZAE51FMDsN5SpI+3xGoktiov/c/fKqfdMvJlAY3uc38fYXTJ
         TAWcRYE1bEAKcBPPA9DnN1+1KmwJwYRucf+7L+OKMcvlzgnH4msghWQ4C3phw5qwBZqF
         CSxs6RcUAJYnBso8Fq9J417iC0u0Vygk5GgA5I+ZezzgjlQNbv/3E+Lj5/IaK4PLCVm7
         zIig==
X-Forwarded-Encrypted: i=1; AFNElJ9gMo5uv+aqDitCefxdXrkVLbmMjC47FmTJNtRZgsqwJd0fPeujHWgXH6f/1nlkSsfxHu+aaFFY/W7snExJ5X0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+JrviY4THr1M6++hDCQ5XXK0NHjbKWqO2O3NIc0KCCM8XSQI
	XBYa1DEFEWzdG9+nM9tgim+FtptWA3Uf2tU9r8iWZJnO7tbgRAajCuok
X-Gm-Gg: AfdE7cnaHZwMN16Jozp1Qgaa6/CD3NhX0MHKIM2CAjj0/0HuAvnm+mWmJ0T0z1kIziL
	uGliuAiCSzhe54K5WfF3U1wKDQb73hUoC6x5g3hHLFDCknGlPzjB4jWfKCz7LHQcZZSBqc4uKsn
	Jlt5z9wqncOB2EGZyL1+6QFEF0FYfbPzWJ3+/E+A0dhqtqKRgnhQvb30Vc5RrfnmDBCYZBplJVY
	3myvajCg2IWxKSYD2sdj84J0rrjlFKrXzfPSKI+/6S1DwgX9AO3SYud4ZtfRHGT7ecYx+RZ+1JC
	JloT19gEnGIeT54K+veuCo7CkdXDTk/WPSKjlaz6n5Zn4wM9F7944qIZFSO3TE4aXl+a15kWiLi
	7rsSW6Kl/GGCc+UeQ4nLqFmZgj8afjycNPljH46D+WEM5zqFeBmVkGL/5aI1DjBGvohCxNK9LAM
	sQbSRHyjC4h2Hv8u2WecaIJZzpABLxamxtblrO9P+75g==
X-Received: by 2002:a05:6a00:2e93:b0:842:5f67:eada with SMTP id d2e1a72fcca58-84550113eb5mr4506253b3a.5.1781903623224;
        Fri, 19 Jun 2026 14:13:43 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564eca7fcsm142782b3a.52.2026.06.19.14.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 14:13:42 -0700 (PDT)
Message-ID: <9323b0acc22de75ead4732db464672443eb141ff.camel@gmail.com>
Subject: Re: [PATCH bpf v2 1/8] libbpf: ringbuf: Honor zero consume bounds
From: Eduard Zingerman <eddyz87@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Kumar
 Kartikeya Dwivedi	 <memxor@gmail.com>, Song Liu <song@kernel.org>, Yonghong
 Song	 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>, Xu Kuohai	
 <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet
 <void@manifault.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>, Zvi
 Effron	 <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>, Emil
 Tsalapatis	 <emil@etsalapatis.com>
Date: Fri, 19 Jun 2026 14:13:39 -0700
In-Reply-To: <20260618-bpf-ringbuf-fixes-v2-1-33fde039ddf3@kernel.org>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org>
	 <20260618-bpf-ringbuf-fixes-v2-1-33fde039ddf3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-18 at 20:26 -0400, Tamir Duberstein wrote:
> ringbuf_process_ring() checks the record bound only after advancing the
> consumer position and invoking the callback. A zero bound therefore
> consumes the first available record.
>=20
> Return before reading the ring positions when the bound is zero so
> ring_buffer__consume_n() and ring__consume_n() leave all records queued.
>=20
> Fixes: 4d22ea94ea33 ("libbpf: Add ring__consume_n / ring_buffer__consume_=
n")
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> diff --git a/tools/testing/selftests/bpf/prog_tests/ringbuf.c b/tools/tes=
ting/selftests/bpf/prog_tests/ringbuf.c
> index 64520684d2cb..4f0558f14847 100644
> --- a/tools/testing/selftests/bpf/prog_tests/ringbuf.c
> +++ b/tools/testing/selftests/bpf/prog_tests/ringbuf.c
> @@ -404,6 +404,7 @@ static int process_n_sample(void *ctx, void *data, si=
ze_t len)
>  static void ringbuf_n_subtest(void)
>  {
>  	struct test_ringbuf_n_lskel *skel_n;
> +	struct ring *ring;
>  	int err, i;
> =20
>  	skel_n =3D test_ringbuf_n_lskel__open();
> @@ -431,6 +432,18 @@ static void ringbuf_n_subtest(void)
>  	for (i =3D 0; i < N_TOT_SAMPLES; i++)
>  		syscall(__NR_getpgid);
> =20
> +	ring =3D ring_buffer__ring(ringbuf, 0);
> +	if (!ASSERT_OK_PTR(ring, "ring_buffer__ring"))
> +		goto cleanup_ringbuf;
> +
> +	err =3D ring_buffer__consume_n(ringbuf, 0);
> +	if (!ASSERT_EQ(err, 0, "ringbuf_consume_zero"))
> +		goto cleanup_ringbuf;
> +
> +	err =3D ring__consume_n(ring, 0);
> +	if (!ASSERT_EQ(err, 0, "ring_consume_zero"))
> +		goto cleanup_ringbuf;
> +
>  	/* Consume all samples from the ring buffer in batches of N_SAMPLES */
>  	for (i =3D 0; i < N_TOT_SAMPLES; i +=3D err) {
>  		err =3D ring_buffer__consume_n(ringbuf, N_SAMPLES);

Could you please pack the tests as a separate commit (or commits)
at the end of the series?
