Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8E428826;
	Fri, 27 Feb 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203611; cv=none; b=PSooYXaibJXL/H1m9SGa/YIeMXcVZupf5eilafY9e2cP8ZZYjfqtqAkpV9IyZ9fCPKh0prz3gIwUOtPSB9ii3IDcvpm/plpFDn6FCdhLJG8WM4LtyBqlGrLw6BxT+64uB1eJQ2dxD5il2eqY687mP8+jGy0uTj009YjVAPK6W2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203611; c=relaxed/simple;
	bh=6pEUmtVFpu5tZKJ8gdYNCh2KJ+Tc/1COVI9ineS7VfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2PrKbZ1QM7X+WEP2/Jr1Pnur30fxRVvdPuJI/7E9MDj/RaKiMeq54MwdA2PKDdFF6dIDxL4TsQyofw7h+7vsInKxkra7unmzCkA6gzl4XvwdEgTYnglMyXGwlj9PmSJNPXEBRdhzEIn5/Yp/hEZvMxdErhzaeKpgynt7FQN4MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9yDtIRs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9yDtIRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772203610; x=1803739610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6pEUmtVFpu5tZKJ8gdYNCh2KJ+Tc/1COVI9ineS7VfE=;
  b=B9yDtIRsAJJIavJb6WBuB7FN0yyinfVMJ8imD7jQxLZSwvsPi6Ef/6+c
   kfdEMJ5nuPpVDFHZcFUCCG3HUYOIK7mJzwtmyRdfXoiKkE4CeedyKKvaL
   v3OzUCtsWfZX80tHCRYmkQXb9vBXRG8yIx1vFNXD6dXAlu+f0896CJ+vk
   4PXeVcYW+SFA6bNxvME4WPc+SAZ0NDZ5PQatWYG5YM8i5lZRHJuxhCtMn
   ZES5jel9SX49216VBBU5b+fJrQ5KTXWjPKfBX3228fd16K8FTjawen6eO
   lzSCsQK33mGLV+qG1Gs69+o9X2xbD4JP1vZGnrFk2DuXqKCnf64ZfxKLa
   g==;
X-CSE-ConnectionGUID: fSnAUNVfQcmFIXmEaifrXQ==
X-CSE-MsgGUID: YCp/wObiRRmevOKGzB3qsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73192233"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73192233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:46:49 -0800
X-CSE-ConnectionGUID: gJY+R9HKS9WYuhoUjMQ/Vg==
X-CSE-MsgGUID: h4Ur7dQBQTawD4NiNT/crg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="247428659"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:46:47 -0800
Date: Fri, 27 Feb 2026 16:46:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: tool: Recommend --raw_output=all if no KTAP found
Message-ID: <aaGuVA4q5BXSxBWX@ashevche-desk.local>
References: <20260227105650.307845-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227105650.307845-1-david@davidgow.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 27, 2026 at 06:56:49PM +0800, David Gow wrote:
> If no KTAP header is found in the kernel output (e.g., because the kernel
> crashed before the KUnit executor was run), it's very useful to re-run the
> test with --raw_output=all, as that will show any error output (such as a
> stacktrace, log message, BUG, etc). This is not particularly intuitive,
> however, as --raw_output=all is not well known.
> 
> Add an extra log line to advertise --raw_output=all in this case, as it's
> a terrible user experience to just get "Did any KUnit tests run?"

What's the difference to "full"?

Thanks for adding this, btw!

-- 
With Best Regards,
Andy Shevchenko


