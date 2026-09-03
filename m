Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D03314AC
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471436; cv=none; b=kGoCHFzWkRY1stwDQbsQjq/wRhvf12vwnS5tmGONF350DWivN2PZwhs3JPiqxGkrecv6Xiz9t5zNaeBsZ7MkWoPa2Jj8dLJGu7Xa1tyfrpv0+0s/Ncs+qpWQkIimcBEu7CDtv6qKuQ2AhjzKsBJYyKangZLbvVJTdkGiXivhGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471436; c=relaxed/simple;
	bh=hoYHZOJTWlF8W5cFWjBhoAZT7yXPxGYGzWVTcpainQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8eYDjmF04JDV4J4YI7pWEykiBPpRfaCfPulnn+0uu6BlcPstV6rCIzCwHFRD73XFPXqePxhSUi5bsBnmKWSlNfuvEc1WOcxjb/BwZw9PaVToYX0lnWfUW52KwT+1okbflyN3CeALgAtYGVDtaA7v1KVNEwtNnL8Wy7/yHEj8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1ftvXpG; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1ftvXpG"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66dbce0b639so238612d50.1
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788471430; x=1789076230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2oHokyuUqr9aaKyfx+3JA1pkurKLGkqddrOd0xIihZc=;
        b=d1ftvXpGus8eZfISBXPeQoBq1aKzUV4kojnhcS2QmWBE9q+ju/D76SRmyBeTd3ofI7
         aApyVuyVr7AH+/VU1lUhcd/RumCEZFl6zoPaaFcsikz1FNgbwY53VDjZOQjNb61kKHVQ
         WGF8OI+FHIDCrgqOFEvyBAfrcAkxvfNzFRVVaxoiy+29UHZcdAudsRq5fyIOrC0nLknF
         Swwz9SgSo5K+K6iNOEI76DSZWpo932vQLPuf+RTe4DivnsAHgDTDI408dLxSGiCJOc7X
         emKKy2HJ2hMEZ9IH57iAqzO2v6Sep5T7HPCFWwEES7xPX0PkKFPCqCfcTmpS2A+UnLrw
         vwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788471430; x=1789076230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oHokyuUqr9aaKyfx+3JA1pkurKLGkqddrOd0xIihZc=;
        b=a0ME9RNRIEqylbqY7uN/TS62IocQfo2DdGbsPqjXstyR9CUMfIE89C3m3dtRZLwQMH
         xANMrHsUQBBL8BdSe8WGTlgnsc6AzgQ7N6+1o0ixQQG3ak+FZYQIuEvDVnAl4xEXU5SU
         YWvXQzn2vmVG+Iql6IT+EwT2LRXEWu8DEtK65t/xwcXU/v29nAmLuoHVc5WLgZL+UmY3
         ZViHBGC7AGB0iWE4nVDdb20WWHHtWsR5b593UQym7bozZINVH7Jz+6EpUgtvaawoY3y0
         v8xtlxOswysP78wdKllXwt9mOBLA6gqZ7QCVM6o9oOKF2s/dUrA8xaeJzYsZ4G+iCw5C
         r4Og==
X-Gm-Message-State: AFuF++mfX+nCsT4fYdN6eN5nyLyVWRdBlpMllvKdqIKGZZewS8dmQbsc
	sh0ocn/EpTi4KqZFcr4GsSD+Uvdo12OJGUADzV3uvJ7HPPggsa8FkcOTpg23ViQA
X-Gm-Gg: AYBFou19ZPT+NsKJtgFDivYT2Q9I+sRm3RlCkR6S7uzeW7nNWpalphdCMN/DLQV5P/s
	ez3f1LjlDmmvyDD9XZZEeXFV4xP8yl2Vjwar35bGSxS+j6kduNz8RpkFduhkHk4bi3E0FIT55Lz
	wyG1iR9Y5bczNBmcJUQPd0WgcF2HvqxF3xez042wCdCm2LinbzHy7MJDcjWgCjtaZXbrpYxr3aY
	rfj7cfLumV3TJluspi1RBZqyXOIM/9UnrgDgTc55OObd2iepnMla1SIDHaCbodZQtqh2jQkZ0Rf
	BzGa48jjGWwYmNjbK0M1T7WfHnQeiS2ONEp4FNoGSqxVQJdSHjSWcCBP8bNi4J74Q/yf86PS47T
	ZPEbC2x6WfSqO9u/N3plvFrAOlH5Phr3LbHkSKa3nDAQDngOyQ5Thuol6DM2ZeRDMRG1wMKsxFt
	SJyiA5895kOXFi3wCSW2Tmc9Gw7nDi5eLaFSgZszO8LiBA3n3JOzxsvIuGmKDzFMyZxG9efUNmS
	BIAYhbxHzMnN1tS3dHgb5KpoEIFcbnX8ykBHT4127eUP38gNU+PwE3ZOPYbGqcD4fkHQovZeVqw
	0U1rLeb3YytODblMeqFBry3XToHBOgfkHsOX65ZkE9K8gi8=
X-Received: by 2002:a05:690e:4551:20b0:668:1c09:aef1 with SMTP id 956f58d0204a3-66fb58dc5bbmr531481d50.6.1788471430125;
        Thu, 03 Sep 2026 14:37:10 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714af5581bsm4939247b3.36.2026.09.03.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:37:09 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@linux.intel.com,
	shuah@kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] lib: hexdump: convert test to KUnit framework
Date: Thu,  3 Sep 2026 18:36:56 -0300
Message-ID: <20260903213656.57203-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old test_hexdump module used the traditional kernel printing
functions to verify hex dumping capabilities.

This patch converts the existing test into the modern KUnit framework
to allow standard automation, faster execution, and better integration
with Kselftest CI.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 lib/Kconfig.debug                       |  58 +++++++++++-
 lib/Makefile                            |   2 +-
 lib/{test_hexdump.c => hexdump_kunit.c} | 112 +++++++++++-------------
 3 files changed, 106 insertions(+), 66 deletions(-)
 rename lib/{test_hexdump.c => hexdump_kunit.c} (63%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44..2fe46673c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2277,6 +2277,7 @@ config CPUMASK_KUNIT_TEST
 	tristate "KUnit test for cpumask" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable to turn on cpumask tests, running at boot or module load time.
 
@@ -2289,6 +2290,7 @@ config TEST_LIST_SORT
 	tristate "Linked list sorting test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this to turn on 'list_sort()' function test. This test is
 	  executed only once during system boot (so affects only boot time),
@@ -2300,6 +2302,7 @@ config TEST_SORT
 	tristate "Array-based sort test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the self-test function of 'sort()' at boot,
 	  or at module load time.
@@ -2329,6 +2332,7 @@ config TEST_MULDIV64
 config TEST_IOV_ITER
 	tristate "Test iov_iter operation" if !KUNIT_ALL_TESTS
 	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	depends on MMU
 	default KUNIT_ALL_TESTS
 	help
@@ -2343,6 +2347,7 @@ config KPROBES_SANITY_TEST
 	depends on DEBUG_KERNEL
 	depends on KPROBES
 	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	select STACKTRACE if ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	default KUNIT_ALL_TESTS
 	help
@@ -2357,6 +2362,7 @@ config FPROBE_SANITY_TEST
 	depends on DEBUG_KERNEL
 	depends on FPROBE
 	depends on KUNIT=y
+	default KUNIT_ALL_TESTS
 	help
 	  This option will enable testing the fprobe when the system boot.
 	  A series of tests are made to verify that the fprobe is functioning
@@ -2444,13 +2450,16 @@ config ASYNC_RAID6_TEST
 
 	  If unsure, say N.
 
-config TEST_HEXDUMP
-	tristate "Test functions located in the hexdump module at runtime"
+config HEXDUMP_KUNIT_TEST
+	tristate "KUnit Test for the hexdump module at runtime" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
 
 config PRINTF_KUNIT_TEST
 	tristate "KUnit test printf() family of functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the printf functions at runtime.
 
@@ -2460,6 +2469,7 @@ config SCANF_KUNIT_TEST
 	tristate "KUnit test scanf() family of functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the scanf functions at runtime.
 
@@ -2469,6 +2479,7 @@ config SEQ_BUF_KUNIT_TEST
 	tristate "KUnit test for seq_buf" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for the seq_buf library.
 
@@ -2478,11 +2489,13 @@ config STRING_KUNIT_TEST
 	tristate "KUnit test string functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 
 config STRING_HELPERS_KUNIT_TEST
 	tristate "KUnit test string helpers at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 
 config STRING_KUNIT_BENCH
        bool "Benchmark string functions at runtime"
@@ -2499,6 +2512,7 @@ config FFS_KUNIT_TEST
 	tristate "KUnit test ffs-family functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds KUnit tests for ffs-family bit manipulation functions
 	  including ffs(), __ffs(), fls(), __fls(), fls64(), and __ffs64().
@@ -2545,6 +2559,7 @@ config TEST_MISC_MINOR
 	bool "miscdevice KUnit test" if !KUNIT_ALL_TESTS
 	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Kunit test for miscdevice API, specially its behavior in respect to
 	  static and dynamic minor numbers.
@@ -2693,6 +2708,7 @@ config BITOPS_KUNIT
 	tristate "KUnit test for bitops" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test for the bitops library
 	  which provides functions for bit operations.
@@ -2706,6 +2722,7 @@ config BITFIELD_KUNIT
 	tristate "KUnit test bitfield functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the bitfield functions at boot.
 
@@ -2723,6 +2740,7 @@ config CHECKSUM_KUNIT
 	tristate "KUnit test checksum functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the checksum functions at boot.
 
@@ -2740,6 +2758,7 @@ config UTIL_MACROS_KUNIT
 	tristate "KUnit test util_macros.h functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the util_macros.h function at boot.
 
@@ -2757,6 +2776,7 @@ config HASH_KUNIT_TEST
 	tristate "KUnit Test for integer hash functions" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the kernel's string (<linux/stringhash.h>), and
 	  integer (<linux/hash.h>) hash functions on boot.
@@ -2776,6 +2796,7 @@ config RESOURCE_KUNIT_TEST
 	tristate "KUnit test for resource API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	select GET_FREE_REGION
 	help
 	  This builds the resource API unit test.
@@ -2789,6 +2810,7 @@ config SYSCTL_KUNIT_TEST
 	tristate "KUnit test for sysctl" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the proc sysctl unit test, which runs on boot.
 	  Tests the API contract and implementation correctness of sysctl.
@@ -2801,6 +2823,7 @@ config KFIFO_KUNIT_TEST
 	tristate "KUnit Test for the generic kernel FIFO implementation" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the generic FIFO implementation KUnit test suite.
 	  It tests that the API and basic functionality of the kfifo type
@@ -2815,6 +2838,7 @@ config LIST_KUNIT_TEST
 	tristate "KUnit Test for Kernel Linked-list structures" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the linked list KUnit test suite.
 	  It tests that the API and basic functionality of the list_head type
@@ -2834,6 +2858,7 @@ config LIST_PRIVATE_KUNIT_TEST
 	tristate "KUnit Test for Kernel Private Linked-list structures" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the KUnit test for the private linked-list primitives
 	  defined in include/linux/list_private.h.
@@ -2848,6 +2873,7 @@ config HASHTABLE_KUNIT_TEST
 	tristate "KUnit Test for Kernel Hashtable structures" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the hashtable KUnit test suite.
 	  It tests the basic functionality of the API defined in
@@ -2860,6 +2886,7 @@ config HASHTABLE_KUNIT_TEST
 config LINEAR_RANGES_TEST
 	tristate "KUnit test for linear_ranges"
 	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	select LINEAR_RANGES
 	help
 	  This builds the linear_ranges unit test, which runs on boot.
@@ -2910,6 +2937,7 @@ config CMDLINE_KUNIT_TEST
 	tristate "KUnit test for cmdline API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the cmdline API unit test.
 	  Tests the logic of API provided by cmdline.c.
@@ -2922,6 +2950,7 @@ config BASE64_KUNIT
 	tristate "KUnit test for base64 decoding and encoding" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the base64 unit tests.
 
@@ -2939,6 +2968,7 @@ config BITS_TEST
 	tristate "KUnit test for bit functions and macros" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the bits unit test.
 	  Tests the logic of macros defined in bits.h.
@@ -2950,6 +2980,7 @@ config BITS_TEST
 config SHDI3_KUNIT_TEST
 	tristate "KUnit test for __ashldi3(), __ashrdi3(), and __lshrdi3()"
 	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	depends on ARM || XTENSA || MICROBLAZE || ((RISCV || SPARC) && !64BIT)
 	help
 	  This builds the unit test for __ashldi3(), __ashrdi3(), and
@@ -2973,6 +3004,7 @@ config RATIONAL_KUNIT_TEST
 	tristate "KUnit test for rational.c" if !KUNIT_ALL_TESTS
 	depends on KUNIT && RATIONAL
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the rational math unit test.
 	  For more information on KUnit and unit tests in general please refer
@@ -2984,6 +3016,7 @@ config MEMCPY_KUNIT_TEST
 	tristate "Test memcpy(), memmove(), and memset() functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for memcpy(), memmove(), and memset() functions.
 	  For more information on KUnit and unit tests in general please refer
@@ -2995,6 +3028,7 @@ config MIN_HEAP_KUNIT_TEST
 	tristate "Min heap test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test suite for the min heap library
 	  which provides functions for creating and managing min heaps.
@@ -3006,6 +3040,7 @@ config IS_SIGNED_TYPE_KUNIT_TEST
 	tristate "Test is_signed_type() macro" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for the is_signed_type() macro.
 
@@ -3018,6 +3053,7 @@ config OVERFLOW_KUNIT_TEST
 	tristate "Test check_*_overflow() functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for the check_*_overflow(), size_*(), allocation, and
 	  related functions.
@@ -3031,6 +3067,7 @@ config RANDSTRUCT_KUNIT_TEST
 	tristate "Test randstruct structure layout randomization at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for the checking CONFIG_RANDSTRUCT=y, which
 	  randomizes structure layouts.
@@ -3039,6 +3076,7 @@ config STACKINIT_KUNIT_TEST
 	tristate "Test level of stack variable initialization" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Test if the kernel is zero-initializing stack variables and
 	  padding. Coverage is controlled by compiler flags,
@@ -3048,6 +3086,7 @@ config FORTIFY_KUNIT_TEST
 	tristate "Test fortified str*() and mem*() function internals at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for checking internals of FORTIFY_SOURCE as used
 	  by the str*() and mem*() family of functions. For testing runtime
@@ -3056,6 +3095,7 @@ config FORTIFY_KUNIT_TEST
 config LONGEST_SYM_KUNIT_TEST
 	tristate "Test the longest symbol possible" if !KUNIT_ALL_TESTS
 	depends on KUNIT && KPROBES
+	default KUNIT_ALL_TESTS
 	depends on !CALL_PADDING && !CFI && !GCOV_KERNEL
 	default KUNIT_ALL_TESTS
 	help
@@ -3068,6 +3108,7 @@ config HW_BREAKPOINT_KUNIT_TEST
 	depends on HAVE_HW_BREAKPOINT
 	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Tests for hw_breakpoint constraints accounting.
 
@@ -3079,6 +3120,7 @@ config SIPHASH_KUNIT_TEST
 	tristate "Perform selftest on siphash functions" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the kernel's siphash (<linux/siphash.h>) hash
 	  functions on boot (or module load).
@@ -3090,6 +3132,7 @@ config USERCOPY_KUNIT_TEST
 	tristate "KUnit Test for user/kernel boundary protections"
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the "usercopy_kunit" module that runs sanity checks
 	  on the copy_to/from_user infrastructure, making sure basic
@@ -3100,6 +3143,7 @@ config BLACKHOLE_DEV_KUNIT_TEST
 	depends on NET
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the "blackhole_dev_kunit" module that validates the
 	  data path through this blackhole netdev.
@@ -3402,6 +3446,7 @@ config RATELIMIT_KUNIT_TEST
 	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This builds the "test_ratelimit" module that should be used
 	  for correctness verification and concurrent testings of rate
@@ -3413,6 +3458,7 @@ config UUID_KUNIT_TEST
 	tristate "KUnit test for UUID" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test suite for the uuid library,
 	  which provides functions for generating and parsing UUID and GUID.
@@ -3424,6 +3470,7 @@ config INT_POW_KUNIT_TEST
 	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test suite for the int_pow function,
 	  which performs integer exponentiation. The test suite is designed to
@@ -3440,6 +3487,7 @@ config INT_SQRT_KUNIT_TEST
 	tristate "Integer square root test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test suite for the int_sqrt() function,
 	  which performs square root calculation. The test suite checks
@@ -3454,6 +3502,7 @@ config INT_SQRT_KUNIT_TEST
 config INT_LOG_KUNIT_TEST
         tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
         depends on KUNIT
+	default KUNIT_ALL_TESTS
         default KUNIT_ALL_TESTS
         help
           This option enables the KUnit test suite for the int_log library, which
@@ -3466,6 +3515,7 @@ config GCD_KUNIT_TEST
 	tristate "Greatest common divisor test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test suite for the gcd() function,
 	  which computes the greatest common divisor of two numbers.
@@ -3478,6 +3528,7 @@ config GCD_KUNIT_TEST
 config POLYNOMIAL_KUNIT_TEST
 	tristate "Polynomial calculation (polynomial_calc) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	select POLYNOMIAL
 	default KUNIT_ALL_TESTS
 	help
@@ -3495,6 +3546,7 @@ config POLYNOMIAL_KUNIT_TEST
 config PRIME_NUMBERS_KUNIT_TEST
 	tristate "Prime number generator test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	depends on PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
 	help
@@ -3511,6 +3563,7 @@ config GLOB_KUNIT_TEST
 	depends on GLOB
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the glob functions at runtime.
 
@@ -3523,6 +3576,7 @@ config PRANDOM_KUNIT_TEST
 	tristate "KUnit test for prandom" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test the prandom functions at runtime.
 
diff --git a/lib/Makefile b/lib/Makefile
index dfab95832..9be4b42a6 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -61,7 +61,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 generic-radix-tree.o bitmap-str.o
 obj-y += string_helpers.o
 obj-y += hexdump.o
-obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
+obj-$(CONFIG_HEXDUMP_KUNIT_TEST) += hexdump_kunit.o
 obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
 obj-$(CONFIG_REGION_ALLOC_BENCHMARK) += region_alloc_benchmark.o
diff --git a/lib/test_hexdump.c b/lib/hexdump_kunit.c
similarity index 63%
rename from lib/test_hexdump.c
rename to lib/hexdump_kunit.c
index 751645645..199e05e77 100644
--- a/lib/test_hexdump.c
+++ b/lib/hexdump_kunit.c
@@ -1,11 +1,10 @@
 /*
- * Test cases for lib/hexdump.c module.
+ * KUnit test cases for lib/hexdump.c module.
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/init.h>
+#include <kunit/test.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/random.h>
 #include <linux/string.h>
 
@@ -18,55 +17,52 @@ static const unsigned char data_b[] = {
 
 static const unsigned char data_a[] = ".2.{....p..$}.4...1.....L...C...";
 
-static const char * const test_data_1[] __initconst = {
+static const char * const test_data_1[] = {
 	"be", "32", "db", "7b", "0a", "18", "93", "b2",
 	"70", "ba", "c4", "24", "7d", "83", "34", "9b",
 	"a6", "9c", "31", "ad", "9c", "0f", "ac", "e9",
 	"4c", "d1", "19", "99", "43", "b1", "af", "0c",
 };
 
-static const char * const test_data_2_le[] __initconst = {
+static const char * const test_data_2_le[] = {
 	"32be", "7bdb", "180a", "b293",
 	"ba70", "24c4", "837d", "9b34",
 	"9ca6", "ad31", "0f9c", "e9ac",
 	"d14c", "9919", "b143", "0caf",
 };
 
-static const char * const test_data_2_be[] __initconst = {
+static const char * const test_data_2_be[] = {
 	"be32", "db7b", "0a18", "93b2",
 	"70ba", "c424", "7d83", "349b",
 	"a69c", "31ad", "9c0f", "ace9",
 	"4cd1", "1999", "43b1", "af0c",
 };
 
-static const char * const test_data_4_le[] __initconst = {
+static const char * const test_data_4_le[] = {
 	"7bdb32be", "b293180a", "24c4ba70", "9b34837d",
 	"ad319ca6", "e9ac0f9c", "9919d14c", "0cafb143",
 };
 
-static const char * const test_data_4_be[] __initconst = {
+static const char * const test_data_4_be[] = {
 	"be32db7b", "0a1893b2", "70bac424", "7d83349b",
 	"a69c31ad", "9c0face9", "4cd11999", "43b1af0c",
 };
 
-static const char * const test_data_8_le[] __initconst = {
+static const char * const test_data_8_le[] = {
 	"b293180a7bdb32be", "9b34837d24c4ba70",
 	"e9ac0f9cad319ca6", "0cafb1439919d14c",
 };
 
-static const char * const test_data_8_be[] __initconst = {
+static const char * const test_data_8_be[] = {
 	"be32db7b0a1893b2", "70bac4247d83349b",
 	"a69c31ad9c0face9", "4cd1199943b1af0c",
 };
 
 #define FILL_CHAR	'#'
 
-static unsigned total_tests __initdata;
-static unsigned failed_tests __initdata;
-
-static void __init test_hexdump_prepare_test(size_t len, int rowsize,
-					     int groupsize, char *test,
-					     size_t testlen, bool ascii)
+static void test_hexdump_prepare_test(size_t len, int rowsize,
+				      int groupsize, char *test,
+				      size_t testlen, bool ascii)
 {
 	char *p;
 	const char * const *result;
@@ -122,14 +118,12 @@ static void __init test_hexdump_prepare_test(size_t len, int rowsize,
 
 #define TEST_HEXDUMP_BUF_SIZE		(32 * 3 + 2 + 32 + 1)
 
-static void __init test_hexdump(size_t len, int rowsize, int groupsize,
-				bool ascii)
+static void test_hexdump(struct kunit *test_ctx, size_t len, int rowsize,
+			 int groupsize, bool ascii)
 {
 	char test[TEST_HEXDUMP_BUF_SIZE];
 	char real[TEST_HEXDUMP_BUF_SIZE];
 
-	total_tests++;
-
 	memset(real, FILL_CHAR, sizeof(real));
 	hex_dump_to_buffer(data_b, len, rowsize, groupsize, real, sizeof(real),
 			   ascii);
@@ -139,27 +133,24 @@ static void __init test_hexdump(size_t len, int rowsize, int groupsize,
 				  ascii);
 
 	if (memcmp(test, real, TEST_HEXDUMP_BUF_SIZE)) {
-		pr_err("Len: %zu row: %d group: %d\n", len, rowsize, groupsize);
-		pr_err("Result: '%s'\n", real);
-		pr_err("Expect: '%s'\n", test);
-		failed_tests++;
+		KUNIT_FAIL(test_ctx, "Len: %zu row: %d group: %d\nResult: '%s'\nExpect: '%s'\n",
+			   len, rowsize, groupsize, real, test);
 	}
 }
 
-static void __init test_hexdump_set(int rowsize, bool ascii)
+static void test_hexdump_set(struct kunit *test_ctx, int rowsize, bool ascii)
 {
 	size_t d = min_t(size_t, sizeof(data_b), rowsize);
 	size_t len = get_random_u32_inclusive(1, d);
 
-	test_hexdump(len, rowsize, 4, ascii);
-	test_hexdump(len, rowsize, 2, ascii);
-	test_hexdump(len, rowsize, 8, ascii);
-	test_hexdump(len, rowsize, 1, ascii);
+	test_hexdump(test_ctx, len, rowsize, 4, ascii);
+	test_hexdump(test_ctx, len, rowsize, 2, ascii);
+	test_hexdump(test_ctx, len, rowsize, 8, ascii);
+	test_hexdump(test_ctx, len, rowsize, 1, ascii);
 }
 
-static void __init test_hexdump_overflow(size_t buflen, size_t len,
-					 int rowsize, int groupsize,
-					 bool ascii)
+static void test_hexdump_overflow(struct kunit *test_ctx, size_t buflen, size_t len,
+				  int rowsize, int groupsize, bool ascii)
 {
 	char test[TEST_HEXDUMP_BUF_SIZE];
 	char buf[TEST_HEXDUMP_BUF_SIZE];
@@ -167,16 +158,10 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 	int ae, he, e, f, r;
 	bool a;
 
-	total_tests++;
-
 	memset(buf, FILL_CHAR, sizeof(buf));
 
 	r = hex_dump_to_buffer(data_b, len, rs, gs, buf, buflen, ascii);
 
-	/*
-	 * Caller must provide the data length multiple of groupsize. The
-	 * calculations below are made with that assumption in mind.
-	 */
 	ae = rs * 2 /* hex */ + rs / gs /* spaces */ + 1 /* space */ + len /* ascii */;
 	he = (gs * 2 /* hex */ + 1 /* space */) * len / gs - 1 /* no trailing space */;
 
@@ -197,15 +182,12 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 	buf[sizeof(buf) - 1] = '\0';
 
 	if (!a) {
-		pr_err("Len: %zu buflen: %zu strlen: %zu\n",
-			len, buflen, strnlen(buf, sizeof(buf)));
-		pr_err("Result: %d '%s'\n", r, buf);
-		pr_err("Expect: %d '%s'\n", e, test);
-		failed_tests++;
+		KUNIT_FAIL(test_ctx, "Len: %zu buflen: %zu strlen: %zu\nResult: %d '%s'\nExpect: %d '%s'\n",
+			   len, buflen, strnlen(buf, sizeof(buf)), r, buf, e, test);
 	}
 }
 
-static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
+static void test_hexdump_overflow_set(struct kunit *test_ctx, size_t buflen, bool ascii)
 {
 	unsigned int i = 0;
 	int rs = get_random_u32_inclusive(1, 2) * 16;
@@ -214,44 +196,48 @@ static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
 		int gs = 1 << i;
 		size_t len = get_random_u32_below(rs) + gs;
 
-		test_hexdump_overflow(buflen, rounddown(len, gs), rs, gs, ascii);
+		test_hexdump_overflow(test_ctx, buflen, rounddown(len, gs), rs, gs, ascii);
 	} while (i++ < 3);
 }
 
-static int __init test_hexdump_init(void)
+static void hexdump_test_normal(struct kunit *test)
 {
 	unsigned int i;
 	int rowsize;
 
 	rowsize = get_random_u32_inclusive(1, 2) * 16;
 	for (i = 0; i < 16; i++)
-		test_hexdump_set(rowsize, false);
+		test_hexdump_set(test, rowsize, false);
 
 	rowsize = get_random_u32_inclusive(1, 2) * 16;
 	for (i = 0; i < 16; i++)
-		test_hexdump_set(rowsize, true);
+		test_hexdump_set(test, rowsize, true);
+}
 
+static void hexdump_test_overflow(struct kunit *test)
+{
+	unsigned int i;
+	
 	for (i = 0; i <= TEST_HEXDUMP_BUF_SIZE; i++)
-		test_hexdump_overflow_set(i, false);
+		test_hexdump_overflow_set(test, i, false);
 
 	for (i = 0; i <= TEST_HEXDUMP_BUF_SIZE; i++)
-		test_hexdump_overflow_set(i, true);
+		test_hexdump_overflow_set(test, i, true);
+}
 
-	if (failed_tests == 0)
-		pr_info("all %u tests passed\n", total_tests);
-	else
-		pr_err("failed %u out of %u tests\n", failed_tests, total_tests);
+static struct kunit_case hexdump_test_cases[] = {
+	KUNIT_CASE(hexdump_test_normal),
+	KUNIT_CASE(hexdump_test_overflow),
+	{}
+};
 
-	return failed_tests ? -EINVAL : 0;
-}
-module_init(test_hexdump_init);
+static struct kunit_suite hexdump_test_suite = {
+	.name = "hexdump",
+	.test_cases = hexdump_test_cases,
+};
 
-static void __exit test_hexdump_exit(void)
-{
-	/* do nothing */
-}
-module_exit(test_hexdump_exit);
+kunit_test_suite(hexdump_test_suite);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
-MODULE_DESCRIPTION("Test cases for lib/hexdump.c module");
+MODULE_DESCRIPTION("KUnit Test cases for lib/hexdump.c module");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.47.3

