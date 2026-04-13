Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30939150D
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 22:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118827; cv=pass; b=rF2W75/fRAe5eI37oPG4vA1VLIJbJg/w4Gm3uYWM7E0MFefItOBPOcs3NUK/TJgPuxpAyyDMNVZuh/PWtilWQLnfyX3hv/RfTZacBodpNM2l76E4UEhYV2a6oAPIsrdJrjTZr9wMbMwQcrsHLAG3zjShR+5m1XdirKc/h9aoeRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118827; c=relaxed/simple;
	bh=vxVQ2muHMuW2TUZfvshASG/qQsXz8ZNjUFFlQbYxcsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNr1aPdoTd0OpnUx/BimrU6hhWZVlzavyrdUhqVaCE85sEy6tBmQArlkZh6Bpq7C+koInFGLLf1X0DeasxmdaocZQ78fGvVsRqYdjAFxtCdURhTjVJ0HCSnMPelgk76GwkCySvQR9n9eLPD70mnU5Hi4DTyqgNrODbMsAwnh9bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUuHEjv9; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUuHEjv9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so3166286f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 15:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118824; cv=none;
        d=google.com; s=arc-20240605;
        b=NeuG+aQslfSC58SLtHKzRzBe9PCiXq2PWzv5UlI0aM1nLT9WwQBqE49G5NhwTdokqd
         /hii8/nN8hhPEttMH6y92lKKtVX94zRU1bGOt+7NuEVqwz7mHU7jmKnw7Gr8Qo5py0co
         40M+5DhJlUM4oePafyW/l4/hXCvZI7vejdY4+9Qxr/kRx8zFZwFoAmhhMZ80zD7C1fpO
         4i2o0OXxTlPxJZGaPgrWUJYsuRETjuzBkMAPeco0eLqrrsIIdA0VtpuzsUEH0F5aw0Y7
         IUc0JMv4sX6GV/kkQYtA80y1gat28exugiMN8OqfSLdBLcMd+MXpk9QjbgbnpQS577rY
         +zvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
        fh=uCj5RXJwQIRTx8/GkFbkah820f1rKhDbScKJs6z1NR0=;
        b=c4FdTWUkmljhYFRHU7e5OkpTq8j3F/ZSL0XrpU5NfZLeWKHBWQrRMzvczLZ8olWdUQ
         ujh70YY64mJdUP4Kq68uYfY+IvSycwk3Xl8id4S+2hP6nmWj/VbZeA0yxp3EVxsRUYR1
         6LrkvRQHNCFCpvnLWYNkAmaNLRoR5C8BmFeGYs13Q6UrX3ch2LtvoRlI7AJrFbr3FI1y
         Gm9hCxstyeVnopqYOioo3RgCFEZAgLA9hZtdN7WrxcMsTq1uoFVtSeGL/OFOWyrznhzv
         3x50wPHFtAMk/2DFTd1toOz83AGTvE+HGcoFgP6YnVIdyrA9ZvTzqFBxGyIOa/eJgiME
         maSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118824; x=1776723624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
        b=nUuHEjv9Qng0o8+V9wNyx2C1uKpl067pNckpPRU8BSVRIZm6dfPLgPqP3Lw6xvRci+
         rrcuEMkS2XRywm2h09uyOmnKTQLHjpwyQGvjUnLR+ExxnIb4xqqDFxbjpBpiCdkyHDu6
         LngF2uqRRcGoW00iNEZr0UyyjrVcwf6T9kuuWf43+Q+4040c+17+hPikRfF7B+59GUTb
         v0zLOfHxr3+GJWfTCLexySi89isOOMhUvNlxmklB6c0vrs0x3+/IhBVk0aINzdLUFyEc
         ECICpTc89k2vaIx8sS2gDTBHGv8hhUFLZY3bqeBPytXxOYF2Wvk0vylCz5nLQgfVgPUv
         tQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118824; x=1776723624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
        b=feoFYdaiPcdEWHSOZM/2CRywdWz2DLKm7PO+si9268asrl/rdcQ3F59XADMQlgpJ9j
         4qcUvPmqaJtdTHvkU8M2Q/bFdXJgi44s/0tdnxpg5wRj0dfVTHZzIz4BPTCcCQQLBi8w
         0ehWtzPXu57941rgr9/YroQ0kbqFWtBLmUVVQCox6Q4hqZdsmqXpbNLjeV3uWfD/rjVX
         JnIghTWUjVIMMe/LMECKAn9SHai8oM1nole1Jl2rC5cATWntlphScYYVIeDJLpAK9KUZ
         BY1NEuuBM78EP0badm35N0K/sr8rYqK0sLDBLSe/gYAdGATXoQ/GJoYC+eNG1PsMAUVX
         zaUA==
X-Forwarded-Encrypted: i=1; AFNElJ8jVe6uXKFYkl6BB7l5sdUql6W78VPAp/987FzE1GIUNYjtuIra3ovp4FUode9nDdWiG+i1nWV2cAGgwDiVWL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfTSWNbGwx99TvIauboHdcJtOV1HGTwzjE/YPJBQKxgQbCmQL
	Jo5vOYp7baQi84CwiH+T51xc1g0i0UhrRmZ+2a4BHbLv8dVDbj/9w5BQI8dlZNBfO+LU2aVKGBc
	8Hb+xYbmi7vpRbcLoc8Pn0t4A/O0VC5Y=
X-Gm-Gg: AeBDiesewSxtnmOJFFAwFpU2dx3xhQu0v6WT7oAKAZ7//0i5ODKCWhcGQ/VlDMdT+9u
	gOD09cUCj64ZwmmOcqND4uuQYS6iCPGKaQVXGiN29PllSMHrjqEzVDaLc64mjS1OuZjnvn3LcuW
	Yt+pv5FsQo49RqZY+zCQsHInRDVM1esIPL9bsS/WEGVuu/mfmi1lN3ZuXzIoxbXal2x4IeBapaW
	ZUhoWLYM/FG7fYRh/m2uSKBOqMfLwPhjlrgsNLqsG8xQwoVEdLYIQeQrfUcF4IUAsRr2DiUgPM8
	nToXg80b6rDo1ZdXEVDCmsh9wTsUM8rWWuA/TWGQ
X-Received: by 2002:a05:6000:2303:b0:43d:7af0:3a8a with SMTP id
 ffacd0b85a97d-43d7af03dffmr7155232f8f.46.1776118824134; Mon, 13 Apr 2026
 15:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-3-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-3-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:20:13 +0200
X-Gm-Features: AQROBzASLHf5ILBNuw_x5OeLAHJGUfv8fbkKsOkNoaIfzCwURKyPvUbS0Z-ZunI
Message-ID: <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enables
> KASAN (Kernel Address Sanitizer) memory access checks for JIT-compiled
> BPF programs, when both KASAN and JIT compiler are enabled. When
> enabled, the JIT compiler will emit shadow memory checks before memory
> loads and stores to detect use-after-free, out-of-bounds, and other
> memory safety bugs at runtime. The option is gated behind
> HAVE_EBPF_JIT_KASAN, as it needs proper arch-specific implementation.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  kernel/bpf/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index eb3de35734f0..28392adb3d7e 100644
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
> +       default y if BPF_JIT && KASAN_GENERIC

Should this be "depends on KASAN && KASAN_GENERIC"?


> +
>  endmenu # "BPF subsystem"
>
> --
> 2.53.0
>
