Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219436BCCA
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613939; cv=none; b=NnaFzUkcJl9ttBFZ6RTxXvRHkdCgx5fUaUxzZ+tyZkHqI2mS84FTn21ZLD+t4wMsVPUm+nNFZtU+iCxOV718vAxcHKbX5d8x4XMDMbuojZ5fuTjXlepEkl5SqSlJMu4xvUHBn8qgIDnN/aK+ZV663Cucb7JwdRLNSogEqQd2jhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613939; c=relaxed/simple;
	bh=/jtDXuVaP09piBBDCaXgni7AqFCbL7j8PD6ATS7yyXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEF7EJECZyU789t7pDZa51zBL4EsODNxgtNqoGnpEYyoJCBon4EtOGUF0F9foJLI+fnRruybDfl9B0Fppw0l9F5Lt+r6wciZ9LApnUjqhFo3ceL+H4Ovx6ltKGpSVX9luQyWpxlkwUS4AqHDdVCf412V1rLlGXFnT9YUQQhuI1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9uEVaG7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9uEVaG7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-823210d1d8eso2725266b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769613938; x=1770218738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRay3Vursv60IOvZlH+eNockW+N8+jbMH24O+Il/+jY=;
        b=j9uEVaG7kDhvsm8qp+xEFxCcySL9KloUU+VO1npuPmGcpvfgMOU/Pfd4UDTBiYUO/+
         jpW20X3cWGHeSO7WuZyTEKbQlZBFG8/tz/lSYy+qQTEZstL9SwLqsfmh1luYEJA72s1k
         lmw4GadIYku1kslcnDmpCxmOWMYHG4lhr+wNgpDv8PJnqpw2Nf2V/hB8O3JUJyPwaY+O
         nSh7QKTPyneubzYL7+qRS7Ndx2LKq8Wup3E/E3BmUJGKhjCjzPWpP2oKh1eWFUW75wFO
         xznaoYiCcpDGWHz9jusQJsTAx31Qt2AfNYqhxELvbFSjMGTKvNohAZoer/CPpzwzXXPF
         DtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613938; x=1770218738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRay3Vursv60IOvZlH+eNockW+N8+jbMH24O+Il/+jY=;
        b=KYyI/ePteSbzTAfY+L7dpJsAuIOx2ZIgDXX0oI4n06DW5Ev2gm+0ZDgkKncnUXOuWs
         +x3CnOHErDBNc7jmgEL6lQ/AzVyyzTbYaLPUxAglCWj2/wh5+tya8Tp4h9nW6UGwV2nl
         7/DaIm5Xsp33DfPnFcNkk+nbAbdhWFI83Q1mXFBhLNjSssoZpZfgRNzlvLFKOOS3LLwx
         Dey1dM4M3X6I4yCP4cE5BX0PwZqHtnzWB+eDh9SHH3DvoZUzal5/ka7Dd/Or08CjvIQ5
         qa6LhJ4Hw4M9zHMRLu/wFGZPZROPSy/PVdaYgyN8U5nBrvkxw/KxmreF8xk7a2xxrqY2
         jKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWND7eXb70NUs4vJ0ysxPnJKDXtwdbjf8xkXs/hBSXnwUvTHtdjYVmrGebykIqnV+eXr0WPF90xniftq38aPBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHGeEBQKz6u2dJD37b7HyYwWbSrJgZpHZrIynFwGDZ88eVMTel
	eS24GSQ2xVmdSH1TBCANGdC+OQY88/Bt99fDXvm1hNCVtvLGB26o6hFB
X-Gm-Gg: AZuq6aKAj3AWH6hyIqaSvEm3Jgd59Gh3lDUOZpzVBJZeNJ3TDidgvlq7NekO10+YMuo
	Cdp4Lddc3PhCG7ToHg4pdHE7iZsoTGIQ6H5IpItVSsSPVE8qoztDKZGHFehXO9PP5y4ghzToNZI
	e2MsKdBGv/LD6/qVPSsn9OYiHN2cUfW5kfT2/5UVHsgiE+maEAce2KtwThO5U7AuzhQbNaQRAAA
	uoXE8EZKnsJNAsBpnvXkajH/IsannharaxXy+fu1NZ+7W54UlA8Gfl15fWTvodFbuJo/sT1v0w6
	4WARC3pHKgDr77o90K44cWy45aY7YgwYBfY0ARjc7MvhD7IEoltGhiFrMpaNp0NWa2JrIKD5LWH
	kyC8iL4wBJB8OA73VWIW3eawCQ1dNyL+jOGVAj8LbYVuKcN3d1U2bBahmkQakZvaLCKt2cSjqTk
	03C7jmsF79n5ZoBbGnDCLU0cNP
X-Received: by 2002:a05:6a00:22c7:b0:81f:3d13:e070 with SMTP id d2e1a72fcca58-82369147791mr5966140b3a.12.1769613937562;
        Wed, 28 Jan 2026 07:25:37 -0800 (PST)
Received: from [172.20.10.5] ([117.20.154.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b58f38sm3121727b3a.24.2026.01.28.07.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 07:25:36 -0800 (PST)
Message-ID: <8dd73aac-3c98-4bde-966d-2251dc794073@gmail.com>
Date: Wed, 28 Jan 2026 23:25:27 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
References: <20260128150112.8873-1-leon.hwang@linux.dev>
 <20260128150112.8873-2-leon.hwang@linux.dev>
Content-Language: en-US
From: Leon Hwang <hffilwlqm@gmail.com>
In-Reply-To: <20260128150112.8873-2-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry about the subject.

It should be "bpf: Add bpf_jit_supports_fsession()".


On 2026/1/28 23:01, Leon Hwang wrote:
> fsession programs can currently be loaded on architectures that do not
> implement fsession support, which leads to runtime errors instead of a
> clean verifier rejection.
> 
> For example, running fsession selftests on arm64 before fsession support
> is added results in:
> 
> test_fsession_basic:PASS:fsession_test__open_and_load 0 nsec
> test_fsession_basic:PASS:fsession_attach 0 nsec
> check_result:FAIL:test_run_opts err unexpected error: -14 (errno 14)
> 
> Introduce bpf_arch_supports_fsession() to explicitly gate fsession usage
> based on architecture support. Architectures without fsession support
> will now fail program load with -EOPNOTSUPP, allowing selftests to skip
> cleanly instead of errors at runtime.
> 
> x86 declares fsession support, while the default implementation returns
> false.
> 
> Fixes: 2d419c44658f ("bpf: add fsession support")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  arch/x86/net/bpf_jit_comp.c                   |  5 +++
>  include/linux/filter.h                        |  1 +
>  kernel/bpf/core.c                             |  5 +++
>  kernel/bpf/verifier.c                         |  3 ++
>  .../selftests/bpf/prog_tests/fsession_test.c  | 32 ++++++++++++++-----
>  5 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 5a075e06cf45..070ba80e39d7 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>  {
>  	return true;
>  }
> +
> +bool bpf_jit_supports_fsession(void)
> +{
> +	return true;
> +}
> diff --git a/include/linux/filter.h b/include/linux/filter.h
> index fd54fed8f95f..4e1cb4f91f49 100644
> --- a/include/linux/filter.h
> +++ b/include/linux/filter.h
> @@ -1167,6 +1167,7 @@ bool bpf_jit_supports_arena(void);
>  bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena);
>  bool bpf_jit_supports_private_stack(void);
>  bool bpf_jit_supports_timed_may_goto(void);
> +bool bpf_jit_supports_fsession(void);
>  u64 bpf_arch_uaddress_limit(void);
>  void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie);
>  u64 arch_bpf_timed_may_goto(void);
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index e0b8a8a5aaa9..3b1eb632bf7c 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -3142,6 +3142,11 @@ bool __weak bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>  	return false;
>  }
>  
> +bool __weak bpf_jit_supports_fsession(void)
> +{
> +	return false;
> +}
> +
>  u64 __weak bpf_arch_uaddress_limit(void)
>  {
>  #if defined(CONFIG_64BIT) && defined(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE)
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index c2f2650db9fd..6f867ebf78d1 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -24872,6 +24872,9 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
>  	case BPF_TRACE_FENTRY:
>  	case BPF_TRACE_FEXIT:
>  	case BPF_TRACE_FSESSION:
> +		if (prog->expected_attach_type == BPF_TRACE_FSESSION &&
> +		    !bpf_jit_supports_fsession())
> +			return -EOPNOTSUPP;
>  		if (!btf_type_is_func(t)) {
>  			bpf_log(log, "attach_btf_id %u is not a function\n",
>  				btf_id);
> diff --git a/tools/testing/selftests/bpf/prog_tests/fsession_test.c b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
> index 0c4b428e1cee..a299aeb8cc2e 100644
> --- a/tools/testing/selftests/bpf/prog_tests/fsession_test.c
> +++ b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
> @@ -29,8 +29,16 @@ static void test_fsession_basic(void)
>  	struct fsession_test *skel = NULL;
>  	int err;
>  
> -	skel = fsession_test__open_and_load();
> -	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
> +	skel = fsession_test__open();
> +	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
> +		return;
> +
> +	err = fsession_test__load(skel);
> +	if (err == -EOPNOTSUPP) {
> +		test__skip();
> +		goto cleanup;
> +	}
> +	if (!ASSERT_OK(err, "fsession_test__load"))
>  		goto cleanup;
>  
>  	err = fsession_test__attach(skel);
> @@ -47,8 +55,16 @@ static void test_fsession_reattach(void)
>  	struct fsession_test *skel = NULL;
>  	int err;
>  
> -	skel = fsession_test__open_and_load();
> -	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
> +	skel = fsession_test__open();
> +	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
> +		return;
> +
> +	err = fsession_test__load(skel);
> +	if (err == -EOPNOTSUPP) {
> +		test__skip();
> +		goto cleanup;
> +	}
> +	if (!ASSERT_OK(err, "fsession_test__load"))
>  		goto cleanup;
>  
>  	/* first attach */
> @@ -94,6 +110,10 @@ static void test_fsession_cookie(void)
>  	bpf_program__set_autoload(skel->progs.test6, false);
>  
>  	err = fsession_test__load(skel);
> +	if (err == -EOPNOTSUPP) {
> +		test__skip();
> +		goto cleanup;
> +	}
>  	if (!ASSERT_OK(err, "fsession_test__load"))
>  		goto cleanup;
>  
> @@ -111,10 +131,6 @@ static void test_fsession_cookie(void)
>  
>  void test_fsession_test(void)
>  {
> -#if !defined(__x86_64__)
> -	test__skip();
> -	return;
> -#endif
>  	if (test__start_subtest("fsession_test"))
>  		test_fsession_basic();
>  	if (test__start_subtest("fsession_reattach"))

