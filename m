Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF718C02E;
	Sun,  1 Mar 2026 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772353554; cv=none; b=UfR4WoxWJ4sqAMhBuAdxzQlRuIZ3NKFHQgdWq8fBNpDKZksoU0ni0dDkIZaB91oEQS9V/J36R59xtt4hjjkX07sJ8zikT+rDEAHJ4qhk0wBIBoir9EgE7kQGpgDywj+JPQRTcsAi3QEsU2xuhbitUUNYxDlO9NXEKK6zzV0hjX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772353554; c=relaxed/simple;
	bh=f2Pvjk7JSG65hzMSwpYeBqHr6b2wxFUS0wZ+zeQcS7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPrAS8K35igrxKrVIUvgQeZVHXAETk4GcIpjz+PcYf+k9i6csXmMg8BITv4W2wRqjWC5q/q9Nsx6L7aQgViBNNMzdYHhYWH7CJS63T6kryp5f3iG5NG/WkHpcx4+uudsqKgyWTiAIqb/TlFMKodnzMMzEPJj24LJnELy9rDB9C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/kCfIDU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/kCfIDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772353553; x=1803889553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f2Pvjk7JSG65hzMSwpYeBqHr6b2wxFUS0wZ+zeQcS7E=;
  b=R/kCfIDUNaYx0Q1aUt6bVqKNcJMzzMEObsx3cLHoTUtrM3MPRk1Pny8e
   I+5krWpZkevktLdu52H+Oy8O+bES0fEU4JKkvWy4ZtqZZjU6osDdtzyzY
   Ms4x/GNXLMWO7MvbH81ggaAM2C/AZTVyaK2sJsAZpMY1wJ1dWD7zu2yZe
   FgHnAXTP+wubobPTinpeqCY7Q6+eiZNblC2cpqpr2X4HaJnYisK+NjCLp
   OZy/iUC9n2GSszw3lZMJxFPOY6jgmkfBAjahliVQemM8L5fgz2ewBqVdQ
   CzPhDi21jaCAUEdo84PKOYXFxQeLqIpyeICKIrQWs2hfL+1Ycr1rN5ke2
   A==;
X-CSE-ConnectionGUID: kEeaK1U8RDOCt4JQZK/KYw==
X-CSE-MsgGUID: RZSYlYgYTKKIHnqPLR+NoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73430619"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73430619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 00:25:53 -0800
X-CSE-ConnectionGUID: d8hc9fy+SdWghNOIGBnFCg==
X-CSE-MsgGUID: qnJsAdZPQF+KgJQozITTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="215056542"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Mar 2026 00:25:49 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwc7X-000000001LR-0n2u;
	Sun, 01 Mar 2026 08:25:47 +0000
Date: Sun, 1 Mar 2026 16:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <technoboy85@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] KUnit: memcpy: add benchmark
Message-ID: <202603011603.4178c0iZ-lkp@intel.com>
References: <20260301011209.4160-1-teknoraver@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301011209.4160-1-teknoraver@meta.com>

Hi Matteo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.0-rc1 next-20260227]
[cannot apply to kees/for-next/hardening]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matteo-Croce/KUnit-memcpy-add-benchmark/20260301-091336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260301011209.4160-1-teknoraver%40meta.com
patch subject: [PATCH v5] KUnit: memcpy: add benchmark
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260301/202603011603.4178c0iZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011603.4178c0iZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011603.4178c0iZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [lib/tests/memcpy_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
