Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F25499F00
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099146; cv=none; b=B6rskSmL13XixobYV0zVDc07hBh9gdP8e9WWYkr5tXJoiY1XVkB4jZdE7NgVQ13OFp9DNvCXxh3qASy4DHra36zsyFwYm7ZbuC9ansSDQYMBIABD2pSkaOVIryNQv/NdBeCouJxqMFP9PDNt/4g2SCdKpfCj1Y/f4fe1F1rqayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099146; c=relaxed/simple;
	bh=oeYngTyq3Ev3WvOE1U+b+V8UDfrNsq2eGndjscFug2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZPANCtIFwl7/y2FaMS31TwBSB3EpnrBgJEhYE4qYguF+QExkq9g0vao9j1EGWjiU+UDw0OpvFRF9vZi10uvWQT15XHpZBXJy+NcAyT8HvLBxXoAFhmEdvH1T6az6hNp9zLRjdbsIdOqiT60sRSY/8baGfdKU+qR1D9VKZ8O1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=BxMePcAC; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="BxMePcAC"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso597011eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792099140; x=1792703940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvMlhhM1H4/8r2Sp7w6cymrnI6hcruDQchS3uGp3QP8=;
        b=BxMePcAC9rPmzu52tbsWsKmVyNqv8SgjCC0jfhLKqDfhEvDTqITPwZKlO2VVDGCn+T
         ug1XLOOafS/tlRT7sFVF0t+fsY3U+TgXp3CKZtK6Ty14TOyJ/6x+xC7CSflIlJchq4lC
         /747QPNnE6DZW+ihPHNJcoTukXuHp0Pal7STI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099140; x=1792703940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvMlhhM1H4/8r2Sp7w6cymrnI6hcruDQchS3uGp3QP8=;
        b=eLDFV+aOmNS2sE/drV/0ztMkLLFzbNqQUGUckEQXhP0qrdIqa/6DJ/ZtB6wO9qvD/0
         mhzBCDyMDHzkPxZMNlXVWlrLcl8eaCsN0QZuFvGqOjsye4MiE3p9hc5To9s2qOHWt15c
         sLWsdI2RQQBa9yCu53Lz9RFFkvhOd5cURv3WhC4vjsL9sN9J0+gMeMJdQmcMDOMdI//n
         +B3/z2xDVehZ7ZJJMInHkD9iIk9ppCtYsw58l9/+YkuAyVnx9jXRXLtxcF1oGp+oJSAe
         t3pjTpswZ5Pz/4SxgVdFpIGNwopYBV0L+hUc1fFdu+ymv5Ibre9QE/xk3FSpnm2ihEX9
         Wo8w==
X-Forwarded-Encrypted: i=1; AKwUvBzg5Xm1igQ+bmA9oTYbo3SU4vF9XYat40JOJD2WP+GNWCdK4H4le2I6ijK4G1wGiMVYj6/eyQXTT2uY1Peb1N0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKushhd1+UV8+oQDbVNvg6dkvArZUPLglqhlhuRPol5UgdwX++1
	UpR63R5+j8SBam5+Eq3A28z3/SJAySRSAE/BDmJB9nzd4tFJEWcCc3cmLDXVUX3S9Q==
X-Gm-Gg: AYBFou0n5GwKra3zitegDTr/rudYq9XAZ1k6RdOhkh5PmQDaMqv4j/7YBBhnn0D1k8v
	6x45OEU6dGkclIbxag+Dl0l9HD662MfszPOwfQZLfptwcaNciNRwnzMtyNn7tk2Bm5CICvqw49X
	s5Odmjna15qa0A7U7fTI4TGTPlfCWE1q9X97a+KKWC5VwZhkZw7Di+hYKTvKaCDAgKxTR3iH16J
	pCZrGOSb7LZDhlarjriz3oxlCUk7HXO3CHmagEGv+TYnwTk1y34vluhhy23lZoYoOo+G54hmBlX
	J8Aq1nq5PXv+ZWG9cHRnB9OKzyfRm8ZsZy8nA23AsZoAR8vd8V+Bp0KswqEtmoPFp9UDxJJ4EPJ
	TxwaoAsKcpwD6CWNvCOE5RFzkHeaBrV66KJ5Q3f7ZOxyFZNVYDOFgmGVxrYBsidwKEo3PKlSM98
	kbOoZ5RI3RRskEfnnYb2SoAQd/O7M0XwvKNVzBDKwIkq30U8FYPyz0CgX72/rUJA==
X-Received: by 2002:a05:7022:e27:b0:171:a066:938e with SMTP id a92af1059eb24-171a0669487mr25825245c88.21.1792099140011;
        Thu, 15 Oct 2026 14:19:00 -0700 (PDT)
Received: from exu-caveira.tail33bf8.ts.net ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm216711c88.18.2026.10.15.14.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:18:58 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/3] selftests: tc-testing: pin DRR and ETS deficit refill semantics
Date: Thu, 15 Oct 2026 18:18:31 -0300
Message-ID: <QDISC-TIAE.v2.r0.20261015163454-3@mojatatu.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <QDISC-TIAE.v2.r0.20261015163454@mojatatu.com>
References: <QDISC-TIAE.v2.r0.20261015163454@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests that check the DRR and ETS deficit refill, so a change to the
refill loop can't silently alter the result.

The cases:
- 3f3e: one DRR class, quantum 256, sends a 1514-byte packet; the
  deficit ends at 22.
- 57a1: two DRR classes with 1514- and 514-byte packets; the 514-byte
  packet goes first.
- 2177: the same as 57a1 under ETS. IPv6 is disabled on the device so
  its router solicitation doesn't land in a band.

57a1 and 2177 put netem under the classful qdisc, so they log the usual
"non-work-conserving?" warning. All three pass with and without the
previous patches.

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
v1 -> v2:
- DRR cases reworded, ETS case added.
 .../tc-testing/tc-tests/qdiscs/drr.json       | 82 +++++++++++++++++++
 .../tc-testing/tc-tests/qdiscs/ets.json       | 54 ++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
index 2b61d8d79bde..d7ac32294738 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
@@ -86,5 +86,87 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY root"
         ]
+    },
+    {
+        "id": "3f3e",
+        "name": "DRR deficit after refilling a 1514-byte packet at quantum 256",
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
+        "name": "DRR serves the class that fits its deficit first",
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
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 3s limit 10",
+            "$TC qdisc add dev $DUMMY parent 1:2 handle 20: netem delay 3s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 1111 0xffff flowid 1:1",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 2222 0xffff flowid 1:2",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &",
+            "sleep 1",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 2.5",
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
diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
index d2eab61c099a..ea3adba2f06c 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
@@ -1007,5 +1007,59 @@
         "teardown": [
             "echo \"1\" > /sys/bus/netdevsim/del_device"
         ]
+    },
+    {
+        "id": "2177",
+        "name": "ETS serves the band that fits its deficit first",
+        "category": [
+            "qdisc",
+            "ets"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP addr add 10.10.11.10/24 dev $DUMMY",
+            "sh -c 'echo 1 > /proc/sys/net/ipv6/conf/$DUMMY/disable_ipv6' || true",
+            "$TC qdisc add dev $DUMMY root handle 1: ets bands 2 quanta 256 256",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 3s limit 10",
+            "$TC qdisc add dev $DUMMY parent 1:2 handle 20: netem delay 3s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 1111 0xffff flowid 1:1",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 2222 0xffff flowid 1:2",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &",
+            "sleep 1",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 2.5",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j -s class show dev $DUMMY",
+        "matchJSON": [
+            {
+                "class": "ets",
+                "handle": "1:1",
+                "root": true,
+                "stats": {
+                    "bytes": 1514,
+                    "packets": 1,
+                    "backlog": 3028,
+                    "qlen": 2
+                }
+            },
+            {
+                "class": "ets",
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

