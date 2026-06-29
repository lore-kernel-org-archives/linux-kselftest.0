Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636E403AF1;
	Mon, 29 Jun 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732238; cv=none; b=nmbPkFaPtbrPtCBesPbcJsNa7OOzhTY/lEMxOd8SGcq5zWsukvS3b4K+ciDs7IMgRdECH5/KRzMdgeBF0c8K16dNZNGs5hQGbS3SGYhJOekNz6duuSU8pMLDpooRnhoTGjn7fibMm+LsPUVZHbZF+LyqdDkJol7GKdwf7mdKAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732238; c=relaxed/simple;
	bh=z+zWPxm3JBdhU/L5WtVYwuCIHZ488gQQa10lxH3MfSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc9Zrgna+o+3mhBi3F7UBHGKqctp5Dn9ErP8/mVeMFwS9wAd1QzlkEMlG4wdwBr/OgxeymqL/uUwZ1Rs4ygsT4LEHAIVqRg/dBCNt9ZK4EFl2Y2VqngqUTGFwNgQlI7NqgH+Sv8lx9PG3WShi4OCaWoyMrwXhJVyVuLAcv/fw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPRhueGs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPRhueGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732236; x=1814268236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+zWPxm3JBdhU/L5WtVYwuCIHZ488gQQa10lxH3MfSw=;
  b=PPRhueGsIgae11QAPgnQqge0Y45kTGi74BM+XCvuA/IPsJr9w6Oc4kVa
   vrgfQ6jCkZaEoVuFwvqgHIE7ahJZuwRjCVM6ngPjCYwZnPGMLl/jjZs5V
   ddlkfCBOwXN90zhFgdO8CnYdxOds/AvoN+6Sw+vmBkn+skG/pzvof9+Q0
   0z2U6VjtLS8BAd9yM6Hw3y7U8hcjXT5DCjXf1SWk5UwpkuOMIJqEtVpjx
   EEwHKT6naQ3tvL4Mx7VAmi+b25+Cf9qF2utBNTVlGGbz3SofizAXDFIr2
   s9a00XGrLCmM2dATiGf+Nundi0w8nwSHqP+HqDIVrPZ+XMMXFhy6cT47o
   Q==;
X-CSE-ConnectionGUID: 3EPU29jYSXOwnpzTPEu+iw==
X-CSE-MsgGUID: 1pjp/A84RZ+j9PWr2E6RLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83292444"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83292444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:20:39 -0700
X-CSE-ConnectionGUID: E/Z5r64PS/6YdODkz95kRQ==
X-CSE-MsgGUID: t/UIqA0pTvSS0IrkG6SvVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252566664"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:20:34 -0700
Date: Mon, 29 Jun 2026 14:20:31 +0300
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
Subject: Re: [PATCH 4/5] MAINTAINERS: add myself as reviewer of software node
 support
Message-ID: <akJU_1BS4NoLd3tV@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 12:52:09PM +0200, Bartosz Golaszewski wrote:
> I've been working extensively on software nodes lately and introduced
> some changes. Add myself as reviewer so that I can help review any new
> proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks, I appreciate the move!

...

> +F:	drivers/base/test/swnode-devlink-test.c

This should be part of the patch that bring this file to life.

-- 
With Best Regards,
Andy Shevchenko


