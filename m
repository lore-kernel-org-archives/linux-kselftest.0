Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22833A6FB
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523292; cv=pass; b=iHDStNIF5Dt5DlPo+Oz/Exanrkb6aCLgjUSuLDAlqCf8JZC4d4jAY60xViqMH0HkIEzU0iSPyk/1LY41BY2ivvffcoj/NdCV7vxmi7ifvtmzNwoBePYMDUiPRI7h/U/QGbvfh88zM5qODlfaTf7UsD25oCjivnproa35RfaR4bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523292; c=relaxed/simple;
	bh=60uAjxQjjAvkmuwXuk/0K+9B6lmy2ELyGpJMetuRYD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/jo4/36UhpQ9e1Py9uN4OSx9wxgt2ju40B9rClwT61Xl1u2ML5t8BYylvex1magynBxpjAG1M9GRDnCQuTfAyrE5ZUFkwQdu2KSfxN9RobkRYU5IxpypcpM/LEW+SC5k+yKLbDG27Jy0gWSXfKLMvyXMNeFSBdz1yKqWNLGI0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft6jMZGO; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft6jMZGO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43945763558so763948f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 09:48:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771523289; cv=none;
        d=google.com; s=arc-20240605;
        b=VKGBLTyLXmm6PKsPBdFRX1bjFLx6lV/D1XdxXiohwml4yICBwCllbDYE8/zGnjKEq/
         Pnw4KYEwvbd52YD79z/mpFp94kcg1ko5TiVokLHnnuyKSNIcpLHmQln8SY1autU0vrJv
         tHPbSbC4lX3yyvUelCYSJJQRE4qv7002mPdj3M3uX+eGQ9RTy/Qbs4ejYl8FUXn62q5A
         t01HaFugfvwpXAlFVIlByI6uOMdwE14x82vfJ0KdnyWj2uOo/80YjTMjjbkIgsq3FX2a
         EV7mNWmjAgYcLu1H7vPhmmdjtc6CzwXMQqr5QGIZCXH+dN7uufzlwthqtRq8fXFnbdU7
         QW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=;
        fh=dl4G9jSAS/J0+yXNBYERqCwW1YBtq8ZMZLcnJMTUkFE=;
        b=Gstlxs8gL1XUTh6Yu8TE5/eYlcEgOQnhXcPMcNAyFEOaQlfANFCmYrkN9/9cOArEB+
         sVorxABQp9EbYytXLAux7t+n8/iARSMkxx09axex6Tcvam0VSsfmMUo054m/JSlva4fU
         oi1xXT+6i9c05+1+mxM6pLmjl5Jt3SCw7uLfPqOdHvl5gScSpEx8IusJ01Elg5HwZv0K
         cdWqYKy/QEFhCw7skZ78/dE7JMF6PZznFUZrUqbSxr8I+bTqbGZKpNZLsjHpnvTwvNnO
         KxpHd5IxI1zJRitANRvzjMs0B5OZ6g0HhdymFGXgbPOrMc6273v8Ocl+Ad1R/6m283Lf
         LlBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771523289; x=1772128089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=;
        b=Ft6jMZGODzFMdNEkpgZzgREMuTADdBm53rxG96Q4S6LfKagXduBx6j8gBBkH4P+Vfv
         vavvNpvdK9bSO/fAQS322QgbIxWySJ6YN4ZFNpnUaSdRPxnVbkgw8YLF57/NWjUzFbww
         PN7kY9czZmd0nkuUF5E4umYYPt91q3u02J0pXCz2SsX8Egr+770ulgD5XFUOOgdAGm0J
         q9x2YYbBR7Kk5zAqW9oO/mvi7/+1VKfsNB/EdhYoIuq5E2s2qAiJbNPfoYH1L6ZVnL5i
         cFqejaAN/bf6UmNE3/0DHnze9ooc/Vdg8n4bYTQgoZQRzFt5XJCGGVh7MA1P89D0ghxI
         L6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771523289; x=1772128089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=;
        b=o3wFb1HuJHO6Om6BF/e+4FgknJam8yfQo8pAZqjb98UJbUgEWRc1lRRBaCO/OiylxG
         OFbG0nRrCexFEGqHsBzta1f96qu0/jBuRhh6ZCctef3bY0gPx8RaaF2YVYktP1aG/EDk
         moRmweLYmdZF7s/Y8K2v5923nLFuFD07/Qe/TGEbidgi31e+vhvFsyduM4agcbUlUttr
         N7yN09IMnmN0e5cKkzVypqB6ThGYGOpDNh8PaQyttvQDRkN/EPNMPnMmeOpPFz//BTQC
         kw1Wux2Vg5HCJWMv91B65L5R6Ul3teW4osHDBfCkkdhHygILNOMhE6C6ClQvtKDbpKlJ
         2fEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl9GZSR2c5Q5xZHMMa07GlinHgEPtE9Uo5ADwsfD0IiugZ17werAkBieC2+XNuFaJK/0oxQhgnayjA2Xhg5Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXv7pnRE9QKHufd/EXLRQVgVS7OhPxzDrXOjtzLLn2Rs/LGPx9
	WzzQnaPefTm4Lz1mMHdAClMVCFgmC/j8GYZlm84nQnT9GPbWfpxq1REkTZGls0XDEiweDgIsomJ
	DKRRtmWRwjYxppafmu590sVEntao9wPk=
X-Gm-Gg: AZuq6aJfKlCRn0WWkGmrVs4xE9bL9cxhufFdPL1i570aXTqykRApsKjtGLHongD7Rnu
	bEkdq+qwDnkjK5Fnka55ibqxiA/NIb5YnM5co6z2MOx6GO9HQJOwwr5LaR6LSq7qRZ2Tgo4UNuH
	wgs8HcZDAPQ2zEzEvttGdm0vzraSMCtecUbuGXHiq04Fs2pP8AtUxDg7rtruzgv1QACsNhU+pyD
	m3a0TGCca71394OEfBAl53W0jlAKL8U0UGF/6H2ltcSSBNrkZC2XEBYK34jSyAVxJpoWWVAAwqk
	PnyFigw1NkNOP+JQImED4L2k5BXbA5a4xkdN4SN1ljebCMehlVmep+wSXJGpyXSHll5xvD/nS0c
	nNT4xWbHzPZ+VwYTHUBQ=
X-Received: by 2002:a5d:588d:0:b0:436:369f:39fa with SMTP id
 ffacd0b85a97d-43796af9ed9mr39572765f8f.44.1771523288626; Thu, 19 Feb 2026
 09:48:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-3-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-3-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 19 Feb 2026 09:47:55 -0800
X-Gm-Features: AaiRm51ncUqJvIXG5s9TUaGOjPI7tmxDZZwdTCvAAoEMmGM4win76dnirbBawFI
Message-ID: <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
>
> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
>
> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
> X86_FEATURE_BMI1 (TZCNT).
>
> bpf_clz64() and bpf_fls64() are supported when the CPU has
> X86_FEATURE_ABM (LZCNT).
>
> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
>
> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
> instruction, so it falls back to a regular function call.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  arch/x86/net/bpf_jit_comp.c | 141 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 070ba80e39d7..193e1e2d7aa8 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -19,6 +19,7 @@
>  #include <asm/text-patching.h>
>  #include <asm/unwind.h>
>  #include <asm/cfi.h>
> +#include <asm/cpufeatures.h>
>
>  static bool all_callee_regs_used[4] =3D {true, true, true, true};
>
> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, void =
__percpu *priv_frame_ptr)
>         *pprog =3D prog;
>  }
>
> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
> +{
> +       bool has_popcnt =3D boot_cpu_has(X86_FEATURE_POPCNT);
> +       bool has_bmi1 =3D boot_cpu_has(X86_FEATURE_BMI1);
> +       bool has_abm =3D boot_cpu_has(X86_FEATURE_ABM);
> +       bool inlined =3D true;
> +       u8 *prog =3D *pprog;
> +
> +       /*
> +        * x86 Bit manipulation instruction set
> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instruction=
_set
> +        */
> +
> +       if (func =3D=3D bpf_clz64 && has_abm) {
> +               /*
> +                * Intel=C2=AE 64 and IA-32 Architectures Software Develo=
per's Manual (June 2023)
> +                *
> +                *   LZCNT - Count the Number of Leading Zero Bits
> +                *
> +                *     Opcode/Instruction
> +                *     F3 REX.W 0F BD /r
> +                *     LZCNT r64, r/m64
> +                *
> +                *     Op/En
> +                *     RVM
> +                *
> +                *     64/32-bit Mode
> +                *     V/N.E.
> +                *
> +                *     CPUID Feature Flag
> +                *     LZCNT
> +                *
> +                *     Description
> +                *     Count the number of leading zero bits in r/m64, re=
turn
> +                *     result in r64.
> +                */
> +               /* emit: x ? 64 - fls64(x) : 64 */
> +               /* lzcnt rax, rdi */
> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);

Instead of emitting binary in x86 and arm JITs,
let's use in kernel disasm to check that all these kfuncs
conform to kf_fastcall (don't use unnecessary registers,
don't have calls to other functions) and then copy the binary
from code and skip the last 'ret' insn.
This way we can inline all kinds of kfuncs.

pw-bot: cr
