Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2573B103B
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789236568; cv=none; b=rmFuGMmLJuGH+kRyyC2REepXkG33Tcmh3cURnQrVvvfJ6RadYFQsTX6xN9+eo3S4QsAgycVTp/1tYI8z3cJgcYn4k/gz4x2QvaF1Du+H6cDw75c3Wfjuzi8pKiy1DGrhBNsxSWxpaWtYh7GDDdcoEPbwuqOZU0KhY3/jWdOnkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789236568; c=relaxed/simple;
	bh=ZCovFqiMjtqVQsqXGw//gYwhLWDer5nSHiejNsreRFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJj8Vuxkz2M+Q03I1gEeAcPrd2lxeAji9sh5Y/oUgF+Jv8+AnzmTWFtIbx70oz64qde5OMIY7bGNAtt8o/d0QvXrCZiElfWuq9KKeNunBaVBczYmoH40XjZ39DKElGVKlN6m4lY4W/bpAZ+BWZhdq1UlYoFjtD4lLV2kuhWI7Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=hVyRaZI3; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="hVyRaZI3"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcc3e03so3630696d6.1
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1789236566; x=1789841366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVsgq1Aq3D81njq/SPaFOtkNYzTEGSYorhvpSAlQpRk=;
        b=hVyRaZI38Z8UXT8w82R0UCBIyc/ENY11mz82PxFeY6OMPwFtsPxvPWl6sYhLsY9QO+
         g4ZD48322JsI/UuKX0kPqaMRViP5X0RWJ2SbuarHdKpOi79J1x2q/hr+cXfdvGv77UNn
         qIPAu0IMIqFJ/atmc8LFiHowpGRLvwGZWj3pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789236566; x=1789841366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVsgq1Aq3D81njq/SPaFOtkNYzTEGSYorhvpSAlQpRk=;
        b=nlN80mSj88bbMKom/l6qujNie/uZPAwiizpC1EtK1dlvWEkQCKaDKZPs5InL+jbUjy
         FQGxKWUXnMsHoNwyBFLrJ2mzSPwSAm7M49dYqB1xjdzkt3K1bBmSChll4yxFScKC9FjQ
         hlsBtUjnPZNZthJTHfActdzdRegIpvVO2zUQHrscRvFKKhUAV7QFz4K+YVuhjGG2/1cB
         xd+iPedkyy3N4NPOSnALoXHnTlKa+0ljaf4bWcdznR7Dm1JmwkOLE/akEVmVqjyFBE1w
         vsG0AZvgqzvvgFKxXadbxPqi6dNtweK9G5PI10kUbpOBJm7ZEQlt/p74eydeQ0VJAAAN
         +Gsg==
X-Forwarded-Encrypted: i=1; AKwUvByvMcBgraeg2VNxszHq0wCG+tiIjDoIfgX50phPtt7V3LTNXAvLh8gfFEkuIv2gngp7meVB6G+5l6bduHPaw7U=@vger.kernel.org
X-Gm-Message-State: AFuF++lgu2Y2DFv0rb5xl6iA0C5h0HdTW/K9N2Uril7srbGXHefGqWAU
	X2iC9Eg/qhOTg8cV4pCR/OHQ8bFvosFG49Qudhldhb50MES9NPKN6GAuoSXpCrrXvEh+JTJm89K
	BMA56jQ==
X-Gm-Gg: AYBFou37liOOa4lMiK/vS6Rn4BcYQ8KD+uYx6IHKFXuxP16T1VkEPpk4mj/GRuDQVMN
	7X9ypWqkQASRTK38WlSztDVPRTRixzltLwhZurecBDfwm7Zm8ZeA3QrjdTZtJtLn9mJXxlUGtv+
	8sxYina1r9Vg+vPGur0hC9/tGuEJJbFnNzQ90zOlhCriEBWbb5HF1Ouy48OzbssBq40kZhPE+om
	7VdtiFdbsXcxv5CB3ADNylGlBygXTz/AUoQ2HKV2FML/GbVRpaLUUmAt9Yh2dsrl43cXfCGkKaj
	8H+elPV0/ShmDnro+tfXcRxi0L74jbeHEzUIwC9DGvR4gDjd5BycSl5pO/8aYTWa9fiPWgvDdh4
	jX6u34GGxahV1V/gYk+McfsJvHtFEEXGFT3rpCzEYtGcw5ZmSVuH/1cj+c5bIZ70s7tXy/2tx4S
	q3nSR7/8F/xpVwrCg2TlviClV9vN1+TJcb4KdmBR+GH6jCk9FMWtEVparex76j5nbbEpJOS9MDo
	xQkLybnImzw3HqWSRuQRW30/iYrnbqJMPKSgjSDmUrwlfnzr9fW0DF+3csHXI5jcdzFF9YP0W/E
	bFihSs8PsFS8JO8jgZX018s=
X-Received: by 2002:a05:620a:6f04:b0:939:7d14:1c75 with SMTP id af79cd13be357-939e8afb739mr1339388585a.6.1789236565939;
        Sat, 12 Sep 2026 11:09:25 -0700 (PDT)
Received: from majuu.waya (pool-174-112-106-84.cpe.net.cable.rogers.com. [174.112.106.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e811cffdsm549888285a.46.2026.09.12.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:09:25 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Victor Nogueira <victor@mojatatu.com>,
	hybris <hybris@mojatatu.ai>
Subject: [PATCH net 2/2] selftests/tc-testing: add hhf hh_limit cap tests
Date: Sat, 12 Sep 2026 14:09:20 -0400
Message-Id: <QDISC-B855.v1.20260911153152@mojatatu.com.2>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-B855.v1.20260911153152@mojatatu.com>
References: <QDISC-B855.v1.20260911153152@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover the new TCA_HHF_HH_FLOWS_LIMIT bound: values above 2*HH_FLOWS_CNT
(4294967295, 65536, 2049) are rejected with the configured limit left
untouched on both the change and the add path, the boundary value 2048 is
accepted (installed at 100 first so the boundary change is load-bearing),
and an add-time hh_limit 500 is preserved instead of being clobbered by
the default.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Tested-by: hybris <hybris@mojatatu.ai>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-tests/qdiscs/hhf_flows_limit.json      | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 tools/testing/selftests/tc-testing/tc-tests/qdiscs/hhf_flows_limit.json

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hhf_flows_limit.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hhf_flows_limit.json
new file mode 100644
index 000000000000..44538b9266b6
--- /dev/null
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hhf_flows_limit.json
@@ -0,0 +1,128 @@
+[
+    {
+        "id": "e3cc",
+        "name": "HHF hh_limit rejects value above 2*HH_FLOWS_CNT cap (4294967295)",
+        "category": [
+            "qdisc",
+            "hhf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY handle 1: root hhf"
+        ],
+        "cmdUnderTest": "$TC qdisc change dev $DUMMY handle 1: root hhf hh_limit 4294967295",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc hhf 1: root refcnt [0-9]+.*hh_limit 2048",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
+    },
+    {
+        "id": "f681",
+        "name": "HHF hh_limit rejects 65536 (above 2*HH_FLOWS_CNT cap)",
+        "category": [
+            "qdisc",
+            "hhf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY handle 1: root hhf"
+        ],
+        "cmdUnderTest": "$TC qdisc change dev $DUMMY handle 1: root hhf hh_limit 65536",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc hhf 1: root refcnt [0-9]+.*hh_limit 2048",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
+    },
+    {
+        "id": "223d",
+        "name": "HHF hh_limit accepts boundary value 2048 (2*HH_FLOWS_CNT)",
+        "category": [
+            "qdisc",
+            "hhf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY handle 1: root hhf hh_limit 100"
+        ],
+        "cmdUnderTest": "$TC qdisc change dev $DUMMY handle 1: root hhf hh_limit 2048",
+        "expExitCode": "0",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc hhf 1: root refcnt [0-9]+.*hh_limit 2048",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
+    },
+    {
+        "id": "147f",
+        "name": "HHF hh_limit rejects first value above cap (2049)",
+        "category": [
+            "qdisc",
+            "hhf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY handle 1: root hhf"
+        ],
+        "cmdUnderTest": "$TC qdisc change dev $DUMMY handle 1: root hhf hh_limit 2049",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc hhf 1: root refcnt [0-9]+.*hh_limit 2048",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
+    },
+    {
+        "id": "4d4f",
+        "name": "HHF add-time hh_limit 500 is preserved (init does not clobber user value)",
+        "category": [
+            "qdisc",
+            "hhf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root hhf hh_limit 500",
+        "expExitCode": "0",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc hhf 1: root refcnt [0-9]+.*hh_limit 500",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
+    },
+    {
+        "id": "ca99",
+        "name": "HHF add-time hh_limit 4294967295 is rejected (no qdisc installed)",
+        "category": [
+            "qdisc",
+            "hhf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root hhf hh_limit 4294967295",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc hhf 1: root",
+        "matchCount": "0",
+        "teardown": []
+    }
+]
-- 
2.43.0

