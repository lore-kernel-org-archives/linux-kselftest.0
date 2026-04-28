Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FDC3B27F3;
	Tue, 28 Apr 2026 11:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375616; cv=none; b=fIrWXhCtKSDYKsdhVmlx37EceDP8HIm6wtBdl2N4QWEI32R/CZW/kunCoB+qb9kQZcu9zAPlwTNwu2yrG8mJlFF5M/jvwnD4DNnQPdhi/QmvJdYj62OvguYLqSY04lqZzJqIKEF8ZzHI2VHVzKurv2pN2VEm5Omr+FwhS6WBstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375616; c=relaxed/simple;
	bh=WQYK/WLz53kX2SEvWMWFk2THTo/tMi2hleC06lM5Usc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTLHcTTxdjXbHKHnx5TwRysAS0CELF1mQqTZS6LJXCpA+T/nitgp/WaieyUms3zOMH7OCt+BfDZuVIeycfGSe88xfbAALTd/qXzxjyCAI1nCFvIpDD1EAw6TVKSWr+pxDo5sK6z0HdKJn8ZuvnTlCqfJ4HzCoeF1OxXoqsbcUrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6M33sB3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6M33sB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777375613; x=1808911613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WQYK/WLz53kX2SEvWMWFk2THTo/tMi2hleC06lM5Usc=;
  b=g6M33sB3NPQsG6LPBuv3GVLQ5GCAZVM9LyXfHdqzj8pYLGOQr9hxZKx0
   3Ej06paHdQBB1IwPkmF5QUMcx1Xs0uCdaeQYxBh/DKMpPJKNBSRibiWzJ
   lrSN8laKyEhJoq+x33ps0eSLQ+YDet6UfxqBK20/OMzjwjipH7sL69Psi
   BPwpcBqGMogyESdB3AKQvz3arzyDQt4HPsVYWnHP08RGO0RVN/jec6e91
   OvY7x0vaqb79qnUIN9907zG6cEF9w+swdiKUaVWtXCz9ZXjEt2h6+2kaK
   +xpkh+hJpTpgjF0F5OKCOu8ayGSYQXanzMHU72EsJEBbr0wnlSZbmPkUA
   g==;
X-CSE-ConnectionGUID: jEFCVzDyQxmLny/s5etQAA==
X-CSE-MsgGUID: 56RlAUblSZ2oB+rfDIpGYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82145116"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="82145116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 04:26:53 -0700
X-CSE-ConnectionGUID: pShck56wSHOiGRQsmdD+Sw==
X-CSE-MsgGUID: 8W3TgZuNQq68ZgA/lknHeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="233072530"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 04:26:50 -0700
Date: Tue, 28 Apr 2026 14:26:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v3 1/3] driver core: platform: remove software node on
 release()
Message-ID: <afCZdxFDC2N4D9il@ashevche-desk.local>
References: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
 <20260428-swnode-remove-on-dev-unreg-v3-1-533bdc71b22e@oss.qualcomm.com>
 <afCVn36EO4w0H0vS@ashevche-desk.local>
 <CAMRc=Me4iPj84BdaqYRX5W-4XA1rCws8h4fe2jb=N+P9t7UMPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me4iPj84BdaqYRX5W-4XA1rCws8h4fe2jb=N+P9t7UMPg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 28, 2026 at 01:16:30PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 28, 2026 at 1:10 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Apr 28, 2026 at 11:20:26AM +0200, Bartosz Golaszewski wrote:

...

> > > +     device_remove_software_node(dev);
> > >       of_node_put(pa->pdev.dev.of_node);
> >
> > So, why do we decide not to convert this to fwnode_handle_put() (and respective
> > _get() elsewhere)?
> 
> Yes, I'll do it separately, I don't want to shove too much stuff into
> this bugfix.

Ah, good!

...

> > > +     /*
> > > +      * If the primary firmware node is a software node and there's no
> > > +      * secondary firmware node, the primary will be affected by the call
> > > +      * to device_remove_software_node() in platform_device_release() and
> > > +      * its reference count will be dropped by one. Take another reference
> > > +      * here to make it have no effect.
> > > +      */
> > > +     if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> > > +             fwnode_handle_get(pdevinfo->fwnode);
> >
> > IIUC the `is_software_node(pdevinfo->fwnode) && pdevinfo->swnode` may not
> > happen here due to the above check. If I haven't missed anything, this check
> > is simply
> 
> Right, it can be a simple is_software_node(pdevinfo->fwnode).

With that being addressed, the rest LGTM,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

(also assuming we will have at some point the above mentioned amendment).

-- 
With Best Regards,
Andy Shevchenko


