Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8632470E
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 23:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780701639; cv=none; b=J/+O/RX0fRhKFSaVSz7eXHFIK+mLgMjIdYp1pqmNLUndAailVXt/vG81jMU40UYWDkPzYJQ54NdinKnvji7e9K8tI8ImZkCv67Q8KFJt8u7Vzre2sOGEeiNaV/FRtJKYbB5W5UeaecjcziorZVbVKftWeIK4zbueZRDpmLI6J7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780701639; c=relaxed/simple;
	bh=nug21V64ITKbfvSbc40LYsd5QGvDEPSkFhsuoGGRZYg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=RRlQhRLsG9aKvSl66mGsDotCf1uu9SwWUhUHK5+t7FPOfiAna+/2eUpJxFW9WS77CRxlGPjjTkM2JnmL9rRyGoCiydkEJ0RPE2gNdzqWm9Ho/dwj7DiZ46hjKefify7O7fckzPU/8mkwJJ87BL5FTxuFLzRNV27avubNgYjixUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdg0/7yy; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdg0/7yy"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e71dd64ea2so140135a34.3
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 16:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780701638; x=1781306438; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=;
        b=rdg0/7yyegSQt2OEuyAmZjUCK7zB031d9xyyn8/HAkzG5iUCcuX1s6Lw3pD6utR9LM
         +7IfmAp9yRcYYD9lz6SEUd0weEJdyGiYUdIroOWtgKIa/FFtqR1HJlwUP6dx7YdUcDBU
         HEK5rqOp5AFNm3krducr/eVPTi6epgRBzWEWR3sj85QF6ZoyEhmmrUtbalz7etCFzu21
         W8rByq8fjkAXOp0XNoTJUtTVhG4YVX/B3Fn+5t/XodRZ3jiDEFF+fuEjyJs3gvTRfrsB
         6ydRiQCf43TMFAs1AtDJaNmlwQdXpDJ8LyognfFZV+r1Cly5oIvZ3/kSVRh2+3+yLxW7
         X6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780701638; x=1781306438;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=;
        b=MJOYXjWdlcRFODoaQdPDfKA+t0pzC0Sw3Pq2uJ058TYtoH7QwPEJgcNTGN8ZVqLxwh
         DqvpV87Q0NT9HEwh0nlfEf1td/E0enejmn4wKMgLzRsecoxjhutlW0qR5pp6nHJ1GSop
         A1ynIuYDfn9VQIOxUNb/qP+xFQQMEg/olrgQHAQl31pO0mX6uCU455+WcgN0u9fTPLTJ
         Wbm/rGtRqQVHK50Aui2LvfKldU+suvqmLw4PI9ZWkL5+1Sn3y7XaXY6SbYM4bChmkDuL
         NjPcvwxEherVKnMzChYObGJzzqc5lvm2iy1NgUX2sDk3LAZbjgfIhErTmyQWrKSec0ir
         Aa1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9o5Jj02ZWyvD5mQXpGtmUQ9/JZPtk22IsANAMiaVOgstqWzqMsy1QwQoy2880EZu9DdnhDgX0Uki39rRunSLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DLRTMvRjiCFRoxDqx2K7cA6oj8NYPRDIYCghpdk2dzwDRE9b
	m0+/A9FKS+oFWIFYWU1YCvUL/zIdR3If5qjm74vJEXNZ9RdS3oveUwj0
X-Gm-Gg: Acq92OHNrtNRI5HT7pGcV+RygQYdyF2H5L3UZtR5W8MMjvgPdZep+oAAvuavc2YXCIJ
	z6K+oEDORnqztnOIT6K2kIF92WUQAiYxC0CqDEogGGMCiZta5Er4bAafXpsmAuaxwxeBh1MrfNf
	bY2A07dfGu1nQwO5uouUc2pknn9ELw+tr+N6KUTmMWOk/4vu6nkx1VgGrH6LYWE5A+/75I3hg8A
	4w2Qeb7OSF0vtE5fOnazzBkJdQ/psmLBTto1IHYjNFk9HdPbuBlqXdjbrb+b6LgLP7PD6wGRTHD
	drIIgTWNCc2+RH6JQy30OSElfV6lfh3ULM+dooemk0oJaVSse41N96pMK/NWgzD3rjsA5kEdrt7
	st/3SzPyB6rsUdXX+ze4+ejoUFCQbjwOMXPg1iqA7pVZEI8LQWx4etk22Bz/JNNGb0lSwBQQwtf
	taiarFq5aaz5kb7tC5Ea87vxt3G0p5G8gqedEeCVJa/XZdrYQXJFjYbUnGzW7sU6G3DiihYTyuU
	Bpz2eI9qrXQnb9ZfTURaMJ/zo7v
X-Received: by 2002:a4a:edcb:0:b0:69e:40a1:5fd3 with SMTP id 006d021491bc7-69e68b1b820mr3057943eaf.2.1780701637605;
        Fri, 05 Jun 2026 16:20:37 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:46::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8465e00sm8002361fac.15.2026.06.05.16.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 16:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:20:34 -0700
Message-Id: <DJ1I1PI8PVFM.3KR1GSL838OMF@gmail.com>
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
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf-next v2 1/8] bpf: mark instructions accessing
 program stack
X-Mailer: aerc
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>

On Thu Jun 4, 2026 at 1:21 PM PDT, Alexis Lothor=C3=A9 (eBPF Foundation) wr=
ote:
> =20
> +bool bpf_insn_accesses_stack_only(const struct bpf_verifier_env *env,
> +				  const struct bpf_prog *prog, int insn_idx)
> +{
> +	struct bpf_insn *insn;
> +
> +	/* cBPF: we have no verifier state, do a best-effort check based on
> +	 * dst/src reg
> +	 */
> +	insn_idx +=3D prog->aux->subprog_start;
> +	insn =3D (struct bpf_insn *)prog->insnsi + insn_idx;
> +	if (!env)
> +		return insn->dst_reg =3D=3D BPF_REG_FP ||
> +		       insn->src_reg =3D=3D BPF_REG_FP;
> +	return !env->insn_aux_data[insn_idx].non_stack_access;
> +}

Let's skip this function and cBPF altogether.

This effort aims to catch verifier and kfunc bugs.
cBPF doesn't have normal verifier and has plenty of unpriv gotchas.
The kernel compiled with KASAN is for debugging, but I'd like to
avoid thinking about unpriv complications with cBPF and KASAN.

