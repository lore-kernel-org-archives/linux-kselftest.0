Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E72D3A6A;
	Sat,  4 Apr 2026 01:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267808; cv=none; b=PUq4APq/O6fVvMxN4aUDhogEeuAX/I3XxPFstNsMjleLDa+qL2+4tyVjDK1E8vJpeNr27YIJUe8W75ksJONnwGyY5scl0fDPR2ufCWfLxWsKSWDlS8zE0Ke4ubyniiQ8SsFfgeWEkRpckhmI1vM15BqHjHd/bS7jAFl4QV/DSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267808; c=relaxed/simple;
	bh=UbEi4EyzUvCP0cqbMLxC0sNz/D5ML1LcivjHnWxizY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/1x+CINrLDVLfliqjCOAjQMNTzdM3YTZ09m5QcSJZuGbHbEW9AkJawrMoua5P1TfgYW7qPjzS/QuWiMXvmXNgK8PVcQQBvDzS5lm3WHapEbhZOxiERqVaEWrTjigRf6RIikBj9v2EDehKivlzjWZjMdwqsE6DsvpVHQpsG7KaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ2O0pHN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ2O0pHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775267807; x=1806803807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UbEi4EyzUvCP0cqbMLxC0sNz/D5ML1LcivjHnWxizY0=;
  b=kQ2O0pHNDhjAVtZfJ/xxOpWiVZ7iQvsKXi5YPVykyY+RsXdiD3a0PMyR
   R7neGuasj2DI1hkZFGHbrhOnYuzsi6dY3hEB365wpaJNaJ/Tp4o/r5Kdq
   QBqUcMEF/ga+KsekoQvOeY+agPkM/lrSmP8ik543bVa7dSTPDL0eIyfsO
   zJ7JLocSbNnnvNPi3l32RO2We5pwjmTtRwci6r1WOxgpLLLD8B+Pjp8kU
   6k1HMrthoFhYWyMGbu/62Xo4+s6rktC1grf1evxNDdUrKGmYnTCzD4sgK
   2/FZnmCszYauR9RSqN14ZC3Ul8ON89OJBy3vTTN64RPizpG5A3XiLz5YI
   A==;
X-CSE-ConnectionGUID: pM/TBslkQhyUJdPqN7jkkg==
X-CSE-MsgGUID: npvFgd6IR5S/AR9wRzfY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76343388"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="76343388"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:56:44 -0700
X-CSE-ConnectionGUID: EDEyMCCJRluNa2L6qU8EVA==
X-CSE-MsgGUID: BYD5xNdCSvGkOVUjtwGJZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="224121499"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:56:16 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	tony.luck@intel.com,
	babu.moger@amd.com,
	ilpo.jarvinen@linux.intel.com
Cc: fenghuay@nvidia.com,
	peternewman@google.com,
	zide.chen@intel.com,
	dapeng1.mi@linux.intel.com,
	ben.horgan@arm.com,
	yu.c.chen@intel.com,
	jason.zeng@intel.com,
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v4 02/10] selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test
Date: Fri,  3 Apr 2026 18:56:01 -0700
Message-ID: <00445fa64c251b86b86023f87220ee1ad8561460.1775266384.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1775266384.git.reinette.chatre@intel.com>
References: <cover.1775266384.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CMT test creates a new control group that is also capable of monitoring
and assigns the workload to it. The workload allocates a buffer that by
default fills a portion of the L3 and keeps reading from the buffer,
measuring the L3 occupancy at intervals. The test passes if the workload's
L3 occupancy is within 15% of the buffer size.

The CMT test does not take into account that some of the workload's data
may land in L2/L1. Matching L3 occupancy to the size of the buffer while
a portion of the buffer can be allocated into L2 is not accurate.

Take the L2 cache into account to improve test accuracy:
 - Reduce the workload's L2 cache allocation to the minimum on systems that
   support L2 cache allocation. Do so with a new utility in preparation for
   all L3 cache allocation tests needing the same capability.
 - Increase the buffer size to accommodate data that may be allocated into
   the L2 cache. Use a buffer size double the L3 portion to keep using the
   L3 portion size as goal for L3 occupancy while taking into account that
   some of the data may be in L2.

Running the CMT test on a sample system while introducing significant
cache misses using "stress-ng --matrix-3d 0 --matrix-3d-zyx" shows
significant improvement in L3 cache occupancy:

Before:

    # Starting CMT test ...
    # Mounting resctrl to "/sys/fs/resctrl"
    # Cache size :335544320
    # Writing benchmark parameters to resctrl FS
    # Write schema "L3:0=fffe0" to resctrl FS
    # Write schema "L3:0=1f" to resctrl FS
    # Benchmark PID: 7089
    # Checking for pass/fail
    # Pass: Check cache miss rate within 15%
    # Percent diff=12
    # Number of bits: 5
    # Average LLC val: 73269248
    # Cache span (bytes): 83886080
    ok 1 CMT: test

After:
    # Starting CMT test ...
    # Mounting resctrl to "/sys/fs/resctrl"
    # Cache size :335544320
    # Writing benchmark parameters to resctrl FS
    # Write schema "L3:0=fffe0" to resctrl FS
    # Write schema "L3:0=1f" to resctrl FS
    # Write schema "L2:1=0x1" to resctrl FS
    # Benchmark PID: 7171
    # Checking for pass/fail
    # Pass: Check cache miss rate within 15%
    # Percent diff=0
    # Number of bits: 5
    # Average LLC val: 83755008
    # Cache span (bytes): 83886080
    ok 1 CMT: test

Reported-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/lkml/aO+7MeSMV29VdbQs@e133380.arm.com/
---
Changes since v2:
- New patch split from v1's "selftests/resctrl: Improve accuracy of cache
  occupancy test". (Ilpo)
- Reword changelog. (Ilpo)
- Update data used in changelog to match code after patch split.
- Introduce utility to reduce L2 cache allocation. (Ilpo)
- Add Chen Yu's tag.

Changes since v3:
- Add Ilpo's RB tag.
---
 tools/testing/selftests/resctrl/cache.c    | 13 +++++++++++++
 tools/testing/selftests/resctrl/cmt_test.c | 14 ++++++++++----
 tools/testing/selftests/resctrl/resctrl.h  |  3 +++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cache.c b/tools/testing/selftests/resctrl/cache.c
index 1ff1104e6575..bef71b6feacc 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -173,6 +173,19 @@ int measure_llc_resctrl(const char *filename, pid_t bm_pid)
 	return print_results_cache(filename, bm_pid, llc_occu_resc);
 }
 
+/*
+ * Reduce L2 allocation to minimum when testing L3 cache allocation.
+ */
+int minimize_l2_occupancy(const struct resctrl_test *test,
+			  const struct user_params *uparams,
+			  const struct resctrl_val_param *param)
+{
+	if (!strcmp(test->resource, "L3") && resctrl_resource_exists("L2"))
+		return write_schemata(param->ctrlgrp, "0x1", uparams->cpu, "L2");
+
+	return 0;
+}
+
 /*
  * show_cache_info - Show generic cache test information
  * @no_of_bits:		Number of bits
diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
index 7bc6cf49c1c5..ccb6fe881a94 100644
--- a/tools/testing/selftests/resctrl/cmt_test.c
+++ b/tools/testing/selftests/resctrl/cmt_test.c
@@ -23,7 +23,9 @@
  * Initialize capacity bitmasks (CBMs) of:
  * - control group being tested per test parameters,
  * - default resource group as inverse of control group being tested to prevent
- *   other tasks from interfering with test.
+ *   other tasks from interfering with test,
+ * - L2 resource of control group being tested to minimize allocations into
+ *   L2 if possible to better predict L3 occupancy.
  */
 static int cmt_init(const struct resctrl_test *test,
 		    const struct user_params *uparams,
@@ -46,7 +48,11 @@ static int cmt_init(const struct resctrl_test *test,
 		return ret;
 
 	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
-	return write_schemata(param->ctrlgrp, schemata, uparams->cpu, test->resource);
+	ret = write_schemata(param->ctrlgrp, schemata, uparams->cpu, test->resource);
+	if (ret)
+		return ret;
+
+	return minimize_l2_occupancy(test, uparams, param);
 }
 
 static int cmt_setup(const struct resctrl_test *test,
@@ -175,11 +181,11 @@ static int cmt_run_test(const struct resctrl_test *test, const struct user_param
 	span = cache_portion_size(cache_total_size, param.mask, long_mask);
 
 	if (uparams->fill_buf) {
-		fill_buf.buf_size = span;
+		fill_buf.buf_size = span * 2;
 		fill_buf.memflush = uparams->fill_buf->memflush;
 		param.fill_buf = &fill_buf;
 	} else if (!uparams->benchmark_cmd[0]) {
-		fill_buf.buf_size = span;
+		fill_buf.buf_size = span * 2;
 		fill_buf.memflush = true;
 		param.fill_buf = &fill_buf;
 	}
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index c72045c74ac4..7f2ab28be857 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -216,6 +216,9 @@ int perf_event_reset_enable(int pe_fd);
 int perf_event_measure(int pe_fd, struct perf_event_read *pe_read,
 		       const char *filename, pid_t bm_pid);
 int measure_llc_resctrl(const char *filename, pid_t bm_pid);
+int minimize_l2_occupancy(const struct resctrl_test *test,
+			  const struct user_params *uparams,
+			  const struct resctrl_val_param *param);
 void show_cache_info(int no_of_bits, __u64 avg_llc_val, size_t cache_span, bool lines);
 
 /*
-- 
2.50.1

