Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7572F49F6
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785591787; cv=none; b=AMgMjP+jZyRA8DeXtj6SDjJx50lAUHqt77wXze7FXSZXGOuYSD1bhs4HXwp97Sig7JW9mzhWnV/RuU14nWSnjr+ZIp+YBbUH0GEoz+x4zn+SAfq6WRPXfbk/dm9MP7s02Tj0MPHMYVxqzH5J8obgFjM0QvVtHktxqkM0JSnwJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785591787; c=relaxed/simple;
	bh=pb8bhPoTH0rHkw3kmuOdle1bI2sKEr+SbI9ru9+uM84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXJE8S7e5HXiihLYxVT8CPEdz0CRaZJs7I+2vLr22lbNTp5ogWQm3Q2m8Z6IiJaW69CM7ZTaV1WD38bM0Fh6H/P0UaUsyimwXOKyeeuSpF4G5lEwtJQrA2sE2VTeI5BD6Yo5kILJPxTWyRFm8BeVc7ZdaRKVyQ25uliH6x5zwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By8o/p3M; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By8o/p3M"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb662575d3so1075940a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 06:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785591785; x=1786196585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqwX7lGfwVTZrv3NkOKGPL2b4D0FBuhrUgvXr3c+0ww=;
        b=By8o/p3Mx7rHNvlCav8tDoI7GD4W3IULH5tv8iOEVPAugRVJDTnMG3fTsu1Cz4NwDV
         Wvf/1ay+jZs8FukkoIiFPcme21HgNS+dX+ncpyxgdpz7R+plZkYDIYGj4XubiBvVqaSF
         COiUfxhrvwt1eeG1I54ssPQJ5weVJlFgNBDdjwhH57xpvYUveFmEC5AE1Sjyyf4RkQXv
         whMUZYrG3nCGnWor9YWn/JwMdsZ4h9vAkJjmBuN2bIk2OWmmjaIdwxQeQZZWHl8J91u7
         ikP+CoPsK8tRBscLRWiiq65UMNlTZF38HoYT/AHVPN3QX4bt7hjjkRf62WaHvUZOi4y2
         Oqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785591785; x=1786196585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqwX7lGfwVTZrv3NkOKGPL2b4D0FBuhrUgvXr3c+0ww=;
        b=O2dNiT8GrZF8MZ+MxXUsg8fj88rDScorhWC2gvR/I6vByxJALCSFP2yPt7UUP0IciR
         6Zx753HcV9cTjGowvCHo7ZDZdnl+KszYxs00vHhLQYK7EL/fSXRy/Z4xYpKMpcnv1SJ3
         sBhGO28KM+qaG7JzbDJs5vxrRaaBt0PNA13CYkq5GZM+f7Ykupidcc1CTmF5W9n3Kinc
         76Xo27rcALlcLUnObgo3j6AZ27+aeej43fQ5VMRvWx77L1p9NliZTeg+Hkam/2HJypDX
         4QneGEoOrO17Q4S5yO2H2xZCJsYF5LR4/JQXSJ+U0eX6uojSnZyLaBvPf+jMr9ctokv8
         Kq0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvOAhDvNrad/J2Jp4OCquXjXHwmFU23sGSDCuI+cn84wMSCvIJHwRQRblpqSaqpOxuGp62chlOoCa8kvQqMNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+plOe1T/oqHmemFWsniRWwpZJL/GT8RiFtKFGCKTSs3DLyQp
	bF50rYO2Cd4E0aTdkQbq8A0p/484yHpepHoUkjvBkJgGsxWQsuYcqBp1
X-Gm-Gg: AR+sD10E+cyicSYW/DWKVqYUstwrvVgy9H5XPXzo9j6uaeo3cLg//9+4YwOqhWYElWg
	CdOX4531+b7j05Tn/UFsC5SoB7ldvy7DssJqHUV85dJS71/vrYNMx+beGBxLBRRGJXKDgXGyO5l
	eotqgAaIn6N2ngvsWydM2jfOjKIpIyfYI7FscJtY9EJz26XNbFU+XgQaX/x0jGLut5gvtwF4hRl
	8twmAB7PYW9maTkXRkh5BmoicnzkoF/mC5XpgGM3cUw/9G6LTJzPV9hYgIKmMzo8wEEiHFLXbVw
	XRd4GIiV8duDPpSiVlvIrGH3RdDj1VWCy8qLNkbI2LSzTTyWEzjzKjSGvHXZsFgRXhbFz/8y2ix
	1dRr45MDVyhQbRtWM73P181gjBx4jzuTPwH46iDtySDZxcXKq5M/BPs9ETZ/tpOvYfR3Fk9UiXd
	y7hzpZhWNaBe9ARx+kcBz8OdpvT2qe1PjFuoqjdaQT6lolafrhnWSfiakMXumYSFke8dR9WKGhX
	RWq
X-Received: by 2002:a05:6a21:10d:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c92a85c84dmr3413623637.33.1785591785010;
        Sat, 01 Aug 2026 06:43:05 -0700 (PDT)
Received: from enjou-Legion-Y7000P-2019 ([165.232.167.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm16077652eec.1.2026.08.01.06.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:43:04 -0700 (PDT)
From: Ren Wei <enjou1224z@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vega@nebusec.ai,
	milkory@outlook.com,
	enjou1224z@gmail.com
Subject: [PATCH net v2 2/2] selftests/tc-testing: add qdisc hierarchy depth tests
Date: Sat,  1 Aug 2026 21:42:34 +0800
Message-ID: <5cc2d26a7c8e553759cdd29a3116f843fabc25ba.1785434373.git.milkory@outlook.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1785434373.git.milkory@outlook.com>
References: <cover.1785434373.git.milkory@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zijie Huang <milkory@outlook.com>

Add tdc coverage for the qdisc hierarchy depth limit.

The tests verify that the deepest allowed hierarchy can still be created
and that adding another child qdisc below it is rejected.

Signed-off-by: Zijie Huang <milkory@outlook.com>
Assisted-by: Codex:gpt-5.4
Signed-off-by: Ren Wei <enjou1224z@gmail.com>
---
 .../tc-testing/tc-tests/qdiscs/depth.json     | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 tools/testing/selftests/tc-testing/tc-tests/qdiscs/depth.json

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/depth.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/depth.json
new file mode 100644
index 000000000000..48f8683f0d1a
--- /dev/null
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/depth.json
@@ -0,0 +1,74 @@
+[
+    {
+        "id": "ad43",
+        "name": "Create qdisc hierarchy at maximum depth",
+        "category": [
+            "qdisc",
+            "depth"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY root handle 1: htb default 1",
+            "$TC class add dev $DUMMY parent 1: classid 1:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: htb default 1",
+            "$TC class add dev $DUMMY parent 2: classid 2:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 2:1 handle 3: htb default 1",
+            "$TC class add dev $DUMMY parent 3: classid 3:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 3:1 handle 4: htb default 1",
+            "$TC class add dev $DUMMY parent 4: classid 4:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 4:1 handle 5: htb default 1",
+            "$TC class add dev $DUMMY parent 5: classid 5:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 5:1 handle 6: htb default 1",
+            "$TC class add dev $DUMMY parent 6: classid 6:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 6:1 handle 7: htb default 1",
+            "$TC class add dev $DUMMY parent 7: classid 7:1 htb rate 10mbit"
+        ],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY parent 7:1 handle 8: htb default 1",
+        "expExitCode": "0",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc htb 8: parent 7:1",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
+    },
+    {
+        "id": "c519",
+        "name": "Reject qdisc hierarchy above maximum depth",
+        "category": [
+            "qdisc",
+            "depth"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY root handle 1: htb default 1",
+            "$TC class add dev $DUMMY parent 1: classid 1:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: htb default 1",
+            "$TC class add dev $DUMMY parent 2: classid 2:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 2:1 handle 3: htb default 1",
+            "$TC class add dev $DUMMY parent 3: classid 3:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 3:1 handle 4: htb default 1",
+            "$TC class add dev $DUMMY parent 4: classid 4:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 4:1 handle 5: htb default 1",
+            "$TC class add dev $DUMMY parent 5: classid 5:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 5:1 handle 6: htb default 1",
+            "$TC class add dev $DUMMY parent 6: classid 6:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 6:1 handle 7: htb default 1",
+            "$TC class add dev $DUMMY parent 7: classid 7:1 htb rate 10mbit",
+            "$TC qdisc add dev $DUMMY parent 7:1 handle 8: htb default 1",
+            "$TC class add dev $DUMMY parent 8: classid 8:1 htb rate 10mbit"
+        ],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY parent 8:1 handle 9: htb default 1",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc htb 9:",
+        "matchCount": "0",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
+    }
+]
-- 
2.47.2
