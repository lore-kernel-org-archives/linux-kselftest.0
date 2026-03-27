Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504A1334685
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627118; cv=pass; b=UZGQN/gCnF8pQJ0Bjxv1u7NhTqcKp+/59AOxxI7S5ReM20KJXa9x6lhksxmFkaRHTK0qshtVTeaRgqJobKUSbs7Q9u7WTk4kB7My7vZRsdBtSKRgtx20856NQr02tBvErCQ3ggT22vxzzC9Jt9voolGyjW/xDNNyUfYHcDofBQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627118; c=relaxed/simple;
	bh=O5mLHtMbAapNPXq46N093tL3wnr+hNWmDAcn2GGibIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5PAfCSYtZgkwS58BGCYy+YQY/HGB8OtyvF6KPurqnvavdp3p3J1e5e/wJWc5l07Oz1KZW3k0d7cM/fF8CqKkfmY5Jv42VVaeI81f6aCvdoCVrfrVegxWH7uYzIDnFgpFQEqZksJOSTIgFxqJb9fO91Ia3m5EX9jxs8REefgHEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioG5qRnG; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioG5qRnG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso20545095e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 08:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627116; cv=none;
        d=google.com; s=arc-20240605;
        b=jLKBni6cFFPSDcrKAwkkGlb+NaUzSdyuUtPFfnAMNzayJabkdszp/XWizfzplaInTQ
         idJM0w9Z1Ii6D17SxkhXmER05XHFpJnqF17aT4cY+XJWqRPIaO+S9Dal0Cjc/qAp+YtL
         l7lX+W1VS4PlICpAWv96ArNnuWwJ4LhHZLmb2jeiX7n2BK7voQISaM40o+bkX0NaDeI4
         IjdzLaWuDsArhLMzCEWv2TuA/g9ETmlaFJaSPQsuo/zZeZsz30zitISMgNECbJvLpige
         erxSBZ29ukbqnDGiKGH3bbTHQvPzbjRj8QW+Hiw5qs9LVl7GcCWXQCJvlRsIQfsY/NAr
         R2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O5mLHtMbAapNPXq46N093tL3wnr+hNWmDAcn2GGibIA=;
        fh=wpzTXuadL1ZppWHM63H7Q0U+oHd0y5cj5VuDovTMQSA=;
        b=XIt2s7mvqdmhjQTtKym7poU9TIbUI2B0W6Q+LO1AZDnRkQfhq5rd8Shlz1HgzxeU7G
         doW90BZdwredEFyh9BvIihjEMEwE2WdtKE0ttqAr74tdT6qilZcBaUrpYUk+3RNE7J5c
         mBM2O2Ss9Yoj/eU6BjPrkNqBOJ1beSrNzB5Tj9KH5q552Zyz4X9CoA13sJquo056Fm1x
         avakJIZCVVFeSPEZkFYNCVhhXMB9ST+4SI9CH7thQSDMfIbklyVExwlo8PMDs+pOAl1a
         /TRjzfNv8aUY5oEWdWcU6zVUJXfXu5isVfRi5TBgE4sose2Q+xuC4VtTTzvOznMVIzGd
         cGVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774627116; x=1775231916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5mLHtMbAapNPXq46N093tL3wnr+hNWmDAcn2GGibIA=;
        b=ioG5qRnG00feXy0sLCP+PXxmoSFDnSBmgYG6IhFr290/EpqpEF5RYxshD8Nf3mEsus
         VTSDpuzuzOUdtUJHHolbXQYlmmIMCpuxpe6hZ/PG+17l/Sw3UCfuPI/n0heQFqJ5Aon7
         NXUXvmfLMssgCR9hc3Mm/CGgtHgKln9FYIVF/67D/OoGBTkGjtH6wTVBtOxvRBAR6g+n
         7RuZqZ6qJwtQEefeo8UdxztCOUrA9pBEI8fC2VwgDjEIyyDDs/mmMz2k1jpU1IrbA4U3
         MuNIcyqILhKYltyWkqqgeDrXWUdXJaQJzPbNyNHSmyUHIlLprPzH6FQ4wSAT35UDVV+v
         RvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627116; x=1775231916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5mLHtMbAapNPXq46N093tL3wnr+hNWmDAcn2GGibIA=;
        b=WPwE8gAmoJwKxglhhF1Hx6eK3ojlgeojUG5lyugE7mtjHZKVPIgxiOnPgeKrFJwHU+
         aIIygwtG6OnvhpNWMU4aBCGbiAAm/9lqijCQRJpVGXW3yqvD1dpjzXGXx3EVKkR1G8qj
         tLPwYW1w6i7wxPFZiBJ4eBnatiN5mxcQu93x64+MtwbJGI99w+G3+NKJah2T0xYFY6JH
         NLdP4n4um2t28+Wd7i+ZsV+W5r8hNVzcREi1XPtfD4J1MwsVsTyI1QHWFB3AXZWgAkCO
         m0jaKFFJnjXjRspjG7ar2M7QaLOo3SidQTtf50/eYihGhqpPe5+q9NooPDvuPOAiymmk
         0SYw==
X-Forwarded-Encrypted: i=1; AJvYcCXFEoxTK4sEdrZNHT98jkheXvkWTDmVNABtHDCAysj9LIXvBakXFWgEiXlVIR6FNjkdwcvjBdzciSkihwkentM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzttSXnvvCV2uGvFoiyQQsCElZ9NmHnGbEjdu3i0DzJWNlG913V
	lYfl/fhv3kvx1RueZQsIX4BvbAvvoWarfH00LhJvkz+H7xFn5JlPBr1j5JHFaatUrdpoI1PdkcA
	hxcxZD4DMX3zfOAFCBYEQaBnrf3Q5Fts=
X-Gm-Gg: ATEYQzzU2UeprezAsVOopVTbPw97KNc9Ke3TGfbaikUixbhbiYuzhp01qVux6kR+2G2
	zT4CZ0TCEvNJgiQiXxnYSlnZ46eFRjeAV6aPp9gDVPwuKasvZAT95IPNunc79U0guYFWgyZcNut
	yZpiTxv2lKzyhC0Dw79Vxo0VTsl95oReIfoCOI1X+k1eWO0fCNZyYW7Gbba7OiRFed0T+2XioJi
	wRjGjwbbGLfhPa+l5OFSmivUpXGJJruYVixvPLzO7Y6yudO9G4nVUd/MKLyJHj9J0e/OHmlV3AH
	BNX3+btDjyIoozwMVj43CQwFaTZc7UP9YBiIjXExLHwwlhWZDdtMVlsO/4r3zX0KNQ1T0nTucJ3
	ThTXjTkoxLiIPxuOkzCtq9OqJwaGzu9fmGZTm
X-Received: by 2002:a05:600c:a30f:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-48727c81e54mr47470115e9.0.1774627115384; Fri, 27 Mar 2026
 08:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
 <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com> <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
In-Reply-To: <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 08:58:24 -0700
X-Gm-Features: AQROBzAjRXAr6TiuVF_W0O8sqrsQKyaf91amrRDMqiC6S1PW0VHT3nlzwLoMNg4
Message-ID: <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Takeru Hayasaka <hayatake396@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 8:45=E2=80=AFAM Takeru Hayasaka <hayatake396@gmail.=
com> wrote:
>
> Understood. I was a bit surprised to read that this area ended up taking
> months of follow-up work....
>
> One thing I am still trying to understand is what the preferred
> debuggability/observability direction would be for existing
> tailcall-heavy BPF/XDP deployments.
>
> Tail calls are already used in practice as a program decomposition
> mechanism, especially in XDP pipelines, and that leaves tail-called leaf
> programs harder to observe today.
>
> If fentry on tail-called programs is not something you'd want upstream,
> is there another direction you would recommend for improving
> observability/debuggability of such existing deployments?

You don't need fentry to debug.
perf works just fine on all bpf progs whether tailcall or not.

Also pls don't top post.
