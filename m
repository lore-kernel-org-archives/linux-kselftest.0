Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE673644BC;
	Tue, 17 Mar 2026 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740399; cv=none; b=PKSQ3LrZKEQfY3IAjHJd4ee75mmf1EIrN/xjnoYBTKCxHtZB7ilZ+RWpejoAr7ei28iSV7qejGVtOvG2bGPtGyrIaHoDDeGzqGQQNZH3X3bPWiZBB9D7D6fWb0BKzmiYh0tArIikCW4DSe5jRb++WWHNgPfI1bsAGfeaOTpDa8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740399; c=relaxed/simple;
	bh=X1b5odisZXG8hdNFbSDTR5iFNZss9HSTUn4ZhTne3CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edxKdopvmPGgdSD4M2X31G6qQXRmljHkydxumOlm5ttyXPUw4KjlxctiKXdgZqB/uvPhaEWSgqJZYKcoggbNFjgn/yaunm/yUhJuDeXxLapgHGLfQJJZ4bWzFzDolqNml6ovwYXlpH9hNBbo25FJAfvJSwauWLWFvRUSqrhWXt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8KDi95o; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8KDi95o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773740398; x=1805276398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X1b5odisZXG8hdNFbSDTR5iFNZss9HSTUn4ZhTne3CQ=;
  b=J8KDi95oU4zckLczd4wkuUMMh4os5uUQnJMpsShA5IoM1qCHHMpjWjPN
   cySE2OLEvJaZ0m7Gap+iuuIV2ve/fvKFeiicvLCdap0nfXnF76CZ/AIDO
   GehwrgVGoRNrFB1I/q9ztJAkcC72xiOlzHwM339PRo6vFSMZ2y4J4WFTP
   Axp9hEdA+HyFypEtn7nAkUXoQZHqddxU1ET6r5ekwoxWTJL+N3tDCBdju
   QDPCdS1nt5Baf7MvN1H89E95VF/MIBjlf8aGqj5YSfiGc4QfkeaJq2XYS
   gal15vL3s+gfCGnUcRzHCKEJz/4jWGIIzIRmE0GlcWxyCKCb9e8kkBARp
   w==;
X-CSE-ConnectionGUID: FsV2ZaIJQ2mhek7txgXcoQ==
X-CSE-MsgGUID: PWW6wnZaTvyg8ra9sT0tew==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78620630"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78620630"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:39:57 -0700
X-CSE-ConnectionGUID: tFN7HEKcRe24Er0BrMiG6A==
X-CSE-MsgGUID: Lov8Ur2cTwq1C6vhxZNkGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252705194"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 02:39:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Qu1-000000004Pd-1tU4;
	Tue, 17 Mar 2026 09:39:53 +0000
Date: Tue, 17 Mar 2026 10:39:21 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Willy Tarreau <w@1wt.eu>, Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v3 1/2] tools/nolibc: add support for
 program_invocation_{,short_}name
Message-ID: <202603171011.58aT1Db0-lkp@intel.com>
References: <20260316-nolibc-err-h-v3-1-6ef80c051ab7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-nolibc-err-h-v3-1-6ef80c051ab7@weissschuh.net>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 745dadd6d3d984feafb96f27b60d74b29ade4957]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/tools-nolibc-add-support-for-program_invocation_-short_-name/20260317-060704
base:   745dadd6d3d984feafb96f27b60d74b29ade4957
patch link:    https://lore.kernel.org/r/20260316-nolibc-err-h-v3-1-6ef80c051ab7%40weissschuh.net
patch subject: [PATCH v3 1/2] tools/nolibc: add support for program_invocation_{,short_}name
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260317/202603171011.58aT1Db0-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171011.58aT1Db0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171011.58aT1Db0-lkp@intel.com/

All errors (new ones prefixed by >>):

   nolibc-test.c: In function 'run_startup':
>> nolibc-test.c:750:9: error: unknown type name 'bool'
     750 |         bool proc = access("/proc", R_OK) == 0;
         |         ^~~~
   nolibc-test.c:49:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
      48 | #include "nolibc-test-linkage.h"
     +++ |+#include <stdbool.h>
      49 | 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
