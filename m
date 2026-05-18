Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E730B3E9286
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120392; cv=pass; b=WrhjoCB9GknZJX2r787fz57+4xBzWNmKhsmUZQK383qqdbw0UozMlbpc5cIP75qGYzHKfZWJMrnzAfj5poDZ6hD3u847ySc9WpK6bMwtBQVzuRN7i24b/8coUBF44b279hJMH+iqLVM2NRwlKPeAJDVRgj5E8XLvSVdd8o5liq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120392; c=relaxed/simple;
	bh=0JN4eWAeyH1DFvPDOFr1bp0SNGRTw2jc5rqIj+ZsVUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/qiFDh3DNTBuTAkLFTaLLzeNmSQ4Jmo7BMWCUeYPk8a0RcqMA8iTkgzTm6lJtaUZZCeHFSh7pfVZOzXvJH9n+sx4uT6/vGQUF2KeAFYdG6RlZQtCvMyHu72AO2DhtcaTQWtSK+lSe2praUG8bX3pDx15LyYLCCBrx2IHF2vM1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jGueLnnv; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jGueLnnv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso175ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 09:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779120368; cv=none;
        d=google.com; s=arc-20240605;
        b=jvNsxLRxoRPEp8CGx+X4illutYzuIABbiENR+q38M0d951ZEnjFib7XOjoQJCg8hh3
         xYQLw2hyJaP7pwXNDQlHttjxWroSu0Oq24hirjr6ircnuQkJ+Yczh1N0pVvBoNDbDJ1y
         jFvEn1l9pBkXRG1xFDwsFd3G+8EBTcMeqUelI3tZtU8uruJ5HJHDs+dBpL2nOLdzkgbi
         9Xb5aqS2rflibBMJIfuEHl5ha7Dw2j1agpHZnB4AbJNE7NDp9PR5KxZ5mb2bYT+nldJn
         KDFljblCuyTpjPcEc7x30FSKgtXC7FaO7S3CPkq/xwQF2HvckQVz30jCXN2OEqYHZS7g
         Td5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/yL2S/NNFD9uZOxHwjkGhATRbJfyjLUg+vdf0l7wFBI=;
        fh=eYtPox5Xri+HHx1tCAiPBJL7L6BaQLcXs3CcmL9hzM4=;
        b=PqfdYcvEVtCxtvr3an5JxfQ/pWyNIoabuKPrdy1ZWKtWYPlryrKrX5Cy741hD5nBgp
         0Mu3279ox9hNutIaiColZ1uUVfpK6F+ju/x5YDQ2Xt6eHpISFjjVaj59f+hegspzdr9S
         3qwDMSjAuWOEo3h1m4o5216BKH7mF86o3b//t1c6qWavdUL7a/nv+RaMSxezdwO+2hd4
         ujtb9Uuf6ZvMEU+lGsSteOJI4uDegxCuYSytLCcug5/ejxeIlWVjPIUU1kP8GNTB+0pq
         FY9Pp8C83iVFw0OcnnFOsYjxSekZ91xhQ8LTwWgvebnjvhDT9s+NOZamfrh47vzeZKQz
         Z/ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779120368; x=1779725168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yL2S/NNFD9uZOxHwjkGhATRbJfyjLUg+vdf0l7wFBI=;
        b=jGueLnnvGXPf0SEVFUOojzRtxCqeaOSe0Yzj+zD3sHWcSHCOPwqjC9HnKvg5/v8vvO
         re1A4G8Fh9asuAzg6hSNQholYgZA16S5Ssrud0W/kdtLOERIt95MnH1l3ORcirQBC9Yu
         oZ+mlJ1qvOaTU9/Ipx+JI4HCPUFBcbUzE4yU8akOhcl53ykTaj2qY/XzdzJX6F615JKL
         GuRfH+f1mYy1yL3L6lnz78pE6TCzJNFOAJS++nSyeSoB8m0C/l+f4Pdwnvfb6DP7qrY2
         N30usLFBRg+HJBllLX+Yxk/3tXlQZy5YufVqvEqHSjKTMhp0jh9zG95dxHQtX0yfIbHs
         O//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120368; x=1779725168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yL2S/NNFD9uZOxHwjkGhATRbJfyjLUg+vdf0l7wFBI=;
        b=KQaB4UtZoQEEzp+n01LS0i4s7JrzXp82p748jjKe2djaa5iTO8JrUU+sUxBWAFPuLu
         fHaHkm5b+HGHj9SVpIv7Kn7YFndVeED6KU4tYEku8GXcmxpKVtmE4p1wgAR+XsLGSSRz
         B4OEqnHQm2KAy4F50yq5D6AstvmpDX1ob2Iu4FceprjNS4gAonD9eYf0oMUF5oIRGxkU
         K5gCGTvTlBduzOHAxx35+41tzcKA9uxSScs24+jCl1idWbGMnneZOPKREe0LJf3GJaUu
         bNr8iLY+B/AzYJ0Z6x0RU1usvn030glDZhgzrKDek9ESFDGvFW6BDAZQB6v3VjJDTJxK
         euGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HHtUwdQVVHBtrHfpmYhzvRMyORsRKpUvOTQdTozvm+c8j9MzO/nfbnlvOYkU4XacERa2oBq+4cL+ggXjH15k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGin63gq6SO9aadsB6QmUsCY8e96S3luRr/HW0BMRnhepPPf8
	vVJhSHs7N7gNnL4oi+Ii9s1Cq2zpKR/dnnzHqagtyj2Tr/C4T+mM5kTZtW4mFy1r059RalYgTsz
	MWn2mgkoVIRctaGTMblZIQLVy8MI0o3f7ANXvF+O/
X-Gm-Gg: Acq92OFgzPGEuPrvMbu4+hqpgLjtiUB1JdguxTkSGwRREaUSPrn/qgWV3B4sa2keVVd
	dfIEV8tgAvqf5zH+aaSJW9qdLe1Wsf3YmWCdkVGg7woKFd9MisT703ZluCZGl5NT8BcCRLLaZPn
	q4DtRQPRmG2gSmc8tEYBhFhK8BGXgulaZFM2KPtvttl1pYFlce16woEc0ZES4b1WcBggsjmILNR
	lE2NAuH3tkRSjL6FaZsId2jLYYDmqbEFFB0KIhXlyNCEF1RQEvrN9Ksx0h/N/cTFAwvaTvTxE/d
	W8RHoofcMIT+mOU0Z4jfKEELi5pWZadlj9/E2cTLfuNxlSVQ
X-Received: by 2002:a17:902:d2cf:b0:2bd:3c1b:3073 with SMTP id
 d9443c01a7336-2bdb041654emr3259205ad.16.1779120367385; Mon, 18 May 2026
 09:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org> <20260518-james-perf-llvm-version-v2-4-f12cc4f031d8@linaro.org>
In-Reply-To: <20260518-james-perf-llvm-version-v2-4-f12cc4f031d8@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 18 May 2026 09:05:55 -0700
X-Gm-Features: AVHnY4J8ZynnI8bourXp6ojaD0bCqutv1EZpQT8aGfrcInLJ1HrazyPhkbTF28U
Message-ID: <CAP-5=fWmXQEbLg=xGJwQ4s5q5xUZUTdxx2N1K71N0gztZunQrQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] tools/build: Allow versioning LLVM readelf
To: James Clark <james.clark@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, ihor.solodrai@linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:04=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Documentation/kbuild/llvm.rst mentions that readelf is included in the
> LLVM toolchain, but it's not currently included in this block.
>
> Add it so that LLVM=3D... options also apply to readelf. Users in tools/
> were Perf which was hardcoding it, and another was the BPF makefile.
> Both already include Makefile.include so convert them to use the new
> variable.
>
> It also didn't have the cross compile prefix, so either readelf didn't
> mind opening cross binaries, or it wasn't working for cross builds.
>
> Signed-off-by: James Clark <james.clark@linaro.org>

For the tools/perf/Makefile.perf part of this change.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks for the cleanup!
Ian

> ---
>  tools/lib/bpf/Makefile         | 8 ++++----
>  tools/perf/Makefile.perf       | 1 -
>  tools/scripts/Makefile.include | 2 ++
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 168140f8e646..180dca9c57c8 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -114,12 +114,12 @@ PC_FILE           :=3D $(addprefix $(OUTPUT),$(PC_F=
ILE))
>
>  TAGS_PROG :=3D $(if $(shell which etags 2>/dev/null),etags,ctags)
>
> -GLOBAL_SYM_COUNT =3D $(shell readelf -s --wide $(BPF_IN_SHARED) | \
> +GLOBAL_SYM_COUNT =3D $(shell $(READELF) -s --wide $(BPF_IN_SHARED) | \
>                            cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*/=
/' | \
>                            sed 's/\[.*\]//' | \
>                            awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {prin=
t $$NF}' | \
>                            sort -u | wc -l)
> -VERSIONED_SYM_COUNT =3D $(shell readelf --dyn-syms --wide $(OUTPUT)libbp=
f.so | \
> +VERSIONED_SYM_COUNT =3D $(shell $(READELF) --dyn-syms --wide $(OUTPUT)li=
bbpf.so | \
>                               sed 's/\[.*\]//' | \
>                               awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {p=
rint $$NF}' | \
>                               grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 | so=
rt -u | wc -l)
> @@ -182,12 +182,12 @@ check_abi: $(OUTPUT)libbpf.so $(VERSION_SCRIPT)
>                      "versioned symbols in $^ ($(VERSIONED_SYM_COUNT))." =
\
>                      "Please make sure all LIBBPF_API symbols are"       =
\
>                      "versioned in $(VERSION_SCRIPT)." >&2;              =
\
> -               readelf -s --wide $(BPF_IN_SHARED) |                     =
\
> +               $(READELF) -s --wide $(BPF_IN_SHARED) |                  =
\
>                     cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |   =
\
>                     sed 's/\[.*\]//' |                                   =
\
>                     awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}'|  =
\
>                     sort -u > $(OUTPUT)libbpf_global_syms.tmp;           =
\
> -               readelf --dyn-syms --wide $(OUTPUT)libbpf.so |           =
\
> +               $(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so |        =
        \
>                     sed 's/\[.*\]//' |                                   =
\
>                     awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}=
'|  \
>                     grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 |             =
\
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 0aba14f22a06..63276bf55856 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -215,7 +215,6 @@ FLEX    ?=3D flex
>  BISON   ?=3D bison
>  STRIP   =3D strip
>  AWK     =3D awk
> -READELF ?=3D readelf
>
>  # include Makefile.config by default and rule out
>  # non-config cases
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index e81e5b479c56..380ad84ac51e 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -73,6 +73,7 @@ ifneq ($(LLVM),)
>    $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
>    $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFF=
IX))
>    $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SU=
FFIX))
> +  $(call allow-override,READELF,$(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)=
)
>  else
>    # Allow setting various cross-compile vars or setting CROSS_COMPILE as=
 a prefix.
>    $(call allow-override,CC,$(CROSS_COMPILE)gcc)
> @@ -80,6 +81,7 @@ else
>    $(call allow-override,LD,$(CROSS_COMPILE)ld)
>    $(call allow-override,CXX,$(CROSS_COMPILE)g++)
>    $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
> +  $(call allow-override,READELF,$(CROSS_COMPILE)readelf)
>
>    # Host versions aren't prefixed
>    $(call allow-override,HOSTAR,ar)
>
> --
> 2.34.1
>
