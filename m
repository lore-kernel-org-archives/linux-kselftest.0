Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76315277C88
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232113; cv=none; b=awnnItw/tkDJMfwRQRA0Ufc3G8ZhUXtLALQKOeQ8NUpkU+3fiZBs7b7d47NIO4ZkrEYSo9YCJCJKwPqRVuudoKseIfjrwCWmt0ziXvmQF4yz8Ap/P7WdLQr2KKKJ9CJy/G15m3px0QxMT6SQ+cV9z8jwly/I3vEH4+ylSQ2IHCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232113; c=relaxed/simple;
	bh=8k0HUUGrKQdbm2dXES9LOTuJCiHdtOvz6RVV14YqWAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KdlGXTeoKPx/l96lq02w6sffGwz9PzWWQgpxEXv+vi4Kgdcwxd3pSM3yySFzxZfCNlzdhZKCAnI2CV7nL0iRes6RwJlqbkxk6jxFgI545INhnrIufdH6STXwrOdjavniLT7tcjoGprOZh9U5GNQVI+SWdlfoOtI0UHOx7qrnSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKtgVfW9; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKtgVfW9"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36da8439078so172503a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780232112; x=1780836912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jvjYYorspJJuCQZSL29dgMwijPlrOWsuologm7lz9E=;
        b=fKtgVfW9i+MlSfvJRHfHTgJEPEM+j3X7T75A4dt4fnwoBHTA/3BXxs7F8RmckvjNZm
         5tOcMeT5UtJcgI/hD3Iww+2KAglh1Xqqy0II9bq1n1GMXv9vx4d9Akd01vfSj9+Flvqk
         a5q6P1RI+r+27wazP3EUMWQY8PozZsgvWC9iP5nQaKVEIjyrVcEanGzYcsWkunvWeUQG
         jJR0DulX1/vXwm+D3hFD75hJ3AOR+Z4rKTVJHZwpNCPkN0rwEvFIapzIZ7LiPWkJ6ON+
         ZlEswBVSkswPOb9+e9VOWvJcVxU7PQm/rRk6fcLkXEPK0oJD8jYcpN/aj0DDaEhFULqZ
         of8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780232112; x=1780836912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jvjYYorspJJuCQZSL29dgMwijPlrOWsuologm7lz9E=;
        b=KValCwaHsVh2EahBr7E749QK6yeahTPkrweX6vjKv1opy142nBhETaOwreobZgPHkH
         WsA5wBXoiIA2NJmwRW5gVB1o1r7KM1qJBL8QtlgVLdbQ37j+Ou3OjVQq8X9mzwe9rP2w
         NyAMlkbm77rK2hk/2CykhhZELdTcSuXaygDtrKpvImhRtltSlUIr6K0WE0T9nISTi23V
         kNaPNHfCt38rNT4J2b3Edh/5dzjSs/ngMT8MYKd7plGu0ob7p8htKpora+Gt/+H5XQ0l
         wJutEDJlGOCGNMxXGdR1ef///pLxJqCwqlzHx9yLZllg3BsSUmCaDB2ifFFjk6GV0YJm
         S9bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tQqfvx4nlO15zfji9G3hr5f44698dw/PLwTXkWcKhvK9m8v+scmj2Wgr6Jz9KojXop5frgKCiFutnsudvKeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FD8Z7mtJPUGOb/fXxHFGnk+r1Im1vH7Azpjyr23+BPqAk6Lb
	hY2pltu3s1LkwAVcOMahyzYC44i9FEoMSO/XNxhsgpkIeNB9Db/U0LzL
X-Gm-Gg: Acq92OH/KkB2/+8Y3bTaF1caAPmS6Gl4CfIsGzvKLWHMFZmolZSryH/RBFNhje42qNi
	6PUoodkONNm/X6plB6OiX//0LIXkNMBoyMYZDsenTaRINrgsXLoDDCToaQeK7iwtvn1pDYvPs4E
	x3WX1rKn/G4SuxSOy4f++07s6JUBBhw0lLnWdIySBKOLNmIzCR80c4jTQ7ItyuDKKmcdqTCtB+k
	MJzyd17ohaT3/kjs/9J8o1X4/n/rJhepX0sT8jJMYmlGePGw91TNJ7jT1mStv3epqm+DkIaDwhg
	eUy5nd497JoucELzf1Rie2JCqrHvUFsIXLwCwk+Stm6tbOskogGcESbofWp6vSiL2L8EYQ3A5LB
	BHvid4C7va4uYZLMofd4An9RUs7/Wgb/M1kx5oXKmHAxUCmQemrF9F2BBRBRFMUwvmdMqdQNrq5
	WyDJdIZT8vqzaGMYMdC+D84/4H6+5SDEFKdu1ZFjV2UyS38/uF6blP21wV8f9Z
X-Received: by 2002:a17:90b:57e7:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-36d70c80687mr5091181a91.15.1780232111729;
        Sun, 31 May 2026 05:55:11 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:7f12:602a:a4c6:2b38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbfec391bsm7766670a91.2.2026.05.31.05.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 05:55:11 -0700 (PDT)
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
Subject: [PATCH net-next 2/2] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Sun, 31 May 2026 18:23:14 +0530
Message-Id: <20260531125314.22492-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260531125314.22492-1-hemendranaik@gmail.com>
References: <20260531125314.22492-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a tc-testing entry (id: 83c0) to verify the fq_pie class ops
wired up in the previous patch do not crash and integrate cleanly
with the tc class show path.

The test creates an fq_pie root qdisc on a dummy interface and runs
'tc -s class show'.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..3ef2fafa52b8 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
@@ -40,5 +40,27 @@
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
+            "$TC qdisc add dev $DUMMY handle 1: root fq_pie"
+        ],
+        "cmdUnderTest": "$TC -s class show dev $DUMMY",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s class show dev $DUMMY",
+        "matchPattern": "class fq_pie",
+        "matchCount": "0",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
     }
 ]
-- 
2.34.1

