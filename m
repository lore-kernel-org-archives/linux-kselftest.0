Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685D30C37A
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010993; cv=none; b=tdGCEucBveoGc6i79jIEGElYSzkTMhtn+FS1XrdqZQIdIHLjyYeFokym+fuJGW3PVjfz8T79wXL8y73NiqXFsaZHw58sMemGaF8e6W4Pxu9zYuAWgEySRpvSQdxsHKcDAwDxqYYiFA/PJq2SeGdm7/dWNJOOe8HzFlEx6ynAaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010993; c=relaxed/simple;
	bh=sPgWrTCY+vkZ4Gu64MngNcsm8uvJ0Nl9FCs6LietbxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LG0ZmVOx190/5WZ37dtcqbmZkMluoc0+xuSwzqNzV5pt7kReHfRgXSJAStco3DQhZC9iU3Aqa/HAXcAx2z8coDpTSDcoHgCCziZhl7YisJ/zPy6oMYV7SjwXUF/CPKNRrMOeJOLW3CDqUoOH7SwvSs97C75qcolmMOVjHGp1R8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=le4km5A/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="le4km5A/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37fc01881f2so2310485a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010992; x=1783615792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UL82nmL+ZYrOnxFf3+CmZbPnfwIy2jc8o3jqsy8jewg=;
        b=le4km5A/8/51mcYXEVTq/Ouz6bMupBaJnrZCTiDx89qgevg9edtFPB5x7EoKquyQaF
         PXBmo5FxLqNLjkVI2cKGs8HYScDHB9iZFSppA8GYUFEh2ao2QXp9uWKz0sZOaBJ8VlUA
         vLrmPg/nb2+GAsQN9RCL63SQRkYNmXbB73LxPZe9DLg1f3slQWPP4lv2AJyNheeaERhX
         he07ftx+lDb2g5l13eVgVpAVXd9d+EXX9+iJ2c9t+uvgw8JRmRyLVLvzqTO7a2PxCmzM
         MCUsco0iQhlrnYa53pwBVbVvf3g7TzSEuYM1ZwnPJk6f6QDi0Lnxbzq5n6v8tqo43XJO
         xvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010992; x=1783615792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UL82nmL+ZYrOnxFf3+CmZbPnfwIy2jc8o3jqsy8jewg=;
        b=oyqc26RGCxPc9U4pNTdQnnBjNCzs49TcuOxbLfUzbFv9PzzgVJBoQ/BB06PfvlXK7C
         CA08O/XxSVsiR7Im5W1Wsbxw0QcOUSNfBn2WnNXf5ET9jg4vvzEdE1Uz6DxaYQTx2CJz
         dQvFaupXvmbdRHUHZB+xkPkhBPVMk/oglpQzeew/Ay93FFW/qbSVerh59NA334T+hPRE
         PMhxsEd7/2L60a7sQY6c9IPXB+//GQv9VYjUruLVAkd8rbcrX12N9QoFDldx7rO2F5VR
         n74UsjU7HhDKoJffXkIkYkKWj0qPGVijiBrywxWFrNfq+aSQe3Xvwd4+IJcGyGD/O7cY
         b3gQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqRnk/uq0IJCdSkmXBYDY7RC6cxPy2yiPtz+53jOE4h68c5LHHSDPcSGwWybF+vtcDU+w5UUcHMoU/6UmZjl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDN6ptUHKMNpl4+JdPvISiH74Y+xC/UkfwsfEPxidJQxxj+4FF
	ulLt26U8KNukQvRcxeh/a85VI0KbAl2UBD0m6Oo8CTfRBZ0mrkAEZpJj
X-Gm-Gg: AfdE7ckpp4R0hGG7w4Zr+JIRgElb7MZEVmuD+MF0Su0iCYMIdaCIr//uDa4XA12Vold
	Cs/0SaWLkEUM/dxiaMPW2UEaD7jPGUp3yRb1yt7S9bFXSiJc1pkY4XTPuAM3H7iGv3yb/I0EpxZ
	Wjc7MjICYblE734jil8YwoesaHCDsuczVXgCMrtuIrJTlG4Z/2djzZDGMthv3+d1znD7r15BmAd
	YnLceBsNyVlWFNGUWieQHaKnMIlft+7J10XuGLpXZczPjnHwM9OR+jTHR5gd01agBX+mlLTWKRA
	1U98dwcdrLHqqIm2U5DN4JYgn3OdKzmWpCATLx9tOwMB3ivCUXY6HDGXl4IYMphtpQ2QdvlYUBt
	xvcixG9vdE61jk/AvXNqpUmY2TCpdn4gvlvsmg92FdK7RpTrbMQGMu7BHgTegPwhBRKhSTmfa3G
	6Gmk1xOzHfIkeeIos0
X-Received: by 2002:a17:90b:3f8c:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3810854e536mr1296176a91.20.1783010991890;
        Thu, 02 Jul 2026 09:49:51 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::369e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16318471eec.15.2026.07.02.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:49:51 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: zinclim@meta.com,
	Zinc Lim <limzhineng2@gmail.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: rss_ctx: Add retries to test_rss_context_overlap to reduce flakes
Date: Thu,  2 Jul 2026 09:49:31 -0700
Message-ID: <20260702164932.2832916-1-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to commit 690043b95c18 ("selftests: drv-net: rss: Add
retries to test_rss_key_indir to reduce flakes"), implement the
retry mechanism for test_rss_context_overlap. This gives the test
more attempts to distribute the flow evenly, as the chance of
flow skewing to one queue is high.

Example failures:

 # Check failed 5288 < 7000 traffic on main context (1/2): [2727, 2561, 8961, 6648]
not ok 1 rss_ctx.test_rss_context_overlap

 # Check failed 6710 < 7000 traffic on main context (2/2): [9280, 5217, 5358, 1352]
not ok 1 rss_ctx.test_rss_context_overlap

Ran test_rss_context_overlap and test_rss_context_overlap2
over 1,000 consecutive runs with no failures.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 tools/testing/selftests/drivers/net/hw/rss_ctx.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index f36f76d6ca59..5b25fa89c629 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -651,9 +651,14 @@ def test_rss_context_overlap(cfg, other_ctx=0):
         ntuple = defer(ethtool, f"-N {cfg.ifname} delete {ntuple_id}")
 
     # Test the main context
-    cnts = _get_rx_cnts(cfg)
-    GenerateTraffic(cfg, port=port).wait_pkts_and_stop(20000)
-    cnts = _get_rx_cnts(cfg, prev=cnts)
+    attempts = 3
+    for attempt in range(attempts):
+        cnts = _get_rx_cnts(cfg)
+        GenerateTraffic(cfg, port=port).wait_pkts_and_stop(20000)
+        cnts = _get_rx_cnts(cfg, prev=cnts)
+        if sum(cnts[:2]) >= 7000 and sum(cnts[2:4]) >= 7000:
+            break
+        ksft_pr(f"Skewed queue distribution, attempt {attempt + 1}/{attempts}: " + str(cnts))
 
     ksft_ge(sum(cnts[ :4]), 20000, "traffic on main context: " + str(cnts))
     ksft_ge(sum(cnts[ :2]),  7000, "traffic on main context (1/2): " + str(cnts))
-- 
2.53.0-Meta

