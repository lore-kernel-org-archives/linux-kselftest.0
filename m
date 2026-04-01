Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E92D5C83;
	Wed,  1 Apr 2026 01:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775008795; cv=none; b=l9SdQyskqJ8wwyVy1iMPKbxHxdTtGXK0H5PM7U7d/4g0GNG8ivXs4zGJnX2FNbYD7+9INtkswSZcZlRZ3CFTBtIo2DZHUEBmH2Hz2v2UdtEA/wGxOae3LXeRv4Q1IAFRUFu/jfjc/127irDTDNsO+1X1NCkryFg1fCo+XPqDcJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775008795; c=relaxed/simple;
	bh=dOJkTuKDr7ySXlaZ38gQ1Jlrw1u+OTr6BAkydjc3ctc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kM4TOIEpKFfxYkRuNej0KTZVB/VEygJlo/7NNbsWkZt5Afh/gD8tVeP+xXhvbp/PW72AM9jJinXCQEFuW1UQUEpjBtkSYRwpZ2B4YmhM6hqa7JuZUkHsv6I8dSnucFvXMwL9luuLQIMNndbF8Px5CU/lurRV9arWdjH9OzF486Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=C3EHehDN; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="C3EHehDN"
Received: from smtpclient.apple (c-24-130-165-117.hsd1.ca.comcast.net [24.130.165.117])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6311xGtD1270444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 31 Mar 2026 18:59:17 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6311xGtD1270444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775008758;
	bh=WmlUZWzNY5gcEvkZUthE1kF5AYBlru6iC/oQG+1BeDg=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=C3EHehDNhrHlxQYIdTZbgtIY6xMkEjZG2DKMNHKCSsS1o5ye33Ri7iTbSVpHs/9rP
	 5JDJ3XdvApZC2i7SuteNYU9YLenZhWb5xZDMEo++QfLiKcyL/MIYziaHXNTtCE/9Yt
	 v3TRuX52NwkN1JnG2wNeu31YHtAFR8LtyU/0eorZzaBJkkHMNBbhBDa56CKRPb7YG+
	 YX18vfQB+keWAjiMEOW3e8SU/OZKxaGOB7XteeMFxPMUlk4GE1f9BuAdPVmoF2fOug
	 Mn7CREORMcX9qbj8IU7/EKjPrTuXdVALaK4fO5Axgcbj4pv/PXi6nczzQqMFEsGS97
	 DW8OnikRrhYcw==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
From: Xin Li <xin@zytor.com>
In-Reply-To: <EFD7015E-E7B1-4BF1-81A1-1627E1D3DE31@zytor.com>
Date: Tue, 31 Mar 2026 18:59:06 -0700
Cc: Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9D8D677-1B95-4569-829E-80E8B8371198@zytor.com>
References: <20260326094423.711724-1-yi1.lai@intel.com>
 <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com>
 <20260327123315.GR2872@noisy.programming.kicks-ass.net>
 <acsvrv0gCwTI9rWI@ly-workstation>
 <EFD7015E-E7B1-4BF1-81A1-1627E1D3DE31@zytor.com>
To: "Lai, Yi" <yi1.lai@intel.com>
X-Mailer: Apple Mail (2.3864.500.181)



> On Mar 30, 2026, at 11:03=E2=80=AFPM, Xin Li <xin@zytor.com> wrote:
>=20
>=20
>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>> regs->flags'. This check relies on the behavior of the SYSCALL
>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>>>>>=20
>>>>> However, on systems with FRED (Flexible Return and Event Delivery)
>>>>> enabled, instead of using registers, all state is saved onto the =
stack.
>>>>> Consequently, 'R11' retains its userspace value, causing the =
assertion
>>>>> to fail.
>>>>>=20
>>>>> Fix this by detecting if FRED is enabled and skipping the register
>>>>> assertion in that case. The detection is done by checking if the =
RPL
>>>>> bits of the GS selector are preserved after a hardware exception.
>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED =
(via
>>>>> ERETU) preserves them.
>>>>>=20
>>>>=20
>>>> I don't really like this.  I think we have two credible choices:
>>>>=20
>>>> 1. Define the Linux ABI to be that, on FRED systems, SYSCALL =
preserves
>>>> R11 and RCX on entry and exit.  And update the test to actually =
test
>>>> this.
>>>>=20
>>>> 2. Define the Linux ABI to be what it has been for quite a few =
years:
>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>>> preserves all registers.
>>>>=20
>>>> I'm in favor of #2.  People love making new programming languages =
and
>>>> runtimes and inline asm and, these days, vibe coded crap.  And it's
>>>> *easier* to emit a SYSCALL and forget to tell the compiler / code
>>>> generator that RCX and R11 are clobbered than it is to remember =
that
>>>> they're clobbered.  And it's easy to test on FRED (well, not =
really,
>>>> but it hopefully will be some day) and it's easy to publish one's
>>>> code, and then everyone is a bit screwed when the resulting program
>>>> crashes sometimes on non-FRED systems.  And it will be miserable to
>>>> debug.
>>>>=20
>>>> (It's *really* *really* easy to screw this up in a way that sort of
>>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>>> function calls, so one can get into a situation in which one's
>>>> generated code usually doesn't require that SYSCALL preserve one of
>>>> these registers until an inlining decision changes or some code =
gets
>>>> reordered, and then it will start failing.  And making the failure
>>>> depend on hardware details is just nasty.
>>>>=20
>>>> So I think we should add the ~2 lines of code to fix the SYSCALL =
entry
>>>> on FRED to match non-FRED.
>>>=20
>>> Yes; I'm afraid I have to concur. Preserving the clobber on entry =
for
>>> FRED systems is by far the safest choice.=20
>>>=20
>>> Aside from this selftest, fancy debuggers and anything that can =
transfer
>>> userspace state between machines might be 'surprised'.
>>=20
>> Thanks Andy and Peter.
>>=20
>> Indeed, making the selftest branch on FRED vs. non-FRED behavior
>> is not a good practice. The selftest should validate ABI consistency.
>>=20
>> I agree with Andy's option #2, so this should be fixed in the FRED
>> syscall entry implementation.
>>=20
>> Li Xin, does this direction look right to you? I can assit with
>> validation and keep the selftest aligned with the agreed ABI.
>>=20
>=20
> Yes, consistency should take precedence over hardware-specific =
variations.
>=20
> I would like to hear from Andrew Cooper and hpa before we do it.

Per Andy=E2=80=99s suggestion, the change would be:

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index 88c757ac8ccd..a19898747a2c 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_regs =
*regs)
 {
 	/* The compiler can fold these conditions into a single test */
 	if (likely(regs->fred_ss.vector =3D=3D FRED_SYSCALL && =
regs->fred_ss.l)) {
+		regs->cx =3D regs->ip;
+		regs->r11 =3D regs->flags;
+
 		regs->orig_ax =3D regs->ax;
 		regs->ax =3D -ENOSYS;
 		do_syscall_64(regs, regs->orig_ax);

It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's a =
problem here.






