Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529549;
	b=n/FglgFMgOhlKVb46W+lCHWAStRC5a9s5h2bIL8IUEcxe4EBXW6q6e+jU3IMHwWMoszB
	 +B2jER4Ht80xWOCGYDZCm/5QppnAz14BFJsBelEaunD1b7zOdJhM3jNXqZA7iSqIdmPpn
	 kY0VcXt5+eq1N/VSnpbxiGnmH000KE1I8SGot+P8vBISr4yukYu1ztG0zeBwzUFYkOYL4
	 LWhPOVmRVY2oTbccgypt8WdumJOKte6Z+3u5rcZ7MBrc6apHK79hcjs4DIjr/4rpfKPg2
	 0YZCM2k4w+6rrsu+zhB/M1N4J9aGF30/PZZk4IFQNrp5zO571RPB81pQXs2gK75zAzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8cSuoiKKCPOnavUZXK09ITL4vjs3EgWF257jgW01Gs=;
	b=B8XAjnWQZmMKNQ2LVJ7sd2EVzRjA34o0xWA2j6tzNWsXbnwJCTp7CKOMFGsBf+6Yu+CG
	 gDNKpLf0hDY06vbTcesY62I0jwbSRDdq+COREDjqqWDXscHnlWlT8wThOwcd3N9rQSIP2
	 ecl0t7rppOhj/5hiPxbI8Js80EGgO/A5zO7C47C9ovgN/Eq+bUyv62O1Wqh7wC0Hme94u
	 tG7Txt5xxEJa4izkOXygsiCnU+HtXIYmlf9TN5jqG77qMLZbpuASgNmqAoiK1MMJ6e0sg
	 hzF3wFM+vnnwGNe36ejAOF+W5sSu13d5GrDEkmoAzkizQ0mESXonT+i0zlANNKG/8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=fkdJxOgB;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11D606A332
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A11D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=fkdJxOgB
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so5550104a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 06:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795529548; x=1796134348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8cSuoiKKCPOnavUZXK09ITL4vjs3EgWF257jgW01Gs=;
        b=fkdJxOgBoaXmx4Uq9NG2pEj1ki5zp2qhfGRNWrw2H1/hqJNoO42DJuCwjp9+3dUvd+
         jtK/UW2Yz+IZw9v8/dbVAQ8Ezm+jDWLtIPTewtA9CItm7vc1j71Ct0XTM47g6pAS/STj
         LPRz222/rN7lrLxtqb/sIKRnW5rHmyxgIj3bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529548; x=1796134348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8cSuoiKKCPOnavUZXK09ITL4vjs3EgWF257jgW01Gs=;
        b=h0OVGxYsRH0WY/efJu2uKQXYdGpkBcQmwUraZsD+uOkqVf5/KjuscalRjGZIh9yN9o
         abgcEUaQ2E+FkxBV56nYBNaWbG2w1G8Nay2UCyR3Ha4ZRkubsUPR6lXZjPkDMI1LNqKT
         e1L6oFqpwOImCj6cK59TdrSHjSBux/RtatOIBxNtXPf1FncA1ZrL7PycSaw3MZkSSDVE
         F/V6HmkWsdsmSjU2IqmDkeJYcTkkrIKd/IN+cObJg5UK6T5XslDU5qNTZM4VGNBomoo6
         CD4VVSbhROuIVH8oF6Hc9CqVWERI4GYnh4AOmC7cyOF29P4SAwauL2wVUIdnjn+SmspD
         TtVQ==
X-Forwarded-Encrypted: i=1; AL+hErHzKHoHGHsmJqdkxy1S7a3j60FHBIQMFABxqZ/cml86ImAJXRs7hymwRTK7GoHkLif8y0faO9jHxzaHxBWtOZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3bJpc9ThWyJnO59wEXEe1Jbb5aJO8CiCxV7vNhMhA6n5mNmE6
	3z5dMZO31ATlCAXAGmb2Q8n8PiqWEi93nzXMmAmRZiikGk5d8sHMXTeWq6sgl05/Aw==
X-Gm-Gg: AZFdTZdZfIcQJ2XfS05Gv5WHEab6Rl+E6dNmYG1n59WLwxES46qzBfESallsAm4Pz7T
	x/6eXtKRh8GF5LNQbUufuAuvv74Nkd0YZG2aOSUa2CZHwjDrcQC6VCi644ue2qbV/6VIHLYIWzw
	6i9aOc6qrzfPYu+GNa2GsUaZjtdqmJGryvcjnxmUFzn99hN2U/tRf6N8KAPjEHGSJy8bbIFbTz7
	zsnX6Rv7M8t/M11y657FS7JXmRKjxum/agUA5CrX9KpfsStQ9JAzmwQyp1rbw9I1KnUkzqUxz6G
	+lD2W6QQzoE3QuTh6CBq0rOMvzUS5l4NJU7BLWutdITyg2DDCF29yIKvViVbcwbvpQde5M+2jZh
	31LWMxysJBfPL29lu+t7NbpHJzfpiltY/MFPlD3PWsiRz2Oaf3aMbaQS7NKrtyzhleL6IeJttYM
	RlKto8xTYm6zeRRcCKobmPidAjlgjT0IVyOJnIBfOaY85urxKi+ElS8mDM5COiFyGVCB1J2iVMI
	OEcOHZNjOubMNgHK/+ClaxSapkx1D3bMPbRtLEh5wGNajyL/LyU7TQh2wurPLiJyt2IuDt9yE6P
	zJkAPygLBdQ1OiyJhebSvSoCQQ8HAMlWwqYCRasFvRLXlySSq0zGGU3gBsQJvbSN0h8DiH71cQ8
	=
X-Received: by 2002:a05:6402:210a:b0:6ba:a7d7:4e21 with SMTP id 4fb4d7f45d1cf-6baa7d75253mr5685496a12.35.1795529547924;
        Tue, 24 Nov 2026 06:12:27 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm5032739a12.36.2026.11.24.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:27 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	linux-kselftest@vger.kernel.org,
	Po Liu <Po.Liu@nxp.com>
Subject: [PATCH net v4 3/3] selftests: tc-testing: act_gate: cover the new cycle time and interval limits
Date: Tue, 24 Nov 2026 09:12:10 -0500
Message-Id: <ACT-WEXM.v4.r0.20261124074514-3@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests:
The gate action now bounds the base time and the cycle time at KTIME_MAX
and refuses a schedule entry shorter than 10 us.  Cover the four
refusals, both ends of the cycle time range and both sides of the
interval boundary.

The refusals:
A base time or a cycle time of 2^63 is above KTIME_MAX, so it is refused
as out of range; a base time of -1 reaches the kernel as the largest u64
and is refused the same way.  An entry interval of 9999 ns is below the
floor and is refused as an invalid argument.

The accepted values:
An entry interval of exactly 10000 ns installs and reads back with the
interval it was given, and so do a base time and a cycle time of exactly
KTIME_MAX.

Context note:
tc does not pass the action path's extended acknowledgment back to the
caller, so the negative cases re-run the failing command and match the
kernel's own error text instead of relying on the exit code alone.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-testing/tc-tests/actions/gate.json     | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
index db645c22ad7b..1c910e07c41c 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
@@ -347,5 +347,194 @@
         "teardown": [
             "$TC action flush action gate"
         ]
+    },
+    {
+        "id": "c873",
+        "name": "Add gate action with the minimum schedule entry interval",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate sched-entry close 10000ns index 100",
+        "expExitCode": "0",
+        "verifyCmd": "$TC action get action gate index 100",
+        "matchPattern": "interval 10us",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "2c35",
+        "name": "Reject gate action with a schedule entry below the minimum interval",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate sched-entry close 9999ns index 100",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate sched-entry close 9999ns index 100 2>&1",
+        "matchPattern": "RTNETLINK answers: Invalid argument",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "92b8",
+        "name": "Reject gate action with a base time above S64_MAX",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775808 sched-entry close 10000ns index 200",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time 9223372036854775808 sched-entry close 10000ns index 200 2>&1",
+        "matchPattern": "RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "8265",
+        "name": "Reject gate action with a cycle time above S64_MAX",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate cycle-time 9223372036854775808 sched-entry close 10000ns index 300",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate cycle-time 9223372036854775808 sched-entry close 10000ns index 300 2>&1",
+        "matchPattern": "RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "7d1f",
+        "name": "Add gate action with the maximum base time",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775807 sched-entry close 10000ns index 201",
+        "expExitCode": "0",
+        "verifyCmd": "$TC action get action gate index 201",
+        "matchPattern": "index 201",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "9f10",
+        "name": "Add gate action with the maximum cycle time",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate cycle-time 9223372036854775807 sched-entry close 10000ns index 301",
+        "expExitCode": "0",
+        "verifyCmd": "$TC action get action gate index 301",
+        "matchPattern": "index 301",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "5c47",
+        "name": "Reject gate action with a negative base time",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate base-time -1 sched-entry close 10000ns index 401",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time -1 sched-entry close 10000ns index 401 2>&1",
+        "matchPattern": "RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
     }
 ]
-- 
2.43.0

