Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03733409603;
	Tue, 19 May 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196930; cv=none; b=puxuofdHMdkTPVIe7Ua+1NpZGUUVbX0kELbTUtIOBizJANaqicTkZ2s4I999suWT1LCOYDuYnxjavwHFfozeJoLpVgMOsErqwE/jQZJt3jnzXythkHpMF06KhJVzbjOzP/+7y7qk/w517MevXzoAMlSdAe9C7Y0Or6TgBaEF6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196930; c=relaxed/simple;
	bh=0DOGHmbTiOxaq5Lkyi3/3tBJC65Prc4+RQK6ZRBWl2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbDNvkkzgsTAyzOIZFQfEyKCHvqDSPbaWODnUVPkHoIYEDZMWtvOeP2OwQL+2lzXvzf4eLvhYt9IC2Xt9rd4UQiP02w5eLqp6XOAxdZ6FMWh2JTVTjWbQ8DRseMWI/QqeqShsmzWSrc6L77JlIL0WCKqysA0UNx3o66cCjPtUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fo0KAlSO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fo0KAlSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779196929; x=1810732929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0DOGHmbTiOxaq5Lkyi3/3tBJC65Prc4+RQK6ZRBWl2g=;
  b=Fo0KAlSOkJFqtjUOR5MRLZL19zWYV/kUCYvvoaDPADb8RoFs3c+kDBtg
   kSegIP5WbPrM70VGIZg5X4U5+UH3ukDKL8Oy1CEsraU03Q+k/UeD3L2YL
   syiD5AVtTzoLme+WsZrvG6JHv5bSf4Coq6NwtGg4wWtZS82O25EfDA+TN
   Ivvamf118ffJZhGjuJsiTrBSjQg6zD3O3cTnafeS8ieM5KYyQn+8JUk+K
   33Dukze4AP+HskSjpLncyywnvZFAo9S9wNsJq7j5v3eRxg+5AaYk7YHgi
   ndouqCpYXZCWPdSCZ1QGZrKk2/pYztgA9s5vgpux1h0ef5I+vROjZzSxV
   g==;
X-CSE-ConnectionGUID: 4WaX3oIySJW5xn7SyeXWBQ==
X-CSE-MsgGUID: aLDvI1+BTxCB4kY0lp2Z4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80124479"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80124479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:22:08 -0700
X-CSE-ConnectionGUID: NQnuvB9YTmeMay4v4oPFZQ==
X-CSE-MsgGUID: Vb8Iha8+SWe058qVUl/3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239628326"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2026 06:22:08 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPKNv-0000000016L-3Pbt;
	Tue, 19 May 2026 13:21:30 +0000
Date: Tue, 19 May 2026 21:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Disha Goel <disgoel@linux.ibm.com>, shuah@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>
Subject: Re: [PATCH] selftests/filesystems: Move file_stressor to dedicated
 subdirectory
Message-ID: <202605192100.DvRgEGZ3-lkp@intel.com>
References: <20260519104210.11836-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519104210.11836-1-disgoel@linux.ibm.com>

Hi Disha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Disha-Goel/selftests-filesystems-Move-file_stressor-to-dedicated-subdirectory/20260519-185602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20260519104210.11836-1-disgoel%40linux.ibm.com
patch subject: [PATCH] selftests/filesystems: Move file_stressor to dedicated subdirectory
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260519/202605192100.DvRgEGZ3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192100.DvRgEGZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192100.DvRgEGZ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/filesystems/file_stressor/Makefile: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/filesystems/file_stressor/file_stressor.c: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/filesystems/file_stressor/settings: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
