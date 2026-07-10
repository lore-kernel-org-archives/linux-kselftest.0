Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3CE3ADBAD
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 07:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668352; cv=pass; b=bsDuawJRfO9TI5nC2ROJ9LIMhhMjv6akuV01SZcKuRNGRCKzpw8aEAapVWsfasv0tvkfFWs3qqxbm3AxEhDKcsrVQD8jzbdsQ85CKxr1trpwPnPChpKRAOydkx/nlwFkbT5CldrtTrVU7dLO62e4IyskNf3dXbSobVP6YtVB/u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668352; c=relaxed/simple;
	bh=mh9wE6hVtejwpqaCnWH4G3lR/r6ymmL6RvQu7O86Nl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUvhf8jFakMrds7bvgikrvopO0A/xnmByoe/j2OGMqac8LJSo2peSETB6Gz8hrrDUr2Nu2+CUdFtTHQazgl6S+Tr/umhH16irq7lXlOiGb7y+34yiocBcUZQJ3syxgFnto/MrVmtSM/Sa8+kaeIgBxxWyd+kT0v+HxanNzWKzFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBik+sEs; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBik+sEs"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7dbcb505578so6641547b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 00:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783668350; cv=none;
        d=google.com; s=arc-20260327;
        b=AsQlJOosa5DoZnrN/ryN+6s9X3GkUMnyEGLM1p2gqoFSKdXhbRT1/iyDNgQjFPXyKA
         iST0iVv5K4jLHpx5d/zKj1/ZbpHOurmoNW4cq4dql0C/pFNlt+Rm4Z0eDC0FCH4BWoWW
         Zf/40UFrX6vfb2HaRD9Gt0ZLym4kSwUZnu3h/QtRn2vXcDsnrjMyEeg/dK+XaTnhvXeU
         VIBMdoqC/XSm9dDEFN+5Wl/5xdnIdlfgsyJcwnvmnIUyaaoPVGn//oe8BHEh1MBQ27o/
         CzWX9jVPx1vke7maMZviPts15g7+gjceKyZlKYs3DSTeMb2nC0DTz9GB5tAgIvRs5dZi
         UD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mh9wE6hVtejwpqaCnWH4G3lR/r6ymmL6RvQu7O86Nl4=;
        fh=hk2kG+HHxq42aYUO0X3UZLCm2wuRdoWh7fGUp6tUOZI=;
        b=Rz6EnVZNR8GE/vQXtgCyFAhzef/2mFoq/yU8eah82UXkrkU2JV7C+p8l7qBuw2Kkjo
         6ixSoxqaV+Q6D+GH4QXK5zsVHhZnRmsyTdy1IHxTL8WdgEMdAmtrM+Pv/+dR/ghII69V
         IBsw2h3Msjs248zGgBCysvImYHMLnoyWIsJoS1M9PYcRXglPvMc7RmsNGYOAO/N2TBvd
         Zdlk83Sn9YrxHPD4RLaZYnqOU/QlP4gWNLYXR620m2Pk1Go1lbDnv8PT+KENfM1HAz1q
         OSTB+FrAqJ1gvC0hHgpBU5R6qlXO09KxLStR45q06/2X+HAKphkNW5xfCPR7MVYO/GRX
         iOVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783668350; x=1784273150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mh9wE6hVtejwpqaCnWH4G3lR/r6ymmL6RvQu7O86Nl4=;
        b=YBik+sEsrE3WCU+KxB991u6zQ72Ve6Fdhzdj0CsaZBArzOQfDRclZo3wYYRE8NyAmD
         pMFP5wxMO38WJaI+XeVlta3Wj0axrJ97Rq02PXGobb2Rp6qNY/pJZQtNg++JaqiUZE0y
         7lerNZCc/aDCDfntKC3xLOeEFojhfBscH9+5c2RhAD+QN/Ba9LgblK8sQx0AL9AMqoQ7
         g2xEc8jnr4tbrsDvMG4ns2Qw3l0io2xZ4AZQgZ/xRRIgXvRXrz2jHA9EE1i2UdhbXWVS
         arQIsZhmwOYEnCOuvWXF00xcXcFbI0+3q+/F9GtN2MqwqbsTKZ7xrU1j2sY/jNb4ggvK
         Muxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783668350; x=1784273150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mh9wE6hVtejwpqaCnWH4G3lR/r6ymmL6RvQu7O86Nl4=;
        b=KmcmIQHOQq9Oxd1dtskk3loIjtagDEAwQ+YbhpBWs2HYp3xRewOJutpr8fuWDc1oOA
         gkn+fvTTsd0JSZARJ0SCqIE6sOnz6aMtkPEuKRZUYx2Ou2d05dLDVcNrZF8SVwd6r0lV
         jEMf/Uj7ja2DrdIm2kHyhTw1fhqW8NUEckpYe/0R4wkvuaZVmviByIx9WxQzXR3qwyYv
         TABCmpjUIfzMYlh8ls7kZF0ArkIWyYsvtr1bySIQh9cG4O2CBoUO7AnWYxw1e7R12+O8
         +ltd6JQNhNcpZuLT76KtisIoIJo6o72FWaOPXNtuiDUDn3oKhHMvGl+jmuw5VuNOPa7G
         UYsw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+4TDm0ZJvWn84xoPQ1j4Jfk5vwIhg6a7ZJfMnDk81UhnEZ3rsGv7qlX5thRH2cVJUwWRa/z7/KJHtf8UEwws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CCAZR57jnBtU6RsKPehqDBsagozh/BOv5m1FRdwihdqybaYQ
	mdADvHWxYxyF6GoZxDZI770MzKuvliXoqVJPqAUgwFeDiKs/B4BzpuhUq/ypeGzJZt7qylMCb8P
	WWxndXSQkOaHvkGuf7/Px4o2sVHns7r4=
X-Gm-Gg: AfdE7cnexCMbivoXA9UPi0PnkiZicXbcduR/u7gn0++RiQlU1ulKDh5yv7M2ZMIBz1f
	f6W6K61V6rJ9bhtbIkjEfdhrso8XrBddBHO/V8a4lOEpXND25R/bw8Jd6/eGpko3x55MTTkDHlI
	6mI+wnTHXyyP7aQUdyPrC8MKudQfiWmKqBl2K7L+nriiItj1b+yZulRy9rXiSH5r89N0y0VhPw7
	/iM7lLPC6Pla3h/Y4I3czlk/Lj4WLtBRGgMD9uc9s16wrZdRPv3KUfWAZUOAnz7J1ngnKdL1S28
	9QQal+7xAdBl/lKpy9pG0MGcMZ4+XzJDFbP9sslM
X-Received: by 2002:a05:690c:650e:b0:81e:7034:2ec7 with SMTP id
 00721157ae682-81e70343a1bmr37581077b3.50.1783668350063; Fri, 10 Jul 2026
 00:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
 <ak8XSRiLKx5WcIQw@u94a> <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com> <4349d987d34f9426bdbb09a5d02de61da8f3e746.camel@gmail.com>
In-Reply-To: <4349d987d34f9426bdbb09a5d02de61da8f3e746.camel@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 10 Jul 2026 15:25:38 +0800
X-Gm-Features: AVVi8CdDId0qAQuJjxIMlDaRDt9TMr1o0P2SW2pz0fSqjQyJjET2634wzxh5uAc
Message-ID: <CABFUUZEropo5ROshFt+mD+AtF_6VRGcyaOES-wUjasL5J2W4eQ@mail.gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for buffer pointers
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 2:23=E2=80=AFPM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> On Fri, 2026-07-10 at 13:52 +0800, sun jian wrote:
>
> [...]
>
> > There is an observable effect on the target bpf base. I tested it with =
a
> > temporary raw_tp writable test_run reproducer, not part of the series. =
It
> > attaches a raw_tp writable program to bpf_test_finish and triggers it
> > through BPF_PROG_TEST_RUN. The program does:
> >
> > r6 =3D *(u64 *)(r1 + 0)
> > r6 +=3D -8
> > *(u64 *)(r6 + 0) =3D 0
> >
> > With KASAN enabled and the BPF JIT disabled, on the bpf base without th=
e
> > verifier fix, the program loads, attaches, executes, and KASAN reports:
>
> Could you please identify why the behaviour differs between bpf and bpf-n=
ext?

I checked the current bpf-next, but I could not reproduce the difference.

Both the public cgit page and my local bpf-next/master and bpf-next/for-nex=
t
point to:
a4553044d1af ("Merge branch 'bpf-bound-rdonly-rdwr_buf_size-kfunc-return-si=
ze'")

I tested that tree with only the selftest patch applied. The staged diff
only contains:

tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c

The negative const-offset case is still accepted at load time:

#637/2 verifier_raw_tp_writable/raw_tracepoint_writable: reject
negative const offset:FAIL
run_subtest:FAIL:unexpected_load_success unexpected success: 0

and the verifier log only shows:

processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0
peak_states 0 mark_read 0

The current __check_buffer_access() in that tree still only rejects a
negative instruction offset and a non-constant var_off. It does not check
the folded effective offset, so this case still has off=3D0 and var_off=3D-=
8 and
is accepted.

So, at least on a4553044d1af, I do not see bpf-next rejecting this case. If
you have a bpf-next commit or verifier log where this case is rejected, I'd
be glad to take a look and reconcile; I may well be missing something in my
setup.

Thanks,
Sun Jian
>
> [...]
