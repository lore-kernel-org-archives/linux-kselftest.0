Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706646;
	b=t7L5nt5Bw3/geZ98xZ1nd/QtMfHCdu09ae6gPhh3ozJbz9XVbrg3F4Di8aGWnScmGphk
	 JR1ZGx0zeHOhpZqZfg81NnomRDpO/gR3wHYZIvUK6t0M8qSLTjGqk8N6giYUhaLloC1tS
	 YvFnja7WOQqH2uGkwtGWzsyAUe9GVxY3jyiIezszoL+rfEvxmr7NzPVWw7YF6l0JL5DkU
	 yhRjS0IyStF+OTRvi7xAA6J65oa0DpV8Ws5o48M64iqD9MHL0/5fJGR80vvzuM3ysUTit
	 3we+MMOxSMpdOrfdR28uyKc/etJWxhvAqC9amvqfAeqcoaswukD4+6Us6aX66TP+rTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nThnRv+tQWDotBuaHZ0Ov/cwqSLDBqK3gIAiHpLtLQI=;
	b=r4CfEFLrYPqmBLaJL6ToRGvz9wRja+BSGC+cyexAPwY0XoWzDHXiXe1cqeZd0iLET5qE
	 vbh3eEjDSg5u0JCbj5sfd9J2gnF8s/rjDzRd637mmwP9Nly7wqVgEuqs05PlBYRpe/A7w
	 3B7vGH+5NlvQkK0mHWXHWYRUF0qC8TV6ukYvDyFWbmb/l3Ws606j6kXje8TU/I2H3FDrk
	 /XVmW4yJ0HmDBPb8HmS0EttmeRK6fltPHvEhIuoudzCvQqQ4WzMdJ/LVK9YCWsdNbzVl2
	 hOEC7iFEtvaXUxVaU+/0tK46vGT94qvg15AinCoAKmXHLFjp70/7SqSeQsBxlcG0kHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=fT6ZHcbN;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A56082BD8
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 11:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31A56082BD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=fT6ZHcbN
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab38a051aaso41184027b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 03:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793706644; x=1794311444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nThnRv+tQWDotBuaHZ0Ov/cwqSLDBqK3gIAiHpLtLQI=;
        b=fT6ZHcbNxQ0nvZypckGeEvAuNUWNmRFthPNA/j2/pDDVWlc5tTUTQl5h/KHya6UHPY
         yt5h7DrFMFYk1ImiMExJRjqyAbZ3U7PWwZf9Ld5O8a75Hsn0IXmRODj6yfr6NiKHWVi5
         EnOaYjAYFpiLwsscj9h6KEhEWSZy8lUeiqD1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706644; x=1794311444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nThnRv+tQWDotBuaHZ0Ov/cwqSLDBqK3gIAiHpLtLQI=;
        b=KvvUZFROHbKk3rAtQ0Dw4CW4f/l/dUru0WO+P0LR3yJq3r2PwmYwv3upFLuzncYEQB
         pcJtGp6RBPNSIo+S8aljBH1+2kVDbzOHDEiykSqydNAOR3YFEWO2vnWSRWt7sHecelVd
         08Wo20K03lnFxqaWH9uzArjVkzqq5OsIctPz6p/4aNj8b8MDANjfFzMZYoNoCwo6MYL8
         JXcrbiHmhJjASomZ96WQjd8NRQnvxzRMOZMOjqbviHh5Fx2Njushom82rUDE1PYMH/5E
         HgWGeSxg3bJIvRHRD0K6HiTDxvgdwz6tNsGfGV7h/qhHvy0a5Vv8CwB60MSHPo6kqgzf
         x1gA==
X-Forwarded-Encrypted: i=1; AKwUvByc71BAANEyypfO7/k6ebaEWhDo7moDjtH7mggBuRcQ9bYchZ7dgoTdoEToeU7P1eLPAY4PEpN+jnhpaBfSm9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bAMnDIKIXKKHVpW9/t/778lCN+4fEZ+mbwrt3e0AeBMZ7AynH
	NmgkWHZ+eay72QPwy5H/h1hKZI4Fim1BgYCLgoBQtEC+hTiHeI8Lu9QRqo/xxTO52n/qBBCvQub
	Eppk=
X-Gm-Gg: AYBFou0B1n4cy+kmXzzaoMiZ63TNlhCBKS2ZrdUp6aTb9t2r4H9tlYwGF48v25sucyI
	DCYvT5LYrAaHbyMcDEyu+sHsPrkPM3vzXQe4y7jwPHEI31lWOmxf4s5bAxIASNu0c3X51yhNgpk
	3mx9hmiwLwra1qQ8RYHZ+CRKo5UqSm05w1mLB5ijA0yIfFygdviICQcXdIBnqEgwHkGd0AwZMa6
	a5DwRp5vSyBDswjWlYkIWcaJ5ELyGNBo2ogAVuXqSLGvxDu/Cl7Gx8HOMcCx3dZaY8m3Gl/F4m6
	lIPJ26rnyncRBzpY+KM89knxyEGe+y1Loh32boiG2WLMfyRYxq/p50fH3XM7QOGrmdon0GOgBkX
	UPT+pZbg6LVe3lhBVu3IazVDW2hdFhuA9IHXREnAnZLd1e9HcGU8kfcpAcyZQv12cEak7ErE4zs
	AdyeELAoaOYW+5srZPXwRi182bnZmi5zBwKRqzs+nWqDGNiJMm+1Cf6fIcqoyO5c/AAUcP2CQIK
	+uHXUpTG3Inuc39oglwVionQAXYfg9fSCQjoQvf0mK8BI9dX74Otzu3YtFNmQ8QU1nXw3HV/5Lm
	+O8oTP9Ot/ELCRtUHFzdsgNds2tXrYarPrDUt/VTydOYjj3BIqd2tFVuePLBe6fUgjJ/6xAD7tQ
	SVlsY3gBd0uYro6kO6xaLalqoq4FVlfEC89qp
X-Received: by 2002:a05:690c:f90:b0:8b1:9c2:87d6 with SMTP id 00721157ae682-8b2b66d0066mr98565757b3.17.1793706644511;
        Tue, 03 Nov 2026 03:50:44 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704d699sm70016857b3.5.2026.11.03.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:50:43 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 4/4] selftests: tc-testing: teql: cover each attach rejection on its own
Date: Tue,  3 Nov 2026 06:50:32 -0500
Message-Id: <SER-NSBD.v3.r0.20261103064310-4@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <SER-NSBD.v3.r0.20261103064310@mojatatu.com>
References: <SER-NSBD.v3.r0.20261103064310@mojatatu.com>
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

Found by Sashiko (nipa) while reviewing the previous posting of this
series:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/SER-NSBD.v2.r0.20261101171325-4%40mojatatu.com

The issue:
Case 124e attaches teql as a child qdisc and expects the attach to be
refused. It requires nsPlugin, so its device sits in the test network
namespace while the teql0 master is in init_net. Both the root-only
check and the namespace check refuse the attach with -EOPNOTSUPP, and
the case checks the exit code and an empty dump only, so it passes
whichever check answers it. It no longer proves that a child attach is
refused as such, and the case added in the previous posting covers the
namespace check alone.

The Fix:
Run 124e in the initial namespace, creating its own device the way the
other teql cases do, so that only the root-only check can refuse it.
Attach a root qdisc from the test namespace in the second case, so that
only the namespace check can refuse that one.

Link: https://lore.kernel.org/netdev/179366641863.488856.17368571591466000274@kernel.org/
Link: https://lore.kernel.org/netdev/179366641986.488856.2193313144081673076@kernel.org/
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v2 -> v3: considers comments from Sashiko (nipa) on the v2 posting:
https://lore.kernel.org/netdev/179366641986.488856.2193313144081673076@kernel.org/

Case 124e now runs in the initial namespace and creates its own device, so
only the root-only rejection can answer it.  The case added in v2 keeps the
namespace rejection covered.  Each case now witnesses exactly one check.

v1 -> v2: new case covering the cross-netns attach rejection, following a
Sashiko (nipa) review of the v2 posting of 3/4:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/SER-NSBD.v1.r2.20261031160050-3%40mojatatu.com

 .../tc-testing/tc-tests/qdiscs/teql.json      | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json
index 0179c57104ad..ab5d0881c007 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json
@@ -90,12 +90,8 @@
             "ets",
             "tbf"
         ],
-        "plugins": {
-            "requires": [
-                "nsPlugin"
-            ]
-        },
         "setup": [
+            "$IP link add dev $DUMMY type dummy",
             "$TC qdisc add dev $DUMMY root handle 1: qfq",
             "$TC class add dev $DUMMY parent 1: classid 1:1 qfq weight 15 maxpkt 16384"
         ],
@@ -104,7 +100,35 @@
         "verifyCmd": "$TC -s -j qdisc ls dev $DUMMY parent 1:1",
         "matchJSON": [],
         "teardown": [
-            "$TC qdisc del dev $DUMMY root handle 1:"
+            "$TC qdisc del dev $DUMMY root handle 1:",
+            "$IP link del dev $DUMMY"
+        ]
+    },
+    {
+        "id": "6a06",
+        "name": "Reject TEQL attach from a different network namespace",
+        "category": [
+            "qdisc",
+            "teql"
+        ],
+        "plugins": {
+            "requires": [
+                "nsPlugin"
+            ]
+        },
+        "setup": [],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY root handle 3: teql0",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc teql0 3: root",
+        "matchCount": "0",
+        "teardown": [
+            [
+                "$TC qdisc del dev $DUMMY root handle 3:",
+                0,
+                1,
+                2
+            ]
         ]
     }
 ]
-- 
2.43.0

