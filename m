Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32513563D6
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088938; cv=none; b=OVWwS95SfC7eY0J8Y96meqtswyYlIy3ilk3DsnioS8vHS3m9IS2MaaE8wz46RSH0yELJaxFBPftGKZmfXvfJJ1iwudkbpZfhirK6hO5LbUDCHv70Nw5BqRKEZNMSW48UDlvEe1hPuBRHtnIaLjGdqayyzP1ODl/RbMcowtzUltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088938; c=relaxed/simple;
	bh=i2jgWiH8GIFlWr+HHc4CTYH7jDEMT5sLA5f88ZPEB20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V73RHYfawMvgKS0WxOI9o83xjuNWg82Gx3ALCkCXhlpDorLyypE8hvYkZIqyzNqWDGiobG3HauMXiAj91XDEyHSYJ+zHVo6yPRq5xpKt/5PMxM1vWu8ZNHjEpk0GrBVe06KCKNnFfTeTn9up9ejBwi+y71mLSXinayDmG3Lec5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpHq76zv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpHq76zv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a9296b3926so92933545ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773088936; x=1773693736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVfEy5APGf95FFLNoCWNdKxa5MIc0G6RQdiGr8r8l4Y=;
        b=SpHq76zvLKZmDd+ERhcYUT6np78QZ8FQ+pAHXXqrMwlojZUBrnwD5lmC5lh9eAO9xY
         CQzvB9+KUkw17k2PfsLAdm0bvA9m7JKOMcW94UFKqjGlO50wkRPWwOga3xo1fVYnDpYx
         pYVjjnYdNTdqrmGI/D2mWevqBZn6ib6xVI5wAJP1Bthb6n1cg3Wm8NXEtXdH7VnOHRqH
         CDHTuATRJrH9k39Qiz/m6ieL7P+FKCTsxxItTwsZ3pDVkNcsJNvIRXAUthQ7GtqqBFbd
         lb4OA9LX4zaW1adc6tPZVq+B1M00USjiGc+MCb9+GCU5Yh6kvQFQ7AnblQvPs4POHyyY
         9gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088936; x=1773693736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVfEy5APGf95FFLNoCWNdKxa5MIc0G6RQdiGr8r8l4Y=;
        b=UIAVd799YPFxUgWrw6vECZ7BN2qA/aBwUUajtxXc86iHgcUB8Ya444kcFdfBaTSlfU
         bnjWN1urNJPiHGX2jP6DK51fzpbaLT4iZ0OewwDle91mEbJ3bCCauE4MWEjYnLqlR6vM
         YNheQ/szzXXGu2RNJBL7ZKopC5qsFYWkkOWFoJ15KENa86P4ukUrjCCED5jeoT/5FMJN
         euboo+sucXOBkHwe+ErWaHwedu8aMXPwtxta0tCkU1ZMR8rejD1i0KqvsPenH/o7uRUM
         Rd2lCB6HWCq/oKHrXjQQmPHP3DRYkigoyQbGl75uySJXPG+y9aN4lW3M8Y+9ts0dDrtk
         UyWg==
X-Forwarded-Encrypted: i=1; AJvYcCVIN/BytTQhSZceqYnlc9BbVYVngbcEuJD2iRO0a1PMNMQ1fEXvUKOPhc1VZlEH50GK7crDgkaKqKWJR+WVqu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8L76PIUfxxa/Yz7v1hgoDhzTDqMzM7GBzj4VW6SteqRkvmapc
	2t5oDl2Mx2/AEDzSYc5uf+BfemY90OK7ceNyEGVLsiZLyOmaoH7BqGAtwlIxRg==
X-Gm-Gg: ATEYQzysootuSCbNrx7zv2KBrIc336NFOkMWpxco21S0jQUrdOGAMPVO43hHe1M2rfn
	J52Um1yPuw+2D5mXIZzmu2UDzo8suDZe/JncTZKnZ96y2G9uJogDwNSuvt2ESu8CO2LCyX/zB66
	ZIo+EqcH35Z7RZZ0UD2BsofP7gH8N8Gr14KSlwASzrGWtN8BZaVbyl71lm80IdUxetdi+PjExDL
	0rxI9HI5isDZpLrmA4S9BOKW5GP85gpAke1G3yATxF8Z7rXqNPzy+5S/YcMzXA4dasqzFegOLRu
	WKo1eoWXr2EowD08hqx0gG3ihpqWSAs+XMYkeO+wpsfU70pOZWaZlgHP+nbsPSDxAhT7tB5E07I
	212YAJUUQ+y9K9OkyKs0UPs4qYkPWT1itT6wzmYnjY1uTPYv8zqsfdqWOZxdTXe0bGCag8zI2Uh
	EXhxlPMoGhCnbQpiyVOmBlhU5gH7f0
X-Received: by 2002:a17:903:41ca:b0:2ae:5848:bada with SMTP id d9443c01a7336-2ae82418e5bmr127912605ad.10.1773088936150;
        Mon, 09 Mar 2026 13:42:16 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:1c::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2d97sm133318085ad.84.2026.03.09.13.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:42:15 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nimrod Oren <noren@nvidia.com>,
	Gal Pressman <gal@nvidia.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: rss: Add retries to test_rss_key_indir to reduce flakes
Date: Mon,  9 Mar 2026 13:42:15 -0700
Message-ID: <20260309204215.2110486-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test generates 16 flows, and verifies that traffic is distributed
across two queues via the NICs RSS indirection table. The likelihood of the
flows skewing to a single queue is high, so we retry sending traffic up to
3 times.

Alternatively, we could increase the number of generated flows. But
debug kernels may struggle to ramp this many flows.

During manual testing, the test passed for 10,000 consecutive runs.

Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../selftests/drivers/net/hw/rss_ctx.py       | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index d7cb30306368..51f4e7bc3e5d 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -166,9 +166,17 @@ def test_rss_key_indir(cfg):
     ksft_eq(1, max(data['rss-indirection-table']))
 
     # Check we only get traffic on the first 2 queues
-    cnts = _get_rx_cnts(cfg)
-    GenerateTraffic(cfg).wait_pkts_and_stop(20000)
-    cnts = _get_rx_cnts(cfg, prev=cnts)
+
+    # Retry a few times in case the flows skew to a single queue.
+    attempts = 3
+    for attempt in range(attempts):
+        cnts = _get_rx_cnts(cfg)
+        GenerateTraffic(cfg).wait_pkts_and_stop(20000)
+        cnts = _get_rx_cnts(cfg, prev=cnts)
+        if cnts[0] >= 5000 and cnts[1] >= 5000:
+            break
+        ksft_pr(f"Skewed queue distribution, attempt {attempt + 1}/{attempts}: " + str(cnts))
+
     # 2 queues, 20k packets, must be at least 5k per queue
     ksft_ge(cnts[0], 5000, "traffic on main context (1/2): " + str(cnts))
     ksft_ge(cnts[1], 5000, "traffic on main context (2/2): " + str(cnts))
@@ -178,9 +186,18 @@ def test_rss_key_indir(cfg):
     # Restore, and check traffic gets spread again
     reset_indir.exec()
 
-    cnts = _get_rx_cnts(cfg)
-    GenerateTraffic(cfg).wait_pkts_and_stop(20000)
-    cnts = _get_rx_cnts(cfg, prev=cnts)
+    for attempt in range(attempts):
+        cnts = _get_rx_cnts(cfg)
+        GenerateTraffic(cfg).wait_pkts_and_stop(20000)
+        cnts = _get_rx_cnts(cfg, prev=cnts)
+        if qcnt > 4:
+            if sum(cnts[:2]) < sum(cnts[2:]):
+                break
+        else:
+            if cnts[2] >= 3500:
+                break
+        ksft_pr(f"Skewed queue distribution, attempt {attempt + 1}/{attempts}: " + str(cnts))
+
     if qcnt > 4:
         # First two queues get less traffic than all the rest
         ksft_lt(sum(cnts[:2]), sum(cnts[2:]),
-- 
2.52.0

