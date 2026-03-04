Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E2225417
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 05:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772603916; cv=pass; b=FxGke+QWCiUF5+qRkgdHcDC6c6eAx10i5pgnOsyNH/APApNsfg7ieAc95Y7EG5d6VpVjjyJpHS5LhQ1Qb7c3HsOiPREZC6inwupNY6oKtq0RFqs69SOMSbn1MJAbnhSNM5WcHwfXpw58FNcRkMHEPwxmvNeB9yOniPx6BK462R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772603916; c=relaxed/simple;
	bh=/NX7IFwd1F4m7lXUlgO+wNI5t2GEUHSg21WBVXnVvIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUoYNspm6TSCtMTZCMRMMqm6ghOE+zLVQRoyKPLP+fUA3qxaHMCr7rIaHNr/ae8PpGrwGOYgLr1yeIKZlf1qaBamC3xfofHbm+qg/ZeA23dGh08+MeaNr9d5vLcWjU+witm6c+vJNiVwmcyRFbrJs9cGGGoeQYzqzd5ZUYo/9uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epgCOWwq; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epgCOWwq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48378136adcso38289915e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 21:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772603913; cv=none;
        d=google.com; s=arc-20240605;
        b=fdxdL2qq+QZ93AiAU4N9nenpworTVDeUhdU9esCb8SJ97S8DP1khOuyiAK8oqqbkKP
         IxauBkhyFLnrb7p+ry+DHj8HP7VtCT1WgnQPAb6pqWVs6jNI2VVeJcymv3CRxDjoWJIF
         paZYbPXpJKZHR/+iO5w2R23LW2Nf/gExf1QNBl3vKteMgSmQhcTA2XacGYk4ZVZbUzqR
         z2GYroFG67Hmy/RayF4n9uPpq2+YMJ7bxz/55n7HlnliTyc1n+aHCncqooWVEFzNUs6c
         FGBtF2zVd8GQ4kTeui9wnxgn/uc0f9/r7N/Hxt0mw++hxPGM+P8B+BktGbd5ROqortAR
         g2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpgMwZZuaK2KyeVm1P5Jh1Jm+p04rBkurVuB64xnmxc=;
        fh=G9qBkgd3yXaYiO1a0gnvJ2dDP9l5E0mX2sKtncc/Wso=;
        b=LWV9AQyYTPzNFPWLdj/kIXQxjww21VcyQuALsQTy0pv9vFiXsmJ+9x2tjj3Mop+4aW
         F+eZgulWxoLgORHemKQoLWn0BeXJ57Q216R0E5m8EhGZAz92JeFSy+muP/cvMeTlF2mS
         ahisQjY+ma+dG85dmXOmqKzYAu37z+4BbwGore3j0Kbz3dWwoeaNpfeuBj5EiZqdXETb
         fiIs87OsqvVEKxsoo+mVv+O84yTwNODUcxIKM21GAdNYSPBUhpJRZhx8DoCMIYPBcc17
         gxmJU/iE6KNB/wKVcXyoxlW/vtvl5Pv4bjwakeFLM3TcvoI3BrJUcaFf3fL7zJeoQOgL
         jJqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772603913; x=1773208713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpgMwZZuaK2KyeVm1P5Jh1Jm+p04rBkurVuB64xnmxc=;
        b=epgCOWwqhn2R7s4zUDMRPFuJmIe7WFu2ukL2zRAGseATTEXH3JpQJoZ/vtd2Zs87QR
         pcWFojEEIqPQknASR7pxuKlJ7+Eob5ztflW0XneqZ0aQjrNf9rwcjeB0QUXoXEv75qm4
         ixrF1wrjkz2hEFkd6Sn5XE/vw7mSZWk408/JpqSuQtK8oyyisBD7vK4Alugs+vSALmJp
         BoolpQCNsT1FQ15PPykheT1rzlWHkHdmT1kx30TpeIzfbXkIyA3irsxcg7joaxJwocjj
         x7RL9Fteb5wFr7URfFYMuxfIr4ffWYEfsBL58Ty1otch8++JeoYsZZ7R3oNpJSSeSQdc
         wC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772603913; x=1773208713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpgMwZZuaK2KyeVm1P5Jh1Jm+p04rBkurVuB64xnmxc=;
        b=OqKdqbzrFYmDQf4RxOG/FL/Pp6U8qfqVOtl2vtp084nOq8egen0Cx0iaAlFJ1KSuGz
         wjAwqAiF1zmDZzK3Y+CCf7BgWCEO+zX8lQEoTMwaGYx3TKv9DdiT8vf8DPz7AkcjBhye
         wzGV/6UOnQim3tiU8Wq6pibw9f6EhkSL2CF3O//vTuzTsfUCZxKZ31SeOX/qeHUVnLCC
         qVUfXG8osIckqYEZJcuziTFyo3PV1QwWYD2WWIGnWQtSBRpgRu05QEA/aEwDOmkVRumS
         3Hg2ODh8RblxDtl87ZqkW7nbgQBxx34qF2nnzA16CjRdbpcC9b0TxVRuJAAPOzOk9NlG
         ETOA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQCgs/Eq0RUyBzdfiUz7nh3yoYVvgC73F2JzoBiAnN1zIOqYeEIdhg1Egye88JGYlDA1mvKVIv3fGoXngOXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGavYWov9wKBNXTYAw5kp42k9qr+7yvg10ZOP8xi6ls9wG/5kU
	H3cb8bQiwOXuEEOulvS+w/ON1ffDxnhrSTX0c8sQgjZJI3a3JHd5jrWFRbToHSayldFA7RyCTmg
	4ULUUaebGMWIR+DApCTSXm9q2QN46dRM=
X-Gm-Gg: ATEYQzzK1IlEVJnxs+zhiaW8fJ+e2fASiQgyKcM0win7oFWNB9Xb4J5T8vCnizMxXS7
	sf7dQOhZFq13aYD20XM7Cr/PrJECj+4kfWTyb56eF6WDbtlozU/9e1sepqavMOOYhRICBmM0yCb
	IpPEBFQPwgIpLj9+E3w/LI9sc2NoyiYwCGdwx6xWQ5kyw1q2w6bnFxfVIlccyIKipW/vf+AqHfd
	QLSDKxtOX9/EnrjNbpzYJ3gTMN/IcTB60k/vp1jqzqPSKrsDxvuAa3w8rxU/uLTIM8qWlAfdyAk
	FybaZhcq1nVpiIWf4WOgMnqJxbjF1uO+xrAs8XVGg79L0+JqwRoZsh0SgOqz5EVVgu3vb+GyePJ
	Acy882GgL7eoRkCHsAKJy+q1jvVgwMx80cNMu
X-Received: by 2002:a05:600c:529b:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-485198840ddmr11665155e9.17.1772603913306; Tue, 03 Mar 2026
 21:58:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211151115.78013-1-leon.hwang@linux.dev> <20260211151115.78013-4-leon.hwang@linux.dev>
 <CAADnVQKc5H=k-++CHxs+Y1ggptRSLRcACLgVaMgOmt=QBT=dkA@mail.gmail.com> <c9cd645f-810b-4dd4-a1ed-27569dca5055@linux.dev>
In-Reply-To: <c9cd645f-810b-4dd4-a1ed-27569dca5055@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 3 Mar 2026 21:58:21 -0800
X-Gm-Features: AaiRm51xhuPvPiRd8hQXDi2A83VK1MO7x6pFIqJ0aN5XHu0ii-a61Eu49k78XMo
Message-ID: <CAADnVQJ4E5L8rL-K=yJJZpCeRBvEJZcSKOEQP0kg2ztowhGmvA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 3/8] bpf: Refactor reporting log_true_size
 for prog_load
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, LKML <linux-kernel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 9:47=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> On 4/3/26 00:32, Alexei Starovoitov wrote:
> > On Wed, Feb 11, 2026 at 7:13=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
>
> [...]
>
> >> @@ -6241,7 +6244,11 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t=
 uattr, unsigned int size,
> >>                 err =3D map_freeze(&attr);
> >>                 break;
> >>         case BPF_PROG_LOAD:
> >> -               err =3D bpf_prog_load(&attr, uattr, size);
> >> +               if (from_user && size >=3D offsetofend(union bpf_attr,=
 log_true_size))
> >> +                       log_true_size =3D uattr.user + offsetof(union =
bpf_attr, log_true_size);
> >
> > So you added 'from_user' gating because
> > you replaced copy_to_bpfptr_offset() with copy_to_user()?
> > This is a drastic change in behavior and you don't even talk about
> > it in the commit log.
> > You said "refactor". This is not a refactoring!
> >
> > This is v10. The common_attr feature is useful, but
> > you really need to think harder about what your patches
> > are doing.
> >
>
> Refactoring should not introduce any functional changes. If a functional
> change is involved, it should be factored out of the refactoring commit
> into a separate commit with an explanation in the commit log.
>
> I'll add this to my self-review checklist.
>
> The intention of 'from_user' was to replace copy_to_bpfptr_offset() with
> copy_to_user(), since the log is always copied to the user-space buffer
> when the log level is not BPF_LOG_KERNEL in
> kernel/bpf/log.c::bpf_verifier_vlog().
>
> The 'from_user' gating will be dropped in v12 to keep this patch as pure
> refactoring.

You were told multiple times to avoid copy pasting AI into your emails.
Sorry, but this crosses the line for me.
Your patches will be ignored for 2 weeks.
