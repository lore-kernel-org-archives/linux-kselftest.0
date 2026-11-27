Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779826;
	b=u1rYCWsl5Pymdl91c/ZNjEPhltEESVEKNS3Q56SXJjeYxhSH8RgAnj25FacyYGHJQ1QD
	 e5pYtYV1bEnWhFUW5KNnoKQOLprwO0rNAAFF45NylYC4wrUZUsf71xr71LCCbQv1z5kG/
	 yhWNuHWkA24Fo2S/xI9hLv6FwD5EDTB/+PyGztzjmIy1qSU6JP/h4W7orF8TkUobbA19G
	 ZZ99csbnpdUjc7BGox+WfOEULMpuWZ3g0AaWLA4Zcdhzzb8mhNK1z/rZcVHORkkcbHIY6
	 pZlxYLe7v0cLV6uzlAk1EinTby8ky2ORqRrQvFA6Ma4b3B2a+xL3TebQ7Hu7XUo/Rjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XcSXK5rWXolEwTqbF/BCgzXzRtdRpf4gIQiNQY2GeVc=;
	b=aTWJQBqY7Kq0r/8cFhXUyglx42i23PxJNekMV4rVwamobfUO9tffVU5BkREB5f3zfQgz
	 gtZsaBu7nST4XyPCDr5XI7TXrg4O7VREO9RXXf/RXxnDoAc50+vuTxqZoRqyq+4cYSxdF
	 Rki5fa6nQ1YApJDlixYPfEfyuWfiT5PjX31MZJFEskC/agYrUyPOYm2hiUAJkDAX7P65o
	 dQZkMMsQ5on48IzwdDAZiCH3bqa3lIUCccXDHMMtRpUQZSoq9XEzJjpHmW7F4S4DtRkb8
	 kkbqo4hdvpsmvGgiCQy56ZAF/dIn3qppVILNpDA3gMvH7pqU13FxoqF2nvM5W5K63IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=dGw07kn3;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E3606A324
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 11:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=dGw07kn3
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53664b4860bso87088461cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779825; x=1796384625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcSXK5rWXolEwTqbF/BCgzXzRtdRpf4gIQiNQY2GeVc=;
        b=dGw07kn3kMZtQ0j4Y0Am+VjFse7tvg47sQhN44ULp9Ve/er+PjsrAHpIp0h9EscWEc
         G5hjOirwd5nzeKTLQeexK37Rzjcs2Ed0aM6glDjucCP+DL5zCkjmKXndvF8FrKx6HpPl
         4WbPp7p4yWCKsvxci9HOGDOhv0qBVP6rFhLEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779825; x=1796384625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcSXK5rWXolEwTqbF/BCgzXzRtdRpf4gIQiNQY2GeVc=;
        b=HCfpyxr00ZZPLsR1JXJUoXBH/4k8mLpAt/mHtE+HgYe6lomkKUy1jajJdrwGr1tYm4
         uoCZjM/euoqj2Fh9VlVsN5vYSoD+VyvipGf9RIgc7Zebgey/J63eVovuRHGK6u6b2/w/
         k+2jYWzibwpk81jjl5shdv5mW4cwvs57reThzNZOikVduf0L/i/pLRdcD7MPBqvmHo5r
         2L6xS+hJR28jrlyBTx9bLCKw5MQ33pX7xFCHYb4f1d0D8j44Hpet3d/Bcqh4rvw55N/2
         Z8PbR8nFoEf3y73/IGfeUftVSffrEqsfU4WPC/7zn/vbPrJxwTHOXUGfZ9bwYwZ5CZ61
         +iBw==
X-Forwarded-Encrypted: i=1; AL+hErEgzowy/cMolx0zfVNbi8V2am9fPKbTfCPtSImDglrewultkNrgB2Deq+f109FyIxUP4rXU6RrEPB4Qtb2ew7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kJwEu1JcSeVGyKCy1LQGxwgdoLVMvLiFPLYAexMUB2mSL9mBX
	FUD4VB4LqFcH8bYLpd9sFe8IWgsEMIQo9aRMXlamNvcn+Y7tXTnZfD5Rn5/mCpXpuw==
X-Gm-Gg: AZFdTZdPqvdltrwf0fixWnSGVDWcwUk8Y8ltZyFvMv2x3d/QCSEiaQ3aegPJbeEfaxP
	kxQscnUTvqwM8GCyfK8/bI4s2rFwXt5C9XgRakHdX1O5B1zmv2BqTWkUrw/IxB8zzmGiIUeRb/d
	m1bY/BlrYXo0M3Rs346qeYkn15N1eVxaAtbPpqgSLigUItYtzY9GaFmrmPRtaUFu28NHAZ/coXi
	l+pRqvHe0f+aIyKMeYWyo7OuaFqa+/8/V6AEKfu9zCV0BFb0Hw105IZkaLy7nE6yJv43AIbD9hT
	h53K/02lw2MhM7ne07jV1hZtFJ0/j3t+x0KZX4RaVv7TY3SwsCoi14pW1oG6WnisglhNTvo+cSF
	34fyM7MAgDeI/k+xYzjxUhnOiElfFIYjYZpLZSG/+pQqsrUpcQWut1zTOUO+tZsBV0Z3cPxXmHM
	qk8RVFoi8+i7b/rbKcjwhvoju57zBb0mt1oHTz/ChsZPy4KNaGGUlcz5sxMhxDcbqb8W/JpbXBU
	icT81DshBo58OwXiF8/3IqKqlGz/BSAdf7WgJBe8w7QyZ21g6dnX+WDZPQKUBAvOaubVokOM8Hq
	+wqdnBAYp+fhZneW2gaoIhwrfPsIP3m7MQu1mXmAhMttUNA8bE4QVZ2NejOCmcWy5QtPYLE4qL1
	HnJuUM/lXhwBX2g==
X-Received: by 2002:ac8:5a08:0:b0:55d:25a1:72ac with SMTP id d75a77b69052e-55d76a26882mr449612601cf.27.1795779824759;
        Fri, 27 Nov 2026 03:43:44 -0800 (PST)
Received: from localhost.localdomain ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm16652551cf.20.2026.11.27.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:44 -0800 (PST)
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
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>
Subject: [PATCH net v5 2/2] selftests: tc-testing: act_gate: cover the cycle time and base time bounds
Date: Fri, 27 Nov 2026 06:43:35 -0500
Message-Id: <ACT-WEXM.v5.r0.20261127063407-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
References: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
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
The gate action now caps the base time and the cycle time at KTIME_MAX.
Cover the accepted upper bound and both refusals.

The accepted values:
A base time and a cycle time of exactly KTIME_MAX install, and the
read-back must show the value that was installed rather than only the
index.

The refusals:
-1 reaches the kernel as the largest u64, above KTIME_MAX, so it is
refused as out of range.  The negative cycle time is tested against a
base time that is itself accepted, so the case pins the cycle bound
instead of whichever bound is checked first.

Context note:
tc does not print the same error line on every build: without libmnl it
prints the strerror text, with libmnl the kernel's own message.  The
cases accept either.

The values are signed decimals on purpose: iproute2 falls back to
strtod() above S64_MAX and the conversion is undefined, so such an input
is refused on x86 and installs on the architectures that saturate it.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-testing/tc-tests/actions/gate.json     | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
index db645c22ad7b..e5450557751d 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
@@ -347,5 +347,113 @@
         "teardown": [
             "$TC action flush action gate"
         ]
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
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775807 sched-entry close 1000000ns index 201",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j action get action gate index 201",
+        "matchPattern": "\"base_time\":9223372036854775807",
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
+        "cmdUnderTest": "$TC action add action gate cycle-time 9223372036854775807 sched-entry close 1000000ns index 301",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j action get action gate index 301",
+        "matchPattern": "\"cycle_time\":9223372036854775807",
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
+        "cmdUnderTest": "$TC action add action gate base-time -1 sched-entry close 1000000ns index 401",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time -1 sched-entry close 1000000ns index 401 2>&1",
+        "matchPattern": "integer out of range|RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "b3c3",
+        "name": "Reject gate action with a negative cycle time",
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
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775807 cycle-time -1 sched-entry close 1000000ns index 402",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time 9223372036854775807 cycle-time -1 sched-entry close 1000000ns index 402 2>&1",
+        "matchPattern": "integer out of range|RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
     }
 ]
-- 
2.34.1

