Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56954E021F
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 20:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677822; cv=none; b=HBYdHYMHX8dHKhVL9B8824XmvNBljgQniA/DNExeJ0gVyM9kHjmdlSAI4HAAQOJuJ+yq3jUHtVpEk+pW0N5nvX7xT1/lpUAdqvxyloKcNtwrDNZQu7dTNWQ97cG1a77uKLenviMcvO8FJLEH5Zh/fyQsFcwQDA8ccWMLH2BAw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677822; c=relaxed/simple;
	bh=9w0AVcWNA84jQDGKGl+dT5kJPPgIcXcmxr0hJJ6y3Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gWpEnAoGDvzPo2wifqEop0zgGJIqubfCvH4SnfBVOIMwTVjdSlH5i7B5erpG/vUWcwuqOYz8+Zg6H7GORg5zP3G59eV0xjI6r7Iog2YEqtzFy+R/TyUbHLIisOwhs4YWbqIWqLYgQKxnzgJbE7nKeaAXHymCVN/pPgqU/dnTclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSI10/P8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSI10/P8"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso44623b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677817; x=1790282617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxddXcqpQ70lml4CXAKghIFIizhS2TiitRLOgATOP38=;
        b=BSI10/P8SfzGc+8DaUq9BDBixtOzNefPOJAWh/l5bGz6T/vprnIgOXIfit/xU3zCaa
         9Qk9Yi2oG0au1BljilV8xcES4IUj7rQN/K+fyLhgGn3cy6pTlpAodUNmysec8pZ9vp5T
         kpkFVW6AaEHToYyuSLxLgKk4JXoVwEjW6k0XJVPYonUfbAqSJgmXhHDMJPsmBH8H8zpQ
         I3jUozJMiUt7Nzcexd5q8fnHBiIKEXFdHDarrCkfPGu9rLPqSF1YX9XKpwLvUy3AudgW
         uR3mdgDntfGis/eoZu1CaIecatjF3II2C7eJqwBehFBLZhv4wC51ggCQ6YzbPUGO5Q8A
         /3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677817; x=1790282617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxddXcqpQ70lml4CXAKghIFIizhS2TiitRLOgATOP38=;
        b=0nOTOnv1RL+oS/SAlFZl6F4vN4Eg+a2n/4ydylD3TwyRrGsgKw7F8Pfobh+HUqQJBf
         H0aJqqD1o7ZUGKYuPSzDH8pei/ULX//Om2zyp/4EgSYajQ4MZxyeGwkvYtQTurXKmpEt
         9H8ifYh37F+xgNDsFh0HdQX5eCJWHwNX4G/pTGHZ1YKpK1HL+JJksMueIoViYS2XBerE
         5UDfZoGRV3VPBdP6ILaIyeoba+8ARiD17psNsm0sOBRb66+6JVWD8YYGeoQRwVy98uda
         iwkJRvdOzU+eyXfL7WmAZYM/mHLtL/xuPLv3Z/tiPEDgr+wzBpS/mWgrzAxprsl7Y3By
         oKZA==
X-Forwarded-Encrypted: i=1; AKwUvBw11I02m9jA/hfolJQPjwMiGDkrVCt0EHU+XhH9cRHbJmuLrd36SM9eZ38Jt9Z/dwFJWbxKEA2c2EQySMbPXtI=@vger.kernel.org
X-Gm-Message-State: AFuF++mRSrBg893Rsiwj93XB8mQkHWrlqpPtKi6IhsPmgZOuLbM1T+EA
	TaaBthd12Voip9WPGXHyQ7uYOFJ0bIGWyagZ9oIEfJLiDUHpaFVb9jMd
X-Gm-Gg: AYBFou3yBvTilpUNc1Chh1wcVgtt6EH0XwfPAyClbC+dUnVC0almIyE25xAkH5QJVl0
	/OtxVfKa/J/+8FJ+GDKTvUM+DeYKNydQMgcBT0kXbYCPTFL0Sfw8UC63Dpkc0XTTAixUVr5p2rq
	+GoABSI8xiMREWNXu9bKFv2blawFn001nKfrN0OLxpLt+y91YwXCeJRHmgstM1TlSuH360JGIK0
	ZDA72eL2Yx2rvsjsAvqaUYSRXSjaF3qxshpIAQPpONyeB2PO40GIxuGqpArNGVPF7cv7+Ycj0ND
	PCDfzFxDNJyErKu9nuHmnzTaDbhR6veBoZH1wQZ5B58Vhitq4i4M91hlYHjOEVH2QR+AthDJFkh
	Bb9blvlCt4Oxh9SxjN6tzXdFtB4FbJncYgLHD+cUya1u23Qa9uKkBJvDAp2gLmdYYL/9ppmlc1t
	56VqhpaFkSxxs0QV8wKZhh85NRU0SiNJ1tDP7bD/MltJb0dcu5IG7oEPp1VDbzqcwHmaeJhVer2
	JAeXkLTF0BNWDH6oyaWY8RLQxsLSy5d8ZfeRxuV2WEuuV3o9Jj6y+B8RjrPwumMV15UYGvjFko=
X-Received: by 2002:a05:6a20:2586:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-3dd8c53aa87mr316005637.37.1789677817154;
        Thu, 17 Sep 2026 13:43:37 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:6248:69c:ea81:be26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c1943f4bcsm3620046eec.21.2026.09.17.13.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:43:36 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Fri, 18 Sep 2026 02:12:24 +0530
Message-Id: <20260917204225.275251-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917204225.275251-1-hemendranaik@gmail.com>
References: <20260917204225.275251-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tc-testing case 83c0: build a TBF + fq_pie hierarchy on $DUMMY, push
traffic through it with ping, and verify that 'tc -s class show' reports
an fq_pie class.

The per-flow counters themselves (prob, delay, deficit) are printed only
after the companion iproute2 change, "tc: fq_pie: add support for printing
per-flow PIE statistics"

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..15b2667285eb 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
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
+            "ping -c 50 -i 0.001 -W 0.01 -s 56 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"
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

