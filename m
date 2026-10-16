Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F76509F04
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165307; cv=pass; b=sPsIOA6/eKxH/wgGIM3HhrXLoYCYkAe3UY5DXLesSUpIfjEeO7Mw+ylmOsibLmOwnq7iYeWGHEzdMzDNe36/nVTKY291r7XtbD6Lj65/FmuTa8h65QunORJB4mdYROl/sTgb9dQbeoYJKLhMMy6RAHPGotuu4ZEkrPKp8rE5GiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165307; c=relaxed/simple;
	bh=EdkSpCj7hNZcxLPGAmr5Svs9uzq/yo5MUONBoId45GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUbNY/q2CZPChC2Dq41mGBOSHDmOivA2JeQHaXR93NGd7ldIebBBxs6ZSRRmdFJ7BrVOZyeg2LIEwN+wiy1u+1zWaxvPvMiMQSdzM6i4FE1o1DSm/L9CKUbhbuPx5CKsT/gbKv/sJsR7JGnFbBOtv99RkTRN1PvDSNedGpXAaek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SpTnDsq8; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SpTnDsq8"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so367051cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792165304; cv=none;
        d=google.com; s=arc-20260327;
        b=U/0lEzXccwciMbv3YSllcnltsx7XZcoEJqozpNvJv4+I5nX2Es9KQZaNbvcKPe7frR
         AlTuKcPjcLyxu5i1l61oWLdIxY76DmWlt2KbThDBst0+dgAuUtBK4SFL+xNa+R6hHtwS
         7iNPm0lAgkVps89i/WkqNBhkYHYpcBrJV8KthYDW9TZXltLwHWXIg2lIiU/z73tvY+Ab
         O0iEADy2NnYvvFrxXc2yc/niEtwV/+U1pdB2t96CxhMYowwty9AqTxkdzjUKrYZPQX9u
         VqdXBnTLnung5cai25wKNFTWtKjLw9UeXrcvoZADf4lEyKlmUnwbXBgFPGPw1zSxYict
         mYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/6QFU6AYA8TWsY/UeVE0scsevyNdyU2Km01Cay74S0=;
        fh=6z95gi+jNtlrSHVNqi7ChKuMs8YgVxdZpvYJFbboYWA=;
        b=V7wMwPBc6Qjjg8QZH3Hc1ZnmwQIQ2GfOBR/O+pKk4B04pqF1r9wL9Nz6PDjQaaWg4s
         XRHwiYkNmmjk9qlXzKjqOZrTppTeaVZeUWxMoNWFv3GWIWcPU4qDxlfI0lTh0ntKGTP0
         iPnDMlFgiQbLDM2PImjb7p/gGObopmzny3l/1ZSjcIeRmpe/fT3vkSu3nxzzrJoBVMTA
         S+GfEsGN7bxrBB0cmPFR4hgw/KIhJxToBKzqrP6esL6a/OINu0+NuLm24f/ndZV8Sfr4
         3tBZc4/EeMJ/2uuSDWF59ETwEUXLxQBTVhwuFeZKolzJQ+07gHG59D9Co0pK0fLnYKus
         Y33A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792165304; x=1792770104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/6QFU6AYA8TWsY/UeVE0scsevyNdyU2Km01Cay74S0=;
        b=SpTnDsq8X7VkO0CvYXgjhQ6CWiNrIPmallUfl+G+1LhHyQO+w1rT2xHWAKVKI0Hjk2
         IQsXjIrBm2FxqTIH/6e1HkBaQ+z2e7pbaGq+JAx+d1fnopP8mhjPXLko7ZEXNYypanIr
         CdB6/IMYo2R3P/DpFRQlqyD7TnbFO6IeWNM5cnRPknQw0GT87vT7PZZj1RuO/YBvZ8LT
         fM9uaifDgeCGk+sEOK/nm1Y9OBqGdGdCIHNqrLnulbhl+jR0/+g541TEVOXpoY/GVuaT
         n6UMZql600Bjy6WFAo0e7tEITVBlomFp2F7uzvUw+QdlCxx/Gxb+rIoT5N6lfSJ1/pnP
         psNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165304; x=1792770104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/6QFU6AYA8TWsY/UeVE0scsevyNdyU2Km01Cay74S0=;
        b=nu/VoYV971y+ENUJiwBHlduYv1d9rEiLOuvCNJbXTkN3afySn+2uZX8KhVOcKaLgAN
         sl3TvD2ZPKEqdPu2BZa+N2GgBxfrq+QCfEjE5cG6SBzaxsdhZYlrc4otjGQLNXYdXfTl
         maj7t1krIu7sJD2VogxaDYttENR/AAAGARMBIe6FWl9QVVHrulJ9w6sEqw9euVnf1Kzr
         35LpbPf7dRBpGB/Ww4V2onNv9werYAPN8D3xyIRrUG9X/PbtU6mC7xTuQ8FEeTpdCMWW
         YRGUXGW0UfVt4mSs2zGPSN4Vq+CHgzHGFHdIrAEdjDcIFG8TRT/CrbBjdtSMdO+8WgBO
         O0qA==
X-Forwarded-Encrypted: i=1; AKwUvBz6RCZTetV4dH8khVfC10USKDYrFlsMCWDh93OsaTztV/JQATsyaQ9e/6h+okyQuuB8QzFm0BMh+mFZEtatIzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgtE0G1xgNHdbdkQA2ohkxoc/7BhqwVoKisUYtzn85Yy/LGDOL
	noAgIhZNaJtpJyTx+l52t1tdE5AhikTMfMUBlhmhBUh4CxFUx6KqU9T11EdS+R83MeMFFamc3Mn
	4tfd1cbsgtSF0urMT0s8zbAJ8yF9JOsULKgCEhwgy
X-Gm-Gg: AYBFou3D2SmlkaCzL/4UfTmb9KcWPdLGDzha/GKkCcyzDs/jqHZOaJD8V7Ggv6anvi7
	LG9NKV3q6Bfj7K6kXa1/czW3BKrR0oxnjSGUbIcoc/6UnRIxRnXCo/YXsAlc9D8s1cqxNcolhpZ
	z6pgN1Ri/IebeXrEK8s6/9HBtwDpjOGipCL5oj/cCgDuoqk/FY7Dp3dhtBm7fMVqjEaQMBX0NTQ
	O4hlQSWesTjx/eihAIjJdtRAumVR5eqaB17yz69CVW5RBnXdKen6tDivm9FoPPiuOn6+4IteZNE
	7tXC/o8dfB2jn1Rs0pMDUxzkoa5JGxLMih58PICUrXFZ04/lttZ1jfqpAFrQYb/8OUx0ZoCgxSR
	GZJ3CBbwIpo0=
X-Received: by 2002:a05:622a:4886:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-5362b3e7881mr20460851cf.10.1792165302889; Fri, 16 Oct 2026
 08:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016143143.3613501-1-sashal@kernel.org> <20261016143143.3613501-4-sashal@kernel.org>
In-Reply-To: <20261016143143.3613501-4-sashal@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 16 Oct 2026 08:41:29 -0700
X-Gm-Features: AclHuK9Nw6uxiW7Jt1G3pjd76v05weMuSMdw0gbbOHi_Cx8XoClXGbI2Vr90vjg
Message-ID: <CAP-5=fV_A+k-_g683q7n897YMudBwwvQPkS_cKRSdOxkEYFa0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] perf build: Add MINIMAL=1 to build without
 optional features
To: Sasha Levin <sashal@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 7:31=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Turning off every optional feature takes a long list of NO_* variables,
> and the list has to follow features as they are added and renamed. The
> one in tests/make for make_minimal has fallen behind: it leaves
> libtraceevent, jevents, slang, AIO, LZMA, zlib, libLLVM and Rust to be
> detected, so a make_minimal build still needs libtraceevent and python.
>
> Add MINIMAL=3D1, which turns off every optional feature, the BPF skeleton=
s
> and the shellcheck run. perf then builds, natively or cross, with no
> library beyond the C library and without python, pkg-config, clang or
> rustc, and the result does not depend on what is installed on the build
> machine.
>
> A MINIMAL=3D1 build also leaves out the notices that post unwind and
> python support are disabled, which it asked for, and the one about the
> pkg-config search path for cross builds, as pkg-config is not needed
> then.
>
> It is handled in Makefile.perf rather than Makefile.config, as
> Makefile.config is included after the pkg-config and shellcheck setup.
>
> Use it for make_minimal in tests/make.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Link: https://lore.kernel.org/r/CAP-5=3DfWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9=
q1rtZ0Vi0dng@mail.gmail.com
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/perf/Makefile.config |  8 ++++++--
>  tools/perf/Makefile.perf   | 40 ++++++++++++++++++++++++++++++++++++--
>  tools/perf/tests/make      |  8 +-------
>  3 files changed, 45 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 4d5993da9f945..137c9e120670b 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -742,7 +742,9 @@ dwarf-post-unwind-text :=3D BUG
>  # setup DWARF post unwinder
>  ifdef NO_LIBUNWIND
>    ifdef NO_LIBDW
> -    $(warning Disabling post unwind, no support found.)
> +    ifneq ($(MINIMAL),1)
> +      $(warning Disabling post unwind, no support found.)
> +    endif
>      dwarf-post-unwind :=3D 0
>    else
>      dwarf-post-unwind-text :=3D libdw
> @@ -828,7 +830,9 @@ endef
>
>  PYTHON_EXTENSION_SUFFIX :=3D '.so'
>  ifdef NO_LIBPYTHON
> -  $(call disable-python,Python support disabled by user)
> +  ifneq ($(MINIMAL),1)
> +    $(call disable-python,Python support disabled by user)
> +  endif

Thanks for the clean up!

In perf-tools-next/linux-next both LIBPYTHON and LIBPERL are gone
(context in https://lore.kernel.org/linux-perf-users/20260926062029.800743-=
47-irogers@google.com/#t
).

>  else
>
>    ifndef PYTHON
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 29cfd44c427f3..c770077e7d392 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -129,6 +129,9 @@ include ../scripts/utilities.mak
>  # Define GEN_VMLINUX_H to generate vmlinux.h from the BTF.
>  #
>  # Define NO_SHELLCHECK if you do not want to run shellcheck during build
> +#
> +# Define MINIMAL=3D1 to build without any optional feature, needing only=
 a C
> +# compiler and library, flex and bison
>
>  # As per kernel Makefile, avoid funny character set dependencies
>  unexport LC_ALL
> @@ -174,6 +177,37 @@ endef
>
>  LD +=3D $(EXTRA_LDFLAGS)
>
> +# MINIMAL=3D1 is handled here rather than in Makefile.config, which is i=
ncluded
> +# after the pkg-config and shellcheck setup below
> +ifeq ($(MINIMAL),1)
> +  NO_LIBELF :=3D 1
> +  NO_LIBDW :=3D 1
> +  NO_LIBTRACEEVENT :=3D 1
> +  NO_JEVENTS :=3D 1
> +  NO_LIBPYTHON :=3D 1
> +  NO_LIBBPF :=3D 1
> +  BUILD_BPF_SKEL :=3D 0
> +  NO_SLANG :=3D 1
> +  NO_DEMANGLE :=3D 1
> +  NO_BACKTRACE :=3D 1
> +  NO_AIO :=3D 1
> +  NO_ZLIB :=3D 1
> +  NO_LZMA :=3D 1
> +  NO_LIBZSTD :=3D 1
> +  NO_LIBNUMA :=3D 1
> +  NO_LIBLLVM :=3D 1
> +  NO_CAPSTONE :=3D 1
> +  NO_LIBPFM4 :=3D 1
> +  NO_LIBDEBUGINFOD :=3D 1
> +  NO_BABELTRACE2 :=3D 1
> +  NO_SDT :=3D 1
> +  NO_JVMTI :=3D 1
> +  NO_RUST :=3D 1
> +  NO_PERF_READ_VDSO32 :=3D 1
> +  NO_PERF_READ_VDSOX32 :=3D 1
> +  NO_SHELLCHECK :=3D 1

We should expand this with NO_MYPY and NO_PYLINT for the
perf-tools-next version.

Thanks,
Ian

> +endif
> +
>  # Some distros provide the command $(CROSS_COMPILE)pkg-config for
>  # searching packges installed with Multiarch. Use it for cross
>  # compilation if it is existed.
> @@ -195,8 +229,10 @@ else
>        PKG_CONFIG_LIBDIR :=3D $(PKG_CONFIG_LIBDIR):/usr/local/share/pkgco=
nfig/
>        PKG_CONFIG_LIBDIR :=3D $(PKG_CONFIG_LIBDIR):/usr/share/pkgconfig/
>        export PKG_CONFIG_LIBDIR
> -      $(warning Missing PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH and PKG_CONFI=
G_SYSROOT_DIR for cross compilation,)
> -      $(warning set PKG_CONFIG_LIBDIR for using Multiarch libs.)
> +      ifneq ($(MINIMAL),1)
> +        $(warning Missing PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH and PKG_CON=
FIG_SYSROOT_DIR for cross compilation,)
> +        $(warning set PKG_CONFIG_LIBDIR for using Multiarch libs.)
> +      endif
>      endif
>    endif
>  endif
> diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> index d2c2f526e1db0..dbbc971a144b2 100644
> --- a/tools/perf/tests/make
> +++ b/tools/perf/tests/make
> @@ -115,13 +115,7 @@ make_install_prefix       :=3D install prefix=3D/tmp=
/krava
>  make_install_prefix_slash :=3D install prefix=3D/tmp/krava/
>  make_static         :=3D LDFLAGS=3D-static NO_PERF_READ_VDSO32=3D1 NO_PE=
RF_READ_VDSOX32=3D1 NO_JVMTI=3D1 NO_LIBTRACEEVENT=3D1 NO_LIBELF=3D1
>
> -# all the NO_* variable combined
> -make_minimal        :=3D NO_LIBPYTHON=3D1
> -make_minimal        +=3D NO_DEMANGLE=3D1 NO_LIBELF=3D1 NO_BACKTRACE=3D1
> -make_minimal        +=3D NO_LIBNUMA=3D1 NO_LIBBIONIC=3D1 NO_LIBDW=3D1
> -make_minimal        +=3D NO_LIBBPF=3D1
> -make_minimal        +=3D NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBZSTD=3D1
> -make_minimal        +=3D NO_CAPSTONE=3D1
> +make_minimal        :=3D MINIMAL=3D1
>
>  # binutils 2_42 and newer have bfd_thread_init()
>  new_libbfd :=3D $(shell echo '#include <bfd.h>' | $(CC) -E -x c - | grep=
 bfd_thread_init)
> --
> 2.53.0
>
