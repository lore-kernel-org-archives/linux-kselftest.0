Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B10B403AF4
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913417; cv=pass; b=N6YI5WmVxv5EOXT5mbaGHwI2Eqt0gPF3/dctlmmMFEu/TitO7Sn50/xXeo9si6aJZpUFgYFc9NBig8qORgvETSQUtX7kP/Y6G2GVWMl7aYVmPw1bfSYQYPKHm6U/WYXKUBHJ6SpzI/+J0WYBBR48B58z6VDNmBK5wGngke3I3ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913417; c=relaxed/simple;
	bh=T/XOZkzAUaRuNTmlxBWLgaieY4+bTVH/XsWWHxZWp08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PB1wRNhaW6qx4ccG+HGcdx9GydylWJPUCufgBwHHDmgf2EmanznD/5G5CfZOovXDieY/Zi/ZMjvMovx4vTNiO9vyO/eopL3GiXU7gAYr5kwCq3pcvgSauDRDdo9wYsJ4xkDIRldKxkMzZ58eC87XqU7MKvjgIuX2Ar/+XpBkkrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgkj2NOi; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgkj2NOi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so3712445e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 06:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782913414; cv=none;
        d=google.com; s=arc-20260327;
        b=BlK5ugtTT33U/WAQtNFtoj/P3uZzOiUTnXf8EhydLkksd/WhQD3YDngRr/sPJUOYMx
         NlyFAVEuARcDwedukq1lq7kcCes9nzTF3UHtxZKAXUrzgbptqC2xBfle/I0kcCVVpsX0
         HtHV7bOp7pXRVbH4ys5zfMT4AV3HwHjbU4KS+NZT1TeRwqnw72EcH2zoLo9BMnmqp2aO
         YbBPTOUW88Xy5+dGTSd+Yf7iGT05UDD3hmA2fQRpKibp/KBM5oJRcHh5LKPxG7x9+qgU
         q2DjG0/Kz+/Em1Ey90lU6BMgHr1MOWdZ6iwYj0wbnqwFcoFJO9yfXepq15ZWD5Sfrf5O
         zqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSjIvUCBKaf+29BRz9OSwHOmh+Y7ZrvWCNVxdtqpkPc=;
        fh=iUTYBGAPm/t0FFe05rXmyzXmzXJFLryS2Y1fbVz9xqk=;
        b=BMGZ6+MOgvDOpjCtMpmXlS/HR74HbtxeebBsDREIWfMOWU3VdGFguwfG+MANHfN2VI
         w0aF8ieaGN8NqdUyhQpZm1ramuDqshFiRt/NEvgHTm07P3qIZorWh+Tu9D+WenkVMAtn
         gSGfKO/YXaNk/66gfT7Fz0K0xDlUurR0S51pyMJ/8ZEmKMHtcmOYlOGHeGtKFzr/UGmu
         PVgx7z55lmVawyj/0Klw7CQyuVRZyk9YpDwwU443olnWbV846S+UooPOrL6kQ9kHIZiM
         RRAZTMe7bvKXfHN8GwFKanMkJKpnPuaSpYpru3SW99dnlBk7qS+ECqZMhDXFMTvYvK/L
         zzCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782913414; x=1783518214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSjIvUCBKaf+29BRz9OSwHOmh+Y7ZrvWCNVxdtqpkPc=;
        b=rgkj2NOi0U9805CIRIw5hpGTPFAM2glen2HcSS4j5CcL4vLrHLCtzWSIeW7bbRfWsS
         zQ47FpVhQzbqcQa80YcAQYcx77rHz51gmh1d6lKG9o3OPCIyNVH5BC1WJW0+NDSZG+M9
         owzeqkauYPG7QNVlRwDbZ8qEwqY1YLEpGSbV6KwSa668Z2s5kxVvSEUotD6SUSIhGSaG
         r57+jV4ShQ34SvY6EhIUQj85t8xQAUKWhmq6s99xYgekVCgI4IlJt5BWAKiZcDbx/EKs
         zL2d+IR0qRW7ohxyf24vxVYnNdBbcOs0tCY0mXuOABcjoxmvLLm0/JRQUlaNxdjsz8lO
         /f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913414; x=1783518214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSjIvUCBKaf+29BRz9OSwHOmh+Y7ZrvWCNVxdtqpkPc=;
        b=kDAq+YxgftzbgAqztZbUP3LdCUMAqAFmX90goWRjtc2nRo/OLpfMsZ8yyjYRvVg2BM
         un928sCm/+1wbalCxkQQyCsaI469VPAxcJu5ZkZotFPYumCp4gcftT2xOtk5kEnbohhx
         srx6LZeoHc5utUncwQu4+ltcW3CR/Hqbu1IUqqquv2Oh0MdxOF1GCCJ+Z+2cFaj1ZiJe
         a/f7ZR5wIluHo+krftSV4owe166EqppRizdDqhd2uIGkwxok3KIv3q82Pm8CZGGLAGLR
         NJaMt18yUjb8akLk4bOYb+AjWX0CrJ30a5BbGeNjUThA2D8xqBOVZ45QGJctLfCn+9Mc
         Mwcw==
X-Forwarded-Encrypted: i=1; AFNElJ9OW9liZoSOhkMRQPnJH+nC4cMI4knq6JCpnUDXMxRIE5UD+K21OB86IZjjzhGE8Bj3dKq4PajzCbcLw5e+8nQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5jdSbE4b58TzYe+DuxVUWY77chM4+dgbymAX+fA7Hgy/Y3fW
	jrbqfKlEe6c7Wz7mEduvMwq14zJsljZbfxHy0zHo7GdKvQcxD9zWukaWkKzSZokdGu82+8Z8zMF
	lb/UWTYlsIJuRTmG0SxuSxoQFjxJS5qA=
X-Gm-Gg: AfdE7ckzU7rJOSkzBEORtxzKkCXAcg4KPnF7XS09F7NSMSmWgoH66QYcGxjTNi11DZl
	MVvJRDDeD3eqOi+P/QDtjzy1iNbUhhKoh5uv0O7P+I/23IF/NS5BqwvVZP10TXYCLkmvOlGIZhn
	jGRz2H9jIGeokR4WsgbzM1eQhSnFRqoY/yK12QZCm9oUCVWTa5eEuWcFAgGx3plKn/lbbkffi9M
	VSwxlPP/JGQcAhIhJhhIg5tVvGZSe67g2jm8Nf+llSmEYQeAt+zHDDMNQMltuE86bIMLepyjMRK
	fTBVDn5WyxXQQ1hrnnJEPYfYtVVU4Ts=
X-Received: by 2002:a05:600c:1993:b0:493:b549:3be0 with SMTP id
 5b1f17b1804b1-493c3cdec7dmr11711945e9.17.1782913414133; Wed, 01 Jul 2026
 06:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-kasan-v3-0-bd09bb942d86@bootlin.com> <20260701-kasan-v3-3-bd09bb942d86@bootlin.com>
In-Reply-To: <20260701-kasan-v3-3-bd09bb942d86@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 1 Jul 2026 15:43:14 +0200
X-Gm-Features: AVVi8CcJ4nu4CgC77rt5bmHSBbezlbOVmQluh7pACcz4JswCAgdtoM35RXoiH5E
Message-ID: <CA+fCnZcJzRvq9942LXgTpq5067u4DvXQRjdNDpq-5vOZpQuCVQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 03/10] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	ebpf@linuxfoundation.org, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 12:03=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enables
> generic KASAN (Kernel Address SANitizer) memory access checks for
> JIT-compiled BPF programs as well, when both KASAN_GENERIC and JIT
> compiler are enabled. This new Kconfig is not a user selectable one: it
> is either automatically enabled if KASAN is enabled on a compatible
> platform, or disabled. When enabled, the JIT compiler will emit shadow
> memory checks before memory loads and stores to detect use-after-free or
> out-of-bounds accesses at runtime. The option is gated behind
> HAVE_EBPF_JIT_KASAN, as it needs proper arch-specific implementation.
>
> As KASAN instrumentation for eBPF program will depend on the info that
> can be accessed during each instruction verification, there may be
> instructions that will be instrumented even if they don't really need to
> (eg: global subprograms that access caller stack memory passed as
> argument). To make sure that those additional checks do not trigger any
> crash, make sure that VMAP_STACK is enabled so that programs stack has
> shadow memory allocated.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
> Changes in v2:
> - add dependency on kasan for vmalloc and vmalloc'ed stack
> ---
>  kernel/bpf/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index eb3de35734f0..a8e004f88b92 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig
> @@ -17,6 +17,10 @@ config HAVE_CBPF_JIT
>  config HAVE_EBPF_JIT
>         bool
>
> +# KASAN support for JIT compiler
> +config HAVE_EBPF_JIT_KASAN
> +       bool
> +
>  # Used by archs to tell that they want the BPF JIT compiler enabled by
>  # default for kernels that were compiled with BPF JIT support.
>  config ARCH_WANT_DEFAULT_BPF_JIT
> @@ -101,4 +105,9 @@ config BPF_LSM
>
>           If you are unsure how to answer this question, answer N.
>
> +config BPF_JIT_KASAN
> +       bool
> +       depends on HAVE_EBPF_JIT_KASAN
> +       default y if BPF_JIT && KASAN_GENERIC && KASAN_VMALLOC && VMAP_ST=
ACK

I think it make sense to put KASAN_GENERIC into the "depends on"
section, as __asan_load/storeX() are only defined for the Generic
mode. SW_TAGS mode is expected to be soon implemented for x86-64, and
that mode uses different checking function names.

Would also be great to add description for this config option.

Thank you!



> +
>  endmenu # "BPF subsystem"
>
> --
> 2.54.0
>
