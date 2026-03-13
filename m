Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C233A1D02
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411641; cv=pass; b=PWHfK8RcK3mK8C45zD4fyizoxpV6wyyfbF5k/VCcJt1QYNYS+JXEwbM1t8tCTokF/rbII21QOyPJKlkuq1jFMgXJ9Pk48QPjRTjnEwkxJjRl7KxQ1+EanhzsUM2Qd/Avh/XIWLZuR5TgalOObRo53kMN0bNy4JhddKJiz+44nmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411641; c=relaxed/simple;
	bh=BcGrGeHXe2jO7d1iGFXYIT6nIOBt21TcAx873DkzSmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldYRdrR64u3c43AEjyt52yfknuil3e371hT//exwf3NgPqAIFnFFW5G4YWw4HKF6k9RrYtG2MBwHC0eIJCGV8fr+B5cgoMv3MGe/Gircju3n8xVOrcxoXo4s7FMdjSXWcfNtp1hh4CJZexnrp6lNrGXp9hU+gXQU8vOlLw/1bLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kG3HQbER; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kG3HQbER"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1763838f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 07:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773411637; cv=none;
        d=google.com; s=arc-20240605;
        b=D82RhNjtNuqjnJ4jug/xua00p8zNSOl2KLmI+SORROurg9yX5pYGp+SDOaTbbhQFXV
         LwA5sDJi65AOF4PdSd9vM8CGnxR5gR7VYxGzA0JrrmiXbJIAMV4j7apZq2EblZiRwRxY
         xsAYs8NjRlZExc4oEHeoQGA+3AoC2iTcmhp6e5dGmiiYqkIhrjGIIex2Al6d+QcJN6Sk
         22iZpRxbL27iL+AEE7Mokvhagsat5vfcJsdO2zTUIiP41ySIheCpR3t9jwCUjA4fszNM
         XpUb8/Kz6gNP2P/NOqdQbV2xWkUxl4tY6LpJMCfFuB+uqb9UHtRuzwfTWOSpnKfVg/Kv
         mRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWchfiAssZCYRh2ybEE9+73QVqevcBXDejsJHQ9I4ag=;
        fh=ryEvKQJoJ23jL8FrEFKMCOMm/6qFisyrDlrOx7M+hdw=;
        b=R1rTZIYhE170jGsZlBVhBVD3l4irdWCeRr0OvjP7r5RmweewEa/B4COHzfObf1Hpqt
         Br+uR1I/YrU5N8/kogWD6JDiZc7fQO4HzRqw1i8GpWxWbPAsDpo5tlITBTKsRpioP6Cw
         C+LNbGf3Uy+PmKC+eLMG9M28/f9IBV/ysDBgoQujnF2cmnV8w8ROrk/Cf4ObLe11osBL
         oMjbvaRKJjMj0rrXRpZDW65qT3lCmQGMYRNHbgwmukOF1/bgIBjPkKHWrrbJt/kEaVDm
         fYUgC316xuomktjyWZa55uheE1KK6QWMp3+pfRqGHB0jq4c3ku6F/4cAe9eCtZlPfND0
         O0Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773411637; x=1774016437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWchfiAssZCYRh2ybEE9+73QVqevcBXDejsJHQ9I4ag=;
        b=kG3HQbERLbJYaeuTD9m/kguBCv5zI+Mq+aWyiXKCA3R9iPTVQGA+nuQzt+uyA5O6By
         M6dRitgyWHk+3zw9mbz157+RGAR2UUZnU+xdTYukCIJfM24F5fr+Bm2BMRsAanZlreJM
         CJLsihgB5/f6xcAXxGvEjaHb0xeM583mveFAiGBb1Z3M9KovKTRC8M5/uHLG2P2GMJMF
         mAN54oATyO8LQCn/RQcVEyVpAoT+qHebTROoXCvaHxPj3HM+1bjlqBMIr34Cheho/k8Z
         3YiBWjsg5D0aOKT4lAb7pERgpoGD7+Kj/lyKWRQobX3/GqM9Ipt6Hf5Bn8ZeyTeMk/4g
         IWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411637; x=1774016437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWchfiAssZCYRh2ybEE9+73QVqevcBXDejsJHQ9I4ag=;
        b=cNZG87/gBaOWgYtqmhD7EJWqWsyQpbHd0vXzmcC5mVGfYr3zTAdozdfdssVm1B7Wuv
         ryYJaS6s2SPZ8mCdkkfZj8+m6xgveC3vADJPIp9FA1TkrI1d+bpDFmmVWzf60dci+O9S
         YOkjFr/E8AxSOYNOzoUaXZpGn8XsuyAQZU5bKKrM/33vbKMfzPf8q4+WkVhFcYjKtXdJ
         MI+Q4Z03iz9tsdAA1dmT+ZwOXGWRDsYdzqHNhisaQD7gDTwsoo9dofNv1C3kDx4p2U98
         ChY7/sCURa4OAlnE5+5Ng+Chl1DXb1SplFcAuWw2ymd5JOVefqSR77vSav5G/HCZldvi
         H2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBRAzbzbpLknmbyj2ZR8dvOSIbas7E1y6CHPs62EAuwlGFFWqXobjA+7hOE6gaFRL7QtASfsIPsplQl0PM7pE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdWw+OqCwfkjcv6f8TepvgLZDqwkZvrYtV4PW0jmGF5dbTXWGy
	ho8SNOOZfjoMA0tb/F9IJMx390ir0lk9JqNqCsdhYD720EYbV0i5PqSgKA5BEuZvRZjpJhxey+X
	MtUAuzKxf1v2+VyaEbzRRXd1R7//Sy44=
X-Gm-Gg: ATEYQzx8nsYxdi3OpbmDX8RXKWj5hqN5T6qg4QB6AxY6yk8fjo+9HTpzH0L8MafLqzt
	oHFN6HUPXjwDSc990/pCq+epJIbCTcn0tq4g6H2RePqHhTqqW4M7ItmZOUQ0oswuwK0u0htja/w
	ZNTa74rLu0WeuTfD5AzhVJ1tOFAVr4wL95xBWJqSLGq6QHIxjxE+mEZE6wlJG6w44UPcuIZsfer
	3GnCePxHhm8b0mg69ShO4Lm7KSA9CCQvS+N5W5c5lIuP7kNUWZTkChfBVEHwjxZSIKiTuMQeGFc
	I7i39cfjsj7r3veV28wNNsdkdFI8VQ7x0dehK5yFp05IeBWiMqPT6I4BgggnBljCMJc=
X-Received: by 2002:a05:6000:186f:b0:439:b629:42d7 with SMTP id
 ffacd0b85a97d-43a04dcbb39mr6923759f8f.46.1773411636611; Fri, 13 Mar 2026
 07:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312080113.843408-1-hbathini@linux.ibm.com>
 <02e68ebf-5782-4632-aed8-0026a3aab96b@linux.dev> <ec4e7ff6-55e3-4889-b507-fee71fab99f8@linux.ibm.com>
In-Reply-To: <ec4e7ff6-55e3-4889-b507-fee71fab99f8@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 13 Mar 2026 07:20:25 -0700
X-Gm-Features: AaiRm523Q6Wteh_7o3CKQT5m-0--e3n8H5bS0Ist7DgivFI_rPZYAXRBWJjbods
Message-ID: <CAADnVQK--hKVH=FBMLiF7io2kBLfqwkXM9porBS1T--og=R4Yw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: improve test coverage for
 kfunc call
To: Hari Bathini <hbathini@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 2:30=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
>
>
> On 12/03/26 11:52 pm, Yonghong Song wrote:
> >
> >
> > On 3/12/26 1:01 AM, Hari Bathini wrote:
> >> On powerpc, immediate load instructions are sign extended. In case
> >> of unsigned types, arguments should be explicitly zero-extended by
> >> the caller. For kfunc call, this needs to be handled in the JIT code.
> >> In bpf_kfunc_call_test4(), that tests for sign-extension of signed
> >> argument types in kfunc calls, add some additional failure checks.
> >> And add bpf_kfunc_call_test5() to test zero-extension of unsigned
> >> argument types in kfunc calls.
> >>
> >> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> >
> > LGTM with a nit below.
> >
> > Acked-by: Yonghong Song <yonghong.song@linux.dev>
>
> Thanks for the review, Yonghong.
>
> >
> >> ---
> >>
> >> Changes in v2:
> >> - Added asm version of the selftest for consistent testing across
> >>    different BPF ISA versions.
> >> - Added comments clearly stating the intent of the test cases.
> >> - Updated sign-extension selftest to have additional failure checks.
> >>
> >>
> >>   .../selftests/bpf/prog_tests/kfunc_call.c     |  2 +
> >>   .../selftests/bpf/progs/kfunc_call_test.c     | 98 +++++++++++++++++=
++
> >>   .../selftests/bpf/test_kmods/bpf_testmod.c    | 54 +++++++++-
> >>   .../bpf/test_kmods/bpf_testmod_kfunc.h        |  1 +
> >>   4 files changed, 154 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tools/testing/selftests/bpf/prog_tests/kfunc_call.c b/
> >> tools/testing/selftests/bpf/prog_tests/kfunc_call.c
> >> index f79c8e53cb3e..62f3fb79f5d1 100644
> >> --- a/tools/testing/selftests/bpf/prog_tests/kfunc_call.c
> >> +++ b/tools/testing/selftests/bpf/prog_tests/kfunc_call.c
> >> @@ -74,6 +74,8 @@ static struct kfunc_test_params kfunc_tests[] =3D {
> >>       TC_TEST(kfunc_call_test1, 12),
> >>       TC_TEST(kfunc_call_test2, 3),
> >>       TC_TEST(kfunc_call_test4, -1234),
> >> +    TC_TEST(kfunc_call_test5, 0),
> >> +    TC_TEST(kfunc_call_test5_asm, 0),
> >>       TC_TEST(kfunc_call_test_ref_btf_id, 0),
> >>       TC_TEST(kfunc_call_test_get_mem, 42),
> >>       SYSCALL_TEST(kfunc_syscall_test, 0),
> >> diff --git a/tools/testing/selftests/bpf/progs/kfunc_call_test.c b/
> >> tools/testing/selftests/bpf/progs/kfunc_call_test.c
> >> index 8b86113a0126..5edc51564f71 100644
> >> --- a/tools/testing/selftests/bpf/progs/kfunc_call_test.c
> >> +++ b/tools/testing/selftests/bpf/progs/kfunc_call_test.c
> >> @@ -2,8 +2,106 @@
> >>   /* Copyright (c) 2021 Facebook */
> >>   #include <vmlinux.h>
> >>   #include <bpf/bpf_helpers.h>
> >> +#include "bpf_misc.h"
> >>   #include "../test_kmods/bpf_testmod_kfunc.h"
> >> +SEC("tc")
> >> +int kfunc_call_test5(struct __sk_buff *skb)
> >> +{
> >> +    struct bpf_sock *sk =3D skb->sk;
> >> +    int ret;
> >> +    u32 val32;
> >> +    u16 val16;
> >> +    u8 val8;
> >> +
> >> +    if (!sk)
> >> +        return -1;
> >> +
> >> +    sk =3D bpf_sk_fullsock(sk);
> >> +    if (!sk)
> >> +        return -1;
> >> +
> >> +    /*
> >> +     * Test with constant values to verify zero-extension.
> >> +     * ISA-dependent BPF asm:
> >> +     *   With ALU32:    w1 =3D 0xFF; w2 =3D 0xFFFF; w3 =3D 0xFFFFffff
> >> +     *   Without ALU32: r1 =3D 0xFF; r2 =3D 0xFFFF; r3 =3D 0xFFFFffff
> >> +     * Both zero-extend to 64-bit before the kfunc call.
> >> +     */
> >> +    ret =3D bpf_kfunc_call_test5(0xFF, 0xFFFF, 0xFFFFffffULL);
> >
> > Can we just use 0xFFFFffff instead of 0xFFFFffffULL?
>
> Alexei, can you confirm if I need to respin with this change?

I prefer the explicit type when the constant is on the boundary.

I was about to apply it, but it fails on s390. See CI:

Error: #160 kfunc_call
Error: #160/13 kfunc_call/kfunc_call_test5_asm
Error: #160/13 kfunc_call/kfunc_call_test5_asm
verify_success:PASS:skel 0 nsec
verify_success:PASS:bpf_object__find_program_by_name 0 nsec
verify_success:PASS:kfunc_call_test5_asm 0 nsec
verify_success:FAIL:retval unexpected retval: actual 6 !=3D expected 0
Test Results:
bpftool: PASS
test_progs: FAIL (returned 1)

It doesn't look to be endianness related (which is often
the case for breaking s390).
In this case it could be an s390 JIT issue?

Ilya ?

pw-bot: cr
