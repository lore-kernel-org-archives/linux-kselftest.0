Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DF0274FD1
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 04:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781498138; cv=pass; b=JtfmfJ6cIRsKaNTEvel1Dan1b/eoQZ8V27eLJwIcbl1qd+Y/JKLtN5blAmz19pNAui0wnqwKURDiXGKA9WYJbsSjxtYPOZyVL7zAWd1/MmJNJebEq66s/R0/lzdedQ6IzHJL0ocpYPiBWuL+esJ5PToKIXiK+i44azed7NDFEEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781498138; c=relaxed/simple;
	bh=kr69be3ayWAg9sIFtBTykti8WXAgb/Wv3JT797c4NMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzDxemEiglDZDh7ccHXidDwW/aUHdBl1k1+OqFnNU+1jgEleVIXqAlLEUrwyZP2zgzgSqiu/AujULCBpkKPyccltV1TKSCfU6w+MI2VVtiFjxCcn1gb9lIjDznIixFi36B3J1PS5I2NkAPZbL8dSk9svYqS/tV5G5KR5ptE/sks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FL/zxuTQ; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FL/zxuTQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso1633512a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 21:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781498137; cv=none;
        d=google.com; s=arc-20240605;
        b=DaiOrmR9K3GS/mVXTHZ4vZN3J5JAbYLGHvAxCFQSDA5qnuBiY7NlFZgXjHixehRIBL
         XAq+5AId4rizoPA8JKghAI3z0r/5DHiAz6HVQz+fN4/Qwag/cKs6QzCU2UbGB0U9tV1S
         Wdd6U0OjupbHiSR23Bn68U9WYnAzDvVCfclY5pVJClajLb/yZBJABX36XmsUQr/JgeUv
         /1h673Qa2i6ctYk5lh96NRCajn9MkaIQCiS1bzTfkzzKH2QycWARVR6HkAFsRlD1ldug
         EICbycMGMugc8jqtQQH0sW5SPmGMnXPfhWMNoc20BKudG7zD/BvPk20jBz64tlziUJwr
         MQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kr69be3ayWAg9sIFtBTykti8WXAgb/Wv3JT797c4NMs=;
        fh=dSjR//E0s8bqm9myLNFscwertsxK5c50cYUjw6pXfQ8=;
        b=MDiGBhCh5ZFj4fTPBtQ3nb0aFAIJTtKTXDiazWYJ13NAqLe5D/VtLdcI98z+dHToYZ
         pcfQP/uY6k008uLhyYUcdJ+oYU8iZX5nNC2a/ZJ4AdY7cx3iLtusrOgZy/Zn/WzhWzuT
         3co+KNJIA/cNDSz6fOaPZPXu/9Bybilu+WZmc1FWeEbO0Ahmu8QmFOdoW0ibkYCJoosE
         XNjkM7vZTezGuWM1VE8OVkNXz0LOjmK0nRYdnoueL/oeMiKbbKJASxpIn5WfBEtRAui1
         78JI9uLiqx18XkiQAeuu+Y/hOTbjgoNYB5+iGIpgId6Q4BkoQEuc3BGcpPRZVSsL4jEa
         adew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781498137; x=1782102937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr69be3ayWAg9sIFtBTykti8WXAgb/Wv3JT797c4NMs=;
        b=FL/zxuTQzxfYR/GES+gSClPZ0VDDeUr4phSltscsM0dqVmv87Sjv6NxwcpAWdp4RAd
         D/wGUe8a1YSmlxChBX0+4pUA5cO1HwVZt3U2gBlVOGfJKNk0qhRWulkVUkQYZOXGORSD
         UZ+0+E08iguuvZyxPW1GKpxPLQ34OvXFHRwrVPTdSpcQQYC+Hx/7VGnWHPLpNmfv1s+F
         jrUPqkpJBIP0P1B9Vngs251KT8/GGyvTxLAiSXTH2204tOOHOBgJyVenInGwRKv8xAZO
         eNKDwJOx1x/4FMYle5CUQPpWgs/dkDGYNM4Mxa4Erqez3RblNTy9HrsWfrUSRHCNxnHM
         rlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781498137; x=1782102937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kr69be3ayWAg9sIFtBTykti8WXAgb/Wv3JT797c4NMs=;
        b=rQEt0aRp8WGb6TBiQb470MVwGExOT3E2Gds/N92TRWqel0yYyHCeJ1zpiyodpsPWi7
         r2AFhLLCGfcU1zZuUPZihmAqc+1cls9byucPdI4sg88v0TWcr6QdkXz4JKmG6dfHM4nU
         FBqhg+zcm0ECZXOKiBskpbY/u8v21ovIcU0e2nGiziSlSN57E3L3OgrJqiVR9qRZJvsZ
         V8TmD3lRU94UinDEG6/iQK/wVILTf9pJliIvMm3ek0KwlBXOkRRYy6K30N0GTo+OOJIC
         IXsn9uq1SobetFAWpVjOPb/rg4SMVxsNFx4bfhDkYwTRpipfmnkEWy/GYeb0XUbvIWCh
         quTg==
X-Forwarded-Encrypted: i=1; AFNElJ+E7Xzvugq2exVtrFcijQXUvbq4G8xp0W/CfEavxm1kPyowCbaLzEFLJsyKsOtRyoPy2heUcJ9DgYo/V48AMxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeAJsuI3PK54LWtU24P2ZI+pUh0uoabaZiDJ96x6DDv/BdPRM
	hnJs0Hb/knk0l3SsLFc8tZvJYtDd+WF0IOGiZufO5LBp8X+EL/AhglqqUgaxp6h4lYyEYBl8Mzw
	DcJNO/Sj3rKsK3tGF9fF6YkU6szZVcNQ=
X-Gm-Gg: Acq92OFQ6gva3yXE1wU3vaMQiMsdbnsgBubT/+fgW1Qp1DNBg4LqAsAr1BIvs18bDgR
	lgtLFl5hx1Ng1gKyJQqQan8L14zDQtBor+dT6d6eBoeMFsDm7kaudjCkXh9s7j/2L177hSFVWMK
	HxxYboHbpgh4VkD2pYdUmiJEYjjkTVJdk236giK/QIG7npAc+b2/a/7azvyZFmh7NjAwNs7xVeu
	VZ6wFickGzZb9rj7BtEiEGY1DsyMoY5UIlrYBO8La+YwrojosnwtJlAgcycenkllVBKXltadHO8
	zV5L+heGM/zlnnw2/62elP4pv6+KIZ6/PRe/CdgDXHzMcOrMBd0Simh2i1fvOfMBHKj5RKDG9xI
	brlDjFaDQ7wEEmBGyQMXrldB/
X-Received: by 2002:a17:90b:184b:b0:368:83e6:ca95 with SMTP id
 98e67ed59e1d1-379fee6a86amr13337116a91.0.1781498136914; Sun, 14 Jun 2026
 21:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614163352.1060813-1-find.dhiraj@gmail.com>
In-Reply-To: <20260614163352.1060813-1-find.dhiraj@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 14 Jun 2026 21:35:25 -0700
X-Gm-Features: AVVi8CeSjG5b0oVhd8RvAHScR8HE8jXbxyorXU7-8c5VKOTa6az8Pno987o9DGY
Message-ID: <CAADnVQK5XpDAnqY-x6DNBYn_bK42AgayT7A2Smxvs1v9=0RzBQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Add arena direct-value boundary test
To: Dhiraj Shah <find.dhiraj@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 9:34=E2=80=AFAM Dhiraj Shah <find.dhiraj@gmail.com>=
 wrote:
>
> Add coverage for direct map value access against BPF_MAP_TYPE_ARENA.
> For a one-page arena, an offset of PAGE_SIZE - 1 is valid, while
> PAGE_SIZE is one byte past the end of the mapping and must be rejected.
>
> This covers the off-by-one case in arena direct-value range checking.
>
> Signed-off-by: Dhiraj Shah <find.dhiraj@gmail.com>

Sorry, not every branch in the kernel needs a selftest.
I don't think we need to spend CI cycles for every future patch
to test for this unlikely regression.

pw-bot: cr
