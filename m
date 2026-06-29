Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5921315D53;
	Mon, 29 Jun 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776642; cv=none; b=uC31KNvg1Yt7LdQDscI1nOhkHuDeopvC7ErBb9Qo6lhVX3zruyB9bTji1InmXn5XnN4Kcu6Fwy/woTAAXQs6yZIx0G3Jr4/XlTi7v21Nqq8CYuOZnI8l0ptkw3KmqkjmoWpdsRJ0ycDR3io5ZdoSQQpUrCkAVdWcNmwEINbZXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776642; c=relaxed/simple;
	bh=GuvpCbu50DBNfx8I8chhCLKBnTpo0Ix0KPThigpcnZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpD554Cu+soK7qCRTuK0dBFsrHSCQgh/7Q+7RNxMJkjMI1bhtdqvbO63iQ972TTtI5m8AcK4TLN/iJN5Mi72v593bzk7Pxhq1KQxbpsdfCns5c2Dik1MWEBwEt0lteL0a0aOcG2goOKqQEVqYV/BJrXeTN0mupzYMczBE6AYVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljZD2O29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljZD2O29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0701F000E9;
	Mon, 29 Jun 2026 23:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782776641;
	bh=cCu28Oqp3v+nkAEEj0O7HDK4BbeHiWvXWR/C++HBTO8=;
	h=From:To:Cc:Subject:Date;
	b=ljZD2O29pLci+XtGOGvPK0tgdYPShCqJDiDbo7f5LQxgZBIBuUMYpjSHZZ/0RFX5B
	 uyOcSM8vsA57rAR6XvkR8u7eTPqyq80eV0EdM9GbHEThbSYdn3JOQEuC3Qhkd4d1gw
	 z/iJo1ylbTvdiXpZbAQ8H6lGTVUe8yxf82kNwCgIKVS7BJEJk0vralWLS9AsKUiAyd
	 JJjFoa6BSTWRMHwrwH3IWPTS21cJtyx05LF4CotbD9Q11KmHwJflWwxAXWRwNS/SdS
	 DjkkSUVMoQBRUyhWVGOXvC7fZr9Ru465YCobSUaa18U4p9NYyq5bjPGPAxm8nu6JSV
	 PTKlrrnmefXVA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	willemb@google.com,
	noren@nvidia.com,
	gal@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: toeplitz: cap the Rx queue count
Date: Mon, 29 Jun 2026 16:43:53 -0700
Message-ID: <20260629234354.2154541-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPS test needs a free CPU within the first RPS_MAX_CPUS (16)
cores. This is easily violated if the NIC or env allocates the
IRQs to cores linearly.

Cap the Rx queues at 8, we don't need more. This makes the test
pass on CX7 in NIPA.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: willemb@google.com
CC: noren@nvidia.com
CC: gal@nvidia.com
CC: linux-kselftest@vger.kernel.org
---
 .../selftests/drivers/net/hw/toeplitz.py      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/toeplitz.py b/tools/testing/selftests/drivers/net/hw/toeplitz.py
index cd7e080e6f84..571732198b93 100755
--- a/tools/testing/selftests/drivers/net/hw/toeplitz.py
+++ b/tools/testing/selftests/drivers/net/hw/toeplitz.py
@@ -21,6 +21,8 @@ from lib.py import ksft_variants, KsftNamedVariant, KsftSkipEx, KsftFailEx
 ETH_RSS_HASH_TOP = 1
 # Must match RPS_MAX_CPUS in toeplitz.c
 RPS_MAX_CPUS = 16
+# Cap Rx queues so IRQ pinning leaves free CPUs in the RPS_MAX_CPUS range
+QUEUE_CAP = 8
 
 
 def _check_rps_and_rfs_not_configured(cfg):
@@ -48,6 +50,25 @@ RPS_MAX_CPUS = 16
         return int(data)
 
 
+def _cap_queue_count(cfg):
+    ehdr = {"header": {"dev-index": cfg.ifindex}}
+    chans = cfg.ethnl.channels_get(ehdr)
+
+    config = {}
+    restore = {}
+    for key in ("combined-count", "rx-count"):
+        cur = chans.get(key, 0)
+        if cur > QUEUE_CAP:
+            config[key] = QUEUE_CAP
+            restore[key] = cur
+
+    if not config:
+        return
+
+    cfg.ethnl.channels_set(ehdr | config)
+    defer(cfg.ethnl.channels_set, ehdr | restore)
+
+
 def _get_irq_cpus(cfg):
     """
     Read the list of IRQs for the device Rx queues.
@@ -177,6 +198,7 @@ RPS_MAX_CPUS = 16
     ]
 
     if grp:
+        _cap_queue_count(cfg)
         _check_rps_and_rfs_not_configured(cfg)
     if grp == "rss":
         irq_cpus = ",".join([str(x) for x in _get_irq_cpus(cfg)])
-- 
2.54.0

