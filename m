Received: from mta1.migadu.com (out-66.mta1.migadu.com [95.215.58.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F293E1713
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032885; cv=none; b=mnhDpxOAkhxPMhSgbtE9XzXBdhBXqtWuaJzfYF167xKjolG2xHsvsWBzMt6sza5Y4XWk/vzgamrw3D38prT+PbbZNhsLom+WT3h5Zccfv65QIcI15dKN+bCRf/liXmhPOfKURhw43vGcNY5JOmWV2fiyQQpLxVs0bKPbXRPw/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032885; c=relaxed/simple;
	bh=QW5F+KC6Mtc19N8+SJ6VtwIGPrdVeLpE90M+rMrrlUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScCXsrmKsnLM82Ae5QHNR6dOXRlWE6mZRBQuadKgfXQBT9NYFYKw2vFWMk/ZlhUD6g/VioU1H26QGnr0vhYhPloxPNl+9z+pIxJYi/Q+8MlGGEMiJSCHPZc8LHa0grrnR7jBF3OA9UPZa9vDmZX3qamcyDUe9x2BY96DBBJEDDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l68KufMU; arc=none smtp.client-ip=95.215.58.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l68KufMU"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QW5F+KC6Mtc19N8+SJ6VtwIGPrdVeLpE90M+rMrrlUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789032879; v=1; x=1789637679;
 b=l68KufMUs8MjF0atgUN0wNwds7dpgaKwssgp6Gp82jhPR5cvZJ7Mf8eHKK31/4kfZfkDDV2v
 aZlMixhhxUcmukgeuZBn1Cnww5Mps4iUJaBVT0cDpVjntiCM/Xwe36NtgMHJmXRKZqcBSldZNyK
 NwqLs6V+NWG3bCly3QPC6rao=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b9c99183e804cd3e;
	Thu, 10 Sep 2026 09:34:39 +0000
X-Mizu-Trace-ID: b9c99183e804cd3e
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
	marcelo.leitner@gmail.com,
	pctammela@mojatatu.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net v1 2/2] selftests: tc-testing: test action batch deletion failure cleanup
Date: Thu, 10 Sep 2026 17:34:13 +0800
Message-ID: <20260910093413.34509-3-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910093413.34509-1-xuanqiang.luo@linux.dev>
References: <20260910093413.34509-1-xuanqiang.luo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

Add tests for cleanup after a batched RTM_DELACTION request fails at
a gact action bound to a filter. Check that subsequent actions retain
their original reference counts and that earlier successful deletions
are preserved.

Cover failures at the first and middle entries. Verify that a remaining
unbound action can be removed with one subsequent delete.

Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
 .../tc-tests/actions/batch-delete.json        | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json b/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json
new file mode 100644
index 0000000000000..ef7ca4a6775bc
--- /dev/null
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json
@@ -0,0 +1,115 @@
+[
+    {
+        "id": "d710",
+        "name": "Release tail references after first action deletion fails",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ],
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC actions add action pass index 1",
+            "$TC actions add action pass index 2",
+            "$TC actions add action pass index 3",
+            "$TC filter add dev $DEV1 protocol ip ingress u32 match u32 0 0 action gact index 1"
+        ],
+        "cmdUnderTest": "$TC actions del action gact index 1 action gact index 2 action gact index 3",
+        "expExitCode": "255",
+        "verifyCmd": "$TC actions ls action gact",
+        "matchPattern": "total acts 3\\b.*index 1 ref 2 bind 1\\b.*index 2 ref 1 bind 0\\b.*index 3 ref 1 bind 0\\b",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress",
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ]
+        ]
+    },
+    {
+        "id": "d711",
+        "name": "Release tail references after middle action deletion fails",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ],
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC actions add action pass index 1",
+            "$TC actions add action pass index 2",
+            "$TC actions add action pass index 3",
+            "$TC filter add dev $DEV1 protocol ip ingress u32 match u32 0 0 action gact index 2"
+        ],
+        "cmdUnderTest": "$TC actions del action gact index 1 action gact index 2 action gact index 3",
+        "expExitCode": "255",
+        "verifyCmd": "$TC actions ls action gact",
+        "matchPattern": "total acts 2\\b.*index 2 ref 2 bind 1\\b.*index 3 ref 1 bind 0\\b",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress",
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ]
+        ]
+    },
+    {
+        "id": "d713",
+        "name": "Delete a tail action once after a failed batch",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ],
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC actions add action pass index 1",
+            "$TC actions add action pass index 2",
+            "$TC filter add dev $DEV1 protocol ip ingress u32 match u32 0 0 action gact index 1"
+        ],
+        "cmdUnderTest": "$TC actions del action gact index 1 action gact index 2",
+        "expExitCode": "255",
+        "verifyCmd": "sh -c '$TC actions del action gact index 2 && $TC actions ls action gact'",
+        "matchPattern": "total acts 1\\b.*index 1 ref 2 bind 1\\b",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress",
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ]
+        ]
+    }
+]
-- 
2.43.0

