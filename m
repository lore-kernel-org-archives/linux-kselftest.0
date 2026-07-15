Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926B3AD518
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136275; cv=pass; b=brBBZGnmetqUIqosqV8hxQkoEJMsWAHLUyOmB/RxkqcvHwV7391/Hkr56YE4KpSIrqkXKzt32jFVARuAo3L0pzGVTCXxZNK5SnvhJf3w5ykQVisKRuy9txtwgdLeAfWg7uImkOMTzHrZOXqgDJ0LUuNz6wD0iN2Qj9mTItHa+DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136275; c=relaxed/simple;
	bh=cNuKMIcek4rkNIhg1DjvTNY6u94NrZCdTQHA/3wIBW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQxB1E8dOognyrX8J+aAN/gJz9BVzJuRs01Httu7fl1ahvdWoOGndch83DxrgT6Cv0InIxH/Tbw6B7hfXJICZ0l35Vy+4cwASjaebNzuLC1KmilVIqklAwZNlUQnp63Rl8K5U47sSZ2z6q+iZt+aNcYtgYfd+nbWlOJb7WsMVGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dNCYOZMT; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dNCYOZMT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cab97c86bdso4865ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 10:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784136263; cv=none;
        d=google.com; s=arc-20260327;
        b=URj6ZmQKiwYb+Uhofi6vvtW30D4gv/vE2xPJ7aihp68Eh7PL8mozE/SDWIWcq+6YCf
         84XccshLs9t2rIPZlIaeGlV+HPyEeiFm9VcQ6+b2r6XTfnCSwWwenIsDIoHB7I7ll+rZ
         V+y5kYOhAPgd9rx3F/CPdZTu2oZwwc6ZevWV4bmETqrhYDyUCU81y10/wNTRy6KJf2fc
         KWkG8jG/MCQbgKvGrN7oSGgIsO61+y439hKTXLD8/AHSKB/EYzyNw8x0CtGT1TLXnxrr
         n0tpEzQ/9gaLOD+k3wY8dAT533T1GjqmRt5flek8JdO2XHlNWVC/FgR/fkIx/0PcCNzj
         +PBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kZWZPrQd54BSDgxOyeSGv4OPeqvj2vn4bH0lrJGj4Ms=;
        fh=swvnsUO/+wXW4JQVPsxg4rFtBzDRIAaknDVSD0cEzkk=;
        b=LvrOABOWRNDeGnHIxgh31QlebU3IOkrgV4sbwJ1ryl1xRfH+hD7s1hsEETQ0Jd0mSJ
         Sa6tMPA8BNIqxSR3YibF5lpizkmgSsghGp2KQp0SL615r2JXv7TPQp378gP1rn10dEBt
         OM4CZdpEG400IZMqgIOB3vs0/IWT2lUJqZE9rIybtXaLbW+bZPmERxqFaa+mSylyRanb
         NvzLBaZjE1yR3eOFFjX/P9dR2yXce+kRSCo1X4rjgcDWMJnf1qmKsA1yUSYMG+LlDUZO
         3phYdpe57qAHAeoLzOkfNH9orrSCWuo3YIu8EE5kPO3PoipmY5yZ2bekhxs91JCb/jAk
         FGiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784136263; x=1784741063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZWZPrQd54BSDgxOyeSGv4OPeqvj2vn4bH0lrJGj4Ms=;
        b=dNCYOZMTjKvT0n9mozUVbvLRG1A14M16Z1TvZR3ewSOJ+92NuK981pCGbz0cJR8G/v
         HZ9PCP8U3kNdzdLB1nQyZOJmoUURtDQjt5G4xiEnxaLmIB+YqZ+OmhOctzJMfTUzSCyl
         8dIAR1FJOjGZN1ZxAcLnf+sedUEutez2ZDGxHHev48ljqHuf9Ac7o3Nh6ehLVcbCH9UY
         1d2hJZCCJDaxcxpxH1DPiMp+AoH0JjEUkUWT/MkCA5BElQ5kA1voBaGJZhKWrG08qtIG
         9feO3TtNOD5T7kkt8prcTYd2hJICs34SDy19QNYsZjM7y5d2BOIsiaScDe+/TN9LTuaB
         OWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784136263; x=1784741063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZWZPrQd54BSDgxOyeSGv4OPeqvj2vn4bH0lrJGj4Ms=;
        b=OW+s24uFGpgrZFAXXHkxvAjzKiBDcB0cpVd9wwmuiaYRWkhtfCBYcABv98OKqmxeIn
         5XaTSAZcDTY7OB5QoZEfBgnt538kCb+5kgzTF2FeSwk/PAWf2P3bgkConKtlL0zMrb7T
         ZnyLxscUJLp1kK3Xx6coKVuggDrOyK8U8d7z6FlFpJntQmax1Pj41Mx/i4OsJL3nuTz9
         EaaeWJ5D5jeRl+EjMzZAuTGCbqNCV84z39Da4JEHqEz436HwnC0nN8DPcm+68IBZqW/E
         77URjZgav8lIvuO3qymOdmj1bfnY5MQ2Odqjhcfd2PKtEWUWIZtnHgPoz3/Sj/ONCZWe
         Q0gg==
X-Forwarded-Encrypted: i=1; AHgh+RrrPaCQYebzaL2d4DRj/+A4gPvHCn2UjZbJKFh6M/s17xs/LZHB8f2fyo+MwunGn68wwGV9fHjOszwvnYKSE3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0zA4hKrrrjqncDK6ENYZMeqpXhcn/aRnq052zfgh+Vf8IHqD
	Vrz/7rhgHstQN7y+u5Pd1R9w1nxyyisAYEQ0tfoIk39O6D05nLfSfR0LN7svcbPR2hJkOlTottt
	jTjX6WMw2qh3ExkqvF8BvXEIfbjinTpWAdcjyeQ1q
X-Gm-Gg: AfdE7cmlfiIywYoL7z4FZKEQXacNrQhhtPaX7ZwWsG5Olq9gLqfTKuLpoPWW72YwkE5
	zw3W/6BtD8oKSGy6o25eBbzqmR3xx2puOjHcN4+50cdSVVUI/NlWiTxA6Z6+yaSlKNhovyY4+MP
	kcwpRHZXM8jQ0DWmZ6F5eN/3R5JPDid101p8B1Y7imU9Wzr3UK4pN8+pGeMoi99S2qgM/BSLZgq
	2MM/oPELq56ueb5Q8y4+ZeEs+YmcbPct4vXDAZSe2jGCeIRjhNGHSCSuYh2K7VQnXjgXT2G2EpC
	dFiGrLyJZsycbNSM8JmHrx504FU=
X-Received: by 2002:a17:903:3807:b0:2cb:14c8:1ab9 with SMTP id
 d9443c01a7336-2cf18cd4872mr182285ad.0.1784136262817; Wed, 15 Jul 2026
 10:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
In-Reply-To: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 15 Jul 2026 10:24:11 -0700
X-Gm-Features: AUfX_mybqHGCI446L5L7h2Zp_6_VyrODdqkNsCPAiWVWAbvp3R1ALNx_UrcHOIY
Message-ID: <CAP-5=fV=_CsZFJf9HhNrJ+=jXCTqqDGd=HvwjMWu2WEn9bXqbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] tools/build: Allow versioning of all LLVM tools
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> I ran into the build issue mentioned in the first commit, because using
> an option like LLVM=3D-15 is a documented way to build [1], but only
> some of the LLVM tools defined in tools/ support this.
>
> After fixing that, a lot of other tidyups fell out. I didn't go too far,
> for example some selftests include tools/testing/selftests/lib.mk which
> reimplements some of the LLVM_SUFFIX stuff, but other selftests include
> tools/scripts/Makefile.include and I stopped before touching the former.
> Some other non build scripts hard code toolchains and I didn't touch
> those either, this change is only focused on things that already
> include Makefile.include.
>
> [1]: Documentation/kbuild/llvm.rst
>
> Signed-off-by: James Clark <james.clark@linaro.org>

For the series:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v4:
> - Drop "tools/build: selftests: Allow versioning LLVM lld", clang
>   already picks the correct sibling lld version. (Sashiko)
> - Link to v3: https://lore.kernel.org/r/20260715-james-perf-llvm-version-=
v3-0-8854bfe5af7e@linaro.org
>
> Changes in v3:
> - Add warning for empty $USE_LD
> - Use $HOSTREADELF in bpf Makefile
> - Rebase on v7.2-rc3
> - Link to v2: https://lore.kernel.org/r/20260518-james-perf-llvm-version-=
v2-0-f12cc4f031d8@linaro.org
>
> Changes in v2:
> - Fix selftests/bpf build. LLD needs to take the full path to be used
>   with -fuse-ld=3D
> - Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-version-=
v1-0-6cac1a9a4c8d@linaro.org
>
> ---
> James Clark (4):
>       tools/build: Allow versioning of all LLVM tools defined in Makefile=
.include
>       tools/build: Indent if else blocks
>       tools/build: Allow versioning LLVM readelf
>       tools/build: selftests: Remove some duplicate toolchain definitions
>
>  tools/bpf/resolve_btfids/Makefile    |  3 --
>  tools/lib/api/Makefile               |  4 --
>  tools/lib/bpf/Makefile               |  8 ++--
>  tools/lib/subcmd/Makefile            |  4 --
>  tools/lib/symbol/Makefile            |  4 --
>  tools/perf/Makefile.perf             |  7 ----
>  tools/scripts/Makefile.include       | 77 ++++++++++++++++++++----------=
------
>  tools/testing/selftests/bpf/Makefile |  1 -
>  8 files changed, 46 insertions(+), 62 deletions(-)
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>
