Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F146AF2E;
	Fri, 15 May 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842296; cv=none; b=IizM2QCypA/28/MN2qVdgvFd8f2Ux7jnt0eWkYhz9PI3df1o/G1A+zD8ECVZVQaG4Ux3hxACk7ESMRgKriMXI6dXdx4kOf18AGwaXd6/HmsLhDtOVznbYeQqmrVRCyXX6RjAg4Zr0lhxD+jJZKmuRwsniykTHXf43LPLWvc2Pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842296; c=relaxed/simple;
	bh=zw4WG69CRvBvRh3GaWA+RnoFtD2xXjr4ld8h9UwP6uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f33/FF9hjPrDgGbPuP5QAsSFl0xc6V0lI+e50L23t4xXir30II4LwcZfGKqYJfuxAvZPDKye57UrMO3spzuS52mBXsO0bXkOyy9bveiEFvtxe410IaTZf/uygsNwhRVOFphUg9QDTJ4AgawwhYY8zO/rChsYcO5shcBbvCt/p1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/I3lY2e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/I3lY2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778842295; x=1810378295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zw4WG69CRvBvRh3GaWA+RnoFtD2xXjr4ld8h9UwP6uY=;
  b=j/I3lY2e2w4NDEz7RnOJwsE6RcK9fWAARkTQCcJ6x6FkapcfViOl/CyS
   JKIqIsnDWYUaa3JNvb+LhLIDgPYy/Fh0Ue9ykiayfH1iuXp/3lOlH1JDC
   lHjjZz2h2WAhDpioBkCo4rcZ0+ZkM2IuGpfAsHUfV+uIDhGoCPVgIo7so
   4YjzCcYbh5gUGfHKV6ZHQ/wb5IWU0k2E/60IKy0cY6/dKbiOvtsMa0r1D
   Lbz+9Zgx8RfgZgn9J8W1uCAacoGUgUcI7TyZQfyOGzDvu9sVN1YnGQMpl
   hd5yRMS7OX0jmmHCadDbmEuNfxOg5m2keALUt7+GIAt1md6ztM8W9Q88H
   A==;
X-CSE-ConnectionGUID: yoLzsPidRqeJHEQUhjPYWw==
X-CSE-MsgGUID: 7enUYMIERGiRkPDqmDUz4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97370326"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="97370326"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:51:34 -0700
X-CSE-ConnectionGUID: ylHIxRKKR8KyhwtcSg84xg==
X-CSE-MsgGUID: 7USwwGTaTTS1QCmIj7RNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237803819"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:51:31 -0700
Date: Fri, 15 May 2026 13:51:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev, david@davidgow.net, raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/uuid_kunit: add tests for the four random UUID/GUID
 generators
Message-ID: <agb6sZH_YezBNTSs@ashevche-desk.local>
References: <20260514172241.28006-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514172241.28006-1-sozdayvek@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, May 14, 2026 at 10:22:41PM +0500, Stepan Ionichev wrote:
> uuid_kunit currently exercises only guid_parse() and uuid_parse() (plus
> their invalid-input paths). The four random generators exported from
> lib/uuid.c -- generate_random_uuid(), generate_random_guid(),
> uuid_gen() and guid_gen() -- have no direct kunit coverage.
> 
> Random output cannot be compared against a fixed expected value, but
> RFC 4122 section 4.4 specifies two invariants that any version-4
> random UUID/GUID must satisfy:
> 
>   - version 4 in the high nibble of the version byte
>     (byte 6 in the wire uuid_t layout, byte 7 in the byte-swapped
>     guid_t layout);
>   - variant DCE 1.1 (binary 10x) in the high bits of byte 8.
> 
> Add four test cases that invoke each generator several times and
> verify these bit patterns hold. The same checks catch a regression
> in either the mask/OR sequence in the generators or the layout
> constants. Run the loop a handful of times to cover the small but
> non-zero chance that an unmasked random byte happens to satisfy
> the version/variant pattern by accident on a single call.

Test cases are always good, although here I'm not sure we are so picky about
following this RFC. Whatever, feel free to add
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +static void uuid_test_uuid_gen(struct kunit *test)
> +{
> +	unsigned int i;
> +	uuid_t u;

> +	for (i = 0; i < 8; i++) {

Can be

	for (unsigned int i = 0; i < 8; i++) {

> +		uuid_gen(&u);
> +		KUNIT_EXPECT_EQ(test, u.b[6] & 0xf0, 0x40);
> +		KUNIT_EXPECT_EQ(test, u.b[8] & 0xc0, 0x80);
> +	}
> +}

Same for the rest.

-- 
With Best Regards,
Andy Shevchenko


