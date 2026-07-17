Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517F3B19AB
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 23:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331275; cv=none; b=m2kH53kzgS1zrm6tcAusgYkdRN5DHd8OEfil88qDgWTeEcKDaFbloOKGtWSfW2x8v754vREIOaYHkQMzzCU0ZrHDkMsxNitIafplwxUsx0ovo5CXvHkNhVlxegQzxl4ByJjRsR2bsHx4WPPJFbxF5jBvF5alC77aSO3bnlbLVRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331275; c=relaxed/simple;
	bh=4C0MX4uyArPDgowGAursiF8mIS66ZG00cte/JsWr4ns=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ODLE2wtzZqPp33FZQfHQ8+GrOQmaGPWqpKZFsf5+qVqoJXU4WJoBO+25Gpo0RX00cWTjZ9mguXrZvSYLA6iKEh3NXzuffqWRqWctG5XN0PaijXKRMr4HjdwZ920stikGHeln3HYGKhpp7sB5BbpAuF3lGZrg8DaTTu5+s+hMT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=OVhzkZOU; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="OVhzkZOU"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca12086c06eso6900573a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784331269; x=1784936069; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ua8qj50WZAgVGQ8X0eQQWXVA4kcbHFr66dYhd/GZ0rg=;
        b=OVhzkZOUlkyMc4wriF3/fJMOXmLXNHh54FuAP8c5smps2u44sSBBqdqje/qVNUqi04
         KtvpN/K1s6+3i1c7CDkLixBwiwFvAiIALVqedPZ+5PGMy9bSaDlCVF07J/G0hp5MUtx5
         b8A3UpHofWZirSCLlzZSgYI3d99cx2diFw4VvZ4JbLQoOxBemdETZNUVIXIbZW0VFSwG
         QCm8XQC04Kw3Rnc3Tc8F15CaH12nqI2NiASOc3251tMojO2xc0GgYmxzTwtrXbEzGc4J
         Ek2Udnw5c6q4nJh82Dhf2MTuZw8c09HdP+zK75875L8I0bbD0V+S69Da7y/l04wofFwd
         /u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331269; x=1784936069;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ua8qj50WZAgVGQ8X0eQQWXVA4kcbHFr66dYhd/GZ0rg=;
        b=S2I++03Yi5VgWf66744jLsgf0ll9cR/AVurc5bC0FiM75K178H5c4V1ZXpc7oOfZa/
         hvvRDkw4Jw9/m3OZY3mys0cnf8wnabzWbfelMU4cW4TeoCoo9JV7i46aD43XiycX07I+
         PWCVzLAN3f2yblwjBwOkwPUh8H+poAotAbwspKmndO0czaCbSuVahu5OkXp9AKtQnT0i
         JQSwVXtIOm5/OKZBhNM/ZOBiq1r1Qjxm9kz3ffs6aF67PNSQPzCMrD8M/ks81pv6PlDT
         N24qpFvJNM61YPXLbTXI+TBLf3KHC4qQ/vxf5wc6kY6ieOElHEk99Fd0vtBineCFD0mX
         5wGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdwGNGWT1Scmdsa954DaR7hVZDMCoLLvVYvf3Mw2SHWNo8/ae+INQ/3VPHU0WOAM5YQObGtZnxkalUtQilDGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWXr+UUGv5ktqkKprwXJeGT9sztODUoVgpKAlR78CLn86mOW5
	QGY9d09fypSwWy2E0eh8r2fqLEHnlO9mQgQBl0HW3y63IlYn63BFMS/4Kdkr2Nez9x4=
X-Gm-Gg: AfdE7cl2yCX0GbcmyyfrA9mCgobCnjeSWET1FHe+XcXzkKh6SUUSbFWdflG/WUHoWoy
	vIqNEi6/XDbqr11OhxYEBUy0nOVfmT0bZYuB+obriU3cy3gRYSPd2addvOt8aHMc0Z4DMaamju2
	q3G44NwqgL08OOXYcgzFiLpAPRN217YsE6hPCl/WlTnB8St2srv6XFEG4w+67LPDKqSm9K4Xswu
	DO2m0QWbtVDI8q6Douek2Ba9szqsWvZhKAMLBMv7XD/c3OfyU2t4qK0fpD2gY2+plG4hdyAerC7
	sb1bm+JxBc8eahaNMO7vFdpxcC+C3SKdYUmgqwQB9kS9rtsxvQPF9MEKvGZKGEL9LIN2PZyTQRp
	FZFmtyG6OPbp7aFeJLw2TiqPl38qAD492sr+/fapQ2qEzN/hGo7CXmNHLDGI=
X-Received: by 2002:a05:6a21:7111:b0:3c3:aabb:dba3 with SMTP id adf61e73a8af0-3c3adb17f56mr5275028637.76.1784331269165;
        Fri, 17 Jul 2026 16:34:29 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb69bsm7973699c88.11.2026.07.17.16.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 16:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 19:34:26 -0400
Message-Id: <DK18N7NTNCP8.1J65M00LCPNM9@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Woojin Ji" <random6.xyz@gmail.com>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Saket Kumar Bhaskar" <skb99@linux.ibm.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 3/4] selftests/bpf: Run arena tests serially
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260717114117.350851-1-jiayuan.chen@linux.dev>
 <20260717114117.350851-4-jiayuan.chen@linux.dev>
In-Reply-To: <20260717114117.350851-4-jiayuan.chen@linux.dev>

On Fri Jul 17, 2026 at 7:37 AM EDT, Jiayuan Chen wrote:
> Every arena reserves a 4GB kernel vmalloc region at creation, and on a
> KASAN build that eagerly populates ~512MB of shadow memory per arena. Whe=
n
> several arena tests run in parallel their shadow adds up, exhausts the
> memory of a small CI VM and trips the OOM killer during map creation.
>
> Make the dedicated arena tests (arena_* and libarena*) serial so they no
> longer pile up in the parallel phase. That alone brings the peak number o=
f
> live arenas back within the CI memory budget.
>
> A few other tests such as verifier_arena*, stream and compute_live_regist=
ers
> create an arena too, but they run inside shared RUN_TESTS()/RUN() suites,=
 so
> turning them serial would drag many unrelated subtests along with them.
> Leave those as-is.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/prog_tests/arena_atomics.c      | 2 +-
>  tools/testing/selftests/bpf/prog_tests/arena_direct_value.c | 2 +-
>  tools/testing/selftests/bpf/prog_tests/arena_htab.c         | 2 +-
>  tools/testing/selftests/bpf/prog_tests/arena_list.c         | 2 +-
>  tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c    | 2 +-
>  tools/testing/selftests/bpf/prog_tests/arena_strsearch.c    | 2 +-
>  tools/testing/selftests/bpf/prog_tests/libarena.c           | 2 +-
>  tools/testing/selftests/bpf/prog_tests/libarena_asan.c      | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_atomics.c b/too=
ls/testing/selftests/bpf/prog_tests/arena_atomics.c
> index d98577a6babc..1ad5d03d07ad 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
> @@ -222,7 +222,7 @@ static void test_store_release(struct arena_atomics *=
skel)
>  		  "store_release64_result");
>  }
> =20
> -void test_arena_atomics(void)
> +void serial_test_arena_atomics(void)
>  {
>  	struct arena_atomics *skel;
>  	int err;
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c =
b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
> index 4b4adb3f4b71..01fcf4965ea4 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
> @@ -66,7 +66,7 @@ static void test_arena_direct_value_one_past_end(void)
>  	close(map_fd);
>  }
> =20
> -void test_arena_direct_value(void)
> +void serial_test_arena_direct_value(void)
>  {
>  	if (test__start_subtest("one_past_end"))
>  		test_arena_direct_value_one_past_end();
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_htab.c b/tools/=
testing/selftests/bpf/prog_tests/arena_htab.c
> index d69fd2465f53..91ccf0402980 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_htab.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_htab.c
> @@ -81,7 +81,7 @@ static void test_arena_htab_asm(void)
>  	arena_htab_asm__destroy(skel);
>  }
> =20
> -void test_arena_htab(void)
> +void serial_test_arena_htab(void)
>  {
>  	if (test__start_subtest("arena_htab_llvm"))
>  		test_arena_htab_llvm();
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_list.c b/tools/=
testing/selftests/bpf/prog_tests/arena_list.c
> index 4f2866a615ce..2648e06f53d0 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_list.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_list.c
> @@ -68,7 +68,7 @@ static void test_arena_list_add_del(int cnt, bool nonsl=
eepable)
>  	arena_list__destroy(skel);
>  }
> =20
> -void test_arena_list(void)
> +void serial_test_arena_list(void)
>  {
>  	if (test__start_subtest("arena_list_1"))
>  		test_arena_list_add_del(1, false);
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c b/t=
ools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
> index acb9d53b5973..545b05d7a0aa 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
> @@ -101,7 +101,7 @@ static void test_arena_spin_lock_size(int size)
>  	return;
>  }
> =20
> -void test_arena_spin_lock(void)
> +void serial_test_arena_spin_lock(void)
>  {
>  	repeat =3D 1000;
>  	if (test__start_subtest("arena_spin_lock_1"))
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_strsearch.c b/t=
ools/testing/selftests/bpf/prog_tests/arena_strsearch.c
> index f81a0c066505..0c1c6cbfa0f1 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_strsearch.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_strsearch.c
> @@ -23,7 +23,7 @@ static void test_arena_str(void)
>  	arena_strsearch__destroy(skel);
>  }
> =20
> -void test_arena_strsearch(void)
> +void serial_test_arena_strsearch(void)
>  {
>  	if (test__start_subtest("arena_strsearch"))
>  		test_arena_str();
> diff --git a/tools/testing/selftests/bpf/prog_tests/libarena.c b/tools/te=
sting/selftests/bpf/prog_tests/libarena.c
> index ba5a5a50f7c0..df7e4b8dc394 100644
> --- a/tools/testing/selftests/bpf/prog_tests/libarena.c
> +++ b/tools/testing/selftests/bpf/prog_tests/libarena.c
> @@ -202,7 +202,7 @@ static void run_libarena_parallel_test(struct libaren=
a *skel, struct bpf_program
>  	run_libarena_parallel_fini(skel, name, prefixlen);
>  }
> =20
> -void test_libarena(void)
> +void serial_test_libarena(void)
>  {
>  	struct arena_alloc_reserve_args args;
>  	struct libarena *skel;
> diff --git a/tools/testing/selftests/bpf/prog_tests/libarena_asan.c b/too=
ls/testing/selftests/bpf/prog_tests/libarena_asan.c
> index f897405f701d..9c31b17dbf39 100644
> --- a/tools/testing/selftests/bpf/prog_tests/libarena_asan.c
> +++ b/tools/testing/selftests/bpf/prog_tests/libarena_asan.c
> @@ -85,7 +85,7 @@ static void run_test(void)
>   * Run the test depending on whether LLVM can compile arena ASAN
>   * programs.
>   */
> -void test_libarena_asan(void)
> +void serial_test_libarena_asan(void)
>  {
>  #ifdef HAS_BPF_ARENA_ASAN
>  	run_test();

