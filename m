Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63853380FF7
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779904413; cv=pass; b=GSow1Les097dQDZCsgPwqH8bIvYYd7d6A7pJ5dExY0ZS0iy2DicF5Ddny3802b9A2nV9FX2f+K15vxfV+2iB2yk8O4qODdWp404vW7IWZU01vrWDSHUODdZhjBBbLnUPPloyfOir0AjZ0MT9beQ83hTCWFYrQfaqRSRUN2qnLPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779904413; c=relaxed/simple;
	bh=iZ0BlmnnMIG/552YMQpT1xzeRp1XXUE5GyUcq30IDLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neRyfqwf6i19kSZHW3X3RXLTY9Tuu1S+CkRLgdDsLvZ62G3pchXL6bnBvnHjdNrH4lnxiNfIqhXdCHktQmOxVJcu8VdCpHMadlGzya+iLC8cC32pLXjCLenq7gKCOv4TdOWbSAZA+BUrw90ijjcHPrPEv/MV3TcF/0UU2AYAuco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXSfyr6A; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXSfyr6A"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so22078829a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 10:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779904410; cv=none;
        d=google.com; s=arc-20240605;
        b=JUDLabgUDpblbmMQnSL7IPmFv5NJkTyvjx85n6HVo3HV/GCS0Qvukh9sxZqqyFhetZ
         AJhRzK5f02Ehb1Um94tNsrysxs6N+1RV9HWlpVrvhZ3MVvtJhlTTCXres7SmsTTqqu/0
         hFALj/KUF7Vmc8+v55H/VP+4mBVNab8fjeHnqpImrtDdZN7O0HcUz1NldQLF5gM8t3BF
         GsSD7MeamfYsVUpIKLgCHUgzxupRy4k4W3vhSU2SE6iS+ASEOUMZMA4gleDiMmpLZw0F
         J71Yj9oUWwioeHKFbN4NPVBd9xsCtT/hNjYKFYMgzwsjedJKB+h8dZGN39pAktDlXbb0
         I5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejPF1V+dIdUNXQrgyKv6UqvU4YZpZJu7dzSL4iQt2fg=;
        fh=7mUmgyobj5JNb9qhI10vGroMxQ9zPbX0RePgygThK00=;
        b=kWtThSa6P3hWLPeSMSKzU3uaIaI24lRk/Vzon2Fkc7jIQ67KD4oKcGhLAZ3XMwgPLC
         DfzbhixwPO7MFZF6SK8WGOfLjs9z/stRwccs4+wM3WQSs9uhpczvl/frZmoNIF3ty/QG
         mvbbZFWDc/DEjP8xYxgtPXiST+IcRPhceceJUjO96HP9WCHFSvp6gHDOrFCW2JUh/BlJ
         PoV991FS3pvIXhxBKsj8J2pIyyQz1pFF/oe9bHzKh/hxAY3CylkPR0GbXDcFq6h13H/P
         tI79SkpHKsRj2beiKzYIWZs1rj4bMypqBEpAY2RiVvAtW6RYwuTUo2jWxTIYCk8x7DOQ
         ICIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779904410; x=1780509210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejPF1V+dIdUNXQrgyKv6UqvU4YZpZJu7dzSL4iQt2fg=;
        b=nXSfyr6AcMOjH+tdiITJeEHEke1UBxOBW688Byr2ZGh+jLdBvQ8oVjpY8xAO/ABzHC
         mQXZOsgC71EV4beumUpv/2a9AMX6ylKCId2kSHC533m+vG/cGZ3lG8rUx6GTNcjeYBXN
         +AUuVcqmYf+Wjr8OiAl25uUa4pPrBTwuEH8QAULZ2BBH30FYBODTdspPL8Zzoe6AWPa/
         tt63I+Z126BYVc/lVCMGoi9keYWTZOSL2tnfk/Q+2Bbvvj7yfd6bdp6svQxZ5cni1Yj2
         ee2iMKYYZeEdMBNucVNfP6+zjDVHT0eHw1hUksivmdXulGYt3h7t/VOPgeS10675Losn
         h8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779904410; x=1780509210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejPF1V+dIdUNXQrgyKv6UqvU4YZpZJu7dzSL4iQt2fg=;
        b=WGyLL9y/lhpt/BBNMZMcBrEKWs+plhhUHmVnHAZsaCZjY1VwmNYSatzF41HyeSfbXR
         UIgf+IelWZNHF8vvXiUS7EzSMqNpevUrCKG5OAyfqtSu2mfUeXxE8YLAeH/MY9LM5KSA
         yTfXFef5rKZYCncFJfrPw3Ph/EXobWo6qn++yQrGknIJADREv7Gw+PJqkw83ka2+E85o
         2kj95jRA4KxVsUyc6/81fZYaW7AzLDeYJp1gZf/iXC4RnbPCMx6RTnn7onioEKN5SPMa
         yqt/cvaf12iIYvaXlvGu8JlYp+TzxFxxz9T8z+F2Q36dW3EqJeWwhO9nLnREtpyY0vED
         dRpA==
X-Forwarded-Encrypted: i=1; AFNElJ8O+jkuwY5MkLBlwweO8NANM+QfxtMy+mAyXJSV5vWVFFw2bao/gCQm1JX/2aySwkdVkYJL5+9EAP0UyW7yuok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5B1lM148EAUqMM5Ufm6dRA2NsDlr5xtGRpqlEaKseP1t+sFD
	Ci+JXLATlmL04PwNqNYHOmMCoGv4ZEt7J8u7XuxlNnqDs9XTgueUS1BjDuHJk21UCT7A/sFHMFp
	O+YnDWmiQn3HufjmbYOk25DMIXDtxy1k=
X-Gm-Gg: Acq92OFxa+dBkW8E4SwCeFzJOw4GgboXzG+haMyaOJHI72CJi4SH4GozvDx1Hkb9j86
	wB+mfQp1H66lmAtRUZDz5Mh/AYRMOH7Yhe5whqbHS2+boDJXEGWqFLnUf05YkzgpL/OaOjV1O0J
	OhVLaAxJGh6LoeQf4Xfe07w3Y8EKyLCSiLqy/AvX4j8PADwKbsr+CYe/fkW2EZKzzJHPtl0CN54
	u9Zzsd8kER5R7G9v4s8PHml2vAA7vBpCZj5MWXgle8hiOTF00iqX6LZzMyhCrMkWb7nuMbK145i
	9U8Fp46Pcw==
X-Received: by 2002:a50:cbca:0:b0:67b:4e46:f12f with SMTP id
 4fb4d7f45d1cf-6889cc78f8cmr9795479a12.25.1779904409485; Wed, 27 May 2026
 10:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527052539.3388700-1-hataegu0826@gmail.com>
 <20260527052539.3388700-2-hataegu0826@gmail.com> <549d58c6-05f0-4176-98ec-c88e96ee4375@linux.dev>
 <CAPa51znR2bY8mojn07L4QLWrZP6yNVunMQHdvqGN1U_N0vPm7Q@mail.gmail.com>
In-Reply-To: <CAPa51znR2bY8mojn07L4QLWrZP6yNVunMQHdvqGN1U_N0vPm7Q@mail.gmail.com>
From: =?UTF-8?B?7ZWY7YOc6rWs?= <hataegu0826@gmail.com>
Date: Thu, 28 May 2026 02:53:16 +0900
X-Gm-Features: AVHnY4JrGWzFUvNC1RB_ew-dfl-kTCEr6-Rv5_TxIdKOsuttd8ILAmdecmG96B4
Message-ID: <CAPa51z=fUqv-yp8SnzMQ-msss1NNdHsqnUsA8ezJ-2XX5Qo8AQ@mail.gmail.com>
Subject: Re: [PATCH bpf 1/1] bpf: reject overlarge global subprog argument sizes
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the poor formatting in the previous reply. Reflowing the main
point:

The 0x3fffffff array bound is not expected to appear in the generated
BPF instructions. It affects the verifier through the BTF-derived
argument size.

For:

  int (*p)[0x3fffffff]

btf_resolve_size() returns 0xfffffffc. At the call site R1 is fp-4,
pointing to a 4-byte stack slot. check_mem_reg() currently does:

  size =3D -(int)mem_size

for PTR_TO_STACK, so 0xfffffffc is converted to -4 and then to a
4-byte stack check. The caller side therefore accepts fp-4.

The callee is then verified with:

  R1=3Dmem_or_null(id=3D1,sz=3D0xfffffffc)

so its 4-byte load at r1 + 4 is considered inside the BTF-described
memory region. But the actual argument is still fp-4, so r1 + 4 is
fp+0, outside the 4-byte caller object.

I rechecked this on current origin/master eb3f4b7426cf with the raw-BTF
reproducer, and the verifier accepted the program with:

  4: (85) call pc+2 // r1=3Dfp0-4
  7: R1=3Dmem_or_null(id=3D1,sz=3D0xfffffffc) R10=3Dfp0
  9: (61) r0 =3D *(u32 *)(r1 +4)
  Func#1 ('subprog') is safe for any args that match its prototype

So the issue is not a large immediate in the instruction stream, but the
oversized BTF pointee size wrapping the caller-side stack argument check.

I can send v2 with the commit message and selftest comments clarified.

Thanks,
Taegu

2026=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 2:48, =
=ED=95=98=ED=83=9C=EA=B5=AC <hataegu0826@gmail.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> Hi Yonghong, Thanks for checking. Yes, the generated instruction is
> only a 4-byte load at r1 + 4. The large array bound is not expected to
> appear in the instruction stream. It matters through the BTF-derived
> argument size used by the verifier. For the global subprog argument:
> int (*p)[0x3fffffff] btf_resolve_size() resolves the pointee size to
> 0xfffffffc. At the call site, R1 is PTR_TO_STACK pointing to the
> 4-byte local variable at fp-4. The current stack path in
> check_mem_reg() computes: size =3D -(int)mem_size so 0xfffffffc becomes
> -4 as a signed int, and the negation validates only 4 bytes. This lets
> the caller pass the 4-byte stack slot. The callee is then verified
> independently with R1 as PTR_TO_MEM and mem_size 0xfffffffc, so the
> 4-byte access at r1 + 4 is accepted as being inside the BTF-described
> memory region. At runtime, however, the actual argument value is still
> fp-4, so r1 + 4 addresses fp+0, outside the 4-byte object that the
> caller provided. I rechecked this on current origin/master
> eb3f4b7426cf with the raw-BTF reproducer. The verifier accepts the
> program and logs: 4: (85) call pc+2 // r1=3Dfp0-4 ... 7:
> R1=3Dmem_or_null(id=3D1,sz=3D0xfffffffc) R10=3Dfp0 9: (61) r0 =3D *(u32 *=
)(r1
> +4) Func#1 ('subprog') is safe for any args that match its prototype
> So I agree that the objdump only shows a small load. The issue is that
> the oversized BTF pointee size wraps the caller-side stack argument
> check and lets that small load be accepted past the caller object. I
> can send a v2 with the commit message and selftest comments clarified
> to make this distinction explicit. Thanks, Taegu
>
> 2026=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 1:59,=
 Yonghong Song <yonghong.song@linux.dev>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> >
> >
> >
> > On 5/26/26 10:25 PM, Taegu Ha wrote:
> > > Global subprogram argument checking derives generic pointer sizes fro=
m BTF
> > > and passes the resolved size to check_mem_reg() as a u32. The access-=
size
> > > validation path then uses a signed int, and stack pointers negate the=
 value
> > > before calling check_helper_mem_access().
> > >
> > > A BTF type such as int[0x3fffffff] resolves to 0xfffffffc bytes. On a=
 stack
> > > pointer, (int)mem_size becomes -4 and the negation validates only fou=
r
> > > bytes. A caller can therefore pass a four-byte stack slot while the c=
allee
> > > is verified with a nearly 4GiB memory argument, allowing accesses out=
side
> > > the caller object.
> > >
> > > This was confirmed with a non-executing raw-BTF reproducer. On a
> > > vulnerable kernel, the verifier accepted a program where the caller p=
assed
> > > a four-byte stack slot, while the callee argument was described by BT=
F as
> > > int[0x3fffffff]. The verifier log showed:
> > >
> > >    R1=3Dmem_or_null(id=3D1,sz=3D0xfffffffc)
> > >    r0 =3D *(u32 *)(r1 +4)
> > >
> > > The program was only loaded to prove verifier acceptance and was not
> > > attached or executed.
> > >
> > > Reject sizes that cannot be represented by the signed verifier access=
-size
> > > API before any conversion. Cast the non-stack case after the bound ch=
eck to
> > > make the conversion explicit, and add a verifier regression test for =
the
> > > oversized BTF argument.
> > >
> > > Fixes: 2cb27158adb3 ("bpf: poison dead stack slots")
> > > Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
> > > ---
> > >   kernel/bpf/verifier.c                           |  7 ++++++-
> > >   .../bpf/progs/verifier_global_subprogs.c        | 17 ++++++++++++++=
+++
> > >   2 files changed, 23 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > index 7fb88e1cd7c4..1007f204a1f5 100644
> > > --- a/kernel/bpf/verifier.c
> > > +++ b/kernel/bpf/verifier.c
> > > @@ -7107,6 +7107,11 @@ static int check_mem_reg(struct bpf_verifier_e=
nv *env, struct bpf_reg_state *reg
> > >       struct bpf_reg_state saved_reg;
> > >       int err;
> > >
> > > +     if (mem_size > S32_MAX) {
> > > +             verbose(env, "R%d memory size %u is too large\n", regno=
, mem_size);
> > > +             return -EACCES;
> > > +     }
> > > +
> > >       if (bpf_register_is_null(reg))
> > >               return 0;
> > >
> > > @@ -7119,7 +7124,7 @@ static int check_mem_reg(struct bpf_verifier_en=
v *env, struct bpf_reg_state *reg
> > >               mark_ptr_not_null_reg(reg);
> > >       }
> > >
> > > -     int size =3D base_type(reg->type) =3D=3D PTR_TO_STACK ? -(int)m=
em_size : mem_size;
> > > +     int size =3D base_type(reg->type) =3D=3D PTR_TO_STACK ? -(int)m=
em_size : (int)mem_size;
> > >
> > >       err =3D check_helper_mem_access(env, regno, size, BPF_READ, tru=
e, NULL);
> > >       err =3D err ?: check_helper_mem_access(env, regno, size, BPF_WR=
ITE, true, NULL);
> > > diff --git a/tools/testing/selftests/bpf/progs/verifier_global_subpro=
gs.c b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
> > > index 1e08aff7532e..0ff8f85b4d46 100644
> > > --- a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
> > > +++ b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
> > > @@ -151,6 +151,23 @@ int anon_user_mem_valid(void *ctx)
> > >       return subprog_user_anon_mem(&t);
> > >   }
> > >
> > > +__noinline __weak int subprog_user_anon_mem_huge(int (*p)[0x3fffffff=
])
> > > +{
> > > +     return p ? (*p)[1] : 0;
> > > +}
> > > +
> > > +SEC("?tracepoint")
> > > +__failure __log_level(2)
> > > +__msg("R1 memory size 4294967292 is too large")
> > > +int anon_user_mem_huge_size_invalid(void *ctx)
> > > +{
> > > +     int (*p)[0x3fffffff];
> > > +     int tiny =3D 42;
> > > +
> > > +     p =3D (void *)&tiny;
> > > +     return subprog_user_anon_mem_huge(p) + tiny;
> > > +}
> >
> > Without verifier.c change, verification is successful.
> >
> > The objdump:
> >
> > 0000000000000160 <subprog_user_anon_mem_huge>:
> > ; {
> >        44:       b4 00 00 00 00 00 00 00 w0 =3D 0x0
> > ;       return p ? (*p)[1] : 0;
> >        45:       15 01 01 00 00 00 00 00 if r1 =3D=3D 0x0 goto +0x1 <L0=
>
> >        46:       61 10 04 00 00 00 00 00 w0 =3D *(u32 *)(r1 + 0x4)
> > <L0>:
> >        47:       95 00 00 00 00 00 00 00 exit
> >
> > 0000000000000040 <anon_user_mem_huge_size_invalid>:
> > ;       int tiny =3D 42;
> >         8:       b4 01 00 00 2a 00 00 00 w1 =3D 0x2a
> >         9:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 0x4) =3D w1
> >        10:       bf a1 00 00 00 00 00 00 r1 =3D r10
> >        11:       07 01 00 00 fc ff ff ff r1 +=3D -0x4
> > ;       return subprog_user_anon_mem_huge(p) + tiny;
> >        12:       85 10 00 00 ff ff ff ff call -0x1
> >                  0000000000000060:  R_BPF_64_32  subprog_user_anon_mem_=
huge
> >        13:       61 a1 fc ff 00 00 00 00 w1 =3D *(u32 *)(r10 - 0x4)
> >        14:       0c 01 00 00 00 00 00 00 w1 +=3D w0
> >        15:       bc 10 00 00 00 00 00 00 w0 =3D w1
> >        16:       95 00 00 00 00 00 00 00 exit
> >
> > The big 0x3fffffff does not really matter.
> >
> > > +
> > >   __noinline __weak int subprog_nonnull_ptr_good(int *p1 __arg_nonnul=
l, int *p2 __arg_nonnull)
> > >   {
> > >       return (*p1) * (*p2); /* good, no need for NULL checks */
> >
