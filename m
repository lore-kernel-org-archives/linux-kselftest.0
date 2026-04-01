Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77069375F8B;
	Wed,  1 Apr 2026 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058673; cv=none; b=oBKmS2QsfOQOU+22SxZuWbpRypH3ftxjiwEMCKTMPQntPZoWN6/r9pCpthRovZmf+cWuPgisFfudVRR85t0AAexYjYFrirWi48KRIPLE0G5eMCplJpVFyORfroxPQ5pgtZv3k3wHXpQkv+CNYdy/lNLtHw7iWGhN12zgIHNAsMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058673; c=relaxed/simple;
	bh=EQU7CULakEXXH7jofkY9RKIz7e670h1NnE9Tv2TEOmY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Dh1nM2mwHUhOEgr1RkFUQAO3lntx5kS76JML1tHhA1FmUkuvj1/2DiMVkw8G9NZb35D1+urCroWehJLi54VVR+IT93KtorYEHQeuQsR5QfTlFMr/Z9lhCoBNGfmJqJWLtCAmmMNqLfK/XE8r04h49hYyPYwH/C/FLVnmAjFB0MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=d4J+eTQb; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="d4J+eTQb"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 631FIx8H2589291
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 1 Apr 2026 08:19:00 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 631FIx8H2589291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775056741;
	bh=mofNgt6G7Tg/JG+BRVm7QC480r4gFG2au0hN5PJUl8k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d4J+eTQbJDdnmPR97Ji7+nCe/fJRnSIA9NwyIy2J0CkVuI39KQWSD5JVTLun7jBvV
	 Fs1zuMQycLKUnsW3gQfj0tZ0PsVBZZD3h1qPdKdH4nTnZj54Al4eW2VDZVJdm3tD43
	 mC1N2VIrW31u6N7gO5bBx2QINP9RTLuGuvfR3DCzeZq23NpOnVK5b80Gdk4SY5m1d8
	 dBl7JkVRIf0Tn21pKFfd9H09cFYUahsRsRwQDbJnpk9BI0PrsXgetKjTj0B4ef0ZH9
	 iG4xK7sXuBUoXztShGGCDZyXB4rTN/Q5BOaNHgDUUWXpnKdGuAFOhqcr3RJ4+AGlCv
	 5HZe0bB3tuhjg==
Date: Wed, 01 Apr 2026 08:18:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>
CC: Yi Lai <yi1.lai@intel.com>, Zijlstra Peter <peterz@infradead.org>,
        Lutomirski Andy <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Molnar Ingo <mingo@redhat.com>, Petkov Borislav <bp@alien8.de>,
        Hansen Dave <dave.hansen@linux.intel.com>,
        Cooper Andrew <andrew.cooper3@citrix.com>,
        x86 maintainers the arch <x86@kernel.org>,
        Khan Shuah <shuah@kernel.org>,
        Kernel Mailing List Linux <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_selftests/x86=3A_Fix_sysre?=
 =?US-ASCII?Q?t=5Frip_assertion_failure_on_FRED_systems?=
User-Agent: K-9 Mail for Android
In-Reply-To: <77CAB11A-0F99-445E-AD2D-2F2D9F7F5E78@zytor.com>
References: <77CAB11A-0F99-445E-AD2D-2F2D9F7F5E78@zytor.com>
Message-ID: <3F5E4280-C16A-4A3F-BFB8-593639243207@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 1, 2026 7:59:17 AM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>=EF=BB=BF
>>>>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>>>>> regs->flags'=2E This check relies on the behavior of the SYSCALL
>>>>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'=2E
>>>>>>>> However, on systems with FRED (Flexible Return and Event Delivery=
)
>>>>>>>> enabled, instead of using registers, all state is saved onto the =
stack=2E
>>>>>>>> Consequently, 'R11' retains its userspace value, causing the asse=
rtion
>>>>>>>> to fail=2E
>>>>>>>> Fix this by detecting if FRED is enabled and skipping the registe=
r
>>>>>>>> assertion in that case=2E The detection is done by checking if th=
e RPL
>>>>>>>> bits of the GS selector are preserved after a hardware exception=
=2E
>>>>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED =
(via
>>>>>>>> ERETU) preserves them=2E
>>>>>>> I don't really like this=2E  I think we have two credible choices:
>>>>>>> 1=2E Define the Linux ABI to be that, on FRED systems, SYSCALL pre=
serves
>>>>>>> R11 and RCX on entry and exit=2E  And update the test to actually =
test
>>>>>>> this=2E
>>>>>>> 2=2E Define the Linux ABI to be what it has been for quite a few y=
ears:
>>>>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>>>>>> preserves all registers=2E
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
>>>>>>> So I think we should add the ~2 lines of code to fix the SYSCALL e=
ntry
>>>>>>> on FRED to match non-FRED=2E
>>>>>> Yes; I'm afraid I have to concur=2E Preserving the clobber on entry=
 for
>>>>>> FRED systems is by far the safest choice=2E
>>>>>> Aside from this selftest, fancy debuggers and anything that can tra=
nsfer
>>>>>> userspace state between machines might be 'surprised'=2E
>>>>> Thanks Andy and Peter=2E
>>>>> Indeed, making the selftest branch on FRED vs=2E non-FRED behavior
>>>>> is not a good practice=2E The selftest should validate ABI consisten=
cy=2E
>>>>> I agree with Andy's option #2, so this should be fixed in the FRED
>>>>> syscall entry implementation=2E
>>>>> Li Xin, does this direction look right to you? I can assit with
>>>>> validation and keep the selftest aligned with the agreed ABI=2E
>>>> Yes, consistency should take precedence over hardware-specific variat=
ions=2E
>>>> I would like to hear from Andrew Cooper and hpa before we do it=2E
>>> Per Andy=E2=80=99s suggestion, the change would be:
>>> diff --git a/arch/x86/entry/entry_fred=2Ec b/arch/x86/entry/entry_fred=
=2Ec
>>> index 88c757ac8ccd=2E=2Ea19898747a2c 100644
>>> --- a/arch/x86/entry/entry_fred=2Ec
>>> +++ b/arch/x86/entry/entry_fred=2Ec
>>> @@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_reg=
s *regs)
>>> {
>>> /* The compiler can fold these conditions into a single test */
>>> if (likely(regs->fred_ss=2Evector =3D=3D FRED_SYSCALL && regs->fred_ss=
=2El)) {
>>> +        regs->cx =3D regs->ip;
>>> +        regs->r11 =3D regs->flags;
>>> +
>>>    regs->orig_ax =3D regs->ax;
>>>    regs->ax =3D -ENOSYS;
>>>    do_syscall_64(regs, regs->orig_ax);
>>> It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's a =
problem here=2E
>>=20
>> We discussed this over a year ago, and at that point agreed that reserv=
ing the register was the desired behavior=2E Why has this changed now?
>
>Yes, that is technically simpler and cleaner=2E
>
>The question brought up by Andy is, is the RCX/R11 clobbering behavior an=
 established architectural contract, or is it an implementation detail that=
 software ignores?
>
>But both are hard to prove=2E
>
>I think Andy and PeterZ want to be on the safer side, i=2Ee=2E, this clob=
bering behavior is established=2E
>

I do see the point especially by the time developers will be mostly on FRE=
D-capable hardware and their programs end up failing on legacy=2E=20

I'm more annoyed because we actually had this discussion once already=2E
