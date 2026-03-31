Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B89378822;
	Tue, 31 Mar 2026 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937101; cv=none; b=tK1qWuA4Vw0VOmHTPnDDZSdtt1e3EREkPGRPIs572kQnwfEuS3Zx7U9stFwoydKhfACn96/1lC/huaVvZKPDt19kI1WV7fEda2oK8GyOPJr7XY68e7WfCJanSIGzJZynEp4hTwoX3yepQybrex4cxjjSXB5WzvDMkjB/CW64maQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937101; c=relaxed/simple;
	bh=yieOS0k2djfAv01aH9Q1i/xZ4IX0V976zgehEXcGCMU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fYPZOHHshKTG6+NAizVi9ZQqMSvRhKW9kWbcz2y+duJ30ABv69RI0ODoYgMTL7nlMK/IEb8Zf+w+OHwwJKoRMxQfmgd+AGhFHgxepIMePfwQBtoDbO/Y14KCgNeFK0Omfk5WFQ3MLBn0aXG5n7gKntpbIJBgR2lTpLRgCyLG3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=QbiOYo0j; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="QbiOYo0j"
Received: from smtpclient.apple (c-24-130-165-117.hsd1.ca.comcast.net [24.130.165.117])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62V63xq83475334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 30 Mar 2026 23:04:00 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62V63xq83475334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1774937041;
	bh=aBiYTGEqqS1+7td8ZOgGnRu3NJ59mkLEnx3ehgXg5pA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=QbiOYo0jIsgY9o+S9vvm1s3kIBz3C8DBNg42pQw9B8Lt+UPW8WpQwnOTj7XSc+6fk
	 8BHU2GKsZCPJ8rBLzSqxNNZkg/kFO5pRO/k6pBVbLXN5WfoJRX6GHu4dTnwi8AbUC6
	 r1HzNNpLSbZDnRAfpr/IJyoDdSRccnaaCJ6KXN07P1Oyfm5FIldijCnqzVTT44GVnp
	 QMdE0WLdYFWnHY29acj6qLkkrMhmd4auZVEXfdUW35W6cxjr1wEO8vn3mkQxK5hs4D
	 azLKt84D9oq+5sTkRhMpXchh1oiHqVugJ6EzkO0IxQ4eu9jKKKf9icppxAXgLEhlT0
	 JTbRZU+irqwlw==
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
From: Xin Li <xin@zytor.com>
In-Reply-To: <acsvrv0gCwTI9rWI@ly-workstation>
Date: Mon, 30 Mar 2026 23:03:49 -0700
Cc: Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <EFD7015E-E7B1-4BF1-81A1-1627E1D3DE31@zytor.com>
References: <20260326094423.711724-1-yi1.lai@intel.com>
 <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com>
 <20260327123315.GR2872@noisy.programming.kicks-ass.net>
 <acsvrv0gCwTI9rWI@ly-workstation>
To: "Lai, Yi" <yi1.lai@intel.com>
X-Mailer: Apple Mail (2.3864.500.181)


>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
>>>> regs->flags'. This check relies on the behavior of the SYSCALL
>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>>>> 
>>>> However, on systems with FRED (Flexible Return and Event Delivery)
>>>> enabled, instead of using registers, all state is saved onto the stack.
>>>> Consequently, 'R11' retains its userspace value, causing the assertion
>>>> to fail.
>>>> 
>>>> Fix this by detecting if FRED is enabled and skipping the register
>>>> assertion in that case. The detection is done by checking if the RPL
>>>> bits of the GS selector are preserved after a hardware exception.
>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (via
>>>> ERETU) preserves them.
>>>> 
>>> 
>>> I don't really like this.  I think we have two credible choices:
>>> 
>>> 1. Define the Linux ABI to be that, on FRED systems, SYSCALL preserves
>>> R11 and RCX on entry and exit.  And update the test to actually test
>>> this.
>>> 
>>> 2. Define the Linux ABI to be what it has been for quite a few years:
>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
>>> preserves all registers.
>>> 
>>> I'm in favor of #2.  People love making new programming languages and
>>> runtimes and inline asm and, these days, vibe coded crap.  And it's
>>> *easier* to emit a SYSCALL and forget to tell the compiler / code
>>> generator that RCX and R11 are clobbered than it is to remember that
>>> they're clobbered.  And it's easy to test on FRED (well, not really,
>>> but it hopefully will be some day) and it's easy to publish one's
>>> code, and then everyone is a bit screwed when the resulting program
>>> crashes sometimes on non-FRED systems.  And it will be miserable to
>>> debug.
>>> 
>>> (It's *really* *really* easy to screw this up in a way that sort of
>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>> function calls, so one can get into a situation in which one's
>>> generated code usually doesn't require that SYSCALL preserve one of
>>> these registers until an inlining decision changes or some code gets
>>> reordered, and then it will start failing.  And making the failure
>>> depend on hardware details is just nasty.
>>> 
>>> So I think we should add the ~2 lines of code to fix the SYSCALL entry
>>> on FRED to match non-FRED.
>> 
>> Yes; I'm afraid I have to concur. Preserving the clobber on entry for
>> FRED systems is by far the safest choice. 
>> 
>> Aside from this selftest, fancy debuggers and anything that can transfer
>> userspace state between machines might be 'surprised'.
> 
> Thanks Andy and Peter.
> 
> Indeed, making the selftest branch on FRED vs. non-FRED behavior
> is not a good practice. The selftest should validate ABI consistency.
> 
> I agree with Andy's option #2, so this should be fixed in the FRED
> syscall entry implementation.
> 
> Li Xin, does this direction look right to you? I can assit with
> validation and keep the selftest aligned with the agreed ABI.
> 

Yes, consistency should take precedence over hardware-specific variations.

I would like to hear from Andrew Cooper and hpa before we do it.
