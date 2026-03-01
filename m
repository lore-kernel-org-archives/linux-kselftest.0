Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD013AD1C;
	Sun,  1 Mar 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352355; cv=none; b=LQMgDRClkOigEEU7xseTJTa68tanjj+CSXX9CIXQODMGuxly8a4NkxGbPQkNQCsVm2VrcWhX0JtF2pvaphucEcoOzzk7Lf0BEVP+TRttyGQoUrG6pb5PPYV8n4xDiXPnVzFqFms4otXJUv6fSXwK7a1QKeNr65cL7TmGDoqNedI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352355; c=relaxed/simple;
	bh=3BZxcqBCNY7RTl2XSzcbbBHM11/xYWsKqBTf6uf+rbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6bnugp+AqKxmDJk6b439UBTpuvCUZFJNU088GOtoWyg1ZXFazArquFqRKCo/UEBv7I1dEGpOukVelG3CNFl6SFVyMbcHOHvnHkJzE35y8n9DSoPA1qflg3YoWl4QdNJwNI3kTJcL2BIqSMiWuLoCDWKNLwJISSL/lpvOeXgabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEikB/+O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEikB/+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772352353; x=1803888353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3BZxcqBCNY7RTl2XSzcbbBHM11/xYWsKqBTf6uf+rbo=;
  b=oEikB/+OZiBcj9v3Cc+LKbGmXZMTQ/poWxtGGZ/1CnWQRY2YwnCyVnin
   nTqlJOUaygGVgclVxY7K+XDhoG+qgtR0VUC9SkMYANfjkgxPX1xocaEez
   6nqNpd+94O3921qiGTi7XTfK4mWTTbuXkGvIkGBGCJesMApBfbBHhNKa3
   3drXjsO46r/hZRb5T62vMJdFhL7of2J4ABVZfdPVOMdCtnq4ry3UHbhcQ
   1vvDhC+HN7DL8UZi6YrxRv4lyTPJmtUtBf+5vXUCNuKtcah+31P+6eZhU
   VyO74alBOCEUn9hSRC1Oun1cSOqliNOsUa7b4j//LWLCUGWVeMfdXKKpo
   Q==;
X-CSE-ConnectionGUID: ocCPBwtzT6iIXudhilLJmQ==
X-CSE-MsgGUID: AonlSUDMQw+p1VA+GvJKRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="72413915"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="72413915"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 00:05:52 -0800
X-CSE-ConnectionGUID: 2VXKz50yT8qBRNpS9UgkyQ==
X-CSE-MsgGUID: 0OoPDmusSqyB46Zw765MYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="216462200"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2026 00:05:49 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwboA-000000001Kr-3k0N;
	Sun, 01 Mar 2026 08:05:46 +0000
Date: Sun, 1 Mar 2026 16:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <technoboy85@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] KUnit: memcpy: add benchmark
Message-ID: <202603011649.A4pBbqqJ-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260301/202603011649.A4pBbqqJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011649.A4pBbqqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011649.A4pBbqqJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_udivdi3" [lib/tests/memcpy_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
