Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344EA36B076;
	Wed,  1 Apr 2026 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057494; cv=none; b=YLYDSwLZnSXpa6f+AwqfDGfkwbLkxfje3t2igbs4ZNWHqzzMiaVeQvDkNn9bXzgS+Ivfddm7AZm3Ipo2iwiOKwxNMETVxzNw5yhV6KJfTxqn1aodkTgXl4kVypJdxtuks7STi1cpOGLKmSsTW1BlchpVEEqjcYyo+uMVcNw6JzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057494; c=relaxed/simple;
	bh=k2G2oFD5L036PRyLuIEJ/XA16qvy2FU7ncGYB5KzCL8=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=uu6zqEq2tdrjTvGBTmO/5Cc/Ab+Ya3KBz6S5ktKz6Sua2OG3kniqMnBtw+vENkawDmiA3t6vOhnrl6+uvJGHJ1HL+HvrqNH4O9wbSnyvm9ojIEFMpRj4GGIP1c5T1yuEFP/OiluIp+1n/Yub0wDgAqBc1AVz6BFXUtiHrI6VwBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=OitKZyLx; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="OitKZyLx"
Received: from smtpclient.apple ([192.19.50.250])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 631FF1EO2583560
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 1 Apr 2026 08:15:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 631FF1EO2583560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775056503;
	bh=mMEQTCz402A+YbMFjPCyJ3u/efRrKb3zIqJDLbKFGeg=;
	h=From:Subject:Date:Cc:To:From;
	b=OitKZyLxmzzKqrX9ZErQIYeBwCpCXYfDGPmQ2TCjBCLB/xwSpI9n8kXsGPR4bsHZy
	 AGgfcvN7DtIuQ/7uRQMUAYi7hEhh7fipXr6FvRHxrnuIJ1CPoco5xrRBPsLcSPERMk
	 ujfm/ZJIaqdAPlc+bIxwlYwFhhn4v9C6XwXh3Ke8VedJ/p0SyU69x4xZviOTT1VMKx
	 vwiYAo40PeDUpsB+DocA0o3aj8clnVLHtd8Y+4voyz1eT7It+ZfT+KANCysVWq6jtf
	 KVVmOW3Mozxxb2i56TV6CAEB8KWTrPBPPqjxeuzEsMxItOU90WQn/Af68/sogvbZ4w
	 /H5sD45eiHWBg==
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
Message-Id: <77CAB11A-0F99-445E-AD2D-2F2D9F7F5E78@zytor.com>
Date: Wed, 1 Apr 2026 07:59:17 -0700
Cc: Yi Lai <yi1.lai@intel.com>, Zijlstra Peter <peterz@infradead.org>,
        Lutomirski Andy <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Molnar Ingo <mingo@redhat.com>, Petkov Borislav <bp@alien8.de>,
        Hansen Dave <dave.hansen@linux.intel.com>,
        Cooper Andrew <andrew.cooper3@citrix.com>,
        x86 maintainers the arch <x86@kernel.org>,
        Khan Shuah <shuah@kernel.org>,
        Kernel Mailing List Linux <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
To: "Anvin H. Peter" <hpa@zytor.com>
X-Mailer: iPhone Mail (23E246)

=EF=BB=BF
>>>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>>>> regs->flags'. This check relies on the behavior of the SYSCALL
>>>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>>>>>>> However, on systems with FRED (Flexible Return and Event Delivery)
>>>>>>> enabled, instead of using registers, all state is saved onto the sta=
ck.
>>>>>>> Consequently, 'R11' retains its userspace value, causing the asserti=
on
>>>>>>> to fail.
>>>>>>> Fix this by detecting if FRED is enabled and skipping the register
>>>>>>> assertion in that case. The detection is done by checking if the RPL=

>>>>>>> bits of the GS selector are preserved after a hardware exception.
>>>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (vi=
a
>>>>>>> ERETU) preserves them.
>>>>>> I don't really like this.  I think we have two credible choices:
>>>>>> 1. Define the Linux ABI to be that, on FRED systems, SYSCALL preserve=
s
>>>>>> R11 and RCX on entry and exit.  And update the test to actually test
>>>>>> this.
>>>>>> 2. Define the Linux ABI to be what it has been for quite a few years:=

>>>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>>>>> preserves all registers.
>>>>>> I'm in favor of #2.  People love making new programming languages and=

>>>>>> runtimes and inline asm and, these days, vibe coded crap.  And it's
>>>>>> *easier* to emit a SYSCALL and forget to tell the compiler / code
>>>>>> generator that RCX and R11 are clobbered than it is to remember that
>>>>>> they're clobbered.  And it's easy to test on FRED (well, not really,
>>>>>> but it hopefully will be some day) and it's easy to publish one's
>>>>>> code, and then everyone is a bit screwed when the resulting program
>>>>>> crashes sometimes on non-FRED systems.  And it will be miserable to
>>>>>> debug.
>>>>>> (It's *really* *really* easy to screw this up in a way that sort of
>>>>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>>>>> function calls, so one can get into a situation in which one's
>>>>>> generated code usually doesn't require that SYSCALL preserve one of
>>>>>> these registers until an inlining decision changes or some code gets
>>>>>> reordered, and then it will start failing.  And making the failure
>>>>>> depend on hardware details is just nasty.
>>>>>> So I think we should add the ~2 lines of code to fix the SYSCALL entr=
y
>>>>>> on FRED to match non-FRED.
>>>>> Yes; I'm afraid I have to concur. Preserving the clobber on entry for
>>>>> FRED systems is by far the safest choice.
>>>>> Aside from this selftest, fancy debuggers and anything that can transf=
er
>>>>> userspace state between machines might be 'surprised'.
>>>> Thanks Andy and Peter.
>>>> Indeed, making the selftest branch on FRED vs. non-FRED behavior
>>>> is not a good practice. The selftest should validate ABI consistency.
>>>> I agree with Andy's option #2, so this should be fixed in the FRED
>>>> syscall entry implementation.
>>>> Li Xin, does this direction look right to you? I can assit with
>>>> validation and keep the selftest aligned with the agreed ABI.
>>> Yes, consistency should take precedence over hardware-specific variation=
s.
>>> I would like to hear from Andrew Cooper and hpa before we do it.
>> Per Andy=E2=80=99s suggestion, the change would be:
>> diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
>> index 88c757ac8ccd..a19898747a2c 100644
>> --- a/arch/x86/entry/entry_fred.c
>> +++ b/arch/x86/entry/entry_fred.c
>> @@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_regs *=
regs)
>> {
>> /* The compiler can fold these conditions into a single test */
>> if (likely(regs->fred_ss.vector =3D=3D FRED_SYSCALL && regs->fred_ss.l)) {=

>> +        regs->cx =3D regs->ip;
>> +        regs->r11 =3D regs->flags;
>> +
>>    regs->orig_ax =3D regs->ax;
>>    regs->ax =3D -ENOSYS;
>>    do_syscall_64(regs, regs->orig_ax);
>> It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's a pro=
blem here.
>=20
> We discussed this over a year ago, and at that point agreed that reserving=
 the register was the desired behavior. Why has this changed now?

Yes, that is technically simpler and cleaner.

The question brought up by Andy is, is the RCX/R11 clobbering behavior an es=
tablished architectural contract, or is it an implementation detail that sof=
tware ignores?

But both are hard to prove.

I think Andy and PeterZ want to be on the safer side, i.e., this clobbering b=
ehavior is established.=

