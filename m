Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B227726D4DF;
	Mon, 26 Jan 2026 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408142; cv=none; b=oUXzAsDv2Ox57UWYWV0T7pELgnYboqFq/o+m+Eb+b912vbMGjiA2jKRcF0d+hSw516FnMKEKC14zgp9IPsvTfXqM1u0QEOtUcCcbn6FD2t1+s/vR+elDBStuVfuBiw+FIt+SDmSGAKzs8kWf+kTtdThcJYAV3LgBEiZH3VYJr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408142; c=relaxed/simple;
	bh=E8bsQl/1iwa5yoedXlXrpRivGIUY4bsgei8tZQqqiQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrTTVasjatT5WgZf4Fx0mJ8VPP8hnDHm31SmHWRl1/Bvj0qzH1i/xdAENOrTD4MICr/fJyPwbwCN74pA1bNjMCThW879Pl7QhCbxc7zNgboYkvwHx5BTU8oTQ+U/OW1W03GxFdYWZqtPxxshj55F4YZ2d3ACqzkojo9LHjZ3mdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLT7INFZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLT7INFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769408141; x=1800944141;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8bsQl/1iwa5yoedXlXrpRivGIUY4bsgei8tZQqqiQk=;
  b=cLT7INFZadhv85dYlhci/VMD+wEpK2zQg1jBWq5YFxhXuo8lLRlE7CEB
   ffiu4f+DqfWYmTvViKpsliirV+0Dh8rWZEK3EKasR+EFc3ArUsjtWTQrN
   zZwez+OtcpMSAf+y+p4Jw7ipnILRhnyhQN4tSM94e8TzoN08+4eWZcPLE
   TtlGFCCFGcVrXhHuouET2ne2zVGVJVEmQ1ksJ+HByuAGELmOBZN8xg9Mu
   WWmysZmGQTOvVOIo23Ey6dGIdjVgipUZPhTNOQ/1foRFrfi/Gaw6V0lt1
   EVCDmEQ8YbvjKac5tnIZsmvLhkPOaVDy5L1rWn/bc5hkwfJlj5hUIP/7U
   Q==;
X-CSE-ConnectionGUID: l4z6MrVpT3m50CYSDlRXPw==
X-CSE-MsgGUID: IRzHG6rHRuuU9y6kwYunXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74213913"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74213913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:15:40 -0800
X-CSE-ConnectionGUID: 4pop3ZNiQpuxr08oCfiM1g==
X-CSE-MsgGUID: NQs05qJXSmKJ2ofX/f+pyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="238241186"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.25])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:15:39 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: Shuah Khan <shuah@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] selftests: ptp: use KSFT_SKIP exit code for skip scenarios
Date: Mon, 26 Jan 2026 14:15:31 +0800
Message-ID: <20260126061532.12532-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kselftest framework defines KSFT_SKIP=4 as the standard exit code
for skipped tests. However, phc.sh currently uses a mix of 'exit 0' and
'exit 1' to indicate skip conditions, which can confuse test harnesses
and CI systems.

This patch introduces ksft_skip=4 variable and unifies all skip exit
paths to use 'exit $ksft_skip', consistent with other selftests like
net/lib.sh and net/fib_nexthops.sh.

Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 tools/testing/selftests/ptp/phc.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/ptp/phc.sh b/tools/testing/selftests/ptp/phc.sh
index ac6e5a6e1d3a..51aad466d989 100755
--- a/tools/testing/selftests/ptp/phc.sh
+++ b/tools/testing/selftests/ptp/phc.sh
@@ -8,17 +8,20 @@ ALL_TESTS="
 "
 DEV=$1
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 ##############################################################################
 # Sanity checks
 
 if [[ "$(id -u)" -ne 0 ]]; then
 	echo "SKIP: need root privileges"
-	exit 0
+	exit $ksft_skip
 fi
 
 if [[ "$DEV" == "" ]]; then
 	echo "SKIP: PTP device not provided"
-	exit 0
+	exit $ksft_skip
 fi
 
 require_command()
@@ -27,7 +30,7 @@ require_command()
 
 	if [[ ! -x "$(command -v "$cmd")" ]]; then
 		echo "SKIP: $cmd not installed"
-		exit 1
+		exit $ksft_skip
 	fi
 }
 
@@ -37,7 +40,7 @@ phc_sanity()
 
 	if [ $? != 0 ]; then
 		echo "SKIP: unknown clock $DEV: No such device"
-		exit 1
+		exit $ksft_skip
 	fi
 }
 
-- 
2.43.0

