Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8F401493;
	Tue, 28 Apr 2026 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374631; cv=none; b=DIya/jxJuD1fynE82CqttI5kEQueRepnDwWE7AEAVid8G+GsFDYgBqaun3YEJrt6hFqWapst3zoffEfduqKhPljxbKbio/ZC0z1vgabxiawLzyLT3U3rVAzaXUK6BVtOJxD6RIBHyZ0itIkTFji69fGBiP9wqFMVwsPM3C25WJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374631; c=relaxed/simple;
	bh=guAyNWntqj2fLjXiO483YRDb/ECfTSoHy1PQa/2/AzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWm+Lq9HAFnz+/bHtpqK0hXiAFoEVJCCwdH09+4cx1fPnSwUPKOrxd0GU67VM8zoMEYYxBKpGoRYIZN+75Y6Pn2HBypj/B1PJWHjGLVhs6yrsW6zI2sgy7XfJNBjTAbxtCPViF2dcDZyczdC58+KDC/uQvlDIxkRkn818Subuqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OprvIf9J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OprvIf9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777374630; x=1808910630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=guAyNWntqj2fLjXiO483YRDb/ECfTSoHy1PQa/2/AzM=;
  b=OprvIf9JdF3/SVzsq88+tPrOXPEFGocEGtfspvbzVEqBqvgOLOJWKE0T
   xrq5f/VtahTON77mtLd0WWQhJSoAY+xHrB97jqvPo/24MvAXtPAorppuo
   xE96BZseqYejhT/d/3dbEYfwz9QLeqgW5qxrmP559RalVg+lmPbhqD6wh
   BRTqqluAGjPvRY5mKDGPlIS3/UJmog5MYOWnw7hPt6P+Ligpc+QAHTwAk
   ZreiB0+ojjR9j3DaE1jEWQqxtm2xqLmInblCRHYMXTDJgNuyDN3nTqRpZ
   h2P56MPPxyVKaM23xbjyZhBOsq2q/0nHMNJSxkN2UZ70P3h72CXtV16ee
   g==;
X-CSE-ConnectionGUID: 42zDlaWLREywW6OxOBPmnw==
X-CSE-MsgGUID: 5DGdRhybQ1yQbeVwSi/OVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78390637"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78390637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 04:10:29 -0700
X-CSE-ConnectionGUID: drHBfsXaQhK6/3i2u6xUYw==
X-CSE-MsgGUID: QhDoYeQ8RO+vBrTOR2dC+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="233873156"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 04:10:26 -0700
Date: Tue, 28 Apr 2026 14:10:23 +0300
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
Subject: Re: [PATCH v3 1/3] driver core: platform: remove software node on
 release()
Message-ID: <afCVn36EO4w0H0vS@ashevche-desk.local>
References: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
 <20260428-swnode-remove-on-dev-unreg-v3-1-533bdc71b22e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-swnode-remove-on-dev-unreg-v3-1-533bdc71b22e@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 28, 2026 at 11:20:26AM +0200, Bartosz Golaszewski wrote:
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

> +	device_remove_software_node(dev);
>  	of_node_put(pa->pdev.dev.of_node);

So, why do we decide not to convert this to fwnode_handle_put() (and respective
_get() elsewhere)?

...

> +	/*
> +	 * Only one software node per device is allowed. Make sure we don't
> +	 * accept or create two.
> +	 */
> +	if (pdevinfo->swnode && (pdevinfo->properties || is_software_node(pdevinfo->fwnode)))
>  		return ERR_PTR(-EINVAL);

^^^ left for the context.

...

> +	/*
> +	 * If the primary firmware node is a software node and there's no
> +	 * secondary firmware node, the primary will be affected by the call
> +	 * to device_remove_software_node() in platform_device_release() and
> +	 * its reference count will be dropped by one. Take another reference
> +	 * here to make it have no effect.
> +	 */
> +	if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> +		fwnode_handle_get(pdevinfo->fwnode);

IIUC the `is_software_node(pdevinfo->fwnode) && pdevinfo->swnode` may not
happen here due to the above check. If I haven't missed anything, this check
is simply

	if (is_software_node(pdevinfo->fwnode))

-- 
With Best Regards,
Andy Shevchenko


