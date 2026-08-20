Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD4443E20
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229745; cv=none; b=bLA9mKvAZDiV+m1Oo9Fl4Kn/pXig424L67Ur59TkYAxvnLTbiGuZ1IzC32K+kRx/qUPd2KP9M/0kiGsKGYmiHNjqLwhsCAWBUIfZ4iyWQ9FstAppXMKgoj5hVevHFjSH1CUSkbhSNvito6CZ5okGC7rA4udbe94L2aoDWe19gWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229745; c=relaxed/simple;
	bh=+SgWMGaA7CDQAMPHI+yux+D8sc7tgzO72UDAwsRv8ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2CrYoMlvQ+KE8AbFYUHlGwWK9n2PfotszygTRjh+OZ6CWyCI609v8oxSAX3OL5biZYNg9NHy+koUmCs5y74ZQLzEcRBEgexOB20PAr3KD2vnLcW2Glxq9ZYSyboFdJFKSpsYHaSNNrcH3tn3DTrZSZzbjRn0WOeuZw+ZXAecAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aGBooXZy; arc=none smtp.client-ip=91.218.175.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aGBooXZy"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+SgWMGaA7CDQAMPHI+yux+D8sc7tgzO72UDAwsRv8ow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787229741; v=1; x=1787834541;
 b=aGBooXZyi3L2+WFmlQKjvD8HZRUOXkPV7MZxalfNTL7BlSuDYLKeywiBKZeMGiY+2weAlY7Z
 D7uG3wfp+KNwmLhe12vXi6nXVZjaDM9qIR8NAHz1idxYhrMSCAd6P5ClliGDw9mzcK15qBt2rSX
 Bv37AJ0RCTvTrRWN4gEkGPTw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from zgp.. (223.70.159.239)
	by smtp.migadu.com with ESMTPS id ce2966af263b7a65;
	Thu, 20 Aug 2026 12:42:21 +0000
X-Mizu-Trace-ID: ce2966af263b7a65
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	cgroups@vger.kernel.org
Cc: ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 01/17] selftests/cgroup: Drop invalid boot isolation comparison
Date: Thu, 20 Aug 2026 20:41:46 +0800
Message-ID: <20260820124202.517160-2-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820124202.517160-1-guopeng.zhang@linux.dev>
References: <20260820124202.517160-1-guopeng.zhang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

check_isolcpus() clears ISOLCPUS before rebuilding it from sched domain
data. Comparing that empty value with
/sys/devices/system/cpu/isolated makes the test fail whenever
isolcpus=domain is present.

The cpuset.cpus.isolated check above and the sched domain check below
already validate their respective interfaces. Remove the comparison and
the unused HKICPUS read.

Fixes: 6df415aa46ec ("cgroup/cpuset: Defer housekeeping_update() calls from CPU hotplug to workqueue")
Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index da8f7b920178..fdb3185570d4 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -797,7 +797,6 @@ check_isolcpus()
 	EXPECTED_ISOLCPUS=$1
 	ISCPUS=${CGROUP2}/cpuset.cpus.isolated
 	ISOLCPUS=$(cat $ISCPUS)
-	HKICPUS=$(cat /sys/devices/system/cpu/isolated)
 	LASTISOLCPU=
 	SCHED_DOMAINS=/sys/kernel/debug/sched/domains
 	if [[ $EXPECTED_ISOLCPUS = . ]]
@@ -835,11 +834,6 @@ check_isolcpus()
 	ISOLCPUS=
 	EXPECTED_ISOLCPUS=$EXPECTED_SDOMAIN
 
-	#
-	# The inverse of HK_TYPE_DOMAIN cpumask in $HKICPUS should match $ISOLCPUS
-	#
-	[[ "$ISOLCPUS" != "$HKICPUS" ]] && return 1
-
 	#
 	# Use the sched domain in debugfs to check isolated CPUs, if available
 	#
-- 
2.43.0

