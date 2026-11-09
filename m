Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208259;
	b=AoB/qeIad4aFb2risKoDFPOotg+gnxTSqccE9JnLklCi+Ej57UpVuvBGhXsDw7q5AlQx
	 amuVO6T/ekbkW4HgJd8P+LMNayfb+nQO4BgfPep0/Ljp8ymjgbW3zhND/h9dlRMLutUhb
	 if8qG1wzk9oxFMMw2EWGJZ+sMe+iGN5eH7OZ/TKQ/vjdUELhtY2a/ok1X89ftaEOfj7xj
	 irlC1GbTqn3c5uhUGcoXtnIVDVuDW3WGtfsq/WoURKy6NuY/4KSW0egcAFH4qoMkDS5Rf
	 4B4caefklJTYh3nqy9XQuPyIjmmTsgLXQqFVh2DD7gbrQ9MPa0oGyB0pQn/ja3LVLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
	b=KMUfj/MZ1Jg27FpFqFmJdf0+ZJZJS1SkqW4PDoK1LY8GoR/lKG/kNJjRX632mWs0TPeu
	 HiJ+0H0NzSnTeLLzt48Zd33p4/LNERu9WngdVloIAaZNPM3Cmh5iRb6TP23igHan61jfN
	 gZSzmKwkzqZdQ09qQ9n5XBBiECo984GJ0Bur6d9cVMzCpC7OKkvklvhaPPCrXQaHCL+Oh
	 Y6UlBAZIHVyQ4v+B/8QntEY5J6XpykfIYup0X2FvCATW59mkel/5pdjE7cO99MCjpdC6V
	 vJDfxIr6h3B3SygYb7vw0fepq1WzjjBc0F77WjYhY5CTgFNP/q9dwVsSSG9aKM3h0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lrxcpB//";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C3606A322
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 07:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37C3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrxcpB//
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9b69so525322c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 23:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208258; x=1794813058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=lrxcpB//IjTuPa7XFTDWdg33npJj5T51SLHc6M8AR/74UrbF2JHehRosylQO0o9XZ8
         j4RFL58oYnVWIv9sFQomNvmL5lZfqA4yN0zluUI/oaSPkOm47PjDowot5EUfn4AHGXqT
         cA38vbof9RnIcx752HV/8bqsO5uzBJkOnUWuKVS3QfaIIRvgAFjsL4cS8G5ZTbsc1ouj
         22osgFP7Chezl2hnKavXyxyFC64t+4LIE41HcNabkfPvbhqPiG2DviQ3+C9LRH9rQkjU
         WTBuAktne/jYLtMWTW/gdzxRR7QzphX5+h/TliNKEuhu/DBdMKXWcI+DQIjkosbkrPpV
         gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208258; x=1794813058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=ud9UdGsrjv4gkXIw5ezJOP58dWJGPjheeJrIMN6Xr+007sz4DlffeDreHMEv97MYZO
         ZWQiBUgifjHEUwtFCFSv1Tf8lCR/19Bw+Z2HyCPS72uLJLKz+mJAN5dZ6kbF5R/EAXSa
         MjHzoMpmuxjro9XQTvluDnGhn6BYiqPxxNV8DoTcKM33IUBZMr9F60PRtzBAa9GrVHLH
         FnI/micnMEKx+IGeqdq0n4AjLc9pMlPspJYgbAcjHKyWoK6p5rSVjl3mhhCr17Fd2sBR
         4cYVzfcw1nLMUO6J8p8MNgnZcx6WvaJww9nVSRrP2sOZEYvn2U41e+ugMK+KDpIEJRl0
         n6Tg==
X-Forwarded-Encrypted: i=1; AL+hErF5s+AszL8ukcQ7L+2fUXrBhFwFYRCKzaELZY/DCuRA7c1AbROfJ25I1TLDTTQjBaihIdSXJgi/ah/n4YaVCqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ofWZ7kCajQgXAsOKDJcPIAtQOljdQuydtIjsLMiuqryjp9fWb
	dPgFIe4DkM3tRmbgElG2EizTaWb5wSJsfrSnTx7TzPD7AC+KLMnQt7hH
X-Gm-Gg: AYBFou105QGJiaK5kqqaJ8MOL7SLdpjLBMiY/7+wA5hyuz1sEHAWntkwOPmG84+8pqW
	l87hSRXJtt4b3VzeDNWknJVv7wpJAfmHgj023anDhQ1uwMOd570fRo24eBA2vEnyhJc3qo9rv/b
	PIqCNMPXfDHlnx57F7XQs/qJ7TBR1J+STmbnzDxFSXLwJKYWumWcqRQtC5Ib1tn/94S1tFJyNsx
	Ylw+6547SlJeb3cY/NwQ7VD5zAIbiAkV+SrWhMmqIONSUm/o80oEmZ2+fZId9wRdW9Gh+BMjvSb
	TLcFiwmTyh4Pb0u1a9yc30PqJojLdwAJybwL7/O2RBSxNG86dLQHMnKjVRWw0FvwkWdeuKbUp7C
	JOUq7AlT60q8/O50s3+pJwLvDYESNKS8gb+ihH4XUwt79i6zNMhFc86jyuyfYBA8n2IH9hOSPgO
	XIkzhq4ZSQLLocx8g1dl4RSKn8iA5UDjS5uWrUBvuOH5oDVrE4qNN87sg6rwZ8Xwp0m+YUEZ9Vq
	aRMg1/9Tx173VNVsWhYS5AyLdbwTw62xt6u+vawDX6EgjdjTOxC77Rwfzk+xVYpfBENBWVxezjN
	chSnbcj5vNeIYIKhwW+KdBiPxFvZ09Y7DqHXnKZZbLdRoOyhZk+7QILr0CruszYNb+UaHf4KAef
	y8FrXjBYpIZn7oMnQTvlxPv2uK5jk
X-Received: by 2002:a05:7022:1586:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b39fed11a6mr5130904c88.17.1794208257851;
        Sun, 08 Nov 2026 23:10:57 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:10:57 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 2/4] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Mon,  9 Nov 2026 12:40:15 +0530
Message-Id: <20261109071017.438478-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
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

