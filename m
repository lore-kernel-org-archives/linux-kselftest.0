Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D17352958
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771692706; cv=pass; b=H4eDWngfnpNV9mRADZVx+p6UeYMkxXpfRaaGKemRlQKWUZO0HpmT7Ik89G4+1uQQHyh0njiix9OziceDecqjoXPGo+cFhLAKrYb1uAeqkiu303P2f5x5VCnaB2h0Qml+YbfurMr8qaRKRZxOWcuQ6JSw0CX2kWCjtYhPD3MMf5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771692706; c=relaxed/simple;
	bh=ISMeaFGkM1t/rcoHTy00tzcyFwk6QjXPrYp0XSfWpw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUKjmUkKfce5wza1FzxYUzuAte9tXBSjke8YQluLEyBC78TWaGRFtlMEQO4sMrX8GhoN+2VaRyYrSgOuQ5bqEhECxtQJdsAm5g8VuW5BU0lkdUWDRbfpKO87JMPnesH/hr1kVUXvE74C5P5WPK8fUaGXOLf1F89ed4jGyG6yO8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNvXGSvp; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNvXGSvp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so2284313f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 08:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771692703; cv=none;
        d=google.com; s=arc-20240605;
        b=P9AkvIWMymZL7bcIkrPmDDwlYNgFnxq+Fx48Sv+zfZVxJ/VjI9NzBJISC7cXNDhT+j
         iJSq1QpLwSHnb6XOdYaVGWIIm8WkuLum5SJZlLQchfUeO0zBqz3bpdQcCHd3DLUG7wVf
         l6kTW8TtqweE0erxGytexV4mEXNrTVy1rNoB5K1W7Gghc23qFfWKkKL5KXtZ10blREpy
         f0/I1QgW2iyo70EcUCpZ9ZwItDNEKAQ4pLArGdJGh0XeL2lLmdX6lGS2FsV1og3eF0HS
         59JUH0DGTYFJWNDqUiioo0CNJKr/M9dmaP1ld5z2qhDUMxFhPylCji8ZA45MUGp9qA5t
         e51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=;
        fh=Du9+QhVZfLG6bXIv76qpw1ZBvhFxpvWklYnNFy5tU6o=;
        b=EFX0fNiqafBUzSyhU1B47gm7dX+yn6DjoCUOZYR7nfypQ1ZLI+ycvAYD0vlvrT/mbp
         tbJTF09FzsnRySS39QmuspVSch8tXwyRY9Y69PU+cIPH1MN08ZDEzwb9A1VQmWxMAPwt
         RiwIB+eL6llJPhrLd6Ah75c/r9dS8lPUccTdvrW9MsnipTHIst4io3PjjHmlaoHqFE8g
         grN2PpNXYKecG9A+quCFIjchAiJBRkntk0rAm9JiVppySc6iS5+iHA6GybsTwH6Ah7hd
         2Yad3z4Kn8dP1GaAMSBAsjeQNGNP0T+P8t5jB7utnSmv3hRMonR4p46F25zWxe0HeJtc
         HHtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771692703; x=1772297503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=;
        b=LNvXGSvp4GOwg6mfUO74scnJBC/+3xWm+aXloNBxUpptrpV4cGiiQOzLDtZ1y4GTZx
         9QBWZxZTKnjZpYgjCLZ3gL0/DgpFPwjfHaGv9MNsGItGue262zIWumgw1y8+ffnrqD3s
         dH5PFsFl35H4voTKs5XIzCBaeL02EZTy3lDbskMTXGZ2ISj+pd45dPE6ep2XJ75qtprq
         lHjcmp80MlFj7Lc3rmUUrDtO0Trgaw8vhXTiHuXJw4ipVYC3aKeH/Gwvts+yM7Mg7ImL
         7kOAbJXcGMrfNLuzTRcb795Ol4YT+MuKe+m/uFDykUyifgjL5zrIsevxBwZb8Ej8ewhj
         eEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692703; x=1772297503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=;
        b=xA8fHH5H2YuSpNFcPKUE1hYKS2IjBgZjlAKl2jzDaT+bP8FVLHJwE6/qZBeuvVRgIZ
         QKTxTWc0DXiISHEOwGB3h6Xwr2OigRZ408X3ZzyJ37+CeVioA9zuuq3soo+I+OBQ6+su
         uj3PwZ0wbvIeGoQLNXBeJ6qXE2IgkcxNQqG0tNEYPu/ZM5KGI/C1RV/O7ojEEdzuMy9T
         UT6lGz8Fbdo9hJSLm7BMD/ildBKQsscl9/+biUXKG320FgcaASCcCiNeR3G0+WV8zfgq
         r867A2mlfdw/zODEQjgGGhBrGWUCLhgF9ZOHw+KeLoBcT9ZXBvozKwrsagXB2ZWss95y
         U+fA==
X-Forwarded-Encrypted: i=1; AJvYcCWG4csDNt4EdQNeu9cwK5tCj4szg82qnCP3Cii0c2nUgkTgtGQM6iEh8KrUuUpYqFWCuuzrQIxmVm3bvQg9bCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHyw3Zr2I5Gavk892lw++pJLjZbvZ4KgyBuraAmj5Q8hMlchG9
	Ip8yW773zaVoZXBL9V97ZZNoo6x/GmJSlcv25l5oqYz7bPWhdHIUvBOTUNh8JEDyX/wnafruS4i
	zSw8cxpqsKveXbRXnkJ2DWzm9iWGMnSY=
X-Gm-Gg: AZuq6aJHkKLFrwIaUv7bgkU5ZuJeDitruEmHJDgen11gGgDdxoigT/DAWN8SDoR1LHA
	ojDmjEKVvFnlfsGNHCC4EEeNWftDfJqSzECMfe4rDP2q/6sFRRm9hYsNpww96+v9DdytWmaos4P
	SIiRTKnACHuxJCaQxrshuD19a9a2mjXcM5J3z46YxNYnJ7Wap4HwZ6WKoz8QceFLq51N+hgnTRG
	KoJEoVoA/lYeJaBqZfH+VJxiLNq1yDxzSTMdnTHiOwnbN72SF8pokxtFJS1G+zaR1g1DGFWn0vs
	Kag7PIeEMvdFn+MOfrFTnkWkNoT5DgewBcRPSIkAJfLG9JAdHILA7F8oiJ9TZ9Kl71LKZ8Z4dYF
	8gBvKvLnw/r6BGlaLJR4wQyy7hg==
X-Received: by 2002:a05:6000:290c:b0:437:7168:af50 with SMTP id
 ffacd0b85a97d-4396f182e99mr5976364f8f.37.1771692703222; Sat, 21 Feb 2026
 08:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-3-leon.hwang@linux.dev>
 <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
 <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev> <CAADnVQ+iQkvb9-wOchuPrUOneqzx9Rrqto88=R7GUOqih6PhZQ@mail.gmail.com>
 <4c40705a-4e6a-47ea-b420-223318d1ad09@linux.dev>
In-Reply-To: <4c40705a-4e6a-47ea-b420-223318d1ad09@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 21 Feb 2026 08:51:32 -0800
X-Gm-Features: AaiRm52nj1X-_nBJIgAQ9NCx4CHzjnra7QF_C1bGfU9ssH2LC_icyswN6XymldQ
Message-ID: <CAADnVQLsJV8OaLCxznwbnxdLVOQ+t=MmAr2O8Y89iPErCvphFQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 4:45=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 2026/2/21 01:50, Alexei Starovoitov wrote:
> > On Fri, Feb 20, 2026 at 7:54=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >>
> >>
> >> On 2026/2/20 01:47, Alexei Starovoitov wrote:
> >>> On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.=
dev> wrote:
> >>>>
> >>>> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
> >>>>
> >>>> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
> >>>>
> >>>> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
> >>>> X86_FEATURE_BMI1 (TZCNT).
> >>>>
> >>>> bpf_clz64() and bpf_fls64() are supported when the CPU has
> >>>> X86_FEATURE_ABM (LZCNT).
> >>>>
> >>>> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
> >>>>
> >>>> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
> >>>> instruction, so it falls back to a regular function call.
> >>>>
> >>>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> >>>> ---
> >>>>  arch/x86/net/bpf_jit_comp.c | 141 +++++++++++++++++++++++++++++++++=
+++
> >>>>  1 file changed, 141 insertions(+)
> >>>>
> >>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp=
.c
> >>>> index 070ba80e39d7..193e1e2d7aa8 100644
> >>>> --- a/arch/x86/net/bpf_jit_comp.c
> >>>> +++ b/arch/x86/net/bpf_jit_comp.c
> >>>> @@ -19,6 +19,7 @@
> >>>>  #include <asm/text-patching.h>
> >>>>  #include <asm/unwind.h>
> >>>>  #include <asm/cfi.h>
> >>>> +#include <asm/cpufeatures.h>
> >>>>
> >>>>  static bool all_callee_regs_used[4] =3D {true, true, true, true};
> >>>>
> >>>> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, =
void __percpu *priv_frame_ptr)
> >>>>         *pprog =3D prog;
> >>>>  }
> >>>>
> >>>> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
> >>>> +{
> >>>> +       bool has_popcnt =3D boot_cpu_has(X86_FEATURE_POPCNT);
> >>>> +       bool has_bmi1 =3D boot_cpu_has(X86_FEATURE_BMI1);
> >>>> +       bool has_abm =3D boot_cpu_has(X86_FEATURE_ABM);
> >>>> +       bool inlined =3D true;
> >>>> +       u8 *prog =3D *pprog;
> >>>> +
> >>>> +       /*
> >>>> +        * x86 Bit manipulation instruction set
> >>>> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instru=
ction_set
> >>>> +        */
> >>>> +
> >>>> +       if (func =3D=3D bpf_clz64 && has_abm) {
> >>>> +               /*
> >>>> +                * Intel=C2=AE 64 and IA-32 Architectures Software D=
eveloper's Manual (June 2023)
> >>>> +                *
> >>>> +                *   LZCNT - Count the Number of Leading Zero Bits
> >>>> +                *
> >>>> +                *     Opcode/Instruction
> >>>> +                *     F3 REX.W 0F BD /r
> >>>> +                *     LZCNT r64, r/m64
> >>>> +                *
> >>>> +                *     Op/En
> >>>> +                *     RVM
> >>>> +                *
> >>>> +                *     64/32-bit Mode
> >>>> +                *     V/N.E.
> >>>> +                *
> >>>> +                *     CPUID Feature Flag
> >>>> +                *     LZCNT
> >>>> +                *
> >>>> +                *     Description
> >>>> +                *     Count the number of leading zero bits in r/m6=
4, return
> >>>> +                *     result in r64.
> >>>> +                */
> >>>> +               /* emit: x ? 64 - fls64(x) : 64 */
> >>>> +               /* lzcnt rax, rdi */
> >>>> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);
> >>>
> >>> Instead of emitting binary in x86 and arm JITs,
> >>> let's use in kernel disasm to check that all these kfuncs
> >>> conform to kf_fastcall (don't use unnecessary registers,
> >>> don't have calls to other functions) and then copy the binary
> >>> from code and skip the last 'ret' insn.
> >>> This way we can inline all kinds of kfuncs.
> >>>
> >>
> >> Good idea.
> >>
> >> Quick question on =E2=80=9Cin-kernel disasm=E2=80=9D: do you mean addi=
ng a kernel
> >> instruction decoder/disassembler to validate a whitelist of kfuncs at
> >> load time?
> >>
> >> I=E2=80=99m trying to understand the intended scope:
> >>
> >> * Is the expectation that we add an in-kernel disassembler/validator f=
or
> >>   a small set of supported instructions and patterns (no calls/jumps,
> >>   only arg/ret regs touched, etc.)?
> >> * Or is there already infrastructure you had in mind that we can reuse=
?
> >>
> >> Once I understand that piece, I can rework the series to inline by
> >> copying validated machine code (minus the final ret), rather than
> >> emitting raw opcodes in the JITs.
> >>
> >> I also noticed you mentioned a similar direction in "bpf/s390: Impleme=
nt
> >> get_preempt_count()" [1], so I=E2=80=99ve added Ilya to the thread to =
discuss
> >> this approach further.
> >
> > You really sound like LLM. Do your homework as a human.
>
> Got it.
>
> I polished my draft using ChatGPT, which would leave LLM smell in my repl=
y.

... and for anyone reading it the smell is ohh too strong.

> Here's my original draft:
>
> Good idea. But I concern about the "in kernel disasm". Do you mean we
> will build a disassembler for whitelist kfuncs at starting?
>
> I noticed you've mentioned the same direction in "bpf/s390: Implement
> get_preempt_count()" [1]. So, I added Ilya here to discuss this direction=
.

Much better. Keep it human.

"in kernel disasm" already exists for some architectures
(at least x86 and arm64) since it's being used by kprobes.
The ask here is to figure out whether they're usable for such
insn analysis. x86 disasm is likely capable.

re:"whitelist kfunc"
I suspect an additional list is not necessary.
kf_fastcall is a good enough signal that such kfunc should
be inlinable.
