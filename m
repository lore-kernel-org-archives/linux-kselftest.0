Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE638F22B
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445780; cv=none; b=qcfJ76M33fkt99FXldqJxgzkpCKyTi3Vy7sv5rtJ9cZmniIGGm0tswx7O0oIwwbAJi9Yxy+61qPeQoiestIg+KIR7wo6NhotSwVHUGyLAvftMhjp5Z52cNp92djnyHnpMwCoJYGzuVwVFnCotg2U0Kp/6uLDtiBSmPAK2a1d8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445780; c=relaxed/simple;
	bh=FmP+8/STbZPXzEarN9WMRFo6PtmMjHYmrYB7jF0qsTE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQdBb9KNfIQAu7w9oE4auWb0eVdVKt0erm4/w+QcIDJHobRstY89S+onf1eDQUMpeRF2UukmepcoXPMpS9tjU0b7MgMouGkPQbtY6aFfMJWC/1MbrmQaJQNtlnSjVXxhkq3Uq/3oBWVko7a8ZcWZasDo4/sIWZ2Y8WWoeSuDCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWm1PeE7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWm1PeE7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso438816f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772445777; x=1773050577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQjsYPyYtJcuqfg3UYRQSbPqvPqP/d/sBzajfqaJ+30=;
        b=OWm1PeE7Gh/mRGrMctu9/Yj2rcoLNMDvUgucZ0BJKJkcGPwQNiQuEDNgs6RdkqqXrC
         zrwfccNHc23v9vsGiFTlBIG9coQANam1QUiNvoSupPWJAkPg75LrzybP5TmGCOCPfILm
         DNELJKR8N4rjumEbcarPG8tzA5rGGiLgdA9H5OjRghh5pVHE3MapzCH8+6YpajZYmrMS
         l7VxGuf/I2lpQEx7vfsvAVyCsDE9ldjTfvyRnFqubm6/ZC6qcll9wlKjhC39Yz0cMXy7
         EPpEd7UdPLDY3iTZjiBNe4I+t09ROVlGJAp14GN2MJQqYg2wG+Xl1y3tqr9lK0pkqEF9
         b7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445777; x=1773050577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQjsYPyYtJcuqfg3UYRQSbPqvPqP/d/sBzajfqaJ+30=;
        b=JexcjOtKqQVOu8i7qLmiDE9vR/3jqDIuPhCCgSQEIjH3Q9I2jjvfjhw5BW/wVzchU3
         e9X+ersaMqqUiY1SSiJRGLoqNByvtNvcgwWv3rLvvVaNwOq6/2X3F5vzn1JiC4/YY+LW
         4n+JUnfcVg4Xw0VhgMQc8mRTydZ4iSCoAGWB17cI6lfJapEnrmJ1iKUQgaMaqv/oTXru
         cAqRokCxgfze3l+dYKkKOhhrY7pjzQX1GKcNMJnb4DaPd+U04jc64hV/WY/pEN3Nfeie
         i8usMdCNJrcP6wIvI+fJd1Eu9wfIU3t72ajCBoHsUaX6j35vTlM+JSEUlxVQJnzI1dBa
         0fOg==
X-Forwarded-Encrypted: i=1; AJvYcCVVUWo78EVlccnCAk1Sn4frwmnIt88OB2lWYkz2+Au2M9kiSEbNfBzBjzjhK/SjYWT9QQ9iTzNvT2fkQYnDdtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2XYGZPfRzGflNWj9CqEyrfYuhnJn4loN2fGBuBbo7BwGs3IyQ
	snoBHKN1MNtHH1byBNvXE9Tnid50vl5+UfWD98vzQBueNlxY7Y5Ep9x8
X-Gm-Gg: ATEYQzx0BtoFpVT/hMg4bI7hrI1Sc2Z5XG9lH8+/JoAL+QmjEB7fyAqY5OnuxKJq082
	dSazjOIzp5p1AOWdWor+aDB5Wgxa74sR/b9n7YbvXz1Ts/YHLl7qfWFs3cvWFpjNWACThbCNvPT
	nAXkeVREfXU7aE7cA8v9Hy/1bpyVUh5HSFgigD105yHdubAf0e6ygZhSeuatUboB7o6+OLImeDv
	EiRisySobqVieDtAgiFmbKNxWGXrvUr1b9zSCRIcstsqE2L/FWqaK4T5/71DveorpRGb5SYma8A
	0aDfib+3nIeI+Us+9QcdhDqtepoPPizh/lz9vYUwm00Ji+oOOgjGMnw8C9/IXR0NW2I2apkSnq0
	9habXeb2ez5MSk34Ubvh8NEAgMaPYiURefncROjcXp413jNy1KG4tl4eYSFuQvOeW70hccOyV3+
	CgNZWf0NU=
X-Received: by 2002:a05:6000:250d:b0:439:ae82:6ab2 with SMTP id ffacd0b85a97d-439ae826be5mr10588374f8f.57.1772445777056;
        Mon, 02 Mar 2026 02:02:57 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ac9f3e5bsm17099860f8f.37.2026.03.02.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:02:56 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 2 Mar 2026 11:02:54 +0100
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/bpf: bpf_cookie: make perf_event
 subtest trigger reliably
Message-ID: <aaVgTiHlc4rXvzKJ@krava>
References: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
 <20260228074555.122950-3-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228074555.122950-3-sun.jian.kdev@gmail.com>

On Sat, Feb 28, 2026 at 03:45:55PM +0800, Sun Jian wrote:
> The perf_event subtest relies on SW_CPU_CLOCK sampling to trigger the BPF
> program, but the current CPU burn loop can be too short on slower systems
> and may fail to generate any overflow sample. This leaves pe_res unchanged
> and makes the test flaky.
> 
> Make burn_cpu() take a loop count and use a longer burn only for the
> perf_event subtest. Also scope perf_event_open() to the current task to
> avoid wasting samples on unrelated activity.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> 
> ---
> Changes in v2:
> 
> Move the perf_event_open() argument change here from patch 1/2.
> 
> v1: <https://lore.kernel.org/lkml/20260227164037.84110-1-sun.jian.kdev@gmail.com/>
> ---
>  .../selftests/bpf/prog_tests/bpf_cookie.c     | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> index b7643a5bf7ad..35adc3f6d443 100644
> --- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> +++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> @@ -6,6 +6,7 @@
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
>  #include <unistd.h>
> +#include <linux/compiler.h>
>  #include <test_progs.h>
>  #include <network_helpers.h>
>  #include <bpf/btf.h>
> @@ -431,11 +432,12 @@ static void tp_subtest(struct test_bpf_cookie *skel)
>  	bpf_link__destroy(link3);
>  }
>  
> -static void burn_cpu(void)
> +static void burn_cpu(long loops)

nit, there's another burn_cpu in prog_tests/perf_link.c,
we could add it to trace_helpers.c or test_progs.c 

>  {
> -	volatile int j = 0;
> +	long j = 0;
>  	cpu_set_t cpu_set;
> -	int i, err;
> +	long i;
> +	int err;
>  
>  	/* generate some branches on cpu 0 */
>  	CPU_ZERO(&cpu_set);
> @@ -443,9 +445,10 @@ static void burn_cpu(void)
>  	err = pthread_setaffinity_np(pthread_self(), sizeof(cpu_set), &cpu_set);
>  	ASSERT_OK(err, "set_thread_affinity");
>  
> -	/* spin the loop for a while (random high number) */
> -	for (i = 0; i < 1000000; ++i)
> +	for (i = 0; i < loops; ++i) {
>  		++j;
> +		barrier();

what's the rationale for barrier call in here,
together with the volatile change above?

thanks,
jirka


> +	}
>  }
>  
>  static void pe_subtest(struct test_bpf_cookie *skel)
> @@ -461,7 +464,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
>  	attr.type = PERF_TYPE_SOFTWARE;
>  	attr.config = PERF_COUNT_SW_CPU_CLOCK;
>  	attr.sample_period = 100000;
> -	pfd = syscall(__NR_perf_event_open, &attr, -1, 0, -1, PERF_FLAG_FD_CLOEXEC);
> +	pfd = syscall(__NR_perf_event_open, &attr, 0, -1, -1, PERF_FLAG_FD_CLOEXEC);
>  	if (!ASSERT_GE(pfd, 0, "perf_fd"))
>  		goto cleanup;
>  
> @@ -470,7 +473,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
>  	if (!ASSERT_OK_PTR(link, "link1"))
>  		goto cleanup;
>  
> -	burn_cpu(); /* trigger BPF prog */
> +	burn_cpu(100000000L); /* trigger BPF prog */
>  
>  	ASSERT_EQ(skel->bss->pe_res, 0x100000, "pe_res1");
>  
> @@ -489,7 +492,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
>  	if (!ASSERT_OK_PTR(link, "link2"))
>  		goto cleanup;
>  
> -	burn_cpu(); /* trigger BPF prog */
> +	burn_cpu(100000000L); /* trigger BPF prog */
>  
>  	ASSERT_EQ(skel->bss->pe_res, 0x200000, "pe_res2");
>  
> -- 
> 2.43.0
> 
> 
