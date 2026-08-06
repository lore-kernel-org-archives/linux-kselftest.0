Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF643847D
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011171; cv=none; b=jKJH9y7VPeZOtxIaGNczaY4WIbI5hEuQyWE8Zl5Wib55WG62zp09oNkD0XsHpcVTo6U9OUoiwv5W5BrZgwhPVyOXEaPQ2sQVz6PscMvSI16/3xeHMnvljmTyzv5UR49pZ9wGLhAWT0bIxK87Mqb7l1PFM4kT5gtNTjFUMQAzlhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011171; c=relaxed/simple;
	bh=VrzyduWAQBp2atZUJGEwneCO6VgDa36h9AzGxsS+y70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TNsMf31pR76EMy5gLLn7n8ZEnv4atY3lH5On2sk6tvXz9oS7d2+O5HY5LvTE240J7Ztk/9QckfEJwzth3lGyPh3hsdbmR+dg8mPWvG2F11qc3ZMbXwBhdW0K0UQPV0507kzkJY6+EnB/GPUWR8sD4DBCOiEo9TWBWwvWV5J4qc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXjH1Zid; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXjH1Zid"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486672f03cso2447534b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011170; x=1786615970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5pZPZKOV8wB+qQsGx++/PxBsNUpy69jm91FCX96JKg=;
        b=LXjH1ZidmOFQfXJ6UmjVjmp+UbeyaPQNdSV5MvvDJNFi61sXGaYUBZcJNtEJlxFmk+
         bCKRGMOohajw9cjvvuUN9wT5ivqH8D4cloa9FtZNFuam5f23Z09DO3eMN0mXGZw7NzSw
         MleWkPIcR6p4C2n/JArNJ9m9E7ZuzIiGybWn108EY/9PwinhlaUXGjmwaN2YWMqZyUhV
         G6RoH6D7wYL8gWMSYbjposUJjZDXu2weADuaopn/G7mUaqHYJ027h76wiPgFmakG1N05
         z22zU8e/XsRb2CALqAO/MZe34ZV/hYXwTLviz2fuL/qSbNFMvoF7G97j5HBkMd4ro9bs
         Y8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011170; x=1786615970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5pZPZKOV8wB+qQsGx++/PxBsNUpy69jm91FCX96JKg=;
        b=VGoviUl0TguuuyiIWM1L0a0gt0XAvJxT0uxUMnPbDNBz+Y0WaTaPrG4vR1GCiqlaIN
         wRBEQJEygq2uzE5ZZosM9KdQ9L3+vz/aQTmSWc+Yw0xMlcNZxuFrsJksd2IQlh5LYH1w
         Mlw/ix1dN4yySUzZI7y21mHlpUmIfiavsZRwQi3gZDsmuVYFBI9zXzNbYap2WmRY6hZl
         V5VaWsMdk818bxeqZ4YGv3ul7KZTV0vgM7c1TUiDtIKfq5ZHfjoZ46lLJCl9SKfaUdUR
         UHVDOgbkbXkIj66Hyb7tK8+KeF37ZCwyuf6hWSY3fFUq9ihWaTFVzhvbSNLy6v+36FdC
         EUgw==
X-Forwarded-Encrypted: i=1; AHgh+RquCqyql3YpJgxUyGsMqYXavH+sdRbsYZ5MjROK9m/CMjySuuuo6ooL3RRy07vseM8Ql0vb5BPcN5uWe6wPw2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVKr945dRluBo9CJ8Ajw6nKqP9NvsTcb45YmuFjOzrGS1vCpH
	pzNQCXfBQ2b6ljbzOGUh31BG+uwzsE3UZij+3V/7NuyAje98Pa/kiUr+
X-Gm-Gg: AR+sD10a6ZPXoiXhVVPpo2bIqrWVN3zxvXYhPE38L8iLmYiRVO2QQD7PyHI2le8hzRo
	YhfmA3t+4s3nTJALUNIQJCXGRT0QtHmPcZ7cpvo0sVzURzQ0PFIWe8orH4mXysVk0z2WrDIRkL3
	slOj5gNEE5DpXJCn7DN3Dp0Tpgh9R5MI+mliXtyEn60PlV3BNp19yddXSGSQN5DVf5zTkBicWXu
	P0mgKOsi5t/reWGCd7LF+cb0oIz6WJ+b1ySUPQ2VN0moxTg57NPWW5rBvMmhxvbBCndaHxHv+Ox
	YZDim+cVQnSQdI+V5uQGE3GwGsGwgqFiRPJqAZN1KWffieumKXfMLGMk55DhYb2Lc+LQEWyaI40
	vZ7IKXqxMFoF8dfEpfL3DB4cgGOFKpJ1yStKoDbteFXVeoxoTJq4pVs8aoigPJDnzccCMkcx1mO
	wsQcpAUl8DhCKH7dWD5qF0LXlOQht8QAImgLhD2dXfSZHvTMbLsFgwys3chtLB9QPK7AWXpeaGT
	WKKAvpicm42odXgKTv7kY6Ayt1QpVZcwkvFjglK0XvTTLBwKQ==
X-Received: by 2002:a05:6a00:4294:b0:83e:b443:965e with SMTP id d2e1a72fcca58-84f2dfc5413mr15446711b3a.3.1786011169755;
        Thu, 06 Aug 2026 03:12:49 -0700 (PDT)
Received: from BOOK-P74QMIQ7E8.localdomain ([220.73.18.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm1090371b3a.59.2026.08.06.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:12:49 -0700 (PDT)
From: Hyunjung Ko <hj351016@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tao Liu <taoliu828@163.com>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net v2 2/2] selftests: tc-testing: add act_ct test for malformed header handling
Date: Thu,  6 Aug 2026 19:12:35 +0900
Message-Id: <20260806101235.809370-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806101235.809370-1-hj351016@gmail.com>
References: <20260806101235.809370-1-hj351016@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a tdc case covering the leak fixed by the previous patch.

The test attaches "action ct" to a clsact ingress chain and injects ten
IPv6 frames whose nexthdr says hop-by-hop but which carry nothing after
the 40-byte header, so ipv6_find_hdr() fails and
tcf_ct_ipv6_is_fragment() returns -EPROTO.

Before the fix act_ct returned TC_ACT_CONSUMED for these packets, so
tc_run() never reached its TC_ACT_SHOT arm and the clsact drop counter
stayed at zero while the skbs leaked. After the fix the packets are
dropped properly and the counter reflects them, which is what the test
matches on:

  before:  Sent 476 bytes 11 pkt (dropped 0, overlimits 0 requeues 0)
  after:   Sent 400 bytes 10 pkt (dropped 10, overlimits 0 requeues 0)

Assisted-by: Anthropic-Claude-Code:Claude-Opus-5
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---

 .../selftests/tc-testing/tc-tests/actions/ct.json  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

New in v2, requested by Jamal.

Caveat on how far I verified it: I do not have a scapy-capable tdc
environment set up, so I have not run tdc.py over this case itself.
What I did run, on both an unpatched and a patched v7.2-rc6 under
qemu, is exactly what the case does - clsact ingress plus "matchall
action ct" on a veth pair, ten of the same malformed frames injected
on the peer, then "tc -s qdisc show dev <dev> clsact":

  unpatched:  Sent 476 bytes 11 pkt (dropped 0, overlimits 0 requeues 0)
  patched:    Sent 400 bytes 10 pkt (dropped 10, overlimits 0 requeues 0)

so the matchPattern does discriminate. The JSON itself is modelled on
the existing scapy cases in the same file (3992, 9c2a). A run through
tdc.py proper before this is applied would be welcome.

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/ct.json b/tools/testing/selftests/tc-testing/tc-tests/actions/ct.json
index da65f838bd52..8ab48def89b6 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/ct.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/ct.json
@@ -702,5 +702,45 @@
             "$TC qdisc del dev $DUMMY clsact",
             "$TC qdisc del dev $DUMMY root handle 1:"
         ]
+    },
+    {
+        "id": "c7a3",
+        "name": "Verify act_ct drops a packet whose header checks fail",
+        "category": [
+            "actions",
+            "ct",
+            "scapy"
+        ],
+        "plugins": {
+            "requires": [
+                "nsPlugin",
+                "scapyPlugin"
+            ]
+        },
+        "setup": [
+            [
+                "$TC qdisc del dev $DEV1 clsact",
+                0,
+                1,
+                2,
+                255
+            ],
+            "$TC qdisc add dev $DEV1 clsact"
+        ],
+        "cmdUnderTest": "$TC filter add dev $DEV1 ingress protocol all prio 1 matchall action ct",
+        "scapy": [
+            {
+                "iface": "$DEV0",
+                "count": 10,
+                "packet": "Ether(type=0x86dd)/IPv6(nh=0, plen=0, src='::1', dst='::2')"
+            }
+        ],
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s qdisc show dev $DEV1 clsact",
+        "matchPattern": "dropped 10",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 clsact"
+        ]
     }
 ]
--
2.43.0
