Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01B3D4112;
	Mon,  6 Jul 2026 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368352; cv=none; b=J8zm19DIsa5if0v4R5iHDxiH95v4yryflzlqeKES7xjlH5eT1wp2uiKsiEMTMUYM/CCML6svnUTLeSMWFn+00FdssbHVgu6zamQfWLSS5ovHELXBOyOukDnIOBaX+wprF00ivuh2+PWDiV9sSPnf+1ptkJL7AN3rF6OEwhHZL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368352; c=relaxed/simple;
	bh=A790MAqss06qaRLCi7RF7m28mRL3gUQB4idIsBO0Tcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdfEGOUlbj9fFFSLmhK6a7JcDZDeaxuKDBaoc439T8v3ONWFZCQGUZJbZgDc6Wc4hOtehWYlz1GOZf2hTlQZoqJvxbcJmLsIULEnDAfT/H9LnUSo1jlzOZpsSeg0+ABdFDbCD8xRSwLCbGJQH79IKXM6wYY7U3L8oBszmyoJ+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrIsNPYd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrIsNPYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783368351; x=1814904351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A790MAqss06qaRLCi7RF7m28mRL3gUQB4idIsBO0Tcw=;
  b=JrIsNPYdPtPez7WwiVHzOyf6GZbPNnaHGGSmrBTIEjmXjU7J0AbO2GqG
   6wbin4UUT9a4FK3lry56UerSfrZF8wqKjKHfxeEE4yDiVYVsC/QTCqvx6
   +e5W4fda1eaukfOewJbQkenj0KLBHjgfJyE/E/UMyX9asMZTuJswcKpmW
   3UMj3NoI9qKyoq67HbIN5CFLOAVMG9p1+2Ckq7S07Uw4LHaOY1VcwPWID
   begqVgVH9BA4IK0BIuYH2PkYP5DeuU/nkAHccBdjsMsHCLVIn0rnU5bsF
   VBKJMq/0KwQiBRFj3e366X8POhncl34EgXjQ4rd+octfvlFsg452pnoR4
   Q==;
X-CSE-ConnectionGUID: KvUVG+bsRwan38YyTeQVIA==
X-CSE-MsgGUID: R43lL2TeSy+zFOFS8wvfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84102831"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="84102831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 13:05:51 -0700
X-CSE-ConnectionGUID: HiYqsg0SS4+Gr6wTTThf9w==
X-CSE-MsgGUID: Qk7AXdh8TZW5ZPY3/rwsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="258717342"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 13:05:45 -0700
Date: Mon, 6 Jul 2026 23:05:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
Message-ID: <akwKlx2uTtHXI7zT@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
 <akKT8q5TjkMkZkmB@ashevche-desk.local>
 <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 07:42:36AM -0400, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 17:49:06 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:

...

> >> +	static const struct software_node supp_swnode = {
> >> +		.name = "swnode-devlink-test-supplier"
> >
> > Keep trailing comma.
> >
> >> +	};
> >
> >> +
> >
> > Redundant blank line.
> >
> 
> I actually leave a blank line between static, const and regular local variable
> blocks for readability.

As far as I know this is against the style.

-- 
With Best Regards,
Andy Shevchenko


