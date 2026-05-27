Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27143CFF6C;
	Wed, 27 May 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869636; cv=none; b=lm1pYdhXIHG6DMDaT8G+zczlvLwhC/a/QUKMbutSzAe6XDxRv+pVngknpF4nCTxGzKZV6xk1YDHv5ho4CcWulDJdyeiK9n1IfBOSeJiSkVFDh6t/WbWxjIG4o1fwhqal5nf4VyCz/gvZRBSuF6gHaYnOtExAp2jPCz+gpDwjL8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869636; c=relaxed/simple;
	bh=UTmQoTc5WePV9S4uxX1i1JkC28loiGOMmMYcjdZU+bU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oO++Yt/8uWMwA5JUVLea/bAhdWcyKu5nt6fLYko+VZiXKVnMEH+i9tqVxxVQodj8YewndrpDTMC+eBpg3NPBjA+61WSps3BXTJVFmQ1EM2hkk6Bx19Y/Wmw94uTfAtjsAZzcI/zadOGpBfuYl9KtKVqZ9Lf2MBvSNX3jKh2iI84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A192gthI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A192gthI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779869634; x=1811405634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UTmQoTc5WePV9S4uxX1i1JkC28loiGOMmMYcjdZU+bU=;
  b=A192gthIbBu6Lrh9IOLo5rIFHeHvlGNmI59ADfJICbcLS2ss5HJFoC7o
   6Y8IpzEL87GxHZoY1axzT2joqCnLpl966PMsZMbXInjogYSf9Xdo2XTmt
   uMT7RUlfe3MZWrg1K6pgWL52/6v2G184vW4ORJ+KfFTIULVldI9xsWhHC
   rgcEaP0Uj3AZXispvRW6nXSgFW7uEpo1gFtlCKD0DYbdh+/+ZVIFOzjAE
   VWy2tjOMmhxcpuPxvXyh2Cd2ISNYWnd2JvpwztXauALi+kP66LOD77WIE
   FNm05IKhm7q9pz8tI9i2SBPklhWUH3iTihtZsdQwrhyyWgV3n9jV5c1pF
   Q==;
X-CSE-ConnectionGUID: hbyGh124TTODgUyUg+33jA==
X-CSE-MsgGUID: DC9f7S+XS4m/fA15AAKFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80751991"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80751991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:13:54 -0700
X-CSE-ConnectionGUID: y7LgZ+qiT8qQ3GvaMfch6A==
X-CSE-MsgGUID: v0GJiduvTQKPY2pp2e3I2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246432689"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2026 01:13:52 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: ilpo.jarvinen@linux.intel.com,
	reinette.chatre@intel.com
Cc: linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghua.yu@intel.com,
	Chen Yu <yu.c.chen@intel.com>
Subject: Re: [PATCH RFC v1 0/2] kselftest/resctrl: CAT functional tests
Date: Wed, 27 May 2026 16:04:36 +0800
Message-Id: <20260527080000.1234-1-yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616082453.3725-1-ilpo.jarvinen@linux.intel.com>
References: <20250616082453.3725-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Reinette, Ilpo,

On Fri, Jun 27, 2025, Reinette Chatre wrote:
> I agree that the test self will know best what went wrong. Tests can still
> use ksft_print_msg() for informational text.
>
> Doing something like:
>
> 	cat_ctrlgrp_msr_test() {
> 		...
> 		if (!msr_access_supported(uparams->cpu)) {
> 			ksft_print_msg("MSR access not supported\n");
> 			return KSFT_SKIP;
> 		...
> 	}
>
>
> 	run_single_test() {
> 		...
> 		ret = test->run_test(test, uparams);
> 		ksft_test_result_report(ret, "%s: test\n", test->name);
> 		...
> 	}
>
> Can result in output like:
> # MSR access not supported
> ok X SKIP CAT_GROUP_MASK: test
>
> As I understand this will keep accurate test counts and the user output
> seems intuitive enough to understand why a test may have been skipped.

I suppose what you are suggesting is like below. I did a test with this
adjustment applied on top of this patch set, and it works for me:

[root@dmr-301 chenyu]# ./resctrl_tests -t CAT_GROUP_TASKS
TAP version 13
# Pass: Check kernel supports resctrl filesystem
# Pass: Check resctrl mountpoint "/sys/fs/resctrl" exists
# resctrl filesystem not mounted
# dmesg: [   43.705792] resctrl: L3 allocation detected
# dmesg: [   43.712878] resctrl: L2 allocation detected
# dmesg: [   43.719856] resctrl: MB allocation detected
# dmesg: [   43.726800] resctrl: L3 monitoring detected
1..1
# Starting CAT_GROUP_TASKS test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Writing benchmark parameters to resctrl FS
# Writing benchmark parameters to resctrl FS
ok 1 CAT_GROUP_TASKS: test
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

[root@dmr-301 chenyu]# ./resctrl_tests -t CAT_GROUP_MASK
TAP version 13
# Pass: Check kernel supports resctrl filesystem
# Pass: Check resctrl mountpoint "/sys/fs/resctrl" exists
# resctrl filesystem not mounted
# dmesg: [   43.705792] resctrl: L3 allocation detected
# dmesg: [   43.712878] resctrl: L2 allocation detected
# dmesg: [   43.719856] resctrl: MB allocation detected
# dmesg: [   43.726800] resctrl: L3 monitoring detected
1..1
# Starting CAT_GROUP_MASK test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Placing task to ctrlgrp 'c1'
# Writing benchmark parameters to resctrl FS
# Write schema "L3:0=3" to resctrl FS
# Placing task to ctrlgrp 'c2'
# Writing benchmark parameters to resctrl FS
# Write schema "L3:0=6" to resctrl FS
# Adjusting CBM for unrelated ctrlgrp 'c1'
# Write schema "L3:0=c" to resctrl FS
# Adjusting CBM for ctrlgrp 'c2'
# Write schema "L3:0=3" to resctrl FS
# Placing task to ctrlgrp 'c1'
# Writing benchmark parameters to resctrl FS
ok 1 CAT_GROUP_MASK: test
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

---
diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 76791312da76..5718ecf3b35d 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -399,7 +399,7 @@ static int cat_ctrlgrp_tasks_test(const struct resctrl_test *test,
 		return ret;
 	if (!ret) {
 		ksft_print_msg("PID not found in the root group\n");
-		return 1;
+		return KSFT_FAIL;
 	}
 
 	/* Taskset benchmark to specified CPU */
@@ -411,7 +411,7 @@ static int cat_ctrlgrp_tasks_test(const struct resctrl_test *test,
 		goto reset_affinity;
 	if (!ret) {
 		ksft_print_msg("PID not found in the root group\n");
-		ret = 1;
+		ret = KSFT_FAIL;
 		goto reset_affinity;
 	}
 
@@ -423,7 +423,7 @@ static int cat_ctrlgrp_tasks_test(const struct resctrl_test *test,
 		goto reset_affinity;
 	if (!ret) {
 		ksft_print_msg("PID not found in the control group\n");
-		ret = 1;
+		ret = KSFT_FAIL;
 		goto reset_affinity;
 	}
 	ret = resctrl_grp_has_task(NULL, bm_pid);
@@ -431,7 +431,7 @@ static int cat_ctrlgrp_tasks_test(const struct resctrl_test *test,
 		goto reset_affinity;
 	if (ret) {
 		ksft_print_msg("PID duplicate remains in the root group\n");
-		ret = 1;
+		ret = KSFT_FAIL;
 		goto reset_affinity;
 	}
 
@@ -443,7 +443,7 @@ static int cat_ctrlgrp_tasks_test(const struct resctrl_test *test,
 		goto reset_affinity;
 	if (!ret) {
 		ksft_print_msg("PID not found in the new control group\n");
-		ret = 1;
+		ret = KSFT_FAIL;
 		goto reset_affinity;
 	}
 	ret = resctrl_grp_has_task("c1", bm_pid);
@@ -451,7 +451,7 @@ static int cat_ctrlgrp_tasks_test(const struct resctrl_test *test,
 		goto reset_affinity;
 	if (ret) {
 		ksft_print_msg("PID duplicate remains in the old control group\n");
-		ret = 1;
+		ret = KSFT_FAIL;
 		goto reset_affinity;
 	}
 
@@ -499,8 +499,8 @@ static int cat_ctrlgrp_msr_test(const struct resctrl_test *test,
 	bm_pid = getpid();
 
 	if (!msr_access_supported(uparams->cpu)) {
-		ksft_test_result_skip("Cannot access MSRs\n");
-		return 0;
+		ksft_print_msg("MSR access not supported\n");
+		return KSFT_SKIP;
 	}
 
 	ret = resctrl_grp_has_task(NULL, bm_pid);
@@ -508,7 +508,7 @@ static int cat_ctrlgrp_msr_test(const struct resctrl_test *test,
 		return ret;
 	if (!ret) {
 		ksft_print_msg("PID not found in the root group\n");
-		return 1;
+		return KSFT_FAIL;
 	}
 
 	/* Taskset benchmark to specified CPU */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index a0390f045646..6989e1422588 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -163,7 +163,7 @@ static void run_single_test(const struct resctrl_test *test, const struct user_p
 	}
 
 	ret = test->run_test(test, uparams);
-	ksft_test_result(!ret, "%s: test\n", test->name);
+	ksft_test_result_report(ret, "%s: test\n", test->name);
 
 cleanup:
 	test_cleanup(test);
