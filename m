Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42BD4C4F73
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473038; cv=none; b=fsryo/pw79DWtAj2oy4BTQMq3DJh2fLobcuTVzVQ0uY584NkOLwyIoDqH04OTh9b7ozcA/RnjKYe9umvv9V3DyD++hDpRE28ophSny5xlW3gPXmIjtAYAnoZtna3qW1Y5D4jxYBDbr51NgUgMm+UaIqN8HlwP4Kv3WGHGQJjIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473038; c=relaxed/simple;
	bh=aAr+BrXXPvQgzHPfb246x7NqYokFUQLZsvybNAPGV3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnzyQrNWgx4lcbn/k/yPdhlYxDq/DoCtA+UM5eg2ZjQl1QWolcxzSHyqexcy+C9l44z7LMYwVYxqTHYkK6Iw/A71UhUkgDPFBXActVcLJeZ77adqQlJ+qEM5ZERlzbkypmgdvz1KBWNDqx4E/yrcgJTXsPw3B6pjfZ9BQd2YUvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=ALD33oJL; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="ALD33oJL"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c998d93153so2290309e0c.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1791473033; x=1792077833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4leh7k2ZBf3659CAar74hnPJtaC6j6Ws8Ui6gvx2534=;
        b=ALD33oJLyI3v+xd36LBMi1+u84GIoK3yVrfC6dcbU9a2Pr+rPsJokZHolPh1K2skVi
         TEX/qfmX/lQ/M3mpLGgxyF0sX4WPmv/5MNs2q1nK3YY9A4mlcxUGU+ZepHUE4PXeIYmS
         A0hZUKfoMh4TSUjXAgLo2TT+z27PujQ91lGHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473033; x=1792077833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4leh7k2ZBf3659CAar74hnPJtaC6j6Ws8Ui6gvx2534=;
        b=XBXrwRwF4nuqjLH++eOXWg92xTphGRCnoZohZh1JDt8Lq232wc6CAIdAM3nCl1fqhm
         w6rt9E1o3Ljoijj5Yl1GDbv0VMto2yFXtOUcMZYr3XpKpVpT50/4h8NXTxGuNu9zlng9
         nj+9WiTZQys37qy5ulXD9BJpbiSjSf79NPyWkAmABbyGCZFVTf77x3jvGDImjqXXmRhT
         RaM4KtIxgvg6/gT01sB2t9MbXriFjIs7ctioha1EKZRD1Muba+BSlFHDnALgmK/VrlAK
         vjyhgjyRXvMfw5m7LE8oGIk2jpUvK5GGD8+bKzVKOe1uXBP5gqWzyWDnuMSOLE6KyDsb
         ///Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4jpgoYfDiiJcb6w97hyfsoAtooFLcMLR20G94Ygl529spqsoZdSZzWuNi/4his+/TheG9VR4u2HT433tC9JU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzHvI219/wqUVkFZnRgbsJkPLCAtiwSfiodP7eTr+5qgXFXegW
	IkSMxrzRXjK7BC1h6HjAXgtWwItPxVOETEK5RrvqXpuCeSwP0q1EOWkA37Jb7IUF+w==
X-Gm-Gg: AYBFou0oR/5azpCxTlQXElHU2kkkmFxfFQteeZj3j6Wlwssrj4UDlODRz/QIm09g/wy
	ApxzY1BUxLpbTi9sp4KeBvXHDuP6fODi6rCKHGR/CPJwJV9ZZEoEY8PK9Tl2qcOLHlhO77z39LW
	f/oKacvEGwXKi9ij+SbQbvZwLRJsMhaGhFfmmka/1D9MfkKxv0OhRd6VVs/AEEifVMqLplj8kgX
	krh5gARKfTo9EVnDUZrVES3t0GcjHxMnyHp+jtH5sKIGNLFzg9SBC2CnZDDc7GBmic9a9ly6NLq
	0RPu29o05YBdnWPbPw4tlPt0VlJc/YBI7bCxs5wbhTY9hGRqUOFy3+d5AQ5x6dPYTywypGzWZ2B
	1q2peYUmArAqIQfpOBdvv4V8Wdr19hdSxUDZAtu/uSMko9+QIH54Aum8G65Hy6OBB3G+JEr6K1w
	dQCmnE/h6mZp7T//x5mxKFGML9eax+OUZXtyYlaqbaeJmCVcxiXSYrzhCsKbOd0bRliLhtq5kHj
	B9fCw3HtEu5rJM=
X-Received: by 2002:a05:6122:1b0c:b0:5de:4a25:f3bb with SMTP id 71dfb90a1353d-5e6d2a2ed82mr2425530e0c.14.1791473032763;
        Thu, 08 Oct 2026 08:23:52 -0700 (PDT)
Received: from exu-caveira.tail33bf8.ts.net ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e6c419e2bfsm4818871e0c.5.2026.10.08.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:23:52 -0700 (PDT)
From: Victor Nogueira <victor@mojatatu.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org
Cc: horms@kernel.org,
	sashiko-bot <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: tc-testing: add DRR deficit refill regression tests
Date: Thu,  8 Oct 2026 12:23:35 -0300
Message-ID: <QDISC-TIAE.v1.20261008110502-2@mojatatu.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <QDISC-TIAE.v1.20261008110502@mojatatu.com>
References: <QDISC-TIAE.v1.20261008110502@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two DRR cases.

The first asserts the post-dequeue deficit of a class with quantum 256
after one 1514-byte packet is serviced: 256 +
DIV_ROUND_UP(1514 - 256, 256) * 256 - 1514 = 22 bytes, read via
'tc -s class show' while a second packet is still queued behind a
netem-delayed child qdisc.

The second guards the service order of a multi-class round: with two
active quantum-256 classes, the list head holding a 1514-byte packet
and the next class a 514-byte one, the small packet becomes eligible
first and is the one dequeued. A per-class bulk refill that advances
each class to its own eligibility point would dequeue the head class
instead.

The two cases verify differently on purpose: the deficit case reads an
xstats field that tc prints only through its FP format string (it is
not present in JSON output at all), so it must use matchPattern; the
order case asserts the class stats and uses matchJSON for the richer
backlog/qlen coverage.

Both cases use a netem child under DRR, which peeks NULL until its
delay expires, so both emit a rate-limited
"drr_dequeue: qdisc ... is non-work-conserving?" line into dmesg.
That is pre-existing behaviour for any netem-under-classful test
(the infra 1f1f case does the same) and is expected, not a failure.

Both cases assert the loop-equivalence invariant (deficit convergence
and service order) and pass on the unpatched kernel by construction;
they pin it against a future rewrite.

Signed-off-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-testing/tc-tests/qdiscs/drr.json       | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
index 2b61d8d79bde..bb0995d8358f 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
@@ -86,5 +86,87 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY root"
         ]
+    },
+    {
+        "id": "3f3e",
+        "name": "DRR deficit refill converges to the loop-equivalent value",
+        "category": [
+            "qdisc",
+            "drr"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP addr add 10.10.11.10/24 dev $DUMMY",
+            "$TC qdisc add dev $DUMMY root handle 1: drr",
+            "$TC class add dev $DUMMY parent 1: classid 1:1 drr quantum 256",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 2s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match u32 0 0 flowid 1:1",
+            "ping -c 2 -s 1472 -i 1 10.10.11.11 -I $DUMMY -W 0.01 >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 2.5",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s class show dev $DUMMY",
+        "matchPattern": "deficit 22b",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
+    },
+    {
+        "id": "57a1",
+        "name": "DRR skips only rounds where no class can dequeue (keeps order)",
+        "category": [
+            "qdisc",
+            "drr"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP addr add 10.10.11.10/24 dev $DUMMY",
+            "$TC qdisc add dev $DUMMY root handle 1: drr",
+            "$TC class add dev $DUMMY parent 1: classid 1:1 drr quantum 256",
+            "$TC class add dev $DUMMY parent 1: classid 1:2 drr quantum 256",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 2s limit 10",
+            "$TC qdisc add dev $DUMMY parent 1:2 handle 20: netem delay 2s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 1111 0xffff flowid 1:1",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 2222 0xffff flowid 1:2",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &",
+            "sleep 1",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 1.5",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j -s class show dev $DUMMY",
+        "matchJSON": [
+            {
+                "class": "drr",
+                "handle": "1:1",
+                "root": true,
+                "stats": {
+                    "bytes": 0,
+                    "packets": 0,
+                    "backlog": 3028,
+                    "qlen": 2
+                }
+            },
+            {
+                "class": "drr",
+                "handle": "1:2",
+                "root": true,
+                "stats": {
+                    "bytes": 514,
+                    "packets": 1,
+                    "backlog": 514,
+                    "qlen": 1
+                }
+            }
+        ],
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
     }
 ]
-- 
2.43.0

