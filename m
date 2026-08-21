Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DECA3E0096
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338774; cv=pass; b=Kn7k/KRe4jA+iOCev6c0p9UuL+LpZ96jRCRjGF03FKcAF6V1bC6p6kGSYdUNjj9kDJ35rvKvqz1R/9ael548vv00ZCTh8BX8/641kZ+2SEefn5rEjzcFut1kAwx6IiDH88//t8k2KRkoX4Pz5SVKFpUtNM9IA/FWPp5m1UAfU6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338774; c=relaxed/simple;
	bh=AFR5j/E+alV1r0U1SDwyPiM3jV5eLh89yD4tL4f8VFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1x+hyZ6l7wKDtIkTw3PBlQkRpC4QWHfm0WPpoWxMTYtyUh9F0/5/urbLNQIijnkjuMMzKATyKAArssButA5IC0W1p6N06RxA6yJ0xSMGX6/qF5O7X63MxrOVI8GZZ+QuO4EQTQSBhjaYGinIJXefhxF3TIkX8+gU0yCyK9dRYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIXkUMvt; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIXkUMvt"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso1313455b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787338771; cv=none;
        d=google.com; s=arc-20260327;
        b=PZcelF18e+3ehRKUhfeHUEMAwNnVwLkyQ+VFE8dJ5H4b81W7q9gySunUVkOOPq8Fmk
         5wEdVwZ2OHhJld+3zAsBl6eGRSeO3zviHjxIhlMVo4VS1eHEPS7rw/9zAwaoOjrhZ4R4
         v0FVmKaOuevM6NgoVt/ZC9v5/esxVdD6G+U3+kVXU0XCZWhfkMz+V86yap4b3j1vD3K9
         by3KlKSMWfDc2Ulz/i2ANWRbQ5avpnYPPFQyR9MIeh8BPjqePPAZr6BQ2eUtkXNnGH1W
         BZC/QM1I5Y6br8kk+3zRqWxkfV/kdFNmStSqMKBbbUEkn81+a1mD42lkHPehKjZ07ENh
         iKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mva2CstD7vfm2pkhnnkgyhGYkX7BPVNHMBfl44NT5Gg=;
        fh=vNwem7IzHAsMsoMmdnMl7msLJDkk7JoP876uSjGHHcs=;
        b=CTtT5p8V3sO/fZXFqcjD564h2dZxuI/Xi+Y5qkxQRs/6hPD5iaY9BkQaorivHjvxyP
         eevFIVVXH6cuhjnbRuMd/7tFM9aRa21RDRfmlfQOVxh4wRSGk8Q59XTlZcxWTi99qJLn
         ONWbr8FFYjsAb0YNEglQEb0mk/c9gipH0G1/er3hF6ZnsFdeaZKHKi/gPq4DW5mLNwFA
         vItNywppqh3MLX3pdQuwBif+Xu/QYzGBSR4Tzjc600FCJiUE497c1fLd7UkdiFEcArPP
         3warl5ucKoOyfJSfl0D/blo9dsds2S4ZdhvnhbOws6Rfnd3ComVSMEk8H11MdJOhywSj
         GN7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787338771; x=1787943571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mva2CstD7vfm2pkhnnkgyhGYkX7BPVNHMBfl44NT5Gg=;
        b=EIXkUMvtla+p28EjLL/uywozeaMtFpBZJO9xlpX5k9ejAnQV+xnQ87eNE5Qo02ZY6U
         +EPciarc4roA2FemXehZVsz4fJ5QsnTkXvZjaeriC5TyKmOmrM5wsCgDTiuudPY8cyd9
         P+2keSfZG0wLTowngfW0p51cVHZrS6bJ0dHKh7mR9c0FKzJgT2DPhfwd8iQMj2QRkI/R
         z2fkEZEGGFsuuFM9iqQh9L9zHUKyPajhBI1RNMg582QunG3p9sMDTRbxPLoDPKnEP32g
         7yNzhAQ33ssAz618akdSPMwUmNlaAnuIFTOLF0SY6aoYvVaYfKXRHgZE6GeqoxrOztMy
         xcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338771; x=1787943571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mva2CstD7vfm2pkhnnkgyhGYkX7BPVNHMBfl44NT5Gg=;
        b=LVVGnzXGo3ETsTH7xGrqVapgIS8jQ+nyJoUCYMRRtq2/SOzcLSeZaRItyyYrKI8gti
         0/yQaIe4jwzPsFAGSZzLVKfY2hsnjJ/UYiXJnFcUVvu9VVFU1GfgWTwAo7DYzkMSCIdq
         3vKM/hWwL3N1L/mNbWf0Tn9uUWIw029oYNr0bF/K68bU3Pn5/Q2eiNC4I+RqTClHetHc
         SQEHY/cpBy6lgYJWjIQstjojyHohGTaZYWlIRGfZPHQQtD9ZHu93g/1OgrDcarPQOn8d
         sPzfjTITCXrvKA3Pr1kRXa0p6bIO8V7OW0szkb+aQVIrjh/Bxy9fWdgV9j73bDQ5JzWY
         hQdA==
X-Forwarded-Encrypted: i=1; AHgh+RqW3pSoSjyzSyt9QOO+USANLyxWgujcU9I7rQxD0XrL3pYCrIFGQggMXKqgSBWg5rPvQZwieHla+YB9qOcmF74=@vger.kernel.org
X-Gm-Message-State: AFuF++nJluWepG1tQpxWMlRupE8i8WJMUoOeWRaeCRk756cnfReGGNIw
	t6Icic97k5i+/gE7aPFA1FCQFkZJIOO53I1JewsLDj4YeiemNyAmTA8vr/RkHevQL2g+rhKXgRW
	m4UMBBzE6HlSQo3j6J6X081F8+Gwji2U=
X-Gm-Gg: AR+sD13zQcA7ue+fMuBy9sTYB3xh/GEymKo8hSfrMKSwgp6OxjStGOU/vDFENfE0VLu
	1no8E2AE9LfhFrMOr6lh9cpM0cULZtWjTf+9v25242ndeW8yE0uL0X9sPtOvXfVlOFvMktVQ3GZ
	rmPVZb4L1MbxoP2EswvX9APMfRnmLq71j6mwAxqoI0fWulVZPloD0OcnUMtn9APzPehOFMP2Pb0
	QBjCXcAZf6EqJkwl2eELwCvMkM3fsA5BAUyzSpbzQjWUvt+O64MC4N22416yvrB6wbO/XN7ULdg
	PLJcVxM7Yig+P+oNJ4h1ZN1zz2AOtgYCt1Ggwoj+wViVFd7fqjv1VilNwJXjbDgXYHCN5Qad27l
	LAJVxlzhpTdbtGYsAy1i/1oywEw==
X-Received: by 2002:a05:6a21:d89:b0:3cc:f008:8125 with SMTP id
 adf61e73a8af0-3cd4b9a9fabmr1769365637.1.1787338771287; Fri, 21 Aug 2026
 11:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-kasan-v6-0-549ef845f491@bootlin.com>
In-Reply-To: <20260804-kasan-v6-0-549ef845f491@bootlin.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 21 Aug 2026 11:59:18 -0700
X-Gm-Features: AcwNN1VR07Dekv_14zrWRhsyNNowJLS3qq7JggqSAkCmd4y9Of-vH_Gsd5BLsg8
Message-ID: <CAEf4BzZHMmfKTAxq+eo1Muq16EveZrjO_ONdFvWTs1rwrhh3oQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 0/9] bpf: add support for KASAN checks in
 JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:45=E2=80=AFAM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Hello,
> this is v6 of the series aiming to bring basic support for KASAN checks
> to BPF JITed programs. This new revision takes a step back on stack
> accessing insn tracking, as the previous attempt was fragile and
> error-prone, it brings back a simpler tracking, at the cost of some
> unecessary checks being inserted. While at it, I took this time a look
> at how many accesses are being instrumented, and how many of those
> are "wrongly" instrumented (because they access stack), and I got
> those rough numbers on the whole selftests set:
> - total: 451997 checks inserted
> - checks added on stack access (checking reg =3D=3D BPF_REG_FP, not preci=
se,
>   but gives a rough idea): 21786
>
> So that makes ~5% of "over-instrumented" accesses
>
> Original cover letter:
>
> "Traditional" KASAN allows to spot memory management mistakes by
> reserving a fraction of memory as "shadow memory" that will map to the
> rest of the memory and allow its monitoring. Each memory-accessing
> instruction is then instrumented at build time to call some ASAN check
> function, that will analyze the corresponding bits in shadow memory, and
> if it detects the access as invalid, trigger a detailed report. The goal
> of this series is to replicate this mechanism for BPF programs when they
> are being JITed into native instructions: that's then the JIT compiler
> that is in charge of inserting calls to the corresponding kasan checks,
> when a program is being loaded into the kernel. This task involves:
> - identifying at program load time the instructions performing memory
>   accesses
> - identifying those accesses properties (size ? read or write ?) to
>   define the relevant kasan check function to call
> - just before the identified instructions:
>   - perform the basic context saving (ie: saving registers)
>   - inserting a call to the relevant kasan check function
>   - restore context
> - whenever the instrumented program executes, if it performs an invalid
>   access, it triggers a kasan report identical to those instrumented on
>   kernel side at build time.
>
> The series comes with new selftests programs that generate a wide
> variety of kasan reports: those need the kernel to be running with
> kasan_multi_shot enabled.
>
> As discussed in [1], this series is based on some choices and
> assumptions:
> - it focuses on x86_64 for now, and so only on KASAN_GENERIC
> - not all memory accessing BPF instructions are being instrumented:
>   - it discards instructions accessing BPF program stack (already
>     monitored by page guards)
>   - it discards possibly faulting instructions, like BPF_PROBE_MEM or
>     BPF_PROBE_ATOMIC insns
>
> ---
> Changes in v6:
> - dropped instruction original offset tracking
> - when patching instructions, track former non_stack_access flag by
>   passing original insn to adjust_insn_aux_data
> - drop unecessary dep on CONFIG_KASAN in Kconfig
> - fold patch adding the emit_kasan_helper into the patch actually
>   calling it, to avoid an unused static function warning
> - move stack access check out of emit_kasan_check
> - replace hardcoded ip value by a computed value
> - add OoB testing
> - add fix commit to make cmdline_contains stricter
>
> - Link to v5: https://patch.msgid.link/20260709-kasan-v5-0-1c64af8e4e1e@b=
ootlin.com
>
> Changes in v5:
> - fixed a few instruction offset for generated fixups
> - fix insn marking for single insn patches
> - enforce more checks in tests
> - skip tests if kasan_multi_shot isn't enabled
> - Link to v4: https://patch.msgid.link/20260708-kasan-v4-0-d5c177ab8227@b=
ootlin.com
>
> Changes in v4:
> - fix insn_offs_in_patch leakage in bpf_convert_ctx_access
> - handle BPF_ATOMIC in is_mem_insn
> - correctly mark fixup instructions if a single insn is generated
> - clarify new kconfig (Andrey) and drop VMAP_STACK dep
> - refactor BPF_FETCH atomic handling in JIT loop
> - make kernel log reading resilient to unrelated, interleaved logs in
>   the selftests
> - make new test kfuncs depend on BPF_JIT_KASAN rather than KASAN_GENERIC
> - Link to v3: https://patch.msgid.link/20260701-kasan-v3-0-bd09bb942d86@b=
ootlin.com
>
> Changes in v3:
> - Do not insert KASAN instrumentation when dealing with cBPF
> - Fix stack-accessing insn tracking for verifier patches, as original
>   instruction location in the generated patch may vary
> - drop cBPF support for stack-accessing insn marking
> - make sure to flag correctly memory access if different verifier states
>   involve different memory types (eg: stack in one path, non-stack in
>   another path)
> - refactor BPF_ST handling in x86 JIT compiler
> - improve tests coverage (cover instrumentation for a few patches
>   emitted by the verifier)
> - Link to v2: https://patch.msgid.link/20260604-kasan-v2-0-c066e627fda8@b=
ootlin.com
>
> Changes in v2:
> - declare asan functions as extern in JIT compiler rather than exposing
>   them in kasan header
> - invert stack-accessing instructions marking to make sure not to skip
>   instructions that could end up accessing to-be-checked memory
> - fix stack accesses marking when verifier patches instructions
> - add best effort marking for cBPF
> - add missing call depth accounting in jited instrumentation
> - skip unused registers in kasan instrumentation save/restore
> - remove faulty stack align in kasan instrumentation
> - drop commit skipping some jit-related tests
> - cover missing instructions: BPF_ST and atomics
> - completely rework tests: directly tune shadow memory, increase
>   coverage, do not consume kernel logs
> - Link to v1: https://patch.msgid.link/20260413-kasan-v1-0-1a5831230821@b=
ootlin.com
>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: John Fastabend <john.fastabend@gmail.com>
> To: Andrii Nakryiko <andrii@kernel.org>
> To: Martin KaFai Lau <martin.lau@linux.dev>
> To: Eduard Zingerman <eddyz87@gmail.com>
> To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> To: Song Liu <song@kernel.org>
> To: Yonghong Song <yonghong.song@linux.dev>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Borislav Petkov <bp@alien8.de>
> To: Dave Hansen <dave.hansen@linux.intel.com>
> To: x86@kernel.org
> To: "H. Peter Anvin" <hpa@zytor.com>
> To: Shuah Khan <shuah@kernel.org>
> To: Ingo Molnar <mingo@redhat.com>
> To: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: ebpf@linuxfoundation.org
> Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: bpf@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
>
> ---
> Alexis Lothor=C3=A9 (eBPF Foundation) (9):
>       bpf: mark instructions accessing program stack
>       bpf: add BPF_JIT_KASAN for KASAN instrumentation of JITed programs
>       bpf, x86: refactor BPF_ST management in do_jit
>       bpf, x86: emit KASAN checks in x86 JITed programs
>       bpf, x86: enable KASAN for JITed programs on x86
>       selftests/bpf: make cmdline_contains stricter
>       selftests/bpf: add helpers for KASAN in JIT testing
>       selftests/bpf: move bpf_jit_harden helper into testing_helpers
>       selftests/bpf: add tests to validate KASAN on JIT programs
>

Alexis, please resend your patch set rebased on the latest bpf-next,
it has a merge conflict. Hopefully we'll get around to reviewing this
after the resend, thanks!

pw-bot: cr

>  arch/x86/Kconfig                                   |   1 +
>  arch/x86/net/bpf_jit_comp.c                        | 283 ++++++++++---
>  include/linux/bpf_verifier.h                       |   2 +
>  kernel/bpf/Kconfig                                 |  17 +
>  kernel/bpf/fixups.c                                |  45 +-
>  kernel/bpf/verifier.c                              |   9 +
>  .../selftests/bpf/prog_tests/bpf_insn_array.c      |  44 +-
>  tools/testing/selftests/bpf/prog_tests/kasan.c     | 454 +++++++++++++++=
+++++
>  tools/testing/selftests/bpf/progs/kasan.c          | 462 +++++++++++++++=
++++++
>  tools/testing/selftests/bpf/progs/kasan_harden.c   |  41 ++
>  .../testing/selftests/bpf/test_kmods/bpf_testmod.c |  55 +++
>  tools/testing/selftests/bpf/testing_helpers.c      |  32 ++
>  tools/testing/selftests/bpf/testing_helpers.h      |   1 +
>  tools/testing/selftests/bpf/unpriv_helpers.c       |  21 +-
>  tools/testing/selftests/bpf/unpriv_helpers.h       |   2 +
>  15 files changed, 1369 insertions(+), 100 deletions(-)
> ---
> base-commit: 5fb2b9636c7043f415a12e3336f2bf6983c9e93a
> change-id: 20260126-kasan-fcd68f64cd7b
>
> Best regards,
> --
> Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.com>
>
