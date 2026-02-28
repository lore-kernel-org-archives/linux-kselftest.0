Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26CE3382E8;
	Sat, 28 Feb 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275058; cv=none; b=ieG7h86dor7wimttQhHjyAsyOcPLAhbD8eifc04pTE3NcFVFSQSR3DLbH0R4mXTF9zZEA3z07WZXKu9NQzTgF4TPNFO6bCFoiNNuUHY4xvYembhF52eMlefIFX5pe0EQJ0wfov5covAor1MnLwp9M96gaHG7K6n4QLroeTWfTGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275058; c=relaxed/simple;
	bh=lI17PB6aHS5Ee/3j1HtOcfq3WrMq5yfOl9jQ4xj6uEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vfd9w+yN8TmMhtkqON9n1hWR62E4hqtbaYepioKYRfoTbaiFwZyab7RO4nKQvKYrZJN1wT+0LjUCNKzU4zeI8fC1T0CDSZxn5Ou7JRt9rlsdVHd4YMJIYvYeZs79erqXj2cS7qXkUfd3sfaB1JpAc2sdqFwV6SZeMQoiw3+GQa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/6BvEAu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/6BvEAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772275056; x=1803811056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lI17PB6aHS5Ee/3j1HtOcfq3WrMq5yfOl9jQ4xj6uEg=;
  b=H/6BvEAuVANpDr1ssyStLP7jP0OkkVX/RBzeK6rDgMHLXCL2I180+hUn
   A2itc1Q9bdZ31V7bvpJtVA27lOMHnVDI621xMepv3ImCWokM85kM9ZXTq
   Lna8Ts47+SZh+bwKDi6ZtPyDrHIkrjGepCtl8iKRi4e4dYcvwPF6dovxD
   ZSb65ha6I/OOsU/UVudNbKgo5waTikf/5FERoRD9KC49oeUCMGo3uqR8t
   tK6d13FCKbnFa8BqDreYhhCshesn6fy2I2954SzegrLNi7FcCjKNeh31W
   h5aqXEtwmX8XJ19h855EAAKgBZ2XLuhgG2dMYfApSmWWCt9/k2zrGXopo
   g==;
X-CSE-ConnectionGUID: c2uHMdGMQjOQUYEkibFJ7w==
X-CSE-MsgGUID: 2Tj4nqEeT2yH0HxkAkbBlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90925824"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="90925824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:37:35 -0800
X-CSE-ConnectionGUID: nAAm622MThSf1IW3Vw0Bdw==
X-CSE-MsgGUID: gplH5To6RvGiAxqVYmg86w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="222121023"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:37:33 -0800
Date: Sat, 28 Feb 2026 12:37:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: tool: Terminate kernel under test on SIGINT
Message-ID: <aaLFalGTilMjWyJH@ashevche-desk.local>
References: <20260228100727.208896-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228100727.208896-1-david@davidgow.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Feb 28, 2026 at 06:07:22PM +0800, David Gow wrote:
> kunit.py will attempt to catch SIGINT / ^C in order to ensure the TTY isn't
> messed up, but never actually attempts to terminate the running kernel (be
> it UML or QEMU). This can lead to a bit of frustration if the kernel has
> crashed or hung.
> 
> Terminate the kernel process in the signal handler, if it's running. This
> requires plumbing through the process handle in a few more places (and
> having some checks to see if the kernel is still running in places where it
> may have already been killed).

I killed my branch with those experiments already. But it's really appreciated
to see this going to the right direction.

> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>

In any case, god bless `git reflog`, I got it still from there and hence

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Tested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

(Have to applied the other mentioned patch first)

Now

  ^CERROR:root:Build interruption occurred. Cleaning console.
  [11:36:29] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
  [11:36:29] ============================================================
  [11:36:29] Testing complete. Ran 0 tests: errors: 1
  [11:36:29] Elapsed time: 33.615s total, 0.001s configuring, 5.122s building, 28.492s running

-- 
With Best Regards,
Andy Shevchenko


