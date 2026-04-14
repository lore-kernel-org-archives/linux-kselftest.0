Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949F396D1F
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177533; cv=pass; b=HMhsfG8uSuQqzLFpuKpNnzTYgtaZ9tVdUwKfJkz3VfG+XYjhH7/02dMg9lmUXc0orTgQEjDiSmIUq8JMtE/uK5AbvdgTxMfI0NcDQigVvieChVC4Hw+kyEmTXwNR3TfTC589S+HUUM8e6dfc8+gtGv9n6IFIZMbc0Mof9EkVU/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177533; c=relaxed/simple;
	bh=ZvMerGqSJAlyqgeddQ6lYem489w5ZSqqOzbNiQRZjn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iACY9UjLSvknRboQUM31tkHWRk+GGQxMiQkOej3pLQ81iUJn93gl2QnUIjLRRB6uHLFb1O0VxaZG0UErfVKRRaArEcD4fv2lvAd5S6HcB1uKqzCOtCJQONGmxJYkc031dEam/06X4Enk+6FFq/ZUaucMmFz1uMqAa8fRT4RRr4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mrx6BKQa; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mrx6BKQa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso4829139f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 07:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177530; cv=none;
        d=google.com; s=arc-20240605;
        b=QRF/YuLiI8KzH2g9Uwb2eTmk6B3EAfNiQJ16/yEC9OG8rZ8hwjpwnAPw6bkLAKcjDQ
         n/JZ8NXF9SnrDwNzUkWFGIjrhge1XA47XUQVobxUzgIe5Xn+NvS1kg/bMBopXgO1H/zs
         i9QO5bz+uE4Pn8wzptf3OQ8VwPr37M15WXOoNhNh8FvFk09ufgVmys+An9D+PpJDlQl7
         W1fQODvoopcA5C1oba2w54cewTPPOnKMnWLhbVTflDgqN+LnuGBk14T1afU12AQ4FdrR
         Np8gSL53ilDUVv4PsOYs8OiAzxJjfZwmoSRU0yQ/tmxX/XF/f+XN44q0tVCrX2htCHgM
         sFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
        fh=UXLfHL5EDq9dlLxhkVo18S6/j9dwS0fzbf2VfVLLlKw=;
        b=YqQSH9fir/2NkBYjr4KbS/Mzt/qrtw9TAQPan3fAXhgkzSvjDzh7nhRMHyh2+njThw
         BZN4dmAY1Em1kzHKCkXwm9dnvkyELoHn15Ozxiba0UAC2AdpvXxyOXhx+KzlliI39Acq
         v9yvg+6qkdMS3yLayjCJiy+R5ZgPu9mnP7tPWX7B/uQfkDrapWdhwJA3Bj6bCXDvXYwt
         EgaFfOb7XH5nYpOPCNeFhUvRkFnON1//rbK608wmG5MS5JpxIdChuVdQ0lVOJ+W2gAR4
         /gmuIlMkmm/l7Wx6LGEpC2aVytQGXPS1My2LTtd5yzfGZWX4YfAp7hqfTyhw6l105+65
         EkgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776177530; x=1776782330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
        b=Mrx6BKQac/mEAyn4HtM7CA/4zoqjbafFfoOa3S5jeSGGwGbKSXmN2jivtA8VEYQJYw
         z9Ue1GdunUm5I9i9avQeEKnEvBc9lc/FhuMxJp7/ZaQMxjtywG7YwF2oSRuLLMwb7E+Q
         zEAZ/EfdfvZEgvZz3KWjh4FUtdtb1XMKRwb4tOeMnvom+tZUDs2JlSK3l6Z5Zu/z05i3
         0JNubg6yJ+UDiJcZbtNBmu2meWIPmgYH9GfLO4PRhBw2JJ5SFiOd8ZeTigvYHothvHa2
         EEFEeDrnwNaSOp9YHhdwpZ2oqRrZA+wWzkBUBa6q0ME48njcpfFcQG9Ckl2I1im5Wxm4
         /JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177530; x=1776782330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
        b=EVB+4av4oTniOnqq0WnZ7cRTtwXAcphV9M9u8DEq3OALvGRjoZqB7CazzBaoR0yKdD
         vvGmPRvaCFXDEcrvMx05ZkxFK0CG2wTNP+XbZ6/x6Io2cngWQ8R5k5SGkmioXulN5CEE
         Dan4SPNNzlOTQDC/idTQR9sfjMNvZG3x7uWA4RiuWNF9ghjZEh3rscnL/JUaEw+NpiGK
         H0qF5h/7iYTfyiZDAolaoCfaADT7dxoWcBYGmcLyjgOu3k4x5BUcx9fZi88WwqRM+Fvg
         AqOSQ/Eyt6jiDuR6ebQECPa6trTeGLMYQKNIIq3PtOiaIGkJESlhGrQn8y3LkvX1HnE3
         ftmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ePBvstmLUwCFrmof3GBVu5+8z17yHgLVXkPxEOj/5jfYVPQFZFHdKLN4lLvaj6w8a7BIkCkZ0+g3x88C3F8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yyCea5zWT+VsUJiJdm0wbYT90ftBAgRyRWSquIAODt3+iIOa
	wa9uPcDuZzuOtdIXB/1vcERxIOvzzwtJmrXPoWD/AXAk/F8GuDtIV7iBGbte/OgY5bJB6DqQ9Do
	PQSRy8k6tQsDRHeuCyJ1H5rxz0yzPw6Y=
X-Gm-Gg: AeBDietqaI/fadT8K9Qpqdxqg85FQEbIUMHrt/dw0QSg200W6+e5EQo/jvJpGuySFtc
	NYGi0JLK3cx8iXFi6lwnfIXUWnqMNCW0oSDKFnRTOGnSkjwX5Uh2oO/ahFvdN62V+TuIFui0fkn
	kEOosuuLILKvfzVFWxvTAnBaAhmtpd6PFdCC5KtoSwlMokxRc5VLNLvrGhk+IhXpdTEiSDk5dX+
	1O0L+4u48KmNIhcfjS7MiCXUBMokhFMs+iacJ1fRIp5w6sacKmTM23kOyT54IaPkF2hxKLqmiEW
	fygp1i20MYqmSixWEvl5d02utGktd2GTPc6VeZKWsoTkoayoJgZLTKbDAzlSkXV9bD2tcM2/j31
	UsxtjEQ3qm93gg+lQYuH1wfh3Hw==
X-Received: by 2002:a5d:5d85:0:b0:43d:73de:abd2 with SMTP id
 ffacd0b85a97d-43d73dead51mr14691281f8f.26.1776177529609; Tue, 14 Apr 2026
 07:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com> <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
In-Reply-To: <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:38:38 -0700
X-Gm-Features: AQROBzAAc3g7dGJeHc3HZECQFqFuOBrJ_YiWzr60z_aqmL-sqKG6l_qunoKkETU
Message-ID: <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
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

On Tue, Apr 14, 2026 at 6:24=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Tue Apr 14, 2026 at 12:20 AM CEST, Andrey Konovalov wrote:
> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Found=
ation)
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enabl=
es
> >> KASAN (Kernel Address Sanitizer) memory access checks for JIT-compiled
> >> BPF programs, when both KASAN and JIT compiler are enabled. When
> >> enabled, the JIT compiler will emit shadow memory checks before memory
> >> loads and stores to detect use-after-free, out-of-bounds, and other
> >> memory safety bugs at runtime. The option is gated behind
> >> HAVE_EBPF_JIT_KASAN, as it needs proper arch-specific implementation.
> >>
> >> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@b=
ootlin.com>
> >> ---
> >>  kernel/bpf/Kconfig | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> >> index eb3de35734f0..28392adb3d7e 100644
> >> --- a/kernel/bpf/Kconfig
> >> +++ b/kernel/bpf/Kconfig
> >> @@ -17,6 +17,10 @@ config HAVE_CBPF_JIT
> >>  config HAVE_EBPF_JIT
> >>         bool
> >>
> >> +# KASAN support for JIT compiler
> >> +config HAVE_EBPF_JIT_KASAN
> >> +       bool
> >> +
> >>  # Used by archs to tell that they want the BPF JIT compiler enabled b=
y
> >>  # default for kernels that were compiled with BPF JIT support.
> >>  config ARCH_WANT_DEFAULT_BPF_JIT
> >> @@ -101,4 +105,9 @@ config BPF_LSM
> >>
> >>           If you are unsure how to answer this question, answer N.
> >>
> >> +config BPF_JIT_KASAN
> >> +       bool
> >> +       depends on HAVE_EBPF_JIT_KASAN
> >> +       default y if BPF_JIT && KASAN_GENERIC
> >
> > Should this be "depends on KASAN && KASAN_GENERIC"?
>
> Meaning, making it an explicit user-selectable option ?
>
> If so, the current design choice is voluntary and based on the feedback
> received on the original RFC, where I have been suggested to
> automatically enable the KASAN instrumentation in BPF programs if KASAN
> support is enabled in the kernel ([1]). But if a user-selectable toggle
> is eventually a better solution, I'm fine with changing it.

Let's not add more config knobs.
Even this patch looks redundant.
Inside JIT do instrumentation when KASAN_GENERIC is set.
