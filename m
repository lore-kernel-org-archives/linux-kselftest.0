Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90123315D32
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 04:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570079; cv=none; b=P1Ze/s7PrA1qAHY+fjGYGcctmwVwTiN6VqLZv+ToUNMKsVgc8za017f47MPOXV3/lp9EQVTfDJuGy61mTz0bu2tBa2GJQKUkLv0V2VigPoOQ/O7D40PXdPnlcfr+GEb3PACw4/Y+6p8n/xkFqoPxYtgLV9M8yvP2flCl+rXeKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570079; c=relaxed/simple;
	bh=EfkQyGvJKcJIlERuYYl99LlLoocWM/vzIQceRWFC7Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+ddaGwr7JKE9pnzxBAgnGBU3JvzcIW8NTDEiXI7l5tBDg6oRBGEhSzDpmEQW2FluZC1ECzBvF7LvSpAjqEi4ZGvFEs+NO58hopACxALpNNILxzx5dtBOugtG0u4j5fILrI8cPNnzOa6ZKH1I4Erpdfg8oBRvdNgUZVVt6n7DQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSGttAIe; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSGttAIe"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148b5c829e8so709193c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570078; x=1791174878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=SSGttAIeCU47ECAoDOt7zXP3utQfxuIKuhFJ9cs8NdO4mPYdpWs5cLj7wT5bw5tR5R
         PahxToIkbfRi9AJ8Zkj/fDrh7NQIBfDFeulZjXaqsT/PkqcDPq+c9S00sgA9qAXKsdf7
         D7kcir+PRc35UjwTOHrifaPA309GScZ01saq8FBg8doEiZ8nQYjvPMH09tZYsO/BGzb9
         JABjjcghXUn9Laugp0E3QLe/MEP+n/CSA/vaBia0AVkm/H4TZ8dKLJymv9FBYmxn83hu
         6r/ATSUgQuVut3zGvpLJlkxZFbEkkSWrGNTorNJCh3ey3SZutP8LVdRIYuraT2JXbM+J
         zDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570078; x=1791174878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=pYnlYSGN9XC1pmtJLwAfMmwvbZ1myclgKacmZ68sHA9V34TZvLX6GZwqjBdNnILY+7
         qitR1GTzHFuU1pbjZxs84tIN5HJCPxEzXBq4pvGfShK915qYWUhLcioob3xZWfHMRptH
         seP18wu4bZa5QOGfBC+dmjV6Zhsg9jo3Vks4byF8YDQbl5uEx2XmtFYan6brxHozAuI9
         bYy/ks3cDz/6BsdrETo7oFPp9oqiAqps95+dx3Jtn+kPLf9gq31Hj3CVLetoUsEzxlx7
         fQhF69XUotyLhjxwEkDx1J8J1pxZTXjGKG2VoeqJTDy/FQ1AUcMqJKpD5trKnTW1fmBE
         CYPg==
X-Forwarded-Encrypted: i=1; AKwUvBy+/w1OScCcDgnB4eqM8jz0Xz8Iqr1dQbuLdrWbh83042D82+fmNN5k0KZK8/cufBRAvGH8k+J7SG92F+hNb04=@vger.kernel.org
X-Gm-Message-State: AFuF++nGa0FLcdhDe9KwGfHK9/2QUUEoMunAUaeuwUIqrQNRUpbjQKWv
	bmJmiEnehSvSBpm6xee/8WvhBVG6RQ/dA86EtLzTnl/qq7gmUZ8KNxWd
X-Gm-Gg: AYBFou2aZNkNH9YV/xfJ+BzsAwxH+zFXgfcx6UaZInqWA/2bnPidW4xiixzebGi8spq
	1qVLM9cQ8zbA8HCZ1sC4pb93aB57IH6JgQBlAWy25sTfHA2CA0YNNsuDAg8J4tCNXaSEPpgUqmn
	q/9w7uPCm5Kf33Dm07E/ARQJH29IEQh1S43o57aKSJFOIuwsrQRCNWWRgO6hiBamL74BY8BWWdw
	TACirZ0VQ7xWSHtqxr9VxbtJ7BSmljK72QcBhB5JMviI7l5wAlJyPP6nrYxzmwZ78adPqYFZR+m
	UH+T5AKcOfd/jce6GXqf0EWZF1v9qcDGfBYV6EEqF++kx+ILidwMbUAsHawh1050+mnUvx/QxPq
	vRr3f500ZJi+Qd8tu9pBvuPra/1yNrrzBOZ0iIRMImz9N9ET3Qo66i48Kefh5FyD/UmzWNluvJz
	BrcwGfUqdtD73y4AijMYpQzDESWXO9esS2bjmxqHVmRcEggdKfHyC+Ok9BjHhhV04tyW94nWy49
	6+ogpYFY9NV/rh2EuvtL+6BvSk3kYXj1RvKVthf26ek9RHertMFV9o5huCN0n7oi5dwCr0Ndbdj
	9fu4Lv8=
X-Received: by 2002:a05:701b:4204:10b0:139:fb6c:b37c with SMTP id a92af1059eb24-146ce777babmr9343617c88.21.1790570076591;
        Sun, 27 Sep 2026 21:34:36 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27921045c88.14.2026.09.27.21.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:34:36 -0700 (PDT)
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
Subject: [PATCH net-next v9 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Mon, 28 Sep 2026 10:03:57 +0530
Message-Id: <20260928043358.6866-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928043358.6866-1-hemendranaik@gmail.com>
References: <20260928043358.6866-1-hemendranaik@gmail.com>
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

The per-flow counters themselves (prob, delay, deficit) are printed with
the companion iproute2 change, "tc: fq_pie: add support for printing
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

