Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EF19D074;
	Tue, 31 Mar 2026 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774923702; cv=none; b=rXcVl7LDs/PMgWX4k+rCIjrhVIQ6HdigfoxletjWBB3HMI00gLdbJXyL8ejj5b/TSZ3ATMEcy3Vl5FbxO7/Ko/uyAvdL2CWX55X0vqzNDNSCDFUpJdW1Co7ktFmodw5q8EPvd3Z8+g4B42fB/EdAIgMoPBDYxnQTm5S15eT7Li4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774923702; c=relaxed/simple;
	bh=e1m6vWk1m2aKMZH0Le1k3ZuPwFUB7ZzhyRujP3MtaW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7JTb88Ennys23Hni+YAsapfLglQmAssddsspAtAsWciNCQGaU+4IpfrAvD7VCRkq+uIWT1DMtP92xV5cph5n+b8eU/vGuCm68jH3TyNBTG9WxQGzizsWjRdstmWAGa8oWuXTgASBv1Z2rADrmxoeQxS31/+pbPQm2cj2N0P3Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUlKRmjv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUlKRmjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774923702; x=1806459702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1m6vWk1m2aKMZH0Le1k3ZuPwFUB7ZzhyRujP3MtaW4=;
  b=CUlKRmjv5thMvZARGSc3kuxuGWodMZh9AgNIFCC2WwHKSSV4rsznf1Fy
   qbU0bYkaQh5cKfUEeKM+Se62nGv1Lkop85AqYVpFnJfIMscB49QGM912Z
   CApjyUoURHywFKURxn7N66WCCmTSh0xiD6B9uoBk2zThXovJh5UA+OFfp
   nmRBJN5NbQ+xzexdkWX5yjpcknUpZQTSb/NxTl/v+KU0/2L2cr6/1hxY2
   AtZ/HMwmb7pOy+/q+l8Nf4uNvJS92Zi0iIftcedT+vSnxjoWUDvYeJD3d
   P9E5kW8aDJEZy+Ea9P7Cq0KFIC5YaseAQwiITjiF6F2ICH72iilHoXKfW
   g==;
X-CSE-ConnectionGUID: eYHqamZjSnu1ciNHwrqiVw==
X-CSE-MsgGUID: A2pOd3fPRb2k8Fifhml43A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86544504"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86544504"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:21:41 -0700
X-CSE-ConnectionGUID: ga2Zp/juS7eB8hcL4eSymw==
X-CSE-MsgGUID: +ZuDTakHQyqZr0ZN+76mHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226481039"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:21:37 -0700
Date: Tue, 31 Mar 2026 10:21:34 +0800
From: "Lai, Yi" <yi1.lai@intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Xin Li <xin@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xin Li <xin@zytor.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
Message-ID: <acsvrv0gCwTI9rWI@ly-workstation>
References: <20260326094423.711724-1-yi1.lai@intel.com>
 <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com>
 <20260327123315.GR2872@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327123315.GR2872@noisy.programming.kicks-ass.net>

On Fri, Mar 27, 2026 at 01:33:15PM +0100, Peter Zijlstra wrote:
> On Thu, Mar 26, 2026 at 03:06:05PM -0700, Andy Lutomirski wrote:
> > 
> > 
> > On Thu, Mar 26, 2026, at 2:44 AM, Yi Lai wrote:
> > > The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
> > > regs->flags'. This check relies on the behavior of the SYSCALL
> > > instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
> > >
> > > However, on systems with FRED (Flexible Return and Event Delivery)
> > > enabled, instead of using registers, all state is saved onto the stack.
> > > Consequently, 'R11' retains its userspace value, causing the assertion
> > > to fail.
> > >
> > > Fix this by detecting if FRED is enabled and skipping the register
> > > assertion in that case. The detection is done by checking if the RPL
> > > bits of the GS selector are preserved after a hardware exception.
> > > IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (via
> > > ERETU) preserves them.
> > >
> > 
> > I don't really like this.  I think we have two credible choices:
> > 
> > 1. Define the Linux ABI to be that, on FRED systems, SYSCALL preserves
> > R11 and RCX on entry and exit.  And update the test to actually test
> > this.
> > 
> > 2. Define the Linux ABI to be what it has been for quite a few years:
> > SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
> > preserves all registers.
> > 
> > I'm in favor of #2.  People love making new programming languages and
> > runtimes and inline asm and, these days, vibe coded crap.  And it's
> > *easier* to emit a SYSCALL and forget to tell the compiler / code
> > generator that RCX and R11 are clobbered than it is to remember that
> > they're clobbered.  And it's easy to test on FRED (well, not really,
> > but it hopefully will be some day) and it's easy to publish one's
> > code, and then everyone is a bit screwed when the resulting program
> > crashes sometimes on non-FRED systems.  And it will be miserable to
> > debug.
> > 
> > (It's *really* *really* easy to screw this up in a way that sort of
> > works even on non-FRED: RCX and R11 are usually clobbered across
> > function calls, so one can get into a situation in which one's
> > generated code usually doesn't require that SYSCALL preserve one of
> > these registers until an inlining decision changes or some code gets
> > reordered, and then it will start failing.  And making the failure
> > depend on hardware details is just nasty.
> > 
> > So I think we should add the ~2 lines of code to fix the SYSCALL entry
> > on FRED to match non-FRED.
> 
> Yes; I'm afraid I have to concur. Preserving the clobber on entry for
> FRED systems is by far the safest choice. 
> 
> Aside from this selftest, fancy debuggers and anything that can transfer
> userspace state between machines might be 'surprised'.

Thanks Andy and Peter.

Indeed, making the selftest branch on FRED vs. non-FRED behavior
is not a good practice. The selftest should validate ABI consistency.

I agree with Andy's option #2, so this should be fixed in the FRED
syscall entry implementation.

Li Xin, does this direction look right to you? I can assit with
validation and keep the selftest aligned with the agreed ABI.

Regards,
Yi Lai

