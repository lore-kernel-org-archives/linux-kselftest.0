Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C539FCCF
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549058; cv=none; b=pt9PZ3YWLY8430cuaIZvYmdZZVdvDml7sH19cPIreI7fZ5KIt0AuFaLluwrgndh/RAMsH5I2iqr9ma2SumlHehhlZhNzBN/8gH6hOm84vMA1rbunLN0TZS9xvCfLvSavv+YSVYVPeReAKOHo+TVTysSlvG9ak2MmahTGDe9+OG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549058; c=relaxed/simple;
	bh=8MS4zQtV6FtWj/IUY9YaB2l6wuq7+k0MKb9PmXVy3Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXQhXEb4tmmWNKN0FCWZk3f/hbCi96wSNkih7IzNMlnUJyrQk1iyG2miOeZUjlxEM58HX8qRukjtNmC5qgFsJ+c5x1MOt0eroLBor6uTsMBZvCQPcMTaoGQbiBki6+3fczlVoZVCW/t9H7hR7zpD3nm2hRcSyLpRi8d1BccMbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=oEc6WKes; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="oEc6WKes"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab46931cf1so18203485ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1774549054; x=1775153854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRx7fHyBau0X1U+PMFN9nDLyGjIHEaCOQWYkJZdn+aM=;
        b=oEc6WKesaeY06bOky/5Q1PiJTY8DWHOEIHM+1jTOV/OcSR0L7xig7s/2bzR445Fl2e
         5H5R9IHXRT47vnhJiOOUopat6hH9lSudpgDsqWUbwDs1QF8wLtjx9ZFEBR7VdFFZ5bC5
         4Cvu+iIsWtzSoCB4pVC0DAxw0EAQzjFj4dFHqNqzNTc33fsDzT6GrnWKfRVxpZER73Yi
         /v6bQy4u8Lq8SYlnFGf+WtlXi1VRoF8HuPHKiV50x6bvfv6aibVVgusvk9zUkuofW4S8
         fb0lKEJ63Whe3eSUR870R6WPX2XpVqrK6GeVOjlShZOV9WAYVjh8g/ylLO0X3Ab1YXeS
         fFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549054; x=1775153854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRx7fHyBau0X1U+PMFN9nDLyGjIHEaCOQWYkJZdn+aM=;
        b=HKElf3qFgWJPZaT18qAzHCyO4IerjwoG03ExBKriNcnwWLBDLEpN9L8SBPnBbBdaim
         F+HUBPTmrj04Kk1oN03IrHaR9QHUFTTQz2lQGo4zpgCPKmPEFRTJSYY3KGFkGqits+kN
         wIOmn8dNYRzx8aGRl8icY9wdrchKp+WJXE6eMSxRfOIaDamq+LEadV7xUc1pvqg4z8WM
         njda3eGrXPFntg5nP3tqPwkuo/D5NsIC3fdaRFAcy6bT5NKTPuR4K3dyvyMnPG/nHkbA
         Yxd/4JbGjKel+7TrttUhvtKwJx8zxEcjJU9r8uf0opTfHBoQgqPIdApzUwO+ngNhDDPT
         xMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzqDLlFlcnb4DvIxvYN5LVTmKQzoApGqhJRsPrN+TTwf0RTi7QH4bTihiWphT526QhmiWNO7EWbQ/zl/S/tHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyld8M3JS36NzM7zq+/W2Llgw8vx12WX/sySlsp2KPUubGiIwfS
	dI5UiAIJgHd6fb7CAvSJSwI36wy4E67/BJ96Ddy7b2Yz0bB4u3IksKjAmNY71YI3fmE=
X-Gm-Gg: ATEYQzzgcU6uy0YWw048jtGuT5xaSrYJDlakovsO1E+n+UuN9jtIqcvzMVB6DhYGExx
	uwStQuCVyCEMhHg4yqw+bmz3/8ZWjGaq0r07cv0X42ZRFluG3SlVR5VVUegq6mZggLgL0q2ANDh
	ocOEuIuzFSHuAnITfnUW7rafoH3ZVlR1uhdliy+3WxlgqzGcKSOr00Dm6PtbZoxwiYjE//DoAVJ
	G40mJeqb/9cs0KQDH2CMCFt5IwZIqoKIvl0wpLfcaQlMGa4rMc3MRwjIoBLf8PpZwfrG8QFHE7B
	62vYqroaJCkdMRO2IhpWmjyyW3MdFodnOksq4PU2TVkhLY8JHeTwfXIcl8uiGH2OURjNTLtUAth
	K7KumWrFJFsUINIrZa/LMn4f4i71XDqS7oeYOcrrrseKwNepUBgSrzi6nQEn3AjTjSUbJ9wU2qS
	kH1JvL8bh1nTqI4yeHOIDqIBqmwph8kjCx
X-Received: by 2002:a17:903:32c8:b0:2ae:4ad5:b76c with SMTP id d9443c01a7336-2b0c486bd45mr23970245ad.10.1774549053876;
        Thu, 26 Mar 2026 11:17:33 -0700 (PDT)
Received: from phoenix.lan ([104.202.29.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8c4bd3sm38590245ad.63.2026.03.26.11.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:17:33 -0700 (PDT)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	William Liu <will@willsroot.io>,
	Xiang Mei <xmei5@asu.edu>,
	Savino Dicanosa <savy@syst3mfailure.io>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/7] Revert "selftests/tc-testing: Add tests for restrictions on netem duplication"
Date: Thu, 26 Mar 2026 11:01:02 -0700
Message-ID: <20260326181701.308275-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181701.308275-1-stephen@networkplumber.org>
References: <20260326181701.308275-1-stephen@networkplumber.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jamal Hadi Salim <jhs@mojatatu.com>

This reverts commit ecdec65ec78d67d3ebd17edc88b88312054abe0d.

The tests added were related to check_netem_in_tree() which was
just reverted in the previous patch.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
Reviewed-by: Stephen Hemminger <stephen@networkplumber.org>
---
 .../tc-testing/tc-tests/infra/qdiscs.json     |  5 +-
 .../tc-testing/tc-tests/qdiscs/netem.json     | 81 -------------------
 2 files changed, 3 insertions(+), 83 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json b/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json
index 6a39640aa2a8..ceb993ed04b2 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json
@@ -702,6 +702,7 @@
             "$TC qdisc add dev $DUMMY parent 1:1 handle 2:0 netem duplicate 100%",
             "$TC filter add dev $DUMMY parent 1:0 protocol ip prio 1 u32 match ip dst 10.10.10.1/32 flowid 1:1",
             "$TC class add dev $DUMMY parent 1:0 classid 1:2 hfsc ls m2 10Mbit",
+            "$TC qdisc add dev $DUMMY parent 1:2 handle 3:0 netem duplicate 100%",
             "$TC filter add dev $DUMMY parent 1:0 protocol ip prio 2 u32 match ip dst 10.10.10.2/32 flowid 1:2",
             "ping -c 1 10.10.10.1 -I$DUMMY > /dev/null || true",
             "$TC filter del dev $DUMMY parent 1:0 protocol ip prio 1",
@@ -714,8 +715,8 @@
             {
                 "kind": "hfsc",
                 "handle": "1:",
-                "bytes": 294,
-                "packets": 3
+                "bytes": 392,
+                "packets": 4
             }
         ],
         "matchCount": "1",
diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json
index 718d2df2aafa..3c4444961488 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json
@@ -336,86 +336,5 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY handle 1: root"
         ]
-    },
-    {
-        "id": "d34d",
-        "name": "NETEM test qdisc duplication restriction in qdisc tree in netem_change root",
-        "category": ["qdisc", "netem"],
-        "plugins": {
-            "requires": "nsPlugin"
-        },
-        "setup": [
-            "$TC qdisc add dev $DUMMY root handle 1: netem limit 1",
-            "$TC qdisc add dev $DUMMY parent 1: handle 2: netem limit 1"
-        ],
-        "cmdUnderTest": "$TC qdisc change dev $DUMMY handle 1: netem duplicate 50%",
-        "expExitCode": "2",
-        "verifyCmd": "$TC -s qdisc show dev $DUMMY",
-        "matchPattern": "qdisc netem",
-        "matchCount": "2",
-        "teardown": [
-            "$TC qdisc del dev $DUMMY handle 1:0 root"
-        ]
-    },
-    {
-        "id": "b33f",
-        "name": "NETEM test qdisc duplication restriction in qdisc tree in netem_change non-root",
-        "category": ["qdisc", "netem"],
-        "plugins": {
-            "requires": "nsPlugin"
-        },
-        "setup": [
-            "$TC qdisc add dev $DUMMY root handle 1: netem limit 1",
-            "$TC qdisc add dev $DUMMY parent 1: handle 2: netem limit 1"
-        ],
-        "cmdUnderTest": "$TC qdisc change dev $DUMMY handle 2: netem duplicate 50%",
-        "expExitCode": "2",
-        "verifyCmd": "$TC -s qdisc show dev $DUMMY",
-        "matchPattern": "qdisc netem",
-        "matchCount": "2",
-        "teardown": [
-            "$TC qdisc del dev $DUMMY handle 1:0 root"
-        ]
-    },
-    {
-        "id": "cafe",
-        "name": "NETEM test qdisc duplication restriction in qdisc tree",
-        "category": ["qdisc", "netem"],
-        "plugins": {
-            "requires": "nsPlugin"
-        },
-        "setup": [
-            "$TC qdisc add dev $DUMMY root handle 1: netem limit 1 duplicate 100%"
-        ],
-        "cmdUnderTest": "$TC qdisc add dev $DUMMY parent 1: handle 2: netem duplicate 100%",
-        "expExitCode": "2",
-        "verifyCmd": "$TC -s qdisc show dev $DUMMY",
-        "matchPattern": "qdisc netem",
-        "matchCount": "1",
-        "teardown": [
-            "$TC qdisc del dev $DUMMY handle 1:0 root"
-        ]
-    },
-    {
-        "id": "1337",
-        "name": "NETEM test qdisc duplication restriction in qdisc tree across branches",
-        "category": ["qdisc", "netem"],
-        "plugins": {
-            "requires": "nsPlugin"
-        },
-        "setup": [
-            "$TC qdisc add dev $DUMMY parent root handle 1:0 hfsc",
-            "$TC class add dev $DUMMY parent 1:0 classid 1:1 hfsc rt m2 10Mbit",
-            "$TC qdisc add dev $DUMMY parent 1:1 handle 2:0 netem",
-            "$TC class add dev $DUMMY parent 1:0 classid 1:2 hfsc rt m2 10Mbit"
-        ],
-        "cmdUnderTest": "$TC qdisc add dev $DUMMY parent 1:2 handle 3:0 netem duplicate 100%",
-        "expExitCode": "2",
-        "verifyCmd": "$TC -s qdisc show dev $DUMMY",
-        "matchPattern": "qdisc netem",
-        "matchCount": "1",
-        "teardown": [
-            "$TC qdisc del dev $DUMMY handle 1:0 root"
-        ]
     }
 ]
-- 
2.53.0

