Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3143C05F;
	Mon, 29 Jun 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748704; cv=none; b=Q2KWWPKCUEvA28wBCKuQNRpORNeWDGPjvoxBUGpZx4k0wgXjzQU7KJevf3K66CTpn2Rm/EzQ/RvR/bXrnyDEE1OyQEz8GF3A28yKjHRZKZPvSZfVj6i8YT0zCVupqvobh1PWrERPUDtowKs5YVRhlKqz04Qo+6vaG6MGFa3kW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748704; c=relaxed/simple;
	bh=6KGEFAPBIUveS9Bm7GjYL9PASDK/Ym91e/0ppgM5eJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ik9Fdhn6n9xOAYTlpM/K+mfq9kkWJdizKc1fLNRfjXtTv7HCxADnD0FtPi4lj7T3U0CmyhF6ORT1fDseuj/HA0cmd9QFG5LpGscR9z6xCHO+vnQv77iZ+u6AjEpVYQqJmhmCs7Y053lvsdvEVhOjSFDu8gnNui1/qXsMwhd2VCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goTAYLvT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goTAYLvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782748703; x=1814284703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6KGEFAPBIUveS9Bm7GjYL9PASDK/Ym91e/0ppgM5eJg=;
  b=goTAYLvTTnNWsxH9ZXjtMEEqgZ6gsFHcye4zWNh1G/rBwjOY9ngvHT/V
   BHjs2Kja5Pi87XReTPkvf8JgzQlnnBYzUa9aGeJXkS0adtDDNwuQ3Glm0
   brrbCAnCrootX4E6KX7oL2/vz1RPFzyGgEgePimTB1UZDhXqITSwNvNc2
   B/HM+a/Fz1gK9QUBbzS3x40Zh8oJpgnp6TjufJAtD66OAAkeUbfgOI3HJ
   f1bSFAQLbBusdleD0uv2RChW4AEqTqW6LXlhijD9OU60TcIhfMTOXP1L0
   lnntOb9RM8tX1bLdEbBGJzPpg9Qnzmnislk0kqjQv2OLapjUAn93yeQKd
   w==;
X-CSE-ConnectionGUID: szqlGKgVSOibSZPkZNrB+w==
X-CSE-MsgGUID: AEnXeWjoQU2BKYUL1diajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83318640"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83318640"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:58:22 -0700
X-CSE-ConnectionGUID: fpjnY+FrQxa8CCgxZbqjyw==
X-CSE-MsgGUID: P0HZsrF6QIWQTHFaQDuBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="248020780"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:58:18 -0700
Date: Mon, 29 Jun 2026 18:58:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink
 support
Message-ID: <akKWGNpGmHjWYdfX@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> While at it: the existing gpio_unbind_with_consumers() test keeps the
> consumer bound while the provider goes away and then operates the orphaned
> descriptor. With software nodes now being covered by fw_devlink that would
> instead force-unbind the consumer along with the provider, so opt it out
> by setting FWNODE_FLAG_LINKS_ADDED.

...

+ cleanup.h // guard()()
+ err.h // IS_ERR()

>  #include <linux/platform_device.h>
>  #include <linux/property.h>

+ types.h // bool

> +#include <kunit/fwnode.h>
>  #include <kunit/platform_device.h>
>  #include <kunit/test.h>

...

> +	properties[1] = (struct property_entry){ };

Just zero the whole array at the definition time.

...

> +	pdevinfo = (struct platform_device_info){

It's better to have a space after ).

> +		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.data = &gpio_probe_order_pdata_template,
> +		.size_data = sizeof(gpio_probe_order_pdata_template),
> +		.properties = properties,
> +	};

...

> +	pdevinfo = (struct platform_device_info){

Ditto.

> +		.name = GPIO_TEST_PROVIDER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.swnode = &gpio_test_provider_swnode,
> +	};

...

> +struct gpio_probe_defer_pdata {
> +	int probe_count;

Why is this signed?

> +	int gpio_err;
> +};

...

> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
> +	struct gpio_desc *desc;

> +	pdata->probe_count++;

Even in case of error?

> +	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
> +	if (IS_ERR(desc)) {
> +		pdata->gpio_err = PTR_ERR(desc);
> +		return pdata->gpio_err;
> +	}
> +
> +	pdata->gpio_err = 0;
> +
> +	return 0;
> +}

...

> +static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)

As per above.

-- 
With Best Regards,
Andy Shevchenko


