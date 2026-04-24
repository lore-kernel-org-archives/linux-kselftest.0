Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F243B0ADB;
	Fri, 24 Apr 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036433; cv=none; b=bfneeVN1T/CnO0hl1jBubNwUcMpiQOdmVzBHEru3DojNQff9j6ycpwIRoTm95HrtI9Jk6JWBeeyOiRLjonWyp0NpZUm196CH9tOvOetAYwsOlqFGVVWQu61/e/QKZGytetPJx9tbde43Jy/2m1k4Y3nwDqmVRe/dtPW9Drwy5eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036433; c=relaxed/simple;
	bh=99U1Xcr2qSfWGpVcIOge6rURQn9MjQNUqRpsGUFYND0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DogYZyfnSpHeRjySIa1vjB47V0ei69H3cKNsdeDsqcOoBSD69ezlwOPmdEqyb5Ro3DKm8UEVx+64v5pV0g5oIw/ZO8aj8TxRIFzotZMmPiMoucqQx2XsKUblnS2Xoezso6fcd4S+0DQFB0i66NSWEjTR5Dl1OxGE2d7S0AGXLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kk6b4Rbh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk6b4Rbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777036432; x=1808572432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=99U1Xcr2qSfWGpVcIOge6rURQn9MjQNUqRpsGUFYND0=;
  b=Kk6b4RbhoeDpqZMbsmKCb9rlw7y/c73CJE6doGBoe7Fb6y+CoJgKHxPy
   Z6k+Z2i2jrhN3VZg6Vk0SugoqtJw5xnd6NXSKwv42tUkwPaAVvm5nusxb
   4/dSNn3UBfYkhY4Qo1dOfSyRBysXvedMeioeKB0k0DFT6HivBdtS+RLF9
   BwtBNU0B/UjXtk6OL7cw2MCMhW6unN0pQ3issjyloD4fit055SR3S1JtU
   hF42kdbu9Ay0ZtSBnDs3xnpkfe/nBYAAMHi3p+Cwh6wTedaPijnArYdc8
   DxtU9S3C8F9aUheqjX/9DVsV5k13gdUwVxqmGQMa4oU0vF5V7Tj9GPNFh
   A==;
X-CSE-ConnectionGUID: 1Mk/kgzBRACNRY6BJcsK3Q==
X-CSE-MsgGUID: 6m66JTuMRLGlrIZIV39yhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88712974"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="88712974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 06:13:51 -0700
X-CSE-ConnectionGUID: R7BB/5jFQneqHQerJ5tF8A==
X-CSE-MsgGUID: GDJV9xqBQ/G2P8GMw0q3NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234743268"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 06:13:48 -0700
Date: Fri, 24 Apr 2026 16:13:46 +0300
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
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Message-ID: <aetsiqtCqKfme6eC@ashevche-desk.local>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
 <aesxXvf4hpL66TLz@ashevche-desk.local>
 <CAMRc=Mc92zOdjz-8P2A5og=mTKFUKrj3o7Z28NDdkMktDD+tuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc92zOdjz-8P2A5og=mTKFUKrj3o7Z28NDdkMktDD+tuw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Apr 24, 2026 at 02:34:29PM +0200, Bartosz Golaszewski wrote:
> On Fri, Apr 24, 2026 at 11:01 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Thu, Apr 23, 2026 at 02:12:02PM +0200, Bartosz Golaszewski wrote:

...

> > > +     device_remove_software_node(dev);
> >
> > >       of_node_put(pa->pdev.dev.of_node);
> >
> > Can we rather replace of_* get/put with the fwnode_* get/put and make a
> > conditional here?
> 
> I thought about it but I'm not sure why we bump the refcount of OF
> nodes but not of the firmware nodes supplied in struct
> platform_device_info. Maybe there was a reason for it. That would
> simplify things.

I could with 99% assurance state that the reason behind this as simple as
ACPI doesn't need that. It's no-op there and no-one at that time thought
of software nodes. More, I have some (a few years old) patch locally that
does this conversion, but never had time to look into it carefully for
any missed corner cases (as part of that work, the preparation was done
for AMBA devices in the ca5a75df36dd ("amba: bus: balance firmware node
reference counting") which is more than a couple of years in upstream).

> >         if (is_software_node(...))
> >                 device_remove...
> >         else
> >                 fwnode_handle_put().
> >
> > (or something like this)
> >
> > And IIRC the above pattern has been already seen somewhere else. But I can't
> > point to it, just some weak memories of seeing that already.
> 
> That needs to account for two software nodes, I think it's fine to
> call the two in sequence unconditionally (like I do this this patch)
> and just dump the refcount on registration as necessary.

Sure.

-- 
With Best Regards,
Andy Shevchenko


