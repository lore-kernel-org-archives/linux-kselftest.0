Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E53E31C57B;
	Wed, 28 Jan 2026 22:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638252; cv=none; b=pPW12VeOotdQ6AOIFqh+R+YKhIZkqFYdalWip44QNyiTHnDKrcP1ovYVPSZ0BiVwrLU7xhY0TW78vdodAIyUCjBhWeSqQdubY7E+B4xu/pSiF27QcVd/PX8QS21yLOYsyVUFF0ofiacBdTo9nQBqpw+0F95DBOEwhoxCeU6wB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638252; c=relaxed/simple;
	bh=vrrYl/O/CwsGif8+d5sJHsjKXbx7VdXXPfYO3qQrgaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+siFOa7TswhQE1PcEQgwc87KVmKbemAHUlHll1g0P9S8EFKna3cI83gVmSzp6GoUSODkBKcjL1urqeTRTRHdI7Ydc+cabXLcGmj593O9QRhmCmL7sPtU5gOAHSivVsfAlObYkbUFhCDCZjYB9OyDL/o8gjYNcLK54lg0bltFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpLSreQM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpLSreQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769638251; x=1801174251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vrrYl/O/CwsGif8+d5sJHsjKXbx7VdXXPfYO3qQrgaw=;
  b=JpLSreQMMm65uB3ldRgAtJf0ceZdMGmdTUFxbBrX1c62Tm4mASpuI0D9
   RlJ0z4u2wx+SzK7+/SXnigWxmDVAR6RXEtq66PJBsLc64cFYXLxf/CDQg
   pZMsI0MqLkgkDV9TDxFN2xRRqpx/4qc1rt6hd6L6V6nOI1Jq9ibsoHg7s
   f+waaWorbHf531XsWCt06Cj6ab8KAsikh67sb6ydfXxoJon0lKrcftbCw
   dpOMg7vr2d71ysZOdQ3+t0hW9iFjNG6MEkJa1H24EUodIv/1ldssngLly
   d8F5M2opmwSfjENKduCCTwmWhxRkVK+GJ6EQPkkApcyXF4oBvYFdxFz26
   A==;
X-CSE-ConnectionGUID: RczQGbGDREWB6krGXUy7rQ==
X-CSE-MsgGUID: 6IQZnUkuTEWRN4N27JUN/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70954967"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70954967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:10:50 -0800
X-CSE-ConnectionGUID: 1vfA4d7wRhuyHySmsyeV2A==
X-CSE-MsgGUID: jtkRbiZjTfifO1qHpZ+F2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231324738"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 14:10:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlDkM-0000000026j-3BhL;
	Wed, 28 Jan 2026 22:10:46 +0000
Date: Wed, 28 Jan 2026 23:10:25 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 3/5] selftests: kselftest: Add ksft_reset_state()
Message-ID: <202601282352.QFHPcLUZ-lkp@intel.com>
References: <20260128-kselftest-harness-v1-3-cb259fa81cd0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-kselftest-harness-v1-3-cb259fa81cd0@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d6ad32e22f028c525d5df471c5522616e645a6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/selftests-kselftest-Treat-xpass-as-successful-result/20260128-182856
base:   6d6ad32e22f028c525d5df471c5522616e645a6b
patch link:    https://lore.kernel.org/r/20260128-kselftest-harness-v1-3-cb259fa81cd0%40linutronix.de
patch subject: [PATCH 3/5] selftests: kselftest: Add ksft_reset_state()
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260128/202601282352.QFHPcLUZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282352.QFHPcLUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282352.QFHPcLUZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ovpn-cli.c:35:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest.h:488:2: warning: ISO C does not allow extra ';' outside of a function [-Wpedantic]
     488 | };
         |  ^


vim +488 tools/testing/selftests/../../../tools/testing/selftests/kselftest.h

   478	
   479	static inline void ksft_reset_state(void)
   480	{
   481		ksft_cnt.ksft_pass = 0;
   482		ksft_cnt.ksft_fail = 0;
   483		ksft_cnt.ksft_xfail = 0;
   484		ksft_cnt.ksft_xpass = 0;
   485		ksft_cnt.ksft_xskip = 0;
   486		ksft_cnt.ksft_error = 0;
   487		ksft_plan = 0;
 > 488	};
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
