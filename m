Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4882AD2C
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781441463; cv=none; b=CjyjlWYBMc9sB0muv7UnkgmWLiUMufeAIQjUQzWMhXMObVWt+EGGc9FtwMa4F6/2Pc19+HtPIiMOyFUfLBzoxVeFk8om6THdKOfppOZc51xxVU8SGUGz4GQkTsDUMqtBRTIhISpFF9dgO/0Iq/MSNO9NoK9r80ig6PSeUq0nws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781441463; c=relaxed/simple;
	bh=cJmFCJ92IYSoSzax7fOGA70pUpe8oKCRnIUNCAzpux4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q+eT54jAl4j/esu1cCX1RJFyQhk3xwSEGRn9h5ZZE1az4KfHhhtBKeUp5tNyRMLHVlBMcIOmEMcRwnHlALRyjXZfznv7MesbX8Ir/IHt1nBaK1CWZuUeHxEeJj8R7lUSHEuS9jUY6AaaclqIeEZHe2r8tI96HEJ5Ft1AGWrC64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGZVK2fg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGZVK2fg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf125989f2so17882945ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781441462; x=1782046262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtT+TuK8jetIMA+MPsNEijp3ifUb+mwfZ0dCpHYIdO0=;
        b=dGZVK2fgHVUd967jC5QhH6007RmlsczXs6joJD0W4+r0MRJTNya0V9P5j5s+RTj7tK
         lyoKBg0OEnx+O37GU4KxkLB13/TJ71IpzK/tP12WawFCWxS89H/jnSp3NQ0mQzoVi15l
         x9KwTSVbfKNx+qR2gPAb/54FTIwlE2E4Mi7ntj0nbgXK+JLIXMHoPwiAYuqVixDwwFA3
         mbUi/3c1ymSTyZyWoX6p6zVYfqtpR6hiQmODsXICI50tFDKZ/N5ilLEACg5kZZTjZiu2
         polpY3wn+XDQ7qHHjnHefK+4wsEJ4BZ0lPBbW7RrpH7vMLW2YcqTa91ofFnpEeCd3DiM
         cyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441462; x=1782046262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MtT+TuK8jetIMA+MPsNEijp3ifUb+mwfZ0dCpHYIdO0=;
        b=rf6jYxIyiqaqofzhbTa619dlDc+zVMv1Ia43NHaX2xH4BcYjiM5aFU5rsWmMZCWoWz
         6Hs3HmWn8cDeiu318HUwTweUcGMqeoKUfh0uzXh/LoBINPwAX/DNESTiM077T2sAHOc2
         pLFB2xyDiMR8zeLk2U2Lfxto0KqEesxrEttqfeX6Qnx01TaVkCgsV8je/5p60EdpqgHD
         Tpu3w3iUhAKQ/JC3XceydXDrU6LAfQdsoJHc8AO2pEzfdJq45sOSedJfANm1Bmf/rVhW
         CTBXulLetxS2K8kXGXFebZLRc5q5gpdf9db75mfnOGbtULODgBlP5TG5eTDitDJrUjcO
         8jfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gbwid5t0VneFrAMSDDvETSzPHKpW+6XF14tstXk6ShmpQkFA8MmZkgicUR+erfp3kyST/jscPNbaejnlZqWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfQFegMoDtWm0qvKG2HA6/dew+deBYgLaUN1QEnwwGFkhsEKo
	q/MGbl+K5GAWfEukdbE6ErhgsEGC3i4W+GEpEIxdJT9on6vv9OAN4ZeU
X-Gm-Gg: Acq92OGShrip51WVgB2zGfWMfF/TOJwllOre+RB/lEBRhyqXGGSsYHIZ78Qm0zK+dhv
	n4IBiYSIIbxmKeypMaLXItItarhyBrbY/D5SexCKJxSogxlF/wALIqTN5+WXhIwRVank2FXbUcf
	20X3eXHn4vRZDoeZ3XXt9GilK6XJM+t/9yw94h+ya4vrPwXqOZNdMMxKBrR8+sz4OtFUNZXPQDK
	I8OdHwYsW8uPCwqkVmVcLt3H5ErEBACptstg2Lx3gPHygLmWIwEtMk1qHyXKDEwzbx8xCzp71A9
	Z+yvjkI3NAw3ZXU1OmP1XhR+G9eJntJYKtx2Fb/pMmnsjH/vtuFkyBHnqwwOLtAiiIp12QxBDyX
	35qqy9+SZnQQNIoPccn1qdGa51I11USCosMZZlY6BaVxWLazl/G5oAfkqh8z55nERJMaannjgiu
	w2M0GWoWX1jE2Yzw2ozC7qdYe1ZafrFjTgyMBcYM/By2HGl7nWKw==
X-Received: by 2002:a17:903:8c4:b0:2c2:5446:30eb with SMTP id d9443c01a7336-2c411b7e5a4mr108765355ad.11.1781441462014;
        Sun, 14 Jun 2026 05:51:02 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:90b2:9957:66e9:8cb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm66426825ad.45.2026.06.14.05.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:51:01 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/2] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Sun, 14 Jun 2026 18:20:00 +0530
Message-Id: <20260614125000.6058-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614125000.6058-1-hemendranaik@gmail.com>
References: <20260614125000.6058-1-hemendranaik@gmail.com>
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
Changelog:
 v2: No changes from v1.

 v1: https://lore.kernel.org/netdev/20260531125314.22492-3-hemendranaik@gmail.com/
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..88139f429430 100644
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

