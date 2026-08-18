Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0732C38888F;
	Tue, 18 Aug 2026 07:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037451; cv=none; b=IFBpVB5mLV/d5LNFrDWD9Ed/J6H8Mo2EFsy/ozmS1HmnIUFnRjjTrV1D7mwneEfyy2a2sTtJUf2t6ZHyuAIjV8iU1rjrSYzlZYUXPcrhb1KpdqKBOWxT7QNYA1AOpk3OjvAzqrnhj5pC8XgIq/d/jNYjdJxTyy6fcgvct6K4lO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037451; c=relaxed/simple;
	bh=M789BWL3XBsXi/BePRZE8Fi0O3ch7shfN3/enE8S2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBUcGPznrOs0w0PDn3f8eB1PWdqwPseMf45Lt9cgnXBkAkoQUgnrJfqYXzv/1c/UeiUR4XYB0yepuw3HcV01B/Clw0tEidmd7AK/3kY2e4BteTMn16HJmj4TsyhtsxJ0GCmc1Q37/sIrfaDd7Np6FxcudYRW4swT0xlOmGh/WgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0FD10BP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0FD10BP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787037449; x=1818573449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M789BWL3XBsXi/BePRZE8Fi0O3ch7shfN3/enE8S2pM=;
  b=D0FD10BPzePqQZiuL8+d1ZO3HWLS23ObBr+78SlTx2vChJJffqgbOumA
   2+miqRbY29556sTZn8/1I/tGh8U7X+L4fD0xWsCLXqmQ9A827iBiiKarv
   GiA5CqWWfUv5L9KvBXaXiXz7YbcEOM9COQaqOpBRxP0TTO3X4ImolY2tS
   jWK2Joy3rRSCEO/quikEWB7/hYt1rlTdgfuBZ8Sk0RIvIrAiXGbtDNK6z
   JZZHx4mvr1GKLR3bLwpInM0bL1vPGVCsON0glkLpI86ZMNFmQpUNCAvyM
   zPsDat5ei9hd58lU8G9woQ5TKIj76HbRT/ULzauU92tBNUmjdqhwyY+MT
   g==;
X-CSE-ConnectionGUID: 471HZEAHRm6j2HMI/5hGNA==
X-CSE-MsgGUID: 03y4fNOtTlKkNwu5mfNBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="86482999"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="86482999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:29 -0700
X-CSE-ConnectionGUID: cYldwAqjRByOdf3QvPV5MQ==
X-CSE-MsgGUID: NFqNirznSZesi3F4MWra6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263410861"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:24 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Weiming Shi <bestswngs@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Hillf Danton <hdanton@sina.com>,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 3/3] selftests/tc-testing: taprio: add case for the software minimum interval
Date: Tue, 18 Aug 2026 15:17:06 +0800
Message-ID: <20260818071706.251035-4-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818071706.251035-1-junjie.cao@intel.com>
References: <20260818071706.251035-1-junjie.cao@intel.com>
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

