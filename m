Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678333FE1F;
	Wed,  1 Apr 2026 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055905; cv=none; b=DyndXrbix0d80vu6kDxYTznL05M6zIUIIe3cuKE+RIU8dBHSlS/T03J732UV3qz08BXFEux2KZ06pj7KvCwj0fiHPorjdLRBB8VHqtRPh5j+6R2RcOujzzhVjagFCuhzW8R3SRVtOVxKPbdm3Mo+alHFg7kUtPlgPrFYuteHAKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055905; c=relaxed/simple;
	bh=Gj4nYmiE5QGl6Bcerec5KGvNnAP6gh8kkRSYgdtOASw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=OtrgFDiuAf3vbQUujVTrwOw33zORLF1A2mLusyCgkhW/Ic2ik4n28vROUi4980QNZjQpePXWyYr/iFTbn8VTO+gIrz0KIL/0QM4YasYNMYRMHqnCyUZny++cLG4yIW6hQrLcB9244Gr8pTXwY5GzqferbeSTfzoqQy7YGHE3g0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=BxfsulqA; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="BxfsulqA"
Received: from smtpclient.apple ([192.19.50.250])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 631EmZkx2538037
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 1 Apr 2026 07:48:36 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 631EmZkx2538037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775054916;
	bh=jMfLpN8THsCl36dLPaHeTAdSjI8rKpQDChwXYCJmOis=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=BxfsulqAruY1oOqaPonaxLRV3m6+bOjfE91RS6siAXbOynXL+ydJsagerGENz6aq3
	 tFuG/2ZNvn1R8TsFq4Ajj/ODyQM+llkxvQpBw2Lm78gaP/2hOvCVS+n5g9/2RKd3eL
	 ih3uQ1fcPJYxj7Atoawt1XumHXVkhbKlpaxYAIqkiu2R1EGYgp4ODELvheJeK3cSZt
	 0ZcEURXWmYf7Wfa/hMAjK32P/E+hNtjcYw8AKwISC7++asEVraq6TviHQttSL7ErD4
	 VdwM7GIC0uxz36zUTLeJRg+dAmm9dIhcDzaK7ZnPOpAUNywktgVtHLcLSpHjNtm301
	 iAdyKICsfwqAQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Xin Li <xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Date: Wed, 1 Apr 2026 07:36:48 -0700
Message-Id: <B916BEC6-D778-46FF-8271-D6BE6EBD042B@zytor.com>
References: <1D8D9EE4-D652-4E09-86C2-2D3FAB151100@zytor.com>
Cc: Lai Yi <yi1.lai@intel.com>, Zijlstra Peter <peterz@infradead.org>,
        Lutomirski Andy <luto@kernel.org>, Gleixner Thomas <tglx@kernel.org>,
        Molnar Ingo <mingo@redhat.com>, Petkov Borislav <bp@alien8.de>,
        Hansen Dave <dave.hansen@linux.intel.com>,
        Cooper Andrew <andrew.cooper3@citrix.com>,
        the arch x86 maintainers <x86@kernel.org>,
        Khan Shuah <shuah@kernel.org>,
        Kernel Mailing List Linux <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
In-Reply-To: <1D8D9EE4-D652-4E09-86C2-2D3FAB151100@zytor.com>
To: "Anvin H. Peter" <hpa@zytor.com>
X-Mailer: iPhone Mail (23E246)


Thanks!
Xin

> On Mar 31, 2026, at 8:15=E2=80=AFPM, H. Peter Anvin <hpa@zytor.com> wrote:=

>=20
> =EF=BB=BFOn March 31, 2026 6:59:06 PM PDT, Xin Li <xin@zytor.com> wrote:
>>=20
>>=20
>>>> On Mar 30, 2026, at 11:03=E2=80=AFPM, Xin Li <xin@zytor.com> wrote:
>>>=20
>>>=20
>>>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>>>> regs->flags'. This check relies on the behavior of the SYSCALL
>>>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>>>>>>>=20
>>>>>>> However, on systems with FRED (Flexible Return and Event Delivery)
>>>>>>> enabled, instead of using registers, all state is saved onto the sta=
ck.
>>>>>>> Consequently, 'R11' retains its userspace value, causing the asserti=
on
>>>>>>> to fail.
>>>>>>>=20
>>>>>>> Fix this by detecting if FRED is enabled and skipping the register
>>>>>>> assertion in that case. The detection is done by checking if the RPL=

>>>>>>> bits of the GS selector are preserved after a hardware exception.
>>>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (vi=
a
>>>>>>> ERETU) preserves them.
>>>>>>>=20
>>>>>>=20
>>>>>> I don't really like this.  I think we have two credible choices:
>>>>>>=20
>>>>>> 1. Define the Linux ABI to be that, on FRED systems, SYSCALL preserve=
s
>>>>>> R11 and RCX on entry and exit.  And update the test to actually test
>>>>>> this.
>>>>>>=20
>>>>>> 2. Define the Linux ABI to be what it has been for quite a few years:=

>>>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>>>>> preserves all registers.
>>>>>>=20
>>>>>> I'm in favor of #2.  People love making new programming languages and=

>>>>>> runtimes and inline asm and, these days, vibe coded crap.  And it's
>>>>>> *easier* to emit a SYSCALL and forget to tell the compiler / code
>>>>>> generator that RCX and R11 are clobbered than it is to remember that
>>>>>> they're clobbered.  And it's easy to test on FRED (well, not really,
>>>>>> but it hopefully will be some day) and it's easy to publish one's
>>>>>> code, and then everyone is a bit screwed when the resulting program
>>>>>> crashes sometimes on non-FRED systems.  And it will be miserable to
>>>>>> debug.
>>>>>>=20
>>>>>> (It's *really* *really* easy to screw this up in a way that sort of
>>>>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>>>>> function calls, so one can get into a situation in which one's
>>>>>> generated code usually doesn't require that SYSCALL preserve one of
>>>>>> these registers until an inlining decision changes or some code gets
>>>>>> reordered, and then it will start failing.  And making the failure
>>>>>> depend on hardware details is just nasty.
>>>>>>=20
>>>>>> So I think we should add the ~2 lines of code to fix the SYSCALL entr=
y
>>>>>> on FRED to match non-FRED.
>>>>>=20
>>>>> Yes; I'm afraid I have to concur. Preserving the clobber on entry for
>>>>> FRED systems is by far the safest choice.
>>>>>=20
>>>>> Aside from this selftest, fancy debuggers and anything that can transf=
er
>>>>> userspace state between machines might be 'surprised'.
>>>>=20
>>>> Thanks Andy and Peter.
>>>>=20
>>>> Indeed, making the selftest branch on FRED vs. non-FRED behavior
>>>> is not a good practice. The selftest should validate ABI consistency.
>>>>=20
>>>> I agree with Andy's option #2, so this should be fixed in the FRED
>>>> syscall entry implementation.
>>>>=20
>>>> Li Xin, does this direction look right to you? I can assit with
>>>> validation and keep the selftest aligned with the agreed ABI.
>>>>=20
>>>=20
>>> Yes, consistency should take precedence over hardware-specific variation=
s.
>>>=20
>>> I would like to hear from Andrew Cooper and hpa before we do it.
>>=20
>> Per Andy=E2=80=99s suggestion, the change would be:
>>=20
>> diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
>> index 88c757ac8ccd..a19898747a2c 100644
>> --- a/arch/x86/entry/entry_fred.c
>> +++ b/arch/x86/entry/entry_fred.c
>> @@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_regs *=
regs)
>> {
>>    /* The compiler can fold these conditions into a single test */
>>    if (likely(regs->fred_ss.vector =3D=3D FRED_SYSCALL && regs->fred_ss.l=
)) {
>> +        regs->cx =3D regs->ip;
>> +        regs->r11 =3D regs->flags;
>> +
>>        regs->orig_ax =3D regs->ax;
>>        regs->ax =3D -ENOSYS;
>>        do_syscall_64(regs, regs->orig_ax);
>>=20
>> It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's a pro=
blem here.
>=20
> We discussed this over a year ago, and at that point agreed that reserving=
 the register was the desired behavior. Why has this changed now?

Yes, that is technically cleaner.

The question is, is the RCX/R11 clobbering behavior an established architect=
ural contract, or is it an implementation detail that software ignores?

I think Andy and Peter want to be on the safer side, which kind of assumes t=
hat this is established.=

