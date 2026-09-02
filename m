Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4C81ACD
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 03:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321219; cv=none; b=jik8EvS8hvrcFyBrShZK5I1wlzPhsxnJgxKVevZGlkGd8KG141D/zjFY9I8Ieb4DR6c6JYem9ChYnmVLJcnExJpVRCNqW88yTh66skiMgPNk2UyCP9OOLrXC+exFTrX4IUVj4Z5/G84ebgokotHpzy93hPV4oAxGXjctSZ3lYNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321219; c=relaxed/simple;
	bh=JY8TWNetLtaCfnOffM627gWa8XUCz+EjVUleDxIGQn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K67aIcUkriE4DjlTz+6Q8nCrt7QIKQNBPRHbSs7zY59Jv5Sh2Nbtf132ehf08YPWvebsJh6/amla9/xykK5OcoFYV0RWSijW+A/vL2HvmIpbBIEyE9stkJJg5j2FAEbb3tM5nMGW51ez9fQr4LLxWUvTrONn/rVONwyGzbQRoio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBLh9oqi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBLh9oqi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6d28aa26cso3457895ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 20:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321217; x=1788926017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU1Mo2mZlynI3rZpSuzLl2Dc5eq4kfyxRQofUmB2lfE=;
        b=fBLh9oqi1w+VFMlPAvejYqxAo89Ws+wt/kkliV+rW2Hzn1yaWQ+1aUdolMtqgFFNqI
         iArd3EuX7lwURRygNpNYTT7JNGmnQxquewkoKPchSkzPCEowikoUmS3SobST8Y+i04oc
         +8CNo+NQWYamf63P+7NIUTZPFG6I6DT7YFE6dsFavS6jZdcueEXj4EV3ctYFORySz3je
         v9umQbRrziJPkwr1RKtg/t8idiptNhav0ro/l41hlYrDVI/dhHh/oVvQVo3sYg7KNZ2Y
         +vZhFlHZxUbkpojODDFUZeUZWUmqfIaDZacfsX9v62Q94UVWRXq+7flvlTGO9wBYGg+N
         3D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321217; x=1788926017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU1Mo2mZlynI3rZpSuzLl2Dc5eq4kfyxRQofUmB2lfE=;
        b=kVdc6LP54SFJr+nEg77Pb7cCJqvJxuMauVLkeIlSoMkMQHrBparlyy7mrGh1TJmhSR
         zt90YTeh5jnU3tg6RdC9PDTBw78Dnko8DHX2rKuqHITSL0DgjRGEaR451wfvrJFxsUUV
         orXQJU8Pr23Za2RFEvEl5OM/GZaYA7n45GOrbud4kS/mWl/7eWWeJMNxetUMVm2GIBsO
         MnkRo7keYDIU1f1MEAts6etvd/sF97x5YCSX3zACKaVTT0r/NYxJGYya5dwg63sG5ETI
         koTzMeX8sSGHFViuUbMTX3g1cTVOisyyTLGmqOYFUpPMWIG7PTw2xGBbmQfYrvJJCeA0
         NJyg==
X-Forwarded-Encrypted: i=1; AKwUvBwNJ9vWhuQ7iB9RPQEqLQjKG7gZzi7cF+EqFxs/Q8VEcO5dKDGnxQltQtjLC5nKOr9sF7aj7yYTKx5VjIqALOo=@vger.kernel.org
X-Gm-Message-State: AFuF++nhasXRZLa4Ecg4d3jfD+LFy7ZRVj3nHpw3ILRvHrutV4N997TA
	XdxEYFiUUPpikaSm1FVMxzAbSUbH1+eH/uoZ4JTBbEQg9GXRNWqChgFB
X-Gm-Gg: AR+sD13bx4op6t/QGiBpC8rplwdi+jUncLuEhs1vBBRJFYbjQ7uU4KecF0ibQ2ZaFWC
	PCu7i6hiYONZqMkQc2r3pCP66zG73a0GXCbaJ70VzoXTFOSUmzbWxg48/QOXI3pEXzsEWjNJITp
	VGdKwYf41ef3mPgeFKqypMN0uZS8DGNeGlfE4k2faPQmhE1GkqRaoHS6LyO2DclXOYptGKt9kwC
	GZ/cyA/6FGo6dUqjedrPtsEIeZNdqzv15lCTsPux8U6VRJc3QB9clpI1bMTg+dYAEqJHeIY+IxU
	+NxgWK1nyuiEj7uZiZrd2eCq4rHmrFwk7YI4Lz6uJaY/8yPUoAEhQK/ul3162JbjZwuQgt2RcG6
	8xr9wEw8/QtU/ASh6Ayd6/cCu4qCyovXD0bJ9WUeysdMdNtxLSDmMKk6anjVeM7bm8QNRwNYMqq
	dolWIuAZ+8UKU2SzcTuOeCHm4EM0MeGTWdiwN9SRWlIyX4xoeAW7A6Ha7HhUHnHCEXjJLZIGt81
	ttbxDfE5DSRyodnnMXJwTq6+x8lyftrwBJvXk+3suubgW0M804gzGec20rXjzWP
X-Received: by 2002:a17:903:234d:b0:2ca:660:b1d with SMTP id d9443c01a7336-2daec6d77c2mr26779885ad.11.1788321217430;
        Tue, 01 Sep 2026 20:53:37 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7987csm2502377eec.16.2026.09.01.20.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:53:37 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v5 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed,  2 Sep 2026 09:22:30 +0530
Message-Id: <20260902035231.81866-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902035231.81866-1-hemendranaik@gmail.com>
References: <20260902035231.81866-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tc-testing case 83c0: create TBF + fq_pie on $DUMMY, inject traffic
with ping, then verify 'tc -s class show' prints per-flow fq_pie stats
(prob, delay, deficit) with matchCount 1. The test fails on a kernel
without fq_pie class ops.

Update case 83be to expect failure for 'flows 65536' after patch 1/3
caps the flows parameter at 65535.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..d4081fcb0933 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
@@ -1,7 +1,7 @@
 [
     {
         "id": "83be",
-        "name": "Create FQ-PIE with invalid number of flows",
+        "name": "FQ-PIE rejects flows above 65535",
         "category": [
             "qdisc",
             "fq_pie"
@@ -12,10 +12,10 @@
         "setup": [
         ],
         "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root fq_pie flows 65536",
-        "expExitCode": "0",
+        "expExitCode": "2",
         "verifyCmd": "$TC qdisc show dev $DUMMY",
         "matchPattern": "qdisc fq_pie 1: root refcnt 2 limit 10240p flows 65536",
-        "matchCount": "1",
+        "matchCount": "0",
         "teardown": [
         ]
     },
@@ -40,5 +40,32 @@
         "matchPattern": "qdisc fq_pie 1: root refcnt [0-9]+ limit 1p",
         "matchCount": "1",
         "teardown": ["$TC qdisc del dev $DEV1 handle 1: root"]
+    },
+    {
+        "id": "83c0",
+        "name": "FQ-PIE class stats accessible via tc class show",
+        "category": [
+            "qdisc",
+            "fq_pie"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP link set dev $DUMMY up || true",
+            "$IP addr add 10.10.11.10/24 dev $DUMMY || true",
+            "$TC qdisc add dev $DUMMY root handle 1: tbf rate 8bit burst 100b latency 100ms",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: fq_pie limit 100 flows 1",
+            "ping -c 50 -i 0.001 -s 500 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"
+        ],
+        "cmdUnderTest": "$TC -s class show dev $DUMMY",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s class show dev $DUMMY",
+        "matchPattern": "class fq_pie 2:[0-9]+ .*prob .*delay .*deficit",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root",
+            "$IP addr del 10.10.11.10/24 dev $DUMMY || true"
+        ]
     }
 ]
-- 
2.34.1

