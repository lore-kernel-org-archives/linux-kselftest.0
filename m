Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF6370D5F;
	Tue, 24 Mar 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315690; cv=none; b=dwogkO0s1Uf1AlaE0U1fOyqsCaU1j07ZEWeqrJlU8S3sysmys0rxL3QCjLQA1+Wg8i8W8FDOSHVr21AojyrWlf2jRsw82LK8ckyEVRkNaHjBQCRX9QiLB75lkqqH/iNFH7Xzi7sk4bbyd+b52/QtfmuVwfxfVpzk+SrMcXoOy3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315690; c=relaxed/simple;
	bh=X0U3m8zJfrCsSyo9H/IiD8HfW0PqiSCKTPSO+WABRjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IC5fH9OhJVjqvpaf64C94WVbYLvU1Tw/q/+jyuo6IMHnnJRE/zuYQ3Lp2I/OGdTLJgjno8PLOBX/hABk7TLRpcmvuYiFf7H3Gi3sR22tR4OHqrPblj6fU5Tt6n1d8peRsYj2bgbee+xyllu6TExfi3iI98C5jK7Jupb0S5X0okg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TM9zuW7c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TM9zuW7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774315690; x=1805851690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X0U3m8zJfrCsSyo9H/IiD8HfW0PqiSCKTPSO+WABRjA=;
  b=TM9zuW7czl+hSre2tEDuRgNhID+0ZbgEfOp5jyxxF9j1q2wQsi7HUnBJ
   fFVI6Uh4aHqZVrg4vk87DMjeAtqbyK8jH+2jzQKp88UhOUK6fKDNcNBCr
   XJztHMf9ywc6lDf8Iuxrm+Sb0E8cs/V79wkqAPwSdOTkB3CAhjJcP/1kX
   onkjAH4h8xaoK+MEU08TyhHJysqvXZVWdW44lrxFltnHbToFJv7ulpisp
   /lS9uB+qQ07sVg4CptIdReDYvoRxbIjWbzmQ2HoNKS+52U371EjB3l8wJ
   /zL/rFMq1KF0b7FxirXB7DnDUP3PF+bbvhDIZhAhelz99EiaaaO3DSR2p
   w==;
X-CSE-ConnectionGUID: vbm92AUhSrO8Y/YskbPCbw==
X-CSE-MsgGUID: sHAxVwDrShCng6mhCG2fPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86694747"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86694747"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:28:09 -0700
X-CSE-ConnectionGUID: mxo7rW50QhWJlu4RKIZWuA==
X-CSE-MsgGUID: d8KSeBqSTRWlW0c9kX7RoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228944669"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:28:06 -0700
Date: Tue, 24 Mar 2026 09:28:02 +0800
From: "Lai, Yi" <yi1.lai@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Lai, Yi" <yi1.lai@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	luto@kernel.org, mingo@redhat.com, shuah@kernel.org,
	tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
Message-ID: <acHoop4NN9KBSyyK@ly-workstation>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <acDV51/6Nml3dzOk@ly-workstation>
 <1ede823e-080e-4283-a018-efd62e0c1579@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ede823e-080e-4283-a018-efd62e0c1579@citrix.com>

On Mon, Mar 23, 2026 at 04:39:58PM +0000, Andrew Cooper wrote:
> On 23/03/2026 5:55 am, Lai, Yi wrote:
> > On Fri, Mar 20, 2026 at 08:50:54AM -0700, Dave Hansen wrote:
> >> On 3/20/26 08:47, Andrew Cooper wrote:
> >>>> First, CPUID doesn't tell you if FRED is in use. Is it even on by
> >>>> default yet? There might not be a better way to do this than checking
> >>>> CPUID, but checking CPUID is imprecise at best.
> >>> A reliable way to distinguish IDT and FRED mode is to:
> >>>
> >>> 1) Load $3 into %fs (x86_64) or %gs (i386) (i.e. whichever isn't thread
> >>> local stoage)
> >>> 2) execute a breakpoint, ignore the signal
> >>> 3) Look to see whether %fs/%gs holds 3 or 0
> >>>
> >>> IRET has a fun behaviour where it zeroes NULL selectors even if they had
> >>> a non-zero RPL.
> >>>
> >>> ERETU doesn't do this; Andy Luto and I asked for this minor information
> >>> leak to be removed, and Intel agreed as it served no purpose anyone
> >>> could identify.
> >>>
> >>> As a consequence, you can use it to determine whether the kernel used
> >>> IRET or ERET to return back to userspace.
> >> I was thinking of just grepping /proc/cpuinfo for "fred", but that
> >> sounds much more fun! :)
> > Thank you both for the review and suggestions. The behavioral difference
> > between IRET and ERETU is a more robust way to detect FRED activation
> > than checking CPUID.
> >
> > How about the following implementation to add a helper function to
> > determine if FRED is enabled at runtime:
> >
> > static void empty_handler(int sig, siginfo_t *info, void *ctx_void)
> > {
> > }
> >
> > static bool is_fred_enabled(void)
> > {
> > 	unsigned short gs_val;
> >
> > 	sethandler(SIGTRAP, empty_handler, 0);
> 
> What about setting SIG_IGN instead?
> 

I tested setting signal(SIGTRAP, SIG_IGN), but it causes the test to
terminate with a trace/breakpoint trap (core dump) when the 'int3'
instruction initiates the hardware exception. Therefore, I will keep the
empty_handler() implementation to ensure it can safely resume execution.

> >
> > 	/*
> > 	 * Distinguish IDT and FRED mode by loading GS with a non-zero RPL and
> > 	 * triggering an exception:
> > 	 * IDT (IRET) clears RPL bits of NULL selectors.
> > 	 * FRED (ERETU) preserves them.
> > 	 *
> > 	 * If GS is loaded with 3 (Index=0, RPL=3), and we trigger an exception:
> > 	 * Legacy should restore GS as 0.
> > 	 * FRED should preserve GS as 3.
> > 	 */
> > 	asm volatile(
> > 		"mov $3, %%ax\n\t"
> > 		"mov %%ax, %%gs\n\t"
> > 		"int3\n\t"
> > 		"mov %%gs, %%ax\n\t"
> > 		"mov %%ax, %0\n\t"
> > 		: "=r" (gs_val)
> > 		:
> > 		: "ax", "memory"
> > 	);
> 
> asm volatile (
>     "mov %[rpl3], %%gs\n\t"
>     "int3\n\t"
>     "mov %%gs, %[res]"
>     : [res] "=r" (gs_val)
>     : [rpl3] "r" (3));
> 
> No need for any clobbers.  Let the compiler do the hard work for you.
>

Thank you for the improved assembly block and it's indeed cleaner. I
will adopt your suggestion and send out v2.

Regards,
Yi Lai

> ~Andrew
