Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DE4AA593
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149774; cv=none; b=pPKdtwpphthUGLCzNhBCPpdgBFAbvLr3mGHHdF6+PFj3YBBfPvp2nCc9Ktpu2gAuD9Djes0s73HGrfLnB0/T5obuUe7ckkXBAB3A9xsZXMbs06QVLCGLHM7WqlXDHjb15TjnQPlAmpI245fSvmnHPgOzQ0FEc7Z3FrGmDsjj6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149774; c=relaxed/simple;
	bh=PZDKXhsnOOm/rg+wPngXQoB46dyeaM5jXlxhi28+X1M=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:Mime-Version:
	 References:In-Reply-To; b=BnnDeubj4CJ3URQT3WhYGm1ZKDIToOiHfTrmIuwobWUIIcPL5ec6hHnNjMwqepNf2Awmea+k6ZU0+OrIqMAkLLmAP51lOVbjay37TkOlWW7qJ6GYVnvID70opnNiL8sR4nhygNvfatZu45L0v33YdwiY6PRmX9uFiFDhnt0IPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=NsdDXt2/; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="NsdDXt2/"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a368895so98213b6e.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149769; x=1789754569;
        h=in-reply-to:references:mime-version:content-transfer-encoding:cc
         :subject:from:to:message-id:date:content-type:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKV8pgt3vtSfNHeRUuJb99Ky4+PFPl+5i6O7Gn1H5N0=;
        b=WkiAB5ol/MNtxncdDtJxztty6Hgag8mjWRdZp86DDW4CeTGngw7xiKr7q8sW/9EBP5
         BcCAe6xC1kb6wGD1+aGLT1oPd/BMW/VUmMk9MYp4UIvOTzJYenK3VW7m2gsbbZHjA2d3
         3uj+DCoTvW8QXMa7TfI36pmZ23KA2Zh6gxfesv9kFrsBaL5lJZCiDaZVPpZFv5+MMqOR
         EY/2RQNG/vws6ktDklGfOQGNznRn0tM4c71lfok7eBSys/VWjXgcQFifQ/4IQpJmdDuG
         6P7KGRWyAyvHPU7QLfdSXWrGrWbue/QjU0jkT+cn94qgs/8w0Nd1YSLryyF/KM9KVRj2
         Kgww==
X-Forwarded-Encrypted: i=1; AKwUvBwx2tDJJS6TIgICx5otw3Co+FueH4WGJYngvNIqIx7PKvhJB+jCFrygB36jJfz4Ht9Ufj8Zbaiakaye9AneJdc=@vger.kernel.org
X-Gm-Message-State: AFuF++kn1mTxNRPMoOb0X1fZYXQBHAQdXNTESTB9o2SqDLKCn9EoWJG/
	ifcrdQ48DapFI3mF73dWPcPcSvWXeLAbEMalYta5p1XaG/F3n9DxsY5O
X-Gm-Gg: AYBFou2+xCW36tgILjK7fc2csMd0lBFQRX7kGn3TeQol4uxFMgWl9UeCIBV6Lwnq/Jl
	688/lsylKOhR2ITR3YVfvyxUNV7HKvtlQgk4gVPfZEWvT0kaSJLYsVoaCIClDXTs3oy04w8dzmp
	90+SjgecwEIc+oYu1BSLUHTdTh8SUDaqG/UhbB729T86oKg3817VhYty1W5Y+JJqdgRsxFnGg4s
	qWROrkEBN8B4NxgPpBww32dBPTu7aTYqeQqxlJa/zzjBzbgEM6GIDb+8i+tZEBDd30NbDEmvNht
	WQEOKoWKEFforfOs8qkvfHSB1hMJziFYoEiDduZmi+Y6WXY4kFakYT03Ww227w6oiaD9tEBEHSf
	YGotWBoxy7reqvqyXNgXMwtWRUOwPdcySO9iIqD5LceV4V0fIAKw8IchrLZHZju0niXzB0EC6gn
	BQ1YjjgLSV8i/nwI6YNOTjvKNJnQolv3SnrhgiSN/Td7kYMG3EPn2ynK+uZNG4a6Qph+5bb8h+A
	0QJ5FNaCXhxDNIB/KYspsL28r4S8nxMonwmA+HqyOwY7IK9n3GFWbbwrJGukvx2Nt1i/ns0N00d
X-Received: by 2002:a05:6808:1924:b0:4c2:a362:13a6 with SMTP id 5614622812f47-4c31bbef0b3mr5744032b6e.21.1789149769417;
        Fri, 11 Sep 2026 11:02:49 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c331bc959csm2853575b6e.13.2026.09.11.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:02:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CC5560333;
	Fri, 11 Sep 2026 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1789149765;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KKV8pgt3vtSfNHeRUuJb99Ky4+PFPl+5i6O7Gn1H5N0=;
	b=NsdDXt2/QvMJ9JT4J7OMOW13Fh2vAsoS1GBpAxZj3MT2MpjdqQsbmIdKmVqhEK7zWVdSCo
	fWSnEQKqJpXzIcfCZ8K4WLD2VoQkQTsJWwHA6BD1gLE0i+llypS0A7fnTTkDON2ZGUcBWs
	qADv423/e4aiBt7tEWqm2kAQQvTjwe65QfxXxv7YskPH40OpYSxxlz1hZ6hqVFyruBL9dS
	3R2mjYYmEDsMrODBmydo9A6kljYk/kXUbyu3AM2+w3LRMVwWIUgMX3x0lFDyRqUblsWgQU
	VR+qsDcp07u5CLMLMCtkgBmd8dAq76ZGN0vaF4nS1O8ekAyrEfYlm/kMrDmlNg==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 15:02:35 -0300
Message-Id: <DLCONMRV8YJN.2JBF36K590AXX@marliere.net>
To: "HyeongJun An" <sammiee5311@gmail.com>, <bpf@vger.kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton
 failures under BPF_STRICT_BUILD=0
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 =?utf-8?b?UmljYXJkbyBCIC4gTWFybGnDqHJl?= <rbm@suse.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Mykola Lysenko" <nickolay.lysenko@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-147-g86b4df97981e
References: <20260911141621.1944900-1-sammiee5311@gmail.com>
In-Reply-To: <20260911141621.1944900-1-sammiee5311@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Sep 11, 2026 at 11:16 AM -03, HyeongJun An wrote:
> The Makefile documents BPF_STRICT_BUILD=3D0 as tolerating any BPF object,
> skeleton, test object or benchmark failure so that the remaining tests
> still build.  Every skeleton rule honours that through
> $(if $(PERMISSIVE),...), except the three that build the libarena
> skeletons.  Those invoke a sub-make with no guard, so a libarena failure
> is fatal even in permissive mode.
>
> With a libarena source that fails to compile, BPF_STRICT_BUILD=3D0 stops =
at

Under which circumstances does this happen to you? I missed this because I
was using defconfig + DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT + DEBUG_INFO_BTF +
BPF_SYSCALL + BPF_JIT

>
>   make: *** [libarena/libarena.skel.h] Error 2
>
> while an ordinary program failing the same way prints SKIP-BPF and the
> build carries on.
>
> Guard the three sub-makes the way the other skeleton rules are guarded.
> The build then prints SKIP-SKEL and continues, and test_progs,
> test_progs-no_alu32, test_progs-cpuv4 and bench all link.  Nothing
> downstream needs a change, because the missing skeleton drops out through
> the existing permissive paths and libarena.test.o is reported as
> SKIP-TEST.  The default BPF_STRICT_BUILD=3D1 still fails on the same inpu=
t.
>
> Fixes: a6850fa388f6 ("selftests/bpf: Add BPF_STRICT_BUILD toggle")

Acked-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>

> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  tools/testing/selftests/bpf/Makefile | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 7ea5ba1df29e..a9951774e5c8 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -835,17 +835,20 @@ LIBARENA_SKEL :=3D libarena/libarena.skel.h
>  LIBARENA_BENCH_SKEL :=3D libarena/libarena_bench.skel.h
> =20
>  $(LIBARENA_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BPF_DEPS=
)
> -	+$(MAKE) -C libarena libarena.skel.h $(LIBARENA_MAKE_ARGS)
> +	+$(MAKE) -C libarena libarena.skel.h $(LIBARENA_MAKE_ARGS) $(if $(PERMI=
SSIVE),|| \
> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$(notdir $@)' 1>&2)
> =20
>  $(LIBARENA_BENCH_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BE=
NCH_BPF_DEPS) | $(LIBARENA_SKEL)
> -	+$(MAKE) -C libarena benchmarks $(LIBARENA_MAKE_ARGS)
> +	+$(MAKE) -C libarena benchmarks $(LIBARENA_MAKE_ARGS) $(if $(PERMISSIVE=
),|| \
> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$(notdir $@)' 1>&2)
> =20
>  ifneq ($(CLANG_HAS_ARENA_ASAN),)
>  LIBARENA_ASAN_SKEL :=3D libarena/libarena_asan.skel.h
>  CFLAGS +=3D -DHAS_BPF_ARENA_ASAN
> =20
>  $(LIBARENA_ASAN_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BPF=
_DEPS)
> -	+$(MAKE) -C libarena libarena_asan.skel.h $(LIBARENA_MAKE_ARGS)
> +	+$(MAKE) -C libarena libarena_asan.skel.h $(LIBARENA_MAKE_ARGS) $(if $(=
PERMISSIVE),|| \
> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$(notdir $@)' 1>&2)
>  endif
> =20
>  # Define test_progs test runner.
>
> base-commit: af0b84a9215d951d16f26b7ee34353b970cf5d4e


