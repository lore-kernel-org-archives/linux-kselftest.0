Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA971F12E0
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861053; cv=pass; b=XJDhmWm00fUlcDgoNtbMfNZdV1dCOulkkR80oP5I+8DLyU2nSaMveBZyUIlVrgTJvjvF3pzaJHiCeRt9/zr3hFb3ORHEaax53eDAjIoQmAmGjKYrzxOUjnZ88aSf27x7SsN6RD9O4u58DgfvHeJEU4ug77cw4S+cspVTKYS1t5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861053; c=relaxed/simple;
	bh=N9VaTXpJcAFUMLGUpQQ/AsHV0xjic/FqepdABw0OE+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SouLJguXvgca6QFvkejIw+JriVDLhL1VE0M/pezMYrzir/wEK05MDn//E51SqigvoJwWKP2p+cgy77XxqJxZC83qLASrr5PqedUcDBezi1YsjqY2RDGF007BfUnwyHqQnC5Q6Nqu6FxBv/MH4X7RbxJy/DFIXpLjc3guo5tuPI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygo9WDmb; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygo9WDmb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4362507f0feso3860699f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:50:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770861051; cv=none;
        d=google.com; s=arc-20240605;
        b=YSAd69ZyvZIk/Tv5ar/Vm/4BbtNWi0KNrhkGGNVtKZXtGjzZzLgMvU3Z82SiDikpiw
         SEJIHD21U53/SaUmklhARP/AInWHtQvFh5j5pk1qYr6CIeYf6GMb077S+cfDGbufJbdM
         +FopmLeUdqMyVArgE46zcZArnWE7z3CUT3iGNHeU1QnXth+7/STwtE0vFwGTsUEaE+y2
         WsFI1V6a5lFKFEi4r6q1oNm74RgipibuqEHxhyE4sAbBgIS05LzFH5H/6hNwu/bBSH1H
         hsXX8tgHPAXt1FZPvaSlTIAsbOgkyQ2VuA8Px/GURiPVXqadccKc+pR3hkUrOZkCccF6
         6zsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hW1jLKEJu2CXzvb9NvuLQpt6Y245YIl4LJuVa/TdN7g=;
        fh=oAuEacJdUMxQZAFws2T36OhiFxsY8LFclhEfnsc90ek=;
        b=kFvn+ybhvO9+JBGkpl97laSSt2s0sUAI/c9e4dP6XYHvJNVtE/8gpjZVhL9jOk+3MC
         VGgPwU6s5ZgTlne2xntQQRG4tZcRJELU6kZuYlg8aMFfUoWc0H3sb2UTKmBjt1QarYRR
         pUQmo5OY6S0Zy64UJ1c8ajmrF8jZoIIBx5JBW5uywaoF74IRH5Bm+VI+3lLCdpG37ckm
         6uV6gM/qoRHamOyGx8UrkFUcW+XxYfP9dystcVktvRdnXLhwcAPfHGxzbbcjKh498mcj
         Wy3lJ8h+k0gO5KQRxMHXW5vUegiVFSm4GpukY90j3gLgSdAtVKto8jX43aTkFMOuZYAR
         HNVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770861051; x=1771465851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW1jLKEJu2CXzvb9NvuLQpt6Y245YIl4LJuVa/TdN7g=;
        b=Ygo9WDmbgpG0tPmP1YQ1Ze8i0tVxqLOLuId0psVOA8+TSIczvBi6ZntbI89JKaPrJ5
         dt6ko+z/Bkgnd2M/bbbqvu5lxuPBEVPsyb3wsIHp36mSl1ISWh3LdXLTbjrehg7/5/7N
         l0e57Acl3y7xaz+eG3ivAlzLYK/b3xdtxRRE9MBn82UB451Hi3zM0DSsZIUB6Q7Vyulp
         WJFP33BMuncVXwXkIIrHhXCy4sAv5AI9BTnaduxiFHrDtuqJmGA8tmsO8y9PnOONDo3A
         lYrPQSUBA3FcTPlHjqeO7T4RUBm+B19LuijXkKG/RdFJQTgSqZtFeM8OSVA2+/f2cpY9
         dPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770861051; x=1771465851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hW1jLKEJu2CXzvb9NvuLQpt6Y245YIl4LJuVa/TdN7g=;
        b=l5qdV5jH/AOX2eUOraj1YVgWrTSISOnJH0RKlI5V4RU4o8nRHHYn/jVvZzLPI75Tg/
         Pt83fbnXHhkHM+xyi+Q8BUuHtgVOcWJ2NyxerRPQSQpRPx1iCmCy6bZerVjmV3Zq4s1p
         Hm16jUlhdtCdaztyVMtxwXFdVUjTXRn610IgjFRxDyEzWE4W8xN9tvK+s11FJGKgip5I
         4jST+J434VuQnQblHUZom2ayhtKduLZ1r1ie1kZdM6nL2r2LLIkSTxiWqLLQxIzPw2hs
         0Jh4rAc04yYe6pmwEWSpYsrd57uSG0q5QHB5Mw7qcSTQjeEXOOZEuhQ6s933yXH7MMzD
         ZNIw==
X-Forwarded-Encrypted: i=1; AJvYcCVDThuf5hc+8/J+rdJfisWegPYSPEgUYESZOYGMMMKtOc7iCzZ34Hu+THdCynvHzjtFkGuzEORpKZp8ofOKoVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzejRZsNoiE/Qk7sApYzDrZNIJeBMwUzN/D74AjJZiL5UZmkPj
	XBzuKD5FU0ZvVUgtdtfzqmor7J9pD+5ujzKMtPDITTl5xl8Z2L0Tu/HIIhjIdIty/mlnNSbiKEv
	S3ZLYSbjfRdIaWoUxyKDqhACotpEremE=
X-Gm-Gg: AZuq6aIYorZ5yKEPcYnK6+VVzdu2E6w2a68cmyXUYPYtcCAP+9SkIxd/nbe6WIeDDbp
	lq9cIce/lpeWLSAveZXA7qt6oKKEuGtFuDD11Xx/htMCN+hFUx6KeOUk+TDrOBZ7qwUxUQs+tTf
	E5QSN+XARUABfhh20gjLeo/Jtw2ruFGWKtSRpg8XcubM7IE9v8AnA46xgCmkaEknfMpSew77dCe
	E3eKLeRALr2N73xB7ZwfDPlHSOEuPevgy+FpcIRBxUVH43cro/qp3f50Eloywxh/NSbSTnITB5A
	0CWh5Xr0U5pwo+RgF5WFmmkaWloaI73cywux16eGHZ1LP3nZwgmm/wT6jGsVa+H+ttKtspEWc3x
	wkVs3pTt7ztSptoxBmjOkZhzhXw==
X-Received: by 2002:a05:6000:381:b0:437:8941:2f7b with SMTP id
 ffacd0b85a97d-4378aa127bcmr1990471f8f.19.1770861050874; Wed, 11 Feb 2026
 17:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208024846.18653-1-pilgrimtao@gmail.com> <20260208024846.18653-3-pilgrimtao@gmail.com>
In-Reply-To: <20260208024846.18653-3-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 11 Feb 2026 17:50:39 -0800
X-Gm-Features: AZwV_QgQXArdtIYEmbbcfD1bwDb31voO5uw2pqH4zCeeZ4p3zxbpQkEHhdgexR0
Message-ID: <CAADnVQJdwqeoqi+mPjQjmNbUqz2RxAjq-dVsGb7c_MCqpqmwhA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] bpf/verifier: allow using bpf_kptr_xchg even if
 the NON_OWN_REF flag is set
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 6:49=E2=80=AFPM Chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> When traversing an rbtree using bpf_rbtree_left/right, if bpf_kptr_xchg
> is used to access the __kptr pointer contained in a node, it currently
> requires first removing the node with bpf_rbtree_remove and clearing the
> NON_OWN_REF flag, then re-adding the node to the original rbtree with
> bpf_rbtree_add after usage. This process significantly degrades rbtree
> traversal performance. The patch enables accessing __kptr pointers with
> the NON_OWN_REF flag set while holding the lock, eliminating the need
> for this remove-read-add sequence.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> ---
>  kernel/bpf/verifier.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 05a6a6606b6c..bb3ff4bbb3a2 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -9260,7 +9260,8 @@ static const struct bpf_reg_types timer_types =3D {=
 .types =3D { PTR_TO_MAP_VALUE }
>  static const struct bpf_reg_types kptr_xchg_dest_types =3D {
>         .types =3D {
>                 PTR_TO_MAP_VALUE,
> -               PTR_TO_BTF_ID | MEM_ALLOC
> +               PTR_TO_BTF_ID | MEM_ALLOC,
> +               PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF

add a comma, so the next patch doesn't need to add it and
has less churn.
PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF | MEM_RCU , <-- comma too

Also don't invent new prefixes.
Either "bpf: ..." or "selftests/bpf: ...".

pw-bot: cr
