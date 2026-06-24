Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2901E1A17
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319698; cv=pass; b=Qufljjgv3azDrQ6GKTBFcv0jZcgvSBCfu/rIpKJZx6pko22nJl3+5Ht1KxG+mMrKMnH7ZjizbwzjKfgGmi3cwuwkxbRTYII46fSLUFrj9J8KBboZqtRIRS5536fWrVBpVt1Wj7C9YCmOCzOPFs8TM24r4uv4DpItXki6mWs3N+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319698; c=relaxed/simple;
	bh=D1dDY+PxqiBKFbSG6nmxEVOa3WMHNTh5EZ8F9r4yzQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6zy4Otc6ZmB9cd/i0UEtzMkhDGsmM9jvVK238Evh7eJwJwEYbHnaSML+FKS3glD+nY8Y79gvP9d0DCuaZTVGMttfQsQRLHLwJPRjbitxE+OHK+v4AP/OOCCNh02EUx7+wBy/Dh6iJ85gPBr8SmuJJr9ruo8u3+pAcVIm2LJ15c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tB0nNIO8; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tB0nNIO8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so854155a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 09:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782319697; cv=none;
        d=google.com; s=arc-20240605;
        b=Oxay2TXHapfKu3T9ZtfjrR9Zp/MUtsgEdWLEWqNvs4MErr69xZmBG01boYHDwIND4p
         i3BKCXE9qi1DPaETalp8/HtYx+h4G0C+sc7QrC4Y7I+GPTQ05arroqMfy2BcSOcpwypx
         3agiUlEdyRPwbGTtqEj0Mey9OvuzFTNf5z7glsoggqHSqplKivV9b+hm1CSRbt9ORIDz
         R/fIFE7yWOt+G3BQbUfDFcsFA9EWKfxOnnufwQlC0h9qnYQG831DrIoH382wM2VQfJmW
         D8PJEwIpNlz+gXAzjWGVFV1EpKstk833cYvrqcqjUBkwrprb8fIUkzdWmKDI25qeTHvh
         uNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W03tYUTCql9OC1n8+t5466/i+LRzkumE2EIqxm2Qnew=;
        fh=TKvswtgvpnGkVWxBwqD4PSDLMMl+9LuXBqRQoByaWK8=;
        b=ivgtLqfocvyF1AoqcdE+nzuxcB2Wv+sL9pkpbdbnHvElriMLXfNnRBfoPQ1KU0qljx
         wC3GuxRiu/FmlHVNE8sR7RzVpG/EF1921o+38rGVijBjiC5Qc46Y+pqlyz4FTadaCrvZ
         X9aNOqG0XIueppwhvs97rzVBVWfcOv7nN/AZloArmccJ/UIGdlLtWn4vuqFF6GFAUF86
         Zt+VNdi7HkkmPeBk9vp/mZQwazgR1TpXTrA/CQTWChKWa2da2tGyJb2FARG2579NXEG+
         cOyGHbJBZ3kS8NWYj1DVpKZ+HnDIXSvaZ0rkSI1eE6CHNFO5qrKMXRs00nVbrpeRFvw9
         pvdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319697; x=1782924497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W03tYUTCql9OC1n8+t5466/i+LRzkumE2EIqxm2Qnew=;
        b=tB0nNIO82BBgMwDiW5BsSYPK9GDMKyS18wf18771qxeileK/HxqJhdgyx+ZxmUIAzu
         7+rZFKGQCpLXTV47PBlAgMbyBQok16jhU6OKsCCMe6t/q7St0a1QRFaskhjMIUzTALca
         oh7InXVVoX2QsH0pp6FCgvjq2QHPmLkcBAXWlIvgDrKpgjsa5UiBMUyBy6As3rGcxgX+
         WFac+rBLjQAMvZiwltklmouQa8tNleuNPHDno5LP1h0S9ZgTmrG1zgA+96N3XQHvAZpn
         S8Ev7EnIlbpjfjkrO6K0AdW5wUez6yCWACzAzlnX/78UQnPtQQIAt5eOo/CaL/ESKT/M
         IcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319697; x=1782924497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W03tYUTCql9OC1n8+t5466/i+LRzkumE2EIqxm2Qnew=;
        b=YVD0VMmgOlvCIKa5Kxpzl4f85o3oDpjZ+2ydMjdReLn2qFCsmCYsSAu8wjG4gwKHl+
         sFbepWXRLsS8vQULf31wAUqGtmydpp/G4MKdaJp4joMJ3VH+cA72aJ29Ra3paJ0CEX/u
         2qKeVcxENH1zWIj5eZRm33dWd2ZjxRzojJJ7oLU06sNiHyr1ZAX4yTLbOk9kcUia7VOE
         RwYJB9J3h30VWGiz6QHJz4/e3tjXSUct2lKnNN6wSS8RnuBD4AMMf5xJglRCf/1KIxlO
         TwjiZyPo/veiZIV907lEVT7/Cvg+n3NTu9Xld7IOhWg/Xz0gGqY6HLgjW+j+nQLS/wnW
         54ig==
X-Forwarded-Encrypted: i=1; AHgh+Rq/d6m8hilP6BHPUs7rg5rvP2K1FwsirXxc2MyfMqaUL77IfWay/jFV7sG37W3P+s/5XXLeqT4387McG76jr7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tVyRlmrL4OEwAVTTIfuWoKqK/sMI0OmEFu1eh4YpcawEnbmn
	URqlrntIEz2PFpjG2sz6Pjm/1NLGIqoaZNXgs89CCBuwIS9R2lp1n1DdkqNbkix7szUnIqLSBWs
	7qHoHAttajCUuqznFWYPNNvKSinoTqk4=
X-Gm-Gg: AfdE7cl0GEGKl769hQF2yAyu+/6SdiVir7nXtFqFHwC0n/SOXeMTJA4SueTVpq4is5j
	cCYe8YYJsY8XLZ6o+0P3wGq0m7cb4+pzkffR3H9NY5w1kkTGGtKK50PIOc/RUzp3bkBAlOeARkl
	TsshTxujdYBW5mee13TbWmxIp6gUqDfrADUDILyBP7/FZaaCbKhUAV8dprxLqAmV37KArCnz2sR
	2rZ7dc2EeSuD5wl8Js1oN8auUaSf/H9mvTlVO+F/kSAisfpHSXjbb0vjq8UBLaRt+U7QLwzenqV
	Mbvt6Nxy+3/St6TNGmuEuAg/FyzNAkmNmSVzzP8LG3tWwpKyHf0CjdHzdkObbwllNmM=
X-Received: by 2002:a17:903:1d0:b0:2bf:3309:ecce with SMTP id
 d9443c01a7336-2c7e15804acmr44655155ad.28.1782319696656; Wed, 24 Jun 2026
 09:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-10-leon.hwang@linux.dev>
 <CAEf4Bzbmj-ekwYQ6oGW-BRnzLBDvWgLyn_QsU5g1yNt_8A0H3g@mail.gmail.com> <d6bd1b3c-17eb-40bd-af02-e7135db07fd5@linux.dev>
In-Reply-To: <d6bd1b3c-17eb-40bd-af02-e7135db07fd5@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 24 Jun 2026 09:48:02 -0700
X-Gm-Features: AVVi8CdKhrk157vucbetxQ_xx2ozhEEUK-qKqre-NlZyb581Wr69_5EUbHkA4Ls
Message-ID: <CAEf4BzZHC3_oyWyA8zC-ogNFktsGFd35Stst5bswO05O=dL+Sg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 09/11] selftests/bpf: Add test to verify
 accessing rdonly percpu_array
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 9:16=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 24/6/26 06:46, Andrii Nakryiko wrote:
> > On Mon, Jun 22, 2026 at 7:38=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >> Since percpu_array supports direct-read, it should not break accessing
> >
> > what does "it" refer to here?
> >
> >> rdonly percpu_array.
> >>
> >> Add a test to verify that adding '.map_direct_value_addr' to percpu_ar=
ray
> >> won't break the case.
> >
> > what case?
> >
> > I think you are testing (read-only) direct access to read-only per-CPU
> > array, is that right? Just write that out? Though, really, negative
>
> Right, will update the commit msg.
>
> It was to test the change of patch #4:
>
> @@ -6113,6 +6115,7 @@ static int check_mem_access(struct
> bpf_verifier_env *env, int insn_idx, struct b
>                         if (tnum_is_const(reg->var_off) &&
>                             bpf_map_is_rdonly(map) &&
>                             map->ops->map_direct_value_addr &&
> +                           map->map_type !=3D BPF_MAP_TYPE_PERCPU_ARRAY =
&&
>                             map->map_type !=3D BPF_MAP_TYPE_INSN_ARRAY) {
>                                 int map_off =3D off + reg->var_off.value;
>                                 u64 val =3D 0;
>
> > test (we *cannot* access read-only per-cpu map for write operation)
> > would be more trustworthy for this...
> >
>
> Makes sense.
>
> I think it is worth testing both positive and negative cases:
>
> 1. (read-only) direct access the data of read-only percpu data's
>    percpu_array map to test the above change.
> 2. direct writing the data of read-only percpu data's percpu_array map
>    is disallowed.
>

both is even better, but negative test is testing a condition that is
hard to miss because you won't try to do that in practice )

> Thanks,
> Leon
>
> >
> >> [...]
