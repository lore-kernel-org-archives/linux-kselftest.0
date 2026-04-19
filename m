Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5A83093C1
	for <linux-kselftest@vger.kernel.org>; Sun, 19 Apr 2026 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776639102; cv=pass; b=uf0KmUXpoF2SgiN41ZyIsd4zyYjs4ehM1WRnYsjNT7pndBFK+03gECVO3kCn7qWZccXdESPC9vg6lm9XRkQXh5rRMC5M41xGHQI1ggH5anLKiEwG0xwVZKyib7wCwWeKT5fjeWnARtngEau2g87vEtJzgT1T/2UM/fH/fVOUv/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776639102; c=relaxed/simple;
	bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Evk/p6VwDed7h1b411x57Odo26agFE13UpJkBB5S7xzuksfybEO0dBfq0VQfyE2fATsr59amRs2rJSs/tCk4BB0EP8kQEvzeeI0UbDx+074DIPyuq5nQ6Y6GwWGg77N/dVvNVf57D13TFMCHv0dDiNfmoO20aAB8je4hFa8+I88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIVyWv+N; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIVyWv+N"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe62837baso1340113f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Apr 2026 15:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776639100; cv=none;
        d=google.com; s=arc-20240605;
        b=B/zLbFqwReG/nZQwJnrYReUCYFiJTOAT8GmDIiojKuwV64lfi1TGzHql0zQpPHBi56
         NlNn4OqRQaJ76W+lCnwNscfGX5mhTzkaE6FeXaxuYh3ND0SMCHce3L6FUr77xppQ+bLf
         yFXaTT6Dq7F6p03aQn5MZndxrqL4BmMGw42GtLXeBHRxzV2uin46GbEvjASKKL+hdkOT
         q1qHx3uHHPLgEtnq83DYwihfZq8tusHhWRquQWR7knG67XST97aGZw56OnhkFuEiESdP
         DTpVKk6bf3j0vpYj7VXXfjxjPcLz8Hr3pm1rYx5yrI1kuMX6dKkrXT4wIBfo7tlunArz
         rS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
        fh=ry1EqeS4POjwA6cpfoQ4dLR4C1RdkI2NoZaID4iezpQ=;
        b=Frpg8sqfgjlSVDFB9dczdI9xDQJruwVCkOy2d/SrBxqPPWF9TsYDB/aR8uxiwMwdqY
         vCtER2dmAXQvKBT/eRyRs61QfimOX7l8TB//PfiSv6JGa5p7iWtDiIdEVYSq9cRjhO1L
         Uxnu+zUQmY63chhELzfH06/CDBQAEFuaCupQltOKfWnFUgCysHDIqnPhp7P5u83QYWhk
         VYsivvOkVGqi7yq0AONqNoknv+LPqmnXhnF7WLt7N1Xnkx2KELEtUKwcuTGu20t23NNn
         /DocbQUu6Sd/PR13QMeX+ud/mKpNAYFpLYndFd8edDixbXR1x0+/6jPHTzJBT0VcKx6C
         y6yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776639100; x=1777243900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
        b=PIVyWv+NVODk1fM6YRVoPCmpL9zUGbaduJRw4E4FoAIegZ+uqMEy9ajZ7vRe5i/8N+
         RT36e8bOpdX9w73YACH/l0FcEzpiJaZbl7xGoROLu5Q/LnEJ8rZ3Mt8JKc5Pajbb+qnF
         pHHG8o8xDfgi4ZgoAibFk2eVuMZf9wCPxXFBXKcgJsGLpAtCQg9jpRnSv7l0KGYzx9gc
         mw0kJUbWR4s0+qaiBqMamkwWwAQrjkcbjRoQPeeYL9jTYaeelFQDGyXHhEijC3J2I8Cf
         hwxUMXRFR1zLB6O0gi72EtXG75ami26eD2t1jPZW5QUxbx+Q8nPooW8yXDDOzwVJ67vH
         kxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776639100; x=1777243900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
        b=BAwYULtbPx3dQ88LNpUaXlILskXDk4NLnAg2DJx3QWqqxBI7uSTQw5mMaOoWxj60ih
         VeNOG9cpRi7JFyl4TqE8+jBFQRRoD/ER8FflYR34nT/bZWQzreizbcj9IM7rLFSiCmUU
         oAi2XyJ7JLdv662A6wfwROi5x/bSpg9LwrzQ7DzsBEUz5Mw+lLifVoB+mSJwPJJaOVny
         q4PfFTSB8qQC0S2snv490fjYFcp7BPFMzdKtphTfGtD9a1Fe8l8qvIVWrZeit3/gisY6
         /ABAOqDqtVyRwJrL30cS/Fahyerv+0A9SeJl+sYQmeZ2FiyWzCL1bV/DA4BMNbjDtn+R
         WvJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/naCoEc6RIfY+zp5JZT/ifQ1JJYTdcEXf5OkANYp0VsTAiIxW3zR8/s4TphmC21Hv1W7bu7YokAKvpqiZDptI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOxHK7lxc+rOvAj1M1hvMx2EIzmH7qGQCsH5Ig4O92NP561mx
	xsPWYq9RbLMvwL1xirn0v0l+xK7bTyWElXUgv6yBqY2bdBF4od5N4niue97reopxaHe2PiXkj1U
	jj1Xp5mb9mMLS1KuP8ZibY2A43ABNgl4=
X-Gm-Gg: AeBDievpgS0Tl1+z0VQ8wQorZxC4hAtZhoLOb2d/7eHxv/yocKir7WDzMSihCODJ/Wg
	uadsHoYen4Xtf68tE3AFiY+uXiOfpV9ctjiN+RYtzVtNZExwDUyBfwe4GJ3Za6pTJZ0XxbQ3EmQ
	oIZltOGhqueR331rsbB2yBy3q56AGdTtxxIYc6938ySAeaWge1HdX/XRK6dtoG2MSUuTlPZkrGC
	vt5xEAgp0vtjrpnZb7Y6CHIOeidmeKTir7iLxHcundoD87S9kF4D3sVE2+5xe4agYKP4x4WPC9r
	Zlqndrz+d8O0vnAdH2+tYF0Jg2HTXi4dJcNMqajPItlT+hmNnuzaxKjaWsB2sxAWCziULbOoGz/
	wZISOFOTF7TfDEkRIq5siZA6MDv8y7l8uOcAK
X-Received: by 2002:a05:6000:22ca:b0:43d:7883:87ce with SMTP id
 ffacd0b85a97d-43fe3dfd265mr15420059f8f.34.1776639099627; Sun, 19 Apr 2026
 15:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com> <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
In-Reply-To: <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 19 Apr 2026 15:51:28 -0700
X-Gm-Features: AQROBzDew-foTfJLq_z3E45rMJ3PdE7WT5G5Kb1cNLd7o7s_NLhMVNDGxKf8D94
Message-ID: <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 2:49=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Apr 14, 2026 at 5:58=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > I think we're talking past each other.
> > We're not interested in KASAN_SW_TAGS or KASAN_HW_TAGS.
> > We're not going to modify arm64 JIT at all.
> >
> > This is purely KASAN_GENRIC and only on x86-64.
> > JIT will emit exactly what compilers emit for generic
> > which is __asan_load/store. This is as stable ABI as it can get
> > and we don't want to deviate from it.
>
> OK, I supposed that's fair. You did throw me off point with your
> performance comment. But if you decide to add SW_TAGS support at some
> point, I think this discussion needs to be revisited.
>
> But please add a comment saying that those functions are only exposed
> for BPF JIT and they are not supposed to be used by other parts of the
> kernel. And in case you do end up adding a new config option, guard
> the public declarations by a corresponding ifdef.

I feel concerns of misuse are overblown.
Being in include/linux/kasan.h doesn't make them free-for-all
all of a sudden, but if you prefer we can just copy paste:
+void __asan_load1(void *p);
+void __asan_store1(void *p);
into bpf_jit_comp.c

> > The goal here is to find bugs in the verifier.
> > If something got past it, that shouldn't have,
> > kasan generic on x86-64 is enough.
>
> FWIW, I suspect HW_TAGS KASAN already just works with JITed BPF code.

Ohh. Good point. Looks like modern arm64 cpus in public clouds
don't have that enabled, so one would need pixel phone to
catch verifier bugs via hw_tags.
So we still need this x86-specific jit kasan.
I guess eventually it can be removed when hw_tags support is widespread.
