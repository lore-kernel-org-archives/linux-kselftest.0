Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6B149C6F;
	Fri, 27 Mar 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614809; cv=none; b=W6yHq5/+zwvv+YKrI1Fls4mC362QCu395gLGhFGsLP6DJHkwpw8uoBOZfiaTyebSpHpBDC4froQ0Gnj3N0gJ/+UyY2XKi+3ZosrUfLIHDjErPflTdcHpGglUX43zPUvzpAkWfp3X6Gmko/zc9ZKwWv+Zz3Yxp0CKYm/GcOEaJA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614809; c=relaxed/simple;
	bh=zVAWEf1q0kNfySkAd4T6KEvj6le/m9bra15uDqXRN0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxkFcYKDjqnbGKnrkhZ7XonIbBXQrLlS7iN1QeUjPc86IbVqC/eKQ5H97tJ5xb0oUObSiFmM/9mYmxdEbgp8HvoYZF+gENuIEqBu7SLeC6trNLcE5h6h2TdLloG4QSaroShppC4c5gZrXEahL6CpNfhCPE8VY1EELzKEM7GLZes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SgwDnzTM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SgwDnzTM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YAHPVEPbmlEIarCvP6qJW0cC8zI4eN2TJrJuzgVSpNo=; b=SgwDnzTMSnpw6oZ9bW1DadE3A0
	gtrVUwx2F0FyTXkP/9NISHKEdcr/9mexd9taM+g3di5UdSwC5/drstCss2JSM9SjLQcz7810gLi9+
	I3DKLGOxeblfw3oyK30/RuMVRRasG7s3NCKYRa1NLFMv6VuooCVQTsUy7+TQB0IUdOXSHIlD20qJ3
	tlKFOoxYpl28Wubxf1mXCWkWZObvS8BIVwaHwcgQO4NIpxXpC1FQ8wIjE9BQCS0CECkJadY1OGkVs
	ELOppdboD3cSc6Ln94M0KxE9pyrMHzlMbC6l0zqE4uLTJ7/R5OTLtcCuxMWoGq+iyNPYOM4LXylcH
	TlP/SqrQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66NJ-0000000AOly-0Tf8;
	Fri, 27 Mar 2026 12:33:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77875301185; Fri, 27 Mar 2026 13:33:15 +0100 (CET)
Date: Fri, 27 Mar 2026 13:33:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Yi Lai <yi1.lai@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xin Li <xin@zytor.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
Message-ID: <20260327123315.GR2872@noisy.programming.kicks-ass.net>
References: <20260326094423.711724-1-yi1.lai@intel.com>
 <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com>

On Thu, Mar 26, 2026 at 03:06:05PM -0700, Andy Lutomirski wrote:
> 
> 
> On Thu, Mar 26, 2026, at 2:44 AM, Yi Lai wrote:
> > The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
> > regs->flags'. This check relies on the behavior of the SYSCALL
> > instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
> >
> > However, on systems with FRED (Flexible Return and Event Delivery)
> > enabled, instead of using registers, all state is saved onto the stack.
> > Consequently, 'R11' retains its userspace value, causing the assertion
> > to fail.
> >
> > Fix this by detecting if FRED is enabled and skipping the register
> > assertion in that case. The detection is done by checking if the RPL
> > bits of the GS selector are preserved after a hardware exception.
> > IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (via
> > ERETU) preserves them.
> >
> 
> I don't really like this.  I think we have two credible choices:
> 
> 1. Define the Linux ABI to be that, on FRED systems, SYSCALL preserves
> R11 and RCX on entry and exit.  And update the test to actually test
> this.
> 
> 2. Define the Linux ABI to be what it has been for quite a few years:
> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit
> preserves all registers.
> 
> I'm in favor of #2.  People love making new programming languages and
> runtimes and inline asm and, these days, vibe coded crap.  And it's
> *easier* to emit a SYSCALL and forget to tell the compiler / code
> generator that RCX and R11 are clobbered than it is to remember that
> they're clobbered.  And it's easy to test on FRED (well, not really,
> but it hopefully will be some day) and it's easy to publish one's
> code, and then everyone is a bit screwed when the resulting program
> crashes sometimes on non-FRED systems.  And it will be miserable to
> debug.
> 
> (It's *really* *really* easy to screw this up in a way that sort of
> works even on non-FRED: RCX and R11 are usually clobbered across
> function calls, so one can get into a situation in which one's
> generated code usually doesn't require that SYSCALL preserve one of
> these registers until an inlining decision changes or some code gets
> reordered, and then it will start failing.  And making the failure
> depend on hardware details is just nasty.
> 
> So I think we should add the ~2 lines of code to fix the SYSCALL entry
> on FRED to match non-FRED.

Yes; I'm afraid I have to concur. Preserving the clobber on entry for
FRED systems is by far the safest choice. 

Aside from this selftest, fancy debuggers and anything that can transfer
userspace state between machines might be 'surprised'.
