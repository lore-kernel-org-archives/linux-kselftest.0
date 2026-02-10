Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574730E856;
	Tue, 10 Feb 2026 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741390; cv=none; b=LYB1BwJeCQiP2wKILf3bi3whYC1+Nj5lLrRnCxIKN+tETWe2gwgDZSkCcAHK5y5ETpsNAxHlSYfCyBFC9SlflPUY7TmqNk8Cgi1Ox0BqNXAKnlSv3+UCzM8HxmkFCZI3gKfCrOmV4ji8XawbC8U5lBX9LRuQk3jTAvIhbBzJArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741390; c=relaxed/simple;
	bh=TgZglSRp46OCfBczu3pjtS2ukrSdd2b1m0yiRe83YeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UosnAYExaH9ngde9b8W9Uha+p6u/75xhVUCgxxong4L9Pp8v4/+otuaiuhEujmcCasGaITNn4o5kr3Pb+Fs38lYkDq2tjFkBuk1Q90S3SYuJHWWuQp1BeTy5isKvA9ImjfrmZVDuvM2jtPKaak7dClsVMSxRiniRA30aWVE1Q1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMafyBxN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMafyBxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770741389; x=1802277389;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TgZglSRp46OCfBczu3pjtS2ukrSdd2b1m0yiRe83YeQ=;
  b=fMafyBxNJEn5EL/RYzykXSGOjCVxigVaYbaCudnRhi546ZivjSAJdzN2
   H5+k1H1oKcGf0e+UWzfc7Y+NqiRTc8ffkcdwEyWdXpbgyaDqetY422QrP
   aG49RXmnKHCCa8WnPZmwImdZCMZBiAbG3aAPo1qS4O0ZF6VG40NS8xJAm
   N+AFNP1Md3oN4aZ6DnIFa2Sxdf+leRuRzaG/AjkiIkHptxItOgaIkic8Q
   Jg91eiXGugdsrG5hZW0mI56qM20QmuHeQ4BWPdZex0udmNV8eOZ6l+HxG
   JQ+ow4HdWIK2TAZjQqbsL2AgDhGMEG0i3EXRscVo9cdvcFCcXC5bmox2b
   A==;
X-CSE-ConnectionGUID: 9uppGxyKTTyOfGk+ynK4Jw==
X-CSE-MsgGUID: ROKIuNrmTW2oZzQDLtG3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="74476813"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74476813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:36:27 -0800
X-CSE-ConnectionGUID: J9qEF6i2TOmNTQF5N2I1eQ==
X-CSE-MsgGUID: t2V7xG5OQDyBPp06z9rwjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212003451"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:36:26 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	tony.luck@intel.com,
	peternewman@google.com,
	babu.moger@amd.com,
	ilpo.jarvinen@linux.intel.com
Cc: zide.chen@intel.com,
	dapeng1.mi@linux.intel.com,
	fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 0/8] selftests/resctrl: Fixes and improvements focused on recent Intel platforms
Date: Tue, 10 Feb 2026 08:50:39 -0800
Message-ID: <cover.1770406608.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is not intended to be merged yet since it depends on new perf
sysfs files that have not yet been merged.

The resctrl selftests fail on recent Intel platforms. Intermittent failures
in the CAT test and permanent failures of MBM and MBA tests on new platforms
like Sierra Forest and Granite Rapids.

The MBM and MBA resctrl selftests both generate memory traffic and compare the
memory bandwidth measurements between the iMC PMUs and MBM to determine pass or
fail. Both these tests are failing on recent platforms like Sierra Forest and
Granite Rapids that have two events that need to be read and combined
for a total memory bandwidth count instead of the single event available on
earlier platforms.

resctrl selftests prefer to obtain event details via sysfs instead of adding
model specific details on which events to read. Enhancements to perf to expose
the new event details are in progress:
      https://lore.kernel.org/lkml/20260210005225.20311-1-zide.chen@intel.com/
This series demonstrates use of the new proposed sysfs interface to perf to
obtain to obtain accurate iMC read memory bandwidth measurements.

An additional issue with all the tests is that these selftests are part
performance tests and determine pass/fail on performance heuristics selected
after running the tests on a variety of platforms. When new platforms
arrive the previous heuristics may cause the tests to fail. These failures are
not because of an issue with the resctrl subsystem the tests intend to test
but because of the architectural changes in the new platforms.

Adapt the resctrl tests to not be as sensitive to architectural changes
while adjusting the remaining heuristics to ensure tests pass on a variety
of platforms. More details in individual patches.

Tested by running 100 iterations of all tests on Emerald Rapids, Granite
Rapids, Sapphire Rapids, Ice Lake, Sierra Forest, and Broadwell.

This series is based on:
https://lore.kernel.org/lkml/20260210005225.20311-1-zide.chen@intel.com/
and
https://lore.kernel.org/lkml/084e82b5c29d75f16f24af8768d50d39ba0118a5.1769101788.git.reinette.chatre@intel.com/
applied to
next branch of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git

Reinette Chatre (8):
  selftests/resctrl: Do not store iMC counter value in counter config
    structure
  selftests/resctrl: Prepare for parsing multiple events per iMC
  selftests/resctrl: Support multiple events associated with iMC
  selftests/resctrl: Increase size of buffer used in MBM and MBA tests
  selftests/resctrl: Raise threshold at which MBM and PMU values are
    compared
  selftests/resctrl: Remove requirement on cache miss rate
  selftests/resctrl: Simplify perf usage in CAT test
  selftests/resctrl: Reduce L2 impact on CAT test

 tools/testing/selftests/resctrl/cache.c       |  17 +--
 tools/testing/selftests/resctrl/cat_test.c    |  43 ++----
 tools/testing/selftests/resctrl/fill_buf.c    |   4 +-
 tools/testing/selftests/resctrl/mba_test.c    |   2 +-
 tools/testing/selftests/resctrl/mbm_test.c    |   2 +-
 tools/testing/selftests/resctrl/resctrl.h     |  13 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 129 +++++++++++++-----
 7 files changed, 121 insertions(+), 89 deletions(-)

-- 
2.50.1

