Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2138735F197
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777073351; cv=pass; b=u3p7uD1bkZpfm861d7ovii1b9CKArOX+d7eDfJFGlcMh62v+3mAbAl11ZzNW+3+kllm9eJ8JENzp53eic6muhOWhHyHVI1Z/DBlCjKF5TNMWlRkSRBi95j6ZO4BWwBP1yyER1xj52lIgUOtsO61iBzgswYDHypDTFNFJZPJvl4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777073351; c=relaxed/simple;
	bh=p9A3Nz6MZeWF2besohCOqD2DNsRX/iufJlsqkfWh4sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXPqpCr+IY3xgQbh62wdY71MwtAyHz8KhYuwnWx6p8d9P4HzMiihptt6b36PnMgCxfgRjuLnw2HVNa6p3m0DihaiasBe9La4Vwy7t7HVDv5IifD71jbpdtZMH6fX4Zr/8uVzYY0LDgMmaRpxYHIvn9W9a3ICsrnaihYVEjqKaHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U59jFH2R; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U59jFH2R"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so6492808f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 16:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777073348; cv=none;
        d=google.com; s=arc-20240605;
        b=dzoVBnPuHsqnZnoKJTEr5SrKxU5KGPaaO39+GmkaMtMY5UhmmWVqSxjOVQINJN4SC0
         tFYduq+SqOkYGKXle2MYg7QZSIQ20gKucZ/poHGNbliUBPzmX62VfN7rug3RMd0JO+1W
         sYVRvoy3vEwGJcje/HkdFMK/TXnfHKXDK4aL1QzHY/Enc/DrB3O6rWSbwWKQiQc5ssYA
         4c3RXYcD+m8e1mvXW9x5MFBCTxbjR2OK0oJnPpQ1uAFINwO3uw1GKjUvfVzAMKJLq99w
         5S6m0BaTm9MEcx3S+gft9Zi26QCJnbnQU9Zlciyf0cMiIhhRBOF30Q4SDSxaSWYT/3Iq
         dH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
        fh=r2HGg3w9TJdadoChRO6bu3gJoCsC+F4qMNCKXWXMjw8=;
        b=TKlMidELvOQVLyOvJ/i38sZFIrTBXhVsSGPufAX1/A9TxWNG8Dyv5N0zjtikokgW3Q
         iiuMNnkRK0cwy0x4AtuHPoBfNUf64qkxWUB5lhEcquVZrKhjqVOIEkl4MNbTgvrPjsaO
         +pst1IY3M/7KQrAdDh6pl5xvxsErzIRlhiWNPfMFz08gXPyqau9gzn3Py2/Igsvw2y2y
         K3I6z1wOE+RIDtlxWfChSibfvMbPs0rUv8S61LGE00c0XcWMDDAkRR6rzv6Rc4TRZ504
         R8QlJdhbnzmOADYk3MuHk5BOrckuqRq9OBU+WaKGHZJzsmiw4W5OD4yr7VBw6pUkRKqS
         Qqrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777073348; x=1777678148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
        b=U59jFH2RZaWhC2NrhXvjUSGORQGvTktFBeEWaTWEhyUf7xoKBCCzTAHht+GryALqN7
         gyz39yLzB+gXJrCU4BoT4YxkXG1jJ+TtFuNlALH4nKWmw+TVZ7/mQAYv/p1nspfX+B9S
         Wirl+CMjSklBNeOEOAk8+rqBGPIdbisU2uIDvngaIv06XFMN00TTuKAKx1YEl3LnxIYI
         +8TTBlwbyT73q0MdYdOhom4Cdpm1q/gjaDwM/p7RMWy9Vks9DWEUcweRzQ3k7V67Iwp0
         qhF957fFds/CuWAYsIUxanVt7lbhlZfoIw9z1DTapSB6eTkpJRNLOIkcHkF9c/60968u
         CRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777073348; x=1777678148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
        b=Te1rKK/riO1rjk2QGuVeWNfFX4Q7GCkqiQmfC7bKlAwHoc+l5dKRxteX0mI+JlxvyK
         yEHatjsOcxxJWEweRUkQ0UkXeiHmlvmAB5JVB+r/ujJ9KFYmGuOn5uLo1fuXeE1NR8Y5
         u8e4TaAhPYPobJ8vm9X6tfwL0sNwxAKZ7+Q/0ljRCJ3GxSyGjKA+WhfV3T+77x0eBsF1
         Jm+9JUOuk+FyAq/SCy9xnCaZjEf5FOwVKgaY8Dw8sZdI2Cz3h8pGEz1rELaRcZq8V9CA
         SstOhmWRKfTbz6dtY9+jYcCDAB0k+Sq55QpRDxXVqOXJAoqlPXUMaLfmQHOi9/JWium6
         vNSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+P0X6g5t3CH0pu2FeOskHCc+j42flJ9QVls1Phg3uhwi+wNOIpToi0+N7o7+85k9LC+rBepaV2hSPycP7tGwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySAq2lProHpqcZTZTBg3A9lUfGLbu4W+kBIl0aDVNn7C7xx3MR
	gil7jngvYZWAeKkyeKViYeKj3Havf1JkRgFpHzIAkbJLT7JwlsHBrcd6TkWgDKhXB3WNmLvQQJ3
	0CTrg1gL4Gpyg6+/rjNB0IjMfR/HC8kE=
X-Gm-Gg: AeBDiesrDeNkoT4p7PeEfvIWPdlaxzih3ZVzSCJKnQ/ySeLRZ+sEoNO8MvreQK1oOMp
	Iqbcy/R3pI/phbC8CFPBRiqFV4hSMvuJxDDoxjyDnaXMfbJeVoG0HBR2WexPrHEoviy//iiVDU5
	rD5HHG/MmZ5rhlOuxBv5oUw/rJNfsExEwYRDiUdPTHGUjGnBaK6spBKa3WXFTQ6Z2+5Ksh9nOmM
	yR2PVlanP8qltAaS4aHU45yi/8BX2ef72UOCjmj+dGHM3zB0BGqjMajbjKSdA1oVGianaDsWY7F
	mw6bBZmyKDnT+Nd87/ym/VH7Eo/73AzwxfwveQYZxW2j0LVN1avfQdzxmfO8cazJf9FTGjessAr
	usRAaPlwE/9u3YZX/JrrHHSrjYPyTtTHnA8eU
X-Received: by 2002:a05:6000:2c0b:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43fe3dfbff5mr53034945f8f.31.1777073348360; Fri, 24 Apr 2026
 16:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
In-Reply-To: <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 24 Apr 2026 16:28:56 -0700
X-Gm-Features: AQROBzB_ndIthouIQciueRLu_dMM7bcPcCRP_ecesud5fA9xG1Ica2sIBP2K-bI
Message-ID: <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/8] bpf: add support for KASAN checks in
 JITed programs
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
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
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	ebpf@linuxfoundation.org, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 4:10=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> I wonder if it's feasible to implement KASAN support on the verifier
> side in post-verification fixups. AI slop for illustration:
>
>   ;; Original (1 BPF insn):
>   dst =3D *(u64 *)(src + off)           ; BPF_LDX | BPF_MEM | BPF_DW
>
>   ;; Rewrite (~7 BPF insns):
>   r_tmp1 =3D src                         ; BPF_MOV64_REG
>   r_tmp1 +=3D off                        ; BPF_ALU64 | BPF_ADD | K   (ful=
l address)
>   r_tmp2 =3D r_tmp1                      ; copy
>   r_tmp2 >>=3D 3                         ; KASAN_SHADOW_SCALE_SHIFT
>   r_tmp2 +=3D KASAN_SHADOW_OFFSET        ; shadow address
>   r_tmp3 =3D *(u8 *)(r_tmp2 + 0)         ; BPF_LDX | BPF_B   (load shadow=
 byte)
>   if r_tmp3 !=3D 0 goto +2               ; BPF_JNE | PC+2
>   dst =3D *(u64 *)(src + off)            ; original access (fast path)
>   goto +1                              ; skip slowpath
>   call __asan_report_load8             ; BPF kfunc
>   dst =3D *(u64 *)(src + off)            ; retry the access after report =
(non-fatal)
>
> A sort of inline kasan directly in BPF.
>
> There are plenty of issues with it: instruction limit, exposing asan
> API as kfuncs, etc. On the flip side we get cross-arch support out of
> the box with no or mininal JIT changes.
>
> Honestly I'm not excited about this approach, but curious if anyone
> thought about this, or maybe it was already discussed?

We discussed this.
It won't work because we don't have that many temp registers for once
and second it has to preserve all (both callee and caller saved regs).
This is arch specific.

Second, we do not want other archs. This feature is x86-64 only.
It's being added to find _verifier_ bugs. To do that one arch is enough.

>
> > - not all memory accessing BPF instructions are being instrumented:
> >   - it focuses on STX/LDX instructions
> >   - it discards instructions accessing BPF program stack (already
> >     monitored by page guards)
> >   - it discards possibly faulting instructions, like BPF_PROBE_MEM or
> >     BPF_PROBE_ATOMIC insns
> >
> > The series is marked and sent as RFC:
> > - to allow collecting feedback early and make sure that it goes into th=
e
> >   right direction
> > - because it depends on Xu's work to pass data between the verifier and
> >   JIT compilers. This work is not merged yet, see [2]. I have been
> >   tracking the various revisions he sent on the ML and based my local
> >   branch on his work
> > - because tests brought by this series currently can't run on BPF CI:
> >   they expect kasan multishot to be enabled, otherwise the first test
> >   will make all other kasan-related tests fail.
>
> AFAICT this can be trivially fixed on BPF CI side, we just need to set
> kasan_multi_shot for the VMs running the tests. I will do that, your
> next revision doesn't have to be and RFC.

+1

> > - because some cases like atomic loads/stores are not instrumented yet
> >   (and are still making me scratch my head)
> > - because it will hopefully provide a good basis to discuss the topic a=
t
> >   LSFMMBPF (see [3])
>
> Apparently, KASAN reporting routine takes a lock [1]:
>
>    __asan_load()
>      -> check_region_inline()
>         -> kasan_report()
>            -> start_report()
>              -> raw_spin_lock_irqsave(&report_lock, *flags);
>
> BPF programs can run in NMI context, and so it appears to be possible
> to get an unflagged (because of lockdep_off() in start_report)
> deadlock, if an NMI fires on a CPU already holding report_lock.
> Although I guess you'd need two KASAN bugs to happen
> simultaneously for that to occur?... A rare event, I would hope.
>
> It could be addressed with either in_nmi() check at runtime, or
> forbidding kasan for NMI-runnable BPF program types.

We don't need that. If this bpf KASAN finds a bug, it means that
it found a verifier bug. All things are out of the window.
kasan_report() splat can just as well be the last thing that users will see=
.
