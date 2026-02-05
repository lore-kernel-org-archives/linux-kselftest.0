Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFCC33858E;
	Thu,  5 Feb 2026 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770330575; cv=none; b=YZlwolskqVfjdm7E3VXtZP/jwed+iY/L6dHOfV7TM2oiH7t79I6sLjsICE0At09HcIgm2wnYVgR5FDSXnAS0kiZ9BVyTXIfD2DX7UXq0Qj4PTBezrdYyKFkiOubixKknZvl2/v5L9Tza7KOvjS9Q8usUe4Y2DKbRKNZq3H3MQXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770330575; c=relaxed/simple;
	bh=Gi08Nbv5cVRIhHReyEZSJ0dvSTdVq7KZn6HMaKkEVcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmI9HRO+F0eAxAzMdq1i+vK3iX5wnrjN3rgZVTvD236ivBwP36M2bwdz3FSoJ9MkChZqiLuD3IF5Ox2k44PQX0ZD8u4b780x3pIWsIg3ixIKpjiUCPGI2lvpFLPeW6uX6RJdVmaDJGTkOPnBNOCj9UZVp+fAQEyckvk4Cf4UB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3Kvh/29; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3Kvh/29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770330576; x=1801866576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gi08Nbv5cVRIhHReyEZSJ0dvSTdVq7KZn6HMaKkEVcM=;
  b=O3Kvh/29THq44lBeFR64z7rFIGYHD/2mNGwKmwGb0MQvplC6igqY4luG
   DyXilnqk+G8QPJufp6T+/jYBgb6viSc2Rybw3ZWXJC90NltW01krZ9W+O
   YTdj/0ogDxnuEvtWB+nUMVKJzzdS7rKKVRx1gMZQYewICzFJWUWjZNpJJ
   GxgvZB8PRF0hkxOsmytYJ0ykLVKtRjg1BFnY0o5+0KAsVPMUV/xSAIEfq
   pdjlI/YYwXSnbM02V6IDbyZ0L36xhfcO7vnNUtw8Pm28cFPSlbRfN7Ehq
   mMQOd7+OR7iHalE8l1hdBQNxPI1FT5FSxufIV777fDpSQJDe2FcFTF7tH
   w==;
X-CSE-ConnectionGUID: JLVhbc4bSbSv6QqIdFv9Vg==
X-CSE-MsgGUID: xBVMPsCkQPOzYGQQGAfpHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="96994436"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="96994436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:29:35 -0800
X-CSE-ConnectionGUID: vdvaVKvRQxedRM/17c8TzQ==
X-CSE-MsgGUID: DGIBCsElTc+KW58SYoSKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210482171"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2026 14:29:29 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo7qp-000000004F7-03nV;
	Thu, 05 Feb 2026 22:29:27 +0000
Date: Thu, 5 Feb 2026 23:29:20 +0100
From: kernel test robot <lkp@intel.com>
To: Yuwen Chen <ywen.chen@foxmail.com>, tglx@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ywen.chen@foxmail.com,
	akpm@linux-foundation.org, andrealmeid@igalia.com,
	bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
	dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
	kernel-team@android.com, licayy@foxmail.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	luto@mit.edu, mingo@redhat.com, morbo@google.com, nathan@kernel.org,
	ndesaulniers@google.com, peterz@infradead.org, shuah@kernel.org,
	usama.anjum@collabora.com, wakel@google.com
Subject: Re: [PATCH] selftests/futex: fix incorrect result reporting of
 futex_wait test item
Message-ID: <202602052333.1Bhrssu1-lkp@intel.com>
References: <tencent_7D6D776D157570FF8C9FB9DE9D9FE5257C0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_7D6D776D157570FF8C9FB9DE9D9FE5257C0A@qq.com>

Hi Yuwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuwen-Chen/selftests-futex-fix-incorrect-result-reporting-of-futex_wait-test-item/20260205-110734
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/tencent_7D6D776D157570FF8C9FB9DE9D9FE5257C0A%40qq.com
patch subject: [PATCH] selftests/futex: fix incorrect result reporting of futex_wait test item
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260205/202602052333.1Bhrssu1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602052333.1Bhrssu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602052333.1Bhrssu1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from futex_wait.c:8:
   /usr/include/pthread.h:698:6: error: 'regparm' is not valid on this platform
     698 |      __cleanup_fct_attribute;
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   /usr/include/bits/pthreadtypes-arch.h:52:50: note: expanded from macro '__cleanup_fct_attribute'
      52 | # define __cleanup_fct_attribute __attribute__ ((__regparm__ (1)))
         |                                                  ^            ~
   In file included from futex_wait.c:8:
   /usr/include/pthread.h:710:3: error: 'regparm' is not valid on this platform
     710 |   __cleanup_fct_attribute;
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   /usr/include/bits/pthreadtypes-arch.h:52:50: note: expanded from macro '__cleanup_fct_attribute'
      52 | # define __cleanup_fct_attribute __attribute__ ((__regparm__ (1)))
         |                                                  ^            ~
   In file included from futex_wait.c:8:
   /usr/include/pthread.h:733:6: error: 'regparm' is not valid on this platform
     733 |      __cleanup_fct_attribute;
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   /usr/include/bits/pthreadtypes-arch.h:52:50: note: expanded from macro '__cleanup_fct_attribute'
      52 | # define __cleanup_fct_attribute __attribute__ ((__regparm__ (1)))
         |                                                  ^            ~
   In file included from futex_wait.c:8:
   /usr/include/pthread.h:746:3: error: 'regparm' is not valid on this platform
     746 |   __cleanup_fct_attribute;
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   /usr/include/bits/pthreadtypes-arch.h:52:50: note: expanded from macro '__cleanup_fct_attribute'
      52 | # define __cleanup_fct_attribute __attribute__ ((__regparm__ (1)))
         |                                                  ^            ~
   In file included from futex_wait.c:8:
   /usr/include/pthread.h:751:6: error: 'regparm' is not valid on this platform
     751 |      __cleanup_fct_attribute __attribute__ ((__noreturn__))
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   /usr/include/bits/pthreadtypes-arch.h:52:50: note: expanded from macro '__cleanup_fct_attribute'
      52 | # define __cleanup_fct_attribute __attribute__ ((__regparm__ (1)))
         |                                                  ^            ~
   In file included from futex_wait.c:14:
   In file included from ../../kselftest_harness.h:63:
   In file included from /usr/include/stdio.h:437:
   /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
>> futex_wait.c:48:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:767:21: note: expanded from macro '__EXPECT'
     766 |                         __TH_LOG("Expected %s (%ju) %s %s (%ju)", \
         |                                                ~~~
     767 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:768:17: note: expanded from macro '__EXPECT'
     766 |                         __TH_LOG("Expected %s (%ju) %s %s (%ju)", \
         |                                                            ~~~
     767 |                                  _expected_str, __exp_print, #_t, \
     768 |                                  _seen_str, __seen_print); \
         |                                             ^~~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:775:21: note: expanded from macro '__EXPECT'
     774 |                         __TH_LOG("Expected %s (%ju) %s %s (%jd)", \
         |                                                ~~~
     775 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'intmax_t' (aka 'long') but the argument has type 'intmax_t' (aka 'long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:776:17: note: expanded from macro '__EXPECT'
     774 |                         __TH_LOG("Expected %s (%ju) %s %s (%jd)", \
         |                                                            ~~~
     775 |                                  _expected_str, __exp_print, #_t, \
     776 |                                  _seen_str, __seen_print); \
         |                                             ^~~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'intmax_t' (aka 'long') but the argument has type 'intmax_t' (aka 'long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:783:21: note: expanded from macro '__EXPECT'
     782 |                         __TH_LOG("Expected %s (%jd) %s %s (%ju)", \
         |                                                ~~~
     783 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:784:17: note: expanded from macro '__EXPECT'
     782 |                         __TH_LOG("Expected %s (%jd) %s %s (%ju)", \
         |                                                            ~~~
     783 |                                  _expected_str, __exp_print, #_t, \
     784 |                                  _seen_str, __seen_print); \
         |                                             ^~~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'intmax_t' (aka 'long') but the argument has type 'intmax_t' (aka 'long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:791:21: note: expanded from macro '__EXPECT'
     790 |                         __TH_LOG("Expected %s (%jd) %s %s (%jd)", \
         |                                                ~~~
     791 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
>> futex_wait.c:48:2: warning: format specifies type 'intmax_t' (aka 'long') but the argument has type 'intmax_t' (aka 'long long') [-Wformat]
      48 |         ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:513:2: note: expanded from macro 'ASSERT_EQ'
     513 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:792:17: note: expanded from macro '__EXPECT'
     790 |                         __TH_LOG("Expected %s (%jd) %s %s (%jd)", \
         |                                                            ~~~
     791 |                                  _expected_str, __exp_print, #_t, \
     792 |                                  _seen_str, __seen_print); \
         |                                             ^~~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   futex_wait.c:52:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      52 |         EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:631:2: note: expanded from macro 'EXPECT_EQ'
     631 |         __EXPECT(expected, #expected, seen, #seen, ==, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:767:21: note: expanded from macro '__EXPECT'
     766 |                         __TH_LOG("Expected %s (%ju) %s %s (%ju)", \
         |                                                ~~~
     767 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   futex_wait.c:52:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      52 |         EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:631:2: note: expanded from macro 'EXPECT_EQ'
     631 |         __EXPECT(expected, #expected, seen, #seen, ==, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:768:17: note: expanded from macro '__EXPECT'
     766 |                         __TH_LOG("Expected %s (%ju) %s %s (%ju)", \
         |                                                            ~~~
     767 |                                  _expected_str, __exp_print, #_t, \
     768 |                                  _seen_str, __seen_print); \
         |                                             ^~~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   futex_wait.c:52:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      52 |         EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:631:2: note: expanded from macro 'EXPECT_EQ'
     631 |         __EXPECT(expected, #expected, seen, #seen, ==, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:775:21: note: expanded from macro '__EXPECT'
     774 |                         __TH_LOG("Expected %s (%ju) %s %s (%jd)", \
         |                                                ~~~
     775 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   futex_wait.c:52:2: warning: format specifies type 'intmax_t' (aka 'long') but the argument has type 'intmax_t' (aka 'long long') [-Wformat]
      52 |         EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:631:2: note: expanded from macro 'EXPECT_EQ'
     631 |         __EXPECT(expected, #expected, seen, #seen, ==, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:776:17: note: expanded from macro '__EXPECT'
     774 |                         __TH_LOG("Expected %s (%ju) %s %s (%jd)", \
         |                                                            ~~~
     775 |                                  _expected_str, __exp_print, #_t, \
     776 |                                  _seen_str, __seen_print); \
         |                                             ^~~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   futex_wait.c:52:2: warning: format specifies type 'intmax_t' (aka 'long') but the argument has type 'intmax_t' (aka 'long long') [-Wformat]
      52 |         EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:631:2: note: expanded from macro 'EXPECT_EQ'
     631 |         __EXPECT(expected, #expected, seen, #seen, ==, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../../kselftest_harness.h:783:21: note: expanded from macro '__EXPECT'
     782 |                         __TH_LOG("Expected %s (%jd) %s %s (%ju)", \
         |                                                ~~~
     783 |                                  _expected_str, __exp_print, #_t, \
         |                                                 ^~~~~~~~~~~
   ../../kselftest_harness.h:108:43: note: expanded from macro '__TH_LOG'
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                                      ~~~
     108 |                         __FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   futex_wait.c:52:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
      52 |         EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
