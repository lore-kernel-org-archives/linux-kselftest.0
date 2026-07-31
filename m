Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3E5695
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456438; cv=pass; b=B9+Nbic+ESXVc3I/g/wGRinx4V0lDI3PDbRBfdkRH2GVAPMBVMif7MERTxtEfGg+H+20UCrNll32PWnfSzkY/L6BiZIkYFC9LkoRJCWnSfuY2yNYVzwwgQ4Gg8QQSXxNZH74Kup9mqUxUdWYx7aJhNoxcWIoAPpGHQzIeQrqE9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456438; c=relaxed/simple;
	bh=IQgcCgUN9ob2aK8ni//osqPFYvEUV2QuifcC8kLAH3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdmAzuXxKsr424sJVuM1wSspz6HwZmP0CM3/0XNneL6evEbxJGYXYTHSHWn73cJMNWT69DEM5F38R8TI+HgA4WwMdlcv3kv1sivmt3dqUCWjg8nYmbfa/NgZCbZrtfd2BR6dOAanXxv4maEU/K9bIEEcgpbkHMb8Ut5oSLNkJE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqmcu73C; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqmcu73C"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so398031b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785456436; cv=none;
        d=google.com; s=arc-20260327;
        b=poJBu6uUo47aBakVlhATyqNukwXbvQd3Zd9WLYmHWA7lNrwJmCU6ZKpnB/1wES8zuN
         nmu6BPtn3uW50r+sj30ziSon2wtnmtP4ruL6uZcrKe9e+MhjBsb1Wn7OyU3dihzAd0Bu
         +jWWrjlHCT5MK56JDIJvXxcaaHm9v+GzREmcNdaUdHcS2XiPIYSu0urfSDqjV1KeSHtt
         rN3rSun3MmxNzlOR1ogsVXR/c94UUjdPu70DjBF8H4o9XHxK6K30yisr41gLD4DX7cpk
         wIqbWo2TTdfcuduzbRzioyDtCseiuYkY+AgfPvZeB3dmpEUteX/K9E0NvXelf4KM4I+V
         50Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ywzw2pnBpZ6rcuHQ5GQtNDziaj0w2OV9J3er0qRqvRs=;
        fh=98gQCDLTJTdoe3Hjy++6qz6IIrOgtwbT/NlqjU8fz0w=;
        b=DvE3tvOtH3ArwFN506PtRCR9lN2GSAEwRMibgD5+KzkzzXl0+4cXOd2d5xVo6IeIXd
         WMqNLTsJBvozN/9hvHoqnD3s/LfjiHAOW8/y+brzogMobGTj0xm8yC7IAM6+y2UPMN5U
         megYJCR9s6A1MDPpnf7wSOvB0rMZqXLo1FK0nqHC8TZi60elAi8fk5KJE3Z9ilLdSVkz
         stmAf17Ko3DhHdNfDa+HYw5q3dORZC3HJFZS3C2wTV5DOxhOuNWJyvtC1LZ+c8Nxj6i8
         QuRVkuozUjhfTdQX86bsmXPIOV4Uq6hEUp00fK5thAvJ+LX3owu+aaeIh+Kca0q8Ns+g
         TLDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785456436; x=1786061236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ywzw2pnBpZ6rcuHQ5GQtNDziaj0w2OV9J3er0qRqvRs=;
        b=eqmcu73CpPSiKFhkKn1kG4usgrTsv4Vsy+qAGJPjME0CR3ZnnhO/hgAW21Zl2Hs/rZ
         w+cHqyDxFRmjTz2wQu9fRwECJnWsgtX6atJXYmGhv+n8duBKm2Qis2CKOs2voFx9Oiib
         o/tfN2Ga6oM9m9arEwHorpfpbX4k9DOilBaKbBNPsIhphy/1q+4LPlrfFHUumwbfw55r
         lUyZXDtxjFOPOLuCj3IxSz4n4BvEevUl02KJnz2QwVIWi9XDHkVxTZ/aQLfjje+HfC/b
         2DRVEo7zSdY0MSbsOHbdBvVxPEaIrQjhTNuKBRFjgA2f+UMR8XKdmhkPfiCguGduEM4y
         /W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456436; x=1786061236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ywzw2pnBpZ6rcuHQ5GQtNDziaj0w2OV9J3er0qRqvRs=;
        b=PyaENjyfraZEdxGH5LbT5AbUofDlk5nrwFKN7xOCvC5apfhC53Q7EZVvZr1SPPZLop
         FYZNjrAxfkC6qEtFfu/SLl/gTEUl/75Whyf4NoUPa3mSOVELKTo3NDnT4HcCGjiirtpi
         WZgs1g0IenENH1jTEcPjllYM6NicoV/RSgrpUpOwJg+RLoYLIYcUEjAgbokG9OtajGNq
         c2MioTJFQdQKLsbv5Ok3dLPwhiK4dmj8/UOF1xtuPevsN3x/1t5t0yU6yF4gqicsjM9i
         Q7kuvmyMgfQ2oZTLcQw6AluVJUVBUeTPzZekyvFTmM30y0UGEbAz3ZAzHqkitWnj9rHZ
         vhxg==
X-Forwarded-Encrypted: i=1; AHgh+RpwN7eg3NoQoEBnbwWbFJLsHsSHjMhT90+AzscNf1HFPnW0W/NmQE0UZKJGwuBz9bHjD+nDVYavnzFfWDopSTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/lmDAkQONAoHgb3aWUlCZj0+Hw8WZ5So409u+AgI2qokCHboR
	qPLFtbQzqOYVLU5aFCBB0J77QY2OE7tiXngjfsamtwI9TT6+jlm4qvoh8v6AJIoaHbldsHx+CI/
	38N2wq+ms5vz6Q0K8BRI14WpxEQFIv98=
X-Gm-Gg: AR+sD13cA2D6n2+Ts25Yg1UBylmgl3D6G8OhSiAbBpoaYnjiyErmpJqRtBxcvH4wdIg
	u7eKhXsihfUywB+IfOqrtZFub6ViPUeaatKudtYh2wY5e0nVhZZcNVTF9k6eY68q+iuIonCWhwl
	7wSEWHUzJr5Go6SPPrfiknr/jQbdSCbd7UJsloFlebDhzN7Mf1MfXSdKobnTkVtmK+lME+4tska
	cesZQIscHCMvO9STM74XfJZ6WiMEO86hMwjQTxM2zdadfrDA9PlYj1G0W8/0FkaRVnGJcELjLyV
	dGfxYhiiDbP9WM6tX0AjHkEg78GpvDhq4AUtCytjj1ZgWqpJUUtqNNav4QjhTX3/RMY8x9Ijnqq
	7xkJVLQQvpVo7257Wsc8ovn3o8xYHjrGiZpO/f2Z7RpPf0MV/DiYE7w==
X-Received: by 2002:a05:6a00:10d2:b0:842:614e:cc94 with SMTP id
 d2e1a72fcca58-84ebc241216mr4383107b3a.26.1785456436320; Thu, 30 Jul 2026
 17:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725132624.78373-1-leon.hwang@linux.dev>
In-Reply-To: <20260725132624.78373-1-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 30 Jul 2026 17:07:02 -0700
X-Gm-Features: AUfX_mw0ZEm9k-Ub0vT04vq0qsIVheV8T4aJPOF6Vp_lZfK9C9VKzujLurVt-sw
Message-ID: <CAEf4BzaoQaODE4F1wfrp37=83bePY=gKpunacKr3rmO230+B3Q@mail.gmail.com>
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

On Sat, Jul 25, 2026 at 6:27=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> When CONFIG_FUNCTION_ERROR_INJECTION is disabled, a sleepable tracing pro=
g
> is allowed to attach to '__x64_'-alike prefix symbols.
>
> It is because the verifier does not verify whether the symbol is a kernel
> function or a bpf prog. That said, a sleepable tracing prog is allowed to
> attach to a bpf prog target whose name has '__x64_'-alike prefix.
>
> For example, a sleepable fentry prog attaches to a '__x64_sys_nop' XDP

we do have addr, so we should be able to distinguish between attaching
to kernel function vs BPF program, no?

> prog, and copies buffer from a user pointer with bpf_copy_from_user()
> helper. After attaching the XDP prog to lo interface, the kernel BUG
> could be triggered by 'ping -c 1 -W 1 127.0.0.1':
>
> [    3.460756] BUG: sleeping function called from invalid context at kern=
el/bpf/trampoline.c:1324
>
> Fix it by disallowing sleepable tracing prog always when its target is
> bpf prog.

what happens when we freplace sleepable BPF program/subprogram with
another sleepable BPF subprogram? And same question for sleepable
fentry/fexit program attaching to sleepable BPF program? Is it
something that just cannot work or we can actually allow that?

>
> Changes:
> v1 -> v2:
> * Drop redundant 'prog->sleepable' check.
> * Collect Acked-by from Viktor, Thanks.
> * v1: https://lore.kernel.org/bpf/20260724141422.10463-1-leon.hwang@linux=
.dev/
>
> Leon Hwang (2):
>   bpf: Fix sleepable check for tracing prog
>   selftests/bpf: Verify rejection of sleepable tracing prog
>
>  kernel/bpf/verifier.c                         |  9 ++-
>  .../selftests/bpf/prog_tests/fexit_bpf2bpf.c  | 57 +++++++++++++++++++
>  .../selftests/bpf/progs/fentry_sleepable.c    | 19 +++++++
>  tools/testing/selftests/bpf/progs/xdp_dummy.c |  6 ++
>  4 files changed, 88 insertions(+), 3 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/progs/fentry_sleepable.c
>
> --
> 2.55.0
