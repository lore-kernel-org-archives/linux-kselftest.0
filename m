Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D48342CB4;
	Thu, 30 Apr 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550537; cv=none; b=e4abriWBnV7LpNOUuSTzn5ErRO5qTbhSCMI+RYy4iZuMzYkKZFpGlsknFvAvpnf8FdmkntJFG4Wx3bjOb05fU7ZS24QuqDJkmCV8hDAIYo29cDTmjS2q8KYkspaCmgCZmhe80AreFFr/Er2OeKATyF8DcDWnrtRfbl8mO70Kuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550537; c=relaxed/simple;
	bh=DfIVt+5jRdwB3q68pELtsG2fw1U9ElqZANdJf9i3wFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh+6lZbMELSx21biPGdbkOE4QlWLDqItxDC6QMvUjCsI4LrEMxTR1aMxFQ9+pTudsHHY7jsTWkY0N/trV9DpcMf91YvLuvJkjz+CqupXhd7PtQNEfTVWKCVWdkVN7TnM6PssSQ+VjkVP3vwrekEHbgmkQd1F7eCOeM9xOU7lAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5QbOYDu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5QbOYDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777550536; x=1809086536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DfIVt+5jRdwB3q68pELtsG2fw1U9ElqZANdJf9i3wFk=;
  b=P5QbOYDuztlxcb/p+cKad42MlSCpUkX2vX96yG6o09xwfIqOoZkQG+Wk
   oSLoxXGVnXYeDneDfe2oIdKuwLhFGlpKeZdGQ1upz/kzg5toFKZ0duyly
   AWRN2lgAMRIC2aZPy/6HcK5D8ydiSxkMZVeMehLsxR3uSCSE92cAFHTN1
   kC9m3z64DDlWRzRFU55LN9w4M9prMmyQqOj3VKYBj8iA/77fIsQjne07w
   9arnsZ6sbR9GiYdDAsWFVKv0zDqnTnjTOXYUQH4HJjwWpkMbRgIW43Vgy
   34Czndt7MeTHIt78minuBsxKcgjVeJCAL30ZExl7k1496vk411ftAv0N1
   g==;
X-CSE-ConnectionGUID: 25P1yem2QaOqpS3EX4KXfQ==
X-CSE-MsgGUID: 1WZyxdyUSfq1G4lGL+GnDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78419998"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78419998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:02:15 -0700
X-CSE-ConnectionGUID: ERLcUKGtSKKEJ7ZYT49e1g==
X-CSE-MsgGUID: UvLhpo3tTeS/LXvSz4qhnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="236343975"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.42])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:02:12 -0700
Date: Thu, 30 Apr 2026 15:02:10 +0300
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
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on
 release()
Message-ID: <afNEwrHLNTA4ywrN@ashevche-desk.local>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
 <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 30, 2026 at 09:46:04AM +0200, Bartosz Golaszewski wrote:
> If we pass a software node to a newly created device using struct
> platform_device_info, it will not be removed when the device is
> released. This may happen when a module creating the device is removed
> or on failure in platform_device_add().
> 
> When we try to reuse that software node in a subsequent call to
> platform_device_register_full(), it will fails with -EBUSY. Add the
> missing call to device_remove_software_node() in release path.
> 
> In addition to the above change, make sure that we still function
> correctly if a software node is used as the primary firmware node as
> well as disallow using two software nodes for platform devices as
> device_add_software_node() does not handle this case correctly (in fact
> a comment inside it states that only one software node per device is
> allowed but it will not bail out if two are used so we need to handle it
> here).

...

> -	if (pdevinfo->swnode && pdevinfo->properties)
> +	/*
> +	 * Only one software node per device is allowed. Make sure we don't
> +	 * accept or create two.
> +	 */
> +	if ((pdevinfo->swnode && pdevinfo->properties) ||
> +	    (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
> +	    (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
>  		return ERR_PTR(-EINVAL);

This makes me think of why we have these many ways of doing things...
Perhaps we should kill pdevinfo::properties completely?

Second thought is what about actually refusing this on the level of
device_add_software_node()? And looking at it, we have that check
there, why do we need it here then? Did we miss to check error code from
device_add_software_node() somewhere?

-- 
With Best Regards,
Andy Shevchenko


