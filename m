Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A893518122
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110826; cv=none; b=jlH5QpnsxZG0ZRtp2emAnedWEGl2JKKEkXFya4eDKYoBZDEUi4GbllQBOKM5zZHvOgbxWGRmCl+HNRYsLOV2mXh6xRwk1FE29biDFTxgaNGXctflxFkXojFeECEzwlqcQ3jenVb68FKPG38qD9Wu8tJ0vPvv4e3lEF3V5y+k+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110826; c=relaxed/simple;
	bh=EfkQyGvJKcJIlERuYYl99LlLoocWM/vzIQceRWFC7Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hPQX60xNSDq98NM8U7DX1qWWzucxsyo/GEV3oK9/MTAsCASRreLp0f1umMZX281cajDtmCzX6wridIGzPwnpiKR1L242905hX0tY9HJRK0/zXR9GvNW7eyL6kx53BUl2HeiKoL2EBNP7WCJl8FYsUbzzTiAf1KDJxJZdcxXjXg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nteFhT8i; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nteFhT8i"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so236911eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 14:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110800; x=1790715600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=nteFhT8ikcT8uSOS6GhxMTKGk78Sm+wmngeuLT/gn2Qi3ZAOQXE5U4npEcmw/oRHk2
         I2etmKeTLIZAlwav2Rc2QKnW5axSvVA90LyTuQBpwd1B2njIN3SnrliKTjXh2HkFmkSs
         MWvK+gxVAX0Qb2HHD1v8m8wDg+xgCx/GI27kI1VKiaAsNJqtFRpNZXxoOXUdmU4s4uZ+
         Nh4SZxk/Rh6fuDg5uU3tkA5G8DMIwwNH01i8fo+fRY/F5rseAYxp5D3nOPS+Me47GJHS
         3ebOQzRuYKzYHnR/2Nx+LLlUKsThFci3VTowY3ys+ATRPIniA8cQDK1mpUwFs5/tbWHs
         +ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110800; x=1790715600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=Okzaji7Z4YX9DKPMfUPJRj+0LG0EygJCtg/+RBCqeV2TgL68Mlp+UNaFlVPUQopMTH
         rPIb59wYNyudULvfQttV4Cs1Ly0f3rTLOxZtqI/XUXVnBeSlyH3xgOn+y6nYWBgyqNRE
         ECMB4M3Ib80tHdV9K4fVnu7BL82NLGKmEVbSfpk6vruYQ2kxYq/OcgM4biCyvaAy+9fM
         /6fgsrOuLgkQSm50sw3V+89zWPmy/ysEWJiak3Q+Kt5TyjpoH/mwaePeRziRG1UN3nxj
         Bi430RuOXOF6mYG6kGMj3FnR3TdUyJYPpGIsTnxRnlYfcnCf/Q0WcuIn2rutAT77kfJR
         Tw9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0xkMhschL/RLUnm9TBIv6IAxeGDrxmuFGCEEWYQX4QBV34RF+dU9rhdXqv9B3Qg+viWhHbUH+HValMqk2u3M=@vger.kernel.org
X-Gm-Message-State: AFuF++lWeN2v7STD/0ouk7+scIJ+nTNUyUh3ddp8jEhanSG3TyGwkumF
	nurjnWId8iKNBy4fk0OVAsWQasxkabfLknm7w9qGY9+twUo/61cEXP7q
X-Gm-Gg: AYBFou1vtJzAY7+h6lzcKM2mmdqYBjct8L8mk5sDpqRU6BCGiW7bg/Vonm8qPK8hkAY
	K6zz+OVzBPKj7FsoaKDBISuJlXfTgN7fPPlEGaBQIyJNj/lsU1Q9hN+WVYD1x9Wco7NU7be+Pi8
	n0Mc1ELJSCDN5g4oe8gAfjUbgdwUwsZNONnRjdYtVT9hPe/bTtr5HqdAfKcAryuakG/aiiGItlt
	6Yn4E2gnSqyeN7fmZ0BMGMvo5KyXL4ehgoZEi4pAMzK00PvcHv+greVrrztJcRltAXkEHBS1x3I
	vkTVbtpxknBiVxl38eA2xqooD/h9aDTKGCqqFJ/k9QlW7eiRY9pUw5Gi8tKaTYB1JE7IIBtG1r6
	Rdc805VVdt+hBPOWToepDgZYe69UnvJ4fKB0rCuUxqAv7UAunXpUNQWLdXe1b+g7vaJ2jLmcPDt
	fAt4m1kCV8ffu2obERaOijXRAprxK+ZmVpCF7ih0ZkO3RHyc8yjGMahODJvYHEjSd2s6ENXSfwc
	HfY0pjAkUC0Hx0C2kYMDSLtclL4STmFpFmExVLKQdMCjvBjqjNJJtED1WOgcpPnNuNmOAuviR8=
X-Received: by 2002:a05:7300:ce09:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-33e8e0b95f7mr439345eec.36.1790110799660;
        Tue, 22 Sep 2026 13:59:59 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm760952eec.25.2026.09.22.13.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:59:59 -0700 (PDT)
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
Subject: [PATCH net-next v8 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed, 23 Sep 2026 02:29:23 +0530
Message-Id: <20260922205924.32173-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922205924.32173-1-hemendranaik@gmail.com>
References: <20260922205924.32173-1-hemendranaik@gmail.com>
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

