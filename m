Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32E3793BC;
	Fri, 13 Mar 2026 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433983; cv=none; b=gWtdEWXfnUrRhEHeY/YnJexpFem1FotdFjF/eeq9lsgL+kcv0gqdnRguf2bYOs/exKEivqbqmVrx31/SBgc6Au+c6slBtEAWA+VGjEibs/x0bU6ArrrraO2WZJFE5BqdazW2Iut/nqmVd0DH7anE+4gM/SizlREcW5soqLAP7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433983; c=relaxed/simple;
	bh=qIe7VhOdoVlLCUxoNR7SC51N22nu+eMyI+A9ZvoW/0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrWPgmwCfMnBLy9pnEGTNstFH4l2b1dUDdFtINZc9CyhRrHgCAO7LTUABrxC7wVPcWyMbgKo6aRLREwUs3ALzm4w2McKNi6AYhGfdfkxNZpf6tM39SZkRj1w0lO/KsVx6aWmG13v5npt41pRDKXVJODe8ZdgJ16OuR7VXO1bnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuGGKNcN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuGGKNcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773433981; x=1804969981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qIe7VhOdoVlLCUxoNR7SC51N22nu+eMyI+A9ZvoW/0k=;
  b=ZuGGKNcNievUPm0c/4qjqrGgqyWbAviWwmI8WASeeBwOUgcEMVD490vG
   kGobYfWVe+6BRbgURTMjUFbxtz1q5co1KHr4bnaoBZePhCCI+1Em7Lg9O
   LOU6H+l8FGqPQikhmr9wCzZiY58G9gKmO9RiVKfA1d1u1y3qz835SMl08
   ZcaSrbBFEMuSgvTfEpnZTWBr5L88prT7S/cjB1+mXkVngsKDbTIknTe1n
   49Dll3bWc67g20mnc8h5hWIfwbte+rnd39mwBKshTm0QwiUVihwWLo3+2
   8fz+Pz+ZgfMHU2DyK+XRQx4votZ1XvJxg0TYs2KGCnwwle3cZTVItqM4k
   w==;
X-CSE-ConnectionGUID: G/yhqwv2TDa4ZcpMbNwk/Q==
X-CSE-MsgGUID: HrX68culT8y+2aRTHw3jrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74519292"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74519292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:54 -0700
X-CSE-ConnectionGUID: JGXTisTRQK+cpIaakGYmbg==
X-CSE-MsgGUID: huGS3OOkSLG5nTdTACocOw==
X-ExtLoop1: 1
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:54 -0700
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
Subject: [PATCH v3 07/10] selftests/resctrl: Raise threshold at which MBM and PMU values are compared
Date: Fri, 13 Mar 2026 13:32:34 -0700
Message-ID: <1bdca244a899a605c1ddd701a09d6a9d0c242856.1773432891.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773432891.git.reinette.chatre@intel.com>
References: <cover.1773432891.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 501cfdba0a40 ("selftests/resctrl: Do not compare performance
counters and resctrl at low bandwidth") introduced a threshold under which
memory bandwidth values from MBM and performance counters are not compared.
This is needed because MBM and the PMUs do not have an identical view of
memory bandwidth since PMUs can count all memory traffic while MBM does not
count "overhead" (for example RAS) traffic that cannot be attributed to an
RMID. As a ratio this difference in view of memory bandwidth is pronounced
at low memory bandwidths.

The 750MiB threshold was chosen arbitrarily after comparisons on different
platforms. Exposed to more platforms after introduction this threshold has
proven to be inadequate.

Having accurate comparison between performance counters and MBM requires
careful management of system load as well as control of features that
introduce extra memory traffic, for example, patrol scrub. This is not
appropriate for the resctrl selftests that are intended to run on a
variety of systems with various configurations.

Increase the memory bandwidth threshold under which no comparison is made
between performance counters and MBM. Add additional leniency by increasing
the percentage of difference that will be tolerated between these counts.

There is no impact to the validity of the resctrl selftests results as a
measure of resctrl subsystem health.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
---
Changes since v2:
- Add Chen Yu's tag.
---
 tools/testing/selftests/resctrl/mba_test.c | 2 +-
 tools/testing/selftests/resctrl/mbm_test.c | 2 +-
 tools/testing/selftests/resctrl/resctrl.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index cd4c715b7ffd..39cee9898359 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -12,7 +12,7 @@
 
 #define RESULT_FILE_NAME	"result_mba"
 #define NUM_OF_RUNS		5
-#define MAX_DIFF_PERCENT	8
+#define MAX_DIFF_PERCENT	15
 #define ALLOCATION_MAX		100
 #define ALLOCATION_MIN		10
 #define ALLOCATION_STEP		10
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 58201f844740..6dbbc3b76003 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -11,7 +11,7 @@
 #include "resctrl.h"
 
 #define RESULT_FILE_NAME	"result_mbm"
-#define MAX_DIFF_PERCENT	8
+#define MAX_DIFF_PERCENT	15
 #define NUM_OF_RUNS		5
 
 static int
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 7f2ab28be857..3bad2d80c09b 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -55,7 +55,7 @@
  * and MBM respectively, for instance generating "overhead" traffic which
  * is not counted against any specific RMID.
  */
-#define THROTTLE_THRESHOLD	750
+#define THROTTLE_THRESHOLD	2500
 
 /*
  * fill_buf_param:	"fill_buf" benchmark parameters
-- 
2.50.1

