Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F642F363B
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609848; cv=pass; b=nC3yV7KL2zYuXm8/f0LCRnNj7FlDGszaGEgAipZY3/YVUeHLysN72z3XPLHnzVP+N7XfWNI2RdloB3DTt+83i8UtbIKCS1pD8Xd6nhIzUFQ+KJjp8DD/Fanx0+RGuIzHH+CTzyrv7Rt6Zk4mn756SlCd37NebzEsrHAJ+f0N/ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609848; c=relaxed/simple;
	bh=zbNY7Qy6p+yAvMxGWsPgEuZC3JfRtGQtQzYwmYwkF6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYirIi5bmXL6GDWJWLhF3Y0aP+USVHW2Ru7LOQbB1sGPaCQL8BS2vFsbGC31GzT3Vodie8Dsw0o5cFXQ98Kjv0IvP0evghXWkGW6s/f0o2QEICy74AfKz9ODNF99Qg+jEcrtLfhFJDLPOWI50cDKbJdNiYDctsxgRUjnNs05Ai0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrGzythD; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrGzythD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362c635319so2165563f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 09:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771609844; cv=none;
        d=google.com; s=arc-20240605;
        b=DkhPWw7gH9KvRcxmVlubGVZlBKM1U4TWaTt6xM1gHA0Yso/fyHZ0jTMO84r0mBLN/o
         kYWHpFVCHDnvqLHxrju3xK4vKkI0cIh3axedF9WN6z3uUD7Hdt0EvO8Hupwh7LM1SNFM
         ouie6E8Q3bbarSTDfCn2XD8Bml6t6AFjFJBtt3m96LUTwRWoJX9VeXKb1ArPg56wFho6
         Fvdq+yxe9lWM9GfTXax3MskOYLd7a1AaKYzuCSdFccF9gUAhRUQHyjpuqKA4fSXxaXmP
         hJ7S8f8Qll8fLVBPZ4s5leCwlT/YuqS4wmMqDSgHUk3VGEl4sGBqXncSr/mBfiv9MaiL
         3q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=;
        fh=HMmUT2zy7bgfSJ0WQaugfnl5c2jMyhsGuWY4c+X1UzY=;
        b=hWz+Ss08Fl0sRAKynpb9EEON5eDa7hQNRXHb8qkoBIjEOEwYxqlzhz7JYwFbvzrcsL
         sZj5jiCO8lOF+rU36hW410X51eIED/qXN0sncaUzw10yK08mSi6XVtMsniy6Yvs9ToA1
         Ug4hQTDTeLU10TVyiYld9ekc+UCBNTwT5ADqXnXqElbA1ChmAmuKRiNNmQyjYpZFbdoA
         4hCmvqVdIefZxJVdJ4hV2x66own7Dgm7vNSCUsDwELRyALGOYAvMsjqaD/SWtT2me0Sm
         ePse6hXT5DLlaBydL5GDmZXxq+bV1hi+olBhk/tbcHPIfOmRwpDk8f43H8/popSmwAd9
         1B2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771609844; x=1772214644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=;
        b=BrGzythDzr68lT8P+X+zv4IULDkav/bhr70YF9wtZlpLwODzP7UpPJDcEt2dpLE/xg
         6fuHGy+gMznnxXFeP2cC6/1rxm5Vjar5WUr0a5naf/DlnadfM6eqeeRKYLeMCrzj+pWM
         S+TgqZASFnVjHXSY9y/MVdLL7FQdMXMM7vxUQLbJTapkEkj6RUwhfVlqGH8Z5i02Dlq3
         lAp24c0AAVpL7xEQaEIcDCdU/vsaFmR2jUd0ypGEmL/0SqjKa/9nGIgX9nPrkjAGnypp
         vX6twv3VebpVLuV1dAS3qj/GRvlfdr1cIAe5jGGbTRJ12aZzN4VTDwqsx7XFDpJpubMl
         2xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609844; x=1772214644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=;
        b=Mpo7Rn7iyUl2OUNmyFC9ojfRI7krSEiXlcQH99jhzc3UdYg8IAKilPcWssKAsEVfu6
         rF6/popr+ivB4Tb4D1j7Ncz5KtY7gUqTizn5ctpKRmsmE88EjUX6enGonTEC2Dsc8PEx
         C0kCPl86BduKH9K0ziuGXv29YSrXSO1JkKqLiq6jqEvfRQ82fqx1RZWW/nxixsKS1jFr
         4FVL0EGzLfqJioRgAnjhnRF/kGgXU4vRYo++67Ftq73UzeMg2zSIZizK3k126ZFoxGOd
         MxCnPaN+H0W55XCjWLWf8mjma7qfrjXq41dVV7Zz2BdMMIz5zQre+LgkIFwR7y047zgY
         gGZA==
X-Forwarded-Encrypted: i=1; AJvYcCW+u/qMlJ7UBJjoi1ZLceZFV6amacVVuZEY0/PAJhPszAc6en57zLAyyy1M43S9TV8gREHv2m5vHRUgmE6yCho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEuUXNEM6/PxHVgW7NM/AxQkqzEoeLQJP+155YkqvDPHTKWw5
	qUvtKyujV8MMHWM9n8SUsfKi+iN4Uwhn5vS98FYAPuxAD8p4IkXeOT4EUsJPAC7pNtYCwlulF4k
	dN+0M1QrB0Nw4zEjt9XW6hdbDnLeoDn4=
X-Gm-Gg: AZuq6aLMBe4DmRwc/ZpEnxOoESv5o2MzHfslna+wywQ6A0mYy3sEHoa1TCX+BnoES4I
	K19OhWtqHGfzlshtUS5h61O+szkchxK54VOkliv/NtBwvpUbd9cOpisflO/uj6FQkBJqrr8SYVi
	dkilulOZhVuvHOF5PtbJnrAoK1fY3yHVSi8zpOyb27DTNrEwijhe4D6Y4X1X22N4mMVhC0hSXmk
	zk1jbeKjZh23eVJc0Br5+mvJJW8+OmtGcvFKiQOWaK5FruqgoogkrOfYGPy0evrtk7cIZBWNdKv
	J/GcnUaDNBxXZpAm/oL5fwwRftvKhAXdCBTvzDaJk6r5TSWO/TnGBTL7PJTyHQ5JahdoFXoBy/c
	tOqYIwB8NNLh2fTyFuooCdMsYRg==
X-Received: by 2002:a05:6000:22c1:b0:437:719d:a74a with SMTP id
 ffacd0b85a97d-4396f1822eemr1349284f8f.58.1771609844263; Fri, 20 Feb 2026
 09:50:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-3-leon.hwang@linux.dev>
 <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com> <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev>
In-Reply-To: <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 20 Feb 2026 09:50:33 -0800
X-Gm-Features: AaiRm51uyzLsKizzJvG3f9kn6T1NTHikVXRFmQWXpkFAQIgwLjOzg8dZ0x3Ke_4
Message-ID: <CAADnVQ+iQkvb9-wOchuPrUOneqzx9Rrqto88=R7GUOqih6PhZQ@mail.gmail.com>
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

On Fri, Feb 20, 2026 at 7:54=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 2026/2/20 01:47, Alexei Starovoitov wrote:
> > On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
> >>
> >> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
> >>
> >> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
> >> X86_FEATURE_BMI1 (TZCNT).
> >>
> >> bpf_clz64() and bpf_fls64() are supported when the CPU has
> >> X86_FEATURE_ABM (LZCNT).
> >>
> >> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
> >>
> >> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
> >> instruction, so it falls back to a regular function call.
> >>
> >> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> >> ---
> >>  arch/x86/net/bpf_jit_comp.c | 141 +++++++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 141 insertions(+)
> >>
> >> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> >> index 070ba80e39d7..193e1e2d7aa8 100644
> >> --- a/arch/x86/net/bpf_jit_comp.c
> >> +++ b/arch/x86/net/bpf_jit_comp.c
> >> @@ -19,6 +19,7 @@
> >>  #include <asm/text-patching.h>
> >>  #include <asm/unwind.h>
> >>  #include <asm/cfi.h>
> >> +#include <asm/cpufeatures.h>
> >>
> >>  static bool all_callee_regs_used[4] =3D {true, true, true, true};
> >>
> >> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, vo=
id __percpu *priv_frame_ptr)
> >>         *pprog =3D prog;
> >>  }
> >>
> >> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
> >> +{
> >> +       bool has_popcnt =3D boot_cpu_has(X86_FEATURE_POPCNT);
> >> +       bool has_bmi1 =3D boot_cpu_has(X86_FEATURE_BMI1);
> >> +       bool has_abm =3D boot_cpu_has(X86_FEATURE_ABM);
> >> +       bool inlined =3D true;
> >> +       u8 *prog =3D *pprog;
> >> +
> >> +       /*
> >> +        * x86 Bit manipulation instruction set
> >> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instruct=
ion_set
> >> +        */
> >> +
> >> +       if (func =3D=3D bpf_clz64 && has_abm) {
> >> +               /*
> >> +                * Intel=C2=AE 64 and IA-32 Architectures Software Dev=
eloper's Manual (June 2023)
> >> +                *
> >> +                *   LZCNT - Count the Number of Leading Zero Bits
> >> +                *
> >> +                *     Opcode/Instruction
> >> +                *     F3 REX.W 0F BD /r
> >> +                *     LZCNT r64, r/m64
> >> +                *
> >> +                *     Op/En
> >> +                *     RVM
> >> +                *
> >> +                *     64/32-bit Mode
> >> +                *     V/N.E.
> >> +                *
> >> +                *     CPUID Feature Flag
> >> +                *     LZCNT
> >> +                *
> >> +                *     Description
> >> +                *     Count the number of leading zero bits in r/m64,=
 return
> >> +                *     result in r64.
> >> +                */
> >> +               /* emit: x ? 64 - fls64(x) : 64 */
> >> +               /* lzcnt rax, rdi */
> >> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);
> >
> > Instead of emitting binary in x86 and arm JITs,
> > let's use in kernel disasm to check that all these kfuncs
> > conform to kf_fastcall (don't use unnecessary registers,
> > don't have calls to other functions) and then copy the binary
> > from code and skip the last 'ret' insn.
> > This way we can inline all kinds of kfuncs.
> >
>
> Good idea.
>
> Quick question on =E2=80=9Cin-kernel disasm=E2=80=9D: do you mean adding =
a kernel
> instruction decoder/disassembler to validate a whitelist of kfuncs at
> load time?
>
> I=E2=80=99m trying to understand the intended scope:
>
> * Is the expectation that we add an in-kernel disassembler/validator for
>   a small set of supported instructions and patterns (no calls/jumps,
>   only arg/ret regs touched, etc.)?
> * Or is there already infrastructure you had in mind that we can reuse?
>
> Once I understand that piece, I can rework the series to inline by
> copying validated machine code (minus the final ret), rather than
> emitting raw opcodes in the JITs.
>
> I also noticed you mentioned a similar direction in "bpf/s390: Implement
> get_preempt_count()" [1], so I=E2=80=99ve added Ilya to the thread to dis=
cuss
> this approach further.

You really sound like LLM. Do your homework as a human.
