Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A743B4B5
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511311; cv=pass; b=s4H6x1BYUFsyX9UtW5fpnG1Zjh7S+aFeunVU4c1fI2P6QwWWxCL6k49aPSW8Bz+cy1Kcib9sS0KgSbG2sMv7tlCnTTqik6alDisnKgSbNLv0rGJhaFoya/m75YGY9iKK28XDkQlATXUSr3cKK/Sa/pT1CQCWTKg500Pf421Ejyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511311; c=relaxed/simple;
	bh=v+WL3XoOwQikXd2JtezOQGH92bijGZnMB9gOFI0vCIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoESIz7ehCtuagY17piXHasIK9W4APAsHD/aWJmGYziCsF53t0gbKXBdlklbgUYRzoE5YmeW/YKzFzBBFIH/pRshCGIG6vGv7LrddC4+Ls+NKsyWZ27b685PRIuy9/2gOXTfwN8SG/GsZjlryIE6Vwm6wO39XNN/fU2V4iEWYcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQeqDpEH; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQeqDpEH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1647844b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511305; cv=none;
        d=google.com; s=arc-20260327;
        b=s8SMszharJw73o6tOVEfzVM2PuLH6/+DuNaVT+l2Vl3AXH85P2ViY6FxuKuS6OeB6D
         0WNmKMTUIrjY4DwS8jBSxL828v7wM4CKuB980BCa57eP34WIIaPDC1WisjUinDDuWzIw
         LhxZafQ3fS+WJA9QJbh7LddMppHMMk1C6keOFqx2jlAznBvK3nIrYY6Lj3dQDZjrW8s8
         9ofF5xo7ulGPnadGpjDWmMzRzFOc8bwfrh2e8jrZ6sT92n++KQ0KCVss+NBCdXuia61Z
         yL7XH0eSjmsPj+XX+kqzoJ7CryCPd++cVVaKZiJTOceai4gUjzZjFyCwoV1ipx0fI3jW
         1jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9+LRn/SvSrh7d6/E5JqQArA7jl7jdT+NZc32lFMXxY=;
        fh=rhAmw0+cGtY93ds1ooG7nZXrGW5RLWHXaS6eIdAnmGA=;
        b=sBfARfFE5vwPcn1g91JQXVZMOLJg/vEp+NgSnGw6opiLT5Fiwvag4/mObSEdWA9bWq
         2Q+q46lUYWFAGO8irtjsqeWp6jh6fVxBtcama4O+yLYUmM5X+SCrTW0LDEd4W/I+UHTv
         ssT0LMzfs9bRMMND0CLPpYLPqVoTSa9Eo1sdD0luHZ5zhBjYcqQJKGwaCyB/Xt0HkosS
         7/b4y/v/Rihv55ZH2QaNcPIxpWhS6MV7xvwem4QDiWtvDC2pXb43IER6caUB2a9ak5FF
         VFBQsICBKexEKgKPScTequLooqDmlgQdMT3MMjoTCy+yGB1/fusTRzrkxaQavIZ7VLE1
         zcgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511305; x=1786116105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9+LRn/SvSrh7d6/E5JqQArA7jl7jdT+NZc32lFMXxY=;
        b=MQeqDpEHId0AWi0fgHZhE1c71pI0bvQX5eTFev+whg/QuqGJdhQX8ac8o/w2I91UTm
         MGkSTswyKgaeoFfVRoSOLX/4EAbb2u0vq/rqvhvbSOzlU1u7hGsyJN8oeQHcIDYxQ/Su
         61hScehPZXmT9xHG0S5L/LePjdMg2ogk3DTyPKzbhI/j+5ZC+tztzfFqdL4Cgbyiu+U7
         MF6soGGw+PeXaMxAji8TpP5tZmiWTMTqT7qc3G33uGv0xX3Bu2LX2V4X1ZJNUvlHUDyl
         vwv9CxogyV2tqUquBhiBZPY0E3Btq+QcLYoeYUFc/kAJC/KKmSNxgq3lCERZw6qAEbD8
         mAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511305; x=1786116105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9+LRn/SvSrh7d6/E5JqQArA7jl7jdT+NZc32lFMXxY=;
        b=V61VKgTf8bURnDya8Ew7EkYy3c35NXDa3t7oYz1s0f5YIKIn5+heVmTXpzR00t2HaP
         c/YiQ0FjttPGMHTVdan3EAGSnGh7TSTiiTbRN2SmDJldDvZVcOZsmXwVpGXdYAJZ7Ugm
         b8G1Dl9XX2eidWfP1dmd2g81RnivRLYsI4/ZE737KH5gLp5JrXtRhNnavBU5demwy4EC
         LzIEEs2biNbx6XJX6fwFybSMdcT6GmdUxksehJEWIRIcVByJ4ybROkf6vUHjiJqhb3WH
         z6zvBPIcPmykhaHWjM6aGeRuacSeDICRIXMTNJCR8wwbTLkg/tX+To1WQSBxziGsjeGo
         Xouw==
X-Forwarded-Encrypted: i=1; AHgh+RrFLGMQkO7YYUoFldXVEN2X54x5LyNGW8ans1yhcnNnsjgJrwZpFzOUm//YEmC7hf5oh5oNYZQVOnViT6sMLOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhA2znEBsPbj4KMLI0NiYafMCqtB8vXREaDrzmJj3rA11ANuuF
	jEAqBGd8GTnEbcP/lDbKhS3aYWF8SxDdt53K5A/iuwKrmT3NzxX08/qiKX5Aw34Juy+8Yk7T9eq
	h+1jEPisdUjIDnT21OcpWyMlr96jef0g=
X-Gm-Gg: AR+sD12eO1MNBHM1mZgf5y+IU7CFRKOXuT3JkpyH5eDwgHIflzcbWuop2e53nP5qJ42
	fdBrjhBUMqMpr/HzRHlTnOQFKSjkzuq5hUHNg8KqSXCyNzXJFxzgHSxclzvjVnETSAtCHEdCGHk
	URplMuhvAg0eq62K0n2IrxniFlfdwuQtA6xyK+YSQoXTK8q7m+rYNX7w+58SEg9ZuOuqdm/ecAA
	M+8AVsxZW4WSWS+Bx0k68EY0/DP3wGFYLadD92HUcFsFJbdfM8f6khAXo+qaISclq38sOrOp8kW
	JwpePl3qVWiHgRrhQh/Turcfk/CjdlhiX+cmUJ3W2w06RTLrpZdixVFu6dAjUK5sLDUaV+AySZV
	vHhVaGoqDoGr/OWhAK3RBWtW7Ag==
X-Received: by 2002:a05:6a00:418d:b0:848:2f77:e2dc with SMTP id
 d2e1a72fcca58-84ee49aa19bmr73028b3a.69.1785511304566; Fri, 31 Jul 2026
 08:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725132624.78373-1-leon.hwang@linux.dev> <CAEf4BzaoQaODE4F1wfrp37=83bePY=gKpunacKr3rmO230+B3Q@mail.gmail.com>
 <66eaf62b-202b-45b9-8934-fbbc80caa84a@linux.dev>
In-Reply-To: <66eaf62b-202b-45b9-8934-fbbc80caa84a@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 31 Jul 2026 08:21:32 -0700
X-Gm-Features: AUfX_mwX1Lnn-oFVg3jgqe6P4ofXoWURmDZdlHg78-NJyoQdPMHudZHx9cqdijU
Message-ID: <CAEf4BzbjmW0e6DqFLUAyV+m_usHSkHpux3AdS72bJtsmYQC_LA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Fix sleepable check for tracing prog
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Sechang Lim <rhkrqnwk98@gmail.com>, 
	Varun R Mallya <varunrmallya@gmail.com>, Viktor Malik <vmalik@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 10:20=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> On 31/7/26 08:07, Andrii Nakryiko wrote:
> > On Sat, Jul 25, 2026 at 6:27=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >> When CONFIG_FUNCTION_ERROR_INJECTION is disabled, a sleepable tracing =
prog
> >> is allowed to attach to '__x64_'-alike prefix symbols.
> >>
> >> It is because the verifier does not verify whether the symbol is a ker=
nel
> >> function or a bpf prog. That said, a sleepable tracing prog is allowed=
 to
> >> attach to a bpf prog target whose name has '__x64_'-alike prefix.
> >>
> >> For example, a sleepable fentry prog attaches to a '__x64_sys_nop' XDP
> >
> > we do have addr, so we should be able to distinguish between attaching
> > to kernel function vs BPF program, no?
>
>
> Yes, we can distinguish a bpf prog from a kernel function by addr.
>
> I'd prefer passing 'tgt_prog' to btf_id_allow_sleepable() as a simple
> change.
>

I don't think there is a need for new tgt_prog argument, we can just
check that supplied btf is not kernel/module BTF (see btf_is_kernel())

> >
> >> prog, and copies buffer from a user pointer with bpf_copy_from_user()
> >> helper. After attaching the XDP prog to lo interface, the kernel BUG
> >> could be triggered by 'ping -c 1 -W 1 127.0.0.1':
> >>
> >> [    3.460756] BUG: sleeping function called from invalid context at k=
ernel/bpf/trampoline.c:1324
> >>
> >> Fix it by disallowing sleepable tracing prog always when its target is
> >> bpf prog.
> >
> > what happens when we freplace sleepable BPF program/subprogram with
> > another sleepable BPF subprogram? And same question for sleepable
> > fentry/fexit program attaching to sleepable BPF program? Is it
> > something that just cannot work or we can actually allow that?
>
>
> Currently, sleepable freplace/fentry/fexit progs are already disallowed
> from attaching to bpf prog, because btf_id_allow_sleepable() returns
> -EINVAL for them (except for this BUG).
>
> Since no one has proposed relaxing the restriction, I'd like to keep it
> as-is when fixing this BUG.
>
> I'm not sure whether allowing it would introduce any issue.
>
> Thanks,
> Leon
>
> > [...]
>
>
