Received: from mail-108-mta47.mxroute.com (mail-108-mta47.mxroute.com [136.175.108.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639B2ED846
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200613; cv=none; b=pfWmjFxmMB1Fw7BQcreY0A3IxEhKgtANrV2hMBL8PStbPz3XoTY4K0Mp6N8ze9YqlKMbw2/d7KwLVUKUcJ5M8a+8QJIZaHiwA05Fk5xbHrVwyD531kfiP9yiHH5uuaoMrqa204c4eMOhseQOqXG3osy5wSm8f2yLecKVVXkXg0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200613; c=relaxed/simple;
	bh=ZVYr+L8paqs9c953GL6EJNwjQkpDO6sihFb1UwgsY4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9wYyRpQLMtr4YLvh8er9LIFdJKe7TXM9W3jUdio09ogu798eNqCXQ2+0MJkZxkllB/n6kdTK3GzP6mcWjjoCkD+68n/uQKJyFa0fqwe9IbusQO8/YXhZydipDV/3HRgeOMpZ/90UpSKZTQgU+oXc6h5IQpvHA+QF/XITlpRFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=wVPqjYDG; arc=none smtp.client-ip=136.175.108.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="wVPqjYDG"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta47.mxroute.com (ZoneMTA) with ESMTPSA id 19e409a0dd100067f7.00e
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 May 2026 14:18:18 +0000
X-Zone-Loop: a8e5328ac99530bf4a3f22d953540e2507c0fd76af81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AXRW8uiwwRtEJhbIMVCv/AlLddaze23R80p31AXeYVU=; b=wVPqjYDGs/pu3Jj05eHfDyz9eB
	2Jyu9XTUBW2KhlRsOg3Cq/K9SzRTgd5GukLwYPq7t79dU2rAg1ldmDGP79onY1VCQGmULzPjv4M7P
	I2uRODkCeR6I/IrAXQUkOWHskJKxpkaawtjd8niXw8RC//w7h4nOrlfcULS+TMBVzYDkFCJTHqEPa
	VX0mlKWjp9Wf5Ols+Sr9FLwMP8tPdi/gU+QeMPhof1l55ukh5kn5p9iK88yLkJRBls+EQH3NZ8ha8
	DBp+Xfk04DYLnle6DKldyN0CWEuTGvlD/82ukUh45+M9FqrB1fCkQYvE/z6Veu71iMNJn3JYfDCmQ
	f6IfMDEA==;
Date: Tue, 19 May 2026 14:18:04 +0000
From: Richard Patel <ripatel@wii.dev>
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <agxxHHKCOh3TpWHv@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260519103345.49e52ceb@pumpkin>
 <agxiORpLBErOxLin@wii.dev>
 <20260519142808.0d3605ab@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519142808.0d3605ab@pumpkin>
X-Authenticated-Id: ripatel@wii.dev

On Tue, May 19, 2026 at 02:28:08PM +0100, David Laight wrote:
> On Tue, 19 May 2026 13:14:33 +0000
> Richard Patel <ripatel@wii.dev> wrote:
> 
> > On Tue, May 19, 2026 at 10:33:45AM +0100, David Laight wrote:
> > > Isn't using 'notrack jmp *reg' for jump tables actually more secure?
> > > If an attacker can write code it doesn't matter.
> > > The jump table in is RO memory so can't be written.
> > > But if there are ENDBR on all the jump table targets they become
> > > possibly useful code addresses to arrange to write into some RW
> > > function pointer table - which might be useful.  
> > 
> > You're right. I was worried about an invalid jump table index at first.
> > Clang 22 happily optimizes away jump table index bounds checks. GCC 16
> > seems to be more careful. We should probably patch LLVM to never
> > optimize it away, e.g.:
> > 
> > 	// funny.c
> > 	// clang -c -fcf-protection=branch -O2 -o funny.o funny.c
> > 	// objdump -d funny.o -M intel
> > 	int t0(void), t1(void), t2(void), t3(void);
> > 	int funny(unsigned long target) {
> > 		__builtin_assume(target < 4);
> 
> If you use __builtin_assume() you get to clear up the mess.

I'm pretty sure you'd get the same result with cross-function
optimization across a bunch of static functions or LTO. Compiler goes
"oh, this internal function is only reachable from these 3 callers in
the same unit, which all already bound their input params. Guess I will
skip the bounds check".

It is a compiler bug that Clang is at all able to generate unbounded
'notrack jmp' with -fcf-protection=branch, it blows a gap in IBT.

Anyways, I don't think we need kernel support for banning notrack in
userland? There is no ABI (GNU note) standard for 'notrack-free'
binaries AFAIK, and as you point out notrack is a secure way to do
jump tables (if done properly).

> I don't know if userspace ever cares about speculative array access.
> If it does you need one of the mitigration - eg using cmp+cmov
> to generate a jump table index that references the 'default'.

Intel docs say that "CET-IBT limits speculative execution at indirect
branch targets that do not start with ENDBRANCH", with heavy emphasis
on "limits" not "prevents" ... Is it too unreliable in practice?

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/branch-history-injection.html#inpage-nav-4-3

-- Richard
