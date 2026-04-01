Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0230FC2E;
	Wed,  1 Apr 2026 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067046; cv=none; b=EUQhubv8yiPq1M0rdDmG5Hftq3AOOwViABzN5ziZQIvcMQfURp1huw/VimEkjIl7sKswVT3fEpt2QpN3ME+UTjk3+ykYGlv4/dhAUfacvz6ceuDgAzj1my9zjudai0ij+wczGnbcqi0HD3dqetJQYrT6x8llX5FMW06pE4ql4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067046; c=relaxed/simple;
	bh=6/UO2URE+YIKYjqsTOwnEaougPS3xZYkX7VPNX4CO5A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fVJgCYCftZgXdjy6IAagk9xlfiYLXtBQoTc/YORDdNG8vXi1QUce379gGgg8hWA81++gMecBjpxNqwCtIBhiVe7ZYoy8JFlNk5qRyuJtGLokrR95bsXd40SKZONOYjE6Vd2QuYoydcmM3bdfnLWiBRNVqnu2prHypODmO0eI+7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=boPmJBtL; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="boPmJBtL"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 631HsG2V2851207
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 1 Apr 2026 10:54:17 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 631HsG2V2851207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775066057;
	bh=KXGdV30YndhNcec4J91I3N4IqsRjdt538vz7Vydd6lQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=boPmJBtLRLI8A7mgMUQL4R49o7+/Cy/C0H3ujnfHIX8+wDzgVyoczL7stT/0ov5oU
	 GKe/e7kfZxK3VGjl0GITY9BFPNqnguwaXoBaLWysvXYmomjwB4kC7NACeqdEF5Ox2Q
	 zQM/DiHNf6ID/vSH/naAKGpUDfvACPFV68e0yBEY0m3gr9T4ZSwPzoJhbvRHIUi8+X
	 o6JelRLz2w19ySuUExq6rhS4+QfJy9PTUeDNP0EtzFbZv4VBw560hCXqEnnoPbYkQU
	 NS3GYHnb0Lt07+WzdHzzbTyZdHdYR/lmC56nte5gVBsGawMx02xwbfo2Mmg5+JtxUT
	 Rk4jg1Z5IVuWQ==
Date: Wed, 01 Apr 2026 10:54:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>
CC: Lai Yi <yi1.lai@intel.com>, Zijlstra Peter <peterz@infradead.org>,
        Lutomirski Andy <luto@kernel.org>, Gleixner Thomas <tglx@kernel.org>,
        Molnar Ingo <mingo@redhat.com>, Petkov Borislav <bp@alien8.de>,
        Hansen Dave <dave.hansen@linux.intel.com>,
        Cooper Andrew <andrew.cooper3@citrix.com>,
        the arch x86 maintainers <x86@kernel.org>,
        Khan Shuah <shuah@kernel.org>,
        Kernel Mailing List Linux <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_selftests/x86=3A_Fix_sysre?=
 =?US-ASCII?Q?t=5Frip_assertion_failure_on_FRED_systems?=
User-Agent: K-9 Mail for Android
In-Reply-To: <B916BEC6-D778-46FF-8271-D6BE6EBD042B@zytor.com>
References: <1D8D9EE4-D652-4E09-86C2-2D3FAB151100@zytor.com> <B916BEC6-D778-46FF-8271-D6BE6EBD042B@zytor.com>
Message-ID: <C318F823-C3B9-49D1-8048-C57E34538F4D@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 1, 2026 7:36:48 AM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>
>Thanks!
>Xin
>
>> On Mar 31, 2026, at 8:15=E2=80=AFPM, H=2E Peter Anvin <hpa@zytor=2Ecom>=
 wrote:
>>=20
>> =EF=BB=BFOn March 31, 2026 6:59:06 PM PDT, Xin Li <xin@zytor=2Ecom> wro=
te:
>>>=20
>>>=20
>>>>> On Mar 30, 2026, at 11:03=E2=80=AFPM, Xin Li <xin@zytor=2Ecom> wrote=
:
>>>>=20
>>>>=20
>>>>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>>>>> regs->flags'=2E This check relies on the behavior of the SYSCALL
>>>>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'=2E
>>>>>>>>=20
>>>>>>>> However, on systems with FRED (Flexible Return and Event Delivery=
)
>>>>>>>> enabled, instead of using registers, all state is saved onto the =
stack=2E
>>>>>>>> Consequently, 'R11' retains its userspace value, causing the asse=
rtion
>>>>>>>> to fail=2E
>>>>>>>>=20
>>>>>>>> Fix this by detecting if FRED is enabled and skipping the registe=
r
>>>>>>>> assertion in that case=2E The detection is done by checking if th=
e RPL
>>>>>>>> bits of the GS selector are preserved after a hardware exception=
=2E
>>>>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED =
(via
>>>>>>>> ERETU) preserves them=2E
>>>>>>>>=20
>>>>>>>=20
>>>>>>> I don't really like this=2E  I think we have two credible choices:
>>>>>>>=20
>>>>>>> 1=2E Define the Linux ABI to be that, on FRED systems, SYSCALL pre=
serves
>>>>>>> R11 and RCX on entry and exit=2E  And update the test to actually =
test
>>>>>>> this=2E
>>>>>>>=20
>>>>>>> 2=2E Define the Linux ABI to be what it has been for quite a few y=
ears:
>>>>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>>>>>> preserves all registers=2E
>>>>>>>=20
>>>>>>> I'm in favor of #2=2E  People love making new programming language=
s and
>>>>>>> runtimes and inline asm and, these days, vibe coded crap=2E  And i=
t's
>>>>>>> *easier* to emit a SYSCALL and forget to tell the compiler / code
>>>>>>> generator that RCX and R11 are clobbered than it is to remember th=
at
>>>>>>> they're clobbered=2E  And it's easy to test on FRED (well, not rea=
lly,
>>>>>>> but it hopefully will be some day) and it's easy to publish one's
>>>>>>> code, and then everyone is a bit screwed when the resulting progra=
m
>>>>>>> crashes sometimes on non-FRED systems=2E  And it will be miserable=
 to
>>>>>>> debug=2E
>>>>>>>=20
>>>>>>> (It's *really* *really* easy to screw this up in a way that sort o=
f
>>>>>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>>>>>> function calls, so one can get into a situation in which one's
>>>>>>> generated code usually doesn't require that SYSCALL preserve one o=
f
>>>>>>> these registers until an inlining decision changes or some code ge=
ts
>>>>>>> reordered, and then it will start failing=2E  And making the failu=
re
>>>>>>> depend on hardware details is just nasty=2E
>>>>>>>=20
>>>>>>> So I think we should add the ~2 lines of code to fix the SYSCALL e=
ntry
>>>>>>> on FRED to match non-FRED=2E
>>>>>>=20
>>>>>> Yes; I'm afraid I have to concur=2E Preserving the clobber on entry=
 for
>>>>>> FRED systems is by far the safest choice=2E
>>>>>>=20
>>>>>> Aside from this selftest, fancy debuggers and anything that can tra=
nsfer
>>>>>> userspace state between machines might be 'surprised'=2E
>>>>>=20
>>>>> Thanks Andy and Peter=2E
>>>>>=20
>>>>> Indeed, making the selftest branch on FRED vs=2E non-FRED behavior
>>>>> is not a good practice=2E The selftest should validate ABI consisten=
cy=2E
>>>>>=20
>>>>> I agree with Andy's option #2, so this should be fixed in the FRED
>>>>> syscall entry implementation=2E
>>>>>=20
>>>>> Li Xin, does this direction look right to you? I can assit with
>>>>> validation and keep the selftest aligned with the agreed ABI=2E
>>>>>=20
>>>>=20
>>>> Yes, consistency should take precedence over hardware-specific variat=
ions=2E
>>>>=20
>>>> I would like to hear from Andrew Cooper and hpa before we do it=2E
>>>=20
>>> Per Andy=E2=80=99s suggestion, the change would be:
>>>=20
>>> diff --git a/arch/x86/entry/entry_fred=2Ec b/arch/x86/entry/entry_fred=
=2Ec
>>> index 88c757ac8ccd=2E=2Ea19898747a2c 100644
>>> --- a/arch/x86/entry/entry_fred=2Ec
>>> +++ b/arch/x86/entry/entry_fred=2Ec
>>> @@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_reg=
s *regs)
>>> {
>>>    /* The compiler can fold these conditions into a single test */
>>>    if (likely(regs->fred_ss=2Evector =3D=3D FRED_SYSCALL && regs->fred=
_ss=2El)) {
>>> +        regs->cx =3D regs->ip;
>>> +        regs->r11 =3D regs->flags;
>>> +
>>>        regs->orig_ax =3D regs->ax;
>>>        regs->ax =3D -ENOSYS;
>>>        do_syscall_64(regs, regs->orig_ax);
>>>=20
>>> It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's a =
problem here=2E
>>=20
>> We discussed this over a year ago, and at that point agreed that reserv=
ing the register was the desired behavior=2E Why has this changed now?
>
>Yes, that is technically cleaner=2E
>
>The question is, is the RCX/R11 clobbering behavior an established archit=
ectural contract, or is it an implementation detail that software ignores?
>
>I think Andy and Peter want to be on the safer side, which kind of assume=
s that this is established=2E
>

Clobbering is never an architectural contract; clobbering is always an opt=
ion=2E However, I understand the concern that a developer who writes softwa=
re on a FRED system which breaks on a legacy system=2E

Last time this came up, the policy we decided on was that a system that cl=
obbers must do so in all cases (in order to not leak internal kernel state)=
 but a system that can preserve (FRED or IDT-without-SYSCALL) may always do=
 so=2E

I would prefer if we could defer this policy reversal for a bit=2E Since t=
here is production hardware out now, I have been working on actually tuning=
 the FRED code paths, and because the Linux kernel is so efficient, details=
 matter in surprising ways=2E=20

I *particularly* dislike clobbering registers on the way *into* the kernel=
, though=2E That needlessly makes them unavailable to a debugger, and one o=
f the benefits of FRED is improving debug visibility in some specific cases=
=2E
