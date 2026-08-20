Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F9E3B05B2;
	Thu, 20 Aug 2026 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207266; cv=none; b=i+bO2mXB1VWPFfd20Kg5swrKpiST1n+I6VHYTbHWdg10T8KRoe0RZF2Jo4+8lKllriweDE0YVDQyqJb3YH0r+fFXkabd7Bx0AyCMi0QScWZvmZ3axi769iT5/X51fUzBKJO7EWFBnUaX9YhWkkI0kMWsmAXCPdFfB37kx0gxWAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207266; c=relaxed/simple;
	bh=M789BWL3XBsXi/BePRZE8Fi0O3ch7shfN3/enE8S2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rytImvZQBIGtxkM7OkT5pcXisQQPhhaRU9DCaCCNkZ9qrvKcPqagnokMRctOUnR/h9/eA3EDFWKMJzQwn0fD2BxmbPWA+P9wy/Wl0wpVwvU+JGEL7un3T0RkdtkXe0cLL6aKZqLNZW1NJXsHijP4Ev7O82EcIeCjRpc33YHug/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXdEo6HV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXdEo6HV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787207264; x=1818743264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M789BWL3XBsXi/BePRZE8Fi0O3ch7shfN3/enE8S2pM=;
  b=VXdEo6HVAXyHP+WQvf7AWKo4RSjYo4lFEslRb7K98YkNQrE9mF7DdF1n
   kCyymI9igfAZGGDfijcLZiU78BrVbSfidr2qbsgfR1sL87rireVBNgESv
   wR4m7kXZw2Q9koEaDMyqMcGlZgw2XlRdG/+fii+Ws1ywoBctpP0Wl7dif
   dceWyhWfkOcGq159NOGAH+jc/Q5VA4gM5EASac1Sezmc2tkgdNSLJb/zT
   ozmvnCGlJOl2fdICq51gCYZN2h/gnN+A/FQD6ZLfBzMZ0tBj1DI52qI9W
   fvCcUIlYmRvLRGQzKnMbpM7woqGOweESppGIVLEsjiptp+cG7BiRcF1qf
   w==;
X-CSE-ConnectionGUID: JbehQBotQL+YOMyetW+tqw==
X-CSE-MsgGUID: csn/kkGKQSG4ihaNm1asMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110519187"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="110519187"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:44 -0700
X-CSE-ConnectionGUID: LpbGi6eOSniS/8IG/dSY5Q==
X-CSE-MsgGUID: zsNw2zOSRPeEY57cAEezTw==
X-ExtLoop1: 1
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:40 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 3/3] selftests/tc-testing: taprio: add case for the software minimum interval
Date: Thu, 20 Aug 2026 14:27:15 +0800
Message-ID: <20260820062715.278124-4-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820062715.278124-1-junjie.cao@intel.com>
References: <20260820062715.278124-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Entries below TAPRIO_MIN_SW_INTERVAL_NS must be rejected for software
schedules.

Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 .../tc-testing/tc-tests/qdiscs/taprio.json    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
index cd19d05925e4..3fe66839f8ae 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
@@ -154,6 +154,28 @@
             "echo \"1\" > /sys/bus/netdevsim/del_device"
         ]
     },
+    {
+        "id": "f4b2",
+        "name": "Add taprio Qdisc with software interval below the minimum",
+        "category": [
+            "qdisc",
+            "taprio"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "echo \"1 1 8\" > /sys/bus/netdevsim/new_device"
+        ],
+        "cmdUnderTest": "$TC qdisc add dev $ETH root handle 1: taprio num_tc 2 queues 1@0 1@1 sched-entry S 01 50000 sched-entry S 02 50000 clockid CLOCK_TAI",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $ETH",
+        "matchPattern": "qdisc taprio 1: root refcnt",
+        "matchCount": "0",
+        "teardown": [
+            "echo \"1\" > /sys/bus/netdevsim/del_device"
+        ]
+    },
     {
         "id": "831f",
         "name": "Add taprio Qdisc with too short cycle-time",
-- 
2.43.0

