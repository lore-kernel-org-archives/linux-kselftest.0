Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5451D95A3
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787082988; cv=none; b=NCqDoGo+5lZIHsGZk9NEC1GBI3ogduTkKISDh+HaRi9LSR0WDuMgqM4fl0opMM4lHWs0fUwDfKGoslRMcZgjKg62M3lH/ubnb9pd5dlVrj0/BLC1blqIV9gVhCrThqDOs1t537RBqsE4/lL86aSZ/AVrmoY8dvkzNvwg4cRzQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787082988; c=relaxed/simple;
	bh=8IH10OjJZB/mtZdH6fmGqFSUirbS+Exj18SWzs9jBGU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jdUwMlkJiiFMUlDoCBbztAAZgIDnyFOQTk4V3GlF0FZUbKKKLsRQx3DQQergH+tBuv1UfeIZUPJs5itdSgjJnk7ZITe68XRwkm4Ojjv++BIDKtDi58vvtYZR9UpEB843GOfuPR/dzDm4J18dV6LTx4FvsDlD9k1WJTwnPQnrDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF1OaZDj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF1OaZDj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so2687075ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787082987; x=1787687787; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MwsjfYvjhLLXvhbkk9VLjuUHWqsTTdTeOI61TJBjUdk=;
        b=jF1OaZDj00nwOzsynVGw6C4vixLhAM+FfIbShX9Bc/a3gULgU5+zI36nxCdunNd/qG
         4w7KqOjCXtXqSQbUd6bLhuogGPX2n8ki7KRmmOtTTSuylcAs35PtnuGUY+RYijVjph2Z
         WsgSiTB3wVBcClAodn16xvpwFGVrsDNvh+tLeWPXboXHb7PhMXbKStt4Elt8fk/O7TFB
         tUvmlmRNdjKBvbnoNxSLoqVSq64NgXOigHArrcTiZh3SwBi8CPid76u0W/lsX2mkrXjp
         JOjeKLSGJEVZhSnNuhCYFWtfn9RFLqFE/F3PMhBoWwr6KM+0tGLRCWTunWvO5VBpN9XJ
         fYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787082987; x=1787687787;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwsjfYvjhLLXvhbkk9VLjuUHWqsTTdTeOI61TJBjUdk=;
        b=Kh9gZBP4LuDEZ10z47WJXPMs2dlatKdvESzIfmDCL1FvNYHdKAAO5K3wFBQy4DmMON
         kFaVxMLUAiW4fzDoDKFIgZxA8UGGM4x6tw8dJJ9aetbj9KF8yMMz7ZBGEaxECsdvErI8
         PEAF1XgF87/6FlMRgLbRaNRBRP9KxpwVBZqw/n0njm29lJc3oW1KV47pUeu9uM4jOwcA
         z7R4OlAEE5eFhVn9u/leXl/ddC55olkLA3vrCs3I5U6KpliAv6oVKP0D1XjebOj+1jTf
         eAtVC0acsAXv8sAmOtvBcxZZ/J8aavbEsYq+oEZL34L5p8xJ7G9G2e9Ui3Xlj/+eJuhZ
         MSug==
X-Forwarded-Encrypted: i=1; AHgh+Roje+R3/Pi609TbuzuML2pLYWelgfXSsATQ9buH3uvMgd/0QQFpAWP0UeWSmdyFcTu121fHLUewFK15G23abX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYs9xFRZuaVnWStq7jCVn57Vzn/aT098pZ6IHf1SSmsf6L8AmJ
	NGw0jtI2om0IkMru0pDJVVpZdVaJhCP8Z+StvfZF4ukKEzPy4UFbvHKY
X-Gm-Gg: AR+sD131VwSyVx4Kp3rB3fu1JKc3qWyVNs+kJoFQHynmqbqEdYd+GJtu72qudOaG68V
	wbeR0bUUeX2VnyTH7W0TFoSU62lIQlW3NxI10AhJu1aVQ5tZdda79DkGzrH6kY7i/L3id58xgtl
	SDce+HLDL9hT2+yRzv2pB+mfO78jARoDjOWrqWcx/F5LHJ3vvkjEVO3CrTh2unXtNixX87zRuUx
	sWIsO67Z+vYpNf1eg+9dw0CWiKc0r02tlSpe9Fynexj+UgDoP/vVK5CJ99xLs7PWMSFOzltIwnD
	Q1By/+YrUFlq1RogVYe8dJ5kppn/4oBAa1EV0JBNn8Vw9GDBZo2j5OWsKZ5vJS/55UxBGHsd3Na
	JSeFa5lkA4RiDvtMdhJahCT/L3PFIxhxKYR01u67/PGZ8ehfn+sisGMUHA2HTYHx0QjcWkyg2/h
	r5DK4uHV0O0Tn34Lp/2ACRFscdQrnAi/AUUdV3/7casJJk7T302V6HlAAICRGB+OPzvSqJhZ2kM
	fVRspu6csJnbj0ytTVtm81y/r/Ts17y
X-Received: by 2002:a17:902:d483:b0:2d3:6fac:d67c with SMTP id d9443c01a7336-2d5f6cb7623mr3131945ad.10.1787082986700;
        Tue, 18 Aug 2026 12:56:26 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb519678sm21011025ad.31.2026.08.18.12.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:56:26 -0700 (PDT)
Message-ID: <ba901e5268dc739711b9a5e1d9405be6953e35f1.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Cover mixed arena and
 stack atomics
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, Yiyang Chen	
 <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
 <john.fastabend@gmail.com>, Andrii Nakryiko	 <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>,  Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai	 <ihor.solodrai@linux.dev>, Shuah
 Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Tue, 18 Aug 2026 12:56:23 -0700
In-Reply-To: <ac19d435-4c92-42c8-9db1-2db1ab854c3c@linux.dev>
References: 
	<20260816-bpf-next-038-mixed-atomic-v1-v2-0-4644c1886dbc@mails.tsinghua.edu.cn>
	 <20260816-bpf-next-038-mixed-atomic-v1-v2-2-4644c1886dbc@mails.tsinghua.edu.cn>
	 <cd62cd53be9bcea2d5b63fef8eece815f5095103.camel@gmail.com>
	 <123a014b2b4ecd7d19cbdfe62c62d994e612b6f0.camel@gmail.com>
	 <ac19d435-4c92-42c8-9db1-2db1ab854c3c@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-08-18 at 12:35 -0700, Vineet Gupta wrote:
> On 8/16/26 4:36 PM, Eduard Zingerman wrote:
> > On Sun, 2026-08-16 at 16:17 -0700, Eduard Zingerman wrote:
> > > On Sun, 2026-08-16 at 10:56 +0000, Yiyang Chen wrote:
> > > > Add a verifier test with one atomic RMW instruction reached through
> > > > PTR_TO_ARENA and PTR_TO_STACK paths. The verifier must reject the
> > > > shared instruction with the existing incompatible-pointer diagnosti=
c.
> > > >=20
> > > > Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> > > > ---
> > > > =C2=A0=C2=A0tools/testing/selftests/bpf/progs/verifier_arena.c | 39=
 ++++++++++++++++++++++
> > > > =C2=A0=C2=A01 file changed, 39 insertions(+)
> > > >=20
> > > > diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/t=
ools/testing/selftests/bpf/progs/verifier_arena.c
> > > > index b241bbcf54a8a..b22bab33301ab 100644
> > > > --- a/tools/testing/selftests/bpf/progs/verifier_arena.c
> > > > +++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
> > > > @@ -637,6 +637,45 @@ int non_arena_ptr_add_to_arena_ptr(void *ctx)
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0#endif
> > > > =C2=A0=20
> > > > +static const struct bpf_insn addr_space_cast_insn =3D {
> > > > +	.code =3D 0xbf,
> > > > +	.dst_reg =3D BPF_REG_7,
> > > > +	.src_reg =3D BPF_REG_7,
> > > > +	.off =3D 1,
> > > > +	.imm =3D 1,
> > > > +};
> > > > +
> > > > +SEC("socket")
> > > > +__description("arena and stack atomic at the same instruction")
> > > > +__failure __msg("same insn cannot be used with different pointers"=
)
> > > > +__arch_x86_64
> > > > +__load_if_JITed()
> > > > +__naked void mixed_arena_stack_atomic(void)
> > > > +{
> > > > +	asm volatile ("					\
> > > > +	r1 =3D %[arena] ll;				\
> > > > +	r6 =3D r10;					\
> > > > +	r6 +=3D -8;					\
> > > > +	r9 =3D 0;					\
> > > > +	*(u64 *)(r6 + 0) =3D r9;			\
> > > > +	r7 =3D 8192;					\
> > > > +	.8byte %[addr_space_cast];			\
> > > I'm going to fix this to:
> > >=20
> > > 	r7 =3D addr_space_cast(r7, 0, 1);			\
> > >=20
> > > as in the test case above.
> > > Waiting for CI [1].
> > >=20
> > > [1] https://github.com/kernel-patches/bpf/pull/13325
> >=20
> > A...and it requires another exception for GCC-BPF:
> > https://github.com/kernel-patches/bpf/blob/bpf-next_base/ci/vmtest/conf=
igs/DENYLIST.test_progs-bpf_gcc
> >=20
> > Ihor, it's a third time GCC-BPF strikes this weekend.
> > What do people think about downgrading it to may-fail until the
> > DENYLIST decreases to something reasonable?
>=20
> While bpf-gcc is improving, slowly, we can in parallel do alittle better=
=20
> on test hygiene as well. In this case by correctly bracketing the tests=
=20
> with _BPF_FEATURE_XXX.

Yes, that's what I ended up doing. Should have paid attention to the
#if .. #endif bracket used by the textually preceding test.
Sorry for lashing out.

> Co-incidently I have a series in works from an accidental discovery of=
=20
> llvm-only testing coverage (rely solely on __clang_version macro) which=
=20
> I'll follow up on the list shortly.
>=20
> Thx,
> -Vineet
>=20
>=20
> >=20
> > Anyway, I'll wrap-up with this patch-set in the evening.
> >=20
> > > > +	call %[bpf_get_prandom_u32];			\
> > > > +	if w0 !=3D 0 goto 1f;				\
> > > > +	r8 =3D r6;					\
> > > > +	goto 2f;					\
> > > > +1:	r8 =3D r7;					\
> > > > +2:	r9 =3D 1;					\
> > > > +	lock *(u64 *)(r8 + 0) +=3D r9;			\
> > > > +	r0 =3D 0;					\
> > > > +	exit;						\
> > > > +"	:
> > > > +	: __imm_addr(arena),
> > > > +	=C2=A0 __imm_insn(addr_space_cast, addr_space_cast_insn),
> > > > +	=C2=A0 __imm(bpf_get_prandom_u32)
> > > > +	: __clobber_all);
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0static __noinline
> > > > =C2=A0=C2=A0u32 __arena *check_arena_arg_nonglobal(u32 __arena *arg=
)
> > > > =C2=A0=C2=A0{
