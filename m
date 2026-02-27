Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA02749E6
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185230; cv=none; b=sSa4Lqh+fUkddiJhl1HulrsuLBiK/fDMwPNlRYQH/mJ/x7RM5SFMTZKqvHHEhU4XwtB29yQ5mP5BCK1JMx5VF5IwB21Mm/LmitLuE2sCn8rem4rJeeqF1QD8lq68P6OStfLYaWnpMF0Fr3oBYQx5I3dlduCiijxmswKmVVQiJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185230; c=relaxed/simple;
	bh=QkBWiooC1iGMjVCCrdVa2VHFvlpy1PhZI8x/Z4bbZQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbBcb84D3D0G7V38bBqhCpFj5EzdPcRtlyBQHQeQXm1tTnDOt2Knu05Uls0M9f+S1lxzvFTQZE4gISbNV7W6R4TVYZP6r5oE3DA2fewTedIxI9JoxT/oFZtFSQstve1ESmxKoLxMAQ7plcYIOkL4+8hq3Tx/0JJqiHoSrj1PX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZrkkiOZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZrkkiOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772185229; x=1803721229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QkBWiooC1iGMjVCCrdVa2VHFvlpy1PhZI8x/Z4bbZQ4=;
  b=gZrkkiOZxYNstlYEqm6U0Q1LWE7zxBL5jiGNhmsDzHE2u6rso99mAmVF
   hpQovV415RKDNzP492Y16BEbScPyDJum0vpnh7UaHo8Oo5U2R4LVJyTbh
   xzH4wnWEOn92duB1Wjafz32BCz+BFGJj/IBn072YKUKwrPDNYDT153KMX
   SgWZ2R8epUgkIQW9PmR0CAMWlAKbaui13Rbc1xhK68s0O9GKjlVCRDaEj
   Fs5cFCAmAdy0e2ROJ1qDxiPwYGirtQwrDEjV2qFjKvd5mfT5RkKmgaDEO
   WYgP5dBfLpw1vPJ5Msp4MUXW+AyGX9NEMZI/ml0UrBmzKB6V47vj33Lh5
   A==;
X-CSE-ConnectionGUID: oU/hjF4OSSCbYRLxHDCr3w==
X-CSE-MsgGUID: TdP5SpBeSRmIR8gY87wBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73137413"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73137413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:40:28 -0800
X-CSE-ConnectionGUID: g2g9AMkqS2+fJS1ngQ0r8w==
X-CSE-MsgGUID: kNU/WvnEQr+7vOkjeaBYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="213735592"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.65])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:40:26 -0800
Date: Fri, 27 Feb 2026 11:40:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: serious bugs in KUnit framework makes test completely useless
Message-ID: <aaFmiAmg9S18EANA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo


Hi!

I have stumbled over the kunit framework issues that make the respective test
cases useless.

Now to the details.
Consider having today's Linux Next.

Scenario 1 (good):

I run

	./tools/testing/kunit/kunit.py config
	./tools/testing/kunit/kunit.py run printf

Everything works as expected:

  [10:19:36] Testing complete. Ran 28 tests: passed: 28
  [10:19:36] Elapsed time: 15.929s total, 0.001s configuring, 15.761s building, 0.114s running


Scenario 2 (BAD):

I applied the following change:

--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/stdarg.h>
+#include <linux/bitops.h>
 #include <linux/build_bug.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -2904,12 +2889,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
 
 		case FORMAT_STATE_NUM: {
 			unsigned long long num;
+			u8 shift = fmt.size * 8 - 1;
 
 			if (fmt.size > sizeof(int))
 				num = va_arg(args, long long);
 			else
-				num = convert_num_spec(va_arg(args, int), fmt.size, spec);
-			str = number(str, end, num, spec);
+				num = va_arg(args, int);
+			num = sign_extend64(num, shift);
+			if (spec.flags & SIGN)
+				str = number(str, end, num, spec);
+			else
+				str = number(str, end, -(long long)num, spec);
 			continue;
 		}
 

Tests went into cosmos (I waited a few minutes and has to interrupt that):

  ^CERROR:root:Build interruption occurred. Cleaning console.
  ^CERROR:root:Build interruption occurred. Cleaning console.
  ^CERROR:root:Build interruption occurred. Cleaning console.
  Command '['.kunit/linux', 'kunit.filter_glob=printf', 'kunit.enable=1', 'mem=1G', 'console=tty', 'kunit_shutdown=halt']' timed out after 300 seconds
  [10:29:52] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
  [10:29:52] ============================================================
  [10:29:52] Testing complete. Ran 0 tests: errors: 1
  [10:29:52] Elapsed time: 305.676s total, 0.001s configuring, 5.669s building, 300.006s running

NOTE!
Independently on how long I waited the Elapsed time is about 5 minutes
(Seems 300 seconds limit as stated in the output).


Scenario 3 (BAD):

Now I took again a clean tree and applied this change:

--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/stdarg.h>
+#include <linux/bitops.h>
 #include <linux/build_bug.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -2904,11 +2889,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
 
 		case FORMAT_STATE_NUM: {
 			unsigned long long num;
+			u8 shift = fmt.size * 8 - 1;
 
 			if (fmt.size > sizeof(int))
 				num = va_arg(args, long long);
+			else {
+				num = va_arg(args, int);
+			if ((spec.flags & SIGN))
+				num = sign_extend64(num, shift);
 			else
-				num = convert_num_spec(va_arg(args, int), fmt.size, spec);
+				num &= ~(BIT_ULL(shift) - 1);
+			}
 			str = number(str, end, num, spec);
 			continue;
 		}

and run tests again.

  [10:39:16] [ERROR] Test: <missing>: Could not find any KTAP output. Did any KUnit tests run?
  [10:39:16] ============================================================
  [10:39:16] Testing complete. Ran 0 tests: errors: 1
  [10:39:16] Elapsed time: 5.762s total, 0.001s configuring, 5.694s building, 0.067s running

it runs fast and completely useless. (There is no build error)

...

Please, fix this as it is a serious issue and really makes kunit useless.

-- 
With Best Regards,
Andy Shevchenko


