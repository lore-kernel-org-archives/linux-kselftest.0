Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009037FF58
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874842; cv=none; b=BU6eqSdo/dW1mQggE1BeGaXkotBsC8/i5c5SqTAZbuJWM/LTNy5mwQa5MIAsv23WSP3fxoGcvWqpw/TyBaHiar+OasIZT8bM2pB7jT9zsh5xsso8g4IGRdwaMT3VJszoFQBFnZGAXMbh03GuTYavUbHRcq55MUQ1Z6koY6BNAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874842; c=relaxed/simple;
	bh=/vtMgiw5QLUdNwiN05esofk6FTaIE2b9NYDtemrg3FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fl/oDA/hw8rdMWrqXGVHgBQaaTp/QD2vU+GqDTCMwqz2Yxps80/99t/7PQ43X7yC3AT/Yyd7lPj2gkz1fghGXUNSW5ANEepyk5b3SvnC6XYvGig0RCXxVnx1kr8xVkrYee8QVhmaMO439iXCDR6wh3WxAoq8k0VNiM0EQB2xfw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6QGXN3V; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6QGXN3V"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b788a98557so15604875ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776874840; x=1777479640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMiVlw5Dks3Rppi6Ek+IOA4onw9VFCFtvI5cTye7hR0=;
        b=s6QGXN3VRc0u5+EWnz5r4xL0kltPdSjqTXaY0g29fZQx07xX1dIEiQwZZJUgjtLrXl
         0ffcrWGH2xYo4lHkkg7QuM2EiuDY7p4N3qF+Y2P+i421AHyo0EAd69XTaGNEvRfePSJG
         aAI2g0yJw882MzGEWNh20KzAF4x+xkz+Cgub07FubP+nPCp8tW5pEflsOAbzAmkmHUTy
         AcvXKw0BAUpb+5l5YWNsz9TaKUDNVu9m/c2UPBMqjsMYD8mbpp+03RpTfwHxFHQkv8Nm
         29uEbATmfpbch/lAY0zybABRNMRCIn+Av9xJheGd1ODk8JJ/IMg8Pfss7yU+tFlNgatD
         4BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874840; x=1777479640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JMiVlw5Dks3Rppi6Ek+IOA4onw9VFCFtvI5cTye7hR0=;
        b=aN6L3xXBS8vEkFpvemmo2oClEq/BtMaxMB0dIJ94uk37YD7ImTD2wPyiGlEwJBNnBY
         oOFgJ8OMccPGco3PUhdikODgBIlEKo2QQPjsxz5B+FEd1VgNIOvxv4ParZAWlYEavUWj
         QHXiq1FRR0g51ANcNDWU+zpxN6+AbXc0V3l2u13DPa8ATDXGyvpw3bYg0f3SgLYbTSFV
         6wDoijvky04YRkXWBYbBGI+xqkSDTU3PAdd1FG1jn3SpY6ZfeeFffHZ9fiVxNGilIrqw
         +7U3dhWwBQPuHpLClB8qQb6VidOjaOkauJ1OzbHZemV0ae+7D235f4JgK5Qm3Ci2ZVKd
         BkCg==
X-Forwarded-Encrypted: i=1; AFNElJ+1RLULOSofs51wFJEwmamfGBC7WI32b+WRuPXL0u54vEIB02mudf4f+w/9r7/kdqSagpHZzB+ENIIOgsPYhgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyteU/10IcFJDCc9hiI+CggEMyIa6HqHT7cX3CBGOperflscdtI
	tj1eLt9tugfKCKlzjV+lAN1bMu5emwQ3pVHfLfUilAUDZxrVBGGlmE9k
X-Gm-Gg: AeBDieuTs+2rS44Oqcu7gPKoZJ43aapa5QSVKhDYoL2dzDZkdVo8olYexFNKH52N2Uf
	5BLXKXNYM0CpylPOObyiwV3UvwstSYTc9W0J/uAgCYIGK1fnK8jlUhwiEfZYNLegN2eYEjcPyuL
	/2nzvql00dwMlDyRoy1XhdzCHPhwETK0LneOtwZk0cFP3Af62bcOUEtxG+t6B3s18yNZcwvC038
	Y8oVlQeY/YbTSxrh9MqRZ9XCCHQ13xPG7G31GlVrp0+KxGZbdsgWRGhD6dcXXRAUs3Mip31fvKR
	+d+NlobSPVpNsesTGuoc6q7uQ9L/KUPTcseR2PCtB+z+zO2QaW+rh/FcuaxJoRdqreI7G6ROxj4
	BA9lAcHbD19ntbWsERdX6hLO0i85vfcJnERfZ6aJL+PU6xAKFo3X/NDS2q2PNXwS7UbkSuKPBeK
	kiNKxH82/9gt0vdbryJF248h2Qbe+4X8wFCiKwAOvHPOsdHDMXMrsHMHoBig5kmHpIezPJNZFxn
	q7+JPpE7W1g61tqTM3JVc8=
X-Received: by 2002:a17:902:a70a:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2b5f9f93101mr167276235ad.33.1776874840051;
        Wed, 22 Apr 2026 09:20:40 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdd1sm170335445ad.38.2026.04.22.09.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:20:39 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vladimir.oltean@nxp.com,
	shuah@kernel.org,
	xmei5@asu.edu,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v5 2/2] selftests/tc-testing: add taprio test for class dump after child delete
Date: Thu, 23 Apr 2026 00:19:59 +0800
Message-ID: <20260422161958.2517539-4-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422161958.2517539-2-bestswngs@gmail.com>
References: <20260422161958.2517539-2-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test for the NULL pointer dereference fixed in the
previous commit. Before the fix, taprio_graft() stored NULL into
q->qdiscs[cl - 1] when an explicitly grafted child qdisc was deleted
via RTM_DELQDISC; the next RTM_GETTCLASS dump then crashed the kernel
in taprio_dump_class() while reading child->handle.

The test installs a taprio root qdisc on a multi-queue netdevsim
device, grafts a pfifo child onto class 8001:1, deletes that child,
and then performs a class dump. On a fixed kernel the dump succeeds
and all eight taprio classes are listed; on an unpatched kernel the
class dump crashes, which surfaces as a test failure.

Signed-off-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 .../tc-testing/tc-tests/qdiscs/taprio.json    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
index 557fb074acf0c..cd19d05925e40 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
@@ -302,5 +302,31 @@
             "$TC qdisc del dev $ETH root",
             "echo \"1\" > /sys/bus/netdevsim/del_device"
         ]
+    },
+    {
+        "id": "c7e1",
+        "name": "Class dump after graft and delete of explicit child qdisc",
+        "category": [
+            "qdisc",
+            "taprio"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "echo \"1 1 8\" > /sys/bus/netdevsim/new_device",
+            "$TC qdisc replace dev $ETH handle 8001: parent root taprio num_tc 8 map 0 1 2 3 4 5 6 7 queues 1@0 1@1 1@2 1@3 1@4 1@5 1@6 1@7 base-time 0 sched-entry S ff 20000000 clockid CLOCK_TAI",
+            "$TC qdisc add dev $ETH parent 8001:1 handle 8002: pfifo",
+            "$TC qdisc del dev $ETH parent 8001:1 handle 8002:"
+        ],
+        "cmdUnderTest": "$TC class show dev $ETH",
+        "expExitCode": "0",
+        "verifyCmd": "$TC class show dev $ETH",
+        "matchPattern": "class taprio 8001:[0-9]+ root",
+        "matchCount": "8",
+        "teardown": [
+            "$TC qdisc del dev $ETH root",
+            "echo \"1\" > /sys/bus/netdevsim/del_device"
+        ]
     }
 ]
-- 
2.43.0

