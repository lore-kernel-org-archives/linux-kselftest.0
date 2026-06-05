Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407BF3B71BF
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780701764; cv=none; b=C6sLBYrsqu8OUcQXh2/NwQhcmtgX0DFClv5nXE2IugSwWbeWobcws8AJ9meSFO5RRGszxFG0T9oHo2fqwTp1oiXgYLieqggIz1nnewhmt56JRUdlTAIjpEnwvDrwY6au9mMZeFhbZ8zyJXkOfbwYl8BToTtcwvbwJeo/uKFB+/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780701764; c=relaxed/simple;
	bh=+5eZIOiTkTTm8e0Em/sbC0u1KG8mFxpCqT6763nvZZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XEYfPbEiAj+OQEwWm0FGVZ+rtt6RkRlnznVzlU73PwR8es/C2omTprX7UhbnUccsWLq3+xmlz1mauGlkmUzPBm1BGjVH+Oj5uMJA+HBzJDHrXaKntUnEesLNs6JFO9L7SbprgEzjKt0qNYjy9fkOeU16cPvEbWLso6kwVlOzm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wklcnt+h; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wklcnt+h"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6f586a0d5so1139074a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780701761; x=1781306561; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=;
        b=Wklcnt+hU6Bjl3tdyqqI8j1t/GGH2HX8gIGW/sjKPmdKxDPEq12RIt7a1/hfk/fMXv
         QsHoSEGYyAuxUf6BVwhB75PZhYY4LANP6XAZC3OkiIQEuI0gKRVkEWTdur4Tjbh8asrO
         40eLEJg++FgAPp586dGpwaTk0iPIaJ84hS4AVC0e34J/MWAxIQXc9OxYWxWqKh+K6HW9
         NeLLAOAhkrjt3RWRvD5xmCp7T4NZYR7iivsFyKwrYKJ8bD+FIzP9J7Sq1ua7LuwdC0B2
         HK/HSpduok2/kkJrqgdbx+vZFd0vdn2g1H3a4mZyabbFjvfFL0dwpIkqcaWTcMMWPKmD
         wqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780701761; x=1781306561;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=;
        b=OwBAJ0sEb7ENZ/J3pzYlG0P3rlDnQDT+BKrIefdKHSDgMhI/4Luc0wxeZAZQclrV4W
         jvVKWrxey//7eaHciy0z8jq3sPX3zNiUa7jzygo4fB1dmzd9sLh+Dx5A8SweHR4utiHI
         B/YOJnM9OrN1eqqjmud1/fA3XkDA5IcGZNdpVs0y6kIVl/pEZm5b4AyGPRhT2GMUTo8X
         LE08fGu+wKKp4IiFJ91kxwtEHm79zUckMLygghUUP3hk1LSrY3Yv++L5re5C6Tr7hGxe
         beQKkfNKZdTQIt6r4g39TbcI14FGn8EuQU6+C6cU/yoz6bS8KdLaijWzkkMOdQiq66u6
         t4UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GRBjmNbwQGVFoSJ7gNtrB2iTljq5hYB6vztjnHsAljov09J4p1z/ojhGC9H/zjA/E+KNt2pA2mWBYclSBaO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDhXAkpqU0VikvCwJb7ecy1WsoThElWtM3491UcLruAOitdbi
	jyAFcTaK5G8rH4bMAAs70NXYJXnbJYYZ27C8SmgxanAhxQI2XzIZLa4v
X-Gm-Gg: Acq92OGHXWdoCsBd+8urSLhePtDuWsXb31h0jUtBnmHNY6cAi72zPfuADALtqC1yg8q
	HhQ9Du8RYzsDNM10IJt9iF8AJVZhzmPmeCZuV4Bnk2jjwMBdf3skoBmYb1cDRD7gTzGzacfp3nn
	N0mV5XTHagHkqGz0CrzkMu69Oliu7fJge8Cwp8XoWDM94iycxZ8JrbufW/AOHXax0P2EObc1lXj
	yyE0y5g/o5FMcHWllkLbIP7BLdSs9fa5fbimdnlGfYqqJoKdaYpQHefoGS9lOiy+B87ulQvZxsG
	8deaSuZJ1YIN0tBoydWqrhifIs6KCnlOhzSZBolKK4iaLP/yepYR6tgVsV4owevvrg9HgSg+lqj
	iIeg4mjmiNbLh0XJ6BdziyLbB8jt+y2peHjm70wlORASHnB7q4HZlMq96s5G+AfXMdQTdcEI36w
	yuhnzrLtuDH1wDMAi0nmR5AlHJadFk2UONIMP7wQ9j93Nj50MYwShjgZqlSXmA54rnmQCL1jh6+
	odcXDdGAA9HmvljN69eRjcDKebP
X-Received: by 2002:a05:6830:82bb:b0:7de:4fc6:a588 with SMTP id 46e09a7af769-7e70ca7b3c2mr3388171a34.23.1780701761185;
        Fri, 05 Jun 2026 16:22:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4d::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e745fea5sm6605643a34.5.2026.06.05.16.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 16:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:22:39 -0700
Message-Id: <DJ1I3B2TSXSL.AV4PS9YH714@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf-next v2 4/8] bpf, x86: refactor BPF_ST management in
 do_jit
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
X-Mailer: aerc
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>

On Thu Jun 4, 2026 at 1:22 PM PDT, Alexis Lothor=C3=A9 (eBPF Foundation) wr=
ote:
> In order to prepare for KASAN checks insertion before every
> memory-related load or store, group all BPF_ST instructions that indeed
> access memory in a single block of fall-through cases to allow
> instrumenting those in one call, rather than having to instrument all
> cases individually.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 53 ++++++++++++++++++++++++++-------------=
------
>  1 file changed, 31 insertions(+), 22 deletions(-)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 0981791014eb..943a0f315cf2 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -2300,41 +2300,50 @@ static int do_jit(struct bpf_verifier_env *env, s=
truct bpf_prog *bpf_prog, int *
>  			EMIT_LFENCE();
>  			break;
> =20
> -			/* ST: *(u8*)(dst_reg + off) =3D imm */
>  		case BPF_ST | BPF_MEM | BPF_B:
> -			if (is_ereg(dst_reg))
> -				EMIT2(0x41, 0xC6);
> -			else
> -				EMIT1(0xC6);
> -			goto st;
>  		case BPF_ST | BPF_MEM | BPF_H:
> -			if (is_ereg(dst_reg))
> -				EMIT3(0x66, 0x41, 0xC7);
> -			else
> -				EMIT2(0x66, 0xC7);
> -			goto st;
>  		case BPF_ST | BPF_MEM | BPF_W:
> -			if (is_ereg(dst_reg))
> -				EMIT2(0x41, 0xC7);
> -			else
> -				EMIT1(0xC7);
> -			goto st;
>  		case BPF_ST | BPF_MEM | BPF_DW:
> -			if (dst_reg =3D=3D BPF_REG_PARAMS && insn->off =3D=3D -8) {
> -				/* Arg 6: store immediate in r9 register */
> -				emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
> +			switch (BPF_SIZE(insn->code)) {
> +			case BPF_B:
> +				if (is_ereg(dst_reg))
> +					EMIT2(0x41, 0xC6);
> +				else
> +					EMIT1(0xC6);
> +				break;
> +			case BPF_H:
> +				if (is_ereg(dst_reg))
> +					EMIT3(0x66, 0x41, 0xC7);
> +				else
> +					EMIT2(0x66, 0xC7);
> +				break;
> +			case BPF_W:
> +				if (is_ereg(dst_reg))
> +					EMIT2(0x41, 0xC7);
> +				else
> +					EMIT1(0xC7);
> +				break;
> +			case BPF_DW:
> +				if (dst_reg =3D=3D BPF_REG_PARAMS &&
> +				    insn->off =3D=3D -8) {
> +					/* Arg 6: store immediate in r9 register */
> +					emit_mov_imm64(&prog, X86_REG_R9,
> +						       imm32 >> 31, (u32)imm32);
> +					break;
> +				}
> +				EMIT2(add_1mod(0x48, dst_reg), 0xC7);

maybe it's an opportunity to cover this into separate helper function?
When indent reaches 4 tabs it's about time.
