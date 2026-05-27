Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC54451076
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779904116; cv=pass; b=S/yND6V/scqDtmpWXUQxA8R8PoMPC1gL9MKL6vvPEVz7+U4652xzIWDrqVnPxX4pfCwUonU7QOI5g1MFGsB57f/fvm8KiJi7KudbM3viTv8yaGlqXrDwL6Bk4zgC8TZm4HWTnMeaBG6qtM5r4qiMsnanP+CGRxRtYbUyxR9fy9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779904116; c=relaxed/simple;
	bh=vgTQAqNrVRQiy0aSed4BsChDCuleMCYERltv8w6VIb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlvnhNlGWzTZen5eGzo1jSvzfAbR7vUIuzeXUALtv+7a43ck2dDgQMP6+mEgm4utJTlHX0aieueANOnZ9HmgBJGyKa4e5Dx6/vim9AL4+3m0KbRN33pSUNTjhZ+L4KxS4ozpYkBtUzI1xDOIicH2iexHy66fdJzUn12ULo+jqYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS6Pqp3D; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS6Pqp3D"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso14870299a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 10:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779904109; cv=none;
        d=google.com; s=arc-20240605;
        b=AjM/d1bq3l1yjOrdyOKk6aG8NtyF+FaUJTq60iLNvLP3E6ixOq64WNJInhpwezTW54
         Bk5LfwG53q3rsE1TCtVoTvrF5uEfcNY2uJTg9mAtPKa/NhsmG4WCV0QaMMENwULNknWL
         eG9nBZXLqE+x1ytcjDGFwnnEYs2efFFGPNUNg/+YquMrpxy4oCdL/fx4gEEW8W79t9kf
         tLrx9iEm0RKDb8OIg+P/XzBedRJeVrfepUzjDRpe5Da7uzJ6UpWXBhYIgQ916jPiFJCv
         dYseu9lP3KV0Fy5z7WOExf/s0NcoapV3yPyvjSpG/ndPRMWoze9ozIdqGZchZOj2IJQx
         qPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvOXKtF2m9A/Zl+GBH0zm9CcZRDut4ck7TbMTJmtXzI=;
        fh=GhfPIumFr6MeeEZs2gK2NQWhSWt8V8w2iDr0PyuzCZg=;
        b=HNRTD5edSsLZ075cJuRJJnPY+NkXfb9Fliwq2mHVypazAd5MYQU8bclawUR0lSeqmv
         +Il7TZgr6m5V87pH5SBk7NXNVBOeSBcMEFqJOXpYhyNq2jlvtvSQs/sBZ9ycazjspVv2
         qK+D67gZyUoLT3OUlx4hoEASFZoTGoBG0ILGbD4JHG5VwheIjQ5NyoAyUrPGLyZtH1gQ
         Np6hALTnHjULEiYb0AuaNMndwC8Uz4UACkhH0LIx/Z7rF88WWPb/dXGsB9NiRIuS0lcm
         +U2as3DcRuFOfPQm4jDYpTgNFA2/oOIi9YABUzhV+PwAugKifxe5VJCQfVfH50srR9mu
         lRgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779904109; x=1780508909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvOXKtF2m9A/Zl+GBH0zm9CcZRDut4ck7TbMTJmtXzI=;
        b=oS6Pqp3DX6amLWR6yGwmRbb0vkVJKLtxcWHutzk5fKniPD5liXmcQ5QPhGNsiyyTiT
         IXXIZIDZjN/z7uZlT8JHF2PiRe/sq88m7THy16yx1C/LqMmkSV/I+If80pZuKh/1PcJt
         QBe+vroCHmnSE9tStzH4AmXXdLTM9u1UbWybYztQ8hDHiLjtFwYgXGnmFJPfPn54EXwM
         SKgjDb5TKalBf0zYejVRMn98rwNiBXm6ZCSFEERnEJtCa3oEjU54ONm4D2vRx8l5aNjl
         eqcLmsQz/Nk9uiOSqjp1cmctVW2zVq+V1UPCTebqany9u/2QMxMdAfhrR1kKcjZJGi44
         Pk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779904109; x=1780508909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvOXKtF2m9A/Zl+GBH0zm9CcZRDut4ck7TbMTJmtXzI=;
        b=h4eez45Fc0G9z5oS14yk4U33d+UjqHsmnBuSLPCLKf/yrQgGKyVI6AuAXe7v5GYKxM
         dTINJxGkVKzx35C6CbmP6LAI1dP/dKe4zctt/uKNjhbAcKactBKcxkDwFAGtgXc3GFCu
         a15XoFg9A5iw4Xg5dcHYUugSwWf4TONY6YnfyH5U1jVFmf2MIQA1ZxdM8cX1sTlq7+OH
         BRObruYAOXYFtnscPea1Y8AfEWGEUFlcNEG8nn8jWa9quIUsmo+shSIG+9MkTPBn6Brw
         /G6XG1kfchmd6AohEWvQjaKmYajSidOOsTRok41g40IG/RlwXelvS6MeKd3gkZ7xjDwl
         fmhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kokTrt+mvyCwEWSZYG0ieGbF41G5zeeHRSzs9M6VJXhtY+kkQxfOVWVWtIBRNTMut+6qtFuStxl1u5e+gTCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHiGPlkd5l7WK2J8llCcVEJXfiCIW9HIgQl1XSv7S348R9UnWl
	wZf3pVckeHApm8pmOTb+F6xTpb7KqIP7WHc0R/yR+DnkoSpv+/ju/vLlJr+WGzb6KWGCZBOErEU
	CMfFfKzQ6VMU//F7M1j5aPdY5BH3gq0g=
X-Gm-Gg: Acq92OE0TkL7wb+VsTbKuZy+gtB0uYc6ls7Eu5ecLPgmhpYVeSjy8PYW3lU3MS46exL
	I1skxbv/QJRJhrdHerohsyvx/ZzIVxpYCk2E+L82YtdetSr5eSfleX4/LtOSYemlXDx4pUMe5rY
	BjfCcKGSWxwJnoepWVmPScEKndfFrdrCqjBQfEqS55cjCiULeA27QlW2XaZ52sSD9jp1c2/T/xX
	4mwagJViq8kV8U6ofh2ICiS7NfFSZ91avtdZvmddZvaBL7Kh830RQSXUeyNO14HKgrsGj54+/NZ
	Tlt2Ta75YQ==
X-Received: by 2002:a17:907:267b:b0:bdc:6e26:a94 with SMTP id
 a640c23a62f3a-bdd1fe94160mr1052672666b.0.1779904108999; Wed, 27 May 2026
 10:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527052539.3388700-1-hataegu0826@gmail.com>
 <20260527052539.3388700-2-hataegu0826@gmail.com> <549d58c6-05f0-4176-98ec-c88e96ee4375@linux.dev>
In-Reply-To: <549d58c6-05f0-4176-98ec-c88e96ee4375@linux.dev>
From: =?UTF-8?B?7ZWY7YOc6rWs?= <hataegu0826@gmail.com>
Date: Thu, 28 May 2026 02:48:16 +0900
X-Gm-Features: AVHnY4JX-aWTG8lf4QZmtCODkRVj2i7bEVZFrhzUULrl0iHcu9dZPOjB6z_FK9k
Message-ID: <CAPa51znR2bY8mojn07L4QLWrZP6yNVunMQHdvqGN1U_N0vPm7Q@mail.gmail.com>
Subject: Re: [PATCH bpf 1/1] bpf: reject overlarge global subprog argument sizes
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yonghong, Thanks for checking. Yes, the generated instruction is
only a 4-byte load at r1 + 4. The large array bound is not expected to
appear in the instruction stream. It matters through the BTF-derived
argument size used by the verifier. For the global subprog argument:
int (*p)[0x3fffffff] btf_resolve_size() resolves the pointee size to
0xfffffffc. At the call site, R1 is PTR_TO_STACK pointing to the
4-byte local variable at fp-4. The current stack path in
check_mem_reg() computes: size =3D -(int)mem_size so 0xfffffffc becomes
-4 as a signed int, and the negation validates only 4 bytes. This lets
the caller pass the 4-byte stack slot. The callee is then verified
independently with R1 as PTR_TO_MEM and mem_size 0xfffffffc, so the
4-byte access at r1 + 4 is accepted as being inside the BTF-described
memory region. At runtime, however, the actual argument value is still
fp-4, so r1 + 4 addresses fp+0, outside the 4-byte object that the
caller provided. I rechecked this on current origin/master
eb3f4b7426cf with the raw-BTF reproducer. The verifier accepts the
program and logs: 4: (85) call pc+2 // r1=3Dfp0-4 ... 7:
R1=3Dmem_or_null(id=3D1,sz=3D0xfffffffc) R10=3Dfp0 9: (61) r0 =3D *(u32 *)(=
r1
+4) Func#1 ('subprog') is safe for any args that match its prototype
So I agree that the objdump only shows a small load. The issue is that
the oversized BTF pointee size wraps the caller-side stack argument
check and lets that small load be accepted past the caller object. I
can send a v2 with the commit message and selftest comments clarified
to make this distinction explicit. Thanks, Taegu

2026=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 1:59, Y=
onghong Song <yonghong.song@linux.dev>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
>
>
> On 5/26/26 10:25 PM, Taegu Ha wrote:
> > Global subprogram argument checking derives generic pointer sizes from =
BTF
> > and passes the resolved size to check_mem_reg() as a u32. The access-si=
ze
> > validation path then uses a signed int, and stack pointers negate the v=
alue
> > before calling check_helper_mem_access().
> >
> > A BTF type such as int[0x3fffffff] resolves to 0xfffffffc bytes. On a s=
tack
> > pointer, (int)mem_size becomes -4 and the negation validates only four
> > bytes. A caller can therefore pass a four-byte stack slot while the cal=
lee
> > is verified with a nearly 4GiB memory argument, allowing accesses outsi=
de
> > the caller object.
> >
> > This was confirmed with a non-executing raw-BTF reproducer. On a
> > vulnerable kernel, the verifier accepted a program where the caller pas=
sed
> > a four-byte stack slot, while the callee argument was described by BTF =
as
> > int[0x3fffffff]. The verifier log showed:
> >
> >    R1=3Dmem_or_null(id=3D1,sz=3D0xfffffffc)
> >    r0 =3D *(u32 *)(r1 +4)
> >
> > The program was only loaded to prove verifier acceptance and was not
> > attached or executed.
> >
> > Reject sizes that cannot be represented by the signed verifier access-s=
ize
> > API before any conversion. Cast the non-stack case after the bound chec=
k to
> > make the conversion explicit, and add a verifier regression test for th=
e
> > oversized BTF argument.
> >
> > Fixes: 2cb27158adb3 ("bpf: poison dead stack slots")
> > Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
> > ---
> >   kernel/bpf/verifier.c                           |  7 ++++++-
> >   .../bpf/progs/verifier_global_subprogs.c        | 17 ++++++++++++++++=
+
> >   2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 7fb88e1cd7c4..1007f204a1f5 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -7107,6 +7107,11 @@ static int check_mem_reg(struct bpf_verifier_env=
 *env, struct bpf_reg_state *reg
> >       struct bpf_reg_state saved_reg;
> >       int err;
> >
> > +     if (mem_size > S32_MAX) {
> > +             verbose(env, "R%d memory size %u is too large\n", regno, =
mem_size);
> > +             return -EACCES;
> > +     }
> > +
> >       if (bpf_register_is_null(reg))
> >               return 0;
> >
> > @@ -7119,7 +7124,7 @@ static int check_mem_reg(struct bpf_verifier_env =
*env, struct bpf_reg_state *reg
> >               mark_ptr_not_null_reg(reg);
> >       }
> >
> > -     int size =3D base_type(reg->type) =3D=3D PTR_TO_STACK ? -(int)mem=
_size : mem_size;
> > +     int size =3D base_type(reg->type) =3D=3D PTR_TO_STACK ? -(int)mem=
_size : (int)mem_size;
> >
> >       err =3D check_helper_mem_access(env, regno, size, BPF_READ, true,=
 NULL);
> >       err =3D err ?: check_helper_mem_access(env, regno, size, BPF_WRIT=
E, true, NULL);
> > diff --git a/tools/testing/selftests/bpf/progs/verifier_global_subprogs=
.c b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
> > index 1e08aff7532e..0ff8f85b4d46 100644
> > --- a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
> > +++ b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
> > @@ -151,6 +151,23 @@ int anon_user_mem_valid(void *ctx)
> >       return subprog_user_anon_mem(&t);
> >   }
> >
> > +__noinline __weak int subprog_user_anon_mem_huge(int (*p)[0x3fffffff])
> > +{
> > +     return p ? (*p)[1] : 0;
> > +}
> > +
> > +SEC("?tracepoint")
> > +__failure __log_level(2)
> > +__msg("R1 memory size 4294967292 is too large")
> > +int anon_user_mem_huge_size_invalid(void *ctx)
> > +{
> > +     int (*p)[0x3fffffff];
> > +     int tiny =3D 42;
> > +
> > +     p =3D (void *)&tiny;
> > +     return subprog_user_anon_mem_huge(p) + tiny;
> > +}
>
> Without verifier.c change, verification is successful.
>
> The objdump:
>
> 0000000000000160 <subprog_user_anon_mem_huge>:
> ; {
>        44:       b4 00 00 00 00 00 00 00 w0 =3D 0x0
> ;       return p ? (*p)[1] : 0;
>        45:       15 01 01 00 00 00 00 00 if r1 =3D=3D 0x0 goto +0x1 <L0>
>        46:       61 10 04 00 00 00 00 00 w0 =3D *(u32 *)(r1 + 0x4)
> <L0>:
>        47:       95 00 00 00 00 00 00 00 exit
>
> 0000000000000040 <anon_user_mem_huge_size_invalid>:
> ;       int tiny =3D 42;
>         8:       b4 01 00 00 2a 00 00 00 w1 =3D 0x2a
>         9:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 0x4) =3D w1
>        10:       bf a1 00 00 00 00 00 00 r1 =3D r10
>        11:       07 01 00 00 fc ff ff ff r1 +=3D -0x4
> ;       return subprog_user_anon_mem_huge(p) + tiny;
>        12:       85 10 00 00 ff ff ff ff call -0x1
>                  0000000000000060:  R_BPF_64_32  subprog_user_anon_mem_hu=
ge
>        13:       61 a1 fc ff 00 00 00 00 w1 =3D *(u32 *)(r10 - 0x4)
>        14:       0c 01 00 00 00 00 00 00 w1 +=3D w0
>        15:       bc 10 00 00 00 00 00 00 w0 =3D w1
>        16:       95 00 00 00 00 00 00 00 exit
>
> The big 0x3fffffff does not really matter.
>
> > +
> >   __noinline __weak int subprog_nonnull_ptr_good(int *p1 __arg_nonnull,=
 int *p2 __arg_nonnull)
> >   {
> >       return (*p1) * (*p2); /* good, no need for NULL checks */
>
