Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED83EB0E5;
	Fri, 17 Jul 2026 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282131; cv=none; b=LRGIWbjBCGrqJuljUf88Avh3crRiBp79zFh8fSNcoz1Ocm9H6eWlNe7zHiN8yCaOFKgg5iWJWIMRLSqbLqX203WcEOy1Fo1g6pW9iCB/KGCsqCLUkt12RYtKaovtMaFZbpQ6XpOVx/BvtQKVqhRAqBwc9FmBncvCYSNIdk/m1po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282131; c=relaxed/simple;
	bh=brgwXwH1SqQLIPv/bf60pAhzZvaKhEL4gt1DB6hekys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ann2sVJH3Yfm8C3rG8wKTbxlagL4mVOnERmxGKWmEyM7TPKX0nSJQWCLBFhpBwYjfYxGIP5l8YKEdyHtea6AVpS5GKAyXc1Rndgvlt+9HtO0q6X3380JsYNVcGSZIJT+ZLmhHAOkUueuDnx1Ilxj169DYpaATlTle7MADcq6/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 227A02001FB;
	Fri, 17 Jul 2026 11:55:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B702D2001EB;
	Fri, 17 Jul 2026 11:55:26 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7835218000B5;
	Fri, 17 Jul 2026 17:55:24 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	horms@kernel.org,
	shuah@kernel.org,
	vladimir.oltean@nxp.com,
	vinicius.gomes@intel.com,
	fejes@inf.elte.hu,
	xiaoliang.yang_1@nxp.com
Subject: [PATCH net-next 5/6] selftest: add tc-testing JSON test cases for act_frer
Date: Fri, 17 Jul 2026 17:55:48 +0800
Message-Id: <20260717095549.10565-6-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Add a tc-testing JSON file covering the FRER (IEEE 802.1CB Frame
Replication and Elimination for Reliability) tc action (act_frer).

The test suite contains 32 test cases and exercises:

 - Creating push and recover actions with default and explicit parameters
   (tag-type, alg vector/match, history-length, reset-time, tag-pop,
   individual, take-no-seq)
 - Boundary values for history-length (1 and 32) and reset-time (0)
 - Combining multiple flags (frer_0011, frer_0012)
 - Statistics output format for push (SeqGen) and recover (passed,
   discarded, tagless, out-of-order, rogue, lost, resets)
 - Replace and delete operations
 - Flush all actions
 - Duplicate-index failure (expExitCode 255)
 - Control actions (continue, pipe) placed after the index token
 - Binding push and recover actions to egress/ingress clsact filters
 - Sharing a recover action across two filters and verifying the
   reference count increments
 - not_in_hw flag present in show output

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 .../tc-testing/tc-tests/actions/frer.json     | 785 ++++++++++++++++++
 1 file changed, 785 insertions(+)
 create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/frer.json

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/frer.json b/tools/testing/selftests/tc-testing/tc-tests/actions/frer.json
new file mode 100644
index 000000000000..d5be6ae156f7
--- /dev/null
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/frer.json
@@ -0,0 +1,785 @@
+[
+  {
+    "id": "frer_0001",
+    "name": "Create frer push action with default parameters",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer push index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 1",
+    "matchPattern": "action order [0-9]+: frer push tag-type rtag index 1",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0002",
+    "name": "Create frer push action with explicit tag-type rtag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer push tag-type rtag index 2",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 2",
+    "matchPattern": "action order [0-9]+: frer push tag-type rtag index 2",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0003",
+    "name": "Create frer recover action with default parameters",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 10",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 10 alg vector history-length [0-9]+ reset-time [0-9]+",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0004",
+    "name": "Create frer recover action with vector algorithm explicit",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector index 11",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 11",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 11 alg vector",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0005",
+    "name": "Create frer recover action with match algorithm",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg match index 12",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 12",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 12 alg match",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0006",
+    "name": "Create frer recover action with history-length 16",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector history-length 16 index 13",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 13",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 13 alg vector history-length 16",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0007",
+    "name": "Create frer recover action with reset-time 2000",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector reset-time 2000 index 14",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 14",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 14 alg vector history-length [0-9]+ reset-time 2000",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0008",
+    "name": "Create frer recover action with tag-pop flag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover tag-pop index 15",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 15",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 15.*tag-pop",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0009",
+    "name": "Create frer recover action with individual flag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover individual index 16",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 16",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 16.*individual",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0010",
+    "name": "Create frer recover action with take-no-seq flag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover take-no-seq index 17",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 17",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 17.*take-no-seq",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0011",
+    "name": "Create frer recover action with all parameters combined",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector history-length 16 reset-time 1000 tag-pop individual index 20",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 20",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 20 individual alg vector history-length 16 reset-time 1000 tag-pop",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0012",
+    "name": "Create frer recover action with match alg and all flags",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg match take-no-seq tag-pop individual index 21",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 21",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 21 individual alg match history-length [0-9]+ reset-time [0-9]+ tag-pop take-no-seq",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0013",
+    "name": "Show frer push action SeqGen statistics (zero after create)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1"
+    ],
+    "cmdUnderTest": "$TC -s actions show action frer index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC -s actions show action frer index 1",
+    "matchPattern": "SeqGen packets: 0",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0014",
+    "name": "Show frer recover action Statistics line (zero after create)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer recover alg vector history-length 16 reset-time 1000 tag-pop index 10"
+    ],
+    "cmdUnderTest": "$TC -s actions show action frer index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC -s actions show action frer index 10",
+    "matchPattern": "Statistics: passed=0 discarded=0 tagless=0 out-of-order=0 rogue=0 lost=0 resets=0",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0015",
+    "name": "Show frer recover action Statistics fields present",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer recover index 10"
+    ],
+    "cmdUnderTest": "$TC -s actions show action frer index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC -s actions show action frer index 10",
+    "matchPattern": "Statistics: passed=[0-9]+ discarded=[0-9]+ tagless=[0-9]+ out-of-order=[0-9]+ rogue=[0-9]+ lost=[0-9]+ resets=[0-9]+",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0016",
+    "name": "Replace frer push action (same index)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1"
+    ],
+    "cmdUnderTest": "$TC actions replace action frer push index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 1",
+    "matchPattern": "action order [0-9]+: frer push tag-type rtag index 1",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0017",
+    "name": "Replace frer recover action changing algorithm from vector to match",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer recover alg vector index 10"
+    ],
+    "cmdUnderTest": "$TC actions replace action frer recover alg match index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 10",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 10 alg match",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0018",
+    "name": "Delete frer push action by index",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1"
+    ],
+    "cmdUnderTest": "$TC actions del action frer index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer",
+    "matchPattern": "frer push tag-type rtag index 1",
+    "matchCount": "0",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0019",
+    "name": "Flush all frer actions",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1",
+      "$TC actions add action frer recover index 10",
+      "$TC actions add action frer recover index 11"
+    ],
+    "cmdUnderTest": "$TC actions flush action frer",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer",
+    "matchPattern": "action order [0-9]+: frer",
+    "matchCount": "0",
+    "teardown": [
+      "$TC actions flush action frer 2>/dev/null || true"
+    ]
+  },
+  {
+    "id": "frer_0020",
+    "name": "Add duplicate frer action index fails without replace flag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1"
+    ],
+    "cmdUnderTest": "$TC actions add action frer push index 1",
+    "expExitCode": "255",
+    "verifyCmd": "$TC actions show action frer index 1",
+    "matchPattern": "action order [0-9]+: frer push tag-type rtag index 1",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0021",
+    "name": "Create frer push action with continue control action",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer push index 1 continue",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 1",
+    "matchPattern": "action order [0-9]+: frer push tag-type rtag index 1.*control continue",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0022",
+    "name": "Create frer recover action with pipe control action",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover index 10 pipe",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 10",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 10.*control pipe",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0023",
+    "name": "Create frer recover action history-length minimum boundary (1)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector history-length 1 index 30",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 30",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 30 alg vector history-length 1",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0024",
+    "name": "Create frer recover action history-length maximum boundary (32)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector history-length 32 index 31",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 31",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 31 alg vector history-length 32",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0025",
+    "name": "Create frer recover action with reset-time 0 (timer disabled)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ]
+    ],
+    "cmdUnderTest": "$TC actions add action frer recover alg vector reset-time 0 index 32",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 32",
+    "matchPattern": "action order [0-9]+: frer recover tag-type rtag index 32 alg vector history-length [0-9]+ reset-time 0",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0026",
+    "name": "List all frer actions shows correct count",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1",
+      "$TC actions add action frer recover alg vector index 10",
+      "$TC actions add action frer recover alg match tag-pop index 11"
+    ],
+    "cmdUnderTest": "$TC actions show action frer",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer",
+    "matchPattern": "action order [0-9]+: frer",
+    "matchCount": "3",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0027",
+    "name": "Bind frer push action to egress clsact filter",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "ip link del frer_dummy 2>/dev/null || true",
+      "ip link add frer_dummy type dummy",
+      "ip link set frer_dummy up",
+      "$TC qdisc add dev frer_dummy clsact"
+    ],
+    "cmdUnderTest": "$TC filter add dev frer_dummy egress protocol ip flower skip_hw action frer push index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC filter show dev frer_dummy egress",
+    "matchPattern": "frer push tag-type rtag index 1",
+    "matchCount": "1",
+    "teardown": [
+      "$TC qdisc del dev frer_dummy clsact",
+      "$TC actions flush action frer",
+      "ip link del frer_dummy"
+    ]
+  },
+  {
+    "id": "frer_0028",
+    "name": "Bind frer recover action to ingress clsact filter",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "ip link del frer_dummy 2>/dev/null || true",
+      "ip link add frer_dummy type dummy",
+      "ip link set frer_dummy up",
+      "$TC qdisc add dev frer_dummy clsact"
+    ],
+    "cmdUnderTest": "$TC filter add dev frer_dummy ingress protocol all flower skip_hw action frer recover alg vector history-length 16 reset-time 1000 tag-pop index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC filter show dev frer_dummy ingress",
+    "matchPattern": "frer recover tag-type rtag index 10 alg vector history-length 16 reset-time 1000",
+    "matchCount": "1",
+    "teardown": [
+      "$TC qdisc del dev frer_dummy clsact",
+      "$TC actions flush action frer",
+      "ip link del frer_dummy"
+    ]
+  },
+  {
+    "id": "frer_0029",
+    "name": "Share frer recover action across two ingress filters (refcount check)",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "ip link del frer_a 2>/dev/null || true",
+      "ip link del frer_b 2>/dev/null || true",
+      "ip link add frer_a type dummy",
+      "ip link add frer_b type dummy",
+      "ip link set frer_a up",
+      "ip link set frer_b up",
+      "$TC qdisc add dev frer_a clsact",
+      "$TC qdisc add dev frer_b clsact",
+      "$TC filter add dev frer_a ingress protocol all flower skip_hw action frer recover alg vector history-length 16 tag-pop index 10"
+    ],
+    "cmdUnderTest": "$TC filter add dev frer_b ingress protocol all flower skip_hw action frer recover index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC -s actions show action frer index 10",
+    "matchPattern": "ref [2-9][0-9]*",
+    "matchCount": "1",
+    "teardown": [
+      "$TC qdisc del dev frer_a clsact",
+      "$TC qdisc del dev frer_b clsact",
+      "$TC actions flush action frer",
+      "ip link del frer_a",
+      "ip link del frer_b"
+    ]
+  },
+  {
+    "id": "frer_0030",
+    "name": "frer push action refcount increments when bound to filter",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "ip link del frer_dummy 2>/dev/null || true",
+      "ip link add frer_dummy type dummy",
+      "ip link set frer_dummy up",
+      "$TC qdisc add dev frer_dummy clsact",
+      "$TC actions add action frer push index 1"
+    ],
+    "cmdUnderTest": "$TC filter add dev frer_dummy egress protocol ip flower skip_hw action frer push index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC -s actions show action frer index 1",
+    "matchPattern": "ref [2-9][0-9]*",
+    "matchCount": "1",
+    "teardown": [
+      "$TC qdisc del dev frer_dummy clsact",
+      "$TC actions flush action frer",
+      "ip link del frer_dummy"
+    ]
+  },
+  {
+    "id": "frer_0031",
+    "name": "frer push output shows not_in_hw flag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer push index 1"
+    ],
+    "cmdUnderTest": "$TC actions show action frer index 1",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 1",
+    "matchPattern": "not_in_hw",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  },
+  {
+    "id": "frer_0032",
+    "name": "frer recover output shows not_in_hw flag",
+    "category": [
+      "actions",
+      "frer"
+    ],
+    "setup": [
+      [
+        "modprobe act_frer",
+        0,
+        1
+      ],
+      "$TC actions add action frer recover index 10"
+    ],
+    "cmdUnderTest": "$TC actions show action frer index 10",
+    "expExitCode": "0",
+    "verifyCmd": "$TC actions show action frer index 10",
+    "matchPattern": "not_in_hw",
+    "matchCount": "1",
+    "teardown": [
+      "$TC actions flush action frer"
+    ]
+  }
+]
-- 
2.17.1

