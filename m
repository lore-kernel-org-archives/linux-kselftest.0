Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33558272E7C;
	Fri, 24 Apr 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021286; cv=none; b=A0n7uua4m66hEaRsTlqPfSYzcnwiwPnavYM7RG0nIXSqxrwpQBCVAPsEPldz3K1fhqvf9uflZuDwpJpL6e6L1fx+60CxiEzLchl1AlqLdtyr53Y+CfpkVZtlkgGslqmTWDvNZofWY+UM824QWR+NL4gJyXF1jv6slLBQUFP/qi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021286; c=relaxed/simple;
	bh=9/a1IAJ947LQK/am72b97UinP9nsU8o4JXZWdITsGuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz+IzrAcOBgqXn2SdYXw63WN4rsdMGb04Q7vPcE86o7QmlNwWWdMf1y5LjYb9Uo1XMZwlkjlj3YyrfARohOPMfYWwiZT+BpaTlhDL52Ua5nMqjLwDofwktxQbst6WH1cwphPNj6kBWdZYdROvP0aOiVv7Rikwxm3/KVaTw7iwDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXzN6g33; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXzN6g33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777021286; x=1808557286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/a1IAJ947LQK/am72b97UinP9nsU8o4JXZWdITsGuU=;
  b=lXzN6g33m5LNZFdRlE8pvsh/CSC7lWzTMO7lRW6gPC+3K7UiGfTlwt4A
   GJGB5gRGgdSLvOtSthrdNgJAxUG18uUc49Yr/8HoYZJEZLE4bfWtJYJ6/
   imZfT74b4VagGxoVXNROyMak0XVbMPA0eDs+U2W/Kz+FX97ApSiMTV3Xv
   C3/iVX7Lasjt2sapmjeNGxEoC3CAyFu0W8GtRzUkYiyfnBXQVfwd3RuFj
   AjTu0C1Hk89ihfBRw1k06+wga0pGpoXUGgMe2XVsKOWoJciNXkZ6a36a6
   BpJGiXzmHFi8xu4IVnYHo+QDV4Ibt1zS3cOa1Mj9ULYSHUQ/nyx743hYa
   w==;
X-CSE-ConnectionGUID: zUDg/cXzQI6068ZwdwdA0Q==
X-CSE-MsgGUID: G7qOkj2TTVKymiyzzyuACw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="100651908"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="100651908"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:01:25 -0700
X-CSE-ConnectionGUID: YPmnmYQiS0qoiZrb8bYV5A==
X-CSE-MsgGUID: +7rExIbOSO6DnhdA4lHSKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232044076"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:01:21 -0700
Date: Fri, 24 Apr 2026 12:01:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Message-ID: <aesxXvf4hpL66TLz@ashevche-desk.local>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 23, 2026 at 02:12:02PM +0200, Bartosz Golaszewski wrote:
> If we pass a software node to a newly created device using struct
> platform_device_info, it will not be removed when the device is
> released. This may happen when a module creating the device is removed
> or on failure in platform_device_add().
> 
> When we try to reuse that software node in a subsequent call to
> platform_device_register_full(), it will fails with -EBUSY. Add the
> missing call to device_remove_software_node() in release path.
> 
> Make sure that we still function correctly if a software node is used as
> the primary firmware node.

...

> +	device_remove_software_node(dev);

>  	of_node_put(pa->pdev.dev.of_node);

Can we rather replace of_* get/put with the fwnode_* get/put and make a
conditional here?

	if (is_software_node(...))
		device_remove...
	else
		fwnode_handle_put().

(or something like this)

And IIRC the above pattern has been already seen somewhere else. But I can't
point to it, just some weak memories of seeing that already.


-- 
With Best Regards,
Andy Shevchenko


