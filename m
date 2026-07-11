Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75B1F0E29;
	Sat, 11 Jul 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783758990; cv=none; b=mrAB7Q2NX8lBYnGzkqdNVhP9AyOR7hgZFqWW1bsJ4dWSfTIvQDd1uREClUoPDFryypFbDtMzcOyJJ59yI1+HRcS4E/ROVypCoU6Xeg+1BUNR9sHL4pHjTqCTeSzDMV5olGOPX0YTaJq9WcKGLjgLDIsEWr4Gck/DVQqiqwafugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783758990; c=relaxed/simple;
	bh=ERp1QIJ3KEM1nNGDIwEWioJcD0DgL4jZVTqpkSpFmLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3yBTN4WMEoPG9r/X4rfMmlPMci/CrwEFPKs49MIHQ+huicMJsWFHZB9fYRZK/zeB8cx8oeWtD3JMF9GF/JgHXWYmG1Pl1F6Tb3Hg7DasFNY8L5cAPA0x7Qek+BaDGfafzljnniYA08n+5npzeSXJ7/YgdlX2v1aB2N/AYL5fQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLJgJtcQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLJgJtcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783758988; x=1815294988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERp1QIJ3KEM1nNGDIwEWioJcD0DgL4jZVTqpkSpFmLQ=;
  b=jLJgJtcQgr2W18esSFMufv4+xpDCxSQMT9Qprz0yMQd6iOKsLgZODPQg
   s0WLHSy/JMJxv0AN1AeThZn1hAri6QNHakVwhRGe/2n27s/csEaK7fjIo
   7iAXN1iwZvSeO18agCYdROMZpqF5SjWm4VSMpWeKU2weWHB6ZljLr48Za
   2DnIqA8+qxr75PM7b5b1sg+XpbnW7yMvY6qYism2YbheZzkfjnyhkjgZb
   A/KWzbtvkzbHPsj6mqf/qOWbTU0utDO8OMjRTc/8TALhbfkVT99P9NiSb
   PrBnk+CNBRwj1/7QNqL7bfr2It2xZR1BDSPg1arbT8HZ7rODx5naFW3VG
   Q==;
X-CSE-ConnectionGUID: FZo/Qu69R96RSDUbaJX7lg==
X-CSE-MsgGUID: eLCFS2JsQLKPC4At+Cdapg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101997548"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101997548"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 01:36:27 -0700
X-CSE-ConnectionGUID: 9vBWdhD+SqOP7/7A7vPBww==
X-CSE-MsgGUID: 9mo3CRWPRbeFaszQSphnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251111669"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 01:36:23 -0700
Date: Sat, 11 Jul 2026 11:36:20 +0300
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
Subject: Re: [PATCH v3 2/5] software node: add fw_devlink support
Message-ID: <alIAhDuSJDsvGIMV@ashevche-desk.local>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
 <20260710-swnode-fw-devlink-v3-2-993f31874e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-swnode-fw-devlink-v3-2-993f31874e40@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 10, 2026 at 03:51:21PM +0200, Bartosz Golaszewski wrote:
> Software nodes can be used to describe supplier-consumer relationships
> between devices they represent using reference property entries. Unlike
> for OF-nodes, driver core cannot yet use these references to create a
> probe order that avoids needless probe deferrals on missing providers.
> 
> Implement software_node_add_links() modelled on of_fwnode_add_links().
> For every DEV_PROP_REF property we resolve each referenced supplier and
> create an fwnode link from the node to it. The driver core later promotes
> these to device links and defers the consumer until the suppliers are
> ready.
> 
> There's no allowlist like the one DT needs - devicetree phandles appear
> in plenty of non-supplier contexts, but a software node only carries a
> reference property when its author explicitly points at another node, so
> we treat every reference as an intentional supplier dependency and link
> all of them. Graph "remote-endpoint" references are skipped for now: they
> go 2-ways between endpoint nodes and would create graph cycles without
> the port-parent lifting DT does via get_con_dev(). References to
> suppliers that aren't registered yet and self-references are ignored.
> 
> fw_devlink resolves the supplier device through fwnode->dev but the core
> only records the owning device on the primary fwnode. When the software
> node is a device's secondary fwnode, mirror the device pointer onto it in
> software_node_notify() so the consumer can actually find the supplier
> instead of deferring forever.
> 
> While at it: purge the fwnode links in software_node_release() now that
> software nodes can own them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


