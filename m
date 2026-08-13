Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0974836403C
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658679; cv=pass; b=MJVdaioIUV4KaLKwrTc9BNt7TofrvvIEtNuI0xqKU0JxQ09wC3cc46aYjLodRkaPjXB1Es+k55sbEwy4wOAi++1AKS9sG/ENP2RFPlO4Iqpiy2c4q2NrvTBagpMGDQ0Q5Xq/AhBx87qDwgQ/Vu3utg0dVGYf1LyBIKXm8mhe0xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658679; c=relaxed/simple;
	bh=+nJVwpFMXbMjPE1ueHu/52hziTr3b56pfhCEr1u4jas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJJImz94b6dWN3hHKmtf9lJ2WH8SjK7o7unFuYUYFpC/IBBlvAMBEkdnEIWn+6HNkBKzj4bFEtiMMolVkr8q+pMLQnVhbOgo5glUcizPeDe53uKpL71FL2xacYHsEs3WEj5vDcMkmbYWr/XtUyOfoZerpVwXkkEKTwpqP++13RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uodc3msm; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uodc3msm"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca7c1176317so274101a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786658677; cv=none;
        d=google.com; s=arc-20260327;
        b=UECf79ioCGjIaau7/llCig4bSLqbEeU/1Xit6XOy3W7V5dKKuGJYcY2s7AgniMV+NF
         69qBzydEVFTJ3xd9ti9JejHLqZppqhKwjKxwtUm9rXp+idkFuStmDqjrGWcQC/+koqRr
         uy/dmFuXxdTmbAtPkge992eyXOtIyIPhc17o5Oqqis4UynKkw6ymusBtDECR5ocs99Gz
         i+HfxzIxEaDuyrSj/fTPM5DH3yAOQxqFXaghOuDGT4vhACYzFBUno+GiUGGh+eDkQkMm
         2If4qzpjxH2bCxrsnwRhtG1xQuE0/cCi/t+eZM8FFRcvkc4fh//uSH7WCmxCpmqxSOpp
         7CCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XBjlbb9xfnyRrsn87ZRRTDGluqDs+J3ckgA2mWnKvPI=;
        fh=ColD3Y6PEsfKVSLwOHCdIAeX9BJLTFub2nJBpnt/ZfQ=;
        b=kLZjJrm5G00UFAYykYv+a9okEve2aePunOZJ7ZmaYvTPTh/49cAx134SbCg2JiX1bk
         DSztaCoqKwTMEROzx8C+qBTfH1YvWuqbTp1hbHkQ1dSoUFPZNk9K5+UhKtyswmr1R/T+
         6F2Qjib7Nubie/bravAn2FN8jiaMSYmkC9bKe+j8H6OiM4kXOXcR4XfgLX64UmMaC80x
         h0UZkdtBRipMiHsM7e16Q+eIBd0QO2H0h2+GqwNkldtEMoZjMGbTIdgAFtt9BGJ9QwnI
         ksff7CDqP7SfpFRVi7mfPTEN11cCggAnhimlg3h5nq6OB7Fsgbg+mIuXJpMQKWYHw8h8
         Hxyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786658677; x=1787263477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBjlbb9xfnyRrsn87ZRRTDGluqDs+J3ckgA2mWnKvPI=;
        b=Uodc3msm0IhpYSQj8VX5kovwarQak0zWiB/9IgNLNosdzdKvi2WrB3Uf2GCxS1QiYa
         7E8ILtr8/gBU/JI+kHVgNqEAyqnog40JFkEEx6EIc0tKMCffuR2s3Ppec0SV0Foyi3C/
         hK4oaTIlwjpd7QZWvfuAF7jLYQU+A3GG5tuYDdP47Xic5giy8V4n1H83fDpp9VxD2smc
         I5QMchWfUqLNQy4pIKZNo3yQRKxPblIxt8Nl0+md+xDjdNRyifsH+4Vw8VtWPCUWG1Zq
         zVCfVtQ+vlA04FQ0G4y+ctnOuX6HegjNDgeCyWCcbBpblgUhzSYSgnbHgZkvjSteiP3q
         WY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658677; x=1787263477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBjlbb9xfnyRrsn87ZRRTDGluqDs+J3ckgA2mWnKvPI=;
        b=K5DQt03YsqOiSBXXdPHFwZ8XfCxHF9bE5URb+D6Jd1m2YeJ5yqybT5sRLkz0H2oTHG
         M4RlFtSs/UBvFmiBJq4uVSk8UmZYepgPUwTgXoXdqnVbnkhZVp5Yx2Qu6oD4/2GbI66Q
         di3nDQXUENrnbwu/hWbEEgMbKolW5CCsUUQnkz26HEFQvd8mKYEgvV5/QyZjkC9YXpJk
         xIrE0yTL9k4xAP7eQT8oZtAucCXFxNePOjjCt8RMRPPz/MhqaZ2qa8ZWcIo5fgbHReo/
         WvI0C+QjNe+z47pTrIgLH6GfWW+0PS0aKDvec4QmJ+80jdmtVqKHowa08nwO7cQOONTX
         RLDw==
X-Forwarded-Encrypted: i=1; AHgh+RoDwIwJcH8E4LhNQVrUsDfRUiIWbqLsWoOgeRA2h28eo0jVY2lL9YJyTYFZ/pe3w6jlfrlczRiuI17B32JGh+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLbsAnFvTAYw+evxB1RVLauUy27HQ2RWOOP/8lfWCLnGKLaKj
	fb8E8yUzmiiICYFYWy14ZFWZIl2goEODUcYY2Ko50Jt9ZzVpmwtNVAkkMIGNo+qGAEQXGXUJ9Nf
	oI8nBKzmTwkpk9b0CvsjuT1bZo5k8xEg=
X-Gm-Gg: AR+sD11M5K1R3BkJRqUm2QMbXDX/UgF5QXhrYUPRDbMw7JB3B4atPNRYCk7vasSOqF0
	cFVWuLHlPlbibbnFZScxPw0jozEaaO7htZjTXnBfw1126jhBS7UXi0MNWLrh+kOGOXuNPhUMmTT
	t/h0XKd8aUHrEk9YwX4IvFnylZvbMTLsVtQSc/zDygO2wYXxCW7yVHYqTts3YL/4UC6elw2Mtpq
	xEWbMMepnY/O0M5xB9NSQf63nbgNwN33fV/bJ/rvvWSUnl287r7QB9eFruulO8HR6RXSwKrdk8/
	FTxN0LtREhwMJz06m8GbgnogRjFneSV4MJ25+97kWCb7JMq2Oz0v8dT4PpPTrRHIvMvzcybJN7H
	svAZaVyF2fX6BOBfYDrHPWFtWDZ1fK2/jg1/NbKjeHg==
X-Received: by 2002:a05:6a21:33a2:b0:3c4:3321:4fe8 with SMTP id
 adf61e73a8af0-3cc71be2ba0mr896598637.14.1786658676974; Thu, 13 Aug 2026
 15:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810055709.729203-1-chenguang.zhao@linux.dev>
In-Reply-To: <20260810055709.729203-1-chenguang.zhao@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 13 Aug 2026 15:04:22 -0700
X-Gm-Features: AUfX_mySmBbuOKMkZzyA6luWIOwiLVFTaBzYxN1T4Y0G-POAuGd72b9d5snmCP4
Message-ID: <CAEf4BzY9YaeT4CssCe13uAWXYHXs6HervsCo0Puc0osfr8=yVw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Add kptr-xchg benchmark
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, shuah@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	chenguang.zhao@liux.dev, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 10:57=E2=80=AFPM Chenguang Zhao <chenguang.zhao@linu=
x.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> Add a microbenchmark that repeatedly calls bpf_kptr_xchg() from an
> fentry program. Architectures that advertise bpf_jit_supports_ptr_xchg()
> inline the helper to BPF_XCHG; others keep the helper call. This bench
> makes it easy to compare the two paths under the same workload.

but do we need a permanent benchmark for this? Is there any valid risk
of regressing performance here? Unless there is a good reason to have
this benchmark readily available for everyone to periodically run or
something, I'm inclined to reject new benchmarks and minimize amount
of code maintenance burden for something like this, sorry.

pw-bot: cr

>
> Usage:
>   sudo ./bench -d 30 -w 5 -p 1 kptr-xchg --nr_loops 256
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
> Example results on LoongArch64 (helper vs inlined):
>

[...]
