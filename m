Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1CB3CD8B1;
	Thu,  5 Mar 2026 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727050; cv=none; b=AIRjjmzX/DocXWWk9WDpTgV0DywZi8Bb5k7g/7rTYrOqFAkEqv0tJs55p7ThGZPLPoiAv2VFw4VuuFkwlgsJRi1M24lUfRMZ4HgN2MNM82roiZG45pIb1pQ+O7byIu056N26ZtufoG8WPUIhv9YPbiDWp6s1MwFQiohL7kSIgl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727050; c=relaxed/simple;
	bh=1q6rIizXuyYgUo7PEQpRErULcW8ElhJl1i4zMa6SjAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heluR1IbMWWAoKTAsXnQhYpOVHQMKxQNfP2P8vTJm+p69W97+oOCR5hefizELlaFSA7TOBj1SJ34Nju8rjtNqh3AXcZXOrH/fxkQyCPY7VY8VvLFRmop8HKN6snWFw8AWe6rfjPcqLZ2Qx/wVranQ2PDYwKTePMfkdtlfruxuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clkkUYLw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clkkUYLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772727048; x=1804263048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1q6rIizXuyYgUo7PEQpRErULcW8ElhJl1i4zMa6SjAM=;
  b=clkkUYLwRvkOjwnO+J0Nbg3S02+G2jGYS4a7L86xw4/q1kwbhOE7rvAc
   dmHfU5GDdgp4qaSNWENMuQ9MF08oTVse8/V0rpkn+YtEncfumHYvWatLl
   fEqlBx2C2c0zI9DpR4Q7wSZu/wkxfg2+bTBampn/xz05IHrvCwS/aIMUI
   ko15jM4EYlwR7ohOJSSZBqL4XOOzNu+7mNLEVqIPCrVVaRGGEYF7v9dff
   rmWkqF6nPW8IwZ/+fiwL0URM0EIcE2CmWSnLaucrGEkirQZBwOzq0VQqW
   Yibad6qVi2808FnZT+7K1wxANK1bZsRGSVlILcHO/ivtHNEDLgK/rDGco
   g==;
X-CSE-ConnectionGUID: UmyW40NIRP2FxHey8gDuIg==
X-CSE-MsgGUID: I3s1Ef/wQqKSJLkQ5td8IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84903339"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="84903339"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:10:47 -0800
X-CSE-ConnectionGUID: rxlLxNrzR9u5WN3YdIEWrA==
X-CSE-MsgGUID: eVd40RDZRNCDSGOIdh3+nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216998057"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 08:10:45 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyBHf-0000000021t-0gSs;
	Thu, 05 Mar 2026 16:10:43 +0000
Date: Thu, 5 Mar 2026 17:10:34 +0100
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 1/4] selftests: riscv: Add definition of BIT() macro
Message-ID: <202603051713.xu4BUyLe-lkp@intel.com>
References: <20260305-fix_selftests-v1-1-61b62d23500b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-fix_selftests-v1-1-61b62d23500b@gmail.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on c107785c7e8dbabd1c18301a1c362544b5786282]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins-via-B4-Relay/selftests-riscv-Add-definition-of-BIT-macro/20260305-164838
base:   c107785c7e8dbabd1c18301a1c362544b5786282
patch link:    https://lore.kernel.org/r/20260305-fix_selftests-v1-1-61b62d23500b%40gmail.com
patch subject: [PATCH 1/4] selftests: riscv: Add definition of BIT() macro
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260305/202603051713.xu4BUyLe-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051713.xu4BUyLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051713.xu4BUyLe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/riscv64-linux-gnu/include/stdint.h:34,
                    from /usr/lib/gcc-cross/riscv64-linux-gnu/14/include/stdint.h:9,
                    from tools/testing/selftests/../../../tools/include/linux/types.h:7,
                    from ./../../../../include/nolibc/std.h:19,
                    from ./../../../../include/nolibc/nolibc.h:95,
                    from <command-line>:
>> /usr/riscv64-linux-gnu/include/bits/stdint-intn.h:27:19: error: conflicting types for 'int64_t'; have '__int64_t' {aka 'long int'}
      27 | typedef __int64_t int64_t;
         |                   ^~~~~~~
   In file included from ./../../../../include/nolibc/std.h:16:
   ./../../../../include/nolibc/stdint.h:17:29: note: previous declaration of 'int64_t' with type 'int64_t' {aka 'long long int'}
      17 | typedef   signed long long  int64_t;
         |                             ^~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/stdint.h:37:
>> /usr/riscv64-linux-gnu/include/bits/stdint-uintn.h:27:20: error: conflicting types for 'uint64_t'; have '__uint64_t' {aka 'long unsigned int'}
      27 | typedef __uint64_t uint64_t;
         |                    ^~~~~~~~
   ./../../../../include/nolibc/stdint.h:16:28: note: previous declaration of 'uint64_t' with type 'uint64_t' {aka 'long long unsigned int'}
      16 | typedef unsigned long long uint64_t;
         |                            ^~~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/stdint.h:41:
>> /usr/riscv64-linux-gnu/include/bits/stdint-least.h:28:25: error: conflicting types for 'int_least64_t'; have '__int_least64_t' {aka 'long int'}
      28 | typedef __int_least64_t int_least64_t;
         |                         ^~~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:30:23: note: previous declaration of 'int_least64_t' with type 'int_least64_t' {aka 'long long int'}
      30 | typedef  int64_t      int_least64_t;
         |                       ^~~~~~~~~~~~~
>> /usr/riscv64-linux-gnu/include/bits/stdint-least.h:34:26: error: conflicting types for 'uint_least64_t'; have '__uint_least64_t' {aka 'long unsigned int'}
      34 | typedef __uint_least64_t uint_least64_t;
         |                          ^~~~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:31:22: note: previous declaration of 'uint_least64_t' with type 'uint_least64_t' {aka 'long long unsigned int'}
      31 | typedef uint64_t     uint_least64_t;
         |                      ^~~~~~~~~~~~~~
>> /usr/riscv64-linux-gnu/include/stdint.h:51:33: error: conflicting types for 'int_fast64_t'; have 'long int'
      51 | typedef long int                int_fast64_t;
         |                                 ^~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:39:24: note: previous declaration of 'int_fast64_t' with type 'int_fast64_t' {aka 'long long int'}
      39 | typedef  int64_t       int_fast64_t;
         |                        ^~~~~~~~~~~~
>> /usr/riscv64-linux-gnu/include/stdint.h:64:33: error: conflicting types for 'uint_fast64_t'; have 'long unsigned int'
      64 | typedef unsigned long int       uint_fast64_t;
         |                                 ^~~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:40:23: note: previous declaration of 'uint_fast64_t' with type 'uint_fast64_t' {aka 'long long unsigned int'}
      40 | typedef uint64_t      uint_fast64_t;
         |                       ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
