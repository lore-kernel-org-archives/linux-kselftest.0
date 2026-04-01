Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4FA370D62;
	Wed,  1 Apr 2026 03:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775012785; cv=none; b=eI+ICx1OwVHbgxkUJ0QRkIPqPs65lqcHGgT7ROxyJTISe/PCw6RSTVzKfR9598y6YB0m5R2iPE/HP2ZKNHm7MGr4sdaGckCXIKwGq8SH2uVYosMXVjm3gfWcwtVuLJgElFNMCp8XPRrDQXj27ks5S3u/OAqg4ZqkqumUXnGYL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775012785; c=relaxed/simple;
	bh=gXYXU3bjuBX7pMTIJZ2X4lQpzBLeXA8zyv1z1xH502Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=b+22KwBdZrhQkrguDMBuLMSfwZ8SRvxbHoF41PhNaNGV7+KlAjfAwxfFkrQiqhSA13TaVmQaqcnqVIXSlEHRm1yCkmZt8JPtcJ8u2/ThNtHOQvefMbGk07OEOzWf1kEmmRd02qFBkGs58/O8b8CIRTsxANMPsFnLQ1X4SOTDu4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=iJQBXzH+; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="iJQBXzH+"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6312mDBW1350248
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 31 Mar 2026 19:48:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6312mDBW1350248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775011694;
	bh=UruaA8qNd4O3gD374Pj4fjqcSgBsMnolMzN4x29oqSA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=iJQBXzH+iB8VJYgBFwUEqDrDZDFMPpnUsdn6RKroS34BPs91Xlm4RHnWlQW+ZctCv
	 p4ihABAqT2CBuR2DV+iwKg12e+cNkezytPYRK4zenq9vrAtcGosHjhWMfle+kKw2Gy
	 nJ08SIgH0cEqHYIAhdG5BU8QigL6AMVKua/x02nQ192izIGx3dn7IJglN6jGPZS9r0
	 kMEi9ZZg6rJF0+CJpt/YT7ZEYnzwccQK8G81LZvye1Sfk4A0kSMXNQiDgdCE0NPXU9
	 vA0fE+v7GvYwappIjnVl6UGX9m+Dp8jTabGyZizpcFyI4SHF69wg4qeRg4PvkwREtr
	 vDUwMoEvNONZA==
Date: Tue, 31 Mar 2026 19:48:06 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, "Lai, Yi" <yi1.lai@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_selftests/x86=3A_Fix_sysre?=
 =?US-ASCII?Q?t=5Frip_assertion_failure_on_FRED_systems?=
User-Agent: K-9 Mail for Android
In-Reply-To: <E9D8D677-1B95-4569-829E-80E8B8371198@zytor.com>
References: <20260326094423.711724-1-yi1.lai@intel.com> <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com> <20260327123315.GR2872@noisy.programming.kicks-ass.net> <acsvrv0gCwTI9rWI@ly-workstation> <EFD7015E-E7B1-4BF1-81A1-1627E1D3DE31@zytor.com> <E9D8D677-1B95-4569-829E-80E8B8371198@zytor.com>
Message-ID: <1D8D9EE4-D652-4E09-86C2-2D3FAB151100@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 31, 2026 6:59:06 PM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>
>
>> On Mar 30, 2026, at 11:03=E2=80=AFPM, Xin Li <xin@zytor=2Ecom> wrote:
>>=20
>>=20
>>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>>> regs->flags'=2E This check relies on the behavior of the SYSCALL
>>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'=2E
>>>>>>=20
>>>>>> However, on systems with FRED (Flexible Return and Event Delivery)
>>>>>> enabled, instead of using registers, all state is saved onto the st=
ack=2E
>>>>>> Consequently, 'R11' retains its userspace value, causing the assert=
ion
>>>>>> to fail=2E
>>>>>>=20
>>>>>> Fix this by detecting if FRED is enabled and skipping the register
>>>>>> assertion in that case=2E The detection is done by checking if the =
RPL
>>>>>> bits of the GS selector are preserved after a hardware exception=2E
>>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (v=
ia
>>>>>> ERETU) preserves them=2E
>>>>>>=20
>>>>>=20
>>>>> I don't really like this=2E  I think we have two credible choices:
>>>>>=20
>>>>> 1=2E Define the Linux ABI to be that, on FRED systems, SYSCALL prese=
rves
>>>>> R11 and RCX on entry and exit=2E  And update the test to actually te=
st
>>>>> this=2E
>>>>>=20
>>>>> 2=2E Define the Linux ABI to be what it has been for quite a few yea=
rs:
>>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>>>> preserves all registers=2E
>>>>>=20
>>>>> I'm in favor of #2=2E  People love making new programming languages =
and
>>>>> runtimes and inline asm and, these days, vibe coded crap=2E  And it'=
s
>>>>> *easier* to emit a SYSCALL and forget to tell the compiler / code
>>>>> generator that RCX and R11 are clobbered than it is to remember that
>>>>> they're clobbered=2E  And it's easy to test on FRED (well, not reall=
y,
>>>>> but it hopefully will be some day) and it's easy to publish one's
>>>>> code, and then everyone is a bit screwed when the resulting program
>>>>> crashes sometimes on non-FRED systems=2E  And it will be miserable t=
o
>>>>> debug=2E
>>>>>=20
>>>>> (It's *really* *really* easy to screw this up in a way that sort of
>>>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>>>> function calls, so one can get into a situation in which one's
>>>>> generated code usually doesn't require that SYSCALL preserve one of
>>>>> these registers until an inlining decision changes or some code gets
>>>>> reordered, and then it will start failing=2E  And making the failure
>>>>> depend on hardware details is just nasty=2E
>>>>>=20
>>>>> So I think we should add the ~2 lines of code to fix the SYSCALL ent=
ry
>>>>> on FRED to match non-FRED=2E
>>>>=20
>>>> Yes; I'm afraid I have to concur=2E Preserving the clobber on entry f=
or
>>>> FRED systems is by far the safest choice=2E=20
>>>>=20
>>>> Aside from this selftest, fancy debuggers and anything that can trans=
fer
>>>> userspace state between machines might be 'surprised'=2E
>>>=20
>>> Thanks Andy and Peter=2E
>>>=20
>>> Indeed, making the selftest branch on FRED vs=2E non-FRED behavior
>>> is not a good practice=2E The selftest should validate ABI consistency=
=2E
>>>=20
>>> I agree with Andy's option #2, so this should be fixed in the FRED
>>> syscall entry implementation=2E
>>>=20
>>> Li Xin, does this direction look right to you? I can assit with
>>> validation and keep the selftest aligned with the agreed ABI=2E
>>>=20
>>=20
>> Yes, consistency should take precedence over hardware-specific variatio=
ns=2E
>>=20
>> I would like to hear from Andrew Cooper and hpa before we do it=2E
>
>Per Andy=E2=80=99s suggestion, the change would be:
>
>diff --git a/arch/x86/entry/entry_fred=2Ec b/arch/x86/entry/entry_fred=2E=
c
>index 88c757ac8ccd=2E=2Ea19898747a2c 100644
>--- a/arch/x86/entry/entry_fred=2Ec
>+++ b/arch/x86/entry/entry_fred=2Ec
>@@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_regs *=
regs)
> {
> 	/* The compiler can fold these conditions into a single test */
> 	if (likely(regs->fred_ss=2Evector =3D=3D FRED_SYSCALL && regs->fred_ss=
=2El)) {
>+		regs->cx =3D regs->ip;
>+		regs->r11 =3D regs->flags;
>+
> 		regs->orig_ax =3D regs->ax;
> 		regs->ax =3D -ENOSYS;
> 		do_syscall_64(regs, regs->orig_ax);
>
>It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's a pro=
blem here=2E
>
>
>
>
>
>
>

We discussed this over a year ago, and at that point agreed that reserving=
 the register was the desired behavior=2E Why has this changed now?
