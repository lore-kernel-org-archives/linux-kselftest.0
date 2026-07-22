Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B0466B18
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738497; cv=none; b=kvcONDqoFXl2YF6tuO1j8sY8X4YGodowSuXh/aXAYr6kn+SGg0UkBN4wqn7ygZyTfhCBcDjKSiSD0y/wFkclJ42u9WAJe/Wga8mBiA2wEJeSNlnOr9PZuvIgr/0Ua3HV8fiLHnm/A5DUy5LO2oQaAuFfrFPhWOGg6QpAhNLKWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738497; c=relaxed/simple;
	bh=RXqcfcZSbNb3rB21Ph12lQCkkQdPMp95EfoTarPxUao=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mbuFsqCpxhryZHAUHQ3Xtd9ACSnw2/+JdLOZ/hMqDP6RVwGUn4s4X2vT4CPyLRf6HT1YPNjimYNI36toALmaNHoBvFJDExqTlZbcltgDVS5RALM4ElC1ENoasc6zybxfRK2iXJr0tpWuQICukXM+/J2dqp/DE/jEJ+zJ9XaKTM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=WzLFxW5f; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="WzLFxW5f"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e7109321dso2657508a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784738485; x=1785343285; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rk7HaColAzxmgyqV5k+/tQbJI9Q9Gz2mbZ9N8yXhieA=;
        b=WzLFxW5fNRJwW96xE+FfglPtzF6bBN4ZJsUodDhGy8X72MW4CnLlUdSipf/kxMVs0N
         dITUpOLCbUMKYBnXq6tsl7WPysUcmMbhpvaFl56Ij/+K+SeiJy38emz0GIgje+JPHMl2
         DfgmWb+k210ye+riXiichKWQCkWO/qTkdxaHxu4PTECAN1EIKiRgD8auGMn+0foiokQj
         THOGuifVYE//CIXjhuizT6J9B19r1hhCCpD1K1DYU6bJHM2sjrFq5QiiZHm//eLJoLQz
         io9xuWXdFEYAVKhazENQemdHXIUYFCkO3NzKiicQvpiIVN7TN5MwF+9otsClbsHJVUr0
         bI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738485; x=1785343285;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk7HaColAzxmgyqV5k+/tQbJI9Q9Gz2mbZ9N8yXhieA=;
        b=ohlFjUrhmRvvkoeWaUMUdBYurWfUeItl3qDWfxmFG6RYSjnUuqCQU+Rxr7F/jcsgYn
         3O2Kl4wXGUnn1YLY3UBgKf4fg9pBoeRRoBJfukSxcidq98ljBS9Q2ILW8arLvJ85QvlB
         kKh/L+jSI0x9SE9dNOc3sisihz3t4dolzmvf22gsA8SVdDtWO6+c9KsXD+Rx39TZxxmY
         vxYwFfc0Mb9h5S1uIL0j6QAQRjOPTYIB3XGMDXyRW0H5tiJCoAqZqzBs3IA3vZmgs9Ki
         FWhdGWlspUEyhXAXeCoqiMM3H9YV2pQX+n3h4DPQQ0cdTDrld1laMCVlDZ/+1o7nN3Y6
         7DQw==
X-Forwarded-Encrypted: i=1; AHgh+RoNkgzdLiHc6zz2OxygDp8widv3uI4DZH9f7FwbIg1zik4MfsKr+IfqVC1HnNBWq+UazyYitzbqpinQ4iJ0L6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOch7rPwpSyKgx+qgH2djzOOQUXl77u4QijZwFhKlGOWpu20jU
	IpjWeOvXGUz7/dCZR460z3SG2Du4x6PEuw2lIF8XWdSZWb15eUu5K/Qs5Sp9/F22cbc=
X-Gm-Gg: AR+sD11JFI48OoXEE53qYcl9gAQKGL+RpxnGaLHj/ut3mi7NiU+W5WfKzW9GuheQjQw
	S+DVvZdoIiQr/VYOheV/gJC2uzrWf5eFjMdiJ4ZSWOSLHXcK5oJwMoakhwzppZJzqJ3vEjkAAcQ
	zwU3pTUlQ06LCtdwunZD62myl7uAIi0dmMvGPCtiMMnZpYiuMA/32SdMQIhoxsu2wUPGDPK5gVi
	JenQj6ac8jW2jb70YRAijfHODPo3NJlR9QgmyZKYua8flxygArzeU2j8fdU7IvaGf/Df57mGWYb
	8EQ7vuW3HEZE1vi2CtjHox2lILgWH/bLkYXntrY8FPl7uepoS1M0nOm6JFF1md0e0JmRgW2cK7G
	AogdL2oFdvlj9zlb12IaphrUgySzzp7xr5A8i7k+nwU65zmRRpf/c6WUVYZfMMFssinJQIuEPEV
	8T53q55tIW7f806TUBEfmTiawFav7kFAE=
X-Received: by 2002:a17:90b:2f4b:b0:37f:9cdf:f03e with SMTP id 98e67ed59e1d1-38e4b540acbmr23711630a91.33.1784738485186;
        Wed, 22 Jul 2026 09:41:25 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92091875sm3559948a91.7.2026.07.22.09.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 12:41:23 -0400
Message-Id: <DK58ZON5P6RO.2LTH6C3PKW2VJ@etsalapatis.com>
Cc: "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Report the real error from
 libarena parallel workers
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260722064713.357277-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260722064713.357277-1-jiayuan.chen@linux.dev>

On Wed Jul 22, 2026 at 2:47 AM EDT, Jiayuan Chen wrote:
> Several CI runs failed in the libarena parallel tests with -4 (-EINTR) [1=
],
> which says nothing about what actually went wrong.
>
> Two workers can fail like this:
>
>   worker 1: gives up, e.g. the rendezvous times out, sets test_abort and
>             returns its own error (-ETIMEDOUT)
>   worker 2: sees test_abort and returns -EINTR
>
> -EINTR only means "someone else already gave up", so it carries no
> information. Which of the two gets reported depends on the order
> pthread_join() collects them, because
>
> 	err =3D err ?: (long)thread_ret;
>
> keeps the first non-zero value and drops the rest. When the -EINTR worker
> comes first, the error describing the actual failure is lost.
>
> Let any other error win over -EINTR, and log each worker that returned an
> error.
>
> It is still unclear whether the timeouts come from CI load or from a
> problem in the test itself. Report the error accurately first, so the nex=
t
> failure can be diagnosed.
>
> [1]:
> https://github.com/kernel-patches/bpf/actions/runs/29867905253/job/887644=
63566
> https://github.com/kernel-patches/bpf/actions/runs/29878191901/job/887948=
45824

Overall change makes sense, a couple things.

I'll also look into the error itself.

>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  .../testing/selftests/bpf/prog_tests/libarena.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/libarena.c b/tools/te=
sting/selftests/bpf/prog_tests/libarena.c
> index df7e4b8dc394..65743920ff69 100644
> --- a/tools/testing/selftests/bpf/prog_tests/libarena.c
> +++ b/tools/testing/selftests/bpf/prog_tests/libarena.c
> @@ -112,13 +112,28 @@ static int run_libarena_parallel_test_workers(struc=
t libarena *skel,
> =20
> =20
>  	for (i =3D 0; i < nthreads; i++) {
> +		int worker_err;
> +

Let's hoist this definition up to the top of the function.

>  		ret =3D pthread_join(threads[i], &thread_ret);
>  		if (!ASSERT_OK(ret, "pthread_join")) {
>  			err =3D err ?: ret;
>  			continue;
>  		}
> =20
> -		err =3D err ?: (long)thread_ret;
> +		worker_err =3D (long)thread_ret;
> +		if (!worker_err)
> +			continue;
> +
If we are ignoring -EINTR errors from workers then let's skip the
printing for them altogether, otherwise below we keep printing the
"main" error for every interrupted thread.

> +		/*
> +		 * A worker that bails out because another one already gave up
> +		 * reports -EINTR. That is collateral damage, so let any other
> +		 * error win: it tells us what actually went wrong.

Capitalize "it"

> +		 */
> +		if (!err || err =3D=3D -EINTR)
> +			err =3D worker_err;
> +
> +		fprintf(stdout, "%.*s__%d returned %d\n", (int)prefixlen, name,
> +			i, worker_err);

>  	}
> =20
>  	free(threads);

