Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15332C11E4
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940415; cv=none; b=RRDv5GmxUp3ITCw48jTdGZaLitj79v+Mt/d/FU/8rgDWAG6fkL1JPEXP9lSEwXyo3Md+xSqDW9dsIM+QnyPX5/qcjx4cYGnf+fvklsp1eE9SC+kjB99f58su8OvNO/IfyygV1i+Kgp5XjUnxVnneWOrYxZnkPROwAwYrItBbLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940415; c=relaxed/simple;
	bh=ixq5iPSr6lESeemFDQZAkXkMKmcyRqci45TX352zPc0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bPQcxFRNbzYZJsciRG1o1n5DeUjv8YhhsipOJclKkj1NwJlo+66gW4BsyH30PT+ICljtzzO/betS5YaULz2AK5N4qshw38/99gheW8gnJpOs1ZCsXlns3nY/el+0MPNQK04rdKdcUYSgR7B86DOlQdfSuvcOHCv/3YL5EDbuWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=ziCf3MT1; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="ziCf3MT1"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c2a449c57so4825251cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782940413; x=1783545213; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjeDKyLKBZcUrNcouKdVLuX/5CVGzH0NAqcX61nIrwU=;
        b=ziCf3MT1mC6t3eZjzKPwBOQhxxXNVyCAXHfuW7yuekhEovINnoB67ExFfaPgT0An2F
         n18q59b2weTI6L3JWBH0zmm/Ux9/t2uVpEfB5t8+uaIfpazYhZFEmU5GB+TxrGbjklsF
         6WksxwEAJKGe+yO5WCY2OpO+UxJ2srJnCB1iAN3Ih02yyZ3hi2hHw0F6O6/AvqIvCiYE
         J7N/g2dLwGM1uUsaTpWBIng3GqNOoi+/y1xptCo8SJ1WUL/+Dtl/SLTt0erAPChx8zm0
         oWc4k6Ri0pcjdRDbs0E7TrPm2XyoFYXkTZwu2+grBCrLDp02i4g+DzVb2SJYQW7fvC2W
         0Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782940413; x=1783545213;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjeDKyLKBZcUrNcouKdVLuX/5CVGzH0NAqcX61nIrwU=;
        b=HEaoOyCq02TZ59lXjN7/d72iis00Lku8LEBM6Q+zEt0690gdaEURHFT+1KoEjzzHG3
         7mQZhc7N+0DUZHCUgY/hohEvS2U6V6Z7K/+L+Gr3ZmQ3lkoTdCxwfu2ARX4o65h4xIua
         rlCuXXSC96OOS4LzRaqtybNGn0AbC+rRHrjfgdv0j9ZxnDd6X/VAGrq+i6DhG+4vr8yq
         SwKufQqsqvX+VxNpL1lJ/iyctAYtQ+hhe472YTNfi+CPaUJANzR/sfTkuwk/IbR7DSvb
         zvsBxeZgA0dwqSJRCm3zSadLPqUREWg09y4aCQXIP19Jc3LARKe7LjwHnsJdPFXbfUAc
         vAtg==
X-Forwarded-Encrypted: i=1; AFNElJ8rEgzoBrg5V7eSYT6qqIYlGk4c2ihfaM/bkflNxt4CTn3tKKjEwFzflFISEAR1ZKtQAwPyKMPbKznxPnPBWzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3iBG1ZD9poFcwDCRzo/VeKU/oyiRzlOyhIg9FShSKwlcqA8f7
	to5XBf04+f3pyebWu5gCrzI205R6of1oPQ2L+QRN2Gx+Glw7uurN0CCUc8vJ81Ov7pA=
X-Gm-Gg: AfdE7cm5qE5n0683PY7qZtMktn6Ot5gC2+t31vo1bIboOiJlOBX5hrsVTlE5vTAovKD
	qEAdWEz/MoJvbyUuVvcw2QBoXwfI+esewzwJpiw64lO3jS4TQtOj1eQgWKOOxZIZDMmyWhNvuv4
	OTnysUZtEVteLwJwFTSPgts4b0paVIyEOzQoqhNvUsDTLIA0aEEnJoP2LvLKikIAvxlyX6dACeL
	hNDEg/3naKUZ2qEDunAn0k/wtRuRTLfzsRtm/IsTiKz7JDveiqd5bnfIXZcjMYESpRtWGpJNG/p
	te2XSlhuf8acXKXB/E96klyMdvik1Z7dMjXk6qSqWGX5BIlwgMdqQ+OC65X+4nDfJv5dbyYscyi
	ayEDOv4K/0+LoFxyskfzZ4LVsTqZ6A12PC5o6r7OLyAdRdnGrbQjHBWFbMrzaczuBcK9CNmjo3g
	FbxBCqUbME8VY=
X-Received: by 2002:a05:622a:116:b0:516:e152:7a59 with SMTP id d75a77b69052e-51c26b14343mr45276931cf.42.1782940412547;
        Wed, 01 Jul 2026 14:13:32 -0700 (PDT)
Received: from localhost ([198.58.242.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e27d53fsm8562786d6.5.2026.07.01.14.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 14:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:13:31 -0400
Message-Id: <DJNJMLHHX9UQ.PEYCIU5HPCR2@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Puranjay Mohan" <puranjay@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Cover scalar arena frees
 below the base
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1782813442.git.chenyy23@mails.tsinghua.edu.cn>
 <e4226ac143315bb584dfedc79693ccf813ac56b0.1782813442.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <e4226ac143315bb584dfedc79693ccf813ac56b0.1782813442.git.chenyy23@mails.tsinghua.edu.cn>

On Tue Jun 30, 2026 at 6:12 AM EDT, Yiyang Chen wrote:
> Add a verifier_arena case that fills a two-page arena, calls
> bpf_arena_free_pages() with a scalar address one page below the arena
> base, and then verifies that another allocation is still rejected.
>
> Before the runtime guard, the invalid free can repopulate the free
> tree with an out-of-domain offset and the final allocation succeeds.
>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Nit/question below.

> ---
>  .../selftests/bpf/progs/verifier_arena.c      | 41 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/t=
esting/selftests/bpf/progs/verifier_arena.c
> index 62e282f4448aa..b4bd134646607 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_arena.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
> @@ -12,15 +12,17 @@
> =20
>  #define private(name) SEC(".bss." #name) __hidden __attribute__((aligned=
(8)))
> =20
> +#ifdef __TARGET_ARCH_arm64
> +#define ARENA_VM_START ((1ull << 32) | (~0u - __PAGE_SIZE * 2 + 1))
> +#else
> +#define ARENA_VM_START ((1ull << 44) | (~0u - __PAGE_SIZE * 2 + 1))
> +#endif
> +
>  struct {
>  	__uint(type, BPF_MAP_TYPE_ARENA);
>  	__uint(map_flags, BPF_F_MMAPABLE);
>  	__uint(max_entries, 2); /* arena of two pages close to 32-bit boundary*=
/
> -#ifdef __TARGET_ARCH_arm64
> -        __ulong(map_extra, (1ull << 32) | (~0u - __PAGE_SIZE * 2 + 1)); =
/* start of mmap() region */
> -#else
> -        __ulong(map_extra, (1ull << 44) | (~0u - __PAGE_SIZE * 2 + 1)); =
/* start of mmap() region */
> -#endif
> +	__ulong(map_extra, ARENA_VM_START); /* start of mmap() region */
>  } arena SEC(".maps");
> =20
>  SEC("socket")
> @@ -93,6 +95,35 @@ int basic_alloc1(void *ctx)
>  	return 0;
>  }
> =20
> +SEC("syscall")
> +__success __retval(0)
> +int free_scalar_below_arena(void *ctx)
> +{
> +	void __arena *page1, *page2, *page3;
> +	__u64 bad_addr =3D ARENA_VM_START - __PAGE_SIZE;
> +
> +	page1 =3D bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
> +	if (!page1)
> +		return 1;
> +
> +	page2 =3D bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
> +	if (!page2)
> +		return 2;
> +
> +	page3 =3D bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
> +	if (page3)
> +		return 3;
> +
> +	asm volatile("" : "+r"(bad_addr));

Why the asm volatile? We use it right underneath, what does this give
us.

> +	bpf_arena_free_pages(&arena, (void __arena *)bad_addr, 1);
> +
> +	page3 =3D bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
> +	if (page3)
> +		return 4;
> +
> +	return 0;
> +}
> +
>  SEC("socket")
>  __success __retval(0)
>  int basic_alloc2_nosleep(void *ctx)

