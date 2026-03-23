Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63DAD4B;
	Mon, 23 Mar 2026 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774245359; cv=none; b=ChAHCvwQRHzim/1P7XZAwQrtMe1hC3vwm5msHvPHU73CGgSzo2Rp4VpdtFZ/fHKaL+/v3cM3cHqy65lGfXCAut4UQ+BywzswJtQPjW5Gz/+pwBIfs/37mzW7dBq5e0mdlUrzKPmBKvWjvSmtpuNL+AflYYSuJNbXW45gHtIzLsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774245359; c=relaxed/simple;
	bh=Xq4iQpKzvyNRXUxsn+p8OmpmDL1s5gVoaPomQGBHHCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJZjsuI9vXljM7hwym2te2bs9Aygfo1ARGxHlcEywDWjfqbvxnSvkz/2YwVQXuvZw0yWXwPaG7NvD4dxZ3KkV/by72SwndaGNwY9EU30hxUGlDUQRXK0AamBT1jswb61CAUhmPajlyRz1/zgwz6Ubmb1hK+hj1KcKgeplVNJToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ze8Pc0WZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze8Pc0WZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774245359; x=1805781359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xq4iQpKzvyNRXUxsn+p8OmpmDL1s5gVoaPomQGBHHCI=;
  b=Ze8Pc0WZVry+dgFpyyZ8dHrOHp8GPbYDD7o/p45t6m7UzT3URSqtchfe
   rRhtbOsw4AFqdnGRMSvjMS4u4M44ewM7TddjqTFYWD9nsyuK15S3c4des
   fTCoEGTLinwALvKRMeOi7hJoWBLq1aQT2YobEwBeNlNfnLNhVUpDA2wRv
   EonrS8/OV2e6Gap7q2p6wiZ37S1C6ocE0xMb3D9+344avoGRuTrCGEwTE
   kQEJ9B8CWZYa8EMOySA2dsschDlqJD+8ZwqFiFT2y9ZY8dNG2J5vunAXN
   9Oqk6xEtJpGkqYtsOeIanrjuds7m1kQDyFyf2PrOCavuNThJVtSfopf1q
   Q==;
X-CSE-ConnectionGUID: nxIV1CqxQ/SeOW49vr8aKQ==
X-CSE-MsgGUID: 2ZIg1693QK2nzZk1sixLVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86310127"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="86310127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 22:55:58 -0700
X-CSE-ConnectionGUID: yu5mH7aZQniS4yLYkou0vg==
X-CSE-MsgGUID: Xh79tIx5TRODFkP3bVPkxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="228847500"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 22:55:55 -0700
Date: Mon, 23 Mar 2026 13:55:51 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	luto@kernel.org, mingo@redhat.com, shuah@kernel.org,
	tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
Message-ID: <acDV51/6Nml3dzOk@ly-workstation>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>

On Fri, Mar 20, 2026 at 08:50:54AM -0700, Dave Hansen wrote:
> On 3/20/26 08:47, Andrew Cooper wrote:
> >> First, CPUID doesn't tell you if FRED is in use. Is it even on by
> >> default yet? There might not be a better way to do this than checking
> >> CPUID, but checking CPUID is imprecise at best.
> > A reliable way to distinguish IDT and FRED mode is to:
> > 
> > 1) Load $3 into %fs (x86_64) or %gs (i386) (i.e. whichever isn't thread
> > local stoage)
> > 2) execute a breakpoint, ignore the signal
> > 3) Look to see whether %fs/%gs holds 3 or 0
> > 
> > IRET has a fun behaviour where it zeroes NULL selectors even if they had
> > a non-zero RPL.
> > 
> > ERETU doesn't do this; Andy Luto and I asked for this minor information
> > leak to be removed, and Intel agreed as it served no purpose anyone
> > could identify.
> > 
> > As a consequence, you can use it to determine whether the kernel used
> > IRET or ERET to return back to userspace.
> 
> I was thinking of just grepping /proc/cpuinfo for "fred", but that
> sounds much more fun! :)

Thank you both for the review and suggestions. The behavioral difference
between IRET and ERETU is a more robust way to detect FRED activation
than checking CPUID.

How about the following implementation to add a helper function to
determine if FRED is enabled at runtime:

static void empty_handler(int sig, siginfo_t *info, void *ctx_void)
{
}

static bool is_fred_enabled(void)
{
	unsigned short gs_val;

	sethandler(SIGTRAP, empty_handler, 0);

	/*
	 * Distinguish IDT and FRED mode by loading GS with a non-zero RPL and
	 * triggering an exception:
	 * IDT (IRET) clears RPL bits of NULL selectors.
	 * FRED (ERETU) preserves them.
	 *
	 * If GS is loaded with 3 (Index=0, RPL=3), and we trigger an exception:
	 * Legacy should restore GS as 0.
	 * FRED should preserve GS as 3.
	 */
	asm volatile(
		"mov $3, %%ax\n\t"
		"mov %%ax, %%gs\n\t"
		"int3\n\t"
		"mov %%gs, %%ax\n\t"
		"mov %%ax, %0\n\t"
		: "=r" (gs_val)
		:
		: "ax", "memory"
	);

	clearhandler(SIGTRAP);

	return gs_val == 3;
}

