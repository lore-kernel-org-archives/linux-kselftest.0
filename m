Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F23B1EFD
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626232; cv=none; b=c5IB1Q+J2Amg5YAknMOdUwqbuLv9eDDaA2oNy6ln7PbnWnIo/7DlLq91hjdByKpseV/CEd2zjmaE8sVraQsarIe7X1x3IijQhw7XNDk7LcTyv3q51f/iElh5iwzbt/abWenlYxvqL313hv/2d/BpHcgFdiugs31Oy1AVDNemums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626232; c=relaxed/simple;
	bh=mxUasxguHI4I1J3VgO0bjGRfO1OqUmjNTobWTICeulw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZRfLTLlSrkBOl7V0oYQh+vR9CbODgcP6xMm5eLShNmFJY0xLHnDzNKDJF4cAuhbgxM7loTkiXbUbiOBiIVuWuwbhYJFdIIV0s0Rl5BXCBNyf1bCMnEY2P2ScW0kCYtiiIlUIYsJ0h8D9yTCmpkmC7lMBzzWXSUCi20VanmM+Ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3t7w0G5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3t7w0G5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c3546924so9323505ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 19:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780626225; x=1781231025; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t5vi9iUbaYp47So/5b+Sc9Hq5gN5IzZ46oO7u2xtI8w=;
        b=o3t7w0G5WqsaqW4kZn3tZtvcFrsw+vOODyAPuiWW9NkRPoNK88eIUroSsTV+TkxFhx
         adsOqEJiEvFTjOOkVGN7S0j5idqTOf1z1C1ITXSuPE4aK55xZC/tDQ4sdyD1u+uryr8t
         16+5/i4a1Im3gDCJlnTE8Ukm0tr3+zJ8If4FWrnA0X3oZLuvSJT3cqmc7ygRPzRZJPFK
         oQsgN23Dbb2tPQFhcRxHk03Kfz5k7kIXIiXRJ9KwcUeizKSbdhkXsLyeUQPlU4Qza3KL
         eJ7cSIWMKvOElVhB6+4I+8qdtSizXZOjlbBkwQNonBXQiPP9AOvwtWgTF9+at0y31e3J
         2q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780626225; x=1781231025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5vi9iUbaYp47So/5b+Sc9Hq5gN5IzZ46oO7u2xtI8w=;
        b=gWYjnrCrNZE2EPLcFF8C+XtDWMmL/P3H6Rt6SM8W40wguyLJH6uEe1S6oP4mpZQMA5
         F1F44xAXsxFgMnFim9hzfGAoNwFAlLnobZU3oMMGTmm/n82YRdwidJVuzNeMayaMKGfz
         /65DXySJtT/JyYQt5edV8D2byI3vem5tljcj0Ki0f8KxLxrTXVr2UToUaGKhDkGe/+4W
         omAmH3jvxMQrl4tru/cuSF4eiLogakPiwqaOWa/AjfLZJSHSVF9/W32RykNOhwghBrKG
         6RxNXjGwxSocrXzgRxnrtCWboeeQj5PuafmRxCzOJ36yO/HOlQyU1JpUZvVErpd2obpZ
         i4JQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q1QzuxCbKK9erANpQzFmsB13HOOFniC0MJyXza0biNhh3sKl3ngvDYeEuf06AtMJ7ek5aqeTMnED1tOcrzIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNSt4Lbkn6oi7kE/MDGGR5xShBUWNIerrnPtGI5vF2zSvGzBo
	7upRFfPloZIoWlFp60YsQxKt9U04mFNGUprqfbRkzHooB38CU+8yvqYx
X-Gm-Gg: Acq92OHoIslChdm5fndaJK0rxJ0TZeAXbsteAMvnDk/3lV39JaCVO1mNiLvWpEByloB
	xBrfjpKWCN8yfuqI2kXj+9nlnKbuKA5yiLSo1NdpM+wg8NKHnB7QjIME8H9wTL1SbfLzIY9zFVy
	219j1iWaE4JnTEZcwNLfqARofzwhZxco74s02zcdriZq193LtSiPO0uXv6P2V5ruE2nOoPDKbJW
	X+ts4SY5oJVTnKLuIvrc8M64f3XXIzuq21wMZjOMP44Ymd21q9huGzcdCYq2mC35pPkl/9ylEpv
	cC59HKm2B7HyY9sdYLt3vQJls/eFy8JqD+DYLwm0+xLwvQXNgBGre1dm8u0PiaKXd1HN1Uut9RA
	632cT55pv7xgpMaeymVoN3Gp2rIK8IGcEfJap+aMCM04CIxxhaArNdkbwUeitRgmaSPTcZk7EGy
	8A1H/f2z+cNM/8C5YYYHlFG61aI6BCWI+WPwVAE4H/Pwol6jwejiA/mlEOTR0Ekg==
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr12295925ad.27.1780626225420;
        Thu, 04 Jun 2026 19:23:45 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm79171785ad.5.2026.06.04.19.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 19:23:44 -0700 (PDT)
Message-ID: <3a45b9648a59651ce4206e839050d2f3d76325cd.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: add tests for
 PTR_TO_FLOW_KEYS constant offset bounds
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi	
 <memxor@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Shenghao Yuan <shenghaoyuan0928@163.com>, Yazhou Tang	
 <tangyazhou518@outlook.com>, Matt Bobrowski <mattbobrowski@google.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, 	linux-kselftest@vger.kernel.org
Date: Thu, 04 Jun 2026 19:23:41 -0700
In-Reply-To: <20260604180730.2518088-3-gnq25@mails.tsinghua.edu.cn>
References: <20260604180730.2518088-1-gnq25@mails.tsinghua.edu.cn>
	 <20260604180730.2518088-3-gnq25@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-06-05 at 02:07 +0800, Nuoqi Gui wrote:
> Add verifier tests covering constant pointer arithmetic on a
> PTR_TO_FLOW_KEYS register, which regressed with commit 022ac0750883
> ("bpf: use reg->var_off instead of reg->off for pointers"): an
> out-of-bounds offset introduced as flow_keys +=3D K and then dereferenced
> at insn->off 0 was accepted, while the equivalent flow_keys + K direct
> offset was rejected.
>=20
> The tests check that:
> =C2=A0- in-bounds constant arithmetic on the keys pointer is still accept=
ed,
> =C2=A0- an out-of-bounds offset introduced via constant arithmetic is rej=
ected
> =C2=A0=C2=A0 for both read and write, with the same diagnostic as the dir=
ect
> =C2=A0=C2=A0 insn->off form.
>=20
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
> =C2=A0.../selftests/bpf/prog_tests/verifier.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0.../selftests/bpf/progs/verifier_flow_keys.c=C2=A0 | 77 +++++++++++=
++++++++
> =C2=A02 files changed, 79 insertions(+)
> =C2=A0create mode 100644 tools/testing/selftests/bpf/progs/verifier_flow_=
keys.c
>=20
> diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/te=
sting/selftests/bpf/prog_tests/verifier.c
> index 219ff2969868..dae26dda3782 100644
> --- a/tools/testing/selftests/bpf/prog_tests/verifier.c
> +++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
> @@ -38,6 +38,7 @@
> =C2=A0#include "verifier_div0.skel.h"
> =C2=A0#include "verifier_div_mod_bounds.skel.h"
> =C2=A0#include "verifier_div_overflow.skel.h"
> +#include "verifier_flow_keys.skel.h"
> =C2=A0#include "verifier_global_subprogs.skel.h"
> =C2=A0#include "verifier_global_ptr_args.skel.h"
> =C2=A0#include "verifier_gotol.skel.h"
> @@ -189,6 +190,7 @@ void test_verifier_direct_stack_access_wraparound(voi=
d) { RUN(verifier_direct_st
> =C2=A0void test_verifier_div0(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { RUN(verifier=
_div0); }
> =C2=A0void test_verifier_div_mod_bounds(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 { RUN(verifier_div_mod_bounds); }
> =C2=A0void test_verifier_div_overflow(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 { RUN(verifier_div_overflow); }
> +void test_verifier_flow_keys(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { RUN(verifier_flow_keys); }
> =C2=A0void test_verifier_global_subprogs(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 { RUN(verifier_global_subprogs); }
> =C2=A0void test_verifier_global_ptr_args(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 { RUN(verifier_global_ptr_args); }
> =C2=A0void test_verifier_gotol(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { RUN(verifier_gotol=
); }
> diff --git a/tools/testing/selftests/bpf/progs/verifier_flow_keys.c b/too=
ls/testing/selftests/bpf/progs/verifier_flow_keys.c
> new file mode 100644
> index 000000000000..512e5d1d2665
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/verifier_flow_keys.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Constant-offset bounds checks for PTR_TO_FLOW_KEYS pointer arithmetic=
. */
> +
> +#include "vmlinux.h"
> +#include <bpf/bpf_helpers.h>
> +#include "bpf_misc.h"
> +
> +/* sizeof(struct bpf_flow_keys) is well under 4096, so +0x1000 is OOB. *=
/
> +
> +SEC("flow_dissector")
> +__description("flow_keys: in-bounds constant pointer arithmetic accepted=
")
> +__success
> +__naked void flow_keys_const_inbounds(void)
> +{
> +	asm volatile ("					\
> +	r1 =3D *(u64 *)(r1 + %[flow_keys]);		\
> +	r1 +=3D 8;					\
> +	r0 =3D *(u64 *)(r1 + 0);				\
> +	r0 =3D 0;						\
> +	exit;						\
> +"	:
> +	: __imm_const(flow_keys, offsetof(struct __sk_buff, flow_keys))
> +	: __clobber_all);
> +}
> +
> +SEC("flow_dissector")
> +__description("flow_keys: OOB via constant pointer arithmetic rejected")
> +__failure __msg("invalid access to flow keys off=3D4096 size=3D8")
> +__naked void flow_keys_const_oob_read(void)
> +{
> +	asm volatile ("					\
> +	r1 =3D *(u64 *)(r1 + %[flow_keys]);		\
> +	r1 +=3D 4096;					\
> +	r0 =3D *(u64 *)(r1 + 0);				\
> +	r0 =3D 0;						\
> +	exit;						\
> +"	:
> +	: __imm_const(flow_keys, offsetof(struct __sk_buff, flow_keys))
> +	: __clobber_all);
> +}
> +
> +SEC("flow_dissector")
> +__description("flow_keys: OOB write via constant pointer arithmetic reje=
cted")
> +__failure __msg("invalid access to flow keys off=3D4096 size=3D8")
> +__naked void flow_keys_const_oob_write(void)
> +{
> +	asm volatile ("					\
> +	r1 =3D *(u64 *)(r1 + %[flow_keys]);		\
> +	r1 +=3D 4096;					\
> +	r2 =3D 0;						\
> +	*(u64 *)(r1 + 0) =3D r2;				\
> +	r0 =3D 0;						\
> +	exit;						\
> +"	:
> +	: __imm_const(flow_keys, offsetof(struct __sk_buff, flow_keys))
> +	: __clobber_all);
> +}
> +
> +/* Equivalent OOB expressed directly in insn->off; this form was always
> + * rejected and is kept to show both forms now share one diagnostic.
> + */
> +SEC("flow_dissector")
> +__description("flow_keys: OOB via insn->off rejected")
> +__failure __msg("invalid access to flow keys off=3D4096 size=3D8")
> +__naked void flow_keys_insn_off_oob(void)
> +{
> +	asm volatile ("					\
> +	r1 =3D *(u64 *)(r1 + %[flow_keys]);		\
> +	r0 =3D *(u64 *)(r1 + 4096);			\
> +	r0 =3D 0;						\
> +	exit;						\
> +"	:
> +	: __imm_const(flow_keys, offsetof(struct __sk_buff, flow_keys))
> +	: __clobber_all);
> +}
> +
> +char _license[] SEC("license") =3D "GPL";

Could you please also add a test with a truly varying offset?
Like below:

__naked void flow_keys_var_read(void)
{
	asm volatile ("					\
	r6 =3D r1;					\
	call %[bpf_get_prandom_u32];			\
	r0 &=3D 0xFFFF;					\
	r1 =3D *(u64 *)(r6 + %[flow_keys]);		\
	r1 +=3D r0;					\
	r0 =3D *(u64 *)(r1 + 0);				\
	r0 =3D 0;						\
	exit;						\
"	:
	: __imm_const(flow_keys, offsetof(struct __sk_buff, flow_keys)),
	  __imm(bpf_get_prandom_u32)
	: __clobber_all);
}
