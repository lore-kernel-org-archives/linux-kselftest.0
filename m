Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123607404E;
	Mon, 23 Mar 2026 06:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774245991; cv=none; b=gf28UhFmmPLOM/jmqpSurNL7ZjLDgZI84j7S+qtrneLakx3k3jU0Nndfg/8FBflis1inARNF63S9jxJdggxqh01gR6KHJ9FRQulkSoQEESBu6NJsHc9ZxgMHUNIoLHTHHTqAXF6y7guEtUoKB/0IafF+SLrOdQkZ+Nrstcr8EYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774245991; c=relaxed/simple;
	bh=WsI4x0Y20GhvMKic7OLLTWMLU1ouOLXmslfpWw/3Plc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTOBeiNMNECLtBEPoDexsRmUlFPdHwEAlMjt29sisNbEXCcyo61nkAyeZPjMheqo2NgjCTwjtwyiY0HFfyDsTy9MeIV8Rus4of+4A+4u7B+Nq+jjKPSI+vl4a/eZasp3utD7oK/nKzkLo+o87sFCWtUZizWsDNHg1hNJ/vw2gJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5UYtqBA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5UYtqBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774245990; x=1805781990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WsI4x0Y20GhvMKic7OLLTWMLU1ouOLXmslfpWw/3Plc=;
  b=n5UYtqBAmKyTY07wq76ljRjEPLJG8o1FleP0iM58vdAqn9/RYlJGsqKx
   1/ZIEe8he0PUjTovDoaayGwbQVIuBlfAWSRAl+dFaPCsnCP0CrAVe+aiR
   Va/Ix7mVfwsN9nN/r3aJMH/20XZZ9XwXgmQEZ1LZXdy4amI68dW6DUUgQ
   VhDJweblFF4R5g4gZvDD0SEhXp5k9sXoeVgNkQSHqWAbKlmPEC3v9yFLw
   4MvZQVg0TTkDqByZ25GnmGPlKazpGJ5VLDJrBA8k1/FboInouwm3t31fg
   PTKxgfrFU3kOyNHWA0zdga/XMp2zLq2YKPrEbM6rzRYwyICJZXjD+je5o
   w==;
X-CSE-ConnectionGUID: TXMhIlfARN29l32Op/MWiw==
X-CSE-MsgGUID: O1a2uEKoSc28raoT5uuySA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="78835151"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="78835151"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:06:30 -0700
X-CSE-ConnectionGUID: z4lEHY2+RH68qUuxX6vu+A==
X-CSE-MsgGUID: zeP5oF3tSc6OLIhH4OG+zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="223892179"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:06:26 -0700
Date: Mon, 23 Mar 2026 14:06:22 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Xin Li <xin@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	luto@kernel.org, mingo@redhat.com, shuah@kernel.org,
	tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
Message-ID: <acDYXtVgSKbbAuGs@ly-workstation>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>

On Sat, Mar 21, 2026 at 11:13:29PM -0700, Xin Li wrote:
> 
> 
> > On Mar 20, 2026, at 8:50 AM, Dave Hansen <dave.hansen@intel.com> wrote:
> > 
> > On 3/20/26 08:47, Andrew Cooper wrote:
> >>> First, CPUID doesn't tell you if FRED is in use. Is it even on by
> >>> default yet? There might not be a better way to do this than checking
> >>> CPUID, but checking CPUID is imprecise at best.
> >> A reliable way to distinguish IDT and FRED mode is to:
> >> 
> >> 1) Load $3 into %fs (x86_64) or %gs (i386) (i.e. whichever isn't thread
> >> local stoage)
> >> 2) execute a breakpoint, ignore the signal
> >> 3) Look to see whether %fs/%gs holds 3 or 0
> >> 
> >> IRET has a fun behaviour where it zeroes NULL selectors even if they had
> >> a non-zero RPL.
> >> 
> >> ERETU doesn't do this; Andy Luto and I asked for this minor information
> >> leak to be removed, and Intel agreed as it served no purpose anyone
> >> could identify.
> >> 
> >> As a consequence, you can use it to determine whether the kernel used
> >> IRET or ERET to return back to userspace.
> > 
> > I was thinking of just grepping /proc/cpuinfo for "fred", but that
> > sounds much more fun! :)
> 
> +1 :)
> 
> This serves as a key architectural differentiator between FRED and the legacy
> IDT framework.
> 
> For additional context, here is a fix to user segment selector values:
> https://lore.kernel.org/all/174069328263.10177.6796873487608898067.tip-bot2@tip-bot2/
> 
> It’s worth noting that there was an attempt to fix this bug roughly three years
> ago:
> https://lore.kernel.org/lkml/20230220030959.119222-1-ammarfaizi2@gnuweeb.org/
>

Thanks for the context and links, Xin.

My patch is a simple, focused fix to unblock current regression in
'sysret_rip'. The goal is just to ensure it doesn't falsely fail on FRED
systems by skipping the IDT assertion (R11==RFLAGS). 

Checking Ammar's patch series, it indeed looks like a more comprehensive
solution that not only handles the difference but also adds specific
test coverage for consistency. Is there a specific reason it didn't
land in the mainline kernel? If you think that is the preferred
direction, I would be happy to contribute to that effort
collaboratively.


> 
> 
> 
