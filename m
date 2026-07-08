Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1567433BA0;
	Wed,  8 Jul 2026 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510834; cv=none; b=KXfaYLZUrUawUmdimMKE+CMLvsWsTaeEvnxvUCNgs9X+6gIhd2Bsbx0K67fkLY9zBCCOf9Z6qrOpsYmLeusSCkMCwq5KKDuEMiwK05pP6ENXl7tz5TsvO3ReESV6muQeiM0Ddcooz8H2XN/C6oyYMDymAJRhM4jzREd4d8m0VKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510834; c=relaxed/simple;
	bh=dpLYqUgKFJe2E1L9qfI5UGDCSJeERNm5s4u56p1sYPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXzUz3EoNhkj3K6vKwdimaF2Gf+vsj8jVAASE3oSCRtD3BI8Pk/ficBHSyhKw1wK8c4tKOIWHMH6bVdWuG+xobdEzG1s2VYFrovyb44hq60NxaxbME9vb81T1Db85XCDZgndBi95uN027jWGDDEVM6QCa3Bm5KNCLGx8mJBlyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9ot8YXq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9ot8YXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783510833; x=1815046833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dpLYqUgKFJe2E1L9qfI5UGDCSJeERNm5s4u56p1sYPk=;
  b=c9ot8YXqSoa0EqJ98uVkwgnega3UiMZEiIKnzGOTn87/BNNjpCfzHeEi
   XqqKGe0r9u91Zy/donf4077E0xJp4hQ83K+but47OGNcYkbZjbKKcwEC/
   kAvD3lsH743p6hUam/a1vm661Mu6RtabDfo7hVCfTBJkKwnuotSYYqtp6
   nSnN34MnrwUSY5yx53h2/Jgkg9LMJreanwxPQuMDcuG/wLISupE3WAJ3d
   itD5Wg/94Gplf4uSAuHJze+M067BG/DTTzQafjMLfOrJesgjWg9pPUzxO
   ft2UYYoo0UpsPqTq8kW2zC9uBkDicUZ7qXuooY3O/6qOn8sXwOjwerbsz
   Q==;
X-CSE-ConnectionGUID: x0DaG3eZQverG8lWpZ/HBg==
X-CSE-MsgGUID: HYZEOTMCR7K5zdO4dT3b/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101593695"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101593695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:40:33 -0700
X-CSE-ConnectionGUID: OsXS0JGsQzOIdQReTdx6aA==
X-CSE-MsgGUID: wpZWCAdIS16CO26XRFJI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258570827"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:40:28 -0700
Date: Wed, 8 Jul 2026 14:40:26 +0300
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
Subject: Re: [PATCH v2 3/5] software node: add kunit tests for fw_devlink
 support
Message-ID: <ak43KoUF1pPo55gY@ashevche-desk.local>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
 <20260706-swnode-fw-devlink-v2-3-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-swnode-fw-devlink-v2-3-f39b09d50112@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 02:54:10PM +0200, Bartosz Golaszewski wrote:
> Add a kunit test suite for fw_devlink support for software nodes.
> 
> Most cases call add_links() directly and inspect the resulting fwnode
> supplier/consumer lists: a single reference, multiple references, a
> reference to an unregistered node, a "remote-endpoint" reference and a
> reference array. The last case is end-to-end - it registers real consumer
> and supplier platform devices together with their drivers, adds the
> consumer first and checks that fw_devlink defers its probe until the
> supplier has been bound.

Always in favour for the new test cases!
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


