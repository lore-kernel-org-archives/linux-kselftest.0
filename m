Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A3423A71;
	Sat, 28 Feb 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275455; cv=none; b=rF7wrDnnGcsagju5vnLDI0k2yY5nMs1dO5pQ1XV8Uq3PZ8KQ4R9byeDIv4j0RSQsshCCz6WeU1ZGmoz+FelGSvN+g9sug5GnoclaLhWFWGjHf2Z5ZM0JisWVsOUQOHy7u/YVA8uj36qIuW8d2jHsR8pMeyTfA0Cm51OeZUKSVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275455; c=relaxed/simple;
	bh=ikytCIWUmhX3m6xcF5YWoGBuLdnUUDVfexdZDqFbpe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWzfVUebOVoGc/4b8fYliIVTpTWllDy3XyRpRzmaqiE+VyR0K8woTmQVFMUKrDkHBcSc99IPD0BPOZZNYwA6CVU34IjsL9Ligw4Ah9jPRuGLrEyyQ8i5jMnt+pAdkL1gFwv32SSfCYqX0HQOhvMHpnK+yqlaKRhLHNIuhhx++A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnyrAFLc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnyrAFLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772275453; x=1803811453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ikytCIWUmhX3m6xcF5YWoGBuLdnUUDVfexdZDqFbpe4=;
  b=GnyrAFLcfHgVMFniWqjb0YrpJPv5geShT4x0NBqOpN6tYO6/n6Qf72ki
   W9f3DHoviQQou7J3MAETforzoJjW3wsMGn5gxxNuuDBXohYCE2D45i02Z
   UX12vqizBZeVb1OdREJ/WtlV9qV8Q0RiBzE4PMeGLGEJJgttV1E8TgNaI
   SyuwRC4OFJtYkGaiH+eqYRQ9oorWBbcEbmOWZMvnn1F4sdkZ7xKEkdjaW
   M9hUvkM4/bAtVr1YFtCxXo40lzyGhhB0kHHP9cPFih3n2vNIkWqH0TdeF
   kNsYJAcdVj9ZwIsucY68sMWUnd2WZQu5l6f0jxFE6CSW80LRPRzKmm9Pk
   A==;
X-CSE-ConnectionGUID: 951KxgtNTqmA6MXTdIw80Q==
X-CSE-MsgGUID: gZG4T0PAQLOF/F3xTm3CGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84700438"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84700438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:44:13 -0800
X-CSE-ConnectionGUID: I1VF2WH+QAuvdQMKgwseww==
X-CSE-MsgGUID: LiIZEzI6RsOMerkb+uOxMw==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:44:11 -0800
Date: Sat, 28 Feb 2026 12:44:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: tool: Recommend --raw_output=all if no KTAP found
Message-ID: <aaLG-Rb63k2Tiyd_@ashevche-desk.local>
References: <20260227105650.307845-1-david@davidgow.net>
 <aaGuVA4q5BXSxBWX@ashevche-desk.local>
 <49a87105-4503-4cf9-a967-e64ffe7fbad4@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49a87105-4503-4cf9-a967-e64ffe7fbad4@davidgow.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Feb 28, 2026 at 06:11:04PM +0800, David Gow wrote:
> Le 27/02/2026 à 10:46 PM, Andy Shevchenko a écrit :
> > On Fri, Feb 27, 2026 at 06:56:49PM +0800, David Gow wrote:
> > > If no KTAP header is found in the kernel output (e.g., because the kernel
> > > crashed before the KUnit executor was run), it's very useful to re-run the
> > > test with --raw_output=all, as that will show any error output (such as a
> > > stacktrace, log message, BUG, etc). This is not particularly intuitive,
> > > however, as --raw_output=all is not well known.
> > > 
> > > Add an extra log line to advertise --raw_output=all in this case, as it's
> > > a terrible user experience to just get "Did any KUnit tests run?"
> > 
> > What's the difference to "full"?
> > 
> > Thanks for adding this, btw!
> 
> Normally, the --raw_output option will just pass through the actual test
> results (or, rather, any kernel output from when the tests are running), by
> skipping everything prior to the "KTAP version 1" line.
> 
> --raw_output=full is a synonym for --raw_output=all, which just passes
> through all of the kernel output, so is useful if we never get as far as
> printing that KTAP version line.
> 
> (I kept forgetting whether it was "full" or "all", which is why both are
> supported.)

Okay, thanks for elaboration:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


