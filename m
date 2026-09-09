Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90B3C873B
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 07:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937472; cv=none; b=gZmMfCtprkOc5aTFnyOQgWlSF4szmqxHjSieNotmEl4T7v81wdZdIxS9oV+d47sj9y64FiC5kuToatfnhwUgk5MHSdKKN0bX+QYUjFIrjBzyeOy5beaCdCao0vaP4Fm1y86uJZ4qRdfQsU8MuWuWyB4Zf9ZnpnSqojAAJO4dqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937472; c=relaxed/simple;
	bh=//yohNIuqAnGRo3lgqQJ49CeHC5XJjYRMg3X/WB18PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6HV/EvnhTpYSp1FMSZQ5xnd+/GVe0xab6te8VnFgEJiXpOS9iKnH5ashbT0UvK5IpDBSWhaObJub+k8CTLW1l72tKVXpiqUmx8amPdcoMjUifh9nB8I4WeUPMBsHN8aKRrrYTd7HI4v6mc9UoE1nDYDqKEsmqkyBMKV31TuU+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uTnVHdOY; arc=none smtp.client-ip=95.215.58.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uTnVHdOY"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=//yohNIuqAnGRo3lgqQJ49CeHC5XJjYRMg3X/WB18PA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788937468; v=1; x=1789542268;
 b=uTnVHdOYYKCg2HalMo60hJAgJH66QhFjVANiweZ9e05v510y3hWnmtw7kpau0HJvV0jp57cc
 wGxXuilLiVpdvfEXmyyWVPopaXH0Tp0iVa0RQr2kaSgf/0zuGz9464XJZaUVNFX56tpagjYhOUj
 YrRv0xdIjDcABaeZKqAN0rdQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b6175bb5234216f3;
	Wed, 09 Sep 2026 07:04:28 +0000
X-Mizu-Trace-ID: b6175bb5234216f3
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net v1 2/2] selftests: tc-testing: test action batch failure cleanup
Date: Wed,  9 Sep 2026 15:03:36 +0800
Message-ID: <20260909070336.32979-3-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
References: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

Add tests for cleanup after a batched RTM_NEWACTION request fails.
Replace an existing gact action bound to a filter, then fail a later
entry by requesting goto chain without a classifier context.

Check that the bound action's reference count returns to its original
value. Also cover a successfully initialized new action between the
bound action and the failing entry, verifying that its reserved index
can be reused. Repeat the bound action in another batch to check that
each temporary reference to the same action is released.

Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
 .../tc-tests/actions/gact-rollback.json       | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/gact-rollback.json

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/gact-rollback.json b/tools/testing/selftests/tc-testing/tc-tests/actions/gact-rollback.json
new file mode 100644
index 0000000000000..e92a4180db689
--- /dev/null
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/gact-rollback.json
@@ -0,0 +1,78 @@
+[
+    {
+        "id": "e3b1",
+        "name": "Failed action batch releases a bound action reference",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC actions add action pass index 1",
+            "$TC filter add dev $DEV1 protocol all ingress prio 1 matchall action gact index 1"
+        ],
+        "cmdUnderTest": "$TC actions replace action pass index 1 action goto chain 42 index 3",
+        "expExitCode": "255",
+        "verifyCmd": "$TC actions ls action gact",
+        "matchPattern": "total acts 1.*index 1 ref 2 bind 1",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress"
+        ]
+    },
+    {
+        "id": "e3b2",
+        "name": "Failed action batch releases entries after a bound action",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC actions add action pass index 1",
+            "$TC filter add dev $DEV1 protocol all ingress prio 1 matchall action gact index 1",
+            [
+                "$TC actions replace action pass index 1 action pass index 2 action goto chain 42 index 3",
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC actions add action pass index 2",
+        "expExitCode": "0",
+        "verifyCmd": "$TC actions ls action gact",
+        "matchPattern": "total acts 2.*index 1 ref 2 bind 1.*index 2 ref 1 bind 0",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress"
+        ]
+    },
+    {
+        "id": "e3b3",
+        "name": "Failed action batch releases repeated references to a bound action",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC actions add action pass index 1",
+            "$TC filter add dev $DEV1 protocol all ingress prio 1 matchall action gact index 1"
+        ],
+        "cmdUnderTest": "$TC actions replace action pass index 1 action pass index 1 action goto chain 42 index 3",
+        "expExitCode": "255",
+        "verifyCmd": "$TC actions ls action gact",
+        "matchPattern": "total acts 1.*index 1 ref 2 bind 1",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress"
+        ]
+    }
+]
-- 
2.43.0

