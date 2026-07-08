Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027A4CB5B;
	Wed,  8 Jul 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518263; cv=none; b=YxubggQkcZoJoiZdJWCgIf72N46TcpYRyw+cVEpFA2L6j6+TnzYvcM1atjQCah2rzDTfXygf6HfOVwO2hGmUlmybXJpFNELcTmccuqBd13HTEVQCL9fITu/PikMBWlaYMs0WFfNw3eEsA5sEtX/2abQTAFkA83oAabuZCLRSr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518263; c=relaxed/simple;
	bh=BF6Vb9hnwvSdbolPZGWPh9gCFlsO3dx2jY2KJay9g4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdcgR631xG/6dFTuwtcsVWUpmf5Xtlk6N/UM5tDgBTPH6nvabnJtVViKUmn5ECcoBimReyALRPRt0TDWTWL0RdrllXc7cCo9yUcoEE8Je99Mj0OIqizOPK/U5QWtulvHQKwXphv0vtPsNendXpfs5W3CwrsiPBtGq9qzwVrEUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sc1Wd/9Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sc1Wd/9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783518262; x=1815054262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BF6Vb9hnwvSdbolPZGWPh9gCFlsO3dx2jY2KJay9g4I=;
  b=Sc1Wd/9ZvrAMUc833ySY9byGEgJ4Y8EEgKcmDk1PeVZb6E5x50REJvA6
   mdgNAVaJFaRRhB0xuDKBHetbLqPUnZXAJs+flqDlfSCtvDOUAqxpHq7S3
   fi4YO5LCBceXT7nePrHyz/KK3XdxkgKkArdw2etUVEIdkQzuqNhdTnsgH
   yIe5HvKfPgYJ0yRc681xn+jspmKHRegFHtSUx960CjskNo+n5fydoGwRA
   uZ6aZ+Zi3XUcofJkZz8c2YVZxq42k6JVoYpsqw4yPqfX3xZ0BLFDAkGw7
   WtzVRUgfW607obSnjRctEPuAQluAsTEQzQP8N2X7uyHRoEtkTAjz+eG8V
   A==;
X-CSE-ConnectionGUID: wl5Ff1axQZWCrOoIzaHuJQ==
X-CSE-MsgGUID: eUaoH71LSW6ypai1h9y4ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95336394"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95336394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:44:21 -0700
X-CSE-ConnectionGUID: Gx8sd6jtTYa87WSIeMFO5A==
X-CSE-MsgGUID: DQCjphV1SfCz7AcSJLEtNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249847324"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:44:16 -0700
Date: Wed, 8 Jul 2026 16:44:14 +0300
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
Subject: Re: [PATCH v2 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Message-ID: <ak5ULrwZfvA4hdsP@ashevche-desk.local>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
 <20260706-swnode-fw-devlink-v2-5-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-swnode-fw-devlink-v2-5-f39b09d50112@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 02:54:12PM +0200, Bartosz Golaszewski wrote:
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

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


