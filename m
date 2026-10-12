Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2461412269
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842845; cv=pass; b=j+KJ3dSZYDk9ct8UwvMYnvdNG5UInjVoZSObUwxilkJHNcV2ogLcJXlgFJ3c7a77c0hXDP3k3KC4uc0dpQFuOnWqrahrC/PoroQCoabL0wjVri3T+VqzI8uHkxN8cX8EN613Kp+ht1zntKGTA0pzjAJxu8xgSL9J50YDgxZIlhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842845; c=relaxed/simple;
	bh=9Hy/4qi1pvOId1S+omXSYSIW36PU+S8k2ljSvieLxAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D75PeqPGMVVxkSozysj1asZP0zYrPv72n2VOEBRZQNkUYqdFe+WFdS5csQhRZPTO75zZicusLHkbWOBkdauIzpuIYgrn1PG/B/DGu4ZOYpweKHsBlSbRCrMMD3ShwFAlZ0e3nGI1r/wW3a7P3zE7sJWjSYY6268fBnCxK+zvmAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TpnRnLml; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TpnRnLml"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so548221cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 15:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842842; cv=none;
        d=google.com; s=arc-20260327;
        b=gRu+0F6P+Ik3cwK/d3eX8EqhwmvQivyRD2NmbItan2tRYJ8hrKLNQzu6fBei6owECj
         qy1hXS6y/9WQUJl+ert/wWoQDPnme7PDRy+wzRojPouqeliSOBADMCg9J0ixTYRENNbg
         2Kwgds0Oau+UAgAz94A+DksWWxxmEW4us/baY11s18ZllfXF3h4Z8MPKclRfMk3DUija
         Udh93JnMRt21eYiR9wQ0UHAHt/20x1/Hcd51tG4/1fOpghEnsP5NcLU+cTQswFIG3Pwg
         teyKP+f/SSTba7hctAu0XUY1YtiWTvhHsBZExrPKCxEryxcjdwTpRahXqXXYlAWCl2nP
         wydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        fh=zV2IQqW/ZMyoLLO3utKF+jsvAGvjqrbVcwJKHK63Hd0=;
        b=tCyU3tBmiTsWvAUidRz+tpPZvln/fJF2WUPAVswDpO+RoB/Em4urLpNnAK4OFmG82u
         emuQTLmEdMzmoccL2v5TVoa0O5NypMEle6GQLmWK72GC7QHO6N42+ZAhw66PrUqmtn6+
         zqZlm0HxFnOxegAxkNu+HeZEjbOgNbFNYavK/2pO/r/+3sua3upKmcmuDNq1A6QiW2dG
         s+vXBtIBG+bVGMtdEBEu5A3/YDtskkdfVly+HKV4DZYbtaip+ri9Z79aL/PGTUtlBf7T
         NzabZgHzCVfrpitl3eDp7QSWaYrKG2rM3R5PY6N5vf8NqwXS1aWEd2+GaFidcRLh9Rbe
         aE/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842842; x=1792447642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        b=TpnRnLmlqhaKUZfz/GJ5a3rcKXygjgsimL0KpuQx+kvhImdHv4P+dCGDftDL2pXICa
         8pDlQpusJQ2YIU3J85m+n77r4cOHi8mcBhRR1axttPYPCtzTcteWlBJo7+reJKvfyo/o
         dgcvRS7dofofLjh4b0uisNkDLKjHafw9faWY1LE5CNRmHiHO8q04MPuDFV8REG/Pj2I+
         oTku59Fcq1bXvneNZq107dmU1eQfpy+f7iAFZcit7kj5xx7MG2GSXl6qX29WZyjZQH5k
         nDY6V8+BLhG7C8EwoDpebfViwsZyvZRRLcwI1v89islnsumQ11dKn1AiA/lG8Adm9byP
         Yv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842842; x=1792447642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        b=Yb1YczAE52D3IdsGC7ZPIZ0VeWLn8TreDwC/4qcUb30jz7gHHj+46c4RD9x4gIl0df
         o5ldYXMgO0BFn6biIRv04husDDoTiSatsQVxugL019rKYbYaQaHOk0kGzc5f3nUWzfzD
         s1mNGAHotWFtG1y7vxaf+4/6KvezMYJqPa9r0r+vv5hRSo4lk1fCwwn+74B/1NRNNafH
         Dc3TQ6KU5au3bZLx6IGgqJupyh+gTX3W4Og1u04igvc4AkOkRGCTB0Vf18ycrOMZEERi
         QPCSM1UkIgKnbDEirMbzH6upSwlAvCDJjcgnwVz/SBmH01juN8NMUiVRKR73UGzHMki1
         my3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzl1a4YoYXBsZEeWXakCbIdbHIMtw+L9nHvXIGoOFJy+1JZA+hQO2Au58Y7kd31iDeRYlWJWONqBWrvaA1ofrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS1tS4Iv+krFNn6JTjnujNBfM8ZOS7gbjg0EOFiBP4+02RrC7b
	nGIjXGV/enSz4Vj/bZfHffZX4kUTHHrajSUuw+bpOV0vx/jd+3/FSLWYuSJuXfYUAEGoSzLEr2N
	gsTH9Q0q/Gm926puda89QeXvPy5SuJ2pNDrIHwRtp
X-Gm-Gg: AYBFou1rwqJbNkHqOoBWjB5SbbdBPc70YY9BHVSfsWqMnYhGcgKNHdaZXbhSep3roYw
	citqN3RqHaORHvFeVMzigD9firx1HkOEEdqjqAoPqGKGZxe5wmx7WpY91rpwpW7weq7MaYj/IvD
	NEaylL3uR7dWsGQK3PyPFsR9rgfqotlYYelf3h9KuHMWsUfDJLcOybl1iUiSHFyGxJ5qQ2n/yy/
	xh1KIZng7WVLwpq79I7sHj5HukZr8z9dKqSCMo0yxj3xfqYS7TL3zC+Qt08xTnAnIEGtyz25Ipx
	60LCDAbeIbYBig0LRps4vW2E8ECCZtorysptsvNvkuGw9d8isN0et7ywBbYJ1mmfC710gBchLUU
	kF0HAWsjngg==
X-Received: by 2002:a05:622a:581a:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-535b4f31acfmr40093421cf.11.1791842841851; Mon, 12 Oct 2026
 15:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011233647.2454648-1-sashal@kernel.org> <20261011233647.2454648-4-sashal@kernel.org>
In-Reply-To: <20261011233647.2454648-4-sashal@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 15:07:10 -0700
X-Gm-Features: AclHuK8mlJBdkDo_qjZnD8vvswEhWWRcu7xDXqAmSuD53qO6NxMidI4YTyg40zw
Message-ID: <CAP-5=fWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9q1rtZ0Vi0dng@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] tools: build perf in tools_build
To: Sasha Levin <sashal@kernel.org>, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 4:36=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Add CONFIG_TOOLS_BUILD_PERF. perf is built as it is built standalone,
> with optional features enabled when their libraries are installed, and
> with -Werror following CONFIG_WERROR. The feature table is left out of
> the kernel build log.
>
> CONFIG_TOOLS_BUILD_PERF_MINIMAL turns every optional feature off
> instead, so the result does not depend on the build machine. allmodconfig
> and allyesconfig turn it on.
>
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/Kconfig         | 15 +++++++++++++++
>  tools/Makefile.kbuild | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/tools/Kconfig b/tools/Kconfig
> index bf0643b39b86e..488f439592150 100644
> --- a/tools/Kconfig
> +++ b/tools/Kconfig
> @@ -59,6 +59,21 @@ config TOOLS_BUILD_IIO
>         help
>           Build tools/iio (lsiio, iio_event_monitor, iio_generic_buffer).
>
> +config TOOLS_BUILD_PERF
> +       bool "perf"
> +       help
> +         Build tools/perf. As in a standalone perf build, optional
> +         features are enabled when the libraries they need are installed=
.
> +
> +config TOOLS_BUILD_PERF_MINIMAL
> +       bool "Build perf with all optional features disabled"
> +       depends on TOOLS_BUILD_PERF
> +       help
> +         Turn off every optional perf feature, so that the result does
> +         not depend on which libraries the build machine has installed.
> +         allmodconfig and allyesconfig turn this on, which keeps their
> +         builds the same on every machine.
> +
>  config TOOLS_BUILD_SPI
>         bool "SPI tools"
>         help
> diff --git a/tools/Makefile.kbuild b/tools/Makefile.kbuild
> index 820a2d9a3893b..62fd494253eca 100644
> --- a/tools/Makefile.kbuild
> +++ b/tools/Makefile.kbuild
> @@ -73,6 +73,25 @@ PHONY +=3D $(tool-targets)
>  $(tool-targets): tool-%: FORCE
>         $(call build,$(outdir)/$*,-C $(toolsdir)/$* O=3D$(outdir)/$* CC=
=3D'$(call escsq,$(tools-cc))',,TOOLS_BUILD_$(shell echo $* | tr a-z A-Z))
>
> +# perf, without the feature table in the kernel build log
> +perf-flags :=3D CC=3D'$(call escsq,$(tools-cc))' FEATURE_DISPLAY=3D WERR=
OR=3D$(if $(CONFIG_WERROR),1,0)
> +
> +# Every optional feature off, so the result does not depend on which
> +# libraries are installed
> +perf-flags-$(CONFIG_TOOLS_BUILD_PERF_MINIMAL) +=3D \
> +       NO_LIBELF=3D1 NO_LIBTRACEEVENT=3D1 NO_JEVENTS=3D1 NO_LIBPYTHON=3D=
1 NO_LIBDW=3D1 \
> +       NO_LIBBPF=3D1 BUILD_BPF_SKEL=3D0 NO_SLANG=3D1 NO_GTK2=3D1 NO_AIO=
=3D1 \
> +       NO_BACKTRACE=3D1 NO_DEMANGLE=3D1 NO_LZMA=3D1 NO_LIBZSTD=3D1 NO_ZL=
IB=3D1 \
> +       NO_LIBNUMA=3D1 NO_LIBUNWIND=3D1 NO_LIBLLVM=3D1 NO_CAPSTONE=3D1 NO=
_LIBPFM4=3D1 \
> +       NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBDEBUGINFOD=3D1 NO_BABELTRACE2=3D1 N=
O_RUST=3D1 \
> +       NO_SHELLCHECK=3D1 NO_PERF_READ_VDSO32=3D1 NO_PERF_READ_VDSOX32=3D=
1

It seems unfortunate to maintain this list here, we also have a
minimal target as a build test here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/make?h=3Dperf-tools-next#n123
I wonder we should just add support for a MINIMAL=3D1 variable in
tools/perf/Makefile.config and have that set these other variables.

Thanks,
Ian

> +
> +__tools_build: $(if $(CONFIG_TOOLS_BUILD_PERF),perf)
> +
> +PHONY +=3D perf
> +perf: FORCE
> +       $(call build,$(outdir)/perf,-C $(toolsdir)/perf -f Makefile.perf =
O=3D$(outdir)/perf $(perf-flags) $(perf-flags-y),,TOOLS_BUILD_PERF)
> +
>  PHONY +=3D FORCE
>  FORCE:
>
> --
> 2.53.0
>
